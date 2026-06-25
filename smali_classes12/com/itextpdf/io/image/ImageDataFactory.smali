.class public final Lcom/itextpdf/io/image/ImageDataFactory;
.super Ljava/lang/Object;
.source "ImageDataFactory.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    return-void
.end method

.method public static create(IIII[B[I)Lcom/itextpdf/io/image/ImageData;
    .locals 8
    .param p0, "width"    # I
    .param p1, "height"    # I
    .param p2, "components"    # I
    .param p3, "bpc"    # I
    .param p4, "data"    # [B
    .param p5, "transparency"    # [I

    .line 144
    if-eqz p5, :cond_1

    array-length v0, p5

    mul-int/lit8 v1, p2, 0x2

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 145
    :cond_0
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v1, "Transparency length must be equal to 2 with CCITT images"

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 146
    :cond_1
    :goto_0
    const/4 v0, 0x1

    if-ne p2, v0, :cond_2

    if-ne p3, v0, :cond_2

    .line 147
    invoke-static {p4, p0, p1}, Lcom/itextpdf/io/codec/CCITTG4Encoder;->compress([BII)[B

    move-result-object v6

    .line 148
    .local v6, "g4":[B
    const/16 v4, 0x100

    const/4 v5, 0x1

    const/4 v3, 0x0

    move v1, p0

    move v2, p1

    move-object v7, p5

    .end local p0    # "width":I
    .end local p1    # "height":I
    .end local p5    # "transparency":[I
    .local v1, "width":I
    .local v2, "height":I
    .local v7, "transparency":[I
    invoke-static/range {v1 .. v7}, Lcom/itextpdf/io/image/ImageDataFactory;->create(IIZII[B[I)Lcom/itextpdf/io/image/ImageData;

    move-result-object p0

    return-object p0

    .line 146
    .end local v1    # "width":I
    .end local v2    # "height":I
    .end local v6    # "g4":[B
    .end local v7    # "transparency":[I
    .restart local p0    # "width":I
    .restart local p1    # "height":I
    .restart local p5    # "transparency":[I
    :cond_2
    move v1, p0

    move v2, p1

    move-object v7, p5

    .line 150
    .end local p0    # "width":I
    .end local p1    # "height":I
    .end local p5    # "transparency":[I
    .restart local v1    # "width":I
    .restart local v2    # "height":I
    .restart local v7    # "transparency":[I
    new-instance p0, Lcom/itextpdf/io/image/RawImageData;

    sget-object p1, Lcom/itextpdf/io/image/ImageType;->RAW:Lcom/itextpdf/io/image/ImageType;

    invoke-direct {p0, p4, p1}, Lcom/itextpdf/io/image/RawImageData;-><init>([BLcom/itextpdf/io/image/ImageType;)V

    .line 151
    .local p0, "image":Lcom/itextpdf/io/image/RawImageData;
    int-to-float p1, v2

    iput p1, p0, Lcom/itextpdf/io/image/RawImageData;->height:F

    .line 152
    int-to-float p1, v1

    iput p1, p0, Lcom/itextpdf/io/image/RawImageData;->width:F

    .line 153
    const/4 p1, 0x4

    if-eq p2, v0, :cond_4

    const/4 p5, 0x3

    if-eq p2, p5, :cond_4

    if-ne p2, p1, :cond_3

    goto :goto_1

    .line 154
    :cond_3
    new-instance p1, Lcom/itextpdf/io/exceptions/IOException;

    const-string p5, "Components must be 1, 3 or 4."

    invoke-direct {p1, p5}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 155
    :cond_4
    :goto_1
    if-eq p3, v0, :cond_6

    const/4 p5, 0x2

    if-eq p3, p5, :cond_6

    if-eq p3, p1, :cond_6

    const/16 p1, 0x8

    if-ne p3, p1, :cond_5

    goto :goto_2

    .line 156
    :cond_5
    new-instance p1, Lcom/itextpdf/io/exceptions/IOException;

    const-string p5, "Bits per component must be 1, 2, 4 or 8."

    invoke-direct {p1, p5}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 157
    :cond_6
    :goto_2
    iput p2, p0, Lcom/itextpdf/io/image/RawImageData;->colorEncodingComponentsNumber:I

    .line 158
    iput p3, p0, Lcom/itextpdf/io/image/RawImageData;->bpc:I

    .line 159
    iput-object p4, p0, Lcom/itextpdf/io/image/RawImageData;->data:[B

    .line 160
    iput-object v7, p0, Lcom/itextpdf/io/image/RawImageData;->transparency:[I

    .line 161
    return-object p0
.end method

.method public static create(IIZII[B[I)Lcom/itextpdf/io/image/ImageData;
    .locals 2
    .param p0, "width"    # I
    .param p1, "height"    # I
    .param p2, "reverseBits"    # Z
    .param p3, "typeCCITT"    # I
    .param p4, "parameters"    # I
    .param p5, "data"    # [B
    .param p6, "transparency"    # [I

    .line 116
    if-eqz p6, :cond_1

    array-length v0, p6

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 117
    :cond_0
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v1, "Transparency length must be equal to 2 with CCITT images"

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 118
    :cond_1
    :goto_0
    const/16 v0, 0x100

    if-eq p3, v0, :cond_3

    const/16 v0, 0x101

    if-eq p3, v0, :cond_3

    const/16 v0, 0x102

    if-ne p3, v0, :cond_2

    goto :goto_1

    .line 119
    :cond_2
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v1, "CCITT compression type must be CCITTG4, CCITTG3_1D or CCITTG3_2D."

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 120
    :cond_3
    :goto_1
    if-eqz p2, :cond_4

    .line 121
    invoke-static {p5}, Lcom/itextpdf/io/codec/TIFFFaxDecoder;->reverseBits([B)V

    .line 122
    :cond_4
    new-instance v0, Lcom/itextpdf/io/image/RawImageData;

    sget-object v1, Lcom/itextpdf/io/image/ImageType;->RAW:Lcom/itextpdf/io/image/ImageType;

    invoke-direct {v0, p5, v1}, Lcom/itextpdf/io/image/RawImageData;-><init>([BLcom/itextpdf/io/image/ImageType;)V

    .line 123
    .local v0, "image":Lcom/itextpdf/io/image/RawImageData;
    invoke-virtual {v0, p3}, Lcom/itextpdf/io/image/RawImageData;->setTypeCcitt(I)V

    .line 124
    int-to-float v1, p1

    iput v1, v0, Lcom/itextpdf/io/image/RawImageData;->height:F

    .line 125
    int-to-float v1, p0

    iput v1, v0, Lcom/itextpdf/io/image/RawImageData;->width:F

    .line 126
    iput p4, v0, Lcom/itextpdf/io/image/RawImageData;->colorEncodingComponentsNumber:I

    .line 127
    iput-object p6, v0, Lcom/itextpdf/io/image/RawImageData;->transparency:[I

    .line 128
    return-object v0
.end method

.method public static create(Ljava/awt/Image;Ljava/awt/Color;)Lcom/itextpdf/io/image/ImageData;
    .locals 1
    .param p0, "image"    # Ljava/awt/Image;
    .param p1, "color"    # Ljava/awt/Color;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 174
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->create(Ljava/awt/Image;Ljava/awt/Color;Z)Lcom/itextpdf/io/image/ImageData;

    move-result-object v0

    return-object v0
.end method

.method public static create(Ljava/awt/Image;Ljava/awt/Color;Z)Lcom/itextpdf/io/image/ImageData;
    .locals 1
    .param p0, "image"    # Ljava/awt/Image;
    .param p1, "color"    # Ljava/awt/Color;
    .param p2, "forceBW"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 187
    invoke-static {p0, p1, p2}, Lcom/itextpdf/io/image/AwtImageDataFactory;->create(Ljava/awt/Image;Ljava/awt/Color;Z)Lcom/itextpdf/io/image/ImageData;

    move-result-object v0

    return-object v0
.end method

.method public static create(Ljava/lang/String;)Lcom/itextpdf/io/image/ImageData;
    .locals 1
    .param p0, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 98
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->create(Ljava/lang/String;Z)Lcom/itextpdf/io/image/ImageData;

    move-result-object v0

    return-object v0
.end method

.method public static create(Ljava/lang/String;Z)Lcom/itextpdf/io/image/ImageData;
    .locals 1
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "recoverImage"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 88
    invoke-static {p0}, Lcom/itextpdf/io/util/UrlUtil;->toURL(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/itextpdf/io/image/ImageDataFactory;->create(Ljava/net/URL;Z)Lcom/itextpdf/io/image/ImageData;

    move-result-object v0

    return-object v0
.end method

.method public static create(Ljava/net/URL;)Lcom/itextpdf/io/image/ImageData;
    .locals 1
    .param p0, "url"    # Ljava/net/URL;

    .line 77
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->create(Ljava/net/URL;Z)Lcom/itextpdf/io/image/ImageData;

    move-result-object v0

    return-object v0
.end method

.method public static create(Ljava/net/URL;Z)Lcom/itextpdf/io/image/ImageData;
    .locals 1
    .param p0, "url"    # Ljava/net/URL;
    .param p1, "recoverImage"    # Z

    .line 68
    invoke-static {p0, p1}, Lcom/itextpdf/io/image/ImageDataFactory;->createImageInstance(Ljava/net/URL;Z)Lcom/itextpdf/io/image/ImageData;

    move-result-object v0

    return-object v0
.end method

.method public static create([B)Lcom/itextpdf/io/image/ImageData;
    .locals 1
    .param p0, "bytes"    # [B

    .line 58
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->create([BZ)Lcom/itextpdf/io/image/ImageData;

    move-result-object v0

    return-object v0
.end method

.method public static create([BZ)Lcom/itextpdf/io/image/ImageData;
    .locals 1
    .param p0, "bytes"    # [B
    .param p1, "recoverImage"    # Z

    .line 49
    invoke-static {p0, p1}, Lcom/itextpdf/io/image/ImageDataFactory;->createImageInstance([BZ)Lcom/itextpdf/io/image/ImageData;

    move-result-object v0

    return-object v0
.end method

.method public static createBmp(Ljava/net/URL;Z)Lcom/itextpdf/io/image/ImageData;
    .locals 1
    .param p0, "url"    # Ljava/net/URL;
    .param p1, "noHeader"    # Z

    .line 199
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->BMP:Lcom/itextpdf/io/image/ImageType;

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->validateImageType(Ljava/net/URL;Lcom/itextpdf/io/image/ImageType;)V

    .line 200
    new-instance v0, Lcom/itextpdf/io/image/BmpImageData;

    invoke-direct {v0, p0, p1}, Lcom/itextpdf/io/image/BmpImageData;-><init>(Ljava/net/URL;Z)V

    .line 201
    .local v0, "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v0}, Lcom/itextpdf/io/image/BmpImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 202
    return-object v0
.end method

.method public static createBmp([BZ)Lcom/itextpdf/io/image/ImageData;
    .locals 2
    .param p0, "bytes"    # [B
    .param p1, "noHeader"    # Z

    .line 213
    if-nez p1, :cond_1

    invoke-static {p0}, Lcom/itextpdf/io/image/ImageTypeDetector;->detectImageType([B)Lcom/itextpdf/io/image/ImageType;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/io/image/ImageType;->BMP:Lcom/itextpdf/io/image/ImageType;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 218
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "BMP image expected."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 214
    :cond_1
    :goto_0
    new-instance v0, Lcom/itextpdf/io/image/BmpImageData;

    invoke-direct {v0, p0, p1}, Lcom/itextpdf/io/image/BmpImageData;-><init>([BZ)V

    .line 215
    .local v0, "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v0}, Lcom/itextpdf/io/image/BmpImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 216
    return-object v0
.end method

.method public static createGif([B)Lcom/itextpdf/io/image/GifImageData;
    .locals 1
    .param p0, "bytes"    # [B

    .line 228
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->GIF:Lcom/itextpdf/io/image/ImageType;

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->validateImageType([BLcom/itextpdf/io/image/ImageType;)V

    .line 229
    new-instance v0, Lcom/itextpdf/io/image/GifImageData;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/image/GifImageData;-><init>([B)V

    .line 230
    .local v0, "image":Lcom/itextpdf/io/image/GifImageData;
    invoke-static {v0}, Lcom/itextpdf/io/image/GifImageHelper;->processImage(Lcom/itextpdf/io/image/GifImageData;)V

    .line 231
    return-object v0
.end method

.method public static createGifFrame(Ljava/net/URL;I)Lcom/itextpdf/io/image/ImageData;
    .locals 2
    .param p0, "url"    # Ljava/net/URL;
    .param p1, "frame"    # I

    .line 242
    filled-new-array {p1}, [I

    move-result-object v0

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->createGifFrames(Ljava/net/URL;[I)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/image/ImageData;

    return-object v0
.end method

.method public static createGifFrame([BI)Lcom/itextpdf/io/image/ImageData;
    .locals 2
    .param p0, "bytes"    # [B
    .param p1, "frame"    # I

    .line 253
    filled-new-array {p1}, [I

    move-result-object v0

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->createGifFrames([B[I)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/image/ImageData;

    return-object v0
.end method

.method public static createGifFrames(Ljava/net/URL;)Ljava/util/List;
    .locals 2
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/image/ImageData;",
            ">;"
        }
    .end annotation

    .line 302
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->GIF:Lcom/itextpdf/io/image/ImageType;

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->validateImageType(Ljava/net/URL;Lcom/itextpdf/io/image/ImageType;)V

    .line 303
    new-instance v0, Lcom/itextpdf/io/image/GifImageData;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/image/GifImageData;-><init>(Ljava/net/URL;)V

    .line 304
    .local v0, "image":Lcom/itextpdf/io/image/GifImageData;
    invoke-static {v0}, Lcom/itextpdf/io/image/GifImageHelper;->processImage(Lcom/itextpdf/io/image/GifImageData;)V

    .line 305
    invoke-virtual {v0}, Lcom/itextpdf/io/image/GifImageData;->getFrames()Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public static createGifFrames(Ljava/net/URL;[I)Ljava/util/List;
    .locals 2
    .param p0, "url"    # Ljava/net/URL;
    .param p1, "frameNumbers"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            "[I)",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/image/ImageData;",
            ">;"
        }
    .end annotation

    .line 277
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->GIF:Lcom/itextpdf/io/image/ImageType;

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->validateImageType(Ljava/net/URL;Lcom/itextpdf/io/image/ImageType;)V

    .line 278
    new-instance v0, Lcom/itextpdf/io/image/GifImageData;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/image/GifImageData;-><init>(Ljava/net/URL;)V

    .line 279
    .local v0, "image":Lcom/itextpdf/io/image/GifImageData;
    invoke-static {p1, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->processGifImageAndExtractFrames([ILcom/itextpdf/io/image/GifImageData;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public static createGifFrames([B)Ljava/util/List;
    .locals 2
    .param p0, "bytes"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/image/ImageData;",
            ">;"
        }
    .end annotation

    .line 289
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->GIF:Lcom/itextpdf/io/image/ImageType;

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->validateImageType([BLcom/itextpdf/io/image/ImageType;)V

    .line 290
    new-instance v0, Lcom/itextpdf/io/image/GifImageData;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/image/GifImageData;-><init>([B)V

    .line 291
    .local v0, "image":Lcom/itextpdf/io/image/GifImageData;
    invoke-static {v0}, Lcom/itextpdf/io/image/GifImageHelper;->processImage(Lcom/itextpdf/io/image/GifImageData;)V

    .line 292
    invoke-virtual {v0}, Lcom/itextpdf/io/image/GifImageData;->getFrames()Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public static createGifFrames([B[I)Ljava/util/List;
    .locals 2
    .param p0, "bytes"    # [B
    .param p1, "frameNumbers"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B[I)",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/image/ImageData;",
            ">;"
        }
    .end annotation

    .line 264
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->GIF:Lcom/itextpdf/io/image/ImageType;

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->validateImageType([BLcom/itextpdf/io/image/ImageType;)V

    .line 265
    new-instance v0, Lcom/itextpdf/io/image/GifImageData;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/image/GifImageData;-><init>([B)V

    .line 266
    .local v0, "image":Lcom/itextpdf/io/image/GifImageData;
    invoke-static {p1, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->processGifImageAndExtractFrames([ILcom/itextpdf/io/image/GifImageData;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method private static createImageInstance(Ljava/net/URL;Z)Lcom/itextpdf/io/image/ImageData;
    .locals 4
    .param p0, "source"    # Ljava/net/URL;
    .param p1, "recoverImage"    # Z

    .line 440
    invoke-static {p0}, Lcom/itextpdf/io/image/ImageTypeDetector;->detectImageType(Ljava/net/URL;)Lcom/itextpdf/io/image/ImageType;

    move-result-object v0

    .line 441
    .local v0, "imageType":Lcom/itextpdf/io/image/ImageType;
    sget-object v1, Lcom/itextpdf/io/image/ImageDataFactory$1;->$SwitchMap$com$itextpdf$io$image$ImageType:[I

    invoke-virtual {v0}, Lcom/itextpdf/io/image/ImageType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v1, :pswitch_data_0

    .line 478
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Image format cannot be recognized."

    invoke-direct {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 473
    :pswitch_0
    new-instance v1, Lcom/itextpdf/io/image/Jbig2ImageData;

    invoke-direct {v1, p0, v2}, Lcom/itextpdf/io/image/Jbig2ImageData;-><init>(Ljava/net/URL;I)V

    .line 474
    .local v1, "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v1}, Lcom/itextpdf/io/image/Jbig2ImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 475
    return-object v1

    .line 468
    .end local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    :pswitch_1
    new-instance v1, Lcom/itextpdf/io/image/TiffImageData;

    invoke-direct {v1, p0, p1, v2, v3}, Lcom/itextpdf/io/image/TiffImageData;-><init>(Ljava/net/URL;ZIZ)V

    .line 469
    .restart local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v1}, Lcom/itextpdf/io/image/TiffImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 470
    return-object v1

    .line 463
    .end local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    :pswitch_2
    new-instance v1, Lcom/itextpdf/io/image/BmpImageData;

    invoke-direct {v1, p0, v3}, Lcom/itextpdf/io/image/BmpImageData;-><init>(Ljava/net/URL;Z)V

    .line 464
    .restart local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 465
    return-object v1

    .line 458
    .end local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    :pswitch_3
    new-instance v1, Lcom/itextpdf/io/image/PngImageData;

    invoke-direct {v1, p0}, Lcom/itextpdf/io/image/PngImageData;-><init>(Ljava/net/URL;)V

    .line 459
    .restart local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 460
    return-object v1

    .line 453
    .end local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    :pswitch_4
    new-instance v1, Lcom/itextpdf/io/image/Jpeg2000ImageData;

    invoke-direct {v1, p0}, Lcom/itextpdf/io/image/Jpeg2000ImageData;-><init>(Ljava/net/URL;)V

    .line 454
    .restart local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v1}, Lcom/itextpdf/io/image/Jpeg2000ImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 455
    return-object v1

    .line 448
    .end local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    :pswitch_5
    new-instance v1, Lcom/itextpdf/io/image/JpegImageData;

    invoke-direct {v1, p0}, Lcom/itextpdf/io/image/JpegImageData;-><init>(Ljava/net/URL;)V

    .line 449
    .restart local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v1}, Lcom/itextpdf/io/image/JpegImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 450
    return-object v1

    .line 443
    .end local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    :pswitch_6
    new-instance v1, Lcom/itextpdf/io/image/GifImageData;

    invoke-direct {v1, p0}, Lcom/itextpdf/io/image/GifImageData;-><init>(Ljava/net/URL;)V

    .line 444
    .local v1, "image":Lcom/itextpdf/io/image/GifImageData;
    invoke-static {v1, v3}, Lcom/itextpdf/io/image/GifImageHelper;->processImage(Lcom/itextpdf/io/image/GifImageData;I)V

    .line 445
    invoke-virtual {v1}, Lcom/itextpdf/io/image/GifImageData;->getFrames()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/io/image/ImageData;

    return-object v2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static createImageInstance([BZ)Lcom/itextpdf/io/image/ImageData;
    .locals 4
    .param p0, "bytes"    # [B
    .param p1, "recoverImage"    # Z

    .line 483
    invoke-static {p0}, Lcom/itextpdf/io/image/ImageTypeDetector;->detectImageType([B)Lcom/itextpdf/io/image/ImageType;

    move-result-object v0

    .line 484
    .local v0, "imageType":Lcom/itextpdf/io/image/ImageType;
    sget-object v1, Lcom/itextpdf/io/image/ImageDataFactory$1;->$SwitchMap$com$itextpdf$io$image$ImageType:[I

    invoke-virtual {v0}, Lcom/itextpdf/io/image/ImageType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v1, :pswitch_data_0

    .line 521
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Image format cannot be recognized."

    invoke-direct {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 516
    :pswitch_0
    new-instance v1, Lcom/itextpdf/io/image/Jbig2ImageData;

    invoke-direct {v1, p0, v2}, Lcom/itextpdf/io/image/Jbig2ImageData;-><init>([BI)V

    .line 517
    .local v1, "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v1}, Lcom/itextpdf/io/image/Jbig2ImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 518
    return-object v1

    .line 511
    .end local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    :pswitch_1
    new-instance v1, Lcom/itextpdf/io/image/TiffImageData;

    invoke-direct {v1, p0, p1, v2, v3}, Lcom/itextpdf/io/image/TiffImageData;-><init>([BZIZ)V

    .line 512
    .restart local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v1}, Lcom/itextpdf/io/image/TiffImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 513
    return-object v1

    .line 506
    .end local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    :pswitch_2
    new-instance v1, Lcom/itextpdf/io/image/BmpImageData;

    invoke-direct {v1, p0, v3}, Lcom/itextpdf/io/image/BmpImageData;-><init>([BZ)V

    .line 507
    .restart local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v1}, Lcom/itextpdf/io/image/BmpImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 508
    return-object v1

    .line 501
    .end local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    :pswitch_3
    new-instance v1, Lcom/itextpdf/io/image/PngImageData;

    invoke-direct {v1, p0}, Lcom/itextpdf/io/image/PngImageData;-><init>([B)V

    .line 502
    .restart local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v1}, Lcom/itextpdf/io/image/PngImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 503
    return-object v1

    .line 496
    .end local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    :pswitch_4
    new-instance v1, Lcom/itextpdf/io/image/Jpeg2000ImageData;

    invoke-direct {v1, p0}, Lcom/itextpdf/io/image/Jpeg2000ImageData;-><init>([B)V

    .line 497
    .restart local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v1}, Lcom/itextpdf/io/image/Jpeg2000ImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 498
    return-object v1

    .line 491
    .end local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    :pswitch_5
    new-instance v1, Lcom/itextpdf/io/image/JpegImageData;

    invoke-direct {v1, p0}, Lcom/itextpdf/io/image/JpegImageData;-><init>([B)V

    .line 492
    .restart local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v1}, Lcom/itextpdf/io/image/JpegImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 493
    return-object v1

    .line 486
    .end local v1    # "image":Lcom/itextpdf/io/image/ImageData;
    :pswitch_6
    new-instance v1, Lcom/itextpdf/io/image/GifImageData;

    invoke-direct {v1, p0}, Lcom/itextpdf/io/image/GifImageData;-><init>([B)V

    .line 487
    .local v1, "image":Lcom/itextpdf/io/image/GifImageData;
    invoke-static {v1, v3}, Lcom/itextpdf/io/image/GifImageHelper;->processImage(Lcom/itextpdf/io/image/GifImageData;I)V

    .line 488
    invoke-virtual {v1}, Lcom/itextpdf/io/image/GifImageData;->getFrames()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/io/image/ImageData;

    return-object v2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static createJbig2(Ljava/net/URL;I)Lcom/itextpdf/io/image/ImageData;
    .locals 2
    .param p0, "url"    # Ljava/net/URL;
    .param p1, "page"    # I

    .line 309
    const/4 v0, 0x1

    if-lt p1, v0, :cond_0

    .line 311
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->JBIG2:Lcom/itextpdf/io/image/ImageType;

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->validateImageType(Ljava/net/URL;Lcom/itextpdf/io/image/ImageType;)V

    .line 312
    new-instance v0, Lcom/itextpdf/io/image/Jbig2ImageData;

    invoke-direct {v0, p0, p1}, Lcom/itextpdf/io/image/Jbig2ImageData;-><init>(Ljava/net/URL;I)V

    .line 313
    .local v0, "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v0}, Lcom/itextpdf/io/image/Jbig2ImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 314
    return-object v0

    .line 310
    .end local v0    # "image":Lcom/itextpdf/io/image/ImageData;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The page number must be greater than 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static createJbig2([BI)Lcom/itextpdf/io/image/ImageData;
    .locals 2
    .param p0, "bytes"    # [B
    .param p1, "page"    # I

    .line 318
    const/4 v0, 0x1

    if-lt p1, v0, :cond_0

    .line 320
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->JBIG2:Lcom/itextpdf/io/image/ImageType;

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->validateImageType([BLcom/itextpdf/io/image/ImageType;)V

    .line 321
    new-instance v0, Lcom/itextpdf/io/image/Jbig2ImageData;

    invoke-direct {v0, p0, p1}, Lcom/itextpdf/io/image/Jbig2ImageData;-><init>([BI)V

    .line 322
    .local v0, "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v0}, Lcom/itextpdf/io/image/Jbig2ImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 323
    return-object v0

    .line 319
    .end local v0    # "image":Lcom/itextpdf/io/image/ImageData;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The page number must be greater than 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static createJpeg(Ljava/net/URL;)Lcom/itextpdf/io/image/ImageData;
    .locals 1
    .param p0, "url"    # Ljava/net/URL;

    .line 333
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->JPEG:Lcom/itextpdf/io/image/ImageType;

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->validateImageType(Ljava/net/URL;Lcom/itextpdf/io/image/ImageType;)V

    .line 334
    new-instance v0, Lcom/itextpdf/io/image/JpegImageData;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/image/JpegImageData;-><init>(Ljava/net/URL;)V

    .line 335
    .local v0, "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v0}, Lcom/itextpdf/io/image/JpegImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 336
    return-object v0
.end method

.method public static createJpeg([B)Lcom/itextpdf/io/image/ImageData;
    .locals 1
    .param p0, "bytes"    # [B

    .line 340
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->JPEG:Lcom/itextpdf/io/image/ImageType;

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->validateImageType([BLcom/itextpdf/io/image/ImageType;)V

    .line 341
    new-instance v0, Lcom/itextpdf/io/image/JpegImageData;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/image/JpegImageData;-><init>([B)V

    .line 342
    .local v0, "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v0}, Lcom/itextpdf/io/image/JpegImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 343
    return-object v0
.end method

.method public static createJpeg2000(Ljava/net/URL;)Lcom/itextpdf/io/image/ImageData;
    .locals 1
    .param p0, "url"    # Ljava/net/URL;

    .line 348
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->JPEG2000:Lcom/itextpdf/io/image/ImageType;

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->validateImageType(Ljava/net/URL;Lcom/itextpdf/io/image/ImageType;)V

    .line 349
    new-instance v0, Lcom/itextpdf/io/image/Jpeg2000ImageData;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/image/Jpeg2000ImageData;-><init>(Ljava/net/URL;)V

    .line 350
    .local v0, "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v0}, Lcom/itextpdf/io/image/Jpeg2000ImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 351
    return-object v0
.end method

.method public static createJpeg2000([B)Lcom/itextpdf/io/image/ImageData;
    .locals 1
    .param p0, "bytes"    # [B

    .line 355
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->JPEG2000:Lcom/itextpdf/io/image/ImageType;

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->validateImageType([BLcom/itextpdf/io/image/ImageType;)V

    .line 356
    new-instance v0, Lcom/itextpdf/io/image/Jpeg2000ImageData;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/image/Jpeg2000ImageData;-><init>([B)V

    .line 357
    .local v0, "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v0}, Lcom/itextpdf/io/image/Jpeg2000ImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 358
    return-object v0
.end method

.method public static createPng(Ljava/net/URL;)Lcom/itextpdf/io/image/ImageData;
    .locals 1
    .param p0, "url"    # Ljava/net/URL;

    .line 362
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->PNG:Lcom/itextpdf/io/image/ImageType;

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->validateImageType(Ljava/net/URL;Lcom/itextpdf/io/image/ImageType;)V

    .line 363
    new-instance v0, Lcom/itextpdf/io/image/PngImageData;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/image/PngImageData;-><init>(Ljava/net/URL;)V

    .line 364
    .local v0, "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v0}, Lcom/itextpdf/io/image/PngImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 365
    return-object v0
.end method

.method public static createPng([B)Lcom/itextpdf/io/image/ImageData;
    .locals 1
    .param p0, "bytes"    # [B

    .line 369
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->PNG:Lcom/itextpdf/io/image/ImageType;

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->validateImageType([BLcom/itextpdf/io/image/ImageType;)V

    .line 370
    new-instance v0, Lcom/itextpdf/io/image/PngImageData;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/image/PngImageData;-><init>([B)V

    .line 371
    .local v0, "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v0}, Lcom/itextpdf/io/image/PngImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 372
    return-object v0
.end method

.method public static createRawImage([B)Lcom/itextpdf/io/image/ImageData;
    .locals 2
    .param p0, "bytes"    # [B

    .line 390
    new-instance v0, Lcom/itextpdf/io/image/RawImageData;

    sget-object v1, Lcom/itextpdf/io/image/ImageType;->RAW:Lcom/itextpdf/io/image/ImageType;

    invoke-direct {v0, p0, v1}, Lcom/itextpdf/io/image/RawImageData;-><init>([BLcom/itextpdf/io/image/ImageType;)V

    return-object v0
.end method

.method public static createTiff(Ljava/net/URL;ZIZ)Lcom/itextpdf/io/image/ImageData;
    .locals 1
    .param p0, "url"    # Ljava/net/URL;
    .param p1, "recoverFromImageError"    # Z
    .param p2, "page"    # I
    .param p3, "direct"    # Z

    .line 376
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->TIFF:Lcom/itextpdf/io/image/ImageType;

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->validateImageType(Ljava/net/URL;Lcom/itextpdf/io/image/ImageType;)V

    .line 377
    new-instance v0, Lcom/itextpdf/io/image/TiffImageData;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/itextpdf/io/image/TiffImageData;-><init>(Ljava/net/URL;ZIZ)V

    .line 378
    .local v0, "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v0}, Lcom/itextpdf/io/image/TiffImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 379
    return-object v0
.end method

.method public static createTiff([BZIZ)Lcom/itextpdf/io/image/ImageData;
    .locals 1
    .param p0, "bytes"    # [B
    .param p1, "recoverFromImageError"    # Z
    .param p2, "page"    # I
    .param p3, "direct"    # Z

    .line 383
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->TIFF:Lcom/itextpdf/io/image/ImageType;

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/ImageDataFactory;->validateImageType([BLcom/itextpdf/io/image/ImageType;)V

    .line 384
    new-instance v0, Lcom/itextpdf/io/image/TiffImageData;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/itextpdf/io/image/TiffImageData;-><init>([BZIZ)V

    .line 385
    .local v0, "image":Lcom/itextpdf/io/image/ImageData;
    invoke-static {v0}, Lcom/itextpdf/io/image/TiffImageHelper;->processImage(Lcom/itextpdf/io/image/ImageData;)V

    .line 386
    return-object v0
.end method

.method public static isSupportedType(Lcom/itextpdf/io/image/ImageType;)Z
    .locals 1
    .param p0, "imageType"    # Lcom/itextpdf/io/image/ImageType;

    .line 434
    sget-object v0, Lcom/itextpdf/io/image/ImageType;->GIF:Lcom/itextpdf/io/image/ImageType;

    if-eq p0, v0, :cond_1

    sget-object v0, Lcom/itextpdf/io/image/ImageType;->JPEG:Lcom/itextpdf/io/image/ImageType;

    if-eq p0, v0, :cond_1

    sget-object v0, Lcom/itextpdf/io/image/ImageType;->JPEG2000:Lcom/itextpdf/io/image/ImageType;

    if-eq p0, v0, :cond_1

    sget-object v0, Lcom/itextpdf/io/image/ImageType;->PNG:Lcom/itextpdf/io/image/ImageType;

    if-eq p0, v0, :cond_1

    sget-object v0, Lcom/itextpdf/io/image/ImageType;->BMP:Lcom/itextpdf/io/image/ImageType;

    if-eq p0, v0, :cond_1

    sget-object v0, Lcom/itextpdf/io/image/ImageType;->TIFF:Lcom/itextpdf/io/image/ImageType;

    if-eq p0, v0, :cond_1

    sget-object v0, Lcom/itextpdf/io/image/ImageType;->JBIG2:Lcom/itextpdf/io/image/ImageType;

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static isSupportedType(Ljava/net/URL;)Z
    .locals 2
    .param p0, "source"    # Ljava/net/URL;

    .line 418
    if-nez p0, :cond_0

    .line 419
    const/4 v0, 0x0

    return v0

    .line 421
    :cond_0
    invoke-static {p0}, Lcom/itextpdf/io/image/ImageTypeDetector;->detectImageType(Ljava/net/URL;)Lcom/itextpdf/io/image/ImageType;

    move-result-object v0

    .line 422
    .local v0, "imageType":Lcom/itextpdf/io/image/ImageType;
    invoke-static {v0}, Lcom/itextpdf/io/image/ImageDataFactory;->isSupportedType(Lcom/itextpdf/io/image/ImageType;)Z

    move-result v1

    return v1
.end method

.method public static isSupportedType([B)Z
    .locals 2
    .param p0, "source"    # [B

    .line 402
    if-nez p0, :cond_0

    .line 403
    const/4 v0, 0x0

    return v0

    .line 405
    :cond_0
    invoke-static {p0}, Lcom/itextpdf/io/image/ImageTypeDetector;->detectImageType([B)Lcom/itextpdf/io/image/ImageType;

    move-result-object v0

    .line 406
    .local v0, "imageType":Lcom/itextpdf/io/image/ImageType;
    invoke-static {v0}, Lcom/itextpdf/io/image/ImageDataFactory;->isSupportedType(Lcom/itextpdf/io/image/ImageType;)Z

    move-result v1

    return v1
.end method

.method private static processGifImageAndExtractFrames([ILcom/itextpdf/io/image/GifImageData;)Ljava/util/List;
    .locals 6
    .param p0, "frameNumbers"    # [I
    .param p1, "image"    # Lcom/itextpdf/io/image/GifImageData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I",
            "Lcom/itextpdf/io/image/GifImageData;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/image/ImageData;",
            ">;"
        }
    .end annotation

    .line 526
    invoke-static {p0}, Ljava/util/Arrays;->sort([I)V

    .line 527
    array-length v0, p0

    add-int/lit8 v0, v0, -0x1

    aget v0, p0, v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {p1, v0}, Lcom/itextpdf/io/image/GifImageHelper;->processImage(Lcom/itextpdf/io/image/GifImageData;I)V

    .line 528
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 529
    .local v0, "frames":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/image/ImageData;>;"
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget v3, p0, v2

    .line 530
    .local v3, "frame":I
    invoke-virtual {p1}, Lcom/itextpdf/io/image/GifImageData;->getFrames()Ljava/util/List;

    move-result-object v4

    add-int/lit8 v5, v3, -0x1

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 529
    .end local v3    # "frame":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 532
    :cond_0
    return-object v0
.end method

.method private static validateImageType(Ljava/net/URL;Lcom/itextpdf/io/image/ImageType;)V
    .locals 4
    .param p0, "imageUrl"    # Ljava/net/URL;
    .param p1, "expectedType"    # Lcom/itextpdf/io/image/ImageType;

    .line 544
    invoke-static {p0}, Lcom/itextpdf/io/image/ImageTypeDetector;->detectImageType(Ljava/net/URL;)Lcom/itextpdf/io/image/ImageType;

    move-result-object v0

    .line 545
    .local v0, "detectedType":Lcom/itextpdf/io/image/ImageType;
    if-ne v0, p1, :cond_0

    .line 549
    return-void

    .line 546
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/itextpdf/io/image/ImageType;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " image expected. Detected image type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 547
    invoke-virtual {v0}, Lcom/itextpdf/io/image/ImageType;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static validateImageType([BLcom/itextpdf/io/image/ImageType;)V
    .locals 4
    .param p0, "image"    # [B
    .param p1, "expectedType"    # Lcom/itextpdf/io/image/ImageType;

    .line 536
    invoke-static {p0}, Lcom/itextpdf/io/image/ImageTypeDetector;->detectImageType([B)Lcom/itextpdf/io/image/ImageType;

    move-result-object v0

    .line 537
    .local v0, "detectedType":Lcom/itextpdf/io/image/ImageType;
    if-ne v0, p1, :cond_0

    .line 541
    return-void

    .line 538
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/itextpdf/io/image/ImageType;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " image expected. Detected image type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 539
    invoke-virtual {v0}, Lcom/itextpdf/io/image/ImageType;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
