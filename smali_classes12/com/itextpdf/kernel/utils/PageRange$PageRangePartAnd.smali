.class public Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAnd;
.super Ljava/lang/Object;
.source "PageRange.java"

# interfaces
.implements Lcom/itextpdf/kernel/utils/PageRange$IPageRangePart;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/utils/PageRange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PageRangePartAnd"
.end annotation


# instance fields
.field private final conditions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/utils/PageRange$IPageRangePart;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public varargs constructor <init>([Lcom/itextpdf/kernel/utils/PageRange$IPageRangePart;)V
    .locals 2
    .param p1, "conditions"    # [Lcom/itextpdf/kernel/utils/PageRange$IPageRangePart;

    .line 424
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 422
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAnd;->conditions:Ljava/util/List;

    .line 425
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAnd;->conditions:Ljava/util/List;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 426
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .line 455
    instance-of v0, p1, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAnd;

    if-nez v0, :cond_0

    .line 456
    const/4 v0, 0x0

    return v0

    .line 459
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAnd;

    .line 460
    .local v0, "other":Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAnd;
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAnd;->conditions:Ljava/util/List;

    iget-object v2, v0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAnd;->conditions:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public getAllPagesInRange(I)Ljava/util/List;
    .locals 4
    .param p1, "nbPages"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 430
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 431
    .local v0, "allPages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAnd;->conditions:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 432
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAnd;->conditions:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/utils/PageRange$IPageRangePart;

    invoke-interface {v1, p1}, Lcom/itextpdf/kernel/utils/PageRange$IPageRangePart;->getAllPagesInRange(I)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 434
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAnd;->conditions:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/utils/PageRange$IPageRangePart;

    .line 435
    .local v2, "cond":Lcom/itextpdf/kernel/utils/PageRange$IPageRangePart;
    invoke-interface {v2, p1}, Lcom/itextpdf/kernel/utils/PageRange$IPageRangePart;->getAllPagesInRange(I)Ljava/util/List;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->retainAll(Ljava/util/Collection;)Z

    .line 436
    .end local v2    # "cond":Lcom/itextpdf/kernel/utils/PageRange$IPageRangePart;
    goto :goto_0

    .line 437
    :cond_1
    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 468
    const/4 v0, 0x0

    .line 469
    .local v0, "hashCode":I
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAnd;->conditions:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/utils/PageRange$IPageRangePart;

    .line 470
    .local v2, "part":Lcom/itextpdf/kernel/utils/PageRange$IPageRangePart;
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int/2addr v0, v3

    .line 471
    .end local v2    # "part":Lcom/itextpdf/kernel/utils/PageRange$IPageRangePart;
    goto :goto_0

    .line 473
    :cond_0
    return v0
.end method

.method public isPageInRange(I)Z
    .locals 3
    .param p1, "pageNumber"    # I

    .line 442
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAnd;->conditions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/utils/PageRange$IPageRangePart;

    .line 443
    .local v1, "cond":Lcom/itextpdf/kernel/utils/PageRange$IPageRangePart;
    invoke-interface {v1, p1}, Lcom/itextpdf/kernel/utils/PageRange$IPageRangePart;->isPageInRange(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 444
    const/4 v0, 0x0

    return v0

    .line 446
    .end local v1    # "cond":Lcom/itextpdf/kernel/utils/PageRange$IPageRangePart;
    :cond_0
    goto :goto_0

    .line 447
    :cond_1
    const/4 v0, 0x1

    return v0
.end method
