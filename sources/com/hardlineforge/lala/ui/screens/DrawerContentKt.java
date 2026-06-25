package com.hardlineforge.lala.ui.screens;

import androidx.compose.runtime.Composer;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.navigation.NavController;
import androidx.navigation.NavHostController;
import androidx.navigation.NavOptionsBuilder;
import androidx.navigation.PopUpToBuilder;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: DrawerContent.kt */
@Metadata(d1 = {"\u0000\u0016\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a#\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00010\u0005H\u0007¢\u0006\u0002\u0010\u0006¨\u0006\u0007"}, d2 = {"DrawerContent", "", "navController", "Landroidx/navigation/NavHostController;", "onNavigate", "Lkotlin/Function0;", "(Landroidx/navigation/NavHostController;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;I)V", "app_debug"}, k = 2, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class DrawerContentKt {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit DrawerContent$lambda$13(NavHostController navHostController, Function0 function0, int i, Composer composer, int i2) {
        DrawerContent(navHostController, function0, composer, RecomposeScopeImplKt.updateChangedFlags(i | 1));
        return Unit.INSTANCE;
    }

    /* JADX WARN: Code restructure failed: missing block: B:47:0x026e, code lost:
        if (r3 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x02d9, code lost:
        if (r3 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x0344, code lost:
        if (r3 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L57;
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x03af, code lost:
        if (r3 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L65;
     */
    /* JADX WARN: Code restructure failed: missing block: B:95:0x0419, code lost:
        if (r3 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L73;
     */
    /* JADX WARN: Removed duplicated region for block: B:102:0x046c  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0254  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0256  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0266  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0272  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x02bf  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x02c1  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x02d1  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x02dd  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x032a  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x032c  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x033c  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0348  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0395  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0397  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x03a7  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x03b3  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x03fe  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x0401  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0411  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x041d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void DrawerContent(final androidx.navigation.NavHostController r59, final kotlin.jvm.functions.Function0<kotlin.Unit> r60, androidx.compose.runtime.Composer r61, final int r62) {
        /*
            Method dump skipped, instructions count: 1158
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.DrawerContentKt.DrawerContent(androidx.navigation.NavHostController, kotlin.jvm.functions.Function0, androidx.compose.runtime.Composer, int):void");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit DrawerContent$lambda$12$lambda$3$lambda$2(NavHostController $navController, Function0 $onNavigate) {
        $navController.navigate("timeline", new Function1() { // from class: com.hardlineforge.lala.ui.screens.DrawerContentKt$$ExternalSyntheticLambda6
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return DrawerContentKt.DrawerContent$lambda$12$lambda$3$lambda$2$lambda$1((NavOptionsBuilder) obj);
            }
        });
        $onNavigate.invoke();
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit DrawerContent$lambda$12$lambda$3$lambda$2$lambda$1(NavOptionsBuilder navigate) {
        Intrinsics.checkNotNullParameter(navigate, "$this$navigate");
        navigate.popUpTo("timeline", new Function1() { // from class: com.hardlineforge.lala.ui.screens.DrawerContentKt$$ExternalSyntheticLambda7
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return DrawerContentKt.DrawerContent$lambda$12$lambda$3$lambda$2$lambda$1$lambda$0((PopUpToBuilder) obj);
            }
        });
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit DrawerContent$lambda$12$lambda$3$lambda$2$lambda$1$lambda$0(PopUpToBuilder popUpTo) {
        Intrinsics.checkNotNullParameter(popUpTo, "$this$popUpTo");
        popUpTo.setInclusive(true);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit DrawerContent$lambda$12$lambda$5$lambda$4(NavHostController $navController, Function0 $onNavigate) {
        NavController.navigate$default($navController, "map_view", null, null, 6, null);
        $onNavigate.invoke();
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit DrawerContent$lambda$12$lambda$7$lambda$6(NavHostController $navController, Function0 $onNavigate) {
        NavController.navigate$default($navController, "media_gallery", null, null, 6, null);
        $onNavigate.invoke();
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit DrawerContent$lambda$12$lambda$9$lambda$8(NavHostController $navController, Function0 $onNavigate) {
        NavController.navigate$default($navController, "reports", null, null, 6, null);
        $onNavigate.invoke();
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit DrawerContent$lambda$12$lambda$11$lambda$10(NavHostController $navController, Function0 $onNavigate) {
        NavController.navigate$default($navController, "settings", null, null, 6, null);
        $onNavigate.invoke();
        return Unit.INSTANCE;
    }
}
