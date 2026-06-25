.class public final Lcom/hardlineforge/lala/ui/screens/SearchScreenKt;
.super Ljava/lang/Object;
.source "SearchScreen.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSearchScreen.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SearchScreen.kt\ncom/hardlineforge/lala/ui/screens/SearchScreenKt\n+ 2 HiltViewModel.kt\nandroidx/hilt/navigation/compose/HiltViewModelKt\n+ 3 ViewModel.kt\nandroidx/lifecycle/viewmodel/compose/ViewModelKt\n+ 4 Composer.kt\nandroidx/compose/runtime/ComposerKt\n+ 5 SnapshotState.kt\nandroidx/compose/runtime/SnapshotStateKt__SnapshotStateKt\n+ 6 LazyDsl.kt\nandroidx/compose/foundation/lazy/LazyDslKt\n+ 7 Dp.kt\nandroidx/compose/ui/unit/DpKt\n*L\n1#1,84:1\n46#2,7:85\n86#3,6:92\n1247#4,6:98\n1247#4,6:104\n1247#4,6:114\n1247#4,6:120\n1247#4,6:126\n1247#4,6:147\n85#5:110\n85#5:111\n113#5,2:112\n168#6,13:132\n113#7:145\n113#7:146\n*S KotlinDebug\n*F\n+ 1 SearchScreen.kt\ncom/hardlineforge/lala/ui/screens/SearchScreenKt\n*L\n21#1:85,7\n21#1:92,6\n23#1:98,6\n25#1:104,6\n40#1:114,6\n33#1:120,6\n48#1:126,6\n59#1:147,6\n22#1:110\n23#1:111\n23#1:112,2\n60#1:132,13\n57#1:145\n58#1:146\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\u001a\u001f\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005H\u0007\u00a2\u0006\u0002\u0010\u0006\u00a8\u0006\u0007\u00b2\u0006\u0010\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\n0\tX\u008a\u0084\u0002\u00b2\u0006\n\u0010\u000b\u001a\u00020\u000cX\u008a\u008e\u0002"
    }
    d2 = {
        "SearchScreen",
        "",
        "navController",
        "Landroidx/navigation/NavHostController;",
        "vm",
        "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;",
        "(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V",
        "app_debug",
        "results",
        "",
        "Lcom/hardlineforge/lala/data/LogEntry;",
        "query",
        ""
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
.method public static final SearchScreen(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V
    .locals 24
    .param p0, "navController"    # Landroidx/navigation/NavHostController;
    .param p1, "vm"    # Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p4

    const-string v3, "navController"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    const v3, -0x1bea694b

    move-object/from16 v4, p2

    invoke-interface {v4, v3}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v4

    .end local p2    # "$composer":Landroidx/compose/runtime/Composer;
    .local v4, "$composer":Landroidx/compose/runtime/Composer;
    const-string v5, "C(SearchScreen)21@924L16,22@958L31,24@1017L28,24@995L50,27@1078L1035,53@2120L1136,26@1051L2205:SearchScreen.kt#4cebsy"

    invoke-static {v4, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v5, p3

    .local v5, "$dirty":I
    and-int/lit8 v6, v1, 0x6

    if-nez v6, :cond_1

    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v6, 0x4

    goto :goto_0

    :cond_0
    const/4 v6, 0x2

    :goto_0
    or-int/2addr v5, v6

    :cond_1
    and-int/lit8 v6, v1, 0x30

    if-nez v6, :cond_4

    and-int/lit8 v6, v2, 0x2

    if-nez v6, :cond_2

    move-object/from16 v6, p1

    invoke-interface {v4, v6}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    const/16 v8, 0x20

    goto :goto_1

    :cond_2
    move-object/from16 v6, p1

    :cond_3
    const/16 v8, 0x10

    :goto_1
    or-int/2addr v5, v8

    goto :goto_2

    :cond_4
    move-object/from16 v6, p1

    :goto_2
    and-int/lit8 v8, v5, 0x13

    const/16 v9, 0x12

    const/4 v10, 0x0

    const/4 v11, 0x1

    if-eq v8, v9, :cond_5

    move v8, v11

    goto :goto_3

    :cond_5
    move v8, v10

    :goto_3
    and-int/lit8 v9, v5, 0x1

    invoke-interface {v4, v8, v9}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v8

    if-eqz v8, :cond_10

    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v8, "20@869L15"

    invoke-static {v4, v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v8, v1, 0x1

    if-eqz v8, :cond_7

    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v8

    if-eqz v8, :cond_6

    goto :goto_4

    .line 19
    :cond_6
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v8, v2, 0x2

    if-eqz v8, :cond_a

    and-int/lit8 v5, v5, -0x71

    goto/16 :goto_6

    .line 21
    :cond_7
    :goto_4
    and-int/lit8 v8, v2, 0x2

    if-eqz v8, :cond_a

    const/4 v8, 0x0

    .local v8, "$changed\\1":I
    move-object v9, v4

    .local v9, "$composer\\1":Landroidx/compose/runtime/Composer;
    const/16 v20, 0x0

    .local v20, "$i$f$hiltViewModel\\1\\21":I
    const v12, 0x70b323c8

    invoke-interface {v9, v12}, Landroidx/compose/runtime/Composer;->startReplaceableGroup(I)V

    const-string v12, "CC(hiltViewModel)P(1)*45@1969L7,50@2112L47,51@2171L54:HiltViewModel.kt#9mcars"

    invoke-static {v9, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 85
    sget-object v12, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->INSTANCE:Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;

    sget v13, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->$stable:I

    invoke-virtual {v12, v9, v13}, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->getCurrent(Landroidx/compose/runtime/Composer;I)Landroidx/lifecycle/ViewModelStoreOwner;

    move-result-object v13

    if-eqz v13, :cond_9

    .line 88
    .local v13, "viewModelStoreOwner\\1":Landroidx/lifecycle/ViewModelStoreOwner;
    const/4 v14, 0x0

    .line 90
    .local v14, "key\\1":Ljava/lang/String;
    and-int/lit8 v12, v8, 0xe

    invoke-static {v13, v9, v12}, Landroidx/hilt/navigation/compose/HiltViewModelKt;->createHiltViewModelFactory(Landroidx/lifecycle/ViewModelStoreOwner;Landroidx/compose/runtime/Composer;I)Landroidx/lifecycle/ViewModelProvider$Factory;

    move-result-object v15

    .local v15, "factory\\1":Landroidx/lifecycle/ViewModelProvider$Factory;
    and-int/lit8 v12, v8, 0xe

    and-int/lit8 v16, v8, 0x70

    or-int v12, v12, v16

    .line 91
    move/from16 v21, v12

    .local v21, "$changed\\3":I
    const/16 v22, 0x0

    .local v22, "$i$f$viewModel\\3\\91":I
    const v12, 0x671a9c9b

    invoke-interface {v9, v12}, Landroidx/compose/runtime/Composer;->startReplaceableGroup(I)V

    const-string v12, "CC(viewModel)P(3,2,1)*80@3834L7,90@4209L68:ViewModel.kt#3tja67"

    invoke-static {v9, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 92
    instance-of v12, v13, Landroidx/lifecycle/HasDefaultViewModelProviderFactory;

    if-eqz v12, :cond_8

    .line 93
    move-object v12, v13

    check-cast v12, Landroidx/lifecycle/HasDefaultViewModelProviderFactory;

    invoke-interface {v12}, Landroidx/lifecycle/HasDefaultViewModelProviderFactory;->getDefaultViewModelCreationExtras()Landroidx/lifecycle/viewmodel/CreationExtras;

    move-result-object v12

    move-object/from16 v16, v12

    goto :goto_5

    .line 95
    :cond_8
    sget-object v12, Landroidx/lifecycle/viewmodel/CreationExtras$Empty;->INSTANCE:Landroidx/lifecycle/viewmodel/CreationExtras$Empty;

    check-cast v12, Landroidx/lifecycle/viewmodel/CreationExtras;

    move-object/from16 v16, v12

    :goto_5
    nop

    .local v16, "extras\\3":Landroidx/lifecycle/viewmodel/CreationExtras;
    const-class v12, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    .line 97
    shl-int/lit8 v7, v21, 0x3

    and-int/lit16 v7, v7, 0x380

    const v17, 0x9048

    or-int v18, v7, v17

    const/16 v19, 0x0

    move-object/from16 v17, v9

    .end local v9    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .local v17, "$composer\\1":Landroidx/compose/runtime/Composer;
    invoke-static/range {v12 .. v19}, Landroidx/lifecycle/viewmodel/compose/ViewModelKt;->viewModel(Ljava/lang/Class;Landroidx/lifecycle/ViewModelStoreOwner;Ljava/lang/String;Landroidx/lifecycle/ViewModelProvider$Factory;Landroidx/lifecycle/viewmodel/CreationExtras;Landroidx/compose/runtime/Composer;II)Landroidx/lifecycle/ViewModel;

    move-result-object v7

    invoke-interface/range {v17 .. v17}, Landroidx/compose/runtime/Composer;->endReplaceableGroup()V

    .line 91
    .end local v16    # "extras\\3":Landroidx/lifecycle/viewmodel/CreationExtras;
    .end local v21    # "$changed\\3":I
    .end local v22    # "$i$f$viewModel\\3\\91":I
    invoke-interface/range {v17 .. v17}, Landroidx/compose/runtime/Composer;->endReplaceableGroup()V

    .end local v8    # "$changed\\1":I
    .end local v13    # "viewModelStoreOwner\\1":Landroidx/lifecycle/ViewModelStoreOwner;
    .end local v14    # "key\\1":Ljava/lang/String;
    .end local v15    # "factory\\1":Landroidx/lifecycle/ViewModelProvider$Factory;
    .end local v17    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .end local v20    # "$i$f$hiltViewModel\\1\\21":I
    move-object v6, v7

    check-cast v6, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    .end local p1    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v6, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    and-int/lit8 v5, v5, -0x71

    move-object/from16 v23, v6

    move v6, v5

    move-object/from16 v5, v23

    goto :goto_7

    .line 85
    .end local v6    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .restart local v8    # "$changed\\1":I
    .restart local v9    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .restart local v20    # "$i$f$hiltViewModel\\1\\21":I
    .restart local p1    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    :cond_9
    const/4 v2, 0x0

    .line 86
    .local v2, "$i$a$-checkNotNull-HiltViewModelKt$hiltViewModel$1\\2\\85\\1":I
    nop

    .line 85
    .end local v2    # "$i$a$-checkNotNull-HiltViewModelKt$hiltViewModel$1\\2\\85\\1":I
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "No ViewModelStoreOwner was provided via LocalViewModelStoreOwner"

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 19
    .end local v8    # "$changed\\1":I
    .end local v9    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .end local v20    # "$i$f$hiltViewModel\\1\\21":I
    :cond_a
    :goto_6
    move-object/from16 v23, v6

    move v6, v5

    move-object/from16 v5, v23

    .end local p1    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v5, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v6, "$dirty":I
    :goto_7
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v7

    if-eqz v7, :cond_b

    const/4 v7, -0x1

    const-string v8, "com.hardlineforge.lala.ui.screens.SearchScreen (SearchScreen.kt:20)"

    invoke-static {v3, v6, v7, v8}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 22
    :cond_b
    invoke-virtual {v5}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->getSearchResults()Lkotlinx/coroutines/flow/StateFlow;

    move-result-object v3

    const/4 v7, 0x0

    invoke-static {v3, v7, v4, v10, v11}, Landroidx/compose/runtime/SnapshotStateKt;->collectAsState(Lkotlinx/coroutines/flow/StateFlow;Lkotlin/coroutines/CoroutineContext;Landroidx/compose/runtime/Composer;II)Landroidx/compose/runtime/State;

    move-result-object v3

    .line 23
    .local v3, "results$delegate":Landroidx/compose/runtime/State;
    const v8, 0x350ad814

    const-string v9, "CC(remember):SearchScreen.kt#9igjgp"

    invoke-static {v4, v8, v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v8, 0x0

    .local v8, "invalid\\4":Z
    move-object v12, v4

    .local v12, "$this$cache\\4":Landroidx/compose/runtime/Composer;
    const/4 v13, 0x0

    .line 98
    .local v13, "$i$f$cache\\4\\23":I
    invoke-interface {v12}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v14

    .local v14, "it\\4":Ljava/lang/Object;
    const/4 v15, 0x0

    .line 99
    .local v15, "$i$a$-let-ComposerKt$cache$1\\5\\98\\4":I
    sget-object v16, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual/range {v16 .. v16}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v11

    if-ne v14, v11, :cond_c

    .line 100
    const/4 v11, 0x0

    .line 23
    .local v11, "$i$a$-cache-SearchScreenKt$SearchScreen$query$2\\6\\100\\0":I
    const-string v10, ""

    move/from16 v18, v6

    const/4 v6, 0x2

    .end local v6    # "$dirty":I
    .local v18, "$dirty":I
    invoke-static {v10, v7, v6, v7}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateOf$default(Ljava/lang/Object;Landroidx/compose/runtime/SnapshotMutationPolicy;ILjava/lang/Object;)Landroidx/compose/runtime/MutableState;

    move-result-object v6

    .line 100
    .end local v11    # "$i$a$-cache-SearchScreenKt$SearchScreen$query$2\\6\\100\\0":I
    nop

    .line 101
    .local v6, "value\\5":Ljava/lang/Object;
    invoke-interface {v12, v6}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 102
    move-object v14, v6

    .end local v6    # "value\\5":Ljava/lang/Object;
    goto :goto_8

    .line 103
    .end local v18    # "$dirty":I
    .local v6, "$dirty":I
    :cond_c
    move/from16 v18, v6

    .line 98
    .end local v6    # "$dirty":I
    .end local v14    # "it\\4":Ljava/lang/Object;
    .end local v15    # "$i$a$-let-ComposerKt$cache$1\\5\\98\\4":I
    .restart local v18    # "$dirty":I
    :goto_8
    nop

    .line 23
    .end local v8    # "invalid\\4":Z
    .end local v12    # "$this$cache\\4":Landroidx/compose/runtime/Composer;
    .end local v13    # "$i$f$cache\\4\\23":I
    move-object v6, v14

    check-cast v6, Landroidx/compose/runtime/MutableState;

    .local v6, "query$delegate":Landroidx/compose/runtime/MutableState;
    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 25
    invoke-static {v6}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt;->SearchScreen$lambda$2(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v8

    const v10, 0x350adf71

    invoke-static {v4, v10, v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v4, v5}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v9

    .local v9, "invalid\\7":Z
    move-object v10, v4

    .local v10, "$this$cache\\7":Landroidx/compose/runtime/Composer;
    const/4 v11, 0x0

    .line 104
    .local v11, "$i$f$cache\\7\\25":I
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v12

    .local v12, "it\\7":Ljava/lang/Object;
    const/4 v13, 0x0

    .line 105
    .local v13, "$i$a$-let-ComposerKt$cache$1\\8\\104\\7":I
    if-nez v9, :cond_e

    sget-object v14, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v14}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v14

    if-ne v12, v14, :cond_d

    goto :goto_9

    .line 109
    :cond_d
    goto :goto_a

    .line 106
    :cond_e
    :goto_9
    const/4 v14, 0x0

    .line 25
    .local v14, "$i$a$-cache-SearchScreenKt$SearchScreen$1\\9\\106\\0":I
    new-instance v15, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$1$1;

    invoke-direct {v15, v5, v6, v7}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$1$1;-><init>(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V

    check-cast v15, Lkotlin/jvm/functions/Function2;

    .line 106
    .end local v14    # "$i$a$-cache-SearchScreenKt$SearchScreen$1\\9\\106\\0":I
    nop

    .line 107
    .local v15, "value\\8":Ljava/lang/Object;
    invoke-interface {v10, v15}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 108
    move-object v12, v15

    .line 104
    .end local v12    # "it\\7":Ljava/lang/Object;
    .end local v13    # "$i$a$-let-ComposerKt$cache$1\\8\\104\\7":I
    .end local v15    # "value\\8":Ljava/lang/Object;
    :goto_a
    nop

    .line 25
    .end local v9    # "invalid\\7":Z
    .end local v10    # "$this$cache\\7":Landroidx/compose/runtime/Composer;
    .end local v11    # "$i$f$cache\\7\\25":I
    check-cast v12, Lkotlin/jvm/functions/Function2;

    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    const/4 v7, 0x0

    invoke-static {v8, v12, v4, v7}, Landroidx/compose/runtime/EffectsKt;->LaunchedEffect(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V

    .line 28
    new-instance v7, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda8;

    invoke-direct {v7, v6, v0}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda8;-><init>(Landroidx/compose/runtime/MutableState;Landroidx/navigation/NavHostController;)V

    const v8, -0x73df6e8f

    const/16 v9, 0x36

    const/4 v10, 0x1

    invoke-static {v8, v10, v7, v4, v9}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v7

    check-cast v7, Lkotlin/jvm/functions/Function2;

    .line 54
    new-instance v8, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda9;

    invoke-direct {v8, v3, v0}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda9;-><init>(Landroidx/compose/runtime/State;Landroidx/navigation/NavHostController;)V

    const v11, -0x404288ba

    invoke-static {v11, v10, v8, v4, v9}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v8

    move-object v15, v8

    check-cast v15, Lkotlin/jvm/functions/Function3;

    .line 27
    move-object/from16 v17, v4

    .end local v4    # "$composer":Landroidx/compose/runtime/Composer;
    .local v17, "$composer":Landroidx/compose/runtime/Composer;
    const/4 v4, 0x0

    move-object v8, v6

    .end local v6    # "query$delegate":Landroidx/compose/runtime/MutableState;
    .local v8, "query$delegate":Landroidx/compose/runtime/MutableState;
    const/4 v6, 0x0

    move-object v9, v5

    move-object v5, v7

    .end local v5    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v9, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    const/4 v7, 0x0

    move-object v10, v8

    .end local v8    # "query$delegate":Landroidx/compose/runtime/MutableState;
    .local v10, "query$delegate":Landroidx/compose/runtime/MutableState;
    const/4 v8, 0x0

    move-object v11, v9

    .end local v9    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v11, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    const/4 v9, 0x0

    move-object v13, v10

    move-object v12, v11

    .end local v10    # "query$delegate":Landroidx/compose/runtime/MutableState;
    .end local v11    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v12, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v13, "query$delegate":Landroidx/compose/runtime/MutableState;
    const-wide/16 v10, 0x0

    move-object v14, v12

    move-object/from16 v16, v13

    .end local v12    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .end local v13    # "query$delegate":Landroidx/compose/runtime/MutableState;
    .local v14, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v16, "query$delegate":Landroidx/compose/runtime/MutableState;
    const-wide/16 v12, 0x0

    move-object/from16 v19, v14

    .end local v14    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v19, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    const/4 v14, 0x0

    move-object/from16 v20, v16

    move-object/from16 v16, v17

    .end local v17    # "$composer":Landroidx/compose/runtime/Composer;
    .local v16, "$composer":Landroidx/compose/runtime/Composer;
    .local v20, "query$delegate":Landroidx/compose/runtime/MutableState;
    const v17, 0x30000030

    move/from16 v21, v18

    .end local v18    # "$dirty":I
    .local v21, "$dirty":I
    const/16 v18, 0x1fd

    invoke-static/range {v4 .. v18}, Landroidx/compose/material3/ScaffoldKt;->Scaffold-TvnljyQ(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;IJJLandroidx/compose/foundation/layout/WindowInsets;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V

    move-object/from16 v17, v16

    .end local v16    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v17    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v4

    if-eqz v4, :cond_f

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 83
    .end local v3    # "results$delegate":Landroidx/compose/runtime/State;
    .end local v20    # "query$delegate":Landroidx/compose/runtime/MutableState;
    :cond_f
    move-object/from16 v6, v19

    move/from16 v5, v21

    goto :goto_b

    .line 19
    .end local v17    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v19    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .end local v21    # "$dirty":I
    .restart local v4    # "$composer":Landroidx/compose/runtime/Composer;
    .local v5, "$dirty":I
    .restart local p1    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    :cond_10
    move-object/from16 v17, v4

    .end local v4    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v17    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface/range {v17 .. v17}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 83
    .end local p1    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v6, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    :goto_b
    invoke-interface/range {v17 .. v17}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v3

    if-eqz v3, :cond_11

    new-instance v4, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda10;

    invoke-direct {v4, v0, v6, v1, v2}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda10;-><init>(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;II)V

    invoke-interface {v3, v4}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_11
    return-void
.end method

.method private static final SearchScreen$lambda$0(Landroidx/compose/runtime/State;)Ljava/util/List;
    .locals 4
    .param p0, "$results$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/State<",
            "+",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;>;)",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;"
        }
    .end annotation

    .line 22
    const/4 v0, 0x0

    .local v0, "this_\\1":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property\\1":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue\\1":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 110
    .local v3, "$i$f$getValue\\1\\22":I
    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "this_\\1":Ljava/lang/Object;
    .end local v1    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$getValue\\1":Landroidx/compose/runtime/State;
    .end local v3    # "$i$f$getValue\\1\\22":I
    check-cast v0, Ljava/util/List;

    .line 22
    return-object v0
.end method

.method static final SearchScreen$lambda$14(Landroidx/compose/runtime/MutableState;Landroidx/navigation/NavHostController;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 12
    .param p0, "$query$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p1, "$navController"    # Landroidx/navigation/NavHostController;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    move-object v8, p2

    move v11, p3

    const-string v0, "C29@1127L735,46@1897L192,28@1092L1011:SearchScreen.kt#4cebsy"

    invoke-static {p2, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, v11, 0x3

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq v0, v1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    and-int/lit8 v1, v11, 0x1

    invoke-interface {p2, v0, v1}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.SearchScreen.<anonymous> (SearchScreen.kt:28)"

    const v3, -0x73df6e8f

    invoke-static {v3, p3, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 30
    :cond_1
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda1;-><init>(Landroidx/compose/runtime/MutableState;)V

    const v1, -0x5c61bbcb

    const/16 v3, 0x36

    invoke-static {v1, v2, v0, p2, v3}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    check-cast v0, Lkotlin/jvm/functions/Function2;

    .line 47
    new-instance v1, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda2;-><init>(Landroidx/navigation/NavHostController;)V

    const v4, -0x35b8fe49

    invoke-static {v4, v2, v1, p2, v3}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lkotlin/jvm/functions/Function2;

    .line 29
    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/16 v9, 0x186

    const/16 v10, 0xfa

    invoke-static/range {v0 .. v10}, Landroidx/compose/material3/AppBarKt;->TopAppBar-GHTll3U(Lkotlin/jvm/functions/Function2;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;FLandroidx/compose/foundation/layout/WindowInsets;Landroidx/compose/material3/TopAppBarColors;Landroidx/compose/material3/TopAppBarScrollBehavior;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    .line 28
    :cond_2
    invoke-interface {p2}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 53
    :cond_3
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final SearchScreen$lambda$14$lambda$10(Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 29
    .param p0, "$query$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    const-string v3, "C36@1481L6,32@1247L14,37@1535L287,30@1149L695:SearchScreen.kt#4cebsy"

    invoke-static {v1, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v3, v2, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eq v3, v4, :cond_0

    move v3, v5

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    and-int/lit8 v4, v2, 0x1

    invoke-interface {v1, v3, v4}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v3, -0x1

    const-string v4, "com.hardlineforge.lala.ui.screens.SearchScreen.<anonymous>.<anonymous> (SearchScreen.kt:30)"

    const v6, -0x5c61bbcb

    invoke-static {v6, v2, v3, v4}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 32
    :cond_1
    invoke-static {v0}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt;->SearchScreen$lambda$2(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v3

    .line 36
    sget-object v4, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v4, Landroidx/compose/ui/Modifier;

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static {v4, v6, v5, v7}, Landroidx/compose/foundation/layout/SizeKt;->fillMaxWidth$default(Landroidx/compose/ui/Modifier;FILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v4

    .line 37
    sget-object v6, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v7, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v6, v1, v7}, Landroidx/compose/material3/MaterialTheme;->getShapes(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Shapes;

    move-result-object v6

    invoke-virtual {v6}, Landroidx/compose/material3/Shapes;->getMedium()Landroidx/compose/foundation/shape/CornerBasedShape;

    move-result-object v6

    .line 32
    nop

    .line 33
    const v7, 0x351e1a03

    const-string v8, "CC(remember):SearchScreen.kt#9igjgp"

    invoke-static {v1, v7, v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v7, 0x0

    .local v7, "invalid\\1":Z
    move-object/from16 v8, p1

    .local v8, "$this$cache\\1":Landroidx/compose/runtime/Composer;
    const/4 v9, 0x0

    .line 120
    .local v9, "$i$f$cache\\1\\33":I
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v10

    .local v10, "it\\1":Ljava/lang/Object;
    const/4 v11, 0x0

    .line 121
    .local v11, "$i$a$-let-ComposerKt$cache$1\\2\\120\\1":I
    sget-object v12, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v12}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v12

    if-ne v10, v12, :cond_2

    .line 122
    const/4 v12, 0x0

    .line 33
    .local v12, "$i$a$-cache-SearchScreenKt$SearchScreen$2$1$1\\3\\122\\0":I
    new-instance v13, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda5;

    invoke-direct {v13, v0}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda5;-><init>(Landroidx/compose/runtime/MutableState;)V

    .line 122
    .end local v12    # "$i$a$-cache-SearchScreenKt$SearchScreen$2$1$1\\3\\122\\0":I
    nop

    .line 123
    .local v13, "value\\2":Ljava/lang/Object;
    invoke-interface {v8, v13}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 124
    move-object v10, v13

    .end local v13    # "value\\2":Ljava/lang/Object;
    goto :goto_1

    .line 125
    :cond_2
    nop

    .line 120
    .end local v10    # "it\\1":Ljava/lang/Object;
    .end local v11    # "$i$a$-let-ComposerKt$cache$1\\2\\120\\1":I
    :goto_1
    nop

    .line 33
    .end local v7    # "invalid\\1":Z
    .end local v8    # "$this$cache\\1":Landroidx/compose/runtime/Composer;
    .end local v9    # "$i$f$cache\\1\\33":I
    check-cast v10, Lkotlin/jvm/functions/Function1;

    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 36
    sget-object v7, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$SearchScreenKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$SearchScreenKt;

    invoke-virtual {v7}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$SearchScreenKt;->getLambda$2026943214$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v8

    .line 38
    new-instance v7, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda6;

    invoke-direct {v7, v0}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda6;-><init>(Landroidx/compose/runtime/MutableState;)V

    const/16 v9, 0x36

    const v11, 0x131f3a2c

    invoke-static {v11, v5, v7, v1, v9}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v5

    check-cast v5, Lkotlin/jvm/functions/Function2;

    .line 35
    nop

    .line 37
    move-object/from16 v22, v6

    check-cast v22, Landroidx/compose/ui/graphics/Shape;

    .line 31
    move-object v1, v3

    move-object v3, v4

    const/4 v4, 0x0

    move-object v2, v10

    move-object v10, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x1

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v23, 0x0

    const v25, 0x30c001b0

    const/high16 v26, 0xc00000

    const/16 v27, 0x0

    const v28, 0x5dfd78

    move-object/from16 v24, p1

    invoke-static/range {v1 .. v28}, Landroidx/compose/material3/OutlinedTextFieldKt;->OutlinedTextField(Ljava/lang/String;Lkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;ZZLandroidx/compose/ui/text/TextStyle;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZLandroidx/compose/ui/text/input/VisualTransformation;Landroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/KeyboardActions;ZIILandroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material3/TextFieldColors;Landroidx/compose/runtime/Composer;IIII)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_2

    .line 30
    :cond_3
    invoke-interface/range {p1 .. p1}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 46
    :cond_4
    :goto_2
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1
.end method

.method static final SearchScreen$lambda$14$lambda$10$lambda$6$lambda$5(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)Lkotlin/Unit;
    .locals 1
    .param p0, "$query$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p1, "it"    # Ljava/lang/String;

    const-string v0, "it"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    invoke-static {p0, p1}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt;->SearchScreen$lambda$3(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final SearchScreen$lambda$14$lambda$10$lambda$9(Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 13
    .param p0, "$query$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    const-string v0, "C:SearchScreen.kt#4cebsy"

    invoke-static {p1, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, p2, 0x3

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v0, v1, :cond_0

    move v0, v3

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    and-int/lit8 v1, p2, 0x1

    invoke-interface {p1, v0, v1}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.SearchScreen.<anonymous>.<anonymous>.<anonymous> (SearchScreen.kt:38)"

    const v4, 0x131f3a2c

    invoke-static {v4, p2, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 39
    :cond_1
    invoke-static {p0}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt;->SearchScreen$lambda$2(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_2

    move v2, v3

    :cond_2
    if-eqz v2, :cond_4

    const v0, 0x3ef370a7

    invoke-interface {p1, v0}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v0, "39@1644L14,39@1623L143"

    invoke-static {p1, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 40
    const v0, -0x37c69326

    const-string v1, "CC(remember):SearchScreen.kt#9igjgp"

    invoke-static {p1, v0, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v0, 0x0

    .local v0, "invalid\\1":Z
    move-object v1, p1

    .local v1, "$this$cache\\1":Landroidx/compose/runtime/Composer;
    const/4 v2, 0x0

    .line 114
    .local v2, "$i$f$cache\\1\\40":I
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v3

    .local v3, "it\\1":Ljava/lang/Object;
    const/4 v4, 0x0

    .line 115
    .local v4, "$i$a$-let-ComposerKt$cache$1\\2\\114\\1":I
    sget-object v5, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v5}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v5

    if-ne v3, v5, :cond_3

    .line 116
    const/4 v5, 0x0

    .line 40
    .local v5, "$i$a$-cache-SearchScreenKt$SearchScreen$2$1$2$1\\3\\116\\0":I
    new-instance v6, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda0;

    invoke-direct {v6, p0}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda0;-><init>(Landroidx/compose/runtime/MutableState;)V

    .line 116
    .end local v5    # "$i$a$-cache-SearchScreenKt$SearchScreen$2$1$2$1\\3\\116\\0":I
    nop

    .line 117
    .local v6, "value\\2":Ljava/lang/Object;
    invoke-interface {v1, v6}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 118
    move-object v3, v6

    .end local v6    # "value\\2":Ljava/lang/Object;
    goto :goto_1

    .line 119
    :cond_3
    nop

    .line 114
    .end local v3    # "it\\1":Ljava/lang/Object;
    .end local v4    # "$i$a$-let-ComposerKt$cache$1\\2\\114\\1":I
    :goto_1
    nop

    .line 40
    .end local v0    # "invalid\\1":Z
    .end local v1    # "$this$cache\\1":Landroidx/compose/runtime/Composer;
    .end local v2    # "$i$f$cache\\1\\40":I
    move-object v4, v3

    check-cast v4, Lkotlin/jvm/functions/Function0;

    invoke-static {p1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    sget-object v0, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$SearchScreenKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$SearchScreenKt;

    invoke-virtual {v0}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$SearchScreenKt;->getLambda$1953766196$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v9

    const v11, 0x30006

    const/16 v12, 0x1e

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v10, p1

    .end local p1    # "$composer":Landroidx/compose/runtime/Composer;
    .local v10, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v4 .. v12}, Landroidx/compose/material3/IconButtonKt;->IconButton(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/material3/IconButtonColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V

    .line 39
    goto :goto_2

    .end local v10    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local p1    # "$composer":Landroidx/compose/runtime/Composer;
    :cond_4
    move-object v10, p1

    .end local p1    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v10    # "$composer":Landroidx/compose/runtime/Composer;
    const p1, 0x3edb4656

    invoke-interface {v10, p1}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    :goto_2
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_3

    .line 38
    .end local v10    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local p1    # "$composer":Landroidx/compose/runtime/Composer;
    :cond_5
    move-object v10, p1

    .end local p1    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v10    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 44
    :cond_6
    :goto_3
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method

.method static final SearchScreen$lambda$14$lambda$10$lambda$9$lambda$8$lambda$7(Landroidx/compose/runtime/MutableState;)Lkotlin/Unit;
    .locals 1
    .param p0, "$query$delegate"    # Landroidx/compose/runtime/MutableState;

    .line 40
    const-string v0, ""

    invoke-static {p0, v0}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt;->SearchScreen$lambda$3(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final SearchScreen$lambda$14$lambda$13(Landroidx/navigation/NavHostController;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 13
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    const-string v0, "C47@1940L32,47@1919L152:SearchScreen.kt#4cebsy"

    invoke-static {p1, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, p2, 0x3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    and-int/lit8 v1, p2, 0x1

    invoke-interface {p1, v0, v1}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.SearchScreen.<anonymous>.<anonymous> (SearchScreen.kt:47)"

    const v2, -0x35b8fe49

    invoke-static {v2, p2, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 48
    :cond_1
    const v0, 0x548d7577

    const-string v1, "CC(remember):SearchScreen.kt#9igjgp"

    invoke-static {p1, v0, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {p1, p0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v0

    .local v0, "invalid\\1":Z
    move-object v1, p1

    .local v1, "$this$cache\\1":Landroidx/compose/runtime/Composer;
    const/4 v2, 0x0

    .line 126
    .local v2, "$i$f$cache\\1\\48":I
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v3

    .local v3, "it\\1":Ljava/lang/Object;
    const/4 v4, 0x0

    .line 127
    .local v4, "$i$a$-let-ComposerKt$cache$1\\2\\126\\1":I
    if-nez v0, :cond_3

    sget-object v5, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v5}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v5

    if-ne v3, v5, :cond_2

    goto :goto_1

    .line 131
    :cond_2
    goto :goto_2

    .line 128
    :cond_3
    :goto_1
    const/4 v5, 0x0

    .line 48
    .local v5, "$i$a$-cache-SearchScreenKt$SearchScreen$2$2$1\\3\\128\\0":I
    new-instance v6, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda7;

    invoke-direct {v6, p0}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda7;-><init>(Landroidx/navigation/NavHostController;)V

    .line 128
    .end local v5    # "$i$a$-cache-SearchScreenKt$SearchScreen$2$2$1\\3\\128\\0":I
    nop

    .line 129
    .local v6, "value\\2":Ljava/lang/Object;
    invoke-interface {v1, v6}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 130
    move-object v3, v6

    .line 126
    .end local v3    # "it\\1":Ljava/lang/Object;
    .end local v4    # "$i$a$-let-ComposerKt$cache$1\\2\\126\\1":I
    .end local v6    # "value\\2":Ljava/lang/Object;
    :goto_2
    nop

    .line 48
    .end local v0    # "invalid\\1":Z
    .end local v1    # "$this$cache\\1":Landroidx/compose/runtime/Composer;
    .end local v2    # "$i$f$cache\\1\\48":I
    move-object v4, v3

    check-cast v4, Lkotlin/jvm/functions/Function0;

    invoke-static {p1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    sget-object v0, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$SearchScreenKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$SearchScreenKt;

    invoke-virtual {v0}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$SearchScreenKt;->getLambda$909937556$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v9

    const/high16 v11, 0x30000

    const/16 v12, 0x1e

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v10, p1

    .end local p1    # "$composer":Landroidx/compose/runtime/Composer;
    .local v10, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v4 .. v12}, Landroidx/compose/material3/IconButtonKt;->IconButton(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/material3/IconButtonColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_3

    .line 47
    .end local v10    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local p1    # "$composer":Landroidx/compose/runtime/Composer;
    :cond_4
    move-object v10, p1

    .end local p1    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v10    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 51
    :cond_5
    :goto_3
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method

.method static final SearchScreen$lambda$14$lambda$13$lambda$12$lambda$11(Landroidx/navigation/NavHostController;)Lkotlin/Unit;
    .locals 1
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;

    .line 48
    invoke-virtual {p0}, Landroidx/navigation/NavHostController;->popBackStack()Z

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final SearchScreen$lambda$2(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;
    .locals 4
    .param p0, "$query$delegate"    # Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 23
    move-object v0, p0

    check-cast v0, Landroidx/compose/runtime/State;

    .local v0, "$this$getValue\\1":Landroidx/compose/runtime/State;
    const/4 v1, 0x0

    .local v1, "this_\\1":Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "property\\1":Lkotlin/reflect/KProperty;
    const/4 v3, 0x0

    .line 111
    .local v3, "$i$f$getValue\\1\\23":I
    invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "$this$getValue\\1":Landroidx/compose/runtime/State;
    .end local v1    # "this_\\1":Ljava/lang/Object;
    .end local v2    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v3    # "$i$f$getValue\\1\\23":I
    check-cast v0, Ljava/lang/String;

    .line 23
    return-object v0
.end method

.method static final SearchScreen$lambda$20(Landroidx/compose/runtime/State;Landroidx/navigation/NavHostController;Landroidx/compose/foundation/layout/PaddingValues;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 17
    .param p0, "$results$delegate"    # Landroidx/compose/runtime/State;
    .param p1, "$navController"    # Landroidx/navigation/NavHostController;
    .param p2, "padding"    # Landroidx/compose/foundation/layout/PaddingValues;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v13, p3

    const-string v3, "padding"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "C58@2326L924,54@2141L1109:SearchScreen.kt#4cebsy"

    invoke-static {v13, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v3, p4

    .local v3, "$dirty":I
    and-int/lit8 v4, p4, 0x6

    if-nez v4, :cond_1

    invoke-interface {v13, v2}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x4

    goto :goto_0

    :cond_0
    const/4 v4, 0x2

    :goto_0
    or-int/2addr v3, v4

    :cond_1
    and-int/lit8 v4, v3, 0x13

    const/16 v5, 0x12

    if-eq v4, v5, :cond_2

    const/4 v4, 0x1

    goto :goto_1

    :cond_2
    const/4 v4, 0x0

    :goto_1
    and-int/lit8 v5, v3, 0x1

    invoke-interface {v13, v4, v5}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v4

    if-eqz v4, :cond_3

    const/4 v4, -0x1

    const-string v5, "com.hardlineforge.lala.ui.screens.SearchScreen.<anonymous> (SearchScreen.kt:54)"

    const v6, -0x404288ba

    invoke-static {v6, v3, v4, v5}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 56
    :cond_3
    sget-object v4, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v4, Landroidx/compose/ui/Modifier;

    invoke-static {v4, v2}, Landroidx/compose/foundation/layout/PaddingKt;->padding(Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/layout/PaddingValues;)Landroidx/compose/ui/Modifier;

    move-result-object v4

    .line 57
    const/16 v5, 0x10

    .local v5, "$this$dp\\1":I
    const/4 v6, 0x0

    .line 145
    .local v6, "$i$f$getDp\\1\\57":I
    int-to-float v7, v5

    invoke-static {v7}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v5

    .line 57
    .end local v5    # "$this$dp\\1":I
    .end local v6    # "$i$f$getDp\\1\\57":I
    invoke-static {v5}, Landroidx/compose/foundation/layout/PaddingKt;->PaddingValues-0680j_4(F)Landroidx/compose/foundation/layout/PaddingValues;

    move-result-object v5

    .line 58
    sget-object v6, Landroidx/compose/foundation/layout/Arrangement;->INSTANCE:Landroidx/compose/foundation/layout/Arrangement;

    const/16 v7, 0xc

    .local v7, "$this$dp\\2":I
    const/4 v8, 0x0

    .line 146
    .local v8, "$i$f$getDp\\2\\58":I
    int-to-float v9, v7

    invoke-static {v9}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v7

    .line 58
    .end local v7    # "$this$dp\\2":I
    .end local v8    # "$i$f$getDp\\2\\58":I
    invoke-virtual {v6, v7}, Landroidx/compose/foundation/layout/Arrangement;->spacedBy-0680j_4(F)Landroidx/compose/foundation/layout/Arrangement$HorizontalOrVertical;

    move-result-object v6

    move-object v7, v6

    check-cast v7, Landroidx/compose/foundation/layout/Arrangement$Vertical;

    .line 59
    const v6, -0x39c324de

    const-string v8, "CC(remember):SearchScreen.kt#9igjgp"

    invoke-static {v13, v6, v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v13, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v6

    invoke-interface {v13, v1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v8

    or-int/2addr v6, v8

    .local v6, "invalid\\3":Z
    move-object/from16 v8, p3

    .local v8, "$this$cache\\3":Landroidx/compose/runtime/Composer;
    const/4 v9, 0x0

    .line 147
    .local v9, "$i$f$cache\\3\\59":I
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v10

    .local v10, "it\\3":Ljava/lang/Object;
    const/4 v11, 0x0

    .line 148
    .local v11, "$i$a$-let-ComposerKt$cache$1\\4\\147\\3":I
    if-nez v6, :cond_5

    sget-object v12, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v12}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v12

    if-ne v10, v12, :cond_4

    goto :goto_2

    .line 152
    :cond_4
    goto :goto_3

    .line 149
    :cond_5
    :goto_2
    const/4 v12, 0x0

    .line 59
    .local v12, "$i$a$-cache-SearchScreenKt$SearchScreen$3$1\\5\\149\\0":I
    new-instance v14, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda3;

    invoke-direct {v14, v0, v1}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda3;-><init>(Landroidx/compose/runtime/State;Landroidx/navigation/NavHostController;)V

    .line 149
    .end local v12    # "$i$a$-cache-SearchScreenKt$SearchScreen$3$1\\5\\149\\0":I
    nop

    .line 150
    .local v14, "value\\4":Ljava/lang/Object;
    invoke-interface {v8, v14}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 151
    move-object v10, v14

    .line 147
    .end local v10    # "it\\3":Ljava/lang/Object;
    .end local v11    # "$i$a$-let-ComposerKt$cache$1\\4\\147\\3":I
    .end local v14    # "value\\4":Ljava/lang/Object;
    :goto_3
    nop

    .line 59
    .end local v6    # "invalid\\3":Z
    .end local v8    # "$this$cache\\3":Landroidx/compose/runtime/Composer;
    .end local v9    # "$i$f$cache\\3\\59":I
    move-object v12, v10

    check-cast v12, Lkotlin/jvm/functions/Function1;

    invoke-static {v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 55
    move v6, v3

    move-object v3, v4

    .end local v3    # "$dirty":I
    .local v6, "$dirty":I
    const/4 v4, 0x0

    move v8, v6

    .end local v6    # "$dirty":I
    .local v8, "$dirty":I
    const/4 v6, 0x0

    move v9, v8

    .end local v8    # "$dirty":I
    .local v9, "$dirty":I
    const/4 v8, 0x0

    move v10, v9

    .end local v9    # "$dirty":I
    .local v10, "$dirty":I
    const/4 v9, 0x0

    move v11, v10

    .end local v10    # "$dirty":I
    .local v11, "$dirty":I
    const/4 v10, 0x0

    move v14, v11

    .end local v11    # "$dirty":I
    .local v14, "$dirty":I
    const/4 v11, 0x0

    move v15, v14

    .end local v14    # "$dirty":I
    .local v15, "$dirty":I
    const/16 v14, 0x6180

    move/from16 v16, v15

    .end local v15    # "$dirty":I
    .local v16, "$dirty":I
    const/16 v15, 0x1ea

    invoke-static/range {v3 .. v15}, Landroidx/compose/foundation/lazy/LazyDslKt;->LazyColumn(Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/lazy/LazyListState;Landroidx/compose/foundation/layout/PaddingValues;ZLandroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/ui/Alignment$Horizontal;Landroidx/compose/foundation/gestures/FlingBehavior;ZLandroidx/compose/foundation/OverscrollEffect;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_4

    .line 54
    .end local v16    # "$dirty":I
    .restart local v3    # "$dirty":I
    :cond_6
    move/from16 v16, v3

    .end local v3    # "$dirty":I
    .restart local v16    # "$dirty":I
    invoke-interface/range {p3 .. p3}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 82
    :cond_7
    :goto_4
    sget-object v3, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v3
.end method

.method static final SearchScreen$lambda$20$lambda$19$lambda$18(Landroidx/compose/runtime/State;Landroidx/navigation/NavHostController;Landroidx/compose/foundation/lazy/LazyListScope;)Lkotlin/Unit;
    .locals 11
    .param p0, "$results$delegate"    # Landroidx/compose/runtime/State;
    .param p1, "$navController"    # Landroidx/navigation/NavHostController;
    .param p2, "$this$LazyColumn"    # Landroidx/compose/foundation/lazy/LazyListScope;

    const-string v0, "$this$LazyColumn"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    invoke-static {p0}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt;->SearchScreen$lambda$0(Landroidx/compose/runtime/State;)Ljava/util/List;

    move-result-object v0

    .local v0, "items\\1":Ljava/util/List;
    new-instance v1, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda4;

    invoke-direct {v1}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$$ExternalSyntheticLambda4;-><init>()V

    .local v1, "key\\1":Lkotlin/jvm/functions/Function1;
    move-object v2, p2

    .line 132
    .local v2, "$this$items_u24default\\1":Landroidx/compose/foundation/lazy/LazyListScope;
    nop

    .line 135
    sget-object v3, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$lambda$20$lambda$19$lambda$18$$inlined$items$default$1;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$lambda$20$lambda$19$lambda$18$$inlined$items$default$1;

    check-cast v3, Lkotlin/jvm/functions/Function1;

    .line 132
    .local v3, "contentType\\1":Lkotlin/jvm/functions/Function1;
    const/4 v4, 0x0

    .line 138
    .local v4, "$i$f$items\\1\\60":I
    nop

    .line 139
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    .line 140
    nop

    .line 138
    new-instance v6, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$lambda$20$lambda$19$lambda$18$$inlined$items$default$2;

    invoke-direct {v6, v1, v0}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$lambda$20$lambda$19$lambda$18$$inlined$items$default$2;-><init>(Lkotlin/jvm/functions/Function1;Ljava/util/List;)V

    check-cast v6, Lkotlin/jvm/functions/Function1;

    new-instance v7, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$lambda$20$lambda$19$lambda$18$$inlined$items$default$3;

    invoke-direct {v7, v3, v0}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$lambda$20$lambda$19$lambda$18$$inlined$items$default$3;-><init>(Lkotlin/jvm/functions/Function1;Ljava/util/List;)V

    check-cast v7, Lkotlin/jvm/functions/Function1;

    .line 142
    new-instance v8, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$lambda$20$lambda$19$lambda$18$$inlined$items$default$4;

    invoke-direct {v8, v0, p1}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$lambda$20$lambda$19$lambda$18$$inlined$items$default$4;-><init>(Ljava/util/List;Landroidx/navigation/NavHostController;)V

    const v9, -0x25b7f321

    const/4 v10, 0x1

    invoke-static {v9, v10, v8}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v8

    check-cast v8, Lkotlin/jvm/functions/Function4;

    .line 138
    invoke-interface {v2, v5, v6, v7, v8}, Landroidx/compose/foundation/lazy/LazyListScope;->items(ILkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function4;)V

    .line 144
    nop

    .line 81
    .end local v0    # "items\\1":Ljava/util/List;
    .end local v1    # "key\\1":Lkotlin/jvm/functions/Function1;
    .end local v2    # "$this$items_u24default\\1":Landroidx/compose/foundation/lazy/LazyListScope;
    .end local v3    # "contentType\\1":Lkotlin/jvm/functions/Function1;
    .end local v4    # "$i$f$items\\1\\60":I
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final SearchScreen$lambda$20$lambda$19$lambda$18$lambda$15(Lcom/hardlineforge/lala/data/LogEntry;)Ljava/lang/Object;
    .locals 1
    .param p0, "it"    # Lcom/hardlineforge/lala/data/LogEntry;

    const-string v0, "it"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    invoke-virtual {p0}, Lcom/hardlineforge/lala/data/LogEntry;->getId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static final SearchScreen$lambda$21(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 1

    or-int/lit8 v0, p2, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v0

    invoke-static {p0, p1, p4, v0, p3}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt;->SearchScreen(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final SearchScreen$lambda$3(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V
    .locals 5
    .param p0, "$query$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p1, "<set-?>"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 23
    const/4 v0, 0x0

    .local v0, "this_\\1":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property\\1":Lkotlin/reflect/KProperty;
    move-object v2, p1

    .local v2, "value\\1":Ljava/lang/Object;
    move-object v3, p0

    .local v3, "$this$setValue\\1":Landroidx/compose/runtime/MutableState;
    const/4 v4, 0x0

    .line 112
    .local v4, "$i$f$setValue\\1\\23":I
    invoke-interface {v3, v2}, Landroidx/compose/runtime/MutableState;->setValue(Ljava/lang/Object;)V

    .line 113
    nop

    .line 23
    .end local v0    # "this_\\1":Ljava/lang/Object;
    .end local v1    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v2    # "value\\1":Ljava/lang/Object;
    .end local v3    # "$this$setValue\\1":Landroidx/compose/runtime/MutableState;
    .end local v4    # "$i$f$setValue\\1\\23":I
    return-void
.end method

.method public static final synthetic access$SearchScreen$lambda$2(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;
    .locals 1
    .param p0, "$query$delegate"    # Landroidx/compose/runtime/MutableState;

    .line 1
    invoke-static {p0}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt;->SearchScreen$lambda$2(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
