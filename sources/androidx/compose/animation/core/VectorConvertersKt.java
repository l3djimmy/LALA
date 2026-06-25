package androidx.compose.animation.core;

import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.geometry.Size;
import androidx.compose.ui.unit.Dp;
import androidx.compose.ui.unit.DpOffset;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntSize;
import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FloatCompanionObject;
import kotlin.jvm.internal.IntCompanionObject;
/* compiled from: VectorConverters.kt */
@Metadata(d1 = {"\u0000\u0090\u0001\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\u001aJ\u0010*\u001a\u000e\u0012\u0004\u0012\u0002H+\u0012\u0004\u0012\u0002H,0\u0001\"\u0004\b\u0000\u0010+\"\b\b\u0001\u0010,*\u00020-2\u0012\u0010.\u001a\u000e\u0012\u0004\u0012\u0002H+\u0012\u0004\u0012\u0002H,0/2\u0012\u00100\u001a\u000e\u0012\u0004\u0012\u0002H,\u0012\u0004\u0012\u0002H+0/\u001a!\u00101\u001a\u00020\b2\u0006\u00102\u001a\u00020\b2\u0006\u00103\u001a\u00020\b2\u0006\u00104\u001a\u00020\bH\u0080\b\"\u001a\u0010\u0000\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\u00060\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u00020\f\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u00060\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020\u0010\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u00130\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00020\u0015\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"!\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\u0010\u0012\u0004\u0012\u00020\u00030\u0001*\u00020\u00178F¢\u0006\u0006\u001a\u0004\b\u0018\u0010\u0019\"!\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u00130\u0001*\u00020\u001a8F¢\u0006\u0006\u001a\u0004\b\u0018\u0010\u001b\"!\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\u0015\u0012\u0004\u0012\u00020\u00030\u0001*\u00020\u001c8F¢\u0006\u0006\u001a\u0004\b\u0018\u0010\u001d\"!\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0001*\u00020\u001e8F¢\u0006\u0006\u001a\u0004\b\u0018\u0010\u001f\"!\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001*\u00020 8F¢\u0006\u0006\u001a\u0004\b\u0018\u0010!\"!\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u00030\u0001*\u00020\"8F¢\u0006\u0006\u001a\u0004\b\u0018\u0010#\"!\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\f\u0012\u0004\u0012\u00020\u00030\u0001*\u00020$8F¢\u0006\u0006\u001a\u0004\b\u0018\u0010%\"!\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\u00060\u0001*\u00020&8F¢\u0006\u0006\u001a\u0004\b\u0018\u0010'\"!\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u00060\u0001*\u00020(8F¢\u0006\u0006\u001a\u0004\b\u0018\u0010)¨\u00065"}, d2 = {"DpOffsetToVector", "Landroidx/compose/animation/core/TwoWayConverter;", "Landroidx/compose/ui/unit/DpOffset;", "Landroidx/compose/animation/core/AnimationVector2D;", "DpToVector", "Landroidx/compose/ui/unit/Dp;", "Landroidx/compose/animation/core/AnimationVector1D;", "FloatToVector", "", "IntOffsetToVector", "Landroidx/compose/ui/unit/IntOffset;", "IntSizeToVector", "Landroidx/compose/ui/unit/IntSize;", "IntToVector", "", "OffsetToVector", "Landroidx/compose/ui/geometry/Offset;", "RectToVector", "Landroidx/compose/ui/geometry/Rect;", "Landroidx/compose/animation/core/AnimationVector4D;", "SizeToVector", "Landroidx/compose/ui/geometry/Size;", "VectorConverter", "Landroidx/compose/ui/geometry/Offset$Companion;", "getVectorConverter", "(Landroidx/compose/ui/geometry/Offset$Companion;)Landroidx/compose/animation/core/TwoWayConverter;", "Landroidx/compose/ui/geometry/Rect$Companion;", "(Landroidx/compose/ui/geometry/Rect$Companion;)Landroidx/compose/animation/core/TwoWayConverter;", "Landroidx/compose/ui/geometry/Size$Companion;", "(Landroidx/compose/ui/geometry/Size$Companion;)Landroidx/compose/animation/core/TwoWayConverter;", "Landroidx/compose/ui/unit/Dp$Companion;", "(Landroidx/compose/ui/unit/Dp$Companion;)Landroidx/compose/animation/core/TwoWayConverter;", "Landroidx/compose/ui/unit/DpOffset$Companion;", "(Landroidx/compose/ui/unit/DpOffset$Companion;)Landroidx/compose/animation/core/TwoWayConverter;", "Landroidx/compose/ui/unit/IntOffset$Companion;", "(Landroidx/compose/ui/unit/IntOffset$Companion;)Landroidx/compose/animation/core/TwoWayConverter;", "Landroidx/compose/ui/unit/IntSize$Companion;", "(Landroidx/compose/ui/unit/IntSize$Companion;)Landroidx/compose/animation/core/TwoWayConverter;", "Lkotlin/Float$Companion;", "(Lkotlin/jvm/internal/FloatCompanionObject;)Landroidx/compose/animation/core/TwoWayConverter;", "Lkotlin/Int$Companion;", "(Lkotlin/jvm/internal/IntCompanionObject;)Landroidx/compose/animation/core/TwoWayConverter;", "TwoWayConverter", ExifInterface.GPS_DIRECTION_TRUE, ExifInterface.GPS_MEASUREMENT_INTERRUPTED, "Landroidx/compose/animation/core/AnimationVector;", "convertToVector", "Lkotlin/Function1;", "convertFromVector", "lerp", "start", "stop", "fraction", "animation-core_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class VectorConvertersKt {
    private static final TwoWayConverter<Float, AnimationVector1D> FloatToVector = TwoWayConverter(new Function1<Float, AnimationVector1D>() { // from class: androidx.compose.animation.core.VectorConvertersKt$FloatToVector$1
        public final AnimationVector1D invoke(float it) {
            return new AnimationVector1D(it);
        }

        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ AnimationVector1D invoke(Float f) {
            return invoke(f.floatValue());
        }
    }, new Function1<AnimationVector1D, Float>() { // from class: androidx.compose.animation.core.VectorConvertersKt$FloatToVector$2
        @Override // kotlin.jvm.functions.Function1
        public final Float invoke(AnimationVector1D it) {
            return Float.valueOf(it.getValue());
        }
    });
    private static final TwoWayConverter<Integer, AnimationVector1D> IntToVector = TwoWayConverter(new Function1<Integer, AnimationVector1D>() { // from class: androidx.compose.animation.core.VectorConvertersKt$IntToVector$1
        public final AnimationVector1D invoke(int it) {
            return new AnimationVector1D(it);
        }

        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ AnimationVector1D invoke(Integer num) {
            return invoke(num.intValue());
        }
    }, new Function1<AnimationVector1D, Integer>() { // from class: androidx.compose.animation.core.VectorConvertersKt$IntToVector$2
        @Override // kotlin.jvm.functions.Function1
        public final Integer invoke(AnimationVector1D it) {
            return Integer.valueOf((int) it.getValue());
        }
    });
    private static final TwoWayConverter<Dp, AnimationVector1D> DpToVector = TwoWayConverter(new Function1<Dp, AnimationVector1D>() { // from class: androidx.compose.animation.core.VectorConvertersKt$DpToVector$1
        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ AnimationVector1D invoke(Dp dp) {
            return m454invoke0680j_4(dp.m6887unboximpl());
        }

        /* renamed from: invoke-0680j_4  reason: not valid java name */
        public final AnimationVector1D m454invoke0680j_4(float it) {
            return new AnimationVector1D(it);
        }
    }, new Function1<AnimationVector1D, Dp>() { // from class: androidx.compose.animation.core.VectorConvertersKt$DpToVector$2
        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ Dp invoke(AnimationVector1D animationVector1D) {
            return Dp.m6871boximpl(m455invokeu2uoSUM(animationVector1D));
        }

        /* renamed from: invoke-u2uoSUM  reason: not valid java name */
        public final float m455invokeu2uoSUM(AnimationVector1D it) {
            return Dp.m6873constructorimpl(it.getValue());
        }
    });
    private static final TwoWayConverter<DpOffset, AnimationVector2D> DpOffsetToVector = TwoWayConverter(new Function1<DpOffset, AnimationVector2D>() { // from class: androidx.compose.animation.core.VectorConvertersKt$DpOffsetToVector$1
        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ AnimationVector2D invoke(DpOffset dpOffset) {
            return m452invokejoFl9I(dpOffset.m6942unboximpl());
        }

        /* renamed from: invoke-jo-Fl9I  reason: not valid java name */
        public final AnimationVector2D m452invokejoFl9I(long it) {
            return new AnimationVector2D(DpOffset.m6934getXD9Ej5fM(it), DpOffset.m6936getYD9Ej5fM(it));
        }
    }, new Function1<AnimationVector2D, DpOffset>() { // from class: androidx.compose.animation.core.VectorConvertersKt$DpOffsetToVector$2
        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ DpOffset invoke(AnimationVector2D animationVector2D) {
            return DpOffset.m6928boximpl(m453invokegVRvYmI(animationVector2D));
        }

        /* renamed from: invoke-gVRvYmI  reason: not valid java name */
        public final long m453invokegVRvYmI(AnimationVector2D it) {
            float $this$dp$iv = it.getV1();
            float $this$dp$iv2 = Dp.m6873constructorimpl($this$dp$iv);
            float $this$dp$iv3 = it.getV2();
            float $this$dp$iv4 = Dp.m6873constructorimpl($this$dp$iv3);
            long v1$iv$iv = Float.floatToRawIntBits($this$dp$iv2);
            long v2$iv$iv = Float.floatToRawIntBits($this$dp$iv4);
            return DpOffset.m6929constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv));
        }
    });
    private static final TwoWayConverter<Size, AnimationVector2D> SizeToVector = TwoWayConverter(new Function1<Size, AnimationVector2D>() { // from class: androidx.compose.animation.core.VectorConvertersKt$SizeToVector$1
        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ AnimationVector2D invoke(Size size) {
            return m462invokeuvyYCjk(size.m4122unboximpl());
        }

        /* renamed from: invoke-uvyYCjk  reason: not valid java name */
        public final AnimationVector2D m462invokeuvyYCjk(long it) {
            int bits$iv$iv$iv = (int) (it >> 32);
            int bits$iv$iv$iv2 = (int) (4294967295L & it);
            return new AnimationVector2D(Float.intBitsToFloat(bits$iv$iv$iv), Float.intBitsToFloat(bits$iv$iv$iv2));
        }
    }, new Function1<AnimationVector2D, Size>() { // from class: androidx.compose.animation.core.VectorConvertersKt$SizeToVector$2
        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ Size invoke(AnimationVector2D animationVector2D) {
            return Size.m4105boximpl(m463invoke7Ah8Wj8(animationVector2D));
        }

        /* renamed from: invoke-7Ah8Wj8  reason: not valid java name */
        public final long m463invoke7Ah8Wj8(AnimationVector2D it) {
            float width$iv = it.getV1();
            float height$iv = it.getV2();
            long v1$iv$iv = Float.floatToRawIntBits(width$iv);
            long v2$iv$iv = Float.floatToRawIntBits(height$iv);
            return Size.m4108constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv));
        }
    });
    private static final TwoWayConverter<Offset, AnimationVector2D> OffsetToVector = TwoWayConverter(new Function1<Offset, AnimationVector2D>() { // from class: androidx.compose.animation.core.VectorConvertersKt$OffsetToVector$1
        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ AnimationVector2D invoke(Offset offset) {
            return m460invokek4lQ0M(offset.m4058unboximpl());
        }

        /* renamed from: invoke-k-4lQ0M  reason: not valid java name */
        public final AnimationVector2D m460invokek4lQ0M(long it) {
            int bits$iv$iv$iv = (int) (it >> 32);
            int bits$iv$iv$iv2 = (int) (4294967295L & it);
            return new AnimationVector2D(Float.intBitsToFloat(bits$iv$iv$iv), Float.intBitsToFloat(bits$iv$iv$iv2));
        }
    }, new Function1<AnimationVector2D, Offset>() { // from class: androidx.compose.animation.core.VectorConvertersKt$OffsetToVector$2
        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ Offset invoke(AnimationVector2D animationVector2D) {
            return Offset.m4037boximpl(m461invoketuRUvjQ(animationVector2D));
        }

        /* renamed from: invoke-tuRUvjQ  reason: not valid java name */
        public final long m461invoketuRUvjQ(AnimationVector2D it) {
            float x$iv = it.getV1();
            float y$iv = it.getV2();
            long v1$iv$iv = Float.floatToRawIntBits(x$iv);
            long v2$iv$iv = Float.floatToRawIntBits(y$iv);
            return Offset.m4040constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv));
        }
    });
    private static final TwoWayConverter<IntOffset, AnimationVector2D> IntOffsetToVector = TwoWayConverter(new Function1<IntOffset, AnimationVector2D>() { // from class: androidx.compose.animation.core.VectorConvertersKt$IntOffsetToVector$1
        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ AnimationVector2D invoke(IntOffset intOffset) {
            return m456invokegyyYBs(intOffset.m7010unboximpl());
        }

        /* renamed from: invoke--gyyYBs  reason: not valid java name */
        public final AnimationVector2D m456invokegyyYBs(long it) {
            return new AnimationVector2D(IntOffset.m7001getXimpl(it), IntOffset.m7002getYimpl(it));
        }
    }, new Function1<AnimationVector2D, IntOffset>() { // from class: androidx.compose.animation.core.VectorConvertersKt$IntOffsetToVector$2
        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ IntOffset invoke(AnimationVector2D animationVector2D) {
            return IntOffset.m6992boximpl(m457invokeBjo55l4(animationVector2D));
        }

        /* renamed from: invoke-Bjo55l4  reason: not valid java name */
        public final long m457invokeBjo55l4(AnimationVector2D it) {
            float $this$fastRoundToInt$iv = it.getV1();
            int x$iv = Math.round($this$fastRoundToInt$iv);
            float $this$fastRoundToInt$iv2 = it.getV2();
            int y$iv = Math.round($this$fastRoundToInt$iv2);
            return IntOffset.m6995constructorimpl((x$iv << 32) | (y$iv & 4294967295L));
        }
    });
    private static final TwoWayConverter<IntSize, AnimationVector2D> IntSizeToVector = TwoWayConverter(new Function1<IntSize, AnimationVector2D>() { // from class: androidx.compose.animation.core.VectorConvertersKt$IntSizeToVector$1
        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ AnimationVector2D invoke(IntSize intSize) {
            return m458invokeozmzZPI(intSize.m7048unboximpl());
        }

        /* renamed from: invoke-ozmzZPI  reason: not valid java name */
        public final AnimationVector2D m458invokeozmzZPI(long it) {
            return new AnimationVector2D((int) (it >> 32), (int) (4294967295L & it));
        }
    }, new Function1<AnimationVector2D, IntSize>() { // from class: androidx.compose.animation.core.VectorConvertersKt$IntSizeToVector$2
        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ IntSize invoke(AnimationVector2D animationVector2D) {
            return IntSize.m7036boximpl(m459invokeYEO4UFw(animationVector2D));
        }

        /* renamed from: invoke-YEO4UFw  reason: not valid java name */
        public final long m459invokeYEO4UFw(AnimationVector2D it) {
            float $this$fastRoundToInt$iv = it.getV1();
            int $this$fastCoerceAtLeast$iv = Math.round($this$fastRoundToInt$iv);
            if ($this$fastCoerceAtLeast$iv < 0) {
                $this$fastCoerceAtLeast$iv = 0;
            }
            float $this$fastRoundToInt$iv2 = it.getV2();
            int $this$fastCoerceAtLeast$iv2 = Math.round($this$fastRoundToInt$iv2);
            int minimumValue$iv = $this$fastCoerceAtLeast$iv2 >= 0 ? $this$fastCoerceAtLeast$iv2 : 0;
            return IntSize.m7039constructorimpl(($this$fastCoerceAtLeast$iv << 32) | (minimumValue$iv & 4294967295L));
        }
    });
    private static final TwoWayConverter<Rect, AnimationVector4D> RectToVector = TwoWayConverter(new Function1<Rect, AnimationVector4D>() { // from class: androidx.compose.animation.core.VectorConvertersKt$RectToVector$1
        @Override // kotlin.jvm.functions.Function1
        public final AnimationVector4D invoke(Rect it) {
            return new AnimationVector4D(it.getLeft(), it.getTop(), it.getRight(), it.getBottom());
        }
    }, new Function1<AnimationVector4D, Rect>() { // from class: androidx.compose.animation.core.VectorConvertersKt$RectToVector$2
        @Override // kotlin.jvm.functions.Function1
        public final Rect invoke(AnimationVector4D it) {
            return new Rect(it.getV1(), it.getV2(), it.getV3(), it.getV4());
        }
    });

    public static final <T, V extends AnimationVector> TwoWayConverter<T, V> TwoWayConverter(Function1<? super T, ? extends V> function1, Function1<? super V, ? extends T> function12) {
        return new TwoWayConverterImpl(function1, function12);
    }

    public static final float lerp(float start, float stop, float fraction) {
        return ((1.0f - fraction) * start) + (stop * fraction);
    }

    public static final TwoWayConverter<Float, AnimationVector1D> getVectorConverter(FloatCompanionObject $this$VectorConverter) {
        return FloatToVector;
    }

    public static final TwoWayConverter<Integer, AnimationVector1D> getVectorConverter(IntCompanionObject $this$VectorConverter) {
        return IntToVector;
    }

    public static final TwoWayConverter<Rect, AnimationVector4D> getVectorConverter(Rect.Companion $this$VectorConverter) {
        return RectToVector;
    }

    public static final TwoWayConverter<Dp, AnimationVector1D> getVectorConverter(Dp.Companion $this$VectorConverter) {
        return DpToVector;
    }

    public static final TwoWayConverter<DpOffset, AnimationVector2D> getVectorConverter(DpOffset.Companion $this$VectorConverter) {
        return DpOffsetToVector;
    }

    public static final TwoWayConverter<Size, AnimationVector2D> getVectorConverter(Size.Companion $this$VectorConverter) {
        return SizeToVector;
    }

    public static final TwoWayConverter<Offset, AnimationVector2D> getVectorConverter(Offset.Companion $this$VectorConverter) {
        return OffsetToVector;
    }

    public static final TwoWayConverter<IntOffset, AnimationVector2D> getVectorConverter(IntOffset.Companion $this$VectorConverter) {
        return IntOffsetToVector;
    }

    public static final TwoWayConverter<IntSize, AnimationVector2D> getVectorConverter(IntSize.Companion $this$VectorConverter) {
        return IntSizeToVector;
    }
}
