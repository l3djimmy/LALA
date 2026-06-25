.class public final Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;
.super Ljava/lang/Object;
.source "PdfPreviewScreen.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPdfPreviewScreen.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PdfPreviewScreen.kt\ncom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt\n+ 2 HiltViewModel.kt\nandroidx/hilt/navigation/compose/HiltViewModelKt\n+ 3 ViewModel.kt\nandroidx/lifecycle/viewmodel/compose/ViewModelKt\n+ 4 Composer.kt\nandroidx/compose/runtime/ComposerKt\n+ 5 SnapshotState.kt\nandroidx/compose/runtime/SnapshotStateKt__SnapshotStateKt\n+ 6 CompositionLocal.kt\nandroidx/compose/runtime/CompositionLocal\n+ 7 Column.kt\nandroidx/compose/foundation/layout/ColumnKt\n+ 8 Layout.kt\nandroidx/compose/ui/layout/LayoutKt\n+ 9 Composables.kt\nandroidx/compose/runtime/ComposablesKt\n+ 10 Composer.kt\nandroidx/compose/runtime/Updater\n+ 11 Box.kt\nandroidx/compose/foundation/layout/BoxKt\n+ 12 Dp.kt\nandroidx/compose/ui/unit/DpKt\n*L\n1#1,98:1\n46#2,7:99\n86#3,6:106\n1247#4,6:112\n1247#4,6:129\n1247#4,6:135\n1247#4,6:141\n1247#4,6:147\n1247#4,6:230\n1247#4,6:237\n85#5:118\n113#5,2:119\n85#5:121\n113#5,2:122\n85#5:124\n113#5,2:125\n85#5:127\n75#6:128\n87#7:153\n84#7,9:154\n94#7:248\n79#8,6:163\n86#8,3:178\n89#8,2:187\n79#8,6:199\n86#8,3:214\n89#8,2:223\n93#8:228\n93#8:247\n347#9,9:169\n356#9:189\n347#9,9:205\n356#9,3:225\n357#9,2:245\n4206#10,6:181\n4206#10,6:217\n70#11:190\n68#11,8:191\n77#11:229\n113#12:236\n113#12:243\n113#12:244\n*S KotlinDebug\n*F\n+ 1 PdfPreviewScreen.kt\ncom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt\n*L\n24#1:99,7\n24#1:106,6\n32#1:112,6\n40#1:129,6\n41#1:135,6\n42#1:141,6\n45#1:147,6\n58#1:230,6\n67#1:237,6\n40#1:118\n40#1:119,2\n41#1:121\n41#1:122,2\n42#1:124\n42#1:125,2\n43#1:127\n39#1:128\n51#1:153\n51#1:154,9\n51#1:248\n51#1:163,6\n51#1:178,3\n51#1:187,2\n53#1:199,6\n53#1:214,3\n53#1:223,2\n53#1:228\n51#1:247\n51#1:169,9\n51#1:189\n53#1:205,9\n53#1:225,3\n51#1:245,2\n51#1:181,6\n53#1:217,6\n53#1:190\n53#1:191,8\n53#1:229\n65#1:236\n82#1:243\n91#1:244\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\u001a\u001f\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005H\u0007\u00a2\u0006\u0002\u0010\u0006\u00a8\u0006\u0007\u00b2\u0006\u000c\u0010\u0008\u001a\u0004\u0018\u00010\tX\u008a\u008e\u0002\u00b2\u0006\n\u0010\n\u001a\u00020\u000bX\u008a\u008e\u0002\u00b2\u0006\u000c\u0010\u000c\u001a\u0004\u0018\u00010\rX\u008a\u008e\u0002\u00b2\u0006\u0010\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u00100\u000fX\u008a\u0084\u0002"
    }
    d2 = {
        "PdfPreviewScreen",
        "",
        "navController",
        "Landroidx/navigation/NavHostController;",
        "viewModel",
        "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;",
        "(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V",
        "app_debug",
        "pdfFile",
        "Ljava/io/File;",
        "isSaving",
        "",
        "saveError",
        "",
        "allEntries",
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
.method public static final PdfPreviewScreen(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V
    .locals 21
    .param p0, "navController"    # Landroidx/navigation/NavHostController;
    .param p1, "viewModel"    # Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p4

    const-string v3, "navController"

    invoke-static {v0, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    const v3, -0x452db30b

    move-object/from16 v4, p2

    invoke-interface {v4, v3}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v4

    .end local p2    # "$composer":Landroidx/compose/runtime/Composer;
    .local v4, "$composer":Landroidx/compose/runtime/Composer;
    const-string v5, "C(PdfPreviewScreen)26@912L378,37@1297L2481,25@885L2893:PdfPreviewScreen.kt#4cebsy"

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

    move-result v7

    if-eqz v7, :cond_3

    const/16 v7, 0x20

    goto :goto_1

    :cond_2
    move-object/from16 v6, p1

    :cond_3
    const/16 v7, 0x10

    :goto_1
    or-int/2addr v5, v7

    goto :goto_2

    :cond_4
    move-object/from16 v6, p1

    :goto_2
    and-int/lit8 v7, v5, 0x13

    const/16 v8, 0x12

    if-eq v7, v8, :cond_5

    const/4 v7, 0x1

    goto :goto_3

    :cond_5
    const/4 v7, 0x0

    :goto_3
    and-int/lit8 v8, v5, 0x1

    invoke-interface {v4, v7, v8}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v7

    if-eqz v7, :cond_d

    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v7, "23@861L15"

    invoke-static {v4, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v7, v1, 0x1

    if-eqz v7, :cond_7

    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v7

    if-eqz v7, :cond_6

    goto :goto_4

    .line 21
    :cond_6
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v7, v2, 0x2

    if-eqz v7, :cond_a

    and-int/lit8 v5, v5, -0x71

    goto/16 :goto_6

    .line 25
    :cond_7
    :goto_4
    and-int/lit8 v7, v2, 0x2

    if-eqz v7, :cond_a

    .line 24
    const/4 v7, 0x0

    .local v7, "$changed\\1":I
    move-object v15, v4

    .local v15, "$composer\\1":Landroidx/compose/runtime/Composer;
    const/4 v8, 0x0

    .local v8, "$i$f$hiltViewModel\\1\\24":I
    const v10, 0x70b323c8

    invoke-interface {v15, v10}, Landroidx/compose/runtime/Composer;->startReplaceableGroup(I)V

    const-string v10, "CC(hiltViewModel)P(1)*45@1969L7,50@2112L47,51@2171L54:HiltViewModel.kt#9mcars"

    invoke-static {v15, v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 99
    sget-object v10, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->INSTANCE:Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;

    sget v11, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->$stable:I

    invoke-virtual {v10, v15, v11}, Landroidx/lifecycle/viewmodel/compose/LocalViewModelStoreOwner;->getCurrent(Landroidx/compose/runtime/Composer;I)Landroidx/lifecycle/ViewModelStoreOwner;

    move-result-object v11

    if-eqz v11, :cond_9

    .line 102
    .local v11, "viewModelStoreOwner\\1":Landroidx/lifecycle/ViewModelStoreOwner;
    const/4 v12, 0x0

    .line 104
    .local v12, "key\\1":Ljava/lang/String;
    and-int/lit8 v10, v7, 0xe

    invoke-static {v11, v15, v10}, Landroidx/hilt/navigation/compose/HiltViewModelKt;->createHiltViewModelFactory(Landroidx/lifecycle/ViewModelStoreOwner;Landroidx/compose/runtime/Composer;I)Landroidx/lifecycle/ViewModelProvider$Factory;

    move-result-object v13

    .local v13, "factory\\1":Landroidx/lifecycle/ViewModelProvider$Factory;
    and-int/lit8 v10, v7, 0xe

    and-int/lit8 v14, v7, 0x70

    or-int/2addr v10, v14

    .line 105
    move/from16 v18, v10

    .local v18, "$changed\\3":I
    const/16 v19, 0x0

    .local v19, "$i$f$viewModel\\3\\105":I
    const v10, 0x671a9c9b

    invoke-interface {v15, v10}, Landroidx/compose/runtime/Composer;->startReplaceableGroup(I)V

    const-string v10, "CC(viewModel)P(3,2,1)*80@3834L7,90@4209L68:ViewModel.kt#3tja67"

    invoke-static {v15, v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 106
    instance-of v10, v11, Landroidx/lifecycle/HasDefaultViewModelProviderFactory;

    if-eqz v10, :cond_8

    .line 107
    move-object v10, v11

    check-cast v10, Landroidx/lifecycle/HasDefaultViewModelProviderFactory;

    invoke-interface {v10}, Landroidx/lifecycle/HasDefaultViewModelProviderFactory;->getDefaultViewModelCreationExtras()Landroidx/lifecycle/viewmodel/CreationExtras;

    move-result-object v10

    move-object v14, v10

    goto :goto_5

    .line 109
    :cond_8
    sget-object v10, Landroidx/lifecycle/viewmodel/CreationExtras$Empty;->INSTANCE:Landroidx/lifecycle/viewmodel/CreationExtras$Empty;

    check-cast v10, Landroidx/lifecycle/viewmodel/CreationExtras;

    move-object v14, v10

    :goto_5
    nop

    .local v14, "extras\\3":Landroidx/lifecycle/viewmodel/CreationExtras;
    const-class v10, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    .line 111
    shl-int/lit8 v9, v18, 0x3

    and-int/lit16 v9, v9, 0x380

    const v16, 0x9048

    or-int v16, v9, v16

    const/16 v17, 0x0

    invoke-static/range {v10 .. v17}, Landroidx/lifecycle/viewmodel/compose/ViewModelKt;->viewModel(Ljava/lang/Class;Landroidx/lifecycle/ViewModelStoreOwner;Ljava/lang/String;Landroidx/lifecycle/ViewModelProvider$Factory;Landroidx/lifecycle/viewmodel/CreationExtras;Landroidx/compose/runtime/Composer;II)Landroidx/lifecycle/ViewModel;

    move-result-object v9

    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->endReplaceableGroup()V

    .line 105
    .end local v14    # "extras\\3":Landroidx/lifecycle/viewmodel/CreationExtras;
    .end local v18    # "$changed\\3":I
    .end local v19    # "$i$f$viewModel\\3\\105":I
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->endReplaceableGroup()V

    .end local v7    # "$changed\\1":I
    .end local v8    # "$i$f$hiltViewModel\\1\\24":I
    .end local v11    # "viewModelStoreOwner\\1":Landroidx/lifecycle/ViewModelStoreOwner;
    .end local v12    # "key\\1":Ljava/lang/String;
    .end local v13    # "factory\\1":Landroidx/lifecycle/ViewModelProvider$Factory;
    .end local v15    # "$composer\\1":Landroidx/compose/runtime/Composer;
    move-object v6, v9

    check-cast v6, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    .end local p1    # "viewModel":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v6, "viewModel":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    and-int/lit8 v5, v5, -0x71

    move-object/from16 v20, v6

    move v6, v5

    move-object/from16 v5, v20

    goto :goto_7

    .line 99
    .end local v6    # "viewModel":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .restart local v7    # "$changed\\1":I
    .restart local v8    # "$i$f$hiltViewModel\\1\\24":I
    .restart local v15    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .restart local p1    # "viewModel":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    :cond_9
    const/4 v2, 0x0

    .line 100
    .local v2, "$i$a$-checkNotNull-HiltViewModelKt$hiltViewModel$1\\2\\99\\1":I
    nop

    .line 99
    .end local v2    # "$i$a$-checkNotNull-HiltViewModelKt$hiltViewModel$1\\2\\99\\1":I
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "No ViewModelStoreOwner was provided via LocalViewModelStoreOwner"

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 21
    .end local v7    # "$changed\\1":I
    .end local v8    # "$i$f$hiltViewModel\\1\\24":I
    .end local v15    # "$composer\\1":Landroidx/compose/runtime/Composer;
    :cond_a
    :goto_6
    move-object/from16 v20, v6

    move v6, v5

    move-object/from16 v5, v20

    .end local p1    # "viewModel":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v5, "viewModel":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v6, "$dirty":I
    :goto_7
    invoke-interface {v4}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v7

    if-eqz v7, :cond_b

    const/4 v7, -0x1

    const-string v8, "com.hardlineforge.lala.ui.screens.PdfPreviewScreen (PdfPreviewScreen.kt:24)"

    invoke-static {v3, v6, v7, v8}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 27
    :cond_b
    new-instance v3, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$$ExternalSyntheticLambda5;

    invoke-direct {v3, v0}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$$ExternalSyntheticLambda5;-><init>(Landroidx/navigation/NavHostController;)V

    const v7, 0x6f84cbb1

    const/16 v8, 0x36

    const/4 v9, 0x1

    invoke-static {v7, v9, v3, v4, v8}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v3

    check-cast v3, Lkotlin/jvm/functions/Function2;

    .line 38
    new-instance v7, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$$ExternalSyntheticLambda6;

    invoke-direct {v7, v5}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$$ExternalSyntheticLambda6;-><init>(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)V

    const v10, -0x24a2f37a

    invoke-static {v10, v9, v7, v4, v8}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v7

    move-object v15, v7

    check-cast v15, Lkotlin/jvm/functions/Function3;

    .line 26
    move-object/from16 v16, v4

    .end local v4    # "$composer":Landroidx/compose/runtime/Composer;
    .local v16, "$composer":Landroidx/compose/runtime/Composer;
    const/4 v4, 0x0

    move v7, v6

    .end local v6    # "$dirty":I
    .local v7, "$dirty":I
    const/4 v6, 0x0

    move v8, v7

    .end local v7    # "$dirty":I
    .local v8, "$dirty":I
    const/4 v7, 0x0

    move v9, v8

    .end local v8    # "$dirty":I
    .local v9, "$dirty":I
    const/4 v8, 0x0

    move v10, v9

    .end local v9    # "$dirty":I
    .local v10, "$dirty":I
    const/4 v9, 0x0

    move v12, v10

    .end local v10    # "$dirty":I
    .local v12, "$dirty":I
    const-wide/16 v10, 0x0

    move v14, v12

    .end local v12    # "$dirty":I
    .local v14, "$dirty":I
    const-wide/16 v12, 0x0

    move/from16 v17, v14

    .end local v14    # "$dirty":I
    .local v17, "$dirty":I
    const/4 v14, 0x0

    move/from16 v18, v17

    .end local v17    # "$dirty":I
    .local v18, "$dirty":I
    const v17, 0x30000030

    move/from16 v19, v18

    .end local v18    # "$dirty":I
    .local v19, "$dirty":I
    const/16 v18, 0x1fd

    move-object/from16 v20, v5

    move-object v5, v3

    move-object/from16 v3, v20

    .end local v5    # "viewModel":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .local v3, "viewModel":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    invoke-static/range {v4 .. v18}, Landroidx/compose/material3/ScaffoldKt;->Scaffold-TvnljyQ(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;IJJLandroidx/compose/foundation/layout/WindowInsets;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V

    move-object/from16 v15, v16

    .end local v16    # "$composer":Landroidx/compose/runtime/Composer;
    .local v15, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v4

    if-eqz v4, :cond_c

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 97
    :cond_c
    move/from16 v5, v19

    goto :goto_8

    .line 21
    .end local v3    # "viewModel":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .end local v15    # "$composer":Landroidx/compose/runtime/Composer;
    .end local v19    # "$dirty":I
    .restart local v4    # "$composer":Landroidx/compose/runtime/Composer;
    .local v5, "$dirty":I
    .restart local p1    # "viewModel":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    :cond_d
    move-object v15, v4

    .end local v4    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v15    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move-object v3, v6

    .line 97
    .end local p1    # "viewModel":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .restart local v3    # "viewModel":Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    :goto_8
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v4

    if-eqz v4, :cond_e

    new-instance v6, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$$ExternalSyntheticLambda7;

    invoke-direct {v6, v0, v3, v1, v2}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$$ExternalSyntheticLambda7;-><init>(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;II)V

    invoke-interface {v4, v6}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_e
    return-void
.end method

.method static final PdfPreviewScreen$lambda$23(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/foundation/layout/PaddingValues;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 68
    .param p0, "$viewModel"    # Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .param p1, "paddingValues"    # Landroidx/compose/foundation/layout/PaddingValues;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    const-string v2, "paddingValues"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "C38@1351L7,39@1382L40,40@1447L34,41@1507L42,42@1597L16,44@1644L155,44@1623L176,50@1809L1963:PdfPreviewScreen.kt#4cebsy"

    invoke-static {v1, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v2, p3

    .local v2, "$dirty":I
    and-int/lit8 v3, p3, 0x6

    const/4 v4, 0x2

    if-nez v3, :cond_1

    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x4

    goto :goto_0

    :cond_0
    move v3, v4

    :goto_0
    or-int/2addr v2, v3

    :cond_1
    and-int/lit8 v3, v2, 0x13

    const/16 v5, 0x12

    const/4 v7, 0x1

    if-eq v3, v5, :cond_2

    move v3, v7

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    :goto_1
    and-int/lit8 v5, v2, 0x1

    invoke-interface {v1, v3, v5}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v3

    if-eqz v3, :cond_16

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v3

    if-eqz v3, :cond_3

    const/4 v3, -0x1

    const-string v5, "com.hardlineforge.lala.ui.screens.PdfPreviewScreen.<anonymous> (PdfPreviewScreen.kt:38)"

    const v8, -0x24a2f37a

    invoke-static {v8, v2, v3, v5}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 39
    :cond_3
    invoke-static {}, Landroidx/compose/ui/platform/AndroidCompositionLocals_androidKt;->getLocalContext()Landroidx/compose/runtime/ProvidableCompositionLocal;

    move-result-object v3

    check-cast v3, Landroidx/compose/runtime/CompositionLocal;

    .local v3, "this_\\1":Landroidx/compose/runtime/CompositionLocal;
    const/4 v5, 0x0

    .local v5, "$changed\\1":I
    move-object/from16 v8, p2

    .local v8, "$composer\\1":Landroidx/compose/runtime/Composer;
    const/4 v9, 0x0

    .line 128
    .local v9, "$i$f$getCurrent\\1\\39":I
    const v10, 0x789c5f52

    const-string v11, "CC(<get-current>):CompositionLocal.kt#9igjgp"

    invoke-static {v8, v10, v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v8, v3}, Landroidx/compose/runtime/Composer;->consume(Landroidx/compose/runtime/CompositionLocal;)Ljava/lang/Object;

    move-result-object v10

    invoke-static {v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 39
    .end local v3    # "this_\\1":Landroidx/compose/runtime/CompositionLocal;
    .end local v5    # "$changed\\1":I
    .end local v8    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .end local v9    # "$i$f$getCurrent\\1\\39":I
    move-object v12, v10

    check-cast v12, Landroid/content/Context;

    .line 40
    .local v12, "context":Landroid/content/Context;
    const v3, 0x784c0dce

    const-string v5, "CC(remember):PdfPreviewScreen.kt#9igjgp"

    invoke-static {v1, v3, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v3, 0x0

    .local v3, "invalid\\2":Z
    .local v8, "$this$cache\\2":Landroidx/compose/runtime/Composer;
    const/4 v9, 0x0

    .line 129
    .local v9, "$i$f$cache\\2\\40":I
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v10

    .local v10, "it\\2":Ljava/lang/Object;
    const/4 v11, 0x0

    .line 130
    .local v11, "$i$a$-let-ComposerKt$cache$1\\3\\129\\2":I
    sget-object v13, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v13}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v13

    const/4 v14, 0x0

    if-ne v10, v13, :cond_4

    .line 131
    const/4 v13, 0x0

    .line 40
    .local v13, "$i$a$-cache-PdfPreviewScreenKt$PdfPreviewScreen$2$pdfFile$2\\4\\131\\0":I
    invoke-static {v14, v14, v4, v14}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateOf$default(Ljava/lang/Object;Landroidx/compose/runtime/SnapshotMutationPolicy;ILjava/lang/Object;)Landroidx/compose/runtime/MutableState;

    move-result-object v13

    .line 131
    .end local v13    # "$i$a$-cache-PdfPreviewScreenKt$PdfPreviewScreen$2$pdfFile$2\\4\\131\\0":I
    nop

    .line 132
    .local v13, "value\\3":Ljava/lang/Object;
    invoke-interface {v8, v13}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 133
    move-object v10, v13

    .end local v13    # "value\\3":Ljava/lang/Object;
    goto :goto_2

    .line 134
    :cond_4
    nop

    .line 129
    .end local v10    # "it\\2":Ljava/lang/Object;
    .end local v11    # "$i$a$-let-ComposerKt$cache$1\\3\\129\\2":I
    :goto_2
    nop

    .line 40
    .end local v3    # "invalid\\2":Z
    .end local v8    # "$this$cache\\2":Landroidx/compose/runtime/Composer;
    .end local v9    # "$i$f$cache\\2\\40":I
    move-object v15, v10

    check-cast v15, Landroidx/compose/runtime/MutableState;

    .local v15, "pdfFile$delegate":Landroidx/compose/runtime/MutableState;
    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 41
    const v3, 0x784c15e8

    invoke-static {v1, v3, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v3, 0x0

    .local v3, "invalid\\5":Z
    move-object/from16 v8, p2

    .local v8, "$this$cache\\5":Landroidx/compose/runtime/Composer;
    const/4 v9, 0x0

    .line 135
    .local v9, "$i$f$cache\\5\\41":I
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v10

    .local v10, "it\\5":Ljava/lang/Object;
    const/4 v11, 0x0

    .line 136
    .local v11, "$i$a$-let-ComposerKt$cache$1\\6\\135\\5":I
    sget-object v13, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v13}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v13

    if-ne v10, v13, :cond_5

    .line 137
    const/4 v13, 0x0

    .line 41
    .local v13, "$i$a$-cache-PdfPreviewScreenKt$PdfPreviewScreen$2$isSaving$2\\7\\137\\0":I
    const/16 v17, 0x0

    invoke-static/range {v17 .. v17}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-static {v6, v14, v4, v14}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateOf$default(Ljava/lang/Object;Landroidx/compose/runtime/SnapshotMutationPolicy;ILjava/lang/Object;)Landroidx/compose/runtime/MutableState;

    move-result-object v6

    .line 137
    .end local v13    # "$i$a$-cache-PdfPreviewScreenKt$PdfPreviewScreen$2$isSaving$2\\7\\137\\0":I
    nop

    .line 138
    .local v6, "value\\6":Ljava/lang/Object;
    invoke-interface {v8, v6}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 139
    move-object v10, v6

    .end local v6    # "value\\6":Ljava/lang/Object;
    goto :goto_3

    .line 140
    :cond_5
    const/16 v17, 0x0

    .line 135
    .end local v10    # "it\\5":Ljava/lang/Object;
    .end local v11    # "$i$a$-let-ComposerKt$cache$1\\6\\135\\5":I
    :goto_3
    nop

    .line 41
    .end local v3    # "invalid\\5":Z
    .end local v8    # "$this$cache\\5":Landroidx/compose/runtime/Composer;
    .end local v9    # "$i$f$cache\\5\\41":I
    move-object v3, v10

    check-cast v3, Landroidx/compose/runtime/MutableState;

    .local v3, "isSaving$delegate":Landroidx/compose/runtime/MutableState;
    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 42
    const v6, 0x784c1d70

    invoke-static {v1, v6, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v6, 0x0

    .local v6, "invalid\\8":Z
    move-object/from16 v8, p2

    .local v8, "$this$cache\\8":Landroidx/compose/runtime/Composer;
    const/4 v9, 0x0

    .line 141
    .local v9, "$i$f$cache\\8\\42":I
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v10

    .local v10, "it\\8":Ljava/lang/Object;
    const/4 v11, 0x0

    .line 142
    .local v11, "$i$a$-let-ComposerKt$cache$1\\9\\141\\8":I
    sget-object v13, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v13}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v13

    if-ne v10, v13, :cond_6

    .line 143
    const/4 v13, 0x0

    .line 42
    .local v13, "$i$a$-cache-PdfPreviewScreenKt$PdfPreviewScreen$2$saveError$2\\10\\143\\0":I
    invoke-static {v14, v14, v4, v14}, Landroidx/compose/runtime/SnapshotStateKt;->mutableStateOf$default(Ljava/lang/Object;Landroidx/compose/runtime/SnapshotMutationPolicy;ILjava/lang/Object;)Landroidx/compose/runtime/MutableState;

    move-result-object v13

    .line 143
    .end local v13    # "$i$a$-cache-PdfPreviewScreenKt$PdfPreviewScreen$2$saveError$2\\10\\143\\0":I
    nop

    .line 144
    .local v13, "value\\9":Ljava/lang/Object;
    invoke-interface {v8, v13}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 145
    move-object v10, v13

    .end local v13    # "value\\9":Ljava/lang/Object;
    goto :goto_4

    .line 146
    :cond_6
    nop

    .line 141
    .end local v10    # "it\\8":Ljava/lang/Object;
    .end local v11    # "$i$a$-let-ComposerKt$cache$1\\9\\141\\8":I
    :goto_4
    nop

    .line 42
    .end local v6    # "invalid\\8":Z
    .end local v8    # "$this$cache\\8":Landroidx/compose/runtime/Composer;
    .end local v9    # "$i$f$cache\\8\\42":I
    move-object v6, v10

    check-cast v6, Landroidx/compose/runtime/MutableState;

    .local v6, "saveError$delegate":Landroidx/compose/runtime/MutableState;
    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 43
    invoke-virtual/range {p0 .. p0}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->getAllEntries()Lkotlinx/coroutines/flow/StateFlow;

    move-result-object v8

    move/from16 v9, v17

    invoke-static {v8, v14, v1, v9, v7}, Landroidx/compose/runtime/SnapshotStateKt;->collectAsState(Lkotlinx/coroutines/flow/StateFlow;Lkotlin/coroutines/CoroutineContext;Landroidx/compose/runtime/Composer;II)Landroidx/compose/runtime/State;

    move-result-object v8

    .line 45
    .local v8, "allEntries$delegate":Landroidx/compose/runtime/State;
    sget-object v9, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    const v10, 0x784c2f01

    invoke-static {v1, v10, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v1, v12}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v10

    move-object/from16 v13, p0

    invoke-interface {v1, v13}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v11

    or-int/2addr v10, v11

    invoke-interface {v1, v8}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v11

    or-int/2addr v10, v11

    .local v10, "invalid\\11":Z
    move-object/from16 v11, p2

    .local v11, "$this$cache\\11":Landroidx/compose/runtime/Composer;
    const/16 v18, 0x0

    .line 147
    .local v18, "$i$f$cache\\11\\45":I
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v4

    .local v4, "it\\11":Ljava/lang/Object;
    const/16 v20, 0x0

    .line 148
    .local v20, "$i$a$-let-ComposerKt$cache$1\\12\\147\\11":I
    if-nez v10, :cond_8

    sget-object v16, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual/range {v16 .. v16}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v14

    if-ne v4, v14, :cond_7

    goto :goto_5

    .line 152
    :cond_7
    move/from16 v21, v2

    move-object v14, v8

    move-object v8, v11

    const/4 v2, 0x0

    goto :goto_6

    .line 149
    :cond_8
    :goto_5
    const/16 v22, 0x0

    .line 45
    .local v22, "$i$a$-cache-PdfPreviewScreenKt$PdfPreviewScreen$2$1\\13\\149\\0":I
    move-object v14, v11

    .end local v11    # "$this$cache\\11":Landroidx/compose/runtime/Composer;
    .local v14, "$this$cache\\11":Landroidx/compose/runtime/Composer;
    new-instance v11, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;

    const/16 v16, 0x0

    move-object/from16 v21, v14

    move-object v14, v8

    move-object/from16 v8, v21

    move/from16 v21, v2

    const/4 v2, 0x0

    .end local v2    # "$dirty":I
    .local v8, "$this$cache\\11":Landroidx/compose/runtime/Composer;
    .local v14, "allEntries$delegate":Landroidx/compose/runtime/State;
    .local v21, "$dirty":I
    invoke-direct/range {v11 .. v16}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;-><init>(Landroid/content/Context;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/State;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V

    check-cast v11, Lkotlin/jvm/functions/Function2;

    .line 149
    .end local v22    # "$i$a$-cache-PdfPreviewScreenKt$PdfPreviewScreen$2$1\\13\\149\\0":I
    nop

    .line 150
    .local v11, "value\\12":Ljava/lang/Object;
    invoke-interface {v8, v11}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 151
    move-object v4, v11

    .line 147
    .end local v4    # "it\\11":Ljava/lang/Object;
    .end local v11    # "value\\12":Ljava/lang/Object;
    .end local v20    # "$i$a$-let-ComposerKt$cache$1\\12\\147\\11":I
    :goto_6
    nop

    .line 45
    .end local v8    # "$this$cache\\11":Landroidx/compose/runtime/Composer;
    .end local v10    # "invalid\\11":Z
    .end local v18    # "$i$f$cache\\11\\45":I
    check-cast v4, Lkotlin/jvm/functions/Function2;

    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    const/4 v8, 0x6

    invoke-static {v9, v4, v1, v8}, Landroidx/compose/runtime/EffectsKt;->LaunchedEffect(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V

    .line 51
    sget-object v4, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v4, Landroidx/compose/ui/Modifier;

    invoke-static {v4, v0}, Landroidx/compose/foundation/layout/PaddingKt;->padding(Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/layout/PaddingValues;)Landroidx/compose/ui/Modifier;

    move-result-object v4

    const/4 v9, 0x0

    invoke-static {v4, v9, v7, v2}, Landroidx/compose/foundation/layout/SizeKt;->fillMaxSize$default(Landroidx/compose/ui/Modifier;FILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v4

    .local v4, "modifier\\14":Landroidx/compose/ui/Modifier;
    const/4 v10, 0x0

    .local v10, "$changed\\14":I
    move-object/from16 v11, p2

    .local v11, "$composer\\14":Landroidx/compose/runtime/Composer;
    const/4 v13, 0x0

    .line 153
    .local v13, "$i$f$Column\\14\\51":I
    move/from16 v16, v8

    const v8, -0x1cd0f17e

    const-string v2, "CC(Column)P(2,3,1)87@4442L61,88@4508L133:Column.kt#2w3rfo"

    invoke-static {v11, v8, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 154
    sget-object v2, Landroidx/compose/foundation/layout/Arrangement;->INSTANCE:Landroidx/compose/foundation/layout/Arrangement;

    invoke-virtual {v2}, Landroidx/compose/foundation/layout/Arrangement;->getTop()Landroidx/compose/foundation/layout/Arrangement$Vertical;

    move-result-object v2

    .line 155
    .local v2, "verticalArrangement\\14":Landroidx/compose/foundation/layout/Arrangement$Vertical;
    sget-object v8, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v8}, Landroidx/compose/ui/Alignment$Companion;->getStart()Landroidx/compose/ui/Alignment$Horizontal;

    move-result-object v8

    .line 158
    .local v8, "horizontalAlignment\\14":Landroidx/compose/ui/Alignment$Horizontal;
    shr-int/lit8 v20, v10, 0x3

    and-int/lit8 v20, v20, 0xe

    shr-int/lit8 v22, v10, 0x3

    and-int/lit8 v22, v22, 0x70

    or-int v7, v20, v22

    invoke-static {v2, v8, v11, v7}, Landroidx/compose/foundation/layout/ColumnKt;->columnMeasurePolicy(Landroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/ui/Alignment$Horizontal;Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/layout/MeasurePolicy;

    move-result-object v7

    .line 162
    .local v7, "measurePolicy\\14":Landroidx/compose/ui/layout/MeasurePolicy;
    shl-int/lit8 v20, v10, 0x3

    and-int/lit8 v20, v20, 0x70

    .line 159
    move-object/from16 v22, v4

    .local v20, "$changed\\15":I
    .local v22, "modifier\\15":Landroidx/compose/ui/Modifier;
    const/16 v24, 0x0

    .line 163
    .local v24, "$i$f$Layout\\15\\159":I
    const v9, -0x4ee9b9da

    const-string v0, "CC(Layout)P(!1,2)79@3206L23,82@3357L359:Layout.kt#80mrfh"

    invoke-static {v11, v9, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 164
    const/4 v9, 0x0

    invoke-static {v11, v9}, Landroidx/compose/runtime/ComposablesKt;->getCurrentCompositeKeyHash(Landroidx/compose/runtime/Composer;I)I

    move-result v27

    .line 165
    .local v27, "compositeKeyHash\\15":I
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->getCurrentCompositionLocalMap()Landroidx/compose/runtime/CompositionLocalMap;

    move-result-object v9

    .line 166
    .local v9, "localMap\\15":Landroidx/compose/runtime/CompositionLocalMap;
    move-object/from16 v1, v22

    move-object/from16 v22, v2

    .end local v2    # "verticalArrangement\\14":Landroidx/compose/foundation/layout/Arrangement$Vertical;
    .local v1, "modifier\\15":Landroidx/compose/ui/Modifier;
    .local v22, "verticalArrangement\\14":Landroidx/compose/foundation/layout/Arrangement$Vertical;
    invoke-static {v11, v1}, Landroidx/compose/ui/ComposedModifierKt;->materializeModifier(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v2

    .line 168
    .local v2, "materialized\\15":Landroidx/compose/ui/Modifier;
    sget-object v28, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual/range {v28 .. v28}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getConstructor()Lkotlin/jvm/functions/Function0;

    move-result-object v28

    move-object/from16 v29, v1

    .end local v1    # "modifier\\15":Landroidx/compose/ui/Modifier;
    .local v29, "modifier\\15":Landroidx/compose/ui/Modifier;
    shl-int/lit8 v1, v20, 0x6

    and-int/lit16 v1, v1, 0x380

    or-int/lit8 v1, v1, 0x6

    .line 167
    nop

    .local v1, "$changed\\16":I
    move-object/from16 v30, v28

    .local v30, "factory\\16":Lkotlin/jvm/functions/Function0;
    const/16 v28, 0x0

    .line 169
    .local v28, "$i$f$ReusableComposeNode\\16\\167":I
    move/from16 v31, v1

    .end local v1    # "$changed\\16":I
    .local v31, "$changed\\16":I
    const v1, -0x2942ffcf

    move-object/from16 v32, v4

    .end local v4    # "modifier\\14":Landroidx/compose/ui/Modifier;
    .local v32, "modifier\\14":Landroidx/compose/ui/Modifier;
    const-string v4, "CC(ReusableComposeNode)P(1,2)355@14017L9:Composables.kt#9igjgp"

    invoke-static {v11, v1, v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 170
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->getApplier()Landroidx/compose/runtime/Applier;

    move-result-object v1

    instance-of v1, v1, Landroidx/compose/runtime/Applier;

    if-nez v1, :cond_9

    invoke-static {}, Landroidx/compose/runtime/ComposablesKt;->invalidApplier()V

    .line 171
    :cond_9
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->startReusableNode()V

    .line 172
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 173
    move-object/from16 v1, v30

    .end local v30    # "factory\\16":Lkotlin/jvm/functions/Function0;
    .local v1, "factory\\16":Lkotlin/jvm/functions/Function0;
    invoke-interface {v11, v1}, Landroidx/compose/runtime/Composer;->createNode(Lkotlin/jvm/functions/Function0;)V

    goto :goto_7

    .line 175
    .end local v1    # "factory\\16":Lkotlin/jvm/functions/Function0;
    .restart local v30    # "factory\\16":Lkotlin/jvm/functions/Function0;
    :cond_a
    move-object/from16 v1, v30

    .end local v30    # "factory\\16":Lkotlin/jvm/functions/Function0;
    .restart local v1    # "factory\\16":Lkotlin/jvm/functions/Function0;
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->useNode()V

    .line 177
    :goto_7
    move-object/from16 v30, v1

    .end local v1    # "factory\\16":Lkotlin/jvm/functions/Function0;
    .restart local v30    # "factory\\16":Lkotlin/jvm/functions/Function0;
    invoke-static {v11}, Landroidx/compose/runtime/Updater;->constructor-impl(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/Composer;

    move-result-object v1

    .local v1, "$this$Layout_u24lambda_u240\\17":Landroidx/compose/runtime/Composer;
    const/16 v34, 0x0

    .line 178
    .local v34, "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\17\\177\\15":I
    sget-object v35, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    move-object/from16 v36, v8

    .end local v8    # "horizontalAlignment\\14":Landroidx/compose/ui/Alignment$Horizontal;
    .local v36, "horizontalAlignment\\14":Landroidx/compose/ui/Alignment$Horizontal;
    invoke-virtual/range {v35 .. v35}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetMeasurePolicy()Lkotlin/jvm/functions/Function2;

    move-result-object v8

    invoke-static {v1, v7, v8}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 179
    sget-object v8, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v8}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetResolvedCompositionLocals()Lkotlin/jvm/functions/Function2;

    move-result-object v8

    invoke-static {v1, v9, v8}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 180
    sget-object v8, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v8}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetCompositeKeyHash()Lkotlin/jvm/functions/Function2;

    move-result-object v8

    .local v8, "block\\18":Lkotlin/jvm/functions/Function2;
    const/16 v35, 0x0

    .line 181
    .local v35, "$i$f$set-impl\\18\\180":I
    move-object/from16 v37, v1

    .local v37, "$this$set_impl_u24lambda_u240\\18":Landroidx/compose/runtime/Composer;
    const/16 v38, 0x0

    .line 182
    .local v38, "$i$a$-with-Updater$set$1\\19\\181\\18":I
    invoke-interface/range {v37 .. v37}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v39

    if-nez v39, :cond_c

    move-object/from16 v39, v7

    .end local v7    # "measurePolicy\\14":Landroidx/compose/ui/layout/MeasurePolicy;
    .local v39, "measurePolicy\\14":Landroidx/compose/ui/layout/MeasurePolicy;
    invoke-interface/range {v37 .. v37}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v7

    move-object/from16 v40, v9

    .end local v9    # "localMap\\15":Landroidx/compose/runtime/CompositionLocalMap;
    .local v40, "localMap\\15":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v7, v9}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_b

    goto :goto_8

    :cond_b
    move-object/from16 v9, v37

    goto :goto_9

    .end local v39    # "measurePolicy\\14":Landroidx/compose/ui/layout/MeasurePolicy;
    .end local v40    # "localMap\\15":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v7    # "measurePolicy\\14":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v9    # "localMap\\15":Landroidx/compose/runtime/CompositionLocalMap;
    :cond_c
    move-object/from16 v39, v7

    move-object/from16 v40, v9

    .line 183
    .end local v7    # "measurePolicy\\14":Landroidx/compose/ui/layout/MeasurePolicy;
    .end local v9    # "localMap\\15":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v39    # "measurePolicy\\14":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v40    # "localMap\\15":Landroidx/compose/runtime/CompositionLocalMap;
    :goto_8
    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move-object/from16 v9, v37

    .end local v37    # "$this$set_impl_u24lambda_u240\\18":Landroidx/compose/runtime/Composer;
    .local v9, "$this$set_impl_u24lambda_u240\\18":Landroidx/compose/runtime/Composer;
    invoke-interface {v9, v7}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 184
    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v1, v7, v8}, Landroidx/compose/runtime/Composer;->apply(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 186
    :goto_9
    nop

    .line 181
    .end local v9    # "$this$set_impl_u24lambda_u240\\18":Landroidx/compose/runtime/Composer;
    .end local v38    # "$i$a$-with-Updater$set$1\\19\\181\\18":I
    nop

    .line 186
    nop

    .line 187
    .end local v8    # "block\\18":Lkotlin/jvm/functions/Function2;
    .end local v35    # "$i$f$set-impl\\18\\180":I
    sget-object v7, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v7}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetModifier()Lkotlin/jvm/functions/Function2;

    move-result-object v7

    invoke-static {v1, v2, v7}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 188
    nop

    .line 177
    .end local v1    # "$this$Layout_u24lambda_u240\\17":Landroidx/compose/runtime/Composer;
    .end local v34    # "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\17\\177\\15":I
    nop

    .line 189
    shr-int/lit8 v1, v31, 0x6

    and-int/lit8 v1, v1, 0xe

    .local v1, "$changed\\20":I
    move-object v7, v11

    .local v7, "$composer\\20":Landroidx/compose/runtime/Composer;
    const/4 v8, 0x0

    .line 160
    .local v8, "$i$a$-Layout-ColumnKt$Column$1\\20\\189\\14":I
    const v9, -0x16eda499

    move/from16 v34, v1

    .end local v1    # "$changed\\20":I
    .local v34, "$changed\\20":I
    const-string v1, "C89@4556L9:Column.kt#2w3rfo"

    invoke-static {v7, v9, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v1, Landroidx/compose/foundation/layout/ColumnScopeInstance;->INSTANCE:Landroidx/compose/foundation/layout/ColumnScopeInstance;

    shr-int/lit8 v9, v10, 0x6

    and-int/lit8 v9, v9, 0x70

    or-int/lit8 v9, v9, 0x6

    .local v9, "$changed\\21":I
    move-object/from16 v41, v1

    check-cast v41, Landroidx/compose/foundation/layout/ColumnScope;

    .local v41, "$this$PdfPreviewScreen_u24lambda_u2423_u24lambda_u2422\\21":Landroidx/compose/foundation/layout/ColumnScope;
    move-object v1, v7

    .local v1, "$composer\\21":Landroidx/compose/runtime/Composer;
    const/16 v35, 0x0

    .line 52
    .local v35, "$i$a$-Column-PdfPreviewScreenKt$PdfPreviewScreen$2$2\\21\\160\\0":I
    move-object/from16 v37, v2

    .end local v2    # "materialized\\15":Landroidx/compose/ui/Modifier;
    .local v37, "materialized\\15":Landroidx/compose/ui/Modifier;
    const v2, -0x6acef1cb

    move-object/from16 v38, v7

    .end local v7    # "$composer\\20":Landroidx/compose/runtime/Composer;
    .local v38, "$composer\\20":Landroidx/compose/runtime/Composer;
    const-string v7, "C:PdfPreviewScreen.kt#4cebsy"

    invoke-static {v1, v2, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-static {v15}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->PdfPreviewScreen$lambda$23$lambda$5(Landroidx/compose/runtime/MutableState;)Ljava/io/File;

    move-result-object v2

    if-nez v2, :cond_11

    const v2, -0x6acf6e29

    invoke-interface {v1, v2}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v2, "52@1927L143"

    invoke-static {v1, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 53
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    move/from16 v67, v8

    const/4 v5, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    .end local v8    # "$i$a$-Layout-ColumnKt$Column$1\\20\\189\\14":I
    .local v67, "$i$a$-Layout-ColumnKt$Column$1\\20\\189\\14":I
    invoke-static {v2, v5, v7, v8}, Landroidx/compose/foundation/layout/SizeKt;->fillMaxSize$default(Landroidx/compose/ui/Modifier;FILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v2

    .local v2, "modifier\\22":Landroidx/compose/ui/Modifier;
    sget-object v5, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v5}, Landroidx/compose/ui/Alignment$Companion;->getCenter()Landroidx/compose/ui/Alignment;

    move-result-object v5

    .local v5, "contentAlignment\\22":Landroidx/compose/ui/Alignment;
    const/16 v7, 0x36

    .local v7, "$changed\\22":I
    move-object v8, v1

    .local v8, "$composer\\22":Landroidx/compose/runtime/Composer;
    const/16 v18, 0x0

    .line 190
    .local v18, "$i$f$Box\\22\\53":I
    move-object/from16 v19, v2

    .end local v2    # "modifier\\22":Landroidx/compose/ui/Modifier;
    .local v19, "modifier\\22":Landroidx/compose/ui/Modifier;
    const v2, 0x2bb5b5d7

    move/from16 v23, v7

    .end local v7    # "$changed\\22":I
    .local v23, "$changed\\22":I
    const-string v7, "CC(Box)P(2,1,3)71@3423L130:Box.kt#2w3rfo"

    invoke-static {v8, v2, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 191
    const/4 v2, 0x0

    .line 194
    .local v2, "propagateMinConstraints\\22":Z
    invoke-static {v5, v2}, Landroidx/compose/foundation/layout/BoxKt;->maybeCachedBoxMeasurePolicy(Landroidx/compose/ui/Alignment;Z)Landroidx/compose/ui/layout/MeasurePolicy;

    move-result-object v7

    .line 198
    .local v7, "measurePolicy\\22":Landroidx/compose/ui/layout/MeasurePolicy;
    shl-int/lit8 v25, v23, 0x3

    and-int/lit8 v25, v25, 0x70

    .line 195
    nop

    .local v25, "$changed\\23":I
    move-object/from16 v42, v19

    .local v42, "modifier\\23":Landroidx/compose/ui/Modifier;
    const/16 v43, 0x0

    .line 199
    .local v43, "$i$f$Layout\\23\\195":I
    move/from16 v44, v2

    const v2, -0x4ee9b9da

    .end local v2    # "propagateMinConstraints\\22":Z
    .local v44, "propagateMinConstraints\\22":Z
    invoke-static {v8, v2, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 200
    const/4 v0, 0x0

    invoke-static {v8, v0}, Landroidx/compose/runtime/ComposablesKt;->getCurrentCompositeKeyHash(Landroidx/compose/runtime/Composer;I)I

    move-result v0

    .line 201
    .local v0, "compositeKeyHash\\23":I
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->getCurrentCompositionLocalMap()Landroidx/compose/runtime/CompositionLocalMap;

    move-result-object v2

    .line 202
    .local v2, "localMap\\23":Landroidx/compose/runtime/CompositionLocalMap;
    move/from16 v17, v0

    move-object/from16 v26, v5

    move-object/from16 v0, v42

    .end local v5    # "contentAlignment\\22":Landroidx/compose/ui/Alignment;
    .end local v42    # "modifier\\23":Landroidx/compose/ui/Modifier;
    .local v0, "modifier\\23":Landroidx/compose/ui/Modifier;
    .local v17, "compositeKeyHash\\23":I
    .local v26, "contentAlignment\\22":Landroidx/compose/ui/Alignment;
    invoke-static {v8, v0}, Landroidx/compose/ui/ComposedModifierKt;->materializeModifier(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v5

    .line 204
    .local v5, "materialized\\23":Landroidx/compose/ui/Modifier;
    sget-object v42, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual/range {v42 .. v42}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getConstructor()Lkotlin/jvm/functions/Function0;

    move-result-object v42

    move-object/from16 v45, v0

    .end local v0    # "modifier\\23":Landroidx/compose/ui/Modifier;
    .local v45, "modifier\\23":Landroidx/compose/ui/Modifier;
    shl-int/lit8 v0, v25, 0x6

    and-int/lit16 v0, v0, 0x380

    or-int/lit8 v0, v0, 0x6

    .line 203
    nop

    .local v0, "$changed\\24":I
    move-object/from16 v46, v42

    .local v46, "factory\\24":Lkotlin/jvm/functions/Function0;
    const/16 v42, 0x0

    .line 205
    .local v42, "$i$f$ReusableComposeNode\\24\\203":I
    move/from16 v47, v0

    const v0, -0x2942ffcf

    .end local v0    # "$changed\\24":I
    .local v47, "$changed\\24":I
    invoke-static {v8, v0, v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 206
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->getApplier()Landroidx/compose/runtime/Applier;

    move-result-object v0

    instance-of v0, v0, Landroidx/compose/runtime/Applier;

    if-nez v0, :cond_d

    invoke-static {}, Landroidx/compose/runtime/ComposablesKt;->invalidApplier()V

    .line 207
    :cond_d
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->startReusableNode()V

    .line 208
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 209
    move-object/from16 v0, v46

    .end local v46    # "factory\\24":Lkotlin/jvm/functions/Function0;
    .local v0, "factory\\24":Lkotlin/jvm/functions/Function0;
    invoke-interface {v8, v0}, Landroidx/compose/runtime/Composer;->createNode(Lkotlin/jvm/functions/Function0;)V

    goto :goto_a

    .line 211
    .end local v0    # "factory\\24":Lkotlin/jvm/functions/Function0;
    .restart local v46    # "factory\\24":Lkotlin/jvm/functions/Function0;
    :cond_e
    move-object/from16 v0, v46

    .end local v46    # "factory\\24":Lkotlin/jvm/functions/Function0;
    .restart local v0    # "factory\\24":Lkotlin/jvm/functions/Function0;
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->useNode()V

    .line 213
    :goto_a
    invoke-static {v8}, Landroidx/compose/runtime/Updater;->constructor-impl(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/Composer;

    move-result-object v4

    .local v4, "$this$Layout_u24lambda_u240\\25":Landroidx/compose/runtime/Composer;
    const/16 v33, 0x0

    .line 214
    .local v33, "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\25\\213\\23":I
    sget-object v46, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    move-object/from16 v48, v0

    .end local v0    # "factory\\24":Lkotlin/jvm/functions/Function0;
    .local v48, "factory\\24":Lkotlin/jvm/functions/Function0;
    invoke-virtual/range {v46 .. v46}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetMeasurePolicy()Lkotlin/jvm/functions/Function2;

    move-result-object v0

    invoke-static {v4, v7, v0}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 215
    sget-object v0, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetResolvedCompositionLocals()Lkotlin/jvm/functions/Function2;

    move-result-object v0

    invoke-static {v4, v2, v0}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 216
    sget-object v0, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetCompositeKeyHash()Lkotlin/jvm/functions/Function2;

    move-result-object v0

    .local v0, "block\\26":Lkotlin/jvm/functions/Function2;
    const/16 v46, 0x0

    .line 217
    .local v46, "$i$f$set-impl\\26\\216":I
    move-object/from16 v49, v4

    .local v49, "$this$set_impl_u24lambda_u240\\26":Landroidx/compose/runtime/Composer;
    const/16 v50, 0x0

    .line 218
    .local v50, "$i$a$-with-Updater$set$1\\27\\217\\26":I
    invoke-interface/range {v49 .. v49}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v51

    if-nez v51, :cond_10

    move-object/from16 v51, v2

    .end local v2    # "localMap\\23":Landroidx/compose/runtime/CompositionLocalMap;
    .local v51, "localMap\\23":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-interface/range {v49 .. v49}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v52, v7

    .end local v7    # "measurePolicy\\22":Landroidx/compose/ui/layout/MeasurePolicy;
    .local v52, "measurePolicy\\22":Landroidx/compose/ui/layout/MeasurePolicy;
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v2, v7}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_f

    goto :goto_b

    :cond_f
    move-object/from16 v7, v49

    goto :goto_c

    .end local v51    # "localMap\\23":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v52    # "measurePolicy\\22":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v2    # "localMap\\23":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v7    # "measurePolicy\\22":Landroidx/compose/ui/layout/MeasurePolicy;
    :cond_10
    move-object/from16 v51, v2

    move-object/from16 v52, v7

    .line 219
    .end local v2    # "localMap\\23":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v7    # "measurePolicy\\22":Landroidx/compose/ui/layout/MeasurePolicy;
    .restart local v51    # "localMap\\23":Landroidx/compose/runtime/CompositionLocalMap;
    .restart local v52    # "measurePolicy\\22":Landroidx/compose/ui/layout/MeasurePolicy;
    :goto_b
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v7, v49

    .end local v49    # "$this$set_impl_u24lambda_u240\\26":Landroidx/compose/runtime/Composer;
    .local v7, "$this$set_impl_u24lambda_u240\\26":Landroidx/compose/runtime/Composer;
    invoke-interface {v7, v2}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 220
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v4, v2, v0}, Landroidx/compose/runtime/Composer;->apply(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 222
    :goto_c
    nop

    .line 217
    .end local v7    # "$this$set_impl_u24lambda_u240\\26":Landroidx/compose/runtime/Composer;
    .end local v50    # "$i$a$-with-Updater$set$1\\27\\217\\26":I
    nop

    .line 222
    nop

    .line 223
    .end local v0    # "block\\26":Lkotlin/jvm/functions/Function2;
    .end local v46    # "$i$f$set-impl\\26\\216":I
    sget-object v0, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v0}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetModifier()Lkotlin/jvm/functions/Function2;

    move-result-object v0

    invoke-static {v4, v5, v0}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 224
    nop

    .line 213
    .end local v4    # "$this$Layout_u24lambda_u240\\25":Landroidx/compose/runtime/Composer;
    .end local v33    # "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\25\\213\\23":I
    nop

    .line 225
    shr-int/lit8 v0, v47, 0x6

    and-int/lit8 v0, v0, 0xe

    .local v0, "$changed\\28":I
    move-object v2, v8

    .local v2, "$composer\\28":Landroidx/compose/runtime/Composer;
    const/4 v4, 0x0

    .line 196
    .local v4, "$i$a$-Layout-BoxKt$Box$1\\28\\225\\22":I
    const v7, -0x7ff482d7

    move/from16 v33, v0

    .end local v0    # "$changed\\28":I
    .local v33, "$changed\\28":I
    const-string v0, "C72@3468L9:Box.kt#2w3rfo"

    invoke-static {v2, v7, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v0, Landroidx/compose/foundation/layout/BoxScopeInstance;->INSTANCE:Landroidx/compose/foundation/layout/BoxScopeInstance;

    shr-int/lit8 v7, v23, 0x6

    and-int/lit8 v7, v7, 0x70

    or-int/lit8 v7, v7, 0x6

    .local v7, "$changed\\29":I
    check-cast v0, Landroidx/compose/foundation/layout/BoxScope;

    .local v0, "$this$PdfPreviewScreen_u24lambda_u2423_u24lambda_u2422_u24lambda_u2415\\29":Landroidx/compose/foundation/layout/BoxScope;
    move-object/from16 v60, v2

    .local v60, "$composer\\29":Landroidx/compose/runtime/Composer;
    const/16 v16, 0x0

    .line 54
    .local v16, "$i$a$-Box-PdfPreviewScreenKt$PdfPreviewScreen$2$2$1\\29\\196\\21":I
    move-object/from16 v46, v0

    .end local v0    # "$this$PdfPreviewScreen_u24lambda_u2423_u24lambda_u2422_u24lambda_u2415\\29":Landroidx/compose/foundation/layout/BoxScope;
    .local v46, "$this$PdfPreviewScreen_u24lambda_u2423_u24lambda_u2422_u24lambda_u2415\\29":Landroidx/compose/foundation/layout/BoxScope;
    const v0, -0x64245135

    move-object/from16 v49, v2

    .end local v2    # "$composer\\28":Landroidx/compose/runtime/Composer;
    .local v49, "$composer\\28":Landroidx/compose/runtime/Composer;
    const-string v2, "C53@2025L27:PdfPreviewScreen.kt#4cebsy"

    move/from16 v50, v4

    move-object/from16 v4, v60

    .end local v60    # "$composer\\29":Landroidx/compose/runtime/Composer;
    .local v4, "$composer\\29":Landroidx/compose/runtime/Composer;
    .local v50, "$i$a$-Layout-BoxKt$Box$1\\28\\225\\22":I
    invoke-static {v4, v0, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/16 v61, 0x0

    const/16 v62, 0x1f

    const/16 v53, 0x0

    const-wide/16 v54, 0x0

    const/16 v56, 0x0

    const-wide/16 v57, 0x0

    const/16 v59, 0x0

    .end local v4    # "$composer\\29":Landroidx/compose/runtime/Composer;
    .restart local v60    # "$composer\\29":Landroidx/compose/runtime/Composer;
    invoke-static/range {v53 .. v62}, Landroidx/compose/material3/ProgressIndicatorKt;->CircularProgressIndicator-LxG7B9w(Landroidx/compose/ui/Modifier;JFJILandroidx/compose/runtime/Composer;II)V

    invoke-static/range {v60 .. v60}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 55
    nop

    .line 196
    .end local v7    # "$changed\\29":I
    .end local v16    # "$i$a$-Box-PdfPreviewScreenKt$PdfPreviewScreen$2$2$1\\29\\196\\21":I
    .end local v46    # "$this$PdfPreviewScreen_u24lambda_u2423_u24lambda_u2422_u24lambda_u2415\\29":Landroidx/compose/foundation/layout/BoxScope;
    .end local v60    # "$composer\\29":Landroidx/compose/runtime/Composer;
    invoke-static/range {v49 .. v49}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 225
    .end local v33    # "$changed\\28":I
    .end local v49    # "$composer\\28":Landroidx/compose/runtime/Composer;
    .end local v50    # "$i$a$-Layout-BoxKt$Box$1\\28\\225\\22":I
    nop

    .line 226
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->endNode()V

    .line 205
    invoke-static {v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 227
    nop

    .line 199
    .end local v42    # "$i$f$ReusableComposeNode\\24\\203":I
    .end local v47    # "$changed\\24":I
    .end local v48    # "factory\\24":Lkotlin/jvm/functions/Function0;
    invoke-static {v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 228
    nop

    .line 190
    .end local v5    # "materialized\\23":Landroidx/compose/ui/Modifier;
    .end local v17    # "compositeKeyHash\\23":I
    .end local v25    # "$changed\\23":I
    .end local v43    # "$i$f$Layout\\23\\195":I
    .end local v45    # "modifier\\23":Landroidx/compose/ui/Modifier;
    .end local v51    # "localMap\\23":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-static {v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 229
    nop

    .line 52
    .end local v8    # "$composer\\22":Landroidx/compose/runtime/Composer;
    .end local v18    # "$i$f$Box\\22\\53":I
    .end local v19    # "modifier\\22":Landroidx/compose/ui/Modifier;
    .end local v23    # "$changed\\22":I
    .end local v26    # "contentAlignment\\22":Landroidx/compose/ui/Alignment;
    .end local v44    # "propagateMinConstraints\\22":Z
    .end local v52    # "measurePolicy\\22":Landroidx/compose/ui/layout/MeasurePolicy;
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    move-object v7, v1

    goto/16 :goto_11

    .line 56
    .end local v67    # "$i$a$-Layout-ColumnKt$Column$1\\20\\189\\14":I
    .local v8, "$i$a$-Layout-ColumnKt$Column$1\\20\\189\\14":I
    :cond_11
    move/from16 v67, v8

    .end local v8    # "$i$a$-Layout-ColumnKt$Column$1\\20\\189\\14":I
    .restart local v67    # "$i$a$-Layout-ColumnKt$Column$1\\20\\189\\14":I
    const v0, -0x6acbfb82

    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v0, "57@2151L161,56@2108L274,64@2399L41,66@2495L697,83@3386L87,65@2457L1016"

    invoke-static {v1, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 58
    const v0, -0x4dc48243

    invoke-static {v1, v0, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v0, 0x0

    .local v0, "invalid\\30":Z
    move-object v2, v1

    .local v2, "$this$cache\\30":Landroidx/compose/runtime/Composer;
    const/4 v4, 0x0

    .line 230
    .local v4, "$i$f$cache\\30\\58":I
    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v7

    .local v7, "it\\30":Ljava/lang/Object;
    const/4 v8, 0x0

    .line 231
    .local v8, "$i$a$-let-ComposerKt$cache$1\\31\\230\\30":I
    sget-object v17, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move/from16 v26, v0

    .end local v0    # "invalid\\30":Z
    .local v26, "invalid\\30":Z
    invoke-virtual/range {v17 .. v17}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v0

    if-ne v7, v0, :cond_12

    .line 232
    const/4 v0, 0x0

    .line 58
    .local v0, "$i$a$-cache-PdfPreviewScreenKt$PdfPreviewScreen$2$2$2\\32\\232\\21":I
    move/from16 v17, v0

    .end local v0    # "$i$a$-cache-PdfPreviewScreenKt$PdfPreviewScreen$2$2$2\\32\\232\\21":I
    .local v17, "$i$a$-cache-PdfPreviewScreenKt$PdfPreviewScreen$2$2$2\\32\\232\\21":I
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$$ExternalSyntheticLambda1;

    invoke-direct {v0, v15}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$$ExternalSyntheticLambda1;-><init>(Landroidx/compose/runtime/MutableState;)V

    .line 232
    .end local v17    # "$i$a$-cache-PdfPreviewScreenKt$PdfPreviewScreen$2$2$2\\32\\232\\21":I
    nop

    .line 233
    .local v0, "value\\31":Ljava/lang/Object;
    invoke-interface {v2, v0}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 234
    move-object v7, v0

    .end local v0    # "value\\31":Ljava/lang/Object;
    goto :goto_d

    .line 235
    :cond_12
    nop

    .line 230
    .end local v7    # "it\\30":Ljava/lang/Object;
    .end local v8    # "$i$a$-let-ComposerKt$cache$1\\31\\230\\30":I
    :goto_d
    nop

    .line 58
    .end local v2    # "$this$cache\\30":Landroidx/compose/runtime/Composer;
    .end local v4    # "$i$f$cache\\30\\58":I
    .end local v26    # "invalid\\30":Z
    check-cast v7, Lkotlin/jvm/functions/Function1;

    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 63
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    move-object/from16 v42, v0

    check-cast v42, Landroidx/compose/ui/Modifier;

    const/16 v45, 0x2

    const/16 v46, 0x0

    const/high16 v43, 0x3f800000    # 1.0f

    const/16 v44, 0x0

    invoke-static/range {v41 .. v46}, Landroidx/compose/foundation/layout/ColumnScope;->weight$default(Landroidx/compose/foundation/layout/ColumnScope;Landroidx/compose/ui/Modifier;FZILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v43

    .line 57
    const/16 v44, 0x0

    const/16 v46, 0x6

    const/16 v47, 0x4

    move-object/from16 v45, v1

    move-object/from16 v42, v7

    .end local v1    # "$composer\\21":Landroidx/compose/runtime/Composer;
    .local v45, "$composer\\21":Landroidx/compose/runtime/Composer;
    invoke-static/range {v42 .. v47}, Landroidx/compose/ui/viewinterop/AndroidView_androidKt;->AndroidView(Lkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V

    .line 65
    move-object/from16 v7, v45

    .end local v45    # "$composer\\21":Landroidx/compose/runtime/Composer;
    .local v7, "$composer\\21":Landroidx/compose/runtime/Composer;
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v0, Landroidx/compose/ui/Modifier;

    const/16 v1, 0x10

    .local v1, "$this$dp\\33":I
    const/4 v2, 0x0

    .line 236
    .local v2, "$i$f$getDp\\33\\65":I
    int-to-float v4, v1

    invoke-static {v4}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v1

    .line 65
    .end local v1    # "$this$dp\\33":I
    .end local v2    # "$i$f$getDp\\33\\65":I
    invoke-static {v0, v1}, Landroidx/compose/foundation/layout/SizeKt;->height-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v0

    move/from16 v1, v16

    invoke-static {v0, v7, v1}, Landroidx/compose/foundation/layout/SpacerKt;->Spacer(Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;I)V

    .line 67
    const v0, -0x4dc4552b

    invoke-static {v7, v0, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v7, v12}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v0

    .local v0, "invalid\\34":Z
    move-object v1, v7

    .local v1, "$this$cache\\34":Landroidx/compose/runtime/Composer;
    const/4 v2, 0x0

    .line 237
    .local v2, "$i$f$cache\\34\\67":I
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v4

    .local v4, "it\\34":Ljava/lang/Object;
    const/4 v5, 0x0

    .line 238
    .local v5, "$i$a$-let-ComposerKt$cache$1\\35\\237\\34":I
    if-nez v0, :cond_14

    sget-object v8, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v8}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v8

    if-ne v4, v8, :cond_13

    goto :goto_e

    .line 242
    :cond_13
    move/from16 v16, v0

    goto :goto_f

    .line 239
    :cond_14
    :goto_e
    const/4 v8, 0x0

    .line 67
    .local v8, "$i$a$-cache-PdfPreviewScreenKt$PdfPreviewScreen$2$2$3\\36\\239\\21":I
    move/from16 v16, v0

    .end local v0    # "invalid\\34":Z
    .local v16, "invalid\\34":Z
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$$ExternalSyntheticLambda2;

    invoke-direct {v0, v12, v3, v6, v15}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$$ExternalSyntheticLambda2;-><init>(Landroid/content/Context;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;)V

    .line 239
    .end local v8    # "$i$a$-cache-PdfPreviewScreenKt$PdfPreviewScreen$2$2$3\\36\\239\\21":I
    nop

    .line 240
    .local v0, "value\\35":Ljava/lang/Object;
    invoke-interface {v1, v0}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 241
    move-object v4, v0

    .line 237
    .end local v0    # "value\\35":Ljava/lang/Object;
    .end local v4    # "it\\34":Ljava/lang/Object;
    .end local v5    # "$i$a$-let-ComposerKt$cache$1\\35\\237\\34":I
    :goto_f
    nop

    .line 67
    .end local v1    # "$this$cache\\34":Landroidx/compose/runtime/Composer;
    .end local v2    # "$i$f$cache\\34\\67":I
    .end local v16    # "invalid\\34":Z
    move-object/from16 v42, v4

    check-cast v42, Lkotlin/jvm/functions/Function0;

    invoke-static {v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 80
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v0, Landroidx/compose/ui/Modifier;

    .line 81
    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v5, 0x0

    invoke-static {v0, v5, v1, v2}, Landroidx/compose/foundation/layout/SizeKt;->fillMaxWidth$default(Landroidx/compose/ui/Modifier;FILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v0

    .line 82
    const/16 v1, 0x10

    .local v1, "$this$dp\\37":I
    const/4 v4, 0x0

    .line 243
    .local v4, "$i$f$getDp\\37\\82":I
    int-to-float v8, v1

    invoke-static {v8}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v1

    .line 82
    .end local v1    # "$this$dp\\37":I
    .end local v4    # "$i$f$getDp\\37\\82":I
    const/4 v4, 0x2

    invoke-static {v0, v1, v5, v4, v2}, Landroidx/compose/foundation/layout/PaddingKt;->padding-VpY3zN4$default(Landroidx/compose/ui/Modifier;FFILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v43

    .line 83
    invoke-static {v3}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->PdfPreviewScreen$lambda$23$lambda$8(Landroidx/compose/runtime/MutableState;)Z

    move-result v0

    const/4 v1, 0x1

    xor-int/lit8 v44, v0, 0x1

    .line 84
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$$ExternalSyntheticLambda3;

    invoke-direct {v0, v3}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$$ExternalSyntheticLambda3;-><init>(Landroidx/compose/runtime/MutableState;)V

    const/16 v2, 0x36

    const v4, -0x40c074f0

    invoke-static {v4, v1, v0, v7, v2}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    move-object/from16 v51, v0

    check-cast v51, Lkotlin/jvm/functions/Function3;

    .line 66
    const/16 v45, 0x0

    const/16 v46, 0x0

    const/16 v47, 0x0

    const/16 v48, 0x0

    const/16 v49, 0x0

    const/16 v50, 0x0

    const v53, 0x30000030

    const/16 v54, 0x1f8

    move-object/from16 v52, v7

    .end local v7    # "$composer\\21":Landroidx/compose/runtime/Composer;
    .local v52, "$composer\\21":Landroidx/compose/runtime/Composer;
    invoke-static/range {v42 .. v54}, Landroidx/compose/material3/ButtonKt;->Button(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/ui/graphics/Shape;Landroidx/compose/material3/ButtonColors;Landroidx/compose/material3/ButtonElevation;Landroidx/compose/foundation/BorderStroke;Landroidx/compose/foundation/layout/PaddingValues;Landroidx/compose/foundation/interaction/MutableInteractionSource;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V

    .line 87
    .end local v52    # "$composer\\21":Landroidx/compose/runtime/Composer;
    .restart local v7    # "$composer\\21":Landroidx/compose/runtime/Composer;
    invoke-static {v6}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->PdfPreviewScreen$lambda$23$lambda$11(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_15

    const v0, -0x6ab71f65

    invoke-interface {v7, v0}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v0, "89@3631L11,87@3535L195"

    invoke-static {v7, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 89
    invoke-static {v6}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->PdfPreviewScreen$lambda$23$lambda$11(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v42

    invoke-static/range {v42 .. v42}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 90
    sget-object v0, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v1, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v0, v7, v1}, Landroidx/compose/material3/MaterialTheme;->getColorScheme(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/ColorScheme;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/compose/material3/ColorScheme;->getError-0d7_KjU()J

    move-result-wide v44

    .line 91
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v0, Landroidx/compose/ui/Modifier;

    const/16 v1, 0x10

    .local v1, "$this$dp\\38":I
    const/4 v2, 0x0

    .line 244
    .local v2, "$i$f$getDp\\38\\91":I
    int-to-float v4, v1

    invoke-static {v4}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v1

    .line 91
    .end local v1    # "$this$dp\\38":I
    .end local v2    # "$i$f$getDp\\38\\91":I
    invoke-static {v0, v1}, Landroidx/compose/foundation/layout/PaddingKt;->padding-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v43

    .line 89
    nop

    .line 91
    nop

    .line 90
    nop

    .line 88
    const-wide/16 v46, 0x0

    const/16 v48, 0x0

    const/16 v49, 0x0

    const/16 v50, 0x0

    const-wide/16 v51, 0x0

    const/16 v53, 0x0

    const/16 v54, 0x0

    const-wide/16 v55, 0x0

    const/16 v57, 0x0

    const/16 v58, 0x0

    const/16 v59, 0x0

    const/16 v60, 0x0

    const/16 v61, 0x0

    const/16 v62, 0x0

    const/16 v64, 0x30

    const/16 v65, 0x0

    const v66, 0x1fff8

    move-object/from16 v63, v7

    .end local v7    # "$composer\\21":Landroidx/compose/runtime/Composer;
    .local v63, "$composer\\21":Landroidx/compose/runtime/Composer;
    invoke-static/range {v42 .. v66}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    .line 87
    .end local v63    # "$composer\\21":Landroidx/compose/runtime/Composer;
    .restart local v7    # "$composer\\21":Landroidx/compose/runtime/Composer;
    goto :goto_10

    :cond_15
    const v0, -0x6aec6c9a

    invoke-interface {v7, v0}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    :goto_10
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 56
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 52
    :goto_11
    invoke-static {v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 95
    nop

    .line 160
    .end local v7    # "$composer\\21":Landroidx/compose/runtime/Composer;
    .end local v9    # "$changed\\21":I
    .end local v35    # "$i$a$-Column-PdfPreviewScreenKt$PdfPreviewScreen$2$2\\21\\160\\0":I
    .end local v41    # "$this$PdfPreviewScreen_u24lambda_u2423_u24lambda_u2422\\21":Landroidx/compose/foundation/layout/ColumnScope;
    invoke-static/range {v38 .. v38}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 189
    .end local v34    # "$changed\\20":I
    .end local v38    # "$composer\\20":Landroidx/compose/runtime/Composer;
    .end local v67    # "$i$a$-Layout-ColumnKt$Column$1\\20\\189\\14":I
    nop

    .line 245
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->endNode()V

    .line 169
    invoke-static {v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 246
    nop

    .line 163
    .end local v28    # "$i$f$ReusableComposeNode\\16\\167":I
    .end local v30    # "factory\\16":Lkotlin/jvm/functions/Function0;
    .end local v31    # "$changed\\16":I
    invoke-static {v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 247
    nop

    .line 153
    .end local v20    # "$changed\\15":I
    .end local v24    # "$i$f$Layout\\15\\159":I
    .end local v27    # "compositeKeyHash\\15":I
    .end local v29    # "modifier\\15":Landroidx/compose/ui/Modifier;
    .end local v37    # "materialized\\15":Landroidx/compose/ui/Modifier;
    .end local v40    # "localMap\\15":Landroidx/compose/runtime/CompositionLocalMap;
    invoke-static {v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 248
    nop

    .end local v10    # "$changed\\14":I
    .end local v11    # "$composer\\14":Landroidx/compose/runtime/Composer;
    .end local v13    # "$i$f$Column\\14\\51":I
    .end local v22    # "verticalArrangement\\14":Landroidx/compose/foundation/layout/Arrangement$Vertical;
    .end local v32    # "modifier\\14":Landroidx/compose/ui/Modifier;
    .end local v36    # "horizontalAlignment\\14":Landroidx/compose/ui/Alignment$Horizontal;
    .end local v39    # "measurePolicy\\14":Landroidx/compose/ui/layout/MeasurePolicy;
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .end local v3    # "isSaving$delegate":Landroidx/compose/runtime/MutableState;
    .end local v6    # "saveError$delegate":Landroidx/compose/runtime/MutableState;
    .end local v12    # "context":Landroid/content/Context;
    .end local v14    # "allEntries$delegate":Landroidx/compose/runtime/State;
    .end local v15    # "pdfFile$delegate":Landroidx/compose/runtime/MutableState;
    goto :goto_12

    .line 38
    .end local v21    # "$dirty":I
    .local v2, "$dirty":I
    :cond_16
    move/from16 v21, v2

    .end local v2    # "$dirty":I
    .restart local v21    # "$dirty":I
    invoke-interface/range {p2 .. p2}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 96
    :cond_17
    :goto_12
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final PdfPreviewScreen$lambda$23$lambda$11(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;
    .locals 4
    .param p0, "$saveError$delegate"    # Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 42
    move-object v0, p0

    check-cast v0, Landroidx/compose/runtime/State;

    .local v0, "$this$getValue\\1":Landroidx/compose/runtime/State;
    const/4 v1, 0x0

    .local v1, "this_\\1":Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "property\\1":Lkotlin/reflect/KProperty;
    const/4 v3, 0x0

    .line 124
    .local v3, "$i$f$getValue\\1\\42":I
    invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "$this$getValue\\1":Landroidx/compose/runtime/State;
    .end local v1    # "this_\\1":Ljava/lang/Object;
    .end local v2    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v3    # "$i$f$getValue\\1\\42":I
    check-cast v0, Ljava/lang/String;

    .line 42
    return-object v0
.end method

.method private static final PdfPreviewScreen$lambda$23$lambda$12(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V
    .locals 5
    .param p0, "$saveError$delegate"    # Landroidx/compose/runtime/MutableState;
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

    .line 42
    const/4 v0, 0x0

    .local v0, "this_\\1":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property\\1":Lkotlin/reflect/KProperty;
    move-object v2, p1

    .local v2, "value\\1":Ljava/lang/Object;
    move-object v3, p0

    .local v3, "$this$setValue\\1":Landroidx/compose/runtime/MutableState;
    const/4 v4, 0x0

    .line 125
    .local v4, "$i$f$setValue\\1\\42":I
    invoke-interface {v3, v2}, Landroidx/compose/runtime/MutableState;->setValue(Ljava/lang/Object;)V

    .line 126
    nop

    .line 42
    .end local v0    # "this_\\1":Ljava/lang/Object;
    .end local v1    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v2    # "value\\1":Ljava/lang/Object;
    .end local v3    # "$this$setValue\\1":Landroidx/compose/runtime/MutableState;
    .end local v4    # "$i$f$setValue\\1\\42":I
    return-void
.end method

.method private static final PdfPreviewScreen$lambda$23$lambda$13(Landroidx/compose/runtime/State;)Ljava/util/List;
    .locals 4
    .param p0, "$allEntries$delegate"    # Landroidx/compose/runtime/State;
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

    .line 43
    const/4 v0, 0x0

    .local v0, "this_\\1":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property\\1":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue\\1":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 127
    .local v3, "$i$f$getValue\\1\\43":I
    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "this_\\1":Ljava/lang/Object;
    .end local v1    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$getValue\\1":Landroidx/compose/runtime/State;
    .end local v3    # "$i$f$getValue\\1\\43":I
    check-cast v0, Ljava/util/List;

    .line 43
    return-object v0
.end method

.method static final PdfPreviewScreen$lambda$23$lambda$22$lambda$18$lambda$17(Landroidx/compose/runtime/MutableState;Landroid/content/Context;)Lcom/rajat/pdfviewer/PdfRendererView;
    .locals 7
    .param p0, "$pdfFile$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p1, "ctx"    # Landroid/content/Context;

    const-string v0, "ctx"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 59
    new-instance v1, Lcom/rajat/pdfviewer/PdfRendererView;

    const/4 v5, 0x6

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v2, p1

    .end local p1    # "ctx":Landroid/content/Context;
    .local v2, "ctx":Landroid/content/Context;
    invoke-direct/range {v1 .. v6}, Lcom/rajat/pdfviewer/PdfRendererView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object p1, v1

    .local p1, "$this$PdfPreviewScreen_u24lambda_u2423_u24lambda_u2422_u24lambda_u2418_u24lambda_u2417_u24lambda_u2416\\1":Lcom/rajat/pdfviewer/PdfRendererView;
    const/4 v0, 0x0

    .line 60
    .local v0, "$i$a$-apply-PdfPreviewScreenKt$PdfPreviewScreen$2$2$2$1$1\\1\\59\\0":I
    invoke-static {p0}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->PdfPreviewScreen$lambda$23$lambda$5(Landroidx/compose/runtime/MutableState;)Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 v4, 0x0

    const/4 v5, 0x2

    invoke-static {p1, v3, v4, v5, v4}, Lcom/rajat/pdfviewer/PdfRendererView;->initWithFile$default(Lcom/rajat/pdfviewer/PdfRendererView;Ljava/io/File;Lcom/rajat/pdfviewer/util/CacheStrategy;ILjava/lang/Object;)V

    .line 61
    nop

    .line 59
    .end local v0    # "$i$a$-apply-PdfPreviewScreenKt$PdfPreviewScreen$2$2$2$1$1\\1\\59\\0":I
    .end local p1    # "$this$PdfPreviewScreen_u24lambda_u2423_u24lambda_u2422_u24lambda_u2418_u24lambda_u2417_u24lambda_u2416\\1":Lcom/rajat/pdfviewer/PdfRendererView;
    nop

    .line 61
    return-object v1
.end method

.method static final PdfPreviewScreen$lambda$23$lambda$22$lambda$20$lambda$19(Landroid/content/Context;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;)Lkotlin/Unit;
    .locals 11
    .param p0, "$context"    # Landroid/content/Context;
    .param p1, "$isSaving$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p2, "$saveError$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p3, "$pdfFile$delegate"    # Landroidx/compose/runtime/MutableState;

    .line 68
    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->PdfPreviewScreen$lambda$23$lambda$9(Landroidx/compose/runtime/MutableState;Z)V

    .line 69
    const/4 v1, 0x0

    invoke-static {p2, v1}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->PdfPreviewScreen$lambda$23$lambda$12(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V

    .line 70
    nop

    .line 71
    const/4 v2, 0x0

    :try_start_0
    new-instance v3, Ljava/io/File;

    invoke-virtual {p0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "LALA_Report_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".pdf"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v6, v3

    .line 72
    .local v6, "destFile":Ljava/io/File;
    invoke-static {p3}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->PdfPreviewScreen$lambda$23$lambda$5(Landroidx/compose/runtime/MutableState;)Ljava/io/File;

    move-result-object v5

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 v9, 0x4

    const/4 v10, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-static/range {v5 .. v10}, Lkotlin/io/FilesKt;->copyTo$default(Ljava/io/File;Ljava/io/File;ZIILjava/lang/Object;)Ljava/io/File;

    .line 73
    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "PDF saved to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {p0, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v6    # "destFile":Ljava/io/File;
    goto :goto_0

    .line 77
    :catchall_0
    move-exception v0

    goto :goto_1

    .line 74
    :catch_0
    move-exception v0

    .line 75
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    const-string v1, "Failed to save PDF"

    :cond_0
    invoke-static {p2, v1}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->PdfPreviewScreen$lambda$23$lambda$12(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    invoke-static {p1, v2}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->PdfPreviewScreen$lambda$23$lambda$9(Landroidx/compose/runtime/MutableState;Z)V

    .line 78
    nop

    .line 79
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    .line 77
    :goto_1
    invoke-static {p1, v2}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->PdfPreviewScreen$lambda$23$lambda$9(Landroidx/compose/runtime/MutableState;Z)V

    throw v0
.end method

.method static final PdfPreviewScreen$lambda$23$lambda$22$lambda$21(Landroidx/compose/runtime/MutableState;Landroidx/compose/foundation/layout/RowScope;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 25
    .param p0, "$isSaving$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p1, "$this$Button"    # Landroidx/compose/foundation/layout/RowScope;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    move-object/from16 v0, p2

    move/from16 v1, p3

    const-string v2, "$this$Button"

    move-object/from16 v3, p1

    invoke-static {v3, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "C84@3408L47:PdfPreviewScreen.kt#4cebsy"

    invoke-static {v0, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v2, v1, 0x11

    const/16 v4, 0x10

    if-eq v2, v4, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    and-int/lit8 v4, v1, 0x1

    invoke-interface {v0, v2, v4}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, -0x1

    const-string v4, "com.hardlineforge.lala.ui.screens.PdfPreviewScreen.<anonymous>.<anonymous>.<anonymous> (PdfPreviewScreen.kt:84)"

    const v5, -0x40c074f0

    invoke-static {v5, v1, v2, v4}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 85
    :cond_1
    invoke-static/range {p0 .. p0}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->PdfPreviewScreen$lambda$23$lambda$8(Landroidx/compose/runtime/MutableState;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v2, "Saving..."

    goto :goto_1

    :cond_2
    const-string v2, "Save PDF"

    :goto_1
    const/16 v23, 0x0

    const v24, 0x1fffe

    const/4 v1, 0x0

    move-object v0, v2

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-wide/16 v9, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const-wide/16 v13, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v22, 0x0

    move-object/from16 v21, p2

    invoke-static/range {v0 .. v24}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_2

    .line 84
    :cond_3
    invoke-interface/range {p2 .. p2}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 86
    :cond_4
    :goto_2
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final PdfPreviewScreen$lambda$23$lambda$5(Landroidx/compose/runtime/MutableState;)Ljava/io/File;
    .locals 4
    .param p0, "$pdfFile$delegate"    # Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/io/File;",
            ">;)",
            "Ljava/io/File;"
        }
    .end annotation

    .line 40
    move-object v0, p0

    check-cast v0, Landroidx/compose/runtime/State;

    .local v0, "$this$getValue\\1":Landroidx/compose/runtime/State;
    const/4 v1, 0x0

    .local v1, "this_\\1":Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "property\\1":Lkotlin/reflect/KProperty;
    const/4 v3, 0x0

    .line 118
    .local v3, "$i$f$getValue\\1\\40":I
    invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "$this$getValue\\1":Landroidx/compose/runtime/State;
    .end local v1    # "this_\\1":Ljava/lang/Object;
    .end local v2    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v3    # "$i$f$getValue\\1\\40":I
    check-cast v0, Ljava/io/File;

    .line 40
    return-object v0
.end method

.method private static final PdfPreviewScreen$lambda$23$lambda$6(Landroidx/compose/runtime/MutableState;Ljava/io/File;)V
    .locals 5
    .param p0, "$pdfFile$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p1, "<set-?>"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/io/File;",
            ">;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    .line 40
    const/4 v0, 0x0

    .local v0, "this_\\1":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property\\1":Lkotlin/reflect/KProperty;
    move-object v2, p1

    .local v2, "value\\1":Ljava/lang/Object;
    move-object v3, p0

    .local v3, "$this$setValue\\1":Landroidx/compose/runtime/MutableState;
    const/4 v4, 0x0

    .line 119
    .local v4, "$i$f$setValue\\1\\40":I
    invoke-interface {v3, v2}, Landroidx/compose/runtime/MutableState;->setValue(Ljava/lang/Object;)V

    .line 120
    nop

    .line 40
    .end local v0    # "this_\\1":Ljava/lang/Object;
    .end local v1    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v2    # "value\\1":Ljava/lang/Object;
    .end local v3    # "$this$setValue\\1":Landroidx/compose/runtime/MutableState;
    .end local v4    # "$i$f$setValue\\1\\40":I
    return-void
.end method

.method private static final PdfPreviewScreen$lambda$23$lambda$8(Landroidx/compose/runtime/MutableState;)Z
    .locals 4
    .param p0, "$isSaving$delegate"    # Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;)Z"
        }
    .end annotation

    .line 41
    move-object v0, p0

    check-cast v0, Landroidx/compose/runtime/State;

    .local v0, "$this$getValue\\1":Landroidx/compose/runtime/State;
    const/4 v1, 0x0

    .local v1, "this_\\1":Ljava/lang/Object;
    const/4 v2, 0x0

    .local v2, "property\\1":Lkotlin/reflect/KProperty;
    const/4 v3, 0x0

    .line 121
    .local v3, "$i$f$getValue\\1\\41":I
    invoke-interface {v0}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "$this$getValue\\1":Landroidx/compose/runtime/State;
    .end local v1    # "this_\\1":Ljava/lang/Object;
    .end local v2    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v3    # "$i$f$getValue\\1\\41":I
    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 41
    return v0
.end method

.method private static final PdfPreviewScreen$lambda$23$lambda$9(Landroidx/compose/runtime/MutableState;Z)V
    .locals 5
    .param p0, "$isSaving$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p1, "<set-?>"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;Z)V"
        }
    .end annotation

    .line 41
    const/4 v0, 0x0

    .local v0, "this_\\1":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property\\1":Lkotlin/reflect/KProperty;
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .local v2, "value\\1":Ljava/lang/Object;
    move-object v3, p0

    .local v3, "$this$setValue\\1":Landroidx/compose/runtime/MutableState;
    const/4 v4, 0x0

    .line 122
    .local v4, "$i$f$setValue\\1\\41":I
    invoke-interface {v3, v2}, Landroidx/compose/runtime/MutableState;->setValue(Ljava/lang/Object;)V

    .line 123
    nop

    .line 41
    .end local v0    # "this_\\1":Ljava/lang/Object;
    .end local v1    # "property\\1":Lkotlin/reflect/KProperty;
    .end local v2    # "value\\1":Ljava/lang/Object;
    .end local v3    # "$this$setValue\\1":Landroidx/compose/runtime/MutableState;
    .end local v4    # "$i$f$setValue\\1\\41":I
    return-void
.end method

.method static final PdfPreviewScreen$lambda$24(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 1

    or-int/lit8 v0, p2, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v0

    invoke-static {p0, p1, p4, v0, p3}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->PdfPreviewScreen(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final PdfPreviewScreen$lambda$3(Landroidx/navigation/NavHostController;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 11
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    const-string v0, "C30@1074L192,28@978L302:PdfPreviewScreen.kt#4cebsy"

    invoke-static {p1, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, p2, 0x3

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq v0, v1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    and-int/lit8 v1, p2, 0x1

    invoke-interface {p1, v0, v1}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.PdfPreviewScreen.<anonymous> (PdfPreviewScreen.kt:27)"

    const v3, 0x6f84cbb1

    invoke-static {v3, p2, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    :cond_1
    sget-object v0, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$PdfPreviewScreenKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$PdfPreviewScreenKt;

    invoke-virtual {v0}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$PdfPreviewScreenKt;->getLambda$-745178507$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v0

    .line 31
    new-instance v1, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$$ExternalSyntheticLambda0;-><init>(Landroidx/navigation/NavHostController;)V

    const/16 v3, 0x36

    const v4, -0x5d0e6a09

    invoke-static {v4, v2, v1, p1, v3}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

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

    move-object v8, p1

    invoke-static/range {v0 .. v10}, Landroidx/compose/material3/AppBarKt;->TopAppBar-GHTll3U(Lkotlin/jvm/functions/Function2;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;FLandroidx/compose/foundation/layout/WindowInsets;Landroidx/compose/material3/TopAppBarColors;Landroidx/compose/material3/TopAppBarScrollBehavior;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    .line 27
    :cond_2
    invoke-interface {p1}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 37
    :cond_3
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final PdfPreviewScreen$lambda$3$lambda$2(Landroidx/navigation/NavHostController;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 13
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    const-string v0, "C31@1117L32,31@1096L152:PdfPreviewScreen.kt#4cebsy"

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

    const-string v1, "com.hardlineforge.lala.ui.screens.PdfPreviewScreen.<anonymous>.<anonymous> (PdfPreviewScreen.kt:31)"

    const v2, -0x5d0e6a09

    invoke-static {v2, p2, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 32
    :cond_1
    const v0, -0x531c0649

    const-string v1, "CC(remember):PdfPreviewScreen.kt#9igjgp"

    invoke-static {p1, v0, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {p1, p0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v0

    .local v0, "invalid\\1":Z
    move-object v1, p1

    .local v1, "$this$cache\\1":Landroidx/compose/runtime/Composer;
    const/4 v2, 0x0

    .line 112
    .local v2, "$i$f$cache\\1\\32":I
    invoke-interface {v1}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v3

    .local v3, "it\\1":Ljava/lang/Object;
    const/4 v4, 0x0

    .line 113
    .local v4, "$i$a$-let-ComposerKt$cache$1\\2\\112\\1":I
    if-nez v0, :cond_3

    sget-object v5, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v5}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v5

    if-ne v3, v5, :cond_2

    goto :goto_1

    .line 117
    :cond_2
    goto :goto_2

    .line 114
    :cond_3
    :goto_1
    const/4 v5, 0x0

    .line 32
    .local v5, "$i$a$-cache-PdfPreviewScreenKt$PdfPreviewScreen$1$1$1\\3\\114\\0":I
    new-instance v6, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$$ExternalSyntheticLambda4;

    invoke-direct {v6, p0}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$$ExternalSyntheticLambda4;-><init>(Landroidx/navigation/NavHostController;)V

    .line 114
    .end local v5    # "$i$a$-cache-PdfPreviewScreenKt$PdfPreviewScreen$1$1$1\\3\\114\\0":I
    nop

    .line 115
    .local v6, "value\\2":Ljava/lang/Object;
    invoke-interface {v1, v6}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 116
    move-object v3, v6

    .line 112
    .end local v3    # "it\\1":Ljava/lang/Object;
    .end local v4    # "$i$a$-let-ComposerKt$cache$1\\2\\112\\1":I
    .end local v6    # "value\\2":Ljava/lang/Object;
    :goto_2
    nop

    .line 32
    .end local v0    # "invalid\\1":Z
    .end local v1    # "$this$cache\\1":Landroidx/compose/runtime/Composer;
    .end local v2    # "$i$f$cache\\1\\32":I
    move-object v4, v3

    check-cast v4, Lkotlin/jvm/functions/Function0;

    invoke-static {p1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    sget-object v0, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$PdfPreviewScreenKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$PdfPreviewScreenKt;

    invoke-virtual {v0}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$PdfPreviewScreenKt;->getLambda$-396234028$app_debug()Lkotlin/jvm/functions/Function2;

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

    .line 31
    .end local v10    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local p1    # "$composer":Landroidx/compose/runtime/Composer;
    :cond_4
    move-object v10, p1

    .end local p1    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v10    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 35
    :cond_5
    :goto_3
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method

.method static final PdfPreviewScreen$lambda$3$lambda$2$lambda$1$lambda$0(Landroidx/navigation/NavHostController;)Lkotlin/Unit;
    .locals 1
    .param p0, "$navController"    # Landroidx/navigation/NavHostController;

    .line 32
    invoke-virtual {p0}, Landroidx/navigation/NavHostController;->popBackStack()Z

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public static final synthetic access$PdfPreviewScreen$lambda$23$lambda$13(Landroidx/compose/runtime/State;)Ljava/util/List;
    .locals 1
    .param p0, "$allEntries$delegate"    # Landroidx/compose/runtime/State;

    .line 1
    invoke-static {p0}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->PdfPreviewScreen$lambda$23$lambda$13(Landroidx/compose/runtime/State;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$PdfPreviewScreen$lambda$23$lambda$6(Landroidx/compose/runtime/MutableState;Ljava/io/File;)V
    .locals 0
    .param p0, "$pdfFile$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p1, "<set-?>"    # Ljava/io/File;

    .line 1
    invoke-static {p0, p1}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->PdfPreviewScreen$lambda$23$lambda$6(Landroidx/compose/runtime/MutableState;Ljava/io/File;)V

    return-void
.end method
