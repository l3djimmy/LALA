.class public abstract Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;
.super Lcom/itextpdf/kernel/pdf/PdfObject;
.source "PdfPrimitiveObject.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field protected content:[B

.field protected directOnly:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 33
    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .line 40
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;-><init>()V

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->content:[B

    .line 41
    return-void
.end method

.method protected constructor <init>(Z)V
    .locals 1
    .param p1, "directOnly"    # Z

    .line 44
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;-><init>()V

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->content:[B

    .line 45
    iput-boolean p1, p0, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->directOnly:Z

    .line 46
    return-void
.end method

.method protected constructor <init>([B)V
    .locals 1
    .param p1, "content"    # [B

    .line 54
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;-><init>()V

    .line 55
    if-eqz p1, :cond_0

    .line 56
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->content:[B

    .line 57
    return-void

    .line 55
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method


# virtual methods
.method protected compareContent(Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;)I
    .locals 3
    .param p1, "o"    # Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;

    .line 102
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->content:[B

    array-length v1, v1

    iget-object v2, p1, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->content:[B

    array-length v2, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 108
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->content:[B

    .line 102
    if-ge v0, v1, :cond_2

    .line 103
    aget-byte v1, v2, v0

    iget-object v2, p1, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->content:[B

    aget-byte v2, v2, v0

    if-le v1, v2, :cond_0

    .line 104
    const/4 v1, 0x1

    return v1

    .line 105
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->content:[B

    aget-byte v1, v1, v0

    iget-object v2, p1, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->content:[B

    aget-byte v2, v2, v0

    if-ge v1, v2, :cond_1

    .line 106
    const/4 v1, -0x1

    return v1

    .line 102
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 108
    .end local v0    # "i":I
    :cond_2
    array-length v0, v2

    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->content:[B

    array-length v1, v1

    invoke-static {v0, v1}, Ljava/lang/Integer;->compare(II)I

    move-result v0

    return v0
.end method

.method protected copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)V
    .locals 3
    .param p1, "from"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "copyFilter"    # Lcom/itextpdf/kernel/utils/ICopyFilter;

    .line 95
    invoke-super {p0, p1, p2, p3}, Lcom/itextpdf/kernel/pdf/PdfObject;->copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)V

    .line 96
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;

    .line 97
    .local v0, "object":Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->content:[B

    if-eqz v1, :cond_0

    .line 98
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->content:[B

    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->content:[B

    array-length v2, v2

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->content:[B

    .line 99
    :cond_0
    return-void
.end method

.method protected abstract generateContent()V
.end method

.method protected final getInternalContent()[B
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->content:[B

    if-nez v0, :cond_0

    .line 61
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->generateContent()V

    .line 62
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->content:[B

    return-object v0
.end method

.method protected hasContent()Z
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->content:[B

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "reference"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 73
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->directOnly:Z

    if-nez v0, :cond_0

    .line 74
    invoke-super {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfObject;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0

    .line 76
    :cond_0
    const-class v0, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 77
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "DirectOnly object cannot be indirect"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 79
    .end local v0    # "logger":Lorg/slf4j/Logger;
    return-object p0
.end method

.method public setIndirectReference(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2
    .param p1, "indirectReference"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 84
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->directOnly:Z

    if-nez v0, :cond_0

    .line 85
    invoke-super {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->setIndirectReference(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 87
    :cond_0
    const-class v0, Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 88
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "DirectOnly object cannot be indirect"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 90
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :goto_0
    return-object p0
.end method
