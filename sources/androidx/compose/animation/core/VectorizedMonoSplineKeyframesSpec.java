package androidx.compose.animation.core;

import androidx.collection.IntList;
import androidx.collection.IntObjectMap;
import androidx.compose.animation.core.AnimationVector;
import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: VectorizedMonoSplineKeyframesSpec.kt */
@Metadata(d1 = {"\u0000Z\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0014\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\b\t\n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0002\b\u0002\b\u0000\u0018\u0000*\b\b\u0000\u0010\u0001*\u00020\u00022\b\u0012\u0004\u0012\u0002H\u00010\u0003B?\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0018\u0010\u0006\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\t0\b0\u0007\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\u0006\u0010\f\u001a\u00020\u000b\u0012\u0006\u0010\r\u001a\u00020\u000e¢\u0006\u0002\u0010\u000fJ\u0010\u0010\u001f\u001a\u00020\u000b2\u0006\u0010 \u001a\u00020\u000bH\u0002J\u0018\u0010!\u001a\u00020\u000e2\u0006\u0010\"\u001a\u00020\u000b2\u0006\u0010 \u001a\u00020\u000bH\u0002J\u0010\u0010#\u001a\u00020\t2\u0006\u0010\"\u001a\u00020\u000bH\u0002J-\u0010$\u001a\u00028\u00002\u0006\u0010%\u001a\u00020&2\u0006\u0010'\u001a\u00028\u00002\u0006\u0010(\u001a\u00028\u00002\u0006\u0010)\u001a\u00028\u0000H\u0016¢\u0006\u0002\u0010*J-\u0010+\u001a\u00028\u00002\u0006\u0010%\u001a\u00020&2\u0006\u0010'\u001a\u00028\u00002\u0006\u0010(\u001a\u00028\u00002\u0006\u0010)\u001a\u00028\u0000H\u0016¢\u0006\u0002\u0010*J%\u0010,\u001a\u00020-2\u0006\u0010'\u001a\u00028\u00002\u0006\u0010(\u001a\u00028\u00002\u0006\u0010)\u001a\u00028\u0000H\u0002¢\u0006\u0002\u0010.R\u0014\u0010\f\u001a\u00020\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0014\u0010\n\u001a\u00020\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0011R \u0010\u0006\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\t0\b0\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u0012\u0010\u0013\u001a\u0004\u0018\u00018\u0000X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u0014R\u0012\u0010\u0015\u001a\u0004\u0018\u00018\u0000X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u0014R\u0010\u0010\u0016\u001a\u0004\u0018\u00010\u0017X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0019X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0012\u0010\u001a\u001a\u0004\u0018\u00018\u0000X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u0014R\u0018\u0010\u001b\u001a\n\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u001cX\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u001dR\u0012\u0010\u001e\u001a\u0004\u0018\u00018\u0000X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u0014¨\u0006/"}, d2 = {"Landroidx/compose/animation/core/VectorizedMonoSplineKeyframesSpec;", ExifInterface.GPS_MEASUREMENT_INTERRUPTED, "Landroidx/compose/animation/core/AnimationVector;", "Landroidx/compose/animation/core/VectorizedDurationBasedAnimationSpec;", "timestamps", "Landroidx/collection/IntList;", "keyframes", "Landroidx/collection/IntObjectMap;", "Lkotlin/Pair;", "Landroidx/compose/animation/core/Easing;", "durationMillis", "", "delayMillis", "periodicBias", "", "(Landroidx/collection/IntList;Landroidx/collection/IntObjectMap;IIF)V", "getDelayMillis", "()I", "getDurationMillis", "lastInitialValue", "Landroidx/compose/animation/core/AnimationVector;", "lastTargetValue", "monoSpline", "Landroidx/compose/animation/core/MonoSpline;", "times", "", "valueVector", "values", "", "[[F", "velocityVector", "findEntryForTimeMillis", "timeMillis", "getEasedTimeFromIndex", "index", "getEasing", "getValueFromNanos", "playTimeNanos", "", "initialValue", "targetValue", "initialVelocity", "(JLandroidx/compose/animation/core/AnimationVector;Landroidx/compose/animation/core/AnimationVector;Landroidx/compose/animation/core/AnimationVector;)Landroidx/compose/animation/core/AnimationVector;", "getVelocityFromNanos", "init", "", "(Landroidx/compose/animation/core/AnimationVector;Landroidx/compose/animation/core/AnimationVector;Landroidx/compose/animation/core/AnimationVector;)V", "animation-core_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class VectorizedMonoSplineKeyframesSpec<V extends AnimationVector> implements VectorizedDurationBasedAnimationSpec<V> {
    public static final int $stable = 8;
    private final int delayMillis;
    private final int durationMillis;
    private final IntObjectMap<Pair<V, Easing>> keyframes;
    private V lastInitialValue;
    private V lastTargetValue;
    private MonoSpline monoSpline;
    private final float periodicBias;
    private float[] times;
    private final IntList timestamps;
    private V valueVector;
    private float[][] values;
    private V velocityVector;

    public VectorizedMonoSplineKeyframesSpec(IntList timestamps, IntObjectMap<Pair<V, Easing>> intObjectMap, int durationMillis, int delayMillis, float periodicBias) {
        this.timestamps = timestamps;
        this.keyframes = intObjectMap;
        this.durationMillis = durationMillis;
        this.delayMillis = delayMillis;
        this.periodicBias = periodicBias;
    }

    @Override // androidx.compose.animation.core.VectorizedDurationBasedAnimationSpec
    public int getDurationMillis() {
        return this.durationMillis;
    }

    @Override // androidx.compose.animation.core.VectorizedDurationBasedAnimationSpec
    public int getDelayMillis() {
        return this.delayMillis;
    }

    private final void init(V v, V v2, V v3) {
        float[] fArr;
        if (this.valueVector == null) {
            this.valueVector = (V) AnimationVectorsKt.newInstance(v);
            this.velocityVector = (V) AnimationVectorsKt.newInstance(v3);
            IntList this_$iv = this.timestamps;
            int i = this_$iv._size;
            float[] fArr2 = new float[i];
            for (int i2 = 0; i2 < i; i2++) {
                fArr2[i2] = this.timestamps.get(i2) / 1000.0f;
            }
            this.times = fArr2;
        }
        if (this.monoSpline == null || !Intrinsics.areEqual(this.lastInitialValue, v) || !Intrinsics.areEqual(this.lastTargetValue, v2)) {
            boolean initialChanged = !Intrinsics.areEqual(this.lastInitialValue, v);
            boolean targetChanged = !Intrinsics.areEqual(this.lastTargetValue, v2);
            this.lastInitialValue = v;
            this.lastTargetValue = v2;
            int dimension = v.getSize$animation_core_release();
            float[][] values = this.values;
            if (values == null) {
                IntList this_$iv2 = this.timestamps;
                int i3 = this_$iv2._size;
                float[][] fArr3 = new float[i3];
                for (int i4 = 0; i4 < i3; i4++) {
                    int timestamp = this.timestamps.get(i4);
                    Pair keyframe = this.keyframes.get(timestamp);
                    if (timestamp == 0 && keyframe == null) {
                        fArr = new float[dimension];
                        for (int i5 = 0; i5 < dimension; i5++) {
                            fArr[i5] = v.get$animation_core_release(i5);
                        }
                    } else if (timestamp == getDurationMillis() && keyframe == null) {
                        fArr = new float[dimension];
                        for (int i6 = 0; i6 < dimension; i6++) {
                            fArr[i6] = v2.get$animation_core_release(i6);
                        }
                    } else {
                        Intrinsics.checkNotNull(keyframe);
                        V vectorValue = keyframe.getFirst();
                        float[] fArr4 = new float[dimension];
                        for (int i7 = 0; i7 < dimension; i7++) {
                            fArr4[i7] = vectorValue.get$animation_core_release(i7);
                        }
                        fArr = fArr4;
                    }
                    fArr3[i4] = fArr;
                }
                values = fArr3;
                this.values = values;
            } else {
                if (initialChanged) {
                    IntObjectMap this_$iv3 = this.keyframes;
                    if (!this_$iv3.containsKey(0)) {
                        int index = IntList.binarySearch$default(this.timestamps, 0, 0, 0, 6, null);
                        float[] fArr5 = new float[dimension];
                        for (int i8 = 0; i8 < dimension; i8++) {
                            fArr5[i8] = v.get$animation_core_release(i8);
                        }
                        values[index] = fArr5;
                    }
                }
                if (targetChanged) {
                    IntObjectMap this_$iv4 = this.keyframes;
                    int key$iv = getDurationMillis();
                    if (!this_$iv4.containsKey(key$iv)) {
                        int index2 = IntList.binarySearch$default(this.timestamps, getDurationMillis(), 0, 0, 6, null);
                        float[] fArr6 = new float[dimension];
                        for (int i9 = 0; i9 < dimension; i9++) {
                            fArr6[i9] = v2.get$animation_core_release(i9);
                        }
                        values[index2] = fArr6;
                    }
                }
            }
            float[] fArr7 = this.times;
            if (fArr7 == null) {
                Intrinsics.throwUninitializedPropertyAccessException("times");
                fArr7 = null;
            }
            this.monoSpline = new MonoSpline(fArr7, values, this.periodicBias);
        }
    }

    @Override // androidx.compose.animation.core.VectorizedAnimationSpec
    public V getValueFromNanos(long playTimeNanos, V v, V v2, V v3) {
        long playTimeMillis = playTimeNanos / AnimationKt.MillisToNanos;
        int clampedPlayTime = (int) VectorizedAnimationSpecKt.clampPlayTime(this, playTimeMillis);
        Pair keyframe = this.keyframes.get(clampedPlayTime);
        if (keyframe != null) {
            return keyframe.getFirst();
        }
        if (clampedPlayTime >= getDurationMillis()) {
            return v2;
        }
        if (clampedPlayTime <= 0) {
            return v;
        }
        init(v, v2, v3);
        int index = findEntryForTimeMillis(clampedPlayTime);
        V v4 = this.valueVector;
        Intrinsics.checkNotNull(v4);
        MonoSpline monoSpline = this.monoSpline;
        Intrinsics.checkNotNull(monoSpline);
        monoSpline.getPos(getEasedTimeFromIndex(index, clampedPlayTime), v4, index);
        return v4;
    }

    @Override // androidx.compose.animation.core.VectorizedAnimationSpec
    public V getVelocityFromNanos(long playTimeNanos, V v, V v2, V v3) {
        long playTimeMillis = playTimeNanos / AnimationKt.MillisToNanos;
        int clampedPlayTime = (int) VectorizedAnimationSpecKt.clampPlayTime(this, playTimeMillis);
        init(v, v2, v3);
        int index = findEntryForTimeMillis(clampedPlayTime);
        V v4 = this.velocityVector;
        Intrinsics.checkNotNull(v4);
        MonoSpline monoSpline = this.monoSpline;
        Intrinsics.checkNotNull(monoSpline);
        monoSpline.getSlope(getEasedTimeFromIndex(index, clampedPlayTime), v4, index);
        return v4;
    }

    private final Easing getEasing(int index) {
        Easing second;
        int timestamp = this.timestamps.get(index);
        Pair<V, Easing> pair = this.keyframes.get(timestamp);
        return (pair == null || (second = pair.getSecond()) == null) ? EasingKt.getLinearEasing() : second;
    }

    private final float getEasedTimeFromIndex(int index, int timeMillis) {
        IntList this_$iv = this.timestamps;
        if (index >= this_$iv._size - 1) {
            return timeMillis / 1000.0f;
        }
        int timeMin = this.timestamps.get(index);
        int timeMax = this.timestamps.get(index + 1);
        if (timeMillis == timeMin) {
            return timeMin / 1000.0f;
        }
        int timeRange = timeMax - timeMin;
        Easing easing = getEasing(index);
        float rawFraction = (timeMillis - timeMin) / timeRange;
        float easedFraction = easing.transform(rawFraction);
        return ((timeRange * easedFraction) + timeMin) / 1000.0f;
    }

    private final int findEntryForTimeMillis(int timeMillis) {
        int index = IntList.binarySearch$default(this.timestamps, timeMillis, 0, 0, 6, null);
        return index < -1 ? -(index + 2) : index;
    }
}
