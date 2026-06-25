package com.hardlineforge.lala.ui.screens;

import androidx.compose.foundation.BorderStroke;
import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.foundation.lazy.grid.LazyGridItemScope;
import androidx.compose.foundation.lazy.grid.LazyGridScope;
import androidx.compose.material3.MaterialTheme;
import androidx.compose.material3.SegmentedButtonColors;
import androidx.compose.material3.SegmentedButtonKt;
import androidx.compose.material3.SingleChoiceSegmentedButtonRowScope;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.State;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.graphics.Shape;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.navigation.NavController;
import androidx.navigation.NavHostController;
import com.hardlineforge.lala.data.Photo;
import com.hardlineforge.lala.data.Video;
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: MediaGalleryScreen.kt */
@Metadata(d1 = {"\u00004\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\u001a\u001f\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005H\u0007¢\u0006\u0002\u0010\u0006\u001a\u0015\u0010\u0007\u001a\u00020\u00012\u0006\u0010\b\u001a\u00020\tH\u0003¢\u0006\u0002\u0010\n\u001a\u001d\u0010\u000b\u001a\u00020\u00012\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u0002\u001a\u00020\u0003H\u0003¢\u0006\u0002\u0010\u000e¨\u0006\u000f²\u0006\u0010\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00120\u0011X\u008a\u0084\u0002²\u0006\n\u0010\u0013\u001a\u00020\u0014X\u008a\u008e\u0002"}, d2 = {"MediaGalleryScreen", "", "navController", "Landroidx/navigation/NavHostController;", "vm", "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;", "(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V", "PhotoThumbnail", "photo", "Lcom/hardlineforge/lala/data/Photo;", "(Lcom/hardlineforge/lala/data/Photo;Landroidx/compose/runtime/Composer;I)V", "VideoThumbnail", "video", "Lcom/hardlineforge/lala/data/Video;", "(Lcom/hardlineforge/lala/data/Video;Landroidx/navigation/NavHostController;Landroidx/compose/runtime/Composer;I)V", "app_debug", "media", "", "", "filter", ""}, k = 2, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class MediaGalleryScreenKt {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit MediaGalleryScreen$lambda$18(NavHostController navHostController, LalaViewModel lalaViewModel, int i, int i2, Composer composer, int i3) {
        MediaGalleryScreen(navHostController, lalaViewModel, composer, RecomposeScopeImplKt.updateChangedFlags(i | 1), i2);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit PhotoThumbnail$lambda$21(Photo photo, int i, Composer composer, int i2) {
        PhotoThumbnail(photo, composer, RecomposeScopeImplKt.updateChangedFlags(i | 1));
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit VideoThumbnail$lambda$26(Video video, NavHostController navHostController, int i, Composer composer, int i2) {
        VideoThumbnail(video, navHostController, composer, RecomposeScopeImplKt.updateChangedFlags(i | 1));
        return Unit.INSTANCE;
    }

    /* JADX WARN: Removed duplicated region for block: B:112:0x04c8  */
    /* JADX WARN: Removed duplicated region for block: B:122:0x0577  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x0354  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void MediaGalleryScreen(final androidx.navigation.NavHostController r84, com.hardlineforge.lala.ui.viewmodel.LalaViewModel r85, androidx.compose.runtime.Composer r86, final int r87, final int r88) {
        /*
            Method dump skipped, instructions count: 1425
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.MediaGalleryScreenKt.MediaGalleryScreen(androidx.navigation.NavHostController, com.hardlineforge.lala.ui.viewmodel.LalaViewModel, androidx.compose.runtime.Composer, int, int):void");
    }

    private static final List<Object> MediaGalleryScreen$lambda$1(State<? extends List<? extends Object>> state) {
        return (List) state.getValue();
    }

    private static final String MediaGalleryScreen$lambda$3(MutableState<String> mutableState) {
        return mutableState.getValue();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit MediaGalleryScreen$lambda$17$lambda$11(final MutableState $filter$delegate, SingleChoiceSegmentedButtonRowScope SingleChoiceSegmentedButtonRow, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(SingleChoiceSegmentedButtonRow, "$this$SingleChoiceSegmentedButtonRow");
        ComposerKt.sourceInformation($composer, "C45@1729L18,46@1787L6,43@1642L188,50@1932L20,51@1992L6,48@1843L270,55@2215L20,56@2275L6,53@2126L273:MediaGalleryScreen.kt#4cebsy");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= $composer.changed(SingleChoiceSegmentedButtonRow) ? 4 : 2;
        }
        if ($composer.shouldExecute(($dirty & 19) != 18, $dirty & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1195015094, $dirty, -1, "com.hardlineforge.lala.ui.screens.MediaGalleryScreen.<anonymous>.<anonymous> (MediaGalleryScreen.kt:43)");
            }
            boolean areEqual = Intrinsics.areEqual(MediaGalleryScreen$lambda$3($filter$delegate), "all");
            ComposerKt.sourceInformationMarkerStart($composer, -1653234052, "CC(remember):MediaGalleryScreen.kt#9igjgp");
            Object rememberedValue = $composer.rememberedValue();
            if (rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.MediaGalleryScreenKt$$ExternalSyntheticLambda3
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return MediaGalleryScreenKt.MediaGalleryScreen$lambda$17$lambda$11$lambda$6$lambda$5(MutableState.this);
                    }
                };
                $composer.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            int $dirty2 = $dirty;
            SegmentedButtonKt.SegmentedButton(SingleChoiceSegmentedButtonRow, areEqual, (Function0<Unit>) rememberedValue, (Shape) MaterialTheme.INSTANCE.getShapes($composer, MaterialTheme.$stable).getMedium(), (Modifier) null, false, (SegmentedButtonColors) null, (BorderStroke) null, (MutableInteractionSource) null, (Function2<? super Composer, ? super Integer, Unit>) null, (Function2<? super Composer, ? super Integer, Unit>) ComposableSingletons$MediaGalleryScreenKt.INSTANCE.getLambda$736888058$app_debug(), $composer, ($dirty & 14) | 384, 6, (int) TypedValues.PositionType.TYPE_PERCENT_HEIGHT);
            boolean areEqual2 = Intrinsics.areEqual(MediaGalleryScreen$lambda$3($filter$delegate), "photo");
            ComposerKt.sourceInformationMarkerStart($composer, -1653227554, "CC(remember):MediaGalleryScreen.kt#9igjgp");
            Object rememberedValue2 = $composer.rememberedValue();
            if (rememberedValue2 == Composer.Companion.getEmpty()) {
                Object obj2 = new Function0() { // from class: com.hardlineforge.lala.ui.screens.MediaGalleryScreenKt$$ExternalSyntheticLambda4
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return MediaGalleryScreenKt.MediaGalleryScreen$lambda$17$lambda$11$lambda$8$lambda$7(MutableState.this);
                    }
                };
                $composer.updateRememberedValue(obj2);
                rememberedValue2 = obj2;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            SegmentedButtonKt.SegmentedButton(SingleChoiceSegmentedButtonRow, areEqual2, (Function0<Unit>) rememberedValue2, (Shape) MaterialTheme.INSTANCE.getShapes($composer, MaterialTheme.$stable).getMedium(), (Modifier) null, false, (SegmentedButtonColors) null, (BorderStroke) null, (MutableInteractionSource) null, (Function2<? super Composer, ? super Integer, Unit>) null, (Function2<? super Composer, ? super Integer, Unit>) ComposableSingletons$MediaGalleryScreenKt.INSTANCE.getLambda$716102115$app_debug(), $composer, ($dirty2 & 14) | 384, 6, (int) TypedValues.PositionType.TYPE_PERCENT_HEIGHT);
            boolean areEqual3 = Intrinsics.areEqual(MediaGalleryScreen$lambda$3($filter$delegate), "video");
            ComposerKt.sourceInformationMarkerStart($composer, -1653218498, "CC(remember):MediaGalleryScreen.kt#9igjgp");
            Object rememberedValue3 = $composer.rememberedValue();
            if (rememberedValue3 == Composer.Companion.getEmpty()) {
                Object obj3 = new Function0() { // from class: com.hardlineforge.lala.ui.screens.MediaGalleryScreenKt$$ExternalSyntheticLambda5
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return MediaGalleryScreenKt.MediaGalleryScreen$lambda$17$lambda$11$lambda$10$lambda$9(MutableState.this);
                    }
                };
                $composer.updateRememberedValue(obj3);
                rememberedValue3 = obj3;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            SegmentedButtonKt.SegmentedButton(SingleChoiceSegmentedButtonRow, areEqual3, (Function0<Unit>) rememberedValue3, (Shape) MaterialTheme.INSTANCE.getShapes($composer, MaterialTheme.$stable).getMedium(), (Modifier) null, false, (SegmentedButtonColors) null, (BorderStroke) null, (MutableInteractionSource) null, (Function2<? super Composer, ? super Integer, Unit>) null, (Function2<? super Composer, ? super Integer, Unit>) ComposableSingletons$MediaGalleryScreenKt.INSTANCE.m7317getLambda$333269886$app_debug(), $composer, ($dirty2 & 14) | 384, 6, (int) TypedValues.PositionType.TYPE_PERCENT_HEIGHT);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit MediaGalleryScreen$lambda$17$lambda$11$lambda$6$lambda$5(MutableState $filter$delegate) {
        $filter$delegate.setValue("all");
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit MediaGalleryScreen$lambda$17$lambda$11$lambda$8$lambda$7(MutableState $filter$delegate) {
        $filter$delegate.setValue("photo");
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit MediaGalleryScreen$lambda$17$lambda$11$lambda$10$lambda$9(MutableState $filter$delegate) {
        $filter$delegate.setValue("video");
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit MediaGalleryScreen$lambda$17$lambda$16$lambda$15(final List $filtered, final NavHostController $navController, LazyGridScope LazyVerticalGrid) {
        Intrinsics.checkNotNullParameter(LazyVerticalGrid, "$this$LazyVerticalGrid");
        final Function1 function1 = new Function1() { // from class: com.hardlineforge.lala.ui.screens.MediaGalleryScreenKt$$ExternalSyntheticLambda6
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return MediaGalleryScreenKt.MediaGalleryScreen$lambda$17$lambda$16$lambda$15$lambda$13(obj);
            }
        };
        final Function1 function12 = new Function1() { // from class: com.hardlineforge.lala.ui.screens.MediaGalleryScreenKt$MediaGalleryScreen$lambda$17$lambda$16$lambda$15$$inlined$items$default$1
            @Override // kotlin.jvm.functions.Function1
            public final Void invoke(Object it) {
                return null;
            }
        };
        LazyVerticalGrid.items($filtered.size(), new Function1<Integer, Object>() { // from class: com.hardlineforge.lala.ui.screens.MediaGalleryScreenKt$MediaGalleryScreen$lambda$17$lambda$16$lambda$15$$inlined$items$default$2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Integer num) {
                return invoke(num.intValue());
            }

            public final Object invoke(int index) {
                return Function1.this.invoke($filtered.get(index));
            }
        }, null, new Function1<Integer, Object>() { // from class: com.hardlineforge.lala.ui.screens.MediaGalleryScreenKt$MediaGalleryScreen$lambda$17$lambda$16$lambda$15$$inlined$items$default$4
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Object invoke(Integer num) {
                return invoke(num.intValue());
            }

            public final Object invoke(int index) {
                return Function1.this.invoke($filtered.get(index));
            }
        }, ComposableLambdaKt.composableLambdaInstance(699646206, true, new Function4<LazyGridItemScope, Integer, Composer, Integer, Unit>() { // from class: com.hardlineforge.lala.ui.screens.MediaGalleryScreenKt$MediaGalleryScreen$lambda$17$lambda$16$lambda$15$$inlined$items$default$5
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(4);
            }

            @Override // kotlin.jvm.functions.Function4
            public /* bridge */ /* synthetic */ Unit invoke(LazyGridItemScope lazyGridItemScope, Integer num, Composer composer, Integer num2) {
                invoke(lazyGridItemScope, num.intValue(), composer, num2.intValue());
                return Unit.INSTANCE;
            }

            public final void invoke(LazyGridItemScope $this$items, int it, Composer $composer, int $changed) {
                ComposerKt.sourceInformation($composer, "C542@23993L22:LazyGridDsl.kt#7791vq");
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
                    ComposerKt.traceEventStart(699646206, $dirty, -1, "androidx.compose.foundation.lazy.grid.items.<anonymous> (LazyGridDsl.kt:542)");
                }
                Object obj = $filtered.get(it);
                int i = $dirty & 14;
                $composer.startReplaceGroup(601633084);
                ComposerKt.sourceInformation($composer, "C:MediaGalleryScreen.kt#4cebsy");
                if (obj instanceof Photo) {
                    $composer.startReplaceGroup(296503631);
                    ComposerKt.sourceInformation($composer, "78@3213L28");
                    MediaGalleryScreenKt.PhotoThumbnail((Photo) obj, $composer, 0);
                    $composer.endReplaceGroup();
                } else {
                    if (obj instanceof Video) {
                        $composer.startReplaceGroup(296505726);
                        ComposerKt.sourceInformation($composer, "79@3278L43");
                        MediaGalleryScreenKt.VideoThumbnail((Video) obj, $navController, $composer, 0);
                    } else {
                        $composer.startReplaceGroup(598488815);
                    }
                    $composer.endReplaceGroup();
                }
                $composer.endReplaceGroup();
                if (ComposerKt.isTraceInProgress()) {
                    ComposerKt.traceEventEnd();
                }
            }
        }));
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Object MediaGalleryScreen$lambda$17$lambda$16$lambda$15$lambda$13(Object it) {
        Intrinsics.checkNotNullParameter(it, "it");
        return it instanceof Photo ? ((Photo) it).getId() : it instanceof Video ? ((Video) it).getId() : Integer.valueOf(it.hashCode());
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:46:0x01a9  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x01f3  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x024e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void PhotoThumbnail(final com.hardlineforge.lala.data.Photo r47, androidx.compose.runtime.Composer r48, final int r49) {
        /*
            Method dump skipped, instructions count: 616
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.MediaGalleryScreenKt.PhotoThumbnail(com.hardlineforge.lala.data.Photo, androidx.compose.runtime.Composer, int):void");
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:49:0x023a  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0246  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x024c  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x03b4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void VideoThumbnail(final com.hardlineforge.lala.data.Video r79, final androidx.navigation.NavHostController r80, androidx.compose.runtime.Composer r81, final int r82) {
        /*
            Method dump skipped, instructions count: 974
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.MediaGalleryScreenKt.VideoThumbnail(com.hardlineforge.lala.data.Video, androidx.navigation.NavHostController, androidx.compose.runtime.Composer, int):void");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit VideoThumbnail$lambda$23$lambda$22(NavHostController $navController, Video $video) {
        NavController.navigate$default($navController, "filmstrip/" + $video.getId(), null, null, 6, null);
        return Unit.INSTANCE;
    }
}
