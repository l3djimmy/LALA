.class public Lcom/itextpdf/io/font/cmap/CMapParser;
.super Ljava/lang/Object;
.source "CMapParser.java"


# static fields
.field private static final CMapName:Ljava/lang/String; = "CMapName"

.field private static final MAX_LEVEL:I = 0xa

.field private static final Ordering:Ljava/lang/String; = "Ordering"

.field private static final Registry:Ljava/lang/String; = "Registry"

.field private static final Supplement:Ljava/lang/String; = "Supplement"

.field private static final def:Ljava/lang/String; = "def"

.field private static final endbfchar:Ljava/lang/String; = "endbfchar"

.field private static final endbfrange:Ljava/lang/String; = "endbfrange"

.field private static final endcidchar:Ljava/lang/String; = "endcidchar"

.field private static final endcidrange:Ljava/lang/String; = "endcidrange"

.field private static final endcodespacerange:Ljava/lang/String; = "endcodespacerange"

.field private static final usecmap:Ljava/lang/String; = "usecmap"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseCid(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/AbstractCMap;Lcom/itextpdf/io/font/cmap/ICMapLocation;)V
    .locals 1
    .param p0, "cmapName"    # Ljava/lang/String;
    .param p1, "cmap"    # Lcom/itextpdf/io/font/cmap/AbstractCMap;
    .param p2, "location"    # Lcom/itextpdf/io/font/cmap/ICMapLocation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 51
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/itextpdf/io/font/cmap/CMapParser;->parseCid(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/AbstractCMap;Lcom/itextpdf/io/font/cmap/ICMapLocation;I)V

    .line 52
    return-void
.end method

.method private static parseCid(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/AbstractCMap;Lcom/itextpdf/io/font/cmap/ICMapLocation;I)V
    .locals 11
    .param p0, "cmapName"    # Ljava/lang/String;
    .param p1, "cmap"    # Lcom/itextpdf/io/font/cmap/AbstractCMap;
    .param p2, "location"    # Lcom/itextpdf/io/font/cmap/ICMapLocation;
    .param p3, "level"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 55
    const/16 v0, 0xa

    if-lt p3, v0, :cond_0

    .line 56
    return-void

    .line 57
    :cond_0
    invoke-interface {p2, p0}, Lcom/itextpdf/io/font/cmap/ICMapLocation;->getLocation(Ljava/lang/String;)Lcom/itextpdf/io/source/PdfTokenizer;

    move-result-object v0

    .line 59
    .local v0, "inp":Lcom/itextpdf/io/source/PdfTokenizer;
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/cmap/CMapObject;>;"
    new-instance v2, Lcom/itextpdf/io/font/cmap/CMapContentParser;

    invoke-direct {v2, v0}, Lcom/itextpdf/io/font/cmap/CMapContentParser;-><init>(Lcom/itextpdf/io/source/PdfTokenizer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    .local v2, "cp":Lcom/itextpdf/io/font/cmap/CMapContentParser;
    const/16 v3, 0x32

    .line 64
    .local v3, "maxExc":I
    :goto_0
    :try_start_1
    invoke-virtual {v2, v1}, Lcom/itextpdf/io/font/cmap/CMapContentParser;->parse(Ljava/util/List;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    nop

    .line 70
    :try_start_2
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_1

    .line 71
    goto/16 :goto_6

    .line 72
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {v4}, Lcom/itextpdf/io/font/cmap/CMapObject;->toString()Ljava/lang/String;

    move-result-object v4

    .line 73
    .local v4, "last":Ljava/lang/String;
    const/4 v6, 0x0

    const/4 v7, 0x3

    if-nez p3, :cond_6

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    if-ne v8, v7, :cond_6

    const-string v8, "def"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 74
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/io/font/cmap/CMapObject;

    .line 75
    .local v6, "cmapObject":Lcom/itextpdf/io/font/cmap/CMapObject;
    const-string v7, "Registry"

    invoke-virtual {v6}, Lcom/itextpdf/io/font/cmap/CMapObject;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 76
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {v5}, Lcom/itextpdf/io/font/cmap/CMapObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Lcom/itextpdf/io/font/cmap/AbstractCMap;->setRegistry(Ljava/lang/String;)V

    goto :goto_1

    .line 77
    :cond_2
    const-string v7, "Ordering"

    invoke-virtual {v6}, Lcom/itextpdf/io/font/cmap/CMapObject;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 78
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {v5}, Lcom/itextpdf/io/font/cmap/CMapObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Lcom/itextpdf/io/font/cmap/AbstractCMap;->setOrdering(Ljava/lang/String;)V

    goto :goto_1

    .line 79
    :cond_3
    const-string v7, "CMapName"

    invoke-virtual {v6}, Lcom/itextpdf/io/font/cmap/CMapObject;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 80
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {v5}, Lcom/itextpdf/io/font/cmap/CMapObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Lcom/itextpdf/io/font/cmap/AbstractCMap;->setName(Ljava/lang/String;)V

    goto :goto_1

    .line 81
    :cond_4
    const-string v7, "Supplement"

    invoke-virtual {v6}, Lcom/itextpdf/io/font/cmap/CMapObject;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v7, :cond_5

    .line 83
    :try_start_3
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {v5}, Lcom/itextpdf/io/font/cmap/CMapObject;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {p1, v5}, Lcom/itextpdf/io/font/cmap/AbstractCMap;->setSupplement(I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 85
    goto :goto_1

    .line 84
    :catch_0
    move-exception v5

    .line 87
    .end local v6    # "cmapObject":Lcom/itextpdf/io/font/cmap/CMapObject;
    :cond_5
    :goto_1
    goto/16 :goto_5

    :cond_6
    :try_start_4
    const-string v8, "endcidchar"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    const/4 v9, 0x2

    if-nez v8, :cond_7

    const-string v8, "endbfchar"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a

    :cond_7
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    if-lt v8, v7, :cond_a

    .line 88
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    sub-int/2addr v5, v9

    .line 89
    .local v5, "lMax":I
    const/4 v6, 0x0

    .local v6, "k":I
    :goto_2
    if-ge v6, v5, :cond_9

    .line 90
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {v7}, Lcom/itextpdf/io/font/cmap/CMapObject;->isString()Z

    move-result v7

    if-eqz v7, :cond_8

    .line 91
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {v7}, Lcom/itextpdf/io/font/cmap/CMapObject;->toString()Ljava/lang/String;

    move-result-object v7

    add-int/lit8 v8, v6, 0x1

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {p1, v7, v8}, Lcom/itextpdf/io/font/cmap/AbstractCMap;->addChar(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapObject;)V

    .line 89
    :cond_8
    add-int/lit8 v6, v6, 0x2

    goto :goto_2

    .line 94
    .end local v5    # "lMax":I
    .end local v6    # "k":I
    :cond_9
    goto/16 :goto_5

    :cond_a
    const-string v8, "endcidrange"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_b

    const-string v8, "endbfrange"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_e

    :cond_b
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    const/4 v10, 0x4

    if-lt v8, v10, :cond_e

    .line 95
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    sub-int/2addr v5, v7

    .line 96
    .restart local v5    # "lMax":I
    const/4 v6, 0x0

    .restart local v6    # "k":I
    :goto_3
    if-ge v6, v5, :cond_d

    .line 97
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {v7}, Lcom/itextpdf/io/font/cmap/CMapObject;->isString()Z

    move-result v7

    if-eqz v7, :cond_c

    add-int/lit8 v7, v6, 0x1

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {v7}, Lcom/itextpdf/io/font/cmap/CMapObject;->isString()Z

    move-result v7

    if-eqz v7, :cond_c

    .line 98
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {v7}, Lcom/itextpdf/io/font/cmap/CMapObject;->toString()Ljava/lang/String;

    move-result-object v7

    add-int/lit8 v8, v6, 0x1

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {v8}, Lcom/itextpdf/io/font/cmap/CMapObject;->toString()Ljava/lang/String;

    move-result-object v8

    add-int/lit8 v9, v6, 0x2

    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {p1, v7, v8, v9}, Lcom/itextpdf/io/font/cmap/AbstractCMap;->addRange(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapObject;)V

    .line 96
    :cond_c
    add-int/lit8 v6, v6, 0x3

    goto :goto_3

    .line 101
    .end local v5    # "lMax":I
    .end local v6    # "k":I
    :cond_d
    goto :goto_5

    :cond_e
    const-string/jumbo v7, "usecmap"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_f

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v7

    if-ne v7, v9, :cond_f

    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {v7}, Lcom/itextpdf/io/font/cmap/CMapObject;->isName()Z

    move-result v7

    if-eqz v7, :cond_f

    .line 102
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {v5}, Lcom/itextpdf/io/font/cmap/CMapObject;->toString()Ljava/lang/String;

    move-result-object v5

    add-int/lit8 v6, p3, 0x1

    invoke-static {v5, p1, p2, v6}, Lcom/itextpdf/io/font/cmap/CMapParser;->parseCid(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/AbstractCMap;Lcom/itextpdf/io/font/cmap/ICMapLocation;I)V

    goto :goto_5

    .line 103
    :cond_f
    const-string v6, "endcodespacerange"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_11

    .line 104
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_4
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v7

    add-int/2addr v7, v5

    if-ge v6, v7, :cond_11

    .line 105
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {v7}, Lcom/itextpdf/io/font/cmap/CMapObject;->isHexString()Z

    move-result v7

    if-eqz v7, :cond_10

    add-int/lit8 v7, v6, 0x1

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {v7}, Lcom/itextpdf/io/font/cmap/CMapObject;->isHexString()Z

    move-result v7

    if-eqz v7, :cond_10

    .line 106
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {v7}, Lcom/itextpdf/io/font/cmap/CMapObject;->toHexByteArray()[B

    move-result-object v7

    .line 107
    .local v7, "low":[B
    add-int/lit8 v8, v6, 0x1

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/io/font/cmap/CMapObject;

    invoke-virtual {v8}, Lcom/itextpdf/io/font/cmap/CMapObject;->toHexByteArray()[B

    move-result-object v8

    .line 108
    .local v8, "high":[B
    invoke-virtual {p1, v7, v8}, Lcom/itextpdf/io/font/cmap/AbstractCMap;->addCodeSpaceRange([B[B)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 104
    .end local v7    # "low":[B
    .end local v8    # "high":[B
    :cond_10
    add-int/lit8 v6, v6, 0x2

    goto :goto_4

    .line 112
    .end local v4    # "last":Ljava/lang/String;
    .end local v6    # "i":I
    :cond_11
    :goto_5
    goto/16 :goto_0

    .line 65
    :catch_1
    move-exception v4

    .line 66
    .local v4, "ex":Ljava/lang/Exception;
    add-int/lit8 v3, v3, -0x1

    if-gez v3, :cond_12

    .line 67
    goto :goto_6

    .line 68
    :cond_12
    goto/16 :goto_0

    .line 117
    .end local v1    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/cmap/CMapObject;>;"
    .end local v2    # "cp":Lcom/itextpdf/io/font/cmap/CMapContentParser;
    .end local v3    # "maxExc":I
    .end local v4    # "ex":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    goto :goto_7

    .line 113
    :catch_2
    move-exception v1

    .line 114
    .local v1, "ex":Ljava/lang/Exception;
    :try_start_5
    const-class v2, Lcom/itextpdf/io/font/cmap/CMapParser;

    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 115
    .local v2, "logger":Lorg/slf4j/Logger;
    const-string v3, "Unknown error while processing CMap."

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 117
    .end local v1    # "ex":Ljava/lang/Exception;
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :goto_6
    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->close()V

    .line 118
    nop

    .line 119
    return-void

    .line 117
    :goto_7
    invoke-virtual {v0}, Lcom/itextpdf/io/source/PdfTokenizer;->close()V

    .line 118
    throw v1
.end method
