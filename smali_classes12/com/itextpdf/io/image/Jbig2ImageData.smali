.class public Lcom/itextpdf/io/image/Jbig2ImageData;
.super Lcom/itextpdf/io/image/ImageData;
.source "Jbig2ImageData.java"


# instance fields
.field private page:I


# direct methods
.method protected constructor <init>(Ljava/net/URL;I)V
    .locals 1
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "page"    # I

    .line 43
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->JBIG2:Lcom/itextpdf/io/image/ImageType;

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/io/image/ImageData;-><init>(Ljava/net/URL;Lcom/itextpdf/io/image/ImageType;)V

    .line 44
    iput p2, p0, Lcom/itextpdf/io/image/Jbig2ImageData;->page:I

    .line 45
    return-void
.end method

.method protected constructor <init>([BI)V
    .locals 1
    .param p1, "bytes"    # [B
    .param p2, "page"    # I

    .line 48
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->JBIG2:Lcom/itextpdf/io/image/ImageType;

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/io/image/ImageData;-><init>([BLcom/itextpdf/io/image/ImageType;)V

    .line 49
    iput p2, p0, Lcom/itextpdf/io/image/Jbig2ImageData;->page:I

    .line 50
    return-void
.end method

.method public static getNumberOfPages(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)I
    .locals 3
    .param p0, "raf"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    .line 73
    :try_start_0
    new-instance v0, Lcom/itextpdf/io/codec/Jbig2SegmentReader;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/codec/Jbig2SegmentReader;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)V

    .line 74
    .local v0, "sr":Lcom/itextpdf/io/codec/Jbig2SegmentReader;
    invoke-virtual {v0}, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->read()V

    .line 75
    invoke-virtual {v0}, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->numberOfPages()I

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    .line 76
    .end local v0    # "sr":Lcom/itextpdf/io/codec/Jbig2SegmentReader;
    :catch_0
    move-exception v0

    .line 77
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "JBIG2 image exception."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static getNumberOfPages([B)I
    .locals 2
    .param p0, "bytes"    # [B

    .line 62
    new-instance v0, Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    invoke-direct {v0}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;-><init>()V

    invoke-virtual {v0, p0}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource([B)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v0

    .line 63
    .local v0, "ras":Lcom/itextpdf/io/source/IRandomAccessSource;
    new-instance v1, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-direct {v1, v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    invoke-static {v1}, Lcom/itextpdf/io/image/Jbig2ImageData;->getNumberOfPages(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)I

    move-result v1

    return v1
.end method


# virtual methods
.method public canImageBeInline()Z
    .locals 2

    .line 83
    const-class v0, Lcom/itextpdf/io/image/ImageData;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 84
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "Image cannot be inline if it has JBIG2Decode filter. It will be added as an ImageXObject"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 85
    const/4 v1, 0x0

    return v1
.end method

.method public getPage()I
    .locals 1

    .line 53
    iget v0, p0, Lcom/itextpdf/io/image/Jbig2ImageData;->page:I

    return v0
.end method
