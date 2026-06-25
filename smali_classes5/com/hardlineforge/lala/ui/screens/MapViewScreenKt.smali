.class public final Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt;
.super Ljava/lang/Object;
.source "MapViewScreen.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nMapViewScreen.kt\nKotlin\n*S Kotlin\n*F\n+ 1 MapViewScreen.kt\ncom/hardlineforge/lala/ui/screens/MapViewScreenKt\n+ 2 HiltViewModel.kt\nandroidx/hilt/navigation/compose/HiltViewModelKt\n+ 3 ViewModel.kt\nandroidx/lifecycle/viewmodel/compose/ViewModelKt\n+ 4 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 5 SnapshotState.kt\nandroidx/compose/runtime/SnapshotStateKt__SnapshotStateKt\n+ 6 Size.kt\nandroidx/compose/ui/geometry/Size\n+ 7 InlineClassHelper.kt\nandroidx/compose/ui/util/InlineClassHelperKt\n+ 8 InlineClassHelper.jvm.kt\nandroidx/compose/ui/util/InlineClassHelper_jvmKt\n+ 9 Offset.kt\nandroidx/compose/ui/geometry/OffsetKt\n+ 10 Box.kt\nandroidx/compose/foundation/layout/BoxKt\n+ 11 Layout.kt\nandroidx/compose/ui/layout/LayoutKt\n+ 12 Composables.kt\nandroidx/compose/runtime/ComposablesKt\n+ 13 Composer.kt\nandroidx/compose/runtime/Updater\n+ 14 Dp.kt\nandroidx/compose/ui/unit/DpKt\n+ 15 Composer.kt\nandroidx/compose/runtime/ComposerKt\n*L\n1#1,53:1\n46#2,7:54\n86#3,6:61\n774#4:67\n865#4,2:68\n1869#4:77\n1870#4:82\n1563#4:119\n1634#4,3:120\n1563#4:123\n1634#4,3:124\n85#5:70\n57#6:71\n61#6:74\n60#7:72\n70#7:75\n53#7,3:79\n22#8:73\n22#8:76\n30#9:78\n70#10:83\n68#10,8:84\n77#10:137\n79#11,6:92\n86#11,3:107\n89#11,2:116\n93#11:136\n347#12,9:98\n356#12:118\n357#12,2:134\n4206#13,6:110\n113#14:127\n1247#15,6:128\n*S KotlinDebug\n*F\n+ 1 MapViewScreen.kt\ncom/hardlineforge/lala/ui/screens/MapViewScreenKt\n*L\n17#1:54,7\n17#1:61,6\n19#1:67\n19#1:68,2\n43#1:77\n43#1:82\n29#1:119\n29#1:120,3\n30#1:123\n30#1:124,3\n18#1:70\n40#1:71\n41#1:74\n40#1:72\n41#1:75\n46#1:79,3\n40#1:73\n41#1:76\n46#1:78\n24#1:83\n24#1:84,8\n24#1:137\n24#1:92,6\n24#1:107,3\n24#1:116,2\n24#1:136\n24#1:98,9\n24#1:118\n24#1:134,2\n24#1:110,6\n39#1:127\n39#1:128,6\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\u001a\u0017\u0010\u0000\u001a\u00020\u00012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003H\u0007\u00a2\u0006\u0002\u0010\u0004\u00a8\u0006\u0005\u00b2\u0006\u0010\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007X\u008a\u0084\u0002"
    }
    d2 = {
        "MapViewScreen",
        "",
        "vm",
        "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;",
        "(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V",
        "app_debug",
        "entries",
        "",
        "Lcom/hardlineforge/lala/data/LogEntry;"
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
.method public static final MapViewScreen(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V
    .locals 24
    .param p0, "vm"    # Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    .line 17
    move/from16 v0, p2

    move/from16 v1, p3

    const v2, 0x31fb44b6

    move-object/from16 v3, p1

    invoke-interface {v3, v2}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v15

    .end local p1    # "$composer":Landroidx/compose/runtime/Composer;
    .local v15, "$composer":Landroidx/compose/runtime/Composer;
    const-string v3, "C(MapViewScreen)17@659L16,22@898L1501,20@759L1640:MapViewScreen.kt#4cebsy"

    invoke-static {v15, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v3, p2

    .local v3, "$dirty":I
    and-int/lit8 v4, v0, 0x6

    const/4 v5, 0x2

    if-nez v4, :cond_2

    and-int/lit8 v4, v1, 0x1

    if-nez v4, :cond_0

    move-object/from16 v4, p0

    invoke-interface {v15, v4}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    const/4 v6, 0x4

    goto :goto_0

    :cond_0
    move-object/from16 v4, p0

    :cond_1
    move v6, v5

    :goto_0
    or-int/2addr v3, v6

    goto :goto_1

    :cond_2
    move-object/from16 v4, p0

    :goto_1
    and-int/lit8 v6, v3, 0x3

    const/4 v7, 0x0

    const/4 v8, 0x1

    if-eq v6, v5, :cond_3

    move v5, v8

    goto :goto_2

    :cond_3
    move v5, v7

    :goto_2
    and-int/lit8 v6, v3, 0x1

    invoke-interface {v15, v5, v6}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v5

    if-eqz v5, :cond_e

    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v5, "16@607L15"

    invoke-static {v15, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v5, v0, 0x1

    if-eqz v5, :cond_5

    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v5

    if-eqz v5, :cond_4

    goto :goto_3

    .line 16
    :cond_4
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v5, v1, 0x1

    if-eqz v5, :cond_8

    and-int/lit8 v3, v3, -0xf

    goto/16 :goto_5

    .line 17
    :cond_5
    :goto_3
    and-int/lit8 v5, v1, 0x1

    if-eqz v5, :cond_8

    const/4 v5, 0x0

    .local v5, "$changed\\1":I
    move-object v6, v15

    .local v6, "$composer\\1":Landroidx/compose/runtime/Composer;
    const/4 v9, 0x0

    .local v9, "$i$f$hiltViewModel\\1\\17":I
    const v10, 0x70b323c8

    invoke-interface {v6, v10}, Landroidx/compose/runtime/Composer;->startReplaceableGroup(I)V

    const-string v10, "CC(hiltViewModel)P(1)*45@1969L7,50@2112L47,51@2171L54:HiltViewModel.kt#9mcars"

    invoke-static {v6, v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 54
    sget-object v10, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->INSTANCE:Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;

    sget v11, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->$stable:I

    invoke-virtual {v10, v6, v11}, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->getCurrent(Landroidx/compose/runtime/Composer;I)Landroidx/lifecycle/ViewModelStoreOwner;

    move-result-object v17

    if-eqz v17, :cond_7

    move-object/from16 v10, v17

    .line 57
    .local v10, "viewModelStoreOwner\\1":Landroidx/lifecycle/ViewModelStoreOwner;
    const/16 v18, 0x0

    .line 59
    .local v18, "key\\1":Ljava/lang/String;
    and-int/lit8 v11, v5, 0xe

    invoke-static {v10, v6, v11}, Landroidx/hilt/navigation/compose/HiltViewModelKt;->createHiltViewModelFactory(Landroidx/lifecycle/ViewModelStoreOwner;Landroidx/compose/runtime/Composer;I)Landroidx/lifecycle/ViewModelProvider$Factory;

    move-result-object v19

    .local v19, "factory\\1":Landroidx/lifecycle/ViewModelProvider$Factory;
    and-int/lit8 v11, v5, 0xe

    and-int/lit8 v12, v5, 0x70

    or-int/2addr v11, v12

    .line 60
    nop

    .local v11, "$changed\\3":I
    const/4 v12, 0x0

    .local v12, "$i$f$viewModel\\3\\60":I
    const v13, 0x671a9c9b

    invoke-interface {v6, v13}, Landroidx/compose/runtime/Composer;->startReplaceableGroup(I)V

    const-string v13, "CC(viewModel)P(3,2,1)*80@3834L7,90@4209L68:ViewModel.kt#3tja67"

    invoke-static {v6, v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 61
    instance-of v13, v10, Landroidx/lifecycle/HasDefaultViewModelProviderFactory;

    if-eqz v13, :cond_6

    .line 62
    move-object v13, v10

    check-cast v13, Landroidx/lifecycle/HasDefaultViewModelProviderFactory;

    invoke-interface {v13}, Landroidx/lifecycle/HasDefaultViewModelProviderFactory;->getDefaultViewModelCreationExtras()Landroidx/lifecycle/viewmodel/CreationExtras;

    move-result-object v13

    move-object/from16 v20, v13

    goto :goto_4

    .line 64
    :cond_6
    sget-object v13, Landroidx/lifecycle/viewmodel/CreationExtras$Empty;->INSTANCE:Landroidx/lifecycle/viewmodel/CreationExtras$Empty;

    check-cast v13, Landroidx/lifecycle/viewmodel/CreationExtras;

    move-object/from16 v20, v13

    :goto_4
    nop

    .local v20, "extras\\3":Landroidx/lifecycle/viewmodel/CreationExtras;
    const-class v16, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    .line 66
    shl-int/lit8 v13, v11, 0x3

    and-int/lit16 v13, v13, 0x380

    const v14, 0x9048

    or-int v22, v13, v14

    const/16 v23, 0x0

    move-object/from16 v21, v6

    move-object/from16 v17, v10

    .end local v6    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .end local v10    # "viewModelStoreOwner\\1":Landroidx/lifecycle/ViewModelStoreOwner;
    .local v17, "viewModelStoreOwner\\1":Landroidx/lifecycle/ViewModelStoreOwner;
    .local v21, "$composer\\1":Landroidx/compose/runtime/Composer;
    invoke-static/range {v16 .. v23}, Landroidx/lifecycle/viewmodel/compose/ViewModelKt;->viewModel(Ljava/lang/Class;Landroidx/lifecycle/ViewModelStoreOwner;Ljava/lang/String;Landroidx/lifecycle/ViewModelProvider$Factory;Landroidx/lifecycle/viewmodel/CreationExtras;Landroidx/compose/runtime/Composer;II)Landroidx/lifecycle/ViewModel;

    move-result-object v6

    invoke-interface/range {v21 .. v21}, Landroidx/compose/runtime/Composer;->endReplaceableGroup()V

    .line 60
    .end local v11    # "$changed\\3":I
    .end local v12    # "$i$f$viewModel\\3\\60":I
    .end local v20    # "extras\\3":Landroidx/lifecycle/viewmodel/CreationExtras;
    invoke-interface/range {v21 .. v21}, Landroidx/compose/runtime/Composer;->endReplaceableGroup()V

    .end local v5    # "$changed\\1":I
    .end local v9    # "$i$f$hiltViewModel\\1\\17":I
    .end local v17    # "viewModelStoreOwner\\1":Landroidx/lifecycle/ViewModelStoreOwner;
    .end local v18    # "key\\1":Ljava/lang/String;
    .end local v19    # "factory\\1":Landroidx/lifecycle/ViewModelProvider$Factory;
    .end local v21    # "$composer\\1":Landroidx/compose/runtime/Composer;
    move-object v4, v6

    check-cast v4, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    .end local p0    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v4, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    and-int/lit8 v3, v3, -0xf

    move-object/from16 v18, v4

    goto :goto_6

    .line 54
    .end local v4    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .restart local v5    # "$changed\\1":I
    .restart local v6    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .restart local v9    # "$i$f$hiltViewModel\\1\\17":I
    .restart local p0    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    :cond_7
    const/4 v1, 0x0

    .line 55
    .local v1, "$i$a$-checkNotNull-HiltViewModelKt$hiltViewModel$1\\2\\54\\1":I
    nop

    .line 54
    .end local v1    # "$i$a$-checkNotNull-HiltViewModelKt$hiltViewModel$1\\2\\54\\1":I
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "No ViewModelStoreOwner was provided via LocalViewModelStoreOwner"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 16
    .end local v5    # "$changed\\1":I
    .end local v6    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .end local v9    # "$i$f$hiltViewModel\\1\\17":I
    :cond_8
    :goto_5
    move-object/from16 v18, v4

    .end local p0    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v18, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    :goto_6
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v4

    if-eqz v4, :cond_9

    const/4 v4, -0x1

    const-string v5, "com.hardlineforge.lala.ui.screens.MapViewScreen (MapViewScreen.kt:16)"

    invoke-static {v2, v3, v4, v5}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 18
    :cond_9
    invoke-virtual/range {v18 .. v18}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->getAllEntries()Lkotlinx/coroutines/flow/StateFlow;

    move-result-object v2

    const/4 v4, 0x0

    invoke-static {v2, v4, v15, v7, v8}, Landroidx/compose/runtime/SnapshotStateKt;->collectAsState(Lkotlinx/coroutines/flow/StateFlow;Lkotlin/coroutines/CoroutineContext;Landroidx/compose/runtime/Composer;II)Landroidx/compose/runtime/State;

    move-result-object v2

    .line 19
    .local v2, "entries$delegate":Landroidx/compose/runtime/State;
    invoke-static {v2}, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt;->MapViewScreen$lambda$0(Landroidx/compose/runtime/State;)Ljava/util/List;

    move-result-object v4

    check-cast v4, Ljava/lang/Iterable;

    .local v4, "$this$filter\\4":Ljava/lang/Iterable;
    const/4 v5, 0x0

    .line 67
    .local v5, "$i$f$filter\\4\\19":I
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    check-cast v6, Ljava/util/Collection;

    .local v6, "destination\\5":Ljava/util/Collection;
    move-object v9, v4

    .local v9, "$this$filterTo\\5":Ljava/lang/Iterable;
    const/4 v10, 0x0

    .line 68
    .local v10, "$i$f$filterTo\\5\\67":I
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_a
    :goto_7
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_c

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    .local v12, "element\\5":Ljava/lang/Object;
    move-object v13, v12

    check-cast v13, Lcom/hardlineforge/lala/data/LogEntry;

    .local v13, "it\\6":Lcom/hardlineforge/lala/data/LogEntry;
    const/4 v14, 0x0

    .line 19
    .local v14, "$i$a$-filter-MapViewScreenKt$MapViewScreen$geotagged$1\\6\\68\\0":I
    invoke-virtual {v13}, Lcom/hardlineforge/lala/data/LogEntry;->getGpsLat()Ljava/lang/Double;

    move-result-object v16

    if-eqz v16, :cond_b

    invoke-virtual {v13}, Lcom/hardlineforge/lala/data/LogEntry;->getGpsLon()Ljava/lang/Double;

    move-result-object v16

    if-eqz v16, :cond_b

    move v13, v8

    goto :goto_8

    :cond_b
    move v13, v7

    .line 68
    .end local v13    # "it\\6":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v14    # "$i$a$-filter-MapViewScreenKt$MapViewScreen$geotagged$1\\6\\68\\0":I
    :goto_8
    if-eqz v13, :cond_a

    invoke-interface {v6, v12}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_7

    .line 69
    .end local v12    # "element\\5":Ljava/lang/Object;
    :cond_c
    nop

    .end local v6    # "destination\\5":Ljava/util/Collection;
    .end local v9    # "$this$filterTo\\5":Ljava/lang/Iterable;
    .end local v10    # "$i$f$filterTo\\5\\67":I
    check-cast v6, Ljava/util/List;

    .line 67
    nop

    .line 19
    .end local v4    # "$this$filter\\4":Ljava/lang/Iterable;
    .end local v5    # "$i$f$filter\\4\\19":I
    move-object v4, v6

    .local v4, "geotagged":Ljava/util/List;
    sget-object v5, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$MapViewScreenKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$MapViewScreenKt;

    invoke-virtual {v5}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$MapViewScreenKt;->getLambda$-949274766$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v5

    .line 23
    new-instance v6, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt$$ExternalSyntheticLambda1;

    invoke-direct {v6, v4}, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt$$ExternalSyntheticLambda1;-><init>(Ljava/util/List;)V

    const/16 v7, 0x36

    const v9, 0x57f06747

    invoke-static {v9, v8, v6, v15, v7}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v6

    move-object v14, v6

    check-cast v14, Lkotlin/jvm/functions/Function3;

    .line 21
    move v6, v3

    .end local v3    # "$dirty":I
    .local v6, "$dirty":I
    const/4 v3, 0x0

    move-object v7, v4

    move-object v4, v5

    .end local v4    # "geotagged":Ljava/util/List;
    .local v7, "geotagged":Ljava/util/List;
    const/4 v5, 0x0

    move v8, v6

    .end local v6    # "$dirty":I
    .local v8, "$dirty":I
    const/4 v6, 0x0

    move-object v9, v7

    .end local v7    # "geotagged":Ljava/util/List;
    .local v9, "geotagged":Ljava/util/List;
    const/4 v7, 0x0

    move v10, v8

    .end local v8    # "$dirty":I
    .local v10, "$dirty":I
    const/4 v8, 0x0

    move-object v12, v9

    move v11, v10

    .end local v9    # "geotagged":Ljava/util/List;
    .end local v10    # "$dirty":I
    .local v11, "$dirty":I
    .local v12, "geotagged":Ljava/util/List;
    const-wide/16 v9, 0x0

    move v13, v11

    move-object/from16 v16, v12

    .end local v11    # "$dirty":I
    .end local v12    # "geotagged":Ljava/util/List;
    .local v13, "$dirty":I
    .local v16, "geotagged":Ljava/util/List;
    const-wide/16 v11, 0x0

    move/from16 v17, v13

    .end local v13    # "$dirty":I
    .local v17, "$dirty":I
    const/4 v13, 0x0

    move-object/from16 v19, v16

    .end local v16    # "geotagged":Ljava/util/List;
    .local v19, "geotagged":Ljava/util/List;
    const v16, 0x30000030

    move/from16 v20, v17

    .end local v17    # "$dirty":I
    .local v20, "$dirty":I
    const/16 v17, 0x1fd

    invoke-static/range {v3 .. v17}, Landroidx/compose/material3/ScaffoldKt;->Scaffold-TvnljyQ(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;IJJLandroidx/compose/foundation/layout/WindowInsets;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V

    move-object/from16 v21, v15

    .end local v15    # "$composer":Landroidx/compose/runtime/Composer;
    .local v21, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v3

    if-eqz v3, :cond_d

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 52
    .end local v2    # "entries$delegate":Landroidx/compose/runtime/State;
    .end local v19    # "geotagged":Ljava/util/List;
    :cond_d
    move-object/from16 v4, v18

    move/from16 v3, v20

    goto :goto_9

    .line 16
    .end local v18    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .end local v20    # "$dirty":I
    .end local v21    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v3    # "$dirty":I
    .restart local v15    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local p0    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    :cond_e
    move-object/from16 v21, v15

    .end local v15    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v21    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface/range {v21 .. v21}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 52
    .end local p0    # "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v4, "vm":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    :goto_9
    invoke-interface/range {v21 .. v21}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v2

    if-eqz v2, :cond_f

    new-instance v5, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt$$ExternalSyntheticLambda2;

    invoke-direct {v5, v4, v0, v1}, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt$$ExternalSyntheticLambda2;-><init>(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;II)V

    invoke-interface {v2, v5}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_f
    return-void
.end method

.method private static final MapViewScreen$lambda$0(Landroidx/compose/runtime/State;)Ljava/util/List;
    .locals 4
    .param p0, "$entries$delegate"    # Landroidx/compose/runtime/State;
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

    .line 18
    const/4 v0, 0x0

    .local v0, "this_\\1":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property\\1":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue\\1":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 70
    .local v3, "$i$f$getValue\\1\\18":I
    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "this_\\1":Ljava/lang/Object;
    .end local v1    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$getValue\\1":Landroidx/compose/runtime/State;
    .end local v3    # "$i$f$getValue\\1\\18":I
    check-cast v0, Ljava/util/List;

    .line 18
    return-object v0
.end method

.method static final MapViewScreen$lambda$8(Ljava/util/List;Landroidx/compose/foundation/layout/PaddingValues;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 61
    .param p0, "$geotagged"    # Ljava/util/List;
    .param p1, "padding"    # Landroidx/compose/foundation/layout/PaddingValues;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    move-object/from16 v1, p0

    move-object/from16 v12, p1

    move-object/from16 v13, p2

    const-string v0, "padding"

    invoke-static {v12, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "C23@919L1474:MapViewScreen.kt#4cebsy"

    invoke-static {v13, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v0, p3

    .local v0, "$dirty":I
    and-int/lit8 v2, p3, 0x6

    if-nez v2, :cond_1

    invoke-interface {v13, v12}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    :goto_0
    or-int/2addr v0, v2

    :cond_1
    move v14, v0

    .end local v0    # "$dirty":I
    .local v14, "$dirty":I
    and-int/lit8 v0, v14, 0x13

    const/16 v2, 0x12

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eq v0, v2, :cond_2

    move v0, v4

    goto :goto_1

    :cond_2
    move v0, v3

    :goto_1
    and-int/lit8 v2, v14, 0x1

    invoke-interface {v13, v0, v2}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, -0x1

    const-string v2, "com.hardlineforge.lala.ui.screens.MapViewScreen.<anonymous> (MapViewScreen.kt:23)"

    const v5, 0x57f06747

    invoke-static {v5, v14, v0, v2}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 24
    :cond_3
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v0, Landroidx/compose/ui/Modifier;

    invoke-static {v0, v12}, Landroidx/compose/foundation/layout/PaddingKt;->padding(Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/layout/PaddingValues;)Landroidx/compose/ui/Modifier;

    move-result-object v0

    const/4 v2, 0x0

    const/4 v5, 0x0

    invoke-static {v0, v2, v4, v5}, Landroidx/compose/foundation/layout/SizeKt;->fillMaxSize$default(Landroidx/compose/ui/Modifier;FILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v15

    .local v15, "modifier\\1":Landroidx/compose/ui/Modifier;
    sget-object v0, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/Alignment$Companion;->getCenter()Landroidx/compose/ui/Alignment;

    move-result-object v0

    .local v0, "contentAlignment\\1":Landroidx/compose/ui/Alignment;
    const/16 v6, 0x30

    .local v6, "$changed\\1":I
    move-object/from16 v7, p2

    .local v7, "$composer\\1":Landroidx/compose/runtime/Composer;
    move/from16 v16, v6

    .end local v6    # "$changed\\1":I
    .local v16, "$changed\\1":I
    const/16 v17, 0x0

    .line 83
    .local v17, "$i$f$Box\\1\\24":I
    const v6, 0x2bb5b5d7

    const-string v8, "CC(Box)P(2,1,3)71@3423L130:Box.kt#2w3rfo"

    invoke-static {v7, v6, v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 84
    const/4 v6, 0x0

    .line 87
    .local v6, "propagateMinConstraints\\1":Z
    invoke-static {v0, v6}, Landroidx/compose/foundation/layout/BoxKt;->maybeCachedBoxMeasurePolicy(Landroidx/compose/ui/Alignment;Z)Landroidx/compose/ui/layout/MeasurePolicy;

    move-result-object v8

    .line 91
    .local v8, "measurePolicy\\1":Landroidx/compose/ui/layout/MeasurePolicy;
    shl-int/lit8 v9, v16, 0x3

    and-int/lit8 v9, v9, 0x70

    .line 88
    move-object v10, v15

    .local v10, "modifier\\2":Landroidx/compose/ui/Modifier;
    move/from16 v18, v9

    .local v18, "$changed\\2":I
    const/16 v19, 0x0

    .line 92
    .local v19, "$i$f$Layout\\2\\88":I
    const v9, -0x4ee9b9da

    const-string v11, "CC(Layout)P(!1,2)79@3206L23,82@3357L359:Layout.kt#80mrfh"

    invoke-static {v7, v9, v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 93
    invoke-static {v7, v3}, Landroidx/compose/runtime/ComposablesKt;->getCurrentCompositeKeyHash(Landroidx/compose/runtime/Composer;I)I

    move-result v20

    .line 94
    .local v20, "compositeKeyHash\\2":I
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->getCurrentCompositionLocalMap()Landroidx/compose/runtime/CompositionLocalMap;

    move-result-object v3

    .line 95
    .local v3, "localMap\\2":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-static {v7, v10}, Landroidx/compose/ui/ComposedModifierKt;->materializeModifier(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v9

    .line 97
    .local v9, "materialized\\2":Landroidx/compose/ui/Modifier;
    sget-object v11, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v11}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getConstructor()Lkotlin/jvm/functions/Function0;

    move-result-object v11

    shl-int/lit8 v2, v18, 0x6

    and-int/lit16 v2, v2, 0x380

    const/4 v4, 0x6

    or-int/2addr v2, v4

    .line 96
    move/from16 v23, v2

    .local v23, "$changed\\3":I
    move-object v2, v11

    .local v2, "factory\\3":Lkotlin/jvm/functions/Function0;
    const/16 v24, 0x0

    .line 98
    .local v24, "$i$f$ReusableComposeNode\\3\\96":I
    const v11, -0x2942ffcf

    move/from16 v25, v4

    const-string v4, "CC(ReusableComposeNode)P(1,2)355@14017L9:Composables.kt#9igjgp"

    invoke-static {v7, v11, v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 99
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->getApplier()Landroidx/compose/runtime/Applier;

    move-result-object v4

    instance-of v4, v4, Landroidx/compose/runtime/Applier;

    if-nez v4, :cond_4

    invoke-static {}, Landroidx/compose/runtime/ComposablesKt;->invalidApplier()V

    .line 100
    :cond_4
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->startReusableNode()V

    .line 101
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 102
    invoke-interface {v7, v2}, Landroidx/compose/runtime/Composer;->createNode(Lkotlin/jvm/functions/Function0;)V

    goto :goto_2

    .line 104
    :cond_5
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->useNode()V

    .line 106
    :goto_2
    invoke-static {v7}, Landroidx/compose/runtime/Updater;->constructor-impl(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/Composer;

    move-result-object v4

    .local v4, "$this$Layout_u24lambda_u240\\4":Landroidx/compose/runtime/Composer;
    const/4 v11, 0x0

    .line 107
    .local v11, "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\4\\106\\2":I
    sget-object v26, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual/range {v26 .. v26}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetMeasurePolicy()Lkotlin/jvm/functions/Function2;

    move-result-object v5

    invoke-static {v4, v8, v5}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 108
    sget-object v5, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v5}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetResolvedCompositionLocals()Lkotlin/jvm/functions/Function2;

    move-result-object v5

    invoke-static {v4, v3, v5}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 109
    sget-object v5, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v5}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetCompositeKeyHash()Lkotlin/jvm/functions/Function2;

    move-result-object v5

    .local v5, "block\\5":Lkotlin/jvm/functions/Function2;
    const/16 v26, 0x0

    .line 110
    .local v26, "$i$f$set-impl\\5\\109":I
    move-object/from16 v28, v4

    .local v28, "$this$set_impl_u24lambda_u240\\5":Landroidx/compose/runtime/Composer;
    const/16 v29, 0x0

    .line 111
    .local v29, "$i$a$-with-Updater$set$1\\6\\110\\5":I
    invoke-interface/range {v28 .. v28}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v30

    if-nez v30, :cond_7

    move-object/from16 v30, v0

    .end local v0    # "contentAlignment\\1":Landroidx/compose/ui/Alignment;
    .local v30, "contentAlignment\\1":Landroidx/compose/ui/Alignment;
    invoke-interface/range {v28 .. v28}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v31, v2

    .end local v2    # "factory\\3":Lkotlin/jvm/functions/Function0;
    .local v31, "factory\\3":Lkotlin/jvm/functions/Function0;
    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    goto :goto_3

    :cond_6
    move-object/from16 v2, v28

    goto :goto_4

    .end local v30    # "contentAlignment\\1":Landroidx/compose/ui/Alignment;
    .end local v31    # "factory\\3":Lkotlin/jvm/functions/Function0;
    .restart local v0    # "contentAlignment\\1":Landroidx/compose/ui/Alignment;
    .restart local v2    # "factory\\3":Lkotlin/jvm/functions/Function0;
    :cond_7
    move-object/from16 v30, v0

    move-object/from16 v31, v2

    .line 112
    .end local v0    # "contentAlignment\\1":Landroidx/compose/ui/Alignment;
    .end local v2    # "factory\\3":Lkotlin/jvm/functions/Function0;
    .restart local v30    # "contentAlignment\\1":Landroidx/compose/ui/Alignment;
    .restart local v31    # "factory\\3":Lkotlin/jvm/functions/Function0;
    :goto_3
    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    move-object/from16 v2, v28

    .end local v28    # "$this$set_impl_u24lambda_u240\\5":Landroidx/compose/runtime/Composer;
    .local v2, "$this$set_impl_u24lambda_u240\\5":Landroidx/compose/runtime/Composer;
    invoke-interface {v2, v0}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 113
    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v4, v0, v5}, Landroidx/compose/runtime/Composer;->apply(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 115
    :goto_4
    nop

    .line 110
    .end local v2    # "$this$set_impl_u24lambda_u240\\5":Landroidx/compose/runtime/Composer;
    .end local v29    # "$i$a$-with-Updater$set$1\\6\\110\\5":I
    nop

    .line 115
    nop

    .line 116
    .end local v5    # "block\\5":Lkotlin/jvm/functions/Function2;
    .end local v26    # "$i$f$set-impl\\5\\109":I
    sget-object v0, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetModifier()Lkotlin/jvm/functions/Function2;

    move-result-object v0

    invoke-static {v4, v9, v0}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 117
    nop

    .line 106
    .end local v4    # "$this$Layout_u24lambda_u240\\4":Landroidx/compose/runtime/Composer;
    .end local v11    # "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\4\\106\\2":I
    nop

    .line 118
    shr-int/lit8 v0, v23, 0x6

    and-int/lit8 v26, v0, 0xe

    .local v26, "$changed\\7":I
    move-object v0, v7

    .local v0, "$composer\\7":Landroidx/compose/runtime/Composer;
    const/16 v28, 0x0

    .line 89
    .local v28, "$i$a$-Layout-BoxKt$Box$1\\7\\118\\1":I
    const v2, -0x7ff482d7

    const-string v4, "C72@3468L9:Box.kt#2w3rfo"

    invoke-static {v0, v2, v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v2, Landroidx/compose/foundation/layout/BoxScopeInstance;->INSTANCE:Landroidx/compose/foundation/layout/BoxScopeInstance;

    shr-int/lit8 v4, v16, 0x6

    and-int/lit8 v4, v4, 0x70

    or-int/lit8 v29, v4, 0x6

    .local v29, "$changed\\8":I
    check-cast v2, Landroidx/compose/foundation/layout/BoxScope;

    .local v2, "$this$MapViewScreen_u24lambda_u248_u24lambda_u247\\8":Landroidx/compose/foundation/layout/BoxScope;
    move-object v4, v0

    .local v4, "$composer\\8":Landroidx/compose/runtime/Composer;
    move-object/from16 v57, v2

    .end local v2    # "$this$MapViewScreen_u24lambda_u248_u24lambda_u247\\8":Landroidx/compose/foundation/layout/BoxScope;
    .local v57, "$this$MapViewScreen_u24lambda_u248_u24lambda_u247\\8":Landroidx/compose/foundation/layout/BoxScope;
    const/16 v58, 0x0

    .line 25
    .local v58, "$i$a$-Box-MapViewScreenKt$MapViewScreen$1$1\\8\\89\\0":I
    const v2, -0x53065257

    const-string v5, "C:MapViewScreen.kt#4cebsy"

    invoke-static {v4, v2, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_8

    const v2, -0x53068898

    invoke-interface {v4, v2}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v2, "25@1125L10,25@1069L77"

    invoke-static {v4, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 26
    sget-object v2, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v5, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v2, v4, v5}, Landroidx/compose/material3/MaterialTheme;->getTypography(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Typography;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/compose/material3/Typography;->getBodyLarge()Landroidx/compose/ui/text/TextStyle;

    move-result-object v52

    const/16 v55, 0x0

    const v56, 0xfffe

    const-string v32, "No geotagged entries yet."

    const/16 v33, 0x0

    const-wide/16 v34, 0x0

    const-wide/16 v36, 0x0

    const/16 v38, 0x0

    const/16 v39, 0x0

    const/16 v40, 0x0

    const-wide/16 v41, 0x0

    const/16 v43, 0x0

    const/16 v44, 0x0

    const-wide/16 v45, 0x0

    const/16 v47, 0x0

    const/16 v48, 0x0

    const/16 v49, 0x0

    const/16 v50, 0x0

    const/16 v51, 0x0

    const/16 v54, 0x6

    move-object/from16 v53, v4

    .end local v4    # "$composer\\8":Landroidx/compose/runtime/Composer;
    .local v53, "$composer\\8":Landroidx/compose/runtime/Composer;
    invoke-static/range {v32 .. v56}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    .line 25
    move-object/from16 v2, v53

    .end local v53    # "$composer\\8":Landroidx/compose/runtime/Composer;
    .local v2, "$composer\\8":Landroidx/compose/runtime/Composer;
    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    move-object/from16 v32, v0

    move-object v1, v2

    move-object/from16 v33, v3

    move/from16 v46, v6

    move-object/from16 v45, v7

    move-object/from16 v42, v8

    move-object/from16 v44, v9

    move-object/from16 v43, v10

    move/from16 v39, v14

    goto/16 :goto_b

    .line 27
    .end local v2    # "$composer\\8":Landroidx/compose/runtime/Composer;
    .restart local v4    # "$composer\\8":Landroidx/compose/runtime/Composer;
    :cond_8
    move-object v2, v4

    .end local v4    # "$composer\\8":Landroidx/compose/runtime/Composer;
    .restart local v2    # "$composer\\8":Landroidx/compose/runtime/Composer;
    const v4, -0x530444cc

    invoke-interface {v2, v4}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v4, "36@1761L11,38@1855L514,38@1798L571"

    invoke-static {v2, v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 29
    move-object v4, v1

    check-cast v4, Ljava/lang/Iterable;

    .local v4, "$this$map\\9":Ljava/lang/Iterable;
    const/4 v5, 0x0

    .line 119
    .local v5, "$i$f$map\\9\\29":I
    new-instance v11, Ljava/util/ArrayList;

    move-object/from16 v32, v0

    .end local v0    # "$composer\\7":Landroidx/compose/runtime/Composer;
    .local v32, "$composer\\7":Landroidx/compose/runtime/Composer;
    const/16 v0, 0xa

    move-object/from16 v33, v3

    .end local v3    # "localMap\\2":Landroidx/compose/runtime/CompositionLocalMap;
    .local v33, "localMap\\2":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-static {v4, v0}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v11, v3}, Ljava/util/ArrayList;-><init>(I)V

    move-object v3, v11

    check-cast v3, Ljava/util/Collection;

    .local v3, "destination\\10":Ljava/util/Collection;
    move-object v11, v4

    .local v11, "$this$mapTo\\10":Ljava/lang/Iterable;
    const/16 v34, 0x0

    .line 120
    .local v34, "$i$f$mapTo\\10\\119":I
    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v35

    :goto_5
    invoke-interface/range {v35 .. v35}, Ljava/util/Iterator;->hasNext()Z

    move-result v36

    if-eqz v36, :cond_9

    invoke-interface/range {v35 .. v35}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v36

    .line 121
    .local v36, "item\\10":Ljava/lang/Object;
    move-object/from16 v37, v36

    check-cast v37, Lcom/hardlineforge/lala/data/LogEntry;

    .local v37, "it\\11":Lcom/hardlineforge/lala/data/LogEntry;
    const/16 v38, 0x0

    .line 29
    .local v38, "$i$a$-map-MapViewScreenKt$MapViewScreen$1$1$lats$1\\11\\121\\8":I
    invoke-virtual/range {v37 .. v37}, Lcom/hardlineforge/lala/data/LogEntry;->getGpsLat()Ljava/lang/Double;

    move-result-object v39

    invoke-static/range {v39 .. v39}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual/range {v39 .. v39}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v37

    .end local v37    # "it\\11":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v38    # "$i$a$-map-MapViewScreenKt$MapViewScreen$1$1$lats$1\\11\\121\\8":I
    invoke-static/range {v37 .. v38}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    .line 121
    invoke-interface {v3, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    const/16 v0, 0xa

    goto :goto_5

    .line 122
    .end local v36    # "item\\10":Ljava/lang/Object;
    :cond_9
    nop

    .end local v3    # "destination\\10":Ljava/util/Collection;
    .end local v11    # "$this$mapTo\\10":Ljava/lang/Iterable;
    .end local v34    # "$i$f$mapTo\\10\\119":I
    move-object v0, v3

    check-cast v0, Ljava/util/List;

    .line 119
    nop

    .line 29
    .end local v4    # "$this$map\\9":Ljava/lang/Iterable;
    .end local v5    # "$i$f$map\\9\\29":I
    move-object/from16 v34, v0

    .line 30
    .local v34, "lats\\8":Ljava/util/List;
    move-object v0, v1

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$map\\12":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 123
    .local v3, "$i$f$map\\12\\30":I
    new-instance v4, Ljava/util/ArrayList;

    const/16 v5, 0xa

    invoke-static {v0, v5}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v4, Ljava/util/Collection;

    .local v4, "destination\\13":Ljava/util/Collection;
    move-object v5, v0

    .local v5, "$this$mapTo\\13":Ljava/lang/Iterable;
    const/4 v11, 0x0

    .line 124
    .local v11, "$i$f$mapTo\\13\\123":I
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v35

    :goto_6
    invoke-interface/range {v35 .. v35}, Ljava/util/Iterator;->hasNext()Z

    move-result v36

    if-eqz v36, :cond_a

    invoke-interface/range {v35 .. v35}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v36

    .line 125
    .local v36, "item\\13":Ljava/lang/Object;
    move-object/from16 v37, v36

    check-cast v37, Lcom/hardlineforge/lala/data/LogEntry;

    .local v37, "it\\14":Lcom/hardlineforge/lala/data/LogEntry;
    const/16 v38, 0x0

    .line 30
    .local v38, "$i$a$-map-MapViewScreenKt$MapViewScreen$1$1$lons$1\\14\\125\\8":I
    invoke-virtual/range {v37 .. v37}, Lcom/hardlineforge/lala/data/LogEntry;->getGpsLon()Ljava/lang/Double;

    move-result-object v39

    invoke-static/range {v39 .. v39}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual/range {v39 .. v39}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v37

    move-object/from16 v39, v0

    .end local v0    # "$this$map\\12":Ljava/lang/Iterable;
    .end local v37    # "it\\14":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v38    # "$i$a$-map-MapViewScreenKt$MapViewScreen$1$1$lons$1\\14\\125\\8":I
    .local v39, "$this$map\\12":Ljava/lang/Iterable;
    invoke-static/range {v37 .. v38}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    .line 125
    invoke-interface {v4, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move-object/from16 v0, v39

    goto :goto_6

    .line 126
    .end local v36    # "item\\13":Ljava/lang/Object;
    .end local v39    # "$this$map\\12":Ljava/lang/Iterable;
    .restart local v0    # "$this$map\\12":Ljava/lang/Iterable;
    :cond_a
    move-object/from16 v39, v0

    .end local v0    # "$this$map\\12":Ljava/lang/Iterable;
    .end local v4    # "destination\\13":Ljava/util/Collection;
    .end local v5    # "$this$mapTo\\13":Ljava/lang/Iterable;
    .end local v11    # "$i$f$mapTo\\13\\123":I
    .restart local v39    # "$this$map\\12":Ljava/lang/Iterable;
    move-object v0, v4

    check-cast v0, Ljava/util/List;

    .line 123
    nop

    .line 30
    .end local v3    # "$i$f$map\\12\\30":I
    .end local v39    # "$this$map\\12":Ljava/lang/Iterable;
    move-object/from16 v35, v0

    .line 31
    .local v35, "lons\\8":Ljava/util/List;
    move-object/from16 v0, v34

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->minOrNull(Ljava/lang/Iterable;)Ljava/lang/Double;

    move-result-object v0

    const-wide/16 v3, 0x0

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v36

    goto :goto_7

    :cond_b
    move-wide/from16 v36, v3

    :goto_7
    move-wide/from16 v38, v36

    .line 32
    .local v38, "minLat\\8":D
    move-object/from16 v0, v34

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->maxOrNull(Ljava/lang/Iterable;)Ljava/lang/Double;

    move-result-object v0

    const-wide/high16 v36, 0x3ff0000000000000L    # 1.0

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v40

    goto :goto_8

    :cond_c
    move-wide/from16 v40, v36

    .line 33
    .local v40, "maxLat\\8":D
    :goto_8
    move-object/from16 v0, v35

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->minOrNull(Ljava/lang/Iterable;)Ljava/lang/Double;

    move-result-object v0

    if-eqz v0, :cond_d

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    .line 34
    .local v3, "minLon\\8":D
    :cond_d
    move-object/from16 v0, v35

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->maxOrNull(Ljava/lang/Iterable;)Ljava/lang/Double;

    move-result-object v0

    if-eqz v0, :cond_e

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v36

    .line 35
    .local v36, "maxLon\\8":D
    :cond_e
    move v0, v6

    .end local v6    # "propagateMinConstraints\\1":Z
    .local v0, "propagateMinConstraints\\1":Z
    sub-double v5, v40, v38

    move-object v11, v7

    move-object/from16 v42, v8

    .end local v7    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .end local v8    # "measurePolicy\\1":Landroidx/compose/ui/layout/MeasurePolicy;
    .local v11, "$composer\\1":Landroidx/compose/runtime/Composer;
    .local v42, "measurePolicy\\1":Landroidx/compose/ui/layout/MeasurePolicy;
    const-wide v7, 0x3f1a36e2eb1c432dL    # 1.0E-4

    invoke-static {v5, v6, v7, v8}, Lkotlin/ranges/RangesKt;->coerceAtLeast(DD)D

    move-result-wide v5

    .line 36
    .local v5, "latRange\\8":D
    move-object/from16 v44, v9

    move-object/from16 v43, v10

    .end local v9    # "materialized\\2":Landroidx/compose/ui/Modifier;
    .end local v10    # "modifier\\2":Landroidx/compose/ui/Modifier;
    .local v43, "modifier\\2":Landroidx/compose/ui/Modifier;
    .local v44, "materialized\\2":Landroidx/compose/ui/Modifier;
    sub-double v9, v36, v3

    invoke-static {v9, v10, v7, v8}, Lkotlin/ranges/RangesKt;->coerceAtLeast(DD)D

    move-result-wide v7

    .line 37
    .local v7, "lonRange\\8":D
    sget-object v9, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v10, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v9, v2, v10}, Landroidx/compose/material3/MaterialTheme;->getColorScheme(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/ColorScheme;

    move-result-object v9

    invoke-virtual {v9}, Landroidx/compose/material3/ColorScheme;->getPrimary-0d7_KjU()J

    move-result-wide v9

    .line 39
    .local v9, "primaryColor\\8":J
    sget-object v45, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    move/from16 v46, v0

    .end local v0    # "propagateMinConstraints\\1":Z
    .local v46, "propagateMinConstraints\\1":Z
    move-object/from16 v0, v45

    check-cast v0, Landroidx/compose/ui/Modifier;

    move-object/from16 v45, v11

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x1

    .end local v11    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .local v45, "$composer\\1":Landroidx/compose/runtime/Composer;
    invoke-static {v0, v12, v13, v11}, Landroidx/compose/foundation/layout/SizeKt;->fillMaxSize$default(Landroidx/compose/ui/Modifier;FILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v0

    const/16 v11, 0x18

    .local v11, "$this$dp\\15":I
    const/4 v12, 0x0

    .line 127
    .local v12, "$i$f$getDp\\15\\39":I
    int-to-float v13, v11

    invoke-static {v13}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v11

    .line 39
    .end local v11    # "$this$dp\\15":I
    .end local v12    # "$i$f$getDp\\15\\39":I
    invoke-static {v0, v11}, Landroidx/compose/foundation/layout/PaddingKt;->padding-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v12

    const v0, 0x4fe769ef    # 7.7649587E9f

    const-string v11, "CC(remember):MapViewScreen.kt#9igjgp"

    invoke-static {v2, v0, v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v2, v1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v0

    invoke-interface {v2, v3, v4}, Landroidx/compose/runtime/Composer;->changed(D)Z

    move-result v11

    or-int/2addr v0, v11

    invoke-interface {v2, v7, v8}, Landroidx/compose/runtime/Composer;->changed(D)Z

    move-result v11

    or-int/2addr v0, v11

    move v11, v0

    move-wide/from16 v0, v38

    .end local v38    # "minLat\\8":D
    .local v0, "minLat\\8":D
    invoke-interface {v2, v0, v1}, Landroidx/compose/runtime/Composer;->changed(D)Z

    move-result v13

    or-int/2addr v11, v13

    invoke-interface {v2, v5, v6}, Landroidx/compose/runtime/Composer;->changed(D)Z

    move-result v13

    or-int/2addr v11, v13

    invoke-interface {v2, v9, v10}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v13

    or-int/2addr v11, v13

    .local v11, "invalid\\16":Z
    move-object v13, v2

    .local v13, "$this$cache\\16":Landroidx/compose/runtime/Composer;
    move/from16 v21, v11

    .end local v11    # "invalid\\16":Z
    .local v21, "invalid\\16":Z
    const/16 v22, 0x0

    .line 128
    .local v22, "$i$f$cache\\16\\39":I
    invoke-interface {v13}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v11

    .local v11, "it\\16":Ljava/lang/Object;
    const/16 v27, 0x0

    .line 129
    .local v27, "$i$a$-let-ComposerKt$cache$1\\17\\128\\16":I
    if-nez v21, :cond_10

    sget-object v38, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-wide/from16 v47, v0

    .end local v0    # "minLat\\8":D
    .local v47, "minLat\\8":D
    invoke-virtual/range {v38 .. v38}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v0

    if-ne v11, v0, :cond_f

    goto :goto_9

    .line 133
    :cond_f
    move-object/from16 v53, v2

    move-wide v2, v3

    move-object v0, v11

    move/from16 v39, v14

    move/from16 v14, v25

    move-wide v10, v9

    move-wide/from16 v59, v7

    move-wide v8, v5

    move-wide/from16 v4, v59

    goto :goto_a

    .line 129
    .end local v47    # "minLat\\8":D
    .restart local v0    # "minLat\\8":D
    :cond_10
    move-wide/from16 v47, v0

    .line 130
    .end local v0    # "minLat\\8":D
    .restart local v47    # "minLat\\8":D
    :goto_9
    const/16 v38, 0x0

    .line 39
    .local v38, "$i$a$-cache-MapViewScreenKt$MapViewScreen$1$1$1\\18\\130\\8":I
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt$$ExternalSyntheticLambda0;

    move-object/from16 v1, p0

    move-object/from16 v53, v2

    move-wide v2, v3

    move/from16 v39, v14

    move/from16 v14, v25

    move-object/from16 v25, v11

    move-wide v10, v9

    move-wide/from16 v59, v7

    move-wide v8, v5

    move-wide/from16 v4, v59

    move-wide/from16 v6, v47

    .end local v3    # "minLon\\8":D
    .end local v5    # "latRange\\8":D
    .end local v7    # "lonRange\\8":D
    .end local v9    # "primaryColor\\8":J
    .end local v11    # "it\\16":Ljava/lang/Object;
    .end local v14    # "$dirty":I
    .end local v47    # "minLat\\8":D
    .local v2, "minLon\\8":D
    .local v4, "lonRange\\8":D
    .local v6, "minLat\\8":D
    .local v8, "latRange\\8":D
    .local v10, "primaryColor\\8":J
    .local v25, "it\\16":Ljava/lang/Object;
    .local v39, "$dirty":I
    .restart local v53    # "$composer\\8":Landroidx/compose/runtime/Composer;
    invoke-direct/range {v0 .. v11}, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt$$ExternalSyntheticLambda0;-><init>(Ljava/util/List;DDDDJ)V

    .line 130
    .end local v6    # "minLat\\8":D
    .end local v38    # "$i$a$-cache-MapViewScreenKt$MapViewScreen$1$1$1\\18\\130\\8":I
    .restart local v47    # "minLat\\8":D
    nop

    .line 131
    .local v0, "value\\17":Ljava/lang/Object;
    invoke-interface {v13, v0}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 132
    nop

    .line 128
    .end local v0    # "value\\17":Ljava/lang/Object;
    .end local v25    # "it\\16":Ljava/lang/Object;
    .end local v27    # "$i$a$-let-ComposerKt$cache$1\\17\\128\\16":I
    :goto_a
    nop

    .line 39
    .end local v13    # "$this$cache\\16":Landroidx/compose/runtime/Composer;
    .end local v21    # "invalid\\16":Z
    .end local v22    # "$i$f$cache\\16\\39":I
    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-static/range {v53 .. v53}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    move-object/from16 v1, v53

    .end local v53    # "$composer\\8":Landroidx/compose/runtime/Composer;
    .local v1, "$composer\\8":Landroidx/compose/runtime/Composer;
    invoke-static {v12, v0, v1, v14}, Landroidx/compose/foundation/CanvasKt;->Canvas(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V

    .line 27
    .end local v2    # "minLon\\8":D
    .end local v4    # "lonRange\\8":D
    .end local v8    # "latRange\\8":D
    .end local v10    # "primaryColor\\8":J
    .end local v34    # "lats\\8":Ljava/util/List;
    .end local v35    # "lons\\8":Ljava/util/List;
    .end local v36    # "maxLon\\8":D
    .end local v40    # "maxLat\\8":D
    .end local v47    # "minLat\\8":D
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 25
    :goto_b
    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 50
    nop

    .line 89
    .end local v1    # "$composer\\8":Landroidx/compose/runtime/Composer;
    .end local v29    # "$changed\\8":I
    .end local v57    # "$this$MapViewScreen_u24lambda_u248_u24lambda_u247\\8":Landroidx/compose/foundation/layout/BoxScope;
    .end local v58    # "$i$a$-Box-MapViewScreenKt$MapViewScreen$1$1\\8\\89\\0":I
    invoke-static/range {v32 .. v32}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 118
    .end local v26    # "$changed\\7":I
    .end local v28    # "$i$a$-Layout-BoxKt$Box$1\\7\\118\\1":I
    .end local v32    # "$composer\\7":Landroidx/compose/runtime/Composer;
    nop

    .line 134
    invoke-interface/range {v45 .. v45}, Landroidx/compose/runtime/Composer;->endNode()V

    .line 98
    invoke-static/range {v45 .. v45}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 135
    nop

    .line 92
    .end local v23    # "$changed\\3":I
    .end local v24    # "$i$f$ReusableComposeNode\\3\\96":I
    .end local v31    # "factory\\3":Lkotlin/jvm/functions/Function0;
    invoke-static/range {v45 .. v45}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 136
    nop

    .line 83
    .end local v18    # "$changed\\2":I
    .end local v19    # "$i$f$Layout\\2\\88":I
    .end local v20    # "compositeKeyHash\\2":I
    .end local v33    # "localMap\\2":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v43    # "modifier\\2":Landroidx/compose/ui/Modifier;
    .end local v44    # "materialized\\2":Landroidx/compose/ui/Modifier;
    invoke-static/range {v45 .. v45}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 137
    nop

    .end local v15    # "modifier\\1":Landroidx/compose/ui/Modifier;
    .end local v16    # "$changed\\1":I
    .end local v17    # "$i$f$Box\\1\\24":I
    .end local v30    # "contentAlignment\\1":Landroidx/compose/ui/Alignment;
    .end local v42    # "measurePolicy\\1":Landroidx/compose/ui/layout/MeasurePolicy;
    .end local v45    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .end local v46    # "propagateMinConstraints\\1":Z
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_c

    .line 23
    .end local v39    # "$dirty":I
    .restart local v14    # "$dirty":I
    :cond_11
    move/from16 v39, v14

    .end local v14    # "$dirty":I
    .restart local v39    # "$dirty":I
    invoke-interface/range {p2 .. p2}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 51
    :cond_12
    :goto_c
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final MapViewScreen$lambda$8$lambda$7$lambda$6$lambda$5(Ljava/util/List;DDDDJLandroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;
    .locals 25
    .param p0, "$geotagged"    # Ljava/util/List;
    .param p1, "$minLon"    # D
    .param p3, "$lonRange"    # D
    .param p5, "$minLat"    # D
    .param p7, "$latRange"    # D
    .param p9, "$primaryColor"    # J
    .param p11, "$this$Canvas"    # Landroidx/compose/ui/graphics/drawscope/DrawScope;

    const-string v0, "$this$Canvas"

    move-object/from16 v1, p11

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    invoke-interface {v1}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->getSize-NH-jbRc()J

    move-result-wide v2

    .local v2, "arg0\\1":J
    const/4 v0, 0x0

    .line 71
    .local v0, "$i$f$getWidth-impl\\1\\40":I
    move-wide v4, v2

    .local v4, "value\\2":J
    const/4 v6, 0x0

    .line 72
    .local v6, "$i$f$unpackFloat1\\2\\71":I
    const/16 v14, 0x20

    shr-long v7, v4, v14

    long-to-int v7, v7

    .local v7, "bits\\3":I
    const/4 v8, 0x0

    .line 73
    .local v8, "$i$f$floatFromBits\\3\\72":I
    invoke-static {v7}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v7

    .line 72
    .end local v7    # "bits\\3":I
    .end local v8    # "$i$f$floatFromBits\\3\\72":I
    nop

    .line 71
    .end local v4    # "value\\2":J
    .end local v6    # "$i$f$unpackFloat1\\2\\71":I
    nop

    .line 40
    .end local v0    # "$i$f$getWidth-impl\\1\\40":I
    .end local v2    # "arg0\\1":J
    move v0, v7

    .line 41
    .local v0, "w":F
    invoke-interface {v1}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->getSize-NH-jbRc()J

    move-result-wide v2

    .local v2, "arg0\\4":J
    const/4 v4, 0x0

    .line 74
    .local v4, "$i$f$getHeight-impl\\4\\41":I
    move-wide v5, v2

    .local v5, "value\\5":J
    const/4 v7, 0x0

    .line 75
    .local v7, "$i$f$unpackFloat2\\5\\74":I
    const-wide v15, 0xffffffffL

    and-long v8, v5, v15

    long-to-int v8, v8

    .local v8, "bits\\6":I
    const/4 v9, 0x0

    .line 76
    .local v9, "$i$f$floatFromBits\\6\\75":I
    invoke-static {v8}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v8

    .line 75
    .end local v8    # "bits\\6":I
    .end local v9    # "$i$f$floatFromBits\\6\\75":I
    nop

    .line 74
    .end local v5    # "value\\5":J
    .end local v7    # "$i$f$unpackFloat2\\5\\74":I
    nop

    .line 41
    .end local v2    # "arg0\\4":J
    .end local v4    # "$i$f$getHeight-impl\\4\\41":I
    move/from16 v17, v8

    .line 42
    .local v17, "h":F
    const-wide v2, 0xfff2f2f7L

    invoke-static {v2, v3}, Landroidx/compose/ui/graphics/ColorKt;->Color(J)J

    move-result-wide v2

    new-instance v4, Landroidx/compose/ui/graphics/drawscope/Stroke;

    const/16 v10, 0x1e

    const/4 v11, 0x0

    const/high16 v5, 0x40000000    # 2.0f

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v11}, Landroidx/compose/ui/graphics/drawscope/Stroke;-><init>(FFIILandroidx/compose/ui/graphics/PathEffect;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object v9, v4

    check-cast v9, Landroidx/compose/ui/graphics/drawscope/DrawStyle;

    const/16 v12, 0x6e

    const/4 v13, 0x0

    const-wide/16 v4, 0x0

    const-wide/16 v6, 0x0

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static/range {v1 .. v13}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->drawRect-n-J9OG0$default(Landroidx/compose/ui/graphics/drawscope/DrawScope;JJJFLandroidx/compose/ui/graphics/drawscope/DrawStyle;Landroidx/compose/ui/graphics/ColorFilter;IILjava/lang/Object;)V

    .line 43
    move-object/from16 v13, p0

    check-cast v13, Ljava/lang/Iterable;

    .local v13, "$this$forEach\\7":Ljava/lang/Iterable;
    const/16 v18, 0x0

    .line 77
    .local v18, "$i$f$forEach\\7\\43":I
    invoke-interface {v13}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_0
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    .local v20, "element\\7":Ljava/lang/Object;
    move-object/from16 v21, v20

    check-cast v21, Lcom/hardlineforge/lala/data/LogEntry;

    .local v21, "e\\8":Lcom/hardlineforge/lala/data/LogEntry;
    const/16 v22, 0x0

    .line 44
    .local v22, "$i$a$-forEach-MapViewScreenKt$MapViewScreen$1$1$1$1$1\\8\\77\\0":I
    invoke-virtual/range {v21 .. v21}, Lcom/hardlineforge/lala/data/LogEntry;->getGpsLon()Ljava/lang/Double;

    move-result-object v1

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    sub-double v1, v1, p1

    div-double v1, v1, p3

    double-to-float v1, v1

    mul-float v23, v1, v0

    .line 45
    .local v23, "nx\\8":F
    invoke-virtual/range {v21 .. v21}, Lcom/hardlineforge/lala/data/LogEntry;->getGpsLat()Ljava/lang/Double;

    move-result-object v1

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    sub-double v1, v1, p5

    div-double v1, v1, p7

    double-to-float v1, v1

    mul-float v1, v1, v17

    sub-float v24, v17, v1

    .line 46
    .local v24, "ny\\8":F
    move/from16 v1, v24

    .local v1, "y\\9":F
    move/from16 v2, v23

    .local v2, "x\\9":F
    const/4 v3, 0x0

    .line 78
    .local v3, "$i$f$Offset\\9\\46":I
    const/4 v4, 0x0

    .line 79
    .local v4, "$i$f$packFloats\\10\\78":I
    invoke-static {v2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v5

    int-to-long v5, v5

    .line 80
    .local v5, "v1\\10":J
    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v7

    int-to-long v7, v7

    .line 81
    .local v7, "v2\\10":J
    shl-long v9, v5, v14

    and-long v11, v7, v15

    or-long v4, v9, v11

    .line 78
    .end local v4    # "$i$f$packFloats\\10\\78":I
    .end local v5    # "v1\\10":J
    .end local v7    # "v2\\10":J
    invoke-static {v4, v5}, Landroidx/compose/ui/geometry/Offset;->constructor-impl(J)J

    move-result-wide v5

    .line 46
    .end local v1    # "y\\9":F
    .end local v2    # "x\\9":F
    .end local v3    # "$i$f$Offset\\9\\46":I
    const/16 v11, 0x78

    const/4 v12, 0x0

    const/high16 v4, 0x40c00000    # 6.0f

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-wide/from16 v2, p9

    move-object/from16 v1, p11

    invoke-static/range {v1 .. v12}, Landroidx/compose/ui/graphics/drawscope/DrawScope;->drawCircle-VaOC9Bg$default(Landroidx/compose/ui/graphics/drawscope/DrawScope;JFJFLandroidx/compose/ui/graphics/drawscope/DrawStyle;Landroidx/compose/ui/graphics/ColorFilter;IILjava/lang/Object;)V

    .line 47
    nop

    .line 77
    .end local v21    # "e\\8":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v22    # "$i$a$-forEach-MapViewScreenKt$MapViewScreen$1$1$1$1$1\\8\\77\\0":I
    .end local v23    # "nx\\8":F
    .end local v24    # "ny\\8":F
    nop

    .end local v20    # "element\\7":Ljava/lang/Object;
    goto :goto_0

    .line 82
    :cond_0
    nop

    .line 48
    .end local v13    # "$this$forEach\\7":Ljava/lang/Iterable;
    .end local v18    # "$i$f$forEach\\7\\43":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1
.end method

.method static final MapViewScreen$lambda$9(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 1

    or-int/lit8 v0, p1, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v0

    invoke-static {p0, p3, v0, p2}, Lcom/hardlineforge/lala/ui/screens/MapViewScreenKt;->MapViewScreen(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method
