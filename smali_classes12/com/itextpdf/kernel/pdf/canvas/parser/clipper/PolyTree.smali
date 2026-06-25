.class public Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;
.super Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;
.source "PolyTree.java"


# instance fields
.field private final allPolys:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 37
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;-><init>()V

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;->allPolys:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public Clear()V
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;->allPolys:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 42
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;->childs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 43
    return-void
.end method

.method public getAllPolys()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;",
            ">;"
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;->allPolys:Ljava/util/List;

    return-object v0
.end method

.method public getFirst()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;
    .locals 2

    .line 50
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;->childs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;->childs:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    return-object v0

    .line 54
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTotalSize()I
    .locals 4

    .line 59
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;->allPolys:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 61
    .local v0, "result":I
    if-lez v0, :cond_0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;->childs:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;->allPolys:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-eq v1, v2, :cond_0

    .line 62
    add-int/lit8 v0, v0, -0x1

    .line 64
    :cond_0
    return v0
.end method
