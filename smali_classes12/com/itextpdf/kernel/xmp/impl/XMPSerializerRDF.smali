.class public Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;
.super Ljava/lang/Object;
.source "XMPSerializerRDF.java"


# static fields
.field private static final DEFAULT_PAD:I = 0x800

.field private static final PACKET_HEADER:Ljava/lang/String; = "<?xpacket begin=\"\ufeff\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>"

.field private static final PACKET_TRAILER:Ljava/lang/String; = "<?xpacket end=\""

.field private static final PACKET_TRAILER2:Ljava/lang/String; = "\"?>"

.field static final RDF_ATTR_QUALIFIER:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final RDF_EMPTY_STRUCT:Ljava/lang/String; = "<rdf:Description/>"

.field private static final RDF_RDF_END:Ljava/lang/String; = "</rdf:RDF>"

.field private static final RDF_RDF_START:Ljava/lang/String; = "<rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">"

.field private static final RDF_SCHEMA_END:Ljava/lang/String; = "</rdf:Description>"

.field private static final RDF_SCHEMA_START:Ljava/lang/String; = "<rdf:Description rdf:about="

.field private static final RDF_STRUCT_END:Ljava/lang/String; = "</rdf:Description>"

.field private static final RDF_STRUCT_START:Ljava/lang/String; = "<rdf:Description"

.field private static final RDF_XMPMETA_END:Ljava/lang/String; = "</x:xmpmeta>"

.field private static final RDF_XMPMETA_START:Ljava/lang/String; = "<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\""


# instance fields
.field private options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

.field private outputStream:Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;

.field private padding:I

.field private unicodeSize:I

.field private writer:Ljava/io/OutputStreamWriter;

.field private xmp:Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 91
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v3, "xml:lang"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string/jumbo v3, "rdf:resource"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string/jumbo v3, "rdf:ID"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string/jumbo v3, "rdf:bagID"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string/jumbo v3, "rdf:nodeID"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->RDF_ATTR_QUALIFIER:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    const/4 v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->unicodeSize:I

    return-void
.end method

.method private addPadding(I)V
    .locals 4
    .param p1, "tailLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 163
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getExactPacketLength()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 166
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->outputStream:Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;->getBytesWritten()I

    move-result v0

    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->unicodeSize:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    .line 167
    .local v0, "minSize":I
    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->padding:I

    if-gt v0, v1, :cond_0

    .line 172
    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->padding:I

    sub-int/2addr v1, v0

    iput v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->padding:I

    goto :goto_0

    .line 169
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Can\'t fit into specified packet size"

    const/16 v3, 0x6b

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 176
    .end local v0    # "minSize":I
    :cond_1
    :goto_0
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->padding:I

    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->unicodeSize:I

    div-int/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->padding:I

    .line 178
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getNewline()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    .line 179
    .local v0, "newlineLen":I
    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->padding:I

    .line 193
    iget v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->padding:I

    .line 179
    const/16 v3, 0x20

    if-lt v1, v0, :cond_3

    .line 181
    sub-int/2addr v2, v0

    iput v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->padding:I

    .line 182
    :goto_1
    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->padding:I

    add-int/lit8 v2, v0, 0x64

    if-lt v1, v2, :cond_2

    .line 184
    const/16 v1, 0x64

    invoke-direct {p0, v1, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeChars(IC)V

    .line 185
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 186
    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->padding:I

    add-int/lit8 v2, v0, 0x64

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->padding:I

    goto :goto_1

    .line 188
    :cond_2
    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->padding:I

    invoke-direct {p0, v1, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeChars(IC)V

    .line 189
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    goto :goto_2

    .line 193
    :cond_3
    invoke-direct {p0, v2, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeChars(IC)V

    .line 195
    :goto_2
    return-void
.end method

.method private appendNodeValue(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "forAttribute"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1312
    if-nez p1, :cond_0

    .line 1314
    const-string p1, ""

    .line 1316
    :cond_0
    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Lcom/itextpdf/kernel/xmp/impl/Utils;->escapeXML(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1317
    return-void
.end method

.method private canBeRDFAttrProp(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)Z
    .locals 2
    .param p1, "node"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 1334
    nop

    .line 1335
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasQualifier()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1336
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isURI()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1337
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1338
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    const/high16 v1, 0x40000000    # 2.0f

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->containsOneOf(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1339
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "[]"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1334
    :goto_0
    return v0
.end method

.method private declareNamespace(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;I)V
    .locals 4
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "namespace"    # Ljava/lang/String;
    .param p4, "indent"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 895
    .local p3, "usedPrefixes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-nez p2, :cond_1

    .line 898
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/QName;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/xmp/impl/QName;-><init>(Ljava/lang/String;)V

    .line 899
    .local v0, "qname":Lcom/itextpdf/kernel/xmp/impl/QName;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/QName;->hasPrefix()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 901
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/QName;->getPrefix()Ljava/lang/String;

    move-result-object p1

    .line 903
    invoke-static {}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->getSchemaRegistry()Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;->getNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 905
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->declareNamespace(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;I)V

    goto :goto_0

    .line 909
    :cond_0
    return-void

    .line 912
    .end local v0    # "qname":Lcom/itextpdf/kernel/xmp/impl/QName;
    :cond_1
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 913
    return-void

    .line 915
    :cond_2
    invoke-interface {p3, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 917
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 918
    invoke-direct {p0, p4}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 919
    const-string/jumbo v0, "xmlns:"

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 920
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 921
    const-string v0, "=\""

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 922
    invoke-direct {p0, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 923
    const/16 v0, 0x22

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 924
    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 926
    :cond_3
    return-void
.end method

.method private declareUsedNamespaces(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/util/Set;I)V
    .locals 4
    .param p1, "node"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p3, "indent"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/xmp/impl/XMPNode;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 854
    .local p2, "usedPrefixes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isSchemaNode()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 857
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 858
    .local v0, "prefix":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0, v2, p2, p3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->declareNamespace(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;I)V

    .line 859
    .end local v0    # "prefix":Ljava/lang/String;
    goto :goto_1

    .line 860
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isStruct()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 862
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 864
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 865
    .local v2, "field":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3, v1, p2, p3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->declareNamespace(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;I)V

    .line 866
    .end local v2    # "field":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto :goto_0

    .line 869
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    .restart local v0    # "it":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 871
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 872
    .local v2, "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-direct {p0, v2, p2, p3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->declareUsedNamespaces(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/util/Set;I)V

    .line 873
    .end local v2    # "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto :goto_2

    .line 875
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object v0

    .restart local v0    # "it":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 877
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 878
    .local v2, "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3, v1, p2, p3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->declareNamespace(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;I)V

    .line 879
    invoke-direct {p0, v2, p2, p3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->declareUsedNamespaces(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/util/Set;I)V

    .line 880
    .end local v2    # "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto :goto_3

    .line 881
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_3
    return-void
.end method

.method private emitRDFArrayTag(Lcom/itextpdf/kernel/xmp/impl/XMPNode;ZI)V
    .locals 1
    .param p1, "arrayNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "isStartTag"    # Z
    .param p3, "indent"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1267
    if-nez p2, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1269
    :cond_0
    invoke-direct {p0, p3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 1270
    if-eqz p2, :cond_1

    const-string v0, "<rdf:"

    goto :goto_0

    :cond_1
    const-string v0, "</rdf:"

    :goto_0
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1272
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAlternate()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1274
    const-string v0, "Alt"

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    goto :goto_1

    .line 1276
    :cond_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayOrdered()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1278
    const-string v0, "Seq"

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    goto :goto_1

    .line 1282
    :cond_3
    const-string v0, "Bag"

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1285
    :goto_1
    if-eqz p2, :cond_4

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1287
    const-string v0, "/>"

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    goto :goto_2

    .line 1291
    :cond_4
    const-string v0, ">"

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1294
    :goto_2
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1296
    :cond_5
    return-void
.end method

.method private endOuterRDFDescription(I)V
    .locals 1
    .param p1, "level"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 957
    add-int/lit8 v0, p1, 0x1

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 958
    const-string v0, "</rdf:Description>"

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 959
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 960
    return-void
.end method

.method private serializeAsRDF()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 266
    const/4 v0, 0x0

    .line 269
    .local v0, "level":I
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getOmitPacketWrapper()Z

    move-result v1

    if-nez v1, :cond_0

    .line 271
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 272
    const-string v1, "<?xpacket begin=\"\ufeff\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>"

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 273
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 277
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getOmitXmpMetaElement()Z

    move-result v1

    if-nez v1, :cond_2

    .line 279
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 280
    const-string v1, "<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\""

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 282
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getOmitVersionAttribute()Z

    move-result v1

    if-nez v1, :cond_1

    .line 284
    invoke-static {}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->getVersionInfo()Lcom/itextpdf/kernel/xmp/XMPVersionInfo;

    move-result-object v1

    invoke-interface {v1}, Lcom/itextpdf/kernel/xmp/XMPVersionInfo;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 286
    :cond_1
    const-string v1, "\">"

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 287
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 288
    add-int/lit8 v0, v0, 0x1

    .line 292
    :cond_2
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 293
    const-string v1, "<rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">"

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 294
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 297
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getUseCanonicalFormat()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 299
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCanonicalRDFSchemas(I)V

    goto :goto_0

    .line 303
    :cond_3
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCompactRDFSchemas(I)V

    .line 307
    :goto_0
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 308
    const-string v1, "</rdf:RDF>"

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 309
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 312
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getOmitXmpMetaElement()Z

    move-result v1

    if-nez v1, :cond_4

    .line 314
    add-int/lit8 v0, v0, -0x1

    .line 315
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 316
    const-string v1, "</x:xmpmeta>"

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 317
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 320
    :cond_4
    const-string v1, ""

    .line 321
    .local v1, "tailStr":Ljava/lang/String;
    iget-object v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getOmitPacketWrapper()Z

    move-result v2

    if-nez v2, :cond_7

    .line 323
    iget-object v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getBaseIndent()I

    move-result v0

    :goto_1
    if-lez v0, :cond_5

    .line 325
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getIndent()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 323
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 328
    :cond_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "<?xpacket end=\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 329
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getReadOnlyPacket()Z

    move-result v3

    if-eqz v3, :cond_6

    const/16 v3, 0x72

    goto :goto_2

    :cond_6
    const/16 v3, 0x77

    :goto_2
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 330
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\"?>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 333
    :cond_7
    return-object v1
.end method

.method private serializeCanonicalRDFProperty(Lcom/itextpdf/kernel/xmp/impl/XMPNode;ZZI)V
    .locals 17
    .param p1, "node"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "useCanonicalRDF"    # Z
    .param p3, "emitAsRDFValue"    # Z
    .param p4, "indent"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 1016
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p4

    const/4 v4, 0x1

    .line 1017
    .local v4, "emitEndTag":Z
    const/4 v5, 0x1

    .line 1022
    .local v5, "indentEndTag":Z
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v6

    .line 1023
    .local v6, "elemName":Ljava/lang/String;
    if-eqz p3, :cond_0

    .line 1025
    const-string/jumbo v6, "rdf:value"

    goto :goto_0

    .line 1027
    :cond_0
    const-string v7, "[]"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1029
    const-string/jumbo v6, "rdf:li"

    .line 1032
    :cond_1
    :goto_0
    invoke-direct {v0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 1033
    const/16 v7, 0x3c

    invoke-direct {v0, v7}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 1034
    invoke-direct {v0, v6}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1036
    const/4 v7, 0x0

    .line 1037
    .local v7, "hasGeneralQualifiers":Z
    const/4 v8, 0x0

    .line 1039
    .local v8, "hasRDFResourceQual":Z
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "it":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    const-string v12, "=\""

    const/16 v13, 0x20

    const/4 v14, 0x1

    if-eqz v10, :cond_4

    .line 1041
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 1042
    .local v10, "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    sget-object v15, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->RDF_ATTR_QUALIFIER:Ljava/util/Set;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v15, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_2

    .line 1044
    const/4 v7, 0x1

    goto :goto_2

    .line 1048
    :cond_2
    const-string/jumbo v11, "rdf:resource"

    invoke-virtual {v10}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v11, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    .line 1049
    if-nez p3, :cond_3

    .line 1051
    invoke-direct {v0, v13}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 1052
    invoke-virtual {v10}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v0, v11}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1053
    invoke-direct {v0, v12}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1054
    invoke-virtual {v10}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v0, v11, v14}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->appendNodeValue(Ljava/lang/String;Z)V

    .line 1055
    const/16 v11, 0x22

    invoke-direct {v0, v11}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 1058
    .end local v10    # "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_3
    :goto_2
    goto :goto_1

    .line 1062
    .end local v9    # "it":Ljava/util/Iterator;
    :cond_4
    const-string v9, "</rdf:Description>"

    const-string v10, "<rdf:Description"

    const-string v11, " rdf:parseType=\"Resource\">"

    const/4 v13, 0x0

    const-string v15, ">"

    if-eqz v7, :cond_9

    if-nez p3, :cond_9

    .line 1069
    if-nez v8, :cond_8

    .line 1077
    if-eqz v2, :cond_5

    .line 1079
    invoke-direct {v0, v15}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1080
    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1082
    add-int/lit8 v3, v3, 0x1

    .line 1083
    .end local p4    # "indent":I
    .local v3, "indent":I
    invoke-direct {v0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 1084
    invoke-direct {v0, v10}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1085
    invoke-direct {v0, v15}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    goto :goto_3

    .line 1089
    .end local v3    # "indent":I
    .restart local p4    # "indent":I
    :cond_5
    invoke-direct {v0, v11}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1091
    .end local p4    # "indent":I
    .restart local v3    # "indent":I
    :goto_3
    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1093
    add-int/lit8 v10, v3, 0x1

    invoke-direct {v0, v1, v2, v14, v10}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCanonicalRDFProperty(Lcom/itextpdf/kernel/xmp/impl/XMPNode;ZZI)V

    .line 1095
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "it":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_7

    .line 1097
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 1098
    .local v11, "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    sget-object v12, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->RDF_ATTR_QUALIFIER:Ljava/util/Set;

    invoke-virtual {v11}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v12, v14}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_6

    .line 1100
    add-int/lit8 v12, v3, 0x1

    invoke-direct {v0, v11, v2, v13, v12}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCanonicalRDFProperty(Lcom/itextpdf/kernel/xmp/impl/XMPNode;ZZI)V

    .line 1102
    .end local v11    # "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_6
    goto :goto_4

    .line 1104
    .end local v10    # "it":Ljava/util/Iterator;
    :cond_7
    if-eqz v2, :cond_18

    .line 1106
    invoke-direct {v0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 1107
    invoke-direct {v0, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1108
    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1109
    add-int/lit8 v3, v3, -0x1

    goto/16 :goto_b

    .line 1071
    .end local v3    # "indent":I
    .restart local p4    # "indent":I
    :cond_8
    new-instance v9, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v10, "Can\'t mix rdf:resource and general qualifiers"

    const/16 v11, 0xca

    invoke-direct {v9, v10, v11}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v9

    .line 1116
    :cond_9
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result v16

    const-string v13, "/>"

    if-nez v16, :cond_d

    .line 1120
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isURI()Z

    move-result v9

    if-eqz v9, :cond_a

    .line 1122
    const-string v9, " rdf:resource=\""

    invoke-direct {v0, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1123
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v0, v9, v14}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->appendNodeValue(Ljava/lang/String;Z)V

    .line 1124
    const-string v9, "\"/>"

    invoke-direct {v0, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1125
    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1126
    const/4 v4, 0x0

    goto/16 :goto_b

    .line 1128
    :cond_a
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_c

    const-string v9, ""

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_b

    goto :goto_5

    .line 1136
    :cond_b
    const/16 v9, 0x3e

    invoke-direct {v0, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 1137
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    invoke-direct {v0, v9, v10}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->appendNodeValue(Ljava/lang/String;Z)V

    .line 1138
    const/4 v5, 0x0

    goto/16 :goto_b

    .line 1130
    :cond_c
    :goto_5
    invoke-direct {v0, v13}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1131
    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1132
    const/4 v4, 0x0

    goto/16 :goto_b

    .line 1141
    :cond_d
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v16

    if-eqz v16, :cond_10

    .line 1144
    const/16 v9, 0x3e

    invoke-direct {v0, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 1145
    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1146
    add-int/lit8 v9, v3, 0x1

    invoke-direct {v0, v1, v14, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->emitRDFArrayTag(Lcom/itextpdf/kernel/xmp/impl/XMPNode;ZI)V

    .line 1147
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v9

    if-eqz v9, :cond_e

    .line 1149
    invoke-static {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->normalizeLangArray(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 1151
    :cond_e
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v9

    .restart local v9    # "it":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_f

    .line 1153
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 1154
    .local v10, "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    add-int/lit8 v11, v3, 0x2

    const/4 v12, 0x0

    invoke-direct {v0, v10, v2, v12, v11}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCanonicalRDFProperty(Lcom/itextpdf/kernel/xmp/impl/XMPNode;ZZI)V

    .line 1155
    .end local v10    # "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto :goto_6

    .line 1151
    :cond_f
    const/4 v12, 0x0

    .line 1156
    .end local v9    # "it":Ljava/util/Iterator;
    add-int/lit8 v9, v3, 0x1

    invoke-direct {v0, v1, v12, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->emitRDFArrayTag(Lcom/itextpdf/kernel/xmp/impl/XMPNode;ZI)V

    goto/16 :goto_b

    .line 1160
    :cond_10
    if-nez v8, :cond_15

    .line 1163
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v12

    if-nez v12, :cond_12

    .line 1167
    if-eqz v2, :cond_11

    .line 1169
    invoke-direct {v0, v15}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1170
    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1171
    add-int/lit8 v9, v3, 0x1

    invoke-direct {v0, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 1172
    const-string v9, "<rdf:Description/>"

    invoke-direct {v0, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    goto :goto_7

    .line 1176
    :cond_11
    const-string v9, " rdf:parseType=\"Resource\"/>"

    invoke-direct {v0, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1177
    const/4 v4, 0x0

    .line 1179
    :goto_7
    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    goto/16 :goto_b

    .line 1185
    :cond_12
    if-eqz v2, :cond_13

    .line 1187
    invoke-direct {v0, v15}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1188
    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1189
    add-int/lit8 v3, v3, 0x1

    .line 1190
    .end local p4    # "indent":I
    .restart local v3    # "indent":I
    invoke-direct {v0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 1191
    invoke-direct {v0, v10}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1192
    invoke-direct {v0, v15}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    goto :goto_8

    .line 1196
    .end local v3    # "indent":I
    .restart local p4    # "indent":I
    :cond_13
    invoke-direct {v0, v11}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1198
    .end local p4    # "indent":I
    .restart local v3    # "indent":I
    :goto_8
    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1200
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "it":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_14

    .line 1202
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 1203
    .local v11, "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    add-int/lit8 v12, v3, 0x1

    const/4 v13, 0x0

    invoke-direct {v0, v11, v2, v13, v12}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCanonicalRDFProperty(Lcom/itextpdf/kernel/xmp/impl/XMPNode;ZZI)V

    .line 1204
    .end local v11    # "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto :goto_9

    .line 1206
    .end local v10    # "it":Ljava/util/Iterator;
    :cond_14
    if-eqz v2, :cond_18

    .line 1208
    invoke-direct {v0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 1209
    invoke-direct {v0, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1210
    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1211
    add-int/lit8 v3, v3, -0x1

    goto :goto_b

    .line 1219
    .end local v3    # "indent":I
    .restart local p4    # "indent":I
    :cond_15
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v9

    .restart local v9    # "it":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_17

    .line 1221
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 1222
    .local v10, "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-direct {v0, v10}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->canBeRDFAttrProp(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)Z

    move-result v11

    if-eqz v11, :cond_16

    .line 1227
    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1228
    add-int/lit8 v11, v3, 0x1

    invoke-direct {v0, v11}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 1229
    const/16 v11, 0x20

    invoke-direct {v0, v11}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 1230
    invoke-virtual {v10}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v0, v15}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1231
    invoke-direct {v0, v12}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1232
    invoke-virtual {v10}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v0, v15, v14}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->appendNodeValue(Ljava/lang/String;Z)V

    .line 1233
    const/16 v15, 0x22

    invoke-direct {v0, v15}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 1234
    .end local v10    # "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto :goto_a

    .line 1224
    .restart local v10    # "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_16
    new-instance v11, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v12, "Can\'t mix rdf:resource and complex fields"

    const/16 v13, 0xca

    invoke-direct {v11, v12, v13}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v11

    .line 1235
    .end local v9    # "it":Ljava/util/Iterator;
    .end local v10    # "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_17
    invoke-direct {v0, v13}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1236
    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1237
    const/4 v4, 0x0

    .line 1242
    .end local p4    # "indent":I
    .restart local v3    # "indent":I
    :cond_18
    :goto_b
    if-eqz v4, :cond_1a

    .line 1244
    if-eqz v5, :cond_19

    .line 1246
    invoke-direct {v0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 1248
    :cond_19
    const-string v9, "</"

    invoke-direct {v0, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1249
    invoke-direct {v0, v6}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 1250
    const/16 v9, 0x3e

    invoke-direct {v0, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 1251
    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 1253
    :cond_1a
    return-void
.end method

.method private serializeCanonicalRDFSchema(Lcom/itextpdf/kernel/xmp/impl/XMPNode;I)V
    .locals 5
    .param p1, "schemaNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "level"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 835
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 837
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 838
    .local v1, "propNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    iget-object v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getUseCanonicalFormat()Z

    move-result v2

    add-int/lit8 v3, p2, 0x2

    const/4 v4, 0x0

    invoke-direct {p0, v1, v2, v4, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCanonicalRDFProperty(Lcom/itextpdf/kernel/xmp/impl/XMPNode;ZZI)V

    .line 839
    .end local v1    # "propNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto :goto_0

    .line 840
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method private serializeCanonicalRDFSchemas(I)V
    .locals 2
    .param p1, "level"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 345
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->xmp:Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v0

    if-lez v0, :cond_1

    .line 347
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->xmp:Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->startOuterRDFDescription(Lcom/itextpdf/kernel/xmp/impl/XMPNode;I)V

    .line 349
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->xmp:Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 351
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 352
    .local v1, "currSchema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-direct {p0, v1, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCanonicalRDFSchema(Lcom/itextpdf/kernel/xmp/impl/XMPNode;I)V

    .line 353
    .end local v1    # "currSchema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto :goto_0

    .line 355
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_0
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->endOuterRDFDescription(I)V

    goto :goto_1

    .line 359
    :cond_1
    add-int/lit8 v0, p1, 0x1

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 360
    const-string v0, "<rdf:Description rdf:about="

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 361
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeTreeName()V

    .line 362
    const-string v0, "/>"

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 363
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 365
    :goto_1
    return-void
.end method

.method private serializeCompactRDFArrayProp(Lcom/itextpdf/kernel/xmp/impl/XMPNode;I)V
    .locals 2
    .param p1, "node"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "indent"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 668
    const/16 v0, 0x3e

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 669
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 670
    add-int/lit8 v0, p2, 0x1

    const/4 v1, 0x1

    invoke-direct {p0, p1, v1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->emitRDFArrayTag(Lcom/itextpdf/kernel/xmp/impl/XMPNode;ZI)V

    .line 672
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 674
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->normalizeLangArray(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 677
    :cond_0
    add-int/lit8 v0, p2, 0x2

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCompactRDFElementProps(Lcom/itextpdf/kernel/xmp/impl/XMPNode;I)V

    .line 679
    add-int/lit8 v0, p2, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->emitRDFArrayTag(Lcom/itextpdf/kernel/xmp/impl/XMPNode;ZI)V

    .line 680
    return-void
.end method

.method private serializeCompactRDFAttrProps(Lcom/itextpdf/kernel/xmp/impl/XMPNode;I)Z
    .locals 5
    .param p1, "parentNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "indent"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 453
    const/4 v0, 0x1

    .line 455
    .local v0, "allAreAttrs":Z
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 457
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 459
    .local v2, "prop":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->canBeRDFAttrProp(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 461
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 462
    invoke-direct {p0, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 463
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 464
    const-string v3, "=\""

    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 465
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-direct {p0, v3, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->appendNodeValue(Ljava/lang/String;Z)V

    .line 466
    const/16 v3, 0x22

    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    goto :goto_1

    .line 470
    :cond_0
    const/4 v0, 0x0

    .line 472
    .end local v2    # "prop":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :goto_1
    goto :goto_0

    .line 473
    .end local v1    # "it":Ljava/util/Iterator;
    :cond_1
    return v0
.end method

.method private serializeCompactRDFElementProps(Lcom/itextpdf/kernel/xmp/impl/XMPNode;I)V
    .locals 12
    .param p1, "parentNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "indent"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 529
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 531
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 532
    .local v1, "node":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->canBeRDFAttrProp(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 534
    goto :goto_0

    .line 537
    :cond_0
    const/4 v2, 0x1

    .line 538
    .local v2, "emitEndTag":Z
    const/4 v3, 0x1

    .line 543
    .local v3, "indentEndTag":Z
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v4

    .line 544
    .local v4, "elemName":Ljava/lang/String;
    const-string v5, "[]"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 546
    const-string/jumbo v4, "rdf:li"

    .line 549
    :cond_1
    invoke-direct {p0, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 550
    const/16 v5, 0x3c

    invoke-direct {p0, v5}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 551
    invoke-direct {p0, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 553
    const/4 v5, 0x0

    .line 554
    .local v5, "hasGeneralQualifiers":Z
    const/4 v6, 0x0

    .line 556
    .local v6, "hasRDFResourceQual":Z
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "iq":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    const/4 v9, 0x1

    if-eqz v8, :cond_3

    .line 558
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 559
    .local v8, "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    sget-object v10, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->RDF_ATTR_QUALIFIER:Ljava/util/Set;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_2

    .line 561
    const/4 v5, 0x1

    goto :goto_2

    .line 565
    :cond_2
    const-string/jumbo v10, "rdf:resource"

    invoke-virtual {v8}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 566
    const/16 v10, 0x20

    invoke-direct {p0, v10}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 567
    invoke-virtual {v8}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 568
    const-string v10, "=\""

    invoke-direct {p0, v10}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 569
    invoke-virtual {v8}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v10, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->appendNodeValue(Ljava/lang/String;Z)V

    .line 570
    const/16 v9, 0x22

    invoke-direct {p0, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 572
    .end local v8    # "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :goto_2
    goto :goto_1

    .line 576
    .end local v7    # "iq":Ljava/util/Iterator;
    :cond_3
    if-eqz v5, :cond_4

    .line 578
    invoke-direct {p0, p2, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCompactRDFGeneralQualifier(ILcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    goto :goto_3

    .line 583
    :cond_4
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result v7

    if-nez v7, :cond_5

    .line 585
    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCompactRDFSimpleProp(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)[Z

    move-result-object v7

    .line 586
    .local v7, "result":[Z
    const/4 v8, 0x0

    aget-boolean v2, v7, v8

    .line 587
    aget-boolean v3, v7, v9

    .line 588
    .end local v7    # "result":[Z
    goto :goto_3

    .line 589
    :cond_5
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 591
    invoke-direct {p0, v1, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCompactRDFArrayProp(Lcom/itextpdf/kernel/xmp/impl/XMPNode;I)V

    goto :goto_3

    .line 595
    :cond_6
    invoke-direct {p0, v1, p2, v6}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCompactRDFStructProp(Lcom/itextpdf/kernel/xmp/impl/XMPNode;IZ)Z

    move-result v2

    .line 602
    :goto_3
    if-eqz v2, :cond_8

    .line 604
    if-eqz v3, :cond_7

    .line 606
    invoke-direct {p0, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 608
    :cond_7
    const-string v7, "</"

    invoke-direct {p0, v7}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 609
    invoke-direct {p0, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 610
    const/16 v7, 0x3e

    invoke-direct {p0, v7}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 611
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 614
    .end local v1    # "node":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v2    # "emitEndTag":Z
    .end local v3    # "indentEndTag":Z
    .end local v4    # "elemName":Ljava/lang/String;
    .end local v5    # "hasGeneralQualifiers":Z
    .end local v6    # "hasRDFResourceQual":Z
    :cond_8
    goto/16 :goto_0

    .line 615
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_9
    return-void
.end method

.method private serializeCompactRDFGeneralQualifier(ILcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 4
    .param p1, "indent"    # I
    .param p2, "node"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 790
    const-string v0, " rdf:parseType=\"Resource\">"

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 791
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 793
    add-int/lit8 v0, p1, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, p2, v1, v2, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCanonicalRDFProperty(Lcom/itextpdf/kernel/xmp/impl/XMPNode;ZZI)V

    .line 795
    invoke-virtual {p2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iq":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 797
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 798
    .local v2, "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    add-int/lit8 v3, p1, 0x1

    invoke-direct {p0, v2, v1, v1, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCanonicalRDFProperty(Lcom/itextpdf/kernel/xmp/impl/XMPNode;ZZI)V

    .line 799
    .end local v2    # "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto :goto_0

    .line 800
    .end local v0    # "iq":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method private serializeCompactRDFSchemas(I)V
    .locals 5
    .param p1, "level"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 392
    add-int/lit8 v0, p1, 0x1

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 393
    const-string v0, "<rdf:Description rdf:about="

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 394
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeTreeName()V

    .line 397
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 398
    .local v0, "usedPrefixes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-string/jumbo v1, "xml"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 399
    const-string/jumbo v1, "rdf"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 401
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->xmp:Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 403
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 404
    .local v2, "schema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    add-int/lit8 v3, p1, 0x3

    invoke-direct {p0, v2, v0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->declareUsedNamespaces(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/util/Set;I)V

    .line 405
    .end local v2    # "schema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto :goto_0

    .line 408
    .end local v1    # "it":Ljava/util/Iterator;
    :cond_0
    const/4 v1, 0x1

    .line 409
    .local v1, "allAreAttrs":Z
    iget-object v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->xmp:Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 411
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 412
    .local v3, "schema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    add-int/lit8 v4, p1, 0x2

    invoke-direct {p0, v3, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCompactRDFAttrProps(Lcom/itextpdf/kernel/xmp/impl/XMPNode;I)Z

    move-result v4

    and-int/2addr v1, v4

    .line 413
    .end local v3    # "schema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto :goto_1

    .line 415
    .end local v2    # "it":Ljava/util/Iterator;
    :cond_1
    if-nez v1, :cond_3

    .line 417
    const/16 v2, 0x3e

    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 418
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 428
    iget-object v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->xmp:Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v2

    .restart local v2    # "it":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 430
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 431
    .restart local v3    # "schema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    add-int/lit8 v4, p1, 0x2

    invoke-direct {p0, v3, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCompactRDFElementProps(Lcom/itextpdf/kernel/xmp/impl/XMPNode;I)V

    .line 432
    .end local v3    # "schema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto :goto_2

    .line 435
    .end local v2    # "it":Ljava/util/Iterator;
    :cond_2
    add-int/lit8 v2, p1, 0x1

    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 436
    const-string v2, "</rdf:Description>"

    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 437
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 438
    return-void

    .line 422
    :cond_3
    const-string v2, "/>"

    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 423
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 424
    return-void
.end method

.method private serializeCompactRDFSimpleProp(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)[Z
    .locals 5
    .param p1, "node"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 628
    const/4 v0, 0x1

    .line 629
    .local v0, "emitEndTag":Z
    const/4 v1, 0x1

    .line 631
    .local v1, "indentEndTag":Z
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isURI()Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_0

    .line 633
    const-string v2, " rdf:resource=\""

    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 634
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->appendNodeValue(Ljava/lang/String;Z)V

    .line 635
    const-string v2, "\"/>"

    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 636
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 637
    const/4 v0, 0x0

    goto :goto_1

    .line 639
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    .line 647
    :cond_1
    const/16 v2, 0x3e

    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 648
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->appendNodeValue(Ljava/lang/String;Z)V

    .line 649
    const/4 v1, 0x0

    goto :goto_1

    .line 641
    :cond_2
    :goto_0
    const-string v2, "/>"

    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 642
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 643
    const/4 v0, 0x0

    .line 652
    :goto_1
    const/4 v2, 0x2

    new-array v2, v2, [Z

    aput-boolean v0, v2, v3

    aput-boolean v1, v2, v4

    return-object v2
.end method

.method private serializeCompactRDFStructProp(Lcom/itextpdf/kernel/xmp/impl/XMPNode;IZ)Z
    .locals 6
    .param p1, "node"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "indent"    # I
    .param p3, "hasRDFResourceQual"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 697
    const/4 v0, 0x0

    .line 698
    .local v0, "hasAttrFields":Z
    const/4 v1, 0x0

    .line 699
    .local v1, "hasElemFields":Z
    const/4 v2, 0x1

    .line 701
    .local v2, "emitEndTag":Z
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "ic":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 703
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 704
    .local v4, "field":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-direct {p0, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->canBeRDFAttrProp(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 706
    const/4 v0, 0x1

    goto :goto_1

    .line 710
    :cond_0
    const/4 v1, 0x1

    .line 713
    :goto_1
    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    .line 715
    goto :goto_2

    .line 717
    .end local v4    # "field":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_1
    goto :goto_0

    .line 719
    .end local v3    # "ic":Ljava/util/Iterator;
    :cond_2
    :goto_2
    if-eqz p3, :cond_4

    if-nez v1, :cond_3

    goto :goto_3

    .line 721
    :cond_3
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v4, "Can\'t mix rdf:resource qualifier and element fields"

    const/16 v5, 0xca

    invoke-direct {v3, v4, v5}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 726
    :cond_4
    :goto_3
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v3

    if-nez v3, :cond_5

    .line 732
    const-string v3, " rdf:parseType=\"Resource\"/>"

    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 733
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 734
    const/4 v2, 0x0

    goto :goto_4

    .line 737
    :cond_5
    if-nez v1, :cond_6

    .line 741
    add-int/lit8 v3, p2, 0x1

    invoke-direct {p0, p1, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCompactRDFAttrProps(Lcom/itextpdf/kernel/xmp/impl/XMPNode;I)Z

    .line 742
    const-string v3, "/>"

    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 743
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 744
    const/4 v2, 0x0

    goto :goto_4

    .line 747
    :cond_6
    if-nez v0, :cond_7

    .line 751
    const-string v3, " rdf:parseType=\"Resource\">"

    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 752
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 753
    add-int/lit8 v3, p2, 0x1

    invoke-direct {p0, p1, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCompactRDFElementProps(Lcom/itextpdf/kernel/xmp/impl/XMPNode;I)V

    goto :goto_4

    .line 759
    :cond_7
    const/16 v3, 0x3e

    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 760
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 761
    add-int/lit8 v3, p2, 0x1

    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 762
    const-string v3, "<rdf:Description"

    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 763
    add-int/lit8 v3, p2, 0x2

    invoke-direct {p0, p1, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCompactRDFAttrProps(Lcom/itextpdf/kernel/xmp/impl/XMPNode;I)Z

    .line 764
    const-string v3, ">"

    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 765
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 766
    add-int/lit8 v3, p2, 0x1

    invoke-direct {p0, p1, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeCompactRDFElementProps(Lcom/itextpdf/kernel/xmp/impl/XMPNode;I)V

    .line 767
    add-int/lit8 v3, p2, 0x1

    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 768
    const-string v3, "</rdf:Description>"

    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 769
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 771
    :goto_4
    return v2
.end method

.method private startOuterRDFDescription(Lcom/itextpdf/kernel/xmp/impl/XMPNode;I)V
    .locals 2
    .param p1, "schemaNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "level"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 937
    add-int/lit8 v0, p2, 0x1

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeIndent(I)V

    .line 938
    const-string v0, "<rdf:Description rdf:about="

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 939
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeTreeName()V

    .line 941
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 942
    .local v0, "usedPrefixes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-string/jumbo v1, "xml"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 943
    const-string/jumbo v1, "rdf"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 945
    add-int/lit8 v1, p2, 0x3

    invoke-direct {p0, p1, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->declareUsedNamespaces(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/util/Set;I)V

    .line 947
    const/16 v1, 0x3e

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 948
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writeNewline()V

    .line 949
    return-void
.end method

.method private write(I)V
    .locals 1
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1364
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writer:Ljava/io/OutputStreamWriter;

    invoke-virtual {v0, p1}, Ljava/io/OutputStreamWriter;->write(I)V

    .line 1365
    return-void
.end method

.method private write(Ljava/lang/String;)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1375
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writer:Ljava/io/OutputStreamWriter;

    invoke-virtual {v0, p1}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 1376
    return-void
.end method

.method private writeChars(IC)V
    .locals 1
    .param p1, "number"    # I
    .param p2, "c"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1387
    nop

    :goto_0
    if-lez p1, :cond_0

    .line 1389
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writer:Ljava/io/OutputStreamWriter;

    invoke-virtual {v0, p2}, Ljava/io/OutputStreamWriter;->write(I)V

    .line 1387
    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    .line 1391
    :cond_0
    return-void
.end method

.method private writeIndent(I)V
    .locals 3
    .param p1, "times"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1350
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getBaseIndent()I

    move-result v0

    add-int/2addr v0, p1

    .local v0, "i":I
    :goto_0
    if-lez v0, :cond_0

    .line 1352
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writer:Ljava/io/OutputStreamWriter;

    iget-object v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getIndent()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 1350
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 1354
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method private writeNewline()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1400
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writer:Ljava/io/OutputStreamWriter;

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getNewline()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 1401
    return-void
.end method

.method private writeTreeName()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 373
    const/16 v0, 0x22

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 374
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->xmp:Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v1

    .line 375
    .local v1, "name":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 377
    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->appendNodeValue(Ljava/lang/String;Z)V

    .line 379
    :cond_0
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(I)V

    .line 380
    return-void
.end method


# virtual methods
.method protected checkOptionsConsistence()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 204
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getEncodeUTF16BE()Z

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getEncodeUTF16LE()Z

    move-result v1

    or-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 206
    const/4 v0, 0x2

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->unicodeSize:I

    .line 209
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getExactPacketLength()Z

    move-result v0

    .line 222
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    .line 209
    const/16 v2, 0x67

    if-eqz v0, :cond_3

    .line 211
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getOmitPacketWrapper()Z

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getIncludeThumbnailPad()Z

    move-result v1

    or-int/2addr v0, v1

    if-nez v0, :cond_2

    .line 216
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getPadding()I

    move-result v0

    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->unicodeSize:I

    add-int/lit8 v1, v1, -0x1

    and-int/2addr v0, v1

    if-nez v0, :cond_1

    goto :goto_0

    .line 218
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Exact size must be a multiple of the Unicode element"

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 213
    :cond_2
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Inconsistent options for exact size serialize"

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 222
    :cond_3
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getReadOnlyPacket()Z

    move-result v0

    .line 231
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    .line 222
    const/4 v3, 0x0

    if-eqz v0, :cond_5

    .line 224
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getOmitPacketWrapper()Z

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getIncludeThumbnailPad()Z

    move-result v1

    or-int/2addr v0, v1

    if-nez v0, :cond_4

    .line 229
    iput v3, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->padding:I

    goto :goto_0

    .line 226
    :cond_4
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Inconsistent options for read-only packet"

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 231
    :cond_5
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getOmitPacketWrapper()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 233
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getIncludeThumbnailPad()Z

    move-result v0

    if-nez v0, :cond_6

    .line 238
    iput v3, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->padding:I

    goto :goto_0

    .line 235
    :cond_6
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Inconsistent options for non-packet serialize"

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 242
    :cond_7
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->padding:I

    if-nez v0, :cond_8

    .line 244
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->unicodeSize:I

    mul-int/lit16 v0, v0, 0x800

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->padding:I

    .line 247
    :cond_8
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getIncludeThumbnailPad()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 249
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->xmp:Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    const-string v1, "http://ns.adobe.com/xap/1.0/"

    const-string v2, "Thumbnails"

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->doesPropertyExist(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 251
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->padding:I

    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->unicodeSize:I

    mul-int/lit16 v1, v1, 0x2710

    add-int/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->padding:I

    .line 255
    :cond_9
    :goto_0
    return-void
.end method

.method public serialize(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/io/OutputStream;Lcom/itextpdf/kernel/xmp/options/SerializeOptions;)V
    .locals 4
    .param p1, "xmp"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p2, "out"    # Ljava/io/OutputStream;
    .param p3, "options"    # Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 125
    :try_start_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;

    invoke-direct {v0, p2}, Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->outputStream:Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;

    .line 126
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->xmp:Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    .line 127
    iput-object p3, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->options:Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    .line 128
    invoke-virtual {p3}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getPadding()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->padding:I

    .line 130
    new-instance v0, Ljava/io/OutputStreamWriter;

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->outputStream:Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;

    invoke-virtual {p3}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getEncoding()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writer:Ljava/io/OutputStreamWriter;

    .line 132
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->checkOptionsConsistence()V

    .line 136
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->serializeAsRDF()Ljava/lang/String;

    move-result-object v0

    .line 137
    .local v0, "tailStr":Ljava/lang/String;
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writer:Ljava/io/OutputStreamWriter;

    invoke-virtual {v1}, Ljava/io/OutputStreamWriter;->flush()V

    .line 140
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->addPadding(I)V

    .line 143
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->write(Ljava/lang/String;)V

    .line 144
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->writer:Ljava/io/OutputStreamWriter;

    invoke-virtual {v1}, Ljava/io/OutputStreamWriter;->flush()V

    .line 146
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSerializerRDF;->outputStream:Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    .end local v0    # "tailStr":Ljava/lang/String;
    nop

    .line 152
    return-void

    .line 148
    :catch_0
    move-exception v0

    .line 150
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Error writing to the OutputStream"

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method
