.class public Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
.super Lcom/itextpdf/kernel/pdf/PdfObject;
.source "PdfIndirectReference.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObject;",
        "Ljava/lang/Comparable<",
        "Lcom/itextpdf/kernel/pdf/PdfIndirectReference;",
        ">;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final LENGTH_OF_INDIRECTS_CHAIN:I = 0x1f


# instance fields
.field protected genNr:I

.field protected final objNr:I

.field protected objectStreamNumber:I

.field protected offsetOrIndex:J

.field protected pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

.field protected refersTo:Lcom/itextpdf/kernel/pdf/PdfObject;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 28
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;I)V
    .locals 1
    .param p1, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "objNr"    # I

    .line 65
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;II)V

    .line 66
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;II)V
    .locals 3
    .param p1, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "objNr"    # I
    .param p3, "genNr"    # I

    .line 69
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;-><init>()V

    .line 45
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->refersTo:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 51
    const/4 v1, 0x0

    iput v1, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->objectStreamNumber:I

    .line 57
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->offsetOrIndex:J

    .line 62
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 70
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 71
    iput p2, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->objNr:I

    .line 72
    iput p3, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->genNr:I

    .line 73
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;IIJ)V
    .locals 3
    .param p1, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "objNr"    # I
    .param p3, "genNr"    # I
    .param p4, "offset"    # J

    .line 76
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;-><init>()V

    .line 45
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->refersTo:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 51
    const/4 v1, 0x0

    iput v1, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->objectStreamNumber:I

    .line 57
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->offsetOrIndex:J

    .line 62
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 77
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 78
    iput p2, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->objNr:I

    .line 79
    iput p3, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->genNr:I

    .line 80
    iput-wide p4, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->offsetOrIndex:J

    .line 81
    cmp-long v0, p4, v1

    if-ltz v0, :cond_0

    .line 82
    return-void

    .line 81
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private comparePdfDocumentLinks(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)I
    .locals 8
    .param p1, "toCompare"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 327
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    .line 328
    return v2

    .line 329
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    const/4 v1, -0x1

    if-nez v0, :cond_1

    .line 330
    return v1

    .line 331
    :cond_1
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    const/4 v3, 0x1

    if-nez v0, :cond_2

    .line 332
    return v3

    .line 334
    :cond_2
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentId()J

    move-result-wide v4

    .line 335
    .local v4, "thisDocumentId":J
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentId()J

    move-result-wide v6

    .line 336
    .local v6, "documentIdToCompare":J
    cmp-long v0, v4, v6

    if-nez v0, :cond_3

    .line 337
    return v2

    .line 339
    :cond_3
    cmp-long v0, v4, v6

    if-lez v0, :cond_4

    move v1, v3

    :cond_4
    return v1
.end method


# virtual methods
.method public compareTo(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)I
    .locals 4
    .param p1, "o"    # Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 182
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->objNr:I

    iget v1, p1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->objNr:I

    const/4 v2, 0x1

    const/4 v3, -0x1

    if-ne v0, v1, :cond_2

    .line 183
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->genNr:I

    iget v1, p1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->genNr:I

    if-ne v0, v1, :cond_0

    .line 184
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->comparePdfDocumentLinks(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)I

    move-result v0

    return v0

    .line 186
    :cond_0
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->genNr:I

    iget v1, p1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->genNr:I

    if-le v0, v1, :cond_1

    goto :goto_0

    :cond_1
    move v2, v3

    :goto_0
    return v2

    .line 188
    :cond_2
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->objNr:I

    iget v1, p1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->objNr:I

    if-le v0, v1, :cond_3

    goto :goto_1

    :cond_3
    move v2, v3

    :goto_1
    return v2
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 28
    check-cast p1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->compareTo(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)I

    move-result p1

    return p1
.end method

.method protected copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 0
    .param p1, "from"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 296
    return-void
.end method

.method protected copyContent(Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/ICopyFilter;)V
    .locals 0
    .param p1, "from"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "copyFilter"    # Lcom/itextpdf/kernel/utils/ICopyFilter;

    .line 291
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "o"    # Ljava/lang/Object;

    .line 153
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 154
    return v0

    .line 156
    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_3

    .line 159
    :cond_1
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    .line 160
    .local v2, "that":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    iget-object v4, v2, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-ne v3, v4, :cond_2

    move v3, v0

    goto :goto_0

    :cond_2
    move v3, v1

    .line 161
    .local v3, "documentsEquals":Z
    :goto_0
    if-nez v3, :cond_4

    .line 162
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v4, :cond_3

    iget-object v4, v2, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 164
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentId()J

    move-result-wide v4

    iget-object v6, v2, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentId()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-nez v4, :cond_3

    move v4, v0

    goto :goto_1

    :cond_3
    move v4, v1

    :goto_1
    move v3, v4

    .line 167
    :cond_4
    iget v4, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->objNr:I

    iget v5, v2, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->objNr:I

    if-ne v4, v5, :cond_5

    iget v4, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->genNr:I

    iget v5, v2, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->genNr:I

    if-ne v4, v5, :cond_5

    if-eqz v3, :cond_5

    goto :goto_2

    :cond_5
    move v0, v1

    :goto_2
    return v0

    .line 157
    .end local v2    # "that":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v3    # "documentsEquals":Z
    :cond_6
    :goto_3
    return v1
.end method

.method fixOffset(J)V
    .locals 1
    .param p1, "offset"    # J

    .line 321
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->isFree()Z

    move-result v0

    if-nez v0, :cond_0

    .line 322
    iput-wide p1, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->offsetOrIndex:J

    .line 324
    :cond_0
    return-void
.end method

.method public getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 1

    .line 197
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    return-object v0
.end method

.method public getGenNumber()I
    .locals 1

    .line 89
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->genNr:I

    return v0
.end method

.method public getIndex()I
    .locals 2

    .line 148
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->objectStreamNumber:I

    if-nez v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->offsetOrIndex:J

    long-to-int v0, v0

    :goto_0
    return v0
.end method

.method public getObjNumber()I
    .locals 1

    .line 85
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->objNr:I

    return v0
.end method

.method public getObjStreamNumber()I
    .locals 1

    .line 130
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->objectStreamNumber:I

    return v0
.end method

.method public getOffset()J
    .locals 2

    .line 139
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->objectStreamNumber:I

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->offsetOrIndex:J

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0
.end method

.method protected getReader()Lcom/itextpdf/kernel/pdf/PdfReader;
    .locals 1

    .line 277
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 278
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getReader()Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v0

    return-object v0

    .line 280
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRefersTo()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1

    .line 93
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public getRefersTo(Z)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 4
    .param p1, "recursively"    # Z

    .line 106
    if-nez p1, :cond_1

    .line 107
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->refersTo:Lcom/itextpdf/kernel/pdf/PdfObject;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v0

    if-nez v0, :cond_0

    .line 108
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getReader()Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 109
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getReader()Lcom/itextpdf/kernel/pdf/PdfReader;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfReader;->readObject(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->refersTo:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 111
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->refersTo:Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v0

    .line 113
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 114
    .local v1, "currentRefersTo":Lcom/itextpdf/kernel/pdf/PdfObject;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    const/16 v3, 0x1f

    if-ge v2, v3, :cond_2

    .line 115
    instance-of v3, v1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    if-eqz v3, :cond_2

    .line 116
    move-object v3, v1

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v3, v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 114
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 121
    .end local v2    # "i":I
    :cond_2
    return-object v1
.end method

.method public getType()B
    .locals 1

    .line 193
    const/4 v0, 0x5

    return v0
.end method

.method protected getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;
    .locals 1

    .line 265
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 266
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v0

    return-object v0

    .line 268
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 172
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->objNr:I

    .line 173
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->genNr:I

    add-int/2addr v1, v2

    .line 174
    .end local v0    # "result":I
    .local v1, "result":I
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    if-eqz v0, :cond_0

    .line 175
    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->pdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentId()J

    move-result-wide v2

    long-to-int v2, v2

    add-int v1, v0, v2

    .line 177
    :cond_0
    return v1
.end method

.method public isFree()Z
    .locals 1

    .line 225
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v0

    return v0
.end method

.method protected newInstance()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1

    .line 285
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfNull;->PDF_NULL:Lcom/itextpdf/kernel/pdf/PdfNull;

    return-object v0
.end method

.method public setFree()V
    .locals 1

    .line 214
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getXref()Lcom/itextpdf/kernel/pdf/PdfXrefTable;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfXrefTable;->freeReference(Lcom/itextpdf/kernel/pdf/PdfIndirectReference;)V

    .line 215
    return-void
.end method

.method setIndex(J)V
    .locals 0
    .param p1, "index"    # J

    .line 312
    iput-wide p1, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->offsetOrIndex:J

    .line 313
    return-void
.end method

.method setObjStreamNumber(I)V
    .locals 0
    .param p1, "objectStreamNumber"    # I

    .line 308
    iput p1, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->objectStreamNumber:I

    .line 309
    return-void
.end method

.method setOffset(J)V
    .locals 1
    .param p1, "offset"    # J

    .line 316
    iput-wide p1, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->offsetOrIndex:J

    .line 317
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->objectStreamNumber:I

    .line 318
    return-void
.end method

.method protected setRefersTo(Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 0
    .param p1, "refersTo"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 126
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->refersTo:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 127
    return-void
.end method

.method protected setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .param p1, "state"    # S

    .line 304
    invoke-super {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->setState(S)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 230
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 231
    .local v0, "states":Ljava/lang/StringBuilder;
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 232
    const-string v1, "Free; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    :cond_0
    const/16 v1, 0x8

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 235
    const-string v1, "Modified; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    :cond_1
    const/16 v1, 0x20

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 238
    const-string v1, "MustBeFlushed; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    :cond_2
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 241
    const-string v1, "Reading; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    :cond_3
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 244
    const-string v2, "Flushed; "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    :cond_4
    const/16 v2, 0x10

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 247
    const-string v2, "OriginalObjectStream; "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    :cond_5
    const/16 v2, 0x80

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 250
    const-string v2, "ForbidRelease; "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    :cond_6
    const/16 v2, 0x100

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->checkState(S)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 253
    const-string v2, "ReadOnly; "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    :cond_7
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getObjNumber()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    .line 256
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getGenNumber()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    sub-int/2addr v4, v1

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v4}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v2, v3, v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 255
    const-string/jumbo v2, "{0} {1} R{2}"

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
