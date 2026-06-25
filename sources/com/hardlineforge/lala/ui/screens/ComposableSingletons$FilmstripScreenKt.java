package com.hardlineforge.lala.ui.screens;

import androidx.compose.foundation.layout.RowScope;
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
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: FilmstripScreen.kt */
@Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class ComposableSingletons$FilmstripScreenKt {
    public static final ComposableSingletons$FilmstripScreenKt INSTANCE = new ComposableSingletons$FilmstripScreenKt();

    /* renamed from: lambda$-1359235110  reason: not valid java name */
    private static Function2<Composer, Integer, Unit> f81lambda$1359235110 = ComposableLambdaKt.composableLambdaInstance(-1359235110, false, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$FilmstripScreenKt$$ExternalSyntheticLambda0
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$FilmstripScreenKt.lambda__1359235110$lambda$0((Composer) obj, ((Integer) obj2).intValue());
        }
    });
    private static Function2<Composer, Integer, Unit> lambda$559325915 = ComposableLambdaKt.composableLambdaInstance(559325915, false, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$FilmstripScreenKt$$ExternalSyntheticLambda1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$FilmstripScreenKt.lambda_559325915$lambda$1((Composer) obj, ((Integer) obj2).intValue());
        }
    });

    /* renamed from: lambda$-68159294  reason: not valid java name */
    private static Function3<RowScope, Composer, Integer, Unit> f82lambda$68159294 = ComposableLambdaKt.composableLambdaInstance(-68159294, false, new Function3() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$FilmstripScreenKt$$ExternalSyntheticLambda2
        @Override // kotlin.jvm.functions.Function3
        public final Object invoke(Object obj, Object obj2, Object obj3) {
            return ComposableSingletons$FilmstripScreenKt.lambda__68159294$lambda$2((RowScope) obj, (Composer) obj2, ((Integer) obj3).intValue());
        }
    });

    /* renamed from: getLambda$-1359235110$app_debug  reason: not valid java name */
    public final Function2<Composer, Integer, Unit> m7311getLambda$1359235110$app_debug() {
        return f81lambda$1359235110;
    }

    /* renamed from: getLambda$-68159294$app_debug  reason: not valid java name */
    public final Function3<RowScope, Composer, Integer, Unit> m7312getLambda$68159294$app_debug() {
        return f82lambda$68159294;
    }

    public final Function2<Composer, Integer, Unit> getLambda$559325915$app_debug() {
        return lambda$559325915;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda__1359235110$lambda$0(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C75@2770L17:FilmstripScreen.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1359235110, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$FilmstripScreenKt.lambda$-1359235110.<anonymous> (FilmstripScreen.kt:75)");
            }
            TextKt.m2743Text4IGK_g("Filmstrip", (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 6, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda_559325915$lambda$1(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C78@2927L49:FilmstripScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(559325915, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$FilmstripScreenKt.lambda$559325915.<anonymous> (FilmstripScreen.kt:78)");
            }
            IconKt.m2200Iconww6aTOc(ArrowBackKt.getArrowBack(Icons.AutoMirrored.Filled.INSTANCE), "Back", (Modifier) null, 0L, $composer, 48, 12);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda__68159294$lambda$2(RowScope TextButton, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(TextButton, "$this$TextButton");
        ComposerKt.sourceInformation($composer, "C138@5274L13:FilmstripScreen.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 17) != 16, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-68159294, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$FilmstripScreenKt.lambda$-68159294.<anonymous> (FilmstripScreen.kt:138)");
            }
            TextKt.m2743Text4IGK_g("Close", (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 6, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }
}
