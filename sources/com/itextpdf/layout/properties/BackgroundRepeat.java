package com.itextpdf.layout.properties;

import androidx.camera.video.AudioStats;
import com.itextpdf.kernel.geom.Point;
import com.itextpdf.kernel.geom.Rectangle;
/* loaded from: classes12.dex */
public class BackgroundRepeat {
    private final BackgroundRepeatValue xAxisRepeat;
    private final BackgroundRepeatValue yAxisRepeat;

    /* loaded from: classes12.dex */
    public enum BackgroundRepeatValue {
        NO_REPEAT,
        REPEAT,
        ROUND,
        SPACE
    }

    public BackgroundRepeat() {
        this(BackgroundRepeatValue.REPEAT);
    }

    public BackgroundRepeat(BackgroundRepeatValue repeat) {
        this(repeat, repeat);
    }

    public BackgroundRepeat(BackgroundRepeatValue xAxisRepeat, BackgroundRepeatValue yAxisRepeat) {
        this.xAxisRepeat = xAxisRepeat;
        this.yAxisRepeat = yAxisRepeat;
    }

    public BackgroundRepeatValue getXAxisRepeat() {
        return this.xAxisRepeat;
    }

    public BackgroundRepeatValue getYAxisRepeat() {
        return this.yAxisRepeat;
    }

    public boolean isNoRepeatOnXAxis() {
        return this.xAxisRepeat == BackgroundRepeatValue.NO_REPEAT;
    }

    public boolean isNoRepeatOnYAxis() {
        return this.yAxisRepeat == BackgroundRepeatValue.NO_REPEAT;
    }

    public Point prepareRectangleToDrawingAndGetWhitespace(Rectangle imageRectangle, Rectangle backgroundArea, BackgroundSize backgroundSize) {
        if (BackgroundRepeatValue.ROUND == this.xAxisRepeat) {
            int ratio = calculateRatio(backgroundArea.getWidth(), imageRectangle.getWidth());
            float initialImageRatio = imageRectangle.getHeight() / imageRectangle.getWidth();
            imageRectangle.setWidth(backgroundArea.getWidth() / ratio);
            if (BackgroundRepeatValue.ROUND != this.yAxisRepeat && backgroundSize.getBackgroundHeightSize() == null) {
                imageRectangle.moveUp(imageRectangle.getHeight() - (imageRectangle.getWidth() * initialImageRatio));
                imageRectangle.setHeight(imageRectangle.getWidth() * initialImageRatio);
            }
        }
        if (BackgroundRepeatValue.ROUND == this.yAxisRepeat) {
            int ratio2 = calculateRatio(backgroundArea.getHeight(), imageRectangle.getHeight());
            float initialImageRatio2 = imageRectangle.getWidth() / imageRectangle.getHeight();
            imageRectangle.moveUp(imageRectangle.getHeight() - (backgroundArea.getHeight() / ratio2));
            imageRectangle.setHeight(backgroundArea.getHeight() / ratio2);
            if (BackgroundRepeatValue.ROUND != this.xAxisRepeat && backgroundSize.getBackgroundWidthSize() == null) {
                imageRectangle.setWidth(imageRectangle.getHeight() * initialImageRatio2);
            }
        }
        return processSpaceValueAndCalculateWhitespace(imageRectangle, backgroundArea);
    }

    private Point processSpaceValueAndCalculateWhitespace(Rectangle imageRectangle, Rectangle backgroundArea) {
        Point whitespace = new Point();
        if (BackgroundRepeatValue.SPACE == this.xAxisRepeat) {
            if (imageRectangle.getWidth() * 2.0f <= backgroundArea.getWidth()) {
                imageRectangle.setX(backgroundArea.getX());
                whitespace.setLocation(calculateWhitespace(backgroundArea.getWidth(), imageRectangle.getWidth()), AudioStats.AUDIO_AMPLITUDE_NONE);
            } else {
                float rightSpace = backgroundArea.getRight() - imageRectangle.getRight();
                float leftSpace = imageRectangle.getLeft() - backgroundArea.getLeft();
                float xWhitespace = Math.max(rightSpace, leftSpace);
                whitespace.setLocation(xWhitespace > 0.0f ? xWhitespace : 0.0f, AudioStats.AUDIO_AMPLITUDE_NONE);
            }
        }
        if (BackgroundRepeatValue.SPACE == this.yAxisRepeat) {
            if (imageRectangle.getHeight() * 2.0f <= backgroundArea.getHeight()) {
                imageRectangle.setY((backgroundArea.getY() + backgroundArea.getHeight()) - imageRectangle.getHeight());
                whitespace.setLocation(whitespace.getX(), calculateWhitespace(backgroundArea.getHeight(), imageRectangle.getHeight()));
            } else {
                float topSpace = backgroundArea.getTop() - imageRectangle.getTop();
                float bottomSpace = imageRectangle.getBottom() - backgroundArea.getBottom();
                float yWhitespace = Math.max(topSpace, bottomSpace);
                whitespace.setLocation(whitespace.getX(), yWhitespace > 0.0f ? yWhitespace : 0.0f);
            }
        }
        return whitespace;
    }

    private static int calculateRatio(float areaSize, float backgroundSize) {
        int ratio = (int) Math.floor(areaSize / backgroundSize);
        float remainSpace = areaSize - (ratio * backgroundSize);
        if (remainSpace >= backgroundSize / 2.0f) {
            ratio++;
        }
        if (ratio == 0) {
            return 1;
        }
        return ratio;
    }

    private static float calculateWhitespace(float areaSize, float backgroundSize) {
        int ratio = (int) Math.floor(areaSize / backgroundSize);
        if (ratio <= 0) {
            return 0.0f;
        }
        float whitespace = areaSize - (ratio * backgroundSize);
        if (ratio > 1) {
            return whitespace / (ratio - 1);
        }
        return whitespace;
    }
}
