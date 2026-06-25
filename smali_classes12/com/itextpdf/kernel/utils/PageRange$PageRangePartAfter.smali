.class public Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAfter;
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
    name = "PageRangePartAfter"
.end annotation


# instance fields
.field private final start:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "start"    # I

    .line 315
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 316
    iput p1, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAfter;->start:I

    .line 317
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .line 338
    instance-of v0, p1, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAfter;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 339
    return v1

    .line 342
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAfter;

    .line 343
    .local v0, "other":Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAfter;
    iget v2, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAfter;->start:I

    iget v3, v0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAfter;->start:I

    if-ne v2, v3, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public getAllPagesInRange(I)Ljava/util/List;
    .locals 3
    .param p1, "nbPages"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 321
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 322
    .local v0, "allPages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget v1, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAfter;->start:I

    .local v1, "pageInRange":I
    :goto_0
    if-gt v1, p1, :cond_0

    .line 323
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 322
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 325
    .end local v1    # "pageInRange":I
    :cond_0
    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 351
    iget v0, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAfter;->start:I

    mul-int/lit8 v0, v0, 0x1f

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public isPageInRange(I)Z
    .locals 1
    .param p1, "pageNumber"    # I

    .line 330
    iget v0, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartAfter;->start:I

    if-gt v0, p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
