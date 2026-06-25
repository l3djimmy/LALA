package com.hardlineforge.lala.ui.screens;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import androidx.compose.foundation.ImageKt;
import androidx.compose.foundation.layout.AspectRatioKt;
import androidx.compose.foundation.layout.SizeKt;
import androidx.compose.foundation.lazy.LazyItemScope;
import androidx.compose.foundation.lazy.LazyListScope;
import androidx.compose.material3.AppBarKt;
import androidx.compose.material3.ButtonKt;
import androidx.compose.material3.IconButtonKt;
import androidx.compose.material3.TextKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.graphics.AndroidImageBitmap_androidKt;
import androidx.compose.ui.graphics.ImageBitmap;
import androidx.compose.ui.layout.ContentScale;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.style.TextAlign;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.navigation.NavHostController;
import androidx.profileinstaller.ProfileVerifier;
import androidx.recyclerview.widget.ItemTouchHelper;
import com.hardlineforge.lala.data.VideoFrame;
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel;
import java.util.Arrays;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: FilmstripScreen.kt */
@Metadata(d1 = {"\u0000>\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010 \n\u0000\n\u0002\u0010\u000b\n\u0000\u001a'\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0007H\u0007¢\u0006\u0002\u0010\b\u001a#\u0010\t\u001a\u00020\u00012\u0006\u0010\n\u001a\u00020\u000b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u00010\rH\u0003¢\u0006\u0002\u0010\u000e\u001a\u0010\u0010\u000f\u001a\u00020\u00052\u0006\u0010\u0010\u001a\u00020\u0011H\u0002¨\u0006\u0012²\u0006\u0010\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u000b0\u0014X\u008a\u008e\u0002²\u0006\n\u0010\u0015\u001a\u00020\u0016X\u008a\u008e\u0002²\u0006\f\u0010\u0017\u001a\u0004\u0018\u00010\u000bX\u008a\u008e\u0002"}, d2 = {"FilmstripScreen", "", "navController", "Landroidx/navigation/NavHostController;", "videoId", "", "vm", "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;", "(Landroidx/navigation/NavHostController;Ljava/lang/String;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V", "FrameThumbnail", TypedValues.AttributesType.S_FRAME, "Lcom/hardlineforge/lala/data/VideoFrame;", "onClick", "Lkotlin/Function0;", "(Lcom/hardlineforge/lala/data/VideoFrame;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;I)V", "formatMs", "ms", "", "app_debug", "frames", "", "isExtracting", "", "selectedFrame"}, k = 2, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class FilmstripScreenKt {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit FilmstripScreen$lambda$31(NavHostController navHostController, String str, LalaViewModel lalaViewModel, int i, int i2, Composer composer, int i3) {
        FilmstripScreen(navHostController, str, lalaViewModel, composer, RecomposeScopeImplKt.updateChangedFlags(i | 1), i2);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit FrameThumbnail$lambda$37(VideoFrame videoFrame, Function0 function0, int i, Composer composer, int i2) {
        FrameThumbnail(videoFrame, function0, composer, RecomposeScopeImplKt.updateChangedFlags(i | 1));
        return Unit.INSTANCE;
    }

    /* JADX WARN: Removed duplicated region for block: B:57:0x0119  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0161  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x019a  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x01c8  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x01da  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x01f9  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0207  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0220  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0222  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0235  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x02ca  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x02d7  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x036a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void FilmstripScreen(final androidx.navigation.NavHostController r33, final java.lang.String r34, com.hardlineforge.lala.ui.viewmodel.LalaViewModel r35, androidx.compose.runtime.Composer r36, final int r37, final int r38) {
        /*
            Method dump skipped, instructions count: 911
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.FilmstripScreenKt.FilmstripScreen(androidx.navigation.NavHostController, java.lang.String, com.hardlineforge.lala.ui.viewmodel.LalaViewModel, androidx.compose.runtime.Composer, int, int):void");
    }

    private static final List<VideoFrame> FilmstripScreen$lambda$1(MutableState<List<VideoFrame>> mutableState) {
        return mutableState.getValue();
    }

    private static final boolean FilmstripScreen$lambda$4(MutableState<Boolean> mutableState) {
        return mutableState.getValue().booleanValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void FilmstripScreen$lambda$5(MutableState<Boolean> mutableState, boolean z) {
        mutableState.setValue(Boolean.valueOf(z));
    }

    private static final VideoFrame FilmstripScreen$lambda$7(MutableState<VideoFrame> mutableState) {
        return mutableState.getValue();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit FilmstripScreen$lambda$13(final NavHostController $navController, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C76@2824L192,74@2733L297:FilmstripScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-816198626, $changed, -1, "com.hardlineforge.lala.ui.screens.FilmstripScreen.<anonymous> (FilmstripScreen.kt:74)");
            }
            AppBarKt.m1823TopAppBarGHTll3U(ComposableSingletons$FilmstripScreenKt.INSTANCE.m7311getLambda$1359235110$app_debug(), null, ComposableLambdaKt.rememberComposableLambda(164527512, true, new Function2() { // from class: com.hardlineforge.lala.ui.screens.FilmstripScreenKt$$ExternalSyntheticLambda1
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    return FilmstripScreenKt.FilmstripScreen$lambda$13$lambda$12(NavHostController.this, (Composer) obj, ((Integer) obj2).intValue());
                }
            }, $composer, 54), null, 0.0f, null, null, null, $composer, 390, ItemTouchHelper.Callback.DEFAULT_SWIPE_ANIMATION_DURATION);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit FilmstripScreen$lambda$13$lambda$12(final NavHostController $navController, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C77@2867L32,77@2846L152:FilmstripScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(164527512, $changed, -1, "com.hardlineforge.lala.ui.screens.FilmstripScreen.<anonymous>.<anonymous> (FilmstripScreen.kt:77)");
            }
            ComposerKt.sourceInformationMarkerStart($composer, -802849512, "CC(remember):FilmstripScreen.kt#9igjgp");
            boolean changedInstance = $composer.changedInstance($navController);
            Object rememberedValue = $composer.rememberedValue();
            if (changedInstance || rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.FilmstripScreenKt$$ExternalSyntheticLambda3
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return FilmstripScreenKt.FilmstripScreen$lambda$13$lambda$12$lambda$11$lambda$10(NavHostController.this);
                    }
                };
                $composer.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            IconButtonKt.IconButton((Function0) rememberedValue, null, false, null, null, ComposableSingletons$FilmstripScreenKt.INSTANCE.getLambda$559325915$app_debug(), $composer, ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE, 30);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit FilmstripScreen$lambda$13$lambda$12$lambda$11$lambda$10(NavHostController $navController) {
        $navController.popBackStack();
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0153  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0308  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x041a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final kotlin.Unit FilmstripScreen$lambda$21(androidx.compose.runtime.MutableState r87, final androidx.compose.runtime.MutableState r88, final androidx.compose.runtime.MutableState r89, androidx.compose.foundation.layout.PaddingValues r90, androidx.compose.runtime.Composer r91, int r92) {
        /*
            Method dump skipped, instructions count: 1066
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.FilmstripScreenKt.FilmstripScreen$lambda$21(androidx.compose.runtime.MutableState, androidx.compose.runtime.MutableState, androidx.compose.runtime.MutableState, androidx.compose.foundation.layout.PaddingValues, androidx.compose.runtime.Composer, int):kotlin.Unit");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit FilmstripScreen$lambda$21$lambda$20$lambda$19$lambda$18(MutableState $frames$delegate, final MutableState $selectedFrame$delegate, LazyListScope LazyRow) {
        Intrinsics.checkNotNullParameter(LazyRow, "$this$LazyRow");
        final List FilmstripScreen$lambda$1 = FilmstripScreen$lambda$1($frames$delegate);
        final Function1 function1 = new Function1() { // from class: com.hardlineforge.lala.ui.screens.FilmstripScreenKt$$ExternalSyntheticLambda4
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return FilmstripScreenKt.FilmstripScreen$lambda$21$lambda$20$lambda$19$lambda$18$lambda$15((VideoFrame) obj);
            }
        };
        final Function1 function12 = new Function1() { // from class: com.hardlineforge.lala.ui.screens.FilmstripScreenKt$FilmstripScreen$lambda$21$lambda$20$lambda$19$lambda$18$$inlined$items$default$1
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Object p1) {
                return invoke((VideoFrame) p1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Void invoke(VideoFrame videoFrame) {
                return null;
            }
        };
        LazyRow.items(FilmstripScreen$lambda$1.size(), new Function1<Integer, Object>() { // from class: com.hardlineforge.lala.ui.screens.FilmstripScreenKt$FilmstripScreen$lambda$21$lambda$20$lambda$19$lambda$18$$inlined$items$default$2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Integer num) {
                return invoke(num.intValue());
            }

            public final Object invoke(int index) {
                return Function1.this.invoke(FilmstripScreen$lambda$1.get(index));
            }
        }, new Function1<Integer, Object>() { // from class: com.hardlineforge.lala.ui.screens.FilmstripScreenKt$FilmstripScreen$lambda$21$lambda$20$lambda$19$lambda$18$$inlined$items$default$3
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Integer num) {
                return invoke(num.intValue());
            }

            public final Object invoke(int index) {
                return Function1.this.invoke(FilmstripScreen$lambda$1.get(index));
            }
        }, ComposableLambdaKt.composableLambdaInstance(-632812321, true, new Function4<LazyItemScope, Integer, Composer, Integer, Unit>() { // from class: com.hardlineforge.lala.ui.screens.FilmstripScreenKt$FilmstripScreen$lambda$21$lambda$20$lambda$19$lambda$18$$inlined$items$default$4
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(4);
            }

            @Override // kotlin.jvm.functions.Function4
            public /* bridge */ /* synthetic */ Unit invoke(LazyItemScope lazyItemScope, Integer num, Composer composer, Integer num2) {
                invoke(lazyItemScope, num.intValue(), composer, num2.intValue());
                return Unit.INSTANCE;
            }

            public final void invoke(LazyItemScope $this$items, int it, Composer $composer, int $changed) {
                ComposerKt.sourceInformation($composer, "C178@8826L22:LazyDsl.kt#428nma");
                int $dirty = $changed;
                if (($changed & 6) == 0) {
                    $dirty |= $composer.changed($this$items) ? 4 : 2;
                }
                if (($changed & 48) == 0) {
                    $dirty |= $composer.changed(it) ? 32 : 16;
                }
                if (!$composer.shouldExecute(($dirty & 147) != 146, $dirty & 1)) {
                    $composer.skipToGroupEnd();
                    return;
                }
                if (ComposerKt.isTraceInProgress()) {
                    ComposerKt.traceEventStart(-632812321, $dirty, -1, "androidx.compose.foundation.lazy.items.<anonymous> (LazyDsl.kt:178)");
                }
                int i = $dirty & 14;
                final VideoFrame videoFrame = (VideoFrame) FilmstripScreen$lambda$1.get(it);
                $composer.startReplaceGroup(-1674127383);
                ComposerKt.sourceInformation($composer, "C*109@4253L25,107@4156L148:FilmstripScreen.kt#4cebsy");
                ComposerKt.sourceInformationMarkerStart($composer, -885285121, "CC(remember):FilmstripScreen.kt#9igjgp");
                boolean changedInstance = $composer.changedInstance(videoFrame);
                Object rememberedValue = $composer.rememberedValue();
                if (changedInstance || rememberedValue == Composer.Companion.getEmpty()) {
                    final MutableState mutableState = $selectedFrame$delegate;
                    Object obj = (Function0) new Function0<Unit>() { // from class: com.hardlineforge.lala.ui.screens.FilmstripScreenKt$FilmstripScreen$3$1$2$1$2$1$1
                        @Override // kotlin.jvm.functions.Function0
                        public /* bridge */ /* synthetic */ Unit invoke() {
                            invoke2();
                            return Unit.INSTANCE;
                        }

                        /* renamed from: invoke  reason: avoid collision after fix types in other method */
                        public final void invoke2() {
                            mutableState.setValue(VideoFrame.this);
                        }
                    };
                    $composer.updateRememberedValue(obj);
                    rememberedValue = obj;
                }
                ComposerKt.sourceInformationMarkerEnd($composer);
                FilmstripScreenKt.FrameThumbnail(videoFrame, (Function0) rememberedValue, $composer, (i >> 3) & 14);
                $composer.endReplaceGroup();
                if (ComposerKt.isTraceInProgress()) {
                    ComposerKt.traceEventEnd();
                }
            }
        }));
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Object FilmstripScreen$lambda$21$lambda$20$lambda$19$lambda$18$lambda$15(VideoFrame it) {
        Intrinsics.checkNotNullParameter(it, "it");
        return it.getId();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit FilmstripScreen$lambda$30$lambda$23$lambda$22(MutableState $selectedFrame$delegate) {
        $selectedFrame$delegate.setValue(null);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit FilmstripScreen$lambda$30$lambda$27(VideoFrame $sf, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C121@4538L62:FilmstripScreen.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1612528055, $changed, -1, "com.hardlineforge.lala.ui.screens.FilmstripScreen.<anonymous>.<anonymous> (FilmstripScreen.kt:121)");
            }
            TextKt.m2743Text4IGK_g("Frame " + $sf.getFrameNumber() + " — " + formatMs($sf.getTimeOffsetMs()), (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 0, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit FilmstripScreen$lambda$30$lambda$29(VideoFrame $sf, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C123@4651L106:FilmstripScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-448946870, $changed, -1, "com.hardlineforge.lala.ui.screens.FilmstripScreen.<anonymous>.<anonymous> (FilmstripScreen.kt:123)");
            }
            String uri = $sf.getUri();
            ComposerKt.sourceInformationMarkerStart($composer, -1941211468, "CC(remember):FilmstripScreen.kt#9igjgp");
            boolean changed = $composer.changed(uri);
            Object rememberedValue = $composer.rememberedValue();
            if (changed || rememberedValue == Composer.Companion.getEmpty()) {
                Bitmap decodeFile = BitmapFactory.decodeFile($sf.getUri());
                Object asImageBitmap = decodeFile != null ? AndroidImageBitmap_androidKt.asImageBitmap(decodeFile) : null;
                $composer.updateRememberedValue(asImageBitmap);
                rememberedValue = asImageBitmap;
            }
            ImageBitmap bmp = (ImageBitmap) rememberedValue;
            ComposerKt.sourceInformationMarkerEnd($composer);
            if (bmp != null) {
                $composer.startReplaceGroup(-47868530);
                ComposerKt.sourceInformation($composer, "127@4813L258");
                ImageKt.m559Image5hnEew(bmp, "Frame", AspectRatioKt.aspectRatio$default(SizeKt.fillMaxWidth$default(Modifier.Companion, 0.0f, 1, null), 1.7777778f, false, 2, null), null, ContentScale.Companion.getFit(), 0.0f, null, 0, $composer, 25008, 232);
                $composer.endReplaceGroup();
            } else {
                $composer.startReplaceGroup(-47574092);
                ComposerKt.sourceInformation($composer, "134@5117L28");
                TextKt.m2743Text4IGK_g("Failed to load frame", (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 6, 0, 131070);
                $composer.endReplaceGroup();
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit FilmstripScreen$lambda$30$lambda$26(final MutableState $selectedFrame$delegate, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C138@5246L24,138@5225L64:FilmstripScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1971885499, $changed, -1, "com.hardlineforge.lala.ui.screens.FilmstripScreen.<anonymous>.<anonymous> (FilmstripScreen.kt:138)");
            }
            ComposerKt.sourceInformationMarkerStart($composer, -901385731, "CC(remember):FilmstripScreen.kt#9igjgp");
            Object rememberedValue = $composer.rememberedValue();
            if (rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.FilmstripScreenKt$$ExternalSyntheticLambda2
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return FilmstripScreenKt.FilmstripScreen$lambda$30$lambda$26$lambda$25$lambda$24(MutableState.this);
                    }
                };
                $composer.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            ButtonKt.TextButton((Function0) rememberedValue, null, false, null, null, null, null, null, null, ComposableSingletons$FilmstripScreenKt.INSTANCE.m7312getLambda$68159294$app_debug(), $composer, 805306374, TypedValues.PositionType.TYPE_POSITION_TYPE);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit FilmstripScreen$lambda$30$lambda$26$lambda$25$lambda$24(MutableState $selectedFrame$delegate) {
        $selectedFrame$delegate.setValue(null);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x0217, code lost:
        if (r8 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L45;
     */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0203  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0205  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x020f  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x021b  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x02a6  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x02b2  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x02b8  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x02e9  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x02ff  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0352  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x03a2  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0433  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void FrameThumbnail(final com.hardlineforge.lala.data.VideoFrame r72, final kotlin.jvm.functions.Function0<kotlin.Unit> r73, androidx.compose.runtime.Composer r74, final int r75) {
        /*
            Method dump skipped, instructions count: 1101
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.FilmstripScreenKt.FrameThumbnail(com.hardlineforge.lala.data.VideoFrame, kotlin.jvm.functions.Function0, androidx.compose.runtime.Composer, int):void");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit FrameThumbnail$lambda$36$lambda$34$lambda$33(Function0 $onClick) {
        $onClick.invoke();
        return Unit.INSTANCE;
    }

    private static final String formatMs(int ms) {
        int totalSeconds = ms / 1000;
        int minutes = totalSeconds / 60;
        int seconds = totalSeconds % 60;
        String format = String.format("%d:%02d", Arrays.copyOf(new Object[]{Integer.valueOf(minutes), Integer.valueOf(seconds)}, 2));
        Intrinsics.checkNotNullExpressionValue(format, "format(...)");
        return format;
    }
}
