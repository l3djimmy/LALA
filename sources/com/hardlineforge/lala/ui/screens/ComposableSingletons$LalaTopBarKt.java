package com.hardlineforge.lala.ui.screens;

import androidx.compose.material.icons.Icons;
import androidx.compose.material.icons.filled.MenuKt;
import androidx.compose.material.icons.filled.SearchKt;
import androidx.compose.material3.IconKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Modifier;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
/* compiled from: LalaTopBar.kt */
@Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class ComposableSingletons$LalaTopBarKt {
    public static final ComposableSingletons$LalaTopBarKt INSTANCE = new ComposableSingletons$LalaTopBarKt();
    private static Function2<Composer, Integer, Unit> lambda$29252008 = ComposableLambdaKt.composableLambdaInstance(29252008, false, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$LalaTopBarKt$$ExternalSyntheticLambda0
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$LalaTopBarKt.lambda_29252008$lambda$0((Composer) obj, ((Integer) obj2).intValue());
        }
    });

    /* renamed from: lambda$-590632996  reason: not valid java name */
    private static Function2<Composer, Integer, Unit> f85lambda$590632996 = ComposableLambdaKt.composableLambdaInstance(-590632996, false, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$LalaTopBarKt$$ExternalSyntheticLambda1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$LalaTopBarKt.lambda__590632996$lambda$1((Composer) obj, ((Integer) obj2).intValue());
        }
    });

    /* renamed from: getLambda$-590632996$app_debug  reason: not valid java name */
    public final Function2<Composer, Integer, Unit> m7315getLambda$590632996$app_debug() {
        return f85lambda$590632996;
    }

    public final Function2<Composer, Integer, Unit> getLambda$29252008$app_debug() {
        return lambda$29252008;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda_29252008$lambda$0(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C28@960L53:LalaTopBar.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(29252008, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$LalaTopBarKt.lambda$29252008.<anonymous> (LalaTopBar.kt:28)");
            }
            IconKt.m2200Iconww6aTOc(MenuKt.getMenu(Icons.INSTANCE.getDefault()), "Menu", (Modifier) null, 0L, $composer, 48, 12);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda__590632996$lambda$1(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C34@1143L57:LalaTopBar.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-590632996, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$LalaTopBarKt.lambda$-590632996.<anonymous> (LalaTopBar.kt:34)");
            }
            IconKt.m2200Iconww6aTOc(SearchKt.getSearch(Icons.INSTANCE.getDefault()), "Search", (Modifier) null, 0L, $composer, 48, 12);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }
}
