.class public Lcom/itextpdf/layout/layout/LayoutArea;
.super Ljava/lang/Object;
.source "LayoutArea.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field protected bBox:Lcom/itextpdf/kernel/geom/Rectangle;

.field protected pageNumber:I


# direct methods
.method public constructor <init>(ILcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 0
    .param p1, "pageNumber"    # I
    .param p2, "bBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput p1, p0, Lcom/itextpdf/layout/layout/LayoutArea;->pageNumber:I

    .line 51
    iput-object p2, p0, Lcom/itextpdf/layout/layout/LayoutArea;->bBox:Lcom/itextpdf/kernel/geom/Rectangle;

    .line 52
    return-void
.end method


# virtual methods
.method public clone()Lcom/itextpdf/layout/layout/LayoutArea;
    .locals 2

    .line 90
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/layout/LayoutArea;

    .line 92
    .local v0, "clone":Lcom/itextpdf/layout/layout/LayoutArea;
    iget-object v1, p0, Lcom/itextpdf/layout/layout/LayoutArea;->bBox:Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    iput-object v1, v0, Lcom/itextpdf/layout/layout/LayoutArea;->bBox:Lcom/itextpdf/kernel/geom/Rectangle;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    return-object v0

    .line 94
    .end local v0    # "clone":Lcom/itextpdf/layout/layout/LayoutArea;
    :catch_0
    move-exception v0

    .line 96
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    const/4 v1, 0x0

    return-object v1
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 32
    invoke-virtual {p0}, Lcom/itextpdf/layout/layout/LayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .line 105
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    .line 106
    return v2

    .line 108
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/layout/layout/LayoutArea;

    .line 109
    .local v0, "that":Lcom/itextpdf/layout/layout/LayoutArea;
    iget v1, p0, Lcom/itextpdf/layout/layout/LayoutArea;->pageNumber:I

    iget v3, v0, Lcom/itextpdf/layout/layout/LayoutArea;->pageNumber:I

    if-ne v1, v3, :cond_1

    iget-object v1, p0, Lcom/itextpdf/layout/layout/LayoutArea;->bBox:Lcom/itextpdf/kernel/geom/Rectangle;

    iget-object v3, v0, Lcom/itextpdf/layout/layout/LayoutArea;->bBox:Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/geom/Rectangle;->equalsWithEpsilon(Lcom/itextpdf/kernel/geom/Rectangle;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v2, 0x1

    :cond_1
    return v2
.end method

.method public getBBox()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/itextpdf/layout/layout/LayoutArea;->bBox:Lcom/itextpdf/kernel/geom/Rectangle;

    return-object v0
.end method

.method public getPageNumber()I
    .locals 1

    .line 60
    iget v0, p0, Lcom/itextpdf/layout/layout/LayoutArea;->pageNumber:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 117
    new-instance v0, Lcom/itextpdf/io/util/HashCode;

    invoke-direct {v0}, Lcom/itextpdf/io/util/HashCode;-><init>()V

    .line 118
    .local v0, "hashCode":Lcom/itextpdf/io/util/HashCode;
    iget v1, p0, Lcom/itextpdf/layout/layout/LayoutArea;->pageNumber:I

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/util/HashCode;->append(I)Lcom/itextpdf/io/util/HashCode;

    move-result-object v1

    iget-object v2, p0, Lcom/itextpdf/layout/layout/LayoutArea;->bBox:Lcom/itextpdf/kernel/geom/Rectangle;

    .line 119
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/util/HashCode;->append(I)Lcom/itextpdf/io/util/HashCode;

    .line 120
    invoke-virtual {v0}, Lcom/itextpdf/io/util/HashCode;->hashCode()I

    move-result v1

    return v1
.end method

.method public setBBox(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 0
    .param p1, "bbox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 78
    iput-object p1, p0, Lcom/itextpdf/layout/layout/LayoutArea;->bBox:Lcom/itextpdf/kernel/geom/Rectangle;

    .line 79
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 128
    iget-object v0, p0, Lcom/itextpdf/layout/layout/LayoutArea;->bBox:Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->toString()Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/layout/layout/LayoutArea;->pageNumber:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    const-string/jumbo v1, "{0}, page {1}"

    invoke-static {v1, v0}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
