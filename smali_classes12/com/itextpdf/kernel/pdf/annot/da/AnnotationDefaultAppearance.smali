.class public Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;
.super Ljava/lang/Object;
.source "AnnotationDefaultAppearance.java"


# static fields
.field private static final extAnnotFontNames:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final stdAnnotFontNames:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private colorOperand:Ljava/lang/String;

.field private fontSize:F

.field private rawFontName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->stdAnnotFontNames:Ljava/util/Map;

    .line 50
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->extAnnotFontNames:Ljava/util/Map;

    .line 52
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->stdAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;->CourierBoldOblique:Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;

    const-string v2, "/Courier-BoldOblique"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->stdAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;->CourierBold:Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;

    const-string v2, "/Courier-Bold"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->stdAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;->CourierOblique:Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;

    const-string v2, "/Courier-Oblique"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->stdAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;->Courier:Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;

    const-string v3, "/Courier"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->stdAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;->HelveticaBoldOblique:Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;

    const-string v3, "/Helvetica-BoldOblique"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->stdAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;->HelveticaBold:Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;

    const-string v3, "/Helvetica-Bold"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->stdAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;->HelveticaOblique:Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->stdAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;->Helvetica:Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;

    const-string v2, "/Helvetica"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->stdAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;->Symbol:Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;

    const-string v2, "/Symbol"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->stdAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;->TimesBoldItalic:Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;

    const-string v2, "/Times-BoldItalic"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->stdAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;->TimesBold:Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;

    const-string v2, "/Times-Bold"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->stdAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;->TimesItalic:Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;

    const-string v2, "/Times-Italic"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->stdAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;->TimesRoman:Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;

    const-string v2, "/Times-Roman"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->stdAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;->ZapfDingbats:Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;

    const-string v2, "/ZapfDingbats"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->extAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;->HYSMyeongJoMedium:Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;

    const-string v2, "/HySm"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->extAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;->HYGoThicMedium:Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;

    const-string v3, "/HyGo"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->extAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;->HeiseiKakuGoW5:Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;

    const-string v3, "/KaGo"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->extAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;->HeiseiMinW3:Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;

    const-string v3, "/KaMi"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->extAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;->MHeiMedium:Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;

    const-string v4, "/MHei"

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->extAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;->MSungLight:Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;

    const-string v4, "/MSun"

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->extAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;->STSongLight:Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;

    const-string v5, "/STSo"

    invoke-interface {v0, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->extAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;->MSungStdLight:Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->extAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;->STSongStdLight:Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;

    invoke-interface {v0, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->extAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;->HYSMyeongJoStdMedium:Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->extAnnotFontNames:Ljava/util/Map;

    sget-object v1, Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;->KozMinProRegular:Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    const-string v0, "0 g"

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->colorOperand:Ljava/lang/String;

    .line 81
    const-string v0, "/Helv"

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->rawFontName:Ljava/lang/String;

    .line 82
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->fontSize:F

    .line 91
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;->Helvetica:Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->setFont(Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;)Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;

    .line 92
    const/high16 v0, 0x41400000    # 12.0f

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->setFontSize(F)Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;

    .line 93
    return-void
.end method

.method private setColorOperand([FLjava/lang/String;)V
    .locals 6
    .param p1, "colorValues"    # [F
    .param p2, "operand"    # Ljava/lang/String;

    .line 176
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 177
    .local v0, "builder":Ljava/lang/StringBuilder;
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget v3, p1, v2

    .line 178
    .local v3, "value":F
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const-string/jumbo v5, "{0} "

    invoke-static {v5, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .end local v3    # "value":F
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 180
    :cond_0
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->colorOperand:Ljava/lang/String;

    .line 182
    return-void
.end method

.method private setRawFontName(Ljava/lang/String;)V
    .locals 2
    .param p1, "rawFontName"    # Ljava/lang/String;

    .line 185
    if-eqz p1, :cond_0

    .line 188
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->rawFontName:Ljava/lang/String;

    .line 189
    return-void

    .line 186
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Passed raw font name can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public setColor(Lcom/itextpdf/kernel/colors/DeviceCmyk;)Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;
    .locals 2
    .param p1, "cmykColor"    # Lcom/itextpdf/kernel/colors/DeviceCmyk;

    .line 150
    invoke-virtual {p1}, Lcom/itextpdf/kernel/colors/DeviceCmyk;->getColorValue()[F

    move-result-object v0

    const-string v1, "k"

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->setColorOperand([FLjava/lang/String;)V

    .line 151
    return-object p0
.end method

.method public setColor(Lcom/itextpdf/kernel/colors/DeviceGray;)Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;
    .locals 2
    .param p1, "grayColor"    # Lcom/itextpdf/kernel/colors/DeviceGray;

    .line 162
    invoke-virtual {p1}, Lcom/itextpdf/kernel/colors/DeviceGray;->getColorValue()[F

    move-result-object v0

    const-string v1, "g"

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->setColorOperand([FLjava/lang/String;)V

    .line 163
    return-object p0
.end method

.method public setColor(Lcom/itextpdf/kernel/colors/DeviceRgb;)Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;
    .locals 2
    .param p1, "rgbColor"    # Lcom/itextpdf/kernel/colors/DeviceRgb;

    .line 138
    invoke-virtual {p1}, Lcom/itextpdf/kernel/colors/DeviceRgb;->getColorValue()[F

    move-result-object v0

    const-string/jumbo v1, "rg"

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->setColorOperand([FLjava/lang/String;)V

    .line 139
    return-object p0
.end method

.method public setFont(Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;)Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;
    .locals 1
    .param p1, "font"    # Lcom/itextpdf/kernel/pdf/annot/da/ExtendedAnnotationFont;

    .line 115
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->extAnnotFontNames:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->setRawFontName(Ljava/lang/String;)V

    .line 116
    return-object p0
.end method

.method public setFont(Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;)Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;
    .locals 1
    .param p1, "font"    # Lcom/itextpdf/kernel/pdf/annot/da/StandardAnnotationFont;

    .line 103
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->stdAnnotFontNames:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->setRawFontName(Ljava/lang/String;)V

    .line 104
    return-object p0
.end method

.method public setFontSize(F)Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;
    .locals 0
    .param p1, "fontSize"    # F

    .line 126
    iput p1, p0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->fontSize:F

    .line 127
    return-object p0
.end method

.method public toPdfString()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 4

    .line 172
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->rawFontName:Ljava/lang/String;

    iget v2, p0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->fontSize:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/annot/da/AnnotationDefaultAppearance;->colorOperand:Ljava/lang/String;

    filled-new-array {v1, v2, v3}, [Ljava/lang/Object;

    move-result-object v1

    const-string/jumbo v2, "{0} {1} Tf {2}"

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
