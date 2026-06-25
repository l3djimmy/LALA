package com.hardlineforge.lala.ui.screens;

import androidx.compose.material.icons.Icons;
import androidx.compose.material.icons.filled.AddKt;
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
/* compiled from: TimelineScreen.kt */
@Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class ComposableSingletons$TimelineScreenKt {
    public static final ComposableSingletons$TimelineScreenKt INSTANCE = new ComposableSingletons$TimelineScreenKt();
    private static Function2<Composer, Integer, Unit> lambda$1905197210 = ComposableLambdaKt.composableLambdaInstance(1905197210, false, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$TimelineScreenKt$$ExternalSyntheticLambda0
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$TimelineScreenKt.lambda_1905197210$lambda$0((Composer) obj, ((Integer) obj2).intValue());
        }
    });

    /* renamed from: lambda$-279078727  reason: not valid java name */
    private static Function2<Composer, Integer, Unit> f91lambda$279078727 = ComposableLambdaKt.composableLambdaInstance(-279078727, false, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$TimelineScreenKt$$ExternalSyntheticLambda1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$TimelineScreenKt.lambda__279078727$lambda$1((Composer) obj, ((Integer) obj2).intValue());
        }
    });

    /* renamed from: getLambda$-279078727$app_debug  reason: not valid java name */
    public final Function2<Composer, Integer, Unit> m7321getLambda$279078727$app_debug() {
        return f91lambda$279078727;
    }

    public final Function2<Composer, Integer, Unit> getLambda$1905197210$app_debug() {
        return lambda$1905197210;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda__279078727$lambda$1(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C40@1704L29:TimelineScreen.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-279078727, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$TimelineScreenKt.lambda$-279078727.<anonymous> (TimelineScreen.kt:40)");
            }
            IconKt.m2200Iconww6aTOc(AddKt.getAdd(Icons.INSTANCE.getDefault()), (String) null, (Modifier) null, 0L, $composer, 48, 12);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda_1905197210$lambda$0(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C41@1762L11:TimelineScreen.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1905197210, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$TimelineScreenKt.lambda$1905197210.<anonymous> (TimelineScreen.kt:41)");
            }
            TextKt.m2743Text4IGK_g("Log", (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 6, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }
}
