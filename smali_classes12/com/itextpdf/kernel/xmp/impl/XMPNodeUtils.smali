.class public final Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;
.super Ljava/lang/Object;
.source "XMPNodeUtils.java"

# interfaces
.implements Lcom/itextpdf/kernel/xmp/XMPConst;


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field static final CLT_FIRST_ITEM:I = 0x5

.field static final CLT_MULTIPLE_GENERIC:I = 0x3

.field static final CLT_NO_VALUES:I = 0x0

.field static final CLT_SINGLE_GENERIC:I = 0x2

.field static final CLT_SPECIFIC_MATCH:I = 0x1

.field static final CLT_XDEFAULT:I = 0x4


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 54
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    return-void
.end method

.method static appendLangItem(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "arrayNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p1, "itemLang"    # Ljava/lang/String;
    .param p2, "itemValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 801
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const-string v1, "[]"

    const/4 v2, 0x0

    invoke-direct {v0, v1, p2, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 802
    .local v0, "newItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    new-instance v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const-string/jumbo v3, "xml:lang"

    invoke-direct {v1, v3, p1, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 803
    .local v1, "langQual":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addQualifier(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 805
    const-string/jumbo v2, "x-default"

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 807
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    goto :goto_0

    .line 811
    :cond_0
    const/4 v2, 0x1

    invoke-virtual {p0, v2, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(ILcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 813
    :goto_0
    return-void
.end method

.method static chooseLocalizedText(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/Object;
    .locals 9
    .param p0, "arrayNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p1, "genericLang"    # Ljava/lang/String;
    .param p2, "specificLang"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 840
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v0

    const/16 v1, 0x66

    if-eqz v0, :cond_b

    .line 844
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v0

    if-nez v0, :cond_0

    .line 846
    new-instance v0, Ljava/lang/Integer;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    const/4 v1, 0x0

    filled-new-array {v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 849
    :cond_0
    const/4 v0, 0x0

    .line 850
    .local v0, "foundGenericMatches":I
    const/4 v2, 0x0

    .line 851
    .local v2, "resultNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const/4 v3, 0x0

    .line 854
    .local v3, "xDefault":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_7

    .line 856
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 859
    .local v5, "currItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v5}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result v7

    if-nez v7, :cond_6

    .line 863
    invoke-virtual {v5}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasQualifier()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 864
    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "xml:lang"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 870
    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v7

    .line 873
    .local v7, "currLang":Ljava/lang/String;
    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 875
    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, v6}, Ljava/lang/Integer;-><init>(I)V

    filled-new-array {v1, v5}, [Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 877
    :cond_1
    if-eqz p1, :cond_3

    invoke-virtual {v7, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 879
    if-nez v2, :cond_2

    .line 881
    move-object v2, v5

    .line 884
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 886
    :cond_3
    const-string/jumbo v6, "x-default"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 888
    move-object v3, v5

    .line 890
    .end local v5    # "currItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v7    # "currLang":Ljava/lang/String;
    :cond_4
    :goto_1
    goto :goto_0

    .line 866
    .restart local v5    # "currItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_5
    new-instance v6, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v7, "Alt-text array item has no language qualifier"

    invoke-direct {v6, v7, v1}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v6

    .line 861
    :cond_6
    new-instance v6, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v7, "Alt-text array item is not simple"

    invoke-direct {v6, v7, v1}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v6

    .line 893
    .end local v4    # "it":Ljava/util/Iterator;
    .end local v5    # "currItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_7
    if-ne v0, v6, :cond_8

    .line 895
    new-instance v1, Ljava/lang/Integer;

    const/4 v4, 0x2

    invoke-direct {v1, v4}, Ljava/lang/Integer;-><init>(I)V

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 897
    :cond_8
    if-le v0, v6, :cond_9

    .line 899
    new-instance v1, Ljava/lang/Integer;

    const/4 v4, 0x3

    invoke-direct {v1, v4}, Ljava/lang/Integer;-><init>(I)V

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 901
    :cond_9
    if-eqz v3, :cond_a

    .line 903
    new-instance v1, Ljava/lang/Integer;

    const/4 v4, 0x4

    invoke-direct {v1, v4}, Ljava/lang/Integer;-><init>(I)V

    filled-new-array {v1, v3}, [Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 908
    :cond_a
    new-instance v1, Ljava/lang/Integer;

    const/4 v4, 0x5

    invoke-direct {v1, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {p0, v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChild(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v4

    filled-new-array {v1, v4}, [Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 842
    .end local v0    # "foundGenericMatches":I
    .end local v2    # "resultNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v3    # "xDefault":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_b
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Localized text array is not alt-text"

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method static deleteNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 2
    .param p0, "node"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 318
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getParent()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    .line 320
    .local v0, "parent":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isQualifier()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 323
    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeQualifier(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    goto :goto_0

    .line 328
    :cond_0
    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 332
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isSchemaNode()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 334
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getParent()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 336
    :cond_1
    return-void
.end method

.method static detectAltText(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 4
    .param p0, "arrayNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 768
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAlternate()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 770
    const/4 v0, 0x0

    .line 771
    .local v0, "isAltText":Z
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 773
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 774
    .local v2, "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 776
    const/4 v0, 0x1

    .line 777
    goto :goto_1

    .line 779
    .end local v2    # "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_0
    goto :goto_0

    .line 781
    .end local v1    # "it":Ljava/util/Iterator;
    :cond_1
    :goto_1
    if-eqz v0, :cond_2

    .line 783
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArrayAltText(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 784
    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->normalizeLangArray(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 787
    .end local v0    # "isAltText":Z
    :cond_2
    return-void
.end method

.method static findChildNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .locals 4
    .param p0, "parent"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p1, "childName"    # Ljava/lang/String;
    .param p2, "createNodes"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 171
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isSchemaNode()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isStruct()Z

    move-result v0

    if-nez v0, :cond_2

    .line 173
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->isImplicit()Z

    move-result v0

    const/16 v2, 0x66

    if-eqz v0, :cond_1

    .line 178
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v0

    if-nez v0, :cond_0

    .line 183
    if-eqz p2, :cond_2

    .line 185
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setStruct(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    goto :goto_0

    .line 180
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Named children not allowed for arrays"

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 175
    :cond_1
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Named children only allowed for schemas and structs"

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 189
    :cond_2
    :goto_0
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->findChildByName(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    .line 191
    .local v0, "childNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-nez v0, :cond_3

    if-eqz p2, :cond_3

    .line 193
    new-instance v2, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    invoke-direct {v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;-><init>()V

    .line 194
    .local v2, "options":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    new-instance v3, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-direct {v3, p1, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    move-object v0, v3

    .line 195
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setImplicit(Z)V

    .line 196
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 199
    .end local v2    # "options":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    :cond_3
    if-nez v0, :cond_5

    if-nez p2, :cond_4

    goto :goto_1

    :cond_4
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 201
    :cond_5
    :goto_1
    return-object v0
.end method

.method private static findIndexedItem(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)I
    .locals 5
    .param p0, "arrayNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p1, "segment"    # Ljava/lang/String;
    .param p2, "createNodes"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 585
    const/4 v0, 0x0

    .line 589
    .local v0, "index":I
    const/16 v1, 0x66

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    move-object p1, v2

    .line 590
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v2

    .line 591
    if-lt v0, v3, :cond_1

    .line 600
    nop

    .line 602
    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v1

    add-int/2addr v1, v3

    if-ne v0, v1, :cond_0

    .line 605
    new-instance v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const-string v2, "[]"

    const/4 v4, 0x0

    invoke-direct {v1, v2, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 606
    .local v1, "newItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setImplicit(Z)V

    .line 607
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 610
    .end local v1    # "newItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_0
    return v0

    .line 593
    :cond_1
    :try_start_1
    new-instance v2, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v3, "Array index must be larger than zero"

    invoke-direct {v2, v3, v1}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    .end local v0    # "index":I
    .end local p0    # "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local p1    # "segment":Ljava/lang/String;
    .end local p2    # "createNodes":Z
    throw v2
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 597
    .restart local v0    # "index":I
    .restart local p0    # "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .restart local p1    # "segment":Ljava/lang/String;
    .restart local p2    # "createNodes":Z
    :catch_0
    move-exception v2

    .line 599
    .local v2, "e":Ljava/lang/NumberFormatException;
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v4, "Array index not digits."

    invoke-direct {v3, v4, v1}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3
.end method

.method static findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .locals 8
    .param p0, "xmpTree"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p1, "xpath"    # Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    .param p2, "createNodes"    # Z
    .param p3, "leafOptions"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 222
    if-eqz p1, :cond_a

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->size()I

    move-result v0

    if-eqz v0, :cond_a

    .line 229
    const/4 v0, 0x0

    .line 230
    .local v0, "rootImplicitNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const/4 v1, 0x0

    .line 233
    .local v1, "currNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    nop

    .line 234
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getName()Ljava/lang/String;

    move-result-object v3

    .line 233
    invoke-static {p0, v3, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findSchemaNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    .line 235
    const/4 v3, 0x0

    if-nez v1, :cond_0

    .line 237
    return-object v3

    .line 239
    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->isImplicit()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 241
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setImplicit(Z)V

    .line 242
    move-object v0, v1

    .line 249
    :cond_1
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->size()I

    move-result v5

    if-ge v4, v5, :cond_7

    .line 251
    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    move-result-object v5

    invoke-static {v1, v5, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->followXPathStep(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v5

    move-object v1, v5

    .line 252
    if-nez v1, :cond_3

    .line 254
    if-eqz p2, :cond_2

    .line 257
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->deleteNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 259
    :cond_2
    return-object v3

    .line 261
    :cond_3
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->isImplicit()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 264
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setImplicit(Z)V

    .line 268
    const/4 v5, 0x1

    if-ne v4, v5, :cond_4

    .line 269
    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->isAlias()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 270
    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getAliasForm()I

    move-result v6

    if-eqz v6, :cond_4

    .line 272
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v6

    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getAliasForm()I

    move-result v7

    invoke-virtual {v6, v7, v5}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setOption(IZ)V

    goto :goto_1

    .line 275
    :cond_4
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->size()I

    move-result v6

    sub-int/2addr v6, v5

    if-ge v4, v6, :cond_5

    .line 276
    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getKind()I

    move-result v6

    if-ne v6, v5, :cond_5

    .line 277
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result v6

    if-nez v6, :cond_5

    .line 279
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setStruct(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 282
    :cond_5
    :goto_1
    if-nez v0, :cond_6

    .line 284
    move-object v0, v1

    .line 249
    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 297
    .end local v4    # "i":I
    :cond_7
    nop

    .line 300
    if-eqz v0, :cond_8

    .line 303
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2, p3}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->mergeWith(Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 304
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setOptions(Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 307
    :cond_8
    return-object v1

    .line 289
    :catch_0
    move-exception v2

    .line 292
    .local v2, "e":Lcom/itextpdf/kernel/xmp/XMPException;
    if-eqz v0, :cond_9

    .line 294
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->deleteNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 296
    :cond_9
    throw v2

    .line 224
    .end local v0    # "rootImplicitNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v1    # "currNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v2    # "e":Lcom/itextpdf/kernel/xmp/XMPException;
    :cond_a
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Empty XMPPath"

    const/16 v2, 0x66

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static findQualifierNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .locals 3
    .param p0, "parent"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p1, "qualName"    # Ljava/lang/String;
    .param p2, "createNodes"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 559
    const-string v0, "?"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 561
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->findQualifierByName(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    .line 563
    .local v0, "qualNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-nez v0, :cond_0

    if-eqz p2, :cond_0

    .line 565
    new-instance v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    move-object v0, v1

    .line 566
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setImplicit(Z)V

    .line 568
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addQualifier(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 571
    :cond_0
    return-object v0

    .line 559
    .end local v0    # "qualNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method static findSchemaNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .locals 5
    .param p0, "tree"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "suggestedPrefix"    # Ljava/lang/String;
    .param p3, "createNodes"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 120
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getParent()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    if-nez v0, :cond_3

    .line 121
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->findChildByName(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    .line 123
    .local v0, "schemaNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-nez v0, :cond_2

    if-eqz p3, :cond_2

    .line 125
    new-instance v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    new-instance v2, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    invoke-direct {v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;-><init>()V

    .line 127
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setSchemaNode(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    move-object v0, v1

    .line 128
    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setImplicit(Z)V

    .line 131
    invoke-static {}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->getSchemaRegistry()Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;->getNamespacePrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 132
    .local v1, "prefix":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 134
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    .line 136
    invoke-static {}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->getSchemaRegistry()Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;

    move-result-object v2

    invoke-interface {v2, p1, p2}, Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 141
    :cond_0
    new-instance v2, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v3, "Unregistered schema namespace URI"

    const/16 v4, 0x65

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 146
    :cond_1
    :goto_0
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    .line 148
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 151
    .end local v1    # "prefix":Ljava/lang/String;
    :cond_2
    return-object v0

    .line 120
    .end local v0    # "schemaNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_3
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method static findSchemaNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .locals 1
    .param p0, "tree"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "createNodes"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 97
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findSchemaNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    return-object v0
.end method

.method private static followXPathStep(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .locals 8
    .param p0, "parentNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p1, "nextStep"    # Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;
    .param p2, "createNodes"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 481
    const/4 v0, 0x0

    .line 482
    .local v0, "nextNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const/4 v1, 0x0

    .line 483
    .local v1, "index":I
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getKind()I

    move-result v2

    .line 485
    .local v2, "stepKind":I
    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 487
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    goto :goto_1

    .line 489
    :cond_0
    const/4 v4, 0x2

    if-ne v2, v4, :cond_1

    .line 491
    nop

    .line 492
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 491
    invoke-static {p0, v3, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findQualifierNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    goto :goto_1

    .line 498
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 503
    const/4 v4, 0x3

    if-ne v2, v4, :cond_2

    .line 505
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findIndexedItem(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)I

    move-result v1

    goto :goto_0

    .line 507
    :cond_2
    const/4 v4, 0x4

    if-ne v2, v4, :cond_3

    .line 509
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v1

    goto :goto_0

    .line 511
    :cond_3
    const/4 v4, 0x6

    const/4 v5, 0x0

    if-ne v2, v4, :cond_4

    .line 513
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/itextpdf/kernel/xmp/impl/Utils;->splitNameAndValue(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 514
    .local v4, "result":[Ljava/lang/String;
    aget-object v5, v4, v5

    .line 515
    .local v5, "fieldName":Ljava/lang/String;
    aget-object v6, v4, v3

    .line 516
    .local v6, "fieldValue":Ljava/lang/String;
    invoke-static {p0, v5, v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->lookupFieldSelector(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 517
    .end local v4    # "result":[Ljava/lang/String;
    .end local v5    # "fieldName":Ljava/lang/String;
    .end local v6    # "fieldValue":Ljava/lang/String;
    goto :goto_0

    .line 518
    :cond_4
    const/4 v4, 0x5

    if-ne v2, v4, :cond_6

    .line 520
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/itextpdf/kernel/xmp/impl/Utils;->splitNameAndValue(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 521
    .restart local v4    # "result":[Ljava/lang/String;
    aget-object v5, v4, v5

    .line 522
    .local v5, "qualName":Ljava/lang/String;
    aget-object v6, v4, v3

    .line 523
    .local v6, "qualValue":Ljava/lang/String;
    nop

    .line 524
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getAliasForm()I

    move-result v7

    .line 523
    invoke-static {p0, v5, v6, v7}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->lookupQualSelector(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    .line 525
    .end local v4    # "result":[Ljava/lang/String;
    .end local v5    # "qualName":Ljava/lang/String;
    .end local v6    # "qualValue":Ljava/lang/String;
    nop

    .line 532
    :goto_0
    if-gt v3, v1, :cond_5

    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v3

    if-gt v1, v3, :cond_5

    .line 534
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChild(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    .line 538
    :cond_5
    :goto_1
    return-object v0

    .line 528
    :cond_6
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v4, "Unknown array indexing step in FollowXPathStep"

    const/16 v5, 0x9

    invoke-direct {v3, v4, v5}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 500
    :cond_7
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v4, "Indexing applied to non-array"

    const/16 v5, 0x66

    invoke-direct {v3, v4, v5}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3
.end method

.method private static lookupFieldSelector(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)I
    .locals 6
    .param p0, "arrayNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p1, "fieldName"    # Ljava/lang/String;
    .param p2, "fieldValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 628
    const/4 v0, -0x1

    .line 630
    .local v0, "result":I
    const/4 v1, 0x1

    .local v1, "index":I
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v2

    if-gt v1, v2, :cond_4

    if-gez v0, :cond_4

    .line 632
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChild(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v2

    .line 634
    .local v2, "currItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isStruct()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 640
    const/4 v3, 0x1

    .local v3, "f":I
    :goto_1
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v4

    if-gt v3, v4, :cond_2

    .line 642
    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChild(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v4

    .line 643
    .local v4, "currField":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 645
    goto :goto_2

    .line 647
    :cond_0
    invoke-virtual {v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 649
    move v0, v1

    .line 650
    goto :goto_3

    .line 640
    .end local v4    # "currField":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_1
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 630
    .end local v2    # "currItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v3    # "f":I
    :cond_2
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 636
    .restart local v2    # "currItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_3
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v4, "Field selector must be used on array of struct"

    const/16 v5, 0x66

    invoke-direct {v3, v4, v5}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 655
    .end local v1    # "index":I
    .end local v2    # "currItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_4
    return v0
.end method

.method static lookupLanguageItem(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;)I
    .locals 5
    .param p0, "arrayNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p1, "language"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 925
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 930
    const/4 v0, 0x1

    .local v0, "index":I
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v1

    if-gt v0, v1, :cond_2

    .line 932
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChild(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    .line 933
    .local v1, "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasQualifier()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "xml:lang"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 935
    goto :goto_1

    .line 937
    :cond_0
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 939
    return v0

    .line 930
    .end local v1    # "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 943
    .end local v0    # "index":I
    :cond_2
    const/4 v0, -0x1

    return v0

    .line 927
    :cond_3
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Language item must be used on array"

    const/16 v2, 0x66

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static lookupQualSelector(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;I)I
    .locals 6
    .param p0, "arrayNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p1, "qualName"    # Ljava/lang/String;
    .param p2, "qualValue"    # Ljava/lang/String;
    .param p3, "aliasForm"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 676
    const-string/jumbo v0, "xml:lang"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 678
    invoke-static {p2}, Lcom/itextpdf/kernel/xmp/impl/Utils;->normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 679
    invoke-static {p0, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->lookupLanguageItem(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;)I

    move-result v1

    .line 680
    .local v1, "index":I
    if-gez v1, :cond_0

    and-int/lit16 v2, p3, 0x1000

    if-lez v2, :cond_0

    .line 682
    new-instance v2, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const-string v3, "[]"

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 683
    .local v2, "langNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    new-instance v3, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const-string/jumbo v5, "x-default"

    invoke-direct {v3, v0, v5, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 684
    .local v3, "xdefault":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addQualifier(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 685
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(ILcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 686
    return v0

    .line 690
    .end local v2    # "langNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v3    # "xdefault":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_0
    return v1

    .line 695
    .end local v1    # "index":I
    :cond_1
    const/4 v0, 0x1

    .local v0, "index":I
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 697
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChild(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    .line 699
    .local v1, "currItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 701
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 702
    .local v3, "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 703
    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 705
    return v0

    .line 707
    .end local v3    # "qualifier":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_2
    goto :goto_1

    .line 695
    .end local v1    # "currItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v2    # "it":Ljava/util/Iterator;
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 709
    .end local v0    # "index":I
    :cond_4
    const/4 v0, -0x1

    return v0
.end method

.method static normalizeLangArray(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    .locals 5
    .param p0, "arrayNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 726
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v0

    if-nez v0, :cond_0

    .line 728
    return-void

    .line 732
    :cond_0
    const/4 v0, 0x2

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v1

    if-gt v0, v1, :cond_2

    .line 734
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChild(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    .line 735
    .local v1, "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasQualifier()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "x-default"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 740
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeChild(I)V

    .line 741
    invoke-virtual {p0, v2, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(ILcom/itextpdf/kernel/xmp/impl/XMPNode;)V
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 747
    nop

    .line 749
    const/4 v2, 0x2

    if-ne v0, v2, :cond_2

    .line 751
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChild(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v2

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 743
    :catch_0
    move-exception v2

    .line 746
    .local v2, "e":Lcom/itextpdf/kernel/xmp/XMPException;
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 732
    .end local v1    # "child":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v2    # "e":Lcom/itextpdf/kernel/xmp/XMPException;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 756
    .end local v0    # "i":I
    :cond_2
    :goto_1
    return-void
.end method

.method static serializeNodeValue(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "value"    # Ljava/lang/Object;

    .line 416
    if-nez p0, :cond_0

    .line 418
    const/4 v0, 0x0

    .local v0, "strValue":Ljava/lang/String;
    goto/16 :goto_0

    .line 420
    .end local v0    # "strValue":Ljava/lang/String;
    :cond_0
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    .line 422
    move-object v0, p0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/XMPUtils;->convertFromBoolean(Z)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "strValue":Ljava/lang/String;
    goto :goto_0

    .line 424
    .end local v0    # "strValue":Ljava/lang/String;
    :cond_1
    instance-of v0, p0, Ljava/lang/Integer;

    if-eqz v0, :cond_2

    .line 426
    move-object v0, p0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/XMPUtils;->convertFromInteger(I)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "strValue":Ljava/lang/String;
    goto :goto_0

    .line 428
    .end local v0    # "strValue":Ljava/lang/String;
    :cond_2
    instance-of v0, p0, Ljava/lang/Long;

    if-eqz v0, :cond_3

    .line 430
    move-object v0, p0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/itextpdf/kernel/xmp/XMPUtils;->convertFromLong(J)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "strValue":Ljava/lang/String;
    goto :goto_0

    .line 432
    .end local v0    # "strValue":Ljava/lang/String;
    :cond_3
    instance-of v0, p0, Ljava/lang/Double;

    if-eqz v0, :cond_4

    .line 434
    move-object v0, p0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/itextpdf/kernel/xmp/XMPUtils;->convertFromDouble(D)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "strValue":Ljava/lang/String;
    goto :goto_0

    .line 436
    .end local v0    # "strValue":Ljava/lang/String;
    :cond_4
    instance-of v0, p0, Lcom/itextpdf/kernel/xmp/XMPDateTime;

    if-eqz v0, :cond_5

    .line 438
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/xmp/XMPDateTime;

    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/XMPUtils;->convertFromDate(Lcom/itextpdf/kernel/xmp/XMPDateTime;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "strValue":Ljava/lang/String;
    goto :goto_0

    .line 440
    .end local v0    # "strValue":Ljava/lang/String;
    :cond_5
    instance-of v0, p0, Ljava/util/GregorianCalendar;

    if-eqz v0, :cond_6

    .line 442
    move-object v0, p0

    check-cast v0, Ljava/util/GregorianCalendar;

    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/XMPDateTimeFactory;->createFromCalendar(Ljava/util/Calendar;)Lcom/itextpdf/kernel/xmp/XMPDateTime;

    move-result-object v0

    .line 443
    .local v0, "dt":Lcom/itextpdf/kernel/xmp/XMPDateTime;
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/XMPUtils;->convertFromDate(Lcom/itextpdf/kernel/xmp/XMPDateTime;)Ljava/lang/String;

    move-result-object v0

    .line 444
    .local v0, "strValue":Ljava/lang/String;
    goto :goto_0

    .line 445
    .end local v0    # "strValue":Ljava/lang/String;
    :cond_6
    instance-of v0, p0, [B

    if-eqz v0, :cond_7

    .line 447
    move-object v0, p0

    check-cast v0, [B

    check-cast v0, [B

    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/XMPUtils;->encodeBase64([B)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "strValue":Ljava/lang/String;
    goto :goto_0

    .line 451
    .end local v0    # "strValue":Ljava/lang/String;
    :cond_7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 454
    .restart local v0    # "strValue":Ljava/lang/String;
    :goto_0
    if-eqz v0, :cond_8

    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/Utils;->removeControlChars(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_8
    const/4 v1, 0x0

    :goto_1
    return-object v1
.end method

.method static setNodeValue(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/Object;)V
    .locals 3
    .param p0, "node"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p1, "value"    # Ljava/lang/Object;

    .line 347
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->serializeNodeValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 348
    .local v0, "strValue":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isQualifier()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string/jumbo v1, "xml:lang"

    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 354
    :cond_0
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/Utils;->normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 350
    :cond_1
    :goto_0
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    .line 356
    :goto_1
    return-void
.end method

.method static verifySetOptions(Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Ljava/lang/Object;)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .locals 3
    .param p0, "options"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .param p1, "itemValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 372
    if-nez p0, :cond_0

    .line 375
    new-instance v0, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;-><init>()V

    move-object p0, v0

    .line 378
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 380
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArrayAlternate(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 383
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAlternate()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 385
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArrayOrdered(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 388
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayOrdered()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 390
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArray(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 393
    :cond_3
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result v0

    if-eqz v0, :cond_5

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_4

    goto :goto_0

    .line 395
    :cond_4
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Structs and arrays can\'t have values"

    const/16 v2, 0x67

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 399
    :cond_5
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOptions()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->assertConsistency(I)V

    .line 401
    return-object p0
.end method
