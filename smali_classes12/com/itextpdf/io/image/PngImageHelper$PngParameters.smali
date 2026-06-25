.class Lcom/itextpdf/io/image/PngImageHelper$PngParameters;
.super Ljava/lang/Object;
.source "PngImageHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/image/PngImageHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PngParameters"
.end annotation


# instance fields
.field XYRatio:F

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

.field bitDepth:I

.field bytesPerPixel:I

.field compressionMethod:I

.field dataStream:Ljava/io/InputStream;

.field dpiX:I

.field dpiY:I

.field filterMethod:I

.field genBWMask:Z

.field height:I

.field iccProfile:Lcom/itextpdf/io/colors/IccProfile;

.field idat:Lcom/itextpdf/io/source/ByteArrayOutputStream;

.field image:Lcom/itextpdf/io/image/PngImageData;

.field imageData:[B

.field inputBands:I

.field intent:Ljava/lang/String;

.field interlaceMethod:I

.field palShades:Z

.field smask:[B

.field trans:[B

.field transBlue:I

.field transGreen:I

.field transRedGray:I

.field width:I


# direct methods
.method constructor <init>(Lcom/itextpdf/io/image/PngImageData;)V
    .locals 1
    .param p1, "image"    # Lcom/itextpdf/io/image/PngImageData;

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->additional:Ljava/util/Map;

    .line 61
    new-instance v0, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-direct {v0}, Lcom/itextpdf/io/source/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->idat:Lcom/itextpdf/io/source/ByteArrayOutputStream;

    .line 67
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->transRedGray:I

    .line 68
    iput v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->transGreen:I

    .line 69
    iput v0, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->transBlue:I

    .line 45
    iput-object p1, p0, Lcom/itextpdf/io/image/PngImageHelper$PngParameters;->image:Lcom/itextpdf/io/image/PngImageData;

    .line 46
    return-void
.end method
