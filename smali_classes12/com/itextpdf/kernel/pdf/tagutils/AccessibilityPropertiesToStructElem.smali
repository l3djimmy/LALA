.class final Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityPropertiesToStructElem;
.super Ljava/lang/Object;
.source "AccessibilityPropertiesToStructElem.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addNewAttributesToAttributesArray(ILjava/util/List;Lcom/itextpdf/kernel/pdf/PdfNumber;Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 4
    .param p0, "insertIndex"    # I
    .param p2, "revision"    # Lcom/itextpdf/kernel/pdf/PdfNumber;
    .param p3, "attributesArray"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfNumber;",
            "Lcom/itextpdf/kernel/pdf/PdfArray;",
            ")V"
        }
    .end annotation

    .line 116
    .local p1, "newAttributesList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;>;"
    if-gez p0, :cond_0

    .line 117
    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result p0

    .line 119
    :cond_0
    if-eqz p2, :cond_2

    .line 120
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    .line 121
    .local v1, "attributes":Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;
    add-int/lit8 v2, p0, 0x1

    .end local p0    # "insertIndex":I
    .local v2, "insertIndex":I
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {p3, p0, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(ILcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 122
    add-int/lit8 p0, v2, 0x1

    .end local v2    # "insertIndex":I
    .restart local p0    # "insertIndex":I
    invoke-virtual {p3, v2, p2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(ILcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 123
    .end local v1    # "attributes":Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;
    goto :goto_0

    :cond_1
    goto :goto_2

    .line 125
    :cond_2
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    .line 126
    .local v1, "newAttribute":Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;
    add-int/lit8 v2, p0, 0x1

    .end local p0    # "insertIndex":I
    .restart local v2    # "insertIndex":I
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {p3, p0, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(ILcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 127
    .end local v1    # "newAttribute":Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;
    move p0, v2

    goto :goto_1

    .line 129
    .end local v2    # "insertIndex":I
    .restart local p0    # "insertIndex":I
    :cond_3
    :goto_2
    return-void
.end method

.method static apply(Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V
    .locals 3
    .param p0, "properties"    # Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .param p1, "elem"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 39
    invoke-static {p0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityPropertiesToStructElem;->setTextualAids(Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 40
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getAttributesList()Ljava/util/List;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityPropertiesToStructElem;->setAttributes(Ljava/util/List;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 42
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 43
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setNamespace(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)V

    .line 45
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getStructureElementId()[B

    move-result-object v0

    if-eqz v0, :cond_1

    .line 46
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getStructureElementId()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>([B)V

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setStructureElementId(Lcom/itextpdf/kernel/pdf/PdfString;)V

    .line 48
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getRefsList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 49
    .local v1, "ref":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->addRef(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 50
    .end local v1    # "ref":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    goto :goto_0

    .line 51
    :cond_2
    return-void
.end method

.method static combineAttributesList(Lcom/itextpdf/kernel/pdf/PdfObject;ILjava/util/List;Lcom/itextpdf/kernel/pdf/PdfNumber;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2
    .param p0, "attributesObject"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p1, "insertIndex"    # I
    .param p3, "revision"    # Lcom/itextpdf/kernel/pdf/PdfNumber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            "I",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfNumber;",
            ")",
            "Lcom/itextpdf/kernel/pdf/PdfObject;"
        }
    .end annotation

    .line 56
    .local p2, "newAttributesList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;>;"
    instance-of v0, p0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-eqz v0, :cond_0

    .line 57
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 58
    .local v0, "combinedAttributesArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 59
    invoke-static {p1, p2, p3, v0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityPropertiesToStructElem;->addNewAttributesToAttributesArray(ILjava/util/List;Lcom/itextpdf/kernel/pdf/PdfNumber;Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 60
    nop

    .line 61
    .local v0, "combinedAttributes":Lcom/itextpdf/kernel/pdf/PdfObject;
    goto :goto_0

    .end local v0    # "combinedAttributes":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_0
    instance-of v0, p0, Lcom/itextpdf/kernel/pdf/PdfArray;

    if-eqz v0, :cond_1

    .line 62
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 63
    .local v0, "combinedAttributesArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-static {p1, p2, p3, v0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityPropertiesToStructElem;->addNewAttributesToAttributesArray(ILjava/util/List;Lcom/itextpdf/kernel/pdf/PdfNumber;Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 64
    nop

    .line 65
    .local v0, "combinedAttributes":Lcom/itextpdf/kernel/pdf/PdfObject;
    goto :goto_0

    .line 66
    .end local v0    # "combinedAttributes":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    .line 67
    if-gtz p1, :cond_2

    .line 70
    const/4 v0, 0x0

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .restart local v0    # "combinedAttributes":Lcom/itextpdf/kernel/pdf/PdfObject;
    goto :goto_0

    .line 68
    .end local v0    # "combinedAttributes":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_2
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 72
    :cond_3
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 73
    .restart local v0    # "combinedAttributes":Lcom/itextpdf/kernel/pdf/PdfObject;
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-static {p1, p2, p3, v1}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityPropertiesToStructElem;->addNewAttributesToAttributesArray(ILjava/util/List;Lcom/itextpdf/kernel/pdf/PdfNumber;Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 77
    :goto_0
    return-object v0
.end method

.method private static setAttributes(Ljava/util/List;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V
    .locals 3
    .param p1, "elem"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;",
            ")V"
        }
    .end annotation

    .line 82
    .local p0, "newAttributesList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 83
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getAttributes(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 85
    .local v0, "attributesObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    nop

    .line 89
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v1

    .line 85
    const/4 v2, -0x1

    invoke-static {v0, v2, p0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityPropertiesToStructElem;->combineAttributesList(Lcom/itextpdf/kernel/pdf/PdfObject;ILjava/util/List;Lcom/itextpdf/kernel/pdf/PdfNumber;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 90
    .local v1, "combinedAttributes":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setAttributes(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 92
    .end local v0    # "attributesObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v1    # "combinedAttributes":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_0
    return-void
.end method

.method private static setTextualAids(Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V
    .locals 3
    .param p0, "properties"    # Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .param p1, "elem"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 95
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getLanguage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "UnicodeBig"

    if-eqz v0, :cond_0

    .line 96
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setLang(Lcom/itextpdf/kernel/pdf/PdfString;)V

    .line 98
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getActualText()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 99
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getActualText()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setActualText(Lcom/itextpdf/kernel/pdf/PdfString;)V

    .line 101
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getAlternateDescription()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 102
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getAlternateDescription()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setAlt(Lcom/itextpdf/kernel/pdf/PdfString;)V

    .line 104
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getExpansion()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 105
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getExpansion()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setE(Lcom/itextpdf/kernel/pdf/PdfString;)V

    .line 107
    :cond_3
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getPhoneme()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 108
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getPhoneme()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setPhoneme(Lcom/itextpdf/kernel/pdf/PdfString;)V

    .line 110
    :cond_4
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getPhoneticAlphabet()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 111
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getPhoneticAlphabet()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setPhoneticAlphabet(Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 113
    :cond_5
    return-void
.end method
