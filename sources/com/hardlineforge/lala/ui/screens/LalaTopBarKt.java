package com.hardlineforge.lala.ui.screens;

import androidx.compose.foundation.layout.RowScope;
import androidx.compose.material3.AppBarKt;
import androidx.compose.material3.IconButtonKt;
import androidx.compose.material3.MaterialTheme;
import androidx.compose.material3.TextKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontStyle;
import androidx.compose.ui.text.font.FontWeight;
import androidx.compose.ui.text.style.TextAlign;
import androidx.compose.ui.text.style.TextDecoration;
import androidx.profileinstaller.ProfileVerifier;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: LalaTopBar.kt */
@Metadata(d1 = {"\u0000\u001e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\u001a;\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00010\u00052\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00010\u00052\b\b\u0002\u0010\u0007\u001a\u00020\bH\u0007¢\u0006\u0002\u0010\t¨\u0006\n"}, d2 = {"LalaTopBar", "", "title", "", "onMenuClick", "Lkotlin/Function0;", "onSearchClick", "showMenu", "", "(Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;ZLandroidx/compose/runtime/Composer;II)V", "app_debug"}, k = 2, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class LalaTopBarKt {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaTopBar$lambda$3(String str, Function0 function0, Function0 function02, boolean z, int i, int i2, Composer composer, int i3) {
        LalaTopBar(str, function0, function02, z, composer, RecomposeScopeImplKt.updateChangedFlags(i | 1), i2);
        return Unit.INSTANCE;
    }

    public static final void LalaTopBar(final String title, final Function0<Unit> onMenuClick, final Function0<Unit> onSearchClick, boolean showMenu, Composer $composer, final int $changed, final int $dirty) {
        boolean z;
        boolean showMenu2;
        final boolean showMenu3;
        Intrinsics.checkNotNullParameter(title, "title");
        Intrinsics.checkNotNullParameter(onMenuClick, "onMenuClick");
        Intrinsics.checkNotNullParameter(onSearchClick, "onSearchClick");
        Composer $composer2 = $composer.startRestartGroup(1750533577);
        ComposerKt.sourceInformation($composer2, "C(LalaTopBar)P(3)22@747L84,25@858L197,32@1075L149,21@707L523:LalaTopBar.kt#4cebsy");
        int $dirty2 = $changed;
        if (($changed & 6) == 0) {
            $dirty2 |= $composer2.changed(title) ? 4 : 2;
        }
        if (($changed & 48) == 0) {
            $dirty2 |= $composer2.changedInstance(onMenuClick) ? 32 : 16;
        }
        if (($changed & 384) == 0) {
            $dirty2 |= $composer2.changedInstance(onSearchClick) ? 256 : 128;
        }
        int i = $dirty & 8;
        if (i != 0) {
            $dirty2 |= 3072;
            z = showMenu;
        } else if (($changed & 3072) == 0) {
            z = showMenu;
            $dirty2 |= $composer2.changed(z) ? 2048 : 1024;
        } else {
            z = showMenu;
        }
        if (!$composer2.shouldExecute(($dirty2 & 1171) != 1170, $dirty2 & 1)) {
            $composer2.skipToGroupEnd();
            showMenu2 = z;
        } else {
            if (i != 0) {
                showMenu3 = true;
            } else {
                showMenu3 = z;
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1750533577, $dirty2, -1, "com.hardlineforge.lala.ui.screens.LalaTopBar (LalaTopBar.kt:20)");
            }
            showMenu2 = showMenu3;
            AppBarKt.m1819CenterAlignedTopAppBarGHTll3U(ComposableLambdaKt.rememberComposableLambda(-2090017106, true, new Function2() { // from class: com.hardlineforge.lala.ui.screens.LalaTopBarKt$$ExternalSyntheticLambda0
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    return LalaTopBarKt.LalaTopBar$lambda$0(title, (Composer) obj, ((Integer) obj2).intValue());
                }
            }, $composer2, 54), null, ComposableLambdaKt.rememberComposableLambda(2048969648, true, new Function2() { // from class: com.hardlineforge.lala.ui.screens.LalaTopBarKt$$ExternalSyntheticLambda1
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    return LalaTopBarKt.LalaTopBar$lambda$1(showMenu3, onMenuClick, (Composer) obj, ((Integer) obj2).intValue());
                }
            }, $composer2, 54), ComposableLambdaKt.rememberComposableLambda(-2139864615, true, new Function3() { // from class: com.hardlineforge.lala.ui.screens.LalaTopBarKt$$ExternalSyntheticLambda2
                @Override // kotlin.jvm.functions.Function3
                public final Object invoke(Object obj, Object obj2, Object obj3) {
                    return LalaTopBarKt.LalaTopBar$lambda$2(Function0.this, (RowScope) obj, (Composer) obj2, ((Integer) obj3).intValue());
                }
            }, $composer2, 54), 0.0f, null, null, null, $composer2, 3462, 242);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            final boolean showMenu4 = showMenu2;
            endRestartGroup.updateScope(new Function2() { // from class: com.hardlineforge.lala.ui.screens.LalaTopBarKt$$ExternalSyntheticLambda3
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    return LalaTopBarKt.LalaTopBar$lambda$3(title, onMenuClick, onSearchClick, showMenu4, $changed, $dirty, (Composer) obj, ((Integer) obj2).intValue());
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaTopBar$lambda$0(String $title, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C23@795L10,23@761L60:LalaTopBar.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-2090017106, $changed, -1, "com.hardlineforge.lala.ui.screens.LalaTopBar.<anonymous> (LalaTopBar.kt:23)");
            }
            TextKt.m2743Text4IGK_g($title, (Modifier) null, 0L, 0L, (FontStyle) null, (FontWeight) null, (FontFamily) null, 0L, (TextDecoration) null, (TextAlign) null, 0L, 0, false, 0, 0, (Function1<? super TextLayoutResult, Unit>) null, MaterialTheme.INSTANCE.getTypography($composer, MaterialTheme.$stable).getHeadlineMedium(), $composer, 0, 0, 65534);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaTopBar$lambda$1(boolean $showMenu, Function0 $onMenuClick, Composer $composer, int $changed) {
        Composer $composer2;
        ComposerKt.sourceInformation($composer, "C:LalaTopBar.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(2048969648, $changed, -1, "com.hardlineforge.lala.ui.screens.LalaTopBar.<anonymous> (LalaTopBar.kt:26)");
            }
            if ($showMenu) {
                $composer.startReplaceGroup(779605523);
                ComposerKt.sourceInformation($composer, "27@904L127");
                $composer2 = $composer;
                IconButtonKt.IconButton($onMenuClick, null, false, null, null, ComposableSingletons$LalaTopBarKt.INSTANCE.getLambda$29252008$app_debug(), $composer2, ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE, 30);
            } else {
                $composer2 = $composer;
                $composer2.startReplaceGroup(778720690);
            }
            $composer2.endReplaceGroup();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaTopBar$lambda$2(Function0 $onSearchClick, RowScope CenterAlignedTopAppBar, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(CenterAlignedTopAppBar, "$this$CenterAlignedTopAppBar");
        ComposerKt.sourceInformation($composer, "C33@1089L125:LalaTopBar.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 17) != 16, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-2139864615, $changed, -1, "com.hardlineforge.lala.ui.screens.LalaTopBar.<anonymous> (LalaTopBar.kt:33)");
            }
            IconButtonKt.IconButton($onSearchClick, null, false, null, null, ComposableSingletons$LalaTopBarKt.INSTANCE.m7315getLambda$590632996$app_debug(), $composer, ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE, 30);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }
}
