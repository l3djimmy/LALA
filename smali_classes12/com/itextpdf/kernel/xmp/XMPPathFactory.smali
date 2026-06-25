.class public final Lcom/itextpdf/kernel/xmp/XMPPathFactory;
.super Ljava/lang/Object;
.source "XMPPathFactory.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    return-void
.end method

.method private static assertFieldNS(Ljava/lang/String;)V
    .locals 3
    .param p0, "fieldNS"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 290
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 295
    return-void

    .line 292
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Empty field namespace URI"

    const/16 v2, 0x65

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static assertFieldName(Ljava/lang/String;)V
    .locals 3
    .param p0, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 305
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 309
    return-void

    .line 307
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Empty f name"

    const/16 v2, 0x66

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static assertQualNS(Ljava/lang/String;)V
    .locals 3
    .param p0, "qualNS"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 261
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 266
    return-void

    .line 263
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Empty qualifier namespace URI"

    const/16 v2, 0x65

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static assertQualName(Ljava/lang/String;)V
    .locals 3
    .param p0, "qualName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 276
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 280
    return-void

    .line 278
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Empty qualifier name"

    const/16 v2, 0x66

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public static composeArrayItemPath(Ljava/lang/String;I)Ljava/lang/String;
    .locals 3
    .param p0, "arrayName"    # Ljava/lang/String;
    .param p1, "itemIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 105
    if-lez p1, :cond_0

    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 109
    :cond_0
    const/4 v0, -0x1

    if-ne p1, v0, :cond_1

    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "[last()]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 115
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Array index must be larger than zero"

    const/16 v2, 0x68

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public static composeFieldSelector(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "arrayName"    # Ljava/lang/String;
    .param p1, "fieldNS"    # Ljava/lang/String;
    .param p2, "fieldName"    # Ljava/lang/String;
    .param p3, "fieldValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 243
    invoke-static {p1, p2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object v0

    .line 244
    .local v0, "fieldPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->size()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    .line 249
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x5b

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\"]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 246
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "The fieldName name must be simple"

    const/16 v3, 0x66

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method public static composeLangSelector(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "arrayName"    # Ljava/lang/String;
    .param p1, "langName"    # Ljava/lang/String;

    .line 204
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "[?xml:lang=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/Utils;->normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\"]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static composeQualifierPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "qualNS"    # Ljava/lang/String;
    .param p1, "qualName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 166
    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/XMPPathFactory;->assertQualNS(Ljava/lang/String;)V

    .line 167
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/XMPPathFactory;->assertQualName(Ljava/lang/String;)V

    .line 169
    invoke-static {p0, p1}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object v0

    .line 170
    .local v0, "qualPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->size()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    .line 175
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 172
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "The qualifier name must be simple"

    const/16 v3, 0x66

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method public static composeStructFieldPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "fieldNS"    # Ljava/lang/String;
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 137
    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/XMPPathFactory;->assertFieldNS(Ljava/lang/String;)V

    .line 138
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/XMPPathFactory;->assertFieldName(Ljava/lang/String;)V

    .line 140
    invoke-static {p0, p1}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object v0

    .line 141
    .local v0, "fieldPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->size()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    .line 146
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 143
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "The field name must be simple"

    const/16 v3, 0x66

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method
