package com.hardlineforge.lala.ui.screens;

import androidx.compose.foundation.BorderStroke;
import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.foundation.layout.RowScope;
import androidx.compose.material3.MaterialTheme;
import androidx.compose.material3.SegmentedButtonColors;
import androidx.compose.material3.SegmentedButtonKt;
import androidx.compose.material3.SingleChoiceSegmentedButtonRowScope;
import androidx.compose.material3.TextKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.graphics.Shape;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.style.TextAlign;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.navigation.NavController;
import androidx.navigation.NavHostController;
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel;
import java.time.LocalDate;
import java.time.ZoneId;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: ReportsScreen.kt */
@Metadata(d1 = {"\u0000*\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\b\u001a\u001f\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005H\u0007¢\u0006\u0002\u0010\u0006¨\u0006\u0007²\u0006\u0012\u0010\b\u001a\n \n*\u0004\u0018\u00010\t0\tX\u008a\u008e\u0002²\u0006\u0012\u0010\u000b\u001a\n \n*\u0004\u0018\u00010\t0\tX\u008a\u008e\u0002²\u0006\n\u0010\f\u001a\u00020\rX\u008a\u008e\u0002²\u0006\n\u0010\u000e\u001a\u00020\rX\u008a\u008e\u0002²\u0006\n\u0010\u000f\u001a\u00020\rX\u008a\u008e\u0002²\u0006\n\u0010\u0010\u001a\u00020\rX\u008a\u008e\u0002²\u0006\n\u0010\u0011\u001a\u00020\u0012X\u008a\u008e\u0002"}, d2 = {"ReportsScreen", "", "navController", "Landroidx/navigation/NavHostController;", "vm", "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;", "(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V", "app_debug", "startDate", "Ljava/time/LocalDate;", "kotlin.jvm.PlatformType", "endDate", "showStartPicker", "", "showEndPicker", "includePhotos", "includeFrames", "frameRate", ""}, k = 2, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class ReportsScreenKt {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit ReportsScreen$lambda$42(NavHostController navHostController, LalaViewModel lalaViewModel, int i, int i2, Composer composer, int i3) {
        ReportsScreen(navHostController, lalaViewModel, composer, RecomposeScopeImplKt.updateChangedFlags(i | 1), i2);
        return Unit.INSTANCE;
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x052f  */
    /* JADX WARN: Removed duplicated region for block: B:101:0x053d  */
    /* JADX WARN: Removed duplicated region for block: B:104:0x05ad  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x06d0  */
    /* JADX WARN: Removed duplicated region for block: B:111:0x06dc  */
    /* JADX WARN: Removed duplicated region for block: B:112:0x06e2  */
    /* JADX WARN: Removed duplicated region for block: B:115:0x0715  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x072b A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:123:0x0796  */
    /* JADX WARN: Removed duplicated region for block: B:124:0x07a4  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x0870  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x087c  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x0882  */
    /* JADX WARN: Removed duplicated region for block: B:134:0x08b3  */
    /* JADX WARN: Removed duplicated region for block: B:138:0x08c9  */
    /* JADX WARN: Removed duplicated region for block: B:142:0x0932  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x0940  */
    /* JADX WARN: Removed duplicated region for block: B:146:0x09a4  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x0a0a  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x0a44  */
    /* JADX WARN: Removed duplicated region for block: B:157:0x0ab5  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00e0  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00ff  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x011a  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x013d  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x016a  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0197  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x01a8  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x01c7  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x01db  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x01fa  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0211  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0236  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0250  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x02f2  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x02fe  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0304  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0337  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x034d A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0467  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0473  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0479  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x04ac  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x04c2 A[ADDED_TO_REGION] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void ReportsScreen(androidx.navigation.NavHostController r113, com.hardlineforge.lala.ui.viewmodel.LalaViewModel r114, androidx.compose.runtime.Composer r115, final int r116, final int r117) {
        /*
            Method dump skipped, instructions count: 2777
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.ReportsScreenKt.ReportsScreen(androidx.navigation.NavHostController, com.hardlineforge.lala.ui.viewmodel.LalaViewModel, androidx.compose.runtime.Composer, int, int):void");
    }

    private static final LocalDate ReportsScreen$lambda$1(MutableState<LocalDate> mutableState) {
        return mutableState.getValue();
    }

    private static final LocalDate ReportsScreen$lambda$4(MutableState<LocalDate> mutableState) {
        return mutableState.getValue();
    }

    private static final void ReportsScreen$lambda$8(MutableState<Boolean> mutableState, boolean z) {
        mutableState.setValue(Boolean.valueOf(z));
    }

    private static final void ReportsScreen$lambda$11(MutableState<Boolean> mutableState, boolean z) {
        mutableState.setValue(Boolean.valueOf(z));
    }

    private static final boolean ReportsScreen$lambda$13(MutableState<Boolean> mutableState) {
        return mutableState.getValue().booleanValue();
    }

    private static final void ReportsScreen$lambda$14(MutableState<Boolean> mutableState, boolean z) {
        mutableState.setValue(Boolean.valueOf(z));
    }

    private static final boolean ReportsScreen$lambda$16(MutableState<Boolean> mutableState) {
        return mutableState.getValue().booleanValue();
    }

    private static final void ReportsScreen$lambda$17(MutableState<Boolean> mutableState, boolean z) {
        mutableState.setValue(Boolean.valueOf(z));
    }

    private static final int ReportsScreen$lambda$19(MutableState<Integer> mutableState) {
        return mutableState.getValue().intValue();
    }

    private static final void ReportsScreen$lambda$20(MutableState<Integer> mutableState, int i) {
        mutableState.setValue(Integer.valueOf(i));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit ReportsScreen$lambda$41$lambda$27$lambda$22$lambda$21(MutableState $showStartPicker$delegate) {
        ReportsScreen$lambda$8($showStartPicker$delegate, true);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit ReportsScreen$lambda$41$lambda$27$lambda$23(MutableState $startDate$delegate, RowScope OutlinedButton, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(OutlinedButton, "$this$OutlinedButton");
        ComposerKt.sourceInformation($composer, "C35@1723L26:ReportsScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 17) != 16, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1251567859, $changed, -1, "com.hardlineforge.lala.ui.screens.ReportsScreen.<anonymous>.<anonymous>.<anonymous> (ReportsScreen.kt:35)");
            }
            String localDate = ReportsScreen$lambda$1($startDate$delegate).toString();
            Intrinsics.checkNotNullExpressionValue(localDate, "toString(...)");
            TextKt.m2743Text4IGK_g(localDate, (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 0, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit ReportsScreen$lambda$41$lambda$27$lambda$25$lambda$24(MutableState $showEndPicker$delegate) {
        ReportsScreen$lambda$11($showEndPicker$delegate, true);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit ReportsScreen$lambda$41$lambda$27$lambda$26(MutableState $endDate$delegate, RowScope OutlinedButton, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(OutlinedButton, "$this$OutlinedButton");
        ComposerKt.sourceInformation($composer, "C38@1914L24:ReportsScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 17) != 16, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1666209372, $changed, -1, "com.hardlineforge.lala.ui.screens.ReportsScreen.<anonymous>.<anonymous>.<anonymous> (ReportsScreen.kt:38)");
            }
            String localDate = ReportsScreen$lambda$4($endDate$delegate).toString();
            Intrinsics.checkNotNullExpressionValue(localDate, "toString(...)");
            TextKt.m2743Text4IGK_g(localDate, (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 0, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit ReportsScreen$lambda$41$lambda$30$lambda$29$lambda$28(MutableState $includePhotos$delegate, boolean it) {
        ReportsScreen$lambda$14($includePhotos$delegate, it);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit ReportsScreen$lambda$41$lambda$33$lambda$32$lambda$31(MutableState $includeFrames$delegate, boolean it) {
        ReportsScreen$lambda$17($includeFrames$delegate, it);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit ReportsScreen$lambda$41$lambda$38(final MutableState $frameRate$delegate, SingleChoiceSegmentedButtonRowScope $this$SingleChoiceSegmentedButtonRow, Composer $composer, int $changed) {
        SingleChoiceSegmentedButtonRowScope SingleChoiceSegmentedButtonRow = $this$SingleChoiceSegmentedButtonRow;
        Composer composer = $composer;
        Intrinsics.checkNotNullParameter(SingleChoiceSegmentedButtonRow, "$this$SingleChoiceSegmentedButtonRow");
        ComposerKt.sourceInformation(composer, "C*58@2786L19,59@2853L6,60@2889L20,56@2682L227:ReportsScreen.kt#4cebsy");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= composer.changed(SingleChoiceSegmentedButtonRow) ? 4 : 2;
        }
        int $dirty2 = $dirty;
        boolean z = true;
        if (!composer.shouldExecute(($dirty2 & 19) != 18, $dirty2 & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1710961561, $dirty2, -1, "com.hardlineforge.lala.ui.screens.ReportsScreen.<anonymous>.<anonymous> (ReportsScreen.kt:55)");
            }
            for (Number number : CollectionsKt.listOf((Object[]) new Integer[]{1, 2, 5, 10})) {
                final int intValue = number.intValue();
                boolean z2 = ReportsScreen$lambda$19($frameRate$delegate) == intValue ? z : false;
                ComposerKt.sourceInformationMarkerStart(composer, 170447348, "CC(remember):ReportsScreen.kt#9igjgp");
                boolean changed = composer.changed(intValue);
                Object rememberedValue = $composer.rememberedValue();
                if (changed || rememberedValue == Composer.Companion.getEmpty()) {
                    Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.ReportsScreenKt$$ExternalSyntheticLambda9
                        @Override // kotlin.jvm.functions.Function0
                        public final Object invoke() {
                            return ReportsScreenKt.ReportsScreen$lambda$41$lambda$38$lambda$37$lambda$35$lambda$34(intValue, $frameRate$delegate);
                        }
                    };
                    $composer.updateRememberedValue(obj);
                    rememberedValue = obj;
                }
                ComposerKt.sourceInformationMarkerEnd(composer);
                SegmentedButtonKt.SegmentedButton(SingleChoiceSegmentedButtonRow, z2, (Function0<Unit>) rememberedValue, (Shape) MaterialTheme.INSTANCE.getShapes(composer, MaterialTheme.$stable).getMedium(), (Modifier) null, false, (SegmentedButtonColors) null, (BorderStroke) null, (MutableInteractionSource) null, (Function2<? super Composer, ? super Integer, Unit>) null, (Function2<? super Composer, ? super Integer, Unit>) ComposableLambdaKt.rememberComposableLambda(-1306110415, z, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ReportsScreenKt$$ExternalSyntheticLambda10
                    @Override // kotlin.jvm.functions.Function2
                    public final Object invoke(Object obj2, Object obj3) {
                        return ReportsScreenKt.ReportsScreen$lambda$41$lambda$38$lambda$37$lambda$36(intValue, (Composer) obj2, ((Integer) obj3).intValue());
                    }
                }, composer, 54), composer, $dirty2 & 14, 6, (int) TypedValues.PositionType.TYPE_PERCENT_HEIGHT);
                SingleChoiceSegmentedButtonRow = $this$SingleChoiceSegmentedButtonRow;
                composer = $composer;
                z = z;
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit ReportsScreen$lambda$41$lambda$38$lambda$37$lambda$35$lambda$34(int $fps, MutableState $frameRate$delegate) {
        ReportsScreen$lambda$20($frameRate$delegate, $fps);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit ReportsScreen$lambda$41$lambda$38$lambda$37$lambda$36(int $fps, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C60@2891L16:ReportsScreen.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1306110415, $changed, -1, "com.hardlineforge.lala.ui.screens.ReportsScreen.<anonymous>.<anonymous>.<anonymous>.<anonymous> (ReportsScreen.kt:60)");
            }
            TextKt.m2743Text4IGK_g($fps + " fps", (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 0, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit ReportsScreen$lambda$41$lambda$40$lambda$39(NavHostController $navController, MutableState $startDate$delegate, MutableState $endDate$delegate) {
        ReportsScreen$lambda$1($startDate$delegate).atStartOfDay(ZoneId.systemDefault()).toInstant();
        ReportsScreen$lambda$4($endDate$delegate).plusDays(1L).atStartOfDay(ZoneId.systemDefault()).toInstant();
        NavController.navigate$default($navController, "pdf_preview", null, null, 6, null);
        return Unit.INSTANCE;
    }
}
