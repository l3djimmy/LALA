.class public abstract Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareFilter;
.super Ljava/lang/Object;
.source "MemoryLimitsAwareFilter.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/filters/IFilterHandler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public enableMemoryLimitsAwareHandler(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/io/ByteArrayOutputStream;
    .locals 3
    .param p1, "streamDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 43
    new-instance v0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareOutputStream;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareOutputStream;-><init>()V

    .line 44
    .local v0, "outputStream":Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareOutputStream;
    const/4 v1, 0x0

    .line 45
    .local v1, "memoryLimitsAwareHandler":Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 46
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    iget-object v1, v2, Lcom/itextpdf/kernel/pdf/PdfDocument;->memoryLimitsAwareHandler:Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    goto :goto_0

    .line 49
    :cond_0
    new-instance v2, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;-><init>()V

    move-object v1, v2

    .line 51
    :goto_0
    if-eqz v1, :cond_1

    iget-boolean v2, v1, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->considerCurrentPdfStream:Z

    if-eqz v2, :cond_1

    .line 52
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->getMaxSizeOfSingleDecompressedPdfStream()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareOutputStream;->setMaxStreamSize(I)Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareOutputStream;

    .line 54
    :cond_1
    return-object v0
.end method
