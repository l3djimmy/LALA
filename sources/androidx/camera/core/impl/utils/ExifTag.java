package androidx.camera.core.impl.utils;
/* loaded from: classes.dex */
class ExifTag {
    public final String name;
    public final int number;
    public final int primaryFormat;
    public final int secondaryFormat;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ExifTag(String name, int number, int format) {
        this.name = name;
        this.number = number;
        this.primaryFormat = format;
        this.secondaryFormat = -1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ExifTag(String name, int number, int primaryFormat, int secondaryFormat) {
        this.name = name;
        this.number = number;
        this.primaryFormat = primaryFormat;
        this.secondaryFormat = secondaryFormat;
    }

    boolean isFormatCompatible(int format) {
        if (this.primaryFormat == 7 || format == 7 || this.primaryFormat == format || this.secondaryFormat == format) {
            return true;
        }
        if ((this.primaryFormat == 4 || this.secondaryFormat == 4) && format == 3) {
            return true;
        }
        if ((this.primaryFormat == 9 || this.secondaryFormat == 9) && format == 8) {
            return true;
        }
        return (this.primaryFormat == 12 || this.secondaryFormat == 12) && format == 11;
    }
}
