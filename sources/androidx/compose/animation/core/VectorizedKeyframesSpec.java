package androidx.compose.animation.core;

import androidx.collection.IntList;
import androidx.collection.IntObjectMap;
import androidx.compose.animation.core.AnimationVector;
import androidx.exifinterface.media.ExifInterface;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: VectorizedAnimationSpec.kt */
@Metadata(d1 = {"\u0000r\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\u0015\n\u0000\n\u0002\u0010\u0014\n\u0002\b\u0007\n\u0002\u0010\u0007\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0002\b\u0002\b\u0007\u0018\u0000*\b\b\u0000\u0010\u0001*\u00020\u00022\b\u0012\u0004\u0012\u0002H\u00010\u0003B9\b\u0016\u0012\u001e\u0010\u0004\u001a\u001a\u0012\u0004\u0012\u00020\u0006\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\b0\u00070\u0005\u0012\u0006\u0010\t\u001a\u00020\u0006\u0012\b\b\u0002\u0010\n\u001a\u00020\u0006¢\u0006\u0002\u0010\u000bBC\b\u0000\u0012\u0006\u0010\f\u001a\u00020\r\u0012\u0012\u0010\u0004\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u000f0\u000e\u0012\u0006\u0010\t\u001a\u00020\u0006\u0012\u0006\u0010\n\u001a\u00020\u0006\u0012\u0006\u0010\u0010\u001a\u00020\b\u0012\u0006\u0010\u0011\u001a\u00020\u0012¢\u0006\u0002\u0010\u0013J\u0010\u0010%\u001a\u00020\u00062\u0006\u0010&\u001a\u00020\u0006H\u0002J\u0010\u0010'\u001a\u00020(2\u0006\u0010&\u001a\u00020\u0006H\u0002J \u0010)\u001a\u00020(2\u0006\u0010*\u001a\u00020\u00062\u0006\u0010&\u001a\u00020\u00062\u0006\u0010+\u001a\u00020,H\u0002J-\u0010-\u001a\u00028\u00002\u0006\u0010.\u001a\u00020/2\u0006\u00100\u001a\u00028\u00002\u0006\u00101\u001a\u00028\u00002\u0006\u00102\u001a\u00028\u0000H\u0016¢\u0006\u0002\u00103J-\u00104\u001a\u00028\u00002\u0006\u0010.\u001a\u00020/2\u0006\u00100\u001a\u00028\u00002\u0006\u00101\u001a\u00028\u00002\u0006\u00102\u001a\u00028\u0000H\u0016¢\u0006\u0002\u00103J%\u00105\u001a\u0002062\u0006\u00100\u001a\u00028\u00002\u0006\u00101\u001a\u00028\u00002\u0006\u00102\u001a\u00028\u0000H\u0002¢\u0006\u0002\u00107R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\n\u001a\u00020\u0006X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0014\u0010\t\u001a\u00020\u0006X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0017R\u0016\u0010\u0011\u001a\u00020\u0012X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0019R\u001a\u0010\u0004\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u000f0\u000eX\u0082\u0004¢\u0006\u0002\n\u0000R\u0012\u0010\u001a\u001a\u0004\u0018\u00018\u0000X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u001bR\u0012\u0010\u001c\u001a\u0004\u0018\u00018\u0000X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u001bR\u000e\u0010\u001d\u001a\u00020\u001eX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u001f\u001a\u00020 X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010!\u001a\u00020 X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\"\u001a\u00020 X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\rX\u0082\u0004¢\u0006\u0002\n\u0000R\u0012\u0010#\u001a\u0004\u0018\u00018\u0000X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u001bR\u0012\u0010$\u001a\u0004\u0018\u00018\u0000X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u001b\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u00068"}, d2 = {"Landroidx/compose/animation/core/VectorizedKeyframesSpec;", ExifInterface.GPS_MEASUREMENT_INTERRUPTED, "Landroidx/compose/animation/core/AnimationVector;", "Landroidx/compose/animation/core/VectorizedDurationBasedAnimationSpec;", "keyframes", "", "", "Lkotlin/Pair;", "Landroidx/compose/animation/core/Easing;", "durationMillis", "delayMillis", "(Ljava/util/Map;II)V", "timestamps", "Landroidx/collection/IntList;", "Landroidx/collection/IntObjectMap;", "Landroidx/compose/animation/core/VectorizedKeyframeSpecElementInfo;", "defaultEasing", "initialArcMode", "Landroidx/compose/animation/core/ArcMode;", "(Landroidx/collection/IntList;Landroidx/collection/IntObjectMap;IILandroidx/compose/animation/core/Easing;ILkotlin/jvm/internal/DefaultConstructorMarker;)V", "arcSpline", "Landroidx/compose/animation/core/ArcSpline;", "getDelayMillis", "()I", "getDurationMillis", "I", "lastInitialValue", "Landroidx/compose/animation/core/AnimationVector;", "lastTargetValue", "modes", "", "posArray", "", "slopeArray", "times", "valueVector", "velocityVector", "findEntryForTimeMillis", "timeMillis", "getEasedTime", "", "getEasedTimeFromIndex", "index", "asFraction", "", "getValueFromNanos", "playTimeNanos", "", "initialValue", "targetValue", "initialVelocity", "(JLandroidx/compose/animation/core/AnimationVector;Landroidx/compose/animation/core/AnimationVector;Landroidx/compose/animation/core/AnimationVector;)Landroidx/compose/animation/core/AnimationVector;", "getVelocityFromNanos", "init", "", "(Landroidx/compose/animation/core/AnimationVector;Landroidx/compose/animation/core/AnimationVector;Landroidx/compose/animation/core/AnimationVector;)V", "animation-core_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class VectorizedKeyframesSpec<V extends AnimationVector> implements VectorizedDurationBasedAnimationSpec<V> {
    public static final int $stable = 8;
    private ArcSpline arcSpline;
    private final Easing defaultEasing;
    private final int delayMillis;
    private final int durationMillis;
    private final int initialArcMode;
    private final IntObjectMap<VectorizedKeyframeSpecElementInfo<V>> keyframes;
    private V lastInitialValue;
    private V lastTargetValue;
    private int[] modes;
    private float[] posArray;
    private float[] slopeArray;
    private float[] times;
    private final IntList timestamps;
    private V valueVector;
    private V velocityVector;

    public /* synthetic */ VectorizedKeyframesSpec(IntList intList, IntObjectMap intObjectMap, int i, int i2, Easing easing, int i3, DefaultConstructorMarker defaultConstructorMarker) {
        this(intList, intObjectMap, i, i2, easing, i3);
    }

    private VectorizedKeyframesSpec(IntList timestamps, IntObjectMap<VectorizedKeyframeSpecElementInfo<V>> intObjectMap, int durationMillis, int delayMillis, Easing defaultEasing, int initialArcMode) {
        int[] iArr;
        float[] fArr;
        float[] fArr2;
        float[] fArr3;
        ArcSpline arcSpline;
        this.timestamps = timestamps;
        this.keyframes = intObjectMap;
        this.durationMillis = durationMillis;
        this.delayMillis = delayMillis;
        this.defaultEasing = defaultEasing;
        this.initialArcMode = initialArcMode;
        iArr = VectorizedAnimationSpecKt.EmptyIntArray;
        this.modes = iArr;
        fArr = VectorizedAnimationSpecKt.EmptyFloatArray;
        this.times = fArr;
        fArr2 = VectorizedAnimationSpecKt.EmptyFloatArray;
        this.posArray = fArr2;
        fArr3 = VectorizedAnimationSpecKt.EmptyFloatArray;
        this.slopeArray = fArr3;
        arcSpline = VectorizedAnimationSpecKt.EmptyArcSpline;
        this.arcSpline = arcSpline;
    }

    @Override // androidx.compose.animation.core.VectorizedDurationBasedAnimationSpec
    public int getDurationMillis() {
        return this.durationMillis;
    }

    @Override // androidx.compose.animation.core.VectorizedDurationBasedAnimationSpec
    public int getDelayMillis() {
        return this.delayMillis;
    }

    public /* synthetic */ VectorizedKeyframesSpec(Map map, int i, int i2, int i3, DefaultConstructorMarker defaultConstructorMarker) {
        this(map, i, (i3 & 4) != 0 ? 0 : i2);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public VectorizedKeyframesSpec(java.util.Map<java.lang.Integer, ? extends kotlin.Pair<? extends V, ? extends androidx.compose.animation.core.Easing>> r18, int r19, int r20) {
        /*
            r17 = this;
            r0 = r18
            r1 = 0
            androidx.collection.MutableIntList r2 = new androidx.collection.MutableIntList
            int r3 = r0.size()
            int r3 = r3 + 2
            r2.<init>(r3)
            r3 = r18
            r4 = 0
            java.util.Set r5 = r3.entrySet()
            java.util.Iterator r5 = r5.iterator()
        L19:
            boolean r6 = r5.hasNext()
            if (r6 == 0) goto L35
            java.lang.Object r6 = r5.next()
            java.util.Map$Entry r6 = (java.util.Map.Entry) r6
            r7 = 0
            java.lang.Object r8 = r6.getKey()
            java.lang.Number r8 = (java.lang.Number) r8
            int r8 = r8.intValue()
            r2.add(r8)
            goto L19
        L35:
            r3 = 0
            java.lang.Integer r4 = java.lang.Integer.valueOf(r3)
            boolean r4 = r0.containsKey(r4)
            if (r4 != 0) goto L44
            r2.add(r3, r3)
        L44:
            java.lang.Integer r4 = java.lang.Integer.valueOf(r19)
            boolean r4 = r0.containsKey(r4)
            if (r4 != 0) goto L54
            r8 = r19
            r2.add(r8)
            goto L56
        L54:
            r8 = r19
        L56:
            r2.sort()
            r6 = r2
            androidx.collection.IntList r6 = (androidx.collection.IntList) r6
            r1 = 0
            androidx.collection.MutableIntObjectMap r2 = new androidx.collection.MutableIntObjectMap
            r4 = 1
            r5 = 0
            r2.<init>(r3, r4, r5)
            r3 = r18
            r4 = 0
            java.util.Set r7 = r3.entrySet()
            java.util.Iterator r7 = r7.iterator()
        L70:
            boolean r9 = r7.hasNext()
            if (r9 == 0) goto Lac
            java.lang.Object r9 = r7.next()
            java.util.Map$Entry r9 = (java.util.Map.Entry) r9
            r10 = 0
            java.lang.Object r11 = r9.getKey()
            java.lang.Number r11 = (java.lang.Number) r11
            int r11 = r11.intValue()
            java.lang.Object r12 = r9.getValue()
            kotlin.Pair r12 = (kotlin.Pair) r12
            androidx.compose.animation.core.VectorizedKeyframeSpecElementInfo r13 = new androidx.compose.animation.core.VectorizedKeyframeSpecElementInfo
            java.lang.Object r14 = r12.getFirst()
            androidx.compose.animation.core.AnimationVector r14 = (androidx.compose.animation.core.AnimationVector) r14
            java.lang.Object r15 = r12.getSecond()
            androidx.compose.animation.core.Easing r15 = (androidx.compose.animation.core.Easing) r15
            androidx.compose.animation.core.ArcMode$Companion r16 = androidx.compose.animation.core.ArcMode.Companion
            int r0 = r16.m416getArcLinear9TMq4()
            r13.<init>(r14, r15, r0, r5)
            r2.set(r11, r13)
            r0 = r18
            goto L70
        Lac:
            r7 = r2
            androidx.collection.IntObjectMap r7 = (androidx.collection.IntObjectMap) r7
            androidx.compose.animation.core.Easing r10 = androidx.compose.animation.core.EasingKt.getLinearEasing()
            androidx.compose.animation.core.ArcMode$Companion r0 = androidx.compose.animation.core.ArcMode.Companion
            int r11 = r0.m416getArcLinear9TMq4()
            r12 = 0
            r5 = r17
            r9 = r20
            r5.<init>(r6, r7, r8, r9, r10, r11, r12)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.animation.core.VectorizedKeyframesSpec.<init>(java.util.Map, int, int):void");
    }

    private final void init(V v, V v2, V v3) {
        ArcSpline arcSpline;
        ArcSpline arcSpline2;
        float[] fArr;
        ArcSpline arcSpline3 = this.arcSpline;
        arcSpline = VectorizedAnimationSpecKt.EmptyArcSpline;
        boolean requiresArcSpline = arcSpline3 != arcSpline;
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
            IntList this_$iv2 = this.timestamps;
            int i3 = this_$iv2._size;
            int[] iArr = new int[i3];
            for (int i4 = 0; i4 < i3; i4++) {
                VectorizedKeyframeSpecElementInfo<V> vectorizedKeyframeSpecElementInfo = this.keyframes.get(this.timestamps.get(i4));
                int mode = vectorizedKeyframeSpecElementInfo != null ? vectorizedKeyframeSpecElementInfo.m467getArcMode9TMq4() : this.initialArcMode;
                if (!ArcMode.m410equalsimpl0(mode, ArcMode.Companion.m416getArcLinear9TMq4())) {
                    requiresArcSpline = true;
                }
                iArr[i4] = mode;
            }
            this.modes = iArr;
        }
        if (!requiresArcSpline) {
            return;
        }
        ArcSpline arcSpline4 = this.arcSpline;
        arcSpline2 = VectorizedAnimationSpecKt.EmptyArcSpline;
        if (arcSpline4 == arcSpline2 || !Intrinsics.areEqual(this.lastInitialValue, v) || !Intrinsics.areEqual(this.lastTargetValue, v2)) {
            this.lastInitialValue = v;
            this.lastTargetValue = v2;
            int dimensionCount = (v.getSize$animation_core_release() % 2) + v.getSize$animation_core_release();
            this.posArray = new float[dimensionCount];
            this.slopeArray = new float[dimensionCount];
            IntList this_$iv3 = this.timestamps;
            int i5 = this_$iv3._size;
            float[][] values = new float[i5];
            for (int i6 = 0; i6 < i5; i6++) {
                int timestamp = this.timestamps.get(i6);
                VectorizedKeyframeSpecElementInfo info = this.keyframes.get(timestamp);
                if (timestamp == 0 && info == null) {
                    fArr = new float[dimensionCount];
                    for (int i7 = 0; i7 < dimensionCount; i7++) {
                        fArr[i7] = v.get$animation_core_release(i7);
                    }
                } else if (timestamp == getDurationMillis() && info == null) {
                    fArr = new float[dimensionCount];
                    for (int i8 = 0; i8 < dimensionCount; i8++) {
                        fArr[i8] = v2.get$animation_core_release(i8);
                    }
                } else {
                    Intrinsics.checkNotNull(info);
                    AnimationVector vectorValue = info.getVectorValue();
                    float[] fArr3 = new float[dimensionCount];
                    for (int i9 = 0; i9 < dimensionCount; i9++) {
                        fArr3[i9] = vectorValue.get$animation_core_release(i9);
                    }
                    fArr = fArr3;
                }
                values[i6] = fArr;
            }
            this.arcSpline = new ArcSpline(this.modes, this.times, values);
        }
    }

    @Override // androidx.compose.animation.core.VectorizedAnimationSpec
    public V getValueFromNanos(long playTimeNanos, V v, V v2, V v3) {
        ArcSpline arcSpline;
        AnimationVector startValue;
        AnimationVector animationVector;
        long playTimeMillis = playTimeNanos / AnimationKt.MillisToNanos;
        int clampedPlayTime = (int) VectorizedAnimationSpecKt.clampPlayTime(this, playTimeMillis);
        VectorizedKeyframeSpecElementInfo keyframe = this.keyframes.get(clampedPlayTime);
        if (keyframe != null) {
            return keyframe.getVectorValue();
        }
        if (clampedPlayTime >= getDurationMillis()) {
            return v2;
        }
        if (clampedPlayTime <= 0) {
            return v;
        }
        init(v, v2, v3);
        V v4 = this.valueVector;
        Intrinsics.checkNotNull(v4);
        ArcSpline arcSpline2 = this.arcSpline;
        arcSpline = VectorizedAnimationSpecKt.EmptyArcSpline;
        if (arcSpline2 != arcSpline) {
            float easedTime = getEasedTime(clampedPlayTime);
            float[] posArray = this.posArray;
            this.arcSpline.getPos(easedTime, posArray);
            int length = posArray.length;
            for (int i = 0; i < length; i++) {
                v4.set$animation_core_release(i, posArray[i]);
            }
            return v4;
        }
        int index = findEntryForTimeMillis(clampedPlayTime);
        float easedTime2 = getEasedTimeFromIndex(index, clampedPlayTime, true);
        int timestampStart = this.timestamps.get(index);
        VectorizedKeyframeSpecElementInfo startKeyframe = this.keyframes.get(timestampStart);
        if (startKeyframe == null || (startValue = startKeyframe.getVectorValue()) == null) {
            startValue = v;
        }
        int timestampEnd = this.timestamps.get(index + 1);
        VectorizedKeyframeSpecElementInfo endKeyframe = this.keyframes.get(timestampEnd);
        if (endKeyframe == null || (animationVector = endKeyframe.getVectorValue()) == null) {
            animationVector = v2;
        }
        AnimationVector endValue = animationVector;
        int size$animation_core_release = v4.getSize$animation_core_release();
        int i2 = 0;
        while (i2 < size$animation_core_release) {
            float start$iv = startValue.get$animation_core_release(i2);
            int i3 = size$animation_core_release;
            AnimationVector endValue2 = endValue;
            float stop$iv = endValue2.get$animation_core_release(i2);
            v4.set$animation_core_release(i2, ((1.0f - easedTime2) * start$iv) + (stop$iv * easedTime2));
            i2++;
            size$animation_core_release = i3;
            endValue = endValue2;
        }
        return v4;
    }

    @Override // androidx.compose.animation.core.VectorizedAnimationSpec
    public V getVelocityFromNanos(long playTimeNanos, V v, V v2, V v3) {
        ArcSpline arcSpline;
        long playTimeMillis = playTimeNanos / AnimationKt.MillisToNanos;
        long clampedPlayTime = VectorizedAnimationSpecKt.clampPlayTime(this, playTimeMillis);
        if (clampedPlayTime < 0) {
            return v3;
        }
        init(v, v2, v3);
        V v4 = this.velocityVector;
        Intrinsics.checkNotNull(v4);
        ArcSpline arcSpline2 = this.arcSpline;
        arcSpline = VectorizedAnimationSpecKt.EmptyArcSpline;
        if (arcSpline2 == arcSpline) {
            AnimationVector startNum = VectorizedAnimationSpecKt.getValueFromMillis(this, clampedPlayTime - 1, v, v2, v3);
            AnimationVector endNum = VectorizedAnimationSpecKt.getValueFromMillis(this, clampedPlayTime, v, v2, v3);
            int size$animation_core_release = startNum.getSize$animation_core_release();
            for (int i = 0; i < size$animation_core_release; i++) {
                v4.set$animation_core_release(i, (startNum.get$animation_core_release(i) - endNum.get$animation_core_release(i)) * 1000.0f);
            }
            return v4;
        }
        float easedTime = getEasedTime((int) clampedPlayTime);
        float[] slopeArray = this.slopeArray;
        this.arcSpline.getSlope(easedTime, slopeArray);
        int length = slopeArray.length;
        for (int i2 = 0; i2 < length; i2++) {
            v4.set$animation_core_release(i2, slopeArray[i2]);
        }
        return v4;
    }

    private final float getEasedTime(int timeMillis) {
        int index = findEntryForTimeMillis(timeMillis);
        return getEasedTimeFromIndex(index, timeMillis, false);
    }

    private final float getEasedTimeFromIndex(int index, int timeMillis, boolean asFraction) {
        Easing easing;
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
        VectorizedKeyframeSpecElementInfo<V> vectorizedKeyframeSpecElementInfo = this.keyframes.get(timeMin);
        if (vectorizedKeyframeSpecElementInfo == null || (easing = vectorizedKeyframeSpecElementInfo.getEasing()) == null) {
            easing = this.defaultEasing;
        }
        float rawFraction = (timeMillis - timeMin) / timeRange;
        float easedFraction = easing.transform(rawFraction);
        if (!asFraction) {
            return ((timeRange * easedFraction) + timeMin) / 1000.0f;
        }
        return easedFraction;
    }

    private final int findEntryForTimeMillis(int timeMillis) {
        int index = IntList.binarySearch$default(this.timestamps, timeMillis, 0, 0, 6, null);
        return index < -1 ? -(index + 2) : index;
    }
}
