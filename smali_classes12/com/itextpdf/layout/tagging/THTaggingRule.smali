.class Lcom/itextpdf/layout/tagging/THTaggingRule;
.super Ljava/lang/Object;
.source "THTaggingRule.java"

# interfaces
.implements Lcom/itextpdf/layout/tagging/ITaggingRule;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    return-void
.end method


# virtual methods
.method public onTagFinish(Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z
    .locals 6
    .param p1, "taggingHelper"    # Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .param p2, "taggingHintKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 58
    invoke-virtual {p2}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 61
    invoke-virtual {p2}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getAttributesList()Ljava/util/List;

    move-result-object v0

    .line 63
    .local v0, "attributesList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    .line 64
    .local v2, "attributes":Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Scope:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v4

    .line 67
    .local v4, "scopeValue":Lcom/itextpdf/kernel/pdf/PdfName;
    if-eqz v4, :cond_0

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->None:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v4}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 68
    return v3

    .line 70
    :cond_0
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->None:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v4}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 71
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Scope:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;->removeAttribute(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    .line 72
    return v3

    .line 74
    .end local v2    # "attributes":Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;
    .end local v4    # "scopeValue":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_1
    goto :goto_0

    .line 75
    :cond_2
    invoke-virtual {p2}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getTagPointer()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v1

    if-nez v1, :cond_3

    .line 76
    return v3

    .line 79
    :cond_3
    invoke-virtual {p2}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v1

    .line 80
    .local v1, "properties":Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    new-instance v2, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    const-string v4, "Table"

    invoke-direct {v2, v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;-><init>(Ljava/lang/String;)V

    .line 81
    .local v2, "atr":Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Scope:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Column:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;->addEnumAttribute(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    .line 82
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->addAttributes(Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    .line 83
    invoke-virtual {p2}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getTagPointer()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->applyProperties(Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;)V

    .line 84
    return v3

    .line 59
    .end local v0    # "attributesList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;>;"
    .end local v1    # "properties":Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .end local v2    # "atr":Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "TaggingHintKey should have accessibility properties"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
