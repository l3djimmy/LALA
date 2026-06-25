.class public final Lcom/hardlineforge/lala/ui/screens/LalaAppKt;
.super Ljava/lang/Object;
.source "LalaApp.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nLalaApp.kt\nKotlin\n*S Kotlin\n*F\n+ 1 LalaApp.kt\ncom/hardlineforge/lala/ui/screens/LalaAppKt\n+ 2 Effects.kt\nandroidx/compose/runtime/EffectsKt\n+ 3 Composer.kt\nandroidx/compose/runtime/ComposerKt\n+ 4 Effects.kt\nandroidx/compose/runtime/EffectsKt$rememberCoroutineScope$1\n+ 5 SnapshotState.kt\nandroidx/compose/runtime/SnapshotStateKt__SnapshotStateKt\n*L\n1#1,107:1\n557#2:108\n554#2,6:109\n1247#3,3:115\n1250#3,3:119\n1247#3,6:122\n1247#3,6:128\n1247#3,6:134\n1247#3,6:140\n555#4:118\n85#5:146\n*S KotlinDebug\n*F\n+ 1 LalaApp.kt\ncom/hardlineforge/lala/ui/screens/LalaAppKt\n*L\n25#1:108\n25#1:109,6\n25#1:115,3\n25#1:119,3\n31#1:122,6\n43#1:128,6\n44#1:134,6\n56#1:140,6\n25#1:118\n88#1:146\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\u001a\r\u0010\u0000\u001a\u00020\u0001H\u0007\u00a2\u0006\u0002\u0010\u0002\u001a\u0017\u0010\u0003\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0003\u00a2\u0006\u0002\u0010\u0007\u001a\u0010\u0010\u0008\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u0004H\u0002\u00a8\u0006\n\u00b2\u0006\u000c\u0010\u000b\u001a\u0004\u0018\u00010\u000cX\u008a\u0084\u0002"
    }
    d2 = {
        "LalaApp",
        "",
        "(Landroidx/compose/runtime/Composer;I)V",
        "currentRoute",
        "",
        "navController",
        "Landroidx/navigation/NavHostController;",
        "(Landroidx/navigation/NavHostController;Landroidx/compose/runtime/Composer;I)Ljava/lang/String;",
        "routeTitle",
        "route",
        "app_debug",
        "navBackStackEntry",
        "Landroidx/navigation/NavBackStackEntry;"
    }
    k = 0x2
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final LalaApp(Landroidx/compose/runtime/Composer;I)V
    .locals 14
    .param p0, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p1, "$changed"    # I

    .line 22
    const v0, 0xf27905e

    invoke-interface {p0, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v8

    .end local p0    # "$composer":Landroidx/compose/runtime/Composer;
    .local v8, "$composer":Landroidx/compose/runtime/Composer;
    const-string p0, "C(LalaApp)22@894L23,23@940L54,24@1011L24,28@1123L178,35@1308L2323,26@1041L2590:LalaApp.kt#4cebsy"

    invoke-static {v8, p0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    const/4 p0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    move v2, p0

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    and-int/lit8 v3, p1, 0x1

    invoke-interface {v8, v2, v3}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, -0x1

    const-string v3, "com.hardlineforge.lala.ui.screens.LalaApp (LalaApp.kt:21)"

    invoke-static {v0, p1, v2, v3}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    :cond_1
    new-array v0, v1, [Landroidx/navigation/Navigator;

    .line 23
    invoke-static {v0, v8, v1}, Landroidx/navigation/compose/NavHostControllerKt;->rememberNavController([Landroidx/navigation/Navigator;Landroidx/compose/runtime/Composer;I)Landroidx/navigation/NavHostController;

    move-result-object v0

    .line 24
    .local v0, "navController":Landroidx/navigation/NavHostController;
    sget-object v2, Landroidx/compose/material3/DrawerValue;->Closed:Landroidx/compose/material3/DrawerValue;

    const/4 v3, 0x6

    const/4 v4, 0x2

    const/4 v5, 0x0

    invoke-static {v2, v5, v8, v3, v4}, Landroidx/compose/material3/NavigationDrawerKt;->rememberDrawerState(Landroidx/compose/material3/DrawerValue;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)Landroidx/compose/material3/DrawerState;

    move-result-object v3

    .line 25
    .local v3, "drawerState":Landroidx/compose/material3/DrawerState;
    nop

    .local v1, "$changed\\1":I
    move-object v2, v8

    .local v2, "$composer\\1":Landroidx/compose/runtime/Composer;
    const/4 v4, 0x0

    .line 108
    .local v4, "$i$f$rememberCoroutineScope\\1\\25":I
    const v5, 0x2e20b340

    const-string v6, "CC(rememberCoroutineScope)558@25470L68:Effects.kt#9igjgp"

    invoke-static {v2, v5, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 109
    nop

    .line 113
    move-object v5, v2

    .line 114
    .local v5, "composer\\1":Landroidx/compose/runtime/Composer;
    const v6, -0x38dffd5c

    const-string v7, "CC(remember):Effects.kt#9igjgp"

    invoke-static {v2, v6, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v6, 0x0

    .local v6, "invalid\\2":Z
    move-object v7, v2

    .local v7, "$this$cache\\2":Landroidx/compose/runtime/Composer;
    const/4 v9, 0x0

    .line 115
    .local v9, "$i$f$cache\\2\\114":I
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v10

    .local v10, "it\\2":Ljava/lang/Object;
    const/4 v11, 0x0

    .line 116
    .local v11, "$i$a$-let-ComposerKt$cache$1\\3\\115\\2":I
    sget-object v12, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v12}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v12

    if-ne v10, v12, :cond_2

    .line 117
    const/4 v12, 0x0

    .line 114
    .local v12, "$i$a$-cache-EffectsKt$rememberCoroutineScope$2\\4\\117\\1":I
    const/4 v13, 0x0

    .line 118
    .local v13, "$i$a$-rememberCoroutineScope-EffectsKt$rememberCoroutineScope$1\\5\\114\\0":I
    sget-object v13, Lkotlin/coroutines/EmptyCoroutineContext;->INSTANCE:Lkotlin/coroutines/EmptyCoroutineContext;

    .line 114
    .end local v13    # "$i$a$-rememberCoroutineScope-EffectsKt$rememberCoroutineScope$1\\5\\114\\0":I
    check-cast v13, Lkotlin/coroutines/CoroutineContext;

    invoke-static {v13, v5}, Landroidx/compose/runtime/EffectsKt;->createCompositionCoroutineScope(Lkotlin/coroutines/CoroutineContext;Landroidx/compose/runtime/Composer;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object v12

    .line 117
    .end local v12    # "$i$a$-cache-EffectsKt$rememberCoroutineScope$2\\4\\117\\1":I
    nop

    .line 119
    .local v12, "value\\3":Ljava/lang/Object;
    invoke-interface {v7, v12}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 120
    move-object v10, v12

    .end local v12    # "value\\3":Ljava/lang/Object;
    goto :goto_1

    .line 121
    :cond_2
    nop

    .line 115
    .end local v10    # "it\\2":Ljava/lang/Object;
    .end local v11    # "$i$a$-let-ComposerKt$cache$1\\3\\115\\2":I
    :goto_1
    nop

    .line 114
    .end local v6    # "invalid\\2":Z
    .end local v7    # "$this$cache\\2":Landroidx/compose/runtime/Composer;
    .end local v9    # "$i$f$cache\\2\\114":I
    check-cast v10, Lkotlinx/coroutines/CoroutineScope;

    invoke-static {v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 108
    invoke-static {v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 114
    nop

    .line 25
    .end local v1    # "$changed\\1":I
    .end local v2    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .end local v4    # "$i$f$rememberCoroutineScope\\1\\25":I
    .end local v5    # "composer\\1":Landroidx/compose/runtime/Composer;
    move-object v11, v10

    .line 29
    .local v11, "scope":Lkotlinx/coroutines/CoroutineScope;
    new-instance v1, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda15;

    invoke-direct {v1, v0, v11, v3}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda15;-><init>(Landroidx/navigation/NavHostController;Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/material3/DrawerState;)V

    const v2, 0x4ae5f425    # 7535122.5f

    const/16 v4, 0x36

    invoke-static {v2, p0, v1, v8, v4}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v1

    check-cast v1, Lkotlin/jvm/functions/Function2;

    .line 28
    nop

    .line 36
    new-instance v2, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda16;

    invoke-direct {v2, v0, v11, v3}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda16;-><init>(Landroidx/navigation/NavHostController;Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/material3/DrawerState;)V

    const v5, -0x1a5a4a00

    invoke-static {v5, p0, v2, v8, v4}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object p0

    move-object v7, p0

    check-cast v7, Lkotlin/jvm/functions/Function2;

    .line 27
    const/4 v2, 0x0

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    const v9, 0x30006

    const/16 v10, 0x1a

    invoke-static/range {v1 .. v10}, Landroidx/compose/material3/NavigationDrawerKt;->ModalNavigationDrawer-FHprtrg(Lkotlin/jvm/functions/Function2;Landroidx/compose/ui/Modifier;Landroidx/compose/material3/DrawerState;ZJLkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p0

    if-eqz p0, :cond_4

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .end local v0    # "navController":Landroidx/navigation/NavHostController;
    .end local v3    # "drawerState":Landroidx/compose/material3/DrawerState;
    .end local v11    # "scope":Lkotlinx/coroutines/CoroutineScope;
    goto :goto_2

    .line 21
    :cond_3
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 84
    :cond_4
    :goto_2
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object p0

    if-eqz p0, :cond_5

    new-instance v0, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda17;

    invoke-direct {v0, p1}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda17;-><init>(I)V

    invoke-interface {p0, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_5
    return-void
.end method

.method static final LalaApp$lambda$22(Landroidx/navigation/NavHostController;Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/material3/DrawerState;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 16
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$scope"    # Lkotlinx/coroutines/CoroutineScope;
    .param p2, "$drawerState"    # Landroidx/compose/material3/DrawerState;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    move-object/from16 v0, p0

    move-object/from16 v13, p3

    move/from16 v1, p4

    const-string v2, "C37@1349L551,50@1911L1714,36@1318L2307:LalaApp.kt#4cebsy"

    invoke-static {v13, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v2, v1, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eq v2, v3, :cond_0

    move v2, v4

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    and-int/lit8 v3, v1, 0x1

    invoke-interface {v13, v2, v3}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, -0x1

    const-string v3, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous> (LalaApp.kt:36)"

    const v5, -0x1a5a4a00

    invoke-static {v5, v1, v2, v3}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 38
    :cond_1
    new-instance v2, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda12;

    move-object/from16 v3, p1

    move-object/from16 v5, p2

    invoke-direct {v2, v0, v3, v5}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda12;-><init>(Landroidx/navigation/NavHostController;Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/material3/DrawerState;)V

    const v6, -0x8eac844

    const/16 v7, 0x36

    invoke-static {v6, v4, v2, v13, v7}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v2

    check-cast v2, Lkotlin/jvm/functions/Function2;

    .line 51
    new-instance v6, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda13;

    invoke-direct {v6, v0}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda13;-><init>(Landroidx/navigation/NavHostController;)V

    const v8, -0x4cb33b2f

    invoke-static {v8, v4, v6, v13, v7}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Lkotlin/jvm/functions/Function3;

    .line 37
    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-wide/16 v7, 0x0

    const-wide/16 v9, 0x0

    const/4 v11, 0x0

    const v14, 0x30000030

    const/16 v15, 0x1fd

    invoke-static/range {v1 .. v15}, Landroidx/compose/material3/ScaffoldKt;->Scaffold-TvnljyQ(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;IJJLandroidx/compose/foundation/layout/WindowInsets;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    .line 36
    :cond_2
    invoke-interface/range {p3 .. p3}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 83
    :cond_3
    :goto_1
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1
.end method

.method static final LalaApp$lambda$22$lambda$21(Landroidx/navigation/NavHostController;Landroidx/compose/foundation/layout/PaddingValues;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 15
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "padding"    # Landroidx/compose/foundation/layout/PaddingValues;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    move-object/from16 v0, p1

    move-object/from16 v11, p2

    const-string v1, "padding"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "C55@2106L1509,51@1936L1679:LalaApp.kt#4cebsy"

    invoke-static {v11, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v1, p3

    .local v1, "$dirty":I
    and-int/lit8 v2, p3, 0x6

    if-nez v2, :cond_1

    invoke-interface {v11, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    :goto_0
    or-int/2addr v1, v2

    :cond_1
    move v14, v1

    .end local v1    # "$dirty":I
    .local v14, "$dirty":I
    and-int/lit8 v1, v14, 0x13

    const/16 v2, 0x12

    if-eq v1, v2, :cond_2

    const/4 v1, 0x1

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    and-int/lit8 v2, v14, 0x1

    invoke-interface {v11, v1, v2}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v1, -0x1

    const-string v2, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous> (LalaApp.kt:51)"

    const v3, -0x4cb33b2f

    invoke-static {v3, v14, v1, v2}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 53
    :cond_3
    nop

    .line 54
    nop

    .line 55
    sget-object v1, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v1, Landroidx/compose/ui/Modifier;

    invoke-static {v1, v0}, Landroidx/compose/foundation/layout/PaddingKt;->padding(Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/layout/PaddingValues;)Landroidx/compose/ui/Modifier;

    move-result-object v3

    .line 56
    const v1, 0x132ef2d6

    const-string v2, "CC(remember):LalaApp.kt#9igjgp"

    invoke-static {v11, v1, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v11, p0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v1

    .local v1, "invalid\\1":Z
    move-object/from16 v2, p2

    .local v2, "$this$cache\\1":Landroidx/compose/runtime/Composer;
    const/4 v4, 0x0

    .line 140
    .local v4, "$i$f$cache\\1\\56":I
    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v5

    .local v5, "it\\1":Ljava/lang/Object;
    const/4 v6, 0x0

    .line 141
    .local v6, "$i$a$-let-ComposerKt$cache$1\\2\\140\\1":I
    if-nez v1, :cond_5

    sget-object v7, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v7}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v7

    if-ne v5, v7, :cond_4

    goto :goto_2

    .line 145
    :cond_4
    goto :goto_3

    .line 142
    :cond_5
    :goto_2
    const/4 v7, 0x0

    .line 56
    .local v7, "$i$a$-cache-LalaAppKt$LalaApp$2$2$1\\3\\142\\0":I
    new-instance v8, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda14;

    invoke-direct {v8, p0}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda14;-><init>(Landroidx/navigation/NavHostController;)V

    .line 142
    .end local v7    # "$i$a$-cache-LalaAppKt$LalaApp$2$2$1\\3\\142\\0":I
    nop

    .line 143
    .local v8, "value\\2":Ljava/lang/Object;
    invoke-interface {v2, v8}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 144
    move-object v5, v8

    .line 140
    .end local v5    # "it\\1":Ljava/lang/Object;
    .end local v6    # "$i$a$-let-ComposerKt$cache$1\\2\\140\\1":I
    .end local v8    # "value\\2":Ljava/lang/Object;
    :goto_3
    nop

    .line 56
    .end local v1    # "invalid\\1":Z
    .end local v2    # "$this$cache\\1":Landroidx/compose/runtime/Composer;
    .end local v4    # "$i$f$cache\\1\\56":I
    move-object v10, v5

    check-cast v10, Lkotlin/jvm/functions/Function1;

    invoke-static {v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 52
    const-string v2, "timeline"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/16 v12, 0x30

    const/16 v13, 0x1f8

    move-object v1, p0

    invoke-static/range {v1 .. v13}, Landroidx/navigation/compose/NavHostKt;->NavHost(Landroidx/navigation/NavHostController;Ljava/lang/String;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_4

    .line 51
    :cond_6
    invoke-interface/range {p2 .. p2}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 82
    :cond_7
    :goto_4
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1
.end method

.method static final LalaApp$lambda$22$lambda$21$lambda$20$lambda$19(Landroidx/navigation/NavHostController;Landroidx/navigation/NavGraphBuilder;)Lkotlin/Unit;
    .locals 13
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$this$NavHost"    # Landroidx/navigation/NavGraphBuilder;

    const-string v0, "$this$NavHost"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 57
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda0;-><init>(Landroidx/navigation/NavHostController;)V

    const v2, 0x484ec4af

    const/4 v12, 0x1

    invoke-static {v2, v12, v0}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lkotlin/jvm/functions/Function4;

    const/16 v10, 0x7e

    const/4 v11, 0x0

    const-string v2, "timeline"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v1, p1

    invoke-static/range {v1 .. v11}, Landroidx/navigation/compose/NavGraphBuilderKt;->composable$default(Landroidx/navigation/NavGraphBuilder;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;ILjava/lang/Object;)V

    .line 58
    sget-object v0, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt;

    invoke-virtual {v0}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt;->getLambda$-661289448$app_debug()Lkotlin/jvm/functions/Function4;

    move-result-object v9

    const-string v2, "map_view"

    invoke-static/range {v1 .. v11}, Landroidx/navigation/compose/NavGraphBuilderKt;->composable$default(Landroidx/navigation/NavGraphBuilder;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;ILjava/lang/Object;)V

    .line 59
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda1;-><init>(Landroidx/navigation/NavHostController;)V

    const v1, 0x1e64bff7

    invoke-static {v1, v12, v0}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lkotlin/jvm/functions/Function4;

    const-string v2, "media_gallery"

    move-object v1, p1

    invoke-static/range {v1 .. v11}, Landroidx/navigation/compose/NavGraphBuilderKt;->composable$default(Landroidx/navigation/NavGraphBuilder;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;ILjava/lang/Object;)V

    .line 60
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda2;-><init>(Landroidx/navigation/NavHostController;)V

    const v1, 0x6433f9d6

    invoke-static {v1, v12, v0}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lkotlin/jvm/functions/Function4;

    const-string v2, "reports"

    move-object v1, p1

    invoke-static/range {v1 .. v11}, Landroidx/navigation/compose/NavGraphBuilderKt;->composable$default(Landroidx/navigation/NavGraphBuilder;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;ILjava/lang/Object;)V

    .line 61
    sget-object v0, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt;

    invoke-virtual {v0}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaAppKt;->getLambda$-1442630731$app_debug()Lkotlin/jvm/functions/Function4;

    move-result-object v9

    const-string v2, "settings"

    invoke-static/range {v1 .. v11}, Landroidx/navigation/compose/NavGraphBuilderKt;->composable$default(Landroidx/navigation/NavGraphBuilder;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;ILjava/lang/Object;)V

    .line 62
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda3;-><init>(Landroidx/navigation/NavHostController;)V

    const v1, -0x102d926c

    invoke-static {v1, v12, v0}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lkotlin/jvm/functions/Function4;

    const-string v2, "search"

    move-object v1, p1

    invoke-static/range {v1 .. v11}, Landroidx/navigation/compose/NavGraphBuilderKt;->composable$default(Landroidx/navigation/NavGraphBuilder;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;ILjava/lang/Object;)V

    .line 63
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda4;-><init>(Landroidx/navigation/NavHostController;)V

    const v1, 0x35a1a773

    invoke-static {v1, v12, v0}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lkotlin/jvm/functions/Function4;

    const-string v2, "new_entry"

    move-object v1, p1

    invoke-static/range {v1 .. v11}, Landroidx/navigation/compose/NavGraphBuilderKt;->composable$default(Landroidx/navigation/NavGraphBuilder;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;ILjava/lang/Object;)V

    .line 64
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda5;-><init>(Landroidx/navigation/NavHostController;)V

    const v1, 0x7b70e152

    invoke-static {v1, v12, v0}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lkotlin/jvm/functions/Function4;

    const-string v2, "edit_entry/{entryId}"

    move-object v1, p1

    invoke-static/range {v1 .. v11}, Landroidx/navigation/compose/NavGraphBuilderKt;->composable$default(Landroidx/navigation/NavGraphBuilder;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;ILjava/lang/Object;)V

    .line 68
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda6;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda6;-><init>(Landroidx/navigation/NavHostController;)V

    const v1, -0x3ebfe4cf

    invoke-static {v1, v12, v0}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lkotlin/jvm/functions/Function4;

    const-string v2, "entry_detail/{entryId}"

    move-object v1, p1

    invoke-static/range {v1 .. v11}, Landroidx/navigation/compose/NavGraphBuilderKt;->composable$default(Landroidx/navigation/NavGraphBuilder;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;ILjava/lang/Object;)V

    .line 72
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda7;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda7;-><init>(Landroidx/navigation/NavHostController;)V

    const v1, 0x70f5510

    invoke-static {v1, v12, v0}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lkotlin/jvm/functions/Function4;

    const-string v2, "pdf_preview"

    move-object v1, p1

    invoke-static/range {v1 .. v11}, Landroidx/navigation/compose/NavGraphBuilderKt;->composable$default(Landroidx/navigation/NavGraphBuilder;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;ILjava/lang/Object;)V

    .line 73
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda8;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda8;-><init>(Landroidx/navigation/NavHostController;)V

    const v1, 0x3eec6c02

    invoke-static {v1, v12, v0}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lkotlin/jvm/functions/Function4;

    const-string v2, "camera_capture/{entryId}"

    move-object v1, p1

    invoke-static/range {v1 .. v11}, Landroidx/navigation/compose/NavGraphBuilderKt;->composable$default(Landroidx/navigation/NavGraphBuilder;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;ILjava/lang/Object;)V

    .line 77
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda9;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda9;-><init>(Landroidx/navigation/NavHostController;)V

    const v1, -0x7b445a1f

    invoke-static {v1, v12, v0}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lkotlin/jvm/functions/Function4;

    const-string v2, "filmstrip/{videoId}"

    move-object v1, p1

    invoke-static/range {v1 .. v11}, Landroidx/navigation/compose/NavGraphBuilderKt;->composable$default(Landroidx/navigation/NavGraphBuilder;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;ILjava/lang/Object;)V

    .line 81
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$10(Landroidx/navigation/NavHostController;Landroidx/compose/animation/AnimatedContentScope;Landroidx/navigation/NavBackStackEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 3
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$this$composable"    # Landroidx/compose/animation/AnimatedContentScope;
    .param p2, "it"    # Landroidx/navigation/NavBackStackEntry;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    const-string v0, "$this$composable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "it"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "C58@2286L33:LalaApp.kt#4cebsy"

    invoke-static {p3, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:58)"

    const v2, 0x1e64bff7

    invoke-static {v2, p4, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 59
    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-static {p0, v2, p3, v0, v1}, Lcom/hardlineforge/lala/ui/screens/MediaGalleryScreenKt;->MediaGalleryScreen(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$11(Landroidx/navigation/NavHostController;Landroidx/compose/animation/AnimatedContentScope;Landroidx/navigation/NavBackStackEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 3
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$this$composable"    # Landroidx/compose/animation/AnimatedContentScope;
    .param p2, "it"    # Landroidx/navigation/NavBackStackEntry;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    const-string v0, "$this$composable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "it"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "C59@2362L28:LalaApp.kt#4cebsy"

    invoke-static {p3, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:59)"

    const v2, 0x6433f9d6

    invoke-static {v2, p4, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 60
    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-static {p0, v2, p3, v0, v1}, Lcom/hardlineforge/lala/ui/screens/ReportsScreenKt;->ReportsScreen(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$12(Landroidx/navigation/NavHostController;Landroidx/compose/animation/AnimatedContentScope;Landroidx/navigation/NavBackStackEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 3
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$this$composable"    # Landroidx/compose/animation/AnimatedContentScope;
    .param p2, "it"    # Landroidx/navigation/NavBackStackEntry;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    const-string v0, "$this$composable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "it"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "C61@2492L27:LalaApp.kt#4cebsy"

    invoke-static {p3, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:61)"

    const v2, -0x102d926c

    invoke-static {v2, p4, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 62
    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-static {p0, v2, p3, v0, v1}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt;->SearchScreen(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$13(Landroidx/navigation/NavHostController;Landroidx/compose/animation/AnimatedContentScope;Landroidx/navigation/NavBackStackEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 9
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$this$composable"    # Landroidx/compose/animation/AnimatedContentScope;
    .param p2, "it"    # Landroidx/navigation/NavBackStackEntry;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    const-string v0, "$this$composable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "it"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "C62@2564L44:LalaApp.kt#4cebsy"

    invoke-static {p3, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:62)"

    const v2, 0x35a1a773

    invoke-static {v2, p4, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 63
    :cond_0
    const/16 v7, 0x30

    const/4 v8, 0x4

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v3, p0

    move-object v6, p3

    .end local p0    # "$navController":Landroidx/navigation/NavHostController;
    .end local p3    # "$composer":Landroidx/compose/runtime/Composer;
    .local v3, "$navController":Landroidx/navigation/NavHostController;
    .local v6, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v3 .. v8}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt;->AddEditScreen(Landroidx/navigation/NavHostController;Ljava/lang/String;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method static final LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$14(Landroidx/navigation/NavHostController;Landroidx/compose/animation/AnimatedContentScope;Landroidx/navigation/NavBackStackEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 7
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$this$composable"    # Landroidx/compose/animation/AnimatedContentScope;
    .param p2, "backStack"    # Landroidx/navigation/NavBackStackEntry;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    const-string v0, "$this$composable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "backStack"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "C65@2774L42:LalaApp.kt#4cebsy"

    invoke-static {p3, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:64)"

    const v2, 0x7b70e152

    invoke-static {v2, p4, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 65
    :cond_0
    invoke-virtual {p2}, Landroidx/navigation/NavBackStackEntry;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "entryId"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    :cond_1
    const-string v0, ""

    :cond_2
    move-object v2, v0

    .line 66
    .local v2, "id":Ljava/lang/String;
    const/4 v5, 0x0

    const/4 v6, 0x4

    const/4 v3, 0x0

    move-object v1, p0

    move-object v4, p3

    .end local p0    # "$navController":Landroidx/navigation/NavHostController;
    .end local p3    # "$composer":Landroidx/compose/runtime/Composer;
    .local v1, "$navController":Landroidx/navigation/NavHostController;
    .local v4, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v1 .. v6}, Lcom/hardlineforge/lala/ui/screens/AddEditScreenKt;->AddEditScreen(Landroidx/navigation/NavHostController;Ljava/lang/String;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p0

    if-eqz p0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 67
    :cond_3
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method static final LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$15(Landroidx/navigation/NavHostController;Landroidx/compose/animation/AnimatedContentScope;Landroidx/navigation/NavBackStackEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 7
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$this$composable"    # Landroidx/compose/animation/AnimatedContentScope;
    .param p2, "backStack"    # Landroidx/navigation/NavBackStackEntry;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    const-string v0, "$this$composable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "backStack"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "C69@3000L46:LalaApp.kt#4cebsy"

    invoke-static {p3, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:68)"

    const v2, -0x3ebfe4cf

    invoke-static {v2, p4, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 69
    :cond_0
    invoke-virtual {p2}, Landroidx/navigation/NavBackStackEntry;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "entryId"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    :cond_1
    const-string v0, ""

    :cond_2
    move-object v2, v0

    .line 70
    .local v2, "id":Ljava/lang/String;
    const/4 v5, 0x0

    const/4 v6, 0x4

    const/4 v3, 0x0

    move-object v1, p0

    move-object v4, p3

    .end local p0    # "$navController":Landroidx/navigation/NavHostController;
    .end local p3    # "$composer":Landroidx/compose/runtime/Composer;
    .local v1, "$navController":Landroidx/navigation/NavHostController;
    .local v4, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v1 .. v6}, Lcom/hardlineforge/lala/ui/screens/EntryDetailScreenKt;->EntryDetailScreen(Landroidx/navigation/NavHostController;Ljava/lang/String;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p0

    if-eqz p0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 71
    :cond_3
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method static final LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$16(Landroidx/navigation/NavHostController;Landroidx/compose/animation/AnimatedContentScope;Landroidx/navigation/NavBackStackEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 3
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$this$composable"    # Landroidx/compose/animation/AnimatedContentScope;
    .param p2, "it"    # Landroidx/navigation/NavBackStackEntry;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    const-string v0, "$this$composable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "it"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "C71@3109L31:LalaApp.kt#4cebsy"

    invoke-static {p3, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:71)"

    const v2, 0x70f5510

    invoke-static {v2, p4, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 72
    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-static {p0, v2, p3, v0, v1}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->PdfPreviewScreen(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$17(Landroidx/navigation/NavHostController;Landroidx/compose/animation/AnimatedContentScope;Landroidx/navigation/NavBackStackEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 7
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$this$composable"    # Landroidx/compose/animation/AnimatedContentScope;
    .param p2, "backStack"    # Landroidx/navigation/NavBackStackEntry;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    const-string v0, "$this$composable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "backStack"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "C74@3310L48:LalaApp.kt#4cebsy"

    invoke-static {p3, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:73)"

    const v2, 0x3eec6c02

    invoke-static {v2, p4, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 74
    :cond_0
    invoke-virtual {p2}, Landroidx/navigation/NavBackStackEntry;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "entryId"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    :cond_1
    const-string v0, ""

    :cond_2
    move-object v2, v0

    .line 75
    .local v2, "id":Ljava/lang/String;
    const/4 v5, 0x0

    const/4 v6, 0x4

    const/4 v3, 0x0

    move-object v1, p0

    move-object v4, p3

    .end local p0    # "$navController":Landroidx/navigation/NavHostController;
    .end local p3    # "$composer":Landroidx/compose/runtime/Composer;
    .local v1, "$navController":Landroidx/navigation/NavHostController;
    .local v4, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v1 .. v6}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;->CameraCaptureScreen(Landroidx/navigation/NavHostController;Ljava/lang/String;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p0

    if-eqz p0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 76
    :cond_3
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method static final LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$18(Landroidx/navigation/NavHostController;Landroidx/compose/animation/AnimatedContentScope;Landroidx/navigation/NavBackStackEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 7
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$this$composable"    # Landroidx/compose/animation/AnimatedContentScope;
    .param p2, "backStack"    # Landroidx/navigation/NavBackStackEntry;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    const-string v0, "$this$composable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "backStack"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "C78@3539L44:LalaApp.kt#4cebsy"

    invoke-static {p3, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:77)"

    const v2, -0x7b445a1f

    invoke-static {v2, p4, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 78
    :cond_0
    invoke-virtual {p2}, Landroidx/navigation/NavBackStackEntry;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "videoId"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    :cond_1
    const-string v0, ""

    :cond_2
    move-object v2, v0

    .line 79
    .local v2, "id":Ljava/lang/String;
    const/4 v5, 0x0

    const/4 v6, 0x4

    const/4 v3, 0x0

    move-object v1, p0

    move-object v4, p3

    .end local p0    # "$navController":Landroidx/navigation/NavHostController;
    .end local p3    # "$composer":Landroidx/compose/runtime/Composer;
    .local v1, "$navController":Landroidx/navigation/NavHostController;
    .local v4, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v1 .. v6}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt;->FilmstripScreen(Landroidx/navigation/NavHostController;Ljava/lang/String;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p0

    if-eqz p0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 80
    :cond_3
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method static final LalaApp$lambda$22$lambda$21$lambda$20$lambda$19$lambda$9(Landroidx/navigation/NavHostController;Landroidx/compose/animation/AnimatedContentScope;Landroidx/navigation/NavBackStackEntry;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 3
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$this$composable"    # Landroidx/compose/animation/AnimatedContentScope;
    .param p2, "it"    # Landroidx/navigation/NavBackStackEntry;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    const-string v0, "$this$composable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "it"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "C56@2149L29:LalaApp.kt#4cebsy"

    invoke-static {p3, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (LalaApp.kt:56)"

    const v2, 0x484ec4af

    invoke-static {v2, p4, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 57
    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-static {p0, v2, p3, v0, v1}, Lcom/hardlineforge/lala/ui/screens/TimelineScreenKt;->TimelineScreen(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final LalaApp$lambda$22$lambda$8(Landroidx/navigation/NavHostController;Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/material3/DrawerState;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 10
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$scope"    # Lkotlinx/coroutines/CoroutineScope;
    .param p2, "$drawerState"    # Landroidx/compose/material3/DrawerState;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    const-string v0, "C38@1386L27:LalaApp.kt#4cebsy"

    invoke-static {p3, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, p4, 0x3

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    and-int/lit8 v1, p4, 0x1

    invoke-interface {p3, v0, v1}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous> (LalaApp.kt:38)"

    const v3, -0x8eac844

    invoke-static {v3, p4, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 39
    :cond_1
    invoke-static {p0, p3, v2}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt;->currentRoute(Landroidx/navigation/NavHostController;Landroidx/compose/runtime/Composer;I)Ljava/lang/String;

    move-result-object v0

    .line 40
    .local v0, "currentRoute":Ljava/lang/String;
    if-eqz v0, :cond_6

    const-string v1, "splash"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    const v1, 0x4e231a94    # 6.84107E8f

    invoke-interface {p3, v1}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v1, "42@1614L39,43@1695L88,40@1506L362"

    invoke-static {p3, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 42
    invoke-static {v0}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt;->routeTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 43
    const v1, -0x7959a5fd

    const-string v3, "CC(remember):LalaApp.kt#9igjgp"

    invoke-static {p3, v1, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {p3, p1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v1

    invoke-interface {p3, p2}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v4

    or-int/2addr v1, v4

    .local v1, "invalid\\1":Z
    move-object v4, p3

    .local v4, "$this$cache\\1":Landroidx/compose/runtime/Composer;
    const/4 v5, 0x0

    .line 128
    .local v5, "$i$f$cache\\1\\43":I
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v6

    .local v6, "it\\1":Ljava/lang/Object;
    const/4 v7, 0x0

    .line 129
    .local v7, "$i$a$-let-ComposerKt$cache$1\\2\\128\\1":I
    if-nez v1, :cond_3

    sget-object v8, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v8}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v8

    if-ne v6, v8, :cond_2

    goto :goto_1

    .line 133
    :cond_2
    goto :goto_2

    .line 130
    :cond_3
    :goto_1
    const/4 v8, 0x0

    .line 43
    .local v8, "$i$a$-cache-LalaAppKt$LalaApp$2$1$1\\3\\130\\0":I
    new-instance v9, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda18;

    invoke-direct {v9, p1, p2}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda18;-><init>(Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/material3/DrawerState;)V

    .line 130
    .end local v8    # "$i$a$-cache-LalaAppKt$LalaApp$2$1$1\\3\\130\\0":I
    nop

    .line 131
    .local v9, "value\\2":Ljava/lang/Object;
    invoke-interface {v4, v9}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 132
    move-object v6, v9

    .line 128
    .end local v6    # "it\\1":Ljava/lang/Object;
    .end local v7    # "$i$a$-let-ComposerKt$cache$1\\2\\128\\1":I
    .end local v9    # "value\\2":Ljava/lang/Object;
    :goto_2
    nop

    .line 43
    .end local v1    # "invalid\\1":Z
    .end local v4    # "$this$cache\\1":Landroidx/compose/runtime/Composer;
    .end local v5    # "$i$f$cache\\1\\43":I
    check-cast v6, Lkotlin/jvm/functions/Function0;

    invoke-static {p3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 44
    const v1, -0x79599bac

    invoke-static {p3, v1, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {p3, p0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v1

    .local v1, "invalid\\4":Z
    move-object v3, p3

    .local v3, "$this$cache\\4":Landroidx/compose/runtime/Composer;
    const/4 v4, 0x0

    .line 134
    .local v4, "$i$f$cache\\4\\44":I
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v5

    .local v5, "it\\4":Ljava/lang/Object;
    const/4 v7, 0x0

    .line 135
    .local v7, "$i$a$-let-ComposerKt$cache$1\\5\\134\\4":I
    if-nez v1, :cond_5

    sget-object v8, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v8}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v8

    if-ne v5, v8, :cond_4

    goto :goto_3

    .line 139
    :cond_4
    goto :goto_4

    .line 136
    :cond_5
    :goto_3
    const/4 v8, 0x0

    .line 44
    .local v8, "$i$a$-cache-LalaAppKt$LalaApp$2$1$2\\6\\136\\0":I
    new-instance v9, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda19;

    invoke-direct {v9, p0}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda19;-><init>(Landroidx/navigation/NavHostController;)V

    .line 136
    .end local v8    # "$i$a$-cache-LalaAppKt$LalaApp$2$1$2\\6\\136\\0":I
    nop

    .line 137
    .local v9, "value\\5":Ljava/lang/Object;
    invoke-interface {v3, v9}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 138
    move-object v5, v9

    .line 134
    .end local v5    # "it\\4":Ljava/lang/Object;
    .end local v7    # "$i$a$-let-ComposerKt$cache$1\\5\\134\\4":I
    .end local v9    # "value\\5":Ljava/lang/Object;
    :goto_4
    nop

    .line 44
    .end local v1    # "invalid\\4":Z
    .end local v3    # "$this$cache\\4":Landroidx/compose/runtime/Composer;
    .end local v4    # "$i$f$cache\\4\\44":I
    move-object v4, v5

    check-cast v4, Lkotlin/jvm/functions/Function0;

    invoke-static {p3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 47
    const-string v1, "timeline"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    .line 41
    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v3, v6

    move-object v6, p3

    .end local p3    # "$composer":Landroidx/compose/runtime/Composer;
    .local v6, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v2 .. v8}, Lcom/hardlineforge/lala/ui/screens/LalaTopBarKt;->LalaTopBar(Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;ZLandroidx/compose/runtime/Composer;II)V

    .line 40
    goto :goto_5

    .end local v6    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local p3    # "$composer":Landroidx/compose/runtime/Composer;
    :cond_6
    move-object v6, p3

    .end local p3    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v6    # "$composer":Landroidx/compose/runtime/Composer;
    const p3, 0x4e0c6f86    # 5.8902976E8f

    invoke-interface {v6, p3}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    :goto_5
    invoke-interface {v6}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p3

    if-eqz p3, :cond_8

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .end local v0    # "currentRoute":Ljava/lang/String;
    goto :goto_6

    .line 38
    .end local v6    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local p3    # "$composer":Landroidx/compose/runtime/Composer;
    :cond_7
    move-object v6, p3

    .end local p3    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v6    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface {v6}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 50
    :cond_8
    :goto_6
    sget-object p3, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p3
.end method

.method static final LalaApp$lambda$22$lambda$8$lambda$5$lambda$4(Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/material3/DrawerState;)Lkotlin/Unit;
    .locals 8
    .param p0, "$scope"    # Lkotlinx/coroutines/CoroutineScope;
    .param p1, "$drawerState"    # Landroidx/compose/material3/DrawerState;

    .line 43
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$LalaApp$2$1$1$1$1;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$LalaApp$2$1$1$1$1;-><init>(Landroidx/compose/material3/DrawerState;Lkotlin/coroutines/Continuation;)V

    move-object v5, v0

    check-cast v5, Lkotlin/jvm/functions/Function2;

    const/4 v6, 0x3

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v2, p0

    .end local p0    # "$scope":Lkotlinx/coroutines/CoroutineScope;
    .local v2, "$scope":Lkotlinx/coroutines/CoroutineScope;
    invoke-static/range {v2 .. v7}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method static final LalaApp$lambda$22$lambda$8$lambda$7$lambda$6(Landroidx/navigation/NavHostController;)Lkotlin/Unit;
    .locals 6
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;

    .line 45
    move-object v0, p0

    check-cast v0, Landroidx/navigation/NavController;

    const/4 v4, 0x6

    const/4 v5, 0x0

    const-string v1, "search"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Landroidx/navigation/NavController;->navigate$default(Landroidx/navigation/NavController;Ljava/lang/String;Landroidx/navigation/NavOptions;Landroidx/navigation/Navigator$Extras;ILjava/lang/Object;)V

    .line 46
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final LalaApp$lambda$23(ILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 1

    or-int/lit8 v0, p0, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v0

    invoke-static {p1, v0}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt;->LalaApp(Landroidx/compose/runtime/Composer;I)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final LalaApp$lambda$3(Landroidx/navigation/NavHostController;Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/material3/DrawerState;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 16
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$scope"    # Lkotlinx/coroutines/CoroutineScope;
    .param p2, "$drawerState"    # Landroidx/compose/material3/DrawerState;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    move-object/from16 v9, p3

    move/from16 v12, p4

    const-string v0, "C29@1154L137,29@1137L154:LalaApp.kt#4cebsy"

    invoke-static {v9, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, v12, 0x3

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq v0, v1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    and-int/lit8 v1, v12, 0x1

    invoke-interface {v9, v0, v1}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous> (LalaApp.kt:29)"

    const v3, 0x4ae5f425    # 7535122.5f

    invoke-static {v3, v12, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 30
    :cond_1
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda11;

    move-object/from16 v13, p0

    move-object/from16 v14, p1

    move-object/from16 v15, p2

    invoke-direct {v0, v13, v14, v15}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda11;-><init>(Landroidx/navigation/NavHostController;Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/material3/DrawerState;)V

    const/16 v1, 0x36

    const v3, 0x60f1f301

    invoke-static {v3, v2, v0, v9, v1}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lkotlin/jvm/functions/Function3;

    const/high16 v10, 0x180000

    const/16 v11, 0x3f

    const/4 v0, 0x0

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v0 .. v11}, Landroidx/compose/material3/NavigationDrawerKt;->ModalDrawerSheet-afqeVBk(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/graphics/Shape;JJFLandroidx/compose/foundation/layout/WindowInsets;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    .line 29
    :cond_2
    move-object/from16 v13, p0

    move-object/from16 v14, p1

    move-object/from16 v15, p2

    invoke-interface/range {p3 .. p3}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 35
    :cond_3
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final LalaApp$lambda$3$lambda$2(Landroidx/navigation/NavHostController;Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/material3/DrawerState;Landroidx/compose/foundation/layout/ColumnScope;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 8
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$scope"    # Lkotlinx/coroutines/CoroutineScope;
    .param p2, "$drawerState"    # Landroidx/compose/material3/DrawerState;
    .param p3, "$this$ModalDrawerSheet"    # Landroidx/compose/foundation/layout/ColumnScope;
    .param p4, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p5, "$changed"    # I

    const-string v0, "$this$ModalDrawerSheet"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "C30@1201L76,30@1172L105:LalaApp.kt#4cebsy"

    invoke-static {p4, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, p5, 0x11

    const/16 v1, 0x10

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    and-int/lit8 v1, p5, 0x1

    invoke-interface {p4, v0, v1}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.LalaApp.<anonymous>.<anonymous> (LalaApp.kt:30)"

    const v3, 0x60f1f301

    invoke-static {v3, p5, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 31
    :cond_1
    const v0, -0x13bec313

    const-string v1, "CC(remember):LalaApp.kt#9igjgp"

    invoke-static {p4, v0, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {p4, p1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v0

    invoke-interface {p4, p2}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v1

    or-int/2addr v0, v1

    .local v0, "invalid\\1":Z
    move-object v1, p4

    .local v1, "$this$cache\\1":Landroidx/compose/runtime/Composer;
    const/4 v3, 0x0

    .line 122
    .local v3, "$i$f$cache\\1\\31":I
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v4

    .local v4, "it\\1":Ljava/lang/Object;
    const/4 v5, 0x0

    .line 123
    .local v5, "$i$a$-let-ComposerKt$cache$1\\2\\122\\1":I
    if-nez v0, :cond_3

    sget-object v6, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v6}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v6

    if-ne v4, v6, :cond_2

    goto :goto_1

    .line 127
    :cond_2
    goto :goto_2

    .line 124
    :cond_3
    :goto_1
    const/4 v6, 0x0

    .line 31
    .local v6, "$i$a$-cache-LalaAppKt$LalaApp$1$1$1\\3\\124\\0":I
    new-instance v7, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda10;

    invoke-direct {v7, p1, p2}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$$ExternalSyntheticLambda10;-><init>(Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/material3/DrawerState;)V

    .line 124
    .end local v6    # "$i$a$-cache-LalaAppKt$LalaApp$1$1$1\\3\\124\\0":I
    nop

    .line 125
    .local v7, "value\\2":Ljava/lang/Object;
    invoke-interface {v1, v7}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 126
    move-object v4, v7

    .line 122
    .end local v4    # "it\\1":Ljava/lang/Object;
    .end local v5    # "$i$a$-let-ComposerKt$cache$1\\2\\122\\1":I
    .end local v7    # "value\\2":Ljava/lang/Object;
    :goto_2
    nop

    .line 31
    .end local v0    # "invalid\\1":Z
    .end local v1    # "$this$cache\\1":Landroidx/compose/runtime/Composer;
    .end local v3    # "$i$f$cache\\1\\31":I
    check-cast v4, Lkotlin/jvm/functions/Function0;

    invoke-static {p4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    invoke-static {p0, v4, p4, v2}, Lcom/hardlineforge/lala/ui/screens/DrawerContentKt;->DrawerContent(Landroidx/navigation/NavHostController;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_3

    .line 30
    :cond_4
    invoke-interface {p4}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 34
    :cond_5
    :goto_3
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final LalaApp$lambda$3$lambda$2$lambda$1$lambda$0(Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/material3/DrawerState;)Lkotlin/Unit;
    .locals 8
    .param p0, "$scope"    # Lkotlinx/coroutines/CoroutineScope;
    .param p1, "$drawerState"    # Landroidx/compose/material3/DrawerState;

    .line 32
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$LalaApp$1$1$1$1$1;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt$LalaApp$1$1$1$1$1;-><init>(Landroidx/compose/material3/DrawerState;Lkotlin/coroutines/Continuation;)V

    move-object v5, v0

    check-cast v5, Lkotlin/jvm/functions/Function2;

    const/4 v6, 0x3

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v2, p0

    .end local p0    # "$scope":Lkotlinx/coroutines/CoroutineScope;
    .local v2, "$scope":Lkotlinx/coroutines/CoroutineScope;
    invoke-static/range {v2 .. v7}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    .line 33
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method private static final currentRoute(Landroidx/navigation/NavHostController;Landroidx/compose/runtime/Composer;I)Ljava/lang/String;
    .locals 5
    .param p0, "navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    .line 87
    const v0, 0x1994e28d

    const-string v1, "C(currentRoute)87@3760L30:LalaApp.kt#4cebsy"

    invoke-static {p1, v0, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, -0x1

    const-string v2, "com.hardlineforge.lala.ui.screens.currentRoute (LalaApp.kt:86)"

    invoke-static {v0, p2, v1, v2}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 88
    :cond_0
    move-object v0, p0

    check-cast v0, Landroidx/navigation/NavController;

    and-int/lit8 v1, p2, 0xe

    invoke-static {v0, p1, v1}, Landroidx/navigation/compose/NavHostControllerKt;->currentBackStackEntryAsState(Landroidx/navigation/NavController;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v0

    .line 89
    .local v0, "navBackStackEntry$delegate":Landroidx/compose/runtime/State;
    invoke-static {v0}, Lcom/hardlineforge/lala/ui/screens/LalaAppKt;->currentRoute$lambda$24(Landroidx/compose/runtime/State;)Landroidx/navigation/NavBackStackEntry;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroidx/navigation/NavBackStackEntry;->getDestination()Landroidx/navigation/NavDestination;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroidx/navigation/NavDestination;->getRoute()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    const-string v3, "/"

    const/4 v4, 0x2

    invoke-static {v1, v3, v2, v4, v2}, Lkotlin/text/StringsKt;->substringBefore$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    :cond_1
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 87
    :cond_2
    invoke-static {p1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 89
    return-object v2
.end method

.method private static final currentRoute$lambda$24(Landroidx/compose/runtime/State;)Landroidx/navigation/NavBackStackEntry;
    .locals 4
    .param p0, "$navBackStackEntry$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "Landroidx/navigation/NavBackStackEntry;",
            ">;)",
            "Landroidx/navigation/NavBackStackEntry;"
        }
    .end annotation

    .line 88
    const/4 v0, 0x0

    .local v0, "this_\\1":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property\\1":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue\\1":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 146
    .local v3, "$i$f$getValue\\1\\88":I
    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "this_\\1":Ljava/lang/Object;
    .end local v1    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$getValue\\1":Landroidx/compose/runtime/State;
    .end local v3    # "$i$f$getValue\\1\\88":I
    check-cast v0, Landroidx/navigation/NavBackStackEntry;

    .line 88
    return-object v0
.end method

.method private static final routeTitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "route"    # Ljava/lang/String;

    .line 92
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :goto_0
    goto/16 :goto_1

    :sswitch_0
    const-string v0, "camera_capture"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 103
    :cond_0
    const-string v0, "Camera"

    goto/16 :goto_2

    .line 92
    :sswitch_1
    const-string v0, "settings"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 97
    :cond_1
    const-string v0, "Settings"

    goto/16 :goto_2

    .line 92
    :sswitch_2
    const-string v0, "reports"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    .line 96
    :cond_2
    const-string v0, "Reports"

    goto/16 :goto_2

    .line 92
    :sswitch_3
    const-string v0, "entry_detail"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    .line 101
    :cond_3
    const-string v0, "Entry Detail"

    goto/16 :goto_2

    .line 92
    :sswitch_4
    const-string v0, "pdf_preview"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_0

    .line 102
    :cond_4
    const-string v0, "Report Preview"

    goto :goto_2

    .line 92
    :sswitch_5
    const-string v0, "map_view"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    goto :goto_0

    .line 94
    :cond_5
    const-string v0, "Map View"

    goto :goto_2

    .line 92
    :sswitch_6
    const-string v0, "new_entry"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    goto :goto_0

    .line 99
    :cond_6
    const-string v0, "New Entry"

    goto :goto_2

    .line 92
    :sswitch_7
    const-string v0, "search"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    goto :goto_0

    .line 98
    :cond_7
    const-string v0, "Search"

    goto :goto_2

    .line 92
    :sswitch_8
    const-string v0, "filmstrip"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    goto :goto_0

    .line 104
    :cond_8
    const-string v0, "Filmstrip"

    goto :goto_2

    .line 92
    :sswitch_9
    const-string v0, "media_gallery"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    goto :goto_0

    .line 95
    :cond_9
    const-string v0, "Media Gallery"

    goto :goto_2

    .line 92
    :sswitch_a
    const-string v0, "edit_entry"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    goto/16 :goto_0

    .line 100
    :cond_a
    const-string v0, "Edit Entry"

    goto :goto_2

    .line 92
    :sswitch_b
    const-string v0, "timeline"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    goto/16 :goto_0

    .line 93
    :cond_b
    const-string v0, "Timeline"

    goto :goto_2

    .line 105
    :goto_1
    const-string v0, "LALA"

    .line 106
    :goto_2
    return-object v0

    :sswitch_data_0
    .sparse-switch
        -0x7bc72bbf -> :sswitch_b
        -0x78bd5603 -> :sswitch_a
        -0x5ee09609 -> :sswitch_9
        -0x3fb41fec -> :sswitch_8
        -0x36059a58 -> :sswitch_7
        -0xfdca2ed -> :sswitch_6
        0xaad47a8 -> :sswitch_5
        0x1d9b297b -> :sswitch_4
        0x266408be -> :sswitch_3
        0x413e51bf -> :sswitch_2
        0x5582bc23 -> :sswitch_1
        0x616a3c2c -> :sswitch_0
    .end sparse-switch
.end method
