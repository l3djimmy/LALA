.class public Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;
.super Ljava/lang/Object;
.source "DefaultSafeXmlParserFactory.java"

# interfaces
.implements Lcom/itextpdf/kernel/utils/IXmlParserFactory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory$SafeEmptyEntityResolver;
    }
.end annotation


# static fields
.field private static final DISALLOW_DOCTYPE_DECL:Ljava/lang/String; = "http://apache.org/xml/features/disallow-doctype-decl"

.field private static final EXTERNAL_GENERAL_ENTITIES:Ljava/lang/String; = "http://xml.org/sax/features/external-general-entities"

.field private static final EXTERNAL_PARAMETER_ENTITIES:Ljava/lang/String; = "http://xml.org/sax/features/external-parameter-entities"

.field private static final LOAD_EXTERNAL_DTD:Ljava/lang/String; = "http://apache.org/xml/features/nonvalidating/load-external-dtd"

.field private static final LOGGER:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 55
    const-class v0, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    return-void
.end method

.method private tryToSetFeature(Ljavax/xml/parsers/DocumentBuilderFactory;Ljava/lang/String;Z)V
    .locals 4
    .param p1, "factory"    # Ljavax/xml/parsers/DocumentBuilderFactory;
    .param p2, "feature"    # Ljava/lang/String;
    .param p3, "value"    # Z

    .line 203
    :try_start_0
    invoke-virtual {p1, p2, p3}, Ljavax/xml/parsers/DocumentBuilderFactory;->setFeature(Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 207
    goto :goto_0

    .line 204
    :catch_0
    move-exception v0

    .line 205
    .local v0, "e":Ljavax/xml/parsers/ParserConfigurationException;
    sget-object v1, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;->LOGGER:Lorg/slf4j/Logger;

    .line 206
    invoke-virtual {v0}, Ljavax/xml/parsers/ParserConfigurationException;->getMessage()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2, p2}, [Ljava/lang/Object;

    move-result-object v2

    const-string v3, "Exception was thrown: {0}. The feature {1} is probably not supported by your XML processor."

    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 205
    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 208
    .end local v0    # "e":Ljavax/xml/parsers/ParserConfigurationException;
    :goto_0
    return-void
.end method

.method private tryToSetFeature(Ljavax/xml/parsers/SAXParserFactory;Ljava/lang/String;Z)V
    .locals 4
    .param p1, "factory"    # Ljavax/xml/parsers/SAXParserFactory;
    .param p2, "feature"    # Ljava/lang/String;
    .param p3, "value"    # Z

    .line 212
    :try_start_0
    invoke-virtual {p1, p2, p3}, Ljavax/xml/parsers/SAXParserFactory;->setFeature(Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/xml/sax/SAXNotRecognizedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/xml/sax/SAXNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 216
    goto :goto_1

    .line 213
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0

    :catch_2
    move-exception v0

    .line 214
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    sget-object v1, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;->LOGGER:Lorg/slf4j/Logger;

    .line 215
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2, p2}, [Ljava/lang/Object;

    move-result-object v2

    const-string v3, "Exception was thrown: {0}. The feature {1} is probably not supported by your XML processor."

    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 214
    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 217
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    return-void
.end method


# virtual methods
.method protected configureSafeDocumentBuilderFactory(Ljavax/xml/parsers/DocumentBuilderFactory;)V
    .locals 2
    .param p1, "factory"    # Ljavax/xml/parsers/DocumentBuilderFactory;

    .line 168
    const-string v0, "http://apache.org/xml/features/disallow-doctype-decl"

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;->tryToSetFeature(Ljavax/xml/parsers/DocumentBuilderFactory;Ljava/lang/String;Z)V

    .line 169
    const-string v0, "http://xml.org/sax/features/external-general-entities"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;->tryToSetFeature(Ljavax/xml/parsers/DocumentBuilderFactory;Ljava/lang/String;Z)V

    .line 170
    const-string v0, "http://xml.org/sax/features/external-parameter-entities"

    invoke-direct {p0, p1, v0, v1}, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;->tryToSetFeature(Ljavax/xml/parsers/DocumentBuilderFactory;Ljava/lang/String;Z)V

    .line 171
    const-string v0, "http://apache.org/xml/features/nonvalidating/load-external-dtd"

    invoke-direct {p0, p1, v0, v1}, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;->tryToSetFeature(Ljavax/xml/parsers/DocumentBuilderFactory;Ljava/lang/String;Z)V

    .line 173
    invoke-virtual {p1, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setXIncludeAware(Z)V

    .line 174
    invoke-virtual {p1, v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setExpandEntityReferences(Z)V

    .line 175
    return-void
.end method

.method protected configureSafeSAXParserFactory(Ljavax/xml/parsers/SAXParserFactory;)V
    .locals 2
    .param p1, "factory"    # Ljavax/xml/parsers/SAXParserFactory;

    .line 183
    const-string v0, "http://apache.org/xml/features/disallow-doctype-decl"

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;->tryToSetFeature(Ljavax/xml/parsers/SAXParserFactory;Ljava/lang/String;Z)V

    .line 184
    const-string v0, "http://xml.org/sax/features/external-general-entities"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;->tryToSetFeature(Ljavax/xml/parsers/SAXParserFactory;Ljava/lang/String;Z)V

    .line 185
    const-string v0, "http://xml.org/sax/features/external-parameter-entities"

    invoke-direct {p0, p1, v0, v1}, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;->tryToSetFeature(Ljavax/xml/parsers/SAXParserFactory;Ljava/lang/String;Z)V

    .line 186
    const-string v0, "http://apache.org/xml/features/nonvalidating/load-external-dtd"

    invoke-direct {p0, p1, v0, v1}, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;->tryToSetFeature(Ljavax/xml/parsers/SAXParserFactory;Ljava/lang/String;Z)V

    .line 188
    invoke-virtual {p1, v1}, Ljavax/xml/parsers/SAXParserFactory;->setXIncludeAware(Z)V

    .line 189
    return-void
.end method

.method protected configureSafeTransformerFactory(Ljavax/xml/transform/TransformerFactory;)V
    .locals 2
    .param p1, "factory"    # Ljavax/xml/transform/TransformerFactory;

    .line 197
    const-string v0, "http://javax.xml.XMLConstants/property/accessExternalDTD"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Ljavax/xml/transform/TransformerFactory;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 198
    const-string v0, "http://javax.xml.XMLConstants/property/accessExternalStylesheet"

    invoke-virtual {p1, v0, v1}, Ljavax/xml/transform/TransformerFactory;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 199
    return-void
.end method

.method protected createDocumentBuilderFactory()Ljavax/xml/parsers/DocumentBuilderFactory;
    .locals 1

    .line 150
    invoke-static {}, Lcom/itextpdf/io/util/XmlUtil;->getDocumentBuilderFactory()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v0

    return-object v0
.end method

.method public createDocumentBuilderInstance(ZZ)Ljavax/xml/parsers/DocumentBuilder;
    .locals 4
    .param p1, "namespaceAware"    # Z
    .param p2, "ignoringComments"    # Z

    .line 100
    invoke-virtual {p0}, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;->createDocumentBuilderFactory()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v0

    .line 101
    .local v0, "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;->configureSafeDocumentBuilderFactory(Ljavax/xml/parsers/DocumentBuilderFactory;)V

    .line 102
    invoke-virtual {v0, p1}, Ljavax/xml/parsers/DocumentBuilderFactory;->setNamespaceAware(Z)V

    .line 103
    invoke-virtual {v0, p2}, Ljavax/xml/parsers/DocumentBuilderFactory;->setIgnoringComments(Z)V

    .line 106
    :try_start_0
    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v1
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    .local v1, "db":Ljavax/xml/parsers/DocumentBuilder;
    nop

    .line 110
    new-instance v2, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory$SafeEmptyEntityResolver;

    invoke-direct {v2}, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory$SafeEmptyEntityResolver;-><init>()V

    invoke-virtual {v1, v2}, Ljavax/xml/parsers/DocumentBuilder;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V

    .line 111
    return-object v1

    .line 107
    .end local v1    # "db":Ljavax/xml/parsers/DocumentBuilder;
    :catch_0
    move-exception v1

    .line 108
    .local v1, "e":Ljavax/xml/parsers/ParserConfigurationException;
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    invoke-virtual {v1}, Ljavax/xml/parsers/ParserConfigurationException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected createSAXParserFactory()Ljavax/xml/parsers/SAXParserFactory;
    .locals 1

    .line 159
    invoke-static {}, Lcom/itextpdf/io/util/XmlUtil;->createSAXParserFactory()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v0

    return-object v0
.end method

.method public createTransformerInstance()Ljavax/xml/transform/Transformer;
    .locals 4

    .line 133
    invoke-static {}, Ljavax/xml/transform/TransformerFactory;->newInstance()Ljavax/xml/transform/TransformerFactory;

    move-result-object v0

    .line 134
    .local v0, "factory":Ljavax/xml/transform/TransformerFactory;
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;->configureSafeTransformerFactory(Ljavax/xml/transform/TransformerFactory;)V

    .line 137
    :try_start_0
    invoke-virtual {v0}, Ljavax/xml/transform/TransformerFactory;->newTransformer()Ljavax/xml/transform/Transformer;

    move-result-object v1
    :try_end_0
    .catch Ljavax/xml/transform/TransformerConfigurationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    .local v1, "transformer":Ljavax/xml/transform/Transformer;
    nop

    .line 141
    return-object v1

    .line 138
    .end local v1    # "transformer":Ljavax/xml/transform/Transformer;
    :catch_0
    move-exception v1

    .line 139
    .local v1, "e":Ljavax/xml/transform/TransformerConfigurationException;
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    invoke-virtual {v1}, Ljavax/xml/transform/TransformerConfigurationException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public createXMLReaderInstance(ZZ)Lorg/xml/sax/XMLReader;
    .locals 4
    .param p1, "namespaceAware"    # Z
    .param p2, "validating"    # Z

    .line 116
    invoke-virtual {p0}, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;->createSAXParserFactory()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v0

    .line 117
    .local v0, "factory":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v0, p1}, Ljavax/xml/parsers/SAXParserFactory;->setNamespaceAware(Z)V

    .line 118
    invoke-virtual {v0, p2}, Ljavax/xml/parsers/SAXParserFactory;->setValidating(Z)V

    .line 119
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;->configureSafeSAXParserFactory(Ljavax/xml/parsers/SAXParserFactory;)V

    .line 122
    :try_start_0
    invoke-virtual {v0}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v1

    .line 123
    .local v1, "saxParser":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v1}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v2
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    .end local v1    # "saxParser":Ljavax/xml/parsers/SAXParser;
    .local v2, "xmlReader":Lorg/xml/sax/XMLReader;
    nop

    .line 127
    new-instance v1, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory$SafeEmptyEntityResolver;

    invoke-direct {v1}, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory$SafeEmptyEntityResolver;-><init>()V

    invoke-interface {v2, v1}, Lorg/xml/sax/XMLReader;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V

    .line 128
    return-object v2

    .line 124
    .end local v2    # "xmlReader":Lorg/xml/sax/XMLReader;
    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    .line 125
    .local v1, "e":Ljava/lang/Exception;
    :goto_0
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method
