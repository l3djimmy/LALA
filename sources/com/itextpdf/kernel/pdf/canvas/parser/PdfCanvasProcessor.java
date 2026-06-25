package com.itextpdf.kernel.pdf.canvas.parser;

import androidx.exifinterface.media.ExifInterface;
import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.source.PdfTokenizer;
import com.itextpdf.io.source.RandomAccessFileOrArray;
import com.itextpdf.io.source.RandomAccessSourceFactory;
import com.itextpdf.kernel.colors.CalGray;
import com.itextpdf.kernel.colors.CalRgb;
import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.colors.DeviceCmyk;
import com.itextpdf.kernel.colors.DeviceGray;
import com.itextpdf.kernel.colors.DeviceN;
import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.kernel.colors.IccBased;
import com.itextpdf.kernel.colors.Indexed;
import com.itextpdf.kernel.colors.Lab;
import com.itextpdf.kernel.colors.PatternColor;
import com.itextpdf.kernel.colors.Separation;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.Matrix;
import com.itextpdf.kernel.geom.NoninvertibleTransformException;
import com.itextpdf.kernel.geom.Path;
import com.itextpdf.kernel.logs.KernelLogMessageConstant;
import com.itextpdf.kernel.pdf.MemoryLimitsAwareHandler;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfIndirectReference;
import com.itextpdf.kernel.pdf.PdfLiteral;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfResources;
import com.itextpdf.kernel.pdf.PdfStream;
import com.itextpdf.kernel.pdf.PdfString;
import com.itextpdf.kernel.pdf.canvas.CanvasTag;
import com.itextpdf.kernel.pdf.canvas.parser.data.AbstractRenderInfo;
import com.itextpdf.kernel.pdf.canvas.parser.data.ClippingPathInfo;
import com.itextpdf.kernel.pdf.canvas.parser.data.IEventData;
import com.itextpdf.kernel.pdf.canvas.parser.data.ImageRenderInfo;
import com.itextpdf.kernel.pdf.canvas.parser.data.PathRenderInfo;
import com.itextpdf.kernel.pdf.canvas.parser.data.TextRenderInfo;
import com.itextpdf.kernel.pdf.canvas.parser.listener.IEventListener;
import com.itextpdf.kernel.pdf.canvas.parser.util.PdfCanvasParser;
import com.itextpdf.kernel.pdf.colorspace.PdfCieBasedCs;
import com.itextpdf.kernel.pdf.colorspace.PdfColorSpace;
import com.itextpdf.kernel.pdf.colorspace.PdfPattern;
import com.itextpdf.kernel.pdf.colorspace.PdfSpecialCs;
import com.itextpdf.kernel.pdf.extgstate.PdfExtGState;
import com.itextpdf.kernel.pdf.tagging.StandardRoles;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Stack;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class PdfCanvasProcessor {
    public static final String DEFAULT_OPERATOR = "DefaultOperator";
    private Map<Integer, WeakReference<PdfFont>> cachedFonts;
    protected int clippingRule;
    protected Path currentPath;
    protected final IEventListener eventListener;
    private final Stack<ParserGraphicsState> gsStack;
    protected boolean isClip;
    private Stack<CanvasTag> markedContentStack;
    private MemoryLimitsAwareHandler memoryLimitsHandler;
    private Map<String, IContentOperator> operators;
    private long pageSize;
    private List<PdfResources> resourcesStack;
    protected final Set<EventType> supportedEvents;
    private Matrix textLineMatrix;
    private Matrix textMatrix;
    private Map<PdfName, IXObjectDoHandler> xobjectDoHandlers;

    public PdfCanvasProcessor(IEventListener eventListener) {
        this.currentPath = new Path();
        this.gsStack = new Stack<>();
        this.cachedFonts = new HashMap();
        this.markedContentStack = new Stack<>();
        this.memoryLimitsHandler = null;
        this.pageSize = 0L;
        this.eventListener = eventListener;
        this.supportedEvents = eventListener.getSupportedEvents();
        this.operators = new HashMap();
        populateOperators();
        this.xobjectDoHandlers = new HashMap();
        populateXObjectDoHandlers();
        reset();
    }

    public PdfCanvasProcessor(IEventListener eventListener, Map<String, IContentOperator> additionalContentOperators) {
        this(eventListener);
        for (Map.Entry<String, IContentOperator> entry : additionalContentOperators.entrySet()) {
            registerContentOperator(entry.getKey(), entry.getValue());
        }
    }

    public IXObjectDoHandler registerXObjectDoHandler(PdfName xobjectSubType, IXObjectDoHandler handler) {
        return this.xobjectDoHandlers.put(xobjectSubType, handler);
    }

    public IContentOperator registerContentOperator(String operatorString, IContentOperator operator) {
        return this.operators.put(operatorString, operator);
    }

    public Collection<String> getRegisteredOperatorStrings() {
        return new ArrayList(this.operators.keySet());
    }

    public void reset() {
        this.memoryLimitsHandler = null;
        this.pageSize = 0L;
        this.gsStack.removeAllElements();
        this.gsStack.push(new ParserGraphicsState());
        this.textMatrix = null;
        this.textLineMatrix = null;
        this.resourcesStack = new ArrayList();
        this.isClip = false;
        this.currentPath = new Path();
    }

    public ParserGraphicsState getGraphicsState() {
        return this.gsStack.peek();
    }

    public void processContent(byte[] contentBytes, PdfResources resources) {
        if (resources == null) {
            throw new PdfException(KernelExceptionMessageConstant.RESOURCES_CANNOT_BE_NULL);
        }
        if (this.memoryLimitsHandler != null) {
            this.pageSize += contentBytes.length;
            this.memoryLimitsHandler.checkIfPageSizeExceedsTheLimit(this.pageSize);
        }
        this.resourcesStack.add(resources);
        PdfTokenizer tokeniser = new PdfTokenizer(new RandomAccessFileOrArray(new RandomAccessSourceFactory().createSource(contentBytes)));
        PdfCanvasParser ps = new PdfCanvasParser(tokeniser, resources);
        List<PdfObject> operands = new ArrayList<>();
        while (ps.parse(operands).size() > 0) {
            try {
                PdfLiteral operator = (PdfLiteral) operands.get(operands.size() - 1);
                invokeOperator(operator, operands);
            } catch (IOException e) {
                throw new PdfException(KernelExceptionMessageConstant.CANNOT_PARSE_CONTENT_STREAM, (Throwable) e);
            }
        }
        this.resourcesStack.remove(this.resourcesStack.size() - 1);
    }

    public void processPageContent(PdfPage page) {
        this.memoryLimitsHandler = page.getDocument().getMemoryLimitsAwareHandler();
        initClippingPath(page);
        ParserGraphicsState gs = getGraphicsState();
        eventOccurred(new ClippingPathInfo(gs, gs.getClippingPath(), gs.getCtm()), EventType.CLIP_PATH_CHANGED);
        processContent(page.getContentBytes(), page.getResources());
    }

    public IEventListener getEventListener() {
        return this.eventListener;
    }

    protected void populateOperators() {
        registerContentOperator(DEFAULT_OPERATOR, new IgnoreOperator());
        registerContentOperator("q", new PushGraphicsStateOperator());
        registerContentOperator("Q", new PopGraphicsStateOperator());
        registerContentOperator("cm", new ModifyCurrentTransformationMatrixOperator());
        registerContentOperator("Do", new DoOperator());
        registerContentOperator("BMC", new BeginMarkedContentOperator());
        registerContentOperator("BDC", new BeginMarkedContentDictionaryOperator());
        registerContentOperator("EMC", new EndMarkedContentOperator());
        if (this.supportedEvents == null || this.supportedEvents.contains(EventType.RENDER_TEXT) || this.supportedEvents.contains(EventType.RENDER_PATH) || this.supportedEvents.contains(EventType.CLIP_PATH_CHANGED)) {
            registerContentOperator("g", new SetGrayFillOperator());
            registerContentOperator("G", new SetGrayStrokeOperator());
            registerContentOperator("rg", new SetRGBFillOperator());
            registerContentOperator("RG", new SetRGBStrokeOperator());
            registerContentOperator("k", new SetCMYKFillOperator());
            registerContentOperator("K", new SetCMYKStrokeOperator());
            registerContentOperator("cs", new SetColorSpaceFillOperator());
            registerContentOperator("CS", new SetColorSpaceStrokeOperator());
            registerContentOperator("sc", new SetColorFillOperator());
            registerContentOperator("SC", new SetColorStrokeOperator());
            registerContentOperator("scn", new SetColorFillOperator());
            registerContentOperator("SCN", new SetColorStrokeOperator());
            registerContentOperator("gs", new ProcessGraphicsStateResourceOperator());
        }
        if (this.supportedEvents == null || this.supportedEvents.contains(EventType.RENDER_IMAGE)) {
            registerContentOperator("EI", new EndImageOperator());
        }
        if (this.supportedEvents == null || this.supportedEvents.contains(EventType.RENDER_TEXT) || this.supportedEvents.contains(EventType.BEGIN_TEXT) || this.supportedEvents.contains(EventType.END_TEXT)) {
            registerContentOperator("BT", new BeginTextOperator());
            registerContentOperator("ET", new EndTextOperator());
        }
        if (this.supportedEvents == null || this.supportedEvents.contains(EventType.RENDER_TEXT)) {
            SetTextCharacterSpacingOperator tcOperator = new SetTextCharacterSpacingOperator();
            registerContentOperator("Tc", tcOperator);
            SetTextWordSpacingOperator twOperator = new SetTextWordSpacingOperator();
            registerContentOperator("Tw", twOperator);
            registerContentOperator("Tz", new SetTextHorizontalScalingOperator());
            SetTextLeadingOperator tlOperator = new SetTextLeadingOperator();
            registerContentOperator("TL", tlOperator);
            registerContentOperator("Tf", new SetTextFontOperator());
            registerContentOperator("Tr", new SetTextRenderModeOperator());
            registerContentOperator("Ts", new SetTextRiseOperator());
            TextMoveStartNextLineOperator tdOperator = new TextMoveStartNextLineOperator();
            registerContentOperator("Td", tdOperator);
            registerContentOperator(StandardRoles.TD, new TextMoveStartNextLineWithLeadingOperator(tdOperator, tlOperator));
            registerContentOperator("Tm", new TextSetTextMatrixOperator());
            TextMoveNextLineOperator tstarOperator = new TextMoveNextLineOperator(tdOperator);
            registerContentOperator("T*", tstarOperator);
            ShowTextOperator tjOperator = new ShowTextOperator();
            registerContentOperator("Tj", tjOperator);
            MoveNextLineAndShowTextOperator tickOperator = new MoveNextLineAndShowTextOperator(tstarOperator, tjOperator);
            registerContentOperator("'", tickOperator);
            registerContentOperator("\"", new MoveNextLineAndShowTextWithSpacingOperator(twOperator, tcOperator, tickOperator));
            registerContentOperator("TJ", new ShowTextArrayOperator());
        }
        if (this.supportedEvents == null || this.supportedEvents.contains(EventType.CLIP_PATH_CHANGED) || this.supportedEvents.contains(EventType.RENDER_PATH)) {
            registerContentOperator("w", new SetLineWidthOperator());
            registerContentOperator("J", new SetLineCapOperator());
            registerContentOperator("j", new SetLineJoinOperator());
            registerContentOperator("M", new SetMiterLimitOperator());
            registerContentOperator("d", new SetLineDashPatternOperator());
            registerContentOperator("m", new MoveToOperator());
            registerContentOperator("l", new LineToOperator());
            registerContentOperator("c", new CurveOperator());
            registerContentOperator("v", new CurveFirstPointDuplicatedOperator());
            registerContentOperator("y", new CurveFourhPointDuplicatedOperator());
            registerContentOperator("h", new CloseSubpathOperator());
            registerContentOperator("re", new RectangleOperator());
            registerContentOperator(ExifInterface.LATITUDE_SOUTH, new PaintPathOperator(1, -1, false));
            registerContentOperator("s", new PaintPathOperator(1, -1, true));
            registerContentOperator("f", new PaintPathOperator(2, 1, false));
            registerContentOperator("F", new PaintPathOperator(2, 1, false));
            registerContentOperator("f*", new PaintPathOperator(2, 2, false));
            registerContentOperator("B", new PaintPathOperator(3, 1, false));
            registerContentOperator("B*", new PaintPathOperator(3, 2, false));
            registerContentOperator("b", new PaintPathOperator(3, 1, true));
            registerContentOperator("b*", new PaintPathOperator(3, 2, true));
            registerContentOperator("n", new PaintPathOperator(0, -1, false));
            registerContentOperator(ExifInterface.LONGITUDE_WEST, new ClipPathOperator(1));
            registerContentOperator("W*", new ClipPathOperator(2));
        }
    }

    protected void paintPath(int operation, int rule) {
        ParserGraphicsState gs = getGraphicsState();
        PathRenderInfo renderInfo = new PathRenderInfo(this.markedContentStack, gs, this.currentPath, operation, rule, this.isClip, this.clippingRule);
        eventOccurred(renderInfo, EventType.RENDER_PATH);
        if (this.isClip) {
            this.isClip = false;
            gs.clip(this.currentPath, this.clippingRule);
            eventOccurred(new ClippingPathInfo(gs, gs.getClippingPath(), gs.getCtm()), EventType.CLIP_PATH_CHANGED);
        }
        this.currentPath = new Path();
    }

    protected void invokeOperator(PdfLiteral operator, List<PdfObject> operands) {
        IContentOperator op = this.operators.get(operator.toString());
        if (op == null) {
            op = this.operators.get(DEFAULT_OPERATOR);
        }
        op.invoke(this, operator, operands);
    }

    protected PdfStream getXObjectStream(PdfName xobjectName) {
        PdfDictionary xobjects = getResources().getResource(PdfName.XObject);
        return xobjects.getAsStream(xobjectName);
    }

    protected PdfResources getResources() {
        return this.resourcesStack.get(this.resourcesStack.size() - 1);
    }

    protected void populateXObjectDoHandlers() {
        registerXObjectDoHandler(PdfName.Default, new IgnoreXObjectDoHandler());
        registerXObjectDoHandler(PdfName.Form, new FormXObjectDoHandler());
        if (this.supportedEvents == null || this.supportedEvents.contains(EventType.RENDER_IMAGE)) {
            registerXObjectDoHandler(PdfName.Image, new ImageXObjectDoHandler());
        }
    }

    protected PdfFont getFont(PdfDictionary fontDict) {
        if (fontDict.getIndirectReference() == null) {
            return PdfFontFactory.createFont(fontDict);
        }
        int n = fontDict.getIndirectReference().getObjNumber();
        WeakReference<PdfFont> fontRef = this.cachedFonts.get(Integer.valueOf(n));
        PdfFont font = fontRef == null ? null : fontRef.get();
        if (font == null) {
            PdfFont font2 = PdfFontFactory.createFont(fontDict);
            this.cachedFonts.put(Integer.valueOf(n), new WeakReference<>(font2));
            return font2;
        }
        return font;
    }

    protected void beginMarkedContent(PdfName tag, PdfDictionary dict) {
        this.markedContentStack.push(new CanvasTag(tag).setProperties(dict));
    }

    protected void endMarkedContent() {
        this.markedContentStack.pop();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void beginText() {
        eventOccurred(null, EventType.BEGIN_TEXT);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void endText() {
        eventOccurred(null, EventType.END_TEXT);
    }

    protected void eventOccurred(IEventData data, EventType type) {
        if (this.supportedEvents == null || this.supportedEvents.contains(type)) {
            this.eventListener.eventOccurred(data, type);
        }
        if (data instanceof AbstractRenderInfo) {
            ((AbstractRenderInfo) data).releaseGraphicsState();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void displayPdfString(PdfString string) {
        TextRenderInfo renderInfo = new TextRenderInfo(string, getGraphicsState(), this.textMatrix, this.markedContentStack);
        this.textMatrix = new Matrix(renderInfo.getUnscaledWidth(), 0.0f).multiply(this.textMatrix);
        eventOccurred(renderInfo, EventType.RENDER_TEXT);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void displayXObject(PdfName resourceName) {
        PdfStream xobjectStream = getXObjectStream(resourceName);
        PdfName subType = xobjectStream.getAsName(PdfName.Subtype);
        IXObjectDoHandler handler = this.xobjectDoHandlers.get(subType);
        if (handler == null) {
            handler = this.xobjectDoHandlers.get(PdfName.Default);
        }
        handler.handleXObject(this, this.markedContentStack, xobjectStream, resourceName);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void displayImage(Stack<CanvasTag> canvasTagHierarchy, PdfStream imageStream, PdfName resourceName, boolean isInline) {
        PdfDictionary colorSpaceDic = getResources().getResource(PdfName.ColorSpace);
        ImageRenderInfo renderInfo = new ImageRenderInfo(canvasTagHierarchy, getGraphicsState(), getGraphicsState().getCtm(), imageStream, resourceName, colorSpaceDic, isInline);
        eventOccurred(renderInfo, EventType.RENDER_IMAGE);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void applyTextAdjust(float tj) {
        float adjustBy = FontProgram.convertTextSpaceToGlyphSpace(-tj) * getGraphicsState().getFontSize() * (getGraphicsState().getHorizontalScaling() / 100.0f);
        this.textMatrix = new Matrix(adjustBy, 0.0f).multiply(this.textMatrix);
    }

    private void initClippingPath(PdfPage page) {
        Path clippingPath = new Path();
        clippingPath.rectangle(page.getCropBox());
        getGraphicsState().setClippingPath(clippingPath);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class IgnoreOperator implements IContentOperator {
        private IgnoreOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class ShowTextArrayOperator implements IContentOperator {
        private ShowTextArrayOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            PdfArray array = (PdfArray) operands.get(0);
            Iterator<PdfObject> it = array.iterator();
            while (it.hasNext()) {
                PdfObject entryObj = it.next();
                if (entryObj instanceof PdfString) {
                    processor.displayPdfString((PdfString) entryObj);
                } else {
                    float tj = ((PdfNumber) entryObj).floatValue();
                    processor.applyTextAdjust(tj);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class MoveNextLineAndShowTextWithSpacingOperator implements IContentOperator {
        private final MoveNextLineAndShowTextOperator moveNextLineAndShowText;
        private final SetTextCharacterSpacingOperator setTextCharacterSpacing;
        private final SetTextWordSpacingOperator setTextWordSpacing;

        public MoveNextLineAndShowTextWithSpacingOperator(SetTextWordSpacingOperator setTextWordSpacing, SetTextCharacterSpacingOperator setTextCharacterSpacing, MoveNextLineAndShowTextOperator moveNextLineAndShowText) {
            this.setTextWordSpacing = setTextWordSpacing;
            this.setTextCharacterSpacing = setTextCharacterSpacing;
            this.moveNextLineAndShowText = moveNextLineAndShowText;
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            PdfObject aw = (PdfNumber) operands.get(0);
            PdfObject ac = (PdfNumber) operands.get(1);
            PdfObject string = (PdfString) operands.get(2);
            List<PdfObject> twOperands = new ArrayList<>(1);
            twOperands.add(0, aw);
            this.setTextWordSpacing.invoke(processor, null, twOperands);
            List<PdfObject> tcOperands = new ArrayList<>(1);
            tcOperands.add(0, ac);
            this.setTextCharacterSpacing.invoke(processor, null, tcOperands);
            List<PdfObject> tickOperands = new ArrayList<>(1);
            tickOperands.add(0, string);
            this.moveNextLineAndShowText.invoke(processor, null, tickOperands);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class MoveNextLineAndShowTextOperator implements IContentOperator {
        private final ShowTextOperator showText;
        private final TextMoveNextLineOperator textMoveNextLine;

        public MoveNextLineAndShowTextOperator(TextMoveNextLineOperator textMoveNextLine, ShowTextOperator showText) {
            this.textMoveNextLine = textMoveNextLine;
            this.showText = showText;
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            this.textMoveNextLine.invoke(processor, null, new ArrayList(0));
            this.showText.invoke(processor, null, operands);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class ShowTextOperator implements IContentOperator {
        private ShowTextOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            PdfString string = (PdfString) operands.get(0);
            processor.displayPdfString(string);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class TextMoveNextLineOperator implements IContentOperator {
        private final TextMoveStartNextLineOperator moveStartNextLine;

        public TextMoveNextLineOperator(TextMoveStartNextLineOperator moveStartNextLine) {
            this.moveStartNextLine = moveStartNextLine;
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            List<PdfObject> tdoperands = new ArrayList<>(2);
            tdoperands.add(0, new PdfNumber(0));
            tdoperands.add(1, new PdfNumber(-processor.getGraphicsState().getLeading()));
            this.moveStartNextLine.invoke(processor, null, tdoperands);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class TextSetTextMatrixOperator implements IContentOperator {
        private TextSetTextMatrixOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            float a = ((PdfNumber) operands.get(0)).floatValue();
            float b = ((PdfNumber) operands.get(1)).floatValue();
            float c = ((PdfNumber) operands.get(2)).floatValue();
            float d = ((PdfNumber) operands.get(3)).floatValue();
            float e = ((PdfNumber) operands.get(4)).floatValue();
            float f = ((PdfNumber) operands.get(5)).floatValue();
            processor.textLineMatrix = new Matrix(a, b, c, d, e, f);
            processor.textMatrix = processor.textLineMatrix;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class TextMoveStartNextLineWithLeadingOperator implements IContentOperator {
        private final TextMoveStartNextLineOperator moveStartNextLine;
        private final SetTextLeadingOperator setTextLeading;

        public TextMoveStartNextLineWithLeadingOperator(TextMoveStartNextLineOperator moveStartNextLine, SetTextLeadingOperator setTextLeading) {
            this.moveStartNextLine = moveStartNextLine;
            this.setTextLeading = setTextLeading;
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            float ty = ((PdfNumber) operands.get(1)).floatValue();
            List<PdfObject> tlOperands = new ArrayList<>(1);
            tlOperands.add(0, new PdfNumber(-ty));
            this.setTextLeading.invoke(processor, null, tlOperands);
            this.moveStartNextLine.invoke(processor, null, operands);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class TextMoveStartNextLineOperator implements IContentOperator {
        private TextMoveStartNextLineOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            float tx = ((PdfNumber) operands.get(0)).floatValue();
            float ty = ((PdfNumber) operands.get(1)).floatValue();
            Matrix translationMatrix = new Matrix(tx, ty);
            processor.textMatrix = translationMatrix.multiply(processor.textLineMatrix);
            processor.textLineMatrix = processor.textMatrix;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetTextFontOperator implements IContentOperator {
        private SetTextFontOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            PdfName fontResourceName = (PdfName) operands.get(0);
            float size = ((PdfNumber) operands.get(1)).floatValue();
            PdfDictionary fontsDictionary = processor.getResources().getResource(PdfName.Font);
            PdfDictionary fontDict = fontsDictionary.getAsDictionary(fontResourceName);
            PdfFont font = processor.getFont(fontDict);
            processor.getGraphicsState().setFont(font);
            processor.getGraphicsState().setFontSize(size);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetTextRenderModeOperator implements IContentOperator {
        private SetTextRenderModeOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            PdfNumber render = (PdfNumber) operands.get(0);
            processor.getGraphicsState().setTextRenderingMode(render.intValue());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetTextRiseOperator implements IContentOperator {
        private SetTextRiseOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            PdfNumber rise = (PdfNumber) operands.get(0);
            processor.getGraphicsState().setTextRise(rise.floatValue());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetTextLeadingOperator implements IContentOperator {
        private SetTextLeadingOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            PdfNumber leading = (PdfNumber) operands.get(0);
            processor.getGraphicsState().setLeading(leading.floatValue());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetTextHorizontalScalingOperator implements IContentOperator {
        private SetTextHorizontalScalingOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            PdfNumber scale = (PdfNumber) operands.get(0);
            processor.getGraphicsState().setHorizontalScaling(scale.floatValue());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetTextCharacterSpacingOperator implements IContentOperator {
        private SetTextCharacterSpacingOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            PdfNumber charSpace = (PdfNumber) operands.get(0);
            processor.getGraphicsState().setCharSpacing(charSpace.floatValue());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetTextWordSpacingOperator implements IContentOperator {
        private SetTextWordSpacingOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            PdfNumber wordSpace = (PdfNumber) operands.get(0);
            processor.getGraphicsState().setWordSpacing(wordSpace.floatValue());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class ProcessGraphicsStateResourceOperator implements IContentOperator {
        private ProcessGraphicsStateResourceOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            PdfName dictionaryName = (PdfName) operands.get(0);
            PdfDictionary extGState = processor.getResources().getResource(PdfName.ExtGState);
            if (extGState == null) {
                throw new PdfException(KernelExceptionMessageConstant.RESOURCES_DO_NOT_CONTAIN_EXTGSTATE_ENTRY_UNABLE_TO_PROCESS_THIS_OPERATOR).setMessageParams(operator);
            }
            PdfDictionary gsDic = extGState.getAsDictionary(dictionaryName);
            if (gsDic == null && (gsDic = extGState.getAsStream(dictionaryName)) == null) {
                throw new PdfException(KernelExceptionMessageConstant.UNKNOWN_GRAPHICS_STATE_DICTIONARY).setMessageParams(dictionaryName);
            }
            PdfArray fontParameter = gsDic.getAsArray(PdfName.Font);
            if (fontParameter != null) {
                PdfFont font = processor.getFont(fontParameter.getAsDictionary(0));
                float size = fontParameter.getAsNumber(1).floatValue();
                processor.getGraphicsState().setFont(font);
                processor.getGraphicsState().setFontSize(size);
            }
            PdfExtGState pdfExtGState = new PdfExtGState(gsDic.clone(Collections.singletonList(PdfName.Font)));
            processor.getGraphicsState().updateFromExtGState(pdfExtGState);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class PushGraphicsStateOperator implements IContentOperator {
        private PushGraphicsStateOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            ParserGraphicsState gs = (ParserGraphicsState) processor.gsStack.peek();
            ParserGraphicsState copy = new ParserGraphicsState(gs);
            processor.gsStack.push(copy);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class ModifyCurrentTransformationMatrixOperator implements IContentOperator {
        private ModifyCurrentTransformationMatrixOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            float a = ((PdfNumber) operands.get(0)).floatValue();
            float b = ((PdfNumber) operands.get(1)).floatValue();
            float c = ((PdfNumber) operands.get(2)).floatValue();
            float d = ((PdfNumber) operands.get(3)).floatValue();
            float e = ((PdfNumber) operands.get(4)).floatValue();
            float f = ((PdfNumber) operands.get(5)).floatValue();
            Matrix matrix = new Matrix(a, b, c, d, e, f);
            try {
                processor.getGraphicsState().updateCtm(matrix);
            } catch (PdfException exception) {
                if (!(exception.getCause() instanceof NoninvertibleTransformException)) {
                    throw exception;
                }
                Logger logger = LoggerFactory.getLogger(PdfCanvasProcessor.class);
                logger.error(MessageFormatUtil.format(IoLogMessageConstant.FAILED_TO_PROCESS_A_TRANSFORMATION_MATRIX, new Object[0]));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Color getColor(PdfColorSpace pdfColorSpace, List<PdfObject> operands, PdfResources resources) {
        PdfObject pdfObject;
        PdfPattern pattern;
        if (pdfColorSpace.getPdfObject().isIndirectReference()) {
            pdfObject = ((PdfIndirectReference) pdfColorSpace.getPdfObject()).getRefersTo();
        } else {
            pdfObject = pdfColorSpace.getPdfObject();
        }
        if (pdfObject.isName()) {
            if (PdfName.DeviceGray.equals(pdfObject)) {
                return new DeviceGray(getColorants(operands)[0]);
            }
            if (PdfName.Pattern.equals(pdfObject) && (operands.get(0) instanceof PdfName) && (pattern = resources.getPattern((PdfName) operands.get(0))) != null) {
                return new PatternColor(pattern);
            }
            if (PdfName.DeviceRGB.equals(pdfObject)) {
                float[] c = getColorants(operands);
                return new DeviceRgb(c[0], c[1], c[2]);
            } else if (PdfName.DeviceCMYK.equals(pdfObject)) {
                float[] c2 = getColorants(operands);
                return new DeviceCmyk(c2[0], c2[1], c2[2], c2[3]);
            }
        } else if (pdfObject.isArray()) {
            PdfArray array = (PdfArray) pdfObject;
            PdfName csType = array.getAsName(0);
            if (PdfName.CalGray.equals(csType)) {
                return new CalGray((PdfCieBasedCs.CalGray) pdfColorSpace, getColorants(operands)[0]);
            }
            if (PdfName.CalRGB.equals(csType)) {
                return new CalRgb((PdfCieBasedCs.CalRgb) pdfColorSpace, getColorants(operands));
            }
            if (PdfName.Lab.equals(csType)) {
                return new Lab((PdfCieBasedCs.Lab) pdfColorSpace, getColorants(operands));
            }
            if (PdfName.ICCBased.equals(csType)) {
                return new IccBased((PdfCieBasedCs.IccBased) pdfColorSpace, getColorants(operands));
            }
            if (PdfName.Indexed.equals(csType)) {
                return new Indexed(pdfColorSpace, (int) getColorants(operands)[0]);
            }
            if (PdfName.Separation.equals(csType)) {
                return new Separation((PdfSpecialCs.Separation) pdfColorSpace, getColorants(operands)[0]);
            }
            if (PdfName.DeviceN.equals(csType)) {
                return new DeviceN((PdfSpecialCs.DeviceN) pdfColorSpace, getColorants(operands));
            }
            if (PdfName.Pattern.equals(csType)) {
                List<PdfObject> underlyingOperands = new ArrayList<>(operands);
                PdfObject patternName = underlyingOperands.remove(operands.size() - 2);
                PdfColorSpace underlyingCs = ((PdfSpecialCs.UncoloredTilingPattern) pdfColorSpace).getUnderlyingColorSpace();
                if (patternName instanceof PdfName) {
                    PdfPattern pattern2 = resources.getPattern((PdfName) patternName);
                    if ((pattern2 instanceof PdfPattern.Tiling) && !((PdfPattern.Tiling) pattern2).isColored()) {
                        return new PatternColor((PdfPattern.Tiling) pattern2, underlyingCs, getColorants(underlyingOperands));
                    }
                }
            }
        }
        Logger logger = LoggerFactory.getLogger(PdfCanvasProcessor.class);
        logger.warn(MessageFormatUtil.format(KernelLogMessageConstant.UNABLE_TO_PARSE_COLOR_WITHIN_COLORSPACE, Arrays.toString(operands.toArray()), pdfColorSpace.getPdfObject()));
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Color getColor(int nOperands, List<PdfObject> operands) {
        float[] c = new float[nOperands];
        for (int i = 0; i < nOperands; i++) {
            c[i] = ((PdfNumber) operands.get(i)).floatValue();
        }
        switch (nOperands) {
            case 1:
                return new DeviceGray(c[0]);
            case 2:
            default:
                return null;
            case 3:
                return new DeviceRgb(c[0], c[1], c[2]);
            case 4:
                return new DeviceCmyk(c[0], c[1], c[2], c[3]);
        }
    }

    private static float[] getColorants(List<PdfObject> operands) {
        float[] c = new float[operands.size() - 1];
        for (int i = 0; i < operands.size() - 1; i++) {
            c[i] = ((PdfNumber) operands.get(i)).floatValue();
        }
        return c;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes12.dex */
    public static class PopGraphicsStateOperator implements IContentOperator {
        protected PopGraphicsStateOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            processor.gsStack.pop();
            ParserGraphicsState gs = processor.getGraphicsState();
            processor.eventOccurred(new ClippingPathInfo(gs, gs.getClippingPath(), gs.getCtm()), EventType.CLIP_PATH_CHANGED);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetGrayFillOperator implements IContentOperator {
        private SetGrayFillOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            processor.getGraphicsState().setFillColor(PdfCanvasProcessor.getColor(1, operands));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetGrayStrokeOperator implements IContentOperator {
        private SetGrayStrokeOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            processor.getGraphicsState().setStrokeColor(PdfCanvasProcessor.getColor(1, operands));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetRGBFillOperator implements IContentOperator {
        private SetRGBFillOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            processor.getGraphicsState().setFillColor(PdfCanvasProcessor.getColor(3, operands));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetRGBStrokeOperator implements IContentOperator {
        private SetRGBStrokeOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            processor.getGraphicsState().setStrokeColor(PdfCanvasProcessor.getColor(3, operands));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetCMYKFillOperator implements IContentOperator {
        private SetCMYKFillOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            processor.getGraphicsState().setFillColor(PdfCanvasProcessor.getColor(4, operands));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetCMYKStrokeOperator implements IContentOperator {
        private SetCMYKStrokeOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            processor.getGraphicsState().setStrokeColor(PdfCanvasProcessor.getColor(4, operands));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetColorSpaceFillOperator implements IContentOperator {
        private SetColorSpaceFillOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            PdfColorSpace pdfColorSpace = determineColorSpace((PdfName) operands.get(0), processor);
            processor.getGraphicsState().setFillColor(Color.makeColor(pdfColorSpace));
        }

        static PdfColorSpace determineColorSpace(PdfName colorSpace, PdfCanvasProcessor processor) {
            if (PdfColorSpace.DIRECT_COLOR_SPACES.contains(colorSpace)) {
                PdfColorSpace pdfColorSpace = PdfColorSpace.makeColorSpace(colorSpace);
                return pdfColorSpace;
            }
            PdfResources pdfResources = processor.getResources();
            PdfDictionary resourceColorSpace = pdfResources.getPdfObject().getAsDictionary(PdfName.ColorSpace);
            PdfColorSpace pdfColorSpace2 = PdfColorSpace.makeColorSpace(resourceColorSpace.get(colorSpace));
            return pdfColorSpace2;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetColorSpaceStrokeOperator implements IContentOperator {
        private SetColorSpaceStrokeOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            PdfColorSpace pdfColorSpace = SetColorSpaceFillOperator.determineColorSpace((PdfName) operands.get(0), processor);
            processor.getGraphicsState().setStrokeColor(Color.makeColor(pdfColorSpace));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetColorFillOperator implements IContentOperator {
        private SetColorFillOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            processor.getGraphicsState().setFillColor(PdfCanvasProcessor.getColor(processor.getGraphicsState().getFillColor().getColorSpace(), operands, processor.getResources()));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetColorStrokeOperator implements IContentOperator {
        private SetColorStrokeOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            processor.getGraphicsState().setStrokeColor(PdfCanvasProcessor.getColor(processor.getGraphicsState().getStrokeColor().getColorSpace(), operands, processor.getResources()));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class BeginTextOperator implements IContentOperator {
        private BeginTextOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            processor.textMatrix = new Matrix();
            processor.textLineMatrix = processor.textMatrix;
            processor.beginText();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class EndTextOperator implements IContentOperator {
        private EndTextOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            processor.textMatrix = null;
            processor.textLineMatrix = null;
            processor.endText();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class BeginMarkedContentOperator implements IContentOperator {
        private BeginMarkedContentOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            processor.beginMarkedContent((PdfName) operands.get(0), null);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class BeginMarkedContentDictionaryOperator implements IContentOperator {
        private BeginMarkedContentDictionaryOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            PdfObject properties = operands.get(1);
            processor.beginMarkedContent((PdfName) operands.get(0), getPropertiesDictionary(properties, processor.getResources()));
        }

        PdfDictionary getPropertiesDictionary(PdfObject operand1, PdfResources resources) {
            if (operand1.isDictionary()) {
                return (PdfDictionary) operand1;
            }
            PdfName dictionaryName = (PdfName) operand1;
            PdfDictionary properties = resources.getResource(PdfName.Properties);
            if (properties == null) {
                Logger logger = LoggerFactory.getLogger(PdfCanvasProcessor.class);
                logger.warn(MessageFormatUtil.format(IoLogMessageConstant.PDF_REFERS_TO_NOT_EXISTING_PROPERTY_DICTIONARY, PdfName.Properties));
                return null;
            }
            PdfDictionary propertiesDictionary = properties.getAsDictionary(dictionaryName);
            if (propertiesDictionary == null) {
                Logger logger2 = LoggerFactory.getLogger(PdfCanvasProcessor.class);
                logger2.warn(MessageFormatUtil.format(IoLogMessageConstant.PDF_REFERS_TO_NOT_EXISTING_PROPERTY_DICTIONARY, dictionaryName));
                return null;
            }
            return properties.getAsDictionary(dictionaryName);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class EndMarkedContentOperator implements IContentOperator {
        private EndMarkedContentOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            processor.endMarkedContent();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class DoOperator implements IContentOperator {
        private DoOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            PdfName resourceName = (PdfName) operands.get(0);
            processor.displayXObject(resourceName);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class EndImageOperator implements IContentOperator {
        private EndImageOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            PdfStream imageStream = (PdfStream) operands.get(0);
            processor.displayImage(processor.markedContentStack, imageStream, null, true);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetLineWidthOperator implements IContentOperator {
        private SetLineWidthOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral oper, List<PdfObject> operands) {
            float lineWidth = ((PdfNumber) operands.get(0)).floatValue();
            processor.getGraphicsState().setLineWidth(lineWidth);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetLineCapOperator implements IContentOperator {
        private SetLineCapOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral oper, List<PdfObject> operands) {
            int lineCap = ((PdfNumber) operands.get(0)).intValue();
            processor.getGraphicsState().setLineCapStyle(lineCap);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetLineJoinOperator implements IContentOperator {
        private SetLineJoinOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral oper, List<PdfObject> operands) {
            int lineJoin = ((PdfNumber) operands.get(0)).intValue();
            processor.getGraphicsState().setLineJoinStyle(lineJoin);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetMiterLimitOperator implements IContentOperator {
        private SetMiterLimitOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral oper, List<PdfObject> operands) {
            float miterLimit = ((PdfNumber) operands.get(0)).floatValue();
            processor.getGraphicsState().setMiterLimit(miterLimit);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SetLineDashPatternOperator implements IContentOperator {
        private SetLineDashPatternOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral oper, List<PdfObject> operands) {
            processor.getGraphicsState().setDashPattern(new PdfArray(Arrays.asList(operands.get(0), operands.get(1))));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class FormXObjectDoHandler implements IXObjectDoHandler {
        private FormXObjectDoHandler() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IXObjectDoHandler
        public void handleXObject(PdfCanvasProcessor processor, Stack<CanvasTag> canvasTagHierarchy, PdfStream xObjectStream, PdfName xObjectName) {
            PdfResources resources;
            PdfDictionary resourcesDic = xObjectStream.getAsDictionary(PdfName.Resources);
            if (resourcesDic == null) {
                resources = processor.getResources();
            } else {
                resources = new PdfResources(resourcesDic);
            }
            byte[] contentBytes = xObjectStream.getBytes();
            PdfArray matrix = xObjectStream.getAsArray(PdfName.Matrix);
            new PushGraphicsStateOperator().invoke(processor, null, null);
            if (matrix != null) {
                float a = matrix.getAsNumber(0).floatValue();
                float b = matrix.getAsNumber(1).floatValue();
                float c = matrix.getAsNumber(2).floatValue();
                float d = matrix.getAsNumber(3).floatValue();
                float e = matrix.getAsNumber(4).floatValue();
                float f = matrix.getAsNumber(5).floatValue();
                Matrix formMatrix = new Matrix(a, b, c, d, e, f);
                processor.getGraphicsState().updateCtm(formMatrix);
            }
            processor.processContent(contentBytes, resources);
            new PopGraphicsStateOperator().invoke(processor, null, null);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class ImageXObjectDoHandler implements IXObjectDoHandler {
        private ImageXObjectDoHandler() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IXObjectDoHandler
        public void handleXObject(PdfCanvasProcessor processor, Stack<CanvasTag> canvasTagHierarchy, PdfStream xObjectStream, PdfName resourceName) {
            processor.displayImage(canvasTagHierarchy, xObjectStream, resourceName, false);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class IgnoreXObjectDoHandler implements IXObjectDoHandler {
        private IgnoreXObjectDoHandler() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IXObjectDoHandler
        public void handleXObject(PdfCanvasProcessor processor, Stack<CanvasTag> canvasTagHierarchy, PdfStream xObjectStream, PdfName xObjectName) {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class MoveToOperator implements IContentOperator {
        private MoveToOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            float x = ((PdfNumber) operands.get(0)).floatValue();
            float y = ((PdfNumber) operands.get(1)).floatValue();
            processor.currentPath.moveTo(x, y);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class LineToOperator implements IContentOperator {
        private LineToOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            float x = ((PdfNumber) operands.get(0)).floatValue();
            float y = ((PdfNumber) operands.get(1)).floatValue();
            processor.currentPath.lineTo(x, y);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class CurveOperator implements IContentOperator {
        private CurveOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            float x1 = ((PdfNumber) operands.get(0)).floatValue();
            float y1 = ((PdfNumber) operands.get(1)).floatValue();
            float x2 = ((PdfNumber) operands.get(2)).floatValue();
            float y2 = ((PdfNumber) operands.get(3)).floatValue();
            float x3 = ((PdfNumber) operands.get(4)).floatValue();
            float y3 = ((PdfNumber) operands.get(5)).floatValue();
            processor.currentPath.curveTo(x1, y1, x2, y2, x3, y3);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class CurveFirstPointDuplicatedOperator implements IContentOperator {
        private CurveFirstPointDuplicatedOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            float x2 = ((PdfNumber) operands.get(0)).floatValue();
            float y2 = ((PdfNumber) operands.get(1)).floatValue();
            float x3 = ((PdfNumber) operands.get(2)).floatValue();
            float y3 = ((PdfNumber) operands.get(3)).floatValue();
            processor.currentPath.curveTo(x2, y2, x3, y3);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class CurveFourhPointDuplicatedOperator implements IContentOperator {
        private CurveFourhPointDuplicatedOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            float x1 = ((PdfNumber) operands.get(0)).floatValue();
            float y1 = ((PdfNumber) operands.get(1)).floatValue();
            float x3 = ((PdfNumber) operands.get(2)).floatValue();
            float y3 = ((PdfNumber) operands.get(3)).floatValue();
            processor.currentPath.curveFromTo(x1, y1, x3, y3);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class CloseSubpathOperator implements IContentOperator {
        private CloseSubpathOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            processor.currentPath.closeSubpath();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class RectangleOperator implements IContentOperator {
        private RectangleOperator() {
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            float x = ((PdfNumber) operands.get(0)).floatValue();
            float y = ((PdfNumber) operands.get(1)).floatValue();
            float w = ((PdfNumber) operands.get(2)).floatValue();
            float h = ((PdfNumber) operands.get(3)).floatValue();
            processor.currentPath.rectangle(x, y, w, h);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class PaintPathOperator implements IContentOperator {
        private boolean close;
        private int operation;
        private int rule;

        public PaintPathOperator(int operation, int rule, boolean close) {
            this.operation = operation;
            this.rule = rule;
            this.close = close;
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            if (this.close) {
                processor.currentPath.closeSubpath();
            }
            processor.paintPath(this.operation, this.rule);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class ClipPathOperator implements IContentOperator {
        private int rule;

        public ClipPathOperator(int rule) {
            this.rule = rule;
        }

        @Override // com.itextpdf.kernel.pdf.canvas.parser.IContentOperator
        public void invoke(PdfCanvasProcessor processor, PdfLiteral operator, List<PdfObject> operands) {
            processor.isClip = true;
            processor.clippingRule = this.rule;
        }
    }
}
