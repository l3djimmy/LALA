.class public Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$Lab;
.super Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs;
.source "PdfCieBasedCs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Lab"
.end annotation


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 143
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 144
    return-void
.end method

.method public constructor <init>([F)V
    .locals 3
    .param p1, "whitePoint"    # [F

    .line 147
    invoke-static {}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$Lab;->getInitialPdfArray()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$Lab;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 148
    if-eqz p1, :cond_0

    array-length v0, p1

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 150
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$Lab;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 151
    .local v0, "d":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->WhitePoint:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 152
    return-void

    .line 149
    .end local v0    # "d":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "White point is incorrectly specified."

    invoke-direct {v0, v1, p0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method public constructor <init>([F[F[F)V
    .locals 3
    .param p1, "whitePoint"    # [F
    .param p2, "blackPoint"    # [F
    .param p3, "range"    # [F

    .line 155
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$Lab;-><init>([F)V

    .line 156
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$Lab;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 157
    .local v0, "d":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz p2, :cond_0

    .line 158
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BlackPoint:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2, p2}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 159
    :cond_0
    if-eqz p3, :cond_1

    .line 160
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Range:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2, p3}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 161
    :cond_1
    return-void
.end method

.method private static getInitialPdfArray()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 169
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 170
    .local v0, "tempArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/itextpdf/kernel/pdf/PdfObject;>;"
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Lab:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 172
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Ljava/util/List;)V

    return-object v1
.end method


# virtual methods
.method public getNumberOfComponents()I
    .locals 1

    .line 165
    const/4 v0, 0x3

    return v0
.end method
