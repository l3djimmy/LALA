.class Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;
.super Ljava/lang/Object;
.source "RotationMinMaxWidth.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "WidthFunction"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction$Interval;
    }
.end annotation


# instance fields
.field private area:D

.field private cos:D

.field private sin:D


# direct methods
.method public constructor <init>(DD)V
    .locals 2
    .param p1, "angle"    # D
    .param p3, "area"    # D

    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 200
    invoke-static {p1, p2}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;->access$000(D)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->sin:D

    .line 201
    invoke-static {p1, p2}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth;->access$100(D)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->cos:D

    .line 202
    iput-wide p3, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->area:D

    .line 203
    return-void
.end method


# virtual methods
.method public getRotatedHeight(D)D
    .locals 6
    .param p1, "x"    # D

    .line 222
    iget-wide v0, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->sin:D

    mul-double/2addr v0, p1

    iget-wide v2, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->area:D

    iget-wide v4, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->cos:D

    mul-double/2addr v2, v4

    div-double/2addr v2, p1

    add-double/2addr v0, v2

    return-wide v0
.end method

.method public getRotatedWidth(D)D
    .locals 6
    .param p1, "x"    # D

    .line 212
    iget-wide v0, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->cos:D

    mul-double/2addr v0, p1

    iget-wide v2, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->area:D

    iget-wide v4, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->sin:D

    mul-double/2addr v2, v4

    div-double/2addr v2, p1

    add-double/2addr v0, v2

    return-wide v0
.end method

.method public getValidOriginalWidths(D)Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction$Interval;
    .locals 10
    .param p1, "availableWidth"    # D

    .line 234
    iget-wide v0, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->cos:D

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    if-nez v0, :cond_0

    .line 235
    iget-wide v0, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->area:D

    iget-wide v2, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->sin:D

    mul-double/2addr v0, v2

    div-double/2addr v0, p1

    .line 236
    .local v0, "minWidth":D
    invoke-static {}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidthUtils;->getInfWidth()F

    move-result v2

    float-to-double v2, v2

    .local v2, "maxWidth":D
    goto :goto_0

    .line 237
    .end local v0    # "minWidth":D
    .end local v2    # "maxWidth":D
    :cond_0
    iget-wide v0, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->sin:D

    cmpl-double v0, v0, v2

    if-nez v0, :cond_1

    .line 238
    const-wide/16 v0, 0x0

    .line 239
    .restart local v0    # "minWidth":D
    iget-wide v2, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->cos:D

    div-double v2, p1, v2

    .restart local v2    # "maxWidth":D
    goto :goto_0

    .line 241
    .end local v0    # "minWidth":D
    .end local v2    # "maxWidth":D
    :cond_1
    mul-double v0, p1, p1

    const-wide/high16 v4, 0x4010000000000000L    # 4.0

    iget-wide v6, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->area:D

    mul-double/2addr v6, v4

    iget-wide v4, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->sin:D

    mul-double/2addr v6, v4

    iget-wide v4, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->cos:D

    mul-double/2addr v6, v4

    sub-double/2addr v0, v6

    .line 242
    .local v0, "D":D
    cmpg-double v2, v0, v2

    if-gez v2, :cond_2

    .line 243
    const/4 v2, 0x0

    return-object v2

    .line 245
    :cond_2
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    sub-double v2, p1, v2

    iget-wide v4, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->cos:D

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    mul-double/2addr v4, v6

    div-double/2addr v2, v4

    .line 246
    .local v2, "minWidth":D
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    add-double/2addr v4, p1

    iget-wide v8, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->cos:D

    mul-double/2addr v8, v6

    div-double/2addr v4, v8

    move-wide v0, v2

    move-wide v2, v4

    .line 248
    .local v0, "minWidth":D
    .local v2, "maxWidth":D
    :goto_0
    new-instance v4, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction$Interval;

    invoke-direct {v4, v0, v1, v2, v3}, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction$Interval;-><init>(DD)V

    return-object v4
.end method

.method public getWidthDerivativeZeroPoint()D
    .locals 4

    .line 259
    iget-wide v0, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->area:D

    iget-wide v2, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->sin:D

    mul-double/2addr v0, v2

    iget-wide v2, p0, Lcom/itextpdf/layout/minmaxwidth/RotationMinMaxWidth$WidthFunction;->cos:D

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    return-wide v0
.end method
