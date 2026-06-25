.class public abstract Lcom/itextpdf/kernel/pdf/PdfObject;
.super Ljava/lang/Object;
.source "PdfObject.java"


# static fields
.field public static final ARRAY:B = 0x1t

.field public static final BOOLEAN:B = 0x2t

.field public static final DICTIONARY:B = 0x3t

.field protected static final FLUSHED:S = 0x1s

.field protected static final FORBID_RELEASE:S = 0x80s

.field protected static final FREE:S = 0x2s

.field public static final INDIRECT_REFERENCE:B = 0x5t

.field public static final LITERAL:B = 0x4t

.field protected static final MODIFIED:S = 0x8s

.field protected static final MUST_BE_FLUSHED:S = 0x20s

.field protected static final MUST_BE_INDIRECT:S = 0x40s

.field public static final NAME:B = 0x6t

.field public static final NULL:B = 0x7t

.field public static final NUMBER:B = 0x8t

.field protected static final ORIGINAL_OBJECT_STREAM:S = 0x10s

.field protected static final READING:S = 0x4s

.field protected static final READ_ONLY:S = 0x100s

.field public static final STREAM:B = 0x9t

.field public static final STRING:B = 0xat

.field protected static final UNENCRYPTED:S = 0x200s


# instance fields
.field protected indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

.field private state:S


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    return-void
.end method

.method static equalContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;)Z
    .locals 4
    .param p0, "obj1"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p1, "obj2"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 598
    const/4 v0, 0x1

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v1

    if-eqz v1, :cond_0

    move-object v1, p0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 599
    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, p0

    .line 601
    .local v1, "direct1":Lcom/itextpdf/kernel/pdf/PdfObject;
    :goto_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v2

    if-eqz v2, :cond_1

    move-object v2, p1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 602
    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    goto :goto_1

    :cond_1
    move-object v2, p1

    .line 604
    .local v2, "direct2":Lcom/itextpdf/kernel/pdf/PdfObject;
    :goto_1
    if-eqz v1, :cond_2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    :goto_2
    return v0
.end method


# virtual methods
.method protected checkState(S)Z
    .locals 1
    .param p1, "state"    # S

    .line 547
    iget-short v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->state:S

    and-int/2addr v0, p1

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected clearState(S)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2
    .param p1, "state"    # S

    .line 570
    iget-short v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->state:S

    not-int v1, p1

    int-to-short v1, v1

    and-int/2addr v0, v1

    int-to-short v0, v0

    iput-short v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->state:S

    .line 571
    return-object p0
.end method

.method public clone()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1

    .line 270
    invoke-static {}, Lcom/itextpdf/kernel/utils/NullCopyFilter;->getInstance()Lcom/itextpdf/kernel/utils/NullCopyFilter;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->clone(Lcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public clone(Lcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 3
    .param p1, "filter"    # Lcom/itextpdf/kernel/utils/ICopyFilter;

    .line 282
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->newInstance()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 283
    .local v0, "newObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    const/16 v2, 0x40

    if-nez v1, :cond_0

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfObject;->checkState(S)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 284
    :cond_0
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfObject;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 286
    :cond_1
    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1, p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)V

    .line 287
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 36
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->clone()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method protected copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "from"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 581
    invoke-static {}, Lcom/itextpdf/kernel/utils/NullCopyFilter;->getInstance()Lcom/itextpdf/kernel/utils/NullCopyFilter;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)V

    .line 582
    return-void
.end method

.method protected copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)V
    .locals 2
    .param p1, "from"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "filter"    # Lcom/itextpdf/kernel/utils/ICopyFilter;

    .line 593
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 595
    return-void

    .line 594
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot copy flushed object."

    invoke-direct {v0, v1, p0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method public copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 301
    const/4 v0, 0x1

    invoke-static {}, Lcom/itextpdf/kernel/utils/NullCopyFilter;->getInstance()Lcom/itextpdf/kernel/utils/NullCopyFilter;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "copyFilter"    # Lcom/itextpdf/kernel/utils/ICopyFilter;

    .line 337
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0, p2}, Lcom/itextpdf/kernel/pdf/PdfObject;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;Z)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "allowDuplicating"    # Z

    .line 320
    invoke-static {}, Lcom/itextpdf/kernel/utils/NullCopyFilter;->getInstance()Lcom/itextpdf/kernel/utils/NullCopyFilter;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public copyTo(Lcom/itextpdf/kernel/pdf/PdfDocument;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "allowDuplicating"    # Z
    .param p3, "copyFilter"    # Lcom/itextpdf/kernel/utils/ICopyFilter;

    .line 359
    if-eqz p1, :cond_3

    .line 362
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    if-eqz v0, :cond_2

    .line 365
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v0

    if-nez v0, :cond_1

    const/16 v0, 0x40

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->checkState(S)Z

    move-result v0

    if-nez v0, :cond_1

    .line 369
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getReader()Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfReader;->isOpenedWithFullPermission()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 370
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/BadPasswordException;

    const-string v1, "PdfReader is not opened with owner password"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/BadPasswordException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 366
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot copy indirect object from the document that is being written."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 374
    :cond_2
    :goto_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/itextpdf/kernel/pdf/PdfObject;->processCopying(Lcom/itextpdf/kernel/pdf/PdfDocument;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0

    .line 360
    :cond_3
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Document for copyTo cannot be null."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final flush()V
    .locals 1

    .line 132
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->flush(Z)V

    .line 133
    return-void
.end method

.method public final flush(Z)V
    .locals 3
    .param p1, "canBeInObjStm"    # Z

    .line 141
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->isFree()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 158
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    .line 159
    .local v0, "document":Lcom/itextpdf/kernel/pdf/PdfDocument;
    if-eqz v0, :cond_3

    .line 160
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->isAppendMode()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isModified()Z

    move-result v1

    if-nez v1, :cond_1

    .line 161
    const-class v1, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 162
    .local v1, "logger":Lorg/slf4j/Logger;
    const-string v2, "PdfObject flushing is not performed: PdfDocument is opened in append mode and the object is not marked as modified ( see PdfObject#setModified() )."

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 163
    return-void

    .line 165
    .end local v1    # "logger":Lorg/slf4j/Logger;
    :cond_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/IsoKey;->PDF_OBJECT:Lcom/itextpdf/kernel/pdf/IsoKey;

    invoke-virtual {v0, p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;)V

    .line 166
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    const/16 v2, 0x9

    if-eq v1, v2, :cond_2

    .line 167
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    const/4 v2, 0x5

    if-eq v1, v2, :cond_2

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v1

    if-nez v1, :cond_2

    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    .line 166
    :goto_0
    invoke-virtual {v0, p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->flushObject(Lcom/itextpdf/kernel/pdf/PdfObject;Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 171
    .end local v0    # "document":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :cond_3
    nop

    .line 172
    return-void

    .line 169
    :catch_0
    move-exception v0

    .line 170
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Cannot flush object."

    invoke-direct {v1, v2, v0, p0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/Object;)V

    throw v1

    .line 155
    .end local v0    # "e":Ljava/io/IOException;
    :cond_4
    :goto_1
    return-void
.end method

.method public getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .locals 1

    .line 181
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    return-object v0
.end method

.method public abstract getType()B
.end method

.method public isArray()Z
    .locals 2

    .line 482
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isBoolean()Z
    .locals 2

    .line 442
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isDictionary()Z
    .locals 2

    .line 492
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFlushed()Z
    .locals 3

    .line 247
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    .line 248
    .local v0, "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isIndirect()Z
    .locals 1

    .line 198
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    if-nez v0, :cond_1

    const/16 v0, 0x40

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->checkState(S)Z

    move-result v0

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
.end method

.method public isIndirectReference()Z
    .locals 2

    .line 513
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isLiteral()Z
    .locals 2

    .line 529
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isModified()Z
    .locals 2

    .line 257
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    .line 258
    .local v0, "indirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v0, :cond_0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isName()Z
    .locals 2

    .line 472
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isNull()Z
    .locals 2

    .line 432
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isNumber()Z
    .locals 2

    .line 452
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isReleaseForbidden()Z
    .locals 1

    .line 406
    const/16 v0, 0x80

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->checkState(S)Z

    move-result v0

    return v0
.end method

.method public isStream()Z
    .locals 2

    .line 502
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    const/16 v1, 0x9

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isString()Z
    .locals 2

    .line 462
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 238
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "reference"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 210
    if-eqz p1, :cond_3

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    if-eqz v0, :cond_0

    goto :goto_1

    .line 213
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 217
    if-nez p2, :cond_1

    .line 218
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->createNextIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 219
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setRefersTo(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    goto :goto_0

    .line 221
    :cond_1
    const/16 v0, 0x8

    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 222
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 223
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setRefersTo(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 225
    :goto_0
    const/16 v0, 0x80

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 226
    const/16 v0, 0x40

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->clearState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 227
    return-object p0

    .line 214
    :cond_2
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "There is no associate PdfWriter for making indirects."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 211
    :cond_3
    :goto_1
    return-object p0
.end method

.method protected abstract newInstance()Lcom/itextpdf/kernel/pdf/PdfObject;
.end method

.method processCopying(Lcom/itextpdf/kernel/pdf/PdfDocument;Z)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .param p1, "documentTo"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "allowDuplicating"    # Z

    .line 627
    invoke-static {}, Lcom/itextpdf/kernel/utils/NullCopyFilter;->getInstance()Lcom/itextpdf/kernel/utils/NullCopyFilter;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->processCopying(Lcom/itextpdf/kernel/pdf/PdfDocument;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method processCopying(Lcom/itextpdf/kernel/pdf/PdfDocument;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 3
    .param p1, "documentTo"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "allowDuplicating"    # Z
    .param p3, "filter"    # Lcom/itextpdf/kernel/utils/ICopyFilter;

    .line 652
    if-eqz p1, :cond_1

    .line 654
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v0

    .line 655
    .local v0, "writer":Lcom/itextpdf/kernel/pdf/PdfWriter;
    if-eqz v0, :cond_0

    .line 657
    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/itextpdf/kernel/pdf/PdfWriter;->copyObject(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;ZLcom/itextpdf/kernel/utils/ICopyFilter;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    return-object v1

    .line 656
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Cannot copy to document opened in reading mode."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 661
    .end local v0    # "writer":Lcom/itextpdf/kernel/pdf/PdfWriter;
    :cond_1
    move-object v0, p0

    .line 662
    .local v0, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 663
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 664
    .local v1, "refTo":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v1, :cond_2

    move-object v2, v1

    goto :goto_0

    :cond_2
    move-object v2, v0

    :goto_0
    move-object v0, v2

    .line 666
    .end local v1    # "refTo":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_3
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirect()Z

    move-result v1

    if-eqz v1, :cond_4

    if-nez p2, :cond_4

    .line 667
    return-object v0

    .line 669
    :cond_4
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->clone()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    return-object v1
.end method

.method public release()V
    .locals 2

    .line 411
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isReleaseForbidden()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 412
    const-class v0, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 413
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "ForbidRelease flag is set and release is called. Releasing will not be performed."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 414
    .end local v0    # "logger":Lorg/slf4j/Logger;
    goto :goto_0

    .line 415
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getReader()Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 416
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v0

    if-nez v0, :cond_1

    .line 417
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->refersTo:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 418
    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 419
    const/16 v0, 0x100

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 423
    :cond_1
    :goto_0
    return-void
.end method

.method protected setIndirectReference(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 0
    .param p1, "indirectReference"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 517
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 518
    return-object p0
.end method

.method public setModified()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2

    .line 390
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    if-eqz v0, :cond_0

    .line 391
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->indirectReference:Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 392
    const/16 v0, 0x80

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 394
    :cond_0
    return-object p0
.end method

.method protected setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .param p1, "state"    # S

    .line 558
    iget-short v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->state:S

    or-int/2addr v0, p1

    int-to-short v0, v0

    iput-short v0, p0, Lcom/itextpdf/kernel/pdf/PdfObject;->state:S

    .line 559
    return-object p0
.end method
