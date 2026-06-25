.class public Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;
.super Ljava/lang/Object;
.source "MemoryLimitsAwareHandler.java"


# static fields
.field private static final MAX_NUMBER_OF_ELEMENTS_IN_XREF_STRUCTURE:I = 0x2faf080

.field private static final MAX_X_OBJECTS_SIZE_PER_PAGE:J = 0xc0000000L

.field private static final MIN_LIMIT_FOR_NUMBER_OF_ELEMENTS_IN_XREF_STRUCTURE:I = 0x7a120

.field private static final SINGLE_DECOMPRESSED_PDF_STREAM_MIN_SIZE:I = 0x147ae14

.field private static final SINGLE_SCALE_COEFFICIENT:I = 0x64

.field private static final SUM_OF_DECOMPRESSED_PDF_STREAMS_MIN_SIZE:J = 0x6666666L

.field private static final SUM_SCALE_COEFFICIENT:I = 0x1f4


# instance fields
.field private allMemoryUsedForDecompression:J

.field considerCurrentPdfStream:Z

.field private maxNumberOfElementsInXrefStructure:I

.field private maxSizeOfDecompressedPdfStreamsSum:J

.field private maxSizeOfSingleDecompressedPdfStream:I

.field private maxXObjectsSizePerPage:J

.field private memoryUsedForCurrentPdfStreamDecompression:J


# direct methods
.method public constructor <init>()V
    .locals 7

    .line 67
    const v4, 0x2faf080

    const-wide v5, 0xc0000000L

    const v1, 0x147ae14

    const-wide/32 v2, 0x6666666

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;-><init>(IJIJ)V

    .line 69
    return-void
.end method

.method private constructor <init>(IJIJ)V
    .locals 2
    .param p1, "maxSizeOfSingleDecompressedPdfStream"    # I
    .param p2, "maxSizeOfDecompressedPdfStreamsSum"    # J
    .param p4, "maxNumberOfElementsInXrefStructure"    # I
    .param p5, "maxXObjectsSizePerPage"    # J

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->allMemoryUsedForDecompression:J

    .line 58
    iput-wide v0, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->memoryUsedForCurrentPdfStreamDecompression:J

    .line 60
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->considerCurrentPdfStream:Z

    .line 85
    iput p1, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->maxSizeOfSingleDecompressedPdfStream:I

    .line 86
    iput-wide p2, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->maxSizeOfDecompressedPdfStreamsSum:J

    .line 87
    iput p4, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->maxNumberOfElementsInXrefStructure:I

    .line 88
    iput-wide p5, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->maxXObjectsSizePerPage:J

    .line 89
    return-void
.end method

.method public constructor <init>(J)V
    .locals 9
    .param p1, "documentSize"    # J

    .line 78
    const/16 v0, 0x64

    const-wide/32 v1, 0x147ae14

    invoke-static {p1, p2, v0, v1, v2}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->calculateDefaultParameter(JIJ)J

    move-result-wide v0

    long-to-int v3, v0

    .line 79
    const/16 v0, 0x1f4

    const-wide/32 v1, 0x6666666

    invoke-static {p1, p2, v0, v1, v2}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->calculateDefaultParameter(JIJ)J

    move-result-wide v4

    .line 80
    invoke-static {p1, p2}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->calculateMaxElementsInXref(J)I

    move-result v6

    .line 78
    const-wide v7, 0xc0000000L

    move-object v2, p0

    invoke-direct/range {v2 .. v8}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;-><init>(IJIJ)V

    .line 81
    return-void
.end method

.method private static calculateDefaultParameter(JIJ)J
    .locals 4
    .param p0, "documentSize"    # J
    .param p2, "scale"    # I
    .param p3, "min"    # J

    .line 284
    int-to-long v0, p2

    mul-long/2addr v0, p0

    .line 285
    .local v0, "result":J
    cmp-long v2, v0, p3

    if-gez v2, :cond_0

    .line 286
    move-wide v0, p3

    .line 288
    :cond_0
    int-to-long v2, p2

    mul-long/2addr v2, p3

    cmp-long v2, v0, v2

    if-lez v2, :cond_1

    .line 289
    int-to-long v2, p2

    mul-long v0, p3, v2

    .line 291
    :cond_1
    return-wide v0
.end method

.method protected static calculateMaxElementsInXref(J)I
    .locals 3
    .param p0, "documentSizeInBytes"    # J

    .line 226
    const/16 v0, 0x64

    .line 227
    .local v0, "maxDocSizeForMaxLimit":I
    long-to-int v1, p0

    const/high16 v2, 0x100000

    div-int/2addr v1, v2

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v2, 0x1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 228
    .local v1, "documentSizeInMb":I
    const v2, 0x7a120

    mul-int/2addr v2, v1

    return v2
.end method

.method private ensureCurrentStreamIsReset()V
    .locals 2

    .line 295
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->memoryUsedForCurrentPdfStreamDecompression:J

    .line 296
    return-void
.end method


# virtual methods
.method beginDecompressedPdfStreamProcessing()Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;
    .locals 1

    .line 256
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->ensureCurrentStreamIsReset()V

    .line 257
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->considerCurrentPdfStream:Z

    .line 258
    return-object p0
.end method

.method public checkIfPageSizeExceedsTheLimit(J)V
    .locals 2
    .param p1, "totalXObjectsSize"    # J

    .line 213
    iget-wide v0, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->maxXObjectsSizePerPage:J

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    .line 216
    return-void

    .line 214
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/MemoryLimitsAwareException;

    const-string v1, "Pdf contains too many xObject elements on a page and may cause OOM exception. You can increase page size limit by setting custom MemoryLimitsAwareHandler."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/MemoryLimitsAwareException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public checkIfXrefStructureExceedsTheLimit(I)V
    .locals 2
    .param p1, "requestedCapacity"    # I

    .line 207
    add-int/lit8 v0, p1, -0x1

    iget v1, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->maxNumberOfElementsInXrefStructure:I

    if-gt v0, v1, :cond_0

    if-ltz p1, :cond_0

    .line 210
    return-void

    .line 208
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/MemoryLimitsAwareException;

    const-string v1, "Xref structure contains too many elements and may cause OOM exception. You can increase number of elements by setting custom MemoryLimitsAwareHandler."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/MemoryLimitsAwareException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method considerBytesOccupiedByDecompressedPdfStream(J)Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;
    .locals 4
    .param p1, "numOfOccupiedBytes"    # J

    .line 240
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->considerCurrentPdfStream:Z

    if-eqz v0, :cond_1

    iget-wide v0, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->memoryUsedForCurrentPdfStreamDecompression:J

    cmp-long v0, v0, p1

    if-gez v0, :cond_1

    .line 241
    iput-wide p1, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->memoryUsedForCurrentPdfStreamDecompression:J

    .line 242
    iget-wide v0, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->memoryUsedForCurrentPdfStreamDecompression:J

    iget v2, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->maxSizeOfSingleDecompressedPdfStream:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    goto :goto_0

    .line 243
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/MemoryLimitsAwareException;

    const-string v1, "During decompression a single stream occupied more memory than allowed. Please either check your pdf or increase the allowed multiple decompressed pdf streams maximum size value by setting the appropriate parameter of ReaderProperties\'s MemoryLimitsAwareHandler."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/MemoryLimitsAwareException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 247
    :cond_1
    :goto_0
    return-object p0
.end method

.method endDecompressedPdfStreamProcessing()Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;
    .locals 4

    .line 269
    iget-wide v0, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->allMemoryUsedForDecompression:J

    iget-wide v2, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->memoryUsedForCurrentPdfStreamDecompression:J

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->allMemoryUsedForDecompression:J

    .line 270
    iget-wide v0, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->allMemoryUsedForDecompression:J

    iget-wide v2, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->maxSizeOfDecompressedPdfStreamsSum:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 274
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->ensureCurrentStreamIsReset()V

    .line 275
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->considerCurrentPdfStream:Z

    .line 276
    return-object p0

    .line 271
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/MemoryLimitsAwareException;

    const-string v1, "During decompression multiple streams in sum occupied more memory than allowed. Please either check your pdf or increase the allowed single decompressed pdf stream maximum size value by setting the appropriate parameter of ReaderProperties\'s MemoryLimitsAwareHandler."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/MemoryLimitsAwareException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method getAllMemoryUsedForDecompression()J
    .locals 2

    .line 280
    iget-wide v0, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->allMemoryUsedForDecompression:J

    return-wide v0
.end method

.method public getMaxNumberOfElementsInXrefStructure()I
    .locals 1

    .line 169
    iget v0, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->maxNumberOfElementsInXrefStructure:I

    return v0
.end method

.method public getMaxSizeOfDecompressedPdfStreamsSum()J
    .locals 2

    .line 123
    iget-wide v0, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->maxSizeOfDecompressedPdfStreamsSum:J

    return-wide v0
.end method

.method public getMaxSizeOfSingleDecompressedPdfStream()I
    .locals 1

    .line 97
    iget v0, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->maxSizeOfSingleDecompressedPdfStream:I

    return v0
.end method

.method public getMaxXObjectsSizePerPage()J
    .locals 2

    .line 178
    iget-wide v0, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->maxXObjectsSizePerPage:J

    return-wide v0
.end method

.method public isMemoryLimitsAwarenessRequiredOnDecompression(Lcom/itextpdf/kernel/pdf/PdfArray;)Z
    .locals 4
    .param p1, "filters"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 152
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 153
    .local v0, "filterSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Lcom/itextpdf/kernel/pdf/PdfName;>;"
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 154
    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsName(I)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    .line 155
    .local v2, "filterName":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 156
    const/4 v3, 0x1

    return v3

    .line 153
    .end local v2    # "filterName":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 160
    .end local v1    # "index":I
    :cond_1
    const/4 v1, 0x0

    return v1
.end method

.method public setMaxNumberOfElementsInXrefStructure(I)V
    .locals 0
    .param p1, "maxNumberOfElementsInXrefStructure"    # I

    .line 196
    iput p1, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->maxNumberOfElementsInXrefStructure:I

    .line 197
    return-void
.end method

.method public setMaxSizeOfDecompressedPdfStreamsSum(J)Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;
    .locals 0
    .param p1, "maxSizeOfDecompressedPdfStreamsSum"    # J

    .line 140
    iput-wide p1, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->maxSizeOfDecompressedPdfStreamsSum:J

    .line 141
    return-object p0
.end method

.method public setMaxSizeOfSingleDecompressedPdfStream(I)Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;
    .locals 0
    .param p1, "maxSizeOfSingleDecompressedPdfStream"    # I

    .line 113
    iput p1, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->maxSizeOfSingleDecompressedPdfStream:I

    .line 114
    return-object p0
.end method

.method public setMaxXObjectsSizePerPage(J)V
    .locals 0
    .param p1, "maxPageSize"    # J

    .line 187
    iput-wide p1, p0, Lcom/itextpdf/kernel/pdf/MemoryLimitsAwareHandler;->maxXObjectsSizePerPage:J

    .line 188
    return-void
.end method
