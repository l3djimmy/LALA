package com.hardlineforge.lala.ui.screens;

import androidx.compose.foundation.layout.SizeKt;
import androidx.compose.foundation.layout.SpacerKt;
import androidx.compose.material.icons.Icons;
import androidx.compose.material.icons.outlined.ImageKt;
import androidx.compose.material.icons.outlined.VideocamKt;
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
import androidx.compose.ui.unit.Dp;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
/* compiled from: MediaGalleryScreen.kt */
@Metadata(k = 3, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class ComposableSingletons$MediaGalleryScreenKt {
    public static final ComposableSingletons$MediaGalleryScreenKt INSTANCE = new ComposableSingletons$MediaGalleryScreenKt();
    private static Function2<Composer, Integer, Unit> lambda$736888058 = ComposableLambdaKt.composableLambdaInstance(736888058, false, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$MediaGalleryScreenKt$$ExternalSyntheticLambda0
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$MediaGalleryScreenKt.lambda_736888058$lambda$0((Composer) obj, ((Integer) obj2).intValue());
        }
    });
    private static Function2<Composer, Integer, Unit> lambda$716102115 = ComposableLambdaKt.composableLambdaInstance(716102115, false, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$MediaGalleryScreenKt$$ExternalSyntheticLambda1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$MediaGalleryScreenKt.lambda_716102115$lambda$1((Composer) obj, ((Integer) obj2).intValue());
        }
    });

    /* renamed from: lambda$-333269886  reason: not valid java name */
    private static Function2<Composer, Integer, Unit> f87lambda$333269886 = ComposableLambdaKt.composableLambdaInstance(-333269886, false, new Function2() { // from class: com.hardlineforge.lala.ui.screens.ComposableSingletons$MediaGalleryScreenKt$$ExternalSyntheticLambda2
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ComposableSingletons$MediaGalleryScreenKt.lambda__333269886$lambda$2((Composer) obj, ((Integer) obj2).intValue());
        }
    });

    /* renamed from: getLambda$-333269886$app_debug  reason: not valid java name */
    public final Function2<Composer, Integer, Unit> m7317getLambda$333269886$app_debug() {
        return f87lambda$333269886;
    }

    public final Function2<Composer, Integer, Unit> getLambda$716102115$app_debug() {
        return lambda$716102115;
    }

    public final Function2<Composer, Integer, Unit> getLambda$736888058$app_debug() {
        return lambda$736888058;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda_736888058$lambda$0(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C47@1817L11:MediaGalleryScreen.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(736888058, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$MediaGalleryScreenKt.lambda$736888058.<anonymous> (MediaGalleryScreen.kt:47)");
            }
            TextKt.m2743Text4IGK_g("All", (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 6, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda_716102115$lambda$1(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C52@2022L32,52@2056L39,52@2097L14:MediaGalleryScreen.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(716102115, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$MediaGalleryScreenKt.lambda$716102115.<anonymous> (MediaGalleryScreen.kt:52)");
            }
            IconKt.m2200Iconww6aTOc(ImageKt.getImage(Icons.Outlined.INSTANCE), (String) null, (Modifier) null, 0L, $composer, 48, 12);
            SpacerKt.Spacer(SizeKt.m1045width3ABfNKs(Modifier.Companion, Dp.m6873constructorimpl(4)), $composer, 6);
            TextKt.m2743Text4IGK_g("Photos", (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 6, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lambda__333269886$lambda$2(Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C57@2305L35,57@2342L39,57@2383L14:MediaGalleryScreen.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-333269886, $changed, -1, "com.hardlineforge.lala.ui.screens.ComposableSingletons$MediaGalleryScreenKt.lambda$-333269886.<anonymous> (MediaGalleryScreen.kt:57)");
            }
            IconKt.m2200Iconww6aTOc(VideocamKt.getVideocam(Icons.Outlined.INSTANCE), (String) null, (Modifier) null, 0L, $composer, 48, 12);
            SpacerKt.Spacer(SizeKt.m1045width3ABfNKs(Modifier.Companion, Dp.m6873constructorimpl(4)), $composer, 6);
            TextKt.m2743Text4IGK_g("Videos", (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, (TextStyle) null, $composer, 6, 0, 131070);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }
}
