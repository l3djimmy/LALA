package androidx.compose.foundation;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.view.TextureView;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.EffectsKt;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.graphics.AndroidMatrixConversions_androidKt;
import androidx.compose.ui.graphics.Matrix;
import androidx.compose.ui.unit.IntSize;
import androidx.compose.ui.viewinterop.AndroidView_androidKt;
import com.itextpdf.layout.properties.Property;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: AndroidExternalSurface.android.kt */
@Metadata(d1 = {"\u0000H\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u001aU\u0010\u0000\u001a\u00020\u00012\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\t2\u0017\u0010\n\u001a\u0013\u0012\u0004\u0012\u00020\f\u0012\u0004\u0012\u00020\u00010\u000b¢\u0006\u0002\b\rH\u0007ø\u0001\u0000¢\u0006\u0004\b\u000e\u0010\u000f\u001a]\u0010\u0010\u001a\u00020\u00012\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\u0011\u001a\u00020\u00122\b\b\u0002\u0010\u0013\u001a\u00020\u00052\u0017\u0010\n\u001a\u0013\u0012\u0004\u0012\u00020\f\u0012\u0004\u0012\u00020\u00010\u000b¢\u0006\u0002\b\rH\u0007ø\u0001\u0000¢\u0006\u0004\b\u0014\u0010\u0015\u001a\r\u0010\u0016\u001a\u00020\u0017H\u0003¢\u0006\u0002\u0010\u0018\u001a\r\u0010\u0019\u001a\u00020\u001aH\u0003¢\u0006\u0002\u0010\u001b\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u001c"}, d2 = {"AndroidEmbeddedExternalSurface", "", "modifier", "Landroidx/compose/ui/Modifier;", "isOpaque", "", "surfaceSize", "Landroidx/compose/ui/unit/IntSize;", "transform", "Landroidx/compose/ui/graphics/Matrix;", "onInit", "Lkotlin/Function1;", "Landroidx/compose/foundation/AndroidExternalSurfaceScope;", "Lkotlin/ExtensionFunctionType;", "AndroidEmbeddedExternalSurface-sv6N_fY", "(Landroidx/compose/ui/Modifier;ZJ[FLkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V", "AndroidExternalSurface", "zOrder", "Landroidx/compose/foundation/AndroidExternalSurfaceZOrder;", "isSecure", "AndroidExternalSurface-58FFMhA", "(Landroidx/compose/ui/Modifier;ZJIZLkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V", "rememberAndroidEmbeddedExternalSurfaceState", "Landroidx/compose/foundation/AndroidEmbeddedExternalSurfaceState;", "(Landroidx/compose/runtime/Composer;I)Landroidx/compose/foundation/AndroidEmbeddedExternalSurfaceState;", "rememberAndroidExternalSurfaceState", "Landroidx/compose/foundation/AndroidExternalSurfaceState;", "(Landroidx/compose/runtime/Composer;I)Landroidx/compose/foundation/AndroidExternalSurfaceState;", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class AndroidExternalSurface_androidKt {
    private static final AndroidExternalSurfaceState rememberAndroidExternalSurfaceState(Composer $composer, int $changed) {
        ComposerKt.sourceInformationMarkerStart($composer, -873615933, "C(rememberAndroidExternalSurfaceState)189@7199L24,190@7235L47:AndroidExternalSurface.android.kt#71ulvw");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(-873615933, $changed, -1, "androidx.compose.foundation.rememberAndroidExternalSurfaceState (AndroidExternalSurface.android.kt:188)");
        }
        ComposerKt.sourceInformationMarkerStart($composer, 773894976, "CC(rememberCoroutineScope)558@25470L68:Effects.kt#9igjgp");
        ComposerKt.sourceInformationMarkerStart($composer, -954203484, "CC(remember):Effects.kt#9igjgp");
        Object it$iv$iv = $composer.rememberedValue();
        if (it$iv$iv == Composer.Companion.getEmpty()) {
            Object value$iv$iv = EffectsKt.createCompositionCoroutineScope(EmptyCoroutineContext.INSTANCE, $composer);
            $composer.updateRememberedValue(value$iv$iv);
            it$iv$iv = value$iv$iv;
        }
        CoroutineScope scope = (CoroutineScope) it$iv$iv;
        ComposerKt.sourceInformationMarkerEnd($composer);
        ComposerKt.sourceInformationMarkerEnd($composer);
        ComposerKt.sourceInformationMarkerStart($composer, 1983764518, "CC(remember):AndroidExternalSurface.android.kt#9igjgp");
        Object it$iv = $composer.rememberedValue();
        if (it$iv == Composer.Companion.getEmpty()) {
            Object value$iv = new AndroidExternalSurfaceState(scope);
            $composer.updateRememberedValue(value$iv);
            it$iv = value$iv;
        }
        AndroidExternalSurfaceState androidExternalSurfaceState = (AndroidExternalSurfaceState) it$iv;
        ComposerKt.sourceInformationMarkerEnd($composer);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return androidExternalSurfaceState;
    }

    /* JADX WARN: Code restructure failed: missing block: B:105:0x015e, code lost:
        if (r0 != androidx.compose.runtime.Composer.Companion.getEmpty()) goto L48;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:140:0x021f  */
    /* JADX WARN: Type inference failed for: r0v5 */
    /* renamed from: AndroidExternalSurface-58FFMhA  reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void m497AndroidExternalSurface58FFMhA(androidx.compose.ui.Modifier r23, boolean r24, long r25, int r27, boolean r28, final kotlin.jvm.functions.Function1<? super androidx.compose.foundation.AndroidExternalSurfaceScope, kotlin.Unit> r29, androidx.compose.runtime.Composer r30, final int r31, final int r32) {
        /*
            Method dump skipped, instructions count: 585
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.AndroidExternalSurface_androidKt.m497AndroidExternalSurface58FFMhA(androidx.compose.ui.Modifier, boolean, long, int, boolean, kotlin.jvm.functions.Function1, androidx.compose.runtime.Composer, int, int):void");
    }

    private static final AndroidEmbeddedExternalSurfaceState rememberAndroidEmbeddedExternalSurfaceState(Composer $composer, int $changed) {
        ComposerKt.sourceInformationMarkerStart($composer, -1057437053, "C(rememberAndroidEmbeddedExternalSurfaceState)372@14916L24,373@14952L55:AndroidExternalSurface.android.kt#71ulvw");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(-1057437053, $changed, -1, "androidx.compose.foundation.rememberAndroidEmbeddedExternalSurfaceState (AndroidExternalSurface.android.kt:371)");
        }
        ComposerKt.sourceInformationMarkerStart($composer, 773894976, "CC(rememberCoroutineScope)558@25470L68:Effects.kt#9igjgp");
        ComposerKt.sourceInformationMarkerStart($composer, -954203484, "CC(remember):Effects.kt#9igjgp");
        Object it$iv$iv = $composer.rememberedValue();
        if (it$iv$iv == Composer.Companion.getEmpty()) {
            Object value$iv$iv = EffectsKt.createCompositionCoroutineScope(EmptyCoroutineContext.INSTANCE, $composer);
            $composer.updateRememberedValue(value$iv$iv);
            it$iv$iv = value$iv$iv;
        }
        CoroutineScope scope = (CoroutineScope) it$iv$iv;
        ComposerKt.sourceInformationMarkerEnd($composer);
        ComposerKt.sourceInformationMarkerEnd($composer);
        ComposerKt.sourceInformationMarkerStart($composer, 1142290424, "CC(remember):AndroidExternalSurface.android.kt#9igjgp");
        Object it$iv = $composer.rememberedValue();
        if (it$iv == Composer.Companion.getEmpty()) {
            Object value$iv = new AndroidEmbeddedExternalSurfaceState(scope);
            $composer.updateRememberedValue(value$iv);
            it$iv = value$iv;
        }
        AndroidEmbeddedExternalSurfaceState androidEmbeddedExternalSurfaceState = (AndroidEmbeddedExternalSurfaceState) it$iv;
        ComposerKt.sourceInformationMarkerEnd($composer);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return androidEmbeddedExternalSurfaceState;
    }

    /* renamed from: AndroidEmbeddedExternalSurface-sv6N_fY  reason: not valid java name */
    public static final void m496AndroidEmbeddedExternalSurfacesv6N_fY(Modifier modifier, boolean isOpaque, long surfaceSize, float[] transform, final Function1<? super AndroidExternalSurfaceScope, Unit> function1, Composer $composer, final int $changed, final int i) {
        Object obj;
        boolean z;
        long surfaceSize2;
        Object obj2;
        final float[] transform2;
        final Modifier modifier2;
        final boolean isOpaque2;
        final long surfaceSize3;
        Modifier.Companion modifier3;
        final float[] transform3;
        final boolean isOpaque3;
        final long surfaceSize4;
        int i2;
        Composer $composer2 = $composer.startRestartGroup(217541314);
        ComposerKt.sourceInformation($composer2, "C(AndroidEmbeddedExternalSurface)P(1!1,3:c#ui.unit.IntSize,4:c#ui.graphics.Matrix)434@18616L45,440@18787L639,436@18667L765:AndroidExternalSurface.android.kt#71ulvw");
        int $dirty = $changed;
        int i3 = i & 1;
        if (i3 != 0) {
            $dirty |= 6;
            obj = modifier;
        } else if (($changed & 6) == 0) {
            obj = modifier;
            $dirty |= $composer2.changed(obj) ? 4 : 2;
        } else {
            obj = modifier;
        }
        int i4 = i & 2;
        if (i4 != 0) {
            $dirty |= 48;
            z = isOpaque;
        } else if (($changed & 48) == 0) {
            z = isOpaque;
            $dirty |= $composer2.changed(z) ? 32 : 16;
        } else {
            z = isOpaque;
        }
        if (($changed & 384) == 0) {
            if ((i & 4) == 0) {
                surfaceSize2 = surfaceSize;
                if ($composer2.changed(surfaceSize2)) {
                    i2 = 256;
                    $dirty |= i2;
                }
            } else {
                surfaceSize2 = surfaceSize;
            }
            i2 = 128;
            $dirty |= i2;
        } else {
            surfaceSize2 = surfaceSize;
        }
        int i5 = i & 8;
        if (i5 != 0) {
            $dirty |= 3072;
        } else if (($changed & 3072) == 0) {
            $dirty |= $composer2.changedInstance(transform != null ? Matrix.m4517boximpl(transform) : null) ? 2048 : 1024;
        }
        if ((i & 16) != 0) {
            $dirty |= 24576;
            obj2 = function1;
        } else if (($changed & 24576) == 0) {
            obj2 = function1;
            $dirty |= $composer2.changedInstance(obj2) ? 16384 : 8192;
        } else {
            obj2 = function1;
        }
        if ($composer2.shouldExecute(($dirty & 9363) != 9362, $dirty & 1)) {
            $composer2.startDefaults();
            if (($changed & 1) == 0 || $composer2.getDefaultsInvalid()) {
                modifier3 = i3 != 0 ? Modifier.Companion : obj;
                boolean isOpaque4 = i4 != 0 ? true : z;
                if ((i & 4) != 0) {
                    $dirty &= -897;
                    surfaceSize2 = IntSize.Companion.m7049getZeroYbymL2g();
                }
                if (i5 != 0) {
                    isOpaque3 = isOpaque4;
                    transform3 = null;
                } else {
                    transform3 = transform;
                    isOpaque3 = isOpaque4;
                }
            } else {
                $composer2.skipToGroupEnd();
                if ((i & 4) != 0) {
                    $dirty &= -897;
                }
                transform3 = transform;
                modifier3 = obj;
                isOpaque3 = z;
            }
            $composer2.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(217541314, $dirty, -1, "androidx.compose.foundation.AndroidEmbeddedExternalSurface (AndroidExternalSurface.android.kt:433)");
            }
            final AndroidEmbeddedExternalSurfaceState state = rememberAndroidEmbeddedExternalSurfaceState($composer2, 0);
            AndroidExternalSurface_androidKt$AndroidEmbeddedExternalSurface$1 androidExternalSurface_androidKt$AndroidEmbeddedExternalSurface$1 = new Function1<Context, TextureView>() { // from class: androidx.compose.foundation.AndroidExternalSurface_androidKt$AndroidEmbeddedExternalSurface$1
                @Override // kotlin.jvm.functions.Function1
                public final TextureView invoke(Context it) {
                    return new TextureView(it);
                }
            };
            AndroidExternalSurface_androidKt$AndroidEmbeddedExternalSurface$2 androidExternalSurface_androidKt$AndroidEmbeddedExternalSurface$2 = new Function1<TextureView, Unit>() { // from class: androidx.compose.foundation.AndroidExternalSurface_androidKt$AndroidEmbeddedExternalSurface$2
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(TextureView textureView) {
                    invoke2(textureView);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(TextureView it) {
                }
            };
            ComposerKt.sourceInformationMarkerStart($composer2, 184044994, "CC(remember):AndroidExternalSurface.android.kt#9igjgp");
            boolean invalid$iv = (((($dirty & 896) ^ 384) > 256 && $composer2.changed(surfaceSize2)) || ($dirty & 384) == 256) | $composer2.changedInstance(state) | ((57344 & $dirty) == 16384) | (($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) == 32) | $composer2.changedInstance(transform3 != null ? Matrix.m4517boximpl(transform3) : null);
            Object it$iv = $composer2.rememberedValue();
            if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
                surfaceSize4 = surfaceSize2;
                final Function1<? super AndroidExternalSurfaceScope, Unit> function12 = obj2;
                Object value$iv = (Function1) new Function1<TextureView, Unit>() { // from class: androidx.compose.foundation.AndroidExternalSurface_androidKt$AndroidEmbeddedExternalSurface$3$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    /* JADX WARN: Multi-variable type inference failed */
                    {
                        super(1);
                    }

                    @Override // kotlin.jvm.functions.Function1
                    public /* bridge */ /* synthetic */ Unit invoke(TextureView textureView) {
                        invoke2(textureView);
                        return Unit.INSTANCE;
                    }

                    /* renamed from: invoke  reason: avoid collision after fix types in other method */
                    public final void invoke2(TextureView view) {
                        android.graphics.Matrix $this$invoke_u24lambda_u241_u24lambda_u240;
                        SurfaceTexture surfaceTexture;
                        if (!IntSize.m7042equalsimpl0(surfaceSize4, IntSize.Companion.m7049getZeroYbymL2g()) && (surfaceTexture = view.getSurfaceTexture()) != null) {
                            long arg0$iv = surfaceSize4;
                            long arg0$iv2 = surfaceSize4;
                            surfaceTexture.setDefaultBufferSize((int) (arg0$iv >> 32), (int) (4294967295L & arg0$iv2));
                        }
                        state.m485setSurfaceSizeozmzZPI(surfaceSize4);
                        if (view.getSurfaceTextureListener() != state) {
                            function12.invoke(state);
                            view.setSurfaceTextureListener(state);
                        }
                        view.setOpaque(isOpaque3);
                        if (transform3 != null) {
                            AndroidEmbeddedExternalSurfaceState androidEmbeddedExternalSurfaceState = state;
                            float[] fArr = transform3;
                            $this$invoke_u24lambda_u241_u24lambda_u240 = androidEmbeddedExternalSurfaceState.getMatrix();
                            AndroidMatrixConversions_androidKt.m4159setFromEL8BTi8($this$invoke_u24lambda_u241_u24lambda_u240, fArr);
                        } else {
                            $this$invoke_u24lambda_u241_u24lambda_u240 = null;
                        }
                        view.setTransform($this$invoke_u24lambda_u241_u24lambda_u240);
                    }
                };
                $composer2.updateRememberedValue(value$iv);
                it$iv = value$iv;
            } else {
                surfaceSize4 = surfaceSize2;
            }
            ComposerKt.sourceInformationMarkerEnd($composer2);
            Modifier modifier4 = modifier3;
            AndroidView_androidKt.AndroidView(androidExternalSurface_androidKt$AndroidEmbeddedExternalSurface$1, modifier4, androidExternalSurface_androidKt$AndroidEmbeddedExternalSurface$2, null, (Function1) it$iv, $composer2, (($dirty << 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | 390, 8);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier2 = modifier4;
            surfaceSize3 = surfaceSize4;
            isOpaque2 = isOpaque3;
            transform2 = transform3;
        } else {
            $composer2.skipToGroupEnd();
            transform2 = transform;
            modifier2 = obj;
            isOpaque2 = z;
            surfaceSize3 = surfaceSize2;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.AndroidExternalSurface_androidKt$AndroidEmbeddedExternalSurface$4
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                    invoke(composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(Composer composer, int i6) {
                    AndroidExternalSurface_androidKt.m496AndroidEmbeddedExternalSurfacesv6N_fY(Modifier.this, isOpaque2, surfaceSize3, transform2, function1, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }
}
