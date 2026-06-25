.class public Lcom/itextpdf/kernel/pdf/PdfLiteral;
.super Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;
.source "PdfLiteral.java"


# instance fields
.field private position:J


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 51
    const/4 v0, 0x0

    move-object v1, v0

    check-cast v1, [B

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfLiteral;-><init>([B)V

    .line 52
    return-void
.end method

.method public constructor <init>(I)V
    .locals 2
    .param p1, "size"    # I

    .line 42
    new-array v0, p1, [B

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfLiteral;-><init>([B)V

    .line 43
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfLiteral;->content:[B

    const/16 v1, 0x20

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([BB)V

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "content"    # Ljava/lang/String;

    .line 47
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/itextpdf/io/font/PdfEncodings;->convertToBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfLiteral;-><init>([B)V

    .line 48
    return-void
.end method

.method public constructor <init>([B)V
    .locals 1
    .param p1, "content"    # [B

    .line 37
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;-><init>(Z)V

    .line 38
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfLiteral;->content:[B

    .line 39
    return-void
.end method


# virtual methods
.method protected copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)V
    .locals 2
    .param p1, "from"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "copyFilter"    # Lcom/itextpdf/kernel/utils/ICopyFilter;

    .line 103
    invoke-super {p0, p1, p2, p3}, Lcom/itextpdf/kernel/pdf/PdfPrimitiveObject;->copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)V

    .line 104
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfLiteral;

    .line 105
    .local v0, "literal":Lcom/itextpdf/kernel/pdf/PdfLiteral;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfLiteral;->getInternalContent()[B

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfLiteral;->content:[B

    .line 106
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .line 87
    if-eq p0, p1, :cond_1

    if-eqz p1, :cond_0

    .line 88
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfLiteral;->content:[B

    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfLiteral;

    iget-object v1, v1, Lcom/itextpdf/kernel/pdf/PdfLiteral;->content:[B

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 87
    :goto_1
    return v0
.end method

.method protected generateContent()V
    .locals 0

    .line 83
    return-void
.end method

.method public getBytesCount()I
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfLiteral;->content:[B

    array-length v0, v0

    return v0
.end method

.method public getPosition()J
    .locals 2

    .line 69
    iget-wide v0, p0, Lcom/itextpdf/kernel/pdf/PdfLiteral;->position:J

    return-wide v0
.end method

.method public getType()B
    .locals 1

    .line 56
    const/4 v0, 0x4

    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfLiteral;->content:[B

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfLiteral;->content:[B

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    :goto_0
    return v0
.end method

.method protected newInstance()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1

    .line 98
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfLiteral;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfLiteral;-><init>()V

    return-object v0
.end method

.method public setPosition(J)V
    .locals 0
    .param p1, "position"    # J

    .line 73
    iput-wide p1, p0, Lcom/itextpdf/kernel/pdf/PdfLiteral;->position:J

    .line 74
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 61
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfLiteral;->content:[B

    if-eqz v0, :cond_0

    .line 62
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfLiteral;->content:[B

    sget-object v2, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v0

    .line 64
    :cond_0
    const-string v0, ""

    return-object v0
.end method
