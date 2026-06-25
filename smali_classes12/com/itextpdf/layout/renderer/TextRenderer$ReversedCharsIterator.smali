.class Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;
.super Ljava/lang/Object;
.source "TextRenderer.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/TextRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ReversedCharsIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;",
        ">;"
    }
.end annotation


# instance fields
.field private currentInd:I

.field private outEnd:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private outStart:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private reversed:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private useReversed:Z


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/itextpdf/io/font/otf/GlyphLine;)V
    .locals 7
    .param p2, "line"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[I>;",
            "Lcom/itextpdf/io/font/otf/GlyphLine;",
            ")V"
        }
    .end annotation

    .line 1798
    .local p1, "reversedRange":Ljava/util/List;, "Ljava/util/List<[I>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1795
    const/4 v0, 0x0

    .line 1828
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 1795
    iput v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->currentInd:I

    .line 1799
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->outStart:Ljava/util/List;

    .line 1800
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->outEnd:Ljava/util/List;

    .line 1801
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->reversed:Ljava/util/List;

    .line 1802
    if-eqz p1, :cond_4

    .line 1803
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [I

    aget v2, v2, v0

    if-lez v2, :cond_0

    .line 1804
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->outStart:Ljava/util/List;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1805
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->outEnd:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    aget v3, v3, v0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1806
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->reversed:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1808
    :cond_0
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ge v2, v3, :cond_2

    .line 1809
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    .line 1810
    .local v3, "range":[I
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->outStart:Ljava/util/List;

    aget v6, v3, v0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1811
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->outEnd:Ljava/util/List;

    aget v6, v3, v4

    add-int/2addr v6, v4

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1812
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->reversed:Ljava/util/List;

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1813
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    sub-int/2addr v5, v4

    if-eq v2, v5, :cond_1

    .line 1814
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->outStart:Ljava/util/List;

    aget v6, v3, v4

    add-int/2addr v6, v4

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1815
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->outEnd:Ljava/util/List;

    add-int/lit8 v5, v2, 0x1

    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [I

    aget v5, v5, v0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1816
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->reversed:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1808
    .end local v3    # "range":[I
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1819
    .end local v2    # "i":I
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    sub-int/2addr v0, v4

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    aget v0, v0, v4

    .line 1820
    .local v0, "lastIndex":I
    invoke-virtual {p2}, Lcom/itextpdf/io/font/otf/GlyphLine;->size()I

    move-result v2

    sub-int/2addr v2, v4

    if-ge v0, v2, :cond_3

    .line 1821
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->outStart:Ljava/util/List;

    add-int/lit8 v3, v0, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1822
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->outEnd:Ljava/util/List;

    invoke-virtual {p2}, Lcom/itextpdf/io/font/otf/GlyphLine;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1823
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->reversed:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1825
    .end local v0    # "lastIndex":I
    :cond_3
    goto :goto_1

    .line 1826
    :cond_4
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->outStart:Ljava/util/List;

    iget v2, p2, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1827
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->outEnd:Ljava/util/List;

    iget v2, p2, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1828
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->reversed:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1830
    :goto_1
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 1839
    iget v0, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->currentInd:I

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->outStart:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public next()Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;
    .locals 4

    .line 1844
    new-instance v0, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->outStart:Ljava/util/List;

    iget v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->currentInd:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->outEnd:Ljava/util/List;

    iget v3, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->currentInd:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;-><init>(II)V

    iget-boolean v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->useReversed:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->reversed:Ljava/util/List;

    iget v3, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->currentInd:I

    .line 1845
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->setReversed(Z)Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;

    move-result-object v0

    .line 1846
    .local v0, "part":Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;
    iget v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->currentInd:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->currentInd:I

    .line 1847
    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 1791
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->next()Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .line 1852
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Operation not supported"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setUseReversed(Z)Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;
    .locals 0
    .param p1, "useReversed"    # Z

    .line 1833
    iput-boolean p1, p0, Lcom/itextpdf/layout/renderer/TextRenderer$ReversedCharsIterator;->useReversed:Z

    .line 1834
    return-object p0
.end method
