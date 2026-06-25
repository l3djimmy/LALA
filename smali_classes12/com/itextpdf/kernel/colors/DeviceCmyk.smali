.class public Lcom/itextpdf/kernel/colors/DeviceCmyk;
.super Lcom/itextpdf/kernel/colors/Color;
.source "DeviceCmyk.java"


# static fields
.field public static final BLACK:Lcom/itextpdf/kernel/colors/DeviceCmyk;

.field public static final CYAN:Lcom/itextpdf/kernel/colors/DeviceCmyk;

.field public static final MAGENTA:Lcom/itextpdf/kernel/colors/DeviceCmyk;

.field public static final YELLOW:Lcom/itextpdf/kernel/colors/DeviceCmyk;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 38
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceCmyk;

    const/16 v1, 0x64

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2, v2}, Lcom/itextpdf/kernel/colors/DeviceCmyk;-><init>(IIII)V

    sput-object v0, Lcom/itextpdf/kernel/colors/DeviceCmyk;->CYAN:Lcom/itextpdf/kernel/colors/DeviceCmyk;

    .line 42
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceCmyk;

    invoke-direct {v0, v2, v1, v2, v2}, Lcom/itextpdf/kernel/colors/DeviceCmyk;-><init>(IIII)V

    sput-object v0, Lcom/itextpdf/kernel/colors/DeviceCmyk;->MAGENTA:Lcom/itextpdf/kernel/colors/DeviceCmyk;

    .line 46
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceCmyk;

    invoke-direct {v0, v2, v2, v1, v2}, Lcom/itextpdf/kernel/colors/DeviceCmyk;-><init>(IIII)V

    sput-object v0, Lcom/itextpdf/kernel/colors/DeviceCmyk;->YELLOW:Lcom/itextpdf/kernel/colors/DeviceCmyk;

    .line 50
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceCmyk;

    invoke-direct {v0, v2, v2, v2, v1}, Lcom/itextpdf/kernel/colors/DeviceCmyk;-><init>(IIII)V

    sput-object v0, Lcom/itextpdf/kernel/colors/DeviceCmyk;->BLACK:Lcom/itextpdf/kernel/colors/DeviceCmyk;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 57
    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p0, v0, v0, v0, v1}, Lcom/itextpdf/kernel/colors/DeviceCmyk;-><init>(FFFF)V

    .line 58
    return-void
.end method

.method public constructor <init>(FFFF)V
    .locals 9
    .param p1, "c"    # F
    .param p2, "m"    # F
    .param p3, "y"    # F
    .param p4, "k"    # F

    .line 87
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Cmyk;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Cmyk;-><init>()V

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v2, p1, v1

    const/4 v3, 0x0

    if-lez v2, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    cmpl-float v2, p1, v3

    if-lez v2, :cond_1

    move v2, p1

    goto :goto_0

    :cond_1
    move v2, v3

    :goto_0
    cmpl-float v4, p2, v1

    if-lez v4, :cond_2

    move v4, v1

    goto :goto_1

    :cond_2
    cmpl-float v4, p2, v3

    if-lez v4, :cond_3

    move v4, p2

    goto :goto_1

    :cond_3
    move v4, v3

    :goto_1
    cmpl-float v5, p3, v1

    if-lez v5, :cond_4

    move v5, v1

    goto :goto_2

    :cond_4
    cmpl-float v5, p3, v3

    if-lez v5, :cond_5

    move v5, p3

    goto :goto_2

    :cond_5
    move v5, v3

    :goto_2
    cmpl-float v6, p4, v1

    if-lez v6, :cond_6

    move v6, v1

    goto :goto_3

    :cond_6
    cmpl-float v6, p4, v3

    if-lez v6, :cond_7

    move v6, p4

    goto :goto_3

    :cond_7
    move v6, v3

    :goto_3
    const/4 v7, 0x4

    new-array v7, v7, [F

    const/4 v8, 0x0

    aput v2, v7, v8

    const/4 v2, 0x1

    aput v4, v7, v2

    const/4 v2, 0x2

    aput v5, v7, v2

    const/4 v2, 0x3

    aput v6, v7, v2

    invoke-direct {p0, v0, v7}, Lcom/itextpdf/kernel/colors/Color;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)V

    .line 93
    cmpl-float v0, p1, v1

    if-gtz v0, :cond_8

    cmpg-float v0, p1, v3

    if-ltz v0, :cond_8

    cmpl-float v0, p2, v1

    if-gtz v0, :cond_8

    cmpg-float v0, p2, v3

    if-ltz v0, :cond_8

    cmpl-float v0, p3, v1

    if-gtz v0, :cond_8

    cmpg-float v0, p3, v3

    if-ltz v0, :cond_8

    cmpl-float v0, p4, v1

    if-gtz v0, :cond_8

    cmpg-float v0, p4, v3

    if-gez v0, :cond_9

    .line 94
    :cond_8
    const-class v0, Lcom/itextpdf/kernel/colors/DeviceCmyk;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 95
    .local v0, "LOGGER":Lorg/slf4j/Logger;
    const-string v1, "Some of colorant intensities are invalid: they are bigger than 1 or less than 0. We will force them to become 1 or 0 respectively."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 97
    .end local v0    # "LOGGER":Lorg/slf4j/Logger;
    :cond_9
    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 5
    .param p1, "c"    # I
    .param p2, "m"    # I
    .param p3, "y"    # I
    .param p4, "k"    # I

    .line 72
    int-to-float v0, p1

    const/high16 v1, 0x42c80000    # 100.0f

    div-float/2addr v0, v1

    int-to-float v2, p2

    div-float/2addr v2, v1

    int-to-float v3, p3

    div-float/2addr v3, v1

    int-to-float v4, p4

    div-float/2addr v4, v1

    invoke-direct {p0, v0, v2, v3, v4}, Lcom/itextpdf/kernel/colors/DeviceCmyk;-><init>(FFFF)V

    .line 73
    return-void
.end method

.method public static makeDarker(Lcom/itextpdf/kernel/colors/DeviceCmyk;)Lcom/itextpdf/kernel/colors/DeviceCmyk;
    .locals 3
    .param p0, "cmykColor"    # Lcom/itextpdf/kernel/colors/DeviceCmyk;

    .line 118
    invoke-static {p0}, Lcom/itextpdf/kernel/colors/DeviceCmyk;->convertCmykToRgb(Lcom/itextpdf/kernel/colors/DeviceCmyk;)Lcom/itextpdf/kernel/colors/DeviceRgb;

    move-result-object v0

    .line 119
    .local v0, "rgbEquivalent":Lcom/itextpdf/kernel/colors/DeviceRgb;
    invoke-static {v0}, Lcom/itextpdf/kernel/colors/DeviceRgb;->makeDarker(Lcom/itextpdf/kernel/colors/DeviceRgb;)Lcom/itextpdf/kernel/colors/DeviceRgb;

    move-result-object v1

    .line 120
    .local v1, "darkerRgb":Lcom/itextpdf/kernel/colors/DeviceRgb;
    invoke-static {v1}, Lcom/itextpdf/kernel/colors/DeviceCmyk;->convertRgbToCmyk(Lcom/itextpdf/kernel/colors/DeviceRgb;)Lcom/itextpdf/kernel/colors/DeviceCmyk;

    move-result-object v2

    return-object v2
.end method

.method public static makeLighter(Lcom/itextpdf/kernel/colors/DeviceCmyk;)Lcom/itextpdf/kernel/colors/DeviceCmyk;
    .locals 3
    .param p0, "cmykColor"    # Lcom/itextpdf/kernel/colors/DeviceCmyk;

    .line 106
    invoke-static {p0}, Lcom/itextpdf/kernel/colors/DeviceCmyk;->convertCmykToRgb(Lcom/itextpdf/kernel/colors/DeviceCmyk;)Lcom/itextpdf/kernel/colors/DeviceRgb;

    move-result-object v0

    .line 107
    .local v0, "rgbEquivalent":Lcom/itextpdf/kernel/colors/DeviceRgb;
    invoke-static {v0}, Lcom/itextpdf/kernel/colors/DeviceRgb;->makeLighter(Lcom/itextpdf/kernel/colors/DeviceRgb;)Lcom/itextpdf/kernel/colors/DeviceRgb;

    move-result-object v1

    .line 108
    .local v1, "lighterRgb":Lcom/itextpdf/kernel/colors/DeviceRgb;
    invoke-static {v1}, Lcom/itextpdf/kernel/colors/DeviceCmyk;->convertRgbToCmyk(Lcom/itextpdf/kernel/colors/DeviceRgb;)Lcom/itextpdf/kernel/colors/DeviceCmyk;

    move-result-object v2

    return-object v2
.end method
