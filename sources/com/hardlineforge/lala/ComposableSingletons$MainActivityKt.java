package com.hardlineforge.lala;

import androidx.compose.foundation.layout.SizeKt;
import androidx.compose.material3.SurfaceKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Modifier;
import com.hardlineforge.lala.ui.screens.LalaAppKt;
import com.hardlineforge.lala.ui.theme.LalaThemeKt;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
/* compiled from: MainActivity.kt */
@Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes9.dex */
public final class ComposableSingletons$MainActivityKt {
    public static final ComposableSingletons$MainActivityKt INSTANCE = new ComposableSingletons$MainActivityKt();

    /* renamed from: lambda$-400548483  reason: not valid java name */
    private static Function2<Composer, Integer, Unit> f67lambda$400548483 = ComposableLambdaKt.composableLambdaInstance(-400548483, false, new Function2() { // from class: com.hardlineforge.lala.ComposableSingletons$MainActivityKt$$ExternalSyntheticLambda0
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$MainActivityKt.lambda__400548483$lambda$0((Composer) obj, ((Integer) obj2).intValue());
        }
    });

    /* renamed from: lambda$-1864062408  reason: not valid java name */
    private static Function2<Composer, Integer, Unit> f66lambda$1864062408 = ComposableLambdaKt.composableLambdaInstance(-1864062408, false, new Function2() { // from class: com.hardlineforge.lala.ComposableSingletons$MainActivityKt$$ExternalSyntheticLambda1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$MainActivityKt.lambda__1864062408$lambda$1((Composer) obj, ((Integer) obj2).intValue());
        }
    });

    /* renamed from: lambda$-63898299  reason: not valid java name */
    private static Function2<Composer, Integer, Unit> f68lambda$63898299 = ComposableLambdaKt.composableLambdaInstance(-63898299, false, new Function2() { // from class: com.hardlineforge.lala.ComposableSingletons$MainActivityKt$$ExternalSyntheticLambda2
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$MainActivityKt.lambda__63898299$lambda$2((Composer) obj, ((Integer) obj2).intValue());
        }
    });

    /* renamed from: getLambda$-1864062408$app_debug  reason: not valid java name */
    public final Function2<Composer, Integer, Unit> m7295getLambda$1864062408$app_debug() {
        return f66lambda$1864062408;
    }

    /* renamed from: getLambda$-400548483$app_debug  reason: not valid java name */
    public final Function2<Composer, Integer, Unit> m7296getLambda$400548483$app_debug() {
        return f67lambda$400548483;
    }

    /* renamed from: getLambda$-63898299$app_debug  reason: not valid java name */
    public final Function2<Composer, Integer, Unit> m7297getLambda$63898299$app_debug() {
        return f68lambda$63898299;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda__63898299$lambda$2(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C18@663L134:MainActivity.kt#38adbx");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-63898299, $changed, -1, "com.hardlineforge.lala.ComposableSingletons$MainActivityKt.lambda$-63898299.<anonymous> (MainActivity.kt:18)");
            }
            LalaThemeKt.LalaTheme(false, f66lambda$1864062408, $composer, 48, 1);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda__1864062408$lambda$1(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C19@691L92:MainActivity.kt#38adbx");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1864062408, $changed, -1, "com.hardlineforge.lala.ComposableSingletons$MainActivityKt.lambda$-1864062408.<anonymous> (MainActivity.kt:19)");
            }
            SurfaceKt.m2593SurfaceT9BRK9s(SizeKt.fillMaxSize$default(Modifier.Companion, 0.0f, 1, null), null, 0L, 0L, 0.0f, 0.0f, null, f67lambda$400548483, $composer, 12582918, 126);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda__400548483$lambda$0(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C20@756L9:MainActivity.kt#38adbx");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-400548483, $changed, -1, "com.hardlineforge.lala.ComposableSingletons$MainActivityKt.lambda$-400548483.<anonymous> (MainActivity.kt:20)");
            }
            LalaAppKt.LalaApp($composer, 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }
}
