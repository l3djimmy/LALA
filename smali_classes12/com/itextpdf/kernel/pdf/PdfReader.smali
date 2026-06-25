.class public Lcom/itextpdf/kernel/pdf/PdfReader;
.super Ljava/lang/Object;
.source "PdfReader.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/PdfReader$XrefProcessor;,
        Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;,
        Lcom/itextpdf/kernel/pdf/PdfReader$ReusableRandomAccessSource;
    }
.end annotation


# static fields
.field public static final DEFAULT_STRICTNESS_LEVEL:Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

.field protected static correctStreamLength:Z = false

.field private static final endobj:[B

.field private static final endstream:[B

.field private static final endstream1:Ljava/lang/String; = "endstream"

.field private static final endstream2:Ljava/lang/String; = "\nendstream"

.field private static final endstream3:Ljava/lang/String; = "\r\nendstream"

.field private static final endstream4:Ljava/lang/String; = "\rendstream"


# instance fields
.field private currentIndirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

.field protected decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

.field protected encrypted:Z

.field protected eofPos:J

.field protected fixedXref:Z

.field protected headerPdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

.field protected hybridXref:Z

.field protected lastXref:J

.field private memorySavingMode:Z

.field protected pdfAConformanceLevel:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

.field protected pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

.field protected properties:Lcom/itextpdf/kernel/pdf/ReaderProperties;

.field protected rebuiltXref:Z

.field private strictnessLevel:Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

.field protected tokens:Lcom/itextpdf/io/source/PdfTokenizer;

.field protected trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

.field private unethicalReading:Z

.field private xmpMeta:Lcom/itextpdf/kernel/xmp/XMPMeta;

.field private xrefProcessor:Lcom/itextpdf/kernel/pdf/PdfReader$XrefProcessor;

.field protected xrefStm:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 68
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;->LENIENT:Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfReader;->DEFAULT_STRICTNESS_LEVEL:Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    .line 74
    const-string v0, "endstream"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfReader;->endstream:[B

    .line 75
    const-string v0, "endobj"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfReader;->endobj:[B

    .line 77
    const/4 v0, 0x1

    sput-boolean v0, Lcom/itextpdf/kernel/pdf/PdfReader;->correctStreamLength:Z

    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/io/source/IRandomAccessSource;Lcom/itextpdf/kernel/pdf/ReaderProperties;)V
    .locals 1
    .param p1, "byteSource"    # Lcom/itextpdf/io/source/IRandomAccessSource;
    .param p2, "properties"    # Lcom/itextpdf/kernel/pdf/ReaderProperties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 119
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/PdfReader;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;Lcom/itextpdf/kernel/pdf/ReaderProperties;Z)V

    .line 120
    return-void
.end method

.method constructor <init>(Lcom/itextpdf/io/source/IRandomAccessSource;Lcom/itextpdf/kernel/pdf/ReaderProperties;Z)V
    .locals 1
    .param p1, "byteSource"    # Lcom/itextpdf/io/source/IRandomAccessSource;
    .param p2, "properties"    # Lcom/itextpdf/kernel/pdf/ReaderProperties;
    .param p3, "closeStream"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfReader;->DEFAULT_STRICTNESS_LEVEL:Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->strictnessLevel:Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    .line 90
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfReader$XrefProcessor;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfReader$XrefProcessor;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->xrefProcessor:Lcom/itextpdf/kernel/pdf/PdfReader$XrefProcessor;

    .line 106
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->encrypted:Z

    .line 107
    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->rebuiltXref:Z

    .line 108
    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->hybridXref:Z

    .line 109
    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->fixedXref:Z

    .line 110
    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->xrefStm:Z

    .line 200
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->properties:Lcom/itextpdf/kernel/pdf/ReaderProperties;

    .line 201
    invoke-static {p1, p3}, Lcom/itextpdf/kernel/pdf/PdfReader;->getOffsetTokeniser(Lcom/itextpdf/io/source/IRandomAccessSource;Z)Lcom/itextpdf/io/source/PdfTokenizer;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    .line 202
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 144
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfReader;-><init>(Ljava/lang/String;)V

    .line 145
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lcom/itextpdf/kernel/pdf/ReaderProperties;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;
    .param p2, "properties"    # Lcom/itextpdf/kernel/pdf/ReaderProperties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 196
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/itextpdf/kernel/pdf/PdfReader;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/ReaderProperties;)V

    .line 197
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 157
    new-instance v0, Lcom/itextpdf/kernel/pdf/ReaderProperties;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/ReaderProperties;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfReader;-><init>(Ljava/io/InputStream;Lcom/itextpdf/kernel/pdf/ReaderProperties;)V

    .line 158
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Lcom/itextpdf/kernel/pdf/ReaderProperties;)V
    .locals 2
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "properties"    # Lcom/itextpdf/kernel/pdf/ReaderProperties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 133
    new-instance v0, Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    invoke-direct {v0}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;-><init>()V

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->extractOrCreateSource(Ljava/io/InputStream;)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, p2, v1}, Lcom/itextpdf/kernel/pdf/PdfReader;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;Lcom/itextpdf/kernel/pdf/ReaderProperties;Z)V

    .line 134
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 184
    new-instance v0, Lcom/itextpdf/kernel/pdf/ReaderProperties;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/ReaderProperties;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfReader;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/ReaderProperties;)V

    .line 186
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/ReaderProperties;)V
    .locals 2
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "properties"    # Lcom/itextpdf/kernel/pdf/ReaderProperties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 168
    new-instance v0, Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    invoke-direct {v0}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;-><init>()V

    .line 170
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->setForceRead(Z)Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    move-result-object v0

    .line 171
    invoke-virtual {v0, p1}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createBestSource(Ljava/lang/String;)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v0

    .line 168
    const/4 v1, 0x1

    invoke-direct {p0, v0, p2, v1}, Lcom/itextpdf/kernel/pdf/PdfReader;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;Lcom/itextpdf/kernel/pdf/ReaderProperties;Z)V

    .line 175
    return-void
.end method

.method private checkPdfStreamLength(Lcom/itextpdf/kernel/pdf/PdfStream;)V
    .locals 19
    .param p1, "pdfStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1489
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    sget-boolean v2, Lcom/itextpdf/kernel/pdf/PdfReader;->correctStreamLength:Z

    if-nez v2, :cond_0

    .line 1490
    return-void

    .line 1491
    :cond_0
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/PdfTokenizer;->length()J

    move-result-wide v2

    .line 1492
    .local v2, "fileLength":J
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOffset()J

    move-result-wide v4

    .line 1493
    .local v4, "start":J
    const/4 v6, 0x0

    .line 1494
    .local v6, "calc":Z
    const/4 v7, 0x0

    .line 1495
    .local v7, "streamLength":I
    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Length:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v8}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v8

    .line 1496
    .local v8, "pdfNumber":Lcom/itextpdf/kernel/pdf/PdfNumber;
    const-string v9, "endstream"

    const/4 v10, 0x0

    if-eqz v8, :cond_3

    .line 1497
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v7

    .line 1498
    int-to-long v11, v7

    add-long/2addr v11, v4

    const-wide/16 v13, 0x14

    sub-long v13, v2, v13

    cmp-long v11, v11, v13

    if-lez v11, :cond_1

    .line 1499
    const/4 v6, 0x1

    goto :goto_0

    .line 1501
    :cond_1
    iget-object v11, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    int-to-long v12, v7

    add-long/2addr v12, v4

    invoke-virtual {v11, v12, v13}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 1502
    iget-object v11, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    const/16 v12, 0x14

    invoke-virtual {v11, v12}, Lcom/itextpdf/io/source/PdfTokenizer;->readString(I)Ljava/lang/String;

    move-result-object v11

    .line 1503
    .local v11, "line":Ljava/lang/String;
    const-string v12, "\nendstream"

    invoke-virtual {v11, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_2

    const-string v12, "\r\nendstream"

    invoke-virtual {v11, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_2

    .line 1504
    const-string v12, "\rendstream"

    invoke-virtual {v11, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_2

    invoke-virtual {v11, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_2

    .line 1505
    const/4 v6, 0x1

    .line 1507
    .end local v11    # "line":Ljava/lang/String;
    :cond_2
    goto :goto_0

    .line 1509
    :cond_3
    new-instance v11, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v11, v10}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    move-object v8, v11

    .line 1510
    sget-object v11, Lcom/itextpdf/kernel/pdf/PdfName;->Length:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v11, v8}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1511
    const/4 v6, 0x1

    .line 1513
    :goto_0
    if-eqz v6, :cond_b

    .line 1514
    new-instance v11, Lcom/itextpdf/io/source/ByteBuffer;

    const/16 v12, 0x10

    invoke-direct {v11, v12}, Lcom/itextpdf/io/source/ByteBuffer;-><init>(I)V

    .line 1515
    .local v11, "line":Lcom/itextpdf/io/source/ByteBuffer;
    iget-object v13, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v13, v4, v5}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 1518
    :goto_1
    iget-object v13, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v13}, Lcom/itextpdf/io/source/PdfTokenizer;->getPosition()J

    move-result-wide v13

    .line 1519
    .local v13, "pos":J
    invoke-virtual {v11}, Lcom/itextpdf/io/source/ByteBuffer;->reset()Lcom/itextpdf/io/source/ByteBuffer;

    .line 1522
    iget-object v15, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v15, v11, v10}, Lcom/itextpdf/io/source/PdfTokenizer;->readLineSegment(Lcom/itextpdf/io/source/ByteBuffer;Z)Z

    move-result v15

    if-nez v15, :cond_5

    .line 1523
    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;->CONSERVATIVE:Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    iget-object v10, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->strictnessLevel:Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;->isStricter(Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;)Z

    move-result v9

    if-eqz v9, :cond_4

    move-wide v15, v2

    move-wide/from16 v17, v13

    goto :goto_2

    .line 1524
    :cond_4
    new-instance v9, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v10, "Stream shall end with endstream keyword."

    invoke-direct {v9, v10}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 1528
    :cond_5
    sget-object v15, Lcom/itextpdf/kernel/pdf/PdfReader;->endstream:[B

    invoke-virtual {v11, v15}, Lcom/itextpdf/io/source/ByteBuffer;->startsWith([B)Z

    move-result v15

    if-eqz v15, :cond_6

    .line 1529
    move-wide v15, v2

    move-wide/from16 v17, v13

    goto :goto_2

    .line 1530
    :cond_6
    sget-object v15, Lcom/itextpdf/kernel/pdf/PdfReader;->endobj:[B

    invoke-virtual {v11, v15}, Lcom/itextpdf/io/source/ByteBuffer;->startsWith([B)Z

    move-result v15

    if-eqz v15, :cond_a

    .line 1531
    iget-object v10, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    const-wide/16 v15, 0x10

    move-wide/from16 v17, v13

    .end local v13    # "pos":J
    .local v17, "pos":J
    sub-long v12, v17, v15

    invoke-virtual {v10, v12, v13}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 1532
    iget-object v10, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    const/16 v14, 0x10

    invoke-virtual {v10, v14}, Lcom/itextpdf/io/source/PdfTokenizer;->readString(I)Ljava/lang/String;

    move-result-object v10

    .line 1533
    .local v10, "s":Ljava/lang/String;
    invoke-virtual {v10, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    .line 1534
    .local v9, "index":I
    if-ltz v9, :cond_7

    .line 1535
    sub-long v13, v17, v15

    move-wide v15, v2

    .end local v2    # "fileLength":J
    .local v15, "fileLength":J
    int-to-long v2, v9

    add-long/2addr v13, v2

    .end local v17    # "pos":J
    .restart local v13    # "pos":J
    goto :goto_3

    .line 1534
    .end local v13    # "pos":J
    .end local v15    # "fileLength":J
    .restart local v2    # "fileLength":J
    .restart local v17    # "pos":J
    :cond_7
    move-wide v15, v2

    .line 1539
    .end local v9    # "index":I
    .end local v10    # "s":Ljava/lang/String;
    .end local v17    # "pos":J
    .restart local v13    # "pos":J
    :goto_2
    move-wide/from16 v13, v17

    .end local v2    # "fileLength":J
    .restart local v15    # "fileLength":J
    :goto_3
    sub-long v2, v13, v4

    long-to-int v2, v2

    .line 1540
    .end local v7    # "streamLength":I
    .local v2, "streamLength":I
    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    const-wide/16 v9, 0x2

    sub-long v9, v13, v9

    invoke-virtual {v3, v9, v10}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 1541
    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/PdfTokenizer;->read()I

    move-result v3

    const/16 v7, 0xd

    if-ne v3, v7, :cond_8

    .line 1542
    add-int/lit8 v2, v2, -0x1

    .line 1544
    :cond_8
    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    const-wide/16 v9, 0x1

    sub-long v9, v13, v9

    invoke-virtual {v3, v9, v10}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 1545
    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/PdfTokenizer;->read()I

    move-result v3

    const/16 v7, 0xa

    if-ne v3, v7, :cond_9

    .line 1546
    add-int/lit8 v2, v2, -0x1

    move v7, v2

    goto :goto_4

    .line 1545
    :cond_9
    move v7, v2

    .line 1548
    .end local v2    # "streamLength":I
    .restart local v7    # "streamLength":I
    :goto_4
    invoke-virtual {v8, v7}, Lcom/itextpdf/kernel/pdf/PdfNumber;->setValue(I)V

    .line 1549
    invoke-virtual {v1, v7}, Lcom/itextpdf/kernel/pdf/PdfStream;->updateLength(I)V

    goto :goto_5

    .line 1530
    .end local v15    # "fileLength":J
    .local v2, "fileLength":J
    :cond_a
    move-wide v15, v2

    move-wide/from16 v17, v13

    move v14, v12

    .end local v2    # "fileLength":J
    .end local v13    # "pos":J
    .restart local v15    # "fileLength":J
    .restart local v17    # "pos":J
    goto/16 :goto_1

    .line 1513
    .end local v11    # "line":Lcom/itextpdf/io/source/ByteBuffer;
    .end local v15    # "fileLength":J
    .end local v17    # "pos":J
    .restart local v2    # "fileLength":J
    :cond_b
    move-wide v15, v2

    .line 1551
    .end local v2    # "fileLength":J
    .restart local v15    # "fileLength":J
    :goto_5
    return-void
.end method

.method private createPdfNullInstance(Z)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .param p1, "readAsDirect"    # Z

    .line 1554
    if-eqz p1, :cond_0

    .line 1555
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfNull;->PDF_NULL:Lcom/itextpdf/kernel/pdf/PdfNull;

    return-object v0

    .line 1557
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfNull;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfNull;-><init>()V

    return-object v0
.end method

.method public static decodeBytes([BLcom/itextpdf/kernel/pdf/PdfDictionary;)[B
    .locals 1
    .param p0, "b"    # [B
    .param p1, "streamDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 460
    invoke-static {}, Lcom/itextpdf/kernel/pdf/filters/FilterHandlers;->getDefaultFilterHandlers()Ljava/util/Map;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfReader;->decodeBytes([BLcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Map;)[B

    move-result-object v0

    return-object v0
.end method

.method public static decodeBytes([BLcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/util/Map;)[B
    .locals 16
    .param p0, "b"    # [B
    .param p1, "streamDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/filters/IFilterHandler;",
            ">;)[B"
        }
    .end annotation

    .line 473
    .local p2, "filterHandlers":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/filters/IFilterHandler;>;"
    move-object/from16 v0, p1

    if-nez p0, :cond_0

    .line 474
    const/4 v1, 0x0

    return-object v1

    .line 476
    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 477
    .local v1, "filter":Lcom/itextpdf/kernel/pdf/PdfObject;
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 478
    .local v2, "filters":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v3, 0x1

    if-eqz v1, :cond_2

    .line 479
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v4

    const/4 v5, 0x6

    if-ne v4, v5, :cond_1

    .line 480
    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    goto :goto_0

    .line 481
    :cond_1
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v4

    if-ne v4, v3, :cond_2

    .line 482
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 486
    :cond_2
    :goto_0
    const/4 v4, 0x0

    .line 487
    .local v4, "memoryLimitsAwareHandler":Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 488
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v5

    iget-object v4, v5, Lcom/itextpdf/kernel/pdf/PdfDocument;->memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    .line 491
    :cond_3
    if-eqz v4, :cond_4

    .line 492
    invoke-virtual {v4, v2}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->isMemoryLimitsAwarenessRequiredOnDecompression(Lcom/itextpdf/kernel/pdf/PdfArray;)Z

    move-result v5

    if-eqz v5, :cond_4

    move v5, v3

    goto :goto_1

    :cond_4
    const/4 v5, 0x0

    .line 494
    .local v5, "memoryLimitsAwarenessRequired":Z
    :goto_1
    if-eqz v5, :cond_5

    .line 495
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->beginDecompressedPdfStreamProcessing()Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    .line 498
    :cond_5
    new-instance v6, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v6}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 499
    .local v6, "dp":Lcom/itextpdf/kernel/pdf/PdfArray;
    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->DecodeParms:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    .line 500
    .local v7, "dpo":Lcom/itextpdf/kernel/pdf/PdfObject;
    const/4 v8, 0x3

    if-eqz v7, :cond_6

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v9

    if-eq v9, v8, :cond_8

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v9

    if-eq v9, v3, :cond_8

    .line 501
    :cond_6
    if-eqz v7, :cond_7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfObject;->release()V

    .line 502
    :cond_7
    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfName;->DP:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v9}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    .line 504
    :cond_8
    if-eqz v7, :cond_b

    .line 505
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v9

    if-ne v9, v8, :cond_9

    .line 506
    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    goto :goto_2

    .line 507
    :cond_9
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v9

    if-ne v9, v3, :cond_a

    .line 508
    move-object v6, v7

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 510
    :cond_a
    :goto_2
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfObject;->release()V

    .line 512
    :cond_b
    const/4 v9, 0x0

    move v10, v9

    move-object/from16 v9, p0

    .end local p0    # "b":[B
    .local v9, "b":[B
    .local v10, "j":I
    :goto_3
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v11

    if-ge v10, v11, :cond_12

    .line 513
    invoke-virtual {v2, v10}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v11

    check-cast v11, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 514
    .local v11, "filterName":Lcom/itextpdf/kernel/pdf/PdfName;
    move-object/from16 v12, p2

    invoke-interface {v12, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/kernel/pdf/filters/IFilterHandler;

    .line 515
    .local v13, "filterHandler":Lcom/itextpdf/kernel/pdf/filters/IFilterHandler;
    if-eqz v13, :cond_11

    .line 520
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v14

    if-ge v10, v14, :cond_f

    .line 521
    invoke-virtual {v6, v10, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(IZ)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v14

    .line 522
    .local v14, "dpEntry":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v14, :cond_e

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v15

    const/4 v3, 0x7

    if-ne v15, v3, :cond_c

    goto :goto_4

    .line 524
    :cond_c
    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v3

    if-ne v3, v8, :cond_d

    .line 525
    move-object v3, v14

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .local v3, "decodeParams":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    goto :goto_5

    .line 527
    .end local v3    # "decodeParams":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_d
    new-instance v3, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v8, "Decode parameter type {0} is not supported."

    invoke-direct {v3, v8}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    .line 528
    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v3, v8}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v3

    throw v3

    .line 523
    :cond_e
    :goto_4
    const/4 v3, 0x0

    .line 530
    .end local v14    # "dpEntry":Lcom/itextpdf/kernel/pdf/PdfObject;
    .restart local v3    # "decodeParams":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :goto_5
    goto :goto_6

    .line 531
    .end local v3    # "decodeParams":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_f
    const/4 v3, 0x0

    .line 533
    .restart local v3    # "decodeParams":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :goto_6
    invoke-interface {v13, v9, v11, v3, v0}, Lcom/itextpdf/kernel/pdf/filters/IFilterHandler;->decode([BLcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDictionary;)[B

    move-result-object v9

    .line 534
    if-eqz v5, :cond_10

    .line 535
    array-length v14, v9

    int-to-long v14, v14

    invoke-virtual {v4, v14, v15}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->considerBytesOccupiedByDecompressedPdfStream(J)Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    .line 512
    .end local v3    # "decodeParams":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v11    # "filterName":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v13    # "filterHandler":Lcom/itextpdf/kernel/pdf/filters/IFilterHandler;
    :cond_10
    add-int/lit8 v10, v10, 0x1

    const/4 v3, 0x1

    goto :goto_3

    .line 516
    .restart local v11    # "filterName":Lcom/itextpdf/kernel/pdf/PdfName;
    .restart local v13    # "filterHandler":Lcom/itextpdf/kernel/pdf/filters/IFilterHandler;
    :cond_11
    new-instance v3, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v8, "Filter {0} is not supported."

    invoke-direct {v3, v8}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    filled-new-array {v11}, [Ljava/lang/Object;

    move-result-object v8

    .line 517
    invoke-virtual {v3, v8}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v3

    throw v3

    .line 512
    .end local v11    # "filterName":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v13    # "filterHandler":Lcom/itextpdf/kernel/pdf/filters/IFilterHandler;
    :cond_12
    move-object/from16 v12, p2

    .line 538
    .end local v10    # "j":I
    if-eqz v5, :cond_13

    .line 539
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->endDecompressedPdfStreamProcessing()Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    .line 541
    :cond_13
    return-object v9
.end method

.method private static getOffsetTokeniser(Lcom/itextpdf/io/source/IRandomAccessSource;Z)Lcom/itextpdf/io/source/PdfTokenizer;
    .locals 5
    .param p0, "byteSource"    # Lcom/itextpdf/io/source/IRandomAccessSource;
    .param p1, "closeStream"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1571
    new-instance v0, Lcom/itextpdf/io/source/PdfTokenizer;

    new-instance v1, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-direct {v1, p0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/PdfTokenizer;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)V

    .line 1574
    .local v0, "tok":Lcom/itextpdf/io/source/PdfTokenizer;
    :try_start_0
    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->getHeaderOffset()I

    move-result v1
    :try_end_0
    .catch Lcom/itextpdf/io/exceptions/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1580
    .local v1, "offset":I
    nop

    .line 1581
    if-eqz v1, :cond_0

    .line 1582
    new-instance v2, Lcom/itextpdf/io/source/WindowRandomAccessSource;

    int-to-long v3, v1

    invoke-direct {v2, p0, v3, v4}, Lcom/itextpdf/io/source/WindowRandomAccessSource;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;J)V

    .line 1583
    .local v2, "offsetSource":Lcom/itextpdf/io/source/IRandomAccessSource;
    new-instance v3, Lcom/itextpdf/io/source/PdfTokenizer;

    new-instance v4, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-direct {v4, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    invoke-direct {v3, v4}, Lcom/itextpdf/io/source/PdfTokenizer;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)V

    move-object v0, v3

    .line 1585
    .end local v2    # "offsetSource":Lcom/itextpdf/io/source/IRandomAccessSource;
    :cond_0
    return-object v0

    .line 1575
    .end local v1    # "offset":I
    :catch_0
    move-exception v1

    .line 1576
    .local v1, "ex":Lcom/itextpdf/io/exceptions/IOException;
    if-eqz p1, :cond_1

    .line 1577
    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->close()V

    .line 1579
    :cond_1
    throw v1
.end method

.method private isCurrentObjectATrailer()Z
    .locals 3

    .line 1364
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfReader;->readObject(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 1365
    .local v1, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Root:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    .line 1366
    .end local v1    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :catch_0
    move-exception v1

    .line 1367
    .local v1, "e":Ljava/lang/Exception;
    return v0
.end method

.method private processArrayReadError()V
    .locals 3

    .line 1414
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    .line 1415
    invoke-virtual {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->getByteContent()[B

    move-result-object v1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    .line 1414
    const-string/jumbo v1, "unexpected {0} was encountered."

    invoke-static {v1, v0}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1416
    .local v0, "error":Ljava/lang/String;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;->CONSERVATIVE:Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfReader;->getStrictnessLevel()Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;->isStricter(Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1417
    const-class v1, Lcom/itextpdf/kernel/pdf/PdfReader;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 1418
    .local v1, "logger":Lorg/slf4j/Logger;
    invoke-interface {v1, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1419
    .end local v1    # "logger":Lorg/slf4j/Logger;
    goto :goto_0

    .line 1420
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/io/source/PdfTokenizer;->throwError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1422
    :goto_0
    return-void
.end method

.method private processXref(Lcom/itextpdf/kernel/pdf/PdfXrefTable;)V
    .locals 4
    .param p1, "xrefTable"    # Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1589
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->getPosition()J

    move-result-wide v0

    .line 1591
    .local v0, "currentPosition":J
    :try_start_0
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->xrefProcessor:Lcom/itextpdf/kernel/pdf/PdfReader$XrefProcessor;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v2, p1, v3}, Lcom/itextpdf/kernel/pdf/PdfReader$XrefProcessor;->processXref(Lcom/itextpdf/kernel/pdf/PdfXrefTable;Lcom/itextpdf/io/source/PdfTokenizer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1593
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v2, v0, v1}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 1594
    nop

    .line 1595
    return-void

    .line 1593
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v3, v0, v1}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 1594
    throw v2
.end method

.method private readDecryptObj()V
    .locals 8

    .line 1425
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->encrypted:Z

    if-eqz v0, :cond_0

    .line 1426
    return-void

    .line 1427
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Encrypt:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v3

    .line 1428
    .local v3, "enc":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v3, :cond_1

    .line 1429
    return-void

    .line 1430
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->encrypted:Z

    .line 1432
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    .line 1433
    .local v0, "filter":Lcom/itextpdf/kernel/pdf/PdfName;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Adobe_PubSec:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1434
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->properties:Lcom/itextpdf/kernel/pdf/ReaderProperties;

    iget-object v1, v1, Lcom/itextpdf/kernel/pdf/ReaderProperties;->certificate:Ljava/security/cert/Certificate;

    if-eqz v1, :cond_2

    .line 1438
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfEncryption;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->properties:Lcom/itextpdf/kernel/pdf/ReaderProperties;

    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/ReaderProperties;->certificateKey:Ljava/security/Key;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->properties:Lcom/itextpdf/kernel/pdf/ReaderProperties;

    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/ReaderProperties;->certificate:Ljava/security/cert/Certificate;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->properties:Lcom/itextpdf/kernel/pdf/ReaderProperties;

    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/ReaderProperties;->certificateKeyProvider:Ljava/lang/String;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->properties:Lcom/itextpdf/kernel/pdf/ReaderProperties;

    iget-object v7, v1, Lcom/itextpdf/kernel/pdf/ReaderProperties;->externalDecryptionProcess:Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;

    invoke-direct/range {v2 .. v7}, Lcom/itextpdf/kernel/pdf/PdfEncryption;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/security/Key;Ljava/security/cert/Certificate;Ljava/lang/String;Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;)V

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    goto :goto_0

    .line 1435
    :cond_2
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Certificate is not provided. Document is encrypted with public key certificate, it should be passed to PdfReader constructor with properties. See ReaderProperties#setPublicKeySecurityParams() method."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1440
    :cond_3
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Standard:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1441
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfEncryption;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->properties:Lcom/itextpdf/kernel/pdf/ReaderProperties;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/ReaderProperties;->password:[B

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfReader;->getOriginalFileId()[B

    move-result-object v4

    invoke-direct {v1, v3, v2, v4}, Lcom/itextpdf/kernel/pdf/PdfEncryption;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[B)V

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    .line 1445
    :goto_0
    return-void

    .line 1443
    :cond_4
    new-instance v1, Lcom/itextpdf/kernel/crypto/securityhandler/UnsupportedSecurityHandlerException;

    const-string v2, "Failed to open the document. Security handler {0} is not supported"

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/crypto/securityhandler/UnsupportedSecurityHandlerException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private readObject(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Z)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 7
    .param p1, "reference"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .param p2, "fixXref"    # Z

    .line 1448
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 1449
    return-object v0

    .line 1450
    :cond_0
    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->refersTo:Lcom/itextpdf/kernel/pdf/PdfObject;

    if-eqz v1, :cond_1

    .line 1451
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->refersTo:Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v0

    .line 1453
    :cond_1
    :try_start_0
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->currentIndirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 1454
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjStreamNumber()I

    move-result v1

    const/4 v2, 0x0

    if-lez v1, :cond_2

    .line 1455
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    .line 1456
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjStreamNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->get(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 1457
    .local v0, "objectStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfReader;->readObjectStream(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 1458
    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->refersTo:Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v1

    .line 1459
    .end local v0    # "objectStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :cond_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getOffset()J

    move-result-wide v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    const-wide/16 v5, 0x0

    cmp-long v1, v3, v5

    if-lez v1, :cond_7

    .line 1462
    :try_start_1
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getOffset()J

    move-result-wide v3

    invoke-virtual {v1, v3, v4}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 1463
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->nextValidToken()V

    .line 1464
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v1

    sget-object v3, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Obj:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-ne v1, v3, :cond_3

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    .line 1465
    invoke-virtual {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->getObjNr()I

    move-result v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v3

    if-ne v1, v3, :cond_3

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    .line 1466
    invoke-virtual {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->getGenNr()I

    move-result v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v3

    if-eq v1, v3, :cond_4

    .line 1467
    :cond_3
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    const-string v3, "Invalid offset for object {0}."

    .line 1468
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->toString()Ljava/lang/String;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    .line 1467
    invoke-virtual {v1, v3, v4}, Lcom/itextpdf/io/source/PdfTokenizer;->throwError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1470
    :cond_4
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfReader;->readObject(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1478
    .local v1, "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    goto :goto_0

    .line 1471
    .end local v1    # "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    :catch_0
    move-exception v1

    .line 1472
    .local v1, "ex":Ljava/lang/RuntimeException;
    if-eqz p2, :cond_6

    :try_start_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjStreamNumber()I

    move-result v3

    if-nez v3, :cond_6

    .line 1473
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfReader;->fixXref()V

    .line 1474
    invoke-direct {p0, p1, v2}, Lcom/itextpdf/kernel/pdf/PdfReader;->readObject(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    move-object v1, v2

    .line 1479
    .local v1, "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    :goto_0
    if-eqz v1, :cond_5

    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->setIndirectReference(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    :cond_5
    return-object v0

    .line 1476
    .local v1, "ex":Ljava/lang/RuntimeException;
    :cond_6
    nop

    .end local p1    # "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local p2    # "fixXref":Z
    throw v1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 1481
    .end local v1    # "ex":Ljava/lang/RuntimeException;
    .restart local p1    # "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .restart local p2    # "fixXref":Z
    :cond_7
    return-object v0

    .line 1483
    :catch_1
    move-exception v0

    .line 1484
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Cannot read PdfObject."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private setTrailerFromTrailerIndex(Ljava/lang/Long;)V
    .locals 4
    .param p1, "trailerIndex"    # Ljava/lang/Long;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1372
    const-string v0, "Trailer not found."

    if-eqz p1, :cond_2

    .line 1375
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 1376
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfReader;->readObject(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 1377
    .local v2, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Root:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1378
    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 1380
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-eqz v1, :cond_1

    .line 1383
    return-void

    .line 1381
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1373
    .end local v2    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_2
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 210
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->close()V

    .line 211
    return-void
.end method

.method public computeUserPassword()[B
    .locals 2

    .line 660
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->isReadingCompleted()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 664
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->encrypted:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->isOpenedWithFullPermission()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 668
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->properties:Lcom/itextpdf/kernel/pdf/ReaderProperties;

    iget-object v1, v1, Lcom/itextpdf/kernel/pdf/ReaderProperties;->password:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->computeUserPassword([B)[B

    move-result-object v0

    return-object v0

    .line 665
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0

    .line 661
    :cond_2
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "The PDF document has not been read yet. Document reading occurs in PdfDocument class constructor"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected fixXref()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1279
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->fixedXref:Z

    .line 1280
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v1

    .line 1281
    .local v1, "xref":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    const-wide/16 v3, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 1282
    new-instance v2, Lcom/itextpdf/io/source/ByteBuffer;

    const/16 v3, 0x18

    invoke-direct {v2, v3}, Lcom/itextpdf/io/source/ByteBuffer;-><init>(I)V

    .line 1283
    .local v2, "buffer":Lcom/itextpdf/io/source/ByteBuffer;
    new-instance v3, Lcom/itextpdf/io/source/PdfTokenizer;

    new-instance v4, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfReader$ReusableRandomAccessSource;

    invoke-direct {v5, v2}, Lcom/itextpdf/kernel/pdf/PdfReader$ReusableRandomAccessSource;-><init>(Lcom/itextpdf/io/source/ByteBuffer;)V

    invoke-direct {v4, v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    invoke-direct {v3, v4}, Lcom/itextpdf/io/source/PdfTokenizer;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)V

    .line 1285
    .local v3, "lineTokeniser":Lcom/itextpdf/io/source/PdfTokenizer;
    :goto_0
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->getPosition()J

    move-result-wide v4

    .line 1286
    .local v4, "pos":J
    invoke-virtual {v2}, Lcom/itextpdf/io/source/ByteBuffer;->reset()Lcom/itextpdf/io/source/ByteBuffer;

    .line 1289
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v6, v2, v0}, Lcom/itextpdf/io/source/PdfTokenizer;->readLineSegment(Lcom/itextpdf/io/source/ByteBuffer;Z)Z

    move-result v6

    if-nez v6, :cond_0

    .line 1290
    nop

    .line 1303
    .end local v4    # "pos":J
    return-void

    .line 1291
    .restart local v4    # "pos":J
    :cond_0
    const/4 v6, 0x0

    invoke-virtual {v2, v6}, Lcom/itextpdf/io/source/ByteBuffer;->get(I)B

    move-result v7

    const/16 v8, 0x30

    if-lt v7, v8, :cond_2

    invoke-virtual {v2, v6}, Lcom/itextpdf/io/source/ByteBuffer;->get(I)B

    move-result v7

    const/16 v8, 0x39

    if-gt v7, v8, :cond_2

    .line 1292
    invoke-static {v3}, Lcom/itextpdf/io/source/PdfTokenizer;->checkObjectStart(Lcom/itextpdf/io/source/PdfTokenizer;)[I

    move-result-object v7

    .line 1293
    .local v7, "obj":[I
    if-nez v7, :cond_1

    .line 1294
    goto :goto_0

    .line 1295
    :cond_1
    aget v6, v7, v6

    .line 1296
    .local v6, "num":I
    aget v8, v7, v0

    .line 1297
    .local v8, "gen":I
    invoke-virtual {v1, v6}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->get(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v9

    .line 1298
    .local v9, "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v9, :cond_2

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v10

    if-ne v10, v8, :cond_2

    .line 1299
    invoke-virtual {v9, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->fixOffset(J)V

    .line 1302
    .end local v4    # "pos":J
    .end local v6    # "num":I
    .end local v7    # "obj":[I
    .end local v8    # "gen":I
    .end local v9    # "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :cond_2
    goto :goto_0
.end method

.method public getCryptoMode()I
    .locals 2

    .line 614
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->isReadingCompleted()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 618
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    if-nez v0, :cond_0

    .line 619
    const/4 v0, -0x1

    return v0

    .line 621
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getCryptoMode()I

    move-result v0

    return v0

    .line 615
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "The PDF document has not been read yet. Document reading occurs in PdfDocument class constructor"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getFileLength()J
    .locals 2

    .line 560
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->getSafeFile()Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public getLastXref()J
    .locals 2

    .line 349
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->isReadingCompleted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 353
    iget-wide v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->lastXref:J

    return-wide v0

    .line 350
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "The PDF document has not been read yet. Document reading occurs in PdfDocument class constructor"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getModifiedFileId()[B
    .locals 3

    .line 707
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->isReadingCompleted()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 711
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ID:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 712
    .local v0, "id":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    .line 713
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsString(I)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v1

    return-object v1

    .line 715
    :cond_0
    const/4 v1, 0x0

    new-array v1, v1, [B

    return-object v1

    .line 708
    .end local v0    # "id":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "The PDF document has not been read yet. Document reading occurs in PdfDocument class constructor"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getOriginalFileId()[B
    .locals 4

    .line 683
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->isReadingCompleted()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 687
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ID:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 688
    .local v0, "id":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    .line 689
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsString(I)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v1

    return-object v1

    .line 691
    :cond_0
    new-array v1, v1, [B

    return-object v1

    .line 684
    .end local v0    # "id":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "The PDF document has not been read yet. Document reading occurs in PdfDocument class constructor"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPdfAConformanceLevel()Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;
    .locals 2

    .line 634
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfAConformanceLevel:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    if-nez v0, :cond_3

    .line 635
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->isReadingCompleted()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 640
    :try_start_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->xmpMeta:Lcom/itextpdf/kernel/xmp/XMPMeta;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXmpMetadata()[B

    move-result-object v0

    if-eqz v0, :cond_0

    .line 641
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXmpMetadata()[B

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->parseFromBuffer([B)Lcom/itextpdf/kernel/xmp/XMPMeta;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->xmpMeta:Lcom/itextpdf/kernel/xmp/XMPMeta;

    .line 643
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->xmpMeta:Lcom/itextpdf/kernel/xmp/XMPMeta;

    if-eqz v0, :cond_1

    .line 644
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->xmpMeta:Lcom/itextpdf/kernel/xmp/XMPMeta;

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;->getConformanceLevel(Lcom/itextpdf/kernel/xmp/XMPMeta;)Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfAConformanceLevel:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 647
    :cond_1
    goto :goto_0

    .line 646
    :catch_0
    move-exception v0

    goto :goto_0

    .line 636
    :cond_2
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "The PDF document has not been read yet. Document reading occurs in PdfDocument class constructor"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 650
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfAConformanceLevel:Lcom/itextpdf/kernel/pdf/PdfAConformanceLevel;

    return-object v0
.end method

.method public getPermissions()J
    .locals 3

    .line 595
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->isReadingCompleted()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 599
    const-wide/16 v0, 0x0

    .line 600
    .local v0, "perm":J
    iget-boolean v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->encrypted:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPermissions()Ljava/lang/Long;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 601
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPermissions()Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 603
    :cond_0
    return-wide v0

    .line 596
    .end local v0    # "perm":J
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "The PDF document has not been read yet. Document reading occurs in PdfDocument class constructor"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSafeFile()Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .locals 1

    .line 551
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->getSafeFile()Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    move-result-object v0

    return-object v0
.end method

.method public getStrictnessLevel()Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;
    .locals 1

    .line 247
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->strictnessLevel:Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    return-object v0
.end method

.method protected getXrefPrev(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfNumber;
    .locals 3
    .param p1, "prevObjectToCheck"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1386
    if-nez p1, :cond_0

    .line 1387
    const/4 v0, 0x0

    return-object v0

    .line 1390
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_1

    .line 1391
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    return-object v0

    .line 1393
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    const/4 v2, 0x5

    if-ne v0, v2, :cond_2

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;->CONSERVATIVE:Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    .line 1394
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfReader;->getStrictnessLevel()Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;->isStricter(Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1395
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 1396
    .local v0, "value":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v2

    if-ne v2, v1, :cond_2

    .line 1397
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    return-object v1

    .line 1400
    .end local v0    # "value":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_2
    new-instance v0, Lcom/itextpdf/kernel/exceptions/InvalidXRefPrevException;

    const-string v1, "Prev pointer in xref structure shall be direct number object."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/InvalidXRefPrevException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hasFixedXref()Z
    .locals 2

    .line 335
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->isReadingCompleted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 339
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->fixedXref:Z

    return v0

    .line 336
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "The PDF document has not been read yet. Document reading occurs in PdfDocument class constructor"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hasHybridXref()Z
    .locals 2

    .line 305
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->isReadingCompleted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 309
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->hybridXref:Z

    return v0

    .line 306
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "The PDF document has not been read yet. Document reading occurs in PdfDocument class constructor"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hasRebuiltXref()Z
    .locals 2

    .line 290
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->isReadingCompleted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 294
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->rebuiltXref:Z

    return v0

    .line 291
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "The PDF document has not been read yet. Document reading occurs in PdfDocument class constructor"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hasXrefStm()Z
    .locals 2

    .line 319
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->isReadingCompleted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 323
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->xrefStm:Z

    return v0

    .line 320
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "The PDF document has not been read yet. Document reading occurs in PdfDocument class constructor"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isCloseStream()Z
    .locals 1

    .line 270
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->isCloseStream()Z

    move-result v0

    return v0
.end method

.method public isEncrypted()Z
    .locals 2

    .line 726
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->isReadingCompleted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 730
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->encrypted:Z

    return v0

    .line 727
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "The PDF document has not been read yet. Document reading occurs in PdfDocument class constructor"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method isMemorySavingMode()Z
    .locals 1

    .line 1406
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->memorySavingMode:Z

    return v0
.end method

.method public isOpenedWithFullPermission()Z
    .locals 2

    .line 573
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->isReadingCompleted()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 577
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->encrypted:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->isOpenedWithFullPermission()Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->unethicalReading:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0

    .line 574
    :cond_2
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "The PDF document has not been read yet. Document reading occurs in PdfDocument class constructor"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected readArray(Z)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 4
    .param p1, "objStm"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 984
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 986
    .local v0, "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    :goto_0
    const/4 v1, 0x1

    invoke-virtual {p0, v1, p1}, Lcom/itextpdf/kernel/pdf/PdfReader;->readObject(ZZ)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 987
    .local v1, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-nez v1, :cond_1

    .line 988
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->EndArray:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-eq v2, v3, :cond_0

    .line 989
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfReader;->processArrayReadError()V

    .line 995
    .end local v1    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_0
    return-object v0

    .line 993
    .restart local v1    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_1
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 994
    .end local v1    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    goto :goto_0
.end method

.method protected readDictionary(Z)Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 8
    .param p1, "objStm"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 958
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 960
    .local v0, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->nextValidToken()V

    .line 961
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->EndDic:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-ne v1, v2, :cond_0

    .line 962
    nop

    .line 980
    return-object v0

    .line 964
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Name:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-eq v1, v2, :cond_1

    .line 965
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    .line 966
    invoke-virtual {v2}, Lcom/itextpdf/io/source/PdfTokenizer;->getStringValue()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 965
    const-string v3, "Dictionary key {0} is not a name."

    invoke-virtual {v1, v3, v2}, Lcom/itextpdf/io/source/PdfTokenizer;->throwError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 968
    :cond_1
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfReader;->readPdfName(Z)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    .line 969
    .local v2, "name":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {p0, v1, p1}, Lcom/itextpdf/kernel/pdf/PdfReader;->readObject(ZZ)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 970
    .local v1, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-nez v1, :cond_3

    .line 971
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v3

    sget-object v4, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->EndDic:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    const/4 v5, 0x0

    const-string/jumbo v6, "unexpected {0} was encountered."

    if-ne v3, v4, :cond_2

    .line 972
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    const-string v4, ">>"

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    .line 973
    invoke-static {v6, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    new-array v7, v5, [Ljava/lang/Object;

    .line 972
    invoke-virtual {v3, v4, v7}, Lcom/itextpdf/io/source/PdfTokenizer;->throwError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 974
    :cond_2
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v3

    sget-object v4, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->EndArray:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-ne v3, v4, :cond_3

    .line 975
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    const-string v4, "]"

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    .line 976
    invoke-static {v6, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    new-array v5, v5, [Ljava/lang/Object;

    .line 975
    invoke-virtual {v3, v4, v5}, Lcom/itextpdf/io/source/PdfTokenizer;->throwError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 978
    :cond_3
    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 979
    .end local v1    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v2    # "name":Lcom/itextpdf/kernel/pdf/PdfName;
    goto :goto_0
.end method

.method protected readObject(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .param p1, "reference"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 830
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfReader;->readObject(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method protected readObject(Z)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .param p1, "readAsDirect"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 834
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfReader;->readObject(ZZ)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method protected readObject(ZZ)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 12
    .param p1, "readAsDirect"    # Z
    .param p2, "objStm"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 878
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->nextValidToken()V

    .line 879
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v0

    .line 880
    .local v0, "type":Lcom/itextpdf/io/source/PdfTokenizer$TokenType;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfReader$1;->$SwitchMap$com$itextpdf$io$source$PdfTokenizer$TokenType:[I

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 928
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    sget-object v2, Lcom/itextpdf/io/source/PdfTokenizer;->Null:[B

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/source/PdfTokenizer;->tokenValueEqualsTo([B)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 929
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfReader;->createPdfNullInstance(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    return-object v1

    .line 926
    :pswitch_0
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Unexpected end of file."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 924
    :pswitch_1
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfReader;->readReference(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    return-object v1

    .line 922
    :pswitch_2
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfReader;->readPdfName(Z)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    return-object v1

    .line 915
    :pswitch_3
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfString;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/PdfTokenizer;->getByteContent()[B

    move-result-object v2

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v3}, Lcom/itextpdf/io/source/PdfTokenizer;->isHexString()Z

    move-result v3

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>([BZ)V

    .line 916
    .local v1, "pdfString":Lcom/itextpdf/kernel/pdf/PdfString;
    iget-boolean v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->encrypted:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->isEmbeddedFilesOnly()Z

    move-result v2

    if-nez v2, :cond_0

    if-nez p2, :cond_0

    .line 917
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->currentIndirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v2

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->currentIndirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v3

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v1, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfString;->setDecryption(IILcom/itextpdf/kernel/pdf/PdfEncryption;)V

    .line 919
    :cond_0
    return-object v1

    .line 913
    .end local v1    # "pdfString":Lcom/itextpdf/kernel/pdf/PdfString;
    :pswitch_4
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/PdfTokenizer;->getByteContent()[B

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>([B)V

    return-object v1

    .line 911
    :pswitch_5
    invoke-virtual {p0, p2}, Lcom/itextpdf/kernel/pdf/PdfReader;->readArray(Z)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    return-object v1

    .line 882
    :pswitch_6
    invoke-virtual {p0, p2}, Lcom/itextpdf/kernel/pdf/PdfReader;->readDictionary(Z)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 883
    .local v1, "dict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/PdfTokenizer;->getPosition()J

    move-result-wide v2

    .line 887
    .local v2, "pos":J
    :cond_1
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->nextToken()Z

    move-result v4

    .line 888
    .local v4, "hasNext":Z
    if-eqz v4, :cond_2

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v5

    sget-object v6, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Comment:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-eq v5, v6, :cond_1

    .line 890
    :cond_2
    if-eqz v4, :cond_6

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    sget-object v6, Lcom/itextpdf/io/source/PdfTokenizer;->Stream:[B

    invoke-virtual {v5, v6}, Lcom/itextpdf/io/source/PdfTokenizer;->tokenValueEqualsTo([B)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 894
    :cond_3
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/PdfTokenizer;->read()I

    move-result v5

    .line 895
    .local v5, "ch":I
    const/16 v6, 0x20

    if-eq v5, v6, :cond_3

    const/16 v6, 0x9

    if-eq v5, v6, :cond_3

    if-eqz v5, :cond_3

    const/16 v6, 0xc

    if-eq v5, v6, :cond_3

    .line 896
    const/16 v6, 0xa

    if-eq v5, v6, :cond_4

    .line 897
    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v7}, Lcom/itextpdf/io/source/PdfTokenizer;->read()I

    move-result v5

    .line 899
    :cond_4
    if-eq v5, v6, :cond_5

    .line 900
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v6, v5}, Lcom/itextpdf/io/source/PdfTokenizer;->backOnePosition(I)V

    .line 902
    :cond_5
    new-instance v6, Lcom/itextpdf/kernel/pdf/PdfStream;

    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v7}, Lcom/itextpdf/io/source/PdfTokenizer;->getPosition()J

    move-result-wide v7

    invoke-direct {v6, v7, v8, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>(JLcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 903
    .local v6, "pdfStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOffset()J

    move-result-wide v8

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfStream;->getLength()I

    move-result v10

    int-to-long v10, v10

    add-long/2addr v8, v10

    invoke-virtual {v7, v8, v9}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 904
    return-object v6

    .line 906
    .end local v5    # "ch":I
    .end local v6    # "pdfStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :cond_6
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v5, v2, v3}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 907
    return-object v1

    .line 930
    .end local v1    # "dict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v2    # "pos":J
    .end local v4    # "hasNext":Z
    :cond_7
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    sget-object v2, Lcom/itextpdf/io/source/PdfTokenizer;->True:[B

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/source/PdfTokenizer;->tokenValueEqualsTo([B)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 931
    if-eqz p1, :cond_8

    .line 932
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfBoolean;->TRUE:Lcom/itextpdf/kernel/pdf/PdfBoolean;

    return-object v1

    .line 934
    :cond_8
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfBoolean;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfBoolean;-><init>(Z)V

    return-object v1

    .line 936
    :cond_9
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    sget-object v2, Lcom/itextpdf/io/source/PdfTokenizer;->False:[B

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/source/PdfTokenizer;->tokenValueEqualsTo([B)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 937
    if-eqz p1, :cond_a

    .line 938
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfBoolean;->FALSE:Lcom/itextpdf/kernel/pdf/PdfBoolean;

    return-object v1

    .line 940
    :cond_a
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfBoolean;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfBoolean;-><init>(Z)V

    return-object v1

    .line 943
    :cond_b
    const/4 v1, 0x0

    return-object v1

    nop

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

.method protected readObjectStream(Lcom/itextpdf/kernel/pdf/PdfStream;)V
    .locals 14
    .param p1, "objectStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 767
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v0

    .line 768
    .local v0, "objectStreamNumber":I
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->First:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    .line 769
    .local v1, "first":I
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v2

    .line 770
    .local v2, "n":I
    const/4 v3, 0x1

    invoke-virtual {p0, p1, v3}, Lcom/itextpdf/kernel/pdf/PdfReader;->readStreamBytes(Lcom/itextpdf/kernel/pdf/PdfStream;Z)[B

    move-result-object v4

    .line 771
    .local v4, "bytes":[B
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    .line 773
    .local v5, "saveTokens":Lcom/itextpdf/io/source/PdfTokenizer;
    :try_start_0
    new-instance v6, Lcom/itextpdf/io/source/PdfTokenizer;

    new-instance v7, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    new-instance v8, Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    invoke-direct {v8}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;-><init>()V

    invoke-virtual {v8, v4}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource([B)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    invoke-direct {v6, v7}, Lcom/itextpdf/io/source/PdfTokenizer;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)V

    iput-object v6, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    .line 774
    new-array v6, v2, [I

    .line 775
    .local v6, "address":[I
    new-array v7, v2, [I

    .line 776
    .local v7, "objNumber":[I
    const/4 v8, 0x1

    .line 777
    .local v8, "ok":Z
    const/4 v9, 0x0

    .local v9, "k":I
    :goto_0
    if-ge v9, v2, :cond_4

    .line 778
    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v10}, Lcom/itextpdf/io/source/PdfTokenizer;->nextToken()Z

    move-result v10

    move v8, v10

    .line 779
    if-nez v8, :cond_0

    .line 780
    goto :goto_1

    .line 781
    :cond_0
    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v10}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v10

    sget-object v11, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Number:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-eq v10, v11, :cond_1

    .line 782
    const/4 v8, 0x0

    .line 783
    goto :goto_1

    .line 785
    :cond_1
    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v10}, Lcom/itextpdf/io/source/PdfTokenizer;->getIntValue()I

    move-result v10

    aput v10, v7, v9

    .line 786
    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v10}, Lcom/itextpdf/io/source/PdfTokenizer;->nextToken()Z

    move-result v10

    move v8, v10

    .line 787
    if-nez v8, :cond_2

    .line 788
    goto :goto_1

    .line 789
    :cond_2
    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v10}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v10

    sget-object v11, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Number:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-eq v10, v11, :cond_3

    .line 790
    const/4 v8, 0x0

    .line 791
    goto :goto_1

    .line 793
    :cond_3
    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v10}, Lcom/itextpdf/io/source/PdfTokenizer;->getIntValue()I

    move-result v10

    add-int/2addr v10, v1

    aput v10, v6, v9

    .line 777
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 795
    .end local v9    # "k":I
    :cond_4
    :goto_1
    if-eqz v8, :cond_9

    .line 797
    const/4 v9, 0x0

    .restart local v9    # "k":I
    :goto_2
    if-ge v9, v2, :cond_8

    .line 798
    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    aget v11, v6, v9

    int-to-long v11, v11

    invoke-virtual {v10, v11, v12}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 799
    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v10}, Lcom/itextpdf/io/source/PdfTokenizer;->nextToken()Z

    .line 801
    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v10

    aget v11, v7, v9

    invoke-virtual {v10, v11}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->get(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v10

    .line 802
    .local v10, "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    iget-object v11, v10, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->refersTo:Lcom/itextpdf/kernel/pdf/PdfObject;

    if-nez v11, :cond_7

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjStreamNumber()I

    move-result v11

    if-eq v11, v0, :cond_5

    .line 810
    goto :goto_4

    .line 812
    :cond_5
    iget-object v11, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v11}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v11

    sget-object v12, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Number:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-ne v11, v12, :cond_6

    .line 815
    new-instance v11, Lcom/itextpdf/kernel/pdf/PdfNumber;

    iget-object v12, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v12}, Lcom/itextpdf/io/source/PdfTokenizer;->getByteContent()[B

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>([B)V

    .local v11, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    goto :goto_3

    .line 817
    .end local v11    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_6
    iget-object v11, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    aget v12, v6, v9

    int-to-long v12, v12

    invoke-virtual {v11, v12, v13}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 818
    const/4 v11, 0x0

    invoke-virtual {p0, v11, v3}, Lcom/itextpdf/kernel/pdf/PdfReader;->readObject(ZZ)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v11

    .line 820
    .restart local v11    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :goto_3
    invoke-virtual {v10, v11}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setRefersTo(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 821
    invoke-virtual {v11, v10}, Lcom/itextpdf/kernel/pdf/PdfObject;->setIndirectReference(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 797
    .end local v10    # "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v11    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_7
    :goto_4
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 823
    .end local v9    # "k":I
    :cond_8
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v3

    const/16 v9, 0x10

    invoke-virtual {v3, v9}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 825
    nop

    .end local v6    # "address":[I
    .end local v7    # "objNumber":[I
    .end local v8    # "ok":Z
    iput-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    .line 826
    nop

    .line 827
    return-void

    .line 796
    .restart local v6    # "address":[I
    .restart local v7    # "objNumber":[I
    .restart local v8    # "ok":Z
    :cond_9
    :try_start_1
    new-instance v3, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v9, "Error while reading Object Stream."

    invoke-direct {v3, v9}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    .end local v0    # "objectStreamNumber":I
    .end local v1    # "first":I
    .end local v2    # "n":I
    .end local v4    # "bytes":[B
    .end local v5    # "saveTokens":Lcom/itextpdf/io/source/PdfTokenizer;
    .end local p1    # "objectStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 825
    .end local v6    # "address":[I
    .end local v7    # "objNumber":[I
    .end local v8    # "ok":Z
    .restart local v0    # "objectStreamNumber":I
    .restart local v1    # "first":I
    .restart local v2    # "n":I
    .restart local v4    # "bytes":[B
    .restart local v5    # "saveTokens":Lcom/itextpdf/io/source/PdfTokenizer;
    .restart local p1    # "objectStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :catchall_0
    move-exception v3

    iput-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    .line 826
    throw v3
.end method

.method protected readPdf()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 739
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->checkPdfHeader()Ljava/lang/String;

    move-result-object v0

    .line 741
    .local v0, "version":Ljava/lang/String;
    :try_start_0
    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/PdfVersion;->fromString(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->headerPdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_4

    .line 744
    nop

    .line 746
    :try_start_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfReader;->readXref()V
    :try_end_1
    .catch Lcom/itextpdf/kernel/exceptions/XrefCycledReferencesException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Lcom/itextpdf/kernel/exceptions/MemoryLimitsAwareException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lcom/itextpdf/kernel/exceptions/InvalidXRefPrevException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    .line 761
    goto :goto_0

    .line 752
    :catch_0
    move-exception v1

    .line 753
    .local v1, "ex":Ljava/lang/RuntimeException;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;->CONSERVATIVE:Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfReader;->getStrictnessLevel()Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;->isStricter(Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 754
    const-class v2, Lcom/itextpdf/kernel/pdf/PdfReader;

    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 755
    .local v2, "logger":Lorg/slf4j/Logger;
    const-string v3, "Error occurred while reading cross reference table. Cross reference table will be rebuilt."

    invoke-interface {v2, v3, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 757
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfReader;->rebuildXref()V

    .line 758
    .end local v2    # "logger":Lorg/slf4j/Logger;
    nop

    .line 762
    .end local v1    # "ex":Ljava/lang/RuntimeException;
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->markReadingCompleted()V

    .line 763
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfReader;->readDecryptObj()V

    .line 764
    return-void

    .line 759
    .restart local v1    # "ex":Ljava/lang/RuntimeException;
    :cond_0
    throw v1

    .line 747
    .end local v1    # "ex":Ljava/lang/RuntimeException;
    :catch_1
    move-exception v1

    goto :goto_1

    :catch_2
    move-exception v1

    goto :goto_1

    :catch_3
    move-exception v1

    .line 751
    .local v1, "ex":Lcom/itextpdf/kernel/exceptions/PdfException;
    :goto_1
    throw v1

    .line 742
    .end local v1    # "ex":Lcom/itextpdf/kernel/exceptions/PdfException;
    :catch_4
    move-exception v1

    .line 743
    .local v1, "exc":Ljava/lang/IllegalArgumentException;
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v3, "PDF version is not valid."

    invoke-direct {v2, v3, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v2
.end method

.method protected readPdfName(Z)Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2
    .param p1, "readAsDirect"    # Z

    .line 948
    if-eqz p1, :cond_0

    .line 949
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->staticNames:Ljava/util/Map;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->getStringValue()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 950
    .local v0, "cachedName":Lcom/itextpdf/kernel/pdf/PdfName;
    if-eqz v0, :cond_0

    .line 951
    return-object v0

    .line 954
    .end local v0    # "cachedName":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->getByteContent()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>([B)V

    return-object v0
.end method

.method protected readReference(Z)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 8
    .param p1, "readAsDirect"    # Z

    .line 838
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->getObjNr()I

    move-result v3

    .line 839
    .local v3, "num":I
    if-gez v3, :cond_0

    .line 840
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfReader;->createPdfNullInstance(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0

    .line 842
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    .line 843
    .local v0, "table":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->get(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v7

    .line 844
    .local v7, "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    const-string v1, "Invalid indirect reference {0} {1} R"

    const-class v2, Lcom/itextpdf/kernel/pdf/PdfReader;

    if-eqz v7, :cond_3

    .line 845
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->isFree()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 846
    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 847
    .local v2, "logger":Lorg/slf4j/Logger;
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->getObjNr()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    .line 848
    invoke-virtual {v5}, Lcom/itextpdf/io/source/PdfTokenizer;->getGenNr()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v4, v5}, [Ljava/lang/Object;

    move-result-object v4

    .line 847
    invoke-static {v1, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 849
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfReader;->createPdfNullInstance(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    return-object v1

    .line 851
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :cond_1
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v4

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/PdfTokenizer;->getGenNr()I

    move-result v5

    if-eq v4, v5, :cond_5

    .line 852
    iget-boolean v4, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->fixedXref:Z

    if-eqz v4, :cond_2

    .line 853
    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 854
    .restart local v2    # "logger":Lorg/slf4j/Logger;
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    .line 855
    invoke-virtual {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->getObjNr()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    .line 856
    invoke-virtual {v5}, Lcom/itextpdf/io/source/PdfTokenizer;->getGenNr()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v4, v5}, [Ljava/lang/Object;

    move-result-object v4

    .line 855
    invoke-static {v1, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 854
    invoke-interface {v2, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 857
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfReader;->createPdfNullInstance(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    return-object v1

    .line 859
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :cond_2
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    .line 860
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v2, v4}, [Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v4, "{0} {1} R"

    invoke-static {v4, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "Invalid indirect reference {0}."

    invoke-direct {v1, v4, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v1

    .line 864
    :cond_3
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->isReadingCompleted()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 865
    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 866
    .restart local v2    # "logger":Lorg/slf4j/Logger;
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->getObjNr()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    .line 867
    invoke-virtual {v5}, Lcom/itextpdf/io/source/PdfTokenizer;->getGenNr()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v4, v5}, [Ljava/lang/Object;

    move-result-object v4

    .line 866
    invoke-static {v1, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 868
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfReader;->createPdfNullInstance(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    return-object v1

    .line 870
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :cond_4
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    .line 871
    invoke-virtual {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->getGenNr()I

    move-result v4

    const-wide/16 v5, 0x0

    invoke-direct/range {v1 .. v6}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;IIJ)V

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 870
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->add(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v7

    .line 874
    :cond_5
    return-object v7
.end method

.method public readStream(Lcom/itextpdf/kernel/pdf/PdfStream;Z)Ljava/io/InputStream;
    .locals 2
    .param p1, "stream"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .param p2, "decode"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 447
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfReader;->readStreamBytes(Lcom/itextpdf/kernel/pdf/PdfStream;Z)[B

    move-result-object v0

    .line 448
    .local v0, "bytes":[B
    if-eqz v0, :cond_0

    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public readStreamBytes(Lcom/itextpdf/kernel/pdf/PdfStream;Z)[B
    .locals 2
    .param p1, "stream"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .param p2, "decode"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 366
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfReader;->readStreamBytesRaw(Lcom/itextpdf/kernel/pdf/PdfStream;)[B

    move-result-object v0

    .line 367
    .local v0, "b":[B
    if-eqz p2, :cond_0

    if-eqz v0, :cond_0

    .line 368
    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfReader;->decodeBytes([BLcom/itextpdf/kernel/pdf/PdfDictionary;)[B

    move-result-object v1

    return-object v1

    .line 370
    :cond_0
    return-object v0
.end method

.method public readStreamBytesRaw(Lcom/itextpdf/kernel/pdf/PdfStream;)[B
    .locals 14
    .param p1, "stream"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 383
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    .line 384
    .local v0, "type":Lcom/itextpdf/kernel/pdf/PdfName;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->XRef:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ObjStm:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 385
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfReader;->checkPdfStreamLength(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 387
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOffset()J

    move-result-wide v1

    .line 388
    .local v1, "offset":J
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-gtz v3, :cond_1

    .line 389
    const/4 v3, 0x0

    return-object v3

    .line 390
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getLength()I

    move-result v3

    .line 391
    .local v3, "length":I
    if-gtz v3, :cond_2

    .line 392
    const/4 v4, 0x0

    new-array v4, v4, [B

    return-object v4

    .line 393
    :cond_2
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->getSafeFile()Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    move-result-object v4

    .line 394
    .local v4, "file":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    const/4 v5, 0x0

    .line 396
    .local v5, "bytes":[B
    :try_start_0
    invoke-virtual {v4, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 397
    new-array v6, v3, [B

    move-object v5, v6

    .line 398
    invoke-virtual {v4, v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readFully([B)V

    .line 399
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v6, p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->doesStreamBelongToEmbeddedFile(Lcom/itextpdf/kernel/pdf/PdfStream;)Z

    move-result v6

    .line 400
    .local v6, "embeddedStream":Z
    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    if-eqz v7, :cond_a

    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->isEmbeddedFilesOnly()Z

    move-result v7

    if-eqz v7, :cond_3

    if-eqz v6, :cond_a

    .line 401
    :cond_3
    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v8, 0x1

    invoke-virtual {p1, v7, v8}, Lcom/itextpdf/kernel/pdf/PdfStream;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    .line 402
    .local v7, "filter":Lcom/itextpdf/kernel/pdf/PdfObject;
    const/4 v9, 0x0

    .line 403
    .local v9, "skip":Z
    if-eqz v7, :cond_9

    .line 404
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfObject;->isFlushed()Z

    move-result v10

    if-eqz v10, :cond_4

    .line 405
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/IndirectFilterUtils;->throwFlushedFilterException(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 407
    :cond_4
    sget-object v10, Lcom/itextpdf/kernel/pdf/PdfName;->Crypt:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v10, v7}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 408
    const/4 v8, 0x1

    move v9, v8

    .end local v9    # "skip":Z
    .local v8, "skip":Z
    goto :goto_1

    .line 409
    .end local v8    # "skip":Z
    .restart local v9    # "skip":Z
    :cond_5
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v10

    if-ne v10, v8, :cond_8

    .line 410
    move-object v10, v7

    check-cast v10, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 411
    .local v10, "filters":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v11, 0x0

    .local v11, "k":I
    :goto_0
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v12

    if-ge v11, v12, :cond_8

    .line 412
    invoke-virtual {v10, v11}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v12

    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/PdfObject;->isFlushed()Z

    move-result v12

    if-eqz v12, :cond_6

    .line 413
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/IndirectFilterUtils;->throwFlushedFilterException(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 415
    :cond_6
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfArray;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_7

    sget-object v12, Lcom/itextpdf/kernel/pdf/PdfName;->Crypt:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v10, v11, v8}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(IZ)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_7

    .line 416
    const/4 v8, 0x1

    .line 417
    .end local v9    # "skip":Z
    .restart local v8    # "skip":Z
    move v9, v8

    goto :goto_1

    .line 411
    .end local v8    # "skip":Z
    .restart local v9    # "skip":Z
    :cond_7
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 421
    .end local v10    # "filters":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v11    # "k":I
    :cond_8
    :goto_1
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfObject;->release()V

    .line 423
    :cond_9
    if-nez v9, :cond_a

    .line 424
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v10

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v10

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v11

    invoke-virtual {v8, v10, v11}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->setHashKeyForNextObject(II)V

    .line 425
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->decrypt:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v8, v5}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->decryptByteArray([B)[B

    move-result-object v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v5, v8

    .line 430
    .end local v6    # "embeddedStream":Z
    .end local v7    # "filter":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v9    # "skip":Z
    :cond_a
    :try_start_1
    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 432
    goto :goto_2

    .line 431
    :catch_0
    move-exception v6

    .line 433
    nop

    .line 434
    :goto_2
    return-object v5

    .line 429
    :catchall_0
    move-exception v6

    .line 430
    :try_start_2
    invoke-virtual {v4}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 432
    goto :goto_3

    .line 431
    :catch_1
    move-exception v7

    .line 433
    :goto_3
    throw v6
.end method

.method protected readXref()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 999
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v1}, Lcom/itextpdf/io/source/PdfTokenizer;->getStartxref()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 1000
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->nextToken()Z

    .line 1001
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    sget-object v1, Lcom/itextpdf/io/source/PdfTokenizer;->Startxref:[B

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/source/PdfTokenizer;->tokenValueEqualsTo([B)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1004
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->nextToken()Z

    .line 1005
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Number:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-ne v0, v1, :cond_5

    .line 1008
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->getLongValue()J

    move-result-wide v0

    .line 1009
    .local v0, "startxref":J
    iput-wide v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->lastXref:J

    .line 1010
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/PdfTokenizer;->getPosition()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->eofPos:J

    .line 1012
    :try_start_0
    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfReader;->readXrefStream(J)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1013
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->xrefStm:Z
    :try_end_0
    .catch Lcom/itextpdf/kernel/exceptions/XrefCycledReferencesException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Lcom/itextpdf/kernel/exceptions/MemoryLimitsAwareException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/itextpdf/kernel/exceptions/InvalidXRefPrevException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1014
    return-void

    .line 1022
    :cond_0
    goto :goto_0

    .line 1020
    :catch_0
    move-exception v2

    .line 1024
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->clear()V

    .line 1026
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v2, v0, v1}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 1027
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfReader;->readXrefSection()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 1033
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 1034
    .local v2, "trailer2":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 1036
    .local v3, "alreadyVisitedXrefTables":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    :goto_1
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1037
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Prev:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v5, 0x0

    invoke-virtual {v2, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/itextpdf/kernel/pdf/PdfReader;->getXrefPrev(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v4

    .line 1038
    .local v4, "prev":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-nez v4, :cond_2

    .line 1039
    nop

    .line 1057
    .end local v4    # "prev":Lcom/itextpdf/kernel/pdf/PdfNumber;
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Size:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsInt(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Integer;

    move-result-object v4

    .line 1058
    .local v4, "xrefSize":Ljava/lang/Integer;
    if-eqz v4, :cond_1

    .line 1061
    return-void

    .line 1059
    :cond_1
    new-instance v5, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v6, "Invalid xref table."

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1041
    .local v4, "prev":Lcom/itextpdf/kernel/pdf/PdfNumber;
    :cond_2
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;->longValue()J

    move-result-wide v5

    .line 1042
    .local v5, "prevXrefOffset":J
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v3, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 1043
    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;->CONSERVATIVE:Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfReader;->getStrictnessLevel()Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;->isStricter(Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 1045
    new-instance v7, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v8, "Trailer prev entry points to its own cross reference section."

    invoke-direct {v7, v8}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1048
    :cond_3
    new-instance v7, Lcom/itextpdf/kernel/exceptions/XrefCycledReferencesException;

    const-string v8, "Xref table has cycled references. Prev pointer indicates an already visited xref table."

    invoke-direct {v7, v8}, Lcom/itextpdf/kernel/exceptions/XrefCycledReferencesException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1052
    :cond_4
    move-wide v0, v5

    .line 1053
    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v7, v0, v1}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 1054
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfReader;->readXrefSection()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 1055
    .end local v4    # "prev":Lcom/itextpdf/kernel/pdf/PdfNumber;
    .end local v5    # "prevXrefOffset":J
    goto :goto_1

    .line 1016
    .end local v2    # "trailer2":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v3    # "alreadyVisitedXrefTables":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    :catch_1
    move-exception v2

    goto :goto_2

    :catch_2
    move-exception v2

    goto :goto_2

    :catch_3
    move-exception v2

    .line 1019
    .local v2, "exceptionWhileReadingXrefStream":Lcom/itextpdf/kernel/exceptions/PdfException;
    :goto_2
    throw v2

    .line 1006
    .end local v0    # "startxref":J
    .end local v2    # "exceptionWhileReadingXrefStream":Lcom/itextpdf/kernel/exceptions/PdfException;
    :cond_5
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "PDF startxref is not followed by a number."

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0

    .line 1002
    :cond_6
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "PDF startxref not found."

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method protected readXrefSection()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1064
    move-object/from16 v1, p0

    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->nextValidToken()V

    .line 1065
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    sget-object v2, Lcom/itextpdf/io/source/PdfTokenizer;->Xref:[B

    invoke-virtual {v0, v2}, Lcom/itextpdf/io/source/PdfTokenizer;->tokenValueEqualsTo([B)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 1066
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    const-string/jumbo v3, "xref subsection not found."

    new-array v4, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v3, v4}, Lcom/itextpdf/io/source/PdfTokenizer;->throwError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1067
    :cond_0
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v3

    .line 1069
    .local v3, "xref":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    :goto_0
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->nextValidToken()V

    .line 1070
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    sget-object v4, Lcom/itextpdf/io/source/PdfTokenizer;->Trailer:[B

    invoke-virtual {v0, v4}, Lcom/itextpdf/io/source/PdfTokenizer;->tokenValueEqualsTo([B)Z

    move-result v0

    const/4 v4, 0x1

    if-eqz v0, :cond_2

    .line 1071
    nop

    .line 1139
    invoke-direct {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfReader;->processXref(Lcom/itextpdf/kernel/pdf/PdfXrefTable;)V

    .line 1140
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfReader;->readObject(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 1141
    .local v2, "trailer":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->XRefStm:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    .line 1142
    .local v5, "xrs":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v5, :cond_1

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    const/16 v6, 0x8

    if-ne v0, v6, :cond_1

    .line 1143
    move-object v0, v5

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v6

    .line 1145
    .local v6, "loc":I
    int-to-long v7, v6

    :try_start_0
    invoke-virtual {v1, v7, v8}, Lcom/itextpdf/kernel/pdf/PdfReader;->readXrefStream(J)Z

    .line 1146
    iput-boolean v4, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->xrefStm:Z

    .line 1147
    iput-boolean v4, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->hybridXref:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1151
    goto :goto_1

    .line 1148
    :catch_0
    move-exception v0

    .line 1149
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->clear()V

    .line 1150
    throw v0

    .line 1153
    .end local v0    # "e":Ljava/io/IOException;
    .end local v6    # "loc":I
    :cond_1
    :goto_1
    return-object v2

    .line 1073
    .end local v2    # "trailer":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v5    # "xrs":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_2
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v0

    sget-object v5, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Number:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-eq v0, v5, :cond_3

    .line 1074
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    const-string v5, "Object number of the first object in this xref subsection not found."

    new-array v6, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v5, v6}, Lcom/itextpdf/io/source/PdfTokenizer;->throwError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1077
    :cond_3
    iget-object v0, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->getIntValue()I

    move-result v0

    .line 1078
    .local v0, "start":I
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/PdfTokenizer;->nextValidToken()V

    .line 1079
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v5

    sget-object v6, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Number:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-eq v5, v6, :cond_4

    .line 1080
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    const-string v6, "Number of entries in this xref subsection not found."

    new-array v7, v2, [Ljava/lang/Object;

    invoke-virtual {v5, v6, v7}, Lcom/itextpdf/io/source/PdfTokenizer;->throwError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1082
    :cond_4
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v5}, Lcom/itextpdf/io/source/PdfTokenizer;->getIntValue()I

    move-result v5

    add-int/2addr v5, v0

    .line 1083
    .local v5, "end":I
    move v6, v0

    move v8, v6

    .local v8, "num":I
    :goto_2
    if-ge v8, v5, :cond_e

    .line 1084
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/PdfTokenizer;->nextValidToken()V

    .line 1085
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/PdfTokenizer;->getLongValue()J

    move-result-wide v10

    .line 1086
    .local v10, "pos":J
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/PdfTokenizer;->nextValidToken()V

    .line 1087
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/PdfTokenizer;->getIntValue()I

    move-result v9

    .line 1088
    .local v9, "gen":I
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/PdfTokenizer;->nextValidToken()V

    .line 1089
    const-wide/16 v12, 0x0

    cmp-long v6, v10, v12

    if-nez v6, :cond_5

    const v6, 0xffff

    if-ne v9, v6, :cond_5

    if-ne v8, v4, :cond_5

    if-eqz v0, :cond_5

    .line 1101
    const/4 v8, 0x0

    .line 1102
    add-int/lit8 v5, v5, -0x1

    .line 1103
    goto/16 :goto_8

    .line 1105
    :cond_5
    invoke-virtual {v3, v8}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->get(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v14

    .line 1106
    .local v14, "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    const/4 v6, 0x4

    if-eqz v14, :cond_6

    invoke-virtual {v14, v6}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v7

    if-ne v7, v9, :cond_6

    move v7, v4

    goto :goto_3

    :cond_6
    move v7, v2

    :goto_3
    move v15, v7

    .line 1108
    .local v15, "refReadingState":Z
    if-eqz v14, :cond_8

    if-nez v15, :cond_7

    .line 1109
    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v7

    if-nez v7, :cond_7

    goto :goto_4

    :cond_7
    move v7, v2

    goto :goto_5

    :cond_8
    :goto_4
    move v7, v4

    :goto_5
    move/from16 v16, v7

    .line 1111
    .local v16, "refFirstEncountered":Z
    if-eqz v16, :cond_9

    .line 1112
    new-instance v6, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    iget-object v7, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct/range {v6 .. v11}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;IIJ)V

    move-object v14, v6

    goto :goto_6

    .line 1113
    :cond_9
    if-eqz v15, :cond_d

    .line 1114
    invoke-virtual {v14, v10, v11}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setOffset(J)V

    .line 1115
    invoke-virtual {v14, v6}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->clearState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1120
    :goto_6
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    sget-object v7, Lcom/itextpdf/io/source/PdfTokenizer;->N:[B

    invoke-virtual {v6, v7}, Lcom/itextpdf/io/source/PdfTokenizer;->tokenValueEqualsTo([B)Z

    move-result v6

    if-eqz v6, :cond_a

    .line 1121
    cmp-long v6, v10, v12

    if-nez v6, :cond_c

    .line 1122
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    const-string v7, "file position 0 cross reference entry in this xref subsection."

    new-array v12, v2, [Ljava/lang/Object;

    invoke-virtual {v6, v7, v12}, Lcom/itextpdf/io/source/PdfTokenizer;->throwError(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_7

    .line 1125
    :cond_a
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    sget-object v7, Lcom/itextpdf/io/source/PdfTokenizer;->F:[B

    invoke-virtual {v6, v7}, Lcom/itextpdf/io/source/PdfTokenizer;->tokenValueEqualsTo([B)Z

    move-result v6

    if-eqz v6, :cond_b

    .line 1126
    if-eqz v16, :cond_c

    .line 1127
    const/4 v6, 0x2

    invoke-virtual {v14, v6}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_7

    .line 1130
    :cond_b
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    const-string v7, "Invalid cross reference entry in this xref subsection."

    new-array v12, v2, [Ljava/lang/Object;

    invoke-virtual {v6, v7, v12}, Lcom/itextpdf/io/source/PdfTokenizer;->throwError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1134
    :cond_c
    :goto_7
    if-eqz v16, :cond_d

    .line 1135
    invoke-virtual {v3, v14}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->add(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 1083
    .end local v9    # "gen":I
    .end local v10    # "pos":J
    .end local v14    # "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v15    # "refReadingState":Z
    .end local v16    # "refFirstEncountered":Z
    :cond_d
    :goto_8
    add-int/2addr v8, v4

    goto/16 :goto_2

    .line 1138
    .end local v0    # "start":I
    .end local v5    # "end":I
    .end local v8    # "num":I
    :cond_e
    goto/16 :goto_0
.end method

.method protected readXrefStream(J)Z
    .locals 38
    .param p1, "ptr"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1157
    move-object/from16 v0, p0

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    move-wide/from16 v2, p1

    .line 1158
    .end local p1    # "ptr":J
    .local v1, "alreadyVisitedXrefStreams":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    .local v2, "ptr":J
    :goto_0
    const-wide/16 v4, -0x1

    cmp-long v4, v2, v4

    const/4 v5, 0x1

    if-eqz v4, :cond_18

    .line 1159
    iget-object v4, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v4, v2, v3}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 1160
    iget-object v4, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->nextToken()Z

    move-result v4

    const/4 v6, 0x0

    if-nez v4, :cond_0

    .line 1161
    return v6

    .line 1163
    :cond_0
    iget-object v4, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v4

    sget-object v7, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Number:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-eq v4, v7, :cond_1

    .line 1164
    return v6

    .line 1166
    :cond_1
    iget-object v4, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->nextToken()Z

    move-result v4

    if-eqz v4, :cond_17

    iget-object v4, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->getTokenType()Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    move-result-object v4

    sget-object v7, Lcom/itextpdf/io/source/PdfTokenizer$TokenType;->Number:Lcom/itextpdf/io/source/PdfTokenizer$TokenType;

    if-eq v4, v7, :cond_2

    move-wide/from16 v18, v2

    move/from16 p2, v6

    goto/16 :goto_f

    .line 1169
    :cond_2
    iget-object v4, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->nextToken()Z

    move-result v4

    if-eqz v4, :cond_16

    iget-object v4, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    sget-object v7, Lcom/itextpdf/io/source/PdfTokenizer;->Obj:[B

    invoke-virtual {v4, v7}, Lcom/itextpdf/io/source/PdfTokenizer;->tokenValueEqualsTo([B)Z

    move-result v4

    if-nez v4, :cond_3

    move-wide/from16 v18, v2

    move/from16 p2, v6

    goto/16 :goto_e

    .line 1172
    :cond_3
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1173
    iget-object v4, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v4

    .line 1174
    .local v4, "xref":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    invoke-virtual {v0, v6}, Lcom/itextpdf/kernel/pdf/PdfReader;->readObject(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    .line 1176
    .local v7, "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v8

    const/16 v9, 0x9

    if-ne v8, v9, :cond_15

    .line 1177
    move-object v8, v7

    check-cast v8, Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 1178
    .local v8, "xrefStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfName;->XRef:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v10, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v8, v10}, Lcom/itextpdf/kernel/pdf/PdfStream;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_4

    .line 1179
    return v6

    .line 1184
    :cond_4
    iget-object v9, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-nez v9, :cond_5

    .line 1185
    new-instance v9, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v9}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    iput-object v9, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 1186
    iget-object v9, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v9, v8}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->putAll(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 1187
    iget-object v9, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v10, Lcom/itextpdf/kernel/pdf/PdfName;->DecodeParms:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1188
    iget-object v9, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v10, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1189
    iget-object v9, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v10, Lcom/itextpdf/kernel/pdf/PdfName;->Prev:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1190
    iget-object v9, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v10, Lcom/itextpdf/kernel/pdf/PdfName;->Length:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1193
    :cond_5
    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfName;->Size:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v8, v9}, Lcom/itextpdf/kernel/pdf/PdfStream;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v9

    .line 1195
    .local v9, "size":I
    sget-object v10, Lcom/itextpdf/kernel/pdf/PdfName;->Index:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v8, v10}, Lcom/itextpdf/kernel/pdf/PdfStream;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v10

    .line 1196
    .local v10, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-nez v10, :cond_6

    .line 1197
    new-instance v11, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v11}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 1198
    .local v11, "index":Lcom/itextpdf/kernel/pdf/PdfArray;
    new-instance v12, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v12, v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v11, v12}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1199
    new-instance v12, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v12, v9}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v11, v12}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    goto :goto_1

    .line 1201
    .end local v11    # "index":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_6
    move-object v11, v10

    check-cast v11, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 1203
    .restart local v11    # "index":Lcom/itextpdf/kernel/pdf/PdfArray;
    :goto_1
    sget-object v12, Lcom/itextpdf/kernel/pdf/PdfName;->W:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v8, v12}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v12

    .line 1204
    .local v12, "w":Lcom/itextpdf/kernel/pdf/PdfArray;
    const-wide/16 v13, -0x1

    .line 1205
    .local v13, "prev":J
    sget-object v15, Lcom/itextpdf/kernel/pdf/PdfName;->Prev:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v8, v15, v6}, Lcom/itextpdf/kernel/pdf/PdfStream;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v15

    invoke-virtual {v0, v15}, Lcom/itextpdf/kernel/pdf/PdfReader;->getXrefPrev(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v10

    .line 1206
    if-eqz v10, :cond_7

    .line 1207
    move-object v15, v10

    check-cast v15, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v15}, Lcom/itextpdf/kernel/pdf/PdfNumber;->longValue()J

    move-result-wide v13

    .line 1208
    :cond_7
    invoke-virtual {v4, v9}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->setCapacity(I)V

    .line 1209
    invoke-virtual {v0, v8, v5}, Lcom/itextpdf/kernel/pdf/PdfReader;->readStreamBytes(Lcom/itextpdf/kernel/pdf/PdfStream;Z)[B

    move-result-object v15

    .line 1210
    .local v15, "b":[B
    const/16 v16, 0x0

    .line 1211
    .local v16, "bptr":I
    move/from16 p1, v5

    const/4 v5, 0x3

    move/from16 p2, v6

    new-array v6, v5, [I

    .line 1212
    .local v6, "wc":[I
    const/16 v17, 0x0

    move-wide/from16 v18, v2

    move/from16 v2, v17

    .local v2, "k":I
    .local v18, "ptr":J
    :goto_2
    if-ge v2, v5, :cond_8

    .line 1213
    invoke-virtual {v12, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v3

    aput v3, v6, v2

    .line 1212
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 1215
    .end local v2    # "k":I
    :cond_8
    const/4 v2, 0x0

    .local v2, "idx":I
    :goto_3
    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_13

    .line 1216
    invoke-virtual {v11, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v3

    .line 1217
    .local v3, "start":I
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v11, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v5

    .line 1218
    .local v5, "length":I
    move/from16 v17, v2

    .end local v2    # "idx":I
    .local v17, "idx":I
    add-int v2, v3, v5

    invoke-virtual {v4, v2}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->setCapacity(I)V

    .line 1219
    :goto_4
    add-int/lit8 v2, v5, -0x1

    .end local v5    # "length":I
    .local v2, "length":I
    if-lez v5, :cond_12

    .line 1220
    const/4 v5, 0x1

    .line 1221
    .local v5, "type":I
    aget v20, v6, p2

    if-lez v20, :cond_a

    .line 1222
    const/4 v5, 0x0

    .line 1223
    const/16 v20, 0x0

    move/from16 v37, v20

    move/from16 v20, v2

    move/from16 v2, v37

    .local v2, "k":I
    .local v20, "length":I
    :goto_5
    move/from16 v21, v3

    .end local v3    # "start":I
    .local v21, "start":I
    aget v3, v6, p2

    if-ge v2, v3, :cond_9

    .line 1224
    shl-int/lit8 v3, v5, 0x8

    add-int/lit8 v22, v16, 0x1

    move/from16 v23, v2

    .end local v2    # "k":I
    .end local v16    # "bptr":I
    .local v22, "bptr":I
    .local v23, "k":I
    aget-byte v2, v15, v16

    and-int/lit16 v2, v2, 0xff

    add-int v5, v3, v2

    .line 1223
    add-int/lit8 v2, v23, 0x1

    move/from16 v3, v21

    move/from16 v16, v22

    .end local v23    # "k":I
    .restart local v2    # "k":I
    goto :goto_5

    .end local v22    # "bptr":I
    .restart local v16    # "bptr":I
    :cond_9
    move/from16 v23, v2

    .end local v2    # "k":I
    .restart local v23    # "k":I
    goto :goto_6

    .line 1221
    .end local v20    # "length":I
    .end local v21    # "start":I
    .end local v23    # "k":I
    .local v2, "length":I
    .restart local v3    # "start":I
    :cond_a
    move/from16 v20, v2

    move/from16 v21, v3

    .line 1227
    .end local v2    # "length":I
    .end local v3    # "start":I
    .restart local v20    # "length":I
    .restart local v21    # "start":I
    :goto_6
    const-wide/16 v2, 0x0

    .line 1228
    .local v2, "field2":J
    const/16 v22, 0x0

    move/from16 v37, v22

    move/from16 v22, v5

    move/from16 v5, v37

    .local v5, "k":I
    .local v22, "type":I
    :goto_7
    move-object/from16 v29, v6

    .end local v6    # "wc":[I
    .local v29, "wc":[I
    aget v6, v29, p1

    if-ge v5, v6, :cond_b

    .line 1229
    const/16 v6, 0x8

    shl-long v23, v2, v6

    add-int/lit8 v6, v16, 0x1

    move/from16 v25, v5

    .end local v5    # "k":I
    .end local v16    # "bptr":I
    .local v6, "bptr":I
    .local v25, "k":I
    aget-byte v5, v15, v16

    and-int/lit16 v5, v5, 0xff

    move/from16 v26, v6

    .end local v6    # "bptr":I
    .local v26, "bptr":I
    int-to-long v5, v5

    add-long v2, v23, v5

    .line 1228
    add-int/lit8 v5, v25, 0x1

    move/from16 v16, v26

    move-object/from16 v6, v29

    .end local v25    # "k":I
    .restart local v5    # "k":I
    goto :goto_7

    .end local v26    # "bptr":I
    .restart local v16    # "bptr":I
    :cond_b
    move/from16 v25, v5

    .line 1231
    .end local v5    # "k":I
    const/4 v5, 0x0

    .line 1232
    .local v5, "field3":I
    const/4 v6, 0x0

    .local v6, "k":I
    :goto_8
    move-object/from16 v30, v7

    .end local v7    # "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    .local v30, "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    const/16 v31, 0x2

    aget v7, v29, v31

    if-ge v6, v7, :cond_c

    .line 1233
    shl-int/lit8 v7, v5, 0x8

    add-int/lit8 v23, v16, 0x1

    move/from16 v24, v6

    .end local v6    # "k":I
    .end local v16    # "bptr":I
    .local v23, "bptr":I
    .local v24, "k":I
    aget-byte v6, v15, v16

    and-int/lit16 v6, v6, 0xff

    add-int v5, v7, v6

    .line 1232
    add-int/lit8 v6, v24, 0x1

    move/from16 v16, v23

    move-object/from16 v7, v30

    .end local v24    # "k":I
    .restart local v6    # "k":I
    goto :goto_8

    .end local v23    # "bptr":I
    .restart local v16    # "bptr":I
    :cond_c
    move/from16 v24, v6

    .line 1235
    .end local v6    # "k":I
    move/from16 v25, v21

    .line 1237
    .local v25, "base":I
    packed-switch v22, :pswitch_data_0

    .line 1249
    move/from16 v26, v5

    .end local v5    # "field3":I
    .local v26, "field3":I
    new-instance v3, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v5, "Invalid xref stream."

    invoke-direct {v3, v5}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1245
    .end local v26    # "field3":I
    .restart local v5    # "field3":I
    :pswitch_0
    new-instance v31, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    iget-object v6, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    const/16 v34, 0x0

    move-object/from16 v32, v6

    int-to-long v6, v5

    move-wide/from16 v35, v6

    move/from16 v33, v25

    .end local v25    # "base":I
    .local v33, "base":I
    invoke-direct/range {v31 .. v36}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;IIJ)V

    .end local v33    # "base":I
    .restart local v25    # "base":I
    move-object/from16 v6, v31

    .line 1246
    .local v6, "newReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    long-to-int v7, v2

    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setObjStreamNumber(I)V

    .line 1247
    move-wide/from16 v27, v2

    move/from16 v26, v5

    move/from16 v2, v25

    goto :goto_9

    .line 1242
    .end local v6    # "newReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :pswitch_1
    new-instance v23, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    iget-object v6, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-wide/from16 v27, v2

    move/from16 v26, v5

    move-object/from16 v24, v6

    .end local v2    # "field2":J
    .end local v5    # "field3":I
    .restart local v26    # "field3":I
    .local v27, "field2":J
    invoke-direct/range {v23 .. v28}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;IIJ)V

    move-object/from16 v6, v23

    .line 1243
    .restart local v6    # "newReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    move/from16 v2, v25

    goto :goto_9

    .line 1239
    .end local v6    # "newReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v26    # "field3":I
    .end local v27    # "field2":J
    .restart local v2    # "field2":J
    .restart local v5    # "field3":I
    :pswitch_2
    move-wide/from16 v27, v2

    move/from16 v26, v5

    .end local v2    # "field2":J
    .end local v5    # "field3":I
    .restart local v26    # "field3":I
    .restart local v27    # "field2":J
    new-instance v23, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-object/from16 v24, v2

    invoke-direct/range {v23 .. v28}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;IIJ)V

    move-object/from16 v3, v23

    move/from16 v2, v25

    move/from16 v5, v31

    .end local v25    # "base":I
    .local v2, "base":I
    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 1240
    .restart local v6    # "newReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    nop

    .line 1252
    :goto_9
    invoke-virtual {v4, v2}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->get(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v3

    .line 1253
    .local v3, "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    const/4 v5, 0x4

    if-eqz v3, :cond_d

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v7

    if-eqz v7, :cond_d

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v7

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v5

    if-ne v7, v5, :cond_d

    move/from16 v5, p1

    goto :goto_a

    :cond_d
    move/from16 v5, p2

    .line 1255
    .local v5, "refReadingState":Z
    :goto_a
    if-eqz v3, :cond_f

    if-nez v5, :cond_e

    .line 1256
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v7

    if-nez v7, :cond_e

    goto :goto_b

    :cond_e
    move/from16 v7, p2

    goto :goto_c

    :cond_f
    :goto_b
    move/from16 v7, p1

    .line 1258
    .local v7, "refFirstEncountered":Z
    :goto_c
    if-eqz v7, :cond_10

    .line 1259
    invoke-virtual {v4, v6}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->add(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move/from16 v25, v5

    move-object/from16 v24, v6

    goto :goto_d

    .line 1260
    :cond_10
    if-eqz v5, :cond_11

    .line 1261
    move/from16 v25, v5

    move-object/from16 v24, v6

    .end local v5    # "refReadingState":Z
    .end local v6    # "newReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .local v24, "newReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .local v25, "refReadingState":Z
    invoke-virtual/range {v24 .. v24}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getOffset()J

    move-result-wide v5

    invoke-virtual {v3, v5, v6}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setOffset(J)V

    .line 1262
    invoke-virtual/range {v24 .. v24}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjStreamNumber()I

    move-result v5

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setObjStreamNumber(I)V

    .line 1263
    const/4 v5, 0x4

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->clearState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_d

    .line 1260
    .end local v24    # "newReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v25    # "refReadingState":Z
    .restart local v5    # "refReadingState":Z
    .restart local v6    # "newReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :cond_11
    move/from16 v25, v5

    move-object/from16 v24, v6

    .line 1265
    .end local v5    # "refReadingState":Z
    .end local v6    # "newReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .restart local v24    # "newReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .restart local v25    # "refReadingState":Z
    :goto_d
    nop

    .end local v2    # "base":I
    .end local v3    # "reference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v7    # "refFirstEncountered":Z
    .end local v22    # "type":I
    .end local v24    # "newReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v25    # "refReadingState":Z
    .end local v26    # "field3":I
    .end local v27    # "field2":J
    add-int/lit8 v3, v21, 0x1

    .line 1266
    .end local v21    # "start":I
    .local v3, "start":I
    move/from16 v5, v20

    move-object/from16 v6, v29

    move-object/from16 v7, v30

    goto/16 :goto_4

    .line 1219
    .end local v20    # "length":I
    .end local v29    # "wc":[I
    .end local v30    # "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    .local v2, "length":I
    .local v6, "wc":[I
    .local v7, "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_12
    move/from16 v20, v2

    move/from16 v21, v3

    move-object/from16 v29, v6

    move-object/from16 v30, v7

    .line 1215
    .end local v2    # "length":I
    .end local v3    # "start":I
    .end local v6    # "wc":[I
    .end local v7    # "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    .restart local v29    # "wc":[I
    .restart local v30    # "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    add-int/lit8 v2, v17, 0x2

    .end local v17    # "idx":I
    .local v2, "idx":I
    goto/16 :goto_3

    .end local v29    # "wc":[I
    .end local v30    # "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    .restart local v6    # "wc":[I
    .restart local v7    # "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_13
    move/from16 v17, v2

    move-object/from16 v29, v6

    move-object/from16 v30, v7

    .line 1268
    .end local v2    # "idx":I
    .end local v6    # "wc":[I
    .end local v7    # "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    .restart local v29    # "wc":[I
    .restart local v30    # "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-direct {v0, v4}, Lcom/itextpdf/kernel/pdf/PdfReader;->processXref(Lcom/itextpdf/kernel/pdf/PdfXrefTable;)V

    .line 1269
    move-wide v2, v13

    .line 1270
    .end local v18    # "ptr":J
    .local v2, "ptr":J
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_14

    .line 1274
    .end local v4    # "xref":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .end local v8    # "xrefStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local v9    # "size":I
    .end local v10    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v11    # "index":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v12    # "w":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v13    # "prev":J
    .end local v15    # "b":[B
    .end local v16    # "bptr":I
    .end local v29    # "wc":[I
    .end local v30    # "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    goto/16 :goto_0

    .line 1271
    .restart local v4    # "xref":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .restart local v8    # "xrefStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .restart local v9    # "size":I
    .restart local v10    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    .restart local v11    # "index":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local v12    # "w":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local v13    # "prev":J
    .restart local v15    # "b":[B
    .restart local v16    # "bptr":I
    .restart local v29    # "wc":[I
    .restart local v30    # "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_14
    new-instance v5, Lcom/itextpdf/kernel/exceptions/XrefCycledReferencesException;

    const-string v6, "Xref stream has cycled references. Prev pointer indicates an already visited xref stream."

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/exceptions/XrefCycledReferencesException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1182
    .end local v8    # "xrefStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local v9    # "size":I
    .end local v10    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v11    # "index":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v12    # "w":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v13    # "prev":J
    .end local v15    # "b":[B
    .end local v16    # "bptr":I
    .end local v29    # "wc":[I
    .end local v30    # "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    .restart local v7    # "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_15
    move/from16 p2, v6

    return p2

    .line 1169
    .end local v4    # "xref":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .end local v7    # "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_16
    move-wide/from16 v18, v2

    move/from16 p2, v6

    .line 1170
    .end local v2    # "ptr":J
    .restart local v18    # "ptr":J
    :goto_e
    return p2

    .line 1166
    .end local v18    # "ptr":J
    .restart local v2    # "ptr":J
    :cond_17
    move-wide/from16 v18, v2

    move/from16 p2, v6

    .line 1167
    .end local v2    # "ptr":J
    .restart local v18    # "ptr":J
    :goto_f
    return p2

    .line 1275
    .end local v18    # "ptr":J
    .restart local v2    # "ptr":J
    :cond_18
    move/from16 p1, v5

    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected rebuildXref()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1307
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->xrefStm:Z

    .line 1308
    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->hybridXref:Z

    .line 1309
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->rebuiltXref:Z

    .line 1310
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v2

    .line 1311
    .local v2, "xref":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->clear()V

    .line 1312
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    const-wide/16 v4, 0x0

    invoke-virtual {v3, v4, v5}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 1313
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->trailer:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 1314
    new-instance v3, Lcom/itextpdf/io/source/ByteBuffer;

    const/16 v4, 0x18

    invoke-direct {v3, v4}, Lcom/itextpdf/io/source/ByteBuffer;-><init>(I)V

    .line 1315
    .local v3, "buffer":Lcom/itextpdf/io/source/ByteBuffer;
    new-instance v4, Lcom/itextpdf/io/source/PdfTokenizer;

    new-instance v5, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    new-instance v6, Lcom/itextpdf/kernel/pdf/PdfReader$ReusableRandomAccessSource;

    invoke-direct {v6, v3}, Lcom/itextpdf/kernel/pdf/PdfReader$ReusableRandomAccessSource;-><init>(Lcom/itextpdf/io/source/ByteBuffer;)V

    invoke-direct {v5, v6}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    invoke-direct {v4, v5}, Lcom/itextpdf/io/source/PdfTokenizer;-><init>(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)V

    .line 1317
    .local v4, "lineTokenizer":Lcom/itextpdf/io/source/PdfTokenizer;
    const/4 v5, 0x0

    .line 1320
    .local v5, "trailerIndex":Ljava/lang/Long;
    :goto_0
    :try_start_0
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/PdfTokenizer;->getPosition()J

    move-result-wide v6

    move-wide v12, v6

    .line 1321
    .local v12, "pos":J
    invoke-virtual {v3}, Lcom/itextpdf/io/source/ByteBuffer;->reset()Lcom/itextpdf/io/source/ByteBuffer;

    .line 1324
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v6, v3, v1}, Lcom/itextpdf/io/source/PdfTokenizer;->readLineSegment(Lcom/itextpdf/io/source/ByteBuffer;Z)Z

    move-result v6

    if-nez v6, :cond_0

    .line 1325
    nop

    .line 1358
    .end local v12    # "pos":J
    invoke-direct {p0, v5}, Lcom/itextpdf/kernel/pdf/PdfReader;->setTrailerFromTrailerIndex(Ljava/lang/Long;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1359
    .end local v5    # "trailerIndex":Ljava/lang/Long;
    invoke-virtual {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->close()V

    .line 1360
    .end local v4    # "lineTokenizer":Lcom/itextpdf/io/source/PdfTokenizer;
    return-void

    .line 1327
    .restart local v4    # "lineTokenizer":Lcom/itextpdf/io/source/PdfTokenizer;
    .restart local v5    # "trailerIndex":Ljava/lang/Long;
    .restart local v12    # "pos":J
    :cond_0
    :try_start_1
    invoke-virtual {v3, v0}, Lcom/itextpdf/io/source/ByteBuffer;->get(I)B

    move-result v6

    const/16 v7, 0x74

    if-ne v6, v7, :cond_3

    .line 1328
    invoke-static {v3}, Lcom/itextpdf/io/source/PdfTokenizer;->checkTrailer(Lcom/itextpdf/io/source/ByteBuffer;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 1329
    goto :goto_0

    .line 1331
    :cond_1
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v6, v12, v13}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    .line 1332
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/PdfTokenizer;->nextToken()Z

    .line 1333
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v6}, Lcom/itextpdf/io/source/PdfTokenizer;->getPosition()J

    move-result-wide v6

    .line 1334
    .end local v12    # "pos":J
    .local v6, "pos":J
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfReader;->isCurrentObjectATrailer()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 1339
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    move-object v5, v8

    .end local v5    # "trailerIndex":Ljava/lang/Long;
    .local v8, "trailerIndex":Ljava/lang/Long;
    goto :goto_1

    .line 1341
    .end local v8    # "trailerIndex":Ljava/lang/Long;
    .restart local v5    # "trailerIndex":Ljava/lang/Long;
    :cond_2
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v8, v6, v7}, Lcom/itextpdf/io/source/PdfTokenizer;->seek(J)V

    goto :goto_1

    .line 1343
    .end local v6    # "pos":J
    .restart local v12    # "pos":J
    :cond_3
    invoke-virtual {v3, v0}, Lcom/itextpdf/io/source/ByteBuffer;->get(I)B

    move-result v6

    const/16 v7, 0x30

    if-lt v6, v7, :cond_6

    invoke-virtual {v3, v0}, Lcom/itextpdf/io/source/ByteBuffer;->get(I)B

    move-result v6

    const/16 v7, 0x39

    if-gt v6, v7, :cond_6

    .line 1344
    invoke-static {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->checkObjectStart(Lcom/itextpdf/io/source/PdfTokenizer;)[I

    move-result-object v6

    .line 1345
    .local v6, "obj":[I
    if-nez v6, :cond_4

    .line 1346
    goto :goto_0

    .line 1348
    :cond_4
    aget v10, v6, v0

    .line 1349
    .local v10, "num":I
    aget v11, v6, v1

    .line 1350
    .local v11, "gen":I
    invoke-virtual {v2, v10}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->get(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v7

    if-eqz v7, :cond_5

    invoke-virtual {v2, v10}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->get(I)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v7

    if-gt v7, v11, :cond_6

    .line 1351
    :cond_5
    new-instance v8, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    iget-object v9, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct/range {v8 .. v13}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;IIJ)V

    invoke-virtual {v2, v8}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->add(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1354
    .end local v6    # "obj":[I
    .end local v10    # "num":I
    .end local v11    # "gen":I
    .end local v12    # "pos":J
    :cond_6
    :goto_1
    goto/16 :goto_0

    .line 1315
    .end local v5    # "trailerIndex":Ljava/lang/Long;
    :catchall_0
    move-exception v0

    move-object v1, v0

    .end local v2    # "xref":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .end local v3    # "buffer":Lcom/itextpdf/io/source/ByteBuffer;
    .end local v4    # "lineTokenizer":Lcom/itextpdf/io/source/PdfTokenizer;
    :try_start_2
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1359
    .restart local v2    # "xref":Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .restart local v3    # "buffer":Lcom/itextpdf/io/source/ByteBuffer;
    .restart local v4    # "lineTokenizer":Lcom/itextpdf/io/source/PdfTokenizer;
    :catchall_1
    move-exception v0

    move-object v5, v0

    :try_start_3
    invoke-virtual {v4}, Lcom/itextpdf/io/source/PdfTokenizer;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_2

    :catchall_2
    move-exception v0

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_2
    throw v5
.end method

.method public setCloseStream(Z)V
    .locals 1
    .param p1, "closeStream"    # Z

    .line 280
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->tokens:Lcom/itextpdf/io/source/PdfTokenizer;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/source/PdfTokenizer;->setCloseStream(Z)V

    .line 281
    return-void
.end method

.method public setMemorySavingMode(Z)Lcom/itextpdf/kernel/pdf/PdfReader;
    .locals 0
    .param p1, "memorySavingMode"    # Z

    .line 237
    iput-boolean p1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->memorySavingMode:Z

    .line 238
    return-object p0
.end method

.method public setStrictnessLevel(Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;)Lcom/itextpdf/kernel/pdf/PdfReader;
    .locals 1
    .param p1, "strictnessLevel"    # Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    .line 259
    if-nez p1, :cond_0

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfReader;->DEFAULT_STRICTNESS_LEVEL:Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    goto :goto_0

    :cond_0
    move-object v0, p1

    :goto_0
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->strictnessLevel:Lcom/itextpdf/kernel/pdf/PdfReader$StrictnessLevel;

    .line 260
    return-object p0
.end method

.method public setUnethicalReading(Z)Lcom/itextpdf/kernel/pdf/PdfReader;
    .locals 0
    .param p1, "unethicalReading"    # Z

    .line 222
    iput-boolean p1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->unethicalReading:Z

    .line 223
    return-object p0
.end method

.method setXrefProcessor(Lcom/itextpdf/kernel/pdf/PdfReader$XrefProcessor;)V
    .locals 0
    .param p1, "xrefProcessor"    # Lcom/itextpdf/kernel/pdf/PdfReader$XrefProcessor;

    .line 1410
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfReader;->xrefProcessor:Lcom/itextpdf/kernel/pdf/PdfReader$XrefProcessor;

    .line 1411
    return-void
.end method
