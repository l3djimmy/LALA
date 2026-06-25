.class public final Lcom/itextpdf/kernel/utils/XmlProcessorCreator;
.super Ljava/lang/Object;
.source "XmlProcessorCreator.java"


# static fields
.field private static xmlParserFactory:Lcom/itextpdf/kernel/utils/IXmlParserFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 37
    new-instance v0, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/utils/XmlProcessorCreator;->xmlParserFactory:Lcom/itextpdf/kernel/utils/IXmlParserFactory;

    .line 38
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    return-void
.end method

.method public static createSafeDocumentBuilder(ZZ)Ljavax/xml/parsers/DocumentBuilder;
    .locals 1
    .param p0, "namespaceAware"    # Z
    .param p1, "ignoringComments"    # Z

    .line 77
    sget-object v0, Lcom/itextpdf/kernel/utils/XmlProcessorCreator;->xmlParserFactory:Lcom/itextpdf/kernel/utils/IXmlParserFactory;

    invoke-interface {v0, p0, p1}, Lcom/itextpdf/kernel/utils/IXmlParserFactory;->createDocumentBuilderInstance(ZZ)Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    return-object v0
.end method

.method public static createSafeTransformer()Ljavax/xml/transform/Transformer;
    .locals 1

    .line 106
    sget-object v0, Lcom/itextpdf/kernel/utils/XmlProcessorCreator;->xmlParserFactory:Lcom/itextpdf/kernel/utils/IXmlParserFactory;

    invoke-interface {v0}, Lcom/itextpdf/kernel/utils/IXmlParserFactory;->createTransformerInstance()Ljavax/xml/transform/Transformer;

    move-result-object v0

    return-object v0
.end method

.method public static createSafeXMLReader(ZZ)Lorg/xml/sax/XMLReader;
    .locals 1
    .param p0, "namespaceAware"    # Z
    .param p1, "validating"    # Z

    .line 93
    sget-object v0, Lcom/itextpdf/kernel/utils/XmlProcessorCreator;->xmlParserFactory:Lcom/itextpdf/kernel/utils/IXmlParserFactory;

    invoke-interface {v0, p0, p1}, Lcom/itextpdf/kernel/utils/IXmlParserFactory;->createXMLReaderInstance(ZZ)Lorg/xml/sax/XMLReader;

    move-result-object v0

    return-object v0
.end method

.method public static setXmlParserFactory(Lcom/itextpdf/kernel/utils/IXmlParserFactory;)V
    .locals 1
    .param p0, "factory"    # Lcom/itextpdf/kernel/utils/IXmlParserFactory;

    .line 57
    if-nez p0, :cond_0

    .line 58
    new-instance v0, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;

    invoke-direct {v0}, Lcom/itextpdf/kernel/utils/DefaultSafeXmlParserFactory;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/utils/XmlProcessorCreator;->xmlParserFactory:Lcom/itextpdf/kernel/utils/IXmlParserFactory;

    goto :goto_0

    .line 60
    :cond_0
    sput-object p0, Lcom/itextpdf/kernel/utils/XmlProcessorCreator;->xmlParserFactory:Lcom/itextpdf/kernel/utils/IXmlParserFactory;

    .line 62
    :goto_0
    return-void
.end method
