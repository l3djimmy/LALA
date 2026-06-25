.class public Lcom/itextpdf/layout/properties/LineHeight;
.super Ljava/lang/Object;
.source "LineHeight.java"


# static fields
.field private static final FIXED:I = 0x1

.field private static final MULTIPLIED:I = 0x2

.field private static final NORMAL:I = 0x4


# instance fields
.field private type:I

.field private value:F


# direct methods
.method private constructor <init>(IF)V
    .locals 0
    .param p1, "type"    # I
    .param p2, "value"    # F

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput p1, p0, Lcom/itextpdf/layout/properties/LineHeight;->type:I

    .line 41
    iput p2, p0, Lcom/itextpdf/layout/properties/LineHeight;->value:F

    .line 42
    return-void
.end method

.method public static createFixedValue(F)Lcom/itextpdf/layout/properties/LineHeight;
    .locals 2
    .param p0, "value"    # F

    .line 61
    new-instance v0, Lcom/itextpdf/layout/properties/LineHeight;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p0}, Lcom/itextpdf/layout/properties/LineHeight;-><init>(IF)V

    return-object v0
.end method

.method public static createMultipliedValue(F)Lcom/itextpdf/layout/properties/LineHeight;
    .locals 2
    .param p0, "value"    # F

    .line 72
    new-instance v0, Lcom/itextpdf/layout/properties/LineHeight;

    const/4 v1, 0x2

    invoke-direct {v0, v1, p0}, Lcom/itextpdf/layout/properties/LineHeight;-><init>(IF)V

    return-object v0
.end method

.method public static createNormalValue()Lcom/itextpdf/layout/properties/LineHeight;
    .locals 3

    .line 81
    new-instance v0, Lcom/itextpdf/layout/properties/LineHeight;

    const/4 v1, 0x4

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/layout/properties/LineHeight;-><init>(IF)V

    return-object v0
.end method


# virtual methods
.method public getValue()F
    .locals 1

    .line 51
    iget v0, p0, Lcom/itextpdf/layout/properties/LineHeight;->value:F

    return v0
.end method

.method public isFixedValue()Z
    .locals 2

    .line 90
    iget v0, p0, Lcom/itextpdf/layout/properties/LineHeight;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isMultipliedValue()Z
    .locals 2

    .line 99
    iget v0, p0, Lcom/itextpdf/layout/properties/LineHeight;->type:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isNormalValue()Z
    .locals 2

    .line 108
    iget v0, p0, Lcom/itextpdf/layout/properties/LineHeight;->type:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
