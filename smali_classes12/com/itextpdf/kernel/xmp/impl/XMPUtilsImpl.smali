.class public final Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;
.super Ljava/lang/Object;
.source "XMPUtilsImpl.java"

# interfaces
.implements Lcom/itextpdf/kernel/xmp/XMPConst;


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final COMMAS:Ljava/lang/String; = ",\uff0c\uff64\ufe50\ufe51\u3001\u060c\u055d"

.field private static final CONTROLS:Ljava/lang/String; = "\u2028\u2029"

.field private static final QUOTES:Ljava/lang/String; = "\"\u00ab\u00bb\u301d\u301e\u301f\u2015\u2039\u203a"

.field private static final SEMICOLA:Ljava/lang/String; = ";\uff1b\ufe54\u061b\u037e"

.field private static final SPACES:Ljava/lang/String; = " \u3000\u303f"

.field private static final UCK_COMMA:I = 0x2

.field private static final UCK_CONTROL:I = 0x5

.field private static final UCK_NORMAL:I = 0x0

.field private static final UCK_QUOTE:I = 0x4

.field private static final UCK_SEMICOLON:I = 0x3

.field private static final UCK_SPACE:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 50
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    return-void
.end method

.method public static appendProperties(Lcom/itextpdf/kernel/xmp/XMPMeta;Lcom/itextpdf/kernel/xmp/XMPMeta;ZZZ)V
    .locals 11
    .param p0, "source"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p1, "destination"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p2, "doAllProperties"    # Z
    .param p3, "replaceOldValues"    # Z
    .param p4, "deleteEmptyValues"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 537
    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertImplementation(Lcom/itextpdf/kernel/xmp/XMPMeta;)V

    .line 538
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertImplementation(Lcom/itextpdf/kernel/xmp/XMPMeta;)V

    .line 540
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    .line 541
    .local v0, "src":Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    .line 543
    .local v1, "dest":Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 545
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 548
    .local v3, "sourceSchema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v4

    .line 549
    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v5

    .line 548
    const/4 v6, 0x0

    invoke-static {v4, v5, v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findSchemaNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v4

    .line 550
    .local v4, "destSchema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const/4 v5, 0x0

    .line 551
    .local v5, "createdSchema":Z
    if-nez v4, :cond_0

    .line 553
    new-instance v6, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    invoke-direct {v9}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;-><init>()V

    .line 554
    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setSchemaNode(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v9

    invoke-direct {v6, v7, v8, v9}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    move-object v4, v6

    .line 555
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v6

    invoke-virtual {v6, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 556
    const/4 v5, 0x1

    .line 560
    :cond_0
    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "ic":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 562
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 563
    .local v7, "sourceProp":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-nez p2, :cond_1

    .line 564
    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/itextpdf/kernel/xmp/impl/Utils;->isInternalProperty(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 566
    :cond_1
    invoke-static {v1, v7, v4, p3, p4}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->appendSubtree(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/XMPNode;ZZ)V

    .line 569
    .end local v7    # "sourceProp":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_2
    goto :goto_1

    .line 571
    .end local v6    # "ic":Ljava/util/Iterator;
    :cond_3
    invoke-virtual {v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v6

    if-nez v6, :cond_5

    if-nez v5, :cond_4

    if-eqz p4, :cond_5

    .line 574
    :cond_4
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v6

    invoke-virtual {v6, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 576
    .end local v3    # "sourceSchema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v4    # "destSchema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v5    # "createdSchema":Z
    :cond_5
    goto :goto_0

    .line 577
    .end local v2    # "it":Ljava/util/Iterator;
    :cond_6
    return-void
.end method

.method private static appendSubtree(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/XMPNode;ZZ)V
    .locals 16
    .param p0, "destXMP"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .param p1, "sourceNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p2, "destParent"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p3, "replaceOldValues"    # Z
    .param p4, "deleteEmptyValues"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 620
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v1, v4, v5}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v4

    .line 622
    .local v4, "destNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const/4 v6, 0x0

    .line 623
    .local v6, "valueIsEmpty":Z
    const/4 v7, 0x1

    if-eqz v3, :cond_3

    .line 625
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isSimple()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 626
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_0

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_2

    :cond_0
    move v5, v7

    goto :goto_0

    .line 627
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v8

    if-nez v8, :cond_2

    move v5, v7

    :cond_2
    :goto_0
    move v6, v5

    .line 630
    :cond_3
    if-eqz v3, :cond_4

    if-eqz v6, :cond_4

    .line 632
    if-eqz v4, :cond_17

    .line 634
    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    goto/16 :goto_7

    .line 637
    :cond_4
    if-nez v4, :cond_5

    .line 640
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->clone()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    invoke-virtual {v1, v5}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    goto/16 :goto_7

    .line 642
    :cond_5
    if-eqz v2, :cond_6

    .line 645
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v8

    invoke-virtual {v0, v4, v5, v8, v7}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->setNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/Object;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Z)V

    .line 646
    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 647
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->clone()Ljava/lang/Object;

    move-result-object v5

    move-object v4, v5

    check-cast v4, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 648
    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    goto/16 :goto_7

    .line 655
    :cond_6
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v5

    .line 656
    .local v5, "sourceForm":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v8

    .line 657
    .local v8, "destForm":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    if-eq v5, v8, :cond_7

    .line 659
    return-void

    .line 661
    :cond_7
    invoke-virtual {v5}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isStruct()Z

    move-result v9

    if-eqz v9, :cond_a

    .line 666
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "it":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_9

    .line 668
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 669
    .local v9, "sourceField":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-static {v0, v9, v4, v2, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->appendSubtree(Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/XMPNode;ZZ)V

    .line 671
    if-eqz v3, :cond_8

    invoke-virtual {v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v10

    if-nez v10, :cond_8

    .line 673
    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 675
    .end local v9    # "sourceField":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_8
    goto :goto_1

    .end local v7    # "it":Ljava/util/Iterator;
    :cond_9
    goto/16 :goto_7

    .line 677
    :cond_a
    invoke-virtual {v5}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v9

    if-eqz v9, :cond_13

    .line 682
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "it":Ljava/util/Iterator;
    :cond_b
    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_12

    .line 684
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 685
    .local v10, "sourceItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v10}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasQualifier()Z

    move-result v11

    if-eqz v11, :cond_b

    .line 686
    invoke-virtual {v10, v7}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "xml:lang"

    invoke-virtual {v12, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_c

    .line 688
    goto :goto_2

    .line 691
    :cond_c
    nop

    .line 692
    invoke-virtual {v10, v7}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v11

    .line 691
    invoke-static {v4, v11}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->lookupLanguageItem(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;)I

    move-result v11

    .line 693
    .local v11, "destIndex":I
    const/4 v12, -0x1

    if-eqz v3, :cond_e

    .line 694
    invoke-virtual {v10}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_d

    .line 695
    invoke-virtual {v10}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v13

    if-nez v13, :cond_e

    .line 697
    :cond_d
    if-eq v11, v12, :cond_11

    .line 699
    invoke-virtual {v4, v11}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeChild(I)V

    .line 700
    invoke-virtual {v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v12

    if-nez v12, :cond_11

    .line 702
    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    goto :goto_4

    .line 706
    :cond_e
    if-ne v11, v12, :cond_11

    .line 709
    invoke-virtual {v10, v7}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v12

    invoke-virtual {v12}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v12

    const-string/jumbo v13, "x-default"

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_10

    .line 710
    invoke-virtual {v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v12

    if-nez v12, :cond_f

    goto :goto_3

    .line 716
    :cond_f
    new-instance v12, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 717
    invoke-virtual {v10}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v13

    .line 718
    invoke-virtual {v10}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v14

    .line 719
    invoke-virtual {v10}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v15

    invoke-direct {v12, v13, v14, v15}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 720
    .local v12, "destItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v10, v12}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->cloneSubtree(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 721
    invoke-virtual {v4, v7, v12}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(ILcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    goto :goto_4

    .line 712
    .end local v12    # "destItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_10
    :goto_3
    invoke-virtual {v10, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->cloneSubtree(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 724
    .end local v10    # "sourceItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v11    # "destIndex":I
    :cond_11
    :goto_4
    goto/16 :goto_2

    .end local v9    # "it":Ljava/util/Iterator;
    :cond_12
    goto :goto_7

    .line 726
    :cond_13
    invoke-virtual {v5}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v7

    if-eqz v7, :cond_17

    .line 732
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "is":Ljava/util/Iterator;
    :goto_5
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_17

    .line 734
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 736
    .local v9, "sourceItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const/4 v10, 0x0

    .line 737
    .local v10, "match":Z
    invoke-virtual {v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "id":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_15

    .line 739
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 740
    .restart local v12    # "destItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-static {v9, v12}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->itemValuesMatch(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/XMPNode;)Z

    move-result v13

    if-eqz v13, :cond_14

    .line 742
    const/4 v10, 0x1

    .line 744
    .end local v12    # "destItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_14
    goto :goto_6

    .line 745
    .end local v11    # "id":Ljava/util/Iterator;
    :cond_15
    if-nez v10, :cond_16

    .line 747
    invoke-virtual {v9}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->clone()Ljava/lang/Object;

    move-result-object v11

    move-object v4, v11

    check-cast v4, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 748
    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 750
    .end local v9    # "sourceItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v10    # "match":Z
    :cond_16
    goto :goto_5

    .line 753
    .end local v5    # "sourceForm":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .end local v7    # "is":Ljava/util/Iterator;
    .end local v8    # "destForm":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    :cond_17
    :goto_7
    return-void
.end method

.method private static applyQuotes(Ljava/lang/String;CCZ)Ljava/lang/String;
    .locals 7
    .param p0, "item"    # Ljava/lang/String;
    .param p1, "openQuote"    # C
    .param p2, "closeQuote"    # C
    .param p3, "allowCommas"    # Z

    .line 1026
    if-nez p0, :cond_0

    .line 1028
    const-string p0, ""

    .line 1031
    :cond_0
    const/4 v0, 0x0

    .line 1049
    .local v0, "prevSpace":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x2

    const/4 v4, 0x4

    if-ge v1, v2, :cond_5

    .line 1051
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 1052
    .local v2, "ch":C
    invoke-static {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->classifyCharacter(C)I

    move-result v5

    .line 1053
    .local v5, "charKind":I
    if-nez v1, :cond_1

    if-ne v5, v4, :cond_1

    .line 1055
    goto :goto_2

    .line 1058
    :cond_1
    const/4 v6, 0x1

    if-ne v5, v6, :cond_3

    .line 1061
    if-eqz v0, :cond_2

    .line 1063
    goto :goto_2

    .line 1065
    :cond_2
    const/4 v0, 0x1

    goto :goto_1

    .line 1069
    :cond_3
    const/4 v0, 0x0

    .line 1070
    const/4 v6, 0x3

    if-eq v5, v6, :cond_5

    const/4 v6, 0x5

    if-eq v5, v6, :cond_5

    if-ne v5, v3, :cond_4

    if-nez p3, :cond_4

    .line 1073
    goto :goto_2

    .line 1049
    .end local v2    # "ch":C
    :cond_4
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1079
    .end local v5    # "charKind":I
    :cond_5
    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_a

    .line 1088
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v3

    invoke-direct {v2, v5}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 1090
    .local v2, "newItem":Ljava/lang/StringBuffer;
    const/4 v3, 0x0

    .local v3, "splitPoint":I
    :goto_3
    if-gt v3, v1, :cond_7

    .line 1092
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->classifyCharacter(C)I

    move-result v5

    if-ne v5, v4, :cond_6

    .line 1094
    goto :goto_4

    .line 1090
    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 1099
    :cond_7
    :goto_4
    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {p0, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1101
    move v5, v3

    .local v5, "charOffset":I
    :goto_5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v5, v6, :cond_9

    .line 1103
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1104
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->classifyCharacter(C)I

    move-result v6

    if-ne v6, v4, :cond_8

    .line 1105
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6, p1, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->isSurroundingQuote(CCC)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 1107
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1101
    :cond_8
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .line 1111
    :cond_9
    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1113
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 1116
    .end local v2    # "newItem":Ljava/lang/StringBuffer;
    .end local v3    # "splitPoint":I
    .end local v5    # "charOffset":I
    :cond_a
    return-object p0
.end method

.method public static catenateArrayItems(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 14
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "arrayName"    # Ljava/lang/String;
    .param p3, "separator"    # Ljava/lang/String;
    .param p4, "quotes"    # Ljava/lang/String;
    .param p5, "allowCommas"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 104
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 105
    invoke-static/range {p2 .. p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    .line 106
    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertImplementation(Lcom/itextpdf/kernel/xmp/XMPMeta;)V

    .line 107
    if-eqz p3, :cond_1

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    move-object/from16 v0, p3

    goto :goto_1

    .line 109
    :cond_1
    :goto_0
    const-string v0, "; "

    .line 111
    .end local p3    # "separator":Ljava/lang/String;
    .local v0, "separator":Ljava/lang/String;
    :goto_1
    if-eqz p4, :cond_3

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_2

    goto :goto_2

    :cond_2
    move-object/from16 v1, p4

    goto :goto_3

    .line 113
    :cond_3
    :goto_2
    const-string v1, "\""

    .line 116
    .end local p4    # "quotes":Ljava/lang/String;
    .local v1, "quotes":Ljava/lang/String;
    :goto_3
    move-object v2, p0

    check-cast v2, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    .line 117
    .local v2, "xmpImpl":Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    const/4 v3, 0x0

    .line 118
    .local v3, "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const/4 v4, 0x0

    .line 122
    .local v4, "currItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-static/range {p1 .. p2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object v5

    .line 123
    .local v5, "arrayPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static {v6, v5, v8, v7}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v3

    .line 124
    if-nez v3, :cond_4

    .line 126
    const-string v6, ""

    return-object v6

    .line 128
    :cond_4
    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v6

    const/4 v7, 0x4

    if-eqz v6, :cond_8

    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAlternate()Z

    move-result v6

    if-nez v6, :cond_8

    .line 134
    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->checkSeparator(Ljava/lang/String;)V

    .line 136
    invoke-virtual {v1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 137
    .local v6, "openQuote":C
    invoke-static {v1, v6}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->checkQuotes(Ljava/lang/String;C)C

    move-result v8

    .line 142
    .local v8, "closeQuote":C
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    .line 144
    .local v9, "catinatedString":Ljava/lang/StringBuffer;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "it":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_7

    .line 146
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    move-object v4, v11

    check-cast v4, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 147
    invoke-virtual {v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result v11

    if-nez v11, :cond_6

    .line 151
    invoke-virtual {v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v11

    move/from16 v12, p5

    invoke-static {v11, v6, v8, v12}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->applyQuotes(Ljava/lang/String;CCZ)Ljava/lang/String;

    move-result-object v11

    .line 153
    .local v11, "str":Ljava/lang/String;
    invoke-virtual {v9, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 154
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_5

    .line 156
    invoke-virtual {v9, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 158
    .end local v11    # "str":Ljava/lang/String;
    :cond_5
    goto :goto_4

    .line 149
    :cond_6
    move/from16 v12, p5

    new-instance v11, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v13, "Array items must be simple"

    invoke-direct {v11, v13, v7}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v11

    .line 144
    :cond_7
    move/from16 v12, p5

    .line 160
    .end local v10    # "it":Ljava/util/Iterator;
    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 128
    .end local v6    # "openQuote":C
    .end local v8    # "closeQuote":C
    .end local v9    # "catinatedString":Ljava/lang/StringBuffer;
    :cond_8
    move/from16 v12, p5

    .line 130
    new-instance v6, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v8, "Named property must be non-alternate array"

    invoke-direct {v6, v8, v7}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v6
.end method

.method private static checkQuotes(Ljava/lang/String;C)C
    .locals 5
    .param p0, "quotes"    # Ljava/lang/String;
    .param p1, "openQuote"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 895
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->classifyCharacter(C)I

    move-result v0

    .line 896
    .local v0, "charKind":I
    const-string v1, "Invalid quoting character"

    const/4 v2, 0x4

    if-ne v0, v2, :cond_3

    .line 901
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 903
    move v1, p1

    .local v1, "closeQuote":C
    goto :goto_0

    .line 907
    .end local v1    # "closeQuote":C
    :cond_0
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 908
    .local v3, "closeQuote":C
    invoke-static {v3}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->classifyCharacter(C)I

    move-result v0

    .line 909
    if-ne v0, v2, :cond_2

    move v1, v3

    .line 915
    .end local v3    # "closeQuote":C
    .restart local v1    # "closeQuote":C
    :goto_0
    invoke-static {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->getClosingQuote(C)C

    move-result v3

    if-ne v1, v3, :cond_1

    .line 919
    return v1

    .line 917
    :cond_1
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v4, "Mismatched quote pair"

    invoke-direct {v3, v4, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 911
    .end local v1    # "closeQuote":C
    .restart local v3    # "closeQuote":C
    :cond_2
    new-instance v4, Lcom/itextpdf/kernel/xmp/XMPException;

    invoke-direct {v4, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 898
    .end local v3    # "closeQuote":C
    :cond_3
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    invoke-direct {v3, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3
.end method

.method private static checkSeparator(Ljava/lang/String;)V
    .locals 6
    .param p0, "separator"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 854
    const/4 v0, 0x0

    .line 855
    .local v0, "haveSemicolon":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x4

    if-ge v1, v2, :cond_3

    .line 857
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->classifyCharacter(C)I

    move-result v2

    .line 858
    .local v2, "charKind":I
    const/4 v4, 0x3

    if-ne v2, v4, :cond_1

    .line 860
    if-nez v0, :cond_0

    .line 865
    const/4 v0, 0x1

    goto :goto_1

    .line 862
    :cond_0
    new-instance v4, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v5, "Separator can have only one semicolon"

    invoke-direct {v4, v5, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 867
    :cond_1
    const/4 v4, 0x1

    if-ne v2, v4, :cond_2

    .line 855
    .end local v2    # "charKind":I
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 869
    .restart local v2    # "charKind":I
    :cond_2
    new-instance v4, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v5, "Separator can have only spaces and one semicolon"

    invoke-direct {v4, v5, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 873
    .end local v1    # "i":I
    .end local v2    # "charKind":I
    :cond_3
    if-eqz v0, :cond_4

    .line 877
    return-void

    .line 875
    :cond_4
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Separator must have one semicolon"

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method private static classifyCharacter(C)I
    .locals 1
    .param p0, "ch"    # C

    .line 933
    const-string v0, " \u3000\u303f"

    invoke-virtual {v0, p0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_8

    const/16 v0, 0x2000

    if-gt v0, p0, :cond_0

    const/16 v0, 0x200b

    if-gt p0, v0, :cond_0

    goto :goto_2

    .line 937
    :cond_0
    const-string v0, ",\uff0c\uff64\ufe50\ufe51\u3001\u060c\u055d"

    invoke-virtual {v0, p0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_1

    .line 939
    const/4 v0, 0x2

    return v0

    .line 941
    :cond_1
    const-string v0, ";\uff1b\ufe54\u061b\u037e"

    invoke-virtual {v0, p0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_2

    .line 943
    const/4 v0, 0x3

    return v0

    .line 945
    :cond_2
    const-string v0, "\"\u00ab\u00bb\u301d\u301e\u301f\u2015\u2039\u203a"

    invoke-virtual {v0, p0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_7

    const/16 v0, 0x3008

    if-gt v0, p0, :cond_3

    const/16 v0, 0x300f

    if-le p0, v0, :cond_7

    :cond_3
    const/16 v0, 0x2018

    if-gt v0, p0, :cond_4

    const/16 v0, 0x201f

    if-gt p0, v0, :cond_4

    goto :goto_1

    .line 950
    :cond_4
    const/16 v0, 0x20

    if-lt p0, v0, :cond_6

    const-string/jumbo v0, "\u2028\u2029"

    invoke-virtual {v0, p0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_5

    goto :goto_0

    .line 957
    :cond_5
    const/4 v0, 0x0

    return v0

    .line 952
    :cond_6
    :goto_0
    const/4 v0, 0x5

    return v0

    .line 948
    :cond_7
    :goto_1
    const/4 v0, 0x4

    return v0

    .line 935
    :cond_8
    :goto_2
    const/4 v0, 0x1

    return v0
.end method

.method private static getClosingQuote(C)C
    .locals 1
    .param p0, "openQuote"    # C

    .line 969
    sparse-switch p0, :sswitch_data_0

    .line 1005
    const/4 v0, 0x0

    return v0

    .line 1003
    :sswitch_0
    const/16 v0, 0x301f

    return v0

    .line 1001
    :sswitch_1
    const/16 v0, 0x300f

    return v0

    .line 999
    :sswitch_2
    const/16 v0, 0x300d

    return v0

    .line 997
    :sswitch_3
    const/16 v0, 0x300b

    return v0

    .line 995
    :sswitch_4
    const/16 v0, 0x3009

    return v0

    .line 993
    :sswitch_5
    const/16 v0, 0x2039

    return v0

    .line 991
    :sswitch_6
    const/16 v0, 0x203a

    return v0

    .line 989
    :sswitch_7
    const/16 v0, 0x201f

    return v0

    .line 987
    :sswitch_8
    const/16 v0, 0x201d

    return v0

    .line 985
    :sswitch_9
    const/16 v0, 0x201b

    return v0

    .line 983
    :sswitch_a
    const/16 v0, 0x2019

    return v0

    .line 981
    :sswitch_b
    const/16 v0, 0x2015

    return v0

    .line 979
    :sswitch_c
    const/16 v0, 0xab

    return v0

    .line 977
    :sswitch_d
    const/16 v0, 0xbb

    return v0

    .line 972
    :sswitch_e
    const/16 v0, 0x22

    return v0

    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_e
        0xab -> :sswitch_d
        0xbb -> :sswitch_c
        0x2015 -> :sswitch_b
        0x2018 -> :sswitch_a
        0x201a -> :sswitch_9
        0x201c -> :sswitch_8
        0x201e -> :sswitch_7
        0x2039 -> :sswitch_6
        0x203a -> :sswitch_5
        0x3008 -> :sswitch_4
        0x300a -> :sswitch_3
        0x300c -> :sswitch_2
        0x300e -> :sswitch_1
        0x301d -> :sswitch_0
    .end sparse-switch
.end method

.method private static isClosingingQuote(CCC)Z
    .locals 1
    .param p0, "ch"    # C
    .param p1, "openQuote"    # C
    .param p2, "closeQuote"    # C

    .line 1140
    if-eq p0, p2, :cond_2

    const/16 v0, 0x301d

    if-ne p1, v0, :cond_0

    const/16 v0, 0x301e

    if-eq p0, v0, :cond_2

    :cond_0
    const/16 v0, 0x301f

    if-ne p0, v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private static isSurroundingQuote(CCC)Z
    .locals 1
    .param p0, "ch"    # C
    .param p1, "openQuote"    # C
    .param p2, "closeQuote"    # C

    .line 1128
    if-eq p0, p1, :cond_1

    invoke-static {p0, p1, p2}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->isClosingingQuote(CCC)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private static itemValuesMatch(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/XMPNode;)Z
    .locals 10
    .param p0, "leftNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p1, "rightNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 765
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v0

    .line 766
    .local v0, "leftForm":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v1

    .line 768
    .local v1, "rightForm":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    .line 770
    return v3

    .line 773
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOptions()I

    move-result v2

    const/4 v4, 0x1

    if-nez v2, :cond_3

    .line 776
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 778
    return v3

    .line 780
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v5

    if-eq v2, v5, :cond_2

    .line 782
    return v3

    .line 784
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v2

    if-eqz v2, :cond_c

    .line 785
    invoke-virtual {p0, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 786
    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getQualifier(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v5

    .line 785
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c

    .line 788
    return v3

    .line 791
    :cond_3
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isStruct()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 795
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v5

    if-eq v2, v5, :cond_4

    .line 797
    return v3

    .line 800
    :cond_4
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 802
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 803
    .local v5, "leftField":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v5}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {p1, v6, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v6

    .line 805
    .local v6, "rightField":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-eqz v6, :cond_6

    invoke-static {v5, v6}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->itemValuesMatch(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/XMPNode;)Z

    move-result v7

    if-nez v7, :cond_5

    goto :goto_1

    .line 809
    .end local v5    # "leftField":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v6    # "rightField":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_5
    goto :goto_0

    .line 807
    .restart local v5    # "leftField":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .restart local v6    # "rightField":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_6
    :goto_1
    return v3

    .line 809
    .end local v2    # "it":Ljava/util/Iterator;
    .end local v5    # "leftField":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v6    # "rightField":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_7
    goto :goto_5

    .line 818
    :cond_8
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v2

    if-eqz v2, :cond_d

    .line 820
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "il":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_c

    .line 822
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 824
    .local v5, "leftItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const/4 v6, 0x0

    .line 825
    .local v6, "match":Z
    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "ir":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_a

    .line 827
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 828
    .local v8, "rightItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-static {v5, v8}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->itemValuesMatch(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/XMPNode;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 830
    const/4 v6, 0x1

    .line 831
    goto :goto_4

    .line 833
    .end local v8    # "rightItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_9
    goto :goto_3

    .line 834
    .end local v7    # "ir":Ljava/util/Iterator;
    :cond_a
    :goto_4
    if-nez v6, :cond_b

    .line 836
    return v3

    .line 838
    .end local v5    # "leftItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v6    # "match":Z
    :cond_b
    goto :goto_2

    .line 840
    .end local v2    # "il":Ljava/util/Iterator;
    :cond_c
    :goto_5
    return v4

    .line 818
    :cond_d
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2
.end method

.method public static removeProperties(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 10
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "doAllProperties"    # Z
    .param p4, "includeAliases"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 430
    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertImplementation(Lcom/itextpdf/kernel/xmp/XMPMeta;)V

    .line 431
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    .line 433
    .local v0, "xmpImpl":Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz p2, :cond_3

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_3

    .line 439
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_2

    .line 445
    invoke-static {p1, p2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object v3

    .line 447
    .local v3, "expPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v4

    invoke-static {v4, v3, v2, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    .line 448
    .local v1, "propNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-eqz v1, :cond_1

    .line 450
    if-nez p3, :cond_0

    .line 451
    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    move-result-object v2

    .line 452
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getName()Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;->getSegment(I)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathSegment;->getName()Ljava/lang/String;

    move-result-object v4

    .line 451
    invoke-static {v2, v4}, Lcom/itextpdf/kernel/xmp/impl/Utils;->isInternalProperty(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 454
    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getParent()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v2

    .line 455
    .local v2, "parent":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 456
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isSchemaNode()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v4

    if-nez v4, :cond_1

    .line 459
    invoke-virtual {v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getParent()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v4

    invoke-virtual {v4, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 464
    .end local v1    # "propNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v2    # "parent":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v3    # "expPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    :cond_1
    goto/16 :goto_2

    .line 441
    :cond_2
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Property name requires schema namespace"

    const/4 v3, 0x4

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 465
    :cond_3
    if-eqz p1, :cond_7

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_7

    .line 473
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v3

    invoke-static {v3, p1, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findSchemaNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v3

    .line 474
    .local v3, "schemaNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-eqz v3, :cond_4

    .line 476
    invoke-static {v3, p3}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->removeSchemaChildren(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Z)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 478
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 482
    :cond_4
    if-eqz p4, :cond_6

    .line 490
    invoke-static {}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->getSchemaRegistry()Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;

    move-result-object v4

    invoke-interface {v4, p1}, Lcom/itextpdf/kernel/xmp/XMPSchemaRegistry;->findAliases(Ljava/lang/String;)[Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;

    move-result-object v4

    .line 491
    .local v4, "aliases":[Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    array-length v6, v4

    if-ge v5, v6, :cond_6

    .line 493
    aget-object v6, v4, v5

    .line 494
    .local v6, "info":Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;
    invoke-interface {v6}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getNamespace()Ljava/lang/String;

    move-result-object v7

    .line 495
    invoke-interface {v6}, Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;->getPropName()Ljava/lang/String;

    move-result-object v8

    .line 494
    invoke-static {v7, v8}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object v7

    .line 496
    .local v7, "path":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    nop

    .line 497
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v8

    invoke-static {v8, v7, v2, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v8

    .line 498
    .local v8, "actualProp":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-eqz v8, :cond_5

    .line 500
    invoke-virtual {v8}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getParent()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v9

    .line 501
    .local v9, "parent":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v9, v8}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->removeChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    .line 491
    .end local v6    # "info":Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;
    .end local v7    # "path":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    .end local v8    # "actualProp":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v9    # "parent":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 505
    .end local v3    # "schemaNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v4    # "aliases":[Lcom/itextpdf/kernel/xmp/properties/XMPAliasInfo;
    .end local v5    # "i":I
    :cond_6
    goto :goto_2

    .line 512
    :cond_7
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 514
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 515
    .local v2, "schema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-static {v2, p3}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->removeSchemaChildren(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Z)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 517
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 519
    .end local v2    # "schema":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_8
    goto :goto_1

    .line 521
    .end local v1    # "it":Ljava/util/Iterator;
    :cond_9
    :goto_2
    return-void
.end method

.method private static removeSchemaChildren(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Z)Z
    .locals 4
    .param p0, "schemaNode"    # Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .param p1, "doAllProperties"    # Z

    .line 593
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 595
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    .line 596
    .local v1, "currProp":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-nez p1, :cond_0

    .line 597
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/itextpdf/kernel/xmp/impl/Utils;->isInternalProperty(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 599
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 601
    .end local v1    # "currProp":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_1
    goto :goto_0

    .line 603
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->hasChildren()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static separateArrayItems(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Z)V
    .locals 19
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "arrayName"    # Ljava/lang/String;
    .param p3, "catedStr"    # Ljava/lang/String;
    .param p4, "arrayOptions"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .param p5, "preserveCommas"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 191
    move-object/from16 v0, p3

    invoke-static/range {p1 .. p1}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    .line 192
    invoke-static/range {p2 .. p2}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    .line 193
    const/4 v1, 0x4

    if-eqz v0, :cond_12

    .line 197
    invoke-static/range {p0 .. p0}, Lcom/itextpdf/kernel/xmp/impl/ParameterAsserts;->assertImplementation(Lcom/itextpdf/kernel/xmp/XMPMeta;)V

    .line 198
    move-object/from16 v2, p0

    check-cast v2, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;

    .line 201
    .local v2, "xmpImpl":Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p4

    invoke-static {v3, v4, v5, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->separateFindCreateArray(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v6

    .line 206
    .local v6, "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const/4 v7, 0x0

    .local v7, "nextKind":I
    const/4 v8, 0x0

    .line 207
    .local v8, "charKind":I
    const/4 v9, 0x0

    .line 210
    .local v9, "ch":C
    const/4 v10, 0x0

    .line 211
    .local v10, "itemEnd":I
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v11

    .line 212
    .local v11, "endPos":I
    :goto_0
    if-ge v10, v11, :cond_11

    .line 216
    move v12, v10

    .local v12, "itemStart":I
    :goto_1
    if-ge v12, v11, :cond_1

    .line 218
    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v9

    .line 219
    invoke-static {v9}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->classifyCharacter(C)I

    move-result v8

    .line 220
    if-eqz v8, :cond_1

    if-ne v8, v1, :cond_0

    .line 222
    goto :goto_2

    .line 216
    :cond_0
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 225
    :cond_1
    :goto_2
    if-lt v12, v11, :cond_2

    .line 227
    goto/16 :goto_e

    .line 230
    :cond_2
    const/4 v13, 0x1

    if-eq v8, v1, :cond_7

    .line 234
    move v10, v12

    :goto_3
    if-ge v10, v11, :cond_6

    .line 236
    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v9

    .line 237
    invoke-static {v9}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->classifyCharacter(C)I

    move-result v8

    .line 239
    if-eqz v8, :cond_5

    if-eq v8, v1, :cond_5

    const/4 v14, 0x2

    if-ne v8, v14, :cond_3

    if-eqz p5, :cond_3

    .line 242
    goto :goto_4

    .line 244
    :cond_3
    if-eq v8, v13, :cond_4

    .line 246
    goto :goto_5

    .line 248
    :cond_4
    add-int/lit8 v15, v10, 0x1

    if-ge v15, v11, :cond_6

    .line 250
    add-int/lit8 v15, v10, 0x1

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v9

    .line 251
    invoke-static {v9}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->classifyCharacter(C)I

    move-result v7

    .line 252
    if-eqz v7, :cond_5

    if-eq v7, v1, :cond_5

    if-ne v7, v14, :cond_6

    if-eqz p5, :cond_6

    .line 234
    :cond_5
    :goto_4
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 263
    :cond_6
    :goto_5
    invoke-virtual {v0, v12, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    .local v13, "itemValue":Ljava/lang/String;
    goto/16 :goto_a

    .line 272
    .end local v13    # "itemValue":Ljava/lang/String;
    :cond_7
    move v14, v9

    .line 273
    .local v14, "openQuote":C
    invoke-static {v14}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->getClosingQuote(C)C

    move-result v15

    .line 275
    .local v15, "closeQuote":C
    add-int/lit8 v12, v12, 0x1

    .line 276
    const-string v16, ""

    .line 278
    .local v16, "itemValue":Ljava/lang/String;
    move v10, v12

    move-object/from16 v18, v16

    move/from16 v16, v13

    move-object/from16 v13, v18

    .end local v16    # "itemValue":Ljava/lang/String;
    .restart local v13    # "itemValue":Ljava/lang/String;
    :goto_6
    if-ge v10, v11, :cond_d

    .line 280
    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v9

    .line 281
    invoke-static {v9}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->classifyCharacter(C)I

    move-result v8

    .line 283
    if-ne v8, v1, :cond_c

    invoke-static {v9, v14, v15}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->isSurroundingQuote(CCC)Z

    move-result v17

    if-nez v17, :cond_8

    goto :goto_8

    .line 297
    :cond_8
    add-int/lit8 v1, v10, 0x1

    if-ge v1, v11, :cond_9

    .line 299
    add-int/lit8 v1, v10, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 300
    .local v1, "nextChar":C
    invoke-static {v1}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->classifyCharacter(C)I

    move-result v7

    goto :goto_7

    .line 304
    .end local v1    # "nextChar":C
    :cond_9
    const/4 v7, 0x3

    .line 305
    const/16 v1, 0x3b

    .line 308
    .restart local v1    # "nextChar":C
    :goto_7
    if-ne v9, v1, :cond_a

    .line 311
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 313
    .end local v13    # "itemValue":Ljava/lang/String;
    .local v0, "itemValue":Ljava/lang/String;
    add-int/lit8 v10, v10, 0x1

    move-object v13, v0

    goto :goto_9

    .line 315
    .end local v0    # "itemValue":Ljava/lang/String;
    .restart local v13    # "itemValue":Ljava/lang/String;
    :cond_a
    invoke-static {v9, v14, v15}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->isClosingingQuote(CCC)Z

    move-result v0

    if-nez v0, :cond_b

    .line 318
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v13, v0

    .end local v13    # "itemValue":Ljava/lang/String;
    .restart local v0    # "itemValue":Ljava/lang/String;
    goto :goto_9

    .line 324
    .end local v0    # "itemValue":Ljava/lang/String;
    .restart local v13    # "itemValue":Ljava/lang/String;
    :cond_b
    add-int/lit8 v10, v10, 0x1

    .line 325
    goto :goto_a

    .line 287
    .end local v1    # "nextChar":C
    :cond_c
    :goto_8
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v13, v0

    .line 278
    :goto_9
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v0, p3

    const/4 v1, 0x4

    goto :goto_6

    .line 333
    .end local v14    # "openQuote":C
    .end local v15    # "closeQuote":C
    :cond_d
    :goto_a
    const/4 v0, -0x1

    .line 334
    .local v0, "foundIndex":I
    const/4 v1, 0x1

    .local v1, "oldChild":I
    :goto_b
    invoke-virtual {v6}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v14

    if-gt v1, v14, :cond_f

    .line 336
    invoke-virtual {v6, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getChild(I)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v14

    invoke-virtual {v14}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_e

    .line 338
    move v0, v1

    .line 339
    goto :goto_c

    .line 334
    :cond_e
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 343
    .end local v1    # "oldChild":I
    :cond_f
    :goto_c
    const/4 v1, 0x0

    .line 344
    .local v1, "newItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    if-gez v0, :cond_10

    .line 346
    new-instance v14, Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    const-string v15, "[]"

    move/from16 v16, v0

    .end local v0    # "foundIndex":I
    .local v16, "foundIndex":I
    const/4 v0, 0x0

    invoke-direct {v14, v15, v13, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 347
    .end local v1    # "newItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .local v14, "newItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    invoke-virtual {v6, v14}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->addChild(Lcom/itextpdf/kernel/xmp/impl/XMPNode;)V

    goto :goto_d

    .line 344
    .end local v14    # "newItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v16    # "foundIndex":I
    .restart local v0    # "foundIndex":I
    .restart local v1    # "newItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :cond_10
    move/from16 v16, v0

    .line 349
    .end local v0    # "foundIndex":I
    .end local v1    # "newItem":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    :goto_d
    move-object/from16 v0, p3

    const/4 v1, 0x4

    goto/16 :goto_0

    .line 350
    .end local v12    # "itemStart":I
    .end local v13    # "itemValue":Ljava/lang/String;
    :cond_11
    :goto_e
    return-void

    .line 195
    .end local v2    # "xmpImpl":Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .end local v6    # "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v7    # "nextKind":I
    .end local v8    # "charKind":I
    .end local v9    # "ch":C
    .end local v10    # "itemEnd":I
    .end local v11    # "endPos":I
    :cond_12
    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p4

    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Parameter must not be null"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static separateFindCreateArray(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .locals 6
    .param p0, "schemaNS"    # Ljava/lang/String;
    .param p1, "arrayName"    # Ljava/lang/String;
    .param p2, "arrayOptions"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .param p3, "xmp"    # Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 365
    const/4 v0, 0x0

    invoke-static {p2, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->verifySetOptions(Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Ljava/lang/Object;)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object p2

    .line 366
    invoke-virtual {p2}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isOnlyArrayOptions()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 373
    invoke-static {p0, p1}, Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;

    move-result-object v1

    .line 374
    .local v1, "arrayPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    invoke-virtual {p3}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v1, v3, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    .line 375
    .local v0, "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    const/16 v2, 0x66

    if-eqz v0, :cond_2

    .line 379
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPNode;->getOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v3

    .line 380
    .local v3, "arrayForm":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v3}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAlternate()Z

    move-result v4

    if-nez v4, :cond_1

    .line 385
    invoke-virtual {p2, v3}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->equalArrayTypes(Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 390
    .end local v3    # "arrayForm":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    goto :goto_0

    .line 387
    .restart local v3    # "arrayForm":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    :cond_0
    new-instance v4, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v5, "Mismatch of specified and existing array form"

    invoke-direct {v4, v5, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 382
    :cond_1
    new-instance v4, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v5, "Named property must be non-alternate array"

    invoke-direct {v4, v5, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 395
    .end local v3    # "arrayForm":Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    :cond_2
    invoke-virtual {p3}, Lcom/itextpdf/kernel/xmp/impl/XMPMetaImpl;->getRoot()Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v3

    .line 396
    const/4 v4, 0x1

    invoke-virtual {p2, v4}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setArray(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    move-result-object v5

    .line 395
    invoke-static {v3, v1, v4, v5}, Lcom/itextpdf/kernel/xmp/impl/XMPNodeUtils;->findNode(Lcom/itextpdf/kernel/xmp/impl/XMPNode;Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;ZLcom/itextpdf/kernel/xmp/options/PropertyOptions;)Lcom/itextpdf/kernel/xmp/impl/XMPNode;

    move-result-object v0

    .line 397
    if-eqz v0, :cond_3

    .line 402
    :goto_0
    return-object v0

    .line 399
    :cond_3
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v4, "Failed to create named array"

    invoke-direct {v3, v4, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 368
    .end local v0    # "arrayNode":Lcom/itextpdf/kernel/xmp/impl/XMPNode;
    .end local v1    # "arrayPath":Lcom/itextpdf/kernel/xmp/impl/xpath/XMPPath;
    :cond_4
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Options can only provide array form"

    const/16 v2, 0x67

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method
