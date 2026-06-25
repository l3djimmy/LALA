.class public Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;
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
    name = "PageRangePartOddEven"
.end annotation


# static fields
.field public static final EVEN:Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;

.field public static final ODD:Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;


# instance fields
.field private final isOdd:Z

.field private final mod:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 364
    new-instance v0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;-><init>(Z)V

    sput-object v0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;->ODD:Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;

    .line 365
    new-instance v0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;-><init>(Z)V

    sput-object v0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;->EVEN:Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1
    .param p1, "isOdd"    # Z

    .line 367
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 368
    iput-boolean p1, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;->isOdd:Z

    .line 369
    if-eqz p1, :cond_0

    .line 370
    const/4 v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;->mod:I

    goto :goto_0

    .line 372
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;->mod:I

    .line 374
    :goto_0
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .line 395
    instance-of v0, p1, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 396
    return v1

    .line 399
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;

    .line 400
    .local v0, "other":Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;
    iget-boolean v2, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;->isOdd:Z

    iget-boolean v3, v0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;->isOdd:Z

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

    .line 378
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 379
    .local v0, "allPages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget v1, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;->mod:I

    if-nez v1, :cond_0

    const/4 v1, 0x2

    goto :goto_0

    :cond_0
    iget v1, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;->mod:I

    .local v1, "pageInRange":I
    :goto_0
    if-gt v1, p1, :cond_1

    .line 380
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 379
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 382
    .end local v1    # "pageInRange":I
    :cond_1
    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 408
    iget-boolean v0, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;->isOdd:Z

    if-eqz v0, :cond_0

    .line 409
    const/16 v0, 0x7f

    return v0

    .line 411
    :cond_0
    const/16 v0, 0x80

    return v0
.end method

.method public isPageInRange(I)Z
    .locals 2
    .param p1, "pageNumber"    # I

    .line 387
    rem-int/lit8 v0, p1, 0x2

    iget v1, p0, Lcom/itextpdf/kernel/utils/PageRange$PageRangePartOddEven;->mod:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
