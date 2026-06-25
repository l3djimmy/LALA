.class Lcom/itextpdf/io/image/AwtImageDataFactory;
.super Ljava/lang/Object;
.source "AwtImageDataFactory.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
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

    .line 34
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/itextpdf/io/image/AwtImageDataFactory;->create(Ljava/awt/Image;Ljava/awt/Color;Z)Lcom/itextpdf/io/image/ImageData;

    move-result-object v0

    return-object v0
.end method

.method public static create(Ljava/awt/Image;Ljava/awt/Color;Z)Lcom/itextpdf/io/image/ImageData;
    .locals 24
    .param p0, "image"    # Ljava/awt/Image;
    .param p1, "color"    # Ljava/awt/Color;
    .param p2, "forceBW"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 45
    move-object/from16 v1, p0

    instance-of v0, v1, Ljava/awt/image/BufferedImage;

    const/4 v7, 0x1

    if-eqz v0, :cond_0

    .line 46
    move-object v0, v1

    check-cast v0, Ljava/awt/image/BufferedImage;

    .line 47
    .local v0, "bi":Ljava/awt/image/BufferedImage;
    invoke-virtual {v0}, Ljava/awt/image/BufferedImage;->getType()I

    move-result v2

    const/16 v3, 0xc

    if-ne v2, v3, :cond_0

    invoke-virtual {v0}, Ljava/awt/image/BufferedImage;->getColorModel()Ljava/awt/image/ColorModel;

    move-result-object v2

    invoke-virtual {v2}, Ljava/awt/image/ColorModel;->getPixelSize()I

    move-result v2

    if-ne v2, v7, :cond_0

    .line 48
    const/4 v2, 0x1

    move v8, v2

    .end local p2    # "forceBW":Z
    .local v2, "forceBW":Z
    goto :goto_0

    .line 52
    .end local v0    # "bi":Ljava/awt/image/BufferedImage;
    .end local v2    # "forceBW":Z
    .restart local p2    # "forceBW":Z
    :cond_0
    move/from16 v8, p2

    .end local p2    # "forceBW":Z
    .local v8, "forceBW":Z
    :goto_0
    new-instance v0, Ljava/awt/image/PixelGrabber;

    const/4 v5, -0x1

    const/4 v6, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, -0x1

    invoke-direct/range {v0 .. v6}, Ljava/awt/image/PixelGrabber;-><init>(Ljava/awt/Image;IIIIZ)V

    move-object v1, v0

    .line 54
    .local v1, "pg":Ljava/awt/image/PixelGrabber;
    :try_start_0
    invoke-virtual {v1}, Ljava/awt/image/PixelGrabber;->grabPixels()Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    nop

    .line 58
    invoke-virtual {v1}, Ljava/awt/image/PixelGrabber;->getStatus()I

    move-result v0

    and-int/lit16 v0, v0, 0x80

    if-nez v0, :cond_22

    .line 61
    invoke-virtual {v1}, Ljava/awt/image/PixelGrabber;->getWidth()I

    move-result v9

    .line 62
    .local v9, "w":I
    invoke-virtual {v1}, Ljava/awt/image/PixelGrabber;->getHeight()I

    move-result v10

    .line 63
    .local v10, "h":I
    invoke-virtual {v1}, Ljava/awt/image/PixelGrabber;->getPixels()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    check-cast v0, [I

    .line 64
    .local v0, "pixels":[I
    const/4 v2, 0x2

    const/16 v3, 0xfa

    const/16 v5, 0xff

    if-eqz v8, :cond_12

    .line 65
    div-int/lit8 v6, v9, 0x8

    and-int/lit8 v11, v9, 0x7

    if-eqz v11, :cond_1

    move v11, v7

    goto :goto_1

    :cond_1
    const/4 v11, 0x0

    :goto_1
    add-int/2addr v6, v11

    .line 66
    .local v6, "byteWidth":I
    mul-int v11, v6, v10

    new-array v13, v11, [B

    .line 68
    .local v13, "pixelsByte":[B
    const/4 v11, 0x0

    .line 69
    .local v11, "index":I
    mul-int v15, v10, v9

    .line 70
    .local v15, "size":I
    const/4 v12, 0x1

    .line 71
    .local v12, "transColor":I
    if-eqz p1, :cond_3

    .line 72
    invoke-virtual/range {p1 .. p1}, Ljava/awt/Color;->getRed()I

    move-result v14

    invoke-virtual/range {p1 .. p1}, Ljava/awt/Color;->getGreen()I

    move-result v16

    add-int v14, v14, v16

    .line 73
    invoke-virtual/range {p1 .. p1}, Ljava/awt/Color;->getBlue()I

    move-result v16

    add-int v14, v14, v16

    const/16 p2, 0x0

    const/16 v4, 0x180

    if-ge v14, v4, :cond_2

    move/from16 v4, p2

    goto :goto_2

    :cond_2
    move v4, v7

    :goto_2
    move v12, v4

    goto :goto_3

    .line 71
    :cond_3
    const/16 p2, 0x0

    move v4, v12

    .line 75
    .end local v12    # "transColor":I
    .local v4, "transColor":I
    :goto_3
    const/4 v12, 0x0

    .line 76
    .local v12, "transparency":[I
    const/16 v14, 0x80

    .line 77
    .local v14, "cbyte":I
    const/16 v16, 0x0

    .line 78
    .local v16, "wMarker":I
    const/16 v17, 0x0

    .line 79
    .local v17, "currByte":I
    if-eqz p1, :cond_a

    .line 80
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_4
    if-ge v2, v15, :cond_9

    .line 81
    aget v18, v0, v2

    shr-int/lit8 v7, v18, 0x18

    and-int/2addr v7, v5

    .line 82
    .local v7, "alpha":I
    if-ge v7, v3, :cond_4

    .line 83
    const/4 v3, 0x1

    if-ne v4, v3, :cond_5

    .line 84
    or-int v17, v17, v14

    move/from16 v3, v17

    goto :goto_5

    .line 86
    :cond_4
    aget v3, v0, v2

    and-int/lit16 v3, v3, 0x888

    if-eqz v3, :cond_5

    .line 87
    or-int v17, v17, v14

    move/from16 v3, v17

    goto :goto_5

    .line 89
    :cond_5
    move/from16 v3, v17

    .end local v17    # "currByte":I
    .local v3, "currByte":I
    :goto_5
    shr-int/lit8 v14, v14, 0x1

    .line 90
    if-eqz v14, :cond_7

    add-int/lit8 v5, v16, 0x1

    if-lt v5, v9, :cond_6

    goto :goto_6

    :cond_6
    move-object/from16 v20, v0

    move/from16 v17, v3

    goto :goto_7

    .line 91
    :cond_7
    :goto_6
    add-int/lit8 v5, v11, 0x1

    move-object/from16 v20, v0

    .end local v0    # "pixels":[I
    .end local v11    # "index":I
    .local v5, "index":I
    .local v20, "pixels":[I
    int-to-byte v0, v3

    aput-byte v0, v13, v11

    .line 92
    const/16 v0, 0x80

    .line 93
    .end local v14    # "cbyte":I
    .local v0, "cbyte":I
    const/4 v3, 0x0

    move v14, v0

    move v11, v5

    move/from16 v17, v3

    .line 95
    .end local v0    # "cbyte":I
    .end local v3    # "currByte":I
    .end local v5    # "index":I
    .restart local v11    # "index":I
    .restart local v14    # "cbyte":I
    .restart local v17    # "currByte":I
    :goto_7
    add-int/lit8 v0, v16, 0x1

    .line 96
    .end local v16    # "wMarker":I
    .local v0, "wMarker":I
    if-lt v0, v9, :cond_8

    .line 97
    const/4 v0, 0x0

    move/from16 v16, v0

    goto :goto_8

    .line 96
    :cond_8
    move/from16 v16, v0

    .line 80
    .end local v0    # "wMarker":I
    .end local v7    # "alpha":I
    .restart local v16    # "wMarker":I
    :goto_8
    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, v20

    const/16 v3, 0xfa

    const/16 v5, 0xff

    const/4 v7, 0x1

    goto :goto_4

    .end local v20    # "pixels":[I
    .local v0, "pixels":[I
    :cond_9
    move-object/from16 v20, v0

    .end local v0    # "pixels":[I
    .restart local v20    # "pixels":[I
    move v0, v11

    move v2, v14

    move-object v14, v12

    .end local v2    # "j":I
    goto/16 :goto_f

    .line 100
    .end local v20    # "pixels":[I
    .restart local v0    # "pixels":[I
    :cond_a
    move-object/from16 v20, v0

    .end local v0    # "pixels":[I
    .restart local v20    # "pixels":[I
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_9
    if-ge v0, v15, :cond_11

    .line 101
    if-nez v12, :cond_c

    .line 102
    aget v3, v20, v0

    shr-int/lit8 v3, v3, 0x18

    const/16 v5, 0xff

    and-int/2addr v3, v5

    .line 103
    .local v3, "alpha":I
    if-nez v3, :cond_c

    .line 104
    new-array v5, v2, [I

    .line 106
    .end local v12    # "transparency":[I
    .local v5, "transparency":[I
    aget v7, v20, v0

    and-int/lit16 v7, v7, 0x888

    if-eqz v7, :cond_b

    const/16 v7, 0xff

    goto :goto_a

    :cond_b
    move/from16 v7, p2

    :goto_a
    const/16 v19, 0x1

    aput v7, v5, v19

    aput v7, v5, p2

    move-object v12, v5

    .line 109
    .end local v3    # "alpha":I
    .end local v5    # "transparency":[I
    .restart local v12    # "transparency":[I
    :cond_c
    aget v3, v20, v0

    and-int/lit16 v3, v3, 0x888

    if-eqz v3, :cond_d

    .line 110
    or-int v17, v17, v14

    move/from16 v3, v17

    goto :goto_b

    .line 109
    :cond_d
    move/from16 v3, v17

    .line 111
    .end local v17    # "currByte":I
    .local v3, "currByte":I
    :goto_b
    shr-int/lit8 v5, v14, 0x1

    .line 112
    .end local v14    # "cbyte":I
    .local v5, "cbyte":I
    if-eqz v5, :cond_f

    add-int/lit8 v7, v16, 0x1

    if-lt v7, v9, :cond_e

    goto :goto_c

    :cond_e
    move/from16 v17, v3

    move v14, v5

    goto :goto_d

    .line 113
    :cond_f
    :goto_c
    add-int/lit8 v7, v11, 0x1

    .end local v11    # "index":I
    .local v7, "index":I
    int-to-byte v14, v3

    aput-byte v14, v13, v11

    .line 114
    const/16 v5, 0x80

    .line 115
    const/4 v3, 0x0

    move v11, v7

    move/from16 v17, v3

    move v14, v5

    .line 117
    .end local v3    # "currByte":I
    .end local v5    # "cbyte":I
    .end local v7    # "index":I
    .restart local v11    # "index":I
    .restart local v14    # "cbyte":I
    .restart local v17    # "currByte":I
    :goto_d
    add-int/lit8 v3, v16, 0x1

    .line 118
    .end local v16    # "wMarker":I
    .local v3, "wMarker":I
    if-lt v3, v9, :cond_10

    .line 119
    const/4 v3, 0x0

    move/from16 v16, v3

    goto :goto_e

    .line 118
    :cond_10
    move/from16 v16, v3

    .line 100
    .end local v3    # "wMarker":I
    .restart local v16    # "wMarker":I
    :goto_e
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    :cond_11
    move v0, v11

    move v2, v14

    move-object v14, v12

    .line 122
    .end local v11    # "index":I
    .end local v12    # "transparency":[I
    .local v0, "index":I
    .local v2, "cbyte":I
    .local v14, "transparency":[I
    :goto_f
    const/4 v11, 0x1

    const/4 v12, 0x1

    invoke-static/range {v9 .. v14}, Lcom/itextpdf/io/image/ImageDataFactory;->create(IIII[B[I)Lcom/itextpdf/io/image/ImageData;

    move-result-object v3

    return-object v3

    .line 124
    .end local v2    # "cbyte":I
    .end local v4    # "transColor":I
    .end local v6    # "byteWidth":I
    .end local v13    # "pixelsByte":[B
    .end local v14    # "transparency":[I
    .end local v15    # "size":I
    .end local v16    # "wMarker":I
    .end local v17    # "currByte":I
    .end local v20    # "pixels":[I
    .local v0, "pixels":[I
    :cond_12
    move-object/from16 v20, v0

    const/16 p2, 0x0

    .end local v0    # "pixels":[I
    .restart local v20    # "pixels":[I
    mul-int v0, v9, v10

    const/4 v3, 0x3

    mul-int/2addr v0, v3

    new-array v13, v0, [B

    .line 125
    .restart local v13    # "pixelsByte":[B
    const/4 v0, 0x0

    .line 127
    .local v0, "smask":[B
    const/4 v4, 0x0

    .line 128
    .local v4, "index":I
    mul-int v5, v10, v9

    .line 129
    .local v5, "size":I
    const/16 v6, 0xff

    .line 130
    .local v6, "red":I
    const/16 v7, 0xff

    .line 131
    .local v7, "green":I
    const/16 v11, 0xff

    .line 132
    .local v11, "blue":I
    if-eqz p1, :cond_13

    .line 133
    invoke-virtual/range {p1 .. p1}, Ljava/awt/Color;->getRed()I

    move-result v6

    .line 134
    invoke-virtual/range {p1 .. p1}, Ljava/awt/Color;->getGreen()I

    move-result v7

    .line 135
    invoke-virtual/range {p1 .. p1}, Ljava/awt/Color;->getBlue()I

    move-result v11

    move v15, v11

    goto :goto_10

    .line 132
    :cond_13
    move v15, v11

    .line 137
    .end local v11    # "blue":I
    .local v15, "blue":I
    :goto_10
    const/4 v11, 0x0

    .line 138
    .local v11, "transparency":[I
    if-eqz p1, :cond_16

    .line 139
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_11
    if-ge v2, v5, :cond_15

    .line 140
    aget v3, v20, v2

    shr-int/lit8 v3, v3, 0x18

    const/16 v12, 0xff

    and-int/2addr v3, v12

    .line 141
    .local v3, "alpha":I
    const/16 v12, 0xfa

    if-ge v3, v12, :cond_14

    .line 142
    add-int/lit8 v14, v4, 0x1

    .end local v4    # "index":I
    .local v14, "index":I
    int-to-byte v12, v6

    aput-byte v12, v13, v4

    .line 143
    add-int/lit8 v4, v14, 0x1

    .end local v14    # "index":I
    .restart local v4    # "index":I
    int-to-byte v12, v7

    aput-byte v12, v13, v14

    .line 144
    add-int/lit8 v12, v4, 0x1

    .end local v4    # "index":I
    .local v12, "index":I
    int-to-byte v14, v15

    aput-byte v14, v13, v4

    move-object/from16 v16, v0

    move v4, v12

    goto :goto_12

    .line 146
    .end local v12    # "index":I
    .restart local v4    # "index":I
    :cond_14
    add-int/lit8 v12, v4, 0x1

    .end local v4    # "index":I
    .restart local v12    # "index":I
    aget v14, v20, v2

    shr-int/lit8 v14, v14, 0x10

    move-object/from16 v16, v0

    const/16 v0, 0xff

    .end local v0    # "smask":[B
    .local v16, "smask":[B
    and-int/2addr v14, v0

    int-to-byte v14, v14

    aput-byte v14, v13, v4

    .line 147
    add-int/lit8 v4, v12, 0x1

    .end local v12    # "index":I
    .restart local v4    # "index":I
    aget v14, v20, v2

    shr-int/lit8 v14, v14, 0x8

    and-int/2addr v14, v0

    int-to-byte v14, v14

    aput-byte v14, v13, v12

    .line 148
    add-int/lit8 v12, v4, 0x1

    .end local v4    # "index":I
    .restart local v12    # "index":I
    aget v14, v20, v2

    and-int/2addr v14, v0

    int-to-byte v0, v14

    aput-byte v0, v13, v4

    move v4, v12

    .line 139
    .end local v3    # "alpha":I
    .end local v12    # "index":I
    .restart local v4    # "index":I
    :goto_12
    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, v16

    goto :goto_11

    .end local v16    # "smask":[B
    .restart local v0    # "smask":[B
    :cond_15
    move-object/from16 v16, v0

    .end local v0    # "smask":[B
    .restart local v16    # "smask":[B
    move-object/from16 v17, v1

    move-object v14, v11

    .end local v2    # "j":I
    goto/16 :goto_17

    .line 152
    .end local v16    # "smask":[B
    .restart local v0    # "smask":[B
    :cond_16
    move-object/from16 v16, v0

    .end local v0    # "smask":[B
    .restart local v16    # "smask":[B
    const/4 v0, 0x0

    .line 153
    .local v0, "transparentPixel":I
    mul-int v12, v9, v10

    new-array v12, v12, [B

    .line 154
    .end local v16    # "smask":[B
    .local v12, "smask":[B
    const/4 v14, 0x0

    .line 155
    .local v14, "shades":Z
    const/16 v16, 0x0

    move/from16 v23, v16

    move/from16 v16, v2

    move/from16 v2, v23

    .restart local v2    # "j":I
    :goto_13
    if-ge v2, v5, :cond_1f

    .line 156
    aget v17, v20, v2

    move/from16 v18, v3

    shr-int/lit8 v3, v17, 0x18

    move-object/from16 v17, v1

    const/16 v1, 0xff

    .end local v1    # "pg":Ljava/awt/image/PixelGrabber;
    .local v17, "pg":Ljava/awt/image/PixelGrabber;
    and-int/2addr v3, v1

    int-to-byte v1, v3

    aput-byte v1, v12, v2

    .line 158
    .local v1, "alpha":B
    if-nez v14, :cond_1d

    .line 159
    if-eqz v1, :cond_17

    const/4 v3, -0x1

    if-eq v1, v3, :cond_17

    .line 160
    const/4 v3, 0x1

    move/from16 v22, v1

    move v14, v3

    const/16 v19, 0x1

    .end local v14    # "shades":Z
    .local v3, "shades":Z
    goto/16 :goto_16

    .line 161
    .end local v3    # "shades":Z
    .restart local v14    # "shades":Z
    :cond_17
    const v3, 0xffffff

    if-nez v11, :cond_1b

    .line 162
    if-nez v1, :cond_1a

    .line 163
    aget v21, v20, v2

    and-int v0, v21, v3

    .line 164
    move/from16 v21, v3

    const/4 v3, 0x6

    new-array v3, v3, [I

    .line 165
    .end local v11    # "transparency":[I
    .local v3, "transparency":[I
    shr-int/lit8 v11, v0, 0x10

    move/from16 v22, v1

    const/16 v1, 0xff

    .end local v1    # "alpha":B
    .local v22, "alpha":B
    and-int/2addr v11, v1

    const/16 v19, 0x1

    aput v11, v3, v19

    aput v11, v3, p2

    .line 166
    shr-int/lit8 v11, v0, 0x8

    and-int/2addr v11, v1

    aput v11, v3, v18

    aput v11, v3, v16

    .line 167
    and-int/lit16 v1, v0, 0xff

    const/4 v11, 0x5

    aput v1, v3, v11

    const/4 v11, 0x4

    aput v1, v3, v11

    .line 172
    const/4 v1, 0x0

    .local v1, "prevPixel":I
    :goto_14
    if-ge v1, v2, :cond_19

    .line 173
    aget v11, v20, v1

    and-int v11, v11, v21

    if-ne v11, v0, :cond_18

    .line 179
    const/4 v14, 0x1

    .line 180
    goto :goto_15

    .line 172
    :cond_18
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .end local v1    # "prevPixel":I
    :cond_19
    :goto_15
    move-object v11, v3

    goto :goto_16

    .line 162
    .end local v3    # "transparency":[I
    .end local v22    # "alpha":B
    .local v1, "alpha":B
    .restart local v11    # "transparency":[I
    :cond_1a
    move/from16 v22, v1

    const/16 v19, 0x1

    .end local v1    # "alpha":B
    .restart local v22    # "alpha":B
    goto :goto_16

    .line 184
    .end local v22    # "alpha":B
    .restart local v1    # "alpha":B
    :cond_1b
    move/from16 v22, v1

    move/from16 v21, v3

    const/16 v19, 0x1

    .end local v1    # "alpha":B
    .restart local v22    # "alpha":B
    aget v1, v20, v2

    and-int v1, v1, v21

    if-eq v1, v0, :cond_1c

    if-nez v22, :cond_1c

    .line 185
    const/4 v1, 0x1

    move v14, v1

    .end local v14    # "shades":Z
    .local v1, "shades":Z
    goto :goto_16

    .line 186
    .end local v1    # "shades":Z
    .restart local v14    # "shades":Z
    :cond_1c
    aget v1, v20, v2

    and-int v1, v1, v21

    if-ne v1, v0, :cond_1e

    if-eqz v22, :cond_1e

    .line 187
    const/4 v1, 0x1

    move v14, v1

    .end local v14    # "shades":Z
    .restart local v1    # "shades":Z
    goto :goto_16

    .line 158
    .end local v22    # "alpha":B
    .local v1, "alpha":B
    .restart local v14    # "shades":Z
    :cond_1d
    move/from16 v22, v1

    const/16 v19, 0x1

    .line 190
    .end local v1    # "alpha":B
    .restart local v22    # "alpha":B
    :cond_1e
    :goto_16
    add-int/lit8 v1, v4, 0x1

    .end local v4    # "index":I
    .local v1, "index":I
    aget v3, v20, v2

    shr-int/lit8 v3, v3, 0x10

    move/from16 v21, v0

    const/16 v0, 0xff

    .end local v0    # "transparentPixel":I
    .local v21, "transparentPixel":I
    and-int/2addr v3, v0

    int-to-byte v3, v3

    aput-byte v3, v13, v4

    .line 191
    add-int/lit8 v3, v1, 0x1

    .end local v1    # "index":I
    .local v3, "index":I
    aget v4, v20, v2

    shr-int/lit8 v4, v4, 0x8

    and-int/2addr v4, v0

    int-to-byte v4, v4

    aput-byte v4, v13, v1

    .line 192
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "index":I
    .restart local v4    # "index":I
    aget v1, v20, v2

    and-int/2addr v1, v0

    int-to-byte v1, v1

    aput-byte v1, v13, v3

    .line 155
    .end local v22    # "alpha":B
    add-int/lit8 v2, v2, 0x1

    move-object/from16 v1, v17

    move/from16 v3, v18

    move/from16 v0, v21

    goto/16 :goto_13

    .end local v17    # "pg":Ljava/awt/image/PixelGrabber;
    .end local v21    # "transparentPixel":I
    .restart local v0    # "transparentPixel":I
    .local v1, "pg":Ljava/awt/image/PixelGrabber;
    :cond_1f
    move/from16 v21, v0

    move-object/from16 v17, v1

    .line 194
    .end local v0    # "transparentPixel":I
    .end local v1    # "pg":Ljava/awt/image/PixelGrabber;
    .end local v2    # "j":I
    .restart local v17    # "pg":Ljava/awt/image/PixelGrabber;
    .restart local v21    # "transparentPixel":I
    if-eqz v14, :cond_20

    .line 195
    const/4 v11, 0x0

    move-object v14, v11

    move-object v0, v12

    goto :goto_17

    .line 197
    :cond_20
    const/4 v0, 0x0

    move-object v14, v11

    .line 199
    .end local v11    # "transparency":[I
    .end local v12    # "smask":[B
    .end local v21    # "transparentPixel":I
    .local v0, "smask":[B
    .local v14, "transparency":[I
    :goto_17
    const/4 v11, 0x3

    const/16 v12, 0x8

    invoke-static/range {v9 .. v14}, Lcom/itextpdf/io/image/ImageDataFactory;->create(IIII[B[I)Lcom/itextpdf/io/image/ImageData;

    move-result-object v1

    .line 200
    move-object v2, v13

    move-object v3, v14

    .end local v13    # "pixelsByte":[B
    .end local v14    # "transparency":[I
    .local v1, "img":Lcom/itextpdf/io/image/ImageData;
    .local v2, "pixelsByte":[B
    .local v3, "transparency":[I
    if-eqz v0, :cond_21

    .line 201
    const/16 v12, 0x8

    const/4 v14, 0x0

    const/4 v11, 0x1

    move-object v13, v0

    .end local v0    # "smask":[B
    .local v13, "smask":[B
    invoke-static/range {v9 .. v14}, Lcom/itextpdf/io/image/ImageDataFactory;->create(IIII[B[I)Lcom/itextpdf/io/image/ImageData;

    move-result-object v0

    .line 202
    .local v0, "sm":Lcom/itextpdf/io/image/ImageData;
    invoke-virtual {v0}, Lcom/itextpdf/io/image/ImageData;->makeMask()V

    .line 203
    invoke-virtual {v1, v0}, Lcom/itextpdf/io/image/ImageData;->setImageMask(Lcom/itextpdf/io/image/ImageData;)V

    goto :goto_18

    .line 200
    .end local v13    # "smask":[B
    .local v0, "smask":[B
    :cond_21
    move-object v13, v0

    .line 205
    .end local v0    # "smask":[B
    .restart local v13    # "smask":[B
    :goto_18
    return-object v1

    .line 59
    .end local v2    # "pixelsByte":[B
    .end local v3    # "transparency":[I
    .end local v4    # "index":I
    .end local v5    # "size":I
    .end local v6    # "red":I
    .end local v7    # "green":I
    .end local v9    # "w":I
    .end local v10    # "h":I
    .end local v13    # "smask":[B
    .end local v15    # "blue":I
    .end local v17    # "pg":Ljava/awt/image/PixelGrabber;
    .end local v20    # "pixels":[I
    .local v1, "pg":Ljava/awt/image/PixelGrabber;
    :cond_22
    move-object/from16 v17, v1

    .end local v1    # "pg":Ljava/awt/image/PixelGrabber;
    .restart local v17    # "pg":Ljava/awt/image/PixelGrabber;
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Java.awt.image fetch aborted or errored"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    .end local v17    # "pg":Ljava/awt/image/PixelGrabber;
    .restart local v1    # "pg":Ljava/awt/image/PixelGrabber;
    :catch_0
    move-exception v0

    move-object/from16 v17, v1

    .line 56
    .end local v1    # "pg":Ljava/awt/image/PixelGrabber;
    .local v0, "e":Ljava/lang/InterruptedException;
    .restart local v17    # "pg":Ljava/awt/image/PixelGrabber;
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Java.awt.image was interrupted. Waiting for pixels"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
