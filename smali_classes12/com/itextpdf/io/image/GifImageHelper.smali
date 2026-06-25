.class public final Lcom/itextpdf/io/image/GifImageHelper;
.super Ljava/lang/Object;
.source "GifImageHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/image/GifImageHelper$GifParameters;
    }
.end annotation


# static fields
.field static final MAX_STACK_SIZE:I = 0x1000


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static decodeImageData(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)Z
    .locals 29
    .param p0, "gif"    # Lcom/itextpdf/io/image/GifImageHelper$GifParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 328
    move-object/from16 v0, p0

    const/4 v1, -0x1

    .line 329
    .local v1, "NullCode":I
    iget v2, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->iw:I

    iget v3, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->ih:I

    mul-int/2addr v2, v3

    .line 332
    .local v2, "npix":I
    const/4 v3, 0x0

    .line 334
    .local v3, "skipZero":Z
    iget-object v4, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->prefix:[S

    const/16 v5, 0x1000

    if-nez v4, :cond_0

    .line 335
    new-array v4, v5, [S

    iput-object v4, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->prefix:[S

    .line 336
    :cond_0
    iget-object v4, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->suffix:[B

    if-nez v4, :cond_1

    .line 337
    new-array v4, v5, [B

    iput-object v4, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->suffix:[B

    .line 338
    :cond_1
    iget-object v4, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->pixelStack:[B

    if-nez v4, :cond_2

    .line 339
    const/16 v4, 0x1001

    new-array v4, v4, [B

    iput-object v4, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->pixelStack:[B

    .line 341
    :cond_2
    iget v4, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->iw:I

    iget v6, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_bpc:I

    mul-int/2addr v4, v6

    add-int/lit8 v4, v4, 0x7

    const/16 v6, 0x8

    div-int/2addr v4, v6

    iput v4, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_line_stride:I

    .line 342
    iget v4, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_line_stride:I

    iget v7, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->ih:I

    mul-int/2addr v4, v7

    new-array v4, v4, [B

    iput-object v4, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_out:[B

    .line 343
    const/4 v4, 0x1

    .line 344
    .local v4, "pass":I
    iget-boolean v7, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->interlace:Z

    const/4 v8, 0x1

    if-eqz v7, :cond_3

    goto :goto_0

    :cond_3
    move v6, v8

    .line 345
    .local v6, "inc":I
    :goto_0
    const/4 v7, 0x0

    .line 346
    .local v7, "line":I
    const/4 v9, 0x0

    .line 350
    .local v9, "xpos":I
    iget-object v10, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->input:Ljava/io/InputStream;

    invoke-virtual {v10}, Ljava/io/InputStream;->read()I

    move-result v10

    .line 351
    .local v10, "data_size":I
    shl-int v11, v8, v10

    .line 352
    .local v11, "clear":I
    add-int/lit8 v12, v11, 0x1

    .line 353
    .local v12, "end_of_information":I
    add-int/lit8 v13, v11, 0x2

    .line 354
    .local v13, "available":I
    move v14, v1

    .line 355
    .local v14, "old_code":I
    add-int/lit8 v15, v10, 0x1

    .line 356
    .local v15, "code_size":I
    shl-int v16, v8, v15

    add-int/lit8 v16, v16, -0x1

    .line 357
    .local v16, "code_mask":I
    const/16 v17, 0x0

    move/from16 v18, v8

    move/from16 v8, v17

    .local v8, "code":I
    :goto_1
    const/16 v17, 0x0

    if-ge v8, v11, :cond_4

    .line 358
    iget-object v5, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->prefix:[S

    aput-short v17, v5, v8

    .line 359
    iget-object v5, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->suffix:[B

    move/from16 v19, v3

    .end local v3    # "skipZero":Z
    .local v19, "skipZero":Z
    int-to-byte v3, v8

    aput-byte v3, v5, v8

    .line 357
    add-int/lit8 v8, v8, 0x1

    move/from16 v3, v19

    const/16 v5, 0x1000

    goto :goto_1

    .line 364
    .end local v19    # "skipZero":Z
    .restart local v3    # "skipZero":Z
    :cond_4
    move/from16 v19, v3

    .end local v3    # "skipZero":Z
    .restart local v19    # "skipZero":Z
    move/from16 v3, v17

    .local v3, "bi":I
    move/from16 v5, v17

    .local v5, "top":I
    move/from16 v20, v17

    .local v20, "first":I
    move/from16 v21, v17

    .local v21, "count":I
    move/from16 v22, v17

    .line 366
    .local v17, "datum":I
    .local v22, "bits":I
    const/16 v23, 0x0

    move/from16 v28, v20

    move/from16 v20, v3

    move/from16 v3, v28

    move/from16 v28, v22

    move/from16 v22, v4

    move/from16 v4, v28

    move/from16 v28, v23

    move/from16 v23, v5

    move/from16 v5, v28

    .local v3, "first":I
    .local v4, "bits":I
    .local v5, "i":I
    .local v20, "bi":I
    .local v22, "pass":I
    .local v23, "top":I
    :goto_2
    if-ge v5, v2, :cond_16

    .line 367
    if-nez v23, :cond_11

    .line 368
    if-ge v4, v15, :cond_7

    .line 370
    if-nez v21, :cond_6

    .line 372
    invoke-static {v0}, Lcom/itextpdf/io/image/GifImageHelper;->readBlock(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)I

    move-result v21

    .line 373
    if-gtz v21, :cond_5

    .line 374
    const/16 v18, 0x1

    .line 375
    .end local v19    # "skipZero":Z
    .local v18, "skipZero":Z
    move/from16 v26, v1

    move/from16 v24, v2

    move v1, v3

    move/from16 v3, v18

    goto/16 :goto_8

    .line 377
    .end local v18    # "skipZero":Z
    .restart local v19    # "skipZero":Z
    :cond_5
    const/16 v20, 0x0

    .line 379
    :cond_6
    move/from16 v24, v2

    .end local v2    # "npix":I
    .local v24, "npix":I
    iget-object v2, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->block:[B

    aget-byte v2, v2, v20

    and-int/lit16 v2, v2, 0xff

    shl-int/2addr v2, v4

    add-int v17, v17, v2

    .line 380
    add-int/lit8 v4, v4, 0x8

    .line 381
    add-int/lit8 v20, v20, 0x1

    .line 382
    add-int/lit8 v21, v21, -0x1

    .line 383
    move/from16 v2, v24

    goto :goto_2

    .line 388
    .end local v24    # "npix":I
    .restart local v2    # "npix":I
    :cond_7
    move/from16 v24, v2

    .end local v2    # "npix":I
    .restart local v24    # "npix":I
    and-int v8, v17, v16

    .line 389
    shr-int v17, v17, v15

    .line 390
    sub-int/2addr v4, v15

    .line 394
    if-gt v8, v13, :cond_10

    if-ne v8, v12, :cond_8

    .line 395
    move/from16 v26, v1

    goto/16 :goto_5

    .line 396
    :cond_8
    if-ne v8, v11, :cond_9

    .line 398
    add-int/lit8 v15, v10, 0x1

    .line 399
    shl-int v2, v18, v15

    add-int/lit8 v16, v2, -0x1

    .line 400
    add-int/lit8 v13, v11, 0x2

    .line 401
    move v14, v1

    .line 402
    move/from16 v2, v24

    goto :goto_2

    .line 404
    :cond_9
    if-ne v14, v1, :cond_a

    .line 405
    iget-object v2, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->pixelStack:[B

    add-int/lit8 v25, v23, 0x1

    move/from16 v26, v1

    .end local v1    # "NullCode":I
    .end local v23    # "top":I
    .local v25, "top":I
    .local v26, "NullCode":I
    iget-object v1, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->suffix:[B

    aget-byte v1, v1, v8

    aput-byte v1, v2, v23

    .line 406
    move v14, v8

    .line 407
    move v3, v8

    .line 408
    move/from16 v2, v24

    move/from16 v23, v25

    move/from16 v1, v26

    goto :goto_2

    .line 410
    .end local v25    # "top":I
    .end local v26    # "NullCode":I
    .restart local v1    # "NullCode":I
    .restart local v23    # "top":I
    :cond_a
    move/from16 v26, v1

    .end local v1    # "NullCode":I
    .restart local v26    # "NullCode":I
    move v1, v8

    .line 411
    .local v1, "in_code":I
    if-ne v8, v13, :cond_b

    .line 412
    iget-object v2, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->pixelStack:[B

    add-int/lit8 v25, v23, 0x1

    move/from16 v27, v1

    .end local v1    # "in_code":I
    .end local v23    # "top":I
    .restart local v25    # "top":I
    .local v27, "in_code":I
    int-to-byte v1, v3

    aput-byte v1, v2, v23

    .line 413
    move v1, v14

    move v8, v1

    move/from16 v23, v25

    .end local v8    # "code":I
    .local v1, "code":I
    goto :goto_3

    .line 411
    .end local v25    # "top":I
    .end local v27    # "in_code":I
    .local v1, "in_code":I
    .restart local v8    # "code":I
    .restart local v23    # "top":I
    :cond_b
    move/from16 v27, v1

    .line 415
    .end local v1    # "in_code":I
    .restart local v27    # "in_code":I
    :goto_3
    if-le v8, v11, :cond_c

    .line 416
    iget-object v1, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->pixelStack:[B

    add-int/lit8 v2, v23, 0x1

    move-object/from16 v25, v1

    .end local v23    # "top":I
    .local v2, "top":I
    iget-object v1, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->suffix:[B

    aget-byte v1, v1, v8

    aput-byte v1, v25, v23

    .line 417
    iget-object v1, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->prefix:[S

    aget-short v8, v1, v8

    move/from16 v23, v2

    goto :goto_3

    .line 419
    .end local v2    # "top":I
    .restart local v23    # "top":I
    :cond_c
    iget-object v1, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->suffix:[B

    aget-byte v1, v1, v8

    and-int/lit16 v3, v1, 0xff

    .line 423
    const/16 v1, 0x1000

    if-lt v13, v1, :cond_d

    .line 424
    move v1, v3

    move/from16 v3, v19

    goto/16 :goto_8

    .line 425
    :cond_d
    iget-object v1, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->pixelStack:[B

    add-int/lit8 v2, v23, 0x1

    move-object/from16 v25, v1

    .end local v23    # "top":I
    .restart local v2    # "top":I
    int-to-byte v1, v3

    aput-byte v1, v25, v23

    .line 426
    iget-object v1, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->prefix:[S

    move-object/from16 v23, v1

    int-to-short v1, v14

    aput-short v1, v23, v13

    .line 427
    iget-object v1, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->suffix:[B

    move-object/from16 v23, v1

    int-to-byte v1, v3

    aput-byte v1, v23, v13

    .line 428
    add-int/lit8 v13, v13, 0x1

    .line 429
    and-int v1, v13, v16

    if-nez v1, :cond_e

    const/16 v1, 0x1000

    if-ge v13, v1, :cond_f

    .line 430
    add-int/lit8 v15, v15, 0x1

    .line 431
    add-int v16, v16, v13

    goto :goto_4

    .line 429
    :cond_e
    const/16 v1, 0x1000

    .line 433
    :cond_f
    :goto_4
    move/from16 v14, v27

    goto :goto_6

    .line 394
    .end local v2    # "top":I
    .end local v26    # "NullCode":I
    .end local v27    # "in_code":I
    .local v1, "NullCode":I
    .restart local v23    # "top":I
    :cond_10
    move/from16 v26, v1

    .line 477
    .end local v1    # "NullCode":I
    .restart local v26    # "NullCode":I
    :goto_5
    move v1, v3

    move/from16 v3, v19

    goto/16 :goto_8

    .line 367
    .end local v24    # "npix":I
    .end local v26    # "NullCode":I
    .restart local v1    # "NullCode":I
    .local v2, "npix":I
    :cond_11
    move/from16 v26, v1

    move/from16 v24, v2

    const/16 v1, 0x1000

    .end local v1    # "NullCode":I
    .end local v2    # "npix":I
    .restart local v24    # "npix":I
    .restart local v26    # "NullCode":I
    move/from16 v2, v23

    .line 438
    .end local v23    # "top":I
    .local v2, "top":I
    :goto_6
    add-int/lit8 v23, v2, -0x1

    .line 439
    .end local v2    # "top":I
    .restart local v23    # "top":I
    add-int/lit8 v5, v5, 0x1

    .line 441
    iget-object v2, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->pixelStack:[B

    aget-byte v2, v2, v23

    invoke-static {v9, v7, v2, v0}, Lcom/itextpdf/io/image/GifImageHelper;->setPixel(IIILcom/itextpdf/io/image/GifImageHelper$GifParameters;)V

    .line 442
    add-int/lit8 v9, v9, 0x1

    .line 443
    iget v2, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->iw:I

    if-lt v9, v2, :cond_15

    .line 444
    const/4 v9, 0x0

    .line 445
    add-int/2addr v7, v6

    .line 446
    iget v2, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->ih:I

    if-lt v7, v2, :cond_14

    .line 447
    iget-boolean v2, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->interlace:Z

    if-eqz v2, :cond_13

    .line 449
    :cond_12
    add-int/lit8 v22, v22, 0x1

    .line 450
    packed-switch v22, :pswitch_data_0

    .line 464
    iget v2, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->ih:I

    add-int/lit8 v2, v2, -0x1

    .line 465
    .end local v7    # "line":I
    .local v2, "line":I
    const/4 v6, 0x0

    move v7, v2

    goto :goto_7

    .line 459
    .end local v2    # "line":I
    .restart local v7    # "line":I
    :pswitch_0
    const/4 v2, 0x1

    .line 460
    .end local v7    # "line":I
    .restart local v2    # "line":I
    const/4 v6, 0x2

    .line 461
    move v7, v2

    goto :goto_7

    .line 455
    .end local v2    # "line":I
    .restart local v7    # "line":I
    :pswitch_1
    const/4 v2, 0x2

    .line 456
    .end local v7    # "line":I
    .restart local v2    # "line":I
    const/4 v6, 0x4

    .line 457
    move v7, v2

    goto :goto_7

    .line 452
    .end local v2    # "line":I
    .restart local v7    # "line":I
    :pswitch_2
    const/4 v2, 0x4

    .line 453
    .end local v7    # "line":I
    .restart local v2    # "line":I
    move v7, v2

    .line 467
    .end local v2    # "line":I
    .restart local v7    # "line":I
    :goto_7
    iget v2, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->ih:I

    if-ge v7, v2, :cond_12

    move/from16 v2, v24

    move/from16 v1, v26

    goto/16 :goto_2

    .line 471
    :cond_13
    iget v2, v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->ih:I

    add-int/lit8 v7, v2, -0x1

    .line 472
    const/4 v6, 0x0

    move/from16 v2, v24

    move/from16 v1, v26

    goto/16 :goto_2

    .line 446
    :cond_14
    move/from16 v2, v24

    move/from16 v1, v26

    goto/16 :goto_2

    .line 443
    :cond_15
    move/from16 v2, v24

    move/from16 v1, v26

    goto/16 :goto_2

    .line 366
    .end local v24    # "npix":I
    .end local v26    # "NullCode":I
    .restart local v1    # "NullCode":I
    .local v2, "npix":I
    :cond_16
    move/from16 v26, v1

    move/from16 v24, v2

    .end local v1    # "NullCode":I
    .end local v2    # "npix":I
    .restart local v24    # "npix":I
    .restart local v26    # "NullCode":I
    move v1, v3

    move/from16 v3, v19

    .line 477
    .end local v19    # "skipZero":Z
    .local v1, "first":I
    .local v3, "skipZero":Z
    :goto_8
    return v3

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static newBpc(I)I
    .locals 1
    .param p0, "bpc"    # I

    .line 210
    packed-switch p0, :pswitch_data_0

    .line 218
    const/16 v0, 0x8

    return v0

    .line 216
    :pswitch_0
    const/4 v0, 0x4

    return v0

    .line 214
    :pswitch_1
    nop

    .line 220
    return p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static process(Ljava/io/InputStream;Lcom/itextpdf/io/image/GifImageHelper$GifParameters;I)V
    .locals 2
    .param p0, "stream"    # Ljava/io/InputStream;
    .param p1, "gif"    # Lcom/itextpdf/io/image/GifImageHelper$GifParameters;
    .param p2, "lastFrameNumber"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 131
    iput-object p0, p1, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->input:Ljava/io/InputStream;

    .line 132
    invoke-static {p1}, Lcom/itextpdf/io/image/GifImageHelper;->readHeader(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)V

    .line 133
    invoke-static {p1, p2}, Lcom/itextpdf/io/image/GifImageHelper;->readContents(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;I)V

    .line 134
    iget v0, p1, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->currentFrame:I

    if-le v0, p2, :cond_0

    .line 137
    return-void

    .line 135
    :cond_0
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v1, "Cannot find frame number {0} (zero-based)"

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v0

    throw v0
.end method

.method public static processImage(Lcom/itextpdf/io/image/GifImageData;)V
    .locals 1
    .param p0, "image"    # Lcom/itextpdf/io/image/GifImageData;

    .line 108
    const/4 v0, -0x1

    invoke-static {p0, v0}, Lcom/itextpdf/io/image/GifImageHelper;->processImage(Lcom/itextpdf/io/image/GifImageData;I)V

    .line 109
    return-void
.end method

.method public static processImage(Lcom/itextpdf/io/image/GifImageData;I)V
    .locals 4
    .param p0, "image"    # Lcom/itextpdf/io/image/GifImageData;
    .param p1, "lastFrameNumber"    # I

    .line 117
    new-instance v0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;-><init>(Lcom/itextpdf/io/image/GifImageData;)V

    .line 120
    .local v0, "gif":Lcom/itextpdf/io/image/GifImageHelper$GifParameters;
    :try_start_0
    invoke-virtual {p0}, Lcom/itextpdf/io/image/GifImageData;->getData()[B

    move-result-object v1

    if-nez v1, :cond_0

    .line 121
    invoke-virtual {p0}, Lcom/itextpdf/io/image/GifImageData;->loadData()V

    .line 123
    :cond_0
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p0}, Lcom/itextpdf/io/image/GifImageData;->getData()[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 124
    .local v1, "gifStream":Ljava/io/InputStream;
    invoke-static {v1, v0, p1}, Lcom/itextpdf/io/image/GifImageHelper;->process(Ljava/io/InputStream;Lcom/itextpdf/io/image/GifImageHelper$GifParameters;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    nop

    .line 128
    return-void

    .line 125
    .end local v1    # "gifStream":Ljava/io/InputStream;
    :catch_0
    move-exception v1

    .line 126
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "GIF image exception."

    invoke-direct {v2, v3, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private static readBlock(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)I
    .locals 4
    .param p0, "gif"    # Lcom/itextpdf/io/image/GifImageHelper$GifParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 190
    iget-object v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->input:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->blockSize:I

    .line 191
    iget v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->blockSize:I

    const/4 v1, 0x0

    if-gtz v0, :cond_0

    .line 192
    iput v1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->blockSize:I

    return v1

    .line 194
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->input:Ljava/io/InputStream;

    iget-object v2, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->block:[B

    iget v3, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->blockSize:I

    invoke-virtual {v0, v2, v1, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->blockSize:I

    .line 196
    iget v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->blockSize:I

    return v0
.end method

.method private static readColorTable(ILcom/itextpdf/io/image/GifImageHelper$GifParameters;)[B
    .locals 5
    .param p0, "bpc"    # I
    .param p1, "gif"    # Lcom/itextpdf/io/image/GifImageHelper$GifParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 200
    const/4 v0, 0x1

    shl-int v1, v0, p0

    .line 201
    .local v1, "ncolors":I
    mul-int/lit8 v2, v1, 0x3

    .line 202
    .local v2, "nbytes":I
    invoke-static {p0}, Lcom/itextpdf/io/image/GifImageHelper;->newBpc(I)I

    move-result p0

    .line 203
    shl-int/2addr v0, p0

    mul-int/lit8 v0, v0, 0x3

    new-array v0, v0, [B

    .line 204
    .local v0, "table":[B
    iget-object v3, p1, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->input:Ljava/io/InputStream;

    const/4 v4, 0x0

    invoke-static {v3, v0, v4, v2}, Lcom/itextpdf/io/util/StreamUtil;->readFully(Ljava/io/InputStream;[BII)V

    .line 205
    return-object v0
.end method

.method private static readContents(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;I)V
    .locals 3
    .param p0, "gif"    # Lcom/itextpdf/io/image/GifImageHelper$GifParameters;
    .param p1, "lastFrameNumber"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 225
    const/4 v0, 0x0

    .line 226
    .local v0, "done":Z
    const/4 v1, 0x0

    iput v1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->currentFrame:I

    .line 227
    :goto_0
    if-nez v0, :cond_1

    .line 228
    iget-object v1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->input:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 229
    .local v1, "code":I
    sparse-switch v1, :sswitch_data_0

    .line 258
    const/4 v0, 0x1

    goto :goto_1

    .line 232
    :sswitch_0
    invoke-static {p0}, Lcom/itextpdf/io/image/GifImageHelper;->readFrame(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)V

    .line 233
    iget v2, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->currentFrame:I

    if-ne v2, p1, :cond_0

    .line 234
    const/4 v0, 0x1

    .line 236
    :cond_0
    iget v2, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->currentFrame:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->currentFrame:I

    .line 237
    goto :goto_1

    .line 240
    :sswitch_1
    iget-object v2, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->input:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 241
    sparse-switch v1, :sswitch_data_1

    .line 254
    invoke-static {p0}, Lcom/itextpdf/io/image/GifImageHelper;->skip(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)V

    .line 256
    goto :goto_1

    .line 248
    :sswitch_2
    invoke-static {p0}, Lcom/itextpdf/io/image/GifImageHelper;->readBlock(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)I

    .line 250
    invoke-static {p0}, Lcom/itextpdf/io/image/GifImageHelper;->skip(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)V

    .line 251
    goto :goto_1

    .line 244
    :sswitch_3
    invoke-static {p0}, Lcom/itextpdf/io/image/GifImageHelper;->readGraphicControlExt(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)V

    .line 245
    nop

    .line 261
    .end local v1    # "code":I
    :goto_1
    goto :goto_0

    .line 262
    :cond_1
    return-void

    :sswitch_data_0
    .sparse-switch
        0x21 -> :sswitch_1
        0x2c -> :sswitch_0
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        0xf9 -> :sswitch_3
        0xff -> :sswitch_2
    .end sparse-switch
.end method

.method private static readFrame(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)V
    .locals 14
    .param p0, "gif"    # Lcom/itextpdf/io/image/GifImageHelper$GifParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 269
    invoke-static {p0}, Lcom/itextpdf/io/image/GifImageHelper;->readShort(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->ix:I

    .line 270
    invoke-static {p0}, Lcom/itextpdf/io/image/GifImageHelper;->readShort(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->iy:I

    .line 271
    invoke-static {p0}, Lcom/itextpdf/io/image/GifImageHelper;->readShort(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->iw:I

    .line 272
    invoke-static {p0}, Lcom/itextpdf/io/image/GifImageHelper;->readShort(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->ih:I

    .line 274
    iget-object v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->input:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 276
    .local v1, "packed":I
    and-int/lit16 v0, v1, 0x80

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_0

    move v0, v3

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    iput-boolean v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->lctFlag:Z

    .line 278
    and-int/lit8 v0, v1, 0x40

    if-eqz v0, :cond_1

    move v0, v3

    goto :goto_1

    :cond_1
    move v0, v2

    :goto_1
    iput-boolean v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->interlace:Z

    .line 282
    and-int/lit8 v0, v1, 0x7

    const/4 v4, 0x2

    shl-int v0, v4, v0

    iput v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->lctSize:I

    .line 283
    iget v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_gbpc:I

    invoke-static {v0}, Lcom/itextpdf/io/image/GifImageHelper;->newBpc(I)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_bpc:I

    .line 284
    iget-boolean v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->lctFlag:Z

    if-eqz v0, :cond_2

    .line 286
    and-int/lit8 v0, v1, 0x7

    add-int/2addr v0, v3

    invoke-static {v0, p0}, Lcom/itextpdf/io/image/GifImageHelper;->readColorTable(ILcom/itextpdf/io/image/GifImageHelper$GifParameters;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_curr_table:[B

    .line 287
    and-int/lit8 v0, v1, 0x7

    add-int/2addr v0, v3

    invoke-static {v0}, Lcom/itextpdf/io/image/GifImageHelper;->newBpc(I)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_bpc:I

    goto :goto_2

    .line 290
    :cond_2
    iget-object v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_global_table:[B

    iput-object v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_curr_table:[B

    .line 292
    :goto_2
    iget-boolean v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->transparency:Z

    const/4 v5, 0x3

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->transIndex:I

    iget-object v6, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_curr_table:[B

    array-length v6, v6

    div-int/2addr v6, v5

    if-lt v0, v6, :cond_3

    .line 293
    iput-boolean v2, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->transparency:Z

    .line 295
    :cond_3
    iget-boolean v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->transparency:Z

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_bpc:I

    if-ne v0, v3, :cond_4

    .line 296
    const/16 v0, 0xc

    new-array v0, v0, [B

    .line 297
    .local v0, "tp":[B
    iget-object v6, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_curr_table:[B

    const/4 v7, 0x6

    invoke-static {v6, v2, v0, v2, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 298
    iput-object v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_curr_table:[B

    .line 299
    iput v4, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_bpc:I

    .line 302
    .end local v0    # "tp":[B
    :cond_4
    invoke-static {p0}, Lcom/itextpdf/io/image/GifImageHelper;->decodeImageData(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)Z

    move-result v6

    .line 303
    .local v6, "skipZero":Z
    if-nez v6, :cond_5

    .line 304
    invoke-static {p0}, Lcom/itextpdf/io/image/GifImageHelper;->skip(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)V

    .line 307
    :cond_5
    const/4 v0, 0x4

    :try_start_0
    new-array v0, v0, [Ljava/lang/Object;

    .line 308
    .local v0, "colorspace":[Ljava/lang/Object;
    const-string v7, "/Indexed"

    aput-object v7, v0, v2

    .line 309
    const-string v2, "/DeviceRGB"

    aput-object v2, v0, v3

    .line 310
    iget-object v2, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_curr_table:[B

    array-length v2, v2

    .line 311
    .local v2, "len":I
    div-int/lit8 v7, v2, 0x3

    sub-int/2addr v7, v3

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v4

    .line 312
    iget-object v3, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_curr_table:[B

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/itextpdf/io/font/PdfEncodings;->convertToString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v5

    .line 313
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 314
    .local v3, "ad":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "ColorSpace"

    invoke-interface {v3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    new-instance v4, Lcom/itextpdf/io/image/RawImageData;

    iget-object v5, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_out:[B

    sget-object v7, Lcom/itextpdf/io/image/ImageType;->GIF:Lcom/itextpdf/io/image/ImageType;

    invoke-direct {v4, v5, v7}, Lcom/itextpdf/io/image/RawImageData;-><init>([BLcom/itextpdf/io/image/ImageType;)V

    move-object v8, v4

    .line 316
    .local v8, "img":Lcom/itextpdf/io/image/RawImageData;
    iget v9, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->iw:I

    iget v10, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->ih:I

    iget v12, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_bpc:I

    iget-object v13, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_out:[B

    const/4 v11, 0x1

    invoke-static/range {v8 .. v13}, Lcom/itextpdf/io/image/RawImageHelper;->updateRawImageParameters(Lcom/itextpdf/io/image/RawImageData;IIII[B)V

    .line 317
    invoke-static {v8, v3}, Lcom/itextpdf/io/image/RawImageHelper;->updateImageAttributes(Lcom/itextpdf/io/image/RawImageData;Ljava/util/Map;)V

    .line 318
    iget-object v4, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->image:Lcom/itextpdf/io/image/GifImageData;

    invoke-virtual {v4, v8}, Lcom/itextpdf/io/image/GifImageData;->addFrame(Lcom/itextpdf/io/image/ImageData;)V

    .line 319
    iget-boolean v4, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->transparency:Z

    if-eqz v4, :cond_6

    .line 320
    iget v4, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->transIndex:I

    iget v5, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->transIndex:I

    filled-new-array {v4, v5}, [I

    move-result-object v4

    invoke-virtual {v8, v4}, Lcom/itextpdf/io/image/RawImageData;->setTransparency([I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 324
    .end local v0    # "colorspace":[Ljava/lang/Object;
    .end local v2    # "len":I
    .end local v3    # "ad":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v8    # "img":Lcom/itextpdf/io/image/RawImageData;
    :cond_6
    nop

    .line 325
    return-void

    .line 322
    :catch_0
    move-exception v0

    .line 323
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "GIF image exception."

    invoke-direct {v2, v3, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private static readGraphicControlExt(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)V
    .locals 3
    .param p0, "gif"    # Lcom/itextpdf/io/image/GifImageHelper$GifParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 498
    iget-object v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->input:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 500
    iget-object v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->input:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 502
    .local v0, "packed":I
    and-int/lit8 v1, v0, 0x1c

    shr-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->dispose:I

    .line 503
    iget v1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->dispose:I

    const/4 v2, 0x1

    if-nez v1, :cond_0

    .line 505
    iput v2, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->dispose:I

    .line 507
    :cond_0
    and-int/lit8 v1, v0, 0x1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    iput-boolean v2, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->transparency:Z

    .line 509
    invoke-static {p0}, Lcom/itextpdf/io/image/GifImageHelper;->readShort(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)I

    move-result v1

    mul-int/lit8 v1, v1, 0xa

    iput v1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->delay:I

    .line 511
    iget-object v1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->input:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v1

    iput v1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->transIndex:I

    .line 513
    iget-object v1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->input:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    .line 514
    return-void
.end method

.method private static readHeader(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)V
    .locals 3
    .param p0, "gif"    # Lcom/itextpdf/io/image/GifImageHelper$GifParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 143
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 144
    .local v0, "id":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/4 v2, 0x6

    if-ge v1, v2, :cond_0

    .line 145
    iget-object v2, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->input:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v2

    int-to-char v2, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 144
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 146
    .end local v1    # "i":I
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "GIF8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 150
    invoke-static {p0}, Lcom/itextpdf/io/image/GifImageHelper;->readLSD(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)V

    .line 151
    iget-boolean v1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->gctFlag:Z

    if-eqz v1, :cond_1

    .line 152
    iget v1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_gbpc:I

    invoke-static {v1, p0}, Lcom/itextpdf/io/image/GifImageHelper;->readColorTable(ILcom/itextpdf/io/image/GifImageHelper$GifParameters;)[B

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_global_table:[B

    .line 154
    :cond_1
    return-void

    .line 147
    :cond_2
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "GIF signature not found."

    invoke-direct {v1, v2}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static readLSD(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)V
    .locals 3
    .param p0, "gif"    # Lcom/itextpdf/io/image/GifImageHelper$GifParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 162
    iget-object v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->image:Lcom/itextpdf/io/image/GifImageData;

    invoke-static {p0}, Lcom/itextpdf/io/image/GifImageHelper;->readShort(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/image/GifImageData;->setLogicalWidth(F)V

    .line 163
    iget-object v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->image:Lcom/itextpdf/io/image/GifImageData;

    invoke-static {p0}, Lcom/itextpdf/io/image/GifImageHelper;->readShort(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/image/GifImageData;->setLogicalHeight(F)V

    .line 166
    iget-object v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->input:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 168
    .local v0, "packed":I
    and-int/lit16 v1, v0, 0x80

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->gctFlag:Z

    .line 169
    and-int/lit8 v1, v0, 0x7

    add-int/2addr v1, v2

    iput v1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_gbpc:I

    .line 171
    iget-object v1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->input:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v1

    iput v1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->bgIndex:I

    .line 173
    iget-object v1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->input:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v1

    iput v1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->pixelAspect:I

    .line 174
    return-void
.end method

.method private static readShort(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)I
    .locals 2
    .param p0, "gif"    # Lcom/itextpdf/io/image/GifImageHelper$GifParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 181
    iget-object v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->input:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->input:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    return v0
.end method

.method private static setPixel(IIILcom/itextpdf/io/image/GifImageHelper$GifParameters;)V
    .locals 5
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "v"    # I
    .param p3, "gif"    # Lcom/itextpdf/io/image/GifImageHelper$GifParameters;

    .line 482
    iget v0, p3, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_bpc:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 483
    iget v0, p3, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->iw:I

    mul-int/2addr v0, p1

    add-int/2addr v0, p0

    .line 484
    .local v0, "pos":I
    iget-object v1, p3, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_out:[B

    int-to-byte v2, p2

    aput-byte v2, v1, v0

    .line 485
    .end local v0    # "pos":I
    goto :goto_0

    .line 487
    :cond_0
    iget v0, p3, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_line_stride:I

    mul-int/2addr v0, p1

    iget v2, p3, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_bpc:I

    div-int v2, v1, v2

    div-int v2, p0, v2

    add-int/2addr v0, v2

    .line 488
    .restart local v0    # "pos":I
    iget v2, p3, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_bpc:I

    iget v3, p3, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_bpc:I

    div-int v3, v1, v3

    rem-int v3, p0, v3

    mul-int/2addr v2, v3

    sub-int/2addr v1, v2

    iget v2, p3, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_bpc:I

    sub-int/2addr v1, v2

    shl-int v1, p2, v1

    .line 489
    .local v1, "vout":I
    iget-object v2, p3, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->m_out:[B

    aget-byte v3, v2, v0

    int-to-byte v4, v1

    or-int/2addr v3, v4

    int-to-byte v3, v3

    aput-byte v3, v2, v0

    .line 491
    .end local v0    # "pos":I
    .end local v1    # "vout":I
    :goto_0
    return-void
.end method

.method private static skip(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)V
    .locals 1
    .param p0, "gif"    # Lcom/itextpdf/io/image/GifImageHelper$GifParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 522
    nop

    :cond_0
    invoke-static {p0}, Lcom/itextpdf/io/image/GifImageHelper;->readBlock(Lcom/itextpdf/io/image/GifImageHelper$GifParameters;)I

    .line 523
    iget v0, p0, Lcom/itextpdf/io/image/GifImageHelper$GifParameters;->blockSize:I

    if-gtz v0, :cond_0

    .line 524
    return-void
.end method
