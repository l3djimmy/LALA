.class public Lcom/itextpdf/kernel/colors/DeviceGray;
.super Lcom/itextpdf/kernel/colors/Color;
.source "DeviceGray.java"


# static fields
.field public static final BLACK:Lcom/itextpdf/kernel/colors/DeviceGray;

.field public static final GRAY:Lcom/itextpdf/kernel/colors/DeviceGray;

.field public static final WHITE:Lcom/itextpdf/kernel/colors/DeviceGray;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 38
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceGray;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/colors/DeviceGray;-><init>(F)V

    sput-object v0, Lcom/itextpdf/kernel/colors/DeviceGray;->WHITE:Lcom/itextpdf/kernel/colors/DeviceGray;

    .line 42
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceGray;

    const/high16 v1, 0x3f000000    # 0.5f

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/colors/DeviceGray;-><init>(F)V

    sput-object v0, Lcom/itextpdf/kernel/colors/DeviceGray;->GRAY:Lcom/itextpdf/kernel/colors/DeviceGray;

    .line 46
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceGray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/colors/DeviceGray;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/colors/DeviceGray;->BLACK:Lcom/itextpdf/kernel/colors/DeviceGray;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 69
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/colors/DeviceGray;-><init>(F)V

    .line 70
    return-void
.end method

.method public constructor <init>(F)V
    .locals 6
    .param p1, "value"    # F

    .line 58
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Gray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Gray;-><init>()V

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
    const/4 v4, 0x1

    new-array v4, v4, [F

    const/4 v5, 0x0

    aput v2, v4, v5

    invoke-direct {p0, v0, v4}, Lcom/itextpdf/kernel/colors/Color;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)V

    .line 59
    cmpl-float v0, p1, v1

    if-gtz v0, :cond_2

    cmpg-float v0, p1, v3

    if-gez v0, :cond_3

    .line 60
    :cond_2
    const-class v0, Lcom/itextpdf/kernel/colors/DeviceGray;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 61
    .local v0, "LOGGER":Lorg/slf4j/Logger;
    const-string v1, "Some of colorant intensities are invalid: they are bigger than 1 or less than 0. We will force them to become 1 or 0 respectively."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 63
    .end local v0    # "LOGGER":Lorg/slf4j/Logger;
    :cond_3
    return-void
.end method

.method public static makeDarker(Lcom/itextpdf/kernel/colors/DeviceGray;)Lcom/itextpdf/kernel/colors/DeviceGray;
    .locals 4
    .param p0, "grayColor"    # Lcom/itextpdf/kernel/colors/DeviceGray;

    .line 96
    invoke-virtual {p0}, Lcom/itextpdf/kernel/colors/DeviceGray;->getColorValue()[F

    move-result-object v0

    const/4 v1, 0x0

    aget v0, v0, v1

    .line 97
    .local v0, "v":F
    const v1, 0x3ea8f5c3    # 0.33f

    sub-float v1, v0, v1

    div-float/2addr v1, v0

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 99
    .local v1, "multiplier":F
    new-instance v2, Lcom/itextpdf/kernel/colors/DeviceGray;

    mul-float v3, v0, v1

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/colors/DeviceGray;-><init>(F)V

    return-object v2
.end method

.method public static makeLighter(Lcom/itextpdf/kernel/colors/DeviceGray;)Lcom/itextpdf/kernel/colors/DeviceGray;
    .locals 4
    .param p0, "grayColor"    # Lcom/itextpdf/kernel/colors/DeviceGray;

    .line 79
    invoke-virtual {p0}, Lcom/itextpdf/kernel/colors/DeviceGray;->getColorValue()[F

    move-result-object v0

    const/4 v1, 0x0

    aget v0, v0, v1

    .line 81
    .local v0, "v":F
    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-nez v1, :cond_0

    .line 82
    new-instance v1, Lcom/itextpdf/kernel/colors/DeviceGray;

    const v2, 0x3e99999a    # 0.3f

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/colors/DeviceGray;-><init>(F)V

    return-object v1

    .line 84
    :cond_0
    const v1, 0x3ea8f5c3    # 0.33f

    add-float/2addr v1, v0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    div-float/2addr v1, v0

    .line 86
    .local v1, "multiplier":F
    new-instance v2, Lcom/itextpdf/kernel/colors/DeviceGray;

    mul-float v3, v0, v1

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/colors/DeviceGray;-><init>(F)V

    return-object v2
.end method
