package androidx.compose.animation;

import androidx.autofill.HintConstants;
import androidx.compose.animation.core.AnimationSpecKt;
import androidx.compose.animation.core.FiniteAnimationSpec;
import androidx.compose.animation.core.SpringSpec;
import androidx.compose.animation.core.Transition;
import androidx.compose.animation.core.VisibilityThresholdsKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.ui.Alignment;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.unit.IntSize;
import androidx.exifinterface.media.ExifInterface;
import androidx.profileinstaller.ProfileVerifier;
import com.itextpdf.layout.properties.Property;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.ReplaceWith;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function4;
/* compiled from: AnimatedContent.kt */
@Metadata(d1 = {"\u0000z\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a´\u0001\u0010\u0003\u001a\u00020\u0004\"\u0004\b\u0000\u0010\u00052\u0006\u0010\u0006\u001a\u0002H\u00052\b\b\u0002\u0010\u0007\u001a\u00020\b2\u001f\b\u0002\u0010\t\u001a\u0019\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u00050\u000b\u0012\u0004\u0012\u00020\f0\n¢\u0006\u0002\b\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112%\b\u0002\u0010\u0012\u001a\u001f\u0012\u0013\u0012\u0011H\u0005¢\u0006\f\b\u0013\u0012\b\b\u0014\u0012\u0004\b\b(\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00150\n21\u0010\u0016\u001a-\u0012\u0004\u0012\u00020\u0018\u0012\u0013\u0012\u0011H\u0005¢\u0006\f\b\u0013\u0012\b\b\u0014\u0012\u0004\b\b(\u0006\u0012\u0004\u0012\u00020\u00040\u0017¢\u0006\u0002\b\u0019¢\u0006\u0002\b\rH\u0007¢\u0006\u0002\u0010\u001a\u001aP\u0010\u001b\u001a\u00020\u001c2\b\b\u0002\u0010\u001d\u001a\u00020\u001e2>\b\u0002\u0010\u001f\u001a8\u0012\u0013\u0012\u00110\u0001¢\u0006\f\b\u0013\u0012\b\b\u0014\u0012\u0004\b\b( \u0012\u0013\u0012\u00110\u0001¢\u0006\f\b\u0013\u0012\b\b\u0014\u0012\u0004\b\b(!\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00010\"0\u0017\u001a¬\u0001\u0010\u0003\u001a\u00020\u0004\"\u0004\b\u0000\u0010\u0005*\b\u0012\u0004\u0012\u0002H\u00050#2\b\b\u0002\u0010\u0007\u001a\u00020\b2\u001f\b\u0002\u0010\t\u001a\u0019\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u00050\u000b\u0012\u0004\u0012\u00020\f0\n¢\u0006\u0002\b\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2%\b\u0002\u0010\u0012\u001a\u001f\u0012\u0013\u0012\u0011H\u0005¢\u0006\f\b\u0013\u0012\b\b\u0014\u0012\u0004\b\b(\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00150\n21\u0010\u0016\u001a-\u0012\u0004\u0012\u00020\u0018\u0012\u0013\u0012\u0011H\u0005¢\u0006\f\b\u0013\u0012\b\b\u0014\u0012\u0004\b\b(\u0006\u0012\u0004\u0012\u00020\u00040\u0017¢\u0006\u0002\b\u0019¢\u0006\u0002\b\rH\u0007¢\u0006\u0002\u0010$\u001a\u0015\u0010%\u001a\u00020\f*\u00020&2\u0006\u0010'\u001a\u00020(H\u0086\u0004\u001a\u0015\u0010)\u001a\u00020\f*\u00020&2\u0006\u0010'\u001a\u00020(H\u0087\u0004\"\u0010\u0010\u0000\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0002¨\u0006*"}, d2 = {"UnspecifiedSize", "Landroidx/compose/ui/unit/IntSize;", "J", "AnimatedContent", "", ExifInterface.LATITUDE_SOUTH, "targetState", "modifier", "Landroidx/compose/ui/Modifier;", "transitionSpec", "Lkotlin/Function1;", "Landroidx/compose/animation/AnimatedContentTransitionScope;", "Landroidx/compose/animation/ContentTransform;", "Lkotlin/ExtensionFunctionType;", "contentAlignment", "Landroidx/compose/ui/Alignment;", "label", "", "contentKey", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "", "content", "Lkotlin/Function2;", "Landroidx/compose/animation/AnimatedContentScope;", "Landroidx/compose/runtime/Composable;", "(Ljava/lang/Object;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function1;Landroidx/compose/ui/Alignment;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;Landroidx/compose/runtime/Composer;II)V", "SizeTransform", "Landroidx/compose/animation/SizeTransform;", "clip", "", "sizeAnimationSpec", "initialSize", "targetSize", "Landroidx/compose/animation/core/FiniteAnimationSpec;", "Landroidx/compose/animation/core/Transition;", "(Landroidx/compose/animation/core/Transition;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function1;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;Landroidx/compose/runtime/Composer;II)V", "togetherWith", "Landroidx/compose/animation/EnterTransition;", "exit", "Landroidx/compose/animation/ExitTransition;", "with", "animation"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class AnimatedContentKt {
    private static final long UnspecifiedSize = IntSize.m7039constructorimpl((Integer.MIN_VALUE << 32) | (Integer.MIN_VALUE & 4294967295L));

    public static final <S> void AnimatedContent(final S s, Modifier modifier, Function1<? super AnimatedContentTransitionScope<S>, ContentTransform> function1, Alignment contentAlignment, String label, Function1<? super S, ? extends Object> function12, final Function4<? super AnimatedContentScope, ? super S, ? super Composer, ? super Integer, Unit> function4, Composer $composer, final int $changed, final int i) {
        Function1 function13;
        Object obj;
        Function1 contentKey;
        Function4<? super AnimatedContentScope, ? super S, ? super Composer, ? super Integer, Unit> function42;
        Modifier modifier2;
        final String label2;
        final Function1 transitionSpec;
        final Alignment contentAlignment2;
        final Function1 contentKey2;
        int i2;
        Function1 transitionSpec2;
        int i3;
        Alignment contentAlignment3;
        String label3;
        Composer $composer2 = $composer.startRestartGroup(2132720749);
        ComposerKt.sourceInformation($composer2, "C(AnimatedContent)P(5,4,6,1,3,2)141@7609L58,142@7683L136:AnimatedContent.kt#xbi5r1");
        int $dirty = $changed;
        if ((i & 1) != 0) {
            $dirty |= 6;
        } else if (($changed & 6) == 0) {
            $dirty |= ($changed & 8) == 0 ? $composer2.changed(s) : $composer2.changedInstance(s) ? 4 : 2;
        }
        int i4 = i & 2;
        if (i4 != 0) {
            $dirty |= 48;
        } else if (($changed & 48) == 0) {
            $dirty |= $composer2.changed(modifier) ? 32 : 16;
        }
        int i5 = i & 4;
        if (i5 != 0) {
            $dirty |= 384;
            function13 = function1;
        } else if (($changed & 384) == 0) {
            function13 = function1;
            $dirty |= $composer2.changedInstance(function13) ? 256 : 128;
        } else {
            function13 = function1;
        }
        int i6 = i & 8;
        if (i6 != 0) {
            $dirty |= 3072;
            obj = contentAlignment;
        } else if (($changed & 3072) == 0) {
            obj = contentAlignment;
            $dirty |= $composer2.changed(obj) ? 2048 : 1024;
        } else {
            obj = contentAlignment;
        }
        int i7 = i & 16;
        if (i7 != 0) {
            $dirty |= 24576;
        } else if (($changed & 24576) == 0) {
            $dirty |= $composer2.changed(label) ? 16384 : 8192;
        }
        int i8 = i & 32;
        if (i8 != 0) {
            $dirty |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
            contentKey = function12;
        } else if ((196608 & $changed) == 0) {
            contentKey = function12;
            $dirty |= $composer2.changedInstance(contentKey) ? 131072 : 65536;
        } else {
            contentKey = function12;
        }
        if ((i & 64) != 0) {
            $dirty |= 1572864;
            function42 = function4;
        } else if (($changed & 1572864) == 0) {
            function42 = function4;
            $dirty |= $composer2.changedInstance(function42) ? 1048576 : 524288;
        } else {
            function42 = function4;
        }
        if ($composer2.shouldExecute(($dirty & 599187) != 599186, $dirty & 1)) {
            if (i4 != 0) {
                modifier2 = Modifier.Companion;
                i2 = i7;
            } else {
                i2 = i7;
                modifier2 = modifier;
            }
            if (i5 == 0) {
                transitionSpec2 = function13;
            } else {
                transitionSpec2 = new Function1<AnimatedContentTransitionScope<S>, ContentTransform>() { // from class: androidx.compose.animation.AnimatedContentKt$AnimatedContent$1
                    @Override // kotlin.jvm.functions.Function1
                    public /* bridge */ /* synthetic */ ContentTransform invoke(Object p1) {
                        return invoke((AnimatedContentTransitionScope) ((AnimatedContentTransitionScope) p1));
                    }

                    public final ContentTransform invoke(AnimatedContentTransitionScope<S> animatedContentTransitionScope) {
                        return AnimatedContentKt.togetherWith(EnterExitTransitionKt.fadeIn$default(AnimationSpecKt.tween$default(220, 90, null, 4, null), 0.0f, 2, null).plus(EnterExitTransitionKt.m344scaleInL8ZKhE$default(AnimationSpecKt.tween$default(220, 90, null, 4, null), 0.92f, 0L, 4, null)), EnterExitTransitionKt.fadeOut$default(AnimationSpecKt.tween$default(90, 0, null, 6, null), 0.0f, 2, null));
                    }
                };
            }
            if (i6 == 0) {
                i3 = i8;
                contentAlignment3 = obj;
            } else {
                contentAlignment3 = Alignment.Companion.getTopStart();
                i3 = i8;
            }
            if (i2 == 0) {
                label3 = label;
            } else {
                label3 = "AnimatedContent";
            }
            if (i3 != 0) {
                contentKey = new Function1<S, S>() { // from class: androidx.compose.animation.AnimatedContentKt$AnimatedContent$2
                    @Override // kotlin.jvm.functions.Function1
                    public final S invoke(S s2) {
                        return s2;
                    }
                };
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(2132720749, $dirty, -1, "androidx.compose.animation.AnimatedContent (AnimatedContent.kt:140)");
            }
            Transition transition = androidx.compose.animation.core.TransitionKt.updateTransition(s, label3, $composer2, ($dirty & 8) | ($dirty & 14) | (($dirty >> 9) & Property.BORDER_BOTTOM_RIGHT_RADIUS), 0);
            AnimatedContent(transition, modifier2, transitionSpec2, contentAlignment3, contentKey, function42, $composer2, ($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty & 896) | ($dirty & 7168) | (($dirty >> 3) & 57344) | (458752 & ($dirty >> 3)), 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            label2 = label3;
            transitionSpec = transitionSpec2;
            contentAlignment2 = contentAlignment3;
            contentKey2 = contentKey;
        } else {
            $composer2.skipToGroupEnd();
            modifier2 = modifier;
            label2 = label;
            transitionSpec = function13;
            contentAlignment2 = obj;
            contentKey2 = contentKey;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            final Modifier modifier3 = modifier2;
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.animation.AnimatedContentKt$AnimatedContent$3
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

                public final void invoke(Composer composer, int i9) {
                    AnimatedContentKt.AnimatedContent(s, modifier3, transitionSpec, contentAlignment2, label2, contentKey2, function4, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    public static /* synthetic */ SizeTransform SizeTransform$default(boolean z, Function2 function2, int i, Object obj) {
        if ((i & 1) != 0) {
            z = true;
        }
        if ((i & 2) != 0) {
            function2 = new Function2<IntSize, IntSize, SpringSpec<IntSize>>() { // from class: androidx.compose.animation.AnimatedContentKt$SizeTransform$1
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ SpringSpec<IntSize> invoke(IntSize intSize, IntSize intSize2) {
                    return m299invokeTemP2vQ(intSize.m7048unboximpl(), intSize2.m7048unboximpl());
                }

                /* renamed from: invoke-TemP2vQ  reason: not valid java name */
                public final SpringSpec<IntSize> m299invokeTemP2vQ(long j, long j2) {
                    return AnimationSpecKt.spring$default(0.0f, 400.0f, IntSize.m7036boximpl(VisibilityThresholdsKt.getVisibilityThreshold(IntSize.Companion)), 1, null);
                }
            };
        }
        return SizeTransform(z, function2);
    }

    public static final SizeTransform SizeTransform(boolean clip, Function2<? super IntSize, ? super IntSize, ? extends FiniteAnimationSpec<IntSize>> function2) {
        return new SizeTransformImpl(clip, function2);
    }

    public static final ContentTransform togetherWith(EnterTransition $this$togetherWith, ExitTransition exit) {
        return new ContentTransform($this$togetherWith, exit, 0.0f, null, 12, null);
    }

    @Deprecated(message = "Infix fun EnterTransition.with(ExitTransition) has been renamed to togetherWith", replaceWith = @ReplaceWith(expression = "togetherWith(exit)", imports = {}))
    public static final ContentTransform with(EnterTransition $this$with, ExitTransition exit) {
        return new ContentTransform($this$with, exit, 0.0f, null, 12, null);
    }

    /* JADX WARN: Code restructure failed: missing block: B:318:0x017a, code lost:
        if (r12 != androidx.compose.runtime.Composer.Companion.getEmpty()) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:342:0x0204, code lost:
        if (kotlin.jvm.internal.Intrinsics.areEqual(r5.get(0), r29.getCurrentState()) != false) goto L66;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:407:0x047e  */
    /* JADX WARN: Removed duplicated region for block: B:414:0x04ef  */
    /* JADX WARN: Type inference failed for: r6v23 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final <S> void AnimatedContent(final androidx.compose.animation.core.Transition<S> r29, androidx.compose.ui.Modifier r30, kotlin.jvm.functions.Function1<? super androidx.compose.animation.AnimatedContentTransitionScope<S>, androidx.compose.animation.ContentTransform> r31, androidx.compose.ui.Alignment r32, kotlin.jvm.functions.Function1<? super S, ? extends java.lang.Object> r33, final kotlin.jvm.functions.Function4<? super androidx.compose.animation.AnimatedContentScope, ? super S, ? super androidx.compose.runtime.Composer, ? super java.lang.Integer, kotlin.Unit> r34, androidx.compose.runtime.Composer r35, final int r36, final int r37) {
        /*
            Method dump skipped, instructions count: 1304
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.animation.AnimatedContentKt.AnimatedContent(androidx.compose.animation.core.Transition, androidx.compose.ui.Modifier, kotlin.jvm.functions.Function1, androidx.compose.ui.Alignment, kotlin.jvm.functions.Function1, kotlin.jvm.functions.Function4, androidx.compose.runtime.Composer, int, int):void");
    }
}
