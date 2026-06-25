package com.hardlineforge.lala.ui.screens;

import android.content.Context;
import android.widget.Toast;
import androidx.compose.foundation.layout.RowScope;
import androidx.compose.material3.AppBarKt;
import androidx.compose.material3.IconButtonKt;
import androidx.compose.material3.TextKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.State;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.style.TextAlign;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.navigation.NavHostController;
import androidx.profileinstaller.ProfileVerifier;
import androidx.recyclerview.widget.ItemTouchHelper;
import com.hardlineforge.lala.data.LogEntry;
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel;
import com.rajat.pdfviewer.PdfRendererView;
import java.io.File;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.io.FilesKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: PdfPreviewScreen.kt */
@Metadata(d1 = {"\u00000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\u001a\u001f\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005H\u0007¢\u0006\u0002\u0010\u0006¨\u0006\u0007²\u0006\f\u0010\b\u001a\u0004\u0018\u00010\tX\u008a\u008e\u0002²\u0006\n\u0010\n\u001a\u00020\u000bX\u008a\u008e\u0002²\u0006\f\u0010\f\u001a\u0004\u0018\u00010\rX\u008a\u008e\u0002²\u0006\u0010\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00100\u000fX\u008a\u0084\u0002"}, d2 = {"PdfPreviewScreen", "", "navController", "Landroidx/navigation/NavHostController;", "viewModel", "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;", "(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V", "app_debug", "pdfFile", "Ljava/io/File;", "isSaving", "", "saveError", "", "allEntries", "", "Lcom/hardlineforge/lala/data/LogEntry;"}, k = 2, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class PdfPreviewScreenKt {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit PdfPreviewScreen$lambda$24(NavHostController navHostController, LalaViewModel lalaViewModel, int i, int i2, Composer composer, int i3) {
        PdfPreviewScreen(navHostController, lalaViewModel, composer, RecomposeScopeImplKt.updateChangedFlags(i | 1), i2);
        return Unit.INSTANCE;
    }

    /* JADX WARN: Removed duplicated region for block: B:48:0x00fb  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x014e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void PdfPreviewScreen(final androidx.navigation.NavHostController r21, com.hardlineforge.lala.ui.viewmodel.LalaViewModel r22, androidx.compose.runtime.Composer r23, final int r24, final int r25) {
        /*
            Method dump skipped, instructions count: 360
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.PdfPreviewScreenKt.PdfPreviewScreen(androidx.navigation.NavHostController, com.hardlineforge.lala.ui.viewmodel.LalaViewModel, androidx.compose.runtime.Composer, int, int):void");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit PdfPreviewScreen$lambda$3(final NavHostController $navController, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C30@1074L192,28@978L302:PdfPreviewScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1870973873, $changed, -1, "com.hardlineforge.lala.ui.screens.PdfPreviewScreen.<anonymous> (PdfPreviewScreen.kt:27)");
            }
            AppBarKt.m1823TopAppBarGHTll3U(ComposableSingletons$PdfPreviewScreenKt.INSTANCE.m7319getLambda$745178507$app_debug(), null, ComposableLambdaKt.rememberComposableLambda(-1561225737, true, new Function2() { // from class: com.hardlineforge.lala.ui.screens.PdfPreviewScreenKt$$ExternalSyntheticLambda0
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    return PdfPreviewScreenKt.PdfPreviewScreen$lambda$3$lambda$2(NavHostController.this, (Composer) obj, ((Integer) obj2).intValue());
                }
            }, $composer, 54), null, 0.0f, null, null, null, $composer, 390, ItemTouchHelper.Callback.DEFAULT_SWIPE_ANIMATION_DURATION);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit PdfPreviewScreen$lambda$3$lambda$2(final NavHostController $navController, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C31@1117L32,31@1096L152:PdfPreviewScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1561225737, $changed, -1, "com.hardlineforge.lala.ui.screens.PdfPreviewScreen.<anonymous>.<anonymous> (PdfPreviewScreen.kt:31)");
            }
            ComposerKt.sourceInformationMarkerStart($composer, -1394345545, "CC(remember):PdfPreviewScreen.kt#9igjgp");
            boolean changedInstance = $composer.changedInstance($navController);
            Object rememberedValue = $composer.rememberedValue();
            if (changedInstance || rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.PdfPreviewScreenKt$$ExternalSyntheticLambda4
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return PdfPreviewScreenKt.PdfPreviewScreen$lambda$3$lambda$2$lambda$1$lambda$0(NavHostController.this);
                    }
                };
                $composer.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            IconButtonKt.IconButton((Function0) rememberedValue, null, false, null, null, ComposableSingletons$PdfPreviewScreenKt.INSTANCE.m7318getLambda$396234028$app_debug(), $composer, ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE, 30);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit PdfPreviewScreen$lambda$3$lambda$2$lambda$1$lambda$0(NavHostController $navController) {
        $navController.popBackStack();
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Removed duplicated region for block: B:54:0x026d  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x03bf  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0533  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final kotlin.Unit PdfPreviewScreen$lambda$23(com.hardlineforge.lala.ui.viewmodel.LalaViewModel r68, androidx.compose.foundation.layout.PaddingValues r69, androidx.compose.runtime.Composer r70, int r71) {
        /*
            Method dump skipped, instructions count: 1343
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.PdfPreviewScreenKt.PdfPreviewScreen$lambda$23(com.hardlineforge.lala.ui.viewmodel.LalaViewModel, androidx.compose.foundation.layout.PaddingValues, androidx.compose.runtime.Composer, int):kotlin.Unit");
    }

    private static final File PdfPreviewScreen$lambda$23$lambda$5(MutableState<File> mutableState) {
        return mutableState.getValue();
    }

    private static final boolean PdfPreviewScreen$lambda$23$lambda$8(MutableState<Boolean> mutableState) {
        return mutableState.getValue().booleanValue();
    }

    private static final void PdfPreviewScreen$lambda$23$lambda$9(MutableState<Boolean> mutableState, boolean z) {
        mutableState.setValue(Boolean.valueOf(z));
    }

    private static final String PdfPreviewScreen$lambda$23$lambda$11(MutableState<String> mutableState) {
        return mutableState.getValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final List<LogEntry> PdfPreviewScreen$lambda$23$lambda$13(State<? extends List<LogEntry>> state) {
        return (List) state.getValue();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final PdfRendererView PdfPreviewScreen$lambda$23$lambda$22$lambda$18$lambda$17(MutableState $pdfFile$delegate, Context ctx) {
        Intrinsics.checkNotNullParameter(ctx, "ctx");
        PdfRendererView pdfRendererView = new PdfRendererView(ctx, null, 0, 6, null);
        File PdfPreviewScreen$lambda$23$lambda$5 = PdfPreviewScreen$lambda$23$lambda$5($pdfFile$delegate);
        Intrinsics.checkNotNull(PdfPreviewScreen$lambda$23$lambda$5);
        PdfRendererView.initWithFile$default(pdfRendererView, PdfPreviewScreen$lambda$23$lambda$5, null, 2, null);
        return pdfRendererView;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit PdfPreviewScreen$lambda$23$lambda$22$lambda$20$lambda$19(Context $context, MutableState $isSaving$delegate, MutableState $saveError$delegate, MutableState $pdfFile$delegate) {
        PdfPreviewScreen$lambda$23$lambda$9($isSaving$delegate, true);
        $saveError$delegate.setValue(null);
        try {
            try {
                File destFile = new File($context.getExternalFilesDir(null), "LALA_Report_" + System.currentTimeMillis() + ".pdf");
                File PdfPreviewScreen$lambda$23$lambda$5 = PdfPreviewScreen$lambda$23$lambda$5($pdfFile$delegate);
                Intrinsics.checkNotNull(PdfPreviewScreen$lambda$23$lambda$5);
                FilesKt.copyTo$default(PdfPreviewScreen$lambda$23$lambda$5, destFile, true, 0, 4, null);
                Toast.makeText($context, "PDF saved to " + destFile.getAbsolutePath(), 1).show();
            } catch (Exception e) {
                String localizedMessage = e.getLocalizedMessage();
                if (localizedMessage == null) {
                    localizedMessage = "Failed to save PDF";
                }
                $saveError$delegate.setValue(localizedMessage);
            }
            PdfPreviewScreen$lambda$23$lambda$9($isSaving$delegate, false);
            return Unit.INSTANCE;
        } catch (Throwable th) {
            PdfPreviewScreen$lambda$23$lambda$9($isSaving$delegate, false);
            throw th;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit PdfPreviewScreen$lambda$23$lambda$22$lambda$21(MutableState $isSaving$delegate, RowScope Button, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(Button, "$this$Button");
        ComposerKt.sourceInformation($composer, "C84@3408L47:PdfPreviewScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 17) != 16, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1086354672, $changed, -1, "com.hardlineforge.lala.ui.screens.PdfPreviewScreen.<anonymous>.<anonymous>.<anonymous> (PdfPreviewScreen.kt:84)");
            }
            TextKt.m2743Text4IGK_g(PdfPreviewScreen$lambda$23$lambda$8($isSaving$delegate) ? "Saving..." : "Save PDF", (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 0, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }
}
