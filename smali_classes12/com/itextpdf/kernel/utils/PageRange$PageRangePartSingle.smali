.class public Lcom/itextpdf/kernel/utils/PageRange$PageRangePartSingle;
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
    name = "PageRangePartSingle"
.end annotation


# instance fields
.field private final page:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "page"    # I

    .line 217
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 218
    iput p1, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartSingle;->page:I

    .line 219
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .line 240
    instance-of v0, p1, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartSingle;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 241
    return v1

    .line 244
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartSingle;

    .line 245
    .local v0, "other":Lcom/itextpdf/kernel/utils/PageRange$PageRangePartSingle;
    iget v2, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartSingle;->page:I

    iget v3, v0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartSingle;->page:I

    if-ne v2, v3, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public getAllPagesInRange(I)Ljava/util/List;
    .locals 1
    .param p1, "nbPages"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 223
    iget v0, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartSingle;->page:I

    if-gt v0, p1, :cond_0

    .line 224
    iget v0, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartSingle;->page:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 226
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 253
    iget v0, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartSingle;->page:I

    return v0
.end method

.method public isPageInRange(I)Z
    .locals 1
    .param p1, "pageNumber"    # I

    .line 232
    iget v0, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartSingle;->page:I

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
