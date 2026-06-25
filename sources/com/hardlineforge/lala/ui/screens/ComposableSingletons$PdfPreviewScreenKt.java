package com.hardlineforge.lala.ui.screens;

import androidx.compose.material.icons.Icons;
import androidx.compose.material.icons.automirrored.filled.ArrowBackKt;
import androidx.compose.material3.IconKt;
import androidx.compose.material3.TextKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.style.TextAlign;
import androidx.compose.ui.text.style.TextDecoration;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
/* compiled from: PdfPreviewScreen.kt */
@Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class ComposableSingletons$PdfPreviewScreenKt {
    public static final ComposableSingletons$PdfPreviewScreenKt INSTANCE = new ComposableSingletons$PdfPreviewScreenKt();

    /* renamed from: lambda$-745178507  reason: not valid java name */
    private static Function2<Composer, Integer, Unit> f89lambda$745178507 = ComposableLambdaKt.composableLambdaInstance(-745178507, false, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$PdfPreviewScreenKt$$ExternalSyntheticLambda0
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$PdfPreviewScreenKt.lambda__745178507$lambda$0((Composer) obj, ((Integer) obj2).intValue());
        }
    });

    /* renamed from: lambda$-396234028  reason: not valid java name */
    private static Function2<Composer, Integer, Unit> f88lambda$396234028 = ComposableLambdaKt.composableLambdaInstance(-396234028, false, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$PdfPreviewScreenKt$$ExternalSyntheticLambda1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$PdfPreviewScreenKt.lambda__396234028$lambda$1((Composer) obj, ((Integer) obj2).intValue());
        }
    });

    /* renamed from: getLambda$-396234028$app_debug  reason: not valid java name */
    public final Function2<Composer, Integer, Unit> m7318getLambda$396234028$app_debug() {
        return f88lambda$396234028;
    }

    /* renamed from: getLambda$-745178507$app_debug  reason: not valid java name */
    public final Function2<Composer, Integer, Unit> m7319getLambda$745178507$app_debug() {
        return f89lambda$745178507;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda__745178507$lambda$0(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C29@1015L22:PdfPreviewScreen.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-745178507, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$PdfPreviewScreenKt.lambda$-745178507.<anonymous> (PdfPreviewScreen.kt:29)");
            }
            TextKt.m2743Text4IGK_g("Report Preview", (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 6, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda__396234028$lambda$1(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C32@1177L49:PdfPreviewScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-396234028, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$PdfPreviewScreenKt.lambda$-396234028.<anonymous> (PdfPreviewScreen.kt:32)");
            }
            IconKt.m2200Iconww6aTOc(ArrowBackKt.getArrowBack(Icons.AutoMirrored.Filled.INSTANCE), "Back", (Modifier) null, 0L, $composer, 48, 12);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }
}
