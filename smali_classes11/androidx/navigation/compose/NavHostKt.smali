.class public final Landroidx/navigation/compose/NavHostKt;
.super Ljava/lang/Object;
.source "NavHost.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nNavHost.kt\nKotlin\n*S Kotlin\n*F\n+ 1 NavHost.kt\nandroidx/navigation/compose/NavHostKt\n+ 2 Composables.kt\nandroidx/compose/runtime/ComposablesKt\n+ 3 Composer.kt\nandroidx/compose/runtime/ComposerKt\n+ 4 NavController.kt\nandroidx/navigation/NavControllerKt\n+ 5 NavGraphBuilder.kt\nandroidx/navigation/NavGraphBuilderKt\n+ 6 CompositionLocal.kt\nandroidx/compose/runtime/CompositionLocal\n+ 7 NavigatorProvider.kt\nandroidx/navigation/NavigatorProviderKt\n+ 8 SnapshotState.kt\nandroidx/compose/runtime/SnapshotStateKt__SnapshotStateKt\n*L\n1#1,368:1\n67#2,3:369\n66#2:372\n67#2,3:382\n66#2:385\n25#2:397\n25#2:404\n67#2,3:411\n66#2:414\n67#2,3:421\n66#2:424\n50#2:431\n49#2:432\n1097#3,3:373\n1100#3,3:379\n1097#3,3:386\n1100#3,3:392\n1097#3,6:398\n1097#3,6:405\n1097#3,6:415\n1097#3,6:425\n1097#3,6:433\n2603#4:376\n2603#4:389\n57#5,2:377\n57#5,2:390\n76#6:395\n150#7:396\n150#7:439\n81#8:440\n81#8:441\n81#8:442\n*S KotlinDebug\n*F\n+ 1 NavHost.kt\nandroidx/navigation/compose/NavHostKt\n*L\n84#1:369,3\n84#1:372\n130#1:382,3\n130#1:385\n231#1:397\n241#1:404\n244#1:411,3\n244#1:414\n258#1:421,3\n258#1:424\n321#1:431\n321#1:432\n84#1:373,3\n84#1:379,3\n130#1:386,3\n130#1:392,3\n231#1:398,6\n241#1:405,6\n244#1:415,6\n258#1:425,6\n321#1:433,6\n85#1:376\n131#1:389\n85#1:377,2\n131#1:390,2\n198#1:395\n210#1:396\n330#1:439\n214#1:440\n228#1:441\n231#1:442\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000`\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010 \n\u0002\u0008\u0002\u001a\'\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007H\u0007\u00a2\u0006\u0002\u0010\u0008\u001a\u00b5\u0001\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0002\u0010\t\u001a\u00020\n2\u001f\u0008\u0002\u0010\u000b\u001a\u0019\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000e0\r\u0012\u0004\u0012\u00020\u000f0\u000c\u00a2\u0006\u0002\u0008\u00102\u001f\u0008\u0002\u0010\u0011\u001a\u0019\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000e0\r\u0012\u0004\u0012\u00020\u00120\u000c\u00a2\u0006\u0002\u0008\u00102\u001f\u0008\u0002\u0010\u0013\u001a\u0019\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000e0\r\u0012\u0004\u0012\u00020\u000f0\u000c\u00a2\u0006\u0002\u0008\u00102\u001f\u0008\u0002\u0010\u0014\u001a\u0019\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000e0\r\u0012\u0004\u0012\u00020\u00120\u000c\u00a2\u0006\u0002\u0008\u0010H\u0007\u00a2\u0006\u0002\u0010\u0015\u001a\u00da\u0001\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0016\u001a\u00020\u00172\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0002\u0010\t\u001a\u00020\n2\n\u0008\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00172\u001f\u0008\u0002\u0010\u000b\u001a\u0019\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000e0\r\u0012\u0004\u0012\u00020\u000f0\u000c\u00a2\u0006\u0002\u0008\u00102\u001f\u0008\u0002\u0010\u0011\u001a\u0019\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000e0\r\u0012\u0004\u0012\u00020\u00120\u000c\u00a2\u0006\u0002\u0008\u00102\u001f\u0008\u0002\u0010\u0013\u001a\u0019\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000e0\r\u0012\u0004\u0012\u00020\u000f0\u000c\u00a2\u0006\u0002\u0008\u00102\u001f\u0008\u0002\u0010\u0014\u001a\u0019\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u000e0\r\u0012\u0004\u0012\u00020\u00120\u000c\u00a2\u0006\u0002\u0008\u00102\u0017\u0010\u0019\u001a\u0013\u0012\u0004\u0012\u00020\u001a\u0012\u0004\u0012\u00020\u00010\u000c\u00a2\u0006\u0002\u0008\u0010H\u0007\u00a2\u0006\u0002\u0010\u001b\u001aL\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0016\u001a\u00020\u00172\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\n\u0008\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00172\u0017\u0010\u0019\u001a\u0013\u0012\u0004\u0012\u00020\u001a\u0012\u0004\u0012\u00020\u00010\u000c\u00a2\u0006\u0002\u0008\u0010H\u0007\u00a2\u0006\u0002\u0010\u001c\u001a\u001c\u0010\u001d\u001a\u0004\u0018\u00010\u000f*\u00020\u001e2\u000c\u0010\u001f\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\rH\u0002\u001a\u001c\u0010 \u001a\u0004\u0018\u00010\u0012*\u00020\u001e2\u000c\u0010\u001f\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\rH\u0002\u001a\u001c\u0010!\u001a\u0004\u0018\u00010\u000f*\u00020\u001e2\u000c\u0010\u001f\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\rH\u0002\u001a\u001c\u0010\"\u001a\u0004\u0018\u00010\u0012*\u00020\u001e2\u000c\u0010\u001f\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\rH\u0002\u00a8\u0006#\u00b2\u0006\u0010\u0010$\u001a\u0008\u0012\u0004\u0012\u00020\u000e0%X\u008a\u0084\u0002\u00b2\u0006\u0010\u0010&\u001a\u0008\u0012\u0004\u0012\u00020\u000e0%X\u008a\u0084\u0002\u00b2\u0006\u0010\u0010\'\u001a\u0008\u0012\u0004\u0012\u00020\u000e0%X\u008a\u0084\u0002"
    }
    d2 = {
        "NavHost",
        "",
        "navController",
        "Landroidx/navigation/NavHostController;",
        "graph",
        "Landroidx/navigation/NavGraph;",
        "modifier",
        "Landroidx/compose/ui/Modifier;",
        "(Landroidx/navigation/NavHostController;Landroidx/navigation/NavGraph;Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;II)V",
        "contentAlignment",
        "Landroidx/compose/ui/Alignment;",
        "enterTransition",
        "Lkotlin/Function1;",
        "Landroidx/compose/animation/AnimatedContentTransitionScope;",
        "Landroidx/navigation/NavBackStackEntry;",
        "Landroidx/compose/animation/EnterTransition;",
        "Lkotlin/ExtensionFunctionType;",
        "exitTransition",
        "Landroidx/compose/animation/ExitTransition;",
        "popEnterTransition",
        "popExitTransition",
        "(Landroidx/navigation/NavHostController;Landroidx/navigation/NavGraph;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V",
        "startDestination",
        "",
        "route",
        "builder",
        "Landroidx/navigation/NavGraphBuilder;",
        "(Landroidx/navigation/NavHostController;Ljava/lang/String;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V",
        "(Landroidx/navigation/NavHostController;Ljava/lang/String;Landroidx/compose/ui/Modifier;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V",
        "createEnterTransition",
        "Landroidx/navigation/NavDestination;",
        "scope",
        "createExitTransition",
        "createPopEnterTransition",
        "createPopExitTransition",
        "navigation-compose_release",
        "currentBackStack",
        "",
        "allVisibleEntries",
        "visibleEntries"
    }
    k = 0x2
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final synthetic NavHost(Landroidx/navigation/NavHostController;Landroidx/navigation/NavGraph;Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;II)V
    .locals 13
    .param p0, "navController"    # Landroidx/navigation/NavHostController;
    .param p1, "graph"    # Landroidx/navigation/NavGraph;
    .param p2, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I
    .annotation runtime Lkotlin/Deprecated;
        level = .enum Lkotlin/DeprecationLevel;->HIDDEN:Lkotlin/DeprecationLevel;
        message = "Deprecated in favor of NavHost that supports AnimatedContent"
    .end annotation

    .line 164
    const v0, -0x390ae240    # -31374.875f

    move-object/from16 v1, p3

    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v9

    .end local p3    # "$composer":Landroidx/compose/runtime/Composer;
    .local v9, "$composer":Landroidx/compose/runtime/Composer;
    const-string v1, "C(NavHost)P(2)163@6434L39:NavHost.kt#opm8kd"

    invoke-static {v9, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v12, p4

    .local v12, "$dirty":I
    and-int/lit8 v1, p5, 0x4

    if-eqz v1, :cond_0

    .line 163
    sget-object v1, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    move-object p2, v1

    check-cast p2, Landroidx/compose/ui/Modifier;

    move-object v3, p2

    goto :goto_0

    .line 164
    :cond_0
    move-object v3, p2

    .line 163
    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "modifier":Landroidx/compose/ui/Modifier;
    :goto_0
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 164
    const/4 p2, -0x1

    const-string v1, "androidx.navigation.compose.NavHost (NavHost.kt:163)"

    invoke-static {v0, v12, p2, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    :cond_1
    and-int/lit16 p2, v12, 0x380

    or-int/lit8 v10, p2, 0x48

    const/16 v11, 0xf8

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-static/range {v1 .. v11}, Landroidx/navigation/compose/NavHostKt;->NavHost(Landroidx/navigation/NavHostController;Landroidx/navigation/NavGraph;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_2
    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object p2

    if-nez p2, :cond_3

    goto :goto_1

    :cond_3
    new-instance v1, Landroidx/navigation/compose/NavHostKt$NavHost$7;

    move-object v2, p0

    move/from16 v5, p4

    move/from16 v6, p5

    move-object v4, v3

    move-object v3, p1

    .end local v3    # "modifier":Landroidx/compose/ui/Modifier;
    .local v4, "modifier":Landroidx/compose/ui/Modifier;
    invoke-direct/range {v1 .. v6}, Landroidx/navigation/compose/NavHostKt$NavHost$7;-><init>(Landroidx/navigation/NavHostController;Landroidx/navigation/NavGraph;Landroidx/compose/ui/Modifier;II)V

    move-object v3, v4

    .end local v4    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v3    # "modifier":Landroidx/compose/ui/Modifier;
    check-cast v1, Lkotlin/jvm/functions/Function2;

    invoke-interface {p2, v1}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :goto_1
    return-void
.end method

.method public static final NavHost(Landroidx/navigation/NavHostController;Landroidx/navigation/NavGraph;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V
    .locals 30
    .param p0, "navController"    # Landroidx/navigation/NavHostController;
    .param p1, "graph"    # Landroidx/navigation/NavGraph;
    .param p2, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p3, "contentAlignment"    # Landroidx/compose/ui/Alignment;
    .param p4, "enterTransition"    # Lkotlin/jvm/functions/Function1;
    .param p5, "exitTransition"    # Lkotlin/jvm/functions/Function1;
    .param p6, "popEnterTransition"    # Lkotlin/jvm/functions/Function1;
    .param p7, "popExitTransition"    # Lkotlin/jvm/functions/Function1;
    .param p8, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p9, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/navigation/NavHostController;",
            "Landroidx/navigation/NavGraph;",
            "Landroidx/compose/ui/Modifier;",
            "Landroidx/compose/ui/Alignment;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation/NavBackStackEntry;",
            ">;+",
            "Landroidx/compose/animation/EnterTransition;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation/NavBackStackEntry;",
            ">;+",
            "Landroidx/compose/animation/ExitTransition;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation/NavBackStackEntry;",
            ">;+",
            "Landroidx/compose/animation/EnterTransition;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation/NavBackStackEntry;",
            ">;+",
            "Landroidx/compose/animation/ExitTransition;",
            ">;",
            "Landroidx/compose/runtime/Composer;",
            "II)V"
        }
    .end annotation

    .line 196
    move-object/from16 v1, p0

    move/from16 v10, p10

    const v0, -0x6c5f682b

    move-object/from16 v2, p8

    invoke-interface {v2, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v11

    .end local p8    # "$composer":Landroidx/compose/runtime/Composer;
    .local v11, "$composer":Landroidx/compose/runtime/Composer;
    const-string v2, "C(NavHost)P(5,3,4)197@8123L7,*198@8199L7,213@8790L16,215@8812L83,219@8901L172,225@9105L29,227@9194L16,230@9299L186,240@9580L42,334@14081L27:NavHost.kt#opm8kd"

    invoke-static {v11, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v2, p9

    .local v2, "$dirty":I
    and-int/lit8 v3, v10, 0x4

    if-eqz v3, :cond_0

    .line 186
    sget-object v3, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v3, Landroidx/compose/ui/Modifier;

    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "modifier":Landroidx/compose/ui/Modifier;
    goto :goto_0

    .line 196
    .end local v3    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p2    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_0
    move-object/from16 v3, p2

    .line 186
    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v3    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_0
    and-int/lit8 v4, v10, 0x8

    if-eqz v4, :cond_1

    .line 187
    sget-object v4, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v4}, Landroidx/compose/ui/Alignment$Companion;->getCenter()Landroidx/compose/ui/Alignment;

    move-result-object v4

    .end local p3    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .local v4, "contentAlignment":Landroidx/compose/ui/Alignment;
    goto :goto_1

    .line 186
    .end local v4    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .restart local p3    # "contentAlignment":Landroidx/compose/ui/Alignment;
    :cond_1
    move-object/from16 v4, p3

    .line 187
    .end local p3    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .restart local v4    # "contentAlignment":Landroidx/compose/ui/Alignment;
    :goto_1
    and-int/lit8 v5, v10, 0x10

    if-eqz v5, :cond_2

    .line 189
    sget-object v5, Landroidx/navigation/compose/NavHostKt$NavHost$8;->INSTANCE:Landroidx/navigation/compose/NavHostKt$NavHost$8;

    check-cast v5, Lkotlin/jvm/functions/Function1;

    .end local p4    # "enterTransition":Lkotlin/jvm/functions/Function1;
    .local v5, "enterTransition":Lkotlin/jvm/functions/Function1;
    goto :goto_2

    .line 187
    .end local v5    # "enterTransition":Lkotlin/jvm/functions/Function1;
    .restart local p4    # "enterTransition":Lkotlin/jvm/functions/Function1;
    :cond_2
    move-object/from16 v5, p4

    .line 189
    .end local p4    # "enterTransition":Lkotlin/jvm/functions/Function1;
    .restart local v5    # "enterTransition":Lkotlin/jvm/functions/Function1;
    :goto_2
    and-int/lit8 v6, v10, 0x20

    if-eqz v6, :cond_3

    .line 191
    sget-object v6, Landroidx/navigation/compose/NavHostKt$NavHost$9;->INSTANCE:Landroidx/navigation/compose/NavHostKt$NavHost$9;

    check-cast v6, Lkotlin/jvm/functions/Function1;

    .end local p5    # "exitTransition":Lkotlin/jvm/functions/Function1;
    .local v6, "exitTransition":Lkotlin/jvm/functions/Function1;
    goto :goto_3

    .line 189
    .end local v6    # "exitTransition":Lkotlin/jvm/functions/Function1;
    .restart local p5    # "exitTransition":Lkotlin/jvm/functions/Function1;
    :cond_3
    move-object/from16 v6, p5

    .line 191
    .end local p5    # "exitTransition":Lkotlin/jvm/functions/Function1;
    .restart local v6    # "exitTransition":Lkotlin/jvm/functions/Function1;
    :goto_3
    and-int/lit8 v7, v10, 0x40

    if-eqz v7, :cond_4

    .line 193
    move-object v7, v5

    .end local p6    # "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .local v7, "popEnterTransition":Lkotlin/jvm/functions/Function1;
    const v8, -0x380001

    and-int/2addr v2, v8

    goto :goto_4

    .line 191
    .end local v7    # "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .restart local p6    # "popEnterTransition":Lkotlin/jvm/functions/Function1;
    :cond_4
    move-object/from16 v7, p6

    .line 193
    .end local p6    # "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .restart local v7    # "popEnterTransition":Lkotlin/jvm/functions/Function1;
    :goto_4
    and-int/lit16 v8, v10, 0x80

    if-eqz v8, :cond_5

    .line 195
    move-object v8, v6

    .end local p7    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    .local v8, "popExitTransition":Lkotlin/jvm/functions/Function1;
    const v9, -0x1c00001

    and-int/2addr v2, v9

    move v12, v2

    goto :goto_5

    .line 193
    .end local v8    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    .restart local p7    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    :cond_5
    move-object/from16 v8, p7

    move v12, v2

    .line 195
    .end local v2    # "$dirty":I
    .end local p7    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    .restart local v8    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    .local v12, "$dirty":I
    :goto_5
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 196
    const/4 v2, -0x1

    const-string v9, "androidx.navigation.compose.NavHost (NavHost.kt:195)"

    invoke-static {v0, v12, v2, v9}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 198
    :cond_6
    invoke-static {}, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->getLocalLifecycleOwner()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v0

    check-cast v0, Landroidx/compose/runtime/CompositionLocal;

    .local v0, "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    const/4 v2, 0x0

    .local v2, "$changed$iv":I
    const/4 v9, 0x0

    .line 395
    .local v9, "$i$f$getCurrent":I
    const v13, 0x789c5f52

    const-string v14, "CC:CompositionLocal.kt#9igjgp"

    invoke-static {v11, v13, v14}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v11, v0}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object v13

    invoke-static {v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 198
    .end local v0    # "this_$iv":Landroidx/compose/runtime/CompositionLocal;
    .end local v2    # "$changed$iv":I
    .end local v9    # "$i$f$getCurrent":I
    check-cast v13, Landroidx/lifecycle/LifecycleOwner;

    .line 199
    .local v13, "lifecycleOwner":Landroidx/lifecycle/LifecycleOwner;
    sget-object v0, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->INSTANCE:Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;

    sget v2, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->$stable:I

    invoke-virtual {v0, v11, v2}, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->getCurrent(Landroidx/compose/runtime/Composer;I)Landroidx/lifecycle/ViewModelStoreOwner;

    move-result-object v0

    if-eqz v0, :cond_1b

    move-object v14, v0

    .line 203
    .local v14, "viewModelStoreOwner":Landroidx/lifecycle/ViewModelStoreOwner;
    invoke-interface {v14}, Landroidx/lifecycle/ViewModelStoreOwner;->getViewModelStore()Landroidx/lifecycle/ViewModelStore;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroidx/navigation/NavHostController;->setViewModelStore(Landroidx/lifecycle/ViewModelStore;)V

    .line 206
    invoke-virtual/range {p0 .. p1}, Landroidx/navigation/NavHostController;->setGraph(Landroidx/navigation/NavGraph;)V

    .line 210
    invoke-virtual {v1}, Landroidx/navigation/NavHostController;->getNavigatorProvider()Landroidx/navigation/NavigatorProvider;

    move-result-object v0

    .line 211
    nop

    .line 210
    nop

    .local v0, "$this$get$iv":Landroidx/navigation/NavigatorProvider;
    const-string v2, "composable"

    .local v2, "name$iv":Ljava/lang/String;
    const/4 v9, 0x0

    .line 396
    .local v9, "$i$f$get":I
    invoke-virtual {v0, v2}, Landroidx/navigation/NavigatorProvider;->getNavigator(Ljava/lang/String;)Landroidx/navigation/Navigator;

    move-result-object v0

    .line 210
    .end local v0    # "$this$get$iv":Landroidx/navigation/NavigatorProvider;
    .end local v2    # "name$iv":Ljava/lang/String;
    .end local v9    # "$i$f$get":I
    instance-of v2, v0, Landroidx/navigation/compose/ComposeNavigator;

    const/4 v15, 0x0

    if-eqz v2, :cond_7

    check-cast v0, Landroidx/navigation/compose/ComposeNavigator;

    goto :goto_6

    :cond_7
    move-object v0, v15

    :goto_6
    if-nez v0, :cond_a

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_8
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v15

    if-nez v15, :cond_9

    move-object v10, v1

    move-object v1, v5

    move-object v2, v6

    move-object v6, v8

    move-object v5, v4

    move-object v4, v7

    goto :goto_7

    :cond_9
    new-instance v0, Landroidx/navigation/compose/NavHostKt$NavHost$composeNavigator$1;

    move-object/from16 v2, p1

    move/from16 v9, p9

    invoke-direct/range {v0 .. v10}, Landroidx/navigation/compose/NavHostKt$NavHost$composeNavigator$1;-><init>(Landroidx/navigation/NavHostController;Landroidx/navigation/NavGraph;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;II)V

    move-object v10, v1

    move-object v1, v5

    move-object v2, v6

    move-object v6, v8

    move-object v5, v4

    move-object v4, v7

    .end local v7    # "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .end local v8    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    .local v1, "enterTransition":Lkotlin/jvm/functions/Function1;
    .local v2, "exitTransition":Lkotlin/jvm/functions/Function1;
    .local v4, "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .local v5, "contentAlignment":Landroidx/compose/ui/Alignment;
    .local v6, "popExitTransition":Lkotlin/jvm/functions/Function1;
    check-cast v0, Lkotlin/jvm/functions/Function2;

    invoke-interface {v15, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    .line 212
    :goto_7
    return-void

    .line 210
    .end local v1    # "enterTransition":Lkotlin/jvm/functions/Function1;
    .end local v2    # "exitTransition":Lkotlin/jvm/functions/Function1;
    .local v4, "contentAlignment":Landroidx/compose/ui/Alignment;
    .local v5, "enterTransition":Lkotlin/jvm/functions/Function1;
    .local v6, "exitTransition":Lkotlin/jvm/functions/Function1;
    .restart local v7    # "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .restart local v8    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    :cond_a
    move-object v10, v1

    move-object v1, v5

    move-object v2, v6

    move-object v6, v8

    move-object v5, v4

    move-object v4, v7

    .line 214
    .end local v7    # "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .end local v8    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    .local v0, "composeNavigator":Landroidx/navigation/compose/ComposeNavigator;
    .restart local v1    # "enterTransition":Lkotlin/jvm/functions/Function1;
    .restart local v2    # "exitTransition":Lkotlin/jvm/functions/Function1;
    .local v4, "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .local v5, "contentAlignment":Landroidx/compose/ui/Alignment;
    .local v6, "popExitTransition":Lkotlin/jvm/functions/Function1;
    invoke-virtual {v0}, Landroidx/navigation/compose/ComposeNavigator;->getBackStack()Lkotlinx/coroutines/flow/StateFlow;

    move-result-object v7

    const/16 v8, 0x8

    const/4 v9, 0x1

    invoke-static {v7, v15, v11, v8, v9}, Landroidx/compose/runtime/SnapshotStateKt;->collectAsState(Lkotlinx/coroutines/flow/StateFlow;Lkotlin/coroutines/CoroutineContext;Landroidx/compose/runtime/Composer;II)Landroidx/compose/runtime/State;

    move-result-object v16

    .line 216
    .local v16, "currentBackStack$delegate":Landroidx/compose/runtime/State;
    invoke-static/range {v16 .. v16}, Landroidx/navigation/compose/NavHostKt;->NavHost$lambda$3(Landroidx/compose/runtime/State;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    const/4 v15, 0x0

    if-le v7, v9, :cond_b

    move v7, v9

    goto :goto_8

    :cond_b
    move v7, v15

    :goto_8
    new-instance v9, Landroidx/navigation/compose/NavHostKt$NavHost$10;

    invoke-direct {v9, v10}, Landroidx/navigation/compose/NavHostKt$NavHost$10;-><init>(Landroidx/navigation/NavHostController;)V

    check-cast v9, Lkotlin/jvm/functions/Function0;

    invoke-static {v7, v9, v11, v15, v15}, Landroidx/activity/compose/BackHandlerKt;->BackHandler(ZLkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;II)V

    .line 220
    new-instance v7, Landroidx/navigation/compose/NavHostKt$NavHost$11;

    invoke-direct {v7, v10, v13}, Landroidx/navigation/compose/NavHostKt$NavHost$11;-><init>(Landroidx/navigation/NavHostController;Landroidx/lifecycle/LifecycleOwner;)V

    check-cast v7, Lkotlin/jvm/functions/Function1;

    invoke-static {v13, v7, v11, v8}, Landroidx/compose/runtime/EffectsKt;->DisposableEffect(Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V

    .line 226
    invoke-static {v11, v15}, Landroidx/compose/runtime/saveable/SaveableStateHolderKt;->rememberSaveableStateHolder(Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/saveable/SaveableStateHolder;

    move-result-object v7

    .line 228
    .local v7, "saveableStateHolder":Landroidx/compose/runtime/saveable/SaveableStateHolder;
    invoke-virtual {v10}, Landroidx/navigation/NavHostController;->getVisibleEntries()Lkotlinx/coroutines/flow/StateFlow;

    move-result-object v9

    move-object/from16 p8, v3

    move/from16 v18, v15

    const/4 v3, 0x1

    const/4 v15, 0x0

    .end local v3    # "modifier":Landroidx/compose/ui/Modifier;
    .local p8, "modifier":Landroidx/compose/ui/Modifier;
    invoke-static {v9, v15, v11, v8, v3}, Landroidx/compose/runtime/SnapshotStateKt;->collectAsState(Lkotlinx/coroutines/flow/StateFlow;Lkotlin/coroutines/CoroutineContext;Landroidx/compose/runtime/Composer;II)Landroidx/compose/runtime/State;

    move-result-object v8

    .line 231
    .local v8, "allVisibleEntries$delegate":Landroidx/compose/runtime/State;
    move/from16 v3, v18

    .local v3, "$changed$iv":I
    const/4 v9, 0x0

    .local v9, "$i$f$remember":I
    const v15, -0x1d58f75c

    invoke-interface {v11, v15}, Landroidx/compose/runtime/Composer;->startReplaceableGroup(I)V

    const-string v15, "CC(remember):Composables.kt#9igjgp"

    invoke-static {v11, v15}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 397
    const/16 v20, 0x0

    .local v20, "invalid$iv$iv":Z
    move-object/from16 p3, v11

    .local p3, "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    const/16 v21, 0x0

    .line 398
    .local v21, "$i$f$cache":I
    move/from16 p4, v3

    .end local v3    # "$changed$iv":I
    .local p4, "$changed$iv":I
    invoke-interface/range {p3 .. p3}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v3

    .local v3, "it$iv$iv":Ljava/lang/Object;
    const/16 v22, 0x0

    .line 399
    .local v22, "$i$a$-let-ComposerKt$cache$1$iv$iv":I
    sget-object v23, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 v24, v5

    .end local v5    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .local v24, "contentAlignment":Landroidx/compose/ui/Alignment;
    invoke-virtual/range {v23 .. v23}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v5

    if-ne v3, v5, :cond_c

    .line 400
    const/4 v5, 0x0

    .line 232
    .local v5, "$i$a$-remember-NavHostKt$NavHost$visibleEntries$2":I
    move-object/from16 p5, v3

    .end local v3    # "it$iv$iv":Ljava/lang/Object;
    .local p5, "it$iv$iv":Ljava/lang/Object;
    new-instance v3, Landroidx/navigation/compose/NavHostKt$NavHost$visibleEntries$2$1;

    invoke-direct {v3, v8}, Landroidx/navigation/compose/NavHostKt$NavHost$visibleEntries$2$1;-><init>(Landroidx/compose/runtime/State;)V

    check-cast v3, Lkotlin/jvm/functions/Function0;

    invoke-static {v3}, Landroidx/compose/runtime/SnapshotStateKt;->derivedStateOf(Lkotlin/jvm/functions/Function0;)Landroidx/compose/runtime/State;

    move-result-object v3

    .line 400
    .end local v5    # "$i$a$-remember-NavHostKt$NavHost$visibleEntries$2":I
    nop

    .line 401
    .local v3, "value$iv$iv":Ljava/lang/Object;
    move-object/from16 v5, p3

    .end local p3    # "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    .local v5, "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    invoke-interface {v5, v3}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 402
    nop

    .end local v3    # "value$iv$iv":Ljava/lang/Object;
    goto :goto_9

    .line 403
    .end local v5    # "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    .end local p5    # "it$iv$iv":Ljava/lang/Object;
    .local v3, "it$iv$iv":Ljava/lang/Object;
    .restart local p3    # "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    :cond_c
    move-object/from16 v5, p3

    move-object/from16 p5, v3

    .line 399
    .end local v3    # "it$iv$iv":Ljava/lang/Object;
    .end local p3    # "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    .restart local v5    # "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    .restart local p5    # "it$iv$iv":Ljava/lang/Object;
    :goto_9
    nop

    .line 398
    .end local v22    # "$i$a$-let-ComposerKt$cache$1$iv$iv":I
    .end local p5    # "it$iv$iv":Ljava/lang/Object;
    nop

    .line 397
    .end local v5    # "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v20    # "invalid$iv$iv":Z
    .end local v21    # "$i$f$cache":I
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->endReplaceableGroup()V

    .line 231
    .end local v9    # "$i$f$remember":I
    .end local p4    # "$changed$iv":I
    check-cast v3, Landroidx/compose/runtime/State;

    .line 239
    .local v3, "visibleEntries$delegate":Landroidx/compose/runtime/State;
    invoke-static {v3}, Landroidx/navigation/compose/NavHostKt;->NavHost$lambda$6(Landroidx/compose/runtime/State;)Ljava/util/List;

    move-result-object v5

    invoke-static {v5}, Lkotlin/collections/CollectionsKt;->lastOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/navigation/NavBackStackEntry;

    .line 241
    .local v5, "backStackEntry":Landroidx/navigation/NavBackStackEntry;
    move/from16 v9, v18

    .local v9, "$changed$iv":I
    const/16 v20, 0x0

    move-object/from16 p7, v3

    const v3, -0x1d58f75c

    .end local v3    # "visibleEntries$delegate":Landroidx/compose/runtime/State;
    .local v20, "$i$f$remember":I
    .local p7, "visibleEntries$delegate":Landroidx/compose/runtime/State;
    invoke-interface {v11, v3}, Landroidx/compose/runtime/Composer;->startReplaceableGroup(I)V

    invoke-static {v11, v15}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 404
    const/4 v3, 0x0

    .local v3, "invalid$iv$iv":Z
    move-object v15, v11

    .local v15, "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    const/16 v21, 0x0

    .line 405
    .restart local v21    # "$i$f$cache":I
    move/from16 p2, v3

    .end local v3    # "invalid$iv$iv":Z
    .local p2, "invalid$iv$iv":Z
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v3

    .local v3, "it$iv$iv":Ljava/lang/Object;
    const/16 v22, 0x0

    .line 406
    .restart local v22    # "$i$a$-let-ComposerKt$cache$1$iv$iv":I
    sget-object v23, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 v25, v8

    .end local v8    # "allVisibleEntries$delegate":Landroidx/compose/runtime/State;
    .local v25, "allVisibleEntries$delegate":Landroidx/compose/runtime/State;
    invoke-virtual/range {v23 .. v23}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v8

    if-ne v3, v8, :cond_d

    .line 407
    const/4 v8, 0x0

    .line 241
    .local v8, "$i$a$-remember-NavHostKt$NavHost$zIndices$1":I
    new-instance v23, Ljava/util/LinkedHashMap;

    invoke-direct/range {v23 .. v23}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v23, Ljava/util/Map;

    .line 407
    .end local v8    # "$i$a$-remember-NavHostKt$NavHost$zIndices$1":I
    move-object/from16 v8, v23

    .line 408
    .local v8, "value$iv$iv":Ljava/lang/Object;
    invoke-interface {v15, v8}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 409
    nop

    .end local v8    # "value$iv$iv":Ljava/lang/Object;
    goto :goto_a

    .line 410
    :cond_d
    move-object v8, v3

    .line 406
    :goto_a
    nop

    .line 405
    .end local v3    # "it$iv$iv":Ljava/lang/Object;
    .end local v22    # "$i$a$-let-ComposerKt$cache$1$iv$iv":I
    nop

    .line 404
    .end local v15    # "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v21    # "$i$f$cache":I
    .end local p2    # "invalid$iv$iv":Z
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->endReplaceableGroup()V

    .line 241
    .end local v9    # "$changed$iv":I
    .end local v20    # "$i$f$remember":I
    move-object v3, v8

    check-cast v3, Ljava/util/Map;

    .local v3, "zIndices":Ljava/util/Map;
    const v8, 0x6c9c3aa2

    invoke-interface {v11, v8}, Landroidx/compose/runtime/Composer;->startReplaceableGroup(I)V

    const-string v8, "243@9756L577,257@10431L577,271@11035L49,272@11104L2105,310@13218L441,320@13691L182,320@13668L205"

    invoke-static {v11, v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 243
    if-eqz v5, :cond_14

    shr-int/lit8 v8, v12, 0xf

    and-int/lit8 v8, v8, 0x70

    shr-int/lit8 v9, v12, 0x6

    and-int/lit16 v9, v9, 0x380

    or-int/2addr v8, v9

    .line 244
    nop

    .local v8, "$changed$iv":I
    const/4 v9, 0x0

    .local v9, "$i$f$remember":I
    const v15, 0x607fb4c4

    invoke-interface {v11, v15}, Landroidx/compose/runtime/Composer;->startReplaceableGroup(I)V

    const-string v15, "CC(remember)P(1,2,3):Composables.kt#9igjgp"

    invoke-static {v11, v15}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 411
    invoke-interface {v11, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v20

    .line 412
    invoke-interface {v11, v4}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v21

    .line 411
    or-int v20, v20, v21

    .line 413
    invoke-interface {v11, v1}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v21

    .line 411
    or-int v20, v20, v21

    .line 414
    nop

    .local v20, "invalid$iv$iv":Z
    move-object/from16 p3, v11

    .restart local p3    # "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    const/16 v21, 0x0

    .line 415
    .restart local v21    # "$i$f$cache":I
    move-object/from16 p4, v3

    .end local v3    # "zIndices":Ljava/util/Map;
    .local p4, "zIndices":Ljava/util/Map;
    invoke-interface/range {p3 .. p3}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v3

    .local v3, "it$iv$iv":Ljava/lang/Object;
    const/16 v22, 0x0

    .line 416
    .restart local v22    # "$i$a$-let-ComposerKt$cache$1$iv$iv":I
    if-nez v20, :cond_f

    sget-object v23, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 p5, v8

    .end local v8    # "$changed$iv":I
    .local p5, "$changed$iv":I
    invoke-virtual/range {v23 .. v23}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v8

    if-ne v3, v8, :cond_e

    goto :goto_b

    .line 420
    :cond_e
    move-object/from16 v8, p3

    move-object/from16 p6, v3

    goto :goto_c

    .line 416
    .end local p5    # "$changed$iv":I
    .restart local v8    # "$changed$iv":I
    :cond_f
    move/from16 p5, v8

    .line 417
    .end local v8    # "$changed$iv":I
    .restart local p5    # "$changed$iv":I
    :goto_b
    const/4 v8, 0x0

    .line 244
    .local v8, "$i$a$-remember-NavHostKt$NavHost$finalEnter$1":I
    move-object/from16 p6, v3

    .end local v3    # "it$iv$iv":Ljava/lang/Object;
    .local p6, "it$iv$iv":Ljava/lang/Object;
    new-instance v3, Landroidx/navigation/compose/NavHostKt$NavHost$finalEnter$1$1;

    invoke-direct {v3, v0, v4, v1}, Landroidx/navigation/compose/NavHostKt$NavHost$finalEnter$1$1;-><init>(Landroidx/navigation/compose/ComposeNavigator;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    check-cast v3, Lkotlin/jvm/functions/Function1;

    .line 417
    .end local v8    # "$i$a$-remember-NavHostKt$NavHost$finalEnter$1":I
    nop

    .line 418
    .local v3, "value$iv$iv":Ljava/lang/Object;
    move-object/from16 v8, p3

    .end local p3    # "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    .local v8, "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    invoke-interface {v8, v3}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 419
    nop

    .line 416
    .end local v3    # "value$iv$iv":Ljava/lang/Object;
    :goto_c
    nop

    .line 415
    .end local v22    # "$i$a$-let-ComposerKt$cache$1$iv$iv":I
    .end local p6    # "it$iv$iv":Ljava/lang/Object;
    nop

    .line 414
    .end local v8    # "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v20    # "invalid$iv$iv":Z
    .end local v21    # "$i$f$cache":I
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->endReplaceableGroup()V

    .line 244
    .end local v9    # "$i$f$remember":I
    .end local p5    # "$changed$iv":I
    check-cast v3, Lkotlin/jvm/functions/Function1;

    .local v3, "finalEnter":Lkotlin/jvm/functions/Function1;
    shr-int/lit8 v8, v12, 0x12

    and-int/lit8 v8, v8, 0x70

    shr-int/lit8 v9, v12, 0x9

    and-int/lit16 v9, v9, 0x380

    or-int/2addr v8, v9

    .line 258
    nop

    .local v8, "$changed$iv":I
    const/4 v9, 0x0

    move-object/from16 v20, v1

    const v1, 0x607fb4c4

    .end local v1    # "enterTransition":Lkotlin/jvm/functions/Function1;
    .restart local v9    # "$i$f$remember":I
    .local v20, "enterTransition":Lkotlin/jvm/functions/Function1;
    invoke-interface {v11, v1}, Landroidx/compose/runtime/Composer;->startReplaceableGroup(I)V

    invoke-static {v11, v15}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 421
    invoke-interface {v11, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v1

    .line 422
    invoke-interface {v11, v6}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v15

    .line 421
    or-int/2addr v1, v15

    .line 423
    invoke-interface {v11, v2}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v15

    .line 421
    or-int/2addr v1, v15

    .line 424
    move-object v15, v11

    .local v1, "invalid$iv$iv":Z
    .restart local v15    # "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    const/16 v21, 0x0

    .line 425
    .restart local v21    # "$i$f$cache":I
    move/from16 p2, v1

    .end local v1    # "invalid$iv$iv":Z
    .restart local p2    # "invalid$iv$iv":Z
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v1

    .local v1, "it$iv$iv":Ljava/lang/Object;
    const/16 v22, 0x0

    .line 426
    .restart local v22    # "$i$a$-let-ComposerKt$cache$1$iv$iv":I
    if-nez p2, :cond_11

    sget-object v23, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 p5, v3

    .end local v3    # "finalEnter":Lkotlin/jvm/functions/Function1;
    .local p5, "finalEnter":Lkotlin/jvm/functions/Function1;
    invoke-virtual/range {v23 .. v23}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v3

    if-ne v1, v3, :cond_10

    goto :goto_d

    .line 430
    :cond_10
    move-object/from16 p3, v1

    goto :goto_e

    .line 426
    .end local p5    # "finalEnter":Lkotlin/jvm/functions/Function1;
    .restart local v3    # "finalEnter":Lkotlin/jvm/functions/Function1;
    :cond_11
    move-object/from16 p5, v3

    .line 427
    .end local v3    # "finalEnter":Lkotlin/jvm/functions/Function1;
    .restart local p5    # "finalEnter":Lkotlin/jvm/functions/Function1;
    :goto_d
    const/4 v3, 0x0

    .line 258
    .local v3, "$i$a$-remember-NavHostKt$NavHost$finalExit$1":I
    move-object/from16 p3, v1

    .end local v1    # "it$iv$iv":Ljava/lang/Object;
    .local p3, "it$iv$iv":Ljava/lang/Object;
    new-instance v1, Landroidx/navigation/compose/NavHostKt$NavHost$finalExit$1$1;

    invoke-direct {v1, v0, v6, v2}, Landroidx/navigation/compose/NavHostKt$NavHost$finalExit$1$1;-><init>(Landroidx/navigation/compose/ComposeNavigator;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    check-cast v1, Lkotlin/jvm/functions/Function1;

    .line 427
    .end local v3    # "$i$a$-remember-NavHostKt$NavHost$finalExit$1":I
    nop

    .line 428
    .local v1, "value$iv$iv":Ljava/lang/Object;
    invoke-interface {v15, v1}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 429
    nop

    .line 426
    .end local v1    # "value$iv$iv":Ljava/lang/Object;
    :goto_e
    nop

    .line 425
    .end local v22    # "$i$a$-let-ComposerKt$cache$1$iv$iv":I
    .end local p3    # "it$iv$iv":Ljava/lang/Object;
    nop

    .line 424
    .end local v15    # "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v21    # "$i$f$cache":I
    .end local p2    # "invalid$iv$iv":Z
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->endReplaceableGroup()V

    .line 258
    .end local v8    # "$changed$iv":I
    .end local v9    # "$i$f$remember":I
    check-cast v1, Lkotlin/jvm/functions/Function1;

    .line 272
    .local v1, "finalExit":Lkotlin/jvm/functions/Function1;
    const-string v3, "entry"

    const/16 v8, 0x38

    move/from16 v9, v18

    invoke-static {v5, v3, v11, v8, v9}, Landroidx/compose/animation/core/TransitionKt;->updateTransition(Ljava/lang/Object;Ljava/lang/String;Landroidx/compose/runtime/Composer;II)Landroidx/compose/animation/core/Transition;

    move-result-object v3

    .line 273
    .local v3, "transition":Landroidx/compose/animation/core/Transition;
    nop

    .line 274
    nop

    .line 273
    new-instance v8, Landroidx/navigation/compose/NavHostKt$NavHost$12;

    move-object/from16 p3, p4

    move-object/from16 p4, v0

    move-object/from16 p6, v1

    move-object/from16 p2, v8

    .end local v0    # "composeNavigator":Landroidx/navigation/compose/ComposeNavigator;
    .end local v1    # "finalExit":Lkotlin/jvm/functions/Function1;
    .local p3, "zIndices":Ljava/util/Map;
    .local p4, "composeNavigator":Landroidx/navigation/compose/ComposeNavigator;
    .local p6, "finalExit":Lkotlin/jvm/functions/Function1;
    invoke-direct/range {p2 .. p7}, Landroidx/navigation/compose/NavHostKt$NavHost$12;-><init>(Ljava/util/Map;Landroidx/navigation/compose/ComposeNavigator;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/State;)V

    move-object/from16 v1, p2

    move-object/from16 v21, p3

    move-object/from16 v22, p5

    move-object/from16 v23, p6

    move-object/from16 v15, p7

    .end local p3    # "zIndices":Ljava/util/Map;
    .end local p4    # "composeNavigator":Landroidx/navigation/compose/ComposeNavigator;
    .end local p5    # "finalEnter":Lkotlin/jvm/functions/Function1;
    .end local p6    # "finalExit":Lkotlin/jvm/functions/Function1;
    .end local p7    # "visibleEntries$delegate":Landroidx/compose/runtime/State;
    .restart local v0    # "composeNavigator":Landroidx/navigation/compose/ComposeNavigator;
    .local v15, "visibleEntries$delegate":Landroidx/compose/runtime/State;
    .local v21, "zIndices":Ljava/util/Map;
    .local v22, "finalEnter":Lkotlin/jvm/functions/Function1;
    .local v23, "finalExit":Lkotlin/jvm/functions/Function1;
    move-object v8, v1

    check-cast v8, Lkotlin/jvm/functions/Function1;

    .line 293
    nop

    .line 273
    sget-object v1, Landroidx/navigation/compose/NavHostKt$NavHost$13;->INSTANCE:Landroidx/navigation/compose/NavHostKt$NavHost$13;

    check-cast v1, Lkotlin/jvm/functions/Function1;

    .line 295
    new-instance v9, Landroidx/navigation/compose/NavHostKt$NavHost$14;

    invoke-direct {v9, v7, v15}, Landroidx/navigation/compose/NavHostKt$NavHost$14;-><init>(Landroidx/compose/runtime/saveable/SaveableStateHolder;Landroidx/compose/runtime/State;)V

    .end local v0    # "composeNavigator":Landroidx/navigation/compose/ComposeNavigator;
    .restart local p4    # "composeNavigator":Landroidx/navigation/compose/ComposeNavigator;
    const v0, -0x55d59677

    move-object/from16 p2, v1

    const/4 v1, 0x1

    invoke-static {v11, v0, v1, v9}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambda(Landroidx/compose/runtime/Composer;IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    check-cast v0, Lkotlin/jvm/functions/Function4;

    shr-int/lit8 v9, v12, 0x3

    and-int/lit8 v9, v9, 0x70

    const v17, 0x36000

    or-int v9, v9, v17

    and-int/lit16 v1, v12, 0x1c00

    or-int/2addr v1, v9

    .line 273
    const/4 v9, 0x0

    move-object/from16 v17, v8

    move v8, v1

    move-object v1, v3

    move-object/from16 v3, v17

    move-object/from16 v17, v11

    move-object v11, v4

    move-object/from16 v4, v24

    move-object/from16 v24, v7

    move-object/from16 v7, v17

    move-object/from16 v26, v5

    move-object/from16 v17, v6

    const/16 v27, 0x1

    move-object/from16 v5, p2

    move-object v6, v0

    move-object v0, v2

    move-object/from16 v2, p8

    .end local v3    # "transition":Landroidx/compose/animation/core/Transition;
    .end local v5    # "backStackEntry":Landroidx/navigation/NavBackStackEntry;
    .end local v6    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    .end local p8    # "modifier":Landroidx/compose/ui/Modifier;
    .local v0, "exitTransition":Lkotlin/jvm/functions/Function1;
    .local v1, "transition":Landroidx/compose/animation/core/Transition;
    .local v2, "modifier":Landroidx/compose/ui/Modifier;
    .local v4, "contentAlignment":Landroidx/compose/ui/Alignment;
    .local v7, "$composer":Landroidx/compose/runtime/Composer;
    .local v11, "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .local v17, "popExitTransition":Lkotlin/jvm/functions/Function1;
    .local v24, "saveableStateHolder":Landroidx/compose/runtime/saveable/SaveableStateHolder;
    .local v26, "backStackEntry":Landroidx/navigation/NavBackStackEntry;
    invoke-static/range {v1 .. v9}, Landroidx/compose/animation/AnimatedContentKt;->AnimatedContent(Landroidx/compose/animation/core/Transition;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function1;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;Landroidx/compose/runtime/Composer;II)V

    .line 311
    move-object v3, v2

    move-object v2, v1

    move-object v1, v7

    .end local v7    # "$composer":Landroidx/compose/runtime/Composer;
    .local v1, "$composer":Landroidx/compose/runtime/Composer;
    .local v2, "transition":Landroidx/compose/animation/core/Transition;
    .local v3, "modifier":Landroidx/compose/ui/Modifier;
    invoke-virtual {v2}, Landroidx/compose/animation/core/Transition;->getCurrentState()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v2}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v6

    new-instance v7, Landroidx/navigation/compose/NavHostKt$NavHost$15;

    const/4 v8, 0x0

    move-object/from16 p6, p4

    move-object/from16 p3, v2

    move-object/from16 p2, v7

    move-object/from16 p7, v8

    move-object/from16 p5, v15

    move-object/from16 p4, v21

    .end local v2    # "transition":Landroidx/compose/animation/core/Transition;
    .end local v15    # "visibleEntries$delegate":Landroidx/compose/runtime/State;
    .end local v21    # "zIndices":Ljava/util/Map;
    .local p3, "transition":Landroidx/compose/animation/core/Transition;
    .local p4, "zIndices":Ljava/util/Map;
    .local p5, "visibleEntries$delegate":Landroidx/compose/runtime/State;
    .local p6, "composeNavigator":Landroidx/navigation/compose/ComposeNavigator;
    invoke-direct/range {p2 .. p7}, Landroidx/navigation/compose/NavHostKt$NavHost$15;-><init>(Landroidx/compose/animation/core/Transition;Ljava/util/Map;Landroidx/compose/runtime/State;Landroidx/navigation/compose/ComposeNavigator;Lkotlin/coroutines/Continuation;)V

    move-object/from16 v8, p2

    move-object/from16 v7, p3

    move-object/from16 v2, p5

    move-object/from16 v15, p6

    .end local p3    # "transition":Landroidx/compose/animation/core/Transition;
    .end local p4    # "zIndices":Ljava/util/Map;
    .end local p5    # "visibleEntries$delegate":Landroidx/compose/runtime/State;
    .end local p6    # "composeNavigator":Landroidx/navigation/compose/ComposeNavigator;
    .local v2, "visibleEntries$delegate":Landroidx/compose/runtime/State;
    .local v7, "transition":Landroidx/compose/animation/core/Transition;
    .local v15, "composeNavigator":Landroidx/navigation/compose/ComposeNavigator;
    .restart local v21    # "zIndices":Ljava/util/Map;
    check-cast v8, Lkotlin/jvm/functions/Function2;

    const/16 v9, 0x248

    invoke-static {v5, v6, v8, v1, v9}, Landroidx/compose/runtime/EffectsKt;->LaunchedEffect(Ljava/lang/Object;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V

    .line 321
    invoke-static/range {v27 .. v27}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    const/4 v6, 0x6

    .local v6, "$changed$iv":I
    const/4 v8, 0x0

    .local v8, "$i$f$remember":I
    const v9, 0x1e7b2b64

    invoke-interface {v1, v9}, Landroidx/compose/runtime/Composer;->startReplaceableGroup(I)V

    const-string v9, "CC(remember)P(1,2):Composables.kt#9igjgp"

    invoke-static {v1, v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 431
    invoke-interface {v1, v2}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v9

    invoke-interface {v1, v15}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v27

    or-int v9, v9, v27

    .line 432
    move-object/from16 p2, v1

    .local v9, "invalid$iv$iv":Z
    .local p2, "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    const/16 v27, 0x0

    .line 433
    .local v27, "$i$f$cache":I
    move-object/from16 p3, v0

    .end local v0    # "exitTransition":Lkotlin/jvm/functions/Function1;
    .local p3, "exitTransition":Lkotlin/jvm/functions/Function1;
    invoke-interface/range {p2 .. p2}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v0

    .local v0, "it$iv$iv":Ljava/lang/Object;
    const/16 v28, 0x0

    .line 434
    .local v28, "$i$a$-let-ComposerKt$cache$1$iv$iv":I
    if-nez v9, :cond_13

    sget-object v29, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 p8, v3

    .end local v3    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p8    # "modifier":Landroidx/compose/ui/Modifier;
    invoke-virtual/range {v29 .. v29}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v3

    if-ne v0, v3, :cond_12

    goto :goto_f

    .line 438
    :cond_12
    move-object/from16 v3, p2

    move-object/from16 p4, v0

    goto :goto_10

    .line 434
    .end local p8    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v3    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_13
    move-object/from16 p8, v3

    .line 435
    .end local v3    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p8    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_f
    const/4 v3, 0x0

    .line 321
    .local v3, "$i$a$-remember-NavHostKt$NavHost$16":I
    move-object/from16 p4, v0

    .end local v0    # "it$iv$iv":Ljava/lang/Object;
    .local p4, "it$iv$iv":Ljava/lang/Object;
    new-instance v0, Landroidx/navigation/compose/NavHostKt$NavHost$16$1;

    invoke-direct {v0, v2, v15}, Landroidx/navigation/compose/NavHostKt$NavHost$16$1;-><init>(Landroidx/compose/runtime/State;Landroidx/navigation/compose/ComposeNavigator;)V

    check-cast v0, Lkotlin/jvm/functions/Function1;

    .line 435
    .end local v3    # "$i$a$-remember-NavHostKt$NavHost$16":I
    nop

    .line 436
    .local v0, "value$iv$iv":Ljava/lang/Object;
    move-object/from16 v3, p2

    .end local p2    # "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    .local v3, "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 437
    nop

    .line 434
    .end local v0    # "value$iv$iv":Ljava/lang/Object;
    :goto_10
    nop

    .line 433
    .end local v28    # "$i$a$-let-ComposerKt$cache$1$iv$iv":I
    .end local p4    # "it$iv$iv":Ljava/lang/Object;
    nop

    .line 432
    .end local v3    # "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v9    # "invalid$iv$iv":Z
    .end local v27    # "$i$f$cache":I
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->endReplaceableGroup()V

    .end local v6    # "$changed$iv":I
    .end local v8    # "$i$f$remember":I
    check-cast v0, Lkotlin/jvm/functions/Function1;

    .line 321
    const/4 v3, 0x6

    invoke-static {v5, v0, v1, v3}, Landroidx/compose/runtime/EffectsKt;->DisposableEffect(Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V

    goto :goto_11

    .line 243
    .end local v15    # "composeNavigator":Landroidx/navigation/compose/ComposeNavigator;
    .end local v17    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    .end local v20    # "enterTransition":Lkotlin/jvm/functions/Function1;
    .end local v21    # "zIndices":Ljava/util/Map;
    .end local v22    # "finalEnter":Lkotlin/jvm/functions/Function1;
    .end local v23    # "finalExit":Lkotlin/jvm/functions/Function1;
    .end local v26    # "backStackEntry":Landroidx/navigation/NavBackStackEntry;
    .end local p3    # "exitTransition":Lkotlin/jvm/functions/Function1;
    .local v0, "composeNavigator":Landroidx/navigation/compose/ComposeNavigator;
    .local v1, "enterTransition":Lkotlin/jvm/functions/Function1;
    .local v2, "exitTransition":Lkotlin/jvm/functions/Function1;
    .local v3, "zIndices":Ljava/util/Map;
    .local v4, "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .restart local v5    # "backStackEntry":Landroidx/navigation/NavBackStackEntry;
    .local v6, "popExitTransition":Lkotlin/jvm/functions/Function1;
    .local v7, "saveableStateHolder":Landroidx/compose/runtime/saveable/SaveableStateHolder;
    .local v11, "$composer":Landroidx/compose/runtime/Composer;
    .local v24, "contentAlignment":Landroidx/compose/ui/Alignment;
    .restart local p7    # "visibleEntries$delegate":Landroidx/compose/runtime/State;
    :cond_14
    move-object v15, v0

    move-object/from16 v20, v1

    move-object/from16 p3, v2

    move-object/from16 v21, v3

    move-object/from16 v26, v5

    move-object/from16 v17, v6

    move-object v1, v11

    move-object/from16 v2, p7

    move-object v11, v4

    move-object/from16 v4, v24

    move-object/from16 v24, v7

    .line 321
    .end local v0    # "composeNavigator":Landroidx/navigation/compose/ComposeNavigator;
    .end local v3    # "zIndices":Ljava/util/Map;
    .end local v5    # "backStackEntry":Landroidx/navigation/NavBackStackEntry;
    .end local v6    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    .end local v7    # "saveableStateHolder":Landroidx/compose/runtime/saveable/SaveableStateHolder;
    .end local p7    # "visibleEntries$delegate":Landroidx/compose/runtime/State;
    .local v1, "$composer":Landroidx/compose/runtime/Composer;
    .local v2, "visibleEntries$delegate":Landroidx/compose/runtime/State;
    .local v4, "contentAlignment":Landroidx/compose/ui/Alignment;
    .local v11, "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .restart local v15    # "composeNavigator":Landroidx/navigation/compose/ComposeNavigator;
    .restart local v17    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    .restart local v20    # "enterTransition":Lkotlin/jvm/functions/Function1;
    .restart local v21    # "zIndices":Ljava/util/Map;
    .local v24, "saveableStateHolder":Landroidx/compose/runtime/saveable/SaveableStateHolder;
    .restart local v26    # "backStackEntry":Landroidx/navigation/NavBackStackEntry;
    .restart local p3    # "exitTransition":Lkotlin/jvm/functions/Function1;
    :goto_11
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->endReplaceableGroup()V

    .line 330
    invoke-virtual {v10}, Landroidx/navigation/NavHostController;->getNavigatorProvider()Landroidx/navigation/NavigatorProvider;

    move-result-object v0

    .line 331
    nop

    .line 330
    const-string v3, "dialog"

    .local v0, "$this$get$iv":Landroidx/navigation/NavigatorProvider;
    .local v3, "name$iv":Ljava/lang/String;
    const/4 v5, 0x0

    .line 439
    .local v5, "$i$f$get":I
    invoke-virtual {v0, v3}, Landroidx/navigation/NavigatorProvider;->getNavigator(Ljava/lang/String;)Landroidx/navigation/Navigator;

    move-result-object v0

    .line 330
    .end local v0    # "$this$get$iv":Landroidx/navigation/NavigatorProvider;
    .end local v3    # "name$iv":Ljava/lang/String;
    .end local v5    # "$i$f$get":I
    instance-of v3, v0, Landroidx/navigation/compose/DialogNavigator;

    if-eqz v3, :cond_15

    check-cast v0, Landroidx/navigation/compose/DialogNavigator;

    goto :goto_12

    :cond_15
    const/4 v0, 0x0

    :goto_12
    if-nez v0, :cond_18

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_16
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v0

    if-nez v0, :cond_17

    move-object/from16 v6, p3

    move-object/from16 v3, p8

    move-object v7, v11

    move/from16 v19, v12

    move-object/from16 v8, v17

    move-object/from16 v5, v20

    move-object v11, v1

    move-object/from16 v17, v2

    goto :goto_13

    :cond_17
    move-object v3, v0

    new-instance v0, Landroidx/navigation/compose/NavHostKt$NavHost$dialogNavigator$1;

    move-object/from16 v6, p3

    move/from16 v9, p9

    move-object v7, v11

    move/from16 v19, v12

    move-object/from16 v8, v17

    move-object/from16 v5, v20

    move-object v11, v1

    move-object/from16 v17, v2

    move-object v12, v3

    move-object v1, v10

    move-object/from16 v2, p1

    move-object/from16 v3, p8

    move/from16 v10, p10

    .end local v1    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v2    # "visibleEntries$delegate":Landroidx/compose/runtime/State;
    .end local v12    # "$dirty":I
    .end local v20    # "enterTransition":Lkotlin/jvm/functions/Function1;
    .end local p3    # "exitTransition":Lkotlin/jvm/functions/Function1;
    .end local p8    # "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "modifier":Landroidx/compose/ui/Modifier;
    .local v5, "enterTransition":Lkotlin/jvm/functions/Function1;
    .local v6, "exitTransition":Lkotlin/jvm/functions/Function1;
    .local v7, "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .local v8, "popExitTransition":Lkotlin/jvm/functions/Function1;
    .local v11, "$composer":Landroidx/compose/runtime/Composer;
    .local v17, "visibleEntries$delegate":Landroidx/compose/runtime/State;
    .local v19, "$dirty":I
    invoke-direct/range {v0 .. v10}, Landroidx/navigation/compose/NavHostKt$NavHost$dialogNavigator$1;-><init>(Landroidx/navigation/NavHostController;Landroidx/navigation/NavGraph;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;II)V

    check-cast v0, Lkotlin/jvm/functions/Function2;

    invoke-interface {v12, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    .line 332
    :goto_13
    return-void

    .line 330
    .end local v3    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v5    # "enterTransition":Lkotlin/jvm/functions/Function1;
    .end local v6    # "exitTransition":Lkotlin/jvm/functions/Function1;
    .end local v7    # "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .end local v8    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    .end local v19    # "$dirty":I
    .restart local v1    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v2    # "visibleEntries$delegate":Landroidx/compose/runtime/State;
    .local v11, "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .restart local v12    # "$dirty":I
    .local v17, "popExitTransition":Lkotlin/jvm/functions/Function1;
    .restart local v20    # "enterTransition":Lkotlin/jvm/functions/Function1;
    .restart local p3    # "exitTransition":Lkotlin/jvm/functions/Function1;
    .restart local p8    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_18
    move-object/from16 v6, p3

    move-object/from16 v3, p8

    move-object v7, v11

    move/from16 v19, v12

    move-object/from16 v8, v17

    move-object/from16 v5, v20

    move-object v11, v1

    move-object/from16 v17, v2

    .end local v1    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v2    # "visibleEntries$delegate":Landroidx/compose/runtime/State;
    .end local v12    # "$dirty":I
    .end local v20    # "enterTransition":Lkotlin/jvm/functions/Function1;
    .end local p3    # "exitTransition":Lkotlin/jvm/functions/Function1;
    .end local p8    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v3    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v5    # "enterTransition":Lkotlin/jvm/functions/Function1;
    .restart local v6    # "exitTransition":Lkotlin/jvm/functions/Function1;
    .restart local v7    # "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .restart local v8    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    .local v11, "$composer":Landroidx/compose/runtime/Composer;
    .local v17, "visibleEntries$delegate":Landroidx/compose/runtime/State;
    .restart local v19    # "$dirty":I
    move-object v12, v0

    .line 335
    .local v12, "dialogNavigator":Landroidx/navigation/compose/DialogNavigator;
    const/4 v9, 0x0

    invoke-static {v12, v11, v9}, Landroidx/navigation/compose/DialogHostKt;->DialogHost(Landroidx/navigation/compose/DialogNavigator;Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_19
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v0

    if-nez v0, :cond_1a

    move-object/from16 v18, v11

    goto :goto_14

    :cond_1a
    move-object v1, v0

    new-instance v0, Landroidx/navigation/compose/NavHostKt$NavHost$17;

    move-object/from16 v2, p1

    move/from16 v9, p9

    move/from16 v10, p10

    move-object/from16 v18, v11

    move-object v11, v1

    move-object/from16 v1, p0

    .end local v11    # "$composer":Landroidx/compose/runtime/Composer;
    .local v18, "$composer":Landroidx/compose/runtime/Composer;
    invoke-direct/range {v0 .. v10}, Landroidx/navigation/compose/NavHostKt$NavHost$17;-><init>(Landroidx/navigation/NavHostController;Landroidx/navigation/NavGraph;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;II)V

    check-cast v0, Lkotlin/jvm/functions/Function2;

    invoke-interface {v11, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    .line 336
    :goto_14
    return-void

    .line 199
    .end local v14    # "viewModelStoreOwner":Landroidx/lifecycle/ViewModelStoreOwner;
    .end local v15    # "composeNavigator":Landroidx/navigation/compose/ComposeNavigator;
    .end local v16    # "currentBackStack$delegate":Landroidx/compose/runtime/State;
    .end local v17    # "visibleEntries$delegate":Landroidx/compose/runtime/State;
    .end local v18    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v19    # "$dirty":I
    .end local v21    # "zIndices":Ljava/util/Map;
    .end local v24    # "saveableStateHolder":Landroidx/compose/runtime/saveable/SaveableStateHolder;
    .end local v25    # "allVisibleEntries$delegate":Landroidx/compose/runtime/State;
    .end local v26    # "backStackEntry":Landroidx/navigation/NavBackStackEntry;
    .restart local v11    # "$composer":Landroidx/compose/runtime/Composer;
    .local v12, "$dirty":I
    :cond_1b
    const/4 v0, 0x0

    .line 200
    .local v0, "$i$a$-checkNotNull-NavHostKt$NavHost$viewModelStoreOwner$1":I
    nop

    .line 199
    .end local v0    # "$i$a$-checkNotNull-NavHostKt$NavHost$viewModelStoreOwner$1":I
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "NavHost requires a ViewModelStoreOwner to be provided via LocalViewModelStoreOwner"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final NavHost(Landroidx/navigation/NavHostController;Ljava/lang/String;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V
    .locals 24
    .param p0, "navController"    # Landroidx/navigation/NavHostController;
    .param p1, "startDestination"    # Ljava/lang/String;
    .param p2, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p3, "contentAlignment"    # Landroidx/compose/ui/Alignment;
    .param p4, "route"    # Ljava/lang/String;
    .param p5, "enterTransition"    # Lkotlin/jvm/functions/Function1;
    .param p6, "exitTransition"    # Lkotlin/jvm/functions/Function1;
    .param p7, "popEnterTransition"    # Lkotlin/jvm/functions/Function1;
    .param p8, "popExitTransition"    # Lkotlin/jvm/functions/Function1;
    .param p9, "builder"    # Lkotlin/jvm/functions/Function1;
    .param p10, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p11, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/navigation/NavHostController;",
            "Ljava/lang/String;",
            "Landroidx/compose/ui/Modifier;",
            "Landroidx/compose/ui/Alignment;",
            "Ljava/lang/String;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation/NavBackStackEntry;",
            ">;+",
            "Landroidx/compose/animation/EnterTransition;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation/NavBackStackEntry;",
            ">;+",
            "Landroidx/compose/animation/ExitTransition;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation/NavBackStackEntry;",
            ">;+",
            "Landroidx/compose/animation/EnterTransition;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation/NavBackStackEntry;",
            ">;+",
            "Landroidx/compose/animation/ExitTransition;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/navigation/NavGraphBuilder;",
            "Lkotlin/Unit;",
            ">;",
            "Landroidx/compose/runtime/Composer;",
            "II)V"
        }
    .end annotation

    .line 127
    move-object/from16 v2, p1

    move-object/from16 v10, p9

    move/from16 v12, p12

    const v0, 0x1876b5e3

    move-object/from16 v1, p10

    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v1

    .end local p10    # "$composer":Landroidx/compose/runtime/Composer;
    .local v1, "$composer":Landroidx/compose/runtime/Composer;
    const-string v3, "C(NavHost)P(5,9,4,1,8,2,3,6,7)129@5380L126,127@5340L320:NavHost.kt#opm8kd"

    invoke-static {v1, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v3, p11

    .local v3, "$dirty":I
    and-int/lit8 v4, v12, 0x4

    if-eqz v4, :cond_0

    .line 115
    sget-object v4, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v4, Landroidx/compose/ui/Modifier;

    move-object v15, v4

    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .local v4, "modifier":Landroidx/compose/ui/Modifier;
    goto :goto_0

    .line 127
    .end local v4    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p2    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_0
    move-object/from16 v15, p2

    .line 115
    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .local v15, "modifier":Landroidx/compose/ui/Modifier;
    :goto_0
    and-int/lit8 v4, v12, 0x8

    if-eqz v4, :cond_1

    .line 116
    sget-object v4, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v4}, Landroidx/compose/ui/Alignment$Companion;->getCenter()Landroidx/compose/ui/Alignment;

    move-result-object v4

    .end local p3    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .local v4, "contentAlignment":Landroidx/compose/ui/Alignment;
    goto :goto_1

    .line 115
    .end local v4    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .restart local p3    # "contentAlignment":Landroidx/compose/ui/Alignment;
    :cond_1
    move-object/from16 v4, p3

    .line 116
    .end local p3    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .restart local v4    # "contentAlignment":Landroidx/compose/ui/Alignment;
    :goto_1
    and-int/lit8 v5, v12, 0x10

    if-eqz v5, :cond_2

    .line 117
    const/4 v5, 0x0

    .end local p4    # "route":Ljava/lang/String;
    .local v5, "route":Ljava/lang/String;
    goto :goto_2

    .line 116
    .end local v5    # "route":Ljava/lang/String;
    .restart local p4    # "route":Ljava/lang/String;
    :cond_2
    move-object/from16 v5, p4

    .line 117
    .end local p4    # "route":Ljava/lang/String;
    .restart local v5    # "route":Ljava/lang/String;
    :goto_2
    and-int/lit8 v6, v12, 0x20

    if-eqz v6, :cond_3

    .line 119
    sget-object v6, Landroidx/navigation/compose/NavHostKt$NavHost$3;->INSTANCE:Landroidx/navigation/compose/NavHostKt$NavHost$3;

    check-cast v6, Lkotlin/jvm/functions/Function1;

    .end local p5    # "enterTransition":Lkotlin/jvm/functions/Function1;
    .local v6, "enterTransition":Lkotlin/jvm/functions/Function1;
    goto :goto_3

    .line 117
    .end local v6    # "enterTransition":Lkotlin/jvm/functions/Function1;
    .restart local p5    # "enterTransition":Lkotlin/jvm/functions/Function1;
    :cond_3
    move-object/from16 v6, p5

    .line 119
    .end local p5    # "enterTransition":Lkotlin/jvm/functions/Function1;
    .restart local v6    # "enterTransition":Lkotlin/jvm/functions/Function1;
    :goto_3
    and-int/lit8 v7, v12, 0x40

    if-eqz v7, :cond_4

    .line 121
    sget-object v7, Landroidx/navigation/compose/NavHostKt$NavHost$4;->INSTANCE:Landroidx/navigation/compose/NavHostKt$NavHost$4;

    check-cast v7, Lkotlin/jvm/functions/Function1;

    .end local p6    # "exitTransition":Lkotlin/jvm/functions/Function1;
    .local v7, "exitTransition":Lkotlin/jvm/functions/Function1;
    goto :goto_4

    .line 119
    .end local v7    # "exitTransition":Lkotlin/jvm/functions/Function1;
    .restart local p6    # "exitTransition":Lkotlin/jvm/functions/Function1;
    :cond_4
    move-object/from16 v7, p6

    .line 121
    .end local p6    # "exitTransition":Lkotlin/jvm/functions/Function1;
    .restart local v7    # "exitTransition":Lkotlin/jvm/functions/Function1;
    :goto_4
    and-int/lit16 v8, v12, 0x80

    if-eqz v8, :cond_5

    .line 123
    move-object v8, v6

    .end local p7    # "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .local v8, "popEnterTransition":Lkotlin/jvm/functions/Function1;
    const v9, -0x1c00001

    and-int/2addr v3, v9

    move-object/from16 v19, v8

    goto :goto_5

    .line 121
    .end local v8    # "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .restart local p7    # "popEnterTransition":Lkotlin/jvm/functions/Function1;
    :cond_5
    move-object/from16 v19, p7

    .line 123
    .end local p7    # "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .local v19, "popEnterTransition":Lkotlin/jvm/functions/Function1;
    :goto_5
    and-int/lit16 v8, v12, 0x100

    if-eqz v8, :cond_6

    .line 125
    move-object v8, v7

    .end local p8    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    .local v8, "popExitTransition":Lkotlin/jvm/functions/Function1;
    const v9, -0xe000001

    and-int/2addr v3, v9

    move-object/from16 v20, v8

    goto :goto_6

    .line 123
    .end local v8    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    .restart local p8    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    :cond_6
    move-object/from16 v20, p8

    .line 125
    .end local p8    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    .local v20, "popExitTransition":Lkotlin/jvm/functions/Function1;
    :goto_6
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v8

    if-eqz v8, :cond_7

    .line 127
    const/4 v8, -0x1

    const-string v9, "androidx.navigation.compose.NavHost (NavHost.kt:126)"

    invoke-static {v0, v3, v8, v9}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 129
    :cond_7
    shr-int/lit8 v0, v3, 0xc

    and-int/lit8 v0, v0, 0xe

    and-int/lit8 v8, v3, 0x70

    or-int/2addr v0, v8

    shr-int/lit8 v8, v3, 0x15

    and-int/lit16 v8, v8, 0x380

    or-int/2addr v0, v8

    .line 130
    nop

    .local v0, "$changed$iv":I
    const/4 v8, 0x0

    .local v8, "$i$f$remember":I
    const v9, 0x607fb4c4

    invoke-interface {v1, v9}, Landroidx/compose/runtime/Composer;->startReplaceableGroup(I)V

    const-string v9, "CC(remember)P(1,2,3):Composables.kt#9igjgp"

    invoke-static {v1, v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 382
    invoke-interface {v1, v5}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v9

    .line 383
    invoke-interface {v1, v2}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v11

    .line 382
    or-int/2addr v9, v11

    .line 384
    invoke-interface {v1, v10}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v11

    .line 382
    or-int/2addr v9, v11

    .line 385
    move-object v11, v1

    .local v9, "invalid$iv$iv":Z
    .local v11, "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    const/4 v13, 0x0

    .line 386
    .local v13, "$i$f$cache":I
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v14

    .local v14, "it$iv$iv":Ljava/lang/Object;
    const/16 v16, 0x0

    .line 387
    .local v16, "$i$a$-let-ComposerKt$cache$1$iv$iv":I
    if-nez v9, :cond_9

    sget-object v17, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 p2, v0

    .end local v0    # "$changed$iv":I
    .local p2, "$changed$iv":I
    invoke-virtual/range {v17 .. v17}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v0

    if-ne v14, v0, :cond_8

    goto :goto_7

    .line 394
    :cond_8
    move-object/from16 p10, v1

    move-object v0, v14

    goto :goto_8

    .line 387
    .end local p2    # "$changed$iv":I
    .restart local v0    # "$changed$iv":I
    :cond_9
    move/from16 p2, v0

    .line 388
    .end local v0    # "$changed$iv":I
    .restart local p2    # "$changed$iv":I
    :goto_7
    const/4 v0, 0x0

    .line 131
    .local v0, "$i$a$-remember-NavHostKt$NavHost$5":I
    move-object/from16 v17, p0

    check-cast v17, Landroidx/navigation/NavController;

    .local v17, "$this$createGraph$iv":Landroidx/navigation/NavController;
    const/16 v18, 0x0

    .line 389
    .local v18, "$i$f$createGraph":I
    move/from16 p3, v0

    .end local v0    # "$i$a$-remember-NavHostKt$NavHost$5":I
    .local p3, "$i$a$-remember-NavHostKt$NavHost$5":I
    invoke-virtual/range {v17 .. v17}, Landroidx/navigation/NavController;->getNavigatorProvider()Landroidx/navigation/NavigatorProvider;

    move-result-object v0

    .local v0, "$this$navigation$iv$iv":Landroidx/navigation/NavigatorProvider;
    const/16 v21, 0x0

    .line 390
    .local v21, "$i$f$navigation":I
    move-object/from16 p10, v1

    .end local v1    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local p10    # "$composer":Landroidx/compose/runtime/Composer;
    new-instance v1, Landroidx/navigation/NavGraphBuilder;

    invoke-direct {v1, v0, v2, v5}, Landroidx/navigation/NavGraphBuilder;-><init>(Landroidx/navigation/NavigatorProvider;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v10, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    invoke-virtual {v1}, Landroidx/navigation/NavGraphBuilder;->build()Landroidx/navigation/NavGraph;

    move-result-object v0

    .line 389
    .end local v0    # "$this$navigation$iv$iv":Landroidx/navigation/NavigatorProvider;
    .end local v21    # "$i$f$navigation":I
    nop

    .line 131
    .end local v17    # "$this$createGraph$iv":Landroidx/navigation/NavController;
    .end local v18    # "$i$f$createGraph":I
    nop

    .line 388
    .end local p3    # "$i$a$-remember-NavHostKt$NavHost$5":I
    nop

    .line 392
    .local v0, "value$iv$iv":Ljava/lang/Object;
    invoke-interface {v11, v0}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 393
    nop

    .line 387
    .end local v0    # "value$iv$iv":Ljava/lang/Object;
    :goto_8
    nop

    .line 386
    .end local v14    # "it$iv$iv":Ljava/lang/Object;
    .end local v16    # "$i$a$-let-ComposerKt$cache$1$iv$iv":I
    nop

    .line 385
    .end local v9    # "invalid$iv$iv":Z
    .end local v11    # "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v13    # "$i$f$cache":I
    invoke-interface/range {p10 .. p10}, Landroidx/compose/runtime/Composer;->endReplaceableGroup()V

    .end local v8    # "$i$f$remember":I
    .end local p2    # "$changed$iv":I
    move-object v14, v0

    check-cast v14, Landroidx/navigation/NavGraph;

    .line 133
    nop

    .line 134
    nop

    .line 135
    nop

    .line 136
    nop

    .line 137
    nop

    .line 138
    and-int/lit16 v0, v3, 0x380

    or-int/lit8 v0, v0, 0x48

    and-int/lit16 v1, v3, 0x1c00

    or-int/2addr v0, v1

    shr-int/lit8 v1, v3, 0x3

    const v8, 0xe000

    and-int/2addr v1, v8

    or-int/2addr v0, v1

    shr-int/lit8 v1, v3, 0x3

    const/high16 v8, 0x70000

    and-int/2addr v1, v8

    or-int/2addr v0, v1

    shr-int/lit8 v1, v3, 0x3

    const/high16 v8, 0x380000

    and-int/2addr v1, v8

    or-int/2addr v0, v1

    const/high16 v1, 0x1c00000

    shr-int/lit8 v8, v3, 0x3

    and-int/2addr v1, v8

    or-int v22, v0, v1

    .line 128
    const/16 v23, 0x0

    move-object/from16 v13, p0

    move-object/from16 v21, p10

    move-object/from16 v16, v4

    move-object/from16 v17, v6

    move-object/from16 v18, v7

    .end local v4    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .end local v6    # "enterTransition":Lkotlin/jvm/functions/Function1;
    .end local v7    # "exitTransition":Lkotlin/jvm/functions/Function1;
    .end local p10    # "$composer":Landroidx/compose/runtime/Composer;
    .local v16, "contentAlignment":Landroidx/compose/ui/Alignment;
    .local v17, "enterTransition":Lkotlin/jvm/functions/Function1;
    .local v18, "exitTransition":Lkotlin/jvm/functions/Function1;
    .local v21, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v13 .. v23}, Landroidx/navigation/compose/NavHostKt;->NavHost(Landroidx/navigation/NavHostController;Landroidx/navigation/NavGraph;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V

    .end local v16    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .end local v17    # "enterTransition":Lkotlin/jvm/functions/Function1;
    .end local v18    # "exitTransition":Lkotlin/jvm/functions/Function1;
    .restart local v4    # "contentAlignment":Landroidx/compose/ui/Alignment;
    .restart local v6    # "enterTransition":Lkotlin/jvm/functions/Function1;
    .restart local v7    # "exitTransition":Lkotlin/jvm/functions/Function1;
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_a
    invoke-interface/range {v21 .. v21}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v13

    if-nez v13, :cond_b

    move v14, v3

    goto :goto_9

    :cond_b
    new-instance v0, Landroidx/navigation/compose/NavHostKt$NavHost$6;

    move-object/from16 v1, p0

    move/from16 v11, p11

    move v14, v3

    move-object v3, v15

    move-object/from16 v8, v19

    move-object/from16 v9, v20

    .end local v15    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v19    # "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .end local v20    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    .local v3, "modifier":Landroidx/compose/ui/Modifier;
    .local v8, "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .local v9, "popExitTransition":Lkotlin/jvm/functions/Function1;
    .local v14, "$dirty":I
    invoke-direct/range {v0 .. v12}, Landroidx/navigation/compose/NavHostKt$NavHost$6;-><init>(Landroidx/navigation/NavHostController;Ljava/lang/String;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;II)V

    .end local v3    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v8    # "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .end local v9    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    .restart local v15    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v19    # "popEnterTransition":Lkotlin/jvm/functions/Function1;
    .restart local v20    # "popExitTransition":Lkotlin/jvm/functions/Function1;
    check-cast v0, Lkotlin/jvm/functions/Function2;

    invoke-interface {v13, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    .line 140
    :goto_9
    return-void
.end method

.method public static final synthetic NavHost(Landroidx/navigation/NavHostController;Ljava/lang/String;Landroidx/compose/ui/Modifier;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V
    .locals 17
    .param p0, "navController"    # Landroidx/navigation/NavHostController;
    .param p1, "startDestination"    # Ljava/lang/String;
    .param p2, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p3, "route"    # Ljava/lang/String;
    .param p4, "builder"    # Lkotlin/jvm/functions/Function1;
    .param p5, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p6, "$changed"    # I
    .annotation runtime Lkotlin/Deprecated;
        level = .enum Lkotlin/DeprecationLevel;->HIDDEN:Lkotlin/DeprecationLevel;
        message = "Deprecated in favor of NavHost that supports AnimatedContent"
    .end annotation

    .line 81
    move-object/from16 v2, p1

    move-object/from16 v5, p4

    const v0, 0x8741dc0

    move-object/from16 v1, p5

    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v14

    .end local p5    # "$composer":Landroidx/compose/runtime/Composer;
    .local v14, "$composer":Landroidx/compose/runtime/Composer;
    const-string v1, "C(NavHost)P(2,4,1,3)83@3291L126,81@3251L190:NavHost.kt#opm8kd"

    invoke-static {v14, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v1, p6

    .local v1, "$dirty":I
    and-int/lit8 v3, p7, 0x4

    if-eqz v3, :cond_0

    .line 78
    sget-object v3, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v3, Landroidx/compose/ui/Modifier;

    move-object v8, v3

    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "modifier":Landroidx/compose/ui/Modifier;
    goto :goto_0

    .line 81
    .end local v3    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p2    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_0
    move-object/from16 v8, p2

    .line 78
    .end local p2    # "modifier":Landroidx/compose/ui/Modifier;
    .local v8, "modifier":Landroidx/compose/ui/Modifier;
    :goto_0
    and-int/lit8 v3, p7, 0x8

    if-eqz v3, :cond_1

    .line 79
    const/4 v3, 0x0

    move-object v4, v3

    .end local p3    # "route":Ljava/lang/String;
    .local v3, "route":Ljava/lang/String;
    goto :goto_1

    .line 78
    .end local v3    # "route":Ljava/lang/String;
    .restart local p3    # "route":Ljava/lang/String;
    :cond_1
    move-object/from16 v4, p3

    .line 79
    .end local p3    # "route":Ljava/lang/String;
    .local v4, "route":Ljava/lang/String;
    :goto_1
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 81
    const/4 v3, -0x1

    const-string v6, "androidx.navigation.compose.NavHost (NavHost.kt:80)"

    invoke-static {v0, v1, v3, v6}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 83
    :cond_2
    shr-int/lit8 v0, v1, 0x9

    and-int/lit8 v0, v0, 0xe

    and-int/lit8 v3, v1, 0x70

    or-int/2addr v0, v3

    shr-int/lit8 v3, v1, 0x6

    and-int/lit16 v3, v3, 0x380

    or-int/2addr v0, v3

    .line 84
    nop

    .local v0, "$changed$iv":I
    const/4 v3, 0x0

    .local v3, "$i$f$remember":I
    const v6, 0x607fb4c4

    invoke-interface {v14, v6}, Landroidx/compose/runtime/Composer;->startReplaceableGroup(I)V

    const-string v6, "CC(remember)P(1,2,3):Composables.kt#9igjgp"

    invoke-static {v14, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 369
    invoke-interface {v14, v4}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v6

    .line 370
    invoke-interface {v14, v2}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v7

    .line 369
    or-int/2addr v6, v7

    .line 371
    invoke-interface {v14, v5}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v7

    .line 369
    or-int/2addr v6, v7

    .line 372
    nop

    .local v6, "invalid$iv$iv":Z
    move-object v7, v14

    .local v7, "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    const/4 v9, 0x0

    .line 373
    .local v9, "$i$f$cache":I
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v10

    .local v10, "it$iv$iv":Ljava/lang/Object;
    const/4 v11, 0x0

    .line 374
    .local v11, "$i$a$-let-ComposerKt$cache$1$iv$iv":I
    if-nez v6, :cond_4

    sget-object v12, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v12}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v12

    if-ne v10, v12, :cond_3

    goto :goto_2

    .line 381
    :cond_3
    move/from16 p2, v0

    move/from16 p3, v3

    move-object v0, v10

    goto :goto_3

    .line 375
    :cond_4
    :goto_2
    const/4 v12, 0x0

    .line 85
    .local v12, "$i$a$-remember-NavHostKt$NavHost$1":I
    move-object/from16 v13, p0

    check-cast v13, Landroidx/navigation/NavController;

    .local v13, "$this$createGraph$iv":Landroidx/navigation/NavController;
    const/4 v15, 0x0

    .line 376
    .local v15, "$i$f$createGraph":I
    move/from16 p2, v0

    .end local v0    # "$changed$iv":I
    .local p2, "$changed$iv":I
    invoke-virtual {v13}, Landroidx/navigation/NavController;->getNavigatorProvider()Landroidx/navigation/NavigatorProvider;

    move-result-object v0

    .local v0, "$this$navigation$iv$iv":Landroidx/navigation/NavigatorProvider;
    const/16 v16, 0x0

    .line 377
    .local v16, "$i$f$navigation":I
    move/from16 p3, v3

    .end local v3    # "$i$f$remember":I
    .local p3, "$i$f$remember":I
    new-instance v3, Landroidx/navigation/NavGraphBuilder;

    invoke-direct {v3, v0, v2, v4}, Landroidx/navigation/NavGraphBuilder;-><init>(Landroidx/navigation/NavigatorProvider;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v5, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    invoke-virtual {v3}, Landroidx/navigation/NavGraphBuilder;->build()Landroidx/navigation/NavGraph;

    move-result-object v0

    .line 376
    .end local v0    # "$this$navigation$iv$iv":Landroidx/navigation/NavigatorProvider;
    .end local v16    # "$i$f$navigation":I
    nop

    .line 85
    .end local v13    # "$this$createGraph$iv":Landroidx/navigation/NavController;
    .end local v15    # "$i$f$createGraph":I
    nop

    .line 375
    .end local v12    # "$i$a$-remember-NavHostKt$NavHost$1":I
    nop

    .line 379
    .local v0, "value$iv$iv":Ljava/lang/Object;
    invoke-interface {v7, v0}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 380
    nop

    .line 374
    .end local v0    # "value$iv$iv":Ljava/lang/Object;
    :goto_3
    nop

    .line 373
    .end local v10    # "it$iv$iv":Ljava/lang/Object;
    .end local v11    # "$i$a$-let-ComposerKt$cache$1$iv$iv":I
    nop

    .line 372
    .end local v6    # "invalid$iv$iv":Z
    .end local v7    # "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v9    # "$i$f$cache":I
    invoke-interface {v14}, Landroidx/compose/runtime/Composer;->endReplaceableGroup()V

    .end local p2    # "$changed$iv":I
    .end local p3    # "$i$f$remember":I
    move-object v7, v0

    check-cast v7, Landroidx/navigation/NavGraph;

    .line 87
    and-int/lit16 v0, v1, 0x380

    or-int/lit8 v15, v0, 0x48

    .line 82
    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/16 v16, 0xf8

    move-object/from16 v6, p0

    invoke-static/range {v6 .. v16}, Landroidx/navigation/compose/NavHostKt;->NavHost(Landroidx/navigation/NavHostController;Landroidx/navigation/NavGraph;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_5
    invoke-interface {v14}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v9

    if-nez v9, :cond_6

    move-object v3, v8

    move v8, v1

    goto :goto_4

    :cond_6
    new-instance v0, Landroidx/navigation/compose/NavHostKt$NavHost$2;

    move/from16 v6, p6

    move/from16 v7, p7

    move-object v3, v8

    move v8, v1

    move-object/from16 v1, p0

    .end local v1    # "$dirty":I
    .local v3, "modifier":Landroidx/compose/ui/Modifier;
    .local v8, "$dirty":I
    invoke-direct/range {v0 .. v7}, Landroidx/navigation/compose/NavHostKt$NavHost$2;-><init>(Landroidx/navigation/NavHostController;Ljava/lang/String;Landroidx/compose/ui/Modifier;Ljava/lang/String;Lkotlin/jvm/functions/Function1;II)V

    check-cast v0, Lkotlin/jvm/functions/Function2;

    invoke-interface {v9, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    .line 89
    :goto_4
    return-void
.end method

.method private static final NavHost$lambda$3(Landroidx/compose/runtime/State;)Ljava/util/List;
    .locals 4
    .param p0, "$currentBackStack$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "+",
            "Ljava/util/List<",
            "Landroidx/navigation/NavBackStackEntry;",
            ">;>;)",
            "Ljava/util/List<",
            "Landroidx/navigation/NavBackStackEntry;",
            ">;"
        }
    .end annotation

    .line 214
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 440
    .local v3, "$i$f$getValue":I
    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "thisObj$iv":Ljava/lang/Object;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v3    # "$i$f$getValue":I
    check-cast v0, Ljava/util/List;

    .line 214
    return-object v0
.end method

.method private static final NavHost$lambda$4(Landroidx/compose/runtime/State;)Ljava/util/List;
    .locals 4
    .param p0, "$allVisibleEntries$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "+",
            "Ljava/util/List<",
            "Landroidx/navigation/NavBackStackEntry;",
            ">;>;)",
            "Ljava/util/List<",
            "Landroidx/navigation/NavBackStackEntry;",
            ">;"
        }
    .end annotation

    .line 228
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 441
    .local v3, "$i$f$getValue":I
    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "thisObj$iv":Ljava/lang/Object;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v3    # "$i$f$getValue":I
    check-cast v0, Ljava/util/List;

    .line 228
    return-object v0
.end method

.method private static final NavHost$lambda$6(Landroidx/compose/runtime/State;)Ljava/util/List;
    .locals 4
    .param p0, "$visibleEntries$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "+",
            "Ljava/util/List<",
            "Landroidx/navigation/NavBackStackEntry;",
            ">;>;)",
            "Ljava/util/List<",
            "Landroidx/navigation/NavBackStackEntry;",
            ">;"
        }
    .end annotation

    .line 231
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 442
    .local v3, "$i$f$getValue":I
    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "thisObj$iv":Ljava/lang/Object;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v3    # "$i$f$getValue":I
    check-cast v0, Ljava/util/List;

    .line 231
    return-object v0
.end method

.method public static final synthetic access$NavHost$lambda$4(Landroidx/compose/runtime/State;)Ljava/util/List;
    .locals 1
    .param p0, "$allVisibleEntries$delegate"    # Landroidx/compose/runtime/State;

    .line 1
    invoke-static {p0}, Landroidx/navigation/compose/NavHostKt;->NavHost$lambda$4(Landroidx/compose/runtime/State;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$NavHost$lambda$6(Landroidx/compose/runtime/State;)Ljava/util/List;
    .locals 1
    .param p0, "$visibleEntries$delegate"    # Landroidx/compose/runtime/State;

    .line 1
    invoke-static {p0}, Landroidx/navigation/compose/NavHostKt;->NavHost$lambda$6(Landroidx/compose/runtime/State;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$createEnterTransition(Landroidx/navigation/NavDestination;Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/EnterTransition;
    .locals 1
    .param p0, "$receiver"    # Landroidx/navigation/NavDestination;
    .param p1, "scope"    # Landroidx/compose/animation/AnimatedContentTransitionScope;

    .line 1
    invoke-static {p0, p1}, Landroidx/navigation/compose/NavHostKt;->createEnterTransition(Landroidx/navigation/NavDestination;Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/EnterTransition;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$createExitTransition(Landroidx/navigation/NavDestination;Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/ExitTransition;
    .locals 1
    .param p0, "$receiver"    # Landroidx/navigation/NavDestination;
    .param p1, "scope"    # Landroidx/compose/animation/AnimatedContentTransitionScope;

    .line 1
    invoke-static {p0, p1}, Landroidx/navigation/compose/NavHostKt;->createExitTransition(Landroidx/navigation/NavDestination;Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/ExitTransition;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$createPopEnterTransition(Landroidx/navigation/NavDestination;Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/EnterTransition;
    .locals 1
    .param p0, "$receiver"    # Landroidx/navigation/NavDestination;
    .param p1, "scope"    # Landroidx/compose/animation/AnimatedContentTransitionScope;

    .line 1
    invoke-static {p0, p1}, Landroidx/navigation/compose/NavHostKt;->createPopEnterTransition(Landroidx/navigation/NavDestination;Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/EnterTransition;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$createPopExitTransition(Landroidx/navigation/NavDestination;Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/ExitTransition;
    .locals 1
    .param p0, "$receiver"    # Landroidx/navigation/NavDestination;
    .param p1, "scope"    # Landroidx/compose/animation/AnimatedContentTransitionScope;

    .line 1
    invoke-static {p0, p1}, Landroidx/navigation/compose/NavHostKt;->createPopExitTransition(Landroidx/navigation/NavDestination;Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/ExitTransition;

    move-result-object v0

    return-object v0
.end method

.method private static final createEnterTransition(Landroidx/navigation/NavDestination;Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/EnterTransition;
    .locals 2
    .param p0, "$this$createEnterTransition"    # Landroidx/navigation/NavDestination;
    .param p1, "scope"    # Landroidx/compose/animation/AnimatedContentTransitionScope;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/navigation/NavDestination;",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation/NavBackStackEntry;",
            ">;)",
            "Landroidx/compose/animation/EnterTransition;"
        }
    .end annotation

    .line 340
    nop

    .line 341
    instance-of v0, p0, Landroidx/navigation/compose/ComposeNavigator$Destination;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Landroidx/navigation/compose/ComposeNavigator$Destination;

    invoke-virtual {v0}, Landroidx/navigation/compose/ComposeNavigator$Destination;->getEnterTransition$navigation_compose_release()Lkotlin/jvm/functions/Function1;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroidx/compose/animation/EnterTransition;

    goto :goto_0

    .line 342
    :cond_0
    instance-of v0, p0, Landroidx/navigation/compose/ComposeNavGraphNavigator$ComposeNavGraph;

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Landroidx/navigation/compose/ComposeNavGraphNavigator$ComposeNavGraph;

    invoke-virtual {v0}, Landroidx/navigation/compose/ComposeNavGraphNavigator$ComposeNavGraph;->getEnterTransition$navigation_compose_release()Lkotlin/jvm/functions/Function1;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroidx/compose/animation/EnterTransition;

    goto :goto_0

    .line 343
    :cond_1
    nop

    .line 344
    :cond_2
    :goto_0
    return-object v1
.end method

.method private static final createExitTransition(Landroidx/navigation/NavDestination;Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/ExitTransition;
    .locals 2
    .param p0, "$this$createExitTransition"    # Landroidx/navigation/NavDestination;
    .param p1, "scope"    # Landroidx/compose/animation/AnimatedContentTransitionScope;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/navigation/NavDestination;",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation/NavBackStackEntry;",
            ">;)",
            "Landroidx/compose/animation/ExitTransition;"
        }
    .end annotation

    .line 348
    nop

    .line 349
    instance-of v0, p0, Landroidx/navigation/compose/ComposeNavigator$Destination;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Landroidx/navigation/compose/ComposeNavigator$Destination;

    invoke-virtual {v0}, Landroidx/navigation/compose/ComposeNavigator$Destination;->getExitTransition$navigation_compose_release()Lkotlin/jvm/functions/Function1;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroidx/compose/animation/ExitTransition;

    goto :goto_0

    .line 350
    :cond_0
    instance-of v0, p0, Landroidx/navigation/compose/ComposeNavGraphNavigator$ComposeNavGraph;

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Landroidx/navigation/compose/ComposeNavGraphNavigator$ComposeNavGraph;

    invoke-virtual {v0}, Landroidx/navigation/compose/ComposeNavGraphNavigator$ComposeNavGraph;->getExitTransition$navigation_compose_release()Lkotlin/jvm/functions/Function1;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroidx/compose/animation/ExitTransition;

    goto :goto_0

    .line 351
    :cond_1
    nop

    .line 352
    :cond_2
    :goto_0
    return-object v1
.end method

.method private static final createPopEnterTransition(Landroidx/navigation/NavDestination;Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/EnterTransition;
    .locals 2
    .param p0, "$this$createPopEnterTransition"    # Landroidx/navigation/NavDestination;
    .param p1, "scope"    # Landroidx/compose/animation/AnimatedContentTransitionScope;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/navigation/NavDestination;",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation/NavBackStackEntry;",
            ">;)",
            "Landroidx/compose/animation/EnterTransition;"
        }
    .end annotation

    .line 356
    nop

    .line 357
    instance-of v0, p0, Landroidx/navigation/compose/ComposeNavigator$Destination;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Landroidx/navigation/compose/ComposeNavigator$Destination;

    invoke-virtual {v0}, Landroidx/navigation/compose/ComposeNavigator$Destination;->getPopEnterTransition$navigation_compose_release()Lkotlin/jvm/functions/Function1;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroidx/compose/animation/EnterTransition;

    goto :goto_0

    .line 358
    :cond_0
    instance-of v0, p0, Landroidx/navigation/compose/ComposeNavGraphNavigator$ComposeNavGraph;

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Landroidx/navigation/compose/ComposeNavGraphNavigator$ComposeNavGraph;

    invoke-virtual {v0}, Landroidx/navigation/compose/ComposeNavGraphNavigator$ComposeNavGraph;->getPopEnterTransition$navigation_compose_release()Lkotlin/jvm/functions/Function1;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroidx/compose/animation/EnterTransition;

    goto :goto_0

    .line 359
    :cond_1
    nop

    .line 360
    :cond_2
    :goto_0
    return-object v1
.end method

.method private static final createPopExitTransition(Landroidx/navigation/NavDestination;Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/ExitTransition;
    .locals 2
    .param p0, "$this$createPopExitTransition"    # Landroidx/navigation/NavDestination;
    .param p1, "scope"    # Landroidx/compose/animation/AnimatedContentTransitionScope;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/navigation/NavDestination;",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation/NavBackStackEntry;",
            ">;)",
            "Landroidx/compose/animation/ExitTransition;"
        }
    .end annotation

    .line 363
    nop

    .line 364
    instance-of v0, p0, Landroidx/navigation/compose/ComposeNavigator$Destination;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Landroidx/navigation/compose/ComposeNavigator$Destination;

    invoke-virtual {v0}, Landroidx/navigation/compose/ComposeNavigator$Destination;->getPopExitTransition$navigation_compose_release()Lkotlin/jvm/functions/Function1;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroidx/compose/animation/ExitTransition;

    goto :goto_0

    .line 365
    :cond_0
    instance-of v0, p0, Landroidx/navigation/compose/ComposeNavGraphNavigator$ComposeNavGraph;

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Landroidx/navigation/compose/ComposeNavGraphNavigator$ComposeNavGraph;

    invoke-virtual {v0}, Landroidx/navigation/compose/ComposeNavGraphNavigator$ComposeNavGraph;->getPopExitTransition$navigation_compose_release()Lkotlin/jvm/functions/Function1;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroidx/compose/animation/ExitTransition;

    goto :goto_0

    .line 366
    :cond_1
    nop

    .line 367
    :cond_2
    :goto_0
    return-object v1
.end method
