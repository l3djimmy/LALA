.class public Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree;
.super Lcom/itextpdf/kernel/pdf/GenericNameTree;
.source "PdfStructIdTree.java"


# direct methods
.method constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 0
    .param p1, "pdfDoc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 42
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/GenericNameTree;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 43
    return-void
.end method

.method static synthetic lambda$addEntry$0(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p0, "key"    # Lcom/itextpdf/kernel/pdf/PdfString;
    .param p1, "pdfDoc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 87
    sget-object v0, Lcom/itextpdf/kernel/pdf/IsoKey;->DUPLICATE_ID_ENTRY:Lcom/itextpdf/kernel/pdf/IsoKey;

    invoke-virtual {p1, p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;)V

    return-void
.end method

.method static readFromDictionary(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree;
    .locals 2
    .param p0, "pdfDoc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "dict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 53
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 54
    .local v0, "structIdTree":Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree;
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/GenericNameTree;->readTree(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/util/LinkedHashMap;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree;->setItems(Ljava/util/LinkedHashMap;)V

    .line 55
    return-object v0
.end method


# virtual methods
.method public addEntry(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfString;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 87
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree$$ExternalSyntheticLambda0;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree$$ExternalSyntheticLambda0;-><init>(Lcom/itextpdf/kernel/pdf/PdfString;)V

    invoke-super {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/GenericNameTree;->addEntry(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;Ljava/util/function/Consumer;)V

    .line 88
    return-void
.end method

.method public getStructElemById(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .locals 3
    .param p1, "id"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 65
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree;->getItems()Ljava/util/LinkedHashMap;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 66
    .local v0, "rawObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    if-eqz v1, :cond_0

    .line 67
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 69
    :cond_0
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-eqz v1, :cond_1

    .line 70
    new-instance v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v1

    .line 72
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method

.method public getStructElemById([B)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .locals 1
    .param p1, "id"    # [B

    .line 82
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>([B)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree;->getStructElemById(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    return-object v0
.end method
