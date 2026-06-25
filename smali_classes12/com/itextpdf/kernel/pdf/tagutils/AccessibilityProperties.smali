.class public abstract Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
.super Ljava/lang/Object;
.source "AccessibilityProperties.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addAttributes(ILcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 0
    .param p1, "index"    # I
    .param p2, "attributes"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    .line 298
    return-object p0
.end method

.method public addAttributes(Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 0
    .param p1, "attributes"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    .line 282
    return-object p0
.end method

.method public addRef(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 0
    .param p1, "treePointer"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 247
    return-object p0
.end method

.method public clearAttributes()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 0

    .line 307
    return-object p0
.end method

.method public clearRefs()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 0

    .line 271
    return-object p0
.end method

.method public getActualText()Ljava/lang/String;
    .locals 1

    .line 104
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAlternateDescription()Ljava/lang/String;
    .locals 1

    .line 124
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAttributesList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;",
            ">;"
        }
    .end annotation

    .line 316
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getExpansion()Ljava/lang/String;
    .locals 1

    .line 147
    const/4 v0, 0x0

    return-object v0
.end method

.method public getLanguage()Ljava/lang/String;
    .locals 1

    .line 81
    const/4 v0, 0x0

    return-object v0
.end method

.method public getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    .locals 1

    .line 222
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPhoneme()Ljava/lang/String;
    .locals 1

    .line 173
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPhoneticAlphabet()Ljava/lang/String;
    .locals 1

    .line 199
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRefsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;",
            ">;"
        }
    .end annotation

    .line 259
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getRole()Ljava/lang/String;
    .locals 1

    .line 50
    const/4 v0, 0x0

    return-object v0
.end method

.method public getStructureElementId()[B
    .locals 1

    .line 328
    const/4 v0, 0x0

    return-object v0
.end method

.method public setActualText(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 0
    .param p1, "actualText"    # Ljava/lang/String;

    .line 115
    return-object p0
.end method

.method public setAlternateDescription(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 0
    .param p1, "alternateDescription"    # Ljava/lang/String;

    .line 135
    return-object p0
.end method

.method public setExpansion(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 0
    .param p1, "expansion"    # Ljava/lang/String;

    .line 161
    return-object p0
.end method

.method public setLanguage(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 0
    .param p1, "language"    # Ljava/lang/String;

    .line 95
    return-object p0
.end method

.method public setNamespace(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 0
    .param p1, "namespace"    # Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 233
    return-object p0
.end method

.method public setPhoneme(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 0
    .param p1, "phoneme"    # Ljava/lang/String;

    .line 187
    return-object p0
.end method

.method public setPhoneticAlphabet(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 0
    .param p1, "phoneticAlphabet"    # Ljava/lang/String;

    .line 213
    return-object p0
.end method

.method public setRole(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 0
    .param p1, "role"    # Ljava/lang/String;

    .line 69
    return-object p0
.end method

.method public setStructureElementId([B)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 0
    .param p1, "id"    # [B

    .line 342
    return-object p0
.end method

.method public setStructureElementIdString(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 1
    .param p1, "id"    # Ljava/lang/String;

    .line 358
    if-nez p1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->setStructureElementId([B)Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v0

    return-object v0
.end method
