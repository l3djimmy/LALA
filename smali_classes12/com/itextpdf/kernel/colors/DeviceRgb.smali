.class public Lcom/itextpdf/kernel/colors/DeviceRgb;
.super Lcom/itextpdf/kernel/colors/Color;
.source "DeviceRgb.java"


# static fields
.field public static final BLACK:Lcom/itextpdf/kernel/colors/Color;

.field public static final BLUE:Lcom/itextpdf/kernel/colors/Color;

.field public static final GREEN:Lcom/itextpdf/kernel/colors/Color;

.field public static final RED:Lcom/itextpdf/kernel/colors/Color;

.field public static final WHITE:Lcom/itextpdf/kernel/colors/Color;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 38
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceRgb;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, v1}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(III)V

    sput-object v0, Lcom/itextpdf/kernel/colors/DeviceRgb;->BLACK:Lcom/itextpdf/kernel/colors/Color;

    .line 43
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceRgb;

    const/16 v2, 0xff

    invoke-direct {v0, v2, v2, v2}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(III)V

    sput-object v0, Lcom/itextpdf/kernel/colors/DeviceRgb;->WHITE:Lcom/itextpdf/kernel/colors/Color;

    .line 48
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceRgb;

    invoke-direct {v0, v2, v1, v1}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(III)V

    sput-object v0, Lcom/itextpdf/kernel/colors/DeviceRgb;->RED:Lcom/itextpdf/kernel/colors/Color;

    .line 53
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceRgb;

    invoke-direct {v0, v1, v2, v1}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(III)V

    sput-object v0, Lcom/itextpdf/kernel/colors/DeviceRgb;->GREEN:Lcom/itextpdf/kernel/colors/Color;

    .line 58
    new-instance v0, Lcom/itextpdf/kernel/colors/DeviceRgb;

    invoke-direct {v0, v1, v1, v2}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(III)V

    sput-object v0, Lcom/itextpdf/kernel/colors/DeviceRgb;->BLUE:Lcom/itextpdf/kernel/colors/Color;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 119
    const/4 v0, 0x0

    invoke-direct {p0, v0, v0, v0}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(FFF)V

    .line 120
    return-void
.end method

.method public constructor <init>(FFF)V
    .locals 8
    .param p1, "r"    # F
    .param p2, "g"    # F
    .param p3, "b"    # F

    .line 86
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Rgb;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Rgb;-><init>()V

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
    const/4 v6, 0x3

    new-array v6, v6, [F

    const/4 v7, 0x0

    aput v2, v6, v7

    const/4 v2, 0x1

    aput v4, v6, v2

    const/4 v2, 0x2

    aput v5, v6, v2

    invoke-direct {p0, v0, v6}, Lcom/itextpdf/kernel/colors/Color;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)V

    .line 91
    cmpl-float v0, p1, v1

    if-gtz v0, :cond_6

    cmpg-float v0, p1, v3

    if-ltz v0, :cond_6

    cmpl-float v0, p2, v1

    if-gtz v0, :cond_6

    cmpg-float v0, p2, v3

    if-ltz v0, :cond_6

    cmpl-float v0, p3, v1

    if-gtz v0, :cond_6

    cmpg-float v0, p3, v3

    if-gez v0, :cond_7

    .line 92
    :cond_6
    const-class v0, Lcom/itextpdf/kernel/colors/DeviceRgb;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 93
    .local v0, "LOGGER":Lorg/slf4j/Logger;
    const-string v1, "Some of colorant intensities are invalid: they are bigger than 1 or less than 0. We will force them to become 1 or 0 respectively."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 95
    .end local v0    # "LOGGER":Lorg/slf4j/Logger;
    :cond_7
    return-void
.end method

.method public constructor <init>(III)V
    .locals 4
    .param p1, "r"    # I
    .param p2, "g"    # I
    .param p3, "b"    # I

    .line 72
    int-to-float v0, p1

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr v0, v1

    int-to-float v2, p2

    div-float/2addr v2, v1

    int-to-float v3, p3

    div-float/2addr v3, v1

    invoke-direct {p0, v0, v2, v3}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(FFF)V

    .line 73
    return-void
.end method

.method public constructor <init>(Ljava/awt/Color;)V
    .locals 3
    .param p1, "color"    # Ljava/awt/Color;

    .line 107
    invoke-virtual {p1}, Ljava/awt/Color;->getRed()I

    move-result v0

    invoke-virtual {p1}, Ljava/awt/Color;->getGreen()I

    move-result v1

    invoke-virtual {p1}, Ljava/awt/Color;->getBlue()I

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(III)V

    .line 108
    invoke-virtual {p1}, Ljava/awt/Color;->getAlpha()I

    move-result v0

    const/16 v1, 0xff

    if-eq v0, v1, :cond_0

    .line 109
    const-class v0, Lcom/itextpdf/kernel/colors/DeviceRgb;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 110
    .local v0, "LOGGER":Lorg/slf4j/Logger;
    invoke-virtual {p1}, Ljava/awt/Color;->getAlpha()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Alpha channel {0} was ignored during color creation. Note that opacity can be achieved in some places by using \'setOpacity\' method or \'TransparentColor\' class"

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 112
    .end local v0    # "LOGGER":Lorg/slf4j/Logger;
    :cond_0
    return-void
.end method

.method public static makeDarker(Lcom/itextpdf/kernel/colors/DeviceRgb;)Lcom/itextpdf/kernel/colors/DeviceRgb;
    .locals 6
    .param p0, "rgbColor"    # Lcom/itextpdf/kernel/colors/DeviceRgb;

    .line 154
    invoke-virtual {p0}, Lcom/itextpdf/kernel/colors/DeviceRgb;->getColorValue()[F

    move-result-object v0

    const/4 v1, 0x0

    aget v0, v0, v1

    .line 155
    .local v0, "r":F
    invoke-virtual {p0}, Lcom/itextpdf/kernel/colors/DeviceRgb;->getColorValue()[F

    move-result-object v1

    const/4 v2, 0x1

    aget v1, v1, v2

    .line 156
    .local v1, "g":F
    invoke-virtual {p0}, Lcom/itextpdf/kernel/colors/DeviceRgb;->getColorValue()[F

    move-result-object v2

    const/4 v3, 0x2

    aget v2, v2, v3

    .line 158
    .local v2, "b":F
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 160
    .local v3, "v":F
    const v4, 0x3ea8f5c3    # 0.33f

    sub-float v4, v3, v4

    div-float/2addr v4, v3

    const/4 v5, 0x0

    invoke-static {v5, v4}, Ljava/lang/Math;->max(FF)F

    move-result v4

    .line 162
    .local v4, "multiplier":F
    mul-float/2addr v0, v4

    .line 163
    mul-float/2addr v1, v4

    .line 164
    mul-float/2addr v2, v4

    .line 165
    new-instance v5, Lcom/itextpdf/kernel/colors/DeviceRgb;

    invoke-direct {v5, v0, v1, v2}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(FFF)V

    return-object v5
.end method

.method public static makeLighter(Lcom/itextpdf/kernel/colors/DeviceRgb;)Lcom/itextpdf/kernel/colors/DeviceRgb;
    .locals 6
    .param p0, "rgbColor"    # Lcom/itextpdf/kernel/colors/DeviceRgb;

    .line 129
    invoke-virtual {p0}, Lcom/itextpdf/kernel/colors/DeviceRgb;->getColorValue()[F

    move-result-object v0

    const/4 v1, 0x0

    aget v0, v0, v1

    .line 130
    .local v0, "r":F
    invoke-virtual {p0}, Lcom/itextpdf/kernel/colors/DeviceRgb;->getColorValue()[F

    move-result-object v1

    const/4 v2, 0x1

    aget v1, v1, v2

    .line 131
    .local v1, "g":F
    invoke-virtual {p0}, Lcom/itextpdf/kernel/colors/DeviceRgb;->getColorValue()[F

    move-result-object v2

    const/4 v3, 0x2

    aget v2, v2, v3

    .line 133
    .local v2, "b":F
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 135
    .local v3, "v":F
    const/4 v4, 0x0

    cmpl-float v4, v3, v4

    if-nez v4, :cond_0

    .line 136
    new-instance v4, Lcom/itextpdf/kernel/colors/DeviceRgb;

    const/16 v5, 0x54

    invoke-direct {v4, v5, v5, v5}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(III)V

    return-object v4

    .line 139
    :cond_0
    const v4, 0x3ea8f5c3    # 0.33f

    add-float/2addr v4, v3

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v5, v4}, Ljava/lang/Math;->min(FF)F

    move-result v4

    div-float/2addr v4, v3

    .line 141
    .local v4, "multiplier":F
    mul-float/2addr v0, v4

    .line 142
    mul-float/2addr v1, v4

    .line 143
    mul-float/2addr v2, v4

    .line 144
    new-instance v5, Lcom/itextpdf/kernel/colors/DeviceRgb;

    invoke-direct {v5, v0, v1, v2}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(FFF)V

    return-object v5
.end method
