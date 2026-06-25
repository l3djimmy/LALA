package com.itextpdf.kernel.pdf.canvas.wmf;

import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.colors.ColorConstants;
import java.io.IOException;
/* loaded from: classes12.dex */
public class MetaPen extends MetaObject {
    public static final int PS_DASH = 1;
    public static final int PS_DASHDOT = 3;
    public static final int PS_DASHDOTDOT = 4;
    public static final int PS_DOT = 2;
    public static final int PS_INSIDEFRAME = 6;
    public static final int PS_NULL = 5;
    public static final int PS_SOLID = 0;
    Color color;
    int penWidth;
    int style;

    public MetaPen() {
        super(1);
        this.style = 0;
        this.penWidth = 1;
        this.color = ColorConstants.BLACK;
    }

    public void init(InputMeta in) throws IOException {
        this.style = in.readWord();
        this.penWidth = in.readShort();
        in.readWord();
        this.color = in.readColor();
    }

    public int getStyle() {
        return this.style;
    }

    public int getPenWidth() {
        return this.penWidth;
    }

    public Color getColor() {
        return this.color;
    }
}
