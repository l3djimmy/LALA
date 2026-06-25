package com.hardlineforge.lala.ui.screens;

import android.os.Bundle;
import androidx.compose.animation.AnimatedContentScope;
import androidx.compose.foundation.layout.ColumnScope;
import androidx.compose.foundation.layout.PaddingKt;
import androidx.compose.foundation.layout.PaddingValues;
import androidx.compose.material3.DrawerState;
import androidx.compose.material3.DrawerValue;
import androidx.compose.material3.NavigationDrawerKt;
import androidx.compose.material3.ScaffoldKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.EffectsKt;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.runtime.State;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Modifier;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.navigation.NavBackStackEntry;
import androidx.navigation.NavController;
import androidx.navigation.NavDestination;
import androidx.navigation.NavGraphBuilder;
import androidx.navigation.NavHostController;
import androidx.navigation.Navigator;
import androidx.navigation.compose.NavGraphBuilderKt;
import androidx.navigation.compose.NavHostControllerKt;
import androidx.navigation.compose.NavHostKt;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: LalaApp.kt */
@Metadata(d1 = {"\u0000\u001c\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\u001a\r\u0010\u0000\u001a\u00020\u0001H\u0007¢\u0006\u0002\u0010\u0002\u001a\u0017\u0010\u0003\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0003¢\u0006\u0002\u0010\u0007\u001a\u0010\u0010\b\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u0004H\u0002¨\u0006\n²\u0006\f\u0010\u000b\u001a\u0004\u0018\u00010\fX\u008a\u0084\u0002"}, d2 = {"LalaApp", "", "(Landroidx/compose/runtime/Composer;I)V", "currentRoute", "", "navController", "Landroidx/navigation/NavHostController;", "(Landroidx/navigation/NavHostController;Landroidx/compose/runtime/Composer;I)Ljava/lang/String;", "routeTitle", "route", "app_debug", "navBackStackEntry", "Landroidx/navigation/NavBackStackEntry;"}, k = 2, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class LalaAppKt {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$23(int i, Composer composer, int i2) {
        LalaApp(composer, RecomposeScopeImplKt.updateChangedFlags(i | 1));
        return Unit.INSTANCE;
    }

    public static final void LalaApp(Composer $composer, final int $changed) {
        Composer $composer2 = $composer.startRestartGroup(254251102);
        ComposerKt.sourceInformation($composer2, "C(LalaApp)22@894L23,23@940L54,24@1011L24,28@1123L178,35@1308L2323,26@1041L2590:LalaApp.kt#4cebsy");
        if ($composer2.shouldExecute($changed != 0, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(254251102, $changed, -1, "com.hardlineforge.lala.ui.screens.LalaApp (LalaApp.kt:21)");
            }
            final NavHostController navController = NavHostControllerKt.rememberNavController(new Navigator[0], $composer2, 0);
            final DrawerState drawerState = NavigationDrawerKt.rememberDrawerState(DrawerValue.Closed, null, $composer2, 6, 2);
            ComposerKt.sourceInformationMarkerStart($composer2, 773894976, "CC(rememberCoroutineScope)558@25470L68:Effects.kt#9igjgp");
            ComposerKt.sourceInformationMarkerStart($composer2, -954203484, "CC(remember):Effects.kt#9igjgp");
            Object rememberedValue = $composer2.rememberedValue();
            if (rememberedValue == Composer.Companion.getEmpty()) {
                Object createCompositionCoroutineScope = EffectsKt.createCompositionCoroutineScope(EmptyCoroutineContext.INSTANCE, $composer2);
                $composer2.updateRememberedValue(createCompositionCoroutineScope);
                rememberedValue = createCompositionCoroutineScope;
            }
            final CoroutineScope scope = (CoroutineScope) rememberedValue;
            ComposerKt.sourceInformationMarkerEnd($composer2);
            ComposerKt.sourceInformationMarkerEnd($composer2);
            NavigationDrawerKt.m2335ModalNavigationDrawerFHprtrg(ComposableLambdaKt.rememberComposableLambda(1256584229, true, new Function2() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda15
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    return LalaAppKt.LalaApp$lambda$3(NavHostController.this, scope, drawerState, (Composer) obj, ((Integer) obj2).intValue());
                }
            }, $composer2, 54), null, drawerState, false, 0L, ComposableLambdaKt.rememberComposableLambda(-442124800, true, new Function2() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda16
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    return LalaAppKt.LalaApp$lambda$22(NavHostController.this, scope, drawerState, (Composer) obj, ((Integer) obj2).intValue());
                }
            }, $composer2, 54), $composer2, 196614, 26);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer2.skipToGroupEnd();
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda17
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    return LalaAppKt.LalaApp$lambda$23($changed, (Composer) obj, ((Integer) obj2).intValue());
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$3(final NavHostController $navController, final CoroutineScope $scope, final DrawerState $drawerState, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C29@1154L137,29@1137L154:LalaApp.kt#4cebsy");
        if ($composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1256584229, $changed, -1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous> (LalaApp.kt:29)");
            }
            NavigationDrawerKt.m2334ModalDrawerSheetafqeVBk(null, null, 0L, 0L, 0.0f, null, ComposableLambdaKt.rememberComposableLambda(1626469121, true, new Function3() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda11
                @Override // kotlin.jvm.functions.Function3
                public final Object invoke(Object obj, Object obj2, Object obj3) {
                    return LalaAppKt.LalaApp$lambda$3$lambda$2(NavHostController.this, $scope, $drawerState, (ColumnScope) obj, (Composer) obj2, ((Integer) obj3).intValue());
                }
            }, $composer, 54), $composer, 1572864, 63);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer.skipToGroupEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$3$lambda$2(NavHostController $navController, final CoroutineScope $scope, final DrawerState $drawerState, ColumnScope ModalDrawerSheet, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(ModalDrawerSheet, "$this$ModalDrawerSheet");
        ComposerKt.sourceInformation($composer, "C30@1201L76,30@1172L105:LalaApp.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 17) != 16, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1626469121, $changed, -1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous> (LalaApp.kt:30)");
            }
            ComposerKt.sourceInformationMarkerStart($composer, -331268883, "CC(remember):LalaApp.kt#9igjgp");
            boolean changedInstance = $composer.changedInstance($scope) | $composer.changed($drawerState);
            Object rememberedValue = $composer.rememberedValue();
            if (changedInstance || rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda10
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return LalaAppKt.LalaApp$lambda$3$lambda$2$lambda$1$lambda$0(CoroutineScope.this, $drawerState);
                    }
                };
                $composer.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            DrawerContentKt.DrawerContent($navController, (Function0) rememberedValue, $composer, 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$3$lambda$2$lambda$1$lambda$0(CoroutineScope $scope, DrawerState $drawerState) {
        BuildersKt__Builders_commonKt.launch$default($scope, null, null, new LalaAppKt$LalaApp$1$1$1$1$1($drawerState, null), 3, null);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$22(final NavHostController $navController, final CoroutineScope $scope, final DrawerState $drawerState, Composer $composer, int $changed) {
        ComposerKt.sourceInformation($composer, "C37@1349L551,50@1911L1714,36@1318L2307:LalaApp.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-442124800, $changed, -1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous> (LalaApp.kt:36)");
            }
            ScaffoldKt.m2458ScaffoldTvnljyQ(null, ComposableLambdaKt.rememberComposableLambda(-149604420, true, new Function2() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda12
                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    return LalaAppKt.LalaApp$lambda$22$lambda$8(NavHostController.this, $scope, $drawerState, (Composer) obj, ((Integer) obj2).intValue());
                }
            }, $composer, 54), null, null, null, 0, 0L, 0L, null, ComposableLambdaKt.rememberComposableLambda(-1286814511, true, new Function3() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda13
                @Override // kotlin.jvm.functions.Function3
                public final Object invoke(Object obj, Object obj2, Object obj3) {
                    return LalaAppKt.LalaApp$lambda$22$lambda$21(NavHostController.this, (PaddingValues) obj, (Composer) obj2, ((Integer) obj3).intValue());
                }
            }, $composer, 54), $composer, 805306416, 509);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$22$lambda$8(final NavHostController $navController, final CoroutineScope $scope, final DrawerState $drawerState, Composer $composer, int $changed) {
        Composer $composer2;
        ComposerKt.sourceInformation($composer, "C38@1386L27:LalaApp.kt#4cebsy");
        if (!$composer.shouldExecute(($changed & 3) != 2, $changed & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-149604420, $changed, -1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous> (LalaApp.kt:38)");
            }
            String currentRoute = currentRoute($navController, $composer, 0);
            if (currentRoute == null || Intrinsics.areEqual(currentRoute, "splash")) {
                $composer2 = $composer;
                $composer2.startReplaceGroup(1309437830);
            } else {
                $composer.startReplaceGroup(1310923412);
                ComposerKt.sourceInformation($composer, "42@1614L39,43@1695L88,40@1506L362");
                String routeTitle = routeTitle(currentRoute);
                ComposerKt.sourceInformationMarkerStart($composer, -2035918333, "CC(remember):LalaApp.kt#9igjgp");
                boolean changedInstance = $composer.changedInstance($scope) | $composer.changed($drawerState);
                Object rememberedValue = $composer.rememberedValue();
                if (changedInstance || rememberedValue == Composer.Companion.getEmpty()) {
                    Object obj = new Function0() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda18
                        @Override // kotlin.jvm.functions.Function0
                        public final Object invoke() {
                            return LalaAppKt.LalaApp$lambda$22$lambda$8$lambda$5$lambda$4(CoroutineScope.this, $drawerState);
                        }
                    };
                    $composer.updateRememberedValue(obj);
                    rememberedValue = obj;
                }
                Function0 function0 = (Function0) rememberedValue;
                ComposerKt.sourceInformationMarkerEnd($composer);
                ComposerKt.sourceInformationMarkerStart($composer, -2035915692, "CC(remember):LalaApp.kt#9igjgp");
                boolean changedInstance2 = $composer.changedInstance($navController);
                Object rememberedValue2 = $composer.rememberedValue();
                if (changedInstance2 || rememberedValue2 == Composer.Companion.getEmpty()) {
                    Object obj2 = new Function0() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda19
                        @Override // kotlin.jvm.functions.Function0
                        public final Object invoke() {
                            return LalaAppKt.LalaApp$lambda$22$lambda$8$lambda$7$lambda$6(NavHostController.this);
                        }
                    };
                    $composer.updateRememberedValue(obj2);
                    rememberedValue2 = obj2;
                }
                ComposerKt.sourceInformationMarkerEnd($composer);
                $composer2 = $composer;
                LalaTopBarKt.LalaTopBar(routeTitle, function0, (Function0) rememberedValue2, Intrinsics.areEqual(currentRoute, "timeline"), $composer2, 0, 0);
            }
            $composer2.endReplaceGroup();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$22$lambda$8$lambda$5$lambda$4(CoroutineScope $scope, DrawerState $drawerState) {
        BuildersKt__Builders_commonKt.launch$default($scope, null, null, new LalaAppKt$LalaApp$2$1$1$1$1($drawerState, null), 3, null);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$22$lambda$8$lambda$7$lambda$6(NavHostController $navController) {
        NavController.navigate$default($navController, "search", null, null, 6, null);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$22$lambda$21(final NavHostController $navController, PaddingValues padding, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(padding, "padding");
        ComposerKt.sourceInformation($composer, "C55@2106L1509,51@1936L1679:LalaApp.kt#4cebsy");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= $composer.changed(padding) ? 4 : 2;
        }
        int $dirty2 = $dirty;
        if (!$composer.shouldExecute(($dirty2 & 19) != 18, $dirty2 & 1)) {
            $composer.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1286814511, $dirty2, -1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous> (LalaApp.kt:51)");
            }
            Modifier padding2 = PaddingKt.padding(Modifier.Companion, padding);
            ComposerKt.sourceInformationMarkerStart($composer, 321843926, "CC(remember):LalaApp.kt#9igjgp");
            boolean changedInstance = $composer.changedInstance($navController);
            Object rememberedValue = $composer.rememberedValue();
            if (changedInstance || rememberedValue == Composer.Companion.getEmpty()) {
                Object obj = new Function1() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda14
                    @Override // kotlin.jvm.functions.Function1
                    public final Object invoke(Object obj2) {
                        return LalaAppKt.LalaApp$lambda$22$lambda$21$lambda$20$lambda$19(NavHostController.this, (NavGraphBuilder) obj2);
                    }
                };
                $composer.updateRememberedValue(obj);
                rememberedValue = obj;
            }
            ComposerKt.sourceInformationMarkerEnd($composer);
            NavHostKt.NavHost($navController, "timeline", padding2, null, null, null, null, null, null, (Function1) rememberedValue, $composer, 48, TypedValues.PositionType.TYPE_PERCENT_HEIGHT);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$22$lambda$21$lambda$20$lambda$19(final NavHostController $navController, NavGraphBuilder NavHost) {
        Intrinsics.checkNotNullParameter(NavHost, "$this$NavHost");
        NavGraphBuilderKt.composable$default(NavHost, "timeline", null, null, null, null, null, null, ComposableLambdaKt.composableLambdaInstance(1213121711, true, new Function4() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function4
            public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
                return LalaAppKt.LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$9(NavHostController.this, (AnimatedContentScope) obj, (NavBackStackEntry) obj2, (Composer) obj3, ((Integer) obj4).intValue());
            }
        }), 126, null);
        NavGraphBuilderKt.composable$default(NavHost, "map_view", null, null, null, null, null, null, ComposableSingletons$LalaAppKt.INSTANCE.m7314getLambda$661289448$app_debug(), 126, null);
        NavGraphBuilderKt.composable$default(NavHost, "media_gallery", null, null, null, null, null, null, ComposableLambdaKt.composableLambdaInstance(509919223, true, new Function4() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function4
            public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
                return LalaAppKt.LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$10(NavHostController.this, (AnimatedContentScope) obj, (NavBackStackEntry) obj2, (Composer) obj3, ((Integer) obj4).intValue());
            }
        }), 126, null);
        NavGraphBuilderKt.composable$default(NavHost, "reports", null, null, null, null, null, null, ComposableLambdaKt.composableLambdaInstance(1681127894, true, new Function4() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda2
            @Override // kotlin.jvm.functions.Function4
            public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
                return LalaAppKt.LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$11(NavHostController.this, (AnimatedContentScope) obj, (NavBackStackEntry) obj2, (Composer) obj3, ((Integer) obj4).intValue());
            }
        }), 126, null);
        NavGraphBuilderKt.composable$default(NavHost, "settings", null, null, null, null, null, null, ComposableSingletons$LalaAppKt.INSTANCE.m7313getLambda$1442630731$app_debug(), 126, null);
        NavGraphBuilderKt.composable$default(NavHost, "search", null, null, null, null, null, null, ComposableLambdaKt.composableLambdaInstance(-271422060, true, new Function4() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda3
            @Override // kotlin.jvm.functions.Function4
            public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
                return LalaAppKt.LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$12(NavHostController.this, (AnimatedContentScope) obj, (NavBackStackEntry) obj2, (Composer) obj3, ((Integer) obj4).intValue());
            }
        }), 126, null);
        NavGraphBuilderKt.composable$default(NavHost, "new_entry", null, null, null, null, null, null, ComposableLambdaKt.composableLambdaInstance(899786611, true, new Function4() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda4
            @Override // kotlin.jvm.functions.Function4
            public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
                return LalaAppKt.LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$13(NavHostController.this, (AnimatedContentScope) obj, (NavBackStackEntry) obj2, (Composer) obj3, ((Integer) obj4).intValue());
            }
        }), 126, null);
        NavGraphBuilderKt.composable$default(NavHost, "edit_entry/{entryId}", null, null, null, null, null, null, ComposableLambdaKt.composableLambdaInstance(2070995282, true, new Function4() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda5
            @Override // kotlin.jvm.functions.Function4
            public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
                return LalaAppKt.LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$14(NavHostController.this, (AnimatedContentScope) obj, (NavBackStackEntry) obj2, (Composer) obj3, ((Integer) obj4).intValue());
            }
        }), 126, null);
        NavGraphBuilderKt.composable$default(NavHost, "entry_detail/{entryId}", null, null, null, null, null, null, ComposableLambdaKt.composableLambdaInstance(-1052763343, true, new Function4() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda6
            @Override // kotlin.jvm.functions.Function4
            public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
                return LalaAppKt.LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$15(NavHostController.this, (AnimatedContentScope) obj, (NavBackStackEntry) obj2, (Composer) obj3, ((Integer) obj4).intValue());
            }
        }), 126, null);
        NavGraphBuilderKt.composable$default(NavHost, "pdf_preview", null, null, null, null, null, null, ComposableLambdaKt.composableLambdaInstance(118445328, true, new Function4() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda7
            @Override // kotlin.jvm.functions.Function4
            public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
                return LalaAppKt.LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$16(NavHostController.this, (AnimatedContentScope) obj, (NavBackStackEntry) obj2, (Composer) obj3, ((Integer) obj4).intValue());
            }
        }), 126, null);
        NavGraphBuilderKt.composable$default(NavHost, "camera_capture/{entryId}", null, null, null, null, null, null, ComposableLambdaKt.composableLambdaInstance(1055681538, true, new Function4() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda8
            @Override // kotlin.jvm.functions.Function4
            public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
                return LalaAppKt.LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$17(NavHostController.this, (AnimatedContentScope) obj, (NavBackStackEntry) obj2, (Composer) obj3, ((Integer) obj4).intValue());
            }
        }), 126, null);
        NavGraphBuilderKt.composable$default(NavHost, "filmstrip/{videoId}", null, null, null, null, null, null, ComposableLambdaKt.composableLambdaInstance(-2068077087, true, new Function4() { // from class: com.hardlineforge.lala.ui.screens.LalaAppKt$$ExternalSyntheticLambda9
            @Override // kotlin.jvm.functions.Function4
            public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
                return LalaAppKt.LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$18(NavHostController.this, (AnimatedContentScope) obj, (NavBackStackEntry) obj2, (Composer) obj3, ((Integer) obj4).intValue());
            }
        }), 126, null);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$9(NavHostController $navController, AnimatedContentScope composable, NavBackStackEntry it, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(composable, "$this$composable");
        Intrinsics.checkNotNullParameter(it, "it");
        ComposerKt.sourceInformation($composer, "C56@2149L29:LalaApp.kt#4cebsy");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(1213121711, $changed, -1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:56)");
        }
        TimelineScreenKt.TimelineScreen($navController, null, $composer, 0, 2);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$10(NavHostController $navController, AnimatedContentScope composable, NavBackStackEntry it, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(composable, "$this$composable");
        Intrinsics.checkNotNullParameter(it, "it");
        ComposerKt.sourceInformation($composer, "C58@2286L33:LalaApp.kt#4cebsy");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(509919223, $changed, -1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:58)");
        }
        MediaGalleryScreenKt.MediaGalleryScreen($navController, null, $composer, 0, 2);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$11(NavHostController $navController, AnimatedContentScope composable, NavBackStackEntry it, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(composable, "$this$composable");
        Intrinsics.checkNotNullParameter(it, "it");
        ComposerKt.sourceInformation($composer, "C59@2362L28:LalaApp.kt#4cebsy");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(1681127894, $changed, -1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:59)");
        }
        ReportsScreenKt.ReportsScreen($navController, null, $composer, 0, 2);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$12(NavHostController $navController, AnimatedContentScope composable, NavBackStackEntry it, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(composable, "$this$composable");
        Intrinsics.checkNotNullParameter(it, "it");
        ComposerKt.sourceInformation($composer, "C61@2492L27:LalaApp.kt#4cebsy");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(-271422060, $changed, -1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:61)");
        }
        SearchScreenKt.SearchScreen($navController, null, $composer, 0, 2);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$13(NavHostController $navController, AnimatedContentScope composable, NavBackStackEntry it, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(composable, "$this$composable");
        Intrinsics.checkNotNullParameter(it, "it");
        ComposerKt.sourceInformation($composer, "C62@2564L44:LalaApp.kt#4cebsy");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(899786611, $changed, -1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:62)");
        }
        AddEditScreenKt.AddEditScreen($navController, null, null, $composer, 48, 4);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$14(NavHostController $navController, AnimatedContentScope composable, NavBackStackEntry backStack, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(composable, "$this$composable");
        Intrinsics.checkNotNullParameter(backStack, "backStack");
        ComposerKt.sourceInformation($composer, "C65@2774L42:LalaApp.kt#4cebsy");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(2070995282, $changed, -1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:64)");
        }
        Bundle arguments = backStack.getArguments();
        String id = (arguments == null || (r0 = arguments.getString("entryId")) == null) ? "" : "";
        AddEditScreenKt.AddEditScreen($navController, id, null, $composer, 0, 4);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$15(NavHostController $navController, AnimatedContentScope composable, NavBackStackEntry backStack, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(composable, "$this$composable");
        Intrinsics.checkNotNullParameter(backStack, "backStack");
        ComposerKt.sourceInformation($composer, "C69@3000L46:LalaApp.kt#4cebsy");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(-1052763343, $changed, -1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:68)");
        }
        Bundle arguments = backStack.getArguments();
        String id = (arguments == null || (r0 = arguments.getString("entryId")) == null) ? "" : "";
        EntryDetailScreenKt.EntryDetailScreen($navController, id, null, $composer, 0, 4);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$16(NavHostController $navController, AnimatedContentScope composable, NavBackStackEntry it, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(composable, "$this$composable");
        Intrinsics.checkNotNullParameter(it, "it");
        ComposerKt.sourceInformation($composer, "C71@3109L31:LalaApp.kt#4cebsy");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(118445328, $changed, -1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:71)");
        }
        PdfPreviewScreenKt.PdfPreviewScreen($navController, null, $composer, 0, 2);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$17(NavHostController $navController, AnimatedContentScope composable, NavBackStackEntry backStack, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(composable, "$this$composable");
        Intrinsics.checkNotNullParameter(backStack, "backStack");
        ComposerKt.sourceInformation($composer, "C74@3310L48:LalaApp.kt#4cebsy");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(1055681538, $changed, -1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:73)");
        }
        Bundle arguments = backStack.getArguments();
        String id = (arguments == null || (r0 = arguments.getString("entryId")) == null) ? "" : "";
        CameraCaptureScreenKt.CameraCaptureScreen($navController, id, null, $composer, 0, 4);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$18(NavHostController $navController, AnimatedContentScope composable, NavBackStackEntry backStack, Composer $composer, int $changed) {
        Intrinsics.checkNotNullParameter(composable, "$this$composable");
        Intrinsics.checkNotNullParameter(backStack, "backStack");
        ComposerKt.sourceInformation($composer, "C78@3539L44:LalaApp.kt#4cebsy");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(-2068077087, $changed, -1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:77)");
        }
        Bundle arguments = backStack.getArguments();
        String id = (arguments == null || (r0 = arguments.getString("videoId")) == null) ? "" : "";
        FilmstripScreenKt.FilmstripScreen($navController, id, null, $composer, 0, 4);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        return Unit.INSTANCE;
    }

    private static final String currentRoute(NavHostController navController, Composer $composer, int $changed) {
        NavDestination destination;
        String route;
        ComposerKt.sourceInformationMarkerStart($composer, 429187725, "C(currentRoute)87@3760L30:LalaApp.kt#4cebsy");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(429187725, $changed, -1, "com.hardlineforge.lala.ui.screens.currentRoute (LalaApp.kt:86)");
        }
        State navBackStackEntry$delegate = NavHostControllerKt.currentBackStackEntryAsState(navController, $composer, $changed & 14);
        NavBackStackEntry currentRoute$lambda$24 = currentRoute$lambda$24(navBackStackEntry$delegate);
        String str = null;
        if (currentRoute$lambda$24 != null && (destination = currentRoute$lambda$24.getDestination()) != null && (route = destination.getRoute()) != null) {
            str = StringsKt.substringBefore$default(route, "/", (String) null, 2, (Object) null);
        }
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return str;
    }

    private static final NavBackStackEntry currentRoute$lambda$24(State<NavBackStackEntry> state) {
        return (NavBackStackEntry) state.getValue();
    }

    private static final String routeTitle(String route) {
        switch (route.hashCode()) {
            case -2076650431:
                if (route.equals("timeline")) {
                    return "Timeline";
                }
                break;
            case -2025674243:
                if (route.equals("edit_entry")) {
                    return "Edit Entry";
                }
                break;
            case -1591776777:
                if (route.equals("media_gallery")) {
                    return "Media Gallery";
                }
                break;
            case -1068769260:
                if (route.equals("filmstrip")) {
                    return "Filmstrip";
                }
                break;
            case -906336856:
                if (route.equals("search")) {
                    return "Search";
                }
                break;
            case -266117869:
                if (route.equals("new_entry")) {
                    return "New Entry";
                }
                break;
            case 179128232:
                if (route.equals("map_view")) {
                    return "Map View";
                }
                break;
            case 496707963:
                if (route.equals("pdf_preview")) {
                    return "Report Preview";
                }
                break;
            case 644090046:
                if (route.equals("entry_detail")) {
                    return "Entry Detail";
                }
                break;
            case 1094603199:
                if (route.equals("reports")) {
                    return "Reports";
                }
                break;
            case 1434631203:
                if (route.equals("settings")) {
                    return "Settings";
                }
                break;
            case 1634352172:
                if (route.equals("camera_capture")) {
                    return "Camera";
                }
                break;
        }
        return "LALA";
    }
}
