package com.itextpdf.layout.font;

import com.itextpdf.commons.utils.FileUtil;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.font.Type3Font;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicLong;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public final class FontSet {
    private static final AtomicLong lastId = new AtomicLong();
    private final Set<FontInfo> fonts = new LinkedHashSet();
    private final Map<FontInfo, FontProgram> fontPrograms = new HashMap();
    private final long id = lastId.incrementAndGet();

    public int addDirectory(String dir, boolean scanSubdirectories) {
        String suffix;
        int count = 0;
        String[] files = FileUtil.listFilesInDirectory(dir, scanSubdirectories);
        if (files == null) {
            return 0;
        }
        for (String file : files) {
            try {
                suffix = file.length() < 4 ? null : file.substring(file.length() - 4).toLowerCase();
            } catch (Exception e) {
            }
            if (!".afm".equals(suffix) && !".pfm".equals(suffix)) {
                if ((".ttf".equals(suffix) || ".otf".equals(suffix) || ".ttc".equals(suffix)) && addFont(file)) {
                    count++;
                }
            }
            String pfb = file.substring(0, file.length() - 4) + ".pfb";
            if (FileUtil.fileExists(pfb) && addFont(file)) {
                count++;
            }
        }
        return count;
    }

    public int addDirectory(String dir) {
        return addDirectory(dir, false);
    }

    public boolean addFont(FontProgram fontProgram, String encoding, String alias, Range unicodeRange) {
        if (fontProgram == null) {
            return false;
        }
        if (fontProgram instanceof Type3Font) {
            Logger logger = LoggerFactory.getLogger(FontSet.class);
            logger.error(IoLogMessageConstant.TYPE3_FONT_CANNOT_BE_ADDED);
            return false;
        }
        FontInfo fi = FontInfo.create(fontProgram, encoding, alias, unicodeRange);
        if (!addFont(fi)) {
            return false;
        }
        this.fontPrograms.put(fi, fontProgram);
        return true;
    }

    public boolean addFont(FontProgram fontProgram, String encoding, String alias) {
        return addFont(fontProgram, encoding, alias, (Range) null);
    }

    public boolean addFont(FontProgram fontProgram, String encoding) {
        return addFont(fontProgram, encoding, (String) null);
    }

    public boolean addFont(String fontPath, String encoding, String alias, Range unicodeRange) {
        return addFont(FontInfo.create(fontPath, encoding, alias, unicodeRange));
    }

    public boolean addFont(String fontPath, String encoding, String alias) {
        return addFont(fontPath, encoding, alias, (Range) null);
    }

    public boolean addFont(String fontPath, String encoding) {
        return addFont(FontInfo.create(fontPath, encoding, (String) null, (Range) null));
    }

    public boolean addFont(byte[] fontData, String encoding, String alias, Range unicodeRange) {
        return addFont(FontInfo.create(fontData, encoding, alias, unicodeRange));
    }

    public boolean addFont(byte[] fontData, String encoding, String alias) {
        return addFont(fontData, encoding, alias, (Range) null);
    }

    public boolean addFont(byte[] fontData, String encoding) {
        return addFont(FontInfo.create(fontData, encoding, (String) null, (Range) null));
    }

    public boolean addFont(String fontPath) {
        return addFont(fontPath, (String) null, (String) null);
    }

    public boolean addFont(byte[] fontData) {
        return addFont(fontData, (String) null, (String) null);
    }

    public boolean addFont(FontInfo fontInfo, String alias, Range unicodeRange) {
        return addFont(FontInfo.create(fontInfo, alias, unicodeRange));
    }

    public boolean addFont(FontInfo fontInfo, String alias) {
        return addFont(fontInfo, alias, (Range) null);
    }

    public final boolean addFont(FontInfo fontInfo) {
        if (fontInfo != null && !this.fonts.contains(fontInfo)) {
            this.fonts.add(fontInfo);
            return true;
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean contains(java.lang.String r5) {
        /*
            r4 = this;
            r0 = 0
            if (r5 == 0) goto L43
            int r1 = r5.length()
            if (r1 != 0) goto La
            goto L43
        La:
            java.lang.String r5 = r5.toLowerCase()
            java.util.Collection r1 = r4.getFonts()
            java.util.Iterator r1 = r1.iterator()
        L16:
            boolean r2 = r1.hasNext()
            if (r2 == 0) goto L42
            java.lang.Object r2 = r1.next()
            com.itextpdf.layout.font.FontInfo r2 = (com.itextpdf.layout.font.FontInfo) r2
            com.itextpdf.io.font.FontProgramDescriptor r3 = r2.getDescriptor()
            java.lang.String r3 = r3.getFullNameLowerCase()
            boolean r3 = r5.equals(r3)
            if (r3 != 0) goto L40
            com.itextpdf.io.font.FontProgramDescriptor r3 = r2.getDescriptor()
            java.lang.String r3 = r3.getFontNameLowerCase()
            boolean r3 = r5.equals(r3)
            if (r3 == 0) goto L3f
            goto L40
        L3f:
            goto L16
        L40:
            r0 = 1
            return r0
        L42:
            return r0
        L43:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.layout.font.FontSet.contains(java.lang.String):boolean");
    }

    public Collection<FontInfo> get(String fontName) {
        if (fontName == null || fontName.length() == 0) {
            return Collections.emptyList();
        }
        String fontName2 = fontName.toLowerCase();
        List<FontInfo> list = new ArrayList<>();
        for (FontInfo fi : getFonts()) {
            if (fontName2.equals(fi.getDescriptor().getFullNameLowerCase()) || fontName2.equals(fi.getDescriptor().getFontNameLowerCase())) {
                list.add(fi);
            }
        }
        return list;
    }

    public Collection<FontInfo> getFonts() {
        return getFonts(null);
    }

    public Collection<FontInfo> getFonts(FontSet additionalFonts) {
        return new FontSetCollection(this.fonts, additionalFonts != null ? additionalFonts.fonts : null);
    }

    public boolean isEmpty() {
        return size() == 0;
    }

    public int size() {
        return this.fonts.size();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long getId() {
        return this.id;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public FontProgram getFontProgram(FontInfo fontInfo) {
        return this.fontPrograms.get(fontInfo);
    }
}
