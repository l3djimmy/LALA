package androidx.compose.foundation.gestures;

import androidx.compose.animation.core.AnimationSpec;
import androidx.compose.animation.core.AnimationVector;
import androidx.compose.animation.core.AnimationVector1D;
import androidx.compose.animation.core.AnimationVector2D;
import androidx.compose.animation.core.TwoWayConverter;
import androidx.compose.animation.core.VectorConvertersKt;
import androidx.compose.animation.core.VectorizedAnimationSpec;
import androidx.compose.animation.core.VectorizedFiniteAnimationSpec;
import androidx.compose.ui.geometry.Offset;
import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FloatCompanionObject;
/* compiled from: TransformableState.kt */
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B/\u0012\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00040\u0001\u0012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u0001\u0012\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00040\u0001¢\u0006\u0002\u0010\bJ,\u0010\t\u001a\b\u0012\u0004\u0012\u0002H\u000b0\n\"\b\b\u0000\u0010\u000b*\u00020\f2\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u0002H\u000b0\u000eH\u0016R\u0014\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00060\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00040\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00040\u0001X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u000f"}, d2 = {"Landroidx/compose/foundation/gestures/DelegatingAnimationSpec;", "Landroidx/compose/animation/core/AnimationSpec;", "Landroidx/compose/foundation/gestures/AnimationData;", "zoomAnimationSpec", "", "offsetAnimationSpec", "Landroidx/compose/ui/geometry/Offset;", "rotationAnimationSpec", "(Landroidx/compose/animation/core/AnimationSpec;Landroidx/compose/animation/core/AnimationSpec;Landroidx/compose/animation/core/AnimationSpec;)V", "vectorize", "Landroidx/compose/animation/core/VectorizedAnimationSpec;", ExifInterface.GPS_MEASUREMENT_INTERRUPTED, "Landroidx/compose/animation/core/AnimationVector;", "converter", "Landroidx/compose/animation/core/TwoWayConverter;", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
final class DelegatingAnimationSpec implements AnimationSpec<AnimationData> {
    private final AnimationSpec<Offset> offsetAnimationSpec;
    private final AnimationSpec<Float> rotationAnimationSpec;
    private final AnimationSpec<Float> zoomAnimationSpec;

    public DelegatingAnimationSpec(AnimationSpec<Float> animationSpec, AnimationSpec<Offset> animationSpec2, AnimationSpec<Float> animationSpec3) {
        this.zoomAnimationSpec = animationSpec;
        this.offsetAnimationSpec = animationSpec2;
        this.rotationAnimationSpec = animationSpec3;
    }

    @Override // androidx.compose.animation.core.AnimationSpec
    public <V extends AnimationVector> VectorizedAnimationSpec<V> vectorize(final TwoWayConverter<AnimationData, V> twoWayConverter) {
        final VectorizedAnimationSpec vectorizedZoomAnimationSpec = this.zoomAnimationSpec.vectorize(VectorConvertersKt.getVectorConverter(FloatCompanionObject.INSTANCE));
        final VectorizedAnimationSpec vectorizedOffsetAnimationSpec = this.offsetAnimationSpec.vectorize(VectorConvertersKt.getVectorConverter(Offset.Companion));
        final VectorizedAnimationSpec vectorizedRotationAnimationSpec = this.rotationAnimationSpec.vectorize(VectorConvertersKt.getVectorConverter(FloatCompanionObject.INSTANCE));
        return new VectorizedFiniteAnimationSpec<V>() { // from class: androidx.compose.foundation.gestures.DelegatingAnimationSpec$vectorize$1
            /* JADX WARN: Incorrect types in method signature: (TV;TV;TV;)J */
            @Override // androidx.compose.animation.core.VectorizedAnimationSpec
            public long getDurationNanos(AnimationVector initialValue, AnimationVector targetValue, AnimationVector initialVelocity) {
                AnimationData initialAnimationData = twoWayConverter.getConvertFromVector().invoke(initialValue);
                AnimationData targetAnimationData = twoWayConverter.getConvertFromVector().invoke(targetValue);
                AnimationData initialVelocityAnimationData = twoWayConverter.getConvertFromVector().invoke(initialVelocity);
                return Math.max(vectorizedZoomAnimationSpec.getDurationNanos(zoomVector(initialAnimationData), zoomVector(targetAnimationData), zoomVector(initialVelocityAnimationData)), Math.max(vectorizedOffsetAnimationSpec.getDurationNanos(offsetVector(initialAnimationData), offsetVector(targetAnimationData), offsetVector(initialVelocityAnimationData)), vectorizedRotationAnimationSpec.getDurationNanos(degreesVector(initialAnimationData), degreesVector(targetAnimationData), degreesVector(initialVelocityAnimationData))));
            }

            /* JADX WARN: Incorrect return type in method signature: (JTV;TV;TV;)TV; */
            @Override // androidx.compose.animation.core.VectorizedAnimationSpec
            public AnimationVector getVelocityFromNanos(long playTimeNanos, AnimationVector initialValue, AnimationVector targetValue, AnimationVector initialVelocity) {
                AnimationData initialAnimationData = twoWayConverter.getConvertFromVector().invoke(initialValue);
                AnimationData targetAnimationData = twoWayConverter.getConvertFromVector().invoke(targetValue);
                AnimationData initialVelocityAnimationData = twoWayConverter.getConvertFromVector().invoke(initialVelocity);
                AnimationVector1D zoomVelocity = vectorizedZoomAnimationSpec.getVelocityFromNanos(playTimeNanos, zoomVector(initialAnimationData), zoomVector(targetAnimationData), zoomVector(initialVelocityAnimationData));
                AnimationVector2D offsetVelocity = vectorizedOffsetAnimationSpec.getVelocityFromNanos(playTimeNanos, offsetVector(initialAnimationData), offsetVector(targetAnimationData), offsetVector(initialVelocityAnimationData));
                AnimationVector1D rotationVelocity = vectorizedRotationAnimationSpec.getVelocityFromNanos(playTimeNanos, degreesVector(initialAnimationData), degreesVector(targetAnimationData), degreesVector(initialVelocityAnimationData));
                return packToAnimationVector(zoomVelocity, offsetVelocity, rotationVelocity);
            }

            /* JADX WARN: Incorrect return type in method signature: (JTV;TV;TV;)TV; */
            @Override // androidx.compose.animation.core.VectorizedAnimationSpec
            public AnimationVector getValueFromNanos(long playTimeNanos, AnimationVector initialValue, AnimationVector targetValue, AnimationVector initialVelocity) {
                AnimationData initialAnimationData = twoWayConverter.getConvertFromVector().invoke(initialValue);
                AnimationData targetAnimationData = twoWayConverter.getConvertFromVector().invoke(targetValue);
                AnimationData initialVelocityAnimationData = twoWayConverter.getConvertFromVector().invoke(initialVelocity);
                AnimationVector1D zoomValue = vectorizedZoomAnimationSpec.getValueFromNanos(playTimeNanos, zoomVector(initialAnimationData), zoomVector(targetAnimationData), zoomVector(initialVelocityAnimationData));
                AnimationVector2D offsetValue = vectorizedOffsetAnimationSpec.getValueFromNanos(playTimeNanos, offsetVector(initialAnimationData), offsetVector(targetAnimationData), offsetVector(initialVelocityAnimationData));
                AnimationVector1D rotationValue = vectorizedRotationAnimationSpec.getValueFromNanos(playTimeNanos, degreesVector(initialAnimationData), degreesVector(targetAnimationData), degreesVector(initialVelocityAnimationData));
                return packToAnimationVector(zoomValue, offsetValue, rotationValue);
            }

            private final AnimationVector1D zoomVector(AnimationData $this$zoomVector) {
                return VectorConvertersKt.getVectorConverter(FloatCompanionObject.INSTANCE).getConvertToVector().invoke(Float.valueOf($this$zoomVector.getZoom()));
            }

            private final AnimationVector2D offsetVector(AnimationData $this$offsetVector) {
                Function1<Offset, AnimationVector2D> convertToVector = VectorConvertersKt.getVectorConverter(Offset.Companion).getConvertToVector();
                long arg0$iv = $this$offsetVector.m670getOffsetF1C5BW0();
                int bits$iv$iv$iv = (int) (arg0$iv >> 32);
                float x$iv = Float.intBitsToFloat(bits$iv$iv$iv);
                long arg0$iv2 = $this$offsetVector.m670getOffsetF1C5BW0();
                int bits$iv$iv$iv2 = (int) (arg0$iv2 & 4294967295L);
                float y$iv = Float.intBitsToFloat(bits$iv$iv$iv2);
                long v1$iv$iv = Float.floatToRawIntBits(x$iv);
                long v2$iv$iv = Float.floatToRawIntBits(y$iv);
                return convertToVector.invoke(Offset.m4037boximpl(Offset.m4040constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv))));
            }

            private final AnimationVector1D degreesVector(AnimationData $this$degreesVector) {
                return VectorConvertersKt.getVectorConverter(FloatCompanionObject.INSTANCE).getConvertToVector().invoke(Float.valueOf($this$degreesVector.getDegrees()));
            }

            /* JADX WARN: Incorrect return type in method signature: (Landroidx/compose/animation/core/AnimationVector1D;Landroidx/compose/animation/core/AnimationVector2D;Landroidx/compose/animation/core/AnimationVector1D;)TV; */
            private final AnimationVector packToAnimationVector(AnimationVector1D zoom, AnimationVector2D offset, AnimationVector1D rotation) {
                Function1<AnimationData, V> convertToVector = twoWayConverter.getConvertToVector();
                float value = zoom.getValue();
                float x$iv = offset.getV1();
                float y$iv = offset.getV2();
                long v1$iv$iv = Float.floatToRawIntBits(x$iv);
                long v2$iv$iv = Float.floatToRawIntBits(y$iv);
                return (AnimationVector) convertToVector.invoke(new AnimationData(value, Offset.m4040constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv)), rotation.getValue(), null));
            }
        };
    }
}
