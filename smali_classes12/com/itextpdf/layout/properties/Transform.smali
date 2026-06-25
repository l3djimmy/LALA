.class public Lcom/itextpdf/layout/properties/Transform;
.super Ljava/lang/Object;
.source "Transform.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/properties/Transform$SingleTransform;
    }
.end annotation


# instance fields
.field private multipleTransform:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/properties/Transform$SingleTransform;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "length"    # I

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/itextpdf/layout/properties/Transform;->multipleTransform:Ljava/util/List;

    .line 43
    return-void
.end method

.method public static getAffineTransform(Lcom/itextpdf/layout/properties/Transform;FF)Lcom/itextpdf/kernel/geom/AffineTransform;
    .locals 11
    .param p0, "t"    # Lcom/itextpdf/layout/properties/Transform;
    .param p1, "width"    # F
    .param p2, "height"    # F

    .line 69
    invoke-direct {p0}, Lcom/itextpdf/layout/properties/Transform;->getMultipleTransform()Ljava/util/List;

    move-result-object v0

    .line 70
    .local v0, "multipleTransform":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/properties/Transform$SingleTransform;>;"
    new-instance v1, Lcom/itextpdf/kernel/geom/AffineTransform;

    invoke-direct {v1}, Lcom/itextpdf/kernel/geom/AffineTransform;-><init>()V

    .line 71
    .local v1, "affineTransform":Lcom/itextpdf/kernel/geom/AffineTransform;
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    .local v2, "k":I
    :goto_0
    if-ltz v2, :cond_4

    .line 72
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/properties/Transform$SingleTransform;

    .line 73
    .local v4, "transform":Lcom/itextpdf/layout/properties/Transform$SingleTransform;
    const/4 v5, 0x6

    new-array v6, v5, [F

    .line 74
    .local v6, "floats":[F
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    const/4 v8, 0x4

    if-ge v7, v8, :cond_0

    .line 75
    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/Transform$SingleTransform;->getFloats()[F

    move-result-object v8

    aget v8, v8, v7

    aput v8, v6, v7

    .line 74
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 76
    .end local v7    # "i":I
    :cond_0
    const/4 v7, 0x4

    .restart local v7    # "i":I
    :goto_2
    if-ge v7, v5, :cond_3

    .line 77
    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/Transform$SingleTransform;->getUnitValues()[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v9

    add-int/lit8 v10, v7, -0x4

    aget-object v9, v9, v10

    invoke-virtual {v9}, Lcom/itextpdf/layout/properties/UnitValue;->getUnitType()I

    move-result v9

    if-ne v9, v3, :cond_1

    .line 78
    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/Transform$SingleTransform;->getUnitValues()[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v9

    add-int/lit8 v10, v7, -0x4

    aget-object v9, v9, v10

    invoke-virtual {v9}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v9

    goto :goto_4

    :cond_1
    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/Transform$SingleTransform;->getUnitValues()[Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v9

    add-int/lit8 v10, v7, -0x4

    aget-object v9, v9, v10

    invoke-virtual {v9}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v9

    const/high16 v10, 0x42c80000    # 100.0f

    div-float/2addr v9, v10

    if-ne v7, v8, :cond_2

    move v10, p1

    goto :goto_3

    :cond_2
    move v10, p2

    :goto_3
    mul-float/2addr v9, v10

    :goto_4
    aput v9, v6, v7

    .line 76
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 79
    .end local v7    # "i":I
    :cond_3
    new-instance v5, Lcom/itextpdf/kernel/geom/AffineTransform;

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/geom/AffineTransform;-><init>([F)V

    invoke-virtual {v1, v5}, Lcom/itextpdf/kernel/geom/AffineTransform;->preConcatenate(Lcom/itextpdf/kernel/geom/AffineTransform;)V

    .line 71
    .end local v4    # "transform":Lcom/itextpdf/layout/properties/Transform$SingleTransform;
    .end local v6    # "floats":[F
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 81
    .end local v2    # "k":I
    :cond_4
    return-object v1
.end method

.method private getMultipleTransform()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/properties/Transform$SingleTransform;",
            ">;"
        }
    .end annotation

    .line 55
    iget-object v0, p0, Lcom/itextpdf/layout/properties/Transform;->multipleTransform:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public addSingleTransform(Lcom/itextpdf/layout/properties/Transform$SingleTransform;)V
    .locals 1
    .param p1, "singleTransform"    # Lcom/itextpdf/layout/properties/Transform$SingleTransform;

    .line 51
    iget-object v0, p0, Lcom/itextpdf/layout/properties/Transform;->multipleTransform:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    return-void
.end method
