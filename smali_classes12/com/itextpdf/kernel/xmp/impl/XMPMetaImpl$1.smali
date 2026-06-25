.class Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl$1;
.super Ljava/lang/Object;
.source "XMPMetaImpl.java"

# interfaces
.implements Lcom/itextpdf/kernel/xmp/properties/XMPProperty;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

.field final synthetic val$itemNode:Lcom/itextpdf/kernel/xmp/impl/XMPNode;


# direct methods
.method constructor <init>(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 0
    .param p1, "this$0"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    .line 383
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl$1;->this$0:Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    iput-object p2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl$1;->val$itemNode:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getLanguage()Ljava/lang/String;
    .locals 2

    .line 398
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl$1;->val$itemNode:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .locals 1

    .line 392
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl$1;->val$itemNode:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .line 386
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl$1;->val$itemNode:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 404
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl$1;->val$itemNode:Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
