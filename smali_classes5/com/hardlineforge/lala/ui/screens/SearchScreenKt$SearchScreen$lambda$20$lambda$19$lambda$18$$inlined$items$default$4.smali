.class public final Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$lambda$20$lambda$19$lambda$18$$inlined$items$default$4;
.super Lkotlin/jvm/internal/Lambda;
.source "LazyDsl.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function4;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/ui/screens/SearchScreenKt;->SearchScreen(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function4<",
        "Landroidx/compose/foundation/lazy/LazyItemScope;",
        "Ljava/lang/Integer;",
        "Landroidx/compose/runtime/Composer;",
        "Ljava/lang/Integer;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nLazyDsl.kt\nKotlin\n*S Kotlin\n*F\n+ 1 LazyDsl.kt\nandroidx/compose/foundation/lazy/LazyDslKt$items$4\n+ 2 SearchScreen.kt\ncom/hardlineforge/lala/ui/screens/SearchScreenKt\n+ 3 Composer.kt\nandroidx/compose/runtime/ComposerKt\n*L\n1#1,180:1\n61#2,4:181\n65#2,2:191\n80#2:193\n1247#3,6:185\n*S KotlinDebug\n*F\n+ 1 SearchScreen.kt\ncom/hardlineforge/lala/ui/screens/SearchScreenKt\n*L\n64#1:185,6\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\u0010\u0000\u001a\u00020\u0001\"\u0004\u0008\u0000\u0010\u0002*\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u000b\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "<anonymous>",
        "",
        "T",
        "Landroidx/compose/foundation/lazy/LazyItemScope;",
        "it",
        "",
        "invoke",
        "(Landroidx/compose/foundation/lazy/LazyItemScope;ILandroidx/compose/runtime/Composer;I)V",
        "androidx/compose/foundation/lazy/LazyDslKt$items$4"
    }
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $items:Ljava/util/List;

.field final synthetic $navController$inlined:Landroidx/navigation/NavHostController;


# direct methods
.method public constructor <init>(Ljava/util/List;Landroidx/navigation/NavHostController;)V
    .locals 0

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$lambda$20$lambda$19$lambda$18$$inlined$items$default$4;->$items:Ljava/util/List;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$lambda$20$lambda$19$lambda$18$$inlined$items$default$4;->$navController$inlined:Landroidx/navigation/NavHostController;

    const/4 p2, 0x4

    invoke-direct {p0, p2}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "p1"    # Ljava/lang/Object;
    .param p2, "p2"    # Ljava/lang/Object;
    .param p3, "p3"    # Ljava/lang/Object;
    .param p4, "p4"    # Ljava/lang/Object;

    .line 178
    move-object v0, p1

    check-cast v0, Landroidx/compose/foundation/lazy/LazyItemScope;

    move-object v1, p2

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    move-object v2, p3

    check-cast v2, Landroidx/compose/runtime/Composer;

    move-object v3, p4

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$lambda$20$lambda$19$lambda$18$$inlined$items$default$4;->invoke(Landroidx/compose/foundation/lazy/LazyItemScope;ILandroidx/compose/runtime/Composer;I)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke(Landroidx/compose/foundation/lazy/LazyItemScope;ILandroidx/compose/runtime/Composer;I)V
    .locals 26
    .param p1, "$this$items"    # Landroidx/compose/foundation/lazy/LazyItemScope;
    .param p2, "it"    # I
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    move-object/from16 v0, p0

    move/from16 v1, p2

    move-object/from16 v2, p3

    const-string v3, "C178@8826L22:LazyDsl.kt#428nma"

    invoke-static {v2, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v3, p4

    .local v3, "$dirty":I
    and-int/lit8 v4, p4, 0x6

    if-nez v4, :cond_1

    move-object/from16 v4, p1

    invoke-interface {v2, v4}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :cond_0
    const/4 v5, 0x2

    :goto_0
    or-int/2addr v3, v5

    goto :goto_1

    :cond_1
    move-object/from16 v4, p1

    :goto_1
    and-int/lit8 v5, p4, 0x30

    if-nez v5, :cond_3

    invoke-interface {v2, v1}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v5

    if-eqz v5, :cond_2

    const/16 v5, 0x20

    goto :goto_2

    :cond_2
    const/16 v5, 0x10

    :goto_2
    or-int/2addr v3, v5

    .line 179
    :cond_3
    and-int/lit16 v5, v3, 0x93

    const/16 v6, 0x92

    const/4 v7, 0x1

    if-eq v5, v6, :cond_4

    move v5, v7

    goto :goto_3

    :cond_4
    const/4 v5, 0x0

    :goto_3
    and-int/lit8 v6, v3, 0x1

    invoke-interface {v2, v5, v6}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v5

    if-eqz v5, :cond_8

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v5

    if-eqz v5, :cond_5

    const/4 v5, -0x1

    const-string v6, "androidx.compose.foundation.lazy.items.<anonymous> (LazyDsl.kt:178)"

    const v8, -0x25b7f321

    invoke-static {v8, v3, v5, v6}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    :cond_5
    iget-object v5, v0, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$lambda$20$lambda$19$lambda$18$$inlined$items$default$4;->$items:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    and-int/lit8 v6, v3, 0xe

    .local v6, "$changed\\1":I
    check-cast v5, Lcom/hardlineforge/lala/data/LogEntry;

    .local v5, "entry\\1":Lcom/hardlineforge/lala/data/LogEntry;
    move-object/from16 v8, p1

    .local v8, "$this$SearchScreen_u24lambda_u2420_u24lambda_u2419_u24lambda_u2418_u24lambda_u2417\\1":Landroidx/compose/foundation/lazy/LazyItemScope;
    move-object/from16 v15, p3

    .local v15, "$composer\\1":Landroidx/compose/runtime/Composer;
    const/16 v18, 0x0

    .line 181
    .local v18, "$i$a$-items$default-SearchScreenKt$SearchScreen$3$1$1$2\\1\\179\\0":I
    const v9, -0xbda4293

    invoke-interface {v15, v9}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v9, "C*63@2520L54,64@2618L6,65@2649L577,60@2399L827:SearchScreen.kt#4cebsy"

    invoke-static {v15, v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 182
    sget-object v9, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v9, Landroidx/compose/ui/Modifier;

    .line 183
    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static {v9, v10, v7, v11}, Landroidx/compose/foundation/layout/SizeKt;->fillMaxWidth$default(Landroidx/compose/ui/Modifier;FILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v19

    .line 184
    const v9, -0x1928068f

    const-string v10, "CC(remember):SearchScreen.kt#9igjgp"

    invoke-static {v15, v9, v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    iget-object v9, v0, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$lambda$20$lambda$19$lambda$18$$inlined$items$default$4;->$navController$inlined:Landroidx/navigation/NavHostController;

    invoke-interface {v15, v9}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v9

    invoke-interface {v15, v5}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v10

    or-int/2addr v9, v10

    .local v9, "invalid\\2":Z
    move-object v10, v15

    .local v10, "$this$cache\\2":Landroidx/compose/runtime/Composer;
    const/4 v11, 0x0

    .line 185
    .local v11, "$i$f$cache\\2\\184":I
    invoke-interface {v10}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v12

    .local v12, "it\\2":Ljava/lang/Object;
    const/4 v13, 0x0

    .line 186
    .local v13, "$i$a$-let-ComposerKt$cache$1\\3\\185\\2":I
    if-nez v9, :cond_7

    sget-object v14, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v14}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v14

    if-ne v12, v14, :cond_6

    goto :goto_4

    .line 190
    :cond_6
    goto :goto_5

    .line 187
    :cond_7
    :goto_4
    const/4 v14, 0x0

    .line 184
    .local v14, "$i$a$-cache-SearchScreenKt$SearchScreen$3$1$1$2$1\\4\\187\\1":I
    new-instance v7, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$3$1$1$2$1$1;

    iget-object v1, v0, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$lambda$20$lambda$19$lambda$18$$inlined$items$default$4;->$navController$inlined:Landroidx/navigation/NavHostController;

    invoke-direct {v7, v1, v5}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$3$1$1$2$1$1;-><init>(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/data/LogEntry;)V

    check-cast v7, Lkotlin/jvm/functions/Function0;

    .line 187
    .end local v14    # "$i$a$-cache-SearchScreenKt$SearchScreen$3$1$1$2$1\\4\\187\\1":I
    nop

    .line 188
    .local v7, "value\\3":Ljava/lang/Object;
    invoke-interface {v10, v7}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 189
    move-object v12, v7

    .line 185
    .end local v7    # "value\\3":Ljava/lang/Object;
    .end local v12    # "it\\2":Ljava/lang/Object;
    .end local v13    # "$i$a$-let-ComposerKt$cache$1\\3\\185\\2":I
    :goto_5
    nop

    .line 184
    .end local v9    # "invalid\\2":Z
    .end local v10    # "$this$cache\\2":Landroidx/compose/runtime/Composer;
    .end local v11    # "$i$f$cache\\2\\184":I
    move-object/from16 v23, v12

    check-cast v23, Lkotlin/jvm/functions/Function0;

    invoke-static {v15}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    const/16 v24, 0x7

    const/16 v25, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    invoke-static/range {v19 .. v25}, Landroidx/compose/foundation/ClickableKt;->clickable-XHw0xAI$default(Landroidx/compose/ui/Modifier;ZLjava/lang/String;Landroidx/compose/ui/semantics/Role;Lkotlin/jvm/functions/Function0;ILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v9

    .line 191
    sget-object v1, Landroidx/compose/material3/MaterialTheme;->INSTANCE:Landroidx/compose/material3/MaterialTheme;

    sget v7, Landroidx/compose/material3/MaterialTheme;->$stable:I

    invoke-virtual {v1, v15, v7}, Landroidx/compose/material3/MaterialTheme;->getShapes(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material3/Shapes;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/compose/material3/Shapes;->getLarge()Landroidx/compose/foundation/shape/CornerBasedShape;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Landroidx/compose/ui/graphics/Shape;

    .line 192
    new-instance v1, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$3$1$1$2$2;

    invoke-direct {v1, v5}, Lcom/hardlineforge/lala/ui/screens/SearchScreenKt$SearchScreen$3$1$1$2$2;-><init>(Lcom/hardlineforge/lala/data/LogEntry;)V

    const/16 v7, 0x36

    const v11, 0x2dc80d49

    const/4 v12, 0x1

    invoke-static {v11, v12, v1, v15, v7}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Lkotlin/jvm/functions/Function3;

    .line 181
    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/high16 v16, 0x30000

    const/16 v17, 0x1c

    invoke-static/range {v9 .. v17}, Landroidx/compose/material3/CardKt;->Card(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/graphics/Shape;Landroidx/compose/material3/CardColors;Landroidx/compose/material3/CardElevation;Landroidx/compose/foundation/BorderStroke;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V

    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 193
    nop

    .line 179
    .end local v5    # "entry\\1":Lcom/hardlineforge/lala/data/LogEntry;
    .end local v6    # "$changed\\1":I
    .end local v8    # "$this$SearchScreen_u24lambda_u2420_u24lambda_u2419_u24lambda_u2418_u24lambda_u2417\\1":Landroidx/compose/foundation/lazy/LazyItemScope;
    .end local v15    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .end local v18    # "$i$a$-items$default-SearchScreenKt$SearchScreen$3$1$1$2\\1\\179\\0":I
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_6

    :cond_8
    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 180
    :cond_9
    :goto_6
    return-void
.end method
