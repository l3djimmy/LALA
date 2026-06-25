.class public Lcom/itextpdf/kernel/pdf/PdfRevisionsReader;
.super Ljava/lang/Object;
.source "PdfRevisionsReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/PdfRevisionsReader$RevisionsXrefProcessor;
    }
.end annotation


# instance fields
.field private documentRevisions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/DocumentRevision;",
            ">;"
        }
    .end annotation
.end field

.field private final reader:Lcom/itextpdf/kernel/pdf/PdfReader;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfReader;)V
    .locals 1
    .param p1, "reader"    # Lcom/itextpdf/kernel/pdf/PdfReader;

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfRevisionsReader;->documentRevisions:Ljava/util/List;

    .line 52
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfRevisionsReader;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    .line 53
    return-void
.end method


# virtual methods
.method public getAllRevisions()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/DocumentRevision;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 63
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfRevisionsReader;->documentRevisions:Ljava/util/List;

    if-nez v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfRevisionsReader;->reader:Lcom/itextpdf/kernel/pdf/PdfReader;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfReader;->getSafeFile()Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    move-result-object v1

    .line 65
    .local v1, "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    new-instance v2, Lcom/itextpdf/io/source/WindowRandomAccessSource;

    .line 66
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->createSourceView()Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v3

    const-wide/16 v4, 0x0

    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->length()J

    move-result-wide v6

    invoke-direct/range {v2 .. v7}, Lcom/itextpdf/io/source/WindowRandomAccessSource;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;JJ)V

    .line 68
    .local v2, "source":Lcom/itextpdf/io/source/WindowRandomAccessSource;
    new-instance v0, Lcom/itextpdf/io/source/RASInputStream;

    invoke-direct {v0, v2}, Lcom/itextpdf/io/source/RASInputStream;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    move-object v3, v0

    .line 69
    .local v3, "inputStream":Ljava/io/InputStream;
    :try_start_0
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfReader;

    invoke-direct {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfReader;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_6

    move-object v4, v0

    .line 68
    .local v4, "newReader":Lcom/itextpdf/kernel/pdf/PdfReader;
    nop

    .line 70
    :try_start_1
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v0, v4}, Lcom/itextpdf/kernel/pdf/PdfDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfReader;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    move-object v5, v0

    .line 68
    .local v5, "newDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    nop

    .line 71
    :try_start_2
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->unmarkReadingCompleted()V

    .line 72
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->clearAllReferences()V

    .line 73
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfRevisionsReader$RevisionsXrefProcessor;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfRevisionsReader$RevisionsXrefProcessor;-><init>()V

    .line 74
    .local v0, "xrefProcessor":Lcom/itextpdf/kernel/pdf/PdfRevisionsReader$RevisionsXrefProcessor;
    invoke-virtual {v4, v0}, Lcom/itextpdf/kernel/pdf/PdfReader;->setXrefProcessor(Lcom/itextpdf/kernel/pdf/PdfReader$XrefProcessor;)V

    .line 75
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfReader;->readXref()V

    .line 76
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfRevisionsReader$RevisionsXrefProcessor;->getDocumentRevisions()Ljava/util/List;

    move-result-object v6

    iput-object v6, p0, Lcom/itextpdf/kernel/pdf/PdfRevisionsReader;->documentRevisions:Ljava/util/List;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 77
    .end local v0    # "xrefProcessor":Lcom/itextpdf/kernel/pdf/PdfRevisionsReader$RevisionsXrefProcessor;
    :try_start_3
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .end local v5    # "newDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :try_start_4
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_6

    .end local v4    # "newReader":Lcom/itextpdf/kernel/pdf/PdfReader;
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 78
    .end local v3    # "inputStream":Ljava/io/InputStream;
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfRevisionsReader;->documentRevisions:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    goto :goto_3

    .line 68
    .restart local v3    # "inputStream":Ljava/io/InputStream;
    .restart local v4    # "newReader":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v5    # "newDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :catchall_0
    move-exception v0

    move-object v6, v0

    .end local v1    # "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local v2    # "source":Lcom/itextpdf/io/source/WindowRandomAccessSource;
    .end local v3    # "inputStream":Ljava/io/InputStream;
    .end local v4    # "newReader":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local v5    # "newDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :try_start_5
    throw v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 77
    .restart local v1    # "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .restart local v2    # "source":Lcom/itextpdf/io/source/WindowRandomAccessSource;
    .restart local v3    # "inputStream":Ljava/io/InputStream;
    .restart local v4    # "newReader":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v5    # "newDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :catchall_1
    move-exception v0

    move-object v7, v0

    :try_start_6
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    goto :goto_0

    :catchall_2
    move-exception v0

    :try_start_7
    invoke-virtual {v6, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local v2    # "source":Lcom/itextpdf/io/source/WindowRandomAccessSource;
    .end local v3    # "inputStream":Ljava/io/InputStream;
    .end local v4    # "newReader":Lcom/itextpdf/kernel/pdf/PdfReader;
    :goto_0
    throw v7
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 68
    .end local v5    # "newDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v1    # "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .restart local v2    # "source":Lcom/itextpdf/io/source/WindowRandomAccessSource;
    .restart local v3    # "inputStream":Ljava/io/InputStream;
    .restart local v4    # "newReader":Lcom/itextpdf/kernel/pdf/PdfReader;
    :catchall_3
    move-exception v0

    move-object v5, v0

    .end local v1    # "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local v2    # "source":Lcom/itextpdf/io/source/WindowRandomAccessSource;
    .end local v3    # "inputStream":Ljava/io/InputStream;
    .end local v4    # "newReader":Lcom/itextpdf/kernel/pdf/PdfReader;
    :try_start_8
    throw v5
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 77
    .restart local v1    # "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .restart local v2    # "source":Lcom/itextpdf/io/source/WindowRandomAccessSource;
    .restart local v3    # "inputStream":Ljava/io/InputStream;
    .restart local v4    # "newReader":Lcom/itextpdf/kernel/pdf/PdfReader;
    :catchall_4
    move-exception v0

    move-object v6, v0

    :try_start_9
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfReader;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    goto :goto_1

    :catchall_5
    move-exception v0

    :try_start_a
    invoke-virtual {v5, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local v2    # "source":Lcom/itextpdf/io/source/WindowRandomAccessSource;
    .end local v3    # "inputStream":Ljava/io/InputStream;
    :goto_1
    throw v6
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    .line 68
    .end local v4    # "newReader":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local v1    # "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .restart local v2    # "source":Lcom/itextpdf/io/source/WindowRandomAccessSource;
    .restart local v3    # "inputStream":Ljava/io/InputStream;
    :catchall_6
    move-exception v0

    move-object v4, v0

    .end local v1    # "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local v2    # "source":Lcom/itextpdf/io/source/WindowRandomAccessSource;
    .end local v3    # "inputStream":Ljava/io/InputStream;
    :try_start_b
    throw v4
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_7

    .line 77
    .restart local v1    # "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .restart local v2    # "source":Lcom/itextpdf/io/source/WindowRandomAccessSource;
    .restart local v3    # "inputStream":Ljava/io/InputStream;
    :catchall_7
    move-exception v0

    move-object v5, v0

    :try_start_c
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_8

    goto :goto_2

    :catchall_8
    move-exception v0

    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_2
    throw v5

    .line 80
    .end local v1    # "raf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local v2    # "source":Lcom/itextpdf/io/source/WindowRandomAccessSource;
    .end local v3    # "inputStream":Ljava/io/InputStream;
    :cond_0
    :goto_3
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfRevisionsReader;->documentRevisions:Ljava/util/List;

    return-object v0
.end method
