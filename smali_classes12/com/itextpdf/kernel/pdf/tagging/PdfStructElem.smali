.class public Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfStructElem.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;",
        "Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 62
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 63
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setForbidRelease()V

    .line 64
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 3
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "role"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 81
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 82
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->StructElem:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 83
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 84
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfPage;)V
    .locals 3
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "role"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p3, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 67
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 69
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Pg:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 70
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)V
    .locals 3
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "role"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p3, "annot"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 73
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 74
    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPage()Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 77
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Pg:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPage()Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 78
    return-void

    .line 75
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Annotation shall have reference to page."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static addKidObject(Lcom/itextpdf/kernel/pdf/PdfDictionary;ILcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 3
    .param p0, "parent"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p1, "index"    # I
    .param p2, "kid"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 527
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isFlushed()Z

    move-result v0

    if-nez v0, :cond_6

    .line 530
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 534
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->K:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 535
    .local v0, "k":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-nez v0, :cond_0

    .line 536
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->K:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_1

    .line 539
    :cond_0
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    if-eqz v1, :cond_1

    .line 540
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    .local v1, "a":Lcom/itextpdf/kernel/pdf/PdfArray;
    goto :goto_0

    .line 542
    .end local v1    # "a":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 543
    .restart local v1    # "a":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 544
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->K:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 546
    :goto_0
    const/4 v2, -0x1

    if-ne p1, v2, :cond_2

    .line 547
    invoke-virtual {v1, p2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    goto :goto_1

    .line 549
    :cond_2
    invoke-virtual {v1, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(ILcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 552
    .end local v1    # "a":Lcom/itextpdf/kernel/pdf/PdfArray;
    :goto_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 553
    instance-of v1, p2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-eqz v1, :cond_4

    move-object v1, p2

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-static {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->isStructElem(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 554
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isIndirect()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 558
    move-object v1, p2

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, p0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 559
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfObject;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_2

    .line 555
    :cond_3
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Structure element dictionary shall be an indirect object in order to have children."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 561
    :cond_4
    :goto_2
    return-void

    .line 531
    .end local v0    # "k":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_5
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "StructureElement shall contain parent object."

    invoke-direct {v0, v1, p0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v0

    .line 528
    :cond_6
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot add kid to the flushed element."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private addKidObjectToStructElemList(Lcom/itextpdf/kernel/pdf/PdfObject;Ljava/util/List;)V
    .locals 1
    .param p1, "k"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;",
            ">;)V"
        }
    .end annotation

    .line 589
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;>;"
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isFlushed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 590
    const/4 v0, 0x0

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 591
    return-void

    .line 594
    :cond_0
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->convertPdfObjectToIPdfStructElem(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 595
    return-void
.end method

.method private convertPdfObjectToIPdfStructElem(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    .locals 4
    .param p1, "obj"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 598
    const/4 v0, 0x0

    .line 599
    .local v0, "elem":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    .line 610
    :sswitch_0
    new-instance v1, Lcom/itextpdf/kernel/pdf/tagging/PdfMcrNumber;

    move-object v2, p1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v1, v2, p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcrNumber;-><init>(Lcom/itextpdf/kernel/pdf/PdfNumber;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    move-object v0, v1

    .line 611
    goto :goto_0

    .line 601
    :sswitch_1
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 602
    .local v1, "d":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-static {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->isStructElem(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 603
    new-instance v2, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-direct {v2, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v2

    goto :goto_0

    .line 604
    :cond_0
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->MCR:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 605
    new-instance v2, Lcom/itextpdf/kernel/pdf/tagging/PdfMcrDictionary;

    invoke-direct {v2, v1, p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcrDictionary;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    move-object v0, v2

    goto :goto_0

    .line 606
    :cond_1
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->OBJR:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 607
    new-instance v2, Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;

    invoke-direct {v2, v1, p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    move-object v0, v2

    .line 616
    .end local v1    # "d":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_2
    :goto_0
    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_1
        0x8 -> :sswitch_0
    .end sparse-switch
.end method

.method private getDocEnsureIndirectForKids()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 3

    .line 580
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    .line 581
    .local v0, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    if-eqz v0, :cond_0

    .line 585
    return-object v0

    .line 582
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Structure element dictionary shall be an indirect object in order to have children."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static isStructElem(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Z
    .locals 2
    .param p0, "dictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 95
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->StructElem:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 96
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 95
    :goto_1
    return v0
.end method

.method private removeKidObject(Lcom/itextpdf/kernel/pdf/PdfObject;)I
    .locals 4
    .param p1, "kid"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 620
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getK()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 621
    .local v0, "k":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v1

    if-nez v1, :cond_0

    if-eq v0, p1, :cond_0

    .line 622
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 626
    :cond_0
    const/4 v1, -0x1

    .line 627
    .local v1, "removedIndex":I
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 628
    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 629
    .local v2, "kidsArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-static {v2, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->removeObjectFromArray(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfObject;)I

    move-result v1

    .line 631
    .end local v2    # "kidsArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_1
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v2

    if-eqz v2, :cond_3

    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 632
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->K:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 633
    const/4 v1, 0x0

    .line 635
    :cond_3
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 637
    return v1

    .line 623
    .end local v1    # "removedIndex":I
    :cond_4
    :goto_0
    const/4 v1, -0x1

    return v1
.end method

.method private static removeObjectFromArray(Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfObject;)I
    .locals 3
    .param p0, "array"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .param p1, "toRemove"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 642
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 643
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 644
    .local v1, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eq v1, p1, :cond_1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    if-ne v1, v2, :cond_0

    goto :goto_1

    .line 642
    .end local v1    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 645
    .restart local v1    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_1
    :goto_1
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->remove(I)V

    .line 646
    nop

    .line 649
    .end local v1    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_2
    return v0
.end method


# virtual methods
.method public addAssociatedFile(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)V
    .locals 1
    .param p1, "fs"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    .line 488
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->addAssociatedFile(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)V

    .line 489
    return-void
.end method

.method public addAssociatedFile(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)V
    .locals 2
    .param p1, "description"    # Ljava/lang/String;
    .param p2, "fs"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    .line 461
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AFRelationship:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    if-nez v0, :cond_0

    .line 462
    const-class v0, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 463
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "For associated files their associated file specification dictionaries shall include the AFRelationship key."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 465
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_0
    if-eqz p1, :cond_1

    .line 466
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->EmbeddedFiles:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getNameTree(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNameTree;

    move-result-object v0

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/itextpdf/kernel/pdf/PdfNameTree;->addEntry(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 468
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 469
    .local v0, "afArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_2

    .line 470
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    move-object v0, v1

    .line 471
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 473
    :cond_2
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 474
    return-void
.end method

.method public addKid(ILcom/itextpdf/kernel/pdf/tagging/PdfMcr;)Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    .locals 2
    .param p1, "index"    # I
    .param p2, "kid"    # Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    .line 211
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getDocEnsureIndirectForKids()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getParentTreeHandler()Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->registerMcr(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;)V

    .line 212
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->addKidObject(Lcom/itextpdf/kernel/pdf/PdfDictionary;ILcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 213
    return-object p2
.end method

.method public addKid(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;)Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    .locals 1
    .param p1, "kid"    # Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    .line 207
    const/4 v0, -0x1

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->addKid(ILcom/itextpdf/kernel/pdf/tagging/PdfMcr;)Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    move-result-object v0

    return-object v0
.end method

.method public addKid(ILcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .locals 2
    .param p1, "index"    # I
    .param p2, "kid"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 202
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->addKidObject(Lcom/itextpdf/kernel/pdf/PdfDictionary;ILcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 203
    return-object p2
.end method

.method public addKid(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .locals 1
    .param p1, "kid"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 198
    const/4 v0, -0x1

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->addKid(ILcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    return-object v0
.end method

.method public addRef(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V
    .locals 4
    .param p1, "ref"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 348
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isIndirect()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 352
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_2_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Ref:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->StructElem:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v0, v1, v2, v3}, Lcom/itextpdf/kernel/pdf/VersionConforming;->validatePdfVersionForDictEntry(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfVersion;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;)Z

    .line 353
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Ref:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 354
    .local v0, "refsArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_0

    .line 355
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    move-object v0, v1

    .line 356
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Ref:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 358
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 359
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 360
    return-void

    .line 349
    .end local v0    # "refsArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Ref array items in structure element dictionary shall be indirect objects."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public flush()V
    .locals 4

    .line 514
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Pg:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 515
    .local v0, "pageDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->isFree()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 516
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Pg:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 519
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    .line 520
    .local v1, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    if-eqz v1, :cond_2

    .line 521
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/kernel/pdf/IsoKey;->TAG_STRUCTURE_ELEMENT:Lcom/itextpdf/kernel/pdf/IsoKey;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->checkIsoConformance(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;)V

    .line 523
    :cond_2
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->flush()V

    .line 524
    return-void
.end method

.method public getActualText()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 137
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ActualText:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getAlt()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 129
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Alt:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getAssociatedFiles(Z)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2
    .param p1, "create"    # Z

    .line 498
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 499
    .local v0, "afArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    .line 500
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    move-object v0, v1

    .line 501
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 503
    :cond_0
    return-object v0
.end method

.method public getAttributes(Z)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2
    .param p1, "createNewIfNull"    # Z

    .line 108
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 109
    .local v0, "attributes":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    .line 110
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    move-object v0, v1

    .line 111
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setAttributes(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 113
    :cond_0
    return-object v0
.end method

.method protected getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 3

    .line 569
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 570
    .local v0, "structDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    .line 571
    .local v1, "indRef":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-nez v1, :cond_0

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 574
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    .line 576
    :cond_0
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    return-object v2
.end method

.method public getE()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 145
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->E:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getK()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2

    .line 317
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->K:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public getKids()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;",
            ">;"
        }
    .end annotation

    .line 301
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getK()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 302
    .local v0, "k":Lcom/itextpdf/kernel/pdf/PdfObject;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 303
    .local v1, "kids":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;>;"
    if-eqz v0, :cond_2

    .line 304
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 305
    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 306
    .local v2, "a":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 307
    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-direct {p0, v4, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->addKidObjectToStructElemList(Lcom/itextpdf/kernel/pdf/PdfObject;Ljava/util/List;)V

    .line 306
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 309
    .end local v2    # "a":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v3    # "i":I
    :cond_0
    goto :goto_1

    .line 310
    :cond_1
    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->addKidObjectToStructElemList(Lcom/itextpdf/kernel/pdf/PdfObject;Ljava/util/List;)V

    .line 313
    :cond_2
    :goto_1
    return-object v1
.end method

.method public getLang()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 121
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Lang:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    .locals 2

    .line 369
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->NS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 370
    .local v0, "nsDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v0, :cond_0

    new-instance v1, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public getParent()Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    .locals 7

    .line 265
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 266
    .local v0, "parent":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 267
    return-object v1

    .line 270
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isFlushed()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 271
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    .line 272
    .local v2, "pdfDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    if-nez v2, :cond_1

    .line 273
    return-object v1

    .line 275
    :cond_1
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v1

    .line 276
    .local v1, "structTreeRoot":Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    if-ne v3, v0, :cond_2

    move-object v3, v1

    goto :goto_0

    :cond_2
    new-instance v3, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-direct {v3, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    :goto_0
    return-object v3

    .line 279
    .end local v1    # "structTreeRoot":Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;
    .end local v2    # "pdfDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :cond_3
    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->isStructElem(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 280
    new-instance v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v1

    .line 282
    :cond_4
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    .line 283
    .restart local v2    # "pdfDoc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_5

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->StructTreeRoot:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    move v5, v3

    goto :goto_1

    :cond_5
    move v5, v4

    .line 284
    .local v5, "parentIsRoot":Z
    :goto_1
    if-nez v5, :cond_7

    if-eqz v2, :cond_6

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    if-ne v6, v0, :cond_6

    goto :goto_2

    :cond_6
    move v3, v4

    .line 285
    .end local v5    # "parentIsRoot":Z
    .local v3, "parentIsRoot":Z
    :cond_7
    :goto_2
    if-eqz v3, :cond_8

    .line 286
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v1

    return-object v1

    .line 288
    :cond_8
    return-object v1
.end method

.method public getPhoneme()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 413
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Phoneme:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getPhoneticAlphabet()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 445
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->PhoneticAlphabet:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method public getRefsList()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;",
            ">;"
        }
    .end annotation

    .line 327
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Ref:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 328
    .local v0, "refsArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_0

    .line 329
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    return-object v1

    .line 331
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 332
    .local v1, "refs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 333
    new-instance v3, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 332
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 335
    .end local v2    # "i":I
    :cond_1
    return-object v1
.end method

.method public getRole()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 190
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method public getStructureElementId()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 158
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ID:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 565
    const/4 v0, 0x1

    return v0
.end method

.method public put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 507
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 508
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 509
    return-object p0
.end method

.method public removeKid(Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;)I
    .locals 3
    .param p1, "kid"    # Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    .line 247
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    if-eqz v0, :cond_1

    .line 248
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    .line 249
    .local v0, "mcr":Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    .line 250
    .local v1, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    if-eqz v1, :cond_0

    .line 251
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getParentTreeHandler()Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->unregisterMcr(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;)V

    .line 253
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->removeKidObject(Lcom/itextpdf/kernel/pdf/PdfObject;)I

    move-result v2

    return v2

    .line 254
    .end local v0    # "mcr":Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;
    .end local v1    # "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :cond_1
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    if-eqz v0, :cond_2

    .line 255
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->removeKidObject(Lcom/itextpdf/kernel/pdf/PdfObject;)I

    move-result v0

    return v0

    .line 257
    :cond_2
    const/4 v0, -0x1

    return v0
.end method

.method public removeKid(I)Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    .locals 1
    .param p1, "index"    # I

    .line 217
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->removeKid(IZ)Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v0

    return-object v0
.end method

.method public removeKid(IZ)Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    .locals 5
    .param p1, "index"    # I
    .param p2, "prepareForReAdding"    # Z

    .line 221
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getK()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 222
    .local v0, "k":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v1

    if-nez v1, :cond_0

    if-nez p1, :cond_4

    .line 226
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 227
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 228
    .local v1, "kidsArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 229
    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->remove(I)V

    .line 230
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 231
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->K:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 233
    .end local v1    # "kidsArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_1
    goto :goto_0

    .line 234
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->K:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 236
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 238
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->convertPdfObjectToIPdfStructElem(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    move-result-object v1

    .line 239
    .local v1, "removedKid":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v2

    .line 240
    .local v2, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    instance-of v3, v1, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    if-eqz v3, :cond_3

    if-eqz v2, :cond_3

    if-nez p2, :cond_3

    .line 241
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getParentTreeHandler()Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;

    move-result-object v3

    move-object v4, v1

    check-cast v4, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/tagging/ParentTreeHandler;->unregisterMcr(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;)V

    .line 243
    :cond_3
    return-object v1

    .line 223
    .end local v1    # "removedKid":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    .end local v2    # "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :cond_4
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v1
.end method

.method public setActualText(Lcom/itextpdf/kernel/pdf/PdfString;)V
    .locals 1
    .param p1, "actualText"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 141
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->ActualText:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 142
    return-void
.end method

.method public setAlt(Lcom/itextpdf/kernel/pdf/PdfString;)V
    .locals 1
    .param p1, "alt"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 133
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Alt:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 134
    return-void
.end method

.method public setAttributes(Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 1
    .param p1, "attributes"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 117
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 118
    return-void
.end method

.method public setE(Lcom/itextpdf/kernel/pdf/PdfString;)V
    .locals 1
    .param p1, "e"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 149
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->E:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 150
    return-void
.end method

.method public setLang(Lcom/itextpdf/kernel/pdf/PdfString;)V
    .locals 1
    .param p1, "lang"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 125
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Lang:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 126
    return-void
.end method

.method public setNamespace(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)V
    .locals 4
    .param p1, "namespace"    # Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 382
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_2_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->NS:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->StructElem:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v0, v1, v2, v3}, Lcom/itextpdf/kernel/pdf/VersionConforming;->validatePdfVersionForDictEntry(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfVersion;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;)Z

    .line 383
    if-eqz p1, :cond_0

    .line 384
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->NS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    goto :goto_0

    .line 386
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->NS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 387
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 389
    :goto_0
    return-void
.end method

.method public setPhoneme(Lcom/itextpdf/kernel/pdf/PdfString;)V
    .locals 4
    .param p1, "elementPhoneme"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 401
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_2_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Phoneme:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->StructElem:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v0, v1, v2, v3}, Lcom/itextpdf/kernel/pdf/VersionConforming;->validatePdfVersionForDictEntry(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfVersion;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;)Z

    .line 402
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Phoneme:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 403
    return-void
.end method

.method public setPhoneticAlphabet(Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 4
    .param p1, "phoneticAlphabet"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 433
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_2_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->PhoneticAlphabet:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->StructElem:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v0, v1, v2, v3}, Lcom/itextpdf/kernel/pdf/VersionConforming;->validatePdfVersionForDictEntry(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfVersion;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;)Z

    .line 434
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PhoneticAlphabet:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 435
    return-void
.end method

.method public setRole(Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 1
    .param p1, "role"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 194
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 195
    return-void
.end method

.method public setStructureElementId(Lcom/itextpdf/kernel/pdf/PdfString;)V
    .locals 4
    .param p1, "id"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 168
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getIdTree()Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree;

    move-result-object v0

    .line 169
    .local v0, "idTree":Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree;
    if-nez p1, :cond_1

    .line 170
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ID:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 171
    .local v1, "orig":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v2, v1, Lcom/itextpdf/kernel/pdf/PdfString;

    if-eqz v2, :cond_0

    .line 172
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree;->removeEntry(Lcom/itextpdf/kernel/pdf/PdfString;)V

    .line 174
    .end local v1    # "orig":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_0
    goto :goto_0

    .line 175
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ID:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 176
    .restart local v1    # "orig":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfString;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 178
    return-void

    .line 180
    :cond_2
    instance-of v2, v1, Lcom/itextpdf/kernel/pdf/PdfString;

    if-eqz v2, :cond_3

    .line 181
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree;->removeEntry(Lcom/itextpdf/kernel/pdf/PdfString;)V

    .line 183
    :cond_3
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, p1, v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructIdTree;->addEntry(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 184
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->ID:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 186
    .end local v1    # "orig":Lcom/itextpdf/kernel/pdf/PdfObject;
    :goto_0
    return-void
.end method
