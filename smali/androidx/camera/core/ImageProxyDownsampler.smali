.class final Landroidx/camera/core/ImageProxyDownsampler;
.super Ljava/lang/Object;
.source "ImageProxyDownsampler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/ImageProxyDownsampler$ForwardingImageProxyImpl;,
        Landroidx/camera/core/ImageProxyDownsampler$DownsamplingMethod;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method

.method private static createPlaneProxy(II[B)Landroidx/camera/core/ImageProxy$PlaneProxy;
    .locals 1
    .param p0, "rowStride"    # I
    .param p1, "pixelStride"    # I
    .param p2, "data"    # [B

    .line 194
    new-instance v0, Landroidx/camera/core/ImageProxyDownsampler$1;

    invoke-direct {v0, p2, p0, p1}, Landroidx/camera/core/ImageProxyDownsampler$1;-><init>([BII)V

    return-object v0
.end method

.method static downsample(Landroidx/camera/core/ImageProxy;IILandroidx/camera/core/ImageProxyDownsampler$DownsamplingMethod;)Landroidx/camera/core/ForwardingImageProxy;
    .locals 19
    .param p0, "image"    # Landroidx/camera/core/ImageProxy;
    .param p1, "downsampledWidth"    # I
    .param p2, "downsampledHeight"    # I
    .param p3, "downsamplingMethod"    # Landroidx/camera/core/ImageProxyDownsampler$DownsamplingMethod;

    .line 48
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->getFormat()I

    move-result v3

    const/16 v4, 0x23

    if-ne v3, v4, :cond_3

    .line 52
    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v3

    if-lt v3, v1, :cond_2

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v3

    if-lt v3, v2, :cond_2

    .line 61
    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v3

    if-ne v3, v1, :cond_0

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v3

    if-ne v3, v2, :cond_0

    .line 62
    new-instance v3, Landroidx/camera/core/ImageProxyDownsampler$ForwardingImageProxyImpl;

    .line 63
    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v4

    invoke-direct {v3, v0, v4, v1, v2}, Landroidx/camera/core/ImageProxyDownsampler$ForwardingImageProxyImpl;-><init>(Landroidx/camera/core/ImageProxy;[Landroidx/camera/core/ImageProxy$PlaneProxy;II)V

    .line 62
    return-object v3

    .line 66
    :cond_0
    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v3

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    filled-new-array {v3, v4, v5}, [I

    move-result-object v3

    .line 67
    .local v3, "inputWidths":[I
    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v4

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v6

    div-int/lit8 v6, v6, 0x2

    filled-new-array {v4, v5, v6}, [I

    move-result-object v4

    .line 68
    .local v4, "inputHeights":[I
    div-int/lit8 v5, v1, 0x2

    div-int/lit8 v6, v1, 0x2

    filled-new-array {v1, v5, v6}, [I

    move-result-object v5

    .line 69
    .local v5, "outputWidths":[I
    div-int/lit8 v6, v2, 0x2

    div-int/lit8 v7, v2, 0x2

    filled-new-array {v2, v6, v7}, [I

    move-result-object v6

    .line 71
    .local v6, "outputHeights":[I
    const/4 v7, 0x3

    new-array v8, v7, [Landroidx/camera/core/ImageProxy$PlaneProxy;

    .line 72
    .local v8, "outputPlanes":[Landroidx/camera/core/ImageProxy$PlaneProxy;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    if-ge v9, v7, :cond_1

    .line 73
    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v10

    aget-object v10, v10, v9

    .line 74
    .local v10, "inputPlane":Landroidx/camera/core/ImageProxy$PlaneProxy;
    invoke-interface {v10}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v11

    .line 75
    .local v11, "inputBuffer":Ljava/nio/ByteBuffer;
    aget v12, v5, v9

    aget v13, v6, v9

    mul-int/2addr v12, v13

    new-array v12, v12, [B

    .line 76
    .local v12, "output":[B
    sget-object v13, Landroidx/camera/core/ImageProxyDownsampler$2;->$SwitchMap$androidx$camera$core$ImageProxyDownsampler$DownsamplingMethod:[I

    invoke-virtual/range {p3 .. p3}, Landroidx/camera/core/ImageProxyDownsampler$DownsamplingMethod;->ordinal()I

    move-result v14

    aget v13, v13, v14

    packed-switch v13, :pswitch_data_0

    goto :goto_1

    .line 89
    :pswitch_0
    move-object/from16 v16, v12

    .end local v12    # "output":[B
    .local v16, "output":[B
    aget v12, v3, v9

    .line 92
    invoke-interface {v10}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getPixelStride()I

    move-result v13

    .line 93
    invoke-interface {v10}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v14

    aget v15, v4, v9

    aget v17, v5, v9

    aget v18, v6, v9

    .line 89
    invoke-static/range {v11 .. v18}, Landroidx/camera/core/ImageProxyDownsampler;->resizeAveraging(Ljava/nio/ByteBuffer;IIII[BII)V

    move-object/from16 v12, v16

    goto :goto_1

    .line 78
    .end local v16    # "output":[B
    .restart local v12    # "output":[B
    :pswitch_1
    move-object/from16 v16, v12

    .end local v12    # "output":[B
    .restart local v16    # "output":[B
    aget v12, v3, v9

    .line 81
    invoke-interface {v10}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getPixelStride()I

    move-result v13

    .line 82
    invoke-interface {v10}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v14

    aget v15, v4, v9

    aget v17, v5, v9

    aget v18, v6, v9

    .line 78
    invoke-static/range {v11 .. v18}, Landroidx/camera/core/ImageProxyDownsampler;->resizeNearestNeighbor(Ljava/nio/ByteBuffer;IIII[BII)V

    .line 87
    move-object/from16 v12, v16

    .line 100
    .end local v16    # "output":[B
    .restart local v12    # "output":[B
    :goto_1
    aget v13, v5, v9

    const/4 v14, 0x1

    invoke-static {v13, v14, v12}, Landroidx/camera/core/ImageProxyDownsampler;->createPlaneProxy(II[B)Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v13

    aput-object v13, v8, v9

    .line 72
    .end local v10    # "inputPlane":Landroidx/camera/core/ImageProxy$PlaneProxy;
    .end local v11    # "inputBuffer":Ljava/nio/ByteBuffer;
    .end local v12    # "output":[B
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 102
    .end local v9    # "i":I
    :cond_1
    new-instance v7, Landroidx/camera/core/ImageProxyDownsampler$ForwardingImageProxyImpl;

    invoke-direct {v7, v0, v8, v1, v2}, Landroidx/camera/core/ImageProxyDownsampler$ForwardingImageProxyImpl;-><init>(Landroidx/camera/core/ImageProxy;[Landroidx/camera/core/ImageProxy$PlaneProxy;II)V

    return-object v7

    .line 53
    .end local v3    # "inputWidths":[I
    .end local v4    # "inputHeights":[I
    .end local v5    # "outputWidths":[I
    .end local v6    # "outputHeights":[I
    .end local v8    # "outputPlanes":[Landroidx/camera/core/ImageProxy$PlaneProxy;
    :cond_2
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Downsampled dimension "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    new-instance v5, Landroid/util/Size;

    invoke-direct {v5, v1, v2}, Landroid/util/Size;-><init>(II)V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " is not <= original dimension "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    new-instance v5, Landroid/util/Size;

    .line 57
    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v6

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/util/Size;-><init>(II)V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 49
    :cond_3
    new-instance v3, Ljava/lang/UnsupportedOperationException;

    const-string v4, "Only YUV_420_888 format is currently supported."

    invoke-direct {v3, v4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v3

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static resizeAveraging(Ljava/nio/ByteBuffer;IIII[BII)V
    .locals 23
    .param p0, "input"    # Ljava/nio/ByteBuffer;
    .param p1, "inputWidth"    # I
    .param p2, "inputPixelStride"    # I
    .param p3, "inputRowStride"    # I
    .param p4, "inputHeight"    # I
    .param p5, "output"    # [B
    .param p6, "outputWidth"    # I
    .param p7, "outputHeight"    # I

    .line 153
    move-object/from16 v1, p0

    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, p6

    move/from16 v5, p7

    move/from16 v6, p1

    int-to-float v0, v6

    int-to-float v7, v4

    div-float v7, v0, v7

    .line 154
    .local v7, "scaleX":F
    int-to-float v0, v3

    int-to-float v8, v5

    div-float v8, v0, v8

    .line 156
    .local v8, "scaleY":F
    new-array v9, v2, [B

    .line 157
    .local v9, "row0":[B
    new-array v10, v2, [B

    .line 158
    .local v10, "row1":[B
    new-array v11, v4, [I

    .line 159
    .local v11, "sourceIndices":[I
    const/4 v0, 0x0

    .local v0, "ix":I
    :goto_0
    if-ge v0, v4, :cond_0

    .line 160
    int-to-float v12, v0

    mul-float/2addr v12, v7

    .line 161
    .local v12, "sourceX":F
    float-to-int v13, v12

    .line 162
    .local v13, "floorSourceX":I
    mul-int v14, v13, p2

    aput v14, v11, v0

    .line 159
    .end local v12    # "sourceX":F
    .end local v13    # "floorSourceX":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 165
    .end local v0    # "ix":I
    :cond_0
    monitor-enter p0

    .line 166
    :try_start_0
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 167
    const/4 v0, 0x0

    .local v0, "iy":I
    :goto_1
    if-ge v0, v5, :cond_2

    .line 168
    int-to-float v12, v0

    mul-float/2addr v12, v8

    .line 169
    .local v12, "sourceY":F
    float-to-int v13, v12

    .line 170
    .local v13, "floorSourceY":I
    add-int/lit8 v14, v3, -0x1

    invoke-static {v13, v14}, Ljava/lang/Math;->min(II)I

    move-result v14

    mul-int/2addr v14, v2

    .line 171
    .local v14, "rowOffsetSource0":I
    add-int/lit8 v15, v13, 0x1

    move/from16 v16, v0

    .end local v0    # "iy":I
    .local v16, "iy":I
    add-int/lit8 v0, v3, -0x1

    invoke-static {v15, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    mul-int/2addr v0, v2

    .line 172
    .local v0, "rowOffsetSource1":I
    mul-int v15, v16, v4

    .line 174
    .local v15, "rowOffsetTarget":I
    invoke-virtual {v1, v14}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 175
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    const/4 v5, 0x0

    invoke-virtual {v1, v9, v5, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 176
    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 177
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-virtual {v1, v10, v5, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 179
    const/4 v3, 0x0

    .local v3, "ix":I
    :goto_2
    if-ge v3, v4, :cond_1

    .line 180
    aget v5, v11, v3

    aget-byte v5, v9, v5

    and-int/lit16 v5, v5, 0xff

    .line 181
    .local v5, "sampleA":I
    aget v17, v11, v3

    add-int v17, v17, p2

    move/from16 v18, v0

    .end local v0    # "rowOffsetSource1":I
    .local v18, "rowOffsetSource1":I
    aget-byte v0, v9, v17

    and-int/lit16 v0, v0, 0xff

    .line 182
    .local v0, "sampleB":I
    aget v17, v11, v3

    move/from16 v19, v0

    .end local v0    # "sampleB":I
    .local v19, "sampleB":I
    aget-byte v0, v10, v17

    and-int/lit16 v0, v0, 0xff

    .line 183
    .local v0, "sampleC":I
    aget v17, v11, v3

    add-int v17, v17, p2

    move/from16 v20, v0

    .end local v0    # "sampleC":I
    .local v20, "sampleC":I
    aget-byte v0, v10, v17

    and-int/lit16 v0, v0, 0xff

    .line 184
    .local v0, "sampleD":I
    add-int v17, v5, v19

    add-int v17, v17, v20

    add-int v17, v17, v0

    div-int/lit8 v17, v17, 0x4

    move/from16 v21, v17

    .line 185
    .local v21, "mixed":I
    add-int v17, v15, v3

    move/from16 v22, v0

    move/from16 v0, v21

    .end local v21    # "mixed":I
    .local v0, "mixed":I
    .local v22, "sampleD":I
    and-int/lit16 v2, v0, 0xff

    int-to-byte v2, v2

    aput-byte v2, p5, v17

    .line 179
    .end local v0    # "mixed":I
    .end local v5    # "sampleA":I
    .end local v19    # "sampleB":I
    .end local v20    # "sampleC":I
    .end local v22    # "sampleD":I
    add-int/lit8 v3, v3, 0x1

    move/from16 v2, p3

    move/from16 v0, v18

    goto :goto_2

    .end local v18    # "rowOffsetSource1":I
    .local v0, "rowOffsetSource1":I
    :cond_1
    move/from16 v18, v0

    .line 167
    .end local v0    # "rowOffsetSource1":I
    .end local v3    # "ix":I
    .end local v12    # "sourceY":F
    .end local v13    # "floorSourceY":I
    .end local v14    # "rowOffsetSource0":I
    .end local v15    # "rowOffsetTarget":I
    add-int/lit8 v0, v16, 0x1

    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v5, p7

    .end local v16    # "iy":I
    .local v0, "iy":I
    goto/16 :goto_1

    :cond_2
    move/from16 v16, v0

    .line 188
    .end local v0    # "iy":I
    monitor-exit p0

    .line 189
    return-void

    .line 188
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private static resizeNearestNeighbor(Ljava/nio/ByteBuffer;IIII[BII)V
    .locals 18
    .param p0, "input"    # Ljava/nio/ByteBuffer;
    .param p1, "inputWidth"    # I
    .param p2, "inputPixelStride"    # I
    .param p3, "inputRowStride"    # I
    .param p4, "inputHeight"    # I
    .param p5, "output"    # [B
    .param p6, "outputWidth"    # I
    .param p7, "outputHeight"    # I

    .line 115
    move-object/from16 v1, p0

    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, p6

    move/from16 v5, p7

    move/from16 v6, p1

    int-to-float v0, v6

    int-to-float v7, v4

    div-float v7, v0, v7

    .line 116
    .local v7, "scaleX":F
    int-to-float v0, v3

    int-to-float v8, v5

    div-float v8, v0, v8

    .line 118
    .local v8, "scaleY":F
    new-array v9, v2, [B

    .line 119
    .local v9, "row":[B
    new-array v10, v4, [I

    .line 120
    .local v10, "sourceIndices":[I
    const/4 v0, 0x0

    .local v0, "ix":I
    :goto_0
    if-ge v0, v4, :cond_0

    .line 121
    int-to-float v11, v0

    mul-float/2addr v11, v7

    .line 122
    .local v11, "sourceX":F
    float-to-int v12, v11

    .line 123
    .local v12, "floorSourceX":I
    mul-int v13, v12, p2

    aput v13, v10, v0

    .line 120
    .end local v11    # "sourceX":F
    .end local v12    # "floorSourceX":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 126
    .end local v0    # "ix":I
    :cond_0
    monitor-enter p0

    .line 127
    :try_start_0
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 128
    const/4 v0, 0x0

    .local v0, "iy":I
    :goto_1
    if-ge v0, v5, :cond_2

    .line 129
    int-to-float v11, v0

    mul-float/2addr v11, v8

    .line 130
    .local v11, "sourceY":F
    float-to-int v12, v11

    .line 131
    .local v12, "floorSourceY":I
    add-int/lit8 v13, v3, -0x1

    invoke-static {v12, v13}, Ljava/lang/Math;->min(II)I

    move-result v13

    mul-int/2addr v13, v2

    .line 132
    .local v13, "rowOffsetSource":I
    mul-int v14, v0, v4

    .line 134
    .local v14, "rowOffsetTarget":I
    invoke-virtual {v1, v13}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 135
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v15

    invoke-static {v2, v15}, Ljava/lang/Math;->min(II)I

    move-result v15

    move/from16 v16, v0

    .end local v0    # "iy":I
    .local v16, "iy":I
    const/4 v0, 0x0

    invoke-virtual {v1, v9, v0, v15}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 137
    const/4 v0, 0x0

    .local v0, "ix":I
    :goto_2
    if-ge v0, v4, :cond_1

    .line 138
    add-int v15, v14, v0

    aget v17, v10, v0

    aget-byte v17, v9, v17

    aput-byte v17, p5, v15

    .line 137
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 128
    .end local v0    # "ix":I
    .end local v11    # "sourceY":F
    .end local v12    # "floorSourceY":I
    .end local v13    # "rowOffsetSource":I
    .end local v14    # "rowOffsetTarget":I
    :cond_1
    add-int/lit8 v0, v16, 0x1

    .end local v16    # "iy":I
    .local v0, "iy":I
    goto :goto_1

    :cond_2
    move/from16 v16, v0

    .line 141
    .end local v0    # "iy":I
    monitor-exit p0

    .line 142
    return-void

    .line 141
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
