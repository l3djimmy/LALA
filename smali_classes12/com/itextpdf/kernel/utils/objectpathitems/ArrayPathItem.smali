.class public final Lcom/itextpdf/kernel/utils/objectpathitems/ArrayPathItem;
.super Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;
.source "ArrayPathItem.java"


# instance fields
.field private final index:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "index"    # I

    .line 44
    invoke-direct {p0}, Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;-><init>()V

    .line 45
    iput p1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ArrayPathItem;->index:I

    .line 46
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;

    .line 60
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ArrayPathItem;->index:I

    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/utils/objectpathitems/ArrayPathItem;

    iget v1, v1, Lcom/itextpdf/kernel/utils/objectpathitems/ArrayPathItem;->index:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getIndex()I
    .locals 1

    .line 70
    iget v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ArrayPathItem;->index:I

    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 55
    iget v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ArrayPathItem;->index:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Array index: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ArrayPathItem;->index:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected toXmlNode(Lorg/w3c/dom/Document;)Lorg/w3c/dom/Node;
    .locals 2
    .param p1, "document"    # Lorg/w3c/dom/Document;

    .line 75
    const-string v0, "arrayIndex"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 76
    .local v0, "element":Lorg/w3c/dom/Element;
    iget v1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/ArrayPathItem;->index:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 77
    return-object v0
.end method
