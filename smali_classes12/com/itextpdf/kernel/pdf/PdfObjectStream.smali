.class Lcom/itextpdf/kernel/pdf/PdfObjectStream;
.super Lcom/itextpdf/kernel/pdf/PdfStream;
.source "PdfObjectStream.java"


# static fields
.field public static final MAX_OBJ_STREAM_SIZE:I = 0xc8


# instance fields
.field protected indexStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

.field protected size:Lcom/itextpdf/kernel/pdf/PdfNumber;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 2
    .param p1, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 49
    new-instance v0, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-direct {v0}, Lcom/itextpdf/io/source/ByteArrayOutputStream;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/io/OutputStream;)V

    .line 50
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    new-instance v1, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-direct {v1}, Lcom/itextpdf/io/source/ByteArrayOutputStream;-><init>()V

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->indexStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 51
    return-void
.end method

.method private constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/io/OutputStream;)V
    .locals 3
    .param p1, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "outputStream"    # Ljava/io/OutputStream;

    .line 68
    invoke-direct {p0, p2}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>(Ljava/io/OutputStream;)V

    .line 41
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->size:Lcom/itextpdf/kernel/pdf/PdfNumber;

    .line 70
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->createNewIndirectReference(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 71
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    iput-object p1, v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 72
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ObjStm:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, v2}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 73
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->size:Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {p0, v0, v2}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 74
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->First:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p0, v0, v2}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 75
    return-void
.end method

.method constructor <init>(Lcom/itextpdf/kernel/pdf/PdfObjectStream;)V
    .locals 2
    .param p1, "prev"    # Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    .line 59
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/io/OutputStream;)V

    .line 60
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->indexStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->indexStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 61
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->reset()V

    .line 62
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->indexStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->reset()V

    .line 64
    const/4 v0, 0x1

    invoke-direct {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->releaseContent(Z)V

    .line 65
    return-void
.end method

.method private releaseContent(Z)V
    .locals 1
    .param p1, "close"    # Z

    .line 118
    if-eqz p1, :cond_0

    .line 119
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->outputStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 120
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->indexStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 121
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/PdfStream;->releaseContent()V

    .line 123
    :cond_0
    return-void
.end method


# virtual methods
.method public addObject(Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 4
    .param p1, "object"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 83
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->size:Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v0

    const/16 v1, 0xc8

    if-eq v0, v1, :cond_0

    .line 86
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v0

    .line 87
    .local v0, "outputStream":Lcom/itextpdf/kernel/pdf/PdfOutputStream;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->indexStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeInteger(I)Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 88
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 89
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getCurrentPos()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeLong(J)Ljava/io/OutputStream;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 90
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    .line 91
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 92
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setObjStreamNumber(I)V

    .line 93
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->size:Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setIndex(J)V

    .line 94
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    .line 95
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->size:Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->increment()V

    .line 96
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->First:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v1

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->indexStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getCurrentPos()J

    move-result-wide v2

    long-to-double v2, v2

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;->setValue(D)V

    .line 97
    return-void

    .line 84
    .end local v0    # "outputStream":Lcom/itextpdf/kernel/pdf/PdfOutputStream;
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "PdfObjectStream reach max size."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getIndexStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;
    .locals 1

    .line 109
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->indexStream:Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    return-object v0
.end method

.method public getSize()I
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->size:Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v0

    return v0
.end method

.method protected releaseContent()V
    .locals 1

    .line 114
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->releaseContent(Z)V

    .line 115
    return-void
.end method
