.class final Lcom/itextpdf/kernel/pdf/IndirectFilterUtils;
.super Ljava/lang/Object;
.source "IndirectFilterUtils.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static logFilterWasAlreadyFlushed(Lorg/slf4j/Logger;Lcom/itextpdf/kernel/pdf/PdfStream;)V
    .locals 2
    .param p0, "logger"    # Lorg/slf4j/Logger;
    .param p1, "stream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 44
    nop

    .line 45
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    .line 44
    const-string/jumbo v1, "{0} {1} R stream object filter was already flushed, stream compression will remain as in original file. Try to flush object containing filter before the PdfDocument#close() method so that stream compression would be processed as intended."

    invoke-static {v1, v0}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 46
    return-void
.end method

.method static throwFlushedFilterException(Lcom/itextpdf/kernel/pdf/PdfStream;)V
    .locals 3
    .param p0, "stream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 36
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    .line 39
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 40
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    .line 37
    const-string v2, "Stream {0} {1} R contains flushed indirect filter object in encrypted document, try to use PdfStream#flush() stream before PdfDocument#close() to prevent this exception"

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
