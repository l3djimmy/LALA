package com.hardlineforge.lala.ui.screens;

import androidx.compose.animation.AnimatedContentScope;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.navigation.NavBackStackEntry;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: LalaApp.kt */
@Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class ComposableSingletons$LalaAppKt {
    public static final ComposableSingletons$LalaAppKt INSTANCE = new ComposableSingletons$LalaAppKt();

    /* renamed from: lambda$-661289448  reason: not valid java name */
    private static Function4<AnimatedContentScope, NavBackStackEntry, Composer, Integer, Unit> f84lambda$661289448 = ComposableLambdaKt.composableLambdaInstance(-661289448, false, new Function4() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$LalaAppKt$$ExternalSyntheticLambda0
        @Override // kotlin.jvm.functions.Function4
        public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
            return ComposableSingletons$LalaAppKt.lambda__661289448$lambda$0((AnimatedContentScope) obj, (NavBackStackEntry) obj2, (Composer) obj3, ((Integer) obj4).intValue());
        }
    });

    /* renamed from: lambda$-1442630731  reason: not valid java name */
    private static Function4<AnimatedContentScope, NavBackStackEntry, Composer, Integer, Unit> f83lambda$1442630731 = ComposableLambdaKt.composableLambdaInstance(-1442630731, false, new Function4() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$LalaAppKt$$ExternalSyntheticLambda1
        @Override // kotlin.jvm.functions.Function4
        public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
            return ComposableSingletons$LalaAppKt.lambda__1442630731$lambda$1((AnimatedContentScope) obj, (NavBackStackEntry) obj2, (Composer) obj3, ((Integer) obj4).intValue());
        }
    });

    /* renamed from: getLambda$-1442630731$app_debug  reason: not valid java name */
    public final Function4<AnimatedContentScope, NavBackStackEntry, Composer, Integer, Unit> m7313getLambda$1442630731$app_debug() {
        return f83lambda$1442630731;
    }

    /* renamed from: getLambda$-661289448$app_debug  reason: not valid java name */
    public final Function4<AnimatedContentScope, NavBackStackEntry, Composer, Integer, Unit> m7314getLambda$661289448$app_debug() {
        return f84lambda$661289448;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda__661289448$lambda$0(AnimatedContentScope composable, NavBackStackEntry it, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(composable, "$this$composable");
        Intrinsics.checkNotNullParameter(it, "it");
        ComposerKt.sourceInformation($composer, "C57@2222L15:LalaApp.kt#4cebsy");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(-661289448, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$LalaAppKt.lambda$-661289448.<anonymous> (LalaApp.kt:57)");
        }
        MapViewScreenKt.MapViewScreen(null, $composer, 0, 1);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda__1442630731$lambda$1(AnimatedContentScope composable, NavBackStackEntry it, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(composable, "$this$composable");
        Intrinsics.checkNotNullParameter(it, "it");
        ComposerKt.sourceInformation($composer, "C60@2434L16:LalaApp.kt#4cebsy");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(-1442630731, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$LalaAppKt.lambda$-1442630731.<anonymous> (LalaApp.kt:60)");
        }
        SettingsScreenKt.SettingsScreen(null, $composer, 0, 1);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        return Unit.INSTANCE;
    }
}
