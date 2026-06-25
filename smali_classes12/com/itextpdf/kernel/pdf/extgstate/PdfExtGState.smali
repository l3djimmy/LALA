.class public Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfExtGState.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# static fields
.field public static BM_COLOR:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static BM_COLOR_BURN:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static BM_COLOR_DODGE:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static BM_DARKEN:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static BM_DIFFERENCE:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static BM_EXCLUSION:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static BM_HARD_LIGHT:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static BM_HUE:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static BM_LIGHTEN:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static BM_LUMINOSITY:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static BM_MULTIPLY:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static BM_NORMAL:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static BM_OVERLAY:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static BM_SATURATION:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static BM_SCREEN:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static BM_SOFT_LIGHT:Lcom/itextpdf/kernel/pdf/PdfName;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 46
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Normal:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_NORMAL:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 50
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Multiply:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_MULTIPLY:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 54
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Screen:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_SCREEN:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 58
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Overlay:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_OVERLAY:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 62
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Darken:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_DARKEN:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 66
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Lighten:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_LIGHTEN:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 70
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->ColorDodge:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_COLOR_DODGE:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 74
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->ColorBurn:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_COLOR_BURN:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 78
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->HardLight:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_HARD_LIGHT:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 82
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->SoftLight:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_SOFT_LIGHT:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 86
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Difference:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_DIFFERENCE:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 90
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Exclusion:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_EXCLUSION:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 95
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Hue:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_HUE:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 99
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Saturation:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_SATURATION:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 103
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Color:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_COLOR:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 107
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Luminosity:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->BM_LUMINOSITY:Lcom/itextpdf/kernel/pdf/PdfName;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 123
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 124
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 116
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 117
    return-void
.end method


# virtual methods
.method public flush()V
    .locals 0

    .line 753
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->flush()V

    .line 754
    return-void
.end method

.method public getAlphaSourceFlag()Ljava/lang/Boolean;
    .locals 2

    .line 638
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AIS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBool(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public getAutomaticStrokeAdjustmentFlag()Ljava/lang/Boolean;
    .locals 2

    .line 538
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->SA:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBool(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public getBlackGenerationFunction()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2

    .line 332
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BG:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public getBlackGenerationFunction2()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2

    .line 356
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BG2:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public getBlendMode()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2

    .line 557
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BM:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public getDashPattern()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 208
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getFillOpacity()Ljava/lang/Float;
    .locals 2

    .line 617
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ca:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsFloat(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public getFillOverprintFlag()Ljava/lang/Boolean;
    .locals 2

    .line 268
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->op:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBool(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public getFlatnessTolerance()Ljava/lang/Float;
    .locals 2

    .line 500
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FL:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsFloat(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public getFont()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 308
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Font:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getHalftone()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2

    .line 480
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->HT:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public getHalftoneOrigin()[F
    .locals 6

    .line 722
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->HTO:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 723
    .local v0, "hto":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->isNumber()Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfObject;->isNumber()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 724
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v4

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v5

    new-array v2, v2, [F

    aput v4, v2, v1

    aput v5, v2, v3

    return-object v2

    .line 726
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getLineCapStyle()Ljava/lang/Integer;
    .locals 2

    .line 151
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->LC:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsInt(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getLineJoinStyle()Ljava/lang/Integer;
    .locals 2

    .line 170
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->LJ:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsInt(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getLineWidth()Ljava/lang/Float;
    .locals 2

    .line 132
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->LW:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsFloat(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public getMiterLimit()Ljava/lang/Float;
    .locals 2

    .line 189
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ML:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsFloat(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public getOverprintMode()Ljava/lang/Integer;
    .locals 2

    .line 287
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OPM:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsInt(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getRenderingIntent()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 229
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->RI:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method public getSmothnessTolerance()Ljava/lang/Float;
    .locals 2

    .line 519
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->SM:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsFloat(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public getSoftMask()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2

    .line 576
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->SMask:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public getStrokeOpacity()Ljava/lang/Float;
    .locals 2

    .line 596
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CA:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsFloat(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public getStrokeOverprintFlag()Ljava/lang/Boolean;
    .locals 2

    .line 249
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OP:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBool(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public getTextKnockoutFlag()Ljava/lang/Boolean;
    .locals 2

    .line 659
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->TK:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBool(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public getTransferFunction()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2

    .line 431
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->TR:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public getTransferFunction2()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2

    .line 455
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->TR2:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public getUndercolorRemovalFunction()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2

    .line 381
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->UCR:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public getUndercolorRemovalFunction2()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2

    .line 405
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->UCR2:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public isBlackPointCompensationUsed()Ljava/lang/Boolean;
    .locals 2

    .line 691
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->UseBlackPtComp:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    .line 692
    .local v0, "useBlackPointCompensation":Lcom/itextpdf/kernel/pdf/PdfName;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ON:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 693
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    .line 694
    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OFF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 695
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    .line 697
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 761
    const/4 v0, 0x1

    return v0
.end method

.method public put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 739
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 740
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 741
    return-object p0
.end method

.method public setAlphaSourceFlag(Z)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 2
    .param p1, "alphaSourceFlag"    # Z

    .line 649
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->AIS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setAutomaticStrokeAdjustmentFlag(Z)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 2
    .param p1, "strokeAdjustment"    # Z

    .line 548
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->SA:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setBlackGenerationFunction(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 1
    .param p1, "blackGenerationFunction"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 345
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BG:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setBlackGenerationFunction2(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 1
    .param p1, "blackGenerationFunction2"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 371
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BG2:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setBlendMode(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 1
    .param p1, "blendMode"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 567
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BM:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setDashPattern(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 1
    .param p1, "dashPattern"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 218
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setFillOpacity(F)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 4
    .param p1, "fillingAlphaConstant"    # F

    .line 628
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->ca:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v2, p1

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setFillOverPrintFlag(Z)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 2
    .param p1, "fillOverprintFlag"    # Z

    .line 278
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->op:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setFlatnessTolerance(F)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 4
    .param p1, "flatnessTolerance"    # F

    .line 510
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->FL:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v2, p1

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setFont(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 1
    .param p1, "font"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 322
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Font:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setHalftone(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 1
    .param p1, "halftone"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 491
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->HT:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setHalftoneOrigin(FF)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 4
    .param p1, "x"    # F
    .param p2, "y"    # F

    .line 709
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 710
    .local v0, "hto":Lcom/itextpdf/kernel/pdf/PdfArray;
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v2, p1

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 711
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v2, p2

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 712
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->HTO:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v1

    return-object v1
.end method

.method public setLineCapStyle(I)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 2
    .param p1, "lineCapStyle"    # I

    .line 161
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->LC:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setLineJoinStyle(I)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 2
    .param p1, "lineJoinStyle"    # I

    .line 180
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->LJ:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setLineWidth(F)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 4
    .param p1, "lineWidth"    # F

    .line 142
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->LW:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v2, p1

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setMiterLimit(F)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 4
    .param p1, "miterLimit"    # F

    .line 199
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->ML:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v2, p1

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setOverprintMode(I)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 2
    .param p1, "overprintMode"    # I

    .line 297
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->OPM:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setRenderingIntent(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 1
    .param p1, "renderingIntent"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 240
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->RI:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setSmoothnessTolerance(F)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 4
    .param p1, "smoothnessTolerance"    # F

    .line 529
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->SM:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v2, p1

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setSoftMask(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 1
    .param p1, "sMask"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 586
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->SMask:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setStrokeOpacity(F)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 4
    .param p1, "strokingAlphaConstant"    # F

    .line 607
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->CA:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v2, p1

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setStrokeOverPrintFlag(Z)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 2
    .param p1, "strokeOverPrintFlag"    # Z

    .line 259
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->OP:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setTextKnockoutFlag(Z)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 2
    .param p1, "textKnockoutFlag"    # Z

    .line 670
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->TK:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setTransferFunction(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 1
    .param p1, "transferFunction"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 444
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->TR:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setTransferFunction2(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 1
    .param p1, "transferFunction2"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 470
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->TR2:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setUndercolorRemovalFunction(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 1
    .param p1, "undercolorRemovalFunction"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 394
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->UCR:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setUndercolorRemovalFunction2(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 1
    .param p1, "undercolorRemovalFunction2"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 420
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->UCR2:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method

.method public setUseBlackPointCompensation(Z)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .locals 2
    .param p1, "useBlackPointCompensation"    # Z

    .line 681
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->UseBlackPtComp:Lcom/itextpdf/kernel/pdf/PdfName;

    if-eqz p1, :cond_0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ON:Lcom/itextpdf/kernel/pdf/PdfName;

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OFF:Lcom/itextpdf/kernel/pdf/PdfName;

    :goto_0
    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    move-result-object v0

    return-object v0
.end method
