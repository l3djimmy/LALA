.class public final Lcom/hardlineforge/lala/ui/screens/DrawerContentKt;
.super Ljava/lang/Object;
.source "DrawerContent.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDrawerContent.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DrawerContent.kt\ncom/hardlineforge/lala/ui/screens/DrawerContentKt\n+ 2 Dp.kt\nandroidx/compose/ui/unit/DpKt\n+ 3 Column.kt\nandroidx/compose/foundation/layout/ColumnKt\n+ 4 Layout.kt\nandroidx/compose/ui/layout/LayoutKt\n+ 5 Composables.kt\nandroidx/compose/runtime/ComposablesKt\n+ 6 Composer.kt\nandroidx/compose/runtime/Updater\n+ 7 Composer.kt\nandroidx/compose/runtime/ComposerKt\n*L\n1#1,89:1\n113#2:90\n113#2:128\n113#2:129\n113#2:130\n87#3:91\n84#3,9:92\n94#3:164\n79#4,6:101\n86#4,3:116\n89#4,2:125\n93#4:163\n347#5,9:107\n356#5:127\n357#5,2:161\n4206#6,6:119\n1247#7,6:131\n1247#7,6:137\n1247#7,6:143\n1247#7,6:149\n1247#7,6:155\n*S KotlinDebug\n*F\n+ 1 DrawerContent.kt\ncom/hardlineforge/lala/ui/screens/DrawerContentKt\n*L\n26#1:90\n27#1:128\n38#1:129\n40#1:130\n26#1:91\n26#1:92,9\n26#1:164\n26#1:101,6\n26#1:116,3\n26#1:125,2\n26#1:163\n26#1:107,9\n26#1:127\n26#1:161,2\n26#1:119,6\n46#1:131,6\n55#1:137,6\n64#1:143,6\n73#1:149,6\n82#1:155,6\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a#\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00010\u0005H\u0007\u00a2\u0006\u0002\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "DrawerContent",
        "",
        "navController",
        "Landroidx/navigation/NavHostController;",
        "onNavigate",
        "Lkotlin/Function0;",
        "(Landroidx/navigation/NavHostController;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;I)V",
        "app_debug"
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
.method public static final DrawerContent(Landroidx/navigation/NavHostController;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;I)V
    .locals 59
    .param p0, "navController"    # Landroidx/navigation/NavHostController;
    .param p1, "onNavigate"    # Lkotlin/jvm/functions/Function0;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/navigation/NavHostController;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Landroidx/compose/runtime/Composer;",
            "I)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    const-string v3, "navController"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "onNavigate"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    const v3, 0x25226127

    move-object/from16 v4, p2

    invoke-interface {v4, v3}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v4

    .end local p2    # "$composer":Landroidx/compose/runtime/Composer;
    .local v4, "$composer":Landroidx/compose/runtime/Composer;
    const-string v5, "C(DrawerContent)25@1107L2203:DrawerContent.kt#4cebsy"

    invoke-static {v4, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v5, p3

    .local v5, "$dirty":I
    and-int/lit8 v6, v2, 0x6

    const/4 v7, 0x2

    if-nez v6, :cond_1

    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v6, 0x4

    goto :goto_0

    :cond_0
    move v6, v7

    :goto_0
    or-int/2addr v5, v6

    :cond_1
    and-int/lit8 v6, v2, 0x30

    if-nez v6, :cond_3

    invoke-interface {v4, v1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    const/16 v6, 0x20

    goto :goto_1

    :cond_2
    const/16 v6, 0x10

    :goto_1
    or-int/2addr v5, v6

    :cond_3
    and-int/lit8 v6, v5, 0x13

    const/16 v9, 0x12

    const/4 v11, 0x0

    if-eq v6, v9, :cond_4

    const/4 v6, 0x1

    goto :goto_2

    :cond_4
    move v6, v11

    :goto_2
    and-int/lit8 v9, v5, 0x1

    invoke-interface {v4, v6, v9}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v6

    if-eqz v6, :cond_19

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v6

    if-eqz v6, :cond_5

    const/4 v6, -0x1

    const-string v9, "com.hardlineforge.lala.ui.screens.DrawerContent (DrawerContent.kt:24)"

    invoke-static {v3, v5, v6, v9}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 26
    :cond_5
    sget-object v3, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v3, Landroidx/compose/ui/Modifier;

    const/16 v6, 0x10

    .local v6, "$this$dp\\1":I
    const/4 v9, 0x0

    .line 90
    .local v9, "$i$f$getDp\\1\\26":I
    int-to-float v12, v6

    invoke-static {v12}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v6

    .line 26
    .end local v6    # "$this$dp\\1":I
    .end local v9    # "$i$f$getDp\\1\\26":I
    const/4 v9, 0x0

    const/4 v12, 0x0

    invoke-static {v3, v6, v9, v7, v12}, Landroidx/compose/foundation/layout/PaddingKt;->padding-VpY3zN4$default(Landroidx/compose/ui/Modifier;FFILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v3

    .local v3, "modifier\\2":Landroidx/compose/ui/Modifier;
    const/4 v6, 0x6

    .local v6, "$changed\\2":I
    move-object v7, v4

    .local v7, "$composer\\2":Landroidx/compose/runtime/Composer;
    const/4 v9, 0x0

    .line 91
    .local v9, "$i$f$Column\\2\\26":I
    const v12, -0x1cd0f17e

    const-string v13, "CC(Column)P(2,3,1)87@4442L61,88@4508L133:Column.kt#2w3rfo"

    invoke-static {v7, v12, v13}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 92
    sget-object v12, Landroidx/compose/foundation/layout/Arrangement;->INSTANCE:Landroidx/compose/foundation/layout/Arrangement;

    invoke-virtual {v12}, Landroidx/compose/foundation/layout/Arrangement;->getTop()Landroidx/compose/foundation/layout/Arrangement$Vertical;

    move-result-object v12

    .line 93
    .local v12, "verticalArrangement\\2":Landroidx/compose/foundation/layout/Arrangement$Vertical;
    sget-object v13, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v13}, Landroidx/compose/ui/Alignment$Companion;->getStart()Landroidx/compose/ui/Alignment$Horizontal;

    move-result-object v13

    .line 96
    .local v13, "horizontalAlignment\\2":Landroidx/compose/ui/Alignment$Horizontal;
    shr-int/lit8 v14, v6, 0x3

    and-int/lit8 v14, v14, 0xe

    shr-int/lit8 v15, v6, 0x3

    and-int/lit8 v15, v15, 0x70

    or-int/2addr v14, v15

    invoke-static {v12, v13, v7, v14}, Landroidx/compose/foundation/layout/ColumnKt;->columnMeasurePolicy(Landroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/ui/Alignment$Horizontal;Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/layout/MeasurePolicy;

    move-result-object v14

    .line 100
    .local v14, "measurePolicy\\2":Landroidx/compose/ui/layout/MeasurePolicy;
    shl-int/lit8 v15, v6, 0x3

    and-int/lit8 v15, v15, 0x70

    .line 97
    move-object/from16 p2, v3

    .local v15, "$changed\\3":I
    .local p2, "modifier\\3":Landroidx/compose/ui/Modifier;
    const/16 v16, 0x0

    .line 101
    .local v16, "$i$f$Layout\\3\\97":I
    const v10, -0x4ee9b9da

    const-string v8, "CC(Layout)P(!1,2)79@3206L23,82@3357L359:Layout.kt#80mrfh"

    invoke-static {v7, v10, v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 102
    invoke-static {v7, v11}, Landroidx/compose/runtime/ComposablesKt;->getCurrentCompositeKeyHash(Landroidx/compose/runtime/Composer;I)I

    move-result v8

    .line 103
    .local v8, "compositeKeyHash\\3":I
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->getCurrentCompositionLocalMap()Landroidx/compose/runtime/CompositionLocalMap;

    move-result-object v10

    .line 104
    .local v10, "localMap\\3":Landroidx/compose/runtime/CompositionLocalMap;
    move-object/from16 v11, p2

    .end local v3    # "modifier\\2":Landroidx/compose/ui/Modifier;
    .local v11, "modifier\\3":Landroidx/compose/ui/Modifier;
    .local p2, "modifier\\2":Landroidx/compose/ui/Modifier;
    invoke-static {v7, v11}, Landroidx/compose/ui/ComposedModifierKt;->materializeModifier(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v3

    .line 106
    .local v3, "materialized\\3":Landroidx/compose/ui/Modifier;
    sget-object v20, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual/range {v20 .. v20}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getConstructor()Lkotlin/jvm/functions/Function0;

    move-result-object v20

    move/from16 v21, v5

    .end local v5    # "$dirty":I
    .local v21, "$dirty":I
    shl-int/lit8 v5, v15, 0x6

    and-int/lit16 v5, v5, 0x380

    move/from16 v22, v5

    const/4 v5, 0x6

    or-int/lit8 v22, v22, 0x6

    .line 105
    nop

    .local v22, "$changed\\4":I
    move-object/from16 v23, v20

    .local v23, "factory\\4":Lkotlin/jvm/functions/Function0;
    const/16 v20, 0x0

    .line 107
    .local v20, "$i$f$ReusableComposeNode\\4\\105":I
    move/from16 v24, v5

    const v5, -0x2942ffcf

    move/from16 v25, v6

    .end local v6    # "$changed\\2":I
    .local v25, "$changed\\2":I
    const-string v6, "CC(ReusableComposeNode)P(1,2)355@14017L9:Composables.kt#9igjgp"

    invoke-static {v7, v5, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 108
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->getApplier()Landroidx/compose/runtime/Applier;

    move-result-object v5

    instance-of v5, v5, Landroidx/compose/runtime/Applier;

    if-nez v5, :cond_6

    invoke-static {}, Landroidx/compose/runtime/ComposablesKt;->invalidApplier()V

    .line 109
    :cond_6
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->startReusableNode()V

    .line 110
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 111
    move-object/from16 v5, v23

    .end local v23    # "factory\\4":Lkotlin/jvm/functions/Function0;
    .local v5, "factory\\4":Lkotlin/jvm/functions/Function0;
    invoke-interface {v7, v5}, Landroidx/compose/runtime/Composer;->createNode(Lkotlin/jvm/functions/Function0;)V

    goto :goto_3

    .line 113
    .end local v5    # "factory\\4":Lkotlin/jvm/functions/Function0;
    .restart local v23    # "factory\\4":Lkotlin/jvm/functions/Function0;
    :cond_7
    move-object/from16 v5, v23

    .end local v23    # "factory\\4":Lkotlin/jvm/functions/Function0;
    .restart local v5    # "factory\\4":Lkotlin/jvm/functions/Function0;
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->useNode()V

    .line 115
    :goto_3
    invoke-static {v7}, Landroidx/compose/runtime/Updater;->constructor-impl(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/Composer;

    move-result-object v6

    .local v6, "$this$Layout_u24lambda_u240\\5":Landroidx/compose/runtime/Composer;
    const/16 v23, 0x0

    .line 116
    .local v23, "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\5\\115\\3":I
    sget-object v26, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    move-object/from16 v27, v5

    .end local v5    # "factory\\4":Lkotlin/jvm/functions/Function0;
    .local v27, "factory\\4":Lkotlin/jvm/functions/Function0;
    invoke-virtual/range {v26 .. v26}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetMeasurePolicy()Lkotlin/jvm/functions/Function2;

    move-result-object v5

    invoke-static {v6, v14, v5}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 117
    sget-object v5, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v5}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetResolvedCompositionLocals()Lkotlin/jvm/functions/Function2;

    move-result-object v5

    invoke-static {v6, v10, v5}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 118
    sget-object v5, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v5}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetCompositeKeyHash()Lkotlin/jvm/functions/Function2;

    move-result-object v5

    .local v5, "block\\6":Lkotlin/jvm/functions/Function2;
    const/16 v26, 0x0

    .line 119
    .local v26, "$i$f$set-impl\\6\\118":I
    move-object/from16 v28, v6

    .local v28, "$this$set_impl_u24lambda_u240\\6":Landroidx/compose/runtime/Composer;
    const/16 v29, 0x0

    .line 120
    .local v29, "$i$a$-with-Updater$set$1\\7\\119\\6":I
    invoke-interface/range {v28 .. v28}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v30

    if-nez v30, :cond_9

    move-object/from16 v30, v7

    .end local v7    # "$composer\\2":Landroidx/compose/runtime/Composer;
    .local v30, "$composer\\2":Landroidx/compose/runtime/Composer;
    invoke-interface/range {v28 .. v28}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v7

    move/from16 v31, v8

    .end local v8    # "compositeKeyHash\\3":I
    .local v31, "compositeKeyHash\\3":I
    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_8

    goto :goto_4

    :cond_8
    move-object/from16 v8, v28

    goto :goto_5

    .end local v30    # "$composer\\2":Landroidx/compose/runtime/Composer;
    .end local v31    # "compositeKeyHash\\3":I
    .restart local v7    # "$composer\\2":Landroidx/compose/runtime/Composer;
    .restart local v8    # "compositeKeyHash\\3":I
    :cond_9
    move-object/from16 v30, v7

    move/from16 v31, v8

    .line 121
    .end local v7    # "$composer\\2":Landroidx/compose/runtime/Composer;
    .end local v8    # "compositeKeyHash\\3":I
    .restart local v30    # "$composer\\2":Landroidx/compose/runtime/Composer;
    .restart local v31    # "compositeKeyHash\\3":I
    :goto_4
    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move-object/from16 v8, v28

    .end local v28    # "$this$set_impl_u24lambda_u240\\6":Landroidx/compose/runtime/Composer;
    .local v8, "$this$set_impl_u24lambda_u240\\6":Landroidx/compose/runtime/Composer;
    invoke-interface {v8, v7}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 122
    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7, v5}, Landroidx/compose/runtime/Composer;->apply(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 124
    :goto_5
    nop

    .line 119
    .end local v8    # "$this$set_impl_u24lambda_u240\\6":Landroidx/compose/runtime/Composer;
    .end local v29    # "$i$a$-with-Updater$set$1\\7\\119\\6":I
    nop

    .line 124
    nop

    .line 125
    .end local v5    # "block\\6":Lkotlin/jvm/functions/Function2;
    .end local v26    # "$i$f$set-impl\\6\\118":I
    sget-object v5, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v5}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetModifier()Lkotlin/jvm/functions/Function2;

    move-result-object v5

    invoke-static {v6, v3, v5}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 126
    nop

    .line 115
    .end local v6    # "$this$Layout_u24lambda_u240\\5":Landroidx/compose/runtime/Composer;
    .end local v23    # "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\5\\115\\3":I
    nop

    .line 127
    shr-int/lit8 v5, v22, 0x6

    and-int/lit8 v5, v5, 0xe

    .local v5, "$changed\\8":I
    move-object/from16 v6, v30

    .local v6, "$composer\\8":Landroidx/compose/runtime/Composer;
    const/4 v7, 0x0

    .line 98
    .local v7, "$i$a$-Layout-ColumnKt$Column$1\\8\\127\\2":I
    const v8, -0x16eda499

    move-object/from16 v23, v3

    .end local v3    # "materialized\\3":Landroidx/compose/ui/Modifier;
    .local v23, "materialized\\3":Landroidx/compose/ui/Modifier;
    const-string v3, "C89@4556L9:Column.kt#2w3rfo"

    invoke-static {v6, v8, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v3, Landroidx/compose/foundation/layout/ColumnScopeInstance;->INSTANCE:Landroidx/compose/foundation/layout/ColumnScopeInstance;

    shr-int/lit8 v8, v25, 0x6

    and-int/lit8 v8, v8, 0x70

    or-int/lit8 v8, v8, 0x6

    .local v8, "$changed\\9":I
    check-cast v3, Landroidx/compose/foundation/layout/ColumnScope;

    .local v3, "$this$DrawerContent_u24lambda_u2412\\9":Landroidx/compose/foundation/layout/ColumnScope;
    move-object/from16 v53, v6

    .local v53, "$composer\\9":Landroidx/compose/runtime/Composer;
    const/16 v26, 0x0

    .line 27
    .local v26, "$i$a$-Column-DrawerContentKt$DrawerContent$1\\9\\98\\0":I
    move-object/from16 v28, v3

    .end local v3    # "$this$DrawerContent_u24lambda_u2412\\9":Landroidx/compose/foundation/layout/ColumnScope;
    .local v28, "$this$DrawerContent_u24lambda_u2412\\9":Landroidx/compose/foundation/layout/ColumnScope;
    const v3, -0x4cd11641

    move/from16 v29, v5

    .end local v5    # "$changed\\8":I
    .local v29, "$changed\\8":I
    const-string v5, "C26@1173L41,29@1290L10,30@1350L11,27@1223L156,34@1465L10,35@1522L11,32@1388L172,37@1569L41,38@1619L19,39@1647L40,45@1899L140,41@1697L352,54@2250L95,50@2058L297,63@2570L100,59@2364L316,72@2889L94,68@2689L304,81@3199L95,77@3002L302:DrawerContent.kt#4cebsy"

    move-object/from16 v57, v6

    .end local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .local v6, "$composer\\9":Landroidx/compose/runtime/Composer;
    .local v57, "$composer\\8":Landroidx/compose/runtime/Composer;
    invoke-static {v6, v3, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v3, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v3, Landroidx/compose/ui/Modifier;

    const/16 v5, 0x30

    .local v5, "$this$dp\\10":I
    const/16 v32, 0x0

    .line 128
    .local v32, "$i$f$getDp\\10\\27":I
    move/from16 v58, v7

    .end local v7    # "$i$a$-Layout-ColumnKt$Column$1\\8\\127\\2":I
    .local v58, "$i$a$-Layout-ColumnKt$Column$1\\8\\127\\2":I
    int-to-float v7, v5

    invoke-static {v7}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v5

    .line 27
    .end local v5    # "$this$dp\\10":I
    .end local v32    # "$i$f$getDp\\10\\27":I
    invoke-static {v3, v5}, Landroidx/compose/foundation/layout/SizeKt;->height-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v3

    move/from16 v5, v24

    invoke-static {v3, v6, v5}, Landroidx/compose/foundation/layout/SpacerKt;->Spacer(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V

    .line 30
    sget-object v3, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v5, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v3, v6, v5}, Landroidx/compose/material3/MaterialTheme;->getTypography(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Typography;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/compose/material3/Typography;->getDisplayMedium()Landroidx/compose/ui/text/TextStyle;

    move-result-object v52

    .line 31
    sget-object v3, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v5, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v3, v6, v5}, Landroidx/compose/material3/MaterialTheme;->getColorScheme(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/ColorScheme;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/compose/material3/ColorScheme;->getPrimary-0d7_KjU()J

    move-result-wide v34

    .line 29
    nop

    .line 31
    nop

    .line 30
    nop

    .line 28
    const-string v32, "LALA"

    const/16 v33, 0x0

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

    const/16 v55, 0x0

    const v56, 0xfffa

    .end local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    invoke-static/range {v32 .. v56}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    .line 35
    .end local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    sget-object v3, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v5, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v3, v6, v5}, Landroidx/compose/material3/MaterialTheme;->getTypography(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Typography;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/compose/material3/Typography;->getBodyMedium()Landroidx/compose/ui/text/TextStyle;

    move-result-object v52

    .line 36
    sget-object v3, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v5, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v3, v6, v5}, Landroidx/compose/material3/MaterialTheme;->getColorScheme(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/ColorScheme;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/compose/material3/ColorScheme;->getOnSurfaceVariant-0d7_KjU()J

    move-result-wide v34

    .line 34
    nop

    .line 36
    nop

    .line 35
    nop

    .line 33
    const-string v32, "Local Area Log"

    .end local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    invoke-static/range {v32 .. v56}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    .line 38
    .end local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    sget-object v3, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v3, Landroidx/compose/ui/Modifier;

    const/16 v5, 0x18

    .local v5, "$this$dp\\11":I
    const/4 v7, 0x0

    .line 129
    .local v7, "$i$f$getDp\\11\\38":I
    move/from16 v32, v7

    .end local v7    # "$i$f$getDp\\11\\38":I
    .local v32, "$i$f$getDp\\11\\38":I
    int-to-float v7, v5

    invoke-static {v7}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v5

    .line 38
    .end local v5    # "$this$dp\\11":I
    .end local v32    # "$i$f$getDp\\11\\38":I
    invoke-static {v3, v5}, Landroidx/compose/foundation/layout/SizeKt;->height-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v3

    const/4 v5, 0x6

    invoke-static {v3, v6, v5}, Landroidx/compose/foundation/layout/SpacerKt;->Spacer(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V

    .line 39
    const/16 v32, 0x0

    const/16 v33, 0x0

    const-wide/16 v34, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x7

    move-object/from16 v36, v6

    .end local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .local v36, "$composer\\9":Landroidx/compose/runtime/Composer;
    invoke-static/range {v32 .. v38}, Landroidx/compose/material3/DividerKt;->HorizontalDivider-9IZ8Weo(Landroidx/compose/ui/Modifier;FJLandroidx/compose/runtime/Composer;II)V

    .line 40
    .end local v36    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    sget-object v3, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v3, Landroidx/compose/ui/Modifier;

    const/16 v5, 0x8

    .local v5, "$this$dp\\12":I
    const/4 v7, 0x0

    .line 130
    .local v7, "$i$f$getDp\\12\\40":I
    move/from16 v32, v7

    .end local v7    # "$i$f$getDp\\12\\40":I
    .local v32, "$i$f$getDp\\12\\40":I
    int-to-float v7, v5

    invoke-static {v7}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v5

    .line 40
    .end local v5    # "$this$dp\\12":I
    .end local v32    # "$i$f$getDp\\12\\40":I
    invoke-static {v3, v5}, Landroidx/compose/foundation/layout/SizeKt;->height-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v3

    const/4 v5, 0x6

    invoke-static {v3, v6, v5}, Landroidx/compose/foundation/layout/SpacerKt;->Spacer(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V

    sget-object v3, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;

    invoke-virtual {v3}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->getLambda$2050716908$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v32

    .line 45
    nop

    .line 46
    const v3, -0x5d50be43

    const-string v5, "CC(remember):DrawerContent.kt#9igjgp"

    invoke-static {v6, v3, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v3

    and-int/lit8 v7, v21, 0x70

    move/from16 v24, v3

    const/16 v3, 0x20

    if-ne v7, v3, :cond_a

    const/4 v3, 0x1

    goto :goto_6

    :cond_a
    const/4 v3, 0x0

    :goto_6
    or-int v3, v24, v3

    .local v3, "invalid\\13":Z
    move-object v7, v6

    .local v7, "$this$cache\\13":Landroidx/compose/runtime/Composer;
    const/16 v24, 0x0

    .line 131
    .local v24, "$i$f$cache\\13\\46":I
    move/from16 v33, v3

    .end local v3    # "invalid\\13":Z
    .local v33, "invalid\\13":Z
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v3

    .local v3, "it\\13":Ljava/lang/Object;
    const/16 v34, 0x0

    .line 132
    .local v34, "$i$a$-let-ComposerKt$cache$1\\14\\131\\13":I
    if-nez v33, :cond_c

    sget-object v35, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 v53, v6

    .end local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {v35 .. v35}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v6

    if-ne v3, v6, :cond_b

    goto :goto_7

    .line 136
    :cond_b
    goto :goto_8

    .line 132
    .end local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    :cond_c
    move-object/from16 v53, v6

    .line 133
    .end local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    :goto_7
    const/4 v6, 0x0

    .line 46
    .local v6, "$i$a$-cache-DrawerContentKt$DrawerContent$1$1\\15\\133\\9":I
    move-object/from16 v35, v3

    .end local v3    # "it\\13":Ljava/lang/Object;
    .local v35, "it\\13":Ljava/lang/Object;
    new-instance v3, Lcom/hardlineforge/lala/ui/screens/DrawerContentKt$$ExternalSyntheticLambda0;

    invoke-direct {v3, v0, v1}, Lcom/hardlineforge/lala/ui/screens/DrawerContentKt$$ExternalSyntheticLambda0;-><init>(Landroidx/navigation/NavHostController;Lkotlin/jvm/functions/Function0;)V

    .line 133
    .end local v6    # "$i$a$-cache-DrawerContentKt$DrawerContent$1$1\\15\\133\\9":I
    nop

    .line 134
    .local v3, "value\\14":Ljava/lang/Object;
    invoke-interface {v7, v3}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 135
    nop

    .line 131
    .end local v3    # "value\\14":Ljava/lang/Object;
    .end local v34    # "$i$a$-let-ComposerKt$cache$1\\14\\131\\13":I
    .end local v35    # "it\\13":Ljava/lang/Object;
    :goto_8
    nop

    .line 46
    .end local v7    # "$this$cache\\13":Landroidx/compose/runtime/Composer;
    .end local v24    # "$i$f$cache\\13\\46":I
    .end local v33    # "invalid\\13":Z
    move-object/from16 v34, v3

    check-cast v34, Lkotlin/jvm/functions/Function0;

    invoke-static/range {v53 .. v53}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    sget-object v3, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;

    invoke-virtual {v3}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->getLambda$1104245608$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v36

    .line 42
    const/16 v33, 0x0

    const/16 v35, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x0

    const/16 v39, 0x0

    const/16 v40, 0x0

    const/16 v42, 0x6036

    const/16 v43, 0x1e8

    move-object/from16 v41, v53

    .end local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .local v41, "$composer\\9":Landroidx/compose/runtime/Composer;
    invoke-static/range {v32 .. v43}, Landroidx/compose/material3/NavigationDrawerKt;->NavigationDrawerItem(Lkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material3/NavigationDrawerItemColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/runtime/Composer;II)V

    move-object/from16 v6, v41

    .end local v41    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .local v6, "$composer\\9":Landroidx/compose/runtime/Composer;
    sget-object v3, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;

    invoke-virtual {v3}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->getLambda$-1699018923$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v32

    .line 54
    nop

    .line 55
    const v3, -0x5d509290

    invoke-static {v6, v3, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v3

    and-int/lit8 v7, v21, 0x70

    move/from16 v24, v3

    const/16 v3, 0x20

    if-ne v7, v3, :cond_d

    const/4 v3, 0x1

    goto :goto_9

    :cond_d
    const/4 v3, 0x0

    :goto_9
    or-int v3, v24, v3

    .local v3, "invalid\\16":Z
    move-object v7, v6

    .local v7, "$this$cache\\16":Landroidx/compose/runtime/Composer;
    const/16 v24, 0x0

    .line 137
    .local v24, "$i$f$cache\\16\\55":I
    move/from16 v33, v3

    .end local v3    # "invalid\\16":Z
    .local v33, "invalid\\16":Z
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v3

    .local v3, "it\\16":Ljava/lang/Object;
    const/16 v34, 0x0

    .line 138
    .local v34, "$i$a$-let-ComposerKt$cache$1\\17\\137\\16":I
    if-nez v33, :cond_f

    sget-object v35, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 v53, v6

    .end local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {v35 .. v35}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v6

    if-ne v3, v6, :cond_e

    goto :goto_a

    .line 142
    :cond_e
    goto :goto_b

    .line 138
    .end local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    :cond_f
    move-object/from16 v53, v6

    .line 139
    .end local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    :goto_a
    const/4 v6, 0x0

    .line 55
    .local v6, "$i$a$-cache-DrawerContentKt$DrawerContent$1$2\\18\\139\\9":I
    move-object/from16 v35, v3

    .end local v3    # "it\\16":Ljava/lang/Object;
    .local v35, "it\\16":Ljava/lang/Object;
    new-instance v3, Lcom/hardlineforge/lala/ui/screens/DrawerContentKt$$ExternalSyntheticLambda1;

    invoke-direct {v3, v0, v1}, Lcom/hardlineforge/lala/ui/screens/DrawerContentKt$$ExternalSyntheticLambda1;-><init>(Landroidx/navigation/NavHostController;Lkotlin/jvm/functions/Function0;)V

    .line 139
    .end local v6    # "$i$a$-cache-DrawerContentKt$DrawerContent$1$2\\18\\139\\9":I
    nop

    .line 140
    .local v3, "value\\17":Ljava/lang/Object;
    invoke-interface {v7, v3}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 141
    nop

    .line 137
    .end local v3    # "value\\17":Ljava/lang/Object;
    .end local v34    # "$i$a$-let-ComposerKt$cache$1\\17\\137\\16":I
    .end local v35    # "it\\16":Ljava/lang/Object;
    :goto_b
    nop

    .line 55
    .end local v7    # "$this$cache\\16":Landroidx/compose/runtime/Composer;
    .end local v24    # "$i$f$cache\\16\\55":I
    .end local v33    # "invalid\\16":Z
    move-object/from16 v34, v3

    check-cast v34, Lkotlin/jvm/functions/Function0;

    invoke-static/range {v53 .. v53}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    sget-object v3, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;

    invoke-virtual {v3}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->getLambda$-724871471$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v36

    .line 51
    const/16 v33, 0x0

    const/16 v35, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x0

    const/16 v39, 0x0

    const/16 v40, 0x0

    const/16 v42, 0x6036

    const/16 v43, 0x1e8

    move-object/from16 v41, v53

    .end local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v41    # "$composer\\9":Landroidx/compose/runtime/Composer;
    invoke-static/range {v32 .. v43}, Landroidx/compose/material3/NavigationDrawerKt;->NavigationDrawerItem(Lkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material3/NavigationDrawerItemColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/runtime/Composer;II)V

    move-object/from16 v6, v41

    .end local v41    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .local v6, "$composer\\9":Landroidx/compose/runtime/Composer;
    sget-object v3, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;

    invoke-virtual {v3}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->getLambda$1733644212$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v32

    .line 63
    nop

    .line 64
    const v3, -0x5d506a8b

    invoke-static {v6, v3, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v3

    and-int/lit8 v7, v21, 0x70

    move/from16 v24, v3

    const/16 v3, 0x20

    if-ne v7, v3, :cond_10

    const/4 v3, 0x1

    goto :goto_c

    :cond_10
    const/4 v3, 0x0

    :goto_c
    or-int v3, v24, v3

    .local v3, "invalid\\19":Z
    move-object v7, v6

    .local v7, "$this$cache\\19":Landroidx/compose/runtime/Composer;
    const/16 v24, 0x0

    .line 143
    .local v24, "$i$f$cache\\19\\64":I
    move/from16 v33, v3

    .end local v3    # "invalid\\19":Z
    .local v33, "invalid\\19":Z
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v3

    .local v3, "it\\19":Ljava/lang/Object;
    const/16 v34, 0x0

    .line 144
    .local v34, "$i$a$-let-ComposerKt$cache$1\\20\\143\\19":I
    if-nez v33, :cond_12

    sget-object v35, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 v53, v6

    .end local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {v35 .. v35}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v6

    if-ne v3, v6, :cond_11

    goto :goto_d

    .line 148
    :cond_11
    goto :goto_e

    .line 144
    .end local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    :cond_12
    move-object/from16 v53, v6

    .line 145
    .end local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    :goto_d
    const/4 v6, 0x0

    .line 64
    .local v6, "$i$a$-cache-DrawerContentKt$DrawerContent$1$3\\21\\145\\9":I
    move-object/from16 v35, v3

    .end local v3    # "it\\19":Ljava/lang/Object;
    .local v35, "it\\19":Ljava/lang/Object;
    new-instance v3, Lcom/hardlineforge/lala/ui/screens/DrawerContentKt$$ExternalSyntheticLambda2;

    invoke-direct {v3, v0, v1}, Lcom/hardlineforge/lala/ui/screens/DrawerContentKt$$ExternalSyntheticLambda2;-><init>(Landroidx/navigation/NavHostController;Lkotlin/jvm/functions/Function0;)V

    .line 145
    .end local v6    # "$i$a$-cache-DrawerContentKt$DrawerContent$1$3\\21\\145\\9":I
    nop

    .line 146
    .local v3, "value\\20":Ljava/lang/Object;
    invoke-interface {v7, v3}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 147
    nop

    .line 143
    .end local v3    # "value\\20":Ljava/lang/Object;
    .end local v34    # "$i$a$-let-ComposerKt$cache$1\\20\\143\\19":I
    .end local v35    # "it\\19":Ljava/lang/Object;
    :goto_e
    nop

    .line 64
    .end local v7    # "$this$cache\\19":Landroidx/compose/runtime/Composer;
    .end local v24    # "$i$f$cache\\19\\64":I
    .end local v33    # "invalid\\19":Z
    move-object/from16 v34, v3

    check-cast v34, Lkotlin/jvm/functions/Function0;

    invoke-static/range {v53 .. v53}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    sget-object v3, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;

    invoke-virtual {v3}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->getLambda$-1587175632$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v36

    .line 60
    const/16 v33, 0x0

    const/16 v35, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x0

    const/16 v39, 0x0

    const/16 v40, 0x0

    const/16 v42, 0x6036

    const/16 v43, 0x1e8

    move-object/from16 v41, v53

    .end local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v41    # "$composer\\9":Landroidx/compose/runtime/Composer;
    invoke-static/range {v32 .. v43}, Landroidx/compose/material3/NavigationDrawerKt;->NavigationDrawerItem(Lkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material3/NavigationDrawerItemColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/runtime/Composer;II)V

    move-object/from16 v6, v41

    .end local v41    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .local v6, "$composer\\9":Landroidx/compose/runtime/Composer;
    sget-object v3, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;

    invoke-virtual {v3}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->getLambda$871340051$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v32

    .line 72
    nop

    .line 73
    const v3, -0x5d5042b1

    invoke-static {v6, v3, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v3

    and-int/lit8 v7, v21, 0x70

    move/from16 v24, v3

    const/16 v3, 0x20

    if-ne v7, v3, :cond_13

    const/4 v3, 0x1

    goto :goto_f

    :cond_13
    const/4 v3, 0x0

    :goto_f
    or-int v3, v24, v3

    .local v3, "invalid\\22":Z
    move-object v7, v6

    .local v7, "$this$cache\\22":Landroidx/compose/runtime/Composer;
    const/16 v24, 0x0

    .line 149
    .local v24, "$i$f$cache\\22\\73":I
    move/from16 v33, v3

    .end local v3    # "invalid\\22":Z
    .local v33, "invalid\\22":Z
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v3

    .local v3, "it\\22":Ljava/lang/Object;
    const/16 v34, 0x0

    .line 150
    .local v34, "$i$a$-let-ComposerKt$cache$1\\23\\149\\22":I
    if-nez v33, :cond_15

    sget-object v35, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 v53, v6

    .end local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {v35 .. v35}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v6

    if-ne v3, v6, :cond_14

    goto :goto_10

    .line 154
    :cond_14
    goto :goto_11

    .line 150
    .end local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    :cond_15
    move-object/from16 v53, v6

    .line 151
    .end local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    :goto_10
    const/4 v6, 0x0

    .line 73
    .local v6, "$i$a$-cache-DrawerContentKt$DrawerContent$1$4\\24\\151\\9":I
    move-object/from16 v35, v3

    .end local v3    # "it\\22":Ljava/lang/Object;
    .local v35, "it\\22":Ljava/lang/Object;
    new-instance v3, Lcom/hardlineforge/lala/ui/screens/DrawerContentKt$$ExternalSyntheticLambda3;

    invoke-direct {v3, v0, v1}, Lcom/hardlineforge/lala/ui/screens/DrawerContentKt$$ExternalSyntheticLambda3;-><init>(Landroidx/navigation/NavHostController;Lkotlin/jvm/functions/Function0;)V

    .line 151
    .end local v6    # "$i$a$-cache-DrawerContentKt$DrawerContent$1$4\\24\\151\\9":I
    nop

    .line 152
    .local v3, "value\\23":Ljava/lang/Object;
    invoke-interface {v7, v3}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 153
    nop

    .line 149
    .end local v3    # "value\\23":Ljava/lang/Object;
    .end local v34    # "$i$a$-let-ComposerKt$cache$1\\23\\149\\22":I
    .end local v35    # "it\\22":Ljava/lang/Object;
    :goto_11
    nop

    .line 73
    .end local v7    # "$this$cache\\22":Landroidx/compose/runtime/Composer;
    .end local v24    # "$i$f$cache\\22\\73":I
    .end local v33    # "invalid\\22":Z
    move-object/from16 v34, v3

    check-cast v34, Lkotlin/jvm/functions/Function0;

    invoke-static/range {v53 .. v53}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    sget-object v3, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;

    invoke-virtual {v3}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->getLambda$1845487503$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v36

    .line 69
    const/16 v33, 0x0

    const/16 v35, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x0

    const/16 v39, 0x0

    const/16 v40, 0x0

    const/16 v42, 0x6036

    const/16 v43, 0x1e8

    move-object/from16 v41, v53

    .end local v53    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v41    # "$composer\\9":Landroidx/compose/runtime/Composer;
    invoke-static/range {v32 .. v43}, Landroidx/compose/material3/NavigationDrawerKt;->NavigationDrawerItem(Lkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material3/NavigationDrawerItemColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/runtime/Composer;II)V

    move-object/from16 v6, v41

    .end local v41    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .local v6, "$composer\\9":Landroidx/compose/runtime/Composer;
    sget-object v3, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;

    invoke-virtual {v3}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->getLambda$9035890$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v32

    .line 81
    nop

    .line 82
    const v3, -0x5d501bf0

    invoke-static {v6, v3, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v3

    and-int/lit8 v5, v21, 0x70

    const/16 v7, 0x20

    if-ne v5, v7, :cond_16

    const/16 v17, 0x1

    goto :goto_12

    :cond_16
    const/16 v17, 0x0

    :goto_12
    or-int v3, v3, v17

    .local v3, "invalid\\25":Z
    move-object v5, v6

    .local v5, "$this$cache\\25":Landroidx/compose/runtime/Composer;
    const/4 v7, 0x0

    .line 155
    .local v7, "$i$f$cache\\25\\82":I
    move/from16 v17, v3

    .end local v3    # "invalid\\25":Z
    .local v17, "invalid\\25":Z
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v3

    .local v3, "it\\25":Ljava/lang/Object;
    const/16 v18, 0x0

    .line 156
    .local v18, "$i$a$-let-ComposerKt$cache$1\\26\\155\\25":I
    if-nez v17, :cond_18

    sget-object v19, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 v24, v4

    .end local v4    # "$composer":Landroidx/compose/runtime/Composer;
    .local v24, "$composer":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {v19 .. v19}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v4

    if-ne v3, v4, :cond_17

    goto :goto_13

    .line 160
    :cond_17
    goto :goto_14

    .line 156
    .end local v24    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v4    # "$composer":Landroidx/compose/runtime/Composer;
    :cond_18
    move-object/from16 v24, v4

    .line 157
    .end local v4    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v24    # "$composer":Landroidx/compose/runtime/Composer;
    :goto_13
    const/4 v4, 0x0

    .line 82
    .local v4, "$i$a$-cache-DrawerContentKt$DrawerContent$1$5\\27\\157\\9":I
    move-object/from16 v19, v3

    .end local v3    # "it\\25":Ljava/lang/Object;
    .local v19, "it\\25":Ljava/lang/Object;
    new-instance v3, Lcom/hardlineforge/lala/ui/screens/DrawerContentKt$$ExternalSyntheticLambda4;

    invoke-direct {v3, v0, v1}, Lcom/hardlineforge/lala/ui/screens/DrawerContentKt$$ExternalSyntheticLambda4;-><init>(Landroidx/navigation/NavHostController;Lkotlin/jvm/functions/Function0;)V

    .line 157
    .end local v4    # "$i$a$-cache-DrawerContentKt$DrawerContent$1$5\\27\\157\\9":I
    nop

    .line 158
    .local v3, "value\\26":Ljava/lang/Object;
    invoke-interface {v5, v3}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 159
    nop

    .line 155
    .end local v3    # "value\\26":Ljava/lang/Object;
    .end local v18    # "$i$a$-let-ComposerKt$cache$1\\26\\155\\25":I
    .end local v19    # "it\\25":Ljava/lang/Object;
    :goto_14
    nop

    .line 82
    .end local v5    # "$this$cache\\25":Landroidx/compose/runtime/Composer;
    .end local v7    # "$i$f$cache\\25\\82":I
    .end local v17    # "invalid\\25":Z
    move-object/from16 v34, v3

    check-cast v34, Lkotlin/jvm/functions/Function0;

    invoke-static {v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    sget-object v3, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;

    invoke-virtual {v3}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$DrawerContentKt;->getLambda$983183342$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v36

    .line 78
    const/16 v33, 0x0

    const/16 v35, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x0

    const/16 v39, 0x0

    const/16 v40, 0x0

    const/16 v42, 0x6036

    const/16 v43, 0x1e8

    move-object/from16 v41, v6

    .end local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v41    # "$composer\\9":Landroidx/compose/runtime/Composer;
    invoke-static/range {v32 .. v43}, Landroidx/compose/material3/NavigationDrawerKt;->NavigationDrawerItem(Lkotlin/jvm/functions/Function2;ZLkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material3/NavigationDrawerItemColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/runtime/Composer;II)V

    .line 27
    .end local v41    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    invoke-static {v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 87
    nop

    .line 98
    .end local v6    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .end local v8    # "$changed\\9":I
    .end local v26    # "$i$a$-Column-DrawerContentKt$DrawerContent$1\\9\\98\\0":I
    .end local v28    # "$this$DrawerContent_u24lambda_u2412\\9":Landroidx/compose/foundation/layout/ColumnScope;
    invoke-static/range {v57 .. v57}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 127
    .end local v29    # "$changed\\8":I
    .end local v57    # "$composer\\8":Landroidx/compose/runtime/Composer;
    .end local v58    # "$i$a$-Layout-ColumnKt$Column$1\\8\\127\\2":I
    nop

    .line 161
    invoke-interface/range {v30 .. v30}, Landroidx/compose/runtime/Composer;->endNode()V

    .line 107
    invoke-static/range {v30 .. v30}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 162
    nop

    .line 101
    .end local v20    # "$i$f$ReusableComposeNode\\4\\105":I
    .end local v22    # "$changed\\4":I
    .end local v27    # "factory\\4":Lkotlin/jvm/functions/Function0;
    invoke-static/range {v30 .. v30}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 163
    nop

    .line 91
    .end local v10    # "localMap\\3":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v11    # "modifier\\3":Landroidx/compose/ui/Modifier;
    .end local v15    # "$changed\\3":I
    .end local v16    # "$i$f$Layout\\3\\97":I
    .end local v23    # "materialized\\3":Landroidx/compose/ui/Modifier;
    .end local v31    # "compositeKeyHash\\3":I
    invoke-static/range {v30 .. v30}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 164
    nop

    .end local v9    # "$i$f$Column\\2\\26":I
    .end local v12    # "verticalArrangement\\2":Landroidx/compose/foundation/layout/Arrangement$Vertical;
    .end local v13    # "horizontalAlignment\\2":Landroidx/compose/ui/Alignment$Horizontal;
    .end local v14    # "measurePolicy\\2":Landroidx/compose/ui/layout/MeasurePolicy;
    .end local v25    # "$changed\\2":I
    .end local v30    # "$composer\\2":Landroidx/compose/runtime/Composer;
    .end local p2    # "modifier\\2":Landroidx/compose/ui/Modifier;
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v3

    if-eqz v3, :cond_1a

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_15

    .line 24
    .end local v21    # "$dirty":I
    .end local v24    # "$composer":Landroidx/compose/runtime/Composer;
    .local v4, "$composer":Landroidx/compose/runtime/Composer;
    .local v5, "$dirty":I
    :cond_19
    move-object/from16 v24, v4

    move/from16 v21, v5

    .end local v4    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v5    # "$dirty":I
    .restart local v21    # "$dirty":I
    .restart local v24    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface/range {v24 .. v24}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 88
    :cond_1a
    :goto_15
    invoke-interface/range {v24 .. v24}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v3

    if-eqz v3, :cond_1b

    new-instance v4, Lcom/hardlineforge/lala/ui/screens/DrawerContentKt$$ExternalSyntheticLambda5;

    invoke-direct {v4, v0, v1, v2}, Lcom/hardlineforge/lala/ui/screens/DrawerContentKt$$ExternalSyntheticLambda5;-><init>(Landroidx/navigation/NavHostController;Lkotlin/jvm/functions/Function0;I)V

    invoke-interface {v3, v4}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_1b
    return-void
.end method

.method static final DrawerContent$lambda$12$lambda$11$lambda$10(Landroidx/navigation/NavHostController;Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;
    .locals 6
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$onNavigate"    # Lkotlin/jvm/functions/Function0;

    .line 83
    move-object v0, p0

    check-cast v0, Landroidx/navigation/NavController;

    const/4 v4, 0x6

    const/4 v5, 0x0

    const-string v1, "settings"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Landroidx/navigation/NavController;->navigate$default(Landroidx/navigation/NavController;Ljava/lang/String;Landroidx/navigation/NavOptions;Landroidx/navigation/Navigator$Extras;ILjava/lang/Object;)V

    .line 84
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 85
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final DrawerContent$lambda$12$lambda$3$lambda$2(Landroidx/navigation/NavHostController;Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;
    .locals 2
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$onNavigate"    # Lkotlin/jvm/functions/Function0;

    .line 47
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/DrawerContentKt$$ExternalSyntheticLambda6;

    invoke-direct {v0}, Lcom/hardlineforge/lala/ui/screens/DrawerContentKt$$ExternalSyntheticLambda6;-><init>()V

    const-string v1, "timeline"

    invoke-virtual {p0, v1, v0}, Landroidx/navigation/NavHostController;->navigate(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    .line 48
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 49
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final DrawerContent$lambda$12$lambda$3$lambda$2$lambda$1(Landroidx/navigation/NavOptionsBuilder;)Lkotlin/Unit;
    .locals 2
    .param p0, "$this$navigate"    # Landroidx/navigation/NavOptionsBuilder;

    const-string v0, "$this$navigate"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/DrawerContentKt$$ExternalSyntheticLambda7;

    invoke-direct {v0}, Lcom/hardlineforge/lala/ui/screens/DrawerContentKt$$ExternalSyntheticLambda7;-><init>()V

    const-string v1, "timeline"

    invoke-virtual {p0, v1, v0}, Landroidx/navigation/NavOptionsBuilder;->popUpTo(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final DrawerContent$lambda$12$lambda$3$lambda$2$lambda$1$lambda$0(Landroidx/navigation/PopUpToBuilder;)Lkotlin/Unit;
    .locals 1
    .param p0, "$this$popUpTo"    # Landroidx/navigation/PopUpToBuilder;

    const-string v0, "$this$popUpTo"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroidx/navigation/PopUpToBuilder;->setInclusive(Z)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final DrawerContent$lambda$12$lambda$5$lambda$4(Landroidx/navigation/NavHostController;Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;
    .locals 6
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$onNavigate"    # Lkotlin/jvm/functions/Function0;

    .line 56
    move-object v0, p0

    check-cast v0, Landroidx/navigation/NavController;

    const/4 v4, 0x6

    const/4 v5, 0x0

    const-string v1, "map_view"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Landroidx/navigation/NavController;->navigate$default(Landroidx/navigation/NavController;Ljava/lang/String;Landroidx/navigation/NavOptions;Landroidx/navigation/Navigator$Extras;ILjava/lang/Object;)V

    .line 57
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 58
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final DrawerContent$lambda$12$lambda$7$lambda$6(Landroidx/navigation/NavHostController;Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;
    .locals 6
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$onNavigate"    # Lkotlin/jvm/functions/Function0;

    .line 65
    move-object v0, p0

    check-cast v0, Landroidx/navigation/NavController;

    const/4 v4, 0x6

    const/4 v5, 0x0

    const-string v1, "media_gallery"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Landroidx/navigation/NavController;->navigate$default(Landroidx/navigation/NavController;Ljava/lang/String;Landroidx/navigation/NavOptions;Landroidx/navigation/Navigator$Extras;ILjava/lang/Object;)V

    .line 66
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 67
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final DrawerContent$lambda$12$lambda$9$lambda$8(Landroidx/navigation/NavHostController;Lkotlin/jvm/functions/Function0;)Lkotlin/Unit;
    .locals 6
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$onNavigate"    # Lkotlin/jvm/functions/Function0;

    .line 74
    move-object v0, p0

    check-cast v0, Landroidx/navigation/NavController;

    const/4 v4, 0x6

    const/4 v5, 0x0

    const-string v1, "reports"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Landroidx/navigation/NavController;->navigate$default(Landroidx/navigation/NavController;Ljava/lang/String;Landroidx/navigation/NavOptions;Landroidx/navigation/Navigator$Extras;ILjava/lang/Object;)V

    .line 75
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 76
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final DrawerContent$lambda$13(Landroidx/navigation/NavHostController;Lkotlin/jvm/functions/Function0;ILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 1

    or-int/lit8 v0, p2, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v0

    invoke-static {p0, p1, p3, v0}, Lcom/hardlineforge/lala/ui/screens/DrawerContentKt;->DrawerContent(Landroidx/navigation/NavHostController;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;I)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method
