package com.hardlineforge.lala.ui.screens;

import androidx.compose.foundation.layout.PaddingKt;
import androidx.compose.material3.MaterialTheme;
import androidx.compose.material3.TextKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.style.TextAlign;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.compose.ui.unit.Dp;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
/* compiled from: MapViewScreen.kt */
@Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class ComposableSingletons$MapViewScreenKt {
    public static final ComposableSingletons$MapViewScreenKt INSTANCE = new ComposableSingletons$MapViewScreenKt();

    /* renamed from: lambda$-949274766  reason: not valid java name */
    private static Function2<Composer, Integer, Unit> f86lambda$949274766 = ComposableLambdaKt.composableLambdaInstance(-949274766, false, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$MapViewScreenKt$$ExternalSyntheticLambda0
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$MapViewScreenKt.lambda__949274766$lambda$0((Composer) obj, ((Integer) obj2).intValue());
        }
    });

    /* renamed from: getLambda$-949274766$app_debug  reason: not valid java name */
    public final Function2<Composer, Integer, Unit> m7316getLambda$949274766$app_debug() {
        return f86lambda$949274766;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda__949274766$lambda$0(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C21@827L10,21@788L101:MapViewScreen.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-949274766, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$MapViewScreenKt.lambda$-949274766.<anonymous> (MapViewScreen.kt:21)");
            }
            TextKt.m2743Text4IGK_g("Map View", PaddingKt.m993padding3ABfNKs(Modifier.Companion, Dp.m6873constructorimpl(16)), 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, MaterialTheme.INSTANCE.getTypography($composer, MaterialTheme.$stable).getHeadlineMedium(), $composer, 54, 0, 65532);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }
}
