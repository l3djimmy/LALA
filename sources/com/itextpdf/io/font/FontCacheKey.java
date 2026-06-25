package com.itextpdf.io.font;

import java.util.Arrays;
/* loaded from: classes12.dex */
public abstract class FontCacheKey {
    public static FontCacheKey create(String fontName) {
        return new FontCacheStringKey(fontName);
    }

    public static FontCacheKey create(String fontName, int ttcIndex) {
        return new FontCacheTtcKey(fontName, ttcIndex);
    }

    public static FontCacheKey create(byte[] fontProgram) {
        return new FontCacheBytesKey(fontProgram);
    }

    public static FontCacheKey create(byte[] fontProgram, int ttcIndex) {
        return new FontCacheTtcKey(fontProgram, ttcIndex);
    }

    /* loaded from: classes12.dex */
    private static class FontCacheStringKey extends FontCacheKey {
        private String fontName;

        FontCacheStringKey(String fontName) {
            this.fontName = fontName;
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (o == null || getClass() != o.getClass()) {
                return false;
            }
            FontCacheStringKey that = (FontCacheStringKey) o;
            if (this.fontName != null) {
                return this.fontName.equals(that.fontName);
            }
            if (that.fontName == null) {
                return true;
            }
            return false;
        }

        public int hashCode() {
            if (this.fontName != null) {
                return this.fontName.hashCode();
            }
            return 0;
        }
    }

    /* loaded from: classes12.dex */
    private static class FontCacheBytesKey extends FontCacheKey {
        private byte[] firstFontBytes;
        private int fontLength;
        private int hashcode;

        FontCacheBytesKey(byte[] fontBytes) {
            if (fontBytes != null) {
                this.firstFontBytes = fontBytes.length > 10000 ? Arrays.copyOf(fontBytes, 10000) : fontBytes;
                this.fontLength = fontBytes.length;
            }
            int maxBytesNum = calcHashCode();
            this.hashcode = maxBytesNum;
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (o == null || getClass() != o.getClass()) {
                return false;
            }
            FontCacheBytesKey that = (FontCacheBytesKey) o;
            if (this.fontLength != that.fontLength) {
                return false;
            }
            return Arrays.equals(this.firstFontBytes, that.firstFontBytes);
        }

        public int hashCode() {
            return this.hashcode;
        }

        private int calcHashCode() {
            int result = Arrays.hashCode(this.firstFontBytes);
            return (result * 31) + this.fontLength;
        }
    }

    /* loaded from: classes12.dex */
    private static class FontCacheTtcKey extends FontCacheKey {
        private int ttcIndex;
        private FontCacheKey ttcKey;

        FontCacheTtcKey(String fontName, int ttcIndex) {
            this.ttcKey = new FontCacheStringKey(fontName);
            this.ttcIndex = ttcIndex;
        }

        FontCacheTtcKey(byte[] fontBytes, int ttcIndex) {
            this.ttcKey = new FontCacheBytesKey(fontBytes);
            this.ttcIndex = ttcIndex;
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (o == null || getClass() != o.getClass()) {
                return false;
            }
            FontCacheTtcKey that = (FontCacheTtcKey) o;
            if (this.ttcIndex != that.ttcIndex) {
                return false;
            }
            return this.ttcKey.equals(that.ttcKey);
        }

        public int hashCode() {
            int result = this.ttcKey.hashCode();
            return (result * 31) + this.ttcIndex;
        }
    }
}
