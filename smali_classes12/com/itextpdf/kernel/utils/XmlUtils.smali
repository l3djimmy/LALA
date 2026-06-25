.class final Lcom/itextpdf/kernel/utils/XmlUtils;
.super Ljava/lang/Object;
.source "XmlUtils.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static compareXmls(Ljava/io/InputStream;Ljava/io/InputStream;)Z
    .locals 4
    .param p0, "xml1"    # Ljava/io/InputStream;
    .param p1, "xml2"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 50
    const/4 v0, 0x1

    invoke-static {v0, v0}, Lcom/itextpdf/kernel/utils/XmlProcessorCreator;->createSafeDocumentBuilder(ZZ)Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 52
    .local v0, "db":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v0, p0}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v1

    .line 53
    .local v1, "doc1":Lorg/w3c/dom/Document;
    invoke-interface {v1}, Lorg/w3c/dom/Document;->normalizeDocument()V

    .line 55
    invoke-virtual {v0, p1}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v2

    .line 56
    .local v2, "doc2":Lorg/w3c/dom/Document;
    invoke-interface {v2}, Lorg/w3c/dom/Document;->normalizeDocument()V

    .line 58
    invoke-interface {v2, v1}, Lorg/w3c/dom/Document;->isEqualNode(Lorg/w3c/dom/Node;)Z

    move-result v3

    return v3
.end method

.method public static initNewXmlDocument()Lorg/w3c/dom/Document;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;
        }
    .end annotation

    .line 62
    const/4 v0, 0x0

    invoke-static {v0, v0}, Lcom/itextpdf/kernel/utils/XmlProcessorCreator;->createSafeDocumentBuilder(ZZ)Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 63
    .local v0, "db":Ljavax/xml/parsers/DocumentBuilder;
    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v1

    return-object v1
.end method

.method public static writeXmlDocToStream(Lorg/w3c/dom/Document;Ljava/io/OutputStream;)V
    .locals 3
    .param p0, "xmlReport"    # Lorg/w3c/dom/Document;
    .param p1, "stream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/transform/TransformerException;
        }
    .end annotation

    .line 40
    invoke-static {}, Lcom/itextpdf/kernel/utils/XmlProcessorCreator;->createSafeTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v0

    .line 41
    .local v0, "transformer":Ljavax/xml/transform/Transformer;
    const-string v1, "indent"

    const-string/jumbo v2, "yes"

    invoke-virtual {v0, v1, v2}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    const-string/jumbo v1, "{http://xml.apache.org/xslt}indent-amount"

    const-string v2, "0"

    invoke-virtual {v0, v1, v2}, Ljavax/xml/transform/Transformer;->setOutputProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    new-instance v1, Ljavax/xml/transform/dom/DOMSource;

    invoke-direct {v1, p0}, Ljavax/xml/transform/dom/DOMSource;-><init>(Lorg/w3c/dom/Node;)V

    .line 44
    .local v1, "source":Ljavax/xml/transform/dom/DOMSource;
    new-instance v2, Ljavax/xml/transform/stream/StreamResult;

    invoke-direct {v2, p1}, Ljavax/xml/transform/stream/StreamResult;-><init>(Ljava/io/OutputStream;)V

    .line 45
    .local v2, "result":Ljavax/xml/transform/stream/StreamResult;
    invoke-virtual {v0, v1, v2}, Ljavax/xml/transform/Transformer;->transform(Ljavax/xml/transform/Source;Ljavax/xml/transform/Result;)V

    .line 46
    return-void
.end method
