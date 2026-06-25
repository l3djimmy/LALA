.class public Lcom/itextpdf/kernel/xmp/impl/ParseRDF;
.super Ljava/lang/Object;
.source "ParseRDF.java"

# interfaces
.implements Lcom/itextpdf/kernel/xmp/XMPError;
.implements Lcom/itextpdf/kernel/xmp/XMPConst;


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field public static final DEFAULT_PREFIX:Ljava/lang/String; = "_dflt"

.field public static final RDFTERM_ABOUT:I = 0x3

.field public static final RDFTERM_ABOUT_EACH:I = 0xa

.field public static final RDFTERM_ABOUT_EACH_PREFIX:I = 0xb

.field public static final RDFTERM_BAG_ID:I = 0xc

.field public static final RDFTERM_DATATYPE:I = 0x7

.field public static final RDFTERM_DESCRIPTION:I = 0x8

.field public static final RDFTERM_FIRST_CORE:I = 0x1

.field public static final RDFTERM_FIRST_OLD:I = 0xa

.field public static final RDFTERM_FIRST_SYNTAX:I = 0x1

.field public static final RDFTERM_ID:I = 0x2

.field public static final RDFTERM_LAST_CORE:I = 0x7

.field public static final RDFTERM_LAST_OLD:I = 0xc

.field public static final RDFTERM_LAST_SYNTAX:I = 0x9

.field public static final RDFTERM_LI:I = 0x9

.field public static final RDFTERM_NODE_ID:I = 0x6

.field public static final RDFTERM_OTHER:I = 0x0

.field public static final RDFTERM_PARSE_TYPE:I = 0x4

.field public static final RDFTERM_RDF:I = 0x1

.field public static final RDFTERM_RESOURCE:I = 0x5


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 54
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addChildNode(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .locals 11
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .param p1, "xmpParent"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "xmlNode"    # Lorg/w3c/dom/Node;
    .param p3, "value"    # Ljava/lang/String;
    .param p4, "isTopLevel"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 1011
    invoke-static {}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->getSchemaRegistry()Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;

    move-result-object v0

    .line 1012
    .local v0, "registry":Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    .line 1014
    .local v1, "namespace":Ljava/lang/String;
    const/16 v2, 0xca

    if-eqz v1, :cond_9

    .line 1016
    const-string v3, "http://purl.org/dc/1.1/"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1019
    const-string v1, "http://purl.org/dc/elements/1.1/"

    .line 1022
    :cond_0
    invoke-interface {v0, v1}, Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;->getNamespacePrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1023
    .local v3, "prefix":Ljava/lang/String;
    const-string v4, "_dflt"

    if-nez v3, :cond_2

    .line 1025
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    :cond_1
    move-object v5, v4

    .line 1026
    .end local v3    # "prefix":Ljava/lang/String;
    .local v5, "prefix":Ljava/lang/String;
    :goto_0
    invoke-interface {v0, v1, v5}, Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1028
    .end local v5    # "prefix":Ljava/lang/String;
    .restart local v3    # "prefix":Ljava/lang/String;
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1029
    .local v3, "childName":Ljava/lang/String;
    nop

    .line 1038
    new-instance v5, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    invoke-direct {v5}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;-><init>()V

    .line 1039
    .local v5, "childOptions":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    const/4 v6, 0x0

    .line 1040
    .local v6, "isAlias":Z
    const/4 v7, 0x1

    if-eqz p4, :cond_3

    .line 1044
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v8

    invoke-static {v8, v1, v4, v7}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findSchemaNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v4

    .line 1046
    .local v4, "schemaNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const/4 v8, 0x0

    invoke-virtual {v4, v8}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setImplicit(Z)V

    .line 1048
    move-object p1, v4

    .line 1052
    invoke-interface {v0, v3}, Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;->findAlias(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;

    move-result-object v8

    if-eqz v8, :cond_3

    .line 1054
    const/4 v6, 0x1

    .line 1055
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v8

    invoke-virtual {v8, v7}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setHasAliases(Z)V

    .line 1056
    invoke-virtual {v4, v7}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setHasAliases(Z)V

    .line 1062
    .end local v4    # "schemaNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_3
    const-string/jumbo v4, "rdf:li"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 1063
    .local v4, "isArrayItem":Z
    const-string/jumbo v8, "rdf:value"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    .line 1066
    .local v8, "isValueNode":Z
    new-instance v9, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-direct {v9, v3, p3, v5}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 1068
    .local v9, "newChild":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v9, v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setAlias(Z)V

    .line 1071
    if-nez v8, :cond_4

    .line 1073
    invoke-virtual {p1, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    goto :goto_1

    .line 1077
    :cond_4
    invoke-virtual {p1, v7, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(ILcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 1081
    :goto_1
    if-eqz v8, :cond_6

    .line 1083
    if-nez p4, :cond_5

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v10

    invoke-virtual {v10}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isStruct()Z

    move-result v10

    if-eqz v10, :cond_5

    .line 1087
    invoke-virtual {p1, v7}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setHasValueChild(Z)V

    goto :goto_2

    .line 1085
    :cond_5
    new-instance v7, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v10, "Misplaced rdf:value element"

    invoke-direct {v7, v10, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v7

    .line 1090
    :cond_6
    :goto_2
    if-eqz v4, :cond_8

    .line 1092
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v7

    if-eqz v7, :cond_7

    .line 1096
    const-string v2, "[]"

    invoke-virtual {v9, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setName(Ljava/lang/String;)V

    goto :goto_3

    .line 1094
    :cond_7
    new-instance v7, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v10, "Misplaced rdf:li element"

    invoke-direct {v7, v10, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v7

    .line 1099
    :cond_8
    :goto_3
    return-object v9

    .line 1032
    .end local v3    # "childName":Ljava/lang/String;
    .end local v4    # "isArrayItem":Z
    .end local v5    # "childOptions":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .end local v6    # "isAlias":Z
    .end local v8    # "isValueNode":Z
    .end local v9    # "newChild":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_9
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v4, "XML namespace required for all elements and attributes"

    invoke-direct {v3, v4, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3
.end method

.method private static addQualifierNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .locals 5
    .param p0, "xmpParent"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 1116
    const-string/jumbo v0, "xml:lang"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1118
    .local v0, "isLang":Z
    const/4 v1, 0x0

    .line 1121
    .local v1, "newQual":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    new-instance v2, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    if-eqz v0, :cond_0

    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/Utils;->normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_0
    move-object v3, p2

    :goto_0
    const/4 v4, 0x0

    invoke-direct {v2, p1, v3, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 1122
    .end local v1    # "newQual":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .local v2, "newQual":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addQualifier(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 1124
    return-object v2
.end method

.method private static fixupQualifiedNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 4
    .param p0, "xmpParent"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 1140
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isStruct()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 1142
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChild(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    .line 1143
    .local v1, "valueNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const-string/jumbo v2, "rdf:value"

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 1150
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1152
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1157
    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    .line 1158
    .local v0, "langQual":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeQualifier(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 1159
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addQualifier(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    goto :goto_0

    .line 1154
    .end local v0    # "langQual":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Redundant xml:lang for rdf:value element"

    const/16 v3, 0xcb

    invoke-direct {v0, v2, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 1163
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_1
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifierLength()I

    move-result v2

    if-gt v0, v2, :cond_2

    .line 1165
    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v2

    .line 1166
    .local v2, "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addQualifier(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 1163
    .end local v2    # "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1172
    .end local v0    # "i":I
    :cond_2
    const/4 v0, 0x2

    .restart local v0    # "i":I
    :goto_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v2

    if-gt v0, v2, :cond_3

    .line 1174
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChild(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v2

    .line 1175
    .restart local v2    # "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addQualifier(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 1172
    .end local v2    # "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1180
    .end local v0    # "i":I
    :cond_3
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isStruct()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getHasValueChild()Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_3

    :cond_4
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1182
    :cond_5
    :goto_3
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setHasValueChild(Z)V

    .line 1183
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setStruct(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 1184
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->mergeWith(Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 1185
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    .line 1187
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeChildren()V

    .line 1188
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 1190
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 1191
    .local v2, "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 1192
    .end local v2    # "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    goto :goto_4

    .line 1193
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_6
    return-void

    .line 1143
    :cond_7
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 1140
    .end local v1    # "valueNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_8
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private static getRDFTermKind(Lorg/w3c/dom/Node;)I
    .locals 18
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .line 1278
    move-object/from16 v0, p0

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v1

    .line 1279
    .local v1, "localName":Ljava/lang/String;
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    .line 1281
    .local v2, "namespace":Ljava/lang/String;
    const-string v3, "ID"

    const-string v4, "about"

    const-string v5, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    if-nez v2, :cond_1

    .line 1283
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    :cond_0
    instance-of v6, v0, Lorg/w3c/dom/Attr;

    if-eqz v6, :cond_1

    move-object v6, v0

    check-cast v6, Lorg/w3c/dom/Attr;

    .line 1285
    invoke-interface {v6}, Lorg/w3c/dom/Attr;->getOwnerElement()Lorg/w3c/dom/Element;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1288
    const-string v2, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    .line 1291
    :cond_1
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const/4 v6, 0x0

    if-eqz v5, :cond_3

    .line 1293
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v5

    const/16 v7, 0xb

    const/16 v8, 0xa

    const/4 v9, 0x7

    const/4 v10, 0x6

    const/4 v11, 0x2

    const/4 v12, 0x1

    const/4 v13, 0x5

    const/4 v14, 0x3

    const/16 v15, 0x8

    const/16 v16, 0x4

    const/16 v17, 0x9

    sparse-switch v5, :sswitch_data_0

    :cond_2
    goto/16 :goto_0

    :sswitch_0
    const-string v3, "datatype"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v15

    goto/16 :goto_1

    :sswitch_1
    const-string v3, "aboutEachPrefix"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v8

    goto/16 :goto_1

    :sswitch_2
    const-string v3, "bagID"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v7

    goto/16 :goto_1

    :sswitch_3
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v14

    goto :goto_1

    :sswitch_4
    const-string v3, "RDF"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v13

    goto :goto_1

    :sswitch_5
    const-string v3, "li"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v6

    goto :goto_1

    :sswitch_6
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v10

    goto :goto_1

    :sswitch_7
    const-string v3, "Description"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v11

    goto :goto_1

    :sswitch_8
    const-string/jumbo v3, "resource"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move/from16 v3, v16

    goto :goto_1

    :sswitch_9
    const-string/jumbo v3, "nodeID"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v9

    goto :goto_1

    :sswitch_a
    const-string v3, "aboutEach"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move/from16 v3, v17

    goto :goto_1

    :sswitch_b
    const-string/jumbo v3, "parseType"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v12

    goto :goto_1

    :goto_0
    const/4 v3, -0x1

    :goto_1
    packed-switch v3, :pswitch_data_0

    goto :goto_2

    .line 1317
    :pswitch_0
    const/16 v3, 0xc

    return v3

    .line 1315
    :pswitch_1
    return v7

    .line 1313
    :pswitch_2
    return v8

    .line 1311
    :pswitch_3
    return v9

    .line 1309
    :pswitch_4
    return v10

    .line 1307
    :pswitch_5
    return v11

    .line 1305
    :pswitch_6
    return v12

    .line 1303
    :pswitch_7
    return v13

    .line 1301
    :pswitch_8
    return v14

    .line 1299
    :pswitch_9
    return v15

    .line 1297
    :pswitch_a
    return v16

    .line 1295
    :pswitch_b
    return v17

    .line 1321
    :cond_3
    :goto_2
    return v6

    nop

    :sswitch_data_0
    .sparse-switch
        -0x6d427373 -> :sswitch_b
        -0x4fe094d2 -> :sswitch_a
        -0x3dffc163 -> :sswitch_9
        -0x14543bf2 -> :sswitch_8
        -0x360d424 -> :sswitch_7
        0x91b -> :sswitch_6
        0xd7d -> :sswitch_5
        0x13c54 -> :sswitch_4
        0x585238d -> :sswitch_3
        0x592a323 -> :sswitch_2
        0x27fb6f60 -> :sswitch_1
        0x6ab199e4 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static isCoreSyntaxTerm(I)Z
    .locals 2
    .param p0, "term"    # I

    .line 1265
    const/4 v0, 0x1

    if-gt v0, p0, :cond_0

    const/4 v1, 0x7

    if-gt p0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isOldTerm(I)Z
    .locals 1
    .param p0, "term"    # I

    .line 1251
    const/16 v0, 0xa

    if-gt v0, p0, :cond_0

    const/16 v0, 0xc

    if-gt p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isPropertyElementName(I)Z
    .locals 1
    .param p0, "term"    # I

    .line 1231
    const/16 v0, 0x8

    if-eq p0, v0, :cond_1

    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->isOldTerm(I)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 1237
    :cond_0
    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->isCoreSyntaxTerm(I)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0

    .line 1233
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method private static isWhitespaceNode(Lorg/w3c/dom/Node;)Z
    .locals 4
    .param p0, "node"    # Lorg/w3c/dom/Node;

    .line 1204
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    .line 1206
    return v2

    .line 1209
    :cond_0
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v0

    .line 1210
    .local v0, "value":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 1212
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1214
    return v2

    .line 1210
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1218
    .end local v1    # "i":I
    :cond_2
    const/4 v1, 0x1

    return v1
.end method

.method static parse(Lorg/w3c/dom/Node;)Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .locals 1
    .param p0, "xmlRoot"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 110
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;-><init>()V

    .line 111
    .local v0, "xmp":Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    invoke-static {v0, p0}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->rdf_RDF(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lorg/w3c/dom/Node;)V

    .line 112
    return-object v0
.end method

.method private static rdf_EmptyPropertyElement(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 19
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .param p1, "xmpParent"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "xmlNode"    # Lorg/w3c/dom/Node;
    .param p3, "isTopLevel"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 838
    move-object/from16 v0, p0

    const/4 v1, 0x0

    .line 839
    .local v1, "hasPropertyAttrs":Z
    const/4 v2, 0x0

    .line 840
    .local v2, "hasResourceAttr":Z
    const/4 v3, 0x0

    .line 841
    .local v3, "hasNodeIDAttr":Z
    const/4 v4, 0x0

    .line 843
    .local v4, "hasValueAttr":Z
    const/4 v5, 0x0

    .line 845
    .local v5, "valueNode":Lorg/w3c/dom/Node;
    invoke-interface/range {p2 .. p2}, Lorg/w3c/dom/Node;->hasChildNodes()Z

    move-result v6

    const/16 v7, 0xca

    if-nez v6, :cond_12

    .line 853
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    invoke-interface/range {p2 .. p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v8

    invoke-interface {v8}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v8

    const-string v9, "Unrecognized attribute of empty property element"

    const-string/jumbo v10, "xml:lang"

    const-string/jumbo v11, "xmlns"

    if-ge v6, v8, :cond_7

    .line 855
    invoke-interface/range {p2 .. p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v8

    invoke-interface {v8, v6}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v8

    .line 856
    .local v8, "attribute":Lorg/w3c/dom/Node;
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_6

    .line 857
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v12

    if-nez v12, :cond_0

    invoke-interface {v8}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 859
    goto :goto_1

    .line 862
    :cond_0
    invoke-static {v8}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->getRDFTermKind(Lorg/w3c/dom/Node;)I

    move-result v11

    .line 864
    .local v11, "attrTerm":I
    const/16 v12, 0xcb

    const-string v13, "Empty property element can\'t have both rdf:value and rdf:resource"

    const-string v14, "Empty property element can\'t have both rdf:resource and rdf:nodeID"

    packed-switch v11, :pswitch_data_0

    .line 921
    :pswitch_0
    new-instance v10, Lcom/itextpdf/kernel/xmp/XMPException;

    invoke-direct {v10, v9, v7}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v10

    .line 892
    :pswitch_1
    if-nez v2, :cond_1

    .line 898
    const/4 v3, 0x1

    .line 899
    goto :goto_1

    .line 894
    :cond_1
    new-instance v9, Lcom/itextpdf/kernel/xmp/XMPException;

    invoke-direct {v9, v14, v7}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v9

    .line 871
    :pswitch_2
    if-nez v3, :cond_3

    .line 877
    if-nez v4, :cond_2

    .line 884
    const/4 v2, 0x1

    .line 885
    if-nez v4, :cond_6

    .line 887
    move-object v5, v8

    goto :goto_1

    .line 879
    :cond_2
    new-instance v7, Lcom/itextpdf/kernel/xmp/XMPException;

    invoke-direct {v7, v13, v12}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v7

    .line 873
    :cond_3
    new-instance v9, Lcom/itextpdf/kernel/xmp/XMPException;

    invoke-direct {v9, v14, v7}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v9

    .line 868
    :pswitch_3
    goto :goto_1

    .line 902
    :pswitch_4
    const-string/jumbo v9, "value"

    invoke-interface {v8}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 903
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v9

    const-string v14, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    invoke-virtual {v14, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 905
    if-nez v2, :cond_4

    .line 911
    const/4 v4, 0x1

    .line 912
    move-object v5, v8

    goto :goto_1

    .line 907
    :cond_4
    new-instance v7, Lcom/itextpdf/kernel/xmp/XMPException;

    invoke-direct {v7, v13, v12}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v7

    .line 914
    :cond_5
    invoke-interface {v8}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_6

    .line 916
    const/4 v1, 0x1

    .line 853
    .end local v8    # "attribute":Lorg/w3c/dom/Node;
    .end local v11    # "attrTerm":I
    :cond_6
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_0

    .line 932
    .end local v6    # "i":I
    :cond_7
    const-string v6, ""

    move-object/from16 v8, p1

    move-object/from16 v12, p2

    move/from16 v13, p3

    invoke-static {v0, v8, v12, v6, v13}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->addChildNode(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v14

    .line 933
    .local v14, "childNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const/4 v15, 0x0

    .line 935
    .local v15, "childIsStruct":Z
    const/4 v7, 0x1

    if-nez v4, :cond_9

    if-eqz v2, :cond_8

    goto :goto_2

    .line 944
    :cond_8
    if-eqz v1, :cond_b

    .line 946
    invoke-virtual {v14}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v6

    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setStruct(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 947
    const/4 v15, 0x1

    goto :goto_3

    .line 937
    :cond_9
    :goto_2
    if-eqz v5, :cond_a

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v6

    :cond_a
    invoke-virtual {v14, v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    .line 938
    if-nez v4, :cond_b

    .line 941
    invoke-virtual {v14}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v6

    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setURI(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 950
    :cond_b
    :goto_3
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_4
    invoke-interface {v12}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v7

    invoke-interface {v7}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v7

    if-ge v6, v7, :cond_11

    .line 952
    invoke-interface {v12}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v7

    invoke-interface {v7, v6}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v7

    .line 953
    .local v7, "attribute":Lorg/w3c/dom/Node;
    if-eq v7, v5, :cond_10

    .line 954
    move/from16 v16, v1

    .end local v1    # "hasPropertyAttrs":Z
    .local v16, "hasPropertyAttrs":Z
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_f

    .line 955
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_c

    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 957
    move/from16 v18, v2

    goto :goto_5

    .line 960
    :cond_c
    invoke-static {v7}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->getRDFTermKind(Lorg/w3c/dom/Node;)I

    move-result v1

    .line 962
    .local v1, "attrTerm":I
    packed-switch v1, :pswitch_data_1

    .line 989
    :pswitch_5
    move/from16 v17, v1

    move/from16 v18, v2

    .end local v1    # "attrTerm":I
    .end local v2    # "hasResourceAttr":Z
    .local v17, "attrTerm":I
    .local v18, "hasResourceAttr":Z
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const/16 v2, 0xca

    invoke-direct {v1, v9, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 969
    .end local v17    # "attrTerm":I
    .end local v18    # "hasResourceAttr":Z
    .restart local v1    # "attrTerm":I
    .restart local v2    # "hasResourceAttr":Z
    :pswitch_6
    move/from16 v17, v1

    .end local v1    # "attrTerm":I
    .restart local v17    # "attrTerm":I
    const-string/jumbo v1, "rdf:resource"

    move/from16 v18, v2

    .end local v2    # "hasResourceAttr":Z
    .restart local v18    # "hasResourceAttr":Z
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v14, v1, v2}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->addQualifierNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 970
    goto :goto_5

    .line 966
    .end local v17    # "attrTerm":I
    .end local v18    # "hasResourceAttr":Z
    .restart local v1    # "attrTerm":I
    .restart local v2    # "hasResourceAttr":Z
    :pswitch_7
    move/from16 v17, v1

    move/from16 v18, v2

    .end local v1    # "attrTerm":I
    .end local v2    # "hasResourceAttr":Z
    .restart local v17    # "attrTerm":I
    .restart local v18    # "hasResourceAttr":Z
    goto :goto_5

    .line 973
    .end local v17    # "attrTerm":I
    .end local v18    # "hasResourceAttr":Z
    .restart local v1    # "attrTerm":I
    .restart local v2    # "hasResourceAttr":Z
    :pswitch_8
    move/from16 v17, v1

    move/from16 v18, v2

    .end local v1    # "attrTerm":I
    .end local v2    # "hasResourceAttr":Z
    .restart local v17    # "attrTerm":I
    .restart local v18    # "hasResourceAttr":Z
    if-nez v15, :cond_d

    .line 975
    nop

    .line 976
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    .line 975
    invoke-static {v14, v1, v2}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->addQualifierNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    goto :goto_5

    .line 978
    :cond_d
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 980
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {v14, v10, v1}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->addQualifierNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    goto :goto_5

    .line 984
    :cond_e
    invoke-interface {v7}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v14, v7, v1, v2}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->addChildNode(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 986
    goto :goto_5

    .line 954
    .end local v17    # "attrTerm":I
    .end local v18    # "hasResourceAttr":Z
    .restart local v2    # "hasResourceAttr":Z
    :cond_f
    move/from16 v18, v2

    .end local v2    # "hasResourceAttr":Z
    .restart local v18    # "hasResourceAttr":Z
    goto :goto_5

    .line 953
    .end local v16    # "hasPropertyAttrs":Z
    .end local v18    # "hasResourceAttr":Z
    .local v1, "hasPropertyAttrs":Z
    .restart local v2    # "hasResourceAttr":Z
    :cond_10
    move/from16 v16, v1

    move/from16 v18, v2

    .line 950
    .end local v1    # "hasPropertyAttrs":Z
    .end local v2    # "hasResourceAttr":Z
    .end local v7    # "attribute":Lorg/w3c/dom/Node;
    .restart local v16    # "hasPropertyAttrs":Z
    .restart local v18    # "hasResourceAttr":Z
    :goto_5
    add-int/lit8 v6, v6, 0x1

    move/from16 v1, v16

    move/from16 v2, v18

    goto/16 :goto_4

    .line 994
    .end local v6    # "i":I
    .end local v16    # "hasPropertyAttrs":Z
    .end local v18    # "hasResourceAttr":Z
    .restart local v1    # "hasPropertyAttrs":Z
    .restart local v2    # "hasResourceAttr":Z
    :cond_11
    return-void

    .line 847
    .end local v14    # "childNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v15    # "childIsStruct":Z
    :cond_12
    move-object/from16 v8, p1

    move-object/from16 v12, p2

    move/from16 v13, p3

    new-instance v6, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v7, "Nested content not allowed with rdf:resource or property attributes"

    const/16 v9, 0xca

    invoke-direct {v6, v7, v9}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v6

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_8
        :pswitch_5
        :pswitch_7
        :pswitch_5
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method private static rdf_LiteralPropertyElement(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 8
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .param p1, "xmpParent"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "xmlNode"    # Lorg/w3c/dom/Node;
    .param p3, "isTopLevel"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 641
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0, p3}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->addChildNode(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    .line 643
    .local v0, "newChild":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v2

    const/16 v3, 0xca

    if-ge v1, v2, :cond_4

    .line 645
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v2

    invoke-interface {v2, v1}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 646
    .local v2, "attribute":Lorg/w3c/dom/Node;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "xmlns"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 647
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 649
    goto :goto_1

    .line 652
    :cond_0
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v4

    .line 653
    .local v4, "attrNS":Ljava/lang/String;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v5

    .line 654
    .local v5, "attrLocal":Ljava/lang/String;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "xml:lang"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 656
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v7, v3}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->addQualifierNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    goto :goto_1

    .line 658
    :cond_1
    const-string v6, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 659
    const-string v6, "ID"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    const-string v6, "datatype"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 661
    goto :goto_1

    .line 665
    :cond_2
    new-instance v6, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v7, "Invalid attribute for literal property element"

    invoke-direct {v6, v7, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v6

    .line 643
    .end local v2    # "attribute":Lorg/w3c/dom/Node;
    .end local v4    # "attrNS":Ljava/lang/String;
    .end local v5    # "attrLocal":Ljava/lang/String;
    :cond_3
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 669
    .end local v1    # "i":I
    :cond_4
    const-string v1, ""

    .line 670
    .local v1, "textValue":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-ge v2, v4, :cond_6

    .line 672
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v4

    invoke-interface {v4, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 673
    .local v4, "child":Lorg/w3c/dom/Node;
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v5

    const/4 v6, 0x3

    if-ne v5, v6, :cond_5

    .line 675
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 670
    .end local v4    # "child":Lorg/w3c/dom/Node;
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 679
    .restart local v4    # "child":Lorg/w3c/dom/Node;
    :cond_5
    new-instance v5, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v6, "Invalid child of literal property element"

    invoke-direct {v5, v6, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v5

    .line 682
    .end local v2    # "i":I
    .end local v4    # "child":Lorg/w3c/dom/Node;
    :cond_6
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    .line 683
    return-void
.end method

.method private static rdf_NodeElement(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 4
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .param p1, "xmpParent"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "xmlNode"    # Lorg/w3c/dom/Node;
    .param p3, "isTopLevel"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 185
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->getRDFTermKind(Lorg/w3c/dom/Node;)I

    move-result v0

    .line 186
    .local v0, "nodeTerm":I
    const/16 v1, 0x8

    if-eq v0, v1, :cond_1

    if-nez v0, :cond_0

    goto :goto_0

    .line 188
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Node element must be rdf:Description or typed node"

    const/16 v3, 0xca

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 191
    :cond_1
    :goto_0
    if-eqz p3, :cond_3

    if-eqz v0, :cond_2

    goto :goto_1

    .line 193
    :cond_2
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Top level typed node not allowed"

    const/16 v3, 0xcb

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 197
    :cond_3
    :goto_1
    invoke-static {p0, p1, p2, p3}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->rdf_NodeElementAttrs(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    .line 198
    invoke-static {p0, p1, p2, p3}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->rdf_PropertyElementList(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    .line 201
    return-void
.end method

.method private static rdf_NodeElementAttrs(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 7
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .param p1, "xmpParent"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "xmlNode"    # Lorg/w3c/dom/Node;
    .param p3, "isTopLevel"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 229
    const/4 v0, 0x0

    .line 231
    .local v0, "exclusiveAttrs":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_5

    .line 233
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v2

    invoke-interface {v2, v1}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 237
    .local v2, "attribute":Lorg/w3c/dom/Node;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "xmlns"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 238
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 240
    goto :goto_1

    .line 243
    :cond_0
    invoke-static {v2}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->getRDFTermKind(Lorg/w3c/dom/Node;)I

    move-result v3

    .line 245
    .local v3, "attrTerm":I
    const/16 v4, 0xca

    packed-switch v3, :pswitch_data_0

    .line 284
    :pswitch_0
    new-instance v5, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v6, "Invalid nodeElement attribute"

    invoke-direct {v5, v6, v4}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v5

    .line 250
    :pswitch_1
    if-gtz v0, :cond_3

    .line 256
    add-int/lit8 v0, v0, 0x1

    .line 258
    if-eqz p3, :cond_4

    const/4 v4, 0x3

    if-ne v3, v4, :cond_4

    .line 264
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_2

    .line 266
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_1

    .line 268
    :cond_1
    new-instance v4, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v5, "Mismatched top level rdf:about values"

    const/16 v6, 0xcb

    invoke-direct {v4, v5, v6}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 274
    :cond_2
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setName(Ljava/lang/String;)V

    goto :goto_1

    .line 252
    :cond_3
    new-instance v5, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v6, "Mutally exclusive about, ID, nodeID attributes"

    invoke-direct {v5, v6, v4}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v5

    .line 280
    :pswitch_2
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, p1, v2, v4, p3}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->addChildNode(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 281
    nop

    .line 231
    .end local v2    # "attribute":Lorg/w3c/dom/Node;
    .end local v3    # "attrTerm":I
    :cond_4
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 288
    .end local v1    # "i":I
    :cond_5
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static rdf_NodeElementList(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;)V
    .locals 3
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .param p1, "xmpParent"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "rdfRdfNode"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 151
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 153
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 155
    .local v1, "child":Lorg/w3c/dom/Node;
    invoke-static {v1}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->isWhitespaceNode(Lorg/w3c/dom/Node;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 157
    const/4 v2, 0x1

    invoke-static {p0, p1, v1, v2}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->rdf_NodeElement(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    .line 151
    .end local v1    # "child":Lorg/w3c/dom/Node;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 160
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method private static rdf_ParseTypeCollectionPropertyElement()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 772
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "ParseTypeCollection property element not allowed"

    const/16 v2, 0xcb

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static rdf_ParseTypeLiteralPropertyElement()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 697
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "ParseTypeLiteral property element not allowed"

    const/16 v2, 0xcb

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static rdf_ParseTypeOtherPropertyElement()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 786
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "ParseTypeOther property element not allowed"

    const/16 v2, 0xcb

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static rdf_ParseTypeResourcePropertyElement(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 8
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .param p1, "xmpParent"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "xmlNode"    # Lorg/w3c/dom/Node;
    .param p3, "isTopLevel"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 720
    const-string v0, ""

    invoke-static {p0, p1, p2, v0, p3}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->addChildNode(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    .line 722
    .local v0, "newStruct":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setStruct(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 724
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 726
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v2

    invoke-interface {v2, v1}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 727
    .local v2, "attribute":Lorg/w3c/dom/Node;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "xmlns"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 728
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 730
    goto :goto_1

    .line 733
    :cond_0
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v3

    .line 734
    .local v3, "attrLocal":Ljava/lang/String;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v4

    .line 735
    .local v4, "attrNS":Ljava/lang/String;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "xml:lang"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 737
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v6, v5}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->addQualifierNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    goto :goto_1

    .line 739
    :cond_1
    const-string v5, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 740
    const-string v5, "ID"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string/jumbo v5, "parseType"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 742
    goto :goto_1

    .line 747
    :cond_2
    new-instance v5, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v6, "Invalid attribute for ParseTypeResource property element"

    const/16 v7, 0xca

    invoke-direct {v5, v6, v7}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v5

    .line 724
    .end local v2    # "attribute":Lorg/w3c/dom/Node;
    .end local v3    # "attrLocal":Ljava/lang/String;
    .end local v4    # "attrNS":Ljava/lang/String;
    :cond_3
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 752
    .end local v1    # "i":I
    :cond_4
    const/4 v1, 0x0

    invoke-static {p0, v0, p2, v1}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->rdf_PropertyElementList(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    .line 754
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getHasValueChild()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 756
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->fixupQualifiedNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 758
    :cond_5
    return-void
.end method

.method private static rdf_PropertyElement(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 11
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .param p1, "xmpParent"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "xmlNode"    # Lorg/w3c/dom/Node;
    .param p3, "isTopLevel"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 385
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->getRDFTermKind(Lorg/w3c/dom/Node;)I

    move-result v0

    .line 386
    .local v0, "nodeTerm":I
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->isPropertyElementName(I)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 392
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v1

    .line 393
    .local v1, "attributes":Lorg/w3c/dom/NamedNodeMap;
    const/4 v2, 0x0

    .line 394
    .local v2, "nsAttrs":Ljava/util/List;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v1}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v4

    if-ge v3, v4, :cond_3

    .line 396
    invoke-interface {v1, v3}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 397
    .local v4, "attribute":Lorg/w3c/dom/Node;
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "xmlns"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 398
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_2

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 400
    :cond_0
    if-nez v2, :cond_1

    .line 402
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    move-object v2, v5

    .line 404
    :cond_1
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 394
    .end local v4    # "attribute":Lorg/w3c/dom/Node;
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 407
    .end local v3    # "i":I
    :cond_3
    if-eqz v2, :cond_4

    .line 409
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 411
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 412
    .local v4, "ns":Ljava/lang/String;
    invoke-interface {v1, v4}, Lorg/w3c/dom/NamedNodeMap;->removeNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    .line 413
    .end local v4    # "ns":Ljava/lang/String;
    goto :goto_1

    .line 417
    .end local v3    # "it":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v1}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v3

    const/4 v4, 0x3

    if-le v3, v4, :cond_5

    .line 420
    invoke-static {p0, p1, p2, p3}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->rdf_EmptyPropertyElement(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    goto/16 :goto_7

    .line 428
    :cond_5
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    invoke-interface {v1}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v5

    if-ge v3, v5, :cond_e

    .line 430
    invoke-interface {v1, v3}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    .line 431
    .local v5, "attribute":Lorg/w3c/dom/Node;
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v6

    .line 432
    .local v6, "attrLocal":Ljava/lang/String;
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v7

    .line 433
    .local v7, "attrNS":Ljava/lang/String;
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v8

    .line 434
    .local v8, "attrValue":Ljava/lang/String;
    const-string/jumbo v9, "xml:lang"

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    const-string v10, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    if-eqz v9, :cond_7

    .line 435
    const-string v9, "ID"

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    invoke-virtual {v10, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    goto :goto_3

    .line 428
    .end local v5    # "attribute":Lorg/w3c/dom/Node;
    .end local v6    # "attrLocal":Ljava/lang/String;
    .end local v7    # "attrNS":Ljava/lang/String;
    .end local v8    # "attrValue":Ljava/lang/String;
    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 437
    .restart local v5    # "attribute":Lorg/w3c/dom/Node;
    .restart local v6    # "attrLocal":Ljava/lang/String;
    .restart local v7    # "attrNS":Ljava/lang/String;
    .restart local v8    # "attrValue":Ljava/lang/String;
    :cond_7
    :goto_3
    const-string v4, "datatype"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-virtual {v10, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 439
    invoke-static {p0, p1, p2, p3}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->rdf_LiteralPropertyElement(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    goto :goto_5

    .line 441
    :cond_8
    const-string/jumbo v4, "parseType"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    invoke-virtual {v10, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    goto :goto_4

    .line 445
    :cond_9
    const-string v4, "Literal"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 447
    invoke-static {}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->rdf_ParseTypeLiteralPropertyElement()V

    goto :goto_5

    .line 449
    :cond_a
    const-string v4, "Resource"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 451
    invoke-static {p0, p1, p2, p3}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->rdf_ParseTypeResourcePropertyElement(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    goto :goto_5

    .line 453
    :cond_b
    const-string v4, "Collection"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 455
    invoke-static {}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->rdf_ParseTypeCollectionPropertyElement()V

    goto :goto_5

    .line 459
    :cond_c
    invoke-static {}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->rdf_ParseTypeOtherPropertyElement()V

    goto :goto_5

    .line 443
    :cond_d
    :goto_4
    invoke-static {p0, p1, p2, p3}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->rdf_EmptyPropertyElement(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    .line 462
    :goto_5
    return-void

    .line 469
    .end local v3    # "i":I
    .end local v5    # "attribute":Lorg/w3c/dom/Node;
    .end local v6    # "attrLocal":Ljava/lang/String;
    .end local v7    # "attrNS":Ljava/lang/String;
    .end local v8    # "attrValue":Ljava/lang/String;
    :cond_e
    invoke-interface {p2}, Lorg/w3c/dom/Node;->hasChildNodes()Z

    move-result v3

    if-eqz v3, :cond_11

    .line 471
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_6
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    if-ge v3, v5, :cond_10

    .line 473
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v5

    invoke-interface {v5, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    .line 474
    .local v5, "currChild":Lorg/w3c/dom/Node;
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v6

    if-eq v6, v4, :cond_f

    .line 476
    invoke-static {p0, p1, p2, p3}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->rdf_ResourcePropertyElement(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    .line 477
    return-void

    .line 471
    .end local v5    # "currChild":Lorg/w3c/dom/Node;
    :cond_f
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 481
    .end local v3    # "i":I
    :cond_10
    invoke-static {p0, p1, p2, p3}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->rdf_LiteralPropertyElement(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    goto :goto_7

    .line 485
    :cond_11
    invoke-static {p0, p1, p2, p3}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->rdf_EmptyPropertyElement(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    .line 488
    :goto_7
    return-void

    .line 388
    .end local v1    # "attributes":Lorg/w3c/dom/NamedNodeMap;
    .end local v2    # "nsAttrs":Ljava/util/List;
    :cond_12
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Invalid property element name"

    const/16 v3, 0xca

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method private static rdf_PropertyElementList(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 5
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .param p1, "xmpParent"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "xmlParent"    # Lorg/w3c/dom/Node;
    .param p3, "isTopLevel"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 304
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 306
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 307
    .local v1, "currChild":Lorg/w3c/dom/Node;
    invoke-static {v1}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->isWhitespaceNode(Lorg/w3c/dom/Node;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 309
    goto :goto_1

    .line 311
    :cond_0
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    .line 317
    invoke-static {p0, p1, v1, p3}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->rdf_PropertyElement(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    .line 304
    .end local v1    # "currChild":Lorg/w3c/dom/Node;
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 313
    .restart local v1    # "currChild":Lorg/w3c/dom/Node;
    :cond_1
    new-instance v2, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v3, "Expected property element node not found"

    const/16 v4, 0xca

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 320
    .end local v0    # "i":I
    .end local v1    # "currChild":Lorg/w3c/dom/Node;
    :cond_2
    return-void
.end method

.method static rdf_RDF(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lorg/w3c/dom/Node;)V
    .locals 3
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .param p1, "rdfRdfNode"    # Lorg/w3c/dom/Node;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 127
    invoke-interface {p1}, Lorg/w3c/dom/Node;->hasAttributes()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 129
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    invoke-static {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->rdf_NodeElementList(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;)V

    .line 135
    return-void

    .line 133
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Invalid attributes of rdf:RDF element"

    const/16 v2, 0xca

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static rdf_ResourcePropertyElement(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 11
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .param p1, "xmpParent"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "xmlNode"    # Lorg/w3c/dom/Node;
    .param p3, "isTopLevel"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 510
    if-eqz p3, :cond_0

    const-string v0, "iX:changes"

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 513
    return-void

    .line 516
    :cond_0
    const-string v0, ""

    invoke-static {p0, p1, p2, v0, p3}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->addChildNode(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    .line 519
    .local v0, "newCompound":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v2

    const-string v3, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    const/16 v4, 0xca

    if-ge v1, v2, :cond_5

    .line 521
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v2

    invoke-interface {v2, v1}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 522
    .local v2, "attribute":Lorg/w3c/dom/Node;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "xmlns"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 523
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_1

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 525
    goto :goto_1

    .line 528
    :cond_1
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v5

    .line 529
    .local v5, "attrLocal":Ljava/lang/String;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v6

    .line 530
    .local v6, "attrNS":Ljava/lang/String;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "xml:lang"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 532
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v8, v3}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->addQualifierNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    goto :goto_1

    .line 534
    :cond_2
    const-string v7, "ID"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 536
    goto :goto_1

    .line 540
    :cond_3
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v7, "Invalid attribute for resource property element"

    invoke-direct {v3, v7, v4}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 519
    .end local v2    # "attribute":Lorg/w3c/dom/Node;
    .end local v5    # "attrLocal":Ljava/lang/String;
    .end local v6    # "attrNS":Ljava/lang/String;
    :cond_4
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 547
    .end local v1    # "i":I
    :cond_5
    const/4 v1, 0x0

    .line 548
    .local v1, "currChild":Lorg/w3c/dom/Node;
    const/4 v2, 0x0

    .line 550
    .local v2, "found":Z
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    invoke-interface {v6}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v6

    if-ge v5, v6, :cond_10

    .line 552
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    invoke-interface {v6, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 553
    invoke-static {v1}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->isWhitespaceNode(Lorg/w3c/dom/Node;)Z

    move-result v6

    if-nez v6, :cond_f

    .line 555
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_d

    if-nez v2, :cond_d

    .line 557
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 558
    .local v6, "isRDF":Z
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v8

    .line 560
    .local v8, "childLocal":Ljava/lang/String;
    if-eqz v6, :cond_6

    const-string v9, "Bag"

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 562
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v9

    invoke-virtual {v9, v7}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArray(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    goto :goto_3

    .line 564
    :cond_6
    if-eqz v6, :cond_7

    const-string v9, "Seq"

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 566
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v9

    invoke-virtual {v9, v7}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArray(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v9

    invoke-virtual {v9, v7}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArrayOrdered(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    goto :goto_3

    .line 568
    :cond_7
    if-eqz v6, :cond_8

    const-string v9, "Alt"

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 570
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v9

    invoke-virtual {v9, v7}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArray(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v9

    invoke-virtual {v9, v7}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArrayOrdered(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v9

    .line 571
    invoke-virtual {v9, v7}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArrayAlternate(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    goto :goto_3

    .line 575
    :cond_8
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v9

    invoke-virtual {v9, v7}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setStruct(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 576
    if-nez v6, :cond_a

    const-string v7, "Description"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_a

    .line 578
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v7

    .line 579
    .local v7, "typeName":Ljava/lang/String;
    if-eqz v7, :cond_9

    .line 584
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/16 v10, 0x3a

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 585
    const-string/jumbo v9, "rdf:type"

    invoke-static {v0, v9, v7}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->addQualifierNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    goto :goto_3

    .line 581
    :cond_9
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v4, "All XML elements must be in a namespace"

    const/16 v9, 0xcb

    invoke-direct {v3, v4, v9}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 589
    .end local v7    # "typeName":Ljava/lang/String;
    :cond_a
    :goto_3
    const/4 v7, 0x0

    invoke-static {p0, v0, v1, v7}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->rdf_NodeElement(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    .line 591
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getHasValueChild()Z

    move-result v7

    if-eqz v7, :cond_b

    .line 593
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseRDF;->fixupQualifiedNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    goto :goto_4

    .line 595
    :cond_b
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAlternate()Z

    move-result v7

    if-eqz v7, :cond_c

    .line 597
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->detectAltText(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 600
    :cond_c
    :goto_4
    const/4 v2, 0x1

    .line 601
    .end local v6    # "isRDF":Z
    .end local v8    # "childLocal":Ljava/lang/String;
    goto :goto_5

    .line 602
    :cond_d
    if-eqz v2, :cond_e

    .line 605
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v6, "Invalid child of resource property element"

    invoke-direct {v3, v6, v4}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 610
    :cond_e
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v6, "Children of resource property element must be XML elements"

    invoke-direct {v3, v6, v4}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 550
    :cond_f
    :goto_5
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_2

    .line 616
    :cond_10
    if-eqz v2, :cond_11

    .line 621
    return-void

    .line 619
    :cond_11
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v6, "Missing child of resource property element"

    invoke-direct {v3, v6, v4}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3
.end method
