.class Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator$1;
.super Ljava/lang/Object;
.source "XMPIteratorImpl.java"

# interfaces
.implements Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;->createPropertyInfo(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPPropertyInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;

.field final synthetic val$baseNS:Ljava/lang/String;

.field final synthetic val$node:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

.field final synthetic val$path:Ljava/lang/String;

.field final synthetic val$value:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;

    .line 472
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator$1;->this$1:Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator;

    iput-object p2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator$1;->val$node:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    iput-object p3, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator$1;->val$baseNS:Ljava/lang/String;

    iput-object p4, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator$1;->val$path:Ljava/lang/String;

    iput-object p5, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator$1;->val$value:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getLanguage()Ljava/lang/String;
    .locals 1

    .line 505
    const/4 v0, 0x0

    return-object v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 3

    .line 475
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator$1;->val$node:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isSchemaNode()Z

    move-result v0

    if-nez v0, :cond_0

    .line 478
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/QName;

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator$1;->val$node:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/xmp/impl/QName;-><init>(Ljava/lang/String;)V

    .line 479
    .local v0, "qname":Lcom/itextpdf/kernel/xmp/impl/QName;
    invoke-static {}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->getSchemaRegistry()Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;

    move-result-object v1

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/QName;->getPrefix()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;->getNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 483
    .end local v0    # "qname":Lcom/itextpdf/kernel/xmp/impl/QName;
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator$1;->val$baseNS:Ljava/lang/String;

    return-object v0
.end method

.method public getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .locals 1

    .line 499
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator$1;->val$node:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .line 489
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator$1;->val$path:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .line 494
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPIteratorImpl$NodeIterator$1;->val$value:Ljava/lang/String;

    return-object v0
.end method
