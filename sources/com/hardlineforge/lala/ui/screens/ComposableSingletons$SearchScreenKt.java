package com.hardlineforge.lala.ui.screens;

import androidx.compose.material.icons.Icons;
import androidx.compose.material.icons.automirrored.filled.ArrowBackKt;
import androidx.compose.material.icons.filled.ClearKt;
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
/* compiled from: SearchScreen.kt */
@Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class ComposableSingletons$SearchScreenKt {
    public static final ComposableSingletons$SearchScreenKt INSTANCE = new ComposableSingletons$SearchScreenKt();
    private static Function2<Composer, Integer, Unit> lambda$2026943214 = ComposableLambdaKt.composableLambdaInstance(2026943214, false, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$SearchScreenKt$$ExternalSyntheticLambda0
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$SearchScreenKt.lambda_2026943214$lambda$0((Composer) obj, ((Integer) obj2).intValue());
        }
    });
    private static Function2<Composer, Integer, Unit> lambda$1953766196 = ComposableLambdaKt.composableLambdaInstance(1953766196, false, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$SearchScreenKt$$ExternalSyntheticLambda1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$SearchScreenKt.lambda_1953766196$lambda$1((Composer) obj, ((Integer) obj2).intValue());
        }
    });
    private static Function2<Composer, Integer, Unit> lambda$909937556 = ComposableLambdaKt.composableLambdaInstance(909937556, false, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$SearchScreenKt$$ExternalSyntheticLambda2
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$SearchScreenKt.lambda_909937556$lambda$2((Composer) obj, ((Integer) obj2).intValue());
        }
    });

    public final Function2<Composer, Integer, Unit> getLambda$1953766196$app_debug() {
        return lambda$1953766196;
    }

    public final Function2<Composer, Integer, Unit> getLambda$2026943214$app_debug() {
        return lambda$2026943214;
    }

    public final Function2<Composer, Integer, Unit> getLambda$909937556$app_debug() {
        return lambda$909937556;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda_2026943214$lambda$0(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C33@1303L25:SearchScreen.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(2026943214, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$SearchScreenKt.lambda$2026943214.<anonymous> (SearchScreen.kt:33)");
            }
            TextKt.m2743Text4IGK_g("Search entries...", (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 6, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda_1953766196$lambda$1(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C40@1698L34:SearchScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1953766196, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$SearchScreenKt.lambda$1953766196.<anonymous> (SearchScreen.kt:40)");
            }
            IconKt.m2200Iconww6aTOc(ClearKt.getClear(Icons.INSTANCE.getDefault()), "Clear", (Modifier) null, 0L, $composer, 48, 12);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda_909937556$lambda$2(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C48@2000L49:SearchScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(909937556, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$SearchScreenKt.lambda$909937556.<anonymous> (SearchScreen.kt:48)");
            }
            IconKt.m2200Iconww6aTOc(ArrowBackKt.getArrowBack(Icons.AutoMirrored.Filled.INSTANCE), "Back", (Modifier) null, 0L, $composer, 48, 12);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }
}
