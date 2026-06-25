.class final Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$3$1$1$2$2;
.super Ljava/lang/Object;
.source "SearchScreen.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/ui/screens/SearchScreenKt;->SearchScreen(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lkotlin/jvm/functions/Function3<",
        "Landroidx/compose/foundation/layout/ColumnScope;",
        "Landroidx/compose/runtime/Composer;",
        "Ljava/lang/Integer;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSearchScreen.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SearchScreen.kt\ncom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$3$1$1$2$2\n+ 2 Dp.kt\nandroidx/compose/ui/unit/DpKt\n+ 3 Column.kt\nandroidx/compose/foundation/layout/ColumnKt\n+ 4 Layout.kt\nandroidx/compose/ui/layout/LayoutKt\n+ 5 Composables.kt\nandroidx/compose/runtime/ComposablesKt\n+ 6 Composer.kt\nandroidx/compose/runtime/Updater\n*L\n1#1,84:1\n113#2:85\n87#3:86\n84#3,9:87\n94#3:126\n79#4,6:96\n86#4,3:111\n89#4,2:120\n93#4:125\n347#5,9:102\n356#5,3:122\n4206#6,6:114\n*S KotlinDebug\n*F\n+ 1 SearchScreen.kt\ncom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$3$1$1$2$2\n*L\n67#1:85\n67#1:86\n67#1:87,9\n67#1:126\n67#1:96,6\n67#1:111,3\n67#1:120,2\n67#1:125\n67#1:102,9\n67#1:122,3\n67#1:114,6\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $entry:Lcom/hardlineforge/lala/data/LogEntry;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/data/LogEntry;)V
    .locals 0

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$3$1$1$2$2;->$entry:Lcom/hardlineforge/lala/data/LogEntry;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "p1"    # Ljava/lang/Object;
    .param p2, "p2"    # Ljava/lang/Object;
    .param p3, "p3"    # Ljava/lang/Object;

    .line 66
    move-object v0, p1

    check-cast v0, Landroidx/compose/foundation/layout/ColumnScope;

    move-object v1, p2

    check-cast v1, Landroidx/compose/runtime/Composer;

    move-object v2, p3

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$3$1$1$2$2;->invoke(Landroidx/compose/foundation/layout/ColumnScope;Landroidx/compose/runtime/Composer;I)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke(Landroidx/compose/foundation/layout/ColumnScope;Landroidx/compose/runtime/Composer;I)V
    .locals 51
    .param p1, "$this$Card"    # Landroidx/compose/foundation/layout/ColumnScope;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    move-object/from16 v0, p2

    move/from16 v1, p3

    const-string v2, "$this$Card"

    move-object/from16 v3, p1

    invoke-static {v3, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "C66@2671L537:SearchScreen.kt#4cebsy"

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

    if-eqz v2, :cond_6

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, -0x1

    const-string v4, "com.hardlineforge.lala.ui.screens.SearchScreen.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (SearchScreen.kt:66)"

    const v6, 0x2dc80d49

    invoke-static {v6, v1, v2, v4}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 67
    :cond_1
    sget-object v2, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v2, Landroidx/compose/ui/Modifier;

    const/16 v4, 0x10

    .local v4, "$this$dp\\1":I
    const/4 v6, 0x0

    .line 85
    .local v6, "$i$f$getDp\\1\\67":I
    int-to-float v7, v4

    invoke-static {v7}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v4

    .line 67
    .end local v4    # "$this$dp\\1":I
    .end local v6    # "$i$f$getDp\\1\\67":I
    invoke-static {v2, v4}, Landroidx/compose/foundation/layout/PaddingKt;->padding-3ABfNKs(Landroidx/compose/ui/Modifier;F)Landroidx/compose/ui/Modifier;

    move-result-object v2

    move-object/from16 v4, p0

    .local v2, "modifier\\2":Landroidx/compose/ui/Modifier;
    iget-object v6, v4, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$3$1$1$2$2;->$entry:Lcom/hardlineforge/lala/data/LogEntry;

    const/4 v7, 0x6

    .local v7, "$changed\\2":I
    move-object/from16 v8, p2

    .local v8, "$composer\\2":Landroidx/compose/runtime/Composer;
    const/4 v9, 0x0

    .line 86
    .local v9, "$i$f$Column\\2\\67":I
    const v10, -0x1cd0f17e

    const-string v11, "CC(Column)P(2,3,1)87@4442L61,88@4508L133:Column.kt#2w3rfo"

    invoke-static {v8, v10, v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 87
    sget-object v10, Landroidx/compose/foundation/layout/Arrangement;->INSTANCE:Landroidx/compose/foundation/layout/Arrangement;

    invoke-virtual {v10}, Landroidx/compose/foundation/layout/Arrangement;->getTop()Landroidx/compose/foundation/layout/Arrangement$Vertical;

    move-result-object v10

    .line 88
    .local v10, "verticalArrangement\\2":Landroidx/compose/foundation/layout/Arrangement$Vertical;
    sget-object v11, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v11}, Landroidx/compose/ui/Alignment$Companion;->getStart()Landroidx/compose/ui/Alignment$Horizontal;

    move-result-object v11

    .line 91
    .local v11, "horizontalAlignment\\2":Landroidx/compose/ui/Alignment$Horizontal;
    shr-int/lit8 v12, v7, 0x3

    and-int/lit8 v12, v12, 0xe

    shr-int/lit8 v13, v7, 0x3

    and-int/lit8 v13, v13, 0x70

    or-int/2addr v12, v13

    invoke-static {v10, v11, v8, v12}, Landroidx/compose/foundation/layout/ColumnKt;->columnMeasurePolicy(Landroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/ui/Alignment$Horizontal;Landroidx/compose/runtime/Composer;I)Landroidx/compose/ui/layout/MeasurePolicy;

    move-result-object v12

    .line 95
    .local v12, "measurePolicy\\2":Landroidx/compose/ui/layout/MeasurePolicy;
    shl-int/lit8 v13, v7, 0x3

    and-int/lit8 v13, v13, 0x70

    .line 92
    move-object v14, v2

    .local v13, "$changed\\3":I
    .local v14, "modifier\\3":Landroidx/compose/ui/Modifier;
    const/4 v15, 0x0

    .line 96
    .local v15, "$i$f$Layout\\3\\92":I
    const v5, -0x4ee9b9da

    const-string v0, "CC(Layout)P(!1,2)79@3206L23,82@3357L359:Layout.kt#80mrfh"

    invoke-static {v8, v5, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 97
    const/4 v0, 0x0

    invoke-static {v8, v0}, Landroidx/compose/runtime/ComposablesKt;->getCurrentCompositeKeyHash(Landroidx/compose/runtime/Composer;I)I

    move-result v0

    .line 98
    .local v0, "compositeKeyHash\\3":I
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->getCurrentCompositionLocalMap()Landroidx/compose/runtime/CompositionLocalMap;

    move-result-object v5

    .line 99
    .local v5, "localMap\\3":Landroidx/compose/runtime/CompositionLocalMap;
    move/from16 v16, v0

    .end local v0    # "compositeKeyHash\\3":I
    .local v16, "compositeKeyHash\\3":I
    invoke-static {v8, v14}, Landroidx/compose/ui/ComposedModifierKt;->materializeModifier(Landroidx/compose/runtime/Composer;Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v0

    .line 101
    .local v0, "materialized\\3":Landroidx/compose/ui/Modifier;
    sget-object v17, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual/range {v17 .. v17}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getConstructor()Lkotlin/jvm/functions/Function0;

    move-result-object v17

    shl-int/lit8 v1, v13, 0x6

    and-int/lit16 v1, v1, 0x380

    or-int/lit8 v1, v1, 0x6

    .line 100
    nop

    .local v1, "$changed\\4":I
    move-object/from16 v18, v17

    .local v18, "factory\\4":Lkotlin/jvm/functions/Function0;
    const/16 v17, 0x0

    .line 102
    .local v17, "$i$f$ReusableComposeNode\\4\\100":I
    move/from16 v19, v1

    .end local v1    # "$changed\\4":I
    .local v19, "$changed\\4":I
    const v1, -0x2942ffcf

    move-object/from16 v20, v2

    .end local v2    # "modifier\\2":Landroidx/compose/ui/Modifier;
    .local v20, "modifier\\2":Landroidx/compose/ui/Modifier;
    const-string v2, "CC(ReusableComposeNode)P(1,2)355@14017L9:Composables.kt#9igjgp"

    invoke-static {v8, v1, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 103
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->getApplier()Landroidx/compose/runtime/Applier;

    move-result-object v1

    instance-of v1, v1, Landroidx/compose/runtime/Applier;

    if-nez v1, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposablesKt;->invalidApplier()V

    .line 104
    :cond_2
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->startReusableNode()V

    .line 105
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 106
    move-object/from16 v1, v18

    .end local v18    # "factory\\4":Lkotlin/jvm/functions/Function0;
    .local v1, "factory\\4":Lkotlin/jvm/functions/Function0;
    invoke-interface {v8, v1}, Landroidx/compose/runtime/Composer;->createNode(Lkotlin/jvm/functions/Function0;)V

    goto :goto_1

    .line 108
    .end local v1    # "factory\\4":Lkotlin/jvm/functions/Function0;
    .restart local v18    # "factory\\4":Lkotlin/jvm/functions/Function0;
    :cond_3
    move-object/from16 v1, v18

    .end local v18    # "factory\\4":Lkotlin/jvm/functions/Function0;
    .restart local v1    # "factory\\4":Lkotlin/jvm/functions/Function0;
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->useNode()V

    .line 110
    :goto_1
    invoke-static {v8}, Landroidx/compose/runtime/Updater;->constructor-impl(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/Composer;

    move-result-object v2

    .local v2, "$this$Layout_u24lambda_u240\\5":Landroidx/compose/runtime/Composer;
    const/16 v18, 0x0

    .line 111
    .local v18, "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\5\\110\\3":I
    sget-object v21, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    move-object/from16 v22, v1

    .end local v1    # "factory\\4":Lkotlin/jvm/functions/Function0;
    .local v22, "factory\\4":Lkotlin/jvm/functions/Function0;
    invoke-virtual/range {v21 .. v21}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetMeasurePolicy()Lkotlin/jvm/functions/Function2;

    move-result-object v1

    invoke-static {v2, v12, v1}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 112
    sget-object v1, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v1}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetResolvedCompositionLocals()Lkotlin/jvm/functions/Function2;

    move-result-object v1

    invoke-static {v2, v5, v1}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 113
    sget-object v1, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v1}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetCompositeKeyHash()Lkotlin/jvm/functions/Function2;

    move-result-object v1

    .local v1, "block\\6":Lkotlin/jvm/functions/Function2;
    const/16 v21, 0x0

    .line 114
    .local v21, "$i$f$set-impl\\6\\113":I
    move-object/from16 v23, v2

    .local v23, "$this$set_impl_u24lambda_u240\\6":Landroidx/compose/runtime/Composer;
    const/16 v24, 0x0

    .line 115
    .local v24, "$i$a$-with-Updater$set$1\\7\\114\\6":I
    invoke-interface/range {v23 .. v23}, Landroidx/compose/runtime/Composer;->getInserting()Z

    move-result v25

    if-nez v25, :cond_5

    invoke-interface/range {v23 .. v23}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v3

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    goto :goto_2

    :cond_4
    move-object/from16 v4, v23

    goto :goto_3

    .line 116
    :cond_5
    :goto_2
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v4, v23

    .end local v23    # "$this$set_impl_u24lambda_u240\\6":Landroidx/compose/runtime/Composer;
    .local v4, "$this$set_impl_u24lambda_u240\\6":Landroidx/compose/runtime/Composer;
    invoke-interface {v4, v3}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 117
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Landroidx/compose/runtime/Composer;->apply(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 119
    :goto_3
    nop

    .line 114
    .end local v4    # "$this$set_impl_u24lambda_u240\\6":Landroidx/compose/runtime/Composer;
    .end local v24    # "$i$a$-with-Updater$set$1\\7\\114\\6":I
    nop

    .line 119
    nop

    .line 120
    .end local v1    # "block\\6":Lkotlin/jvm/functions/Function2;
    .end local v21    # "$i$f$set-impl\\6\\113":I
    sget-object v1, Landroidx/compose/ui/node/ComposeUiNode;->Companion:Landroidx/compose/ui/node/ComposeUiNode$Companion;

    invoke-virtual {v1}, Landroidx/compose/ui/node/ComposeUiNode$Companion;->getSetModifier()Lkotlin/jvm/functions/Function2;

    move-result-object v1

    invoke-static {v2, v0, v1}, Landroidx/compose/runtime/Updater;->set-impl(Landroidx/compose/runtime/Composer;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    .line 121
    nop

    .line 110
    .end local v2    # "$this$Layout_u24lambda_u240\\5":Landroidx/compose/runtime/Composer;
    .end local v18    # "$i$a$-ReusableComposeNode-LayoutKt$Layout$1\\5\\110\\3":I
    nop

    .line 122
    shr-int/lit8 v1, v19, 0x6

    and-int/lit8 v1, v1, 0xe

    .local v1, "$changed\\8":I
    move-object v2, v8

    .local v2, "$composer\\8":Landroidx/compose/runtime/Composer;
    const/4 v3, 0x0

    .line 93
    .local v3, "$i$a$-Layout-ColumnKt$Column$1\\8\\122\\2":I
    const v4, -0x16eda499

    move-object/from16 v18, v0

    .end local v0    # "materialized\\3":Landroidx/compose/ui/Modifier;
    .local v18, "materialized\\3":Landroidx/compose/ui/Modifier;
    const-string v0, "C89@4556L9:Column.kt#2w3rfo"

    invoke-static {v2, v4, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    sget-object v0, Landroidx/compose/foundation/layout/ColumnScopeInstance;->INSTANCE:Landroidx/compose/foundation/layout/ColumnScopeInstance;

    shr-int/lit8 v4, v7, 0x6

    and-int/lit8 v4, v4, 0x70

    or-int/lit8 v4, v4, 0x6

    .local v4, "$changed\\9":I
    check-cast v0, Landroidx/compose/foundation/layout/ColumnScope;

    .local v0, "$this$invoke_u24lambda_u240\\9":Landroidx/compose/foundation/layout/ColumnScope;
    move-object/from16 v44, v2

    .local v44, "$composer\\9":Landroidx/compose/runtime/Composer;
    const/16 v21, 0x0

    .line 68
    .local v21, "$i$a$-Column-SearchScreenKt$SearchScreen$3$1$1$2$2$1\\9\\93\\0":I
    move-object/from16 v48, v0

    .end local v0    # "$this$invoke_u24lambda_u240\\9":Landroidx/compose/foundation/layout/ColumnScope;
    .local v48, "$this$invoke_u24lambda_u240\\9":Landroidx/compose/foundation/layout/ColumnScope;
    const v0, 0x336f36d2

    move/from16 v49, v1

    .end local v1    # "$changed\\8":I
    .local v49, "$changed\\8":I
    const-string v1, "C69@2847L10,70@2921L11,67@2740L226,74@3097L10,72@2991L195:SearchScreen.kt#4cebsy"

    move-object/from16 v50, v2

    .end local v44    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .local v2, "$composer\\9":Landroidx/compose/runtime/Composer;
    .local v50, "$composer\\8":Landroidx/compose/runtime/Composer;
    invoke-static {v2, v0, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 69
    invoke-virtual {v6}, Lcom/hardlineforge/lala/data/LogEntry;->getCategory()Ljava/lang/String;

    move-result-object v23

    .line 70
    sget-object v0, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v1, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v0, v2, v1}, Landroidx/compose/material3/MaterialTheme;->getTypography(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Typography;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/compose/material3/Typography;->getLabelMedium()Landroidx/compose/ui/text/TextStyle;

    move-result-object v43

    .line 71
    sget-object v0, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v1, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v0, v2, v1}, Landroidx/compose/material3/MaterialTheme;->getColorScheme(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/ColorScheme;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/compose/material3/ColorScheme;->getPrimary-0d7_KjU()J

    move-result-wide v25

    .line 69
    nop

    .line 71
    nop

    .line 70
    nop

    .line 68
    const/16 v24, 0x0

    const-wide/16 v27, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const-wide/16 v32, 0x0

    const/16 v34, 0x0

    const/16 v35, 0x0

    const-wide/16 v36, 0x0

    const/16 v38, 0x0

    const/16 v39, 0x0

    const/16 v40, 0x0

    const/16 v41, 0x0

    const/16 v42, 0x0

    const/16 v45, 0x0

    const/16 v46, 0x0

    const v47, 0xfffa

    .end local v2    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v44    # "$composer\\9":Landroidx/compose/runtime/Composer;
    invoke-static/range {v23 .. v47}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    .line 74
    .end local v44    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v2    # "$composer\\9":Landroidx/compose/runtime/Composer;
    invoke-virtual {v6}, Lcom/hardlineforge/lala/data/LogEntry;->getComment()Ljava/lang/String;

    move-result-object v23

    .line 75
    sget-object v0, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v1, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v0, v2, v1}, Landroidx/compose/material3/MaterialTheme;->getTypography(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Typography;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/compose/material3/Typography;->getBodyMedium()Landroidx/compose/ui/text/TextStyle;

    move-result-object v43

    .line 74
    nop

    .line 76
    nop

    .line 75
    nop

    .line 73
    const-wide/16 v25, 0x0

    const/16 v40, 0x2

    const/16 v46, 0xc00

    const v47, 0xdffe

    .end local v2    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .restart local v44    # "$composer\\9":Landroidx/compose/runtime/Composer;
    invoke-static/range {v23 .. v47}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    .line 68
    invoke-static/range {v44 .. v44}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 78
    nop

    .line 93
    .end local v4    # "$changed\\9":I
    .end local v21    # "$i$a$-Column-SearchScreenKt$SearchScreen$3$1$1$2$2$1\\9\\93\\0":I
    .end local v44    # "$composer\\9":Landroidx/compose/runtime/Composer;
    .end local v48    # "$this$invoke_u24lambda_u240\\9":Landroidx/compose/foundation/layout/ColumnScope;
    invoke-static/range {v50 .. v50}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 122
    .end local v3    # "$i$a$-Layout-ColumnKt$Column$1\\8\\122\\2":I
    .end local v49    # "$changed\\8":I
    .end local v50    # "$composer\\8":Landroidx/compose/runtime/Composer;
    nop

    .line 123
    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->endNode()V

    .line 102
    invoke-static {v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 124
    nop

    .line 96
    .end local v17    # "$i$f$ReusableComposeNode\\4\\100":I
    .end local v19    # "$changed\\4":I
    .end local v22    # "factory\\4":Lkotlin/jvm/functions/Function0;
    invoke-static {v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 125
    nop

    .line 86
    .end local v5    # "localMap\\3":Landroidx/compose/runtime/CompositionLocalMap;
    .end local v13    # "$changed\\3":I
    .end local v14    # "modifier\\3":Landroidx/compose/ui/Modifier;
    .end local v15    # "$i$f$Layout\\3\\92":I
    .end local v16    # "compositeKeyHash\\3":I
    .end local v18    # "materialized\\3":Landroidx/compose/ui/Modifier;
    invoke-static {v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 126
    nop

    .end local v7    # "$changed\\2":I
    .end local v8    # "$composer\\2":Landroidx/compose/runtime/Composer;
    .end local v9    # "$i$f$Column\\2\\67":I
    .end local v10    # "verticalArrangement\\2":Landroidx/compose/foundation/layout/Arrangement$Vertical;
    .end local v11    # "horizontalAlignment\\2":Landroidx/compose/ui/Alignment$Horizontal;
    .end local v12    # "measurePolicy\\2":Landroidx/compose/ui/layout/MeasurePolicy;
    .end local v20    # "modifier\\2":Landroidx/compose/ui/Modifier;
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_4

    .line 66
    :cond_6
    invoke-interface/range {p2 .. p2}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 79
    :cond_7
    :goto_4
    return-void
.end method
