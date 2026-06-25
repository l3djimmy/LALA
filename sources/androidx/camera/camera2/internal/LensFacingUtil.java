package androidx.camera.camera2.internal;
/* loaded from: classes.dex */
public class LensFacingUtil {
    private LensFacingUtil() {
    }

    public static int getCameraSelectorLensFacing(int lensFacingInteger) {
        switch (lensFacingInteger) {
            case 0:
                return 0;
            case 1:
                return 1;
            case 2:
                return 2;
            default:
                throw new IllegalArgumentException("The given lens facing integer: " + lensFacingInteger + " can not be recognized.");
        }
    }

    public static int getLensFacingInt(int lensFacing) {
        switch (lensFacing) {
            case 0:
                return 0;
            case 1:
                return 1;
            case 2:
                return 2;
            default:
                throw new IllegalArgumentException("The given lens facing: " + lensFacing + " can not be recognized.");
        }
    }
}
