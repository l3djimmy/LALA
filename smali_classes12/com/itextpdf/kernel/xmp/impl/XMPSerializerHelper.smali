.class public Lcom/itextpdf/kernel/xmp/impl/XMPSerializerHelper;
.super Ljava/lang/Object;
.source "XMPSerializerHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static serialize(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Ljava/io/OutputStream;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)V
    .locals 1
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .param p1, "output"    # Ljava/io/OutputStream;
    .param p2, "options"    # Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 63
    if-eqz p2, :cond_0

    move-object v0, p2

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;-><init>()V

    .line 66
    .end local p2    # "options":Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .local v0, "options":Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getSort()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 68
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->sort()V

    .line 70
    :cond_1
    new-instance p2, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;

    invoke-direct {p2}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;-><init>()V

    invoke-virtual {p2, p0, p1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serialize(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/io/OutputStream;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)V

    .line 71
    return-void
.end method

.method public static serializeToBuffer(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)[B
    .locals 2
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .param p1, "options"    # Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 119
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v1, 0x800

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 120
    .local v0, "out":Ljava/io/ByteArrayOutputStream;
    invoke-static {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerHelper;->serialize(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Ljava/io/OutputStream;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)V

    .line 121
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method public static serializeToString(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)Ljava/lang/String;
    .locals 3
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .param p1, "options"    # Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 89
    if-eqz p1, :cond_0

    move-object v0, p1

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;-><init>()V

    .line 90
    .end local p1    # "options":Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .local v0, "options":Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    :goto_0
    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->setEncodeUTF16BE(Z)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    .line 92
    new-instance p1, Ljava/io/ByteArrayOutputStream;

    const/16 v1, 0x800

    invoke-direct {p1, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 93
    .local p1, "output":Ljava/io/ByteArrayOutputStream;
    invoke-static {p0, p1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerHelper;->serialize(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Ljava/io/OutputStream;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)V

    .line 97
    :try_start_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getEncoding()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 99
    :catch_0
    move-exception v1

    .line 103
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
