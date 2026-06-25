.class public final Lcom/hardlineforge/lala/ui/screens/LalaTopBarKt;
.super Ljava/lang/Object;
.source "LalaTopBar.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\u001a;\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00010\u00052\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00010\u00052\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0008H\u0007\u00a2\u0006\u0002\u0010\t\u00a8\u0006\n"
    }
    d2 = {
        "LalaTopBar",
        "",
        "title",
        "",
        "onMenuClick",
        "Lkotlin/Function0;",
        "onSearchClick",
        "showMenu",
        "",
        "(Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;ZLandroidx/compose/runtime/Composer;II)V",
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
.method public static final LalaTopBar(Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;ZLandroidx/compose/runtime/Composer;II)V
    .locals 18
    .param p0, "title"    # Ljava/lang/String;
    .param p1, "onMenuClick"    # Lkotlin/jvm/functions/Function0;
    .param p2, "onSearchClick"    # Lkotlin/jvm/functions/Function0;
    .param p3, "showMenu"    # Z
    .param p4, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p5, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;Z",
            "Landroidx/compose/runtime/Composer;",
            "II)V"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move/from16 v5, p5

    const-string v0, "title"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onMenuClick"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onSearchClick"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 21
    const v0, 0x685705c9

    move-object/from16 v4, p4

    invoke-interface {v4, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v14

    .end local p4    # "$composer":Landroidx/compose/runtime/Composer;
    .local v14, "$composer":Landroidx/compose/runtime/Composer;
    const-string v4, "C(LalaTopBar)P(3)22@747L84,25@858L197,32@1075L149,21@707L523:LalaTopBar.kt#4cebsy"

    invoke-static {v14, v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v4, p5

    .local v4, "$dirty":I
    and-int/lit8 v6, v5, 0x6

    if-nez v6, :cond_1

    invoke-interface {v14, v1}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v6, 0x4

    goto :goto_0

    :cond_0
    const/4 v6, 0x2

    :goto_0
    or-int/2addr v4, v6

    :cond_1
    and-int/lit8 v6, v5, 0x30

    if-nez v6, :cond_3

    invoke-interface {v14, v2}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    const/16 v6, 0x20

    goto :goto_1

    :cond_2
    const/16 v6, 0x10

    :goto_1
    or-int/2addr v4, v6

    :cond_3
    and-int/lit16 v6, v5, 0x180

    if-nez v6, :cond_5

    invoke-interface {v14, v3}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    const/16 v6, 0x100

    goto :goto_2

    :cond_4
    const/16 v6, 0x80

    :goto_2
    or-int/2addr v4, v6

    :cond_5
    and-int/lit8 v6, p6, 0x8

    if-eqz v6, :cond_6

    or-int/lit16 v4, v4, 0xc00

    move/from16 v7, p3

    goto :goto_4

    :cond_6
    and-int/lit16 v7, v5, 0xc00

    if-nez v7, :cond_8

    move/from16 v7, p3

    invoke-interface {v14, v7}, Landroidx/compose/runtime/Composer;->changed(Z)Z

    move-result v8

    if-eqz v8, :cond_7

    const/16 v8, 0x800

    goto :goto_3

    :cond_7
    const/16 v8, 0x400

    :goto_3
    or-int/2addr v4, v8

    goto :goto_4

    :cond_8
    move/from16 v7, p3

    :goto_4
    and-int/lit16 v8, v4, 0x493

    const/16 v9, 0x492

    const/4 v10, 0x1

    if-eq v8, v9, :cond_9

    move v8, v10

    goto :goto_5

    :cond_9
    const/4 v8, 0x0

    :goto_5
    and-int/lit8 v9, v4, 0x1

    invoke-interface {v14, v8, v9}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v8

    if-eqz v8, :cond_c

    if-eqz v6, :cond_a

    .line 20
    const/4 v6, 0x1

    .end local p3    # "showMenu":Z
    .local v6, "showMenu":Z
    goto :goto_6

    .line 21
    .end local v6    # "showMenu":Z
    .restart local p3    # "showMenu":Z
    :cond_a
    move v6, v7

    .line 20
    .end local p3    # "showMenu":Z
    .restart local v6    # "showMenu":Z
    :goto_6
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v7

    if-eqz v7, :cond_b

    const/4 v7, -0x1

    const-string v8, "com.hardlineforge.lala.ui.screens.LalaTopBar (LalaTopBar.kt:20)"

    invoke-static {v0, v4, v7, v8}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 23
    :cond_b
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/LalaTopBarKt$$ExternalSyntheticLambda0;

    invoke-direct {v0, v1}, Lcom/hardlineforge/lala/ui/screens/LalaTopBarKt$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;)V

    const v7, -0x7c932152

    const/16 v8, 0x36

    invoke-static {v7, v10, v0, v14, v8}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    check-cast v0, Lkotlin/jvm/functions/Function2;

    .line 26
    new-instance v7, Lcom/hardlineforge/lala/ui/screens/LalaTopBarKt$$ExternalSyntheticLambda1;

    invoke-direct {v7, v6, v2}, Lcom/hardlineforge/lala/ui/screens/LalaTopBarKt$$ExternalSyntheticLambda1;-><init>(ZLkotlin/jvm/functions/Function0;)V

    const v9, 0x7a20cbb0

    invoke-static {v9, v10, v7, v14, v8}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v7

    check-cast v7, Lkotlin/jvm/functions/Function2;

    .line 33
    new-instance v9, Lcom/hardlineforge/lala/ui/screens/LalaTopBarKt$$ExternalSyntheticLambda2;

    invoke-direct {v9, v3}, Lcom/hardlineforge/lala/ui/screens/LalaTopBarKt$$ExternalSyntheticLambda2;-><init>(Lkotlin/jvm/functions/Function0;)V

    const v11, -0x7f8bbe27

    invoke-static {v11, v10, v9, v14, v8}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v8

    move-object v9, v8

    check-cast v9, Lkotlin/jvm/functions/Function3;

    .line 22
    move-object v8, v7

    const/4 v7, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/16 v15, 0xd86

    const/16 v16, 0xf2

    move/from16 v17, v6

    move-object v6, v0

    move/from16 v0, v17

    .end local v6    # "showMenu":Z
    .local v0, "showMenu":Z
    invoke-static/range {v6 .. v16}, Landroidx/compose/material3/AppBarKt;->CenterAlignedTopAppBar-GHTll3U(Lkotlin/jvm/functions/Function2;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;FLandroidx/compose/foundation/layout/WindowInsets;Landroidx/compose/material3/TopAppBarColors;Landroidx/compose/material3/TopAppBarScrollBehavior;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v6

    if-eqz v6, :cond_d

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_7

    .line 14
    .end local v0    # "showMenu":Z
    .restart local p3    # "showMenu":Z
    :cond_c
    invoke-interface {v14}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move v0, v7

    .line 39
    .end local p3    # "showMenu":Z
    .restart local v0    # "showMenu":Z
    :cond_d
    :goto_7
    invoke-interface {v14}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v7

    if-eqz v7, :cond_e

    move v6, v4

    move v4, v0

    .end local v0    # "showMenu":Z
    .local v4, "showMenu":Z
    .local v6, "$dirty":I
    new-instance v0, Lcom/hardlineforge/lala/ui/screens/LalaTopBarKt$$ExternalSyntheticLambda3;

    move v8, v6

    move/from16 v6, p6

    .end local v6    # "$dirty":I
    .local v8, "$dirty":I
    invoke-direct/range {v0 .. v6}, Lcom/hardlineforge/lala/ui/screens/LalaTopBarKt$$ExternalSyntheticLambda3;-><init>(Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;ZII)V

    invoke-interface {v7, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    goto :goto_8

    .end local v8    # "$dirty":I
    .restart local v0    # "showMenu":Z
    .local v4, "$dirty":I
    :cond_e
    move v8, v4

    move v4, v0

    .end local v0    # "showMenu":Z
    .local v4, "showMenu":Z
    .restart local v8    # "$dirty":I
    :goto_8
    return-void
.end method

.method static final LalaTopBar$lambda$0(Ljava/lang/String;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 25
    .param p0, "$title"    # Ljava/lang/String;
    .param p1, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p2, "$changed"    # I

    move-object/from16 v0, p1

    move/from16 v1, p2

    const-string v2, "C23@795L10,23@761L60:LalaTopBar.kt#4cebsy"

    invoke-static {v0, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v2, v1, 0x3

    const/4 v3, 0x2

    if-eq v2, v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    and-int/lit8 v3, v1, 0x1

    invoke-interface {v0, v2, v3}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, -0x1

    const-string v3, "com.hardlineforge.lala.ui.screens.LalaTopBar.<anonymous> (LalaTopBar.kt:23)"

    const v4, -0x7c932152

    invoke-static {v4, v1, v2, v3}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 24
    :cond_1
    sget-object v2, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v3, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v2, v0, v3}, Landroidx/compose/material3/MaterialTheme;->getTypography(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Typography;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/compose/material3/Typography;->getHeadlineMedium()Landroidx/compose/ui/text/TextStyle;

    move-result-object v20

    const/16 v23, 0x0

    const v24, 0xfffe

    const/4 v1, 0x0

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

    const/16 v22, 0x0

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    invoke-static/range {v0 .. v24}, Landroidx/compose/material3/TextKt;->Text--4IGK_g(Ljava/lang/String;Landroidx/compose/ui/Modifier;JJLandroidx/compose/ui/text/font/FontStyle;Landroidx/compose/ui/text/font/FontWeight;Landroidx/compose/ui/text/font/FontFamily;JLandroidx/compose/ui/text/style/TextDecoration;Landroidx/compose/ui/text/style/TextAlign;JIZIILkotlin/jvm/functions/Function1;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/runtime/Composer;III)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    .line 23
    :cond_2
    invoke-interface/range {p1 .. p1}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 25
    :cond_3
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final LalaTopBar$lambda$1(ZLkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 10
    .param p0, "$showMenu"    # Z
    .param p1, "$onMenuClick"    # Lkotlin/jvm/functions/Function0;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    const-string v0, "C:LalaTopBar.kt#4cebsy"

    invoke-static {p2, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, p3, 0x3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    and-int/lit8 v1, p3, 0x1

    invoke-interface {p2, v0, v1}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.LalaTopBar.<anonymous> (LalaTopBar.kt:26)"

    const v2, 0x7a20cbb0

    invoke-static {v2, p3, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 27
    :cond_1
    if-eqz p0, :cond_2

    const v0, 0x2e77d613

    invoke-interface {p2, v0}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v0, "27@904L127"

    invoke-static {p2, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 28
    sget-object v0, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaTopBarKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaTopBarKt;

    invoke-virtual {v0}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaTopBarKt;->getLambda$29252008$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v6

    const/high16 v8, 0x30000

    const/16 v9, 0x1e

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p1

    move-object v7, p2

    .end local p1    # "$onMenuClick":Lkotlin/jvm/functions/Function0;
    .end local p2    # "$composer":Landroidx/compose/runtime/Composer;
    .local v1, "$onMenuClick":Lkotlin/jvm/functions/Function0;
    .local v7, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v1 .. v9}, Landroidx/compose/material3/IconButtonKt;->IconButton(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/material3/IconButtonColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V

    .line 27
    goto :goto_1

    .end local v1    # "$onMenuClick":Lkotlin/jvm/functions/Function0;
    .end local v7    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local p1    # "$onMenuClick":Lkotlin/jvm/functions/Function0;
    .restart local p2    # "$composer":Landroidx/compose/runtime/Composer;
    :cond_2
    move-object v1, p1

    move-object v7, p2

    .end local p1    # "$onMenuClick":Lkotlin/jvm/functions/Function0;
    .end local p2    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v1    # "$onMenuClick":Lkotlin/jvm/functions/Function0;
    .restart local v7    # "$composer":Landroidx/compose/runtime/Composer;
    const p1, 0x2e6a55b2

    invoke-interface {v7, p1}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    :goto_1
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_2

    .line 26
    .end local v1    # "$onMenuClick":Lkotlin/jvm/functions/Function0;
    .end local v7    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local p1    # "$onMenuClick":Lkotlin/jvm/functions/Function0;
    .restart local p2    # "$composer":Landroidx/compose/runtime/Composer;
    :cond_3
    move-object v1, p1

    move-object v7, p2

    .end local p1    # "$onMenuClick":Lkotlin/jvm/functions/Function0;
    .end local p2    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v1    # "$onMenuClick":Lkotlin/jvm/functions/Function0;
    .restart local v7    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 32
    :cond_4
    :goto_2
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1
.end method

.method static final LalaTopBar$lambda$2(Lkotlin/jvm/functions/Function0;Landroidx/compose/foundation/layout/RowScope;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 10
    .param p0, "$onSearchClick"    # Lkotlin/jvm/functions/Function0;
    .param p1, "$this$CenterAlignedTopAppBar"    # Landroidx/compose/foundation/layout/RowScope;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    const-string v0, "$this$CenterAlignedTopAppBar"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "C33@1089L125:LalaTopBar.kt#4cebsy"

    invoke-static {p2, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, p3, 0x11

    const/16 v1, 0x10

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    and-int/lit8 v1, p3, 0x1

    invoke-interface {p2, v0, v1}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    const-string v1, "com.hardlineforge.lala.ui.screens.LalaTopBar.<anonymous> (LalaTopBar.kt:33)"

    const v2, -0x7f8bbe27

    invoke-static {v2, p3, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 34
    :cond_1
    sget-object v0, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaTopBarKt;->INSTANCE:Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaTopBarKt;

    invoke-virtual {v0}, Lcom/hardlineforge/lala/ui/screens/ComposableSingletons$LalaTopBarKt;->getLambda$-590632996$app_debug()Lkotlin/jvm/functions/Function2;

    move-result-object v6

    const/high16 v8, 0x30000

    const/16 v9, 0x1e

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v7, p2

    .end local p0    # "$onSearchClick":Lkotlin/jvm/functions/Function0;
    .end local p2    # "$composer":Landroidx/compose/runtime/Composer;
    .local v1, "$onSearchClick":Lkotlin/jvm/functions/Function0;
    .local v7, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v1 .. v9}, Landroidx/compose/material3/IconButtonKt;->IconButton(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLandroidx/compose/material3/IconButtonColors;Landroidx/compose/foundation/interaction/MutableInteractionSource;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p0

    if-eqz p0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    .line 33
    .end local v1    # "$onSearchClick":Lkotlin/jvm/functions/Function0;
    .end local v7    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local p0    # "$onSearchClick":Lkotlin/jvm/functions/Function0;
    .restart local p2    # "$composer":Landroidx/compose/runtime/Composer;
    :cond_2
    move-object v1, p0

    move-object v7, p2

    .end local p0    # "$onSearchClick":Lkotlin/jvm/functions/Function0;
    .end local p2    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v1    # "$onSearchClick":Lkotlin/jvm/functions/Function0;
    .restart local v7    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 37
    :cond_3
    :goto_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method static final LalaTopBar$lambda$3(Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;ZIILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 8

    or-int/lit8 v0, p4, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v7, p5

    move-object v5, p6

    invoke-static/range {v1 .. v7}, Lcom/hardlineforge/lala/ui/screens/LalaTopBarKt;->LalaTopBar(Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;ZLandroidx/compose/runtime/Composer;II)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method
