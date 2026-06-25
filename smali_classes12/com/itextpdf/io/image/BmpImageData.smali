.class public Lcom/itextpdf/io/image/BmpImageData;
.super Lcom/itextpdf/io/image/RawImageData;
.source "BmpImageData.java"


# instance fields
.field private final noHeader:Z


# direct methods
.method protected constructor <init>(Ljava/net/URL;Z)V
    .locals 1
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "noHeader"    # Z

    .line 37
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->BMP:Lcom/itextpdf/io/image/ImageType;

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/io/image/RawImageData;-><init>(Ljava/net/URL;Lcom/itextpdf/io/image/ImageType;)V

    .line 38
    iput-boolean p2, p0, Lcom/itextpdf/io/image/BmpImageData;->noHeader:Z

    .line 39
    return-void
.end method

.method protected constructor <init>([BZ)V
    .locals 1
    .param p1, "bytes"    # [B
    .param p2, "noHeader"    # Z

    .line 47
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->BMP:Lcom/itextpdf/io/image/ImageType;

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/io/image/RawImageData;-><init>([BLcom/itextpdf/io/image/ImageType;)V

    .line 48
    iput-boolean p2, p0, Lcom/itextpdf/io/image/BmpImageData;->noHeader:Z

    .line 49
    return-void
.end method


# virtual methods
.method public isNoHeader()Z
    .locals 1

    .line 55
    iget-boolean v0, p0, Lcom/itextpdf/io/image/BmpImageData;->noHeader:Z

    return v0
.end method
