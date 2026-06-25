.class public final Lcom/hardlineforge/lala/ui/screens/MediaGalleryScreenKt$MediaGalleryScreen$lambda$17$lambda$16$lambda$15$$inlined$items$default$5;
.super Lkotlin/jvm/internal/Lambda;
.source "LazyGridDsl.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function4;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/ui/screens/MediaGalleryScreenKt;->MediaGalleryScreen(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function4<",
        "Landroidx/compose/foundation/lazy/grid/LazyGridItemScope;",
        "Ljava/lang/Integer;",
        "Landroidx/compose/runtime/Composer;",
        "Ljava/lang/Integer;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nLazyGridDsl.kt\nKotlin\n*S Kotlin\n*F\n+ 1 LazyGridDsl.kt\nandroidx/compose/foundation/lazy/grid/LazyGridDslKt$items$5\n+ 2 MediaGalleryScreen.kt\ncom/hardlineforge/lala/ui/screens/MediaGalleryScreenKt\n*L\n1#1,544:1\n78#2,5:545\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\u0010\u0000\u001a\u00020\u0001\"\u0004\u0008\u0000\u0010\u0002*\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u000b\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "<anonymous>",
        "",
        "T",
        "Landroidx/compose/foundation/lazy/grid/LazyGridItemScope;",
        "it",
        "",
        "invoke",
        "(Landroidx/compose/foundation/lazy/grid/LazyGridItemScope;ILandroidx/compose/runtime/Composer;I)V",
        "androidx/compose/foundation/lazy/grid/LazyGridDslKt$items$5"
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

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/MediaGalleryScreenKt$MediaGalleryScreen$lambda$17$lambda$16$lambda$15$$inlined$items$default$5;->$items:Ljava/util/List;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/MediaGalleryScreenKt$MediaGalleryScreen$lambda$17$lambda$16$lambda$15$$inlined$items$default$5;->$navController$inlined:Landroidx/navigation/NavHostController;

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

    .line 542
    move-object v0, p1

    check-cast v0, Landroidx/compose/foundation/lazy/grid/LazyGridItemScope;

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

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/hardlineforge/lala/ui/screens/MediaGalleryScreenKt$MediaGalleryScreen$lambda$17$lambda$16$lambda$15$$inlined$items$default$5;->invoke(Landroidx/compose/foundation/lazy/grid/LazyGridItemScope;ILandroidx/compose/runtime/Composer;I)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke(Landroidx/compose/foundation/lazy/grid/LazyGridItemScope;ILandroidx/compose/runtime/Composer;I)V
    .locals 9
    .param p1, "$this$items"    # Landroidx/compose/foundation/lazy/grid/LazyGridItemScope;
    .param p2, "it"    # I
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    const-string v0, "C542@23993L22:LazyGridDsl.kt#7791vq"

    invoke-static {p3, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move v0, p4

    .local v0, "$dirty":I
    and-int/lit8 v1, p4, 0x6

    if-nez v1, :cond_1

    invoke-interface {p3, p1}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    :goto_0
    or-int/2addr v0, v1

    :cond_1
    and-int/lit8 v1, p4, 0x30

    if-nez v1, :cond_3

    invoke-interface {p3, p2}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x20

    goto :goto_1

    :cond_2
    const/16 v1, 0x10

    :goto_1
    or-int/2addr v0, v1

    .line 543
    :cond_3
    and-int/lit16 v1, v0, 0x93

    const/16 v2, 0x92

    const/4 v3, 0x0

    if-eq v1, v2, :cond_4

    const/4 v1, 0x1

    goto :goto_2

    :cond_4
    move v1, v3

    :goto_2
    and-int/lit8 v2, v0, 0x1

    invoke-interface {p3, v1, v2}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_5

    const/4 v1, -0x1

    const-string v2, "androidx.compose.foundation.lazy.grid.items.<anonymous> (LazyGridDsl.kt:542)"

    const v4, 0x29b3c0fe

    invoke-static {v4, v0, v1, v2}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    :cond_5
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/MediaGalleryScreenKt$MediaGalleryScreen$lambda$17$lambda$16$lambda$15$$inlined$items$default$5;->$items:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .local v1, "item\\1":Ljava/lang/Object;
    and-int/lit8 v2, v0, 0xe

    .local v2, "$changed\\1":I
    move-object v4, p1

    .local v4, "$this$MediaGalleryScreen_u24lambda_u2417_u24lambda_u2416_u24lambda_u2415_u24lambda_u2414\\1":Landroidx/compose/foundation/lazy/grid/LazyGridItemScope;
    move-object v5, p3

    .local v5, "$composer\\1":Landroidx/compose/runtime/Composer;
    const/4 v6, 0x0

    .line 545
    .local v6, "$i$a$-items$default-MediaGalleryScreenKt$MediaGalleryScreen$2$3$1$2\\1\\543\\0":I
    const v7, 0x23dc313c

    invoke-interface {v5, v7}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v7, "C:MediaGalleryScreen.kt#4cebsy"

    invoke-static {v5, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 546
    instance-of v7, v1, Lcom/hardlineforge/lala/data/Photo;

    if-eqz v7, :cond_6

    const v7, 0x11ac494f

    invoke-interface {v5, v7}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v7, "78@3213L28"

    invoke-static {v5, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move-object v7, v1

    check-cast v7, Lcom/hardlineforge/lala/data/Photo;

    invoke-static {v7, v5, v3}, Lcom/hardlineforge/lala/ui/screens/MediaGalleryScreenKt;->access$PhotoThumbnail(Lcom/hardlineforge/lala/data/Photo;Landroidx/compose/runtime/Composer;I)V

    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    goto :goto_4

    .line 547
    :cond_6
    instance-of v7, v1, Lcom/hardlineforge/lala/data/Video;

    if-eqz v7, :cond_7

    const v7, 0x11ac517e

    invoke-interface {v5, v7}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v7, "79@3278L43"

    invoke-static {v5, v7}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move-object v7, v1

    check-cast v7, Lcom/hardlineforge/lala/data/Video;

    iget-object v8, p0, Lcom/hardlineforge/lala/ui/screens/MediaGalleryScreenKt$MediaGalleryScreen$lambda$17$lambda$16$lambda$15$$inlined$items$default$5;->$navController$inlined:Landroidx/navigation/NavHostController;

    invoke-static {v7, v8, v5, v3}, Lcom/hardlineforge/lala/ui/screens/MediaGalleryScreenKt;->access$VideoThumbnail(Lcom/hardlineforge/lala/data/Video;Landroidx/navigation/NavHostController;Landroidx/compose/runtime/Composer;I)V

    goto :goto_3

    :cond_7
    const v3, 0x23ac36ef

    invoke-interface {v5, v3}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    :goto_3
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    :goto_4
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 549
    nop

    .line 543
    .end local v1    # "item\\1":Ljava/lang/Object;
    .end local v2    # "$changed\\1":I
    .end local v4    # "$this$MediaGalleryScreen_u24lambda_u2417_u24lambda_u2416_u24lambda_u2415_u24lambda_u2414\\1":Landroidx/compose/foundation/lazy/grid/LazyGridItemScope;
    .end local v5    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .end local v6    # "$i$a$-items$default-MediaGalleryScreenKt$MediaGalleryScreen$2$3$1$2\\1\\543\\0":I
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_5

    :cond_8
    invoke-interface {p3}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 544
    :cond_9
    :goto_5
    return-void
.end method
