.class Lcom/itextpdf/layout/tagging/TableTaggingRule;
.super Ljava/lang/Object;
.source "TableTaggingRule.java"

# interfaces
.implements Lcom/itextpdf/layout/tagging/ITaggingRule;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getKidRole(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;)Ljava/lang/String;
    .locals 3
    .param p0, "kidKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .param p1, "helper"    # Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    .line 114
    nop

    .line 115
    invoke-virtual {p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    .line 116
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTagStructureContext()Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    move-result-object v0

    .line 117
    invoke-virtual {p0}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getRole()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->resolveMappingToStandardOrDomainSpecificRole(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;

    move-result-object v0

    .line 118
    invoke-interface {v0}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->getRole()Ljava/lang/String;

    move-result-object v0

    .line 114
    return-object v0
.end method

.method private static getTbodyTag(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Lcom/itextpdf/layout/tagging/TaggingDummyElement;
    .locals 3
    .param p0, "tableHintKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 130
    const/4 v0, 0x1

    .line 131
    .local v0, "createTBody":Z
    invoke-virtual {p0}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v1

    instance-of v1, v1, Lcom/itextpdf/layout/element/Table;

    if-eqz v1, :cond_3

    .line 132
    invoke-virtual {p0}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/element/Table;

    .line 133
    .local v1, "modelElement":Lcom/itextpdf/layout/element/Table;
    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Table;->getHeader()Lcom/itextpdf/layout/element/Table;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Table;->isSkipFirstHeader()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 134
    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Table;->getFooter()Lcom/itextpdf/layout/element/Table;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {v1}, Lcom/itextpdf/layout/element/Table;->isSkipLastFooter()Z

    move-result v2

    if-nez v2, :cond_2

    :cond_1
    const/4 v2, 0x1

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    :goto_0
    move v0, v2

    .line 136
    .end local v1    # "modelElement":Lcom/itextpdf/layout/element/Table;
    :cond_3
    new-instance v1, Lcom/itextpdf/layout/tagging/TaggingDummyElement;

    if-eqz v0, :cond_4

    const-string v2, "TBody"

    goto :goto_1

    :cond_4
    const/4 v2, 0x0

    :goto_1
    invoke-direct {v1, v2}, Lcom/itextpdf/layout/tagging/TaggingDummyElement;-><init>(Ljava/lang/String;)V

    return-object v1
.end method

.method private static moveCaption(Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;)V
    .locals 4
    .param p0, "taggingHelper"    # Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .param p1, "caption"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .param p2, "tableHintKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 141
    invoke-virtual {p2}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v0

    instance-of v0, v0, Lcom/itextpdf/layout/element/Table;

    if-nez v0, :cond_0

    .line 142
    return-void

    .line 144
    :cond_0
    invoke-virtual {p2}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/element/Table;

    .line 145
    .local v0, "tableElem":Lcom/itextpdf/layout/element/Table;
    invoke-virtual {v0}, Lcom/itextpdf/layout/element/Table;->getCaption()Lcom/itextpdf/layout/element/Div;

    move-result-object v1

    .line 146
    .local v1, "captionDiv":Lcom/itextpdf/layout/element/Div;
    if-nez v1, :cond_1

    .line 147
    return-void

    .line 150
    :cond_1
    const/16 v2, 0x77

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/element/Div;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_2

    .line 151
    sget-object v2, Lcom/itextpdf/layout/properties/CaptionSide;->TOP:Lcom/itextpdf/layout/properties/CaptionSide;

    .local v2, "captionSide":Lcom/itextpdf/layout/properties/CaptionSide;
    goto :goto_0

    .line 153
    .end local v2    # "captionSide":Lcom/itextpdf/layout/properties/CaptionSide;
    :cond_2
    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/element/Div;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/properties/CaptionSide;

    .line 155
    .restart local v2    # "captionSide":Lcom/itextpdf/layout/properties/CaptionSide;
    :goto_0
    sget-object v3, Lcom/itextpdf/layout/properties/CaptionSide;->TOP:Lcom/itextpdf/layout/properties/CaptionSide;

    invoke-virtual {v3, v2}, Lcom/itextpdf/layout/properties/CaptionSide;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 156
    const/4 v3, 0x0

    invoke-virtual {p0, p1, p2, v3}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->moveKidHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;I)I

    goto :goto_1

    .line 158
    :cond_3
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->moveKidHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;)I

    .line 160
    :goto_1
    return-void
.end method


# virtual methods
.method public onTagFinish(Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z
    .locals 16
    .param p1, "taggingHelper"    # Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .param p2, "tableHintKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 41
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual/range {p1 .. p2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getAccessibleKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Ljava/util/List;

    move-result-object v2

    .line 43
    .local v2, "kidKeys":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    new-instance v3, Ljava/util/TreeMap;

    invoke-direct {v3}, Ljava/util/TreeMap;-><init>()V

    .line 44
    .local v3, "tableTags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/TreeMap<Ljava/lang/Integer;Lcom/itextpdf/layout/tagging/TaggingHintKey;>;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .local v4, "tableCellTagsUnindexed":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .local v5, "nonCellKids":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    const/4 v8, 0x1

    if-eqz v7, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 47
    .local v7, "kidKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-static {v7, v0}, Lcom/itextpdf/layout/tagging/TableTaggingRule;->getKidRole(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;)Ljava/lang/String;

    move-result-object v9

    .line 48
    .local v9, "kidRole":Ljava/lang/String;
    const-string v10, "TD"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_1

    const-string v10, "TH"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    goto :goto_1

    :cond_0
    const/4 v8, 0x0

    .line 49
    .local v8, "isCell":Z
    :cond_1
    :goto_1
    if-eqz v8, :cond_3

    invoke-virtual {v7}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v10

    instance-of v10, v10, Lcom/itextpdf/layout/element/Cell;

    if-eqz v10, :cond_3

    .line 50
    invoke-virtual {v7}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/layout/element/Cell;

    .line 51
    .local v10, "cell":Lcom/itextpdf/layout/element/Cell;
    invoke-virtual {v10}, Lcom/itextpdf/layout/element/Cell;->getRow()I

    move-result v11

    .line 52
    .local v11, "rowInd":I
    invoke-virtual {v10}, Lcom/itextpdf/layout/element/Cell;->getCol()I

    move-result v12

    .line 53
    .local v12, "colInd":I
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v3, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/TreeMap;

    .line 54
    .local v13, "rowTags":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/Integer;Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    if-nez v13, :cond_2

    .line 55
    new-instance v14, Ljava/util/TreeMap;

    invoke-direct {v14}, Ljava/util/TreeMap;-><init>()V

    move-object v13, v14

    .line 56
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-interface {v3, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    :cond_2
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v13, v14, v7}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .end local v10    # "cell":Lcom/itextpdf/layout/element/Cell;
    .end local v11    # "rowInd":I
    .end local v12    # "colInd":I
    .end local v13    # "rowTags":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/Integer;Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    goto :goto_2

    :cond_3
    if-eqz v8, :cond_4

    .line 60
    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 62
    :cond_4
    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .end local v7    # "kidKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .end local v8    # "isCell":Z
    .end local v9    # "kidRole":Ljava/lang/String;
    :goto_2
    goto :goto_0

    .line 66
    :cond_5
    invoke-static {v1}, Lcom/itextpdf/layout/tagging/TableTaggingRule;->getTbodyTag(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Lcom/itextpdf/layout/tagging/TaggingDummyElement;

    move-result-object v6

    .line 68
    .local v6, "tbodyTag":Lcom/itextpdf/layout/tagging/TaggingDummyElement;
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    const-string v10, "Caption"

    const-string v11, "TFoot"

    const-string v12, "THead"

    if-eqz v9, :cond_7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 69
    .local v9, "nonCellKid":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-static {v9, v0}, Lcom/itextpdf/layout/tagging/TableTaggingRule;->getKidRole(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;)Ljava/lang/String;

    move-result-object v13

    .line 70
    .local v13, "kidRole":Ljava/lang/String;
    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_6

    invoke-virtual {v11, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_6

    .line 71
    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_6

    .line 74
    invoke-virtual {v0, v9, v1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->moveKidHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;)I

    .line 76
    .end local v9    # "nonCellKid":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .end local v13    # "kidRole":Ljava/lang/String;
    :cond_6
    goto :goto_3

    .line 77
    :cond_7
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_4
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_9

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 78
    .restart local v9    # "nonCellKid":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-static {v9, v0}, Lcom/itextpdf/layout/tagging/TableTaggingRule;->getKidRole(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_8

    .line 79
    invoke-virtual {v0, v9, v1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->moveKidHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;)I

    .line 81
    .end local v9    # "nonCellKid":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    :cond_8
    goto :goto_4

    .line 82
    :cond_9
    nop

    .line 83
    invoke-static {v6}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getOrCreateHintKey(Lcom/itextpdf/layout/IPropertyContainer;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    .line 82
    const/4 v9, -0x1

    invoke-virtual {v0, v1, v7, v9}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Ljava/util/Collection;I)V

    .line 84
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_5
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_b

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 85
    .local v12, "nonCellKid":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-static {v12, v0}, Lcom/itextpdf/layout/tagging/TableTaggingRule;->getKidRole(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_a

    .line 86
    invoke-virtual {v0, v12, v1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->moveKidHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;)I

    .line 88
    .end local v12    # "nonCellKid":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    :cond_a
    goto :goto_5

    .line 89
    :cond_b
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_6
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_f

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/TreeMap;

    .line 90
    .local v11, "rowTags":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/Integer;Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    new-instance v12, Lcom/itextpdf/layout/tagging/TaggingDummyElement;

    const-string v13, "TR"

    invoke-direct {v12, v13}, Lcom/itextpdf/layout/tagging/TaggingDummyElement;-><init>(Ljava/lang/String;)V

    .line 91
    .local v12, "row":Lcom/itextpdf/layout/tagging/TaggingDummyElement;
    invoke-static {v12}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getOrCreateHintKey(Lcom/itextpdf/layout/IPropertyContainer;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v13

    .line 92
    .local v13, "rowTagHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-virtual {v11}, Ljava/util/TreeMap;->values()Ljava/util/Collection;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_7
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_c

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 93
    .local v15, "cellTagHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-virtual {v0, v15, v13}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->moveKidHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;)I

    .line 94
    .end local v15    # "cellTagHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    goto :goto_7

    .line 95
    :cond_c
    if-eqz v4, :cond_e

    .line 96
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_8
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_d

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 97
    .restart local v15    # "cellTagHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-virtual {v0, v15, v13}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->moveKidHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;)I

    .line 98
    .end local v15    # "cellTagHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    goto :goto_8

    .line 99
    :cond_d
    const/4 v4, 0x0

    .line 101
    :cond_e
    invoke-static {v12}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v14

    invoke-virtual {v0, v6, v14, v9}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addKidsHint(Lcom/itextpdf/layout/IPropertyContainer;Ljava/lang/Iterable;I)V

    .line 102
    .end local v11    # "rowTags":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/Integer;Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    .end local v12    # "row":Lcom/itextpdf/layout/tagging/TaggingDummyElement;
    .end local v13    # "rowTagHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    goto :goto_6

    .line 104
    :cond_f
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_9
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_11

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 105
    .restart local v9    # "nonCellKid":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-static {v9, v0}, Lcom/itextpdf/layout/tagging/TableTaggingRule;->getKidRole(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_10

    .line 106
    invoke-static {v0, v9, v1}, Lcom/itextpdf/layout/tagging/TableTaggingRule;->moveCaption(Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;)V

    .line 108
    .end local v9    # "nonCellKid":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    :cond_10
    goto :goto_9

    .line 110
    :cond_11
    return v8
.end method
