.class Lcom/itextpdf/layout/renderer/TableBorderDescriptor;
.super Ljava/lang/Object;
.source "TableBorderDescriptor.java"


# instance fields
.field private borderIndex:I

.field private crossCoordinate:F

.field private mainCoordinateStart:F

.field private mainCoordinateWidths:[F


# direct methods
.method public constructor <init>(IFF[F)V
    .locals 0
    .param p1, "borderIndex"    # I
    .param p2, "mainCoordinateStart"    # F
    .param p3, "crossCoordinate"    # F
    .param p4, "mainCoordinateWidths"    # [F

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput p1, p0, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;->borderIndex:I

    .line 42
    iput p2, p0, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;->mainCoordinateStart:F

    .line 43
    iput p3, p0, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;->crossCoordinate:F

    .line 44
    iput-object p4, p0, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;->mainCoordinateWidths:[F

    .line 45
    return-void
.end method


# virtual methods
.method public getBorderIndex()I
    .locals 1

    .line 48
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;->borderIndex:I

    return v0
.end method

.method public getCrossCoordinate()F
    .locals 1

    .line 56
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;->crossCoordinate:F

    return v0
.end method

.method public getMainCoordinateStart()F
    .locals 1

    .line 52
    iget v0, p0, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;->mainCoordinateStart:F

    return v0
.end method

.method public getMainCoordinateWidths()[F
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/TableBorderDescriptor;->mainCoordinateWidths:[F

    return-object v0
.end method
