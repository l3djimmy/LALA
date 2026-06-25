.class public final Landroidx/camera/core/impl/utils/ExifOutputStream;
.super Ljava/io/FilterOutputStream;
.source "ExifOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/utils/ExifOutputStream$JpegHeader;
    }
.end annotation


# static fields
.field private static final BYTE_ALIGN_II:S = 0x4949s

.field private static final BYTE_ALIGN_MM:S = 0x4d4ds

.field private static final DEBUG:Z = false

.field private static final IDENTIFIER_EXIF_APP1:[B

.field private static final IFD_OFFSET:I = 0x8

.field private static final START_CODE:B = 0x2at

.field private static final STATE_FRAME_HEADER:I = 0x1

.field private static final STATE_JPEG_DATA:I = 0x2

.field private static final STATE_SOI:I = 0x0

.field private static final STREAMBUFFER_SIZE:I = 0x10000

.field private static final TAG:Ljava/lang/String; = "ExifOutputStream"


# instance fields
.field private final mBuffer:Ljava/nio/ByteBuffer;

.field private mByteToCopy:I

.field private mByteToSkip:I

.field private final mExifData:Landroidx/camera/core/impl/utils/ExifData;

.field private final mSingleByteArray:[B

.field private mState:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 83
    const-string v0, "Exif\u0000\u0000"

    sget-object v1, Landroidx/camera/core/impl/utils/ExifAttribute;->ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->IDENTIFIER_EXIF_APP1:[B

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Landroidx/camera/core/impl/utils/ExifData;)V
    .locals 2
    .param p1, "ou"    # Ljava/io/OutputStream;
    .param p2, "exifData"    # Landroidx/camera/core/impl/utils/ExifData;

    .line 107
    new-instance v0, Ljava/io/BufferedOutputStream;

    const/high16 v1, 0x10000

    invoke-direct {v0, p1, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    invoke-direct {p0, v0}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 94
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mSingleByteArray:[B

    .line 95
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    .line 96
    const/4 v0, 0x0

    iput v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mState:I

    .line 108
    iput-object p2, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    .line 109
    return-void
.end method

.method private requestByteToBuffer(I[BII)I
    .locals 3
    .param p1, "requestByteCount"    # I
    .param p2, "buffer"    # [B
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .line 112
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    sub-int v0, p1, v0

    .line 113
    .local v0, "byteNeeded":I
    invoke-static {p4, v0}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 114
    .local v1, "byteToRead":I
    iget-object v2, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2, p2, p3, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 115
    return v1
.end method

.method private writeExifSegment(Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;)V
    .locals 17
    .param p1, "dataOutputStream"    # Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 221
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    sget-object v2, Landroidx/camera/core/impl/utils/ExifData;->EXIF_TAGS:[[Landroidx/camera/core/impl/utils/ExifTag;

    array-length v2, v2

    new-array v2, v2, [I

    .line 222
    .local v2, "ifdOffsets":[I
    sget-object v3, Landroidx/camera/core/impl/utils/ExifData;->EXIF_TAGS:[[Landroidx/camera/core/impl/utils/ExifTag;

    array-length v3, v3

    new-array v3, v3, [I

    .line 225
    .local v3, "ifdDataSizes":[I
    sget-object v4, Landroidx/camera/core/impl/utils/ExifData;->EXIF_POINTER_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

    array-length v5, v4

    const/4 v6, 0x0

    move v7, v6

    :goto_0
    if-ge v7, v5, :cond_1

    aget-object v8, v4, v7

    .line 226
    .local v8, "tag":Landroidx/camera/core/impl/utils/ExifTag;
    const/4 v9, 0x0

    .local v9, "ifdIndex":I
    :goto_1
    sget-object v10, Landroidx/camera/core/impl/utils/ExifData;->EXIF_TAGS:[[Landroidx/camera/core/impl/utils/ExifTag;

    array-length v10, v10

    if-ge v9, v10, :cond_0

    .line 227
    iget-object v10, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    invoke-virtual {v10, v9}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v10

    iget-object v11, v8, Landroidx/camera/core/impl/utils/ExifTag;->name:Ljava/lang/String;

    invoke-interface {v10, v11}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 225
    .end local v8    # "tag":Landroidx/camera/core/impl/utils/ExifTag;
    .end local v9    # "ifdIndex":I
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 233
    :cond_1
    iget-object v4, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    const-wide/16 v7, 0x0

    if-nez v4, :cond_2

    .line 234
    iget-object v4, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    invoke-virtual {v4, v6}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v4

    sget-object v9, Landroidx/camera/core/impl/utils/ExifData;->EXIF_POINTER_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

    aget-object v9, v9, v5

    iget-object v9, v9, Landroidx/camera/core/impl/utils/ExifTag;->name:Ljava/lang/String;

    iget-object v10, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    .line 235
    invoke-virtual {v10}, Landroidx/camera/core/impl/utils/ExifData;->getByteOrder()Ljava/nio/ByteOrder;

    move-result-object v10

    invoke-static {v7, v8, v10}, Landroidx/camera/core/impl/utils/ExifAttribute;->createULong(JLjava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;

    move-result-object v10

    .line 234
    invoke-interface {v4, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    :cond_2
    iget-object v4, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    const/4 v9, 0x2

    invoke-virtual {v4, v9}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    .line 238
    iget-object v4, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    invoke-virtual {v4, v6}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v4

    sget-object v10, Landroidx/camera/core/impl/utils/ExifData;->EXIF_POINTER_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

    aget-object v10, v10, v9

    iget-object v10, v10, Landroidx/camera/core/impl/utils/ExifTag;->name:Ljava/lang/String;

    iget-object v11, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    .line 239
    invoke-virtual {v11}, Landroidx/camera/core/impl/utils/ExifData;->getByteOrder()Ljava/nio/ByteOrder;

    move-result-object v11

    invoke-static {v7, v8, v11}, Landroidx/camera/core/impl/utils/ExifAttribute;->createULong(JLjava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;

    move-result-object v11

    .line 238
    invoke-interface {v4, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    :cond_3
    iget-object v4, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    const/4 v10, 0x3

    invoke-virtual {v4, v10}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_4

    .line 242
    iget-object v4, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    invoke-virtual {v4, v5}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v4

    sget-object v11, Landroidx/camera/core/impl/utils/ExifData;->EXIF_POINTER_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

    aget-object v11, v11, v10

    iget-object v11, v11, Landroidx/camera/core/impl/utils/ExifTag;->name:Ljava/lang/String;

    iget-object v12, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    .line 243
    invoke-virtual {v12}, Landroidx/camera/core/impl/utils/ExifData;->getByteOrder()Ljava/nio/ByteOrder;

    move-result-object v12

    invoke-static {v7, v8, v12}, Landroidx/camera/core/impl/utils/ExifAttribute;->createULong(JLjava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;

    move-result-object v12

    .line 242
    invoke-interface {v4, v11, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    :cond_4
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    sget-object v11, Landroidx/camera/core/impl/utils/ExifData;->EXIF_TAGS:[[Landroidx/camera/core/impl/utils/ExifTag;

    array-length v11, v11

    const/4 v12, 0x4

    if-ge v4, v11, :cond_7

    .line 249
    const/4 v11, 0x0

    .line 250
    .local v11, "sum":I
    iget-object v13, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    invoke-virtual {v13, v4}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_3
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_6

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/Map$Entry;

    .line 251
    .local v14, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroidx/camera/core/impl/utils/ExifAttribute;>;"
    invoke-interface {v14}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroidx/camera/core/impl/utils/ExifAttribute;

    .line 252
    .local v15, "exifAttribute":Landroidx/camera/core/impl/utils/ExifAttribute;
    invoke-virtual {v15}, Landroidx/camera/core/impl/utils/ExifAttribute;->size()I

    move-result v7

    .line 253
    .local v7, "size":I
    if-le v7, v12, :cond_5

    .line 254
    add-int/2addr v11, v7

    .line 256
    .end local v7    # "size":I
    .end local v14    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroidx/camera/core/impl/utils/ExifAttribute;>;"
    .end local v15    # "exifAttribute":Landroidx/camera/core/impl/utils/ExifAttribute;
    :cond_5
    const-wide/16 v7, 0x0

    goto :goto_3

    .line 257
    :cond_6
    aget v7, v3, v4

    add-int/2addr v7, v11

    aput v7, v3, v4

    .line 248
    .end local v11    # "sum":I
    add-int/lit8 v4, v4, 0x1

    const-wide/16 v7, 0x0

    goto :goto_2

    .line 263
    .end local v4    # "i":I
    :cond_7
    const/16 v4, 0x8

    .line 264
    .local v4, "position":I
    const/4 v7, 0x0

    .local v7, "ifdType":I
    :goto_4
    sget-object v8, Landroidx/camera/core/impl/utils/ExifData;->EXIF_TAGS:[[Landroidx/camera/core/impl/utils/ExifTag;

    array-length v8, v8

    .line 285
    iget-object v11, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    .line 264
    if-ge v7, v8, :cond_9

    .line 265
    invoke-virtual {v11, v7}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_8

    .line 266
    aput v4, v2, v7

    .line 267
    iget-object v8, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    invoke-virtual {v8, v7}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Map;->size()I

    move-result v8

    mul-int/lit8 v8, v8, 0xc

    add-int/2addr v8, v9

    add-int/2addr v8, v12

    aget v11, v3, v7

    add-int/2addr v8, v11

    add-int/2addr v4, v8

    .line 264
    :cond_8
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 272
    .end local v7    # "ifdType":I
    :cond_9
    move v7, v4

    .line 274
    .local v7, "totalSize":I
    add-int/lit8 v7, v7, 0x8

    .line 285
    invoke-virtual {v11, v5}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_a

    .line 286
    iget-object v8, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    invoke-virtual {v8, v6}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v8

    sget-object v11, Landroidx/camera/core/impl/utils/ExifData;->EXIF_POINTER_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

    aget-object v11, v11, v5

    iget-object v11, v11, Landroidx/camera/core/impl/utils/ExifTag;->name:Ljava/lang/String;

    aget v13, v2, v5

    int-to-long v13, v13

    iget-object v15, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    .line 287
    invoke-virtual {v15}, Landroidx/camera/core/impl/utils/ExifData;->getByteOrder()Ljava/nio/ByteOrder;

    move-result-object v15

    invoke-static {v13, v14, v15}, Landroidx/camera/core/impl/utils/ExifAttribute;->createULong(JLjava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;

    move-result-object v13

    .line 286
    invoke-interface {v8, v11, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    :cond_a
    iget-object v8, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    invoke-virtual {v8, v9}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_b

    .line 290
    iget-object v8, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    invoke-virtual {v8, v6}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v8

    sget-object v11, Landroidx/camera/core/impl/utils/ExifData;->EXIF_POINTER_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

    aget-object v11, v11, v9

    iget-object v11, v11, Landroidx/camera/core/impl/utils/ExifTag;->name:Ljava/lang/String;

    aget v13, v2, v9

    int-to-long v13, v13

    iget-object v15, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    .line 291
    invoke-virtual {v15}, Landroidx/camera/core/impl/utils/ExifData;->getByteOrder()Ljava/nio/ByteOrder;

    move-result-object v15

    invoke-static {v13, v14, v15}, Landroidx/camera/core/impl/utils/ExifAttribute;->createULong(JLjava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;

    move-result-object v13

    .line 290
    invoke-interface {v8, v11, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    :cond_b
    iget-object v8, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    invoke-virtual {v8, v10}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_c

    .line 294
    iget-object v8, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    invoke-virtual {v8, v5}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v5

    sget-object v8, Landroidx/camera/core/impl/utils/ExifData;->EXIF_POINTER_TAGS:[Landroidx/camera/core/impl/utils/ExifTag;

    aget-object v8, v8, v10

    iget-object v8, v8, Landroidx/camera/core/impl/utils/ExifTag;->name:Ljava/lang/String;

    aget v10, v2, v10

    int-to-long v10, v10

    iget-object v13, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    .line 296
    invoke-virtual {v13}, Landroidx/camera/core/impl/utils/ExifData;->getByteOrder()Ljava/nio/ByteOrder;

    move-result-object v13

    .line 295
    invoke-static {v10, v11, v13}, Landroidx/camera/core/impl/utils/ExifAttribute;->createULong(JLjava/nio/ByteOrder;)Landroidx/camera/core/impl/utils/ExifAttribute;

    move-result-object v10

    .line 294
    invoke-interface {v5, v8, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    :cond_c
    invoke-virtual {v1, v7}, Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;->writeUnsignedShort(I)V

    .line 301
    sget-object v5, Landroidx/camera/core/impl/utils/ExifOutputStream;->IDENTIFIER_EXIF_APP1:[B

    invoke-virtual {v1, v5}, Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;->write([B)V

    .line 304
    iget-object v5, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    invoke-virtual {v5}, Landroidx/camera/core/impl/utils/ExifData;->getByteOrder()Ljava/nio/ByteOrder;

    move-result-object v5

    sget-object v8, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    if-ne v5, v8, :cond_d

    .line 305
    const/16 v5, 0x4d4d

    goto :goto_5

    :cond_d
    const/16 v5, 0x4949

    .line 304
    :goto_5
    invoke-virtual {v1, v5}, Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;->writeShort(S)V

    .line 306
    iget-object v5, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    invoke-virtual {v5}, Landroidx/camera/core/impl/utils/ExifData;->getByteOrder()Ljava/nio/ByteOrder;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;->setByteOrder(Ljava/nio/ByteOrder;)V

    .line 307
    const/16 v5, 0x2a

    invoke-virtual {v1, v5}, Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;->writeUnsignedShort(I)V

    .line 308
    const-wide/16 v10, 0x8

    invoke-virtual {v1, v10, v11}, Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;->writeUnsignedInt(J)V

    .line 311
    const/4 v5, 0x0

    .local v5, "ifdType":I
    :goto_6
    sget-object v8, Landroidx/camera/core/impl/utils/ExifData;->EXIF_TAGS:[[Landroidx/camera/core/impl/utils/ExifTag;

    array-length v8, v8

    if-ge v5, v8, :cond_14

    .line 312
    iget-object v8, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    invoke-virtual {v8, v5}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_13

    .line 315
    iget-object v8, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    invoke-virtual {v8, v5}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Map;->size()I

    move-result v8

    invoke-virtual {v1, v8}, Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;->writeUnsignedShort(I)V

    .line 318
    aget v8, v2, v5

    add-int/2addr v8, v9

    iget-object v10, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    invoke-virtual {v10, v5}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Map;->size()I

    move-result v10

    mul-int/lit8 v10, v10, 0xc

    add-int/2addr v8, v10

    add-int/2addr v8, v12

    .line 320
    .local v8, "dataOffset":I
    iget-object v10, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    invoke-virtual {v10, v5}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v10

    .line 321
    invoke-interface {v10}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v10

    .line 320
    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_7
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_10

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/Map$Entry;

    .line 323
    .local v11, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroidx/camera/core/impl/utils/ExifAttribute;>;"
    sget-object v13, Landroidx/camera/core/impl/utils/ExifData$Builder;->sExifTagMapsForWriting:Ljava/util/List;

    invoke-interface {v13, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/HashMap;

    invoke-interface {v11}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroidx/camera/core/impl/utils/ExifTag;

    .line 324
    .local v13, "tag":Landroidx/camera/core/impl/utils/ExifTag;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "Tag not supported: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    .line 326
    invoke-interface {v11}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ". Tag needs to be ported from ExifInterface to ExifData."

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 325
    invoke-static {v13, v14}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroidx/camera/core/impl/utils/ExifTag;

    iget v14, v14, Landroidx/camera/core/impl/utils/ExifTag;->number:I

    .line 328
    .local v14, "tagNumber":I
    invoke-interface {v11}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroidx/camera/core/impl/utils/ExifAttribute;

    .line 329
    .local v15, "attribute":Landroidx/camera/core/impl/utils/ExifAttribute;
    invoke-virtual {v15}, Landroidx/camera/core/impl/utils/ExifAttribute;->size()I

    move-result v9

    .line 331
    .local v9, "size":I
    invoke-virtual {v1, v14}, Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;->writeUnsignedShort(I)V

    .line 332
    iget v6, v15, Landroidx/camera/core/impl/utils/ExifAttribute;->format:I

    invoke-virtual {v1, v6}, Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;->writeUnsignedShort(I)V

    .line 333
    iget v6, v15, Landroidx/camera/core/impl/utils/ExifAttribute;->numberOfComponents:I

    invoke-virtual {v1, v6}, Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;->writeInt(I)V

    .line 334
    if-le v9, v12, :cond_e

    .line 335
    move-object/from16 v16, v13

    .end local v13    # "tag":Landroidx/camera/core/impl/utils/ExifTag;
    .local v16, "tag":Landroidx/camera/core/impl/utils/ExifTag;
    int-to-long v12, v8

    invoke-virtual {v1, v12, v13}, Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;->writeUnsignedInt(J)V

    .line 336
    add-int/2addr v8, v9

    goto :goto_9

    .line 338
    .end local v16    # "tag":Landroidx/camera/core/impl/utils/ExifTag;
    .restart local v13    # "tag":Landroidx/camera/core/impl/utils/ExifTag;
    :cond_e
    move-object/from16 v16, v13

    .end local v13    # "tag":Landroidx/camera/core/impl/utils/ExifTag;
    .restart local v16    # "tag":Landroidx/camera/core/impl/utils/ExifTag;
    iget-object v12, v15, Landroidx/camera/core/impl/utils/ExifAttribute;->bytes:[B

    invoke-virtual {v1, v12}, Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;->write([B)V

    .line 340
    const/4 v6, 0x4

    if-ge v9, v6, :cond_f

    .line 341
    move v12, v9

    .local v12, "i":I
    :goto_8
    if-ge v12, v6, :cond_f

    .line 342
    const/4 v13, 0x0

    invoke-virtual {v1, v13}, Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;->writeByte(I)V

    .line 341
    add-int/lit8 v12, v12, 0x1

    const/4 v6, 0x4

    goto :goto_8

    .line 346
    .end local v9    # "size":I
    .end local v11    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroidx/camera/core/impl/utils/ExifAttribute;>;"
    .end local v12    # "i":I
    .end local v14    # "tagNumber":I
    .end local v15    # "attribute":Landroidx/camera/core/impl/utils/ExifAttribute;
    .end local v16    # "tag":Landroidx/camera/core/impl/utils/ExifTag;
    :cond_f
    :goto_9
    const/4 v6, 0x0

    const/4 v9, 0x2

    const/4 v12, 0x4

    goto :goto_7

    .line 349
    :cond_10
    const-wide/16 v9, 0x0

    invoke-virtual {v1, v9, v10}, Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;->writeUnsignedInt(J)V

    .line 352
    iget-object v11, v0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mExifData:Landroidx/camera/core/impl/utils/ExifData;

    invoke-virtual {v11, v5}, Landroidx/camera/core/impl/utils/ExifData;->getAttributes(I)Ljava/util/Map;

    move-result-object v11

    .line 353
    invoke-interface {v11}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v11

    .line 352
    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_a
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_12

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/Map$Entry;

    .line 354
    .local v12, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroidx/camera/core/impl/utils/ExifAttribute;>;"
    invoke-interface {v12}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroidx/camera/core/impl/utils/ExifAttribute;

    .line 356
    .local v13, "attribute":Landroidx/camera/core/impl/utils/ExifAttribute;
    iget-object v14, v13, Landroidx/camera/core/impl/utils/ExifAttribute;->bytes:[B

    array-length v14, v14

    const/4 v6, 0x4

    if-le v14, v6, :cond_11

    .line 357
    iget-object v14, v13, Landroidx/camera/core/impl/utils/ExifAttribute;->bytes:[B

    iget-object v15, v13, Landroidx/camera/core/impl/utils/ExifAttribute;->bytes:[B

    array-length v15, v15

    const/4 v6, 0x0

    invoke-virtual {v1, v14, v6, v15}, Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;->write([BII)V

    goto :goto_b

    .line 356
    :cond_11
    const/4 v6, 0x0

    .line 359
    .end local v12    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroidx/camera/core/impl/utils/ExifAttribute;>;"
    .end local v13    # "attribute":Landroidx/camera/core/impl/utils/ExifAttribute;
    :goto_b
    goto :goto_a

    .line 352
    :cond_12
    const/4 v6, 0x0

    goto :goto_c

    .line 312
    .end local v8    # "dataOffset":I
    :cond_13
    const-wide/16 v9, 0x0

    .line 311
    :goto_c
    add-int/lit8 v5, v5, 0x1

    const/4 v9, 0x2

    const/4 v12, 0x4

    goto/16 :goto_6

    .line 364
    .end local v5    # "ifdType":I
    :cond_14
    sget-object v5, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v5}, Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;->setByteOrder(Ljava/nio/ByteOrder;)V

    .line 365
    return-void
.end method


# virtual methods
.method public write(I)V
    .locals 3
    .param p1, "oneByte"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 205
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mSingleByteArray:[B

    and-int/lit16 v1, p1, 0xff

    int-to-byte v1, v1

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    .line 206
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mSingleByteArray:[B

    invoke-virtual {p0, v0}, Landroidx/camera/core/impl/utils/ExifOutputStream;->write([B)V

    .line 207
    return-void
.end method

.method public write([B)V
    .locals 2
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 214
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Landroidx/camera/core/impl/utils/ExifOutputStream;->write([BII)V

    .line 215
    return-void
.end method

.method public write([BII)V
    .locals 8
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 124
    nop

    :goto_0
    iget v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mByteToSkip:I

    const/4 v1, 0x2

    if-gtz v0, :cond_0

    iget v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mByteToCopy:I

    if-gtz v0, :cond_0

    iget v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mState:I

    if-eq v0, v1, :cond_a

    :cond_0
    if-lez p3, :cond_a

    .line 126
    iget v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mByteToSkip:I

    if-lez v0, :cond_1

    .line 127
    iget v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mByteToSkip:I

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 128
    .local v0, "byteToProcess":I
    sub-int/2addr p3, v0

    .line 129
    iget v2, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mByteToSkip:I

    sub-int/2addr v2, v0

    iput v2, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mByteToSkip:I

    .line 130
    add-int/2addr p2, v0

    .line 132
    .end local v0    # "byteToProcess":I
    :cond_1
    iget v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mByteToCopy:I

    if-lez v0, :cond_2

    .line 133
    iget v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mByteToCopy:I

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 134
    .restart local v0    # "byteToProcess":I
    iget-object v2, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v2, p1, p2, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 135
    sub-int/2addr p3, v0

    .line 136
    iget v2, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mByteToCopy:I

    sub-int/2addr v2, v0

    iput v2, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mByteToCopy:I

    .line 137
    add-int/2addr p2, v0

    .line 139
    .end local v0    # "byteToProcess":I
    :cond_2
    if-nez p3, :cond_3

    .line 140
    return-void

    .line 142
    :cond_3
    iget v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mState:I

    const/16 v2, -0x1f

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_2

    .line 165
    :pswitch_0
    const/4 v0, 0x4

    invoke-direct {p0, v0, p1, p2, p3}, Landroidx/camera/core/impl/utils/ExifOutputStream;->requestByteToBuffer(I[BII)I

    move-result v4

    .line 166
    .local v4, "byteRead":I
    add-int/2addr p2, v4

    .line 167
    sub-int/2addr p3, v4

    .line 169
    iget-object v5, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    if-ne v5, v1, :cond_4

    .line 170
    iget-object v5, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v5

    .line 171
    .local v5, "tag":S
    const/16 v6, -0x27

    if-ne v5, v6, :cond_4

    .line 172
    iget-object v6, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->out:Ljava/io/OutputStream;

    iget-object v7, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v7

    invoke-virtual {v6, v7, v3, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 173
    iget-object v6, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 176
    .end local v5    # "tag":S
    :cond_4
    iget-object v5, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    if-ge v5, v0, :cond_5

    .line 177
    return-void

    .line 179
    :cond_5
    iget-object v5, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 180
    iget-object v5, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v5

    .line 181
    .local v5, "marker":S
    const v6, 0xffff

    if-ne v5, v2, :cond_6

    .line 182
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    and-int/2addr v0, v6

    sub-int/2addr v0, v1

    iput v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mByteToSkip:I

    .line 183
    iput v1, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mState:I

    goto :goto_1

    .line 184
    :cond_6
    invoke-static {v5}, Landroidx/camera/core/impl/utils/ExifOutputStream$JpegHeader;->isSofMarker(S)Z

    move-result v2

    if-nez v2, :cond_7

    .line 185
    iget-object v2, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->out:Ljava/io/OutputStream;

    iget-object v7, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v7

    invoke-virtual {v2, v7, v3, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 186
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    and-int/2addr v0, v6

    sub-int/2addr v0, v1

    iput v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mByteToCopy:I

    goto :goto_1

    .line 188
    :cond_7
    iget-object v2, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->out:Ljava/io/OutputStream;

    iget-object v6, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v6

    invoke-virtual {v2, v6, v3, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 189
    iput v1, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mState:I

    .line 191
    :goto_1
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    goto :goto_2

    .line 144
    .end local v4    # "byteRead":I
    .end local v5    # "marker":S
    :pswitch_1
    invoke-direct {p0, v1, p1, p2, p3}, Landroidx/camera/core/impl/utils/ExifOutputStream;->requestByteToBuffer(I[BII)I

    move-result v0

    .line 145
    .local v0, "byteRead":I
    add-int/2addr p2, v0

    .line 146
    sub-int/2addr p3, v0

    .line 147
    iget-object v4, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    if-ge v4, v1, :cond_8

    .line 148
    return-void

    .line 150
    :cond_8
    iget-object v4, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 151
    iget-object v4, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v4

    const/16 v5, -0x28

    if-ne v4, v5, :cond_9

    .line 154
    iget-object v4, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->out:Ljava/io/OutputStream;

    iget-object v5, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    invoke-virtual {v4, v5, v3, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 155
    const/4 v1, 0x1

    iput v1, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mState:I

    .line 156
    iget-object v1, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 157
    new-instance v1, Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;

    iget-object v3, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->out:Ljava/io/OutputStream;

    sget-object v4, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-direct {v1, v3, v4}, Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;-><init>(Ljava/io/OutputStream;Ljava/nio/ByteOrder;)V

    .line 159
    .local v1, "dataOutputStream":Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;
    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;->writeShort(S)V

    .line 160
    invoke-direct {p0, v1}, Landroidx/camera/core/impl/utils/ExifOutputStream;->writeExifSegment(Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;)V

    .line 161
    goto :goto_2

    .line 152
    .end local v1    # "dataOutputStream":Landroidx/camera/core/impl/utils/ByteOrderedDataOutputStream;
    :cond_9
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Not a valid jpeg image, cannot write exif"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 191
    .end local v0    # "byteRead":I
    :goto_2
    goto/16 :goto_0

    .line 194
    :cond_a
    if-lez p3, :cond_b

    .line 195
    iget-object v0, p0, Landroidx/camera/core/impl/utils/ExifOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 197
    :cond_b
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
