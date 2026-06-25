package com.itextpdf.layout.font;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.font.FontCacheKey;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.FontProgramDescriptor;
import com.itextpdf.io.font.FontProgramDescriptorFactory;
import com.itextpdf.io.util.ArrayUtil;
import java.util.Arrays;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
/* loaded from: classes12.dex */
public final class FontInfo {
    private static final Map<FontCacheKey, FontProgramDescriptor> fontNamesCache = new ConcurrentHashMap();
    private final String alias;
    private final FontProgramDescriptor descriptor;
    private final String encoding;
    private final byte[] fontData;
    private final String fontName;
    private final int hash;
    private final Range range;

    private FontInfo(String fontName, byte[] fontData, String encoding, FontProgramDescriptor descriptor, Range unicodeRange, String alias) {
        this.fontName = fontName;
        this.fontData = fontData;
        this.encoding = encoding;
        this.descriptor = descriptor;
        this.range = unicodeRange != null ? unicodeRange : RangeBuilder.getFullRange();
        this.alias = alias != null ? alias.toLowerCase() : null;
        this.hash = calculateHashCode(this.fontName, this.fontData, this.encoding, this.range);
    }

    public static FontInfo create(FontInfo fontInfo, String alias, Range range) {
        return new FontInfo(fontInfo.fontName, fontInfo.fontData, fontInfo.encoding, fontInfo.descriptor, range, alias);
    }

    public static FontInfo create(FontInfo fontInfo, String alias) {
        return create(fontInfo, alias, (Range) null);
    }

    public static FontInfo create(FontProgram fontProgram, String encoding, String alias, Range range) {
        FontProgramDescriptor descriptor = FontProgramDescriptorFactory.fetchDescriptor(fontProgram);
        return new FontInfo(descriptor.getFontName(), null, encoding, descriptor, range, alias);
    }

    public static FontInfo create(FontProgram fontProgram, String encoding, String alias) {
        return create(fontProgram, encoding, alias, (Range) null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static FontInfo create(String fontName, String encoding, String alias, Range range) {
        FontProgramDescriptor descriptor;
        FontCacheKey cacheKey = FontCacheKey.create(fontName);
        FontProgramDescriptor descriptor2 = getFontNamesFromCache(cacheKey);
        if (descriptor2 != null) {
            descriptor = descriptor2;
        } else {
            FontProgramDescriptor descriptor3 = FontProgramDescriptorFactory.fetchDescriptor(fontName);
            putFontNamesToCache(cacheKey, descriptor3);
            descriptor = descriptor3;
        }
        if (descriptor != null) {
            return new FontInfo(fontName, null, encoding, descriptor, range, alias);
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static FontInfo create(byte[] fontProgram, String encoding, String alias, Range range) {
        FontProgramDescriptor descriptor;
        FontCacheKey cacheKey = FontCacheKey.create(fontProgram);
        FontProgramDescriptor descriptor2 = getFontNamesFromCache(cacheKey);
        if (descriptor2 != null) {
            descriptor = descriptor2;
        } else {
            FontProgramDescriptor descriptor3 = FontProgramDescriptorFactory.fetchDescriptor(fontProgram);
            putFontNamesToCache(cacheKey, descriptor3);
            descriptor = descriptor3;
        }
        if (descriptor != null) {
            return new FontInfo(null, fontProgram, encoding, descriptor, range, alias);
        }
        return null;
    }

    public FontProgramDescriptor getDescriptor() {
        return this.descriptor;
    }

    public Range getFontUnicodeRange() {
        return this.range;
    }

    public String getFontName() {
        return this.fontName;
    }

    public byte[] getFontData() {
        return this.fontData;
    }

    public String getEncoding() {
        return this.encoding;
    }

    public String getAlias() {
        return this.alias;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o instanceof FontInfo) {
            FontInfo that = (FontInfo) o;
            if (this.fontName == null ? that.fontName == null : this.fontName.equals(that.fontName)) {
                if (this.range.equals(that.range) && Arrays.equals(this.fontData, that.fontData)) {
                    if (this.encoding != null) {
                        if (this.encoding.equals(that.encoding)) {
                            return true;
                        }
                    } else if (that.encoding == null) {
                        return true;
                    }
                }
            }
            return false;
        }
        return false;
    }

    public int hashCode() {
        return this.hash;
    }

    public String toString() {
        String name = this.descriptor.getFontName();
        if (name.length() > 0) {
            if (this.encoding != null) {
                return MessageFormatUtil.format("{0}+{1}", name, this.encoding);
            }
            return name;
        }
        return super.toString();
    }

    private static int calculateHashCode(String fontName, byte[] bytes, String encoding, Range range) {
        int result = fontName != null ? fontName.hashCode() : 0;
        return (((((result * 31) + ArrayUtil.hashCode(bytes)) * 31) + (encoding != null ? encoding.hashCode() : 0)) * 31) + range.hashCode();
    }

    private static FontProgramDescriptor getFontNamesFromCache(FontCacheKey key) {
        return fontNamesCache.get(key);
    }

    private static void putFontNamesToCache(FontCacheKey key, FontProgramDescriptor descriptor) {
        if (descriptor != null) {
            fontNamesCache.put(key, descriptor);
        }
    }
}
