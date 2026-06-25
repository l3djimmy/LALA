package androidx.compose.foundation.text.selection;

import androidx.compose.foundation.layout.SizeKt;
import androidx.compose.foundation.layout.SpacerKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.ui.Alignment;
import androidx.compose.ui.ComposedModifierKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.draw.CacheDrawScope;
import androidx.compose.ui.draw.DrawModifierKt;
import androidx.compose.ui.draw.DrawResult;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.Size;
import androidx.compose.ui.graphics.BlendMode;
import androidx.compose.ui.graphics.Canvas;
import androidx.compose.ui.graphics.CanvasKt;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.ColorFilter;
import androidx.compose.ui.graphics.ColorKt;
import androidx.compose.ui.graphics.ImageBitmap;
import androidx.compose.ui.graphics.ImageBitmapConfig;
import androidx.compose.ui.graphics.ImageBitmapKt;
import androidx.compose.ui.graphics.drawscope.CanvasDrawScope;
import androidx.compose.ui.graphics.drawscope.ContentDrawScope;
import androidx.compose.ui.graphics.drawscope.DrawContext;
import androidx.compose.ui.graphics.drawscope.DrawScope;
import androidx.compose.ui.graphics.drawscope.DrawTransform;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.compose.ui.window.AndroidPopup_androidKt;
import androidx.compose.ui.window.PopupProperties;
import androidx.compose.ui.window.SecureFlagPolicy;
import com.itextpdf.layout.properties.Property;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.DefaultConstructorMarker;
/* compiled from: AndroidSelectionHandles.android.kt */
@Metadata(d1 = {"\u0000N\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u001a0\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0011\u0010\u0006\u001a\r\u0012\u0004\u0012\u00020\u00010\u0007¢\u0006\u0002\b\bH\u0001¢\u0006\u0002\u0010\t\u001aL\u0010\n\u001a\u00020\u00012\u0006\u0010\u000b\u001a\u00020\u00032\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\r2\b\b\u0002\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u0016H\u0001ø\u0001\u0000¢\u0006\u0004\b\u0017\u0010\u0018\u001a+\u0010\u0019\u001a\u00020\u00012\u0006\u0010\u0015\u001a\u00020\u00162\f\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\r0\u00072\u0006\u0010\u001b\u001a\u00020\rH\u0001¢\u0006\u0002\u0010\u001c\u001a\u0014\u0010\u001d\u001a\u00020\u001e*\u00020\u001f2\u0006\u0010 \u001a\u00020\u0014H\u0000\u001a\"\u0010!\u001a\u00020\u0016*\u00020\u00162\f\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\r0\u00072\u0006\u0010\u001b\u001a\u00020\rH\u0000\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\""}, d2 = {"HandlePopup", "", "positionProvider", "Landroidx/compose/foundation/text/selection/OffsetProvider;", "handleReferencePoint", "Landroidx/compose/ui/Alignment;", "content", "Lkotlin/Function0;", "Landroidx/compose/runtime/Composable;", "(Landroidx/compose/foundation/text/selection/OffsetProvider;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V", "SelectionHandle", "offsetProvider", "isStartHandle", "", "direction", "Landroidx/compose/ui/text/style/ResolvedTextDirection;", "handlesCrossed", "minTouchTargetSize", "Landroidx/compose/ui/unit/DpSize;", "lineHeight", "", "modifier", "Landroidx/compose/ui/Modifier;", "SelectionHandle-wLIcFTc", "(Landroidx/compose/foundation/text/selection/OffsetProvider;ZLandroidx/compose/ui/text/style/ResolvedTextDirection;ZJFLandroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;II)V", "SelectionHandleIcon", "iconVisible", "isLeft", "(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function0;ZLandroidx/compose/runtime/Composer;I)V", "createHandleImage", "Landroidx/compose/ui/graphics/ImageBitmap;", "Landroidx/compose/ui/draw/CacheDrawScope;", "radius", "drawSelectionHandle", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class AndroidSelectionHandles_androidKt {
    /* JADX WARN: Code restructure failed: missing block: B:108:0x0151, code lost:
        if (r15 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L56;
     */
    /* renamed from: SelectionHandle-wLIcFTc  reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void m1697SelectionHandlewLIcFTc(final androidx.compose.foundation.text.selection.OffsetProvider r20, final boolean r21, androidx.compose.ui.text.style.ResolvedTextDirection r22, boolean r23, long r24, final float r26, final androidx.compose.ui.Modifier r27, androidx.compose.runtime.Composer r28, final int r29, final int r30) {
        /*
            Method dump skipped, instructions count: 484
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.selection.AndroidSelectionHandles_androidKt.m1697SelectionHandlewLIcFTc(androidx.compose.foundation.text.selection.OffsetProvider, boolean, androidx.compose.ui.text.style.ResolvedTextDirection, boolean, long, float, androidx.compose.ui.Modifier, androidx.compose.runtime.Composer, int, int):void");
    }

    public static final void SelectionHandleIcon(final Modifier modifier, final Function0<Boolean> function0, final boolean isLeft, Composer $composer, final int $changed) {
        Composer $composer2 = $composer.startRestartGroup(2111672474);
        ComposerKt.sourceInformation($composer2, "C(SelectionHandleIcon)P(2)128@5180L89:AndroidSelectionHandles.android.kt#eksfi3");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= $composer2.changed(modifier) ? 4 : 2;
        }
        if (($changed & 48) == 0) {
            $dirty |= $composer2.changedInstance(function0) ? 32 : 16;
        }
        if (($changed & 384) == 0) {
            $dirty |= $composer2.changed(isLeft) ? 256 : 128;
        }
        if ($composer2.shouldExecute(($dirty & 147) != 146, $dirty & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(2111672474, $dirty, -1, "androidx.compose.foundation.text.selection.SelectionHandleIcon (AndroidSelectionHandles.android.kt:127)");
            }
            SpacerKt.Spacer(drawSelectionHandle(SizeKt.m1042sizeVpY3zN4(modifier, SelectionHandlesKt.getHandleWidth(), SelectionHandlesKt.getHandleHeight()), function0, isLeft), $composer2, 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer2.skipToGroupEnd();
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.text.selection.AndroidSelectionHandles_androidKt$SelectionHandleIcon$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                    invoke(composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(Composer composer, int i) {
                    AndroidSelectionHandles_androidKt.SelectionHandleIcon(Modifier.this, function0, isLeft, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1));
                }
            });
        }
    }

    public static final Modifier drawSelectionHandle(Modifier $this$drawSelectionHandle, final Function0<Boolean> function0, final boolean isLeft) {
        return ComposedModifierKt.composed$default($this$drawSelectionHandle, null, new Function3<Modifier, Composer, Integer, Modifier>() { // from class: androidx.compose.foundation.text.selection.AndroidSelectionHandles_androidKt$drawSelectionHandle$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(3);
            }

            @Override // kotlin.jvm.functions.Function3
            public /* bridge */ /* synthetic */ Modifier invoke(Modifier modifier, Composer composer, Integer num) {
                return invoke(modifier, composer, num.intValue());
            }

            public final Modifier invoke(Modifier $this$composed, Composer $composer, int $changed) {
                $composer.startReplaceGroup(-196777734);
                ComposerKt.sourceInformation($composer, "C133@5438L7,134@5485L678:AndroidSelectionHandles.android.kt#eksfi3");
                if (ComposerKt.isTraceInProgress()) {
                    ComposerKt.traceEventStart(-196777734, $changed, -1, "androidx.compose.foundation.text.selection.drawSelectionHandle.<anonymous> (AndroidSelectionHandles.android.kt:133)");
                }
                ComposerKt.sourceInformationMarkerStart($composer, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
                Object consume = $composer.consume(TextSelectionColorsKt.getLocalTextSelectionColors());
                ComposerKt.sourceInformationMarkerEnd($composer);
                final long handleColor = ((TextSelectionColors) consume).m1782getHandleColor0d7_KjU();
                ComposerKt.sourceInformationMarkerStart($composer, 1976987148, "CC(remember):AndroidSelectionHandles.android.kt#9igjgp");
                boolean invalid$iv = $composer.changed(handleColor) | $composer.changed(function0) | $composer.changed(isLeft);
                final Function0<Boolean> function02 = function0;
                final boolean z = isLeft;
                Object it$iv = $composer.rememberedValue();
                if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
                    Object value$iv = (Function1) new Function1<CacheDrawScope, DrawResult>() { // from class: androidx.compose.foundation.text.selection.AndroidSelectionHandles_androidKt$drawSelectionHandle$1$1$1
                        /* JADX INFO: Access modifiers changed from: package-private */
                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        {
                            super(1);
                        }

                        @Override // kotlin.jvm.functions.Function1
                        public final DrawResult invoke(CacheDrawScope $this$drawWithCache) {
                            long arg0$iv = $this$drawWithCache.m3909getSizeNHjbRc();
                            int bits$iv$iv$iv = (int) (arg0$iv >> 32);
                            float radius = Float.intBitsToFloat(bits$iv$iv$iv) / 2.0f;
                            final ImageBitmap handleImage = AndroidSelectionHandles_androidKt.createHandleImage($this$drawWithCache, radius);
                            final ColorFilter colorFilter = ColorFilter.Companion.m4330tintxETnrds$default(ColorFilter.Companion, handleColor, 0, 2, null);
                            final Function0<Boolean> function03 = function02;
                            final boolean z2 = z;
                            return $this$drawWithCache.onDrawWithContent(new Function1<ContentDrawScope, Unit>() { // from class: androidx.compose.foundation.text.selection.AndroidSelectionHandles_androidKt$drawSelectionHandle$1$1$1.1
                                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                                {
                                    super(1);
                                }

                                @Override // kotlin.jvm.functions.Function1
                                public /* bridge */ /* synthetic */ Unit invoke(ContentDrawScope contentDrawScope) {
                                    invoke2(contentDrawScope);
                                    return Unit.INSTANCE;
                                }

                                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                                public final void invoke2(ContentDrawScope $this$onDrawWithContent) {
                                    DrawContext $this$withTransform_u24lambda_u246$iv$iv;
                                    long previousSize$iv$iv;
                                    $this$onDrawWithContent.drawContent();
                                    if (!function03.invoke().booleanValue()) {
                                        return;
                                    }
                                    if (!z2) {
                                        DrawScope.m4824drawImagegbVJVH8$default($this$onDrawWithContent, handleImage, 0L, 0.0f, null, colorFilter, 0, 46, null);
                                        return;
                                    }
                                    ContentDrawScope $this$scale_u2dFgt4K4Q_u24default$iv = $this$onDrawWithContent;
                                    ImageBitmap imageBitmap = handleImage;
                                    ColorFilter colorFilter2 = colorFilter;
                                    long pivot$iv = $this$scale_u2dFgt4K4Q_u24default$iv.mo4839getCenterF1C5BW0();
                                    DrawContext $this$withTransform_u24lambda_u246$iv$iv2 = $this$scale_u2dFgt4K4Q_u24default$iv.getDrawContext();
                                    long previousSize$iv$iv2 = $this$withTransform_u24lambda_u246$iv$iv2.mo4761getSizeNHjbRc();
                                    $this$withTransform_u24lambda_u246$iv$iv2.getCanvas().save();
                                    try {
                                        DrawTransform $this$scale_Fgt4K4Q_u24lambda_u242$iv = $this$withTransform_u24lambda_u246$iv$iv2.getTransform();
                                        $this$scale_Fgt4K4Q_u24lambda_u242$iv.mo4768scale0AR0LA0(-1.0f, 1.0f, pivot$iv);
                                        previousSize$iv$iv = previousSize$iv$iv2;
                                        try {
                                            DrawScope.m4824drawImagegbVJVH8$default($this$scale_u2dFgt4K4Q_u24default$iv, imageBitmap, 0L, 0.0f, null, colorFilter2, 0, 46, null);
                                            $this$withTransform_u24lambda_u246$iv$iv2.getCanvas().restore();
                                            $this$withTransform_u24lambda_u246$iv$iv2.mo4762setSizeuvyYCjk(previousSize$iv$iv);
                                        } catch (Throwable th) {
                                            th = th;
                                            $this$withTransform_u24lambda_u246$iv$iv = $this$withTransform_u24lambda_u246$iv$iv2;
                                            $this$withTransform_u24lambda_u246$iv$iv.getCanvas().restore();
                                            $this$withTransform_u24lambda_u246$iv$iv.mo4762setSizeuvyYCjk(previousSize$iv$iv);
                                            throw th;
                                        }
                                    } catch (Throwable th2) {
                                        th = th2;
                                        $this$withTransform_u24lambda_u246$iv$iv = $this$withTransform_u24lambda_u246$iv$iv2;
                                        previousSize$iv$iv = previousSize$iv$iv2;
                                    }
                                }
                            });
                        }
                    };
                    $composer.updateRememberedValue(value$iv);
                    it$iv = value$iv;
                }
                ComposerKt.sourceInformationMarkerEnd($composer);
                Modifier drawWithCache = DrawModifierKt.drawWithCache($this$composed, (Function1) it$iv);
                if (ComposerKt.isTraceInProgress()) {
                    ComposerKt.traceEventEnd();
                }
                $composer.endReplaceGroup();
                return drawWithCache;
            }
        }, 1, null);
    }

    public static final ImageBitmap createHandleImage(CacheDrawScope $this$createHandleImage, float radius) {
        int edge;
        ImageBitmap imageBitmap;
        Canvas canvas;
        CanvasDrawScope drawScope;
        int edge2 = ((int) Math.ceil(radius)) * 2;
        ImageBitmap imageBitmap2 = HandleImageCache.INSTANCE.getImageBitmap();
        Canvas canvas2 = HandleImageCache.INSTANCE.getCanvas();
        CanvasDrawScope drawScope2 = HandleImageCache.INSTANCE.getCanvasDrawScope();
        if (imageBitmap2 == null || canvas2 == null || edge2 > imageBitmap2.getWidth() || edge2 > imageBitmap2.getHeight()) {
            ImageBitmap imageBitmap3 = ImageBitmapKt.m4514ImageBitmapx__hDU$default(edge2, edge2, ImageBitmapConfig.Companion.m4508getAlpha8_sVssgQ(), false, null, 24, null);
            edge = edge2;
            HandleImageCache.INSTANCE.setImageBitmap(imageBitmap3);
            Canvas canvas3 = CanvasKt.Canvas(imageBitmap3);
            HandleImageCache.INSTANCE.setCanvas(canvas3);
            imageBitmap = imageBitmap3;
            canvas = canvas3;
        } else {
            edge = edge2;
            imageBitmap = imageBitmap2;
            canvas = canvas2;
        }
        if (drawScope2 != null) {
            drawScope = drawScope2;
        } else {
            CanvasDrawScope drawScope3 = new CanvasDrawScope();
            HandleImageCache.INSTANCE.setCanvasDrawScope(drawScope3);
            drawScope = drawScope3;
        }
        LayoutDirection layoutDirection$iv = $this$createHandleImage.getLayoutDirection();
        float width$iv = imageBitmap.getWidth();
        float height$iv = imageBitmap.getHeight();
        long v1$iv$iv = Float.floatToRawIntBits(width$iv);
        long v2$iv$iv = Float.floatToRawIntBits(height$iv);
        long size$iv = Size.m4108constructorimpl((v1$iv$iv << 32) | (v2$iv$iv & 4294967295L));
        CanvasDrawScope this_$iv = drawScope;
        CanvasDrawScope.DrawParams drawParams = this_$iv.getDrawParams();
        Density prevDensity$iv = drawParams.component1();
        LayoutDirection prevLayoutDirection$iv = drawParams.component2();
        Canvas prevCanvas$iv = drawParams.component3();
        long prevSize$iv = drawParams.m4757component4NHjbRc();
        CanvasDrawScope.DrawParams $this$draw_yzxVdVo_u24lambda_u240$iv = this_$iv.getDrawParams();
        $this$draw_yzxVdVo_u24lambda_u240$iv.setDensity($this$createHandleImage);
        $this$draw_yzxVdVo_u24lambda_u240$iv.setLayoutDirection(layoutDirection$iv);
        $this$draw_yzxVdVo_u24lambda_u240$iv.setCanvas(canvas);
        $this$draw_yzxVdVo_u24lambda_u240$iv.m4760setSizeuvyYCjk(size$iv);
        canvas.save();
        CanvasDrawScope $this$createHandleImage_u24lambda_u241 = this_$iv;
        DrawScope.m4834drawRectnJ9OG0$default($this$createHandleImage_u24lambda_u241, Color.Companion.m4315getBlack0d7_KjU(), 0L, $this$createHandleImage_u24lambda_u241.mo4840getSizeNHjbRc(), 0.0f, null, null, BlendMode.Companion.m4204getClear0nO6VwU(), 58, null);
        long Color = ColorKt.Color(4278190080L);
        long m4064getZeroF1C5BW0 = Offset.Companion.m4064getZeroF1C5BW0();
        long v1$iv$iv2 = Float.floatToRawIntBits(radius);
        long v2$iv$iv2 = Float.floatToRawIntBits(radius);
        DrawScope.m4834drawRectnJ9OG0$default($this$createHandleImage_u24lambda_u241, Color, m4064getZeroF1C5BW0, Size.m4108constructorimpl((v1$iv$iv2 << 32) | (v2$iv$iv2 & 4294967295L)), 0.0f, null, null, 0, 120, null);
        long Color2 = ColorKt.Color(4278190080L);
        long v1$iv$iv3 = Float.floatToRawIntBits(radius);
        int $i$f$Offset = Float.floatToRawIntBits(radius);
        long v2$iv$iv3 = $i$f$Offset;
        ImageBitmap imageBitmap4 = imageBitmap;
        DrawScope.m4821drawCircleVaOC9Bg$default($this$createHandleImage_u24lambda_u241, Color2, radius, Offset.m4040constructorimpl((v1$iv$iv3 << 32) | (v2$iv$iv3 & 4294967295L)), 0.0f, null, null, 0, 120, null);
        canvas.restore();
        CanvasDrawScope.DrawParams $this$draw_yzxVdVo_u24lambda_u241$iv = this_$iv.getDrawParams();
        $this$draw_yzxVdVo_u24lambda_u241$iv.setDensity(prevDensity$iv);
        $this$draw_yzxVdVo_u24lambda_u241$iv.setLayoutDirection(prevLayoutDirection$iv);
        $this$draw_yzxVdVo_u24lambda_u241$iv.setCanvas(prevCanvas$iv);
        $this$draw_yzxVdVo_u24lambda_u241$iv.m4760setSizeuvyYCjk(prevSize$iv);
        return imageBitmap4;
    }

    public static final void HandlePopup(final OffsetProvider positionProvider, final Alignment handleReferencePoint, final Function2<? super Composer, ? super Integer, Unit> function2, Composer $composer, final int $changed) {
        Composer $composer2 = $composer.startRestartGroup(476043083);
        ComposerKt.sourceInformation($composer2, "C(HandlePopup)P(2,1)225@8875L135,228@9015L190:AndroidSelectionHandles.android.kt#eksfi3");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= ($changed & 8) == 0 ? $composer2.changed(positionProvider) : $composer2.changedInstance(positionProvider) ? 4 : 2;
        }
        if (($changed & 48) == 0) {
            $dirty |= $composer2.changed(handleReferencePoint) ? 32 : 16;
        }
        if (($changed & 384) == 0) {
            $dirty |= $composer2.changedInstance(function2) ? 256 : 128;
        }
        int $dirty2 = $dirty;
        boolean z = false;
        if ($composer2.shouldExecute(($dirty2 & 147) != 146, $dirty2 & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(476043083, $dirty2, -1, "androidx.compose.foundation.text.selection.HandlePopup (AndroidSelectionHandles.android.kt:223)");
            }
            ComposerKt.sourceInformationMarkerStart($composer2, 1288572034, "CC(remember):AndroidSelectionHandles.android.kt#9igjgp");
            boolean z2 = ($dirty2 & Property.BORDER_BOTTOM_RIGHT_RADIUS) == 32;
            if (($dirty2 & 14) == 4 || (($dirty2 & 8) != 0 && $composer2.changed(positionProvider))) {
                z = true;
            }
            boolean invalid$iv = z2 | z;
            Object it$iv = $composer2.rememberedValue();
            if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
                Object value$iv = new HandlePositionProvider(handleReferencePoint, positionProvider);
                $composer2.updateRememberedValue(value$iv);
                it$iv = value$iv;
            }
            HandlePositionProvider popupPositionProvider = (HandlePositionProvider) it$iv;
            ComposerKt.sourceInformationMarkerEnd($composer2);
            AndroidPopup_androidKt.Popup(popupPositionProvider, null, new PopupProperties(false, false, false, (SecureFlagPolicy) null, true, false, 15, (DefaultConstructorMarker) null), function2, $composer2, (($dirty2 << 3) & 7168) | 384, 2);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer2.skipToGroupEnd();
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.text.selection.AndroidSelectionHandles_androidKt$HandlePopup$1
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

                public final void invoke(Composer composer, int i) {
                    AndroidSelectionHandles_androidKt.HandlePopup(OffsetProvider.this, handleReferencePoint, function2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1));
                }
            });
        }
    }
}
