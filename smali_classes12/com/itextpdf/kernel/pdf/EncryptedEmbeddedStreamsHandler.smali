.class Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;
.super Ljava/lang/Object;
.source "EncryptedEmbeddedStreamsHandler.java"


# instance fields
.field private final document:Lcom/itextpdf/kernel/pdf/PdfDocument;

.field private final embeddedStreams:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfStream;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;->embeddedStreams:Ljava/util/Set;

    .line 40
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 41
    return-void
.end method

.method private static getEmbeddedFileStreamFromDictionary(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 3
    .param p0, "dictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 74
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->EF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 75
    .local v0, "embeddedFileDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Filespec:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 76
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->F:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v1

    return-object v1

    .line 78
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method


# virtual methods
.method isStreamStoredAsEmbedded(Lcom/itextpdf/kernel/pdf/PdfStream;)Z
    .locals 1
    .param p1, "stream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 70
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;->embeddedStreams:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method storeAllEmbeddedStreams()V
    .locals 3

    .line 48
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPdfObjects()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 49
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPdfObject(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 50
    .local v1, "indirectObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v2, v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-eqz v2, :cond_0

    .line 51
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-static {v2}, Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;->getEmbeddedFileStreamFromDictionary(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v2

    .line 52
    .local v2, "embeddedStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    if-eqz v2, :cond_0

    .line 53
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;->storeEmbeddedStream(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    .line 48
    .end local v1    # "indirectObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v2    # "embeddedStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 57
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method storeEmbeddedStream(Lcom/itextpdf/kernel/pdf/PdfStream;)V
    .locals 1
    .param p1, "embeddedStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 60
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/EncryptedEmbeddedStreamsHandler;->embeddedStreams:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 61
    return-void
.end method
