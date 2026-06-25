.class public Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
.super Ljava/lang/Object;
.source "GradientColorStop.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;,
        Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;
    }
.end annotation


# instance fields
.field private hintOffset:D

.field private hintOffsetType:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

.field private offset:D

.field private offsetType:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

.field private final opacity:F

.field private final rgb:[F


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;)V
    .locals 6
    .param p1, "gradientColorStop"    # Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    .param p2, "offset"    # D
    .param p4, "offsetType"    # Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    .line 76
    invoke-virtual {p1}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getRgbArray()[F

    move-result-object v1

    invoke-direct {p1}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOpacity()F

    move-result v2

    move-object v0, p0

    move-wide v3, p2

    move-object v5, p4

    .end local p2    # "offset":D
    .end local p4    # "offsetType":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;
    .local v3, "offset":D
    .local v5, "offsetType":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;-><init>([FFDLcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;)V

    .line 77
    return-void
.end method

.method public constructor <init>([F)V
    .locals 6
    .param p1, "rgb"    # [F

    .line 54
    const-wide/16 v3, 0x0

    sget-object v5, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->AUTO:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    const/high16 v2, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    .end local p1    # "rgb":[F
    .local v1, "rgb":[F
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;-><init>([FFDLcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;)V

    .line 55
    return-void
.end method

.method public constructor <init>([FDLcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;)V
    .locals 6
    .param p1, "rgb"    # [F
    .param p2, "offset"    # D
    .param p4, "offsetType"    # Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    .line 65
    const/high16 v2, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    move-wide v3, p2

    move-object v5, p4

    .end local p1    # "rgb":[F
    .end local p2    # "offset":D
    .end local p4    # "offsetType":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;
    .local v1, "rgb":[F
    .local v3, "offset":D
    .local v5, "offsetType":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;-><init>([FFDLcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;)V

    .line 66
    return-void
.end method

.method private constructor <init>([FFDLcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;)V
    .locals 2
    .param p1, "rgb"    # [F
    .param p2, "opacity"    # F
    .param p3, "offset"    # D
    .param p5, "offsetType"    # Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->hintOffset:D

    .line 45
    sget-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->NONE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    iput-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->hintOffsetType:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    .line 80
    invoke-static {p1}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->copyRgbArray([F)[F

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->rgb:[F

    .line 82
    invoke-static {p2}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->normalize(F)F

    move-result v0

    iput v0, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->opacity:F

    .line 84
    invoke-virtual {p0, p3, p4, p5}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->setOffset(DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;)Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 85
    return-void
.end method

.method private static copyRgbArray([F)[F
    .locals 7
    .param p0, "toCopy"    # [F

    .line 201
    const/4 v0, 0x3

    if-eqz p0, :cond_1

    array-length v1, p0

    if-ge v1, v0, :cond_0

    goto :goto_0

    .line 204
    :cond_0
    const/4 v1, 0x0

    aget v2, p0, v1

    invoke-static {v2}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->normalize(F)F

    move-result v2

    const/4 v3, 0x1

    aget v4, p0, v3

    invoke-static {v4}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->normalize(F)F

    move-result v4

    const/4 v5, 0x2

    aget v6, p0, v5

    invoke-static {v6}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->normalize(F)F

    move-result v6

    new-array v0, v0, [F

    aput v2, v0, v1

    aput v4, v0, v3

    aput v6, v0, v5

    return-object v0

    .line 202
    :cond_1
    :goto_0
    new-array v0, v0, [F

    fill-array-data v0, :array_0

    return-object v0

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data
.end method

.method private getOpacity()F
    .locals 1

    .line 103
    iget v0, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->opacity:F

    return v0
.end method

.method private static normalize(F)F
    .locals 2
    .param p0, "toNormalize"    # F

    .line 197
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v1, p0, v0

    if-lez v1, :cond_1

    :cond_0
    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    cmpl-float v1, p0, v0

    if-lez v1, :cond_0

    move v0, p0

    :goto_0
    return v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "o"    # Ljava/lang/Object;

    .line 172
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 173
    return v0

    .line 175
    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 178
    :cond_1
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 179
    .local v2, "that":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    iget v3, v2, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->opacity:F

    iget v4, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->opacity:F

    invoke-static {v3, v4}, Ljava/lang/Float;->compare(FF)I

    move-result v3

    if-nez v3, :cond_2

    iget-wide v3, v2, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->offset:D

    iget-wide v5, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->offset:D

    .line 180
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result v3

    if-nez v3, :cond_2

    iget-wide v3, v2, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->hintOffset:D

    iget-wide v5, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->hintOffset:D

    .line 181
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->rgb:[F

    iget-object v4, v2, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->rgb:[F

    .line 182
    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([F[F)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->offsetType:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    iget-object v4, v2, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->offsetType:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    if-ne v3, v4, :cond_2

    iget-object v3, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->hintOffsetType:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    iget-object v4, v2, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->hintOffsetType:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    if-ne v3, v4, :cond_2

    goto :goto_0

    :cond_2
    move v0, v1

    .line 179
    :goto_0
    return v0

    .line 176
    .end local v2    # "that":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    :cond_3
    :goto_1
    return v1
.end method

.method public getHintOffset()D
    .locals 2

    .line 130
    iget-wide v0, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->hintOffset:D

    return-wide v0
.end method

.method public getHintOffsetType()Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;
    .locals 1

    .line 139
    iget-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->hintOffsetType:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    return-object v0
.end method

.method public getOffset()D
    .locals 2

    .line 121
    iget-wide v0, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->offset:D

    return-wide v0
.end method

.method public getOffsetType()Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->offsetType:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    return-object v0
.end method

.method public getRgbArray()[F
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->rgb:[F

    invoke-static {v0}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->copyRgbArray([F)[F

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 189
    iget v0, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->opacity:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iget-wide v1, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->offset:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iget-wide v2, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->hintOffset:D

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    .line 190
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->offsetType:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    .line 191
    .end local v0    # "result":I
    .local v1, "result":I
    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->hintOffsetType:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    .line 192
    .end local v1    # "result":I
    .restart local v0    # "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->rgb:[F

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([F)I

    move-result v2

    add-int/2addr v1, v2

    .line 193
    .end local v0    # "result":I
    .restart local v1    # "result":I
    return v1
.end method

.method public setHint(DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;)Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    .locals 2
    .param p1, "hintOffset"    # D
    .param p3, "hintOffsetType"    # Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    .line 165
    if-eqz p3, :cond_0

    move-object v0, p3

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->NONE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    :goto_0
    iput-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->hintOffsetType:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    .line 166
    iget-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->hintOffsetType:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    sget-object v1, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->NONE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    if-eq v0, v1, :cond_1

    move-wide v0, p1

    goto :goto_1

    :cond_1
    const-wide/16 v0, 0x0

    :goto_1
    iput-wide v0, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->hintOffset:D

    .line 167
    return-object p0
.end method

.method public setOffset(DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;)Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    .locals 2
    .param p1, "offset"    # D
    .param p3, "offsetType"    # Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    .line 151
    if-eqz p3, :cond_0

    move-object v0, p3

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->AUTO:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    :goto_0
    iput-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->offsetType:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    .line 152
    iget-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->offsetType:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    sget-object v1, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->AUTO:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    if-eq v0, v1, :cond_1

    move-wide v0, p1

    goto :goto_1

    :cond_1
    const-wide/16 v0, 0x0

    :goto_1
    iput-wide v0, p0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->offset:D

    .line 153
    return-object p0
.end method
