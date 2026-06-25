.class public Lcom/itextpdf/layout/layout/RootLayoutArea;
.super Lcom/itextpdf/layout/layout/LayoutArea;
.source "RootLayoutArea.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field protected emptyArea:Z


# direct methods
.method public constructor <init>(ILcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 1
    .param p1, "pageNumber"    # I
    .param p2, "bBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 43
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    .line 34
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/layout/RootLayoutArea;->emptyArea:Z

    .line 44
    return-void
.end method


# virtual methods
.method public clone()Lcom/itextpdf/layout/layout/LayoutArea;
    .locals 2

    .line 74
    invoke-super {p0}, Lcom/itextpdf/layout/layout/LayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/layout/RootLayoutArea;

    .line 75
    .local v0, "area":Lcom/itextpdf/layout/layout/RootLayoutArea;
    iget-boolean v1, p0, Lcom/itextpdf/layout/layout/RootLayoutArea;->emptyArea:Z

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/layout/RootLayoutArea;->setEmptyArea(Z)V

    .line 76
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 30
    invoke-virtual {p0}, Lcom/itextpdf/layout/layout/RootLayoutArea;->clone()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    return-object v0
.end method

.method public isEmptyArea()Z
    .locals 1

    .line 52
    iget-boolean v0, p0, Lcom/itextpdf/layout/layout/RootLayoutArea;->emptyArea:Z

    return v0
.end method

.method public setEmptyArea(Z)V
    .locals 0
    .param p1, "emptyArea"    # Z

    .line 61
    iput-boolean p1, p0, Lcom/itextpdf/layout/layout/RootLayoutArea;->emptyArea:Z

    .line 62
    return-void
.end method
