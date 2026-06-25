package com.itextpdf.kernel.pdf.canvas.parser.data;

import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.otf.GlyphLine;
import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfType0Font;
import com.itextpdf.kernel.geom.LineSegment;
import com.itextpdf.kernel.geom.Matrix;
import com.itextpdf.kernel.geom.Vector;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfString;
import com.itextpdf.kernel.pdf.canvas.CanvasGraphicsState;
import com.itextpdf.kernel.pdf.canvas.CanvasTag;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Stack;
import kotlin.UByte;
/* loaded from: classes12.dex */
public class TextRenderInfo extends AbstractRenderInfo {
    private final List<CanvasTag> canvasTagHierarchy;
    private final PdfString string;
    private String text;
    private final Matrix textMatrix;
    private final Matrix textToUserSpaceTransformMatrix;
    private float unscaledWidth;

    public TextRenderInfo(PdfString str, CanvasGraphicsState gs, Matrix textMatrix, Stack<CanvasTag> canvasTagHierarchy) {
        super(gs);
        this.text = null;
        this.unscaledWidth = Float.NaN;
        this.string = str;
        this.textToUserSpaceTransformMatrix = textMatrix.multiply(gs.getCtm());
        this.textMatrix = textMatrix;
        this.canvasTagHierarchy = Collections.unmodifiableList(new ArrayList(canvasTagHierarchy));
    }

    private TextRenderInfo(TextRenderInfo parent, PdfString str, float horizontalOffset) {
        super(parent.gs);
        this.text = null;
        this.unscaledWidth = Float.NaN;
        this.string = str;
        Matrix offsetMatrix = new Matrix(horizontalOffset, 0.0f);
        this.textToUserSpaceTransformMatrix = offsetMatrix.multiply(parent.textToUserSpaceTransformMatrix);
        this.textMatrix = offsetMatrix.multiply(parent.textMatrix);
        this.canvasTagHierarchy = parent.canvasTagHierarchy;
    }

    public String getText() {
        checkGraphicsState();
        if (this.text == null) {
            GlyphLine gl = this.gs.getFont().decodeIntoGlyphLine(this.string);
            if (!isReversedChars()) {
                this.text = gl.toUnicodeString(gl.start, gl.end);
            } else {
                StringBuilder sb = new StringBuilder(gl.end - gl.start);
                int i = gl.end;
                while (true) {
                    i--;
                    if (i < gl.start) {
                        break;
                    }
                    sb.append(gl.get(i).getUnicodeChars());
                }
                this.text = sb.toString();
            }
        }
        return this.text;
    }

    public PdfString getPdfString() {
        return this.string;
    }

    public Matrix getTextMatrix() {
        return this.textMatrix;
    }

    public boolean hasMcid(int mcid) {
        return hasMcid(mcid, false);
    }

    public boolean hasMcid(int mcid, boolean checkTheTopmostLevelOnly) {
        List<CanvasTag> list = this.canvasTagHierarchy;
        if (checkTheTopmostLevelOnly) {
            if (list != null) {
                int infoMcid = getMcid();
                return infoMcid != -1 && infoMcid == mcid;
            }
        } else {
            for (CanvasTag tag : list) {
                if (tag.hasMcid() && tag.getMcid() == mcid) {
                    return true;
                }
            }
        }
        return false;
    }

    public int getMcid() {
        for (CanvasTag tag : this.canvasTagHierarchy) {
            if (tag.hasMcid()) {
                return tag.getMcid();
            }
        }
        return -1;
    }

    public LineSegment getBaseline() {
        checkGraphicsState();
        return getUnscaledBaselineWithOffset(this.gs.getTextRise() + 0.0f).transformBy(this.textToUserSpaceTransformMatrix);
    }

    public LineSegment getUnscaledBaseline() {
        checkGraphicsState();
        return getUnscaledBaselineWithOffset(this.gs.getTextRise() + 0.0f);
    }

    public LineSegment getAscentLine() {
        checkGraphicsState();
        return getUnscaledBaselineWithOffset(getAscentDescent()[0] + this.gs.getTextRise()).transformBy(this.textToUserSpaceTransformMatrix);
    }

    public LineSegment getDescentLine() {
        checkGraphicsState();
        return getUnscaledBaselineWithOffset(getAscentDescent()[1] + this.gs.getTextRise()).transformBy(this.textToUserSpaceTransformMatrix);
    }

    public PdfFont getFont() {
        checkGraphicsState();
        return this.gs.getFont();
    }

    public float getRise() {
        checkGraphicsState();
        if (this.gs.getTextRise() == 0.0f) {
            return 0.0f;
        }
        return convertHeightFromTextSpaceToUserSpace(this.gs.getTextRise());
    }

    public List<TextRenderInfo> getCharacterRenderInfos() {
        checkGraphicsState();
        List<TextRenderInfo> rslt = new ArrayList<>(this.string.getValue().length());
        PdfString[] strings = splitString(this.string);
        float totalWidth = 0.0f;
        for (PdfString str : strings) {
            float[] widthAndWordSpacing = getWidthAndWordSpacing(str);
            TextRenderInfo subInfo = new TextRenderInfo(this, str, totalWidth);
            rslt.add(subInfo);
            totalWidth += ((widthAndWordSpacing[0] * this.gs.getFontSize()) + this.gs.getCharSpacing() + widthAndWordSpacing[1]) * (this.gs.getHorizontalScaling() / 100.0f);
        }
        for (TextRenderInfo tri : rslt) {
            tri.getUnscaledWidth();
        }
        return rslt;
    }

    public float getSingleSpaceWidth() {
        return convertWidthFromTextSpaceToUserSpace(getUnscaledFontSpaceWidth());
    }

    public int getTextRenderMode() {
        checkGraphicsState();
        return this.gs.getTextRenderingMode();
    }

    public Color getFillColor() {
        checkGraphicsState();
        return this.gs.getFillColor();
    }

    public Color getStrokeColor() {
        checkGraphicsState();
        return this.gs.getStrokeColor();
    }

    public float getFontSize() {
        checkGraphicsState();
        return this.gs.getFontSize();
    }

    public float getHorizontalScaling() {
        checkGraphicsState();
        return this.gs.getHorizontalScaling();
    }

    public float getCharSpacing() {
        checkGraphicsState();
        return this.gs.getCharSpacing();
    }

    public float getWordSpacing() {
        checkGraphicsState();
        return this.gs.getWordSpacing();
    }

    public float getLeading() {
        checkGraphicsState();
        return this.gs.getLeading();
    }

    public String getActualText() {
        String lastActualText = null;
        for (CanvasTag tag : this.canvasTagHierarchy) {
            lastActualText = tag.getActualText();
            if (lastActualText != null) {
                break;
            }
        }
        return lastActualText;
    }

    public String getExpansionText() {
        String expansionText = null;
        for (CanvasTag tag : this.canvasTagHierarchy) {
            expansionText = tag.getExpansionText();
            if (expansionText != null) {
                break;
            }
        }
        return expansionText;
    }

    public boolean isReversedChars() {
        for (CanvasTag tag : this.canvasTagHierarchy) {
            if (tag != null && PdfName.ReversedChars.equals(tag.getRole())) {
                return true;
            }
        }
        return false;
    }

    public List<CanvasTag> getCanvasTagHierarchy() {
        return this.canvasTagHierarchy;
    }

    public float getUnscaledWidth() {
        if (Float.isNaN(this.unscaledWidth)) {
            this.unscaledWidth = getPdfStringWidth(this.string, false);
        }
        return this.unscaledWidth;
    }

    private LineSegment getUnscaledBaselineWithOffset(float yOffset) {
        checkGraphicsState();
        String unicodeStr = this.string.toUnicodeString();
        float correctedUnscaledWidth = getUnscaledWidth() - ((this.gs.getCharSpacing() + ((unicodeStr.length() <= 0 || unicodeStr.charAt(unicodeStr.length() + (-1)) != ' ') ? 0.0f : this.gs.getWordSpacing())) * (this.gs.getHorizontalScaling() / 100.0f));
        return new LineSegment(new Vector(0.0f, yOffset, 1.0f), new Vector(correctedUnscaledWidth, yOffset, 1.0f));
    }

    private float convertWidthFromTextSpaceToUserSpace(float width) {
        LineSegment textSpace = new LineSegment(new Vector(0.0f, 0.0f, 1.0f), new Vector(width, 0.0f, 1.0f));
        LineSegment userSpace = textSpace.transformBy(this.textToUserSpaceTransformMatrix);
        return userSpace.getLength();
    }

    private float convertHeightFromTextSpaceToUserSpace(float height) {
        LineSegment textSpace = new LineSegment(new Vector(0.0f, 0.0f, 1.0f), new Vector(0.0f, height, 1.0f));
        LineSegment userSpace = textSpace.transformBy(this.textToUserSpaceTransformMatrix);
        return userSpace.getLength();
    }

    private float getUnscaledFontSpaceWidth() {
        checkGraphicsState();
        int charWidth = this.gs.getFont().getWidth(32);
        if (charWidth == 0) {
            charWidth = this.gs.getFont().getFontProgram().getAvgWidth();
        }
        float charWidthInGlyphSpace = FontProgram.convertTextSpaceToGlyphSpace(charWidth);
        return ((((this.gs.getFontSize() * charWidthInGlyphSpace) + this.gs.getCharSpacing()) + this.gs.getWordSpacing()) * this.gs.getHorizontalScaling()) / 100.0f;
    }

    private float getPdfStringWidth(PdfString string, boolean singleCharString) {
        PdfString[] splitString;
        checkGraphicsState();
        if (singleCharString) {
            float[] widthAndWordSpacing = getWidthAndWordSpacing(string);
            return (float) (((((widthAndWordSpacing[0] * this.gs.getFontSize()) + this.gs.getCharSpacing()) + widthAndWordSpacing[1]) * this.gs.getHorizontalScaling()) / 100.0d);
        }
        float totalWidth = 0.0f;
        for (PdfString str : splitString(string)) {
            totalWidth += getPdfStringWidth(str, true);
        }
        return totalWidth;
    }

    private float[] getWidthAndWordSpacing(PdfString string) {
        checkGraphicsState();
        return new float[]{FontProgram.convertTextSpaceToGlyphSpace(this.gs.getFont().getContentWidth(string)), " ".equals(string.getValue()) ? this.gs.getWordSpacing() : 0.0f};
    }

    private int getCharCode(String string) {
        try {
            byte[] b = string.getBytes("UTF-16BE");
            int value = 0;
            for (int i = 0; i < b.length - 1; i++) {
                value = (value + (b[i] & UByte.MAX_VALUE)) << 8;
            }
            int i2 = b.length;
            if (i2 > 0) {
                return value + (b[b.length - 1] & UByte.MAX_VALUE);
            }
            return value;
        } catch (UnsupportedEncodingException e) {
            return 0;
        }
    }

    private PdfString[] splitString(PdfString string) {
        checkGraphicsState();
        PdfFont font = this.gs.getFont();
        if (font instanceof PdfType0Font) {
            List<PdfString> strings = new ArrayList<>();
            GlyphLine glyphLine = this.gs.getFont().decodeIntoGlyphLine(string);
            for (int i = glyphLine.start; i < glyphLine.end; i++) {
                strings.add(new PdfString(this.gs.getFont().convertToBytes(glyphLine.get(i))));
            }
            int i2 = strings.size();
            return (PdfString[]) strings.toArray(new PdfString[i2]);
        }
        PdfString[] strings2 = new PdfString[string.getValue().length()];
        for (int i3 = 0; i3 < string.getValue().length(); i3++) {
            strings2[i3] = new PdfString(string.getValue().substring(i3, i3 + 1), string.getEncoding());
        }
        return strings2;
    }

    private float[] getAscentDescent() {
        checkGraphicsState();
        float ascent = this.gs.getFont().getFontProgram().getFontMetrics().getTypoAscender();
        float descent = this.gs.getFont().getFontProgram().getFontMetrics().getTypoDescender();
        if (descent > 0.0f) {
            descent = -descent;
        }
        float scale = ascent - descent < 700.0f ? ascent - descent : 1000.0f;
        return new float[]{(ascent / scale) * this.gs.getFontSize(), (descent / scale) * this.gs.getFontSize()};
    }
}
