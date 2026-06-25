package com.hardlineforge.lala.ui.screens;

import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.foundation.layout.RowScope;
import androidx.compose.foundation.layout.SizeKt;
import androidx.compose.foundation.text.KeyboardActionScope;
import androidx.compose.foundation.text.KeyboardActions;
import androidx.compose.foundation.text.KeyboardOptions;
import androidx.compose.material3.AppBarKt;
import androidx.compose.material3.ButtonKt;
import androidx.compose.material3.IconButtonKt;
import androidx.compose.material3.OutlinedTextFieldKt;
import androidx.compose.material3.ProgressIndicatorKt;
import androidx.compose.material3.TextFieldColors;
import androidx.compose.material3.TextKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.State;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.graphics.Shape;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.input.VisualTransformation;
import androidx.compose.ui.text.style.TextAlign;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.compose.ui.unit.Dp;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.navigation.NavController;
import androidx.navigation.NavHostController;
import androidx.profileinstaller.ProfileVerifier;
import com.hardlineforge.lala.data.CustomCategory;
import com.hardlineforge.lala.data.LogEntry;
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel;
import com.itextpdf.kernel.xmp.PdfConst;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import kotlin.text.StringsKt;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: AddEditScreen.kt */
@Metadata(d1 = {"\u0000J\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\u0005\u001a)\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\b\u0010\u0004\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0007H\u0007¢\u0006\u0002\u0010\b\u001a\u0014\u0010\t\u001a\u00020\u0005*\u00020\n2\u0006\u0010\u000b\u001a\u00020\fH\u0002¨\u0006\r²\u0006\f\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u008a\u0084\u0002²\u0006\u0010\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00120\u0011X\u008a\u0084\u0002²\u0006\u0012\u0010\u0013\u001a\n \u0015*\u0004\u0018\u00010\u00140\u0014X\u008a\u008e\u0002²\u0006\u0012\u0010\u0016\u001a\n \u0015*\u0004\u0018\u00010\u00050\u0005X\u008a\u008e\u0002²\u0006\f\u0010\u0017\u001a\u0004\u0018\u00010\nX\u008a\u008e\u0002²\u0006\f\u0010\u0018\u001a\u0004\u0018\u00010\nX\u008a\u008e\u0002²\u0006\n\u0010\u0019\u001a\u00020\u0005X\u008a\u008e\u0002²\u0006\n\u0010\u001a\u001a\u00020\u0005X\u008a\u008e\u0002²\u0006\n\u0010\u001b\u001a\u00020\u0005X\u008a\u008e\u0002²\u0006\n\u0010\u001c\u001a\u00020\u0005X\u008a\u008e\u0002²\u0006\n\u0010\u001d\u001a\u00020\u001eX\u008a\u008e\u0002²\u0006\n\u0010\u001f\u001a\u00020\u001eX\u008a\u008e\u0002²\u0006\n\u0010 \u001a\u00020\u001eX\u008a\u008e\u0002²\u0006\n\u0010!\u001a\u00020\u001eX\u008a\u008e\u0002²\u0006\n\u0010\"\u001a\u00020\u0005X\u008a\u008e\u0002²\u0006\n\u0010#\u001a\u00020\u001eX\u008a\u008e\u0002"}, d2 = {"AddEditScreen", "", "navController", "Landroidx/navigation/NavHostController;", "entryId", "", "vm", "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;", "(Landroidx/navigation/NavHostController;Ljava/lang/String;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V", PdfConst.Format, "", "decimals", "", "app_debug", "existing", "Lcom/hardlineforge/lala/data/LogEntry;", "customCats", "", "Lcom/hardlineforge/lala/data/CustomCategory;", "timestamp", "Ljava/time/LocalDateTime;", "kotlin.jvm.PlatformType", "timezone", "gpsLat", "gpsLon", "category", "locationName", "comment", "tags", "showCategoryPicker", "", "showDatePicker", "showTimePicker", "showEditNoteDialog", "editNote", "gpsLoading"}, k = 2, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class AddEditScreenKt {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$106(NavHostController navHostController, String str, LalaViewModel lalaViewModel, int i, int i2, Composer composer, int i3) {
        AddEditScreen(navHostController, str, lalaViewModel, composer, RecomposeScopeImplKt.updateChangedFlags(i | 1), i2);
        return Unit.INSTANCE;
    }

    /* JADX WARN: Removed duplicated region for block: B:156:0x067f  */
    /* JADX WARN: Removed duplicated region for block: B:161:0x0711  */
    /* JADX WARN: Removed duplicated region for block: B:164:0x0720  */
    /* JADX WARN: Removed duplicated region for block: B:169:0x07da  */
    /* JADX WARN: Removed duplicated region for block: B:172:0x07f6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void AddEditScreen(final androidx.navigation.NavHostController r49, final java.lang.String r50, com.hardlineforge.lala.ui.viewmodel.LalaViewModel r51, androidx.compose.runtime.Composer r52, final int r53, final int r54) {
        /*
            Method dump skipped, instructions count: 2073
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.AddEditScreenKt.AddEditScreen(androidx.navigation.NavHostController, java.lang.String, com.hardlineforge.lala.ui.viewmodel.LalaViewModel, androidx.compose.runtime.Composer, int, int):void");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final LogEntry AddEditScreen$lambda$0(State<LogEntry> state) {
        return (LogEntry) state.getValue();
    }

    private static final List<CustomCategory> AddEditScreen$lambda$1(State<? extends List<CustomCategory>> state) {
        return (List) state.getValue();
    }

    private static final LocalDateTime AddEditScreen$lambda$4(MutableState<LocalDateTime> mutableState) {
        return mutableState.getValue();
    }

    private static final String AddEditScreen$lambda$7(MutableState<String> mutableState) {
        return mutableState.getValue();
    }

    private static final Double AddEditScreen$lambda$10(MutableState<Double> mutableState) {
        return mutableState.getValue();
    }

    private static final Double AddEditScreen$lambda$13(MutableState<Double> mutableState) {
        return mutableState.getValue();
    }

    private static final String AddEditScreen$lambda$16(MutableState<String> mutableState) {
        return mutableState.getValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String AddEditScreen$lambda$19(MutableState<String> mutableState) {
        return mutableState.getValue();
    }

    private static final String AddEditScreen$lambda$22(MutableState<String> mutableState) {
        return mutableState.getValue();
    }

    private static final String AddEditScreen$lambda$25(MutableState<String> mutableState) {
        return mutableState.getValue();
    }

    private static final boolean AddEditScreen$lambda$28(MutableState<Boolean> mutableState) {
        return mutableState.getValue().booleanValue();
    }

    private static final void AddEditScreen$lambda$29(MutableState<Boolean> mutableState, boolean z) {
        mutableState.setValue(Boolean.valueOf(z));
    }

    private static final void AddEditScreen$lambda$32(MutableState<Boolean> mutableState, boolean z) {
        mutableState.setValue(Boolean.valueOf(z));
    }

    private static final void AddEditScreen$lambda$35(MutableState<Boolean> mutableState, boolean z) {
        mutableState.setValue(Boolean.valueOf(z));
    }

    private static final boolean AddEditScreen$lambda$37(MutableState<Boolean> mutableState) {
        return mutableState.getValue().booleanValue();
    }

    private static final void AddEditScreen$lambda$38(MutableState<Boolean> mutableState, boolean z) {
        mutableState.setValue(Boolean.valueOf(z));
    }

    private static final String AddEditScreen$lambda$40(MutableState<String> mutableState) {
        return mutableState.getValue();
    }

    private static final boolean AddEditScreen$lambda$43(MutableState<Boolean> mutableState) {
        return mutableState.getValue().booleanValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void AddEditScreen$lambda$44(MutableState<Boolean> mutableState, boolean z) {
        mutableState.setValue(Boolean.valueOf(z));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$56(final boolean $isNew, final NavHostController $navController, final LogEntry $entry, final State $existing$delegate, final LalaViewModel $vm, final MutableState $comment$delegate, final MutableState $timestamp$delegate, final MutableState $timezone$delegate, final MutableState $gpsLat$delegate, final MutableState $gpsLon$delegate, final MutableState $category$delegate, final MutableState $locationName$delegate, final MutableState $tags$delegate, final MutableState $showEditNoteDialog$delegate, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C96@3773L54,97@3862L192,102@4082L1333,95@3738L1691:AddEditScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1556155138, $changed, -1, "com.hardlineforge.lala.ui.screens.AddEditScreen.<anonymous> (AddEditScreen.kt:95)");
            }
            AppBarKt.m1823TopAppBarGHTll3U(ComposableLambdaKt.rememberComposableLambda(-1052500294, true, new Function2() { // from class: com.hardlineforge.lala.ui.screens.AddEditScreenKt$$ExternalSyntheticLambda3
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    return AddEditScreenKt.AddEditScreen$lambda$56$lambda$48($isNew, (Composer) obj, ((Integer) obj2).intValue());
                }
            }, $composer, 54), null, ComposableLambdaKt.rememberComposableLambda(-580160648, true, new Function2() { // from class: com.hardlineforge.lala.ui.screens.AddEditScreenKt$$ExternalSyntheticLambda4
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    return AddEditScreenKt.AddEditScreen$lambda$56$lambda$51(NavHostController.this, (Composer) obj, ((Integer) obj2).intValue());
                }
            }, $composer, 54), ComposableLambdaKt.rememberComposableLambda(-259337937, true, new Function3() { // from class: com.hardlineforge.lala.ui.screens.AddEditScreenKt$$ExternalSyntheticLambda5
                @Override // kotlin.jvm.functions.Function3
                public final Object invoke(Object obj, Object obj2, Object obj3) {
                    return AddEditScreenKt.AddEditScreen$lambda$56$lambda$55(LogEntry.this, $isNew, $existing$delegate, $vm, $navController, $comment$delegate, $timestamp$delegate, $timezone$delegate, $gpsLat$delegate, $gpsLon$delegate, $category$delegate, $locationName$delegate, $tags$delegate, $showEditNoteDialog$delegate, (RowScope) obj, (Composer) obj2, ((Integer) obj3).intValue());
                }
            }, $composer, 54), 0.0f, null, null, null, $composer, 3462, 242);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$56$lambda$48(boolean $isNew, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C96@3775L50:AddEditScreen.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1052500294, $changed, -1, "com.hardlineforge.lala.ui.screens.AddEditScreen.<anonymous>.<anonymous> (AddEditScreen.kt:96)");
            }
            TextKt.m2743Text4IGK_g($isNew ? "New Log Entry" : "Edit Entry", (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 0, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$56$lambda$51(final NavHostController $navController, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C98@3905L32,98@3884L152:AddEditScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-580160648, $changed, -1, "com.hardlineforge.lala.ui.screens.AddEditScreen.<anonymous>.<anonymous> (AddEditScreen.kt:98)");
            }
            ComposerKt.sourceInformationMarkerStart($composer, 811367160, "CC(remember):AddEditScreen.kt#9igjgp");
            boolean changedInstance = $composer.changedInstance($navController);
            Object rememberedValue = $composer.rememberedValue();
            if (changedInstance || rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.AddEditScreenKt$$ExternalSyntheticLambda17
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return AddEditScreenKt.AddEditScreen$lambda$56$lambda$51$lambda$50$lambda$49(NavHostController.this);
                    }
                };
                $composer.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            IconButtonKt.IconButton((Function0) rememberedValue, null, false, null, null, ComposableSingletons$AddEditScreenKt.INSTANCE.getLambda$1174843963$app_debug(), $composer, ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE, 30);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$56$lambda$51$lambda$50$lambda$49(NavHostController $navController) {
        $navController.popBackStack();
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$56$lambda$55(final LogEntry $entry, final boolean $isNew, final State $existing$delegate, final LalaViewModel $vm, final NavHostController $navController, final MutableState $comment$delegate, final MutableState $timestamp$delegate, final MutableState $timezone$delegate, final MutableState $gpsLat$delegate, final MutableState $gpsLon$delegate, final MutableState $category$delegate, final MutableState $locationName$delegate, final MutableState $tags$delegate, final MutableState $showEditNoteDialog$delegate, RowScope TopAppBar, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(TopAppBar, "$this$TopAppBar");
        ComposerKt.sourceInformation($composer, "C103@4125L1189,103@4104L1293:AddEditScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 17) != 16, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-259337937, $changed, -1, "com.hardlineforge.lala.ui.screens.AddEditScreen.<anonymous>.<anonymous> (AddEditScreen.kt:103)");
            }
            ComposerKt.sourceInformationMarkerStart($composer, -115651724, "CC(remember):AddEditScreen.kt#9igjgp");
            boolean changedInstance = $composer.changedInstance($entry) | $composer.changed($isNew) | $composer.changed($existing$delegate) | $composer.changedInstance($vm) | $composer.changedInstance($navController);
            Object rememberedValue = $composer.rememberedValue();
            if (changedInstance || rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.AddEditScreenKt$$ExternalSyntheticLambda1
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return AddEditScreenKt.AddEditScreen$lambda$56$lambda$55$lambda$54$lambda$53(LogEntry.this, $isNew, $vm, $navController, $comment$delegate, $timestamp$delegate, $timezone$delegate, $gpsLat$delegate, $gpsLon$delegate, $category$delegate, $locationName$delegate, $tags$delegate, $existing$delegate, $showEditNoteDialog$delegate);
                    }
                };
                $composer.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            IconButtonKt.IconButton((Function0) rememberedValue, null, false, null, null, ComposableSingletons$AddEditScreenKt.INSTANCE.m7301getLambda$475628084$app_debug(), $composer, ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE, 30);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$56$lambda$55$lambda$54$lambda$53(LogEntry $entry, boolean $isNew, LalaViewModel $vm, NavHostController $navController, MutableState $comment$delegate, MutableState $timestamp$delegate, MutableState $timezone$delegate, MutableState $gpsLat$delegate, MutableState $gpsLon$delegate, MutableState $category$delegate, MutableState $locationName$delegate, MutableState $tags$delegate, State $existing$delegate, MutableState $showEditNoteDialog$delegate) {
        String uuid;
        Instant now;
        if (StringsKt.isBlank(AddEditScreen$lambda$22($comment$delegate))) {
            return Unit.INSTANCE;
        }
        Instant instant = AddEditScreen$lambda$4($timestamp$delegate).atZone(ZoneId.of(AddEditScreen$lambda$7($timezone$delegate))).toInstant();
        if ($entry == null || (uuid = $entry.getId()) == null) {
            uuid = UUID.randomUUID().toString();
            Intrinsics.checkNotNullExpressionValue(uuid, "toString(...)");
        }
        String str = uuid;
        Intrinsics.checkNotNull(instant);
        String AddEditScreen$lambda$7 = AddEditScreen$lambda$7($timezone$delegate);
        Intrinsics.checkNotNullExpressionValue(AddEditScreen$lambda$7, "AddEditScreen$lambda$7(...)");
        Double AddEditScreen$lambda$10 = AddEditScreen$lambda$10($gpsLat$delegate);
        Double AddEditScreen$lambda$13 = AddEditScreen$lambda$13($gpsLon$delegate);
        String AddEditScreen$lambda$16 = AddEditScreen$lambda$16($category$delegate);
        String AddEditScreen$lambda$19 = AddEditScreen$lambda$19($locationName$delegate);
        if (StringsKt.isBlank(AddEditScreen$lambda$19)) {
            AddEditScreen$lambda$19 = null;
        }
        String str2 = AddEditScreen$lambda$19;
        String obj = StringsKt.trim((CharSequence) AddEditScreen$lambda$22($comment$delegate)).toString();
        String obj2 = StringsKt.trim((CharSequence) AddEditScreen$lambda$25($tags$delegate)).toString();
        if ($entry == null || (now = $entry.getCreatedAt()) == null) {
            now = Instant.now();
        }
        Instant instant2 = now;
        Intrinsics.checkNotNull(instant2);
        Instant now2 = Instant.now();
        Intrinsics.checkNotNullExpressionValue(now2, "now(...)");
        LogEntry newEntry = new LogEntry(str, instant, AddEditScreen$lambda$7, AddEditScreen$lambda$10, AddEditScreen$lambda$13, null, AddEditScreen$lambda$16, str2, obj, obj2, instant2, now2, 32, null);
        if (!$isNew) {
            String AddEditScreen$lambda$22 = AddEditScreen$lambda$22($comment$delegate);
            LogEntry AddEditScreen$lambda$0 = AddEditScreen$lambda$0($existing$delegate);
            if (!Intrinsics.areEqual(AddEditScreen$lambda$22, (AddEditScreen$lambda$0 == null || (r1 = AddEditScreen$lambda$0.getComment()) == null) ? "" : "")) {
                AddEditScreen$lambda$38($showEditNoteDialog$delegate, true);
                return Unit.INSTANCE;
            }
        }
        LalaViewModel.saveEntry$default($vm, newEntry, $isNew, null, 4, null);
        $navController.popBackStack();
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Code restructure failed: missing block: B:107:0x0964, code lost:
        if (r2 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L83;
     */
    /* JADX WARN: Code restructure failed: missing block: B:115:0x09cd, code lost:
        if (r8 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L88;
     */
    /* JADX WARN: Removed duplicated region for block: B:102:0x08f4  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x095c  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x0968  */
    /* JADX WARN: Removed duplicated region for block: B:114:0x09c5  */
    /* JADX WARN: Removed duplicated region for block: B:118:0x09d1  */
    /* JADX WARN: Removed duplicated region for block: B:122:0x0a5d  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0231  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x023d  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0243  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x02fe  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0312  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0386  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0399  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0458  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x046a  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0501  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0546  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0556  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x061f  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0631  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x06b3  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x06c5  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0715  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0807  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x080f  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x081d  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x089b  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x08a7  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x08ad  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x08de  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final kotlin.Unit AddEditScreen$lambda$84(com.hardlineforge.lala.data.LogEntry r85, java.lang.String r86, final androidx.compose.runtime.MutableState r87, final androidx.compose.runtime.MutableState r88, final androidx.compose.runtime.MutableState r89, final androidx.compose.runtime.MutableState r90, final androidx.compose.runtime.MutableState r91, androidx.compose.runtime.MutableState r92, final kotlinx.coroutines.CoroutineScope r93, final com.hardlineforge.lala.ui.viewmodel.LalaViewModel r94, final androidx.compose.runtime.MutableState r95, final boolean r96, final androidx.compose.runtime.MutableState r97, final androidx.compose.runtime.MutableState r98, final androidx.compose.runtime.MutableState r99, final androidx.compose.runtime.MutableState r100, final androidx.navigation.NavHostController r101, androidx.compose.foundation.layout.PaddingValues r102, androidx.compose.runtime.Composer r103, int r104) {
        /*
            Method dump skipped, instructions count: 2665
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.AddEditScreenKt.AddEditScreen$lambda$84(com.hardlineforge.lala.data.LogEntry, java.lang.String, androidx.compose.runtime.MutableState, androidx.compose.runtime.MutableState, androidx.compose.runtime.MutableState, androidx.compose.runtime.MutableState, androidx.compose.runtime.MutableState, androidx.compose.runtime.MutableState, kotlinx.coroutines.CoroutineScope, com.hardlineforge.lala.ui.viewmodel.LalaViewModel, androidx.compose.runtime.MutableState, boolean, androidx.compose.runtime.MutableState, androidx.compose.runtime.MutableState, androidx.compose.runtime.MutableState, androidx.compose.runtime.MutableState, androidx.navigation.NavHostController, androidx.compose.foundation.layout.PaddingValues, androidx.compose.runtime.Composer, int):kotlin.Unit");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$84$lambda$83$lambda$63$lambda$58$lambda$57(MutableState $showDatePicker$delegate) {
        AddEditScreen$lambda$32($showDatePicker$delegate, true);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$84$lambda$83$lambda$63$lambda$59(MutableState $timestamp$delegate, RowScope OutlinedButton, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(OutlinedButton, "$this$OutlinedButton");
        ComposerKt.sourceInformation($composer, "C150@6145L66:AddEditScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 17) != 16, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(683226749, $changed, -1, "com.hardlineforge.lala.ui.screens.AddEditScreen.<anonymous>.<anonymous>.<anonymous>.<anonymous> (AddEditScreen.kt:150)");
            }
            String format = AddEditScreen$lambda$4($timestamp$delegate).format(DateTimeFormatter.ofPattern("MMM d, yyyy"));
            Intrinsics.checkNotNullExpressionValue(format, "format(...)");
            TextKt.m2743Text4IGK_g(format, (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 0, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$84$lambda$83$lambda$63$lambda$61$lambda$60(MutableState $showTimePicker$delegate) {
        AddEditScreen$lambda$35($showTimePicker$delegate, true);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$84$lambda$83$lambda$63$lambda$62(MutableState $timestamp$delegate, RowScope OutlinedButton, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(OutlinedButton, "$this$OutlinedButton");
        ComposerKt.sourceInformation($composer, "C157@6467L61:AddEditScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 17) != 16, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(171745830, $changed, -1, "com.hardlineforge.lala.ui.screens.AddEditScreen.<anonymous>.<anonymous>.<anonymous>.<anonymous> (AddEditScreen.kt:157)");
            }
            String format = AddEditScreen$lambda$4($timestamp$delegate).format(DateTimeFormatter.ofPattern("h:mm a"));
            Intrinsics.checkNotNullExpressionValue(format, "format(...)");
            TextKt.m2743Text4IGK_g(format, (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 0, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$84$lambda$83$lambda$65$lambda$64(MutableState $showCategoryPicker$delegate) {
        AddEditScreen$lambda$29($showCategoryPicker$delegate, true);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$84$lambda$83$lambda$66(MutableState $category$delegate, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C166@6805L14:AddEditScreen.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1947321344, $changed, -1, "com.hardlineforge.lala.ui.screens.AddEditScreen.<anonymous>.<anonymous>.<anonymous> (AddEditScreen.kt:166)");
            }
            TextKt.m2743Text4IGK_g(AddEditScreen$lambda$16($category$delegate), (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 0, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$84$lambda$83$lambda$70$lambda$69(MutableState $locationName$delegate, String it) {
        Intrinsics.checkNotNullParameter(it, "it");
        $locationName$delegate.setValue(it);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$84$lambda$83$lambda$73(final CoroutineScope $scope, final LalaViewModel $vm, final MutableState $gpsLoading$delegate, final boolean $hasLocPerm, final MutableState $gpsLat$delegate, final MutableState $gpsLon$delegate, final MutableState $locationName$delegate, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C:AddEditScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(575257532, $changed, -1, "com.hardlineforge.lala.ui.screens.AddEditScreen.<anonymous>.<anonymous>.<anonymous> (AddEditScreen.kt:177)");
            }
            if (AddEditScreen$lambda$43($gpsLoading$delegate)) {
                $composer.startReplaceGroup(577666376);
                ComposerKt.sourceInformation($composer, "178@7251L78");
                ProgressIndicatorKt.m2417CircularProgressIndicatorLxG7B9w(SizeKt.m1040size3ABfNKs(Modifier.Companion, Dp.m6873constructorimpl(24)), 0L, Dp.m6873constructorimpl(2), 0L, 0, $composer, 390, 26);
                $composer.endReplaceGroup();
            } else {
                $composer.startReplaceGroup(577820973);
                ComposerKt.sourceInformation($composer, "180@7404L721,180@7383L841");
                ComposerKt.sourceInformationMarkerStart($composer, -1228285267, "CC(remember):AddEditScreen.kt#9igjgp");
                boolean changedInstance = $composer.changedInstance($scope) | $composer.changedInstance($vm);
                Object rememberedValue = $composer.rememberedValue();
                if (changedInstance || rememberedValue == Composer.Companion.getEmpty()) {
                    Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.AddEditScreenKt$$ExternalSyntheticLambda2
                        @Override // kotlin.jvm.functions.Function0
                        public final Object invoke() {
                            return AddEditScreenKt.AddEditScreen$lambda$84$lambda$83$lambda$73$lambda$72$lambda$71($hasLocPerm, $scope, $gpsLoading$delegate, $vm, $gpsLat$delegate, $gpsLon$delegate, $locationName$delegate);
                        }
                    };
                    $composer.updateRememberedValue(obj);
                    rememberedValue = obj;
                }
                ComposerKt.sourceInformationMarkerEnd($composer);
                IconButtonKt.IconButton((Function0) rememberedValue, null, false, null, null, ComposableSingletons$AddEditScreenKt.INSTANCE.getLambda$784441085$app_debug(), $composer, ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE, 30);
                $composer.endReplaceGroup();
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$84$lambda$83$lambda$73$lambda$72$lambda$71(boolean $hasLocPerm, CoroutineScope $scope, MutableState $gpsLoading$delegate, LalaViewModel $vm, MutableState $gpsLat$delegate, MutableState $gpsLon$delegate, MutableState $locationName$delegate) {
        if ($hasLocPerm) {
            AddEditScreen$lambda$44($gpsLoading$delegate, true);
            BuildersKt__Builders_commonKt.launch$default($scope, null, null, new AddEditScreenKt$AddEditScreen$4$1$6$1$1$1($vm, $gpsLat$delegate, $gpsLon$delegate, $locationName$delegate, $gpsLoading$delegate, null), 3, null);
            return Unit.INSTANCE;
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$84$lambda$83$lambda$68$lambda$67(KeyboardActionScope KeyboardActions) {
        Intrinsics.checkNotNullParameter(KeyboardActions, "$this$KeyboardActions");
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$84$lambda$83$lambda$75$lambda$74(MutableState $comment$delegate, String it) {
        Intrinsics.checkNotNullParameter(it, "it");
        $comment$delegate.setValue(it);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$84$lambda$83$lambda$77$lambda$76(MutableState $tags$delegate, String it) {
        Intrinsics.checkNotNullParameter(it, "it");
        $tags$delegate.setValue(it);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$84$lambda$83$lambda$82$lambda$79$lambda$78(NavHostController $navController, String $id) {
        NavController.navigate$default($navController, "camera_capture/" + $id, null, null, 6, null);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$84$lambda$83$lambda$82$lambda$81$lambda$80(NavHostController $navController, String $id) {
        NavController.navigate$default($navController, "camera_capture/" + $id, null, null, 6, null);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$86$lambda$85(MutableState $showCategoryPicker$delegate) {
        AddEditScreen$lambda$29($showCategoryPicker$delegate, false);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0151  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0217  */
    /* JADX WARN: Type inference failed for: r1v11 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final kotlin.Unit AddEditScreen$lambda$92(java.util.List r46, final androidx.compose.runtime.MutableState r47, final androidx.compose.runtime.MutableState r48, androidx.compose.runtime.Composer r49, int r50) {
        /*
            Method dump skipped, instructions count: 545
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.AddEditScreenKt.AddEditScreen$lambda$92(java.util.List, androidx.compose.runtime.MutableState, androidx.compose.runtime.MutableState, androidx.compose.runtime.Composer, int):kotlin.Unit");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$92$lambda$91$lambda$90$lambda$88$lambda$87(String $cat, MutableState $category$delegate, MutableState $showCategoryPicker$delegate) {
        $category$delegate.setValue($cat);
        AddEditScreen$lambda$29($showCategoryPicker$delegate, false);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$92$lambda$91$lambda$90$lambda$89(String $cat, RowScope TextButton, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(TextButton, "$this$TextButton");
        ComposerKt.sourceInformation($composer, "C276@11442L45:AddEditScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 17) != 16, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1801426209, $changed, -1, "com.hardlineforge.lala.ui.screens.AddEditScreen.<anonymous>.<anonymous>.<anonymous>.<anonymous> (AddEditScreen.kt:276)");
            }
            TextKt.m2743Text4IGK_g($cat, SizeKt.fillMaxWidth$default(Modifier.Companion, 0.0f, 1, null), 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 48, 0, 131068);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$94$lambda$93(MutableState $showEditNoteDialog$delegate) {
        AddEditScreen$lambda$38($showEditNoteDialog$delegate, false);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$105(final MutableState $editNote$delegate, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C292@11915L17,290@11822L246:AddEditScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-2106844129, $changed, -1, "com.hardlineforge.lala.ui.screens.AddEditScreen.<anonymous> (AddEditScreen.kt:290)");
            }
            String AddEditScreen$lambda$40 = AddEditScreen$lambda$40($editNote$delegate);
            Modifier fillMaxWidth$default = SizeKt.fillMaxWidth$default(Modifier.Companion, 0.0f, 1, null);
            ComposerKt.sourceInformationMarkerStart($composer, -1747607984, "CC(remember):AddEditScreen.kt#9igjgp");
            Object rememberedValue = $composer.rememberedValue();
            if (rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function1() { // from class: com.hardlineforge.lala.ui.screens.AddEditScreenKt$$ExternalSyntheticLambda32
                    @Override // kotlin.jvm.functions.Function1
                    public final Object invoke(Object obj2) {
                        return AddEditScreenKt.AddEditScreen$lambda$105$lambda$104$lambda$103(MutableState.this, (String) obj2);
                    }
                };
                $composer.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            OutlinedTextFieldKt.OutlinedTextField(AddEditScreen$lambda$40, (Function1<? super String, Unit>) rememberedValue, fillMaxWidth$default, false, false, (TextStyle) null, (Function2<? super Composer, ? super Integer, Unit>) ComposableSingletons$AddEditScreenKt.INSTANCE.getLambda$1316709189$app_debug(), (Function2<? super Composer, ? super Integer, Unit>) null, (Function2<? super Composer, ? super Integer, Unit>) null, (Function2<? super Composer, ? super Integer, Unit>) null, (Function2<? super Composer, ? super Integer, Unit>) null, (Function2<? super Composer, ? super Integer, Unit>) null, (Function2<? super Composer, ? super Integer, Unit>) null, false, (VisualTransformation) null, (KeyboardOptions) null, (KeyboardActions) null, false, 0, 0, (MutableInteractionSource) null, (Shape) null, (TextFieldColors) null, $composer, 1573296, 0, 0, 8388536);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$105$lambda$104$lambda$103(MutableState $editNote$delegate, String it) {
        Intrinsics.checkNotNullParameter(it, "it");
        $editNote$delegate.setValue(it);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$99(final LogEntry $entry, final LalaViewModel $vm, final NavHostController $navController, final MutableState $timestamp$delegate, final MutableState $timezone$delegate, final MutableState $gpsLat$delegate, final MutableState $gpsLon$delegate, final MutableState $category$delegate, final MutableState $locationName$delegate, final MutableState $comment$delegate, final MutableState $tags$delegate, final MutableState $editNote$delegate, final MutableState $showEditNoteDialog$delegate, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C298@12151L868,298@12130L907:AddEditScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1747255748, $changed, -1, "com.hardlineforge.lala.ui.screens.AddEditScreen.<anonymous> (AddEditScreen.kt:298)");
            }
            ComposerKt.sourceInformationMarkerStart($composer, -219436792, "CC(remember):AddEditScreen.kt#9igjgp");
            boolean changedInstance = $composer.changedInstance($entry) | $composer.changedInstance($vm) | $composer.changedInstance($navController);
            Object rememberedValue = $composer.rememberedValue();
            if (changedInstance || rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.AddEditScreenKt$$ExternalSyntheticLambda31
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return AddEditScreenKt.AddEditScreen$lambda$99$lambda$98$lambda$97(LogEntry.this, $vm, $navController, $timestamp$delegate, $timezone$delegate, $gpsLat$delegate, $gpsLon$delegate, $category$delegate, $locationName$delegate, $comment$delegate, $tags$delegate, $editNote$delegate, $showEditNoteDialog$delegate);
                    }
                };
                $composer.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            ButtonKt.TextButton((Function0) rememberedValue, null, false, null, null, null, null, null, null, ComposableSingletons$AddEditScreenKt.INSTANCE.m7299getLambda$1599561305$app_debug(), $composer, 805306368, TypedValues.PositionType.TYPE_POSITION_TYPE);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$99$lambda$98$lambda$97(LogEntry $entry, LalaViewModel $vm, NavHostController $navController, MutableState $timestamp$delegate, MutableState $timezone$delegate, MutableState $gpsLat$delegate, MutableState $gpsLon$delegate, MutableState $category$delegate, MutableState $locationName$delegate, MutableState $comment$delegate, MutableState $tags$delegate, MutableState $editNote$delegate, MutableState $showEditNoteDialog$delegate) {
        Instant instant = AddEditScreen$lambda$4($timestamp$delegate).atZone(ZoneId.of(AddEditScreen$lambda$7($timezone$delegate))).toInstant();
        Intrinsics.checkNotNull($entry);
        String id = $entry.getId();
        Intrinsics.checkNotNull(instant);
        String AddEditScreen$lambda$7 = AddEditScreen$lambda$7($timezone$delegate);
        Intrinsics.checkNotNullExpressionValue(AddEditScreen$lambda$7, "AddEditScreen$lambda$7(...)");
        Double AddEditScreen$lambda$10 = AddEditScreen$lambda$10($gpsLat$delegate);
        Double AddEditScreen$lambda$13 = AddEditScreen$lambda$13($gpsLon$delegate);
        String AddEditScreen$lambda$16 = AddEditScreen$lambda$16($category$delegate);
        String AddEditScreen$lambda$19 = AddEditScreen$lambda$19($locationName$delegate);
        String str = null;
        if (StringsKt.isBlank(AddEditScreen$lambda$19)) {
            AddEditScreen$lambda$19 = null;
        }
        String obj = StringsKt.trim((CharSequence) AddEditScreen$lambda$22($comment$delegate)).toString();
        String obj2 = StringsKt.trim((CharSequence) AddEditScreen$lambda$25($tags$delegate)).toString();
        Instant createdAt = $entry.getCreatedAt();
        Instant now = Instant.now();
        Intrinsics.checkNotNullExpressionValue(now, "now(...)");
        LogEntry newEntry = new LogEntry(id, instant, AddEditScreen$lambda$7, AddEditScreen$lambda$10, AddEditScreen$lambda$13, null, AddEditScreen$lambda$16, AddEditScreen$lambda$19, obj, obj2, createdAt, now, 32, null);
        String AddEditScreen$lambda$40 = AddEditScreen$lambda$40($editNote$delegate);
        if (!StringsKt.isBlank(AddEditScreen$lambda$40)) {
            str = AddEditScreen$lambda$40;
        }
        $vm.saveEntry(newEntry, false, str);
        AddEditScreen$lambda$38($showEditNoteDialog$delegate, false);
        $navController.popBackStack();
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$102(final MutableState $showEditNoteDialog$delegate, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C319@13120L30,319@13099L71:AddEditScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-653377662, $changed, -1, "com.hardlineforge.lala.ui.screens.AddEditScreen.<anonymous> (AddEditScreen.kt:319)");
            }
            ComposerKt.sourceInformationMarkerStart($composer, -830706688, "CC(remember):AddEditScreen.kt#9igjgp");
            Object rememberedValue = $composer.rememberedValue();
            if (rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.AddEditScreenKt$$ExternalSyntheticLambda0
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return AddEditScreenKt.AddEditScreen$lambda$102$lambda$101$lambda$100(MutableState.this);
                    }
                };
                $composer.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            ButtonKt.TextButton((Function0) rememberedValue, null, false, null, null, null, null, null, null, ComposableSingletons$AddEditScreenKt.INSTANCE.getLambda$294772581$app_debug(), $composer, 805306374, TypedValues.PositionType.TYPE_POSITION_TYPE);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit AddEditScreen$lambda$102$lambda$101$lambda$100(MutableState $showEditNoteDialog$delegate) {
        AddEditScreen$lambda$38($showEditNoteDialog$delegate, false);
        return Unit.INSTANCE;
    }

    private static final String format(double $this$format, int decimals) {
        StringCompanionObject stringCompanionObject = StringCompanionObject.INSTANCE;
        String format = String.format("%." + decimals + "f", Arrays.copyOf(new Object[]{Double.valueOf($this$format)}, 1));
        Intrinsics.checkNotNullExpressionValue(format, "format(...)");
        return format;
    }
}
