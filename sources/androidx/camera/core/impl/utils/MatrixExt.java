package androidx.camera.core.impl.utils;

import android.opengl.Matrix;
import java.util.Locale;
/* loaded from: classes.dex */
public final class MatrixExt {
    private static final float[] sTemp = new float[16];

    private MatrixExt() {
    }

    public static void setRotate(float[] matrix, float degrees, float px, float py) {
        Matrix.setIdentityM(matrix, 0);
        preRotate(matrix, degrees, px, py);
    }

    public static void preRotate(float[] matrix, float degrees, float px, float py) {
        normalize(matrix, px, py);
        Matrix.rotateM(matrix, 0, degrees, 0.0f, 0.0f, 1.0f);
        denormalize(matrix, px, py);
    }

    public static void postRotate(float[] matrix, float degrees, float px, float py) {
        Throwable th;
        synchronized (sTemp) {
            try {
                try {
                    Matrix.setIdentityM(sTemp, 0);
                    normalize(sTemp, px, py);
                } catch (Throwable th2) {
                    th = th2;
                }
                try {
                    Matrix.rotateM(sTemp, 0, degrees, 0.0f, 0.0f, 1.0f);
                    denormalize(sTemp, px, py);
                    Matrix.multiplyMM(matrix, 0, sTemp, 0, matrix, 0);
                } catch (Throwable th3) {
                    th = th3;
                    throw th;
                }
            } catch (Throwable th4) {
                th = th4;
            }
        }
    }

    public static void preVerticalFlip(float[] matrix, float y) {
        normalize(matrix, 0.0f, y);
        Matrix.scaleM(matrix, 0, 1.0f, -1.0f, 1.0f);
        denormalize(matrix, 0.0f, y);
    }

    public static String toString(float[] matrix, int offset) {
        return String.format(Locale.US, "Matrix:\n%2.1f %2.1f %2.1f %2.1f\n%2.1f %2.1f %2.1f %2.1f\n%2.1f %2.1f %2.1f %2.1f\n%2.1f %2.1f %2.1f %2.1f", Float.valueOf(matrix[offset]), Float.valueOf(matrix[offset + 4]), Float.valueOf(matrix[offset + 8]), Float.valueOf(matrix[offset + 12]), Float.valueOf(matrix[offset + 1]), Float.valueOf(matrix[offset + 5]), Float.valueOf(matrix[offset + 9]), Float.valueOf(matrix[offset + 13]), Float.valueOf(matrix[offset + 2]), Float.valueOf(matrix[offset + 6]), Float.valueOf(matrix[offset + 10]), Float.valueOf(matrix[offset + 14]), Float.valueOf(matrix[offset + 3]), Float.valueOf(matrix[offset + 7]), Float.valueOf(matrix[offset + 11]), Float.valueOf(matrix[offset + 15]));
    }

    private static void normalize(float[] matrix, float px, float py) {
        Matrix.translateM(matrix, 0, px, py, 0.0f);
    }

    private static void denormalize(float[] matrix, float px, float py) {
        Matrix.translateM(matrix, 0, -px, -py, 0.0f);
    }
}
