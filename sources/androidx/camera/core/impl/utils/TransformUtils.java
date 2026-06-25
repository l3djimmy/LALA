package androidx.camera.core.impl.utils;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.Size;
import android.util.SizeF;
import androidx.core.util.Preconditions;
import java.util.Locale;
/* loaded from: classes.dex */
public class TransformUtils {
    public static final RectF NORMALIZED_RECT = new RectF(-1.0f, -1.0f, 1.0f, 1.0f);

    private TransformUtils() {
    }

    public static Size rectToSize(Rect rect) {
        return new Size(rect.width(), rect.height());
    }

    public static String rectToString(Rect rect) {
        return String.format(Locale.US, "%s(%dx%d)", rect, Integer.valueOf(rect.width()), Integer.valueOf(rect.height()));
    }

    public static Rect sizeToRect(Size size) {
        return sizeToRect(size, 0, 0);
    }

    public static Rect sizeToRect(Size size, int left, int top) {
        return new Rect(left, top, size.getWidth() + left, size.getHeight() + top);
    }

    public static boolean hasCropping(Rect cropRect, Size size) {
        return (cropRect.left == 0 && cropRect.top == 0 && cropRect.width() == size.getWidth() && cropRect.height() == size.getHeight()) ? false : true;
    }

    public static RectF sizeToRectF(Size size) {
        return sizeToRectF(size, 0, 0);
    }

    public static RectF sizeToRectF(Size size, int left, int top) {
        return new RectF(left, top, size.getWidth() + left, size.getHeight() + top);
    }

    public static Size reverseSize(Size size) {
        return new Size(size.getHeight(), size.getWidth());
    }

    public static SizeF reverseSizeF(SizeF sizeF) {
        return new SizeF(sizeF.getHeight(), sizeF.getWidth());
    }

    public static Size rotateSize(Size size, int rotationDegrees) {
        Preconditions.checkArgument(rotationDegrees % 90 == 0, "Invalid rotation degrees: " + rotationDegrees);
        return is90or270(within360(rotationDegrees)) ? reverseSize(size) : size;
    }

    public static RectF rotateRect(RectF rect, int rotationDegrees) {
        Preconditions.checkArgument(rotationDegrees % 90 == 0, "Invalid rotation degrees: " + rotationDegrees);
        if (is90or270(within360(rotationDegrees))) {
            return new RectF(0.0f, 0.0f, rect.height(), rect.width());
        }
        return rect;
    }

    public static Size getRotatedSize(Rect cropRect, int rotationDegrees) {
        return rotateSize(rectToSize(cropRect), rotationDegrees);
    }

    public static int within360(int degrees) {
        return ((degrees % 360) + 360) % 360;
    }

    public static RectF verticesToRect(float[] vertices) {
        return new RectF(min(vertices[0], vertices[2], vertices[4], vertices[6]), min(vertices[1], vertices[3], vertices[5], vertices[7]), max(vertices[0], vertices[2], vertices[4], vertices[6]), max(vertices[1], vertices[3], vertices[5], vertices[7]));
    }

    public static float max(float value1, float value2, float value3, float value4) {
        return Math.max(Math.max(value1, value2), Math.max(value3, value4));
    }

    public static float min(float value1, float value2, float value3, float value4) {
        return Math.min(Math.min(value1, value2), Math.min(value3, value4));
    }

    public static boolean is90or270(int rotationDegrees) {
        if (rotationDegrees == 90 || rotationDegrees == 270) {
            return true;
        }
        if (rotationDegrees == 0 || rotationDegrees == 180) {
            return false;
        }
        throw new IllegalArgumentException("Invalid rotation degrees: " + rotationDegrees);
    }

    public static float[] sizeToVertices(Size size) {
        return new float[]{0.0f, 0.0f, size.getWidth(), 0.0f, size.getWidth(), size.getHeight(), 0.0f, size.getHeight()};
    }

    public static float[] rectToVertices(RectF rectF) {
        return new float[]{rectF.left, rectF.top, rectF.right, rectF.top, rectF.right, rectF.bottom, rectF.left, rectF.bottom};
    }

    public static boolean isAspectRatioMatchingWithRoundingError(Size size1, Size size2) {
        return isAspectRatioMatchingWithRoundingError(size1, false, size2, false);
    }

    public static boolean isAspectRatioMatchingWithRoundingError(Size size1, boolean isAccurate1, Size size2, boolean isAccurate2) {
        float ratio1UpperBound;
        float ratio1LowerBound;
        float ratio2UpperBound;
        float ratio2UpperBound2;
        if (!isAccurate1) {
            ratio1UpperBound = (size1.getWidth() + 1.0f) / (size1.getHeight() - 1.0f);
            ratio1LowerBound = (size1.getWidth() - 1.0f) / (size1.getHeight() + 1.0f);
        } else {
            ratio1UpperBound = size1.getWidth() / size1.getHeight();
            ratio1LowerBound = ratio1UpperBound;
        }
        if (!isAccurate2) {
            float ratio2UpperBound3 = (size2.getWidth() + 1.0f) / (size2.getHeight() - 1.0f);
            ratio2UpperBound = (size2.getWidth() - 1.0f) / (size2.getHeight() + 1.0f);
            ratio2UpperBound2 = ratio2UpperBound3;
        } else {
            ratio2UpperBound2 = size2.getWidth() / size2.getHeight();
            ratio2UpperBound = ratio2UpperBound2;
        }
        return ratio1UpperBound >= ratio2UpperBound && ratio2UpperBound2 >= ratio1LowerBound;
    }

    public static Matrix getRectToRect(RectF source, RectF target, int rotationDegrees) {
        return getRectToRect(source, target, rotationDegrees, false);
    }

    public static Matrix getRectToRect(RectF source, RectF target, int rotationDegrees, boolean mirroring) {
        Matrix matrix = new Matrix();
        matrix.setRectToRect(source, NORMALIZED_RECT, Matrix.ScaleToFit.FILL);
        matrix.postRotate(rotationDegrees);
        if (mirroring) {
            matrix.postScale(-1.0f, 1.0f);
        }
        matrix.postConcat(getNormalizedToBuffer(target));
        return matrix;
    }

    public static Matrix getNormalizedToBuffer(Rect viewPortRect) {
        return getNormalizedToBuffer(new RectF(viewPortRect));
    }

    public static Matrix updateSensorToBufferTransform(Matrix original, Rect cropRect) {
        Matrix matrix = new Matrix(original);
        matrix.postTranslate(-cropRect.left, -cropRect.top);
        return matrix;
    }

    public static Matrix getNormalizedToBuffer(RectF viewPortRect) {
        Matrix normalizedToBuffer = new Matrix();
        normalizedToBuffer.setRectToRect(NORMALIZED_RECT, viewPortRect, Matrix.ScaleToFit.FILL);
        return normalizedToBuffer;
    }

    public static Matrix getExifTransform(int exifOrientation, int width, int height) {
        Matrix matrix = new Matrix();
        RectF rect = new RectF(0.0f, 0.0f, width, height);
        matrix.setRectToRect(rect, NORMALIZED_RECT, Matrix.ScaleToFit.FILL);
        boolean isWidthHeightSwapped = false;
        switch (exifOrientation) {
            case 2:
                matrix.postScale(-1.0f, 1.0f);
                break;
            case 3:
                matrix.postRotate(180.0f);
                break;
            case 4:
                matrix.postScale(1.0f, -1.0f);
                break;
            case 5:
                matrix.postScale(-1.0f, 1.0f);
                matrix.postRotate(270.0f);
                isWidthHeightSwapped = true;
                break;
            case 6:
                matrix.postRotate(90.0f);
                isWidthHeightSwapped = true;
                break;
            case 7:
                matrix.postScale(-1.0f, 1.0f);
                matrix.postRotate(90.0f);
                isWidthHeightSwapped = true;
                break;
            case 8:
                matrix.postRotate(270.0f);
                isWidthHeightSwapped = true;
                break;
        }
        RectF restoredRect = isWidthHeightSwapped ? new RectF(0.0f, 0.0f, height, width) : rect;
        Matrix restore = new Matrix();
        restore.setRectToRect(NORMALIZED_RECT, restoredRect, Matrix.ScaleToFit.FILL);
        matrix.postConcat(restore);
        return matrix;
    }
}
