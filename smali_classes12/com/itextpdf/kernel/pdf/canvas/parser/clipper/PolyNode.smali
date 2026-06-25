.class public Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;
.super Ljava/lang/Object;
.source "PolyNode.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode$NodeType;
    }
.end annotation


# instance fields
.field protected final childs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;",
            ">;"
        }
    .end annotation
.end field

.field private endType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

.field private index:I

.field private isOpen:Z

.field private joinType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

.field private parent:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

.field private final polygon:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->polygon:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->childs:Ljava/util/List;

    return-void
.end method

.method private getNextSiblingUp()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;
    .locals 3

    .line 91
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->parent:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    if-nez v0, :cond_0

    .line 92
    const/4 v0, 0x0

    return-object v0

    .line 94
    :cond_0
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->index:I

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->parent:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    iget-object v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->childs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .line 98
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->parent:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    .line 94
    if-ne v0, v1, :cond_1

    .line 95
    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->getNextSiblingUp()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    move-result-object v0

    return-object v0

    .line 98
    :cond_1
    iget-object v0, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->childs:Ljava/util/List;

    iget v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->index:I

    add-int/lit8 v1, v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    return-object v0
.end method

.method private isHoleNode()Z
    .locals 3

    .line 115
    const/4 v0, 0x1

    .line 116
    .local v0, "result":Z
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->parent:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    .line 117
    .local v1, "node":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;
    :goto_0
    if-eqz v1, :cond_1

    .line 118
    if-nez v0, :cond_0

    const/4 v2, 0x1

    goto :goto_1

    :cond_0
    const/4 v2, 0x0

    :goto_1
    move v0, v2

    .line 119
    iget-object v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->parent:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    goto :goto_0

    .line 121
    :cond_1
    return v0
.end method


# virtual methods
.method public addChild(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;)V
    .locals 2
    .param p1, "child"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    .line 55
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->childs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 56
    .local v0, "cnt":I
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->childs:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    iput-object p0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->parent:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    .line 58
    iput v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->index:I

    .line 59
    return-void
.end method

.method public getChildCount()I
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->childs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getChilds()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;",
            ">;"
        }
    .end annotation

    .line 66
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->childs:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getContour()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;",
            ">;"
        }
    .end annotation

    .line 70
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->polygon:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    return-object v0
.end method

.method public getEndType()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->endType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    return-object v0
.end method

.method public getJoinType()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->joinType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    return-object v0
.end method

.method public getNext()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;
    .locals 2

    .line 82
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->childs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->childs:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    return-object v0

    .line 86
    :cond_0
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->getNextSiblingUp()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    move-result-object v0

    return-object v0
.end method

.method public getParent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->parent:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    return-object v0
.end method

.method public getPolygon()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->polygon:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    return-object v0
.end method

.method public isHole()Z
    .locals 1

    .line 111
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->isHoleNode()Z

    move-result v0

    return v0
.end method

.method public isOpen()Z
    .locals 1

    .line 125
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->isOpen:Z

    return v0
.end method

.method public setEndType(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;)V
    .locals 0
    .param p1, "value"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    .line 129
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->endType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;

    .line 130
    return-void
.end method

.method public setJoinType(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;)V
    .locals 0
    .param p1, "value"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    .line 133
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->joinType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;

    .line 134
    return-void
.end method

.method public setOpen(Z)V
    .locals 0
    .param p1, "isOpen"    # Z

    .line 137
    iput-boolean p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->isOpen:Z

    .line 138
    return-void
.end method

.method public setParent(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;)V
    .locals 0
    .param p1, "n"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    .line 141
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->parent:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    .line 143
    return-void
.end method
