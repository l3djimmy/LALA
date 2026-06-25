.class public abstract Lcom/itextpdf/io/image/ImageData;
.super Ljava/lang/Object;
.source "ImageData.java"


# static fields
.field private static serialId:J

.field private static final staticLock:Ljava/lang/Object;


# instance fields
.field protected XYRatio:F

.field protected bpc:I

.field protected colorEncodingComponentsNumber:I

.field protected colorTransform:I

.field protected data:[B

.field protected decode:[F

.field protected decodeParms:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected deflated:Z

.field protected dpiX:I

.field protected dpiY:I

.field protected filter:Ljava/lang/String;

.field protected height:F

.field protected imageAttributes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected imageMask:Lcom/itextpdf/io/image/ImageData;

.field protected imageSize:I

.field protected interpolation:Z

.field protected inverted:Z

.field protected mask:Z

.field protected mySerialId:Ljava/lang/Long;

.field protected originalType:Lcom/itextpdf/io/image/ImageType;

.field protected profile:Lcom/itextpdf/io/colors/IccProfile;

.field protected rotation:F

.field protected transparency:[I

.field protected url:Ljava/net/URL;

.field protected width:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 42
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/itextpdf/io/image/ImageData;->serialId:J

    .line 44
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/itextpdf/io/image/ImageData;->staticLock:Ljava/lang/Object;

    return-void
.end method

.method protected constructor <init>(Ljava/net/URL;Lcom/itextpdf/io/image/ImageType;)V
    .locals 2
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "type"    # Lcom/itextpdf/io/image/ImageType;

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    const/4 v0, 0x1

    iput v0, p0, Lcom/itextpdf/io/image/ImageData;->bpc:I

    .line 63
    const/4 v1, -0x1

    iput v1, p0, Lcom/itextpdf/io/image/ImageData;->colorEncodingComponentsNumber:I

    .line 69
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/itextpdf/io/image/ImageData;->inverted:Z

    .line 75
    iput v1, p0, Lcom/itextpdf/io/image/ImageData;->dpiX:I

    .line 77
    iput v1, p0, Lcom/itextpdf/io/image/ImageData;->dpiY:I

    .line 79
    iput v0, p0, Lcom/itextpdf/io/image/ImageData;->colorTransform:I

    .line 83
    iput-boolean v1, p0, Lcom/itextpdf/io/image/ImageData;->mask:Z

    .line 89
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/io/image/ImageData;->XYRatio:F

    .line 95
    invoke-static {}, Lcom/itextpdf/io/image/ImageData;->getSerialId()Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/image/ImageData;->mySerialId:Ljava/lang/Long;

    .line 98
    iput-object p1, p0, Lcom/itextpdf/io/image/ImageData;->url:Ljava/net/URL;

    .line 99
    iput-object p2, p0, Lcom/itextpdf/io/image/ImageData;->originalType:Lcom/itextpdf/io/image/ImageType;

    .line 100
    return-void
.end method

.method protected constructor <init>([BLcom/itextpdf/io/image/ImageType;)V
    .locals 2
    .param p1, "bytes"    # [B
    .param p2, "type"    # Lcom/itextpdf/io/image/ImageType;

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    const/4 v0, 0x1

    iput v0, p0, Lcom/itextpdf/io/image/ImageData;->bpc:I

    .line 63
    const/4 v1, -0x1

    iput v1, p0, Lcom/itextpdf/io/image/ImageData;->colorEncodingComponentsNumber:I

    .line 69
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/itextpdf/io/image/ImageData;->inverted:Z

    .line 75
    iput v1, p0, Lcom/itextpdf/io/image/ImageData;->dpiX:I

    .line 77
    iput v1, p0, Lcom/itextpdf/io/image/ImageData;->dpiY:I

    .line 79
    iput v0, p0, Lcom/itextpdf/io/image/ImageData;->colorTransform:I

    .line 83
    iput-boolean v1, p0, Lcom/itextpdf/io/image/ImageData;->mask:Z

    .line 89
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/io/image/ImageData;->XYRatio:F

    .line 95
    invoke-static {}, Lcom/itextpdf/io/image/ImageData;->getSerialId()Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/image/ImageData;->mySerialId:Ljava/lang/Long;

    .line 103
    iput-object p1, p0, Lcom/itextpdf/io/image/ImageData;->data:[B

    .line 104
    iput-object p2, p0, Lcom/itextpdf/io/image/ImageData;->originalType:Lcom/itextpdf/io/image/ImageType;

    .line 105
    return-void
.end method

.method private static getSerialId()Ljava/lang/Long;
    .locals 5

    .line 341
    sget-object v0, Lcom/itextpdf/io/image/ImageData;->staticLock:Ljava/lang/Object;

    monitor-enter v0

    .line 342
    :try_start_0
    sget-wide v1, Lcom/itextpdf/io/image/ImageData;->serialId:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    sput-wide v1, Lcom/itextpdf/io/image/ImageData;->serialId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 343
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public canBeMask()Z
    .locals 3

    .line 207
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->isRawImage()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 208
    iget v0, p0, Lcom/itextpdf/io/image/ImageData;->bpc:I

    const/16 v2, 0xff

    if-le v0, v2, :cond_0

    .line 209
    return v1

    .line 211
    :cond_0
    iget v0, p0, Lcom/itextpdf/io/image/ImageData;->colorEncodingComponentsNumber:I

    if-ne v0, v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public canImageBeInline()Z
    .locals 4

    .line 313
    const-class v0, Lcom/itextpdf/io/image/ImageData;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 314
    .local v0, "logger":Lorg/slf4j/Logger;
    iget v1, p0, Lcom/itextpdf/io/image/ImageData;->imageSize:I

    const/16 v2, 0x1000

    const/4 v3, 0x0

    if-le v1, v2, :cond_0

    .line 315
    const-string v1, "Inline image size cannot be more than 4KB. It will be added as an ImageXObject"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 316
    return v3

    .line 318
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/io/image/ImageData;->imageMask:Lcom/itextpdf/io/image/ImageData;

    if-eqz v1, :cond_1

    .line 319
    const-string v1, "Image cannot be inline if it has a Mask"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 320
    return v3

    .line 322
    :cond_1
    const/4 v1, 0x1

    return v1
.end method

.method public getBpc()I
    .locals 1

    .line 257
    iget v0, p0, Lcom/itextpdf/io/image/ImageData;->bpc:I

    return v0
.end method

.method public getColorEncodingComponentsNumber()I
    .locals 1

    .line 190
    iget v0, p0, Lcom/itextpdf/io/image/ImageData;->colorEncodingComponentsNumber:I

    return v0
.end method

.method public getColorTransform()I
    .locals 1

    .line 165
    iget v0, p0, Lcom/itextpdf/io/image/ImageData;->colorTransform:I

    return v0
.end method

.method public getData()[B
    .locals 1

    .line 203
    iget-object v0, p0, Lcom/itextpdf/io/image/ImageData;->data:[B

    return-object v0
.end method

.method public getDecode()[F
    .locals 1

    .line 301
    iget-object v0, p0, Lcom/itextpdf/io/image/ImageData;->decode:[F

    return-object v0
.end method

.method public getDecodeParms()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 297
    iget-object v0, p0, Lcom/itextpdf/io/image/ImageData;->decodeParms:Ljava/util/Map;

    return-object v0
.end method

.method public getDpiX()I
    .locals 1

    .line 152
    iget v0, p0, Lcom/itextpdf/io/image/ImageData;->dpiX:I

    return v0
.end method

.method public getDpiY()I
    .locals 1

    .line 156
    iget v0, p0, Lcom/itextpdf/io/image/ImageData;->dpiY:I

    return v0
.end method

.method public getFilter()Ljava/lang/String;
    .locals 1

    .line 289
    iget-object v0, p0, Lcom/itextpdf/io/image/ImageData;->filter:Ljava/lang/String;

    return-object v0
.end method

.method public getHeight()F
    .locals 1

    .line 249
    iget v0, p0, Lcom/itextpdf/io/image/ImageData;->height:F

    return v0
.end method

.method public getImageAttributes()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 281
    iget-object v0, p0, Lcom/itextpdf/io/image/ImageData;->imageAttributes:Ljava/util/Map;

    return-object v0
.end method

.method public getImageMask()Lcom/itextpdf/io/image/ImageData;
    .locals 1

    .line 219
    iget-object v0, p0, Lcom/itextpdf/io/image/ImageData;->imageMask:Lcom/itextpdf/io/image/ImageData;

    return-object v0
.end method

.method public getOriginalType()Lcom/itextpdf/io/image/ImageType;
    .locals 1

    .line 181
    iget-object v0, p0, Lcom/itextpdf/io/image/ImageData;->originalType:Lcom/itextpdf/io/image/ImageType;

    return-object v0
.end method

.method public getProfile()Lcom/itextpdf/io/colors/IccProfile;
    .locals 1

    .line 144
    iget-object v0, p0, Lcom/itextpdf/io/image/ImageData;->profile:Lcom/itextpdf/io/colors/IccProfile;

    return-object v0
.end method

.method public getRotation()F
    .locals 1

    .line 136
    iget v0, p0, Lcom/itextpdf/io/image/ImageData;->rotation:F

    return v0
.end method

.method public getTransparency()[I
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/itextpdf/io/image/ImageData;->transparency:[I

    return-object v0
.end method

.method public getUrl()Ljava/net/URL;
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/itextpdf/io/image/ImageData;->url:Ljava/net/URL;

    return-object v0
.end method

.method public getWidth()F
    .locals 1

    .line 241
    iget v0, p0, Lcom/itextpdf/io/image/ImageData;->width:F

    return v0
.end method

.method public getXYRatio()F
    .locals 1

    .line 273
    iget v0, p0, Lcom/itextpdf/io/image/ImageData;->XYRatio:F

    return v0
.end method

.method public isDeflated()Z
    .locals 1

    .line 173
    iget-boolean v0, p0, Lcom/itextpdf/io/image/ImageData;->deflated:Z

    return v0
.end method

.method public isInterpolation()Z
    .locals 1

    .line 265
    iget-boolean v0, p0, Lcom/itextpdf/io/image/ImageData;->interpolation:Z

    return v0
.end method

.method public isInverted()Z
    .locals 1

    .line 128
    iget-boolean v0, p0, Lcom/itextpdf/io/image/ImageData;->inverted:Z

    return v0
.end method

.method public isMask()Z
    .locals 1

    .line 215
    iget-boolean v0, p0, Lcom/itextpdf/io/image/ImageData;->mask:Z

    return v0
.end method

.method public isRawImage()Z
    .locals 1

    .line 108
    const/4 v0, 0x0

    return v0
.end method

.method public isSoftMask()Z
    .locals 3

    .line 231
    iget-boolean v0, p0, Lcom/itextpdf/io/image/ImageData;->mask:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/itextpdf/io/image/ImageData;->bpc:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    iget v0, p0, Lcom/itextpdf/io/image/ImageData;->bpc:I

    const/16 v2, 0x8

    if-gt v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method loadData()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 331
    new-instance v0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    new-instance v1, Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    invoke-direct {v1}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;-><init>()V

    iget-object v2, p0, Lcom/itextpdf/io/image/ImageData;->url:Ljava/net/URL;

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource(Ljava/net/URL;)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    .line 332
    .local v0, "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    new-instance v1, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-direct {v1}, Lcom/itextpdf/io/source/ByteArrayOutputStream;-><init>()V

    .line 333
    .local v1, "stream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    invoke-static {v0, v1}, Lcom/itextpdf/io/util/StreamUtil;->transferBytes(Lcom/itextpdf/io/source/RandomAccessFileOrArray;Ljava/io/OutputStream;)V

    .line 334
    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V

    .line 335
    invoke-virtual {v1}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/io/image/ImageData;->data:[B

    .line 336
    return-void
.end method

.method public makeMask()V
    .locals 2

    .line 235
    invoke-virtual {p0}, Lcom/itextpdf/io/image/ImageData;->canBeMask()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 237
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/io/image/ImageData;->mask:Z

    .line 238
    return-void

    .line 236
    :cond_0
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v1, "This image can not be an image mask."

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setBpc(I)V
    .locals 0
    .param p1, "bpc"    # I

    .line 261
    iput p1, p0, Lcom/itextpdf/io/image/ImageData;->bpc:I

    .line 262
    return-void
.end method

.method public setColorEncodingComponentsNumber(I)V
    .locals 0
    .param p1, "colorEncodingComponentsNumber"    # I

    .line 199
    iput p1, p0, Lcom/itextpdf/io/image/ImageData;->colorEncodingComponentsNumber:I

    .line 200
    return-void
.end method

.method public setColorTransform(I)V
    .locals 0
    .param p1, "colorTransform"    # I

    .line 169
    iput p1, p0, Lcom/itextpdf/io/image/ImageData;->colorTransform:I

    .line 170
    return-void
.end method

.method public setDecode([F)V
    .locals 0
    .param p1, "decode"    # [F

    .line 305
    iput-object p1, p0, Lcom/itextpdf/io/image/ImageData;->decode:[F

    .line 306
    return-void
.end method

.method public setDeflated(Z)V
    .locals 0
    .param p1, "deflated"    # Z

    .line 177
    iput-boolean p1, p0, Lcom/itextpdf/io/image/ImageData;->deflated:Z

    .line 178
    return-void
.end method

.method public setDpi(II)V
    .locals 0
    .param p1, "dpiX"    # I
    .param p2, "dpiY"    # I

    .line 160
    iput p1, p0, Lcom/itextpdf/io/image/ImageData;->dpiX:I

    .line 161
    iput p2, p0, Lcom/itextpdf/io/image/ImageData;->dpiY:I

    .line 162
    return-void
.end method

.method public setFilter(Ljava/lang/String;)V
    .locals 0
    .param p1, "filter"    # Ljava/lang/String;

    .line 293
    iput-object p1, p0, Lcom/itextpdf/io/image/ImageData;->filter:Ljava/lang/String;

    .line 294
    return-void
.end method

.method public setHeight(F)V
    .locals 0
    .param p1, "height"    # F

    .line 253
    iput p1, p0, Lcom/itextpdf/io/image/ImageData;->height:F

    .line 254
    return-void
.end method

.method public setImageAttributes(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 285
    .local p1, "imageAttributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iput-object p1, p0, Lcom/itextpdf/io/image/ImageData;->imageAttributes:Ljava/util/Map;

    .line 286
    return-void
.end method

.method public setImageMask(Lcom/itextpdf/io/image/ImageData;)V
    .locals 2
    .param p1, "imageMask"    # Lcom/itextpdf/io/image/ImageData;

    .line 223
    iget-boolean v0, p0, Lcom/itextpdf/io/image/ImageData;->mask:Z

    if-nez v0, :cond_1

    .line 225
    iget-boolean v0, p1, Lcom/itextpdf/io/image/ImageData;->mask:Z

    if-eqz v0, :cond_0

    .line 227
    iput-object p1, p0, Lcom/itextpdf/io/image/ImageData;->imageMask:Lcom/itextpdf/io/image/ImageData;

    .line 228
    return-void

    .line 226
    :cond_0
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v1, "Image is not a mask. You must call ImageData#makeMask()."

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 224
    :cond_1
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v1, "Image mask cannot contain another image mask."

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setInterpolation(Z)V
    .locals 0
    .param p1, "interpolation"    # Z

    .line 269
    iput-boolean p1, p0, Lcom/itextpdf/io/image/ImageData;->interpolation:Z

    .line 270
    return-void
.end method

.method public setInverted(Z)V
    .locals 0
    .param p1, "inverted"    # Z

    .line 132
    iput-boolean p1, p0, Lcom/itextpdf/io/image/ImageData;->inverted:Z

    .line 133
    return-void
.end method

.method public setProfile(Lcom/itextpdf/io/colors/IccProfile;)V
    .locals 0
    .param p1, "profile"    # Lcom/itextpdf/io/colors/IccProfile;

    .line 148
    iput-object p1, p0, Lcom/itextpdf/io/image/ImageData;->profile:Lcom/itextpdf/io/colors/IccProfile;

    .line 149
    return-void
.end method

.method public setRotation(F)V
    .locals 0
    .param p1, "rotation"    # F

    .line 140
    iput p1, p0, Lcom/itextpdf/io/image/ImageData;->rotation:F

    .line 141
    return-void
.end method

.method public setTransparency([I)V
    .locals 0
    .param p1, "transparency"    # [I

    .line 124
    iput-object p1, p0, Lcom/itextpdf/io/image/ImageData;->transparency:[I

    .line 125
    return-void
.end method

.method public setUrl(Ljava/net/URL;)V
    .locals 0
    .param p1, "url"    # Ljava/net/URL;

    .line 116
    iput-object p1, p0, Lcom/itextpdf/io/image/ImageData;->url:Ljava/net/URL;

    .line 117
    return-void
.end method

.method public setWidth(F)V
    .locals 0
    .param p1, "width"    # F

    .line 245
    iput p1, p0, Lcom/itextpdf/io/image/ImageData;->width:F

    .line 246
    return-void
.end method

.method public setXYRatio(F)V
    .locals 0
    .param p1, "XYRatio"    # F

    .line 277
    iput p1, p0, Lcom/itextpdf/io/image/ImageData;->XYRatio:F

    .line 278
    return-void
.end method
