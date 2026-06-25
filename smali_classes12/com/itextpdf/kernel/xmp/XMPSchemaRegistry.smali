.class public interface abstract Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;
.super Ljava/lang/Object;
.source "XMPSchemaRegistry.java"


# virtual methods
.method public abstract deleteNamespace(Ljava/lang/String;)V
.end method

.method public abstract findAlias(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;
.end method

.method public abstract findAliases(Ljava/lang/String;)[Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;
.end method

.method public abstract getAliases()Ljava/util/Map;
.end method

.method public abstract getNamespacePrefix(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getNamespaceURI(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getNamespaces()Ljava/util/Map;
.end method

.method public abstract getPrefixes()Ljava/util/Map;
.end method

.method public abstract registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation
.end method

.method public abstract resolveAlias(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;
.end method
