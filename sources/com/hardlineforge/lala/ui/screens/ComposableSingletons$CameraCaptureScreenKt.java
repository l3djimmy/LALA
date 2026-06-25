package com.hardlineforge.lala.ui.screens;

import androidx.compose.material.icons.Icons;
import androidx.compose.material.icons.filled.CameraswitchKt;
import androidx.compose.material.icons.filled.CloseKt;
import androidx.compose.material3.IconKt;
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
import kotlin.jvm.functions.Function2;
/* compiled from: CameraCaptureScreen.kt */
@Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class ComposableSingletons$CameraCaptureScreenKt {
    public static final ComposableSingletons$CameraCaptureScreenKt INSTANCE = new ComposableSingletons$CameraCaptureScreenKt();
    private static Function2<Composer, Integer, Unit> lambda$1705445730 = ComposableLambdaKt.composableLambdaInstance(1705445730, false, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$CameraCaptureScreenKt$$ExternalSyntheticLambda0
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$CameraCaptureScreenKt.lambda_1705445730$lambda$0((Composer) obj, ((Integer) obj2).intValue());
        }
    });
    private static Function2<Composer, Integer, Unit> lambda$1128594856 = ComposableLambdaKt.composableLambdaInstance(1128594856, false, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$CameraCaptureScreenKt$$ExternalSyntheticLambda1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$CameraCaptureScreenKt.lambda_1128594856$lambda$1((Composer) obj, ((Integer) obj2).intValue());
        }
    });
    private static Function2<Composer, Integer, Unit> lambda$678558481 = ComposableLambdaKt.composableLambdaInstance(678558481, false, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$CameraCaptureScreenKt$$ExternalSyntheticLambda2
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$CameraCaptureScreenKt.lambda_678558481$lambda$2((Composer) obj, ((Integer) obj2).intValue());
        }
    });

    /* renamed from: lambda$-1243135541  reason: not valid java name */
    private static Function2<Composer, Integer, Unit> f73lambda$1243135541 = ComposableLambdaKt.composableLambdaInstance(-1243135541, false, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$CameraCaptureScreenKt$$ExternalSyntheticLambda3
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$CameraCaptureScreenKt.lambda__1243135541$lambda$3((Composer) obj, ((Integer) obj2).intValue());
        }
    });

    /* renamed from: getLambda$-1243135541$app_debug  reason: not valid java name */
    public final Function2<Composer, Integer, Unit> m7303getLambda$1243135541$app_debug() {
        return f73lambda$1243135541;
    }

    public final Function2<Composer, Integer, Unit> getLambda$1128594856$app_debug() {
        return lambda$1128594856;
    }

    public final Function2<Composer, Integer, Unit> getLambda$1705445730$app_debug() {
        return lambda$1705445730;
    }

    public final Function2<Composer, Integer, Unit> getLambda$678558481$app_debug() {
        return lambda$678558481;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda_1705445730$lambda$0(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C146@5914L11,146@5858L78:CameraCaptureScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1705445730, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$CameraCaptureScreenKt.lambda$1705445730.<anonymous> (CameraCaptureScreen.kt:146)");
            }
            IconKt.m2200Iconww6aTOc(CloseKt.getClose(Icons.INSTANCE.getDefault()), "Close", (Modifier) null, MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1954getOnSurface0d7_KjU(), $composer, 48, 4);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda_1128594856$lambda$1(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C153@6240L13:CameraCaptureScreen.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1128594856, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$CameraCaptureScreenKt.lambda$1128594856.<anonymous> (CameraCaptureScreen.kt:153)");
            }
            TextKt.m2743Text4IGK_g("Photo", (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 6, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda_678558481$lambda$2(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C158@6488L13:CameraCaptureScreen.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(678558481, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$CameraCaptureScreenKt.lambda$678558481.<anonymous> (CameraCaptureScreen.kt:158)");
            }
            TextKt.m2743Text4IGK_g("Video", (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 6, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda__1243135541$lambda$3(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C206@8334L11,203@8199L178:CameraCaptureScreen.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1243135541, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$CameraCaptureScreenKt.lambda$-1243135541.<anonymous> (CameraCaptureScreen.kt:203)");
            }
            IconKt.m2200Iconww6aTOc(CameraswitchKt.getCameraswitch(Icons.INSTANCE.getDefault()), "Flip", (Modifier) null, MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1954getOnSurface0d7_KjU(), $composer, 48, 4);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }
}
