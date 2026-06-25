.class public Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfNamespace.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "dictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 52
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 53
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->setForbidRelease()V

    .line 54
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfString;)V
    .locals 2
    .param p1, "namespaceName"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 71
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 72
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Namespace:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 73
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->NS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 74
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "namespaceName"    # Ljava/lang/String;

    .line 62
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;-><init>(Lcom/itextpdf/kernel/pdf/PdfString;)V

    .line 63
    return-void
.end method

.method private getNamespaceRoleMap(Z)Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2
    .param p1, "createIfNotExist"    # Z

    .line 195
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->RoleMapNS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 196
    .local v0, "roleMapNs":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz p1, :cond_0

    if-nez v0, :cond_0

    .line 197
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    move-object v0, v1

    .line 198
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->RoleMapNS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 200
    :cond_0
    return-object v0
.end method

.method private logOverwritingOfMappingIfNeeded(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 4
    .param p1, "thisNsRole"    # Ljava/lang/String;
    .param p2, "prevVal"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 204
    if-eqz p2, :cond_1

    .line 205
    const-class v0, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 206
    .local v0, "logger":Lorg/slf4j/Logger;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getNamespaceName()Ljava/lang/String;

    move-result-object v1

    .line 207
    .local v1, "nsNameStr":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 208
    const-string/jumbo v1, "this"

    .line 210
    :cond_0
    const-string v2, "Existing mapping for {0} in {1} namespace was overwritten."

    filled-new-array {p1, v1}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 213
    .end local v0    # "logger":Lorg/slf4j/Logger;
    .end local v1    # "nsNameStr":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 189
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 190
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 191
    return-object p0
.end method


# virtual methods
.method public addNamespaceRoleMapping(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    .locals 3
    .param p1, "thisNsRole"    # Ljava/lang/String;
    .param p2, "defaultNsRole"    # Ljava/lang/String;

    .line 159
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getNamespaceRoleMap(Z)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->convertRoleToPdfName(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-static {p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->convertRoleToPdfName(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 160
    .local v0, "prevVal":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->logOverwritingOfMappingIfNeeded(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 161
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 162
    return-object p0
.end method

.method public addNamespaceRoleMapping(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    .locals 3
    .param p1, "thisNsRole"    # Ljava/lang/String;
    .param p2, "targetNsRole"    # Ljava/lang/String;
    .param p3, "targetNs"    # Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 174
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 175
    .local v0, "targetMapping":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-static {p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->convertRoleToPdfName(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 176
    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 177
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getNamespaceRoleMap(Z)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->convertRoleToPdfName(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 178
    .local v1, "prevVal":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-direct {p0, p1, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->logOverwritingOfMappingIfNeeded(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 179
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 180
    return-object p0
.end method

.method public getNamespaceName()Ljava/lang/String;
    .locals 2

    .line 102
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->NS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    .line 103
    .local v0, "ns":Lcom/itextpdf/kernel/pdf/PdfString;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfString;->toUnicodeString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public getNamespaceRoleMap()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 1

    .line 148
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getNamespaceRoleMap(Z)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getSchema()Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .locals 2

    .line 120
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Schema:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 121
    .local v0, "schemaObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->wrapFileSpecObject(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    move-result-object v1

    return-object v1
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 185
    const/4 v0, 0x1

    return v0
.end method

.method public setNamespaceName(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    .locals 1
    .param p1, "namespaceName"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 93
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->NS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v0

    return-object v0
.end method

.method public setNamespaceName(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    .locals 1
    .param p1, "namespaceName"    # Ljava/lang/String;

    .line 83
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->setNamespaceName(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v0

    return-object v0
.end method

.method public setNamespaceRoleMap(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    .locals 1
    .param p1, "roleMapNs"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 135
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->RoleMapNS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v0

    return-object v0
.end method

.method public setSchema(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    .locals 2
    .param p1, "fileSpec"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    .line 112
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Schema:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v0

    return-object v0
.end method
