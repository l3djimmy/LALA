.class Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;
.super Ljava/lang/Object;
.source "TextChunkLocationDefaultImp.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;


# static fields
.field private static final DIACRITICAL_MARKS_ALLOWED_VERTICAL_DEVIATION:F = 2.0f


# instance fields
.field private final charSpaceWidth:F

.field private final distParallelEnd:F

.field private final distParallelStart:F

.field private final distPerpendicular:I

.field private final endLocation:Lcom/itextpdf/kernel/geom/Vector;

.field private final orientationMagnitude:I

.field private final orientationVector:Lcom/itextpdf/kernel/geom/Vector;

.field private final startLocation:Lcom/itextpdf/kernel/geom/Vector;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;F)V
    .locals 8
    .param p1, "startLocation"    # Lcom/itextpdf/kernel/geom/Vector;
    .param p2, "endLocation"    # Lcom/itextpdf/kernel/geom/Vector;
    .param p3, "charSpaceWidth"    # F

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->startLocation:Lcom/itextpdf/kernel/geom/Vector;

    .line 69
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->endLocation:Lcom/itextpdf/kernel/geom/Vector;

    .line 70
    iput p3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->charSpaceWidth:F

    .line 72
    invoke-virtual {p2, p1}, Lcom/itextpdf/kernel/geom/Vector;->subtract(Lcom/itextpdf/kernel/geom/Vector;)Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v0

    .line 73
    .local v0, "oVector":Lcom/itextpdf/kernel/geom/Vector;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Vector;->length()F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    const/high16 v3, 0x3f800000    # 1.0f

    if-nez v1, :cond_0

    .line 74
    new-instance v1, Lcom/itextpdf/kernel/geom/Vector;

    invoke-direct {v1, v3, v2, v2}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    move-object v0, v1

    .line 76
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Vector;->normalize()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->orientationVector:Lcom/itextpdf/kernel/geom/Vector;

    .line 77
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->orientationVector:Lcom/itextpdf/kernel/geom/Vector;

    .line 78
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v1

    float-to-double v4, v1

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->orientationVector:Lcom/itextpdf/kernel/geom/Vector;

    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v1

    float-to-double v6, v1

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v4

    .line 77
    invoke-static {v4, v5}, Lcom/itextpdf/io/font/FontProgram;->convertGlyphSpaceToTextSpace(D)D

    move-result-wide v4

    double-to-int v1, v4

    iput v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->orientationMagnitude:I

    .line 83
    new-instance v1, Lcom/itextpdf/kernel/geom/Vector;

    invoke-direct {v1, v2, v2, v3}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    .line 84
    .local v1, "origin":Lcom/itextpdf/kernel/geom/Vector;
    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/geom/Vector;->subtract(Lcom/itextpdf/kernel/geom/Vector;)Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v2

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->orientationVector:Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Vector;->cross(Lcom/itextpdf/kernel/geom/Vector;)Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->distPerpendicular:I

    .line 86
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->orientationVector:Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual {v2, p1}, Lcom/itextpdf/kernel/geom/Vector;->dot(Lcom/itextpdf/kernel/geom/Vector;)F

    move-result v2

    iput v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->distParallelStart:F

    .line 87
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->orientationVector:Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual {v2, p2}, Lcom/itextpdf/kernel/geom/Vector;->dot(Lcom/itextpdf/kernel/geom/Vector;)F

    move-result v2

    iput v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->distParallelEnd:F

    .line 88
    return-void
.end method

.method static containsMark(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;)Z
    .locals 3
    .param p0, "baseLocation"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;
    .param p1, "markLocation"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    .line 179
    invoke-interface {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getStartLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v0

    invoke-interface {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getStartLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v2

    cmpg-float v0, v0, v2

    if-gtz v0, :cond_0

    invoke-interface {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getEndLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v0

    invoke-interface {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getEndLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v2

    cmpl-float v0, v0, v2

    if-ltz v0, :cond_0

    .line 180
    invoke-interface {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->distPerpendicular()I

    move-result v0

    invoke-interface {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->distPerpendicular()I

    move-result v2

    sub-int/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    int-to-float v0, v0

    const/high16 v2, 0x40000000    # 2.0f

    cmpg-float v0, v0, v2

    if-gtz v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    nop

    .line 179
    :goto_0
    return v1
.end method


# virtual methods
.method public distParallelEnd()F
    .locals 1

    .line 104
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->distParallelEnd:F

    return v0
.end method

.method public distParallelStart()F
    .locals 1

    .line 100
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->distParallelStart:F

    return v0
.end method

.method public distPerpendicular()I
    .locals 1

    .line 96
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->distPerpendicular:I

    return v0
.end method

.method public distanceFromEndOf(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;)F
    .locals 2
    .param p1, "other"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    .line 155
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->distParallelStart()F

    move-result v0

    invoke-interface {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->distParallelEnd()F

    move-result v1

    sub-float/2addr v0, v1

    return v0
.end method

.method public getCharSpaceWidth()F
    .locals 1

    .line 125
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->charSpaceWidth:F

    return v0
.end method

.method public getEndLocation()Lcom/itextpdf/kernel/geom/Vector;
    .locals 1

    .line 118
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->endLocation:Lcom/itextpdf/kernel/geom/Vector;

    return-object v0
.end method

.method public getStartLocation()Lcom/itextpdf/kernel/geom/Vector;
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->startLocation:Lcom/itextpdf/kernel/geom/Vector;

    return-object v0
.end method

.method public isAtWordBoundary(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;)Z
    .locals 4
    .param p1, "previous"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    .line 161
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->startLocation:Lcom/itextpdf/kernel/geom/Vector;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->endLocation:Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Vector;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3

    invoke-interface {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getEndLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v0

    invoke-interface {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getStartLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/geom/Vector;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 165
    :cond_0
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->distanceFromEndOf(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;)F

    move-result v0

    .line 167
    .local v0, "dist":F
    const/4 v2, 0x0

    cmpg-float v3, v0, v2

    if-gez v3, :cond_1

    .line 168
    invoke-interface {p1, p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->distanceFromEndOf(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;)F

    move-result v0

    .line 171
    cmpg-float v2, v0, v2

    if-gez v2, :cond_1

    .line 172
    return v1

    .line 175
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->getCharSpaceWidth()F

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    cmpl-float v2, v0, v2

    if-lez v2, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1

    .line 162
    .end local v0    # "dist":F
    :cond_3
    :goto_0
    return v1
.end method

.method public orientationMagnitude()I
    .locals 1

    .line 92
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->orientationMagnitude:I

    return v0
.end method

.method public sameLine(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;)Z
    .locals 8
    .param p1, "as"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    .line 133
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->orientationMagnitude()I

    move-result v0

    invoke-interface {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->orientationMagnitude()I

    move-result v1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    .line 134
    return v2

    .line 136
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->distPerpendicular()I

    move-result v0

    invoke-interface {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->distPerpendicular()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    .line 137
    .local v0, "distPerpendicularDiff":F
    const/4 v1, 0x0

    cmpl-float v3, v0, v1

    const/4 v4, 0x1

    if-nez v3, :cond_1

    .line 138
    return v4

    .line 140
    :cond_1
    new-instance v3, Lcom/itextpdf/kernel/geom/LineSegment;

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->startLocation:Lcom/itextpdf/kernel/geom/Vector;

    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->endLocation:Lcom/itextpdf/kernel/geom/Vector;

    invoke-direct {v3, v5, v6}, Lcom/itextpdf/kernel/geom/LineSegment;-><init>(Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;)V

    .line 141
    .local v3, "mySegment":Lcom/itextpdf/kernel/geom/LineSegment;
    new-instance v5, Lcom/itextpdf/kernel/geom/LineSegment;

    invoke-interface {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getStartLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v6

    invoke-interface {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getEndLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/itextpdf/kernel/geom/LineSegment;-><init>(Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;)V

    .line 142
    .local v5, "otherSegment":Lcom/itextpdf/kernel/geom/LineSegment;
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v6

    const/high16 v7, 0x40000000    # 2.0f

    cmpg-float v6, v6, v7

    if-gtz v6, :cond_3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/LineSegment;->getLength()F

    move-result v6

    cmpl-float v6, v6, v1

    if-eqz v6, :cond_2

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/LineSegment;->getLength()F

    move-result v6

    cmpl-float v1, v6, v1

    if-nez v1, :cond_3

    :cond_2
    move v2, v4

    :cond_3
    return v2
.end method
