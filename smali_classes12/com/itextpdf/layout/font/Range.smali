.class public Lcom/itextpdf/layout/font/Range;
.super Ljava/lang/Object;
.source "Range.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/font/Range$FullRange;,
        Lcom/itextpdf/layout/font/Range$SubRange;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private ranges:[Lcom/itextpdf/layout/font/Range$SubRange;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 39
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/layout/font/Range$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/layout/font/Range$1;

    .line 39
    invoke-direct {p0}, Lcom/itextpdf/layout/font/Range;-><init>()V

    return-void
.end method

.method constructor <init>(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/font/Range$SubRange;",
            ">;)V"
        }
    .end annotation

    .line 47
    .local p1, "ranges":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/font/Range$SubRange;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_0

    .line 51
    invoke-static {p1}, Lcom/itextpdf/layout/font/Range;->normalizeSubRanges(Ljava/util/List;)[Lcom/itextpdf/layout/font/Range$SubRange;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/font/Range;->ranges:[Lcom/itextpdf/layout/font/Range$SubRange;

    .line 52
    return-void

    .line 49
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Ranges shall not be empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static normalizeSubRanges(Ljava/util/List;)[Lcom/itextpdf/layout/font/Range$SubRange;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/font/Range$SubRange;",
            ">;)[",
            "Lcom/itextpdf/layout/font/Range$SubRange;"
        }
    .end annotation

    .line 103
    .local p0, "ranges":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/font/Range$SubRange;>;"
    invoke-static {p0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 104
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 106
    .local v0, "union":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/font/Range$SubRange;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_3

    .line 107
    const/4 v1, 0x0

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/font/Range$SubRange;

    .line 108
    .local v2, "curr":Lcom/itextpdf/layout/font/Range$SubRange;
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_2

    .line 110
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/font/Range$SubRange;

    .line 112
    .local v4, "next":Lcom/itextpdf/layout/font/Range$SubRange;
    iget v5, v4, Lcom/itextpdf/layout/font/Range$SubRange;->low:I

    iget v6, v2, Lcom/itextpdf/layout/font/Range$SubRange;->high:I

    if-gt v5, v6, :cond_0

    .line 114
    iget v5, v4, Lcom/itextpdf/layout/font/Range$SubRange;->high:I

    iget v6, v2, Lcom/itextpdf/layout/font/Range$SubRange;->high:I

    if-le v5, v6, :cond_1

    .line 115
    iget v5, v4, Lcom/itextpdf/layout/font/Range$SubRange;->high:I

    iput v5, v2, Lcom/itextpdf/layout/font/Range$SubRange;->high:I

    goto :goto_1

    .line 118
    :cond_0
    move-object v2, v4

    .line 119
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    .end local v4    # "next":Lcom/itextpdf/layout/font/Range$SubRange;
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 123
    .end local v3    # "i":I
    :cond_2
    new-array v1, v1, [Lcom/itextpdf/layout/font/Range$SubRange;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/itextpdf/layout/font/Range$SubRange;

    return-object v1

    .line 106
    .end local v2    # "curr":Lcom/itextpdf/layout/font/Range$SubRange;
    :cond_3
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method


# virtual methods
.method public contains(I)Z
    .locals 5
    .param p1, "n"    # I

    .line 61
    const/4 v0, 0x0

    .line 62
    .local v0, "low":I
    iget-object v1, p0, Lcom/itextpdf/layout/font/Range;->ranges:[Lcom/itextpdf/layout/font/Range$SubRange;

    array-length v1, v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    .line 64
    .local v1, "high":I
    :goto_0
    if-gt v0, v1, :cond_2

    .line 65
    add-int v3, v0, v1

    ushr-int/2addr v3, v2

    .line 66
    .local v3, "mid":I
    iget-object v4, p0, Lcom/itextpdf/layout/font/Range;->ranges:[Lcom/itextpdf/layout/font/Range$SubRange;

    aget-object v4, v4, v3

    invoke-virtual {v4, p1}, Lcom/itextpdf/layout/font/Range$SubRange;->compareTo(I)I

    move-result v4

    if-gez v4, :cond_0

    .line 67
    add-int/lit8 v0, v3, 0x1

    goto :goto_1

    .line 68
    :cond_0
    iget-object v4, p0, Lcom/itextpdf/layout/font/Range;->ranges:[Lcom/itextpdf/layout/font/Range$SubRange;

    aget-object v4, v4, v3

    invoke-virtual {v4, p1}, Lcom/itextpdf/layout/font/Range$SubRange;->compareTo(I)I

    move-result v4

    if-lez v4, :cond_1

    .line 69
    add-int/lit8 v1, v3, -0x1

    .line 72
    .end local v3    # "mid":I
    :goto_1
    goto :goto_0

    .line 71
    .restart local v3    # "mid":I
    :cond_1
    return v2

    .line 73
    .end local v3    # "mid":I
    :cond_2
    const/4 v2, 0x0

    return v2
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .line 78
    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    return v0

    .line 79
    :cond_0
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_1

    goto :goto_0

    .line 80
    :cond_1
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/layout/font/Range;

    .line 81
    .local v0, "range":Lcom/itextpdf/layout/font/Range;
    iget-object v1, p0, Lcom/itextpdf/layout/font/Range;->ranges:[Lcom/itextpdf/layout/font/Range$SubRange;

    iget-object v2, v0, Lcom/itextpdf/layout/font/Range;->ranges:[Lcom/itextpdf/layout/font/Range$SubRange;

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 79
    .end local v0    # "range":Lcom/itextpdf/layout/font/Range;
    :cond_2
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/itextpdf/layout/font/Range;->ranges:[Lcom/itextpdf/layout/font/Range$SubRange;

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/itextpdf/layout/font/Range;->ranges:[Lcom/itextpdf/layout/font/Range$SubRange;

    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
