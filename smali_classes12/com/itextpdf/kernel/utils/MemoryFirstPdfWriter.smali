.class Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;
.super Lcom/itextpdf/kernel/pdf/PdfWriter;
.source "MemoryFirstPdfWriter.java"


# static fields
.field private static final MAX_ALLOWED_STREAMS:I = 0x64

.field private static waitingStreams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private filePath:Ljava/lang/String;

.field private outStream:Ljava/io/ByteArrayOutputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 42
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;->waitingStreams:Ljava/util/Map;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/WriterProperties;)V
    .locals 1
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "properties"    # Lcom/itextpdf/kernel/pdf/WriterProperties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 48
    invoke-static {}, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;->createBAOutputStream()Ljava/io/ByteArrayOutputStream;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2}, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;-><init>(Ljava/lang/String;Ljava/io/ByteArrayOutputStream;Lcom/itextpdf/kernel/pdf/WriterProperties;)V

    .line 49
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/io/ByteArrayOutputStream;Lcom/itextpdf/kernel/pdf/WriterProperties;)V
    .locals 2
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "outputStream"    # Ljava/io/ByteArrayOutputStream;
    .param p3, "properties"    # Lcom/itextpdf/kernel/pdf/WriterProperties;

    .line 52
    invoke-direct {p0, p2, p3}, Lcom/itextpdf/kernel/pdf/PdfWriter;-><init>(Ljava/io/OutputStream;Lcom/itextpdf/kernel/pdf/WriterProperties;)V

    .line 53
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;->setCloseStream(Z)V

    .line 55
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;->filePath:Ljava/lang/String;

    .line 56
    iput-object p2, p0, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;->outStream:Ljava/io/ByteArrayOutputStream;

    .line 57
    sget-object v0, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;->waitingStreams:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    const/16 v1, 0x64

    if-ge v0, v1, :cond_0

    .line 62
    sget-object v0, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;->waitingStreams:Ljava/util/Map;

    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    return-void

    .line 58
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Too many PdfWriter\'s have been created. Verify that you call CompareTool.cleanup where necessary"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static cleanup(Ljava/lang/String;)V
    .locals 3
    .param p0, "path"    # Ljava/lang/String;

    .line 70
    if-eqz p0, :cond_2

    .line 74
    sget-object v0, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;->waitingStreams:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 75
    .local v1, "filePath":Ljava/lang/String;
    invoke-virtual {v1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 76
    sget-object v2, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;->waitingStreams:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .end local v1    # "filePath":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 79
    :cond_1
    return-void

    .line 71
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Provided path is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static createBAOutputStream()Ljava/io/ByteArrayOutputStream;
    .locals 1

    .line 92
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    return-object v0
.end method

.method static get(Ljava/lang/String;)Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;
    .locals 1
    .param p0, "filename"    # Ljava/lang/String;

    .line 66
    sget-object v0, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;->waitingStreams:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;

    return-object v0
.end method


# virtual methods
.method dump()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p0, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;->filePath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 83
    .local v0, "fos":Ljava/io/FileOutputStream;
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;->outStream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v1, v0}, Ljava/io/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    .line 84
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 85
    return-void
.end method

.method getBAOutputStream()Ljava/io/ByteArrayOutputStream;
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/MemoryFirstPdfWriter;->outStream:Ljava/io/ByteArrayOutputStream;

    return-object v0
.end method
