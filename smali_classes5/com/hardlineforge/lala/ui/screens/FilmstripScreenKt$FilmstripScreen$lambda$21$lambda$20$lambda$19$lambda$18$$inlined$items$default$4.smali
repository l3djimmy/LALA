.class public final Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$lambda$21$lambda$20$lambda$19$lambda$18$$inlined$items$default$4;
.super Lkotlin/jvm/internal/Lambda;
.source "LazyDsl.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function4;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt;->FilmstripScreen(Landroidx/navigation/NavHostController;Ljava/lang/String;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V
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
    value = "SMAP\nLazyDsl.kt\nKotlin\n*S Kotlin\n*F\n+ 1 LazyDsl.kt\nandroidx/compose/foundation/lazy/LazyDslKt$items$4\n+ 2 FilmstripScreen.kt\ncom/hardlineforge/lala/ui/screens/FilmstripScreenKt\n+ 3 Composer.kt\nandroidx/compose/runtime/ComposerKt\n*L\n1#1,180:1\n108#2,3:181\n112#2:190\n1247#3,6:184\n*S KotlinDebug\n*F\n+ 1 FilmstripScreen.kt\ncom/hardlineforge/lala/ui/screens/FilmstripScreenKt\n*L\n110#1:184,6\n*E\n"
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

.field final synthetic $selectedFrame$delegate$inlined:Landroidx/compose/runtime/MutableState;


# direct methods
.method public constructor <init>(Ljava/util/List;Landroidx/compose/runtime/MutableState;)V
    .locals 0

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$lambda$21$lambda$20$lambda$19$lambda$18$$inlined$items$default$4;->$items:Ljava/util/List;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$lambda$21$lambda$20$lambda$19$lambda$18$$inlined$items$default$4;->$selectedFrame$delegate$inlined:Landroidx/compose/runtime/MutableState;

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

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$lambda$21$lambda$20$lambda$19$lambda$18$$inlined$items$default$4;->invoke(Landroidx/compose/foundation/lazy/LazyItemScope;ILandroidx/compose/runtime/Composer;I)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke(Landroidx/compose/foundation/lazy/LazyItemScope;ILandroidx/compose/runtime/Composer;I)V
    .locals 16
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

    if-eq v5, v6, :cond_4

    const/4 v5, 0x1

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

    const v7, -0x25b7f321

    invoke-static {v7, v3, v5, v6}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    :cond_5
    iget-object v5, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$lambda$21$lambda$20$lambda$19$lambda$18$$inlined$items$default$4;->$items:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    and-int/lit8 v6, v3, 0xe

    .local v6, "$changed\\1":I
    check-cast v5, Lcom/hardlineforge/lala/data/VideoFrame;

    .local v5, "frame\\1":Lcom/hardlineforge/lala/data/VideoFrame;
    move-object/from16 v7, p1

    .local v7, "$this$FilmstripScreen_u24lambda_u2421_u24lambda_u2420_u24lambda_u2419_u24lambda_u2418_u24lambda_u2417\\1":Landroidx/compose/foundation/lazy/LazyItemScope;
    move-object/from16 v8, p3

    .local v8, "$composer\\1":Landroidx/compose/runtime/Composer;
    const/4 v9, 0x0

    .line 181
    .local v9, "$i$a$-items$default-FilmstripScreenKt$FilmstripScreen$3$1$2$1$2\\1\\179\\0":I
    const v10, -0x63c92817

    invoke-interface {v8, v10}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v10, "C*109@4253L25,107@4156L148:FilmstripScreen.kt#4cebsy"

    invoke-static {v8, v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 182
    nop

    .line 183
    const v10, -0x34c46101    # -1.2295935E7f

    const-string v11, "CC(remember):FilmstripScreen.kt#9igjgp"

    invoke-static {v8, v10, v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v8, v5}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v10

    .local v10, "invalid\\2":Z
    move-object v11, v8

    .local v11, "$this$cache\\2":Landroidx/compose/runtime/Composer;
    const/4 v12, 0x0

    .line 184
    .local v12, "$i$f$cache\\2\\183":I
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v13

    .local v13, "it\\2":Ljava/lang/Object;
    const/4 v14, 0x0

    .line 185
    .local v14, "$i$a$-let-ComposerKt$cache$1\\3\\184\\2":I
    if-nez v10, :cond_7

    sget-object v15, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v15}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v15

    if-ne v13, v15, :cond_6

    goto :goto_4

    .line 189
    :cond_6
    goto :goto_5

    .line 186
    :cond_7
    :goto_4
    const/4 v15, 0x0

    .line 183
    .local v15, "$i$a$-cache-FilmstripScreenKt$FilmstripScreen$3$1$2$1$2$1\\4\\186\\1":I
    new-instance v1, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$3$1$2$1$2$1$1;

    iget-object v2, v0, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$lambda$21$lambda$20$lambda$19$lambda$18$$inlined$items$default$4;->$selectedFrame$delegate$inlined:Landroidx/compose/runtime/MutableState;

    invoke-direct {v1, v5, v2}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt$FilmstripScreen$3$1$2$1$2$1$1;-><init>(Lcom/hardlineforge/lala/data/VideoFrame;Landroidx/compose/runtime/MutableState;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    .line 186
    .end local v15    # "$i$a$-cache-FilmstripScreenKt$FilmstripScreen$3$1$2$1$2$1\\4\\186\\1":I
    nop

    .line 187
    .local v1, "value\\3":Ljava/lang/Object;
    invoke-interface {v11, v1}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 188
    move-object v13, v1

    .line 184
    .end local v1    # "value\\3":Ljava/lang/Object;
    .end local v13    # "it\\2":Ljava/lang/Object;
    .end local v14    # "$i$a$-let-ComposerKt$cache$1\\3\\184\\2":I
    :goto_5
    nop

    .line 183
    .end local v10    # "invalid\\2":Z
    .end local v11    # "$this$cache\\2":Landroidx/compose/runtime/Composer;
    .end local v12    # "$i$f$cache\\2\\183":I
    check-cast v13, Lkotlin/jvm/functions/Function0;

    invoke-static {v8}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    shr-int/lit8 v1, v6, 0x3

    and-int/lit8 v1, v1, 0xe

    .line 181
    invoke-static {v5, v13, v8, v1}, Lcom/hardlineforge/lala/ui/screens/FilmstripScreenKt;->access$FrameThumbnail(Lcom/hardlineforge/lala/data/VideoFrame;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;I)V

    invoke-interface {v8}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 190
    nop

    .line 179
    .end local v5    # "frame\\1":Lcom/hardlineforge/lala/data/VideoFrame;
    .end local v6    # "$changed\\1":I
    .end local v7    # "$this$FilmstripScreen_u24lambda_u2421_u24lambda_u2420_u24lambda_u2419_u24lambda_u2418_u24lambda_u2417\\1":Landroidx/compose/foundation/lazy/LazyItemScope;
    .end local v8    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .end local v9    # "$i$a$-items$default-FilmstripScreenKt$FilmstripScreen$3$1$2$1$2\\1\\179\\0":I
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_6

    :cond_8
    invoke-interface/range {p3 .. p3}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 180
    :cond_9
    :goto_6
    return-void
.end method
