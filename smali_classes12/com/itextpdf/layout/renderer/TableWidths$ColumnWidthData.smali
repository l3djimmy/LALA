.class Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;
.super Ljava/lang/Object;
.source "TableWidths.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/TableWidths;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ColumnWidthData"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field finalWidth:F

.field isFixed:Z

.field isPercent:Z

.field max:F

.field final min:F

.field width:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 743
    const-class v0, Lcom/itextpdf/layout/renderer/TableWidths;

    return-void
.end method

.method constructor <init>(FF)V
    .locals 2
    .param p1, "min"    # F
    .param p2, "max"    # F

    .line 752
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 746
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    .line 747
    const/high16 v1, -0x40800000    # -1.0f

    iput v1, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    .line 748
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    .line 750
    iput-boolean v1, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isFixed:Z

    .line 753
    cmpl-float v1, p1, v0

    if-ltz v1, :cond_3

    .line 754
    cmpl-float v1, p2, v0

    if-ltz v1, :cond_2

    .line 755
    cmpl-float v1, p1, v0

    if-lez v1, :cond_0

    invoke-static {}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;->getEps()F

    move-result v1

    add-float/2addr v1, p1

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    iput v1, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    .line 758
    cmpl-float v1, p2, v0

    if-lez v1, :cond_1

    invoke-static {}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;->getEps()F

    move-result v0

    add-float/2addr v0, p2

    const v1, 0x46fff000    # 32760.0f

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    :cond_1
    iput v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->max:F

    .line 759
    return-void

    .line 754
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 753
    :cond_3
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method


# virtual methods
.method addPercents(F)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;
    .locals 1
    .param p1, "width"    # F

    .line 793
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-eqz v0, :cond_0

    .line 794
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    .line 795
    return-object p0

    .line 793
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method addPoints(F)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;
    .locals 1
    .param p1, "width"    # F

    .line 776
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-nez v0, :cond_0

    .line 777
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    .line 778
    return-object p0

    .line 776
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method isFlexible()Z
    .locals 1

    .line 804
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isFixed:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method resetPoints(F)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;
    .locals 1
    .param p1, "width"    # F

    .line 769
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    cmpg-float v0, v0, p1

    if-gtz v0, :cond_0

    .line 770
    iput p1, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    .line 771
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    .line 772
    return-object p0

    .line 769
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method setFixed(Z)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;
    .locals 0
    .param p1, "fixed"    # Z

    .line 799
    iput-boolean p1, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isFixed:Z

    .line 800
    return-object p0
.end method

.method setPercents(F)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;
    .locals 1
    .param p1, "percent"    # F

    .line 782
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-eqz v0, :cond_0

    .line 783
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    goto :goto_0

    .line 785
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    .line 786
    iput p1, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    .line 788
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isFixed:Z

    .line 789
    return-object p0
.end method

.method setPoints(F)Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;
    .locals 1
    .param p1, "width"    # F

    .line 762
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-nez v0, :cond_1

    .line 763
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    cmpg-float v0, v0, p1

    if-gtz v0, :cond_0

    .line 764
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    .line 765
    return-object p0

    .line 763
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 762
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 809
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "w="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->width:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isPercent:Z

    if-eqz v1, :cond_0

    const-string v1, "%"

    goto :goto_0

    :cond_0
    const-string/jumbo v1, "pt"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->isFixed:Z

    if-eqz v1, :cond_1

    const-string v1, " !!"

    goto :goto_1

    :cond_1
    const-string v1, ""

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", min="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->min:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", max="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->max:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", finalWidth="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/layout/renderer/TableWidths$ColumnWidthData;->finalWidth:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
