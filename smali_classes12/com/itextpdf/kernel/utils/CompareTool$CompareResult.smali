.class public Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;
.super Ljava/lang/Object;
.source "CompareTool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/utils/CompareTool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CompareResult"
.end annotation


# instance fields
.field protected differences:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected messageLimit:I


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "messageLimit"    # I

    .line 1973
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1965
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->differences:Ljava/util/Map;

    .line 1966
    const/4 v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->messageLimit:I

    .line 1974
    iput p1, p0, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->messageLimit:I

    .line 1975
    return-void
.end method


# virtual methods
.method protected addError(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    .param p2, "message"    # Ljava/lang/String;

    .line 2056
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->differences:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    iget v1, p0, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->messageLimit:I

    if-ge v0, v1, :cond_0

    .line 2057
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->differences:Ljava/util/Map;

    new-instance v1, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;-><init>(Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;)V

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2059
    :cond_0
    return-void
.end method

.method public getDifferences()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 2019
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->differences:Ljava/util/Map;

    return-object v0
.end method

.method public getErrorCount()I
    .locals 1

    .line 1992
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->differences:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public getReport()Ljava/lang/String;
    .locals 8

    .line 2001
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 2002
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x1

    .line 2003
    .local v1, "firstEntry":Z
    iget-object v2, p0, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->differences:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 2004
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;>;"
    const-string v4, "\n"

    if-nez v1, :cond_0

    .line 2005
    const-string v5, "-----------------------------"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2006
    :cond_0
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;

    .line 2007
    .local v5, "diffPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v5}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2008
    const/4 v1, 0x0

    .line 2009
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;>;"
    .end local v5    # "diffPath":Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;
    goto :goto_0

    .line 2010
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method protected isMessageLimitReached()Z
    .locals 2

    .line 2052
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->differences:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    iget v1, p0, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->messageLimit:I

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isOk()Z
    .locals 1

    .line 1983
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->differences:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public writeReportToXml(Ljava/io/OutputStream;)V
    .locals 8
    .param p1, "stream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;,
            Ljavax/xml/transform/TransformerException;
        }
    .end annotation

    .line 2032
    invoke-static {}, Lcom/itextpdf/io/util/XmlUtil;->initNewXmlDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    .line 2033
    .local v0, "xmlReport":Lorg/w3c/dom/Document;
    const-string/jumbo v1, "report"

    invoke-interface {v0, v1}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 2034
    .local v1, "root":Lorg/w3c/dom/Element;
    const-string v2, "errors"

    invoke-interface {v0, v2}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 2035
    .local v2, "errors":Lorg/w3c/dom/Element;
    iget-object v3, p0, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->differences:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "count"

    invoke-interface {v2, v4, v3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 2036
    invoke-interface {v1, v2}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2037
    iget-object v3, p0, Lcom/itextpdf/kernel/utils/CompareTool$CompareResult;->differences:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 2038
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;>;"
    const-string v5, "error"

    invoke-interface {v0, v5}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v5

    .line 2039
    .local v5, "errorNode":Lorg/w3c/dom/Node;
    const-string v6, "message"

    invoke-interface {v0, v6}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v6

    .line 2040
    .local v6, "message":Lorg/w3c/dom/Node;
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v0, v7}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/w3c/dom/Node;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2041
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;

    invoke-virtual {v7, v0}, Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;->toXmlNode(Lorg/w3c/dom/Document;)Lorg/w3c/dom/Node;

    move-result-object v7

    .line 2042
    .local v7, "path":Lorg/w3c/dom/Node;
    invoke-interface {v5, v6}, Lorg/w3c/dom/Node;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2043
    invoke-interface {v5, v7}, Lorg/w3c/dom/Node;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2044
    invoke-interface {v2, v5}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2045
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/kernel/utils/objectpathitems/ObjectPath;Ljava/lang/String;>;"
    .end local v5    # "errorNode":Lorg/w3c/dom/Node;
    .end local v6    # "message":Lorg/w3c/dom/Node;
    .end local v7    # "path":Lorg/w3c/dom/Node;
    goto :goto_0

    .line 2046
    :cond_0
    invoke-interface {v0, v1}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 2048
    invoke-static {v0, p1}, Lcom/itextpdf/kernel/utils/XmlUtils;->writeXmlDocToStream(Lorg/w3c/dom/Document;Ljava/io/OutputStream;)V

    .line 2049
    return-void
.end method
