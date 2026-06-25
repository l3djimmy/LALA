.class public final Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;
.super Ljava/lang/Object;
.source "XMPSchemaRegistryImpl.java"

# interfaces
.implements Lcom/itextpdf/kernel/xmp/XMPConst;
.implements Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;


# instance fields
.field private aliasMap:Ljava/util/Map;

.field private namespaceToPrefixMap:Ljava/util/Map;

.field private p:Ljava/util/regex/Pattern;

.field private prefixToNamespaceMap:Ljava/util/Map;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->namespaceToPrefixMap:Ljava/util/Map;

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->prefixToNamespaceMap:Ljava/util/Map;

    .line 65
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->aliasMap:Ljava/util/Map;

    .line 67
    const-string v0, "[/*?\\[\\]]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->p:Ljava/util/regex/Pattern;

    .line 78
    :try_start_0
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerStandardNamespaces()V

    .line 79
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerStandardAliases()V
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    nop

    .line 85
    return-void

    .line 81
    :catch_0
    move-exception v0

    .line 83
    .local v0, "e":Lcom/itextpdf/kernel/xmp/XMPException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "The XMPSchemaRegistry cannot be initialized!"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private registerStandardAliases()V
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 470
    new-instance v0, Lcom/itextpdf/kernel/xmp/options/AliasOptions;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->setArrayOrdered(Z)Lcom/itextpdf/kernel/xmp/options/AliasOptions;

    move-result-object v7

    .line 471
    .local v7, "aliasToArrayOrdered":Lcom/itextpdf/kernel/xmp/options/AliasOptions;
    new-instance v0, Lcom/itextpdf/kernel/xmp/options/AliasOptions;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;-><init>()V

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->setArrayAltText(Z)Lcom/itextpdf/kernel/xmp/options/AliasOptions;

    move-result-object v13

    .line 475
    .local v13, "aliasToArrayAltText":Lcom/itextpdf/kernel/xmp/options/AliasOptions;
    const-string v5, "http://purl.org/dc/elements/1.1/"

    const-string v6, "creator"

    const-string v3, "http://ns.adobe.com/xap/1.0/"

    const-string v4, "Author"

    move-object/from16 v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 476
    const-string v18, "creator"

    const/16 v19, 0x0

    const-string v15, "http://ns.adobe.com/xap/1.0/"

    const-string v16, "Authors"

    const-string v17, "http://purl.org/dc/elements/1.1/"

    move-object/from16 v14, p0

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 477
    const-string v18, "description"

    const-string v15, "http://ns.adobe.com/xap/1.0/"

    const-string v16, "Description"

    const-string v17, "http://purl.org/dc/elements/1.1/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 478
    const-string v18, "format"

    const-string v15, "http://ns.adobe.com/xap/1.0/"

    const-string v16, "Format"

    const-string v17, "http://purl.org/dc/elements/1.1/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 479
    const-string/jumbo v18, "subject"

    const-string v15, "http://ns.adobe.com/xap/1.0/"

    const-string v16, "Keywords"

    const-string v17, "http://purl.org/dc/elements/1.1/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 480
    const-string v18, "language"

    const-string v15, "http://ns.adobe.com/xap/1.0/"

    const-string v16, "Locale"

    const-string v17, "http://purl.org/dc/elements/1.1/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 481
    const-string/jumbo v18, "title"

    const-string v15, "http://ns.adobe.com/xap/1.0/"

    const-string v16, "Title"

    const-string v17, "http://purl.org/dc/elements/1.1/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 482
    const-string/jumbo v18, "rights"

    const-string v15, "http://ns.adobe.com/xap/1.0/rights/"

    const-string v16, "Copyright"

    const-string v17, "http://purl.org/dc/elements/1.1/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 485
    const-string v5, "http://purl.org/dc/elements/1.1/"

    const-string v6, "creator"

    const-string v3, "http://ns.adobe.com/pdf/1.3/"

    const-string v4, "Author"

    invoke-virtual/range {v2 .. v7}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 486
    const-string v18, "BaseURL"

    const-string v15, "http://ns.adobe.com/pdf/1.3/"

    const-string v16, "BaseURL"

    const-string v17, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 487
    const-string v18, "CreateDate"

    const-string v15, "http://ns.adobe.com/pdf/1.3/"

    const-string v16, "CreationDate"

    const-string v17, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 488
    const-string v18, "CreatorTool"

    const-string v15, "http://ns.adobe.com/pdf/1.3/"

    const-string v16, "Creator"

    const-string v17, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 489
    const-string v18, "ModifyDate"

    const-string v15, "http://ns.adobe.com/pdf/1.3/"

    const-string v16, "ModDate"

    const-string v17, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 490
    const-string v11, "http://purl.org/dc/elements/1.1/"

    const-string v12, "description"

    const-string v9, "http://ns.adobe.com/pdf/1.3/"

    const-string v10, "Subject"

    move-object/from16 v8, p0

    invoke-virtual/range {v8 .. v13}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 491
    const-string v11, "http://purl.org/dc/elements/1.1/"

    const-string/jumbo v12, "title"

    const-string v9, "http://ns.adobe.com/pdf/1.3/"

    const-string v10, "Title"

    invoke-virtual/range {v8 .. v13}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 494
    const-string v5, "http://purl.org/dc/elements/1.1/"

    const-string v6, "creator"

    const-string v3, "http://ns.adobe.com/photoshop/1.0/"

    const-string v4, "Author"

    invoke-virtual/range {v2 .. v7}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 495
    const-string v11, "http://purl.org/dc/elements/1.1/"

    const-string v12, "description"

    const-string v9, "http://ns.adobe.com/photoshop/1.0/"

    const-string v10, "Caption"

    invoke-virtual/range {v8 .. v13}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 496
    const-string v11, "http://purl.org/dc/elements/1.1/"

    const-string/jumbo v12, "rights"

    const-string v9, "http://ns.adobe.com/photoshop/1.0/"

    const-string v10, "Copyright"

    invoke-virtual/range {v8 .. v13}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 497
    const-string/jumbo v18, "subject"

    const-string v15, "http://ns.adobe.com/photoshop/1.0/"

    const-string v16, "Keywords"

    const-string v17, "http://purl.org/dc/elements/1.1/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 498
    const-string v18, "Marked"

    const-string v15, "http://ns.adobe.com/photoshop/1.0/"

    const-string v16, "Marked"

    const-string v17, "http://ns.adobe.com/xap/1.0/rights/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 499
    const-string v11, "http://purl.org/dc/elements/1.1/"

    const-string/jumbo v12, "title"

    const-string v9, "http://ns.adobe.com/photoshop/1.0/"

    const-string v10, "Title"

    invoke-virtual/range {v8 .. v13}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 500
    const-string v18, "WebStatement"

    const-string v15, "http://ns.adobe.com/photoshop/1.0/"

    const-string v16, "WebStatement"

    const-string v17, "http://ns.adobe.com/xap/1.0/rights/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 503
    const-string v5, "http://purl.org/dc/elements/1.1/"

    const-string v6, "creator"

    const-string v3, "http://ns.adobe.com/tiff/1.0/"

    const-string v4, "Artist"

    invoke-virtual/range {v2 .. v7}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 504
    const-string/jumbo v18, "rights"

    const-string v15, "http://ns.adobe.com/tiff/1.0/"

    const-string v16, "Copyright"

    const-string v17, "http://purl.org/dc/elements/1.1/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 505
    const-string v18, "ModifyDate"

    const-string v15, "http://ns.adobe.com/tiff/1.0/"

    const-string v16, "DateTime"

    const-string v17, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 506
    const-string v18, "description"

    const-string v15, "http://ns.adobe.com/tiff/1.0/"

    const-string v16, "ImageDescription"

    const-string v17, "http://purl.org/dc/elements/1.1/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 507
    const-string v18, "CreatorTool"

    const-string v15, "http://ns.adobe.com/tiff/1.0/"

    const-string v16, "Software"

    const-string v17, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 510
    const-string v5, "http://purl.org/dc/elements/1.1/"

    const-string v6, "creator"

    const-string v3, "http://ns.adobe.com/png/1.0/"

    const-string v4, "Author"

    invoke-virtual/range {v2 .. v7}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 511
    const-string v11, "http://purl.org/dc/elements/1.1/"

    const-string/jumbo v12, "rights"

    const-string v9, "http://ns.adobe.com/png/1.0/"

    const-string v10, "Copyright"

    invoke-virtual/range {v8 .. v13}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 512
    const-string v18, "CreateDate"

    const-string v15, "http://ns.adobe.com/png/1.0/"

    const-string v16, "CreationTime"

    const-string v17, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 513
    const-string v11, "http://purl.org/dc/elements/1.1/"

    const-string v12, "description"

    const-string v9, "http://ns.adobe.com/png/1.0/"

    const-string v10, "Description"

    invoke-virtual/range {v8 .. v13}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 514
    const-string v18, "ModifyDate"

    const-string v15, "http://ns.adobe.com/png/1.0/"

    const-string v16, "ModificationTime"

    const-string v17, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 515
    const-string v18, "CreatorTool"

    const-string v15, "http://ns.adobe.com/png/1.0/"

    const-string v16, "Software"

    const-string v17, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual/range {v14 .. v19}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 516
    const-string v11, "http://purl.org/dc/elements/1.1/"

    const-string/jumbo v12, "title"

    const-string v9, "http://ns.adobe.com/png/1.0/"

    const-string v10, "Title"

    invoke-virtual/range {v8 .. v13}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 517
    return-void
.end method

.method private registerStandardNamespaces()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 207
    const-string v0, "http://www.w3.org/XML/1998/namespace"

    const-string/jumbo v1, "xml"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 208
    const-string v0, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    const-string/jumbo v1, "rdf"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 209
    const-string v0, "http://purl.org/dc/elements/1.1/"

    const-string v1, "dc"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 210
    const-string v0, "http://iptc.org/std/Iptc4xmpCore/1.0/xmlns/"

    const-string v1, "Iptc4xmpCore"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 211
    const-string v0, "http://iptc.org/std/Iptc4xmpExt/2008-02-29/"

    const-string v1, "Iptc4xmpExt"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 212
    const-string v0, "http://ns.adobe.com/DICOM/"

    const-string v1, "DICOM"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 213
    const-string v0, "http://ns.useplus.org/ldf/xmp/1.0/"

    const-string/jumbo v1, "plus"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 216
    const-string v0, "adobe:ns:meta/"

    const-string/jumbo v1, "x"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 217
    const-string v0, "http://ns.adobe.com/iX/1.0/"

    const-string v1, "iX"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 219
    const-string v0, "http://ns.adobe.com/xap/1.0/"

    const-string/jumbo v1, "xmp"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 220
    const-string v0, "http://ns.adobe.com/xap/1.0/rights/"

    const-string/jumbo v1, "xmpRights"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 221
    const-string v0, "http://ns.adobe.com/xap/1.0/mm/"

    const-string/jumbo v1, "xmpMM"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 222
    const-string v0, "http://ns.adobe.com/xap/1.0/bj/"

    const-string/jumbo v1, "xmpBJ"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 223
    const-string v0, "http://ns.adobe.com/xmp/note/"

    const-string/jumbo v1, "xmpNote"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 225
    const-string v0, "http://ns.adobe.com/pdf/1.3/"

    const-string/jumbo v1, "pdf"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 226
    const-string v0, "http://ns.adobe.com/pdfx/1.3/"

    const-string/jumbo v1, "pdfx"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 227
    const-string v0, "http://www.npes.org/pdfx/ns/id/"

    const-string/jumbo v1, "pdfxid"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 228
    const-string v0, "http://www.aiim.org/pdfa/ns/schema#"

    const-string/jumbo v1, "pdfaSchema"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 229
    const-string v0, "http://www.aiim.org/pdfa/ns/property#"

    const-string/jumbo v1, "pdfaProperty"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 230
    const-string v0, "http://www.aiim.org/pdfa/ns/type#"

    const-string/jumbo v1, "pdfaType"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 231
    const-string v0, "http://www.aiim.org/pdfa/ns/field#"

    const-string/jumbo v1, "pdfaField"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 232
    const-string v0, "http://www.aiim.org/pdfa/ns/id/"

    const-string/jumbo v1, "pdfaid"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 233
    const-string v0, "http://www.aiim.org/pdfua/ns/id/"

    const-string/jumbo v1, "pdfuaid"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 234
    const-string v0, "http://www.aiim.org/pdfa/ns/extension/"

    const-string/jumbo v1, "pdfaExtension"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 235
    const-string v0, "http://ns.adobe.com/photoshop/1.0/"

    const-string/jumbo v1, "photoshop"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 236
    const-string v0, "http://ns.adobe.com/album/1.0/"

    const-string v1, "album"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 237
    const-string v0, "http://ns.adobe.com/exif/1.0/"

    const-string v1, "exif"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 238
    const-string v0, "http://cipa.jp/exif/1.0/"

    const-string v1, "exifEX"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 239
    const-string v0, "http://ns.adobe.com/exif/1.0/aux/"

    const-string v1, "aux"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 240
    const-string v0, "http://ns.adobe.com/tiff/1.0/"

    const-string/jumbo v1, "tiff"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 241
    const-string v0, "http://ns.adobe.com/png/1.0/"

    const-string/jumbo v1, "png"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 242
    const-string v0, "http://ns.adobe.com/jpeg/1.0/"

    const-string v1, "jpeg"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 243
    const-string v0, "http://ns.adobe.com/jp2k/1.0/"

    const-string v1, "jp2k"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 244
    const-string v0, "http://ns.adobe.com/camera-raw-settings/1.0/"

    const-string v1, "crs"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 245
    const-string v0, "http://ns.adobe.com/StockPhoto/1.0/"

    const-string v1, "bmsp"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 246
    const-string v0, "http://ns.adobe.com/creatorAtom/1.0/"

    const-string v1, "creatorAtom"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 247
    const-string v0, "http://ns.adobe.com/asf/1.0/"

    const-string v1, "asf"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 248
    const-string v0, "http://ns.adobe.com/xmp/wav/1.0/"

    const-string/jumbo v1, "wav"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 249
    const-string v0, "http://ns.adobe.com/bwf/bext/1.0/"

    const-string v1, "bext"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 250
    const-string v0, "http://ns.adobe.com/riff/info/"

    const-string/jumbo v1, "riffinfo"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 251
    const-string v0, "http://ns.adobe.com/xmp/1.0/Script/"

    const-string/jumbo v1, "xmpScript"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 252
    const-string v0, "http://ns.adobe.com/TransformXMP/"

    const-string/jumbo v1, "txmp"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 253
    const-string v0, "http://ns.adobe.com/swf/1.0/"

    const-string/jumbo v1, "swf"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 256
    const-string v0, "http://ns.adobe.com/xmp/1.0/DynamicMedia/"

    const-string/jumbo v1, "xmpDM"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 257
    const-string v0, "http://ns.adobe.com/xmp/transient/1.0/"

    const-string/jumbo v1, "xmpx"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 260
    const-string v0, "http://ns.adobe.com/xap/1.0/t/"

    const-string/jumbo v1, "xmpT"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 261
    const-string v0, "http://ns.adobe.com/xap/1.0/t/pg/"

    const-string/jumbo v1, "xmpTPg"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 262
    const-string v0, "http://ns.adobe.com/xap/1.0/g/"

    const-string/jumbo v1, "xmpG"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 263
    const-string v0, "http://ns.adobe.com/xap/1.0/g/img/"

    const-string/jumbo v1, "xmpGImg"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 264
    const-string v0, "http://ns.adobe.com/xap/1.0/sType/Font#"

    const-string/jumbo v1, "stFnt"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 265
    const-string v0, "http://ns.adobe.com/xap/1.0/sType/Dimensions#"

    const-string/jumbo v1, "stDim"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 266
    const-string v0, "http://ns.adobe.com/xap/1.0/sType/ResourceEvent#"

    const-string/jumbo v1, "stEvt"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 267
    const-string v0, "http://ns.adobe.com/xap/1.0/sType/ResourceRef#"

    const-string/jumbo v1, "stRef"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 268
    const-string v0, "http://ns.adobe.com/xap/1.0/sType/Version#"

    const-string/jumbo v1, "stVer"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 269
    const-string v0, "http://ns.adobe.com/xap/1.0/sType/Job#"

    const-string/jumbo v1, "stJob"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 270
    const-string v0, "http://ns.adobe.com/xap/1.0/sType/ManifestItem#"

    const-string/jumbo v1, "stMfs"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 271
    const-string v0, "http://ns.adobe.com/xmp/Identifier/qual/1.0/"

    const-string/jumbo v1, "xmpidq"

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 272
    return-void
.end method


# virtual methods
.method public declared-synchronized deleteNamespace(Ljava/lang/String;)V
    .locals 2
    .param p1, "namespaceURI"    # Ljava/lang/String;

    monitor-enter p0

    .line 148
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->getNamespacePrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 149
    .local v0, "prefixToDelete":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 151
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->namespaceToPrefixMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->prefixToNamespaceMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    .end local p0    # "this":Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;
    :cond_0
    monitor-exit p0

    return-void

    .line 147
    .end local v0    # "prefixToDelete":Ljava/lang/String;
    .end local p1    # "namespaceURI":Ljava/lang/String;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized findAlias(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;
    .locals 1
    .param p1, "qname"    # Ljava/lang/String;

    monitor-enter p0

    .line 300
    :try_start_0
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->aliasMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 300
    .end local p0    # "this":Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;
    .end local p1    # "qname":Ljava/lang/String;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized findAliases(Ljava/lang/String;)[Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;
    .locals 6
    .param p1, "aliasNS"    # Ljava/lang/String;

    monitor-enter p0

    .line 309
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->getNamespacePrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 310
    .local v0, "prefix":Ljava/lang/String;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 311
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;>;"
    if-eqz v0, :cond_1

    .line 313
    iget-object v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->aliasMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 314
    .local v3, "key":Ljava/lang/Object;
    move-object v4, v3

    check-cast v4, Ljava/lang/String;

    .line 315
    .local v4, "qname":Ljava/lang/String;
    invoke-virtual {v4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 316
    invoke-virtual {p0, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->findAlias(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 318
    .end local v3    # "key":Ljava/lang/Object;
    .end local v4    # "qname":Ljava/lang/String;
    .end local p0    # "this":Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;
    :cond_0
    goto :goto_0

    .line 321
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v2

    .line 308
    .end local v0    # "prefix":Ljava/lang/String;
    .end local v1    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;>;"
    .end local p1    # "aliasNS":Ljava/lang/String;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized getAliases()Ljava/util/Map;
    .locals 2

    monitor-enter p0

    .line 458
    :try_start_0
    new-instance v0, Ljava/util/TreeMap;

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->aliasMap:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 458
    .end local p0    # "this":Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public declared-synchronized getNamespacePrefix(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "namespaceURI"    # Ljava/lang/String;

    monitor-enter p0

    .line 162
    :try_start_0
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->namespaceToPrefixMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 162
    .end local p0    # "this":Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;
    .end local p1    # "namespaceURI":Ljava/lang/String;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized getNamespaceURI(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "namespacePrefix"    # Ljava/lang/String;

    monitor-enter p0

    .line 171
    if-eqz p1, :cond_0

    :try_start_0
    const-string v0, ":"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 173
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object p1, v0

    .line 175
    .end local p0    # "this":Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->prefixToNamespaceMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 170
    .end local p1    # "namespacePrefix":Ljava/lang/String;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized getNamespaces()Ljava/util/Map;
    .locals 2

    monitor-enter p0

    .line 184
    :try_start_0
    new-instance v0, Ljava/util/TreeMap;

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->namespaceToPrefixMap:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 184
    .end local p0    # "this":Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public declared-synchronized getPrefixes()Ljava/util/Map;
    .locals 2

    monitor-enter p0

    .line 193
    :try_start_0
    new-instance v0, Ljava/util/TreeMap;

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->prefixToNamespaceMap:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 193
    .end local p0    # "this":Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method declared-synchronized registerAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V
    .locals 8
    .param p1, "aliasNS"    # Ljava/lang/String;
    .param p2, "aliasProp"    # Ljava/lang/String;
    .param p3, "actualNS"    # Ljava/lang/String;
    .param p4, "actualProp"    # Ljava/lang/String;
    .param p5, "aliasForm"    # Lcom/itextpdf/kernel/xmp/options/AliasOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    monitor-enter p0

    .line 364
    :try_start_0
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 365
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    .line 366
    invoke-static {p3}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 367
    invoke-static {p4}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    .line 370
    if-eqz p5, :cond_0

    new-instance v0, Lcom/itextpdf/kernel/xmp/options/AliasOptions;

    .line 372
    invoke-virtual {p5}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->toPropertyOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v1

    .line 371
    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->verifySetOptions(Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Ljava/lang/Object;)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v1

    .line 372
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOptions()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;-><init>(I)V

    goto :goto_0

    .end local p0    # "this":Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/options/AliasOptions;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;-><init>()V

    :goto_0
    move-object v6, v0

    .line 375
    .local v6, "aliasOpts":Lcom/itextpdf/kernel/xmp/options/AliasOptions;
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->p:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->p:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-nez v0, :cond_5

    .line 382
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->getNamespacePrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 383
    .local v0, "aliasPrefix":Ljava/lang/String;
    invoke-virtual {p0, p3}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->getNamespacePrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 384
    .local v4, "actualPrefix":Ljava/lang/String;
    const/16 v1, 0x65

    if-eqz v0, :cond_4

    .line 388
    if-eqz v4, :cond_3

    .line 394
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object v7, v1

    .line 397
    .local v7, "key":Ljava/lang/String;
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->aliasMap:Ljava/util/Map;

    invoke-interface {v1, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x4

    if-nez v1, :cond_2

    .line 401
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->aliasMap:Ljava/util/Map;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 408
    new-instance v1, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl$1;

    move-object v2, p0

    move-object v3, p3

    move-object v5, p4

    .end local p3    # "actualNS":Ljava/lang/String;
    .end local p4    # "actualProp":Ljava/lang/String;
    .local v3, "actualNS":Ljava/lang/String;
    .local v5, "actualProp":Ljava/lang/String;
    .restart local p0    # "this":Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;
    invoke-direct/range {v1 .. v6}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl$1;-><init>(Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/AliasOptions;)V

    .line 449
    .local v1, "aliasInfo":Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;
    iget-object p3, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->aliasMap:Ljava/util/Map;

    invoke-interface {p3, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 450
    monitor-exit p0

    return-void

    .line 403
    .end local v1    # "aliasInfo":Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;
    .end local v3    # "actualNS":Ljava/lang/String;
    .end local v5    # "actualProp":Ljava/lang/String;
    .end local p0    # "this":Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;
    .restart local p3    # "actualNS":Ljava/lang/String;
    .restart local p4    # "actualProp":Ljava/lang/String;
    :cond_1
    move-object v3, p3

    move-object v5, p4

    .end local p3    # "actualNS":Ljava/lang/String;
    .end local p4    # "actualProp":Ljava/lang/String;
    .restart local v3    # "actualNS":Ljava/lang/String;
    .restart local v5    # "actualProp":Ljava/lang/String;
    :try_start_1
    new-instance p3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string p4, "Actual property is already an alias, use the base property"

    invoke-direct {p3, p4, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p3

    .line 399
    .end local v3    # "actualNS":Ljava/lang/String;
    .end local v5    # "actualProp":Ljava/lang/String;
    .restart local p3    # "actualNS":Ljava/lang/String;
    .restart local p4    # "actualProp":Ljava/lang/String;
    :cond_2
    move-object v3, p3

    move-object v5, p4

    .end local p3    # "actualNS":Ljava/lang/String;
    .end local p4    # "actualProp":Ljava/lang/String;
    .restart local v3    # "actualNS":Ljava/lang/String;
    .restart local v5    # "actualProp":Ljava/lang/String;
    new-instance p3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string p4, "Alias is already existing"

    invoke-direct {p3, p4, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p3

    .line 390
    .end local v3    # "actualNS":Ljava/lang/String;
    .end local v5    # "actualProp":Ljava/lang/String;
    .end local v7    # "key":Ljava/lang/String;
    .restart local p3    # "actualNS":Ljava/lang/String;
    .restart local p4    # "actualProp":Ljava/lang/String;
    :cond_3
    move-object v3, p3

    move-object v5, p4

    .end local p3    # "actualNS":Ljava/lang/String;
    .end local p4    # "actualProp":Ljava/lang/String;
    .restart local v3    # "actualNS":Ljava/lang/String;
    .restart local v5    # "actualProp":Ljava/lang/String;
    new-instance p3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string p4, "Actual namespace is not registered"

    invoke-direct {p3, p4, v1}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p3

    .line 386
    .end local v3    # "actualNS":Ljava/lang/String;
    .end local v5    # "actualProp":Ljava/lang/String;
    .restart local p3    # "actualNS":Ljava/lang/String;
    .restart local p4    # "actualProp":Ljava/lang/String;
    :cond_4
    move-object v3, p3

    move-object v5, p4

    .end local p3    # "actualNS":Ljava/lang/String;
    .end local p4    # "actualProp":Ljava/lang/String;
    .restart local v3    # "actualNS":Ljava/lang/String;
    .restart local v5    # "actualProp":Ljava/lang/String;
    new-instance p3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string p4, "Alias namespace is not registered"

    invoke-direct {p3, p4, v1}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p3

    .line 375
    .end local v0    # "aliasPrefix":Ljava/lang/String;
    .end local v3    # "actualNS":Ljava/lang/String;
    .end local v4    # "actualPrefix":Ljava/lang/String;
    .end local v5    # "actualProp":Ljava/lang/String;
    .restart local p3    # "actualNS":Ljava/lang/String;
    .restart local p4    # "actualProp":Ljava/lang/String;
    :cond_5
    move-object v3, p3

    move-object v5, p4

    .line 377
    .end local p3    # "actualNS":Ljava/lang/String;
    .end local p4    # "actualProp":Ljava/lang/String;
    .restart local v3    # "actualNS":Ljava/lang/String;
    .restart local v5    # "actualProp":Ljava/lang/String;
    new-instance p3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string p4, "Alias and actual property names must be simple"

    const/16 v0, 0x66

    invoke-direct {p3, p4, v0}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p3

    .line 363
    .end local v3    # "actualNS":Ljava/lang/String;
    .end local v5    # "actualProp":Ljava/lang/String;
    .end local v6    # "aliasOpts":Lcom/itextpdf/kernel/xmp/options/AliasOptions;
    .end local p1    # "aliasNS":Ljava/lang/String;
    .end local p2    # "aliasProp":Ljava/lang/String;
    .end local p5    # "aliasForm":Lcom/itextpdf/kernel/xmp/options/AliasOptions;
    :catchall_0
    move-exception v0

    move-object p1, v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "suggestedPrefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    monitor-enter p0

    .line 98
    :try_start_0
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 99
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertPrefix(Ljava/lang/String;)V

    .line 101
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x3a

    if-eq v0, v1, :cond_0

    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object p2, v0

    .line 106
    .end local p0    # "this":Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;
    :cond_0
    nop

    .line 107
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .line 106
    const/4 v1, 0x0

    invoke-virtual {p2, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/Utils;->isXMLNameNS(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 112
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->namespaceToPrefixMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 113
    .local v0, "registeredPrefix":Ljava/lang/String;
    iget-object v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->prefixToNamespaceMap:Ljava/util/Map;

    invoke-interface {v2, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 114
    .local v2, "registeredNS":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 117
    monitor-exit p0

    return-object v0

    .line 121
    :cond_1
    if-eqz v2, :cond_3

    .line 125
    move-object v3, p2

    .line 126
    .local v3, "generatedPrefix":Ljava/lang/String;
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_0
    :try_start_1
    iget-object v5, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->prefixToNamespaceMap:Ljava/util/Map;

    invoke-interface {v5, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 128
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 129
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {p2, v1, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "_:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object v3, v5

    .line 126
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 132
    .end local v4    # "i":I
    :cond_2
    move-object p2, v3

    .line 134
    .end local v3    # "generatedPrefix":Ljava/lang/String;
    :cond_3
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->prefixToNamespaceMap:Ljava/util/Map;

    invoke-interface {v1, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->namespaceToPrefixMap:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 138
    monitor-exit p0

    return-object p2

    .line 109
    .end local v0    # "registeredPrefix":Ljava/lang/String;
    .end local v2    # "registeredNS":Ljava/lang/String;
    :cond_4
    :try_start_2
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "The prefix is a bad XML name"

    const/16 v2, 0xc9

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 97
    .end local p1    # "namespaceURI":Ljava/lang/String;
    .end local p2    # "suggestedPrefix":Ljava/lang/String;
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public declared-synchronized resolveAlias(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;
    .locals 3
    .param p1, "aliasNS"    # Ljava/lang/String;
    .param p2, "aliasProp"    # Ljava/lang/String;

    monitor-enter p0

    .line 285
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->getNamespacePrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 286
    .local v0, "aliasPrefix":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 288
    monitor-exit p0

    const/4 v1, 0x0

    return-object v1

    .line 291
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;->aliasMap:Ljava/util/Map;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v1

    .line 284
    .end local v0    # "aliasPrefix":Ljava/lang/String;
    .end local p0    # "this":Lcom/itextpdf/kernel/xmp/impl/XMPSchemaRegistryImpl;
    .end local p1    # "aliasNS":Ljava/lang/String;
    .end local p2    # "aliasProp":Ljava/lang/String;
    :catchall_0
    move-exception p1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method
