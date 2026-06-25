.class Lcom/itextpdf/kernel/pdf/canvas/parser/listener/DefaultTextChunkLocationComparator;
.super Ljava/lang/Object;
.source "DefaultTextChunkLocationComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;",
        ">;"
    }
.end annotation


# instance fields
.field private leftToRight:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/DefaultTextChunkLocationComparator;-><init>(Z)V

    .line 32
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1
    .param p1, "leftToRight"    # Z

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/DefaultTextChunkLocationComparator;->leftToRight:Z

    .line 35
    iput-boolean p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/DefaultTextChunkLocationComparator;->leftToRight:Z

    .line 36
    return-void
.end method


# virtual methods
.method public compare(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;)I
    .locals 4
    .param p1, "first"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;
    .param p2, "second"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    .line 41
    if-ne p1, p2, :cond_0

    const/4 v0, 0x0

    return v0

    .line 44
    :cond_0
    invoke-interface {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->orientationMagnitude()I

    move-result v0

    invoke-interface {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->orientationMagnitude()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Integer;->compare(II)I

    move-result v0

    .line 45
    .local v0, "result":I
    if-eqz v0, :cond_1

    .line 46
    return v0

    .line 49
    :cond_1
    invoke-interface {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->distPerpendicular()I

    move-result v1

    invoke-interface {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->distPerpendicular()I

    move-result v2

    sub-int/2addr v1, v2

    .line 50
    .local v1, "distPerpendicularDiff":I
    if-eqz v1, :cond_2

    .line 51
    return v1

    .line 54
    :cond_2
    iget-boolean v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/DefaultTextChunkLocationComparator;->leftToRight:Z

    if-eqz v2, :cond_3

    invoke-interface {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->distParallelStart()F

    move-result v2

    invoke-interface {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->distParallelStart()F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    goto :goto_0

    .line 55
    :cond_3
    invoke-interface {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->distParallelEnd()F

    move-result v2

    invoke-interface {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->distParallelEnd()F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Float;->compare(FF)I

    move-result v2

    neg-int v2, v2

    .line 54
    :goto_0
    return v2
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 27
    check-cast p1, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    check-cast p2, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/DefaultTextChunkLocationComparator;->compare(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;)I

    move-result p1

    return p1
.end method
