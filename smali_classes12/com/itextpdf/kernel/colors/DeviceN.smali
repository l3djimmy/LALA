.class public Lcom/itextpdf/kernel/colors/DeviceN;
.super Lcom/itextpdf/kernel/colors/Color;
.source "DeviceN.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;)V
    .locals 1
    .param p1, "cs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;

    .line 44
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;->getNumberOfComponents()I

    move-result v0

    invoke-static {v0}, Lcom/itextpdf/kernel/colors/DeviceN;->getDefaultColorants(I)[F

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/colors/DeviceN;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;[F)V

    .line 45
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;[F)V
    .locals 0
    .param p1, "cs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;
    .param p2, "value"    # [F

    .line 54
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/colors/Color;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)V

    .line 55
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;Lcom/itextpdf/kernel/pdf/function/IPdfFunction;[F)V
    .locals 1
    .param p2, "alternateCs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .param p3, "tintTransform"    # Lcom/itextpdf/kernel/pdf/function/IPdfFunction;
    .param p4, "value"    # [F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;",
            "Lcom/itextpdf/kernel/pdf/function/IPdfFunction;",
            "[F)V"
        }
    .end annotation

    .line 66
    .local p1, "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;

    invoke-direct {v0, p1, p2, p3}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;-><init>(Ljava/util/List;Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;Lcom/itextpdf/kernel/pdf/function/IPdfFunction;)V

    invoke-direct {p0, v0, p4}, Lcom/itextpdf/kernel/colors/DeviceN;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;[F)V

    .line 67
    return-void
.end method

.method private static getDefaultColorants(I)[F
    .locals 2
    .param p0, "numOfColorants"    # I

    .line 70
    new-array v0, p0, [F

    .line 71
    .local v0, "colorants":[F
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    .line 72
    return-object v0
.end method
