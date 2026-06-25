.class Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;
.super Ljava/lang/Object;
.source "BmpImageHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/image/BmpImageHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BmpParameters"
.end annotation


# instance fields
.field additional:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field alphaMask:I

.field bitmapFileSize:J

.field bitmapOffset:J

.field bitsPerPixel:I

.field blueMask:I

.field compression:J

.field greenMask:I

.field height:I

.field image:Lcom/itextpdf/io/image/BmpImageData;

.field imageSize:J

.field imageType:I

.field inputStream:Ljava/io/InputStream;

.field isBottomUp:Z

.field numBands:I

.field palette:[B

.field properties:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field redMask:I

.field width:I

.field xPelsPerMeter:J

.field yPelsPerMeter:J


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/image/BmpImageData;)V
    .locals 1
    .param p1, "image"    # Lcom/itextpdf/io/image/BmpImageData;

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->properties:Ljava/util/Map;

    .line 38
    iput-object p1, p0, Lcom/itextpdf/io/image/BmpImageHelper$BmpParameters;->image:Lcom/itextpdf/io/image/BmpImageData;

    .line 39
    return-void
.end method
