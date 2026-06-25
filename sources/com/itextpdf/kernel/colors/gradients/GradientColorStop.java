package com.itextpdf.kernel.colors.gradients;

import androidx.camera.video.AudioStats;
import java.util.Arrays;
import java.util.Objects;
/* loaded from: classes12.dex */
public class GradientColorStop {
    private double hintOffset;
    private HintOffsetType hintOffsetType;
    private double offset;
    private OffsetType offsetType;
    private final float opacity;
    private final float[] rgb;

    /* loaded from: classes12.dex */
    public enum HintOffsetType {
        ABSOLUTE_ON_GRADIENT,
        RELATIVE_ON_GRADIENT,
        RELATIVE_BETWEEN_COLORS,
        NONE
    }

    /* loaded from: classes12.dex */
    public enum OffsetType {
        ABSOLUTE,
        AUTO,
        RELATIVE
    }

    public GradientColorStop(float[] rgb) {
        this(rgb, 1.0f, AudioStats.AUDIO_AMPLITUDE_NONE, OffsetType.AUTO);
    }

    public GradientColorStop(float[] rgb, double offset, OffsetType offsetType) {
        this(rgb, 1.0f, offset, offsetType);
    }

    public GradientColorStop(GradientColorStop gradientColorStop, double offset, OffsetType offsetType) {
        this(gradientColorStop.getRgbArray(), gradientColorStop.getOpacity(), offset, offsetType);
    }

    private GradientColorStop(float[] rgb, float opacity, double offset, OffsetType offsetType) {
        this.hintOffset = AudioStats.AUDIO_AMPLITUDE_NONE;
        this.hintOffsetType = HintOffsetType.NONE;
        this.rgb = copyRgbArray(rgb);
        this.opacity = normalize(opacity);
        setOffset(offset, offsetType);
    }

    public float[] getRgbArray() {
        return copyRgbArray(this.rgb);
    }

    private float getOpacity() {
        return this.opacity;
    }

    public OffsetType getOffsetType() {
        return this.offsetType;
    }

    public double getOffset() {
        return this.offset;
    }

    public double getHintOffset() {
        return this.hintOffset;
    }

    public HintOffsetType getHintOffsetType() {
        return this.hintOffsetType;
    }

    public GradientColorStop setOffset(double offset, OffsetType offsetType) {
        this.offsetType = offsetType != null ? offsetType : OffsetType.AUTO;
        this.offset = this.offsetType != OffsetType.AUTO ? offset : AudioStats.AUDIO_AMPLITUDE_NONE;
        return this;
    }

    public GradientColorStop setHint(double hintOffset, HintOffsetType hintOffsetType) {
        this.hintOffsetType = hintOffsetType != null ? hintOffsetType : HintOffsetType.NONE;
        this.hintOffset = this.hintOffsetType != HintOffsetType.NONE ? hintOffset : AudioStats.AUDIO_AMPLITUDE_NONE;
        return this;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        GradientColorStop that = (GradientColorStop) o;
        if (Float.compare(that.opacity, this.opacity) == 0 && Double.compare(that.offset, this.offset) == 0 && Double.compare(that.hintOffset, this.hintOffset) == 0 && Arrays.equals(this.rgb, that.rgb) && this.offsetType == that.offsetType && this.hintOffsetType == that.hintOffsetType) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        int result = Objects.hash(Float.valueOf(this.opacity), Double.valueOf(this.offset), Double.valueOf(this.hintOffset));
        return (((((result * 31) + this.offsetType.hashCode()) * 31) + this.hintOffsetType.hashCode()) * 31) + Arrays.hashCode(this.rgb);
    }

    private static float normalize(float toNormalize) {
        if (toNormalize > 1.0f) {
            return 1.0f;
        }
        if (toNormalize > 0.0f) {
            return toNormalize;
        }
        return 0.0f;
    }

    private static float[] copyRgbArray(float[] toCopy) {
        if (toCopy == null || toCopy.length < 3) {
            return new float[]{0.0f, 0.0f, 0.0f};
        }
        return new float[]{normalize(toCopy[0]), normalize(toCopy[1]), normalize(toCopy[2])};
    }
}
