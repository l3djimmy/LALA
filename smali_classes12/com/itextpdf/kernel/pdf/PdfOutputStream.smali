.class public Lcom/itextpdf/kernel/pdf/PdfOutputStream;
.super Lcom/itextpdf/io/source/OutputStream;
.source "PdfOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/io/source/OutputStream<",
        "Lcom/itextpdf/kernel/pdf/PdfOutputStream;",
        ">;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final LOGGER:Lorg/slf4j/Logger;

.field private static final closeDict:[B

.field private static final endIndirect:[B

.field private static final endIndirectWithZeroGenNr:[B

.field private static final endstream:[B

.field private static final openDict:[B

.field private static final stream:[B


# instance fields
.field protected crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

.field protected document:Lcom/itextpdf/kernel/pdf/PdfDocument;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 39
    nop

    .line 42
    const-string/jumbo v0, "stream\n"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->stream:[B

    .line 43
    const-string v0, "\nendstream"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->endstream:[B

    .line 44
    const-string v0, "<<"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->openDict:[B

    .line 45
    const-string v0, ">>"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->closeDict:[B

    .line 46
    const-string v0, " R"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->endIndirect:[B

    .line 47
    const-string v0, " 0 R"

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->endIndirectWithZeroGenNr:[B

    .line 48
    const-class v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "outputStream"    # Ljava/io/OutputStream;

    .line 65
    invoke-direct {p0, p1}, Lcom/itextpdf/io/source/OutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 53
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 66
    return-void
.end method

.method private static decodeParamsArrayNotFlushed(Lcom/itextpdf/kernel/pdf/PdfStream;)Z
    .locals 3
    .param p0, "pdfStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 560
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->DecodeParms:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 561
    .local v0, "decodeParams":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 562
    return v1

    .line 564
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->isFlushed()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 565
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->LOGGER:Lorg/slf4j/Logger;

    invoke-static {v1, p0}, Lcom/itextpdf/kernel/pdf/IndirectFilterUtils;->logFilterWasAlreadyFlushed(Lorg/slf4j/Logger;Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 566
    const/4 v1, 0x0

    return v1

    .line 568
    :cond_1
    return v1
.end method

.method private static isFlushed(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Z
    .locals 2
    .param p0, "dict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p1, "name"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 555
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 556
    .local v0, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isFlushed()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private isNotMetadataPdfStream(Lcom/itextpdf/kernel/pdf/PdfStream;)Z
    .locals 2
    .param p1, "pdfStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 250
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 251
    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Metadata:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 250
    :goto_1
    return v0
.end method

.method private isXRefStream(Lcom/itextpdf/kernel/pdf/PdfStream;)Z
    .locals 2
    .param p1, "pdfStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 255
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->XRef:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private write(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 4
    .param p1, "pdfArray"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 141
    const/16 v0, 0x5b

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeByte(I)Ljava/io/OutputStream;

    .line 142
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 143
    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(IZ)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 145
    .local v1, "value":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    move-object v3, v2

    .local v3, "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v2, :cond_0

    .line 146
    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V

    goto :goto_1

    .line 148
    :cond_0
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 150
    :goto_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_1

    .line 151
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    .line 142
    .end local v1    # "value":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v3    # "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 153
    .end local v0    # "i":I
    :cond_2
    const/16 v0, 0x5d

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeByte(I)Ljava/io/OutputStream;

    .line 154
    return-void
.end method

.method private write(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 7
    .param p1, "pdfDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 157
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->openDict:[B

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 158
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 159
    .local v1, "key":Lcom/itextpdf/kernel/pdf/PdfName;
    const/4 v2, 0x0

    .line 160
    .local v2, "isAlreadyWriteSpace":Z
    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 161
    const/4 v3, 0x0

    invoke-virtual {p1, v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    .line 162
    .local v3, "value":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-nez v3, :cond_0

    .line 163
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->LOGGER:Lorg/slf4j/Logger;

    const-string v5, "Invalid key value: key {0} has null value."

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 164
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfNull;->PDF_NULL:Lcom/itextpdf/kernel/pdf/PdfNull;

    .line 166
    :cond_0
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_1

    .line 167
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v4

    const/4 v5, 0x4

    if-eq v4, v5, :cond_1

    .line 168
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v4

    const/4 v5, 0x2

    if-eq v4, v5, :cond_1

    .line 169
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v4

    const/4 v5, 0x7

    if-eq v4, v5, :cond_1

    .line 170
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v4

    const/4 v5, 0x5

    if-eq v4, v5, :cond_1

    .line 171
    const/16 v4, 0x40

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfObject;->checkState(S)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 172
    :cond_1
    const/4 v2, 0x1

    .line 173
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    .line 177
    :cond_2
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v4

    move-object v5, v4

    .local v5, "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v4, :cond_4

    .line 178
    if-nez v2, :cond_3

    .line 179
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    .line 181
    :cond_3
    invoke-direct {p0, v5}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V

    goto :goto_1

    .line 183
    :cond_4
    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 185
    .end local v1    # "key":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v2    # "isAlreadyWriteSpace":Z
    .end local v3    # "value":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v5    # "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    :goto_1
    goto :goto_0

    .line 186
    :cond_5
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->closeDict:[B

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 187
    return-void
.end method

.method private write(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V
    .locals 4
    .param p1, "indirectReference"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 190
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 191
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Pdf indirect object belongs to other PDF document. Copy object to current pdf document."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 193
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->isFree()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 194
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "Flushed object contains indirect reference which is free. Null object will be written instead."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 195
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfNull;->PDF_NULL:Lcom/itextpdf/kernel/pdf/PdfNull;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;)V

    goto :goto_1

    .line 196
    :cond_2
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->refersTo:Lcom/itextpdf/kernel/pdf/PdfObject;

    if-nez v0, :cond_4

    .line 197
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getReader()Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 198
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getOffset()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_4

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getIndex()I

    move-result v0

    if-gez v0, :cond_4

    .line 199
    :cond_3
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "Flushed object contains indirect reference which doesn\'t refer to any other object. Null object will be written instead."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 200
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfNull;->PDF_NULL:Lcom/itextpdf/kernel/pdf/PdfNull;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;)V

    goto :goto_1

    .line 201
    :cond_4
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v0

    if-nez v0, :cond_5

    .line 202
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeInteger(I)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->endIndirectWithZeroGenNr:[B

    .line 203
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    goto :goto_1

    .line 205
    :cond_5
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeInteger(I)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 206
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeSpace()Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 207
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeInteger(I)Ljava/io/OutputStream;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->endIndirect:[B

    .line 208
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 210
    :goto_1
    return-void
.end method

.method private write(Lcom/itextpdf/kernel/pdf/PdfLiteral;)V
    .locals 2
    .param p1, "literal"    # Lcom/itextpdf/kernel/pdf/PdfLiteral;

    .line 217
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getCurrentPos()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfLiteral;->setPosition(J)V

    .line 218
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfLiteral;->getInternalContent()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 219
    return-void
.end method

.method private write(Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 1
    .param p1, "name"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 235
    const/16 v0, 0x2f

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeByte(I)Ljava/io/OutputStream;

    .line 236
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfName;->getInternalContent()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 237
    return-void
.end method

.method private write(Lcom/itextpdf/kernel/pdf/PdfNumber;)V
    .locals 2
    .param p1, "pdfNumber"    # Lcom/itextpdf/kernel/pdf/PdfNumber;

    .line 240
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->hasContent()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 241
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->getInternalContent()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    goto :goto_0

    .line 242
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->isDoubleNumber()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 243
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->getValue()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeDouble(D)Ljava/io/OutputStream;

    goto :goto_0

    .line 245
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeInteger(I)Ljava/io/OutputStream;

    .line 247
    :goto_0
    return-void
.end method

.method private write(Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;)V
    .locals 1
    .param p1, "pdfPrimitive"    # Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;

    .line 213
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->getInternalContent()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 214
    return-void
.end method

.method private write(Lcom/itextpdf/kernel/pdf/PdfStream;)V
    .locals 12
    .param p1, "pdfStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 260
    :try_start_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getCompressionLevel()I

    move-result v0

    const/high16 v1, -0x80000000

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v0, v1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v3

    .line 261
    .local v0, "userDefinedCompression":Z
    :goto_0
    if-nez v0, :cond_2

    .line 262
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 263
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfWriter;->getCompressionLevel()I

    move-result v1

    goto :goto_1

    :cond_1
    const/4 v1, -0x1

    .line 265
    .local v1, "defaultCompressionLevel":I
    :goto_1
    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->setCompressionLevel(I)V

    .line 267
    .end local v1    # "defaultCompressionLevel":I
    :cond_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getCompressionLevel()I

    move-result v1

    if-eqz v1, :cond_3

    move v1, v2

    goto :goto_2

    :cond_3
    move v1, v3

    .line 268
    .local v1, "toCompress":Z
    :goto_2
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/pdf/PdfStream;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v4

    if-nez v4, :cond_4

    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->isNotMetadataPdfStream(Lcom/itextpdf/kernel/pdf/PdfStream;)Z

    move-result v4

    if-eqz v4, :cond_4

    goto :goto_3

    :cond_4
    move v2, v3

    .line 270
    .local v2, "allowCompression":Z
    :goto_3
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    if-eqz v4, :cond_c

    .line 271
    move-object v4, p0

    .line 272
    .local v4, "fout":Ljava/io/OutputStream;
    const/4 v5, 0x0

    .line 273
    .local v5, "def":Lcom/itextpdf/io/source/DeflaterOutputStream;
    const/4 v6, 0x0

    .line 274
    .local v6, "ose":Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;
    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    if-eqz v7, :cond_6

    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    .line 275
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->isEmbeddedFilesOnly()Z

    move-result v7

    if-eqz v7, :cond_5

    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v7, p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->doesStreamBelongToEmbeddedFile(Lcom/itextpdf/kernel/pdf/PdfStream;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 276
    :cond_5
    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v7, v4}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getEncryptionStream(Ljava/io/OutputStream;)Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;

    move-result-object v7

    move-object v6, v7

    move-object v4, v7

    .line 278
    :cond_6
    if-eqz v1, :cond_8

    if-nez v2, :cond_7

    if-eqz v0, :cond_8

    .line 279
    :cond_7
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->updateCompressionFilter(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 280
    new-instance v7, Lcom/itextpdf/io/source/DeflaterOutputStream;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getCompressionLevel()I

    move-result v8

    const v9, 0x8000

    invoke-direct {v7, v4, v8, v9}, Lcom/itextpdf/io/source/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;II)V

    move-object v5, v7

    move-object v4, v7

    .line 282
    :cond_8
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 283
    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->stream:[B

    invoke-virtual {p0, v7}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 284
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getCurrentPos()J

    move-result-wide v7

    .line 285
    .local v7, "beginStreamContent":J
    const/16 v9, 0x1060

    new-array v9, v9, [B

    .line 287
    .local v9, "buf":[B
    :goto_4
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/io/InputStream;->read([B)I

    move-result v10

    .line 288
    .local v10, "n":I
    if-gtz v10, :cond_b

    .line 289
    nop

    .line 292
    .end local v10    # "n":I
    if-eqz v5, :cond_9

    .line 293
    invoke-virtual {v5}, Lcom/itextpdf/io/source/DeflaterOutputStream;->finish()V

    .line 295
    :cond_9
    if-eqz v6, :cond_a

    .line 296
    invoke-virtual {v6}, Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;->finish()V

    .line 298
    :cond_a
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Length:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v3

    .line 299
    .local v3, "length":Lcom/itextpdf/kernel/pdf/PdfNumber;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getCurrentPos()J

    move-result-wide v10

    sub-long/2addr v10, v7

    long-to-int v10, v10

    invoke-virtual {v3, v10}, Lcom/itextpdf/kernel/pdf/PdfNumber;->setValue(I)V

    .line 300
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v10

    invoke-virtual {p1, v10}, Lcom/itextpdf/kernel/pdf/PdfStream;->updateLength(I)V

    .line 301
    sget-object v10, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->endstream:[B

    invoke-virtual {p0, v10}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 302
    nop

    .end local v3    # "length":Lcom/itextpdf/kernel/pdf/PdfNumber;
    .end local v4    # "fout":Ljava/io/OutputStream;
    .end local v5    # "def":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .end local v6    # "ose":Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;
    .end local v7    # "beginStreamContent":J
    .end local v9    # "buf":[B
    goto/16 :goto_7

    .line 290
    .restart local v4    # "fout":Ljava/io/OutputStream;
    .restart local v5    # "def":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .restart local v6    # "ose":Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;
    .restart local v7    # "beginStreamContent":J
    .restart local v9    # "buf":[B
    .restart local v10    # "n":I
    :cond_b
    invoke-virtual {v4, v9, v3, v10}, Ljava/io/OutputStream;->write([BII)V

    .line 291
    .end local v10    # "n":I
    goto :goto_4

    .line 305
    .end local v4    # "fout":Ljava/io/OutputStream;
    .end local v5    # "def":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .end local v6    # "ose":Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;
    .end local v7    # "beginStreamContent":J
    .end local v9    # "buf":[B
    :cond_c
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v4

    if-nez v4, :cond_e

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getReader()Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v4

    if-eqz v4, :cond_e

    .line 308
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getReader()Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v4

    invoke-virtual {v4, p1, v3}, Lcom/itextpdf/kernel/pdf/PdfReader;->readStreamBytes(Lcom/itextpdf/kernel/pdf/PdfStream;Z)[B

    move-result-object v3

    .line 309
    .local v3, "bytes":[B
    if-eqz v0, :cond_d

    .line 310
    invoke-virtual {p0, p1, v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->decodeFlateBytes(Lcom/itextpdf/kernel/pdf/PdfStream;[B)[B

    move-result-object v4

    move-object v3, v4

    .line 312
    :cond_d
    new-instance v4, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    array-length v5, v3

    invoke-direct {v4, v5}, Lcom/itextpdf/io/source/ByteArrayOutputStream;-><init>(I)V

    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/pdf/PdfStream;->initOutputStream(Ljava/io/OutputStream;)V

    .line 313
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write([B)V

    .line 315
    .end local v3    # "bytes":[B
    :cond_e
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v3, :cond_16

    .line 318
    const-string v3, "Error in outputStream"

    if-eqz v1, :cond_12

    :try_start_1
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->containsFlateFilter(Lcom/itextpdf/kernel/pdf/PdfStream;)Z

    move-result v4

    if-nez v4, :cond_12

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->decodeParamsArrayNotFlushed(Lcom/itextpdf/kernel/pdf/PdfStream;)Z

    move-result v4

    if-eqz v4, :cond_12

    if-nez v2, :cond_f

    if-eqz v0, :cond_12

    .line 321
    :cond_f
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->updateCompressionFilter(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 322
    new-instance v4, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-direct {v4}, Lcom/itextpdf/io/source/ByteArrayOutputStream;-><init>()V

    .line 323
    .local v4, "byteArrayStream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    new-instance v5, Lcom/itextpdf/io/source/DeflaterOutputStream;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getCompressionLevel()I

    move-result v6

    invoke-direct {v5, v4, v6}, Lcom/itextpdf/io/source/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 324
    .local v5, "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    instance-of v6, p1, Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    if-eqz v6, :cond_10

    .line 325
    move-object v3, p1

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    .line 326
    .local v3, "objectStream":Lcom/itextpdf/kernel/pdf/PdfObjectStream;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->getIndexStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-virtual {v6, v5}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    .line 327
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-virtual {v6, v5}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    .line 328
    .end local v3    # "objectStream":Lcom/itextpdf/kernel/pdf/PdfObjectStream;
    goto :goto_5

    .line 329
    :cond_10
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v6

    if-eqz v6, :cond_11

    .line 330
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-virtual {v3, v5}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    .line 332
    :goto_5
    invoke-virtual {v5}, Lcom/itextpdf/io/source/DeflaterOutputStream;->finish()V

    .line 333
    .end local v5    # "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    goto :goto_6

    .line 329
    .restart local v5    # "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    :cond_11
    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local v0    # "userDefinedCompression":Z
    .end local v1    # "toCompress":Z
    .end local v2    # "allowCompression":Z
    .end local p1    # "pdfStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    throw v6

    .line 334
    .end local v4    # "byteArrayStream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    .end local v5    # "zip":Lcom/itextpdf/io/source/DeflaterOutputStream;
    .restart local v0    # "userDefinedCompression":Z
    .restart local v1    # "toCompress":Z
    .restart local v2    # "allowCompression":Z
    .restart local p1    # "pdfStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :cond_12
    instance-of v4, p1, Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    if-eqz v4, :cond_13

    .line 335
    move-object v3, p1

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfObjectStream;

    .line 336
    .restart local v3    # "objectStream":Lcom/itextpdf/kernel/pdf/PdfObjectStream;
    new-instance v4, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-direct {v4}, Lcom/itextpdf/io/source/ByteArrayOutputStream;-><init>()V

    .line 337
    .restart local v4    # "byteArrayStream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->getIndexStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-virtual {v5, v4}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    .line 338
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObjectStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-virtual {v5, v4}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    .line 339
    .end local v3    # "objectStream":Lcom/itextpdf/kernel/pdf/PdfObjectStream;
    goto :goto_6

    .line 340
    .end local v4    # "byteArrayStream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    :cond_13
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v4

    if-eqz v4, :cond_15

    .line 341
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getOutputStream()Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    move-object v4, v3

    .line 344
    .restart local v4    # "byteArrayStream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    :goto_6
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->checkEncryption(Lcom/itextpdf/kernel/pdf/PdfStream;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 345
    new-instance v3, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-direct {v3}, Lcom/itextpdf/io/source/ByteArrayOutputStream;-><init>()V

    .line 346
    .local v3, "encodedStream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v5, v3}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getEncryptionStream(Ljava/io/OutputStream;)Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;

    move-result-object v5

    .line 347
    .local v5, "ose":Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;
    invoke-virtual {v4, v5}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    .line 348
    invoke-virtual {v5}, Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;->finish()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 349
    move-object v4, v3

    .line 353
    .end local v3    # "encodedStream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    .end local v5    # "ose":Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;
    :cond_14
    nop

    .line 354
    :try_start_2
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Length:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->size()I

    move-result v6

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p1, v3, v5}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 355
    invoke-virtual {v4}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->size()I

    move-result v3

    invoke-virtual {p1, v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->updateLength(I)V

    .line 356
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 357
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->stream:[B

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 358
    invoke-virtual {v4, p0}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    .line 359
    invoke-virtual {v4}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->close()V

    .line 360
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->endstream:[B

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 364
    .end local v0    # "userDefinedCompression":Z
    .end local v1    # "toCompress":Z
    .end local v2    # "allowCompression":Z
    .end local v4    # "byteArrayStream":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    :goto_7
    nop

    .line 365
    return-void

    .line 340
    .restart local v0    # "userDefinedCompression":Z
    .restart local v1    # "toCompress":Z
    .restart local v2    # "allowCompression":Z
    :cond_15
    :try_start_3
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local v0    # "userDefinedCompression":Z
    .end local v1    # "toCompress":Z
    .end local v2    # "allowCompression":Z
    .end local p1    # "pdfStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    throw v4
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 351
    .restart local v0    # "userDefinedCompression":Z
    .restart local v1    # "toCompress":Z
    .restart local v2    # "allowCompression":Z
    .restart local p1    # "pdfStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :catch_0
    move-exception v3

    .line 352
    .local v3, "ioe":Ljava/io/IOException;
    :try_start_4
    new-instance v4, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v5, "I/O exception."

    invoke-direct {v4, v5, v3}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .end local p1    # "pdfStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    throw v4

    .line 315
    .end local v3    # "ioe":Ljava/io/IOException;
    .restart local p1    # "pdfStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :cond_16
    new-instance v3, Ljava/lang/AssertionError;

    const-string v4, "PdfStream lost OutputStream"

    invoke-direct {v3, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local p1    # "pdfStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    throw v3
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 362
    .end local v0    # "userDefinedCompression":Z
    .end local v1    # "toCompress":Z
    .end local v2    # "allowCompression":Z
    .restart local p1    # "pdfStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :catch_1
    move-exception v0

    .line 363
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Cannot write to PdfStream."

    invoke-direct {v1, v2, v0, p1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/Object;)V

    throw v1
.end method

.method private write(Lcom/itextpdf/kernel/pdf/PdfString;)V
    .locals 1
    .param p1, "pdfString"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 222
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfString;->encrypt(Lcom/itextpdf/kernel/pdf/PdfEncryption;)Z

    .line 223
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfString;->isHexWriting()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 224
    const/16 v0, 0x3c

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeByte(I)Ljava/io/OutputStream;

    .line 225
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfString;->getInternalContent()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 226
    const/16 v0, 0x3e

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeByte(I)Ljava/io/OutputStream;

    goto :goto_0

    .line 228
    :cond_0
    const/16 v0, 0x28

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeByte(I)Ljava/io/OutputStream;

    .line 229
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfString;->getInternalContent()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeBytes([B)Ljava/io/OutputStream;

    .line 230
    const/16 v0, 0x29

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->writeByte(I)Ljava/io/OutputStream;

    .line 232
    :goto_0
    return-void
.end method


# virtual methods
.method protected checkEncryption(Lcom/itextpdf/kernel/pdf/PdfStream;)Z
    .locals 5
    .param p1, "pdfStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 368
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->crypto:Lcom/itextpdf/kernel/pdf/PdfEncryption;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->isEmbeddedFilesOnly()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->doesStreamBelongToEmbeddedFile(Lcom/itextpdf/kernel/pdf/PdfStream;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 371
    :cond_0
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->isXRefStream(Lcom/itextpdf/kernel/pdf/PdfStream;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 373
    return v1

    .line 375
    :cond_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 376
    .local v0, "filter":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-nez v0, :cond_2

    .line 377
    return v2

    .line 379
    :cond_2
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isFlushed()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 380
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/IndirectFilterUtils;->throwFlushedFilterException(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 382
    :cond_3
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Crypt:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 383
    return v1

    .line 385
    :cond_4
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v3

    if-ne v3, v2, :cond_7

    .line 386
    move-object v3, v0

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 387
    .local v3, "filters":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 388
    return v2

    .line 390
    :cond_5
    invoke-virtual {v3, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfObject;->isFlushed()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 391
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/IndirectFilterUtils;->throwFlushedFilterException(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 393
    :cond_6
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Crypt:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(IZ)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v4, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    xor-int/2addr v1, v2

    return v1

    .line 395
    .end local v3    # "filters":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_7
    return v2

    .line 369
    .end local v0    # "filter":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_8
    :goto_0
    return v1
.end method

.method protected containsFlateFilter(Lcom/itextpdf/kernel/pdf/PdfStream;)Z
    .locals 5
    .param p1, "pdfStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 399
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 400
    .local v0, "filter":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-nez v0, :cond_0

    .line 401
    const/4 v1, 0x0

    return v1

    .line 403
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isFlushed()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    .line 404
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->LOGGER:Lorg/slf4j/Logger;

    invoke-static {v1, p1}, Lcom/itextpdf/kernel/pdf/IndirectFilterUtils;->logFilterWasAlreadyFlushed(Lorg/slf4j/Logger;Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 405
    return v2

    .line 407
    :cond_1
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    const/4 v3, 0x6

    if-eq v1, v3, :cond_3

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    if-ne v1, v2, :cond_2

    goto :goto_0

    .line 408
    :cond_2
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "filter is not a name or array."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 410
    :cond_3
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    if-ne v1, v3, :cond_4

    .line 411
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FlateDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 413
    :cond_4
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 414
    .local v3, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfObject;->isFlushed()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 415
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->LOGGER:Lorg/slf4j/Logger;

    invoke-static {v1, p1}, Lcom/itextpdf/kernel/pdf/IndirectFilterUtils;->logFilterWasAlreadyFlushed(Lorg/slf4j/Logger;Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 416
    return v2

    .line 418
    .end local v3    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_5
    goto :goto_1

    .line 419
    :cond_6
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->FlateDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->contains(Lcom/itextpdf/kernel/pdf/PdfObject;)Z

    move-result v1

    return v1
.end method

.method protected decodeFlateBytes(Lcom/itextpdf/kernel/pdf/PdfStream;[B)[B
    .locals 10
    .param p1, "stream"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .param p2, "bytes"    # [B

    .line 456
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 457
    .local v0, "filterObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-nez v0, :cond_0

    .line 458
    return-object p2

    .line 462
    :cond_0
    const/4 v1, 0x0

    .line 463
    .local v1, "filtersArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    instance-of v2, v0, Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 464
    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfName;

    .local v2, "filterName":Lcom/itextpdf/kernel/pdf/PdfName;
    goto :goto_0

    .line 465
    .end local v2    # "filterName":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_1
    instance-of v2, v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    if-eqz v2, :cond_12

    .line 466
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 467
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->isFlushed()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 468
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->LOGGER:Lorg/slf4j/Logger;

    invoke-static {v2, p1}, Lcom/itextpdf/kernel/pdf/IndirectFilterUtils;->logFilterWasAlreadyFlushed(Lorg/slf4j/Logger;Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 469
    return-object p2

    .line 471
    :cond_2
    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsName(I)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    .line 476
    .restart local v2    # "filterName":Lcom/itextpdf/kernel/pdf/PdfName;
    :goto_0
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfName;->isFlushed()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 477
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->LOGGER:Lorg/slf4j/Logger;

    invoke-static {v3, p1}, Lcom/itextpdf/kernel/pdf/IndirectFilterUtils;->logFilterWasAlreadyFlushed(Lorg/slf4j/Logger;Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 478
    return-object p2

    .line 481
    :cond_3
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->FlateDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 482
    return-object p2

    .line 487
    :cond_4
    const/4 v4, 0x0

    .line 488
    .local v4, "decodeParamsArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->DecodeParms:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v5}, Lcom/itextpdf/kernel/pdf/PdfStream;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    .line 489
    .local v5, "decodeParamsObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    const/4 v6, 0x1

    if-nez v5, :cond_5

    .line 490
    const/4 v7, 0x0

    .local v7, "decodeParams":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    goto :goto_1

    .line 491
    .end local v7    # "decodeParams":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_5
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfObject;->isFlushed()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 492
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->LOGGER:Lorg/slf4j/Logger;

    invoke-static {v3, p1}, Lcom/itextpdf/kernel/pdf/IndirectFilterUtils;->logFilterWasAlreadyFlushed(Lorg/slf4j/Logger;Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 493
    return-object p2

    .line 494
    :cond_6
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v7

    const/4 v8, 0x3

    if-ne v7, v8, :cond_7

    .line 495
    move-object v7, v5

    check-cast v7, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .restart local v7    # "decodeParams":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    goto :goto_1

    .line 496
    .end local v7    # "decodeParams":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_7
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v7

    if-ne v7, v6, :cond_11

    .line 497
    move-object v4, v5

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 498
    invoke-virtual {v4, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v7

    .line 504
    .restart local v7    # "decodeParams":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :goto_1
    if-eqz v7, :cond_9

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isFlushed()Z

    move-result v8

    if-nez v8, :cond_8

    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Predictor:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v7, v8}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->isFlushed(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v8

    if-nez v8, :cond_8

    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Columns:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 505
    invoke-static {v7, v8}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->isFlushed(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v8

    if-nez v8, :cond_8

    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Colors:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v7, v8}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->isFlushed(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v8

    if-nez v8, :cond_8

    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->BitsPerComponent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v7, v8}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->isFlushed(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 507
    :cond_8
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->LOGGER:Lorg/slf4j/Logger;

    invoke-static {v3, p1}, Lcom/itextpdf/kernel/pdf/IndirectFilterUtils;->logFilterWasAlreadyFlushed(Lorg/slf4j/Logger;Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 508
    return-object p2

    .line 512
    :cond_9
    invoke-static {p2, v6}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeFilter;->flateDecode([BZ)[B

    move-result-object v8

    .line 513
    .local v8, "res":[B
    if-nez v8, :cond_a

    .line 514
    invoke-static {p2, v3}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeFilter;->flateDecode([BZ)[B

    move-result-object v8

    .line 515
    :cond_a
    invoke-static {v8, v7}, Lcom/itextpdf/kernel/pdf/filters/FlateDecodeFilter;->decodePredictor([BLcom/itextpdf/kernel/pdf/PdfObject;)[B

    move-result-object p2

    .line 519
    const/4 v0, 0x0

    .line 520
    if-eqz v1, :cond_c

    .line 521
    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->remove(I)V

    .line 522
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v9

    if-ne v9, v6, :cond_b

    .line 523
    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    goto :goto_2

    .line 524
    :cond_b
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_c

    .line 525
    move-object v0, v1

    .line 529
    :cond_c
    :goto_2
    const/4 v5, 0x0

    .line 530
    if-eqz v4, :cond_e

    .line 531
    invoke-virtual {v4, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->remove(I)V

    .line 532
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v9

    if-ne v9, v6, :cond_d

    invoke-virtual {v4, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v6

    const/4 v9, 0x7

    if-eq v6, v9, :cond_d

    .line 533
    invoke-virtual {v4, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    goto :goto_3

    .line 534
    :cond_d
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_e

    .line 535
    move-object v5, v4

    .line 539
    :cond_e
    :goto_3
    if-nez v0, :cond_f

    .line 540
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_4

    .line 542
    :cond_f
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 545
    :goto_4
    if-nez v5, :cond_10

    .line 546
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->DecodeParms:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_5

    .line 548
    :cond_10
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->DecodeParms:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3, v5}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 551
    :goto_5
    return-object p2

    .line 500
    .end local v7    # "decodeParams":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v8    # "res":[B
    :cond_11
    new-instance v3, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v6, "Decode parameter type {0} is not supported."

    invoke-direct {v3, v6}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    .line 501
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v3

    throw v3

    .line 473
    .end local v2    # "filterName":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v4    # "decodeParamsArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v5    # "decodeParamsObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_12
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v3, "filter is not a name or array."

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected updateCompressionFilter(Lcom/itextpdf/kernel/pdf/PdfStream;)V
    .locals 6
    .param p1, "pdfStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 423
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 424
    .local v0, "filter":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-nez v0, :cond_0

    .line 426
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->DecodeParms:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 428
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->FlateDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 429
    return-void

    .line 431
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 432
    .local v1, "filters":Lcom/itextpdf/kernel/pdf/PdfArray;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->FlateDecode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 433
    instance-of v2, v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    if-eqz v2, :cond_1

    .line 434
    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->addAll(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    goto :goto_0

    .line 436
    :cond_1
    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 438
    :goto_0
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->DecodeParms:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    .line 439
    .local v2, "decodeParms":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v2, :cond_4

    .line 440
    instance-of v3, v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-eqz v3, :cond_2

    .line 441
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 442
    .local v3, "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNull;

    invoke-direct {v4}, Lcom/itextpdf/kernel/pdf/PdfNull;-><init>()V

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 443
    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 444
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->DecodeParms:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v4, v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 445
    .end local v3    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    goto :goto_1

    :cond_2
    instance-of v3, v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    if-eqz v3, :cond_3

    .line 446
    move-object v3, v2

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNull;

    invoke-direct {v4}, Lcom/itextpdf/kernel/pdf/PdfNull;-><init>()V

    const/4 v5, 0x0

    invoke-virtual {v3, v5, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(ILcom/itextpdf/kernel/pdf/PdfObject;)V

    goto :goto_1

    .line 448
    :cond_3
    new-instance v3, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v4, "Decode parameter type {0} is not supported."

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    .line 449
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v3

    throw v3

    .line 452
    :cond_4
    :goto_1
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 453
    return-void
.end method

.method public write(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfOutputStream;
    .locals 2
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 76
    const/16 v0, 0x40

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->checkState(S)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v0, :cond_0

    .line 77
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 78
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object p1

    .line 80
    :cond_0
    const/16 v0, 0x100

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->checkState(S)Z

    move-result v0

    if-nez v0, :cond_1

    .line 83
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 104
    :pswitch_0
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfString;)V

    .line 105
    goto :goto_0

    .line 110
    :pswitch_1
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    goto :goto_0

    .line 107
    :pswitch_2
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfNumber;)V

    .line 108
    goto :goto_0

    .line 94
    :pswitch_3
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 95
    goto :goto_0

    .line 91
    :pswitch_4
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V

    .line 92
    goto :goto_0

    .line 101
    :pswitch_5
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfLiteral;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfLiteral;)V

    .line 102
    goto :goto_0

    .line 88
    :pswitch_6
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 89
    goto :goto_0

    .line 98
    :pswitch_7
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;)V

    .line 99
    goto :goto_0

    .line 85
    :pswitch_8
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 86
    nop

    .line 113
    :goto_0
    return-object p0

    .line 81
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot write object after it was released. In normal situation the object must be read once again before being written."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_7
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method write(II)V
    .locals 4
    .param p1, "bytes"    # I
    .param p2, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 137
    int-to-long v0, p1

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    invoke-virtual {p0, v0, v1, p2}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(JI)V

    .line 138
    return-void
.end method

.method write(JI)V
    .locals 4
    .param p1, "bytes"    # J
    .param p3, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 123
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_1

    .line 124
    :goto_0
    add-int/lit8 p3, p3, -0x1

    if-ltz p3, :cond_0

    .line 125
    mul-int/lit8 v0, p3, 0x8

    shr-long v0, p1, v0

    const-wide/16 v2, 0xff

    and-long/2addr v0, v2

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutputStream;->write(I)V

    goto :goto_0

    .line 127
    :cond_0
    return-void

    .line 123
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method
