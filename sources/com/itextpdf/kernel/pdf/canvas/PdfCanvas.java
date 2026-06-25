package com.itextpdf.kernel.pdf.canvas;

import androidx.camera.video.AudioStats;
import com.itextpdf.commons.datastructures.Tuple2;
import com.itextpdf.io.codec.TIFFConstants;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.io.font.otf.ActualTextIterator;
import com.itextpdf.io.font.otf.Glyph;
import com.itextpdf.io.font.otf.GlyphLine;
import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageType;
import com.itextpdf.io.source.ByteUtils;
import com.itextpdf.io.util.StreamUtil;
import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.colors.DeviceGray;
import com.itextpdf.kernel.colors.PatternColor;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfType0Font;
import com.itextpdf.kernel.geom.AffineTransform;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.geom.Vector;
import com.itextpdf.kernel.pdf.IsoKey;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfOutputStream;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfResources;
import com.itextpdf.kernel.pdf.PdfStream;
import com.itextpdf.kernel.pdf.PdfString;
import com.itextpdf.kernel.pdf.PdfVersion;
import com.itextpdf.kernel.pdf.canvas.wmf.WmfImageHelper;
import com.itextpdf.kernel.pdf.colorspace.PdfColorSpace;
import com.itextpdf.kernel.pdf.colorspace.PdfDeviceCs;
import com.itextpdf.kernel.pdf.colorspace.PdfPattern;
import com.itextpdf.kernel.pdf.colorspace.PdfShading;
import com.itextpdf.kernel.pdf.colorspace.PdfSpecialCs;
import com.itextpdf.kernel.pdf.extgstate.PdfExtGState;
import com.itextpdf.kernel.pdf.layer.IPdfOCG;
import com.itextpdf.kernel.pdf.layer.PdfLayer;
import com.itextpdf.kernel.pdf.layer.PdfLayerMembership;
import com.itextpdf.kernel.pdf.tagutils.TagReference;
import com.itextpdf.kernel.pdf.xobject.PdfFormXObject;
import com.itextpdf.kernel.pdf.xobject.PdfImageXObject;
import com.itextpdf.kernel.pdf.xobject.PdfXObject;
import com.itextpdf.layout.properties.Property;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Stack;
/* loaded from: classes12.dex */
public class PdfCanvas {
    private static final float IDENTITY_MATRIX_EPS = 1.0E-4f;
    protected PdfStream contentStream;
    protected CanvasGraphicsState currentGs;
    private boolean defaultDeviceGrayBlackColorCheckRequired;
    protected PdfDocument document;
    protected boolean drawingOnPage;
    protected Stack<CanvasGraphicsState> gsStack;
    protected List<Integer> layerDepth;
    protected int mcDepth;
    protected PdfResources resources;
    private Stack<Tuple2<PdfName, PdfDictionary>> tagStructureStack;
    private static final byte[] B = ByteUtils.getIsoBytes("B\n");
    private static final byte[] b = ByteUtils.getIsoBytes("b\n");
    private static final byte[] BDC = ByteUtils.getIsoBytes("BDC\n");
    private static final byte[] BI = ByteUtils.getIsoBytes("BI\n");
    private static final byte[] BMC = ByteUtils.getIsoBytes("BMC\n");
    private static final byte[] BStar = ByteUtils.getIsoBytes("B*\n");
    private static final byte[] bStar = ByteUtils.getIsoBytes("b*\n");
    private static final byte[] BT = ByteUtils.getIsoBytes("BT\n");
    private static final byte[] c = ByteUtils.getIsoBytes("c\n");
    private static final byte[] cm = ByteUtils.getIsoBytes("cm\n");
    private static final byte[] cs = ByteUtils.getIsoBytes("cs\n");
    private static final byte[] CS = ByteUtils.getIsoBytes("CS\n");
    private static final byte[] d = ByteUtils.getIsoBytes("d\n");
    private static final byte[] Do = ByteUtils.getIsoBytes("Do\n");
    private static final byte[] EI = ByteUtils.getIsoBytes("EI\n");
    private static final byte[] EMC = ByteUtils.getIsoBytes("EMC\n");
    private static final byte[] ET = ByteUtils.getIsoBytes("ET\n");
    private static final byte[] f = ByteUtils.getIsoBytes("f\n");
    private static final byte[] fStar = ByteUtils.getIsoBytes("f*\n");
    private static final byte[] G = ByteUtils.getIsoBytes("G\n");
    private static final byte[] g = ByteUtils.getIsoBytes("g\n");
    private static final byte[] gs = ByteUtils.getIsoBytes("gs\n");
    private static final byte[] h = ByteUtils.getIsoBytes("h\n");
    private static final byte[] i = ByteUtils.getIsoBytes("i\n");
    private static final byte[] ID = ByteUtils.getIsoBytes("ID\n");
    private static final byte[] j = ByteUtils.getIsoBytes("j\n");
    private static final byte[] J = ByteUtils.getIsoBytes("J\n");
    private static final byte[] K = ByteUtils.getIsoBytes("K\n");
    private static final byte[] k = ByteUtils.getIsoBytes("k\n");
    private static final byte[] l = ByteUtils.getIsoBytes("l\n");
    private static final byte[] m = ByteUtils.getIsoBytes("m\n");
    private static final byte[] M = ByteUtils.getIsoBytes("M\n");
    private static final byte[] n = ByteUtils.getIsoBytes("n\n");
    private static final byte[] q = ByteUtils.getIsoBytes("q\n");
    private static final byte[] Q = ByteUtils.getIsoBytes("Q\n");
    private static final byte[] re = ByteUtils.getIsoBytes("re\n");
    private static final byte[] rg = ByteUtils.getIsoBytes("rg\n");
    private static final byte[] RG = ByteUtils.getIsoBytes("RG\n");
    private static final byte[] ri = ByteUtils.getIsoBytes("ri\n");
    private static final byte[] S = ByteUtils.getIsoBytes("S\n");
    private static final byte[] s = ByteUtils.getIsoBytes("s\n");
    private static final byte[] scn = ByteUtils.getIsoBytes("scn\n");
    private static final byte[] SCN = ByteUtils.getIsoBytes("SCN\n");
    private static final byte[] sh = ByteUtils.getIsoBytes("sh\n");
    private static final byte[] Tc = ByteUtils.getIsoBytes("Tc\n");
    private static final byte[] Td = ByteUtils.getIsoBytes("Td\n");
    private static final byte[] TD = ByteUtils.getIsoBytes("TD\n");
    private static final byte[] Tf = ByteUtils.getIsoBytes("Tf\n");
    private static final byte[] TJ = ByteUtils.getIsoBytes("TJ\n");
    private static final byte[] Tj = ByteUtils.getIsoBytes("Tj\n");
    private static final byte[] TL = ByteUtils.getIsoBytes("TL\n");
    private static final byte[] Tm = ByteUtils.getIsoBytes("Tm\n");
    private static final byte[] Tr = ByteUtils.getIsoBytes("Tr\n");
    private static final byte[] Ts = ByteUtils.getIsoBytes("Ts\n");
    private static final byte[] TStar = ByteUtils.getIsoBytes("T*\n");
    private static final byte[] Tw = ByteUtils.getIsoBytes("Tw\n");
    private static final byte[] Tz = ByteUtils.getIsoBytes("Tz\n");
    private static final byte[] v = ByteUtils.getIsoBytes("v\n");
    private static final byte[] W = ByteUtils.getIsoBytes("W\n");
    private static final byte[] w = ByteUtils.getIsoBytes("w\n");
    private static final byte[] WStar = ByteUtils.getIsoBytes("W*\n");
    private static final byte[] y = ByteUtils.getIsoBytes("y\n");
    private static final PdfDeviceCs.Gray gray = new PdfDeviceCs.Gray();
    private static final PdfDeviceCs.Rgb rgb = new PdfDeviceCs.Rgb();
    private static final PdfDeviceCs.Cmyk cmyk = new PdfDeviceCs.Cmyk();
    private static final PdfSpecialCs.Pattern pattern = new PdfSpecialCs.Pattern();

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public enum CheckColorMode {
        NONE,
        FILL,
        STROKE,
        FILL_AND_STROKE
    }

    public PdfCanvas(PdfStream contentStream, PdfResources resources, PdfDocument document) {
        this.defaultDeviceGrayBlackColorCheckRequired = true;
        this.gsStack = new Stack<>();
        this.currentGs = new CanvasGraphicsState();
        this.tagStructureStack = new Stack<>();
        this.drawingOnPage = false;
        this.contentStream = ensureStreamDataIsReadyToBeProcessed(contentStream);
        this.resources = resources;
        this.document = document;
    }

    public PdfCanvas(PdfPage page) {
        this(page, (page.getDocument().getReader() != null && page.getDocument().getWriter() != null && page.getContentStreamCount() > 0 && page.getLastContentStream().getLength() > 0) || (page.getRotation() != 0 && page.isIgnorePageRotationForContent()));
    }

    public PdfCanvas(PdfPage page, boolean wrapOldContent) {
        this(getPageStream(page), page.getResources(), page.getDocument());
        if (wrapOldContent) {
            page.newContentStreamBefore().getOutputStream().writeBytes(ByteUtils.getIsoBytes("q\n"));
            this.contentStream.getOutputStream().writeBytes(ByteUtils.getIsoBytes("Q\n"));
        }
        if (page.getRotation() != 0 && page.isIgnorePageRotationForContent() && (wrapOldContent || !page.isPageRotationInverseMatrixWritten())) {
            applyRotation(page);
            page.setPageRotationInverseMatrixWritten();
        }
        this.drawingOnPage = true;
    }

    public PdfCanvas(PdfFormXObject xObj, PdfDocument document) {
        this(xObj.getPdfObject(), xObj.getResources(), document);
    }

    public PdfCanvas(PdfDocument doc, int pageNum) {
        this(doc.getPage(pageNum));
    }

    public PdfResources getResources() {
        return this.resources;
    }

    public PdfDocument getDocument() {
        return this.document;
    }

    public void attachContentStream(PdfStream contentStream) {
        this.contentStream = contentStream;
    }

    public CanvasGraphicsState getGraphicsState() {
        return this.currentGs;
    }

    public void release() {
        this.gsStack = null;
        this.currentGs = null;
        this.contentStream = null;
        this.resources = null;
    }

    public PdfCanvas saveState() {
        this.document.checkIsoConformance('q', IsoKey.CANVAS_STACK);
        this.gsStack.push(this.currentGs);
        this.currentGs = new CanvasGraphicsState(this.currentGs);
        this.contentStream.getOutputStream().writeBytes(q);
        return this;
    }

    public PdfCanvas restoreState() {
        this.document.checkIsoConformance('Q', IsoKey.CANVAS_STACK);
        if (this.gsStack.isEmpty()) {
            throw new PdfException(KernelExceptionMessageConstant.UNBALANCED_SAVE_RESTORE_STATE_OPERATORS);
        }
        this.currentGs = this.gsStack.pop();
        this.contentStream.getOutputStream().writeBytes(Q);
        return this;
    }

    public PdfCanvas concatMatrix(double a, double b2, double c2, double d2, double e, double f2) {
        this.currentGs.updateCtm((float) a, (float) b2, (float) c2, (float) d2, (float) e, (float) f2);
        this.contentStream.getOutputStream().writeDouble(a).writeSpace().writeDouble(b2).writeSpace().writeDouble(c2).writeSpace().writeDouble(d2).writeSpace().writeDouble(e).writeSpace().writeDouble(f2).writeSpace().writeBytes(cm);
        return this;
    }

    public PdfCanvas concatMatrix(PdfArray array) {
        if (array.size() != 6) {
            return this;
        }
        for (int i2 = 0; i2 < array.size(); i2++) {
            if (!array.get(i2).isNumber()) {
                return this;
            }
        }
        return concatMatrix(array.getAsNumber(0).doubleValue(), array.getAsNumber(1).doubleValue(), array.getAsNumber(2).doubleValue(), array.getAsNumber(3).doubleValue(), array.getAsNumber(4).doubleValue(), array.getAsNumber(5).doubleValue());
    }

    public PdfCanvas concatMatrix(AffineTransform transform) {
        float[] matrix = new float[6];
        transform.getMatrix(matrix);
        return concatMatrix(matrix[0], matrix[1], matrix[2], matrix[3], matrix[4], matrix[5]);
    }

    public PdfCanvas beginText() {
        this.contentStream.getOutputStream().writeBytes(BT);
        return this;
    }

    public PdfCanvas endText() {
        this.contentStream.getOutputStream().writeBytes(ET);
        return this;
    }

    public PdfCanvas beginVariableText() {
        return beginMarkedContent(PdfName.Tx);
    }

    public PdfCanvas endVariableText() {
        return endMarkedContent();
    }

    public PdfCanvas setFontAndSize(PdfFont font, float size) {
        this.currentGs.setFontSize(size);
        PdfName fontName = this.resources.addFont(this.document, font);
        this.currentGs.setFont(font);
        this.contentStream.getOutputStream().write((PdfObject) fontName).writeSpace().writeFloat(size).writeSpace().writeBytes(Tf);
        return this;
    }

    public PdfCanvas moveText(double x, double y2) {
        this.contentStream.getOutputStream().writeDouble(x).writeSpace().writeDouble(y2).writeSpace().writeBytes(Td);
        return this;
    }

    public PdfCanvas setLeading(float leading) {
        this.currentGs.setLeading(leading);
        this.contentStream.getOutputStream().writeFloat(leading).writeSpace().writeBytes(TL);
        return this;
    }

    public PdfCanvas moveTextWithLeading(float x, float y2) {
        this.currentGs.setLeading(-y2);
        this.contentStream.getOutputStream().writeFloat(x).writeSpace().writeFloat(y2).writeSpace().writeBytes(TD);
        return this;
    }

    public PdfCanvas newlineText() {
        this.contentStream.getOutputStream().writeBytes(TStar);
        return this;
    }

    public PdfCanvas newlineShowText(String text) {
        checkDefaultDeviceGrayBlackColor(getColorKeyForText());
        showTextInt(text);
        this.contentStream.getOutputStream().writeByte(39).writeNewLine();
        return this;
    }

    public PdfCanvas newlineShowText(float wordSpacing, float charSpacing, String text) {
        checkDefaultDeviceGrayBlackColor(getColorKeyForText());
        this.contentStream.getOutputStream().writeFloat(wordSpacing).writeSpace().writeFloat(charSpacing);
        showTextInt(text);
        this.contentStream.getOutputStream().writeByte(34).writeNewLine();
        this.currentGs.setCharSpacing(charSpacing);
        this.currentGs.setWordSpacing(wordSpacing);
        return this;
    }

    public PdfCanvas setTextRenderingMode(int textRenderingMode) {
        this.currentGs.setTextRenderingMode(textRenderingMode);
        this.contentStream.getOutputStream().writeInteger(textRenderingMode).writeSpace().writeBytes(Tr);
        return this;
    }

    public PdfCanvas setTextRise(float textRise) {
        this.currentGs.setTextRise(textRise);
        this.contentStream.getOutputStream().writeFloat(textRise).writeSpace().writeBytes(Ts);
        return this;
    }

    public PdfCanvas setWordSpacing(float wordSpacing) {
        this.currentGs.setWordSpacing(wordSpacing);
        this.contentStream.getOutputStream().writeFloat(wordSpacing).writeSpace().writeBytes(Tw);
        return this;
    }

    public PdfCanvas setCharacterSpacing(float charSpacing) {
        this.currentGs.setCharSpacing(charSpacing);
        this.contentStream.getOutputStream().writeFloat(charSpacing).writeSpace().writeBytes(Tc);
        return this;
    }

    public PdfCanvas setHorizontalScaling(float scale) {
        this.currentGs.setHorizontalScaling(scale);
        this.contentStream.getOutputStream().writeFloat(scale).writeSpace().writeBytes(Tz);
        return this;
    }

    public PdfCanvas setTextMatrix(float a, float b2, float c2, float d2, float x, float y2) {
        this.contentStream.getOutputStream().writeFloat(a).writeSpace().writeFloat(b2).writeSpace().writeFloat(c2).writeSpace().writeFloat(d2).writeSpace().writeFloat(x).writeSpace().writeFloat(y2).writeSpace().writeBytes(Tm);
        return this;
    }

    public PdfCanvas setTextMatrix(AffineTransform transform) {
        float[] matrix = new float[6];
        transform.getMatrix(matrix);
        return setTextMatrix(matrix[0], matrix[1], matrix[2], matrix[3], matrix[4], matrix[5]);
    }

    public PdfCanvas setTextMatrix(float x, float y2) {
        return setTextMatrix(1.0f, 0.0f, 0.0f, 1.0f, x, y2);
    }

    public PdfCanvas showText(String text) {
        checkDefaultDeviceGrayBlackColor(getColorKeyForText());
        showTextInt(text);
        this.contentStream.getOutputStream().writeBytes(Tj);
        return this;
    }

    public PdfCanvas showText(GlyphLine text) {
        return showText(text, new ActualTextIterator(text));
    }

    public PdfCanvas showText(GlyphLine text, Iterator<GlyphLine.GlyphLinePart> iterator) {
        float fontSize;
        checkDefaultDeviceGrayBlackColor(getColorKeyForText());
        this.document.checkIsoConformance(this.currentGs, IsoKey.FONT_GLYPHS, null, this.contentStream);
        checkIsoConformanceWritingOnContent();
        PdfFont font = this.currentGs.getFont();
        if (font != null) {
            this.document.checkIsoConformance(text.toString(), IsoKey.FONT, null, null, this.currentGs.getFont());
            float fontSize2 = FontProgram.convertTextSpaceToGlyphSpace(this.currentGs.getFontSize());
            float charSpacing = this.currentGs.getCharSpacing();
            float scaling = this.currentGs.getHorizontalScaling() / 100.0f;
            List<GlyphLine.GlyphLinePart> glyphLineParts = iteratorToList(iterator);
            int partIndex = 0;
            while (partIndex < glyphLineParts.size()) {
                GlyphLine.GlyphLinePart glyphLinePart = glyphLineParts.get(partIndex);
                boolean z = true;
                if (glyphLinePart.actualText != null) {
                    PdfDictionary properties = new PdfDictionary();
                    properties.put(PdfName.ActualText, new PdfString(glyphLinePart.actualText, PdfEncodings.UNICODE_BIG).setHexWriting(true));
                    beginMarkedContent(PdfName.Span, properties);
                } else if (glyphLinePart.reversed) {
                    beginMarkedContent(PdfName.ReversedChars);
                }
                int sub = glyphLinePart.start;
                int i2 = glyphLinePart.start;
                while (i2 < glyphLinePart.end) {
                    Glyph glyph = text.get(i2);
                    if (!glyph.hasOffsets()) {
                        fontSize = fontSize2;
                    } else {
                        if ((i2 - 1) - sub >= 0) {
                            font.writeText(text, sub, i2 - 1, this.contentStream.getOutputStream());
                            this.contentStream.getOutputStream().writeBytes(Tj);
                            this.contentStream.getOutputStream().writeFloat(getSubrangeWidth(text, sub, i2 - 1), z).writeSpace().writeFloat(0.0f).writeSpace().writeBytes(Td);
                        }
                        float xPlacement = Float.NaN;
                        float yPlacement = Float.NaN;
                        if (!glyph.hasPlacement()) {
                            fontSize = fontSize2;
                        } else {
                            float xPlacementAddition = 0.0f;
                            int currentGlyphIndex = i2;
                            Glyph currentGlyph = text.get(i2);
                            int currentGlyphIndex2 = currentGlyphIndex;
                            while (currentGlyph != null && currentGlyph.getAnchorDelta() != 0) {
                                fontSize = fontSize2;
                                xPlacementAddition += currentGlyph.getXPlacement();
                                if (currentGlyph.getAnchorDelta() == 0) {
                                    break;
                                }
                                currentGlyphIndex2 += currentGlyph.getAnchorDelta();
                                currentGlyph = text.get(currentGlyphIndex2);
                                fontSize2 = fontSize;
                            }
                            fontSize = fontSize2;
                            float fontSize3 = getSubrangeWidth(text, currentGlyphIndex2, i2);
                            xPlacement = (-fontSize3) + (xPlacementAddition * fontSize * scaling);
                            float yPlacementAddition = 0.0f;
                            int currentGlyphIndex3 = i2;
                            Glyph currentGlyph2 = text.get(i2);
                            while (currentGlyph2 != null && currentGlyph2.getYPlacement() != 0) {
                                yPlacementAddition += currentGlyph2.getYPlacement();
                                if (currentGlyph2.getAnchorDelta() == 0) {
                                    break;
                                }
                                currentGlyphIndex3 += currentGlyph2.getAnchorDelta();
                                currentGlyph2 = text.get(currentGlyphIndex3);
                            }
                            yPlacementAddition = yPlacementAddition;
                            float yPlacementAddition2 = yPlacementAddition;
                            float yPlacementAddition3 = getSubrangeYDelta(text, currentGlyphIndex3, i2);
                            yPlacement = (-yPlacementAddition3) + (yPlacementAddition2 * fontSize);
                            this.contentStream.getOutputStream().writeFloat(xPlacement, true).writeSpace().writeFloat(yPlacement, true).writeSpace().writeBytes(Td);
                        }
                        font.writeText(text, i2, i2, this.contentStream.getOutputStream());
                        this.contentStream.getOutputStream().writeBytes(Tj);
                        if (!Float.isNaN(xPlacement)) {
                            this.contentStream.getOutputStream().writeFloat(-xPlacement, true).writeSpace().writeFloat(-yPlacement, true).writeSpace().writeBytes(Td);
                        }
                        if (glyph.hasAdvance()) {
                            this.contentStream.getOutputStream().writeFloat(((((glyph.hasPlacement() ? 0 : glyph.getWidth()) + glyph.getXAdvance()) * fontSize) + charSpacing + getWordSpacingAddition(glyph)) * scaling, true).writeSpace().writeFloat(glyph.getYAdvance() * fontSize, true).writeSpace().writeBytes(Td);
                        }
                        sub = i2 + 1;
                    }
                    i2++;
                    fontSize2 = fontSize;
                    z = true;
                }
                float fontSize4 = fontSize2;
                if (glyphLinePart.end - sub > 0) {
                    font.writeText(text, sub, glyphLinePart.end - 1, this.contentStream.getOutputStream());
                    this.contentStream.getOutputStream().writeBytes(Tj);
                }
                if (glyphLinePart.actualText != null) {
                    endMarkedContent();
                } else if (glyphLinePart.reversed) {
                    endMarkedContent();
                }
                if (glyphLinePart.end > sub && partIndex + 1 < glyphLineParts.size()) {
                    this.contentStream.getOutputStream().writeFloat(getSubrangeWidth(text, sub, glyphLinePart.end - 1), true).writeSpace().writeFloat(0.0f).writeSpace().writeBytes(Td);
                }
                partIndex++;
                fontSize2 = fontSize4;
            }
            return this;
        }
        throw new PdfException(KernelExceptionMessageConstant.FONT_AND_SIZE_MUST_BE_SET_BEFORE_WRITING_ANY_TEXT, this.currentGs);
    }

    public void setDrawingOnPage(boolean drawingOnPage) {
        this.drawingOnPage = drawingOnPage;
    }

    private float getSubrangeWidth(GlyphLine text, int from, int to) {
        float fontSize = FontProgram.convertTextSpaceToGlyphSpace(this.currentGs.getFontSize());
        float charSpacing = this.currentGs.getCharSpacing();
        float scaling = this.currentGs.getHorizontalScaling() / 100.0f;
        float width = 0.0f;
        for (int iter = from; iter <= to; iter++) {
            Glyph glyph = text.get(iter);
            if (!glyph.hasPlacement()) {
                width += ((glyph.getWidth() * fontSize) + charSpacing + getWordSpacingAddition(glyph)) * scaling;
            }
            if (iter > from) {
                width += text.get(iter - 1).getXAdvance() * fontSize * scaling;
            }
        }
        return width;
    }

    private float getSubrangeYDelta(GlyphLine text, int from, int to) {
        float fontSize = FontProgram.convertTextSpaceToGlyphSpace(this.currentGs.getFontSize());
        float yDelta = 0.0f;
        for (int iter = from; iter < to; iter++) {
            yDelta += text.get(iter).getYAdvance() * fontSize;
        }
        return yDelta;
    }

    private float getWordSpacingAddition(Glyph glyph) {
        if (!(this.currentGs.getFont() instanceof PdfType0Font) && glyph.hasValidUnicode() && glyph.getCode() == 32) {
            return this.currentGs.getWordSpacing();
        }
        return 0.0f;
    }

    public PdfCanvas showText(PdfArray textArray) {
        checkDefaultDeviceGrayBlackColor(getColorKeyForText());
        this.document.checkIsoConformance(this.currentGs, IsoKey.FONT_GLYPHS, null, this.contentStream);
        checkIsoConformanceWritingOnContent();
        if (this.currentGs.getFont() == null) {
            throw new PdfException(KernelExceptionMessageConstant.FONT_AND_SIZE_MUST_BE_SET_BEFORE_WRITING_ANY_TEXT, this.currentGs);
        }
        StringBuilder text = new StringBuilder();
        Iterator<PdfObject> it = textArray.iterator();
        while (it.hasNext()) {
            PdfObject obj = it.next();
            if (obj instanceof PdfString) {
                text.append(obj);
            }
        }
        this.document.checkIsoConformance(text.toString(), IsoKey.FONT, null, null, this.currentGs.getFont());
        this.contentStream.getOutputStream().writeBytes(ByteUtils.getIsoBytes("["));
        Iterator<PdfObject> it2 = textArray.iterator();
        while (it2.hasNext()) {
            PdfObject obj2 = it2.next();
            if (obj2.isString()) {
                StreamUtil.writeEscapedString(this.contentStream.getOutputStream(), ((PdfString) obj2).getValueBytes());
            } else if (obj2.isNumber()) {
                this.contentStream.getOutputStream().writeFloat(((PdfNumber) obj2).floatValue());
            }
        }
        this.contentStream.getOutputStream().writeBytes(ByteUtils.getIsoBytes("]"));
        this.contentStream.getOutputStream().writeBytes(TJ);
        return this;
    }

    public PdfCanvas moveTo(double x, double y2) {
        this.contentStream.getOutputStream().writeDouble(x).writeSpace().writeDouble(y2).writeSpace().writeBytes(m);
        return this;
    }

    public PdfCanvas lineTo(double x, double y2) {
        this.contentStream.getOutputStream().writeDouble(x).writeSpace().writeDouble(y2).writeSpace().writeBytes(l);
        return this;
    }

    public PdfCanvas curveTo(double x1, double y1, double x2, double y2, double x3, double y3) {
        this.contentStream.getOutputStream().writeDouble(x1).writeSpace().writeDouble(y1).writeSpace().writeDouble(x2).writeSpace().writeDouble(y2).writeSpace().writeDouble(x3).writeSpace().writeDouble(y3).writeSpace().writeBytes(c);
        return this;
    }

    public PdfCanvas curveTo(double x2, double y2, double x3, double y3) {
        this.contentStream.getOutputStream().writeDouble(x2).writeSpace().writeDouble(y2).writeSpace().writeDouble(x3).writeSpace().writeDouble(y3).writeSpace().writeBytes(v);
        return this;
    }

    public PdfCanvas curveFromTo(double x1, double y1, double x3, double y3) {
        this.contentStream.getOutputStream().writeDouble(x1).writeSpace().writeDouble(y1).writeSpace().writeDouble(x3).writeSpace().writeDouble(y3).writeSpace().writeBytes(y);
        return this;
    }

    public PdfCanvas arc(double x1, double y1, double x2, double y2, double startAng, double extent) {
        return drawArc(x1, y1, x2, y2, startAng, extent, false);
    }

    public PdfCanvas arcContinuous(double x1, double y1, double x2, double y2, double startAng, double extent) {
        return drawArc(x1, y1, x2, y2, startAng, extent, true);
    }

    public PdfCanvas ellipse(double x1, double y1, double x2, double y2) {
        return arc(x1, y1, x2, y2, AudioStats.AUDIO_AMPLITUDE_NONE, 360.0d);
    }

    public static List<double[]> bezierArc(double x1, double y1, double x2, double y2, double startAng, double extent) {
        double x12;
        double x22;
        double y12;
        double y22;
        int Nfrag;
        double fragAngle;
        List<double[]> pointList;
        if (x1 <= x2) {
            x12 = x1;
            x22 = x2;
        } else {
            x12 = x2;
            x22 = x1;
        }
        if (y2 <= y1) {
            y12 = y1;
            y22 = y2;
        } else {
            y12 = y2;
            y22 = y1;
        }
        if (Math.abs(extent) <= 90.0d) {
            fragAngle = extent;
            Nfrag = 1;
        } else {
            double fragAngle2 = Math.abs(extent);
            Nfrag = (int) Math.ceil(fragAngle2 / 90.0d);
            fragAngle = extent / Nfrag;
        }
        double x_cen = (x12 + x22) / 2.0d;
        double y_cen = (y12 + y22) / 2.0d;
        double rx = (x22 - x12) / 2.0d;
        double ry = (y22 - y12) / 2.0d;
        double halfAng = (fragAngle * 3.141592653589793d) / 360.0d;
        double kappa = Math.abs(((1.0d - Math.cos(halfAng)) * 1.3333333333333333d) / Math.sin(halfAng));
        List<double[]> pointList2 = new ArrayList<>();
        int iter = 0;
        while (iter < Nfrag) {
            double fragAngle3 = fragAngle;
            double fragAngle4 = iter;
            double theta0 = ((startAng + (fragAngle4 * fragAngle3)) * 3.141592653589793d) / 180.0d;
            double theta1 = ((startAng + ((iter + 1) * fragAngle3)) * 3.141592653589793d) / 180.0d;
            double cos0 = Math.cos(theta0);
            double cos1 = Math.cos(theta1);
            double sin0 = Math.sin(theta0);
            double sin1 = Math.sin(theta1);
            if (fragAngle3 > AudioStats.AUDIO_AMPLITUDE_NONE) {
                pointList = pointList2;
                pointList.add(new double[]{x_cen + (rx * cos0), y_cen - (ry * sin0), x_cen + ((cos0 - (kappa * sin0)) * rx), y_cen - ((sin0 + (kappa * cos0)) * ry), x_cen + ((cos1 + (kappa * sin1)) * rx), y_cen - ((sin1 - (kappa * cos1)) * ry), x_cen + (rx * cos1), y_cen - (ry * sin1)});
            } else {
                pointList = pointList2;
                pointList.add(new double[]{x_cen + (rx * cos0), y_cen - (ry * sin0), x_cen + ((cos0 + (kappa * sin0)) * rx), y_cen - ((sin0 - (kappa * cos0)) * ry), x_cen + ((cos1 - (kappa * sin1)) * rx), y_cen - ((sin1 + (kappa * cos1)) * ry), x_cen + (rx * cos1), y_cen - (ry * sin1)});
            }
            iter++;
            fragAngle = fragAngle3;
            pointList2 = pointList;
        }
        return pointList2;
    }

    public PdfCanvas rectangle(double x, double y2, double width, double height) {
        this.contentStream.getOutputStream().writeDouble(x).writeSpace().writeDouble(y2).writeSpace().writeDouble(width).writeSpace().writeDouble(height).writeSpace().writeBytes(re);
        return this;
    }

    public PdfCanvas rectangle(Rectangle rectangle) {
        return rectangle(rectangle.getX(), rectangle.getY(), rectangle.getWidth(), rectangle.getHeight());
    }

    public PdfCanvas roundRectangle(double x, double y2, double width, double height, double radius) {
        double x2;
        double width2;
        double height2;
        double y3;
        double radius2;
        if (width >= AudioStats.AUDIO_AMPLITUDE_NONE) {
            x2 = x;
            width2 = width;
        } else {
            x2 = x + width;
            width2 = -width;
        }
        if (height >= AudioStats.AUDIO_AMPLITUDE_NONE) {
            height2 = height;
            y3 = y2;
        } else {
            height2 = -height;
            y3 = y2 + height;
        }
        if (radius >= AudioStats.AUDIO_AMPLITUDE_NONE) {
            radius2 = radius;
        } else {
            radius2 = -radius;
        }
        moveTo(x2 + radius2, y3);
        lineTo((x2 + width2) - radius2, y3);
        curveTo((x2 + width2) - (radius2 * 0.44769999384880066d), y3, x2 + width2, (radius2 * 0.44769999384880066d) + y3, x2 + width2, y3 + radius2);
        double y4 = y3;
        lineTo(x2 + width2, (y4 + height2) - radius2);
        curveTo(x2 + width2, (y4 + height2) - (radius2 * 0.44769999384880066d), (x2 + width2) - (radius2 * 0.44769999384880066d), y4 + height2, (x2 + width2) - radius2, y4 + height2);
        lineTo(x2 + radius2, y4 + height2);
        double x3 = x2;
        curveTo((radius2 * 0.44769999384880066d) + x2, y4 + height2, x3, (y4 + height2) - (radius2 * 0.44769999384880066d), x2, (y4 + height2) - radius2);
        lineTo(x3, y4 + radius2);
        curveTo(x3, y4 + (radius2 * 0.44769999384880066d), x3 + (0.44769999384880066d * radius2), y4, x3 + radius2, y4);
        return this;
    }

    public PdfCanvas circle(double x, double y2, double r) {
        moveTo(x + r, y2);
        curveTo(x + r, (r * 0.552299976348877d) + y2, x + (r * 0.552299976348877d), y2 + r, x, y2 + r);
        curveTo(x - (r * 0.552299976348877d), y2 + r, x - r, (r * 0.552299976348877d) + y2, x - r, y2);
        curveTo(x - r, y2 - (r * 0.552299976348877d), x - (r * 0.552299976348877d), y2 - r, x, y2 - r);
        curveTo(x + (r * 0.552299976348877d), y2 - r, x + r, y2 - (0.552299976348877d * r), x + r, y2);
        return this;
    }

    public PdfCanvas paintShading(PdfShading shading) {
        PdfName shadingName = this.resources.addShading(shading);
        this.contentStream.getOutputStream().write((PdfObject) shadingName).writeSpace().writeBytes(sh);
        return this;
    }

    public PdfCanvas closePath() {
        this.contentStream.getOutputStream().writeBytes(h);
        return this;
    }

    public PdfCanvas closePathEoFillStroke() {
        checkIsoConformanceWritingOnContent();
        checkDefaultDeviceGrayBlackColor(CheckColorMode.FILL_AND_STROKE);
        this.contentStream.getOutputStream().writeBytes(bStar);
        return this;
    }

    public PdfCanvas closePathFillStroke() {
        checkDefaultDeviceGrayBlackColor(CheckColorMode.FILL_AND_STROKE);
        this.contentStream.getOutputStream().writeBytes(b);
        return this;
    }

    public PdfCanvas endPath() {
        this.contentStream.getOutputStream().writeBytes(n);
        return this;
    }

    public PdfCanvas stroke() {
        checkDefaultDeviceGrayBlackColor(CheckColorMode.STROKE);
        this.contentStream.getOutputStream().writeBytes(S);
        return this;
    }

    public PdfCanvas clip() {
        this.contentStream.getOutputStream().writeBytes(W);
        return this;
    }

    public PdfCanvas eoClip() {
        this.contentStream.getOutputStream().writeBytes(WStar);
        return this;
    }

    public PdfCanvas closePathStroke() {
        checkIsoConformanceWritingOnContent();
        this.contentStream.getOutputStream().writeBytes(s);
        return this;
    }

    public PdfCanvas fill() {
        checkIsoConformanceWritingOnContent();
        checkDefaultDeviceGrayBlackColor(CheckColorMode.FILL);
        this.contentStream.getOutputStream().writeBytes(f);
        return this;
    }

    public PdfCanvas fillStroke() {
        checkIsoConformanceWritingOnContent();
        checkDefaultDeviceGrayBlackColor(CheckColorMode.FILL_AND_STROKE);
        this.contentStream.getOutputStream().writeBytes(B);
        return this;
    }

    public PdfCanvas eoFill() {
        checkIsoConformanceWritingOnContent();
        checkDefaultDeviceGrayBlackColor(CheckColorMode.FILL);
        this.contentStream.getOutputStream().writeBytes(fStar);
        return this;
    }

    public PdfCanvas eoFillStroke() {
        checkIsoConformanceWritingOnContent();
        checkDefaultDeviceGrayBlackColor(CheckColorMode.FILL_AND_STROKE);
        this.contentStream.getOutputStream().writeBytes(BStar);
        return this;
    }

    public PdfCanvas setLineWidth(float lineWidth) {
        if (this.currentGs.getLineWidth() == lineWidth) {
            return this;
        }
        this.currentGs.setLineWidth(lineWidth);
        this.contentStream.getOutputStream().writeFloat(lineWidth).writeSpace().writeBytes(w);
        return this;
    }

    public PdfCanvas setLineCapStyle(int lineCapStyle) {
        if (this.currentGs.getLineCapStyle() == lineCapStyle) {
            return this;
        }
        this.currentGs.setLineCapStyle(lineCapStyle);
        this.contentStream.getOutputStream().writeInteger(lineCapStyle).writeSpace().writeBytes(J);
        return this;
    }

    public PdfCanvas setLineJoinStyle(int lineJoinStyle) {
        if (this.currentGs.getLineJoinStyle() == lineJoinStyle) {
            return this;
        }
        this.currentGs.setLineJoinStyle(lineJoinStyle);
        this.contentStream.getOutputStream().writeInteger(lineJoinStyle).writeSpace().writeBytes(j);
        return this;
    }

    public PdfCanvas setMiterLimit(float miterLimit) {
        if (this.currentGs.getMiterLimit() == miterLimit) {
            return this;
        }
        this.currentGs.setMiterLimit(miterLimit);
        this.contentStream.getOutputStream().writeFloat(miterLimit).writeSpace().writeBytes(M);
        return this;
    }

    public PdfCanvas setLineDash(float phase) {
        this.currentGs.setDashPattern(getDashPatternArray(phase));
        this.contentStream.getOutputStream().writeByte(91).writeByte(93).writeSpace().writeFloat(phase).writeSpace().writeBytes(d);
        return this;
    }

    public PdfCanvas setLineDash(float unitsOn, float phase) {
        this.currentGs.setDashPattern(getDashPatternArray(new float[]{unitsOn}, phase));
        this.contentStream.getOutputStream().writeByte(91).writeFloat(unitsOn).writeByte(93).writeSpace().writeFloat(phase).writeSpace().writeBytes(d);
        return this;
    }

    public PdfCanvas setLineDash(float unitsOn, float unitsOff, float phase) {
        this.currentGs.setDashPattern(getDashPatternArray(new float[]{unitsOn, unitsOff}, phase));
        this.contentStream.getOutputStream().writeByte(91).writeFloat(unitsOn).writeSpace().writeFloat(unitsOff).writeByte(93).writeSpace().writeFloat(phase).writeSpace().writeBytes(d);
        return this;
    }

    public PdfCanvas setLineDash(float[] array, float phase) {
        this.currentGs.setDashPattern(getDashPatternArray(array, phase));
        PdfOutputStream out = this.contentStream.getOutputStream();
        out.writeByte(91);
        for (int iter = 0; iter < array.length; iter++) {
            out.writeFloat(array[iter]);
            if (iter < array.length - 1) {
                out.writeSpace();
            }
        }
        out.writeByte(93).writeSpace().writeFloat(phase).writeSpace().writeBytes(d);
        return this;
    }

    public PdfCanvas setRenderingIntent(PdfName renderingIntent) {
        this.document.checkIsoConformance(renderingIntent, IsoKey.RENDERING_INTENT);
        if (renderingIntent.equals(this.currentGs.getRenderingIntent())) {
            return this;
        }
        this.currentGs.setRenderingIntent(renderingIntent);
        this.contentStream.getOutputStream().write((PdfObject) renderingIntent).writeSpace().writeBytes(ri);
        return this;
    }

    public PdfCanvas setFlatnessTolerance(float flatnessTolerance) {
        if (this.currentGs.getFlatnessTolerance() == flatnessTolerance) {
            return this;
        }
        this.currentGs.setFlatnessTolerance(flatnessTolerance);
        this.contentStream.getOutputStream().writeFloat(flatnessTolerance).writeSpace().writeBytes(i);
        return this;
    }

    public PdfCanvas setFillColor(Color color) {
        return setColor(color, true);
    }

    public PdfCanvas setStrokeColor(Color color) {
        return setColor(color, false);
    }

    public PdfCanvas setColor(Color color, boolean fill) {
        if (color instanceof PatternColor) {
            return setColor(color.getColorSpace(), color.getColorValue(), ((PatternColor) color).getPattern(), fill);
        }
        return setColor(color.getColorSpace(), color.getColorValue(), fill);
    }

    public PdfCanvas setColor(PdfColorSpace colorSpace, float[] colorValue, boolean fill) {
        return setColor(colorSpace, colorValue, null, fill);
    }

    public PdfCanvas setColor(PdfColorSpace colorSpace, float[] colorValue, PdfPattern pattern2, boolean fill) {
        boolean setColorValueOnly = false;
        CanvasGraphicsState canvasGraphicsState = this.currentGs;
        Color oldColor = fill ? canvasGraphicsState.getFillColor() : canvasGraphicsState.getStrokeColor();
        Color newColor = createColor(colorSpace, colorValue, pattern2);
        if (oldColor.equals(newColor)) {
            return this;
        }
        CanvasGraphicsState canvasGraphicsState2 = this.currentGs;
        if (fill) {
            canvasGraphicsState2.setFillColor(newColor);
        } else {
            canvasGraphicsState2.setStrokeColor(newColor);
        }
        if (oldColor.getColorSpace().getPdfObject().equals(colorSpace.getPdfObject())) {
            setColorValueOnly = true;
        }
        if (colorSpace instanceof PdfDeviceCs.Gray) {
            this.contentStream.getOutputStream().writeFloats(colorValue).writeSpace().writeBytes(fill ? g : G);
        } else if (colorSpace instanceof PdfDeviceCs.Rgb) {
            this.contentStream.getOutputStream().writeFloats(colorValue).writeSpace().writeBytes(fill ? rg : RG);
        } else if (colorSpace instanceof PdfDeviceCs.Cmyk) {
            this.contentStream.getOutputStream().writeFloats(colorValue).writeSpace().writeBytes(fill ? k : K);
        } else if (colorSpace instanceof PdfSpecialCs.UncoloredTilingPattern) {
            this.contentStream.getOutputStream().write((PdfObject) this.resources.addColorSpace(colorSpace)).writeSpace().writeBytes(fill ? cs : CS).writeNewLine().writeFloats(colorValue).writeSpace().write((PdfObject) this.resources.addPattern(pattern2)).writeSpace().writeBytes(fill ? scn : SCN);
        } else if (colorSpace instanceof PdfSpecialCs.Pattern) {
            this.contentStream.getOutputStream().write((PdfObject) PdfName.Pattern).writeSpace().writeBytes(fill ? cs : CS).writeNewLine().write((PdfObject) this.resources.addPattern(pattern2)).writeSpace().writeBytes(fill ? scn : SCN);
        } else if (colorSpace.getPdfObject().isIndirect()) {
            if (!setColorValueOnly) {
                PdfName name = this.resources.addColorSpace(colorSpace);
                this.contentStream.getOutputStream().write((PdfObject) name).writeSpace().writeBytes(fill ? cs : CS);
            }
            this.contentStream.getOutputStream().writeFloats(colorValue).writeSpace().writeBytes(fill ? scn : SCN);
        }
        this.document.checkIsoConformance(this.currentGs, fill ? IsoKey.FILL_COLOR : IsoKey.STROKE_COLOR, this.resources, this.contentStream);
        return this;
    }

    public PdfCanvas setFillColorGray(float g2) {
        return setColor(gray, new float[]{g2}, true);
    }

    public PdfCanvas setStrokeColorGray(float g2) {
        return setColor(gray, new float[]{g2}, false);
    }

    public PdfCanvas resetFillColorGray() {
        return setFillColorGray(0.0f);
    }

    public PdfCanvas resetStrokeColorGray() {
        return setStrokeColorGray(0.0f);
    }

    public PdfCanvas setFillColorRgb(float r, float g2, float b2) {
        return setColor(rgb, new float[]{r, g2, b2}, true);
    }

    public PdfCanvas setStrokeColorRgb(float r, float g2, float b2) {
        return setColor(rgb, new float[]{r, g2, b2}, false);
    }

    public PdfCanvas setFillColorShading(PdfPattern.Shading shading) {
        return setColor(pattern, null, shading, true);
    }

    public PdfCanvas setStrokeColorShading(PdfPattern.Shading shading) {
        return setColor(pattern, null, shading, false);
    }

    public PdfCanvas resetFillColorRgb() {
        return resetFillColorGray();
    }

    public PdfCanvas resetStrokeColorRgb() {
        return resetStrokeColorGray();
    }

    public PdfCanvas setFillColorCmyk(float c2, float m2, float y2, float k2) {
        return setColor(cmyk, new float[]{c2, m2, y2, k2}, true);
    }

    public PdfCanvas setStrokeColorCmyk(float c2, float m2, float y2, float k2) {
        return setColor(cmyk, new float[]{c2, m2, y2, k2}, false);
    }

    public PdfCanvas resetFillColorCmyk() {
        return setFillColorCmyk(0.0f, 0.0f, 0.0f, 1.0f);
    }

    public PdfCanvas resetStrokeColorCmyk() {
        return setStrokeColorCmyk(0.0f, 0.0f, 0.0f, 1.0f);
    }

    public PdfCanvas beginLayer(IPdfOCG layer) {
        if ((layer instanceof PdfLayer) && ((PdfLayer) layer).getTitle() != null) {
            throw new IllegalArgumentException("Illegal layer argument.");
        }
        if (this.layerDepth == null) {
            this.layerDepth = new ArrayList();
        }
        if (layer instanceof PdfLayerMembership) {
            this.layerDepth.add(1);
            addToPropertiesAndBeginLayer(layer);
        } else if (layer instanceof PdfLayer) {
            int num = 0;
            for (PdfLayer la = (PdfLayer) layer; la != null; la = la.getParent()) {
                if (la.getTitle() == null) {
                    addToPropertiesAndBeginLayer(la);
                    num++;
                }
            }
            this.layerDepth.add(Integer.valueOf(num));
        } else {
            throw new UnsupportedOperationException("Unsupported type for operand: layer");
        }
        return this;
    }

    public PdfCanvas endLayer() {
        if (this.layerDepth != null && !this.layerDepth.isEmpty()) {
            int num = this.layerDepth.get(this.layerDepth.size() - 1).intValue();
            this.layerDepth.remove(this.layerDepth.size() - 1);
            while (true) {
                int num2 = num - 1;
                if (num > 0) {
                    this.contentStream.getOutputStream().writeBytes(EMC).writeNewLine();
                    num = num2;
                } else {
                    return this;
                }
            }
        } else {
            throw new PdfException(KernelExceptionMessageConstant.UNBALANCED_LAYER_OPERATORS);
        }
    }

    public PdfXObject addImageWithTransformationMatrix(ImageData image, float a, float b2, float c2, float d2, float e, float f2) {
        return addImageWithTransformationMatrix(image, a, b2, c2, d2, e, f2, false);
    }

    public PdfXObject addImageWithTransformationMatrix(ImageData image, float a, float b2, float c2, float d2, float e, float f2, boolean asInline) {
        if (image.getOriginalType() == ImageType.WMF) {
            WmfImageHelper wmf = new WmfImageHelper(image);
            PdfXObject xObject = wmf.createFormXObject(this.document);
            addXObjectWithTransformationMatrix(xObject, a, b2, c2, d2, e, f2);
            return xObject;
        }
        PdfImageXObject imageXObject = new PdfImageXObject(image);
        if (asInline && image.canImageBeInline()) {
            addInlineImage(imageXObject, a, b2, c2, d2, e, f2);
            return null;
        }
        addImageWithTransformationMatrix(imageXObject, a, b2, c2, d2, e, f2);
        return imageXObject;
    }

    public PdfXObject addImageFittedIntoRectangle(ImageData image, Rectangle rect, boolean asInline) {
        return addImageWithTransformationMatrix(image, rect.getWidth(), 0.0f, 0.0f, rect.getHeight(), rect.getX(), rect.getY(), asInline);
    }

    public PdfXObject addImageAt(ImageData image, float x, float y2, boolean asInline) {
        if (image.getOriginalType() == ImageType.WMF) {
            WmfImageHelper wmf = new WmfImageHelper(image);
            PdfXObject xObject = wmf.createFormXObject(this.document);
            addXObjectWithTransformationMatrix(xObject, 1.0f, 0.0f, 0.0f, 1.0f, x, y2);
            return xObject;
        }
        PdfImageXObject imageXObject = new PdfImageXObject(image);
        if (asInline && image.canImageBeInline()) {
            addInlineImage(imageXObject, image.getWidth(), 0.0f, 0.0f, image.getHeight(), x, y2);
            return null;
        }
        addImageWithTransformationMatrix(imageXObject, image.getWidth(), 0.0f, 0.0f, image.getHeight(), x, y2);
        return imageXObject;
    }

    public PdfCanvas addXObjectWithTransformationMatrix(PdfXObject xObject, float a, float b2, float c2, float d2, float e, float f2) {
        if (xObject instanceof PdfFormXObject) {
            return addFormWithTransformationMatrix((PdfFormXObject) xObject, a, b2, c2, d2, e, f2, true);
        }
        if (xObject instanceof PdfImageXObject) {
            return addImageWithTransformationMatrix(xObject, a, b2, c2, d2, e, f2);
        }
        throw new IllegalArgumentException("PdfFormXObject or PdfImageXObject expected.");
    }

    public PdfCanvas addXObjectAt(PdfXObject xObject, float x, float y2) {
        if (xObject instanceof PdfFormXObject) {
            return addFormAt((PdfFormXObject) xObject, x, y2);
        }
        if (xObject instanceof PdfImageXObject) {
            return addImageAt((PdfImageXObject) xObject, x, y2);
        }
        throw new IllegalArgumentException("PdfFormXObject or PdfImageXObject expected.");
    }

    public PdfCanvas addXObjectFittedIntoRectangle(PdfXObject xObject, Rectangle rect) {
        if (xObject instanceof PdfFormXObject) {
            return addFormFittedIntoRectangle((PdfFormXObject) xObject, rect);
        }
        if (xObject instanceof PdfImageXObject) {
            return addImageFittedIntoRectangle((PdfImageXObject) xObject, rect);
        }
        throw new IllegalArgumentException("PdfFormXObject or PdfImageXObject expected.");
    }

    public PdfCanvas addXObject(PdfXObject xObject) {
        if (xObject instanceof PdfFormXObject) {
            return addFormWithTransformationMatrix((PdfFormXObject) xObject, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, false);
        }
        if (xObject instanceof PdfImageXObject) {
            return addImageAt((PdfImageXObject) xObject, 0.0f, 0.0f);
        }
        throw new IllegalArgumentException("PdfFormXObject or PdfImageXObject expected.");
    }

    public PdfCanvas setExtGState(PdfExtGState extGState) {
        if (!extGState.isFlushed()) {
            this.currentGs.updateFromExtGState(extGState, this.document);
        }
        PdfName name = this.resources.addExtGState(extGState);
        this.contentStream.getOutputStream().write((PdfObject) name).writeSpace().writeBytes(gs);
        this.document.checkIsoConformance(this.currentGs, IsoKey.EXTENDED_GRAPHICS_STATE, null, this.contentStream);
        return this;
    }

    public PdfExtGState setExtGState(PdfDictionary extGState) {
        PdfExtGState egs = new PdfExtGState(extGState);
        setExtGState(egs);
        return egs;
    }

    public PdfCanvas beginMarkedContent(PdfName tag) {
        return beginMarkedContent(tag, null);
    }

    public PdfCanvas beginMarkedContent(PdfName tag, PdfDictionary properties) {
        this.mcDepth++;
        PdfOutputStream out = this.contentStream.getOutputStream().write((PdfObject) tag).writeSpace();
        if (properties == null) {
            out.writeBytes(BMC);
        } else if (properties.getIndirectReference() == null) {
            out.write((PdfObject) properties).writeSpace().writeBytes(BDC);
        } else {
            out.write((PdfObject) this.resources.addProperties(properties)).writeSpace().writeBytes(BDC);
        }
        Tuple2<PdfName, PdfDictionary> tuple2 = new Tuple2<>(tag, properties);
        if (this.drawingOnPage) {
            this.document.checkIsoConformance(this.tagStructureStack, IsoKey.CANVAS_BEGIN_MARKED_CONTENT, null, null, tuple2);
        }
        this.tagStructureStack.push(tuple2);
        return this;
    }

    public PdfCanvas endMarkedContent() {
        int i2 = this.mcDepth - 1;
        this.mcDepth = i2;
        if (i2 < 0) {
            throw new PdfException(KernelExceptionMessageConstant.UNBALANCED_BEGIN_END_MARKED_CONTENT_OPERATORS);
        }
        this.contentStream.getOutputStream().writeBytes(EMC);
        this.tagStructureStack.pop();
        return this;
    }

    public PdfCanvas openTag(CanvasTag tag) {
        if (tag.getRole() == null) {
            return this;
        }
        return beginMarkedContent(tag.getRole(), tag.getProperties());
    }

    public PdfCanvas openTag(TagReference tagReference) {
        if (tagReference.getRole() == null) {
            return this;
        }
        CanvasTag tag = new CanvasTag(tagReference.getRole());
        tag.setProperties(tagReference.getProperties()).addProperty(PdfName.MCID, new PdfNumber(tagReference.createNextMcid()));
        return openTag(tag);
    }

    public PdfCanvas closeTag() {
        return endMarkedContent();
    }

    public PdfCanvas writeLiteral(String s2) {
        this.contentStream.getOutputStream().writeString(s2);
        return this;
    }

    public PdfCanvas writeLiteral(char c2) {
        this.contentStream.getOutputStream().writeInteger(c2);
        return this;
    }

    public PdfCanvas writeLiteral(float n2) {
        this.contentStream.getOutputStream().writeFloat(n2);
        return this;
    }

    public PdfStream getContentStream() {
        return this.contentStream;
    }

    protected void addInlineImage(PdfImageXObject imageXObject, float a, float b2, float c2, float d2, float e, float f2) {
        this.document.checkIsoConformance(imageXObject.getPdfObject(), IsoKey.INLINE_IMAGE, this.resources, this.contentStream);
        saveState();
        concatMatrix(a, b2, c2, d2, e, f2);
        PdfOutputStream os = this.contentStream.getOutputStream();
        os.writeBytes(BI);
        byte[] imageBytes = imageXObject.getPdfObject().getBytes(false);
        for (Map.Entry<PdfName, PdfObject> entry : imageXObject.getPdfObject().entrySet()) {
            PdfName key = entry.getKey();
            if (!PdfName.Type.equals(key) && !PdfName.Subtype.equals(key) && !PdfName.Length.equals(key)) {
                os.write((PdfObject) entry.getKey()).writeSpace();
                os.write(entry.getValue()).writeNewLine();
            }
        }
        if (this.document.getPdfVersion().compareTo(PdfVersion.PDF_2_0) >= 0) {
            os.write((PdfObject) PdfName.Length).writeSpace();
            os.write((PdfObject) new PdfNumber(imageBytes.length)).writeNewLine();
        }
        os.writeBytes(ID);
        os.writeBytes(imageBytes).writeNewLine().writeBytes(EI).writeNewLine();
        restoreState();
    }

    private PdfCanvas addFormWithTransformationMatrix(PdfFormXObject form, float a, float b2, float c2, float d2, float e, float f2, boolean writeIdentityMatrix) {
        PdfCanvas pdfCanvas;
        saveState();
        if (writeIdentityMatrix || !isIdentityMatrix(a, b2, c2, d2, e, f2)) {
            pdfCanvas = this;
            pdfCanvas.concatMatrix(a, b2, c2, d2, e, f2);
        } else {
            pdfCanvas = this;
        }
        PdfName name = pdfCanvas.resources.addForm(form);
        pdfCanvas.contentStream.getOutputStream().write((PdfObject) name).writeSpace().writeBytes(Do);
        pdfCanvas.restoreState();
        return pdfCanvas;
    }

    private PdfCanvas addFormAt(PdfFormXObject form, float x, float y2) {
        Rectangle bBox = PdfFormXObject.calculateBBoxMultipliedByMatrix(form);
        Vector bBoxMin = new Vector(bBox.getLeft(), bBox.getBottom(), 1.0f);
        Vector bBoxMax = new Vector(bBox.getRight(), bBox.getTop(), 1.0f);
        Vector rectMin = new Vector(x, y2, 1.0f);
        Vector rectMax = new Vector((bBoxMax.get(0) + x) - bBoxMin.get(0), (bBoxMax.get(1) + y2) - bBoxMin.get(1), 1.0f);
        float[] result = calculateTransformationMatrix(rectMin, rectMax, bBoxMin, bBoxMax);
        return addFormWithTransformationMatrix(form, result[0], result[1], result[2], result[3], result[4], result[5], false);
    }

    private PdfCanvas addFormFittedIntoRectangle(PdfFormXObject form, Rectangle rect) {
        Rectangle bBox = PdfFormXObject.calculateBBoxMultipliedByMatrix(form);
        Vector bBoxMin = new Vector(bBox.getLeft(), bBox.getBottom(), 1.0f);
        Vector bBoxMax = new Vector(bBox.getRight(), bBox.getTop(), 1.0f);
        Vector rectMin = new Vector(rect.getLeft(), rect.getBottom(), 1.0f);
        Vector rectMax = new Vector(rect.getRight(), rect.getTop(), 1.0f);
        float[] result = calculateTransformationMatrix(rectMin, rectMax, bBoxMin, bBoxMax);
        return addFormWithTransformationMatrix(form, result[0], result[1], result[2], result[3], result[4], result[5], false);
    }

    private PdfCanvas addImageWithTransformationMatrix(PdfXObject xObject, float a, float b2, float c2, float d2, float e, float f2) {
        PdfName name;
        saveState();
        concatMatrix(a, b2, c2, d2, e, f2);
        boolean z = xObject instanceof PdfImageXObject;
        PdfResources pdfResources = this.resources;
        if (z) {
            name = pdfResources.addImage((PdfImageXObject) xObject);
        } else {
            name = pdfResources.addImage(xObject.getPdfObject());
        }
        this.contentStream.getOutputStream().write((PdfObject) name).writeSpace().writeBytes(Do);
        restoreState();
        return this;
    }

    private PdfCanvas addImageAt(PdfImageXObject image, float x, float y2) {
        return addImageWithTransformationMatrix(image, image.getWidth(), 0.0f, 0.0f, image.getHeight(), x, y2);
    }

    private PdfCanvas addImageFittedIntoRectangle(PdfImageXObject image, Rectangle rect) {
        return addImageWithTransformationMatrix(image, rect.getWidth(), 0.0f, 0.0f, rect.getHeight(), rect.getX(), rect.getY());
    }

    private PdfStream ensureStreamDataIsReadyToBeProcessed(PdfStream stream) {
        if (!stream.isFlushed() && (stream.getOutputStream() == null || stream.containsKey(PdfName.Filter))) {
            try {
                stream.setData(stream.getBytes());
            } catch (Exception e) {
            }
        }
        return stream;
    }

    private void showTextInt(String text) {
        this.document.checkIsoConformance(this.currentGs, IsoKey.FONT_GLYPHS, null, this.contentStream);
        if (this.currentGs.getFont() == null) {
            throw new PdfException(KernelExceptionMessageConstant.FONT_AND_SIZE_MUST_BE_SET_BEFORE_WRITING_ANY_TEXT, this.currentGs);
        }
        checkIsoConformanceWritingOnContent();
        this.document.checkIsoConformance(text, IsoKey.FONT, null, null, this.currentGs.getFont());
        this.currentGs.getFont().writeText(text, this.contentStream.getOutputStream());
    }

    private void checkIsoConformanceWritingOnContent() {
        if (this.drawingOnPage) {
            this.document.checkIsoConformance(this.tagStructureStack, IsoKey.CANVAS_WRITING_CONTENT);
        }
    }

    private void addToPropertiesAndBeginLayer(IPdfOCG layer) {
        PdfName name = this.resources.addProperties(layer.getPdfObject());
        this.contentStream.getOutputStream().write((PdfObject) PdfName.OC).writeSpace().write((PdfObject) name).writeSpace().writeBytes(BDC).writeNewLine();
    }

    private Color createColor(PdfColorSpace colorSpace, float[] colorValue, PdfPattern pattern2) {
        if (colorSpace instanceof PdfSpecialCs.UncoloredTilingPattern) {
            return new PatternColor((PdfPattern.Tiling) pattern2, ((PdfSpecialCs.UncoloredTilingPattern) colorSpace).getUnderlyingColorSpace(), colorValue);
        }
        if (colorSpace instanceof PdfSpecialCs.Pattern) {
            return new PatternColor(pattern2);
        }
        return Color.makeColor(colorSpace, colorValue);
    }

    private PdfArray getDashPatternArray(float phase) {
        return getDashPatternArray(null, phase);
    }

    private PdfArray getDashPatternArray(float[] dashArray, float phase) {
        PdfArray dashPatternArray = new PdfArray();
        PdfArray dArray = new PdfArray();
        if (dashArray != null) {
            for (float fl : dashArray) {
                dArray.add(new PdfNumber(fl));
            }
        }
        dashPatternArray.add(dArray);
        dashPatternArray.add(new PdfNumber(phase));
        return dashPatternArray;
    }

    private void applyRotation(PdfPage page) {
        Rectangle rectangle = page.getPageSizeWithRotation();
        int rotation = page.getRotation();
        switch (rotation) {
            case Property.BACKGROUND_IMAGE /* 90 */:
                concatMatrix(AudioStats.AUDIO_AMPLITUDE_NONE, 1.0d, -1.0d, AudioStats.AUDIO_AMPLITUDE_NONE, rectangle.getTop(), AudioStats.AUDIO_AMPLITUDE_NONE);
                return;
            case 180:
                concatMatrix(-1.0d, AudioStats.AUDIO_AMPLITUDE_NONE, AudioStats.AUDIO_AMPLITUDE_NONE, -1.0d, rectangle.getRight(), rectangle.getTop());
                return;
            case TIFFConstants.TIFFTAG_IMAGEDESCRIPTION /* 270 */:
                concatMatrix(AudioStats.AUDIO_AMPLITUDE_NONE, -1.0d, 1.0d, AudioStats.AUDIO_AMPLITUDE_NONE, AudioStats.AUDIO_AMPLITUDE_NONE, rectangle.getRight());
                return;
            default:
                return;
        }
    }

    private PdfCanvas drawArc(double x1, double y1, double x2, double y2, double startAng, double extent, boolean continuous) {
        PdfCanvas pdfCanvas = this;
        List<double[]> ar = bezierArc(x1, y1, x2, y2, startAng, extent);
        if (ar.isEmpty()) {
            return pdfCanvas;
        }
        double[] pt = ar.get(0);
        if (continuous) {
            pdfCanvas.lineTo(pt[0], pt[1]);
        } else {
            pdfCanvas.moveTo(pt[0], pt[1]);
        }
        int index = 0;
        while (index < ar.size()) {
            double[] pt2 = ar.get(index);
            pdfCanvas.curveTo(pt2[2], pt2[3], pt2[4], pt2[5], pt2[6], pt2[7]);
            index++;
            pdfCanvas = this;
        }
        return this;
    }

    private void checkDefaultDeviceGrayBlackColor(CheckColorMode checkColorMode) {
        if (this.defaultDeviceGrayBlackColorCheckRequired) {
            if (this.currentGs.getFillColor() == DeviceGray.BLACK && (checkColorMode == CheckColorMode.FILL || checkColorMode == CheckColorMode.FILL_AND_STROKE)) {
                this.document.checkIsoConformance(this.currentGs, IsoKey.FILL_COLOR, this.resources, this.contentStream);
                this.defaultDeviceGrayBlackColorCheckRequired = false;
            } else if (this.currentGs.getStrokeColor() == DeviceGray.BLACK) {
                if (checkColorMode == CheckColorMode.STROKE || checkColorMode == CheckColorMode.FILL_AND_STROKE) {
                    this.document.checkIsoConformance(this.currentGs, IsoKey.STROKE_COLOR, this.resources, this.contentStream);
                    this.defaultDeviceGrayBlackColorCheckRequired = false;
                }
            }
        }
    }

    private CheckColorMode getColorKeyForText() {
        switch (this.currentGs.getTextRenderingMode()) {
            case 0:
            case 4:
                return CheckColorMode.FILL;
            case 1:
            case 5:
                return CheckColorMode.STROKE;
            case 2:
            case 6:
                return CheckColorMode.FILL_AND_STROKE;
            case 3:
            default:
                return CheckColorMode.NONE;
        }
    }

    private static PdfStream getPageStream(PdfPage page) {
        PdfStream stream = page.getLastContentStream();
        return (stream == null || stream.getOutputStream() == null || stream.containsKey(PdfName.Filter)) ? page.newContentStreamAfter() : stream;
    }

    private static <T> List<T> iteratorToList(Iterator<T> iterator) {
        List<T> list = new ArrayList<>();
        while (iterator.hasNext()) {
            list.add(iterator.next());
        }
        return list;
    }

    private static float[] calculateTransformationMatrix(Vector expectedMin, Vector expectedMax, Vector actualMin, Vector actualMax) {
        float[] result = {(expectedMin.get(0) - expectedMax.get(0)) / (actualMin.get(0) - actualMax.get(0)), 0.0f, 0.0f, (expectedMin.get(1) - expectedMax.get(1)) / (actualMin.get(1) - actualMax.get(1)), expectedMin.get(0) - (actualMin.get(0) * result[0]), expectedMin.get(1) - (actualMin.get(1) * result[3])};
        return result;
    }

    private static boolean isIdentityMatrix(float a, float b2, float c2, float d2, float e, float f2) {
        return Math.abs(1.0f - a) < 1.0E-4f && Math.abs(b2) < 1.0E-4f && Math.abs(c2) < 1.0E-4f && Math.abs(1.0f - d2) < 1.0E-4f && Math.abs(e) < 1.0E-4f && Math.abs(f2) < 1.0E-4f;
    }
}
