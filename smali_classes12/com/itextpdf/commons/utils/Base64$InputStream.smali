.class public Lcom/itextpdf/commons/utils/Base64$InputStream;
.super Ljava/io/FilterInputStream;
.source "Base64.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/commons/utils/Base64;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InputStream"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private alphabet:[B

.field private breakLines:Z

.field private buffer:[B

.field private bufferLength:I

.field private decodabet:[B

.field private encode:Z

.field private lineLength:I

.field private numSigBytes:I

.field private options:I

.field private position:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1294
    const-class v0, Lcom/itextpdf/commons/utils/Base64;

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "in"    # Ljava/io/InputStream;

    .line 1314
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/commons/utils/Base64$InputStream;-><init>(Ljava/io/InputStream;I)V

    .line 1315
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .locals 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "options"    # I

    .line 1339
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 1340
    and-int/lit8 v0, p2, 0x8

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/16 v3, 0x8

    if-eq v0, v3, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->breakLines:Z

    .line 1341
    and-int/lit8 v0, p2, 0x1

    if-ne v0, v2, :cond_1

    goto :goto_1

    :cond_1
    move v2, v1

    :goto_1
    iput-boolean v2, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->encode:Z

    .line 1342
    iget-boolean v0, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->encode:Z

    if-eqz v0, :cond_2

    const/4 v0, 0x4

    goto :goto_2

    :cond_2
    const/4 v0, 0x3

    :goto_2
    iput v0, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->bufferLength:I

    .line 1343
    iget v0, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->bufferLength:I

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->buffer:[B

    .line 1344
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->position:I

    .line 1345
    iput v1, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->lineLength:I

    .line 1346
    iput p2, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->options:I

    .line 1347
    invoke-static {p2}, Lcom/itextpdf/commons/utils/Base64;->access$000(I)[B

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->alphabet:[B

    .line 1348
    invoke-static {p2}, Lcom/itextpdf/commons/utils/Base64;->access$100(I)[B

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->decodabet:[B

    .line 1349
    return-void
.end method


# virtual methods
.method public read()I
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1360
    iget v0, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->position:I

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-gez v0, :cond_b

    .line 1361
    iget-boolean v0, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->encode:Z

    const/4 v3, 0x4

    if-eqz v0, :cond_4

    .line 1362
    const/4 v4, 0x3

    new-array v5, v4, [B

    .line 1363
    .local v5, "b3":[B
    const/4 v0, 0x0

    .line 1364
    .local v0, "numBinaryBytes":I
    const/4 v6, 0x0

    move v7, v0

    .end local v0    # "numBinaryBytes":I
    .local v6, "i":I
    .local v7, "numBinaryBytes":I
    :goto_0
    if-ge v6, v4, :cond_2

    .line 1366
    :try_start_0
    iget-object v0, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 1369
    .local v0, "b":I
    if-ltz v0, :cond_0

    .line 1370
    int-to-byte v8, v0

    aput-byte v8, v5, v6
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1371
    add-int/lit8 v7, v7, 0x1

    .line 1380
    .end local v0    # "b":I
    :cond_0
    goto :goto_1

    .line 1375
    :catch_0
    move-exception v0

    .line 1377
    .local v0, "e":Ljava/io/IOException;
    if-eqz v6, :cond_1

    .line 1364
    .end local v0    # "e":Ljava/io/IOException;
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 1378
    .restart local v0    # "e":Ljava/io/IOException;
    :cond_1
    throw v0

    .line 1383
    .end local v0    # "e":Ljava/io/IOException;
    .end local v6    # "i":I
    :cond_2
    if-lez v7, :cond_3

    .line 1384
    iget-object v8, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->buffer:[B

    const/4 v9, 0x0

    iget v10, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->options:I

    const/4 v6, 0x0

    invoke-static/range {v5 .. v10}, Lcom/itextpdf/commons/utils/Base64;->access$200([BII[BII)[B

    .line 1385
    iput v2, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->position:I

    .line 1386
    iput v3, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->numSigBytes:I

    .line 1391
    .end local v5    # "b3":[B
    .end local v7    # "numBinaryBytes":I
    goto :goto_4

    .line 1389
    .restart local v5    # "b3":[B
    .restart local v7    # "numBinaryBytes":I
    :cond_3
    return v1

    .line 1395
    .end local v5    # "b3":[B
    .end local v7    # "numBinaryBytes":I
    :cond_4
    new-array v0, v3, [B

    .line 1396
    .local v0, "b4":[B
    const/4 v4, 0x0

    .line 1397
    .local v4, "i":I
    const/4 v4, 0x0

    :goto_2
    if-ge v4, v3, :cond_8

    .line 1399
    const/4 v5, 0x0

    .line 1401
    .local v5, "b":I
    :cond_5
    iget-object v6, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v6}, Ljava/io/InputStream;->read()I

    move-result v5

    .line 1403
    if-ltz v5, :cond_6

    iget-object v6, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->decodabet:[B

    and-int/lit8 v7, v5, 0x7f

    aget-byte v6, v6, v7

    const/4 v7, -0x5

    if-le v6, v7, :cond_5

    .line 1405
    :cond_6
    if-gez v5, :cond_7

    .line 1406
    goto :goto_3

    .line 1408
    :cond_7
    int-to-byte v6, v5

    aput-byte v6, v0, v4

    .line 1397
    .end local v5    # "b":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 1411
    :cond_8
    :goto_3
    if-ne v4, v3, :cond_9

    .line 1412
    iget-object v3, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->buffer:[B

    iget v5, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->options:I

    invoke-static {v0, v2, v3, v2, v5}, Lcom/itextpdf/commons/utils/Base64;->access$300([BI[BII)I

    move-result v3

    iput v3, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->numSigBytes:I

    .line 1413
    iput v2, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->position:I

    goto :goto_4

    .line 1415
    :cond_9
    if-nez v4, :cond_a

    .line 1416
    return v1

    .line 1420
    :cond_a
    new-instance v1, Ljava/io/IOException;

    const-string v2, "improperly.padded.base64.input"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1426
    .end local v0    # "b4":[B
    .end local v4    # "i":I
    :cond_b
    :goto_4
    iget v0, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->position:I

    if-ltz v0, :cond_f

    .line 1428
    iget v0, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->position:I

    iget v3, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->numSigBytes:I

    if-lt v0, v3, :cond_c

    .line 1429
    return v1

    .line 1431
    :cond_c
    iget-boolean v0, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->encode:Z

    if-eqz v0, :cond_d

    iget-boolean v0, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->breakLines:Z

    if-eqz v0, :cond_d

    iget v0, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->lineLength:I

    const/16 v3, 0x4c

    if-lt v0, v3, :cond_d

    .line 1432
    iput v2, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->lineLength:I

    .line 1433
    const/16 v0, 0xa

    return v0

    .line 1436
    :cond_d
    iget v0, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->lineLength:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->lineLength:I

    .line 1440
    iget-object v0, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->buffer:[B

    iget v2, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->position:I

    aget-byte v0, v0, v2

    .line 1442
    .local v0, "b":I
    iget v2, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->position:I

    iget v3, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->bufferLength:I

    if-lt v2, v3, :cond_e

    .line 1443
    iput v1, p0, Lcom/itextpdf/commons/utils/Base64$InputStream;->position:I

    .line 1445
    :cond_e
    and-int/lit16 v1, v0, 0xff

    return v1

    .line 1426
    .end local v0    # "b":I
    :cond_f
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public read([BII)I
    .locals 4
    .param p1, "dest"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1466
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_1

    .line 1467
    invoke-virtual {p0}, Lcom/itextpdf/commons/utils/Base64$InputStream;->read()I

    move-result v1

    .line 1472
    .local v1, "b":I
    if-ltz v1, :cond_0

    .line 1473
    add-int v2, p2, v0

    int-to-byte v3, v1

    aput-byte v3, p1, v2

    .line 1466
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1474
    :cond_0
    if-nez v0, :cond_1

    .line 1475
    const/4 v2, -0x1

    return v2

    .line 1479
    .end local v1    # "b":I
    :cond_1
    return v0
.end method
