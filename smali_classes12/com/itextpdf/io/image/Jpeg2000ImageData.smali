.class public Lcom/itextpdf/io/image/Jpeg2000ImageData;
.super Lcom/itextpdf/io/image/ImageData;
.source "Jpeg2000ImageData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/image/Jpeg2000ImageData$ColorSpecBox;,
        Lcom/itextpdf/io/image/Jpeg2000ImageData$Parameters;
    }
.end annotation


# instance fields
.field protected parameters:Lcom/itextpdf/io/image/Jpeg2000ImageData$Parameters;


# direct methods
.method protected constructor <init>(Ljava/net/URL;)V
    .locals 1
    .param p1, "url"    # Ljava/net/URL;

    .line 76
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->JPEG2000:Lcom/itextpdf/io/image/ImageType;

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/io/image/ImageData;-><init>(Ljava/net/URL;Lcom/itextpdf/io/image/ImageType;)V

    .line 77
    return-void
.end method

.method protected constructor <init>([B)V
    .locals 1
    .param p1, "bytes"    # [B

    .line 80
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->JPEG2000:Lcom/itextpdf/io/image/ImageType;

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/io/image/ImageData;-><init>([BLcom/itextpdf/io/image/ImageType;)V

    .line 81
    return-void
.end method


# virtual methods
.method public canImageBeInline()Z
    .locals 2

    .line 85
    const-class v0, Lcom/itextpdf/io/image/ImageData;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 86
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "Image cannot be inline if it has JPXDecode filter. It will be added as an ImageXObject"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 87
    const/4 v1, 0x0

    return v1
.end method

.method public getParameters()Lcom/itextpdf/io/image/Jpeg2000ImageData$Parameters;
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/itextpdf/io/image/Jpeg2000ImageData;->parameters:Lcom/itextpdf/io/image/Jpeg2000ImageData$Parameters;

    return-object v0
.end method
