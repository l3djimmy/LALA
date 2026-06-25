.class public Lcom/itextpdf/kernel/pdf/annot/PdfSoundAnnotation;
.super Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;
.source "PdfSoundAnnotation.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/pdf/PdfStream;)V
    .locals 1
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "sound"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 51
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 52
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Sound:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p2}, Lcom/itextpdf/kernel/pdf/annot/PdfSoundAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 53
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 63
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 64
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/geom/Rectangle;Ljava/io/InputStream;FLcom/itextpdf/kernel/pdf/PdfName;II)V
    .locals 5
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p3, "soundStream"    # Ljava/io/InputStream;
    .param p4, "sampleRate"    # F
    .param p5, "encoding"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p6, "channels"    # I
    .param p7, "sampleSizeInBits"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 79
    invoke-direct {p0, p2}, Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 80
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-static {p3}, Lcom/itextpdf/kernel/pdf/annot/PdfSoundAnnotation;->correctWavFile(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/io/InputStream;)V

    .line 81
    .local v0, "sound":Lcom/itextpdf/kernel/pdf/PdfStream;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v3, p4

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 82
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->E:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p5}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 83
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->B:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, p7}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 84
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->C:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, p6}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 85
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Sound:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfSoundAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 86
    return-void
.end method

.method private static correctWavFile(Ljava/io/InputStream;)Ljava/io/InputStream;
    .locals 5
    .param p0, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 98
    const-string v0, ""

    .line 99
    .local v0, "header":Ljava/lang/String;
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, p0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 100
    .local v1, "bufferedIn":Ljava/io/InputStream;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/io/InputStream;->mark(I)V

    .line 101
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    const/4 v3, 0x4

    if-ge v2, v3, :cond_0

    .line 102
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v4

    int-to-char v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 101
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 104
    .end local v2    # "i":I
    :cond_0
    invoke-virtual {v1}, Ljava/io/InputStream;->reset()V

    .line 105
    const-string v2, "RIFF"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 106
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    .line 108
    :cond_1
    return-object v1
.end method


# virtual methods
.method public getIconName()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 117
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfSoundAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Name:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method public getSound()Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 2

    .line 94
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfSoundAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Sound:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    return-object v0
.end method

.method public getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 90
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Sound:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method

.method public setIconName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/annot/PdfSoundAnnotation;
    .locals 1
    .param p1, "name"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 132
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Name:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfSoundAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfSoundAnnotation;

    return-object v0
.end method
