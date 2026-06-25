.class public Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;
.super Ljava/lang/Object;
.source "XMPMetaParser.java"


# static fields
.field private static final XMP_RDF:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 65
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->XMP_RDF:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    return-void
.end method

.method private static findRootNode(Lorg/w3c/dom/Node;Z[Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 6
    .param p0, "root"    # Lorg/w3c/dom/Node;
    .param p1, "xmpmetaRequired"    # Z
    .param p2, "result"    # [Ljava/lang/Object;

    .line 329
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 330
    .local v0, "children":Lorg/w3c/dom/NodeList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_6

    .line 332
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object p0

    .line 333
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v2

    const/4 v3, 0x7

    if-ne v3, v2, :cond_0

    move-object v2, p0

    check-cast v2, Lorg/w3c/dom/ProcessingInstruction;

    .line 334
    invoke-interface {v2}, Lorg/w3c/dom/ProcessingInstruction;->getTarget()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v4, "xpacket"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 338
    if-eqz p2, :cond_5

    .line 340
    move-object v2, p0

    check-cast v2, Lorg/w3c/dom/ProcessingInstruction;

    invoke-interface {v2}, Lorg/w3c/dom/ProcessingInstruction;->getData()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, p2, v3

    goto :goto_1

    .line 343
    :cond_0
    const/4 v2, 0x3

    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v4

    if-eq v2, v4, :cond_5

    .line 344
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v2

    if-eq v3, v2, :cond_5

    .line 346
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    .line 347
    .local v2, "rootNS":Ljava/lang/String;
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v3

    .line 348
    .local v3, "rootLocal":Ljava/lang/String;
    nop

    .line 350
    const-string/jumbo v4, "xmpmeta"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x0

    if-nez v4, :cond_1

    .line 351
    const-string/jumbo v4, "xapmeta"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    :cond_1
    nop

    .line 353
    const-string v4, "adobe:ns:meta/"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 357
    invoke-static {p0, v5, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->findRootNode(Lorg/w3c/dom/Node;Z[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    return-object v4

    .line 359
    :cond_2
    if-nez p1, :cond_4

    .line 360
    const-string v4, "RDF"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 361
    const-string v4, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 363
    if-eqz p2, :cond_3

    .line 365
    aput-object p0, p2, v5

    .line 366
    sget-object v4, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->XMP_RDF:Ljava/lang/Object;

    const/4 v5, 0x1

    aput-object v4, p2, v5

    .line 368
    :cond_3
    return-object p2

    .line 373
    :cond_4
    invoke-static {p0, p1, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->findRootNode(Lorg/w3c/dom/Node;Z[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    .line 374
    .local v4, "newResult":[Ljava/lang/Object;
    if-eqz v4, :cond_5

    .line 376
    return-object v4

    .line 330
    .end local v2    # "rootNS":Ljava/lang/String;
    .end local v3    # "rootLocal":Ljava/lang/String;
    .end local v4    # "newResult":[Ljava/lang/Object;
    :cond_5
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 387
    .end local v1    # "i":I
    :cond_6
    const/4 v1, 0x0

    return-object v1
.end method

.method public static parse(Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lcom/itextpdf/kernel/xmp/XMPMeta;
    .locals 5
    .param p0, "input"    # Ljava/lang/Object;
    .param p1, "options"    # Lcom/itextpdf/kernel/xmp/options/ParseOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 89
    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertNotNull(Ljava/lang/Object;)V

    .line 90
    if-eqz p1, :cond_0

    move-object v0, p1

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/options/ParseOptions;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;-><init>()V

    .line 92
    .end local p1    # "options":Lcom/itextpdf/kernel/xmp/options/ParseOptions;
    .local v0, "options":Lcom/itextpdf/kernel/xmp/options/ParseOptions;
    :goto_0
    invoke-static {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->parseXml(Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lorg/w3c/dom/Document;

    move-result-object p1

    .line 94
    .local p1, "document":Lorg/w3c/dom/Document;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->getRequireXMPMeta()Z

    move-result v1

    .line 95
    .local v1, "xmpmetaRequired":Z
    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    .line 96
    .local v2, "result":[Ljava/lang/Object;
    invoke-static {p1, v1, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->findRootNode(Lorg/w3c/dom/Node;Z[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    .line 98
    if-eqz v2, :cond_2

    const/4 v3, 0x1

    aget-object v3, v2, v3

    sget-object v4, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->XMP_RDF:Ljava/lang/Object;

    if-ne v3, v4, :cond_2

    .line 100
    const/4 v3, 0x0

    aget-object v3, v2, v3

    check-cast v3, Lorg/w3c/dom/Node;

    invoke-static {v3}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->parse(Lorg/w3c/dom/Node;)Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    move-result-object v3

    .line 101
    .local v3, "xmp":Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    const/4 v4, 0x2

    aget-object v4, v2, v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setPacketHeader(Ljava/lang/String;)V

    .line 104
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->getOmitNormalization()Z

    move-result v4

    if-nez v4, :cond_1

    .line 106
    invoke-static {v3, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNormalizer;->process(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lcom/itextpdf/kernel/xmp/XMPMeta;

    move-result-object v4

    return-object v4

    .line 110
    :cond_1
    return-object v3

    .line 116
    .end local v3    # "xmp":Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    :cond_2
    new-instance v3, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    invoke-direct {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;-><init>()V

    return-object v3
.end method

.method private static parseInputSource(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;
    .locals 4
    .param p0, "source"    # Lorg/xml/sax/InputSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 284
    const/4 v0, 0x1

    :try_start_0
    invoke-static {v0, v0}, Lcom/itextpdf/kernel/utils/XmlProcessorCreator;->createSafeDocumentBuilder(ZZ)Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 285
    .local v0, "builder":Ljavax/xml/parsers/DocumentBuilder;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilder;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    .line 286
    invoke-virtual {v0, p0}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v1
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 289
    .end local v0    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    :catch_0
    move-exception v0

    .line 290
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Error reading the XML-file"

    const/16 v3, 0xcc

    invoke-direct {v1, v2, v3, v0}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;ILjava/lang/Throwable;)V

    throw v1

    .line 287
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 288
    .local v0, "e":Lorg/xml/sax/SAXException;
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->getMessage()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xc9

    invoke-direct {v1, v2, v3, v0}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;ILjava/lang/Throwable;)V

    throw v1
.end method

.method private static parseXml(Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lorg/w3c/dom/Document;
    .locals 2
    .param p0, "input"    # Ljava/lang/Object;
    .param p1, "options"    # Lcom/itextpdf/kernel/xmp/options/ParseOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 141
    instance-of v0, p0, Ljava/io/InputStream;

    if-eqz v0, :cond_0

    .line 143
    move-object v0, p0

    check-cast v0, Ljava/io/InputStream;

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->parseXmlFromInputStream(Ljava/io/InputStream;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lorg/w3c/dom/Document;

    move-result-object v0

    return-object v0

    .line 145
    :cond_0
    instance-of v0, p0, [B

    if-eqz v0, :cond_1

    .line 147
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;

    move-object v1, p0

    check-cast v1, [B

    check-cast v1, [B

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;-><init>([B)V

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->parseXmlFromBytebuffer(Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lorg/w3c/dom/Document;

    move-result-object v0

    return-object v0

    .line 151
    :cond_1
    move-object v0, p0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->parseXmlFromString(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lorg/w3c/dom/Document;

    move-result-object v0

    return-object v0
.end method

.method private static parseXmlFromBytebuffer(Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lorg/w3c/dom/Document;
    .locals 6
    .param p0, "buffer"    # Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;
    .param p1, "options"    # Lcom/itextpdf/kernel/xmp/options/ParseOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 201
    new-instance v0, Lorg/xml/sax/InputSource;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->getByteStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 204
    .local v0, "source":Lorg/xml/sax/InputSource;
    :try_start_0
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->parseInputSource(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v1
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 206
    :catch_0
    move-exception v1

    .line 208
    .local v1, "e":Lcom/itextpdf/kernel/xmp/XMPException;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/XMPException;->getErrorCode()I

    move-result v2

    const/16 v3, 0xc9

    if-eq v2, v3, :cond_1

    .line 209
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/XMPException;->getErrorCode()I

    move-result v2

    const/16 v3, 0xcc

    if-ne v2, v3, :cond_0

    goto :goto_0

    .line 238
    :cond_0
    throw v1

    .line 211
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->getAcceptLatin1()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 213
    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/impl/Latin1Converter;->convert(Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;)Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;

    move-result-object p0

    .line 216
    :cond_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->getFixControlChars()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 220
    :try_start_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->getEncoding()Ljava/lang/String;

    move-result-object v2

    .line 221
    .local v2, "encoding":Ljava/lang/String;
    new-instance v3, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;

    new-instance v4, Ljava/io/InputStreamReader;

    .line 223
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->getByteStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;-><init>(Ljava/io/Reader;)V

    .line 224
    .local v3, "fixReader":Ljava/io/Reader;
    new-instance v4, Lorg/xml/sax/InputSource;

    invoke-direct {v4, v3}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-static {v4}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->parseInputSource(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v4
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    return-object v4

    .line 226
    .end local v2    # "encoding":Ljava/lang/String;
    .end local v3    # "fixReader":Ljava/io/Reader;
    :catch_1
    move-exception v2

    .line 229
    .local v2, "e1":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v4, "Unsupported Encoding"

    const/16 v5, 0x9

    invoke-direct {v3, v4, v5, v1}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;ILjava/lang/Throwable;)V

    throw v3

    .line 233
    .end local v2    # "e1":Ljava/io/UnsupportedEncodingException;
    :cond_3
    new-instance v2, Lorg/xml/sax/InputSource;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->getByteStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 234
    .end local v0    # "source":Lorg/xml/sax/InputSource;
    .local v2, "source":Lorg/xml/sax/InputSource;
    invoke-static {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->parseInputSource(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v0

    return-object v0
.end method

.method private static parseXmlFromInputStream(Ljava/io/InputStream;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lorg/w3c/dom/Document;
    .locals 4
    .param p0, "stream"    # Ljava/io/InputStream;
    .param p1, "options"    # Lcom/itextpdf/kernel/xmp/options/ParseOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 168
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->getAcceptLatin1()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->getFixControlChars()Z

    move-result v0

    if-nez v0, :cond_0

    .line 170
    new-instance v0, Lorg/xml/sax/InputSource;

    invoke-direct {v0, p0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->parseInputSource(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v0

    return-object v0

    .line 177
    :cond_0
    :try_start_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;-><init>(Ljava/io/InputStream;)V

    .line 178
    .local v0, "buffer":Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;
    invoke-static {v0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->parseXmlFromBytebuffer(Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lorg/w3c/dom/Document;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 180
    .end local v0    # "buffer":Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;
    :catch_0
    move-exception v0

    .line 182
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Error reading the XML-file"

    const/16 v3, 0xcc

    invoke-direct {v1, v2, v3, v0}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;ILjava/lang/Throwable;)V

    throw v1
.end method

.method private static parseXmlFromString(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/ParseOptions;)Lorg/w3c/dom/Document;
    .locals 5
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "options"    # Lcom/itextpdf/kernel/xmp/options/ParseOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 256
    new-instance v0, Lorg/xml/sax/InputSource;

    new-instance v1, Ljava/io/StringReader;

    invoke-direct {v1, p0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    .line 259
    .local v0, "source":Lorg/xml/sax/InputSource;
    :try_start_0
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->parseInputSource(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v1
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 261
    :catch_0
    move-exception v1

    .line 263
    .local v1, "e":Lcom/itextpdf/kernel/xmp/XMPException;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/XMPException;->getErrorCode()I

    move-result v2

    const/16 v3, 0xc9

    if-ne v2, v3, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->getFixControlChars()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 265
    new-instance v2, Lorg/xml/sax/InputSource;

    new-instance v3, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;

    new-instance v4, Ljava/io/StringReader;

    invoke-direct {v4, p0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/xmp/impl/FixASCIIControlsReader;-><init>(Ljava/io/Reader;)V

    invoke-direct {v2, v3}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    .line 266
    .end local v0    # "source":Lorg/xml/sax/InputSource;
    .local v2, "source":Lorg/xml/sax/InputSource;
    invoke-static {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaParser;->parseInputSource(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v0

    return-object v0

    .line 270
    .end local v2    # "source":Lorg/xml/sax/InputSource;
    .restart local v0    # "source":Lorg/xml/sax/InputSource;
    :cond_0
    throw v1
.end method
