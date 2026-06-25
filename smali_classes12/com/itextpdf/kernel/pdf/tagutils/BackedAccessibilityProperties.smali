.class Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;
.super Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
.source "BackedAccessibilityProperties.java"


# instance fields
.field private final pointerToBackingElem:Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;


# direct methods
.method constructor <init>(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)V
    .locals 1
    .param p1, "pointerToBackingElem"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 45
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;-><init>()V

    .line 46
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->pointerToBackingElem:Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 47
    return-void
.end method

.method private getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .locals 1

    .line 221
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->pointerToBackingElem:Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    return-object v0
.end method

.method private toUnicodeString(Lcom/itextpdf/kernel/pdf/PdfString;)Ljava/lang/String;
    .locals 1
    .param p1, "pdfString"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 225
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfString;->toUnicodeString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method


# virtual methods
.method public addAttributes(ILcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 4
    .param p1, "index"    # I
    .param p2, "attributes"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    .line 110
    if-nez p2, :cond_0

    .line 111
    return-object p0

    .line 114
    :cond_0
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getAttributes(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 116
    .local v0, "attributesObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    nop

    .line 117
    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 118
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v2

    .line 116
    invoke-static {v0, p1, v1, v2}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityPropertiesToStructElem;->combineAttributesList(Lcom/itextpdf/kernel/pdf/PdfObject;ILjava/util/List;Lcom/itextpdf/kernel/pdf/PdfNumber;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 119
    .local v1, "combinedAttributes":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setAttributes(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 120
    return-object p0
.end method

.method public addAttributes(Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 1
    .param p1, "attributes"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    .line 106
    const/4 v0, -0x1

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->addAttributes(ILcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v0

    return-object v0
.end method

.method public addRef(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 2
    .param p1, "treePointer"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 182
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getCurrentStructElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->addRef(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 183
    return-object p0
.end method

.method public clearAttributes()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 2

    .line 125
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 126
    return-object p0
.end method

.method public clearRefs()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 2

    .line 216
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Ref:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 217
    return-object p0
.end method

.method public getActualText()Ljava/lang/String;
    .locals 1

    .line 73
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getActualText()Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->toUnicodeString(Lcom/itextpdf/kernel/pdf/PdfString;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAlternateDescription()Ljava/lang/String;
    .locals 1

    .line 84
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getAlt()Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->toUnicodeString(Lcom/itextpdf/kernel/pdf/PdfString;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAttributesList()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;",
            ">;"
        }
    .end annotation

    .line 131
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 132
    .local v0, "attributesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;>;"
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getAttributes(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 133
    .local v1, "elemAttributesObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v1, :cond_2

    .line 134
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 135
    new-instance v2, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    move-object v3, v1

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 136
    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 137
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 138
    .local v2, "attributesArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 139
    .local v4, "attributeObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 140
    new-instance v5, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    move-object v6, v4

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 142
    .end local v4    # "attributeObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_1
    goto :goto_0

    .line 145
    .end local v2    # "attributesArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_2
    :goto_1
    return-object v0
.end method

.method public getExpansion()Ljava/lang/String;
    .locals 1

    .line 95
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getE()Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->toUnicodeString(Lcom/itextpdf/kernel/pdf/PdfString;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLanguage()Ljava/lang/String;
    .locals 1

    .line 62
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getLang()Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->toUnicodeString(Lcom/itextpdf/kernel/pdf/PdfString;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    .locals 1

    .line 177
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v0

    return-object v0
.end method

.method public getPhoneme()Ljava/lang/String;
    .locals 1

    .line 156
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPhoneme()Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->toUnicodeString(Lcom/itextpdf/kernel/pdf/PdfString;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPhoneticAlphabet()Ljava/lang/String;
    .locals 1

    .line 167
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPhoneticAlphabet()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRefsList()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;",
            ">;"
        }
    .end annotation

    .line 188
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 189
    .local v0, "refsList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;>;"
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getRefsList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 190
    .local v2, "ref":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    new-instance v3, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->pointerToBackingElem:Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v4

    invoke-direct {v3, v2, v4}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    .end local v2    # "ref":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    goto :goto_0

    .line 192
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public getRole()Ljava/lang/String;
    .locals 1

    .line 51
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getRole()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStructureElementId()[B
    .locals 2

    .line 200
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getStructureElementId()Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    .line 201
    .local v0, "value":Lcom/itextpdf/kernel/pdf/PdfString;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfString;->getValueBytes()[B

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method public setActualText(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 3
    .param p1, "actualText"    # Ljava/lang/String;

    .line 78
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v2, "UnicodeBig"

    invoke-direct {v1, p1, v2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setActualText(Lcom/itextpdf/kernel/pdf/PdfString;)V

    .line 79
    return-object p0
.end method

.method public setAlternateDescription(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 3
    .param p1, "alternateDescription"    # Ljava/lang/String;

    .line 89
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v2, "UnicodeBig"

    invoke-direct {v1, p1, v2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setAlt(Lcom/itextpdf/kernel/pdf/PdfString;)V

    .line 90
    return-object p0
.end method

.method public setExpansion(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 3
    .param p1, "expansion"    # Ljava/lang/String;

    .line 100
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v2, "UnicodeBig"

    invoke-direct {v1, p1, v2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setE(Lcom/itextpdf/kernel/pdf/PdfString;)V

    .line 101
    return-object p0
.end method

.method public setLanguage(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 3
    .param p1, "language"    # Ljava/lang/String;

    .line 67
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v2, "UnicodeBig"

    invoke-direct {v1, p1, v2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setLang(Lcom/itextpdf/kernel/pdf/PdfString;)V

    .line 68
    return-object p0
.end method

.method public setNamespace(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 1
    .param p1, "namespace"    # Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 171
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setNamespace(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)V

    .line 172
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->pointerToBackingElem:Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getContext()Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->ensureNamespaceRegistered(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)V

    .line 173
    return-object p0
.end method

.method public setPhoneme(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 2
    .param p1, "phoneme"    # Ljava/lang/String;

    .line 150
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setPhoneme(Lcom/itextpdf/kernel/pdf/PdfString;)V

    .line 151
    return-object p0
.end method

.method public setPhoneticAlphabet(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 2
    .param p1, "phoneticAlphabet"    # Ljava/lang/String;

    .line 161
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->convertRoleToPdfName(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setPhoneticAlphabet(Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 162
    return-object p0
.end method

.method public setRole(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 2
    .param p1, "role"    # Ljava/lang/String;

    .line 56
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->convertRoleToPdfName(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setRole(Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 57
    return-object p0
.end method

.method public setStructureElementId([B)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 2
    .param p1, "id"    # [B

    .line 209
    if-nez p1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>([B)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfString;->setHexWriting(Z)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    .line 210
    .local v0, "value":Lcom/itextpdf/kernel/pdf/PdfString;
    :goto_0
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/tagutils/BackedAccessibilityProperties;->getBackingElem()Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->setStructureElementId(Lcom/itextpdf/kernel/pdf/PdfString;)V

    .line 211
    return-object p0
.end method
