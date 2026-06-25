.class public final Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;
.super Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
.source "TrailerPath.java"


# static fields
.field private static final INITIAL_LINE:Ljava/lang/String; = "Base cmp object: trailer. Base out object: trailer"


# instance fields
.field private final cmpDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

.field private final outDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 0
    .param p1, "cmpDoc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "outDoc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 39
    invoke-direct {p0}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;-><init>()V

    .line 40
    iput-object p2, p0, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->outDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 41
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->cmpDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 42
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/util/Stack;)V
    .locals 0
    .param p1, "cmpDoc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "outDoc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            "Ljava/util/Stack<",
            "Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;",
            ">;)V"
        }
    .end annotation

    .line 53
    .local p3, "path":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;>;"
    invoke-direct {p0}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;-><init>()V

    .line 54
    iput-object p2, p0, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->outDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 55
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->cmpDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 56
    iput-object p3, p0, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->path:Ljava/util/Stack;

    .line 57
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;)V
    .locals 1
    .param p1, "trailerPath"    # Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;

    .line 45
    invoke-direct {p0}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;-><init>()V

    .line 46
    invoke-virtual {p1}, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->getOutDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->outDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 47
    invoke-virtual {p1}, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->getCmpDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->cmpDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 48
    invoke-virtual {p1}, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->getLocalPath()Ljava/util/Stack;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->path:Ljava/util/Stack;

    .line 49
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .line 134
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 135
    return v0

    .line 138
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->outDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-object v2, p1

    check-cast v2, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;

    iget-object v2, v2, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->outDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 139
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->cmpDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-object v2, p1

    check-cast v2, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;

    iget-object v2, v2, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->cmpDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 140
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->path:Ljava/util/Stack;

    move-object v2, p1

    check-cast v2, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;

    iget-object v2, v2, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->path:Ljava/util/Stack;

    .line 141
    invoke-virtual {v1, v2}, Ljava/util/Stack;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    nop

    .line 138
    :goto_0
    return v0
.end method

.method public getCmpDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->cmpDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    return-object v0
.end method

.method public getOutDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->outDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 119
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->outDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->cmpDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 120
    .local v0, "hashCode":I
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->path:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;

    .line 121
    .local v2, "pathItem":Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;
    mul-int/lit8 v0, v0, 0x1f

    .line 122
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int/2addr v0, v3

    .line 123
    .end local v2    # "pathItem":Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;
    goto :goto_0

    .line 124
    :cond_0
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Base cmp object: trailer. Base out object: trailer"

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 104
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->path:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;

    .line 106
    .local v2, "pathItem":Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;
    const/16 v3, 0xa

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 107
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .end local v2    # "pathItem":Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;
    goto :goto_0

    .line 109
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public toXmlNode(Lorg/w3c/dom/Document;)Lorg/w3c/dom/Node;
    .locals 5
    .param p1, "document"    # Lorg/w3c/dom/Document;

    .line 85
    const-string/jumbo v0, "path"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 86
    .local v0, "element":Lorg/w3c/dom/Element;
    const-string v1, "base"

    invoke-interface {p1, v1}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 87
    .local v1, "baseNode":Lorg/w3c/dom/Element;
    const-string v2, "cmp"

    const-string/jumbo v3, "trailer"

    invoke-interface {v1, v2, v3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    const-string/jumbo v2, "out"

    invoke-interface {v1, v2, v3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 90
    iget-object v2, p0, Lcom/itextpdf/kernel/utils/objectpathitems/TrailerPath;->path:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;

    .line 91
    .local v3, "pathItem":Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;
    invoke-virtual {v3, p1}, Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;->toXmlNode(Lorg/w3c/dom/Document;)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v0, v4}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 92
    .end local v3    # "pathItem":Lcom/itextpdf/kernel/utils/objectpathitems/LocalPathItem;
    goto :goto_0

    .line 93
    :cond_0
    return-object v0
.end method
