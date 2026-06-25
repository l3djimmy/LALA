package com.hardlineforge.lala.ui.screens;

import androidx.compose.foundation.layout.PaddingKt;
import androidx.compose.foundation.layout.RowScope;
import androidx.compose.material3.AppBarKt;
import androidx.compose.material3.ButtonKt;
import androidx.compose.material3.IconButtonKt;
import androidx.compose.material3.MaterialTheme;
import androidx.compose.material3.TextKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.State;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.style.TextAlign;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.compose.ui.unit.Dp;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.navigation.NavController;
import androidx.navigation.NavHostController;
import androidx.profileinstaller.ProfileVerifier;
import com.hardlineforge.lala.data.EditHistory;
import com.hardlineforge.lala.data.LogEntry;
import com.hardlineforge.lala.data.Photo;
import com.hardlineforge.lala.data.Video;
import com.hardlineforge.lala.ui.ColorUtilsKt;
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel;
import com.itextpdf.kernel.xmp.PdfConst;
import java.util.Arrays;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import kotlin.text.StringsKt;
/* compiled from: EntryDetailScreen.kt */
@Metadata(d1 = {"\u0000J\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\u001a'\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0007H\u0007¢\u0006\u0002\u0010\b\u001a\u0014\u0010\t\u001a\u00020\u0005*\u00020\n2\u0006\u0010\u000b\u001a\u00020\fH\u0002¨\u0006\r²\u0006\f\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u008a\u0084\u0002²\u0006\u0010\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00120\u0011X\u008a\u0084\u0002²\u0006\u0010\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00140\u0011X\u008a\u0084\u0002²\u0006\u0010\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00160\u0011X\u008a\u0084\u0002²\u0006\n\u0010\u0017\u001a\u00020\u0018X\u008a\u008e\u0002"}, d2 = {"EntryDetailScreen", "", "navController", "Landroidx/navigation/NavHostController;", "entryId", "", "vm", "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;", "(Landroidx/navigation/NavHostController;Ljava/lang/String;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V", PdfConst.Format, "", "decimals", "", "app_debug", "entry", "Lcom/hardlineforge/lala/data/LogEntry;", "photos", "", "Lcom/hardlineforge/lala/data/Photo;", "videos", "Lcom/hardlineforge/lala/data/Video;", "history", "Lcom/hardlineforge/lala/data/EditHistory;", "showDeleteConfirm", ""}, k = 2, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class EntryDetailScreenKt {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit EntryDetailScreen$lambda$40(NavHostController navHostController, String str, LalaViewModel lalaViewModel, int i, int i2, Composer composer, int i3) {
        EntryDetailScreen(navHostController, str, lalaViewModel, composer, RecomposeScopeImplKt.updateChangedFlags(i | 1), i2);
        return Unit.INSTANCE;
    }

    /* JADX WARN: Removed duplicated region for block: B:55:0x0112  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0128  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x012a  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0192  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x01ab  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x01bf  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x01d7  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0274  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x02fb  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x030c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void EntryDetailScreen(final androidx.navigation.NavHostController r33, final java.lang.String r34, com.hardlineforge.lala.ui.viewmodel.LalaViewModel r35, androidx.compose.runtime.Composer r36, final int r37, final int r38) {
        /*
            Method dump skipped, instructions count: 810
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.EntryDetailScreenKt.EntryDetailScreen(androidx.navigation.NavHostController, java.lang.String, com.hardlineforge.lala.ui.viewmodel.LalaViewModel, androidx.compose.runtime.Composer, int, int):void");
    }

    private static final LogEntry EntryDetailScreen$lambda$1(State<LogEntry> state) {
        return (LogEntry) state.getValue();
    }

    private static final List<Photo> EntryDetailScreen$lambda$2(State<? extends List<Photo>> state) {
        return (List) state.getValue();
    }

    private static final List<Video> EntryDetailScreen$lambda$3(State<? extends List<Video>> state) {
        return (List) state.getValue();
    }

    private static final List<EditHistory> EntryDetailScreen$lambda$4(State<? extends List<EditHistory>> state) {
        return (List) state.getValue();
    }

    private static final boolean EntryDetailScreen$lambda$6(MutableState<Boolean> mutableState) {
        return mutableState.getValue().booleanValue();
    }

    private static final void EntryDetailScreen$lambda$7(MutableState<Boolean> mutableState, boolean z) {
        mutableState.setValue(Boolean.valueOf(z));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit EntryDetailScreen$lambda$30$lambda$16(final NavHostController $navController, final LogEntry $e, final MutableState $showDeleteConfirm$delegate, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C49@1950L208,54@2190L467,47@1848L827:EntryDetailScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-672462923, $changed, -1, "com.hardlineforge.lala.ui.screens.EntryDetailScreen.<anonymous>.<anonymous> (EntryDetailScreen.kt:47)");
            }
            AppBarKt.m1823TopAppBarGHTll3U(ComposableSingletons$EntryDetailScreenKt.INSTANCE.getLambda$1713608313$app_debug(), null, ComposableLambdaKt.rememberComposableLambda(40018427, true, new Function2() { // from class: com.hardlineforge.lala.ui.screens.EntryDetailScreenKt$$ExternalSyntheticLambda1
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    return EntryDetailScreenKt.EntryDetailScreen$lambda$30$lambda$16$lambda$10(NavHostController.this, (Composer) obj, ((Integer) obj2).intValue());
                }
            }, $composer, 54), ComposableLambdaKt.rememberComposableLambda(-1658492572, true, new Function3() { // from class: com.hardlineforge.lala.ui.screens.EntryDetailScreenKt$$ExternalSyntheticLambda2
                @Override // kotlin.jvm.functions.Function3
                public final Object invoke(Object obj, Object obj2, Object obj3) {
                    return EntryDetailScreenKt.EntryDetailScreen$lambda$30$lambda$16$lambda$15(NavHostController.this, $e, $showDeleteConfirm$delegate, (RowScope) obj, (Composer) obj2, ((Integer) obj3).intValue());
                }
            }, $composer, 54), 0.0f, null, null, null, $composer, 3462, 242);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit EntryDetailScreen$lambda$30$lambda$16$lambda$10(final NavHostController $navController, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C50@1997L32,50@1976L160:EntryDetailScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(40018427, $changed, -1, "com.hardlineforge.lala.ui.screens.EntryDetailScreen.<anonymous>.<anonymous>.<anonymous> (EntryDetailScreen.kt:50)");
            }
            ComposerKt.sourceInformationMarkerStart($composer, -196995781, "CC(remember):EntryDetailScreen.kt#9igjgp");
            boolean changedInstance = $composer.changedInstance($navController);
            Object rememberedValue = $composer.rememberedValue();
            if (changedInstance || rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.EntryDetailScreenKt$$ExternalSyntheticLambda3
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return EntryDetailScreenKt.EntryDetailScreen$lambda$30$lambda$16$lambda$10$lambda$9$lambda$8(NavHostController.this);
                    }
                };
                $composer.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            IconButtonKt.IconButton((Function0) rememberedValue, null, false, null, null, ComposableSingletons$EntryDetailScreenKt.INSTANCE.m7307getLambda$1254254888$app_debug(), $composer, ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE, 30);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit EntryDetailScreen$lambda$30$lambda$16$lambda$10$lambda$9$lambda$8(NavHostController $navController) {
        $navController.popBackStack();
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit EntryDetailScreen$lambda$30$lambda$16$lambda$15(final NavHostController $navController, final LogEntry $e, final MutableState $showDeleteConfirm$delegate, RowScope TopAppBar, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(TopAppBar, "$this$TopAppBar");
        ComposerKt.sourceInformation($composer, "C55@2237L100,55@2216L211,60@2473L28,60@2452L183:EntryDetailScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 17) != 16, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1658492572, $changed, -1, "com.hardlineforge.lala.ui.screens.EntryDetailScreen.<anonymous>.<anonymous>.<anonymous> (EntryDetailScreen.kt:55)");
            }
            ComposerKt.sourceInformationMarkerStart($composer, -378493272, "CC(remember):EntryDetailScreen.kt#9igjgp");
            boolean changedInstance = $composer.changedInstance($navController) | $composer.changedInstance($e);
            Object rememberedValue = $composer.rememberedValue();
            if (changedInstance || rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.EntryDetailScreenKt$$ExternalSyntheticLambda14
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return EntryDetailScreenKt.EntryDetailScreen$lambda$30$lambda$16$lambda$15$lambda$12$lambda$11(NavHostController.this, $e);
                    }
                };
                $composer.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            IconButtonKt.IconButton((Function0) rememberedValue, null, false, null, null, ComposableSingletons$EntryDetailScreenKt.INSTANCE.getLambda$1656986919$app_debug(), $composer, ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE, 30);
            ComposerKt.sourceInformationMarkerStart($composer, -378485792, "CC(remember):EntryDetailScreen.kt#9igjgp");
            Object rememberedValue2 = $composer.rememberedValue();
            if (rememberedValue2 == Composer.Companion.getEmpty()) {
                Object obj2 = new Function0() { // from class: com.hardlineforge.lala.ui.screens.EntryDetailScreenKt$$ExternalSyntheticLambda15
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return EntryDetailScreenKt.EntryDetailScreen$lambda$30$lambda$16$lambda$15$lambda$14$lambda$13(MutableState.this);
                    }
                };
                $composer.updateRememberedValue(obj2);
                rememberedValue2 = obj2;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            IconButtonKt.IconButton((Function0) rememberedValue2, null, false, null, null, ComposableSingletons$EntryDetailScreenKt.INSTANCE.m7309getLambda$1957076208$app_debug(), $composer, 196614, 30);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit EntryDetailScreen$lambda$30$lambda$16$lambda$15$lambda$12$lambda$11(NavHostController $navController, LogEntry $e) {
        NavController.navigate$default($navController, "edit_entry/" + $e.getId(), null, null, 6, null);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit EntryDetailScreen$lambda$30$lambda$16$lambda$15$lambda$14$lambda$13(MutableState $showDeleteConfirm$delegate) {
        EntryDetailScreen$lambda$7($showDeleteConfirm$delegate, true);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Removed duplicated region for block: B:114:0x095b  */
    /* JADX WARN: Removed duplicated region for block: B:121:0x098a A[LOOP:2: B:119:0x0984->B:121:0x098a, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:123:0x0a0f  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x0a26  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x0a94  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x0aa9  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x0b17  */
    /* JADX WARN: Removed duplicated region for block: B:134:0x0b49  */
    /* JADX WARN: Removed duplicated region for block: B:141:0x0bce  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0265  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0271  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0277  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x03a6  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x03b2  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x056a  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x057b  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0675  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x078f  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x07a4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final kotlin.Unit EntryDetailScreen$lambda$30$lambda$29(final com.hardlineforge.lala.data.LogEntry r112, final androidx.navigation.NavHostController r113, java.lang.String r114, androidx.compose.runtime.State r115, androidx.compose.runtime.State r116, androidx.compose.runtime.State r117, androidx.compose.foundation.layout.PaddingValues r118, androidx.compose.runtime.Composer r119, int r120) {
        /*
            Method dump skipped, instructions count: 3034
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.EntryDetailScreenKt.EntryDetailScreen$lambda$30$lambda$29(com.hardlineforge.lala.data.LogEntry, androidx.navigation.NavHostController, java.lang.String, androidx.compose.runtime.State, androidx.compose.runtime.State, androidx.compose.runtime.State, androidx.compose.foundation.layout.PaddingValues, androidx.compose.runtime.Composer, int):kotlin.Unit");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit EntryDetailScreen$lambda$30$lambda$29$lambda$28$lambda$17(LogEntry $e, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C83@3379L10,84@3435L25,81@3284L288:EntryDetailScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-867137317, $changed, -1, "com.hardlineforge.lala.ui.screens.EntryDetailScreen.<anonymous>.<anonymous>.<anonymous>.<anonymous> (EntryDetailScreen.kt:81)");
            }
            TextKt.m2743Text4IGK_g($e.getCategory(), PaddingKt.m994paddingVpY3zN4(Modifier.Companion, Dp.m6873constructorimpl(12), Dp.m6873constructorimpl(4)), ColorUtilsKt.categoryColor($e.getCategory(), $composer, 0), 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, MaterialTheme.INSTANCE.getTypography($composer, MaterialTheme.$stable).getLabelMedium(), $composer, 48, 0, 65528);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit EntryDetailScreen$lambda$30$lambda$29$lambda$28$lambda$25$lambda$24$lambda$23(String $tag, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C148@6501L10,145@6288L268:EntryDetailScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1658187891, $changed, -1, "com.hardlineforge.lala.ui.screens.EntryDetailScreen.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (EntryDetailScreen.kt:145)");
            }
            TextKt.m2743Text4IGK_g(StringsKt.trim((CharSequence) $tag).toString(), PaddingKt.m994paddingVpY3zN4(Modifier.Companion, Dp.m6873constructorimpl(8), Dp.m6873constructorimpl(2)), 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, MaterialTheme.INSTANCE.getTypography($composer, MaterialTheme.$stable).getLabelSmall(), $composer, 48, 0, 65532);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit EntryDetailScreen$lambda$30$lambda$29$lambda$28$lambda$27$lambda$26(NavHostController $navController) {
        NavController.navigate$default($navController, "pdf_preview", null, null, 6, null);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit EntryDetailScreen$lambda$32$lambda$31(MutableState $showDeleteConfirm$delegate) {
        EntryDetailScreen$lambda$7($showDeleteConfirm$delegate, false);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit EntryDetailScreen$lambda$36(final State $entry$delegate, final LalaViewModel $vm, final NavHostController $navController, final MutableState $showDeleteConfirm$delegate, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C191@7983L184,190@7941L304:EntryDetailScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(912880077, $changed, -1, "com.hardlineforge.lala.ui.screens.EntryDetailScreen.<anonymous> (EntryDetailScreen.kt:190)");
            }
            ComposerKt.sourceInformationMarkerStart($composer, 1104427717, "CC(remember):EntryDetailScreen.kt#9igjgp");
            boolean changed = $composer.changed($entry$delegate) | $composer.changedInstance($vm) | $composer.changedInstance($navController);
            Object rememberedValue = $composer.rememberedValue();
            if (changed || rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.EntryDetailScreenKt$$ExternalSyntheticLambda10
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return EntryDetailScreenKt.EntryDetailScreen$lambda$36$lambda$35$lambda$34(NavHostController.this, $entry$delegate, $vm, $showDeleteConfirm$delegate);
                    }
                };
                $composer.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            ButtonKt.TextButton((Function0) rememberedValue, null, false, null, null, null, null, null, null, ComposableSingletons$EntryDetailScreenKt.INSTANCE.m7308getLambda$1482663056$app_debug(), $composer, 805306368, TypedValues.PositionType.TYPE_POSITION_TYPE);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit EntryDetailScreen$lambda$36$lambda$35$lambda$34(NavHostController $navController, State $entry$delegate, LalaViewModel $vm, MutableState $showDeleteConfirm$delegate) {
        LogEntry EntryDetailScreen$lambda$1 = EntryDetailScreen$lambda$1($entry$delegate);
        if (EntryDetailScreen$lambda$1 != null) {
            $vm.deleteEntry(EntryDetailScreen$lambda$1);
        }
        EntryDetailScreen$lambda$7($showDeleteConfirm$delegate, false);
        $navController.popBackStack();
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit EntryDetailScreen$lambda$39(final MutableState $showDeleteConfirm$delegate, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C199@8328L29,199@8307L70:EntryDetailScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1282348789, $changed, -1, "com.hardlineforge.lala.ui.screens.EntryDetailScreen.<anonymous> (EntryDetailScreen.kt:199)");
            }
            ComposerKt.sourceInformationMarkerStart($composer, 318429000, "CC(remember):EntryDetailScreen.kt#9igjgp");
            Object rememberedValue = $composer.rememberedValue();
            if (rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.EntryDetailScreenKt$$ExternalSyntheticLambda0
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return EntryDetailScreenKt.EntryDetailScreen$lambda$39$lambda$38$lambda$37(MutableState.this);
                    }
                };
                $composer.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            ButtonKt.TextButton((Function0) rememberedValue, null, false, null, null, null, null, null, null, ComposableSingletons$EntryDetailScreenKt.INSTANCE.getLambda$617075374$app_debug(), $composer, 805306374, TypedValues.PositionType.TYPE_POSITION_TYPE);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit EntryDetailScreen$lambda$39$lambda$38$lambda$37(MutableState $showDeleteConfirm$delegate) {
        EntryDetailScreen$lambda$7($showDeleteConfirm$delegate, false);
        return Unit.INSTANCE;
    }

    private static final String format(double $this$format, int decimals) {
        StringCompanionObject stringCompanionObject = StringCompanionObject.INSTANCE;
        String format = String.format("%." + decimals + "f", Arrays.copyOf(new Object[]{Double.valueOf($this$format)}, 1));
        Intrinsics.checkNotNullExpressionValue(format, "format(...)");
        return format;
    }
}
