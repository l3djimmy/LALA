package com.itextpdf.io.font;

import androidx.compose.runtime.ComposerKt;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.exifinterface.media.ExifInterface;
import androidx.recyclerview.widget.ItemTouchHelper;
import com.itextpdf.commons.utils.FileUtil;
import com.itextpdf.io.source.RandomAccessFileOrArray;
import com.itextpdf.kernel.pdf.tagging.StandardRoles;
import com.itextpdf.layout.properties.Property;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
/* loaded from: classes12.dex */
public final class Pfm2afm {
    private int[] Win2PSStd = {0, 0, 0, 0, 197, 198, 199, 0, 202, 0, 205, ComposerKt.referenceKey, ComposerKt.reuseKey, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 33, 34, 35, 36, 37, 38, 169, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 193, 97, 98, 99, 100, 101, 102, 103, 104, 105, Property.OUTLINE, 107, 108, 109, Property.BORDER_TOP_LEFT_RADIUS, Property.BORDER_TOP_RIGHT_RADIUS, Property.BORDER_BOTTOM_RIGHT_RADIUS, Property.BORDER_BOTTOM_LEFT_RADIUS, Property.BORDER_COLLAPSE, Property.HORIZONTAL_BORDER_SPACING, Property.VERTICAL_BORDER_SPACING, Property.TYPOGRAPHY_CONFIG, Property.NO_SOFT_WRAP_INLINE, Property.CAPTION_SIDE, 120, Property.ORPHANS_CONTROL, Property.WIDOWS_CONTROL, Property.RENDERING_MODE, Property.LINE_HEIGHT, Property.OBJECT_FIT, 126, 127, 128, 0, 184, 166, 185, 188, 178, 179, 195, 189, 0, 172, 234, 0, 0, 0, 0, 96, 0, 170, 186, 183, 177, 208, 196, 0, 0, 173, ItemTouchHelper.Callback.DEFAULT_SWIPE_ANIMATION_DURATION, 0, 0, 0, 0, 161, 162, 163, 168, 165, 0, 167, 200, 0, 227, 171, 0, 0, 0, 197, 0, 0, 0, 0, 194, 0, 182, 180, 203, 0, 235, 187, 0, 0, 0, 191, 0, 0, 0, 0, 0, 0, 225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 233, 0, 0, 0, 0, 0, 0, 251, 0, 0, 0, 0, 0, 0, 241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 249, 0, 0, 0, 0, 0, 0, 0};
    private String[] WinChars = {"W00", "W01", "W02", "W03", "macron", "breve", "dotaccent", "W07", "ring", "W09", "W0a", "W0b", "W0c", "W0d", "W0e", "W0f", "hungarumlaut", "ogonek", "caron", "W13", "W14", "W15", "W16", "W17", "W18", "W19", "W1a", "W1b", "W1c", "W1d", "W1e", "W1f", "space", "exclam", "quotedbl", "numbersign", "dollar", "percent", "ampersand", "quotesingle", "parenleft", "parenright", "asterisk", "plus", "comma", "hyphen", TypedValues.CycleType.S_WAVE_PERIOD, "slash", "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "colon", "semicolon", "less", "equal", "greater", "question", "at", ExifInterface.GPS_MEASUREMENT_IN_PROGRESS, "B", "C", "D", ExifInterface.LONGITUDE_EAST, "F", "G", StandardRoles.H, "I", "J", "K", StandardRoles.L, "M", "N", "O", StandardRoles.P, "Q", "R", ExifInterface.LATITUDE_SOUTH, ExifInterface.GPS_DIRECTION_TRUE, "U", ExifInterface.GPS_MEASUREMENT_INTERRUPTED, ExifInterface.LONGITUDE_WEST, "X", "Y", "Z", "bracketleft", "backslash", "bracketright", "asciicircum", "underscore", "grave", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "braceleft", "bar", "braceright", "asciitilde", "W7f", "euro", "W81", "quotesinglbase", "florin", "quotedblbase", "ellipsis", "dagger", "daggerdbl", "circumflex", "perthousand", "Scaron", "guilsinglleft", "OE", "W8d", "Zcaron", "W8f", "W90", "quoteleft", "quoteright", "quotedblleft", "quotedblright", "bullet", "endash", "emdash", "tilde", "trademark", "scaron", "guilsinglright", "oe", "W9d", "zcaron", "Ydieresis", "reqspace", "exclamdown", "cent", "sterling", "currency", "yen", "brokenbar", "section", "dieresis", "copyright", "ordfeminine", "guillemotleft", "logicalnot", "syllable", "registered", "macron", "degree", "plusminus", "twosuperior", "threesuperior", "acute", "mu", "paragraph", "periodcentered", "cedilla", "onesuperior", "ordmasculine", "guillemotright", "onequarter", "onehalf", "threequarters", "questiondown", "Agrave", "Aacute", "Acircumflex", "Atilde", "Adieresis", "Aring", "AE", "Ccedilla", "Egrave", "Eacute", "Ecircumflex", "Edieresis", "Igrave", "Iacute", "Icircumflex", "Idieresis", "Eth", "Ntilde", "Ograve", "Oacute", "Ocircumflex", "Otilde", "Odieresis", "multiply", "Oslash", "Ugrave", "Uacute", "Ucircumflex", "Udieresis", "Yacute", "Thorn", "germandbls", "agrave", "aacute", "acircumflex", "atilde", "adieresis", "aring", "ae", "ccedilla", "egrave", "eacute", "ecircumflex", "edieresis", "igrave", "iacute", "icircumflex", "idieresis", "eth", "ntilde", "ograve", "oacute", "ocircumflex", "otilde", "odieresis", "divide", "oslash", "ugrave", "uacute", "ucircumflex", "udieresis", "yacute", "thorn", "ydieresis"};
    private short ascender;
    private short ascent;
    private short avgwidth;
    private int bitoff;
    private int bits;
    private byte brkchar;
    private short capheight;
    private byte charset;
    private int chartab;
    private String copyright;
    private byte defchar;
    private short descender;
    private int device;
    private short extleading;
    private short extlen;
    private int face;
    private int firstchar;
    private int fontname;
    private int h_len;
    private short horres;
    private RandomAccessFileOrArray input;
    private short intleading;
    private boolean isMono;
    private byte italic;
    private int kernpairs;
    private byte kind;
    private int lastchar;
    private short maxwidth;
    private PrintWriter output;
    private byte overs;
    private short pixheight;
    private short pixwidth;
    private short points;
    private int psext;
    private int res1;
    private int res2;
    private short type;
    private byte uline;
    private short verres;
    private short vers;
    private short weight;
    private short widthby;
    private short xheight;

    private Pfm2afm(RandomAccessFileOrArray input, OutputStream output) throws IOException {
        this.input = input;
        this.output = FileUtil.createPrintWriter(output, "ISO-8859-1");
    }

    public static void convert(RandomAccessFileOrArray input, OutputStream output) throws IOException {
        Pfm2afm p = new Pfm2afm(input, output);
        p.openpfm();
        p.putheader();
        p.putchartab();
        p.putkerntab();
        p.puttrailer();
        p.output.flush();
    }

    private String readString(int n) throws IOException {
        byte[] b = new byte[n];
        this.input.readFully(b);
        int k = 0;
        while (k < b.length && b[k] != 0) {
            k++;
        }
        return new String(b, 0, k, "ISO-8859-1");
    }

    private String readString() throws IOException {
        StringBuilder buf = new StringBuilder();
        while (true) {
            int c = this.input.read();
            if (c > 0) {
                buf.append((char) c);
            } else {
                return buf.toString();
            }
        }
    }

    private void outval(int n) {
        this.output.print(' ');
        this.output.print(n);
    }

    private void outchar(int code, int width, String name) {
        this.output.print("C ");
        outval(code);
        this.output.print(" ; WX ");
        outval(width);
        if (name != null) {
            this.output.print(" ; N ");
            this.output.print(name);
        }
        this.output.print(" ;\n");
    }

    private void openpfm() throws IOException {
        this.input.seek(0L);
        this.vers = this.input.readShortLE();
        this.h_len = this.input.readIntLE();
        this.copyright = readString(60);
        this.type = this.input.readShortLE();
        this.points = this.input.readShortLE();
        this.verres = this.input.readShortLE();
        this.horres = this.input.readShortLE();
        this.ascent = this.input.readShortLE();
        this.intleading = this.input.readShortLE();
        this.extleading = this.input.readShortLE();
        this.italic = (byte) this.input.read();
        this.uline = (byte) this.input.read();
        this.overs = (byte) this.input.read();
        this.weight = this.input.readShortLE();
        this.charset = (byte) this.input.read();
        this.pixwidth = this.input.readShortLE();
        this.pixheight = this.input.readShortLE();
        this.kind = (byte) this.input.read();
        this.avgwidth = this.input.readShortLE();
        this.maxwidth = this.input.readShortLE();
        this.firstchar = this.input.read();
        this.lastchar = this.input.read();
        this.defchar = (byte) this.input.read();
        this.brkchar = (byte) this.input.read();
        this.widthby = this.input.readShortLE();
        this.device = this.input.readIntLE();
        this.face = this.input.readIntLE();
        this.bits = this.input.readIntLE();
        this.bitoff = this.input.readIntLE();
        this.extlen = this.input.readShortLE();
        this.psext = this.input.readIntLE();
        this.chartab = this.input.readIntLE();
        this.res1 = this.input.readIntLE();
        this.kernpairs = this.input.readIntLE();
        this.res2 = this.input.readIntLE();
        this.fontname = this.input.readIntLE();
        if (this.h_len != this.input.length() || this.extlen != 30 || this.fontname < 75 || this.fontname > 1024) {
            throw new IOException("not.a.valid.pfm.file");
        }
        this.input.seek(this.psext + 14);
        this.capheight = this.input.readShortLE();
        this.xheight = this.input.readShortLE();
        this.ascender = this.input.readShortLE();
        this.descender = this.input.readShortLE();
    }

    private void putheader() throws IOException {
        this.output.print("StartFontMetrics 2.0\n");
        if (this.copyright.length() > 0) {
            this.output.print("Comment " + this.copyright + '\n');
        }
        this.output.print("FontName ");
        this.input.seek(this.fontname);
        String fname = readString();
        this.output.print(fname);
        this.output.print("\nEncodingScheme ");
        byte b = this.charset;
        PrintWriter printWriter = this.output;
        if (b != 0) {
            printWriter.print("FontSpecific\n");
        } else {
            printWriter.print("AdobeStandardEncoding\n");
        }
        this.output.print("FullName " + fname.replace('-', ' '));
        if (this.face != 0) {
            this.input.seek(this.face);
            this.output.print("\nFamilyName " + readString());
        }
        this.output.print("\nWeight ");
        if (this.weight > 475 || fname.toLowerCase().contains("bold")) {
            this.output.print("Bold");
        } else if ((this.weight < 325 && this.weight != 0) || fname.toLowerCase().contains("light")) {
            this.output.print("Light");
        } else {
            boolean contains = fname.toLowerCase().contains("black");
            PrintWriter printWriter2 = this.output;
            if (contains) {
                printWriter2.print("Black");
            } else {
                printWriter2.print("Medium");
            }
        }
        this.output.print("\nItalicAngle ");
        if (this.italic != 0 || fname.toLowerCase().contains("italic")) {
            this.output.print("-12.00");
        } else {
            this.output.print("0");
        }
        this.output.print("\nIsFixedPitch ");
        if ((this.kind & 1) == 0 || this.avgwidth == this.maxwidth) {
            this.output.print("true");
            this.isMono = true;
        } else {
            this.output.print("false");
            this.isMono = false;
        }
        this.output.print("\nFontBBox");
        if (this.isMono) {
            outval(-20);
        } else {
            outval(-100);
        }
        outval(-(this.descender + 5));
        outval(this.maxwidth + 10);
        outval(this.ascent + 5);
        this.output.print("\nCapHeight");
        outval(this.capheight);
        this.output.print("\nXHeight");
        outval(this.xheight);
        this.output.print("\nDescender");
        outval(-this.descender);
        this.output.print("\nAscender");
        outval(this.ascender);
        this.output.print('\n');
    }

    private void putchartab() throws IOException {
        int count = (this.lastchar - this.firstchar) + 1;
        int[] ctabs = new int[count];
        this.input.seek(this.chartab);
        for (int k = 0; k < count; k++) {
            ctabs[k] = this.input.readUnsignedShortLE();
        }
        int[] back = new int[256];
        if (this.charset == 0) {
            for (int i = this.firstchar; i <= this.lastchar; i++) {
                if (this.Win2PSStd[i] != 0) {
                    back[this.Win2PSStd[i]] = i;
                }
            }
        }
        this.output.print("StartCharMetrics");
        outval(count);
        this.output.print('\n');
        if (this.charset != 0) {
            for (int i2 = this.firstchar; i2 <= this.lastchar; i2++) {
                if (ctabs[i2 - this.firstchar] != 0) {
                    outchar(i2, ctabs[i2 - this.firstchar], null);
                }
            }
        } else {
            for (int i3 = 0; i3 < 256; i3++) {
                int j = back[i3];
                if (j != 0) {
                    outchar(i3, ctabs[j - this.firstchar], this.WinChars[j]);
                    ctabs[j - this.firstchar] = 0;
                }
            }
            for (int i4 = this.firstchar; i4 <= this.lastchar; i4++) {
                if (ctabs[i4 - this.firstchar] != 0) {
                    outchar(-1, ctabs[i4 - this.firstchar], this.WinChars[i4]);
                }
            }
        }
        this.output.print("EndCharMetrics\n");
    }

    private void putkerntab() throws IOException {
        if (this.kernpairs == 0) {
            return;
        }
        this.input.seek(this.kernpairs);
        int count = this.input.readUnsignedShortLE();
        int nzero = 0;
        int[] kerns = new int[count * 3];
        int k = 0;
        while (k < kerns.length) {
            int k2 = k + 1;
            kerns[k] = this.input.read();
            int k3 = k2 + 1;
            kerns[k2] = this.input.read();
            int k4 = k3 + 1;
            short readShortLE = this.input.readShortLE();
            kerns[k3] = readShortLE;
            if (readShortLE == 0) {
                k = k4;
            } else {
                nzero++;
                k = k4;
            }
        }
        if (nzero == 0) {
            return;
        }
        this.output.print("StartKernData\nStartKernPairs");
        outval(nzero);
        this.output.print('\n');
        for (int k5 = 0; k5 < kerns.length; k5 += 3) {
            if (kerns[k5 + 2] != 0) {
                this.output.print("KPX ");
                this.output.print(this.WinChars[kerns[k5]]);
                this.output.print(' ');
                this.output.print(this.WinChars[kerns[k5 + 1]]);
                outval(kerns[k5 + 2]);
                this.output.print('\n');
            }
        }
        this.output.print("EndKernPairs\nEndKernData\n");
    }

    private void puttrailer() {
        this.output.print("EndFontMetrics\n");
    }
}
