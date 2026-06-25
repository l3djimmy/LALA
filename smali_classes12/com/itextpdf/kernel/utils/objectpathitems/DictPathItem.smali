.class public final Lcom/itextpdf/kernel/utils/objectpathitems/DictPathItem;
.super Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;
.source "DictPathItem.java"


# instance fields
.field private final key:Lcom/itextpdf/kernel/pdf/PdfName;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 0
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 45
    invoke-direct {p0}, Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/DictPathItem;->key:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 47
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;

    .line 61
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/DictPathItem;->key:Lcom/itextpdf/kernel/pdf/PdfName;

    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/utils/objectpathitems/DictPathItem;

    iget-object v1, v1, Lcom/itextpdf/kernel/utils/objectpathitems/DictPathItem;->key:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getKey()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/DictPathItem;->key:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/DictPathItem;->key:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfName;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Dict key: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/DictPathItem;->key:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected toXmlNode(Lorg/w3c/dom/Document;)Lorg/w3c/dom/Node;
    .locals 2
    .param p1, "document"    # Lorg/w3c/dom/Document;

    .line 77
    const-string v0, "dictKey"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 78
    .local v0, "element":Lorg/w3c/dom/Element;
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/DictPathItem;->key:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfName;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 79
    return-object v0
.end method
