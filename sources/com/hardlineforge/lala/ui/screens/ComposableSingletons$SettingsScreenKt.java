package com.hardlineforge.lala.ui.screens;

import androidx.compose.foundation.layout.RowScope;
import androidx.compose.material3.MaterialTheme;
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
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: SettingsScreen.kt */
@Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class ComposableSingletons$SettingsScreenKt {
    public static final ComposableSingletons$SettingsScreenKt INSTANCE = new ComposableSingletons$SettingsScreenKt();

    /* renamed from: lambda$-1283927342  reason: not valid java name */
    private static Function3<RowScope, Composer, Integer, Unit> f90lambda$1283927342 = ComposableLambdaKt.composableLambdaInstance(-1283927342, false, new Function3() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$SettingsScreenKt$$ExternalSyntheticLambda0
        @Override // kotlin.jvm.functions.Function3
        public final Object invoke(Object obj, Object obj2, Object obj3) {
            return ComposableSingletons$SettingsScreenKt.lambda__1283927342$lambda$0((RowScope) obj, (Composer) obj2, ((Integer) obj3).intValue());
        }
    });
    private static Function3<RowScope, Composer, Integer, Unit> lambda$1039651323 = ComposableLambdaKt.composableLambdaInstance(1039651323, false, new Function3() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$SettingsScreenKt$$ExternalSyntheticLambda1
        @Override // kotlin.jvm.functions.Function3
        public final Object invoke(Object obj, Object obj2, Object obj3) {
            return ComposableSingletons$SettingsScreenKt.lambda_1039651323$lambda$1((RowScope) obj, (Composer) obj2, ((Integer) obj3).intValue());
        }
    });
    private static Function3<RowScope, Composer, Integer, Unit> lambda$1145931863 = ComposableLambdaKt.composableLambdaInstance(1145931863, false, new Function3() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$SettingsScreenKt$$ExternalSyntheticLambda2
        @Override // kotlin.jvm.functions.Function3
        public final Object invoke(Object obj, Object obj2, Object obj3) {
            return ComposableSingletons$SettingsScreenKt.lambda_1145931863$lambda$2((RowScope) obj, (Composer) obj2, ((Integer) obj3).intValue());
        }
    });

    /* renamed from: getLambda$-1283927342$app_debug  reason: not valid java name */
    public final Function3<RowScope, Composer, Integer, Unit> m7320getLambda$1283927342$app_debug() {
        return f90lambda$1283927342;
    }

    public final Function3<RowScope, Composer, Integer, Unit> getLambda$1039651323$app_debug() {
        return lambda$1039651323;
    }

    public final Function3<RowScope, Composer, Integer, Unit> getLambda$1145931863$app_debug() {
        return lambda$1145931863;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda__1283927342$lambda$0(RowScope OutlinedButton, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(OutlinedButton, "$this$OutlinedButton");
        ComposerKt.sourceInformation($composer, "C54@2449L19:SettingsScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 17) != 16, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1283927342, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$SettingsScreenKt.lambda$-1283927342.<anonymous> (SettingsScreen.kt:54)");
            }
            TextKt.m2743Text4IGK_g("Import Data", (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 6, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda_1039651323$lambda$1(RowScope OutlinedButton, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(OutlinedButton, "$this$OutlinedButton");
        ComposerKt.sourceInformation($composer, "C57@2621L23:SettingsScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 17) != 16, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1039651323, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$SettingsScreenKt.lambda$1039651323.<anonymous> (SettingsScreen.kt:57)");
            }
            TextKt.m2743Text4IGK_g("Export All Data", (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 6, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda_1145931863$lambda$2(RowScope TextButton, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(TextButton, "$this$TextButton");
        ComposerKt.sourceInformation($composer, "C68@3157L11,68@3120L55:SettingsScreen.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 17) != 16, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1145931863, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$SettingsScreenKt.lambda$1145931863.<anonymous> (SettingsScreen.kt:68)");
            }
            TextKt.m2743Text4IGK_g("Remove", (Modifier) null, MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1942getError0d7_KjU(), 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 6, 0, 131066);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }
}
