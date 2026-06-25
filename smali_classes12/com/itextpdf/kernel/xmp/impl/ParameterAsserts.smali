.class Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;
.super Ljava/lang/Object;
.source "ParameterAsserts.java"

# interfaces
.implements Lcom/itextpdf/kernel/xmp/XMPConst;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method

.method public static assertArrayName(Ljava/lang/String;)V
    .locals 3
    .param p0, "arrayName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 60
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 64
    return-void

    .line 62
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Empty array name"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public static assertImplementation(Lcom/itextpdf/kernel/xmp/XMPMeta;)V
    .locals 3
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 163
    const/4 v0, 0x4

    if-eqz p0, :cond_1

    .line 168
    instance-of v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    if-eqz v1, :cond_0

    .line 173
    return-void

    .line 170
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "The XMPMeta-object is not compatible with this implementation"

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 165
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Parameter must not be null"

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method public static assertNotNull(Ljava/lang/Object;)V
    .locals 3
    .param p0, "param"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 144
    const/4 v0, 0x4

    if-eqz p0, :cond_2

    .line 148
    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_1

    move-object v1, p0

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 150
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Parameter must not be null or empty"

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 152
    :cond_1
    :goto_0
    return-void

    .line 146
    :cond_2
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Parameter must not be null"

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method public static assertPrefix(Ljava/lang/String;)V
    .locals 3
    .param p0, "prefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 102
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 106
    return-void

    .line 104
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Empty prefix"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public static assertPropName(Ljava/lang/String;)V
    .locals 3
    .param p0, "propName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 74
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 78
    return-void

    .line 76
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Empty property name"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public static assertSchemaNS(Ljava/lang/String;)V
    .locals 3
    .param p0, "schemaNS"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 88
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 92
    return-void

    .line 90
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Empty schema namespace URI"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public static assertSpecificLang(Ljava/lang/String;)V
    .locals 3
    .param p0, "specificLang"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 116
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 120
    return-void

    .line 118
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Empty specific language"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public static assertStructName(Ljava/lang/String;)V
    .locals 3
    .param p0, "structName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 130
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 134
    return-void

    .line 132
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Empty array name"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method
