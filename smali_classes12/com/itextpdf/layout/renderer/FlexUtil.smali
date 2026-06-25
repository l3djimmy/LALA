.class final Lcom/itextpdf/layout/renderer/FlexUtil;
.super Ljava/lang/Object;
.source "FlexUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final EPSILON:F = 1.0E-4f

.field private static final FLEX_GROW_INITIAL_VALUE:F = 0.0f

.field private static final FLEX_SHRINK_INITIAL_VALUE:F = 1.0f

.field private static final logger:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 48
    nop

    .line 56
    const-class v0, Lcom/itextpdf/layout/renderer/FlexUtil;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/renderer/FlexUtil;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    return-void
.end method

.method static synthetic access$000(Lcom/itextpdf/layout/renderer/AbstractRenderer;)Ljava/lang/Float;
    .locals 1
    .param p0, "x0"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 48
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/FlexUtil;->retrieveMinHeightForMainDirection(Lcom/itextpdf/layout/renderer/AbstractRenderer;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/itextpdf/layout/renderer/AbstractRenderer;)Ljava/lang/Float;
    .locals 1
    .param p0, "x0"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 48
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/FlexUtil;->retrieveMaxHeightForMainDirection(Lcom/itextpdf/layout/renderer/AbstractRenderer;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/itextpdf/layout/renderer/AbstractRenderer;F)F
    .locals 1
    .param p0, "x0"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p1, "x1"    # F

    .line 48
    invoke-static {p0, p1}, Lcom/itextpdf/layout/renderer/FlexUtil;->calculateHeight(Lcom/itextpdf/layout/renderer/AbstractRenderer;F)F

    move-result v0

    return v0
.end method

.method private static applyAlignItemsAndAlignSelf(Ljava/util/List;Lcom/itextpdf/layout/renderer/FlexContainerRenderer;Ljava/util/List;)V
    .locals 17
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/FlexContainerRenderer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;",
            ">;>;",
            "Lcom/itextpdf/layout/renderer/FlexContainerRenderer;",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 703
    .local p0, "lines":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;>;"
    .local p2, "lineCrossSizes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    invoke-static/range {p1 .. p1}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v0

    .line 704
    .local v0, "isColumnDirection":Z
    const/16 v1, 0x86

    sget-object v2, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->STRETCH:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    move-object/from16 v3, p1

    invoke-virtual {v3, v1, v2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    .line 707
    .local v1, "itemsAlignment":Lcom/itextpdf/layout/properties/AlignmentPropertyValue;
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v4

    if-ne v2, v4, :cond_a

    .line 710
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->isWrapReverse()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 711
    invoke-static/range {p0 .. p0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 712
    invoke-static/range {p2 .. p2}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 716
    :cond_0
    const/4 v2, 0x0

    .line 717
    .local v2, "nextLineShift":F
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_8

    .line 718
    move v5, v2

    .line 719
    .local v5, "lineShift":F
    move-object/from16 v6, p0

    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 720
    .local v7, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    move-object/from16 v8, p2

    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    .line 723
    .local v9, "lineCrossSize":F
    const/4 v10, 0x0

    invoke-interface {v7, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    invoke-interface {v7, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    iget v10, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->crossSize:F

    invoke-virtual {v11, v10}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getOuterCrossSize(F)F

    move-result v10

    sub-float v2, v9, v10

    .line 724
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_7

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 725
    .local v11, "itemInfo":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    if-eqz v0, :cond_1

    .line 726
    iput v5, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->xShift:F

    goto :goto_2

    .line 728
    :cond_1
    iput v5, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->yShift:F

    .line 731
    :goto_2
    iget-object v12, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 732
    const/16 v13, 0x81

    invoke-virtual {v12, v13, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    .line 735
    .local v12, "selfAlignment":Lcom/itextpdf/layout/properties/AlignmentPropertyValue;
    iget v13, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->crossSize:F

    invoke-virtual {v11, v13}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getOuterCrossSize(F)F

    move-result v13

    sub-float v13, v9, v13

    .line 736
    .local v13, "freeSpace":F
    invoke-static {v2, v13}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 738
    sget-object v14, Lcom/itextpdf/layout/renderer/FlexUtil$1;->$SwitchMap$com$itextpdf$layout$properties$AlignmentPropertyValue:[I

    invoke-virtual {v12}, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->ordinal()I

    move-result v15

    aget v14, v14, v15

    packed-switch v14, :pswitch_data_0

    goto :goto_7

    .line 767
    :pswitch_0
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->isWrapReverse()Z

    move-result v14

    if-eqz v14, :cond_6

    .line 768
    if-eqz v0, :cond_2

    .line 769
    iget v14, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->xShift:F

    add-float/2addr v14, v13

    iput v14, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->xShift:F

    goto :goto_3

    .line 771
    :cond_2
    iget v14, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->yShift:F

    add-float/2addr v14, v13

    iput v14, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->yShift:F

    .line 773
    :goto_3
    const/4 v2, 0x0

    goto :goto_7

    .line 759
    :pswitch_1
    const/high16 v14, 0x40000000    # 2.0f

    if-eqz v0, :cond_3

    .line 760
    iget v15, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->xShift:F

    div-float v16, v13, v14

    add-float v15, v15, v16

    iput v15, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->xShift:F

    goto :goto_4

    .line 762
    :cond_3
    iget v15, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->yShift:F

    div-float v16, v13, v14

    add-float v15, v15, v16

    iput v15, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->yShift:F

    .line 764
    :goto_4
    div-float v14, v13, v14

    invoke-static {v2, v14}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 765
    goto :goto_7

    .line 749
    :pswitch_2
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->isWrapReverse()Z

    move-result v14

    if-nez v14, :cond_6

    .line 750
    if-eqz v0, :cond_4

    .line 751
    iget v14, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->xShift:F

    add-float/2addr v14, v13

    iput v14, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->xShift:F

    goto :goto_5

    .line 753
    :cond_4
    iget v14, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->yShift:F

    add-float/2addr v14, v13

    iput v14, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->yShift:F

    .line 755
    :goto_5
    const/4 v2, 0x0

    goto :goto_7

    .line 741
    :pswitch_3
    if-eqz v0, :cond_5

    .line 742
    iget v14, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->xShift:F

    add-float/2addr v14, v13

    iput v14, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->xShift:F

    goto :goto_6

    .line 744
    :cond_5
    iget v14, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->yShift:F

    add-float/2addr v14, v13

    iput v14, v11, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->yShift:F

    .line 746
    :goto_6
    const/4 v2, 0x0

    .line 747
    nop

    .line 784
    .end local v11    # "itemInfo":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    .end local v12    # "selfAlignment":Lcom/itextpdf/layout/properties/AlignmentPropertyValue;
    .end local v13    # "freeSpace":F
    :cond_6
    :goto_7
    goto/16 :goto_1

    .line 717
    .end local v7    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    .end local v9    # "lineCrossSize":F
    :cond_7
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_0

    .end local v5    # "lineShift":F
    :cond_8
    move-object/from16 v6, p0

    move-object/from16 v8, p2

    .line 788
    .end local v4    # "i":I
    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->isWrapReverse()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 789
    invoke-static {v6}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 790
    invoke-static {v8}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 792
    :cond_9
    return-void

    .line 707
    .end local v2    # "nextLineShift":F
    :cond_a
    move-object/from16 v6, p0

    move-object/from16 v8, p2

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static applyJustifyContent(Ljava/util/List;Lcom/itextpdf/layout/renderer/FlexContainerRenderer;FF)V
    .locals 16
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/FlexContainerRenderer;
    .param p2, "mainSize"    # F
    .param p3, "containerMainSize"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;",
            ">;>;",
            "Lcom/itextpdf/layout/renderer/FlexContainerRenderer;",
            "FF)V"
        }
    .end annotation

    .line 796
    .local p0, "lines":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;>;"
    move-object/from16 v0, p1

    const/16 v1, 0x85

    sget-object v2, Lcom/itextpdf/layout/properties/JustifyContent;->FLEX_START:Lcom/itextpdf/layout/properties/JustifyContent;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/JustifyContent;

    .line 799
    .local v1, "justifyContent":Lcom/itextpdf/layout/properties/JustifyContent;
    const/4 v2, 0x0

    cmpl-float v3, p3, v2

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-lez v3, :cond_0

    move v3, v5

    goto :goto_0

    :cond_0
    move v3, v4

    .line 800
    .local v3, "containsFixedHeight":Z
    :goto_0
    if-eqz v3, :cond_1

    cmpg-float v6, p3, p2

    if-gez v6, :cond_1

    move v6, v5

    goto :goto_1

    :cond_1
    move v6, v4

    .line 801
    .local v6, "isFixedHeightAppliedOnTheCurrentPage":Z
    :goto_1
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->isWrapReverse()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 802
    invoke-static/range {p0 .. p0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 804
    :cond_2
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_b

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    .line 805
    .local v8, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    const/4 v9, 0x0

    .line 807
    .local v9, "childrenMainSize":F
    sget-object v10, Lcom/itextpdf/layout/properties/FlexDirectionPropertyValue;->COLUMN_REVERSE:Lcom/itextpdf/layout/properties/FlexDirectionPropertyValue;

    .line 808
    const/16 v11, 0x8b

    const/4 v12, 0x0

    invoke-virtual {v0, v11, v12}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    if-ne v10, v11, :cond_3

    move v10, v5

    goto :goto_3

    :cond_3
    move v10, v4

    .line 809
    .local v10, "isColumnReverse":Z
    :goto_3
    if-eqz v10, :cond_4

    .line 810
    invoke-static {v8}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 812
    :cond_4
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 813
    .local v11, "lineToJustify":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_4
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v13

    if-ge v12, v13, :cond_6

    .line 814
    invoke-interface {v8, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 815
    .local v13, "itemInfo":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    if-eqz v12, :cond_5

    invoke-static {v0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v14

    if-eqz v14, :cond_5

    if-nez v6, :cond_5

    .line 816
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->size()I

    move-result v14

    if-ne v14, v5, :cond_5

    iget v14, v13, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    .line 817
    invoke-virtual {v13, v14}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getOuterMainSize(F)F

    move-result v14

    add-float/2addr v14, v9

    const v15, 0x38d1b717    # 1.0E-4f

    add-float v15, p2, v15

    cmpl-float v14, v14, v15

    if-lez v14, :cond_5

    .line 818
    goto :goto_5

    .line 820
    :cond_5
    iget v14, v13, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    invoke-virtual {v13, v14}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getOuterMainSize(F)F

    move-result v14

    add-float/2addr v9, v14

    .line 821
    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 813
    .end local v13    # "itemInfo":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    add-int/lit8 v12, v12, 0x1

    goto :goto_4

    .line 824
    .end local v12    # "i":I
    :cond_6
    :goto_5
    if-eqz v10, :cond_7

    .line 825
    invoke-static {v8}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 826
    invoke-static {v11}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 828
    :cond_7
    const/4 v12, 0x0

    .line 829
    .local v12, "freeSpace":F
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v13

    if-nez v13, :cond_8

    .line 830
    sub-float v12, p2, v9

    goto :goto_7

    .line 831
    :cond_8
    if-eqz v3, :cond_a

    .line 833
    if-eqz v6, :cond_9

    sub-float v13, p3, v9

    goto :goto_6

    :cond_9
    sub-float v13, p2, v9

    .line 834
    invoke-static {v2, v13}, Ljava/lang/Math;->max(FF)F

    move-result v13

    :goto_6
    move v12, v13

    .line 836
    :cond_a
    :goto_7
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getFlexItemMainDirector()Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;

    move-result-object v13

    invoke-interface {v13, v11, v1, v12}, Lcom/itextpdf/layout/renderer/IFlexItemMainDirector;->applyJustifyContent(Ljava/util/List;Lcom/itextpdf/layout/properties/JustifyContent;F)V

    .line 837
    .end local v8    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    .end local v9    # "childrenMainSize":F
    .end local v10    # "isColumnReverse":Z
    .end local v11    # "lineToJustify":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    .end local v12    # "freeSpace":F
    goto/16 :goto_2

    .line 838
    :cond_b
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->isWrapReverse()Z

    move-result v2

    if-eqz v2, :cond_c

    .line 839
    invoke-static/range {p0 .. p0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 841
    :cond_c
    return-void
.end method

.method public static calculateChildrenRectangles(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Ljava/util/List;
    .locals 23
    .param p0, "flexContainerBBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p1, "flexContainerRenderer"    # Lcom/itextpdf/layout/renderer/FlexContainerRenderer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            "Lcom/itextpdf/layout/renderer/FlexContainerRenderer;",
            ")",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexItemInfo;",
            ">;>;"
        }
    .end annotation

    .line 75
    move-object/from16 v0, p1

    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/geom/Rectangle;->clone()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 76
    .local v1, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->applyMarginsBordersPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    .line 86
    invoke-static {v0, v1}, Lcom/itextpdf/layout/renderer/FlexUtil;->getMainSize(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)F

    move-result v3

    .line 89
    .local v3, "mainSize":F
    invoke-static {v0, v1}, Lcom/itextpdf/layout/renderer/FlexUtil;->getCrossSizes(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)[Ljava/lang/Float;

    move-result-object v4

    .line 90
    .local v4, "crossSizes":[Ljava/lang/Float;
    aget-object v5, v4, v2

    .line 91
    .local v5, "crossSize":Ljava/lang/Float;
    const/4 v6, 0x1

    aget-object v7, v4, v6

    .line 92
    .local v7, "minCrossSize":Ljava/lang/Float;
    const/4 v8, 0x2

    aget-object v8, v4, v8

    .line 94
    .local v8, "maxCrossSize":Ljava/lang/Float;
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 95
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v9

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v9

    .line 96
    .local v9, "layoutBoxCrossSize":F
    :goto_0
    if-nez v5, :cond_1

    move v10, v9

    goto :goto_1

    :cond_1
    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v10

    invoke-static {v10, v9}, Ljava/lang/Math;->min(FF)F

    move-result v10

    .line 97
    .end local v9    # "layoutBoxCrossSize":F
    .local v10, "layoutBoxCrossSize":F
    :goto_1
    nop

    .line 98
    invoke-static {v0, v3, v10}, Lcom/itextpdf/layout/renderer/FlexUtil;->createFlexItemCalculationInfos(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;FF)Ljava/util/List;

    move-result-object v9

    .line 100
    .local v9, "flexItemCalculationInfos":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    nop

    .line 101
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v11

    .line 100
    invoke-static {v9, v10, v11}, Lcom/itextpdf/layout/renderer/FlexUtil;->determineFlexBasisAndHypotheticalMainSizeForFlexItems(Ljava/util/List;FZ)V

    .line 106
    const/16 v11, 0x80

    invoke-virtual {v0, v11}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->hasProperty(I)Z

    move-result v12

    if-eqz v12, :cond_2

    sget-object v12, Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;->NOWRAP:Lcom/itextpdf/layout/properties/FlexWrapPropertyValue;

    .line 107
    invoke-virtual {v0, v11}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v11

    if-ne v12, v11, :cond_3

    :cond_2
    move v2, v6

    .line 110
    .local v2, "isSingleLine":Z
    :cond_3
    nop

    .line 111
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 112
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v6

    invoke-static {v3, v6}, Ljava/lang/Math;->min(FF)F

    move-result v6

    goto :goto_2

    :cond_4
    move v6, v3

    .line 111
    :goto_2
    invoke-static {v9, v6, v2}, Lcom/itextpdf/layout/renderer/FlexUtil;->collectFlexItemsIntoFlexLines(Ljava/util/List;FZ)Ljava/util/List;

    move-result-object v6

    .line 120
    .local v6, "lines":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;>;"
    const/4 v11, 0x0

    .line 121
    .local v11, "maxHypotheticalMainSize":F
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_3
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_6

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/List;

    .line 122
    .local v13, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    const/4 v14, 0x0

    .line 123
    .local v14, "hypotheticalMainSizesSum":F
    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_4
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_5

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move/from16 v17, v2

    .end local v2    # "isSingleLine":Z
    .local v17, "isSingleLine":Z
    move-object/from16 v2, v16

    check-cast v2, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 124
    .local v2, "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    move-object/from16 v16, v4

    .end local v4    # "crossSizes":[Ljava/lang/Float;
    .local v16, "crossSizes":[Ljava/lang/Float;
    iget v4, v2, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->hypotheticalMainSize:F

    invoke-virtual {v2, v4}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getOuterMainSize(F)F

    move-result v4

    add-float/2addr v14, v4

    .line 125
    .end local v2    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    move-object/from16 v4, v16

    move/from16 v2, v17

    goto :goto_4

    .line 126
    .end local v16    # "crossSizes":[Ljava/lang/Float;
    .end local v17    # "isSingleLine":Z
    .local v2, "isSingleLine":Z
    .restart local v4    # "crossSizes":[Ljava/lang/Float;
    :cond_5
    move/from16 v17, v2

    move-object/from16 v16, v4

    .end local v2    # "isSingleLine":Z
    .end local v4    # "crossSizes":[Ljava/lang/Float;
    .restart local v16    # "crossSizes":[Ljava/lang/Float;
    .restart local v17    # "isSingleLine":Z
    invoke-static {v11, v14}, Ljava/lang/Math;->max(FF)F

    move-result v11

    .line 127
    .end local v13    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    .end local v14    # "hypotheticalMainSizesSum":F
    goto :goto_3

    .line 128
    .end local v16    # "crossSizes":[Ljava/lang/Float;
    .end local v17    # "isSingleLine":Z
    .restart local v2    # "isSingleLine":Z
    .restart local v4    # "crossSizes":[Ljava/lang/Float;
    :cond_6
    move/from16 v17, v2

    move-object/from16 v16, v4

    .end local v2    # "isSingleLine":Z
    .end local v4    # "crossSizes":[Ljava/lang/Float;
    .restart local v16    # "crossSizes":[Ljava/lang/Float;
    .restart local v17    # "isSingleLine":Z
    new-instance v2, Lcom/itextpdf/kernel/geom/Rectangle;

    .line 129
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v4

    const/4 v12, 0x0

    if-eqz v4, :cond_7

    move v4, v12

    goto :goto_5

    :cond_7
    move v4, v11

    .line 130
    :goto_5
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v13

    if-eqz v13, :cond_8

    move v12, v11

    :cond_8
    invoke-direct {v2, v4, v12}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    .line 128
    invoke-static {v0, v2}, Lcom/itextpdf/layout/renderer/FlexUtil;->getMainSize(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)F

    move-result v2

    .line 131
    .local v2, "containerMainSize":F
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 132
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    invoke-static {v6, v4, v2}, Lcom/itextpdf/layout/renderer/FlexUtil;->resolveFlexibleLengths(Ljava/util/List;FF)V

    goto :goto_6

    .line 134
    :cond_9
    invoke-static {v6, v3}, Lcom/itextpdf/layout/renderer/FlexUtil;->resolveFlexibleLengths(Ljava/util/List;F)V

    .line 141
    :goto_6
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v4

    invoke-static {v6, v4, v10}, Lcom/itextpdf/layout/renderer/FlexUtil;->determineHypotheticalCrossSizeForFlexItems(Ljava/util/List;ZF)V

    .line 144
    invoke-static {v6, v7, v5, v8}, Lcom/itextpdf/layout/renderer/FlexUtil;->calculateCrossSizeOfEachFlexLine(Ljava/util/List;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;)Ljava/util/List;

    move-result-object v4

    .line 151
    .local v4, "lineCrossSizes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v12

    if-eqz v12, :cond_a

    new-instance v12, Ljava/lang/Float;

    invoke-direct {v12, v10}, Ljava/lang/Float;-><init>(F)V

    goto :goto_7

    :cond_a
    move-object v12, v5

    .line 152
    .local v12, "currentCrossSize":Ljava/lang/Float;
    :goto_7
    invoke-static {v0, v6, v12, v4, v1}, Lcom/itextpdf/layout/renderer/FlexUtil;->handleAlignContentStretch(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;Ljava/util/List;Ljava/lang/Float;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 158
    invoke-static {v6, v4, v0}, Lcom/itextpdf/layout/renderer/FlexUtil;->determineUsedCrossSizeOfEachFlexItem(Ljava/util/List;Ljava/util/List;Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)V

    .line 162
    invoke-static {v0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v13

    if-eqz v13, :cond_b

    .line 163
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v13

    goto :goto_8

    :cond_b
    move v13, v3

    .line 162
    :goto_8
    invoke-static {v6, v0, v13, v2}, Lcom/itextpdf/layout/renderer/FlexUtil;->applyJustifyContent(Ljava/util/List;Lcom/itextpdf/layout/renderer/FlexContainerRenderer;FF)V

    .line 171
    invoke-static {v6, v0, v4}, Lcom/itextpdf/layout/renderer/FlexUtil;->applyAlignItemsAndAlignSelf(Ljava/util/List;Lcom/itextpdf/layout/renderer/FlexContainerRenderer;Ljava/util/List;)V

    .line 178
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 179
    .local v13, "layoutTable":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_9
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_d

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/List;

    .line 180
    .local v15, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v19, v18

    .line 181
    .local v19, "layoutLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :goto_a
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_c

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v20

    check-cast v0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 182
    .local v0, "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    move-object/from16 v20, v1

    .end local v1    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .local v20, "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    new-instance v1, Lcom/itextpdf/layout/renderer/FlexItemInfo;

    move/from16 v21, v2

    .end local v2    # "containerMainSize":F
    .local v21, "containerMainSize":F
    iget-object v2, v0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    move-object/from16 v22, v0

    .end local v0    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    .local v22, "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    invoke-virtual/range {v22 .. v22}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->toRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/layout/renderer/FlexItemInfo;-><init>(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)V

    move-object/from16 v0, v19

    .end local v19    # "layoutLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    .local v0, "layoutLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 183
    .end local v22    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    move-object/from16 v1, v20

    move/from16 v2, v21

    move-object/from16 v0, p1

    goto :goto_a

    .line 184
    .end local v0    # "layoutLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    .end local v20    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v21    # "containerMainSize":F
    .restart local v1    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v2    # "containerMainSize":F
    .restart local v19    # "layoutLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    :cond_c
    move-object/from16 v20, v1

    move/from16 v21, v2

    move-object/from16 v0, v19

    .end local v1    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v2    # "containerMainSize":F
    .end local v19    # "layoutLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    .restart local v0    # "layoutLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    .restart local v20    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v21    # "containerMainSize":F
    invoke-interface {v13, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 185
    .end local v0    # "layoutLine":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    .end local v15    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    move-object/from16 v0, p1

    goto :goto_9

    .line 187
    .end local v20    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v21    # "containerMainSize":F
    .restart local v1    # "layoutBox":Lcom/itextpdf/kernel/geom/Rectangle;
    .restart local v2    # "containerMainSize":F
    :cond_d
    return-object v13
.end method

.method static calculateColumnDirectionCrossSizes(Ljava/util/List;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexItemInfo;",
            ">;>;)",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 551
    .local p0, "lines":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 552
    .local v0, "lineCrossSizes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 553
    .local v2, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    const/4 v3, 0x0

    .line 554
    .local v3, "flexLinesCrossSize":F
    const/4 v4, 0x0

    .line 555
    .local v4, "largestCrossSize":F
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/renderer/FlexItemInfo;

    .line 558
    .local v6, "info":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    invoke-virtual {v6}, Lcom/itextpdf/layout/renderer/FlexItemInfo;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v7

    invoke-static {v4, v7}, Ljava/lang/Math;->max(FF)F

    move-result v4

    .line 559
    const/4 v7, 0x0

    invoke-static {v7, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    .line 560
    .end local v6    # "info":Lcom/itextpdf/layout/renderer/FlexItemInfo;
    goto :goto_1

    .line 561
    :cond_0
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 562
    .end local v2    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexItemInfo;>;"
    .end local v3    # "flexLinesCrossSize":F
    .end local v4    # "largestCrossSize":F
    goto :goto_0

    .line 563
    :cond_1
    return-object v0
.end method

.method static calculateCrossSizeOfEachFlexLine(Ljava/util/List;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;)Ljava/util/List;
    .locals 9
    .param p1, "minCrossSize"    # Ljava/lang/Float;
    .param p2, "crossSize"    # Ljava/lang/Float;
    .param p3, "maxCrossSize"    # Ljava/lang/Float;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;",
            ">;>;",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            "Ljava/lang/Float;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 568
    .local p0, "lines":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 569
    .local v1, "isSingleLine":Z
    :goto_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 570
    .local v0, "lineCrossSizes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    if-eqz v1, :cond_1

    if-eqz p2, :cond_1

    .line 571
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 573
    :cond_1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 574
    .local v3, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    const/4 v4, 0x0

    .line 576
    .local v4, "flexLinesCrossSize":F
    const/4 v5, 0x0

    .line 577
    .local v5, "largestHypotheticalCrossSize":F
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 588
    .local v7, "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    iget v8, v7, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->hypotheticalCrossSize:F

    invoke-virtual {v7, v8}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getOuterCrossSize(F)F

    move-result v8

    cmpg-float v8, v5, v8

    if-gez v8, :cond_2

    .line 589
    iget v8, v7, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->hypotheticalCrossSize:F

    invoke-virtual {v7, v8}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getOuterCrossSize(F)F

    move-result v5

    .line 591
    :cond_2
    const/4 v8, 0x0

    invoke-static {v8, v5}, Ljava/lang/Math;->max(FF)F

    move-result v4

    .line 592
    .end local v7    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    goto :goto_2

    .line 596
    :cond_3
    if-eqz v1, :cond_5

    .line 597
    if-eqz p1, :cond_4

    .line 598
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-static {v6, v4}, Ljava/lang/Math;->max(FF)F

    move-result v4

    .line 600
    :cond_4
    if-eqz p3, :cond_5

    .line 601
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-static {v6, v4}, Ljava/lang/Math;->min(FF)F

    move-result v4

    .line 604
    :cond_5
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 605
    .end local v3    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    .end local v4    # "flexLinesCrossSize":F
    .end local v5    # "largestHypotheticalCrossSize":F
    goto :goto_1

    .line 607
    :cond_6
    :goto_3
    return-object v0
.end method

.method private static calculateFreeSpace(Ljava/util/List;F)F
    .locals 4
    .param p1, "initialFreeSpace"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;",
            ">;F)F"
        }
    .end annotation

    .line 844
    .local p0, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    move v0, p1

    .line 845
    .local v0, "result":F
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 846
    .local v2, "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    iget-boolean v3, v2, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isFrozen:Z

    if-eqz v3, :cond_0

    .line 847
    iget v3, v2, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getOuterMainSize(F)F

    move-result v3

    sub-float/2addr v0, v3

    goto :goto_1

    .line 849
    :cond_0
    iget v3, v2, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexBaseSize:F

    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getOuterMainSize(F)F

    move-result v3

    sub-float/2addr v0, v3

    .line 851
    .end local v2    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    :goto_1
    goto :goto_0

    .line 852
    :cond_1
    return v0
.end method

.method private static calculateHeight(Lcom/itextpdf/layout/renderer/AbstractRenderer;F)F
    .locals 4
    .param p0, "flexItemRenderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p1, "width"    # F

    .line 993
    new-instance v0, Lcom/itextpdf/layout/layout/LayoutContext;

    new-instance v1, Lcom/itextpdf/layout/layout/LayoutArea;

    new-instance v2, Lcom/itextpdf/kernel/geom/Rectangle;

    const v3, 0x49742400    # 1000000.0f

    invoke-direct {v2, p1, v3}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    const/4 v3, 0x1

    invoke-direct {v1, v3, v2}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v0

    .line 995
    .local v0, "result":Lcom/itextpdf/layout/layout/LayoutResult;
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    :goto_0
    return v1
.end method

.method private static calculateMaxMainSize(Lcom/itextpdf/layout/renderer/AbstractRenderer;FZF)F
    .locals 6
    .param p0, "flexItemRenderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p1, "flexContainerMainSize"    # F
    .param p2, "isColumnDirection"    # Z
    .param p3, "crossSize"    # F

    .line 914
    instance-of v0, p0, Lcom/itextpdf/layout/renderer/TableRenderer;

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    .line 916
    if-eqz p2, :cond_1

    .line 917
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveMaxHeight()Ljava/lang/Float;

    move-result-object v0

    .line 918
    .local v0, "itemRendererMaxHeight":Ljava/lang/Float;
    move-object v3, v0

    .line 919
    .local v3, "maxMainSize":Ljava/lang/Float;
    if-nez v3, :cond_0

    .line 920
    invoke-static {p0, p3}, Lcom/itextpdf/layout/renderer/FlexUtil;->calculateHeight(Lcom/itextpdf/layout/renderer/AbstractRenderer;F)F

    move-result v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    .line 922
    .end local v0    # "itemRendererMaxHeight":Ljava/lang/Float;
    :cond_0
    goto :goto_0

    .line 923
    .end local v3    # "maxMainSize":Ljava/lang/Float;
    :cond_1
    new-instance v0, Ljava/lang/Float;

    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v3

    invoke-direct {v0, v3}, Ljava/lang/Float;-><init>(F)V

    move-object v3, v0

    .line 925
    .restart local v3    # "maxMainSize":Ljava/lang/Float;
    :goto_0
    if-eqz p2, :cond_2

    .line 926
    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    .line 927
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-direct {v0, v2, v4}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    .line 926
    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMarginsBordersPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 927
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    .line 926
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .end local v3    # "maxMainSize":Ljava/lang/Float;
    .local v0, "maxMainSize":Ljava/lang/Float;
    goto/16 :goto_4

    .line 929
    .end local v0    # "maxMainSize":Ljava/lang/Float;
    .restart local v3    # "maxMainSize":Ljava/lang/Float;
    :cond_2
    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    .line 930
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-direct {v0, v4, v2}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    .line 929
    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMarginsBordersPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 930
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v0

    .line 929
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .end local v3    # "maxMainSize":Ljava/lang/Float;
    .restart local v0    # "maxMainSize":Ljava/lang/Float;
    goto/16 :goto_4

    .line 934
    .end local v0    # "maxMainSize":Ljava/lang/Float;
    :cond_3
    if-eqz p2, :cond_4

    .line 935
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveHeight()Ljava/lang/Float;

    move-result-object v0

    goto :goto_1

    :cond_4
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveWidth(F)Ljava/lang/Float;

    move-result-object v0

    .line 936
    .restart local v0    # "maxMainSize":Ljava/lang/Float;
    :goto_1
    if-nez v0, :cond_6

    .line 937
    if-eqz p2, :cond_5

    invoke-static {p0}, Lcom/itextpdf/layout/renderer/FlexUtil;->retrieveMaxHeightForMainDirection(Lcom/itextpdf/layout/renderer/AbstractRenderer;)Ljava/lang/Float;

    move-result-object v3

    goto :goto_2

    .line 938
    :cond_5
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveMaxWidth(F)Ljava/lang/Float;

    move-result-object v3

    :goto_2
    move-object v0, v3

    .line 940
    :cond_6
    if-nez v0, :cond_b

    .line 941
    instance-of v3, p0, Lcom/itextpdf/layout/renderer/ImageRenderer;

    if-eqz v3, :cond_8

    .line 943
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/layout/renderer/ImageRenderer;

    if-eqz p2, :cond_7

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getImageHeight()F

    move-result v1

    goto :goto_3

    .line 944
    :cond_7
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/ImageRenderer;->getImageWidth()F

    move-result v1

    .line 943
    :goto_3
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    goto :goto_4

    .line 946
    :cond_8
    if-eqz p2, :cond_a

    .line 947
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/FlexUtil;->retrieveMaxHeightForMainDirection(Lcom/itextpdf/layout/renderer/AbstractRenderer;)Ljava/lang/Float;

    move-result-object v3

    .line 948
    .local v3, "height":Ljava/lang/Float;
    if-nez v3, :cond_9

    .line 949
    invoke-static {p0, p3}, Lcom/itextpdf/layout/renderer/FlexUtil;->calculateHeight(Lcom/itextpdf/layout/renderer/AbstractRenderer;F)F

    move-result v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    .line 951
    :cond_9
    new-instance v4, Lcom/itextpdf/kernel/geom/Rectangle;

    .line 952
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-direct {v4, v2, v5}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    .line 951
    invoke-virtual {p0, v4, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMarginsBordersPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 952
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    .line 951
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 953
    .end local v3    # "height":Ljava/lang/Float;
    goto :goto_4

    .line 954
    :cond_a
    new-instance v3, Lcom/itextpdf/kernel/geom/Rectangle;

    .line 955
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v4

    invoke-direct {v3, v4, v2}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    .line 954
    invoke-virtual {p0, v3, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMarginsBordersPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 955
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v1

    .line 954
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 960
    :cond_b
    :goto_4
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    return v1
.end method

.method static collectFlexItemsIntoFlexLines(Ljava/util/List;FZ)Ljava/util/List;
    .locals 6
    .param p1, "mainSize"    # F
    .param p2, "isSingleLine"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;",
            ">;FZ)",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;",
            ">;>;"
        }
    .end annotation

    .line 320
    .local p0, "flexItemCalculationInfos":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 321
    .local v0, "lines":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 323
    .local v1, "currentLineInfos":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    if-eqz p2, :cond_0

    .line 324
    invoke-interface {v1, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_2

    .line 326
    :cond_0
    const/4 v2, 0x0

    .line 327
    .local v2, "occupiedLineSpace":F
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 328
    .local v4, "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    iget v5, v4, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->hypotheticalMainSize:F

    invoke-virtual {v4, v5}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getOuterMainSize(F)F

    move-result v5

    add-float/2addr v2, v5

    .line 329
    const v5, 0x38d1b717    # 1.0E-4f

    add-float/2addr v5, p1

    cmpl-float v5, v2, v5

    if-lez v5, :cond_2

    .line 331
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 332
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 333
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 334
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    move-object v1, v5

    .line 335
    const/4 v2, 0x0

    goto :goto_1

    .line 337
    :cond_1
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 338
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    move-object v1, v5

    .line 339
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 340
    iget v5, v4, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->hypotheticalMainSize:F

    invoke-virtual {v4, v5}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getOuterMainSize(F)F

    move-result v2

    goto :goto_1

    .line 343
    :cond_2
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 345
    .end local v4    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    :goto_1
    goto :goto_0

    .line 349
    .end local v2    # "occupiedLineSpace":F
    :cond_3
    :goto_2
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4

    .line 350
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 353
    :cond_4
    return-object v0
.end method

.method private static createFlexItemCalculationInfos(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;FF)Ljava/util/List;
    .locals 16
    .param p0, "flexContainerRenderer"    # Lcom/itextpdf/layout/renderer/FlexContainerRenderer;
    .param p1, "flexContainerMainSize"    # F
    .param p2, "crossSize"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/FlexContainerRenderer;",
            "FF)",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;",
            ">;"
        }
    .end annotation

    .line 870
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    .line 871
    .local v0, "childRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 872
    .local v1, "flexItems":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 873
    .local v3, "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    instance-of v4, v3, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v4, :cond_3

    .line 874
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 877
    .local v4, "abstractRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    nop

    .line 878
    invoke-static/range {p0 .. p0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v5

    .line 877
    move/from16 v11, p1

    move/from16 v14, p2

    invoke-static {v4, v11, v5, v14}, Lcom/itextpdf/layout/renderer/FlexUtil;->calculateMaxMainSize(Lcom/itextpdf/layout/renderer/AbstractRenderer;FZF)F

    move-result v5

    .line 880
    .local v5, "maxMainSize":F
    const/4 v6, 0x0

    .line 881
    .local v6, "flexBasisContent":Z
    const/16 v7, 0x83

    invoke-interface {v3, v7}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v8

    const/4 v9, 0x0

    if-nez v8, :cond_0

    .line 882
    move v7, v5

    .line 883
    .local v7, "flexBasis":F
    const/4 v6, 0x1

    move-object/from16 v15, p0

    move v12, v6

    goto :goto_2

    .line 888
    .end local v7    # "flexBasis":F
    :cond_0
    invoke-static/range {p0 .. p0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v8

    if-eqz v8, :cond_1

    new-instance v8, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-direct {v8, v9, v9}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    .line 889
    move-object/from16 v15, p0

    invoke-static {v15, v8}, Lcom/itextpdf/layout/renderer/FlexUtil;->getMainSize(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)F

    move-result v8

    goto :goto_1

    :cond_1
    move-object/from16 v15, p0

    move v8, v11

    .line 890
    .local v8, "containerMainSize":F
    :goto_1
    invoke-virtual {v4, v8, v7}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveUnitValue(FI)Ljava/lang/Float;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    .line 891
    .restart local v7    # "flexBasis":F
    invoke-static {v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isBorderBoxSizing(Lcom/itextpdf/layout/renderer/IRenderer;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 892
    invoke-static {v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->calculatePaddingBorderWidth(Lcom/itextpdf/layout/renderer/AbstractRenderer;)F

    move-result v10

    sub-float/2addr v7, v10

    move v12, v6

    goto :goto_2

    .line 891
    :cond_2
    move v12, v6

    .line 895
    .end local v6    # "flexBasisContent":Z
    .end local v8    # "containerMainSize":F
    .local v12, "flexBasisContent":Z
    :goto_2
    invoke-static {v7, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    .line 897
    .end local v7    # "flexBasis":F
    .local v8, "flexBasis":F
    const/16 v6, 0x84

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-interface {v3, v6, v7}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v9

    .line 899
    .local v9, "flexGrow":F
    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    const/16 v7, 0x7f

    invoke-interface {v3, v7, v6}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v10

    .line 901
    .local v10, "flexShrink":F
    new-instance v6, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    move-object v7, v3

    check-cast v7, Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 903
    invoke-static {v15}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v13

    invoke-direct/range {v6 .. v14}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;-><init>(Lcom/itextpdf/layout/renderer/AbstractRenderer;FFFFZZF)V

    .line 905
    .local v6, "flexItemInfo":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 873
    .end local v4    # "abstractRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v5    # "maxMainSize":F
    .end local v6    # "flexItemInfo":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    .end local v8    # "flexBasis":F
    .end local v9    # "flexGrow":F
    .end local v10    # "flexShrink":F
    .end local v12    # "flexBasisContent":Z
    :cond_3
    move-object/from16 v15, p0

    .line 907
    .end local v3    # "renderer":Lcom/itextpdf/layout/renderer/IRenderer;
    :goto_3
    goto/16 :goto_0

    .line 908
    :cond_4
    move-object/from16 v15, p0

    return-object v1
.end method

.method static determineFlexBasisAndHypotheticalMainSizeForFlexItems(Ljava/util/List;FZ)V
    .locals 6
    .param p1, "crossSize"    # F
    .param p2, "isColumnDirection"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;",
            ">;FZ)V"
        }
    .end annotation

    .line 257
    .local p0, "flexItemCalculationInfos":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 260
    .local v1, "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    iget-object v2, v1, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 269
    .local v2, "renderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    const/4 v3, 0x0

    .line 270
    .local v3, "definiteCrossSize":Ljava/lang/Float;
    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasAspectRatio()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 271
    if-eqz p2, :cond_0

    .line 272
    invoke-virtual {v2, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveWidth(F)Ljava/lang/Float;

    move-result-object v4

    goto :goto_1

    :cond_0
    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveHeight()Ljava/lang/Float;

    move-result-object v4

    :goto_1
    move-object v3, v4

    .line 274
    :cond_1
    iget-boolean v4, v1, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexBasisContent:Z

    if-eqz v4, :cond_3

    if-eqz v3, :cond_3

    .line 275
    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getAspectRatio()Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    .line 276
    .local v4, "aspectRatio":F
    if-eqz p2, :cond_2

    .line 277
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v5

    div-float/2addr v5, v4

    goto :goto_2

    :cond_2
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v5

    mul-float/2addr v5, v4

    :goto_2
    iput v5, v1, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexBaseSize:F

    .line 278
    .end local v4    # "aspectRatio":F
    goto :goto_3

    .line 280
    :cond_3
    iget v4, v1, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexBasis:F

    iput v4, v1, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexBaseSize:F

    .line 305
    :goto_3
    iget v4, v1, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->minContent:F

    iget v5, v1, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexBaseSize:F

    .line 308
    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    move-result v4

    iget v5, v1, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->maxContent:F

    .line 307
    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v4

    .line 305
    const/4 v5, 0x0

    invoke-static {v5, v4}, Ljava/lang/Math;->max(FF)F

    move-result v4

    iput v4, v1, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->hypotheticalMainSize:F

    .line 311
    iget v4, v1, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->hypotheticalMainSize:F

    iput v4, v1, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    .line 315
    .end local v1    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    .end local v2    # "renderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v3    # "definiteCrossSize":Ljava/lang/Float;
    goto :goto_0

    .line 316
    :cond_4
    return-void
.end method

.method private static determineHypotheticalCrossSizeForFlexItem(Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;ZF)V
    .locals 9
    .param p0, "info"    # Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    .param p1, "isColumnDirection"    # Z
    .param p2, "crossSize"    # F

    .line 512
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    instance-of v0, v0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    check-cast v0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;

    iget v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    .line 513
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getHypotheticalCrossSize(Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 515
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    check-cast v0, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;

    iget v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    .line 516
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getHypotheticalCrossSize(Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->hypotheticalCrossSize:F

    goto/16 :goto_0

    .line 517
    :cond_0
    if-eqz p1, :cond_2

    .line 518
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v0

    .line 519
    .local v0, "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    nop

    .line 520
    invoke-virtual {v0}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMaxWidth()F

    move-result v1

    invoke-static {v1, p2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-virtual {v0}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 519
    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getInnerCrossSize(F)F

    move-result v1

    iput v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->hypotheticalCrossSize:F

    .line 522
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    instance-of v1, v1, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;

    if-eqz v1, :cond_1

    .line 523
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    check-cast v1, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;

    iget v2, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iget v3, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->hypotheticalCrossSize:F

    .line 524
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    .line 523
    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->setHypotheticalCrossSize(Ljava/lang/Float;Ljava/lang/Float;)V

    .line 526
    .end local v0    # "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    :cond_1
    goto/16 :goto_0

    .line 527
    :cond_2
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    iget v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    .line 528
    invoke-static {v1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    .line 527
    const/16 v2, 0x4d

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->replaceOwnProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    .line 529
    .local v0, "prevMainSize":Lcom/itextpdf/layout/properties/UnitValue;
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    const/4 v3, 0x0

    const/16 v4, 0x50

    invoke-virtual {v1, v4, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->replaceOwnProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/UnitValue;

    .line 530
    .local v1, "prevMinMainSize":Lcom/itextpdf/layout/properties/UnitValue;
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    const/16 v5, 0x88

    sget-object v6, Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;->BOTTOM:Lcom/itextpdf/layout/properties/InlineVerticalAlignmentType;

    invoke-virtual {v3, v5, v6}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 531
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    new-instance v5, Lcom/itextpdf/layout/layout/LayoutContext;

    new-instance v6, Lcom/itextpdf/layout/layout/LayoutArea;

    new-instance v7, Lcom/itextpdf/kernel/geom/Rectangle;

    const v8, 0x49742400    # 1000000.0f

    invoke-direct {v7, v8, v8}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    const/4 v8, 0x0

    invoke-direct {v6, v8, v7}, Lcom/itextpdf/layout/layout/LayoutArea;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-direct {v5, v6}, Lcom/itextpdf/layout/layout/LayoutContext;-><init>(Lcom/itextpdf/layout/layout/LayoutArea;)V

    invoke-virtual {v3, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->layout(Lcom/itextpdf/layout/layout/LayoutContext;)Lcom/itextpdf/layout/layout/LayoutResult;

    move-result-object v3

    .line 533
    .local v3, "result":Lcom/itextpdf/layout/layout/LayoutResult;
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v5, v4, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->returnBackOwnProperty(ILjava/lang/Object;)V

    .line 534
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v4, v2, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->returnBackOwnProperty(ILjava/lang/Object;)V

    .line 536
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getStatus()I

    move-result v2

    const/4 v4, 0x1

    if-ne v2, v4, :cond_3

    .line 537
    invoke-virtual {v3}, Lcom/itextpdf/layout/layout/LayoutResult;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getInnerCrossSize(F)F

    move-result v2

    iput v2, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->hypotheticalCrossSize:F

    .line 539
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    instance-of v2, v2, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;

    if-eqz v2, :cond_4

    .line 540
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    check-cast v2, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;

    iget v4, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    iget v5, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->hypotheticalCrossSize:F

    .line 541
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    .line 540
    invoke-virtual {v2, v4, v5}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->setHypotheticalCrossSize(Ljava/lang/Float;Ljava/lang/Float;)V

    goto :goto_0

    .line 544
    :cond_3
    sget-object v2, Lcom/itextpdf/layout/renderer/FlexUtil;->logger:Lorg/slf4j/Logger;

    const-string v4, "Flex item layout result isn\'t full, but it must be. The cross size of the flex item will be 0."

    invoke-interface {v2, v4}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 545
    const/4 v2, 0x0

    iput v2, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->hypotheticalCrossSize:F

    .line 548
    .end local v0    # "prevMainSize":Lcom/itextpdf/layout/properties/UnitValue;
    .end local v1    # "prevMinMainSize":Lcom/itextpdf/layout/properties/UnitValue;
    .end local v3    # "result":Lcom/itextpdf/layout/layout/LayoutResult;
    :cond_4
    :goto_0
    return-void
.end method

.method static determineHypotheticalCrossSizeForFlexItems(Ljava/util/List;ZF)V
    .locals 4
    .param p1, "isColumnDirection"    # Z
    .param p2, "crossSize"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;",
            ">;>;ZF)V"
        }
    .end annotation

    .line 503
    .local p0, "lines":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 504
    .local v1, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 505
    .local v3, "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    invoke-static {v3, p1, p2}, Lcom/itextpdf/layout/renderer/FlexUtil;->determineHypotheticalCrossSizeForFlexItem(Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;ZF)V

    .line 506
    .end local v3    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    goto :goto_1

    .line 507
    .end local v1    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    :cond_0
    goto :goto_0

    .line 508
    :cond_1
    return-void
.end method

.method static determineUsedCrossSizeOfEachFlexItem(Ljava/util/List;Ljava/util/List;Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)V
    .locals 12
    .param p2, "flexContainerRenderer"    # Lcom/itextpdf/layout/renderer/FlexContainerRenderer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;",
            ">;>;",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;",
            "Lcom/itextpdf/layout/renderer/FlexContainerRenderer;",
            ")V"
        }
    .end annotation

    .line 646
    .local p0, "lines":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;>;"
    .local p1, "lineCrossSizes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    invoke-static {p2}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v0

    .line 647
    .local v0, "isColumnDirection":Z
    sget-object v1, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->STRETCH:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    .line 648
    const/16 v2, 0x86

    invoke-virtual {p2, v2, v1}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    .line 651
    .local v1, "alignItems":Lcom/itextpdf/layout/properties/AlignmentPropertyValue;
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ne v2, v3, :cond_9

    .line 653
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_8

    .line 654
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 663
    .local v4, "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    iget-object v5, v4, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 664
    .local v5, "infoRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    nop

    .line 665
    const/16 v6, 0x81

    invoke-virtual {v5, v6, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    .line 668
    .local v6, "alignSelf":Lcom/itextpdf/layout/properties/AlignmentPropertyValue;
    if-eqz v0, :cond_0

    iget-object v7, v4, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 669
    const/16 v8, 0x4d

    goto :goto_2

    :cond_0
    iget-object v7, v4, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    const/16 v8, 0x1b

    :goto_2
    invoke-virtual {v7, v8}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasProperty(I)Z

    move-result v7

    .line 670
    .local v7, "definiteCrossSize":Z
    sget-object v8, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->STRETCH:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    if-eq v6, v8, :cond_1

    sget-object v8, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->NORMAL:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    if-ne v6, v8, :cond_6

    :cond_1
    if-nez v7, :cond_6

    .line 672
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Float;

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v8

    invoke-virtual {v4, v8}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getInnerCrossSize(F)F

    move-result v8

    iput v8, v4, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->crossSize:F

    .line 673
    if-eqz v0, :cond_2

    .line 674
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Float;

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v8

    invoke-virtual {v5, v8}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveMaxWidth(F)Ljava/lang/Float;

    move-result-object v8

    goto :goto_3

    :cond_2
    invoke-virtual {v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveMaxHeight()Ljava/lang/Float;

    move-result-object v8

    .line 675
    .local v8, "maxCrossSize":Ljava/lang/Float;
    :goto_3
    if-eqz v8, :cond_3

    .line 676
    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v9

    iget v10, v4, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->crossSize:F

    invoke-static {v9, v10}, Ljava/lang/Math;->min(FF)F

    move-result v9

    iput v9, v4, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->crossSize:F

    .line 678
    :cond_3
    if-eqz v0, :cond_4

    .line 679
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Float;

    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v9

    invoke-virtual {v5, v9}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveMinWidth(F)Ljava/lang/Float;

    move-result-object v9

    goto :goto_4

    :cond_4
    invoke-virtual {v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveMinHeight()Ljava/lang/Float;

    move-result-object v9

    .line 680
    .local v9, "minCrossSize":Ljava/lang/Float;
    :goto_4
    if-eqz v9, :cond_5

    .line 681
    invoke-virtual {v9}, Ljava/lang/Float;->floatValue()F

    move-result v10

    iget v11, v4, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->crossSize:F

    invoke-static {v10, v11}, Ljava/lang/Math;->max(FF)F

    move-result v10

    iput v10, v4, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->crossSize:F

    .line 683
    .end local v8    # "maxCrossSize":Ljava/lang/Float;
    .end local v9    # "minCrossSize":Ljava/lang/Float;
    :cond_5
    goto :goto_5

    .line 684
    :cond_6
    iget v8, v4, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->hypotheticalCrossSize:F

    iput v8, v4, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->crossSize:F

    .line 686
    .end local v4    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    .end local v5    # "infoRenderer":Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .end local v6    # "alignSelf":Lcom/itextpdf/layout/properties/AlignmentPropertyValue;
    .end local v7    # "definiteCrossSize":Z
    :goto_5
    goto/16 :goto_1

    .line 653
    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 688
    .end local v2    # "i":I
    :cond_8
    return-void

    .line 651
    :cond_9
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2
.end method

.method private static getCrossSizes(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)[Ljava/lang/Float;
    .locals 4
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/FlexContainerRenderer;
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 246
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v0

    .line 248
    .local v0, "isColumnDirection":Z
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Float;

    if-eqz v0, :cond_0

    .line 249
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->retrieveWidth(F)Ljava/lang/Float;

    move-result-object v2

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->retrieveHeight()Ljava/lang/Float;

    move-result-object v2

    :goto_0
    const/4 v3, 0x0

    aput-object v2, v1, v3

    if-eqz v0, :cond_1

    .line 250
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->retrieveMinWidth(F)Ljava/lang/Float;

    move-result-object v2

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->retrieveMinHeight()Ljava/lang/Float;

    move-result-object v2

    :goto_1
    const/4 v3, 0x1

    aput-object v2, v1, v3

    if-eqz v0, :cond_2

    .line 251
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->retrieveMaxWidth(F)Ljava/lang/Float;

    move-result-object v2

    goto :goto_2

    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->retrieveMaxHeight()Ljava/lang/Float;

    move-result-object v2

    :goto_2
    const/4 v3, 0x2

    aput-object v2, v1, v3

    .line 248
    return-object v1
.end method

.method static getMainSize(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)F
    .locals 7
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/FlexContainerRenderer;
    .param p1, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 197
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v0

    .line 202
    .local v0, "isColumnDirection":Z
    const/4 v1, 0x0

    .line 203
    .local v1, "maxDimension":Ljava/lang/Float;
    const/4 v2, 0x0

    .line 204
    .local v2, "minDimension":Ljava/lang/Float;
    if-eqz v0, :cond_0

    .line 205
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    .line 206
    .local v3, "layoutBoxMainSize":F
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->retrieveHeight()Ljava/lang/Float;

    move-result-object v4

    .line 207
    .local v4, "mainSize":Ljava/lang/Float;
    const/16 v5, 0x54

    invoke-static {p0, v5, v3}, Lcom/itextpdf/layout/renderer/FlexUtil;->resolveUnitValue(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;IF)Ljava/lang/Float;

    move-result-object v1

    .line 208
    const/16 v5, 0x55

    invoke-static {p0, v5, v3}, Lcom/itextpdf/layout/renderer/FlexUtil;->resolveUnitValue(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;IF)Ljava/lang/Float;

    move-result-object v2

    goto :goto_0

    .line 210
    .end local v3    # "layoutBoxMainSize":F
    .end local v4    # "mainSize":Ljava/lang/Float;
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    .line 211
    .restart local v3    # "layoutBoxMainSize":F
    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->retrieveWidth(F)Ljava/lang/Float;

    move-result-object v4

    .line 212
    .restart local v4    # "mainSize":Ljava/lang/Float;
    const/16 v5, 0x4f

    invoke-static {p0, v5, v3}, Lcom/itextpdf/layout/renderer/FlexUtil;->resolveUnitValue(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;IF)Ljava/lang/Float;

    move-result-object v1

    .line 213
    const/16 v5, 0x50

    invoke-static {p0, v5, v3}, Lcom/itextpdf/layout/renderer/FlexUtil;->resolveUnitValue(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;IF)Ljava/lang/Float;

    move-result-object v2

    .line 220
    :goto_0
    if-nez v4, :cond_1

    .line 221
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    .line 223
    :cond_1
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v6

    cmpl-float v5, v5, v6

    if-lez v5, :cond_2

    .line 224
    move-object v4, v2

    .line 227
    :cond_2
    if-eqz v1, :cond_4

    if-eqz v2, :cond_3

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v6

    cmpl-float v5, v5, v6

    if-lez v5, :cond_4

    :cond_3
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v6

    cmpg-float v5, v5, v6

    if-gez v5, :cond_4

    .line 228
    move-object v4, v1

    .line 231
    :cond_4
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v5

    return v5
.end method

.method static handleAlignContentStretch(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;Ljava/util/List;Ljava/lang/Float;Ljava/util/List;Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 6
    .param p0, "flexContainerRenderer"    # Lcom/itextpdf/layout/renderer/FlexContainerRenderer;
    .param p2, "crossSize"    # Ljava/lang/Float;
    .param p4, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/FlexContainerRenderer;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;",
            ">;>;",
            "Ljava/lang/Float;",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ")V"
        }
    .end annotation

    .line 613
    .local p1, "lines":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;>;"
    .local p3, "lineCrossSizes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    sget-object v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->STRETCH:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    .line 614
    const/16 v1, 0x82

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    .line 616
    .local v0, "alignContent":Lcom/itextpdf/layout/properties/AlignmentPropertyValue;
    if-eqz p2, :cond_3

    sget-object v1, Lcom/itextpdf/layout/properties/AlignmentPropertyValue;->STRETCH:Lcom/itextpdf/layout/properties/AlignmentPropertyValue;

    if-ne v0, v1, :cond_3

    .line 618
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->isWrapReverse()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 619
    invoke-static {p3}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 620
    invoke-static {p1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 622
    :cond_0
    nop

    .line 623
    invoke-static {p0, p1, p3, p2, p4}, Lcom/itextpdf/layout/renderer/FlexUtil;->retrieveCurrentPageLineCrossSizes(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;Ljava/util/List;Ljava/util/List;Ljava/lang/Float;Lcom/itextpdf/kernel/geom/Rectangle;)Ljava/util/List;

    move-result-object v1

    .line 624
    .local v1, "currentPageLineCrossSizes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_2

    .line 625
    const/4 v2, 0x0

    .line 626
    .local v2, "flexLinesCrossSizesSum":F
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    .line 627
    .local v4, "size":F
    add-float/2addr v2, v4

    .line 628
    .end local v4    # "size":F
    goto :goto_0

    .line 629
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v3

    const v4, 0x38d1b717    # 1.0E-4f

    sub-float/2addr v3, v4

    cmpg-float v3, v2, v3

    if-gez v3, :cond_2

    .line 630
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v3

    sub-float/2addr v3, v2

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    .line 631
    .local v3, "addition":F
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_2

    .line 632
    invoke-interface {p3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    add-float/2addr v5, v3

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-interface {p3, v4, v5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 631
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 637
    .end local v2    # "flexLinesCrossSizesSum":F
    .end local v3    # "addition":F
    .end local v4    # "i":I
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->isWrapReverse()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 638
    invoke-static {p3}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 639
    invoke-static {p1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 642
    .end local v1    # "currentPageLineCrossSizes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    :cond_3
    return-void
.end method

.method private static hasFlexibleItems(Ljava/util/List;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;",
            ">;)Z"
        }
    .end annotation

    .line 856
    .local p0, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 857
    .local v1, "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    iget-boolean v2, v1, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isFrozen:Z

    if-nez v2, :cond_0

    .line 858
    const/4 v0, 0x1

    return v0

    .line 860
    .end local v1    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    :cond_0
    goto :goto_0

    .line 861
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method static isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z
    .locals 2
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/FlexContainerRenderer;

    .line 191
    sget-object v0, Lcom/itextpdf/layout/properties/FlexDirectionPropertyValue;->ROW:Lcom/itextpdf/layout/properties/FlexDirectionPropertyValue;

    .line 192
    const/16 v1, 0x8b

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/FlexDirectionPropertyValue;

    .line 193
    .local v0, "flexDir":Lcom/itextpdf/layout/properties/FlexDirectionPropertyValue;
    sget-object v1, Lcom/itextpdf/layout/properties/FlexDirectionPropertyValue;->COLUMN:Lcom/itextpdf/layout/properties/FlexDirectionPropertyValue;

    if-eq v1, v0, :cond_1

    sget-object v1, Lcom/itextpdf/layout/properties/FlexDirectionPropertyValue;->COLUMN_REVERSE:Lcom/itextpdf/layout/properties/FlexDirectionPropertyValue;

    if-ne v1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1
.end method

.method static isZero(F)Z
    .locals 2
    .param p0, "value"    # F

    .line 865
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x38d1b717    # 1.0E-4f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static resolveFlexibleLengths(Ljava/util/List;F)V
    .locals 14
    .param p1, "mainSize"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;",
            ">;>;F)V"
        }
    .end annotation

    .line 357
    .local p0, "lines":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 360
    .local v1, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    const/4 v2, 0x0

    .line 361
    .local v2, "hypotheticalMainSizesSum":F
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 362
    .local v4, "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    iget v5, v4, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->hypotheticalMainSize:F

    invoke-virtual {v4, v5}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getOuterMainSize(F)F

    move-result v5

    add-float/2addr v2, v5

    .line 363
    .end local v4    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    goto :goto_1

    .line 367
    :cond_0
    cmpg-float v3, v2, p1

    const/4 v4, 0x1

    if-gez v3, :cond_1

    move v3, v4

    goto :goto_2

    :cond_1
    const/4 v3, 0x0

    .line 369
    .local v3, "isFlexGrow":Z
    :goto_2
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 370
    .local v6, "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    if-eqz v3, :cond_3

    .line 371
    iget v7, v6, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexGrow:F

    invoke-static {v7}, Lcom/itextpdf/layout/renderer/FlexUtil;->isZero(F)Z

    move-result v7

    if-nez v7, :cond_2

    iget v7, v6, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexBaseSize:F

    iget v8, v6, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->hypotheticalMainSize:F

    cmpl-float v7, v7, v8

    if-lez v7, :cond_5

    .line 372
    :cond_2
    iget v7, v6, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->hypotheticalMainSize:F

    iput v7, v6, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    .line 373
    iput-boolean v4, v6, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isFrozen:Z

    goto :goto_4

    .line 376
    :cond_3
    iget v7, v6, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexShrink:F

    invoke-static {v7}, Lcom/itextpdf/layout/renderer/FlexUtil;->isZero(F)Z

    move-result v7

    if-nez v7, :cond_4

    iget v7, v6, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexBaseSize:F

    iget v8, v6, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->hypotheticalMainSize:F

    cmpg-float v7, v7, v8

    if-gez v7, :cond_5

    .line 377
    :cond_4
    iget v7, v6, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->hypotheticalMainSize:F

    iput v7, v6, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    .line 378
    iput-boolean v4, v6, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isFrozen:Z

    .line 381
    .end local v6    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    :cond_5
    :goto_4
    goto :goto_3

    .line 384
    :cond_6
    invoke-static {v1, p1}, Lcom/itextpdf/layout/renderer/FlexUtil;->calculateFreeSpace(Ljava/util/List;F)F

    move-result v5

    .line 388
    .local v5, "initialFreeSpace":F
    :goto_5
    invoke-static {v1}, Lcom/itextpdf/layout/renderer/FlexUtil;->hasFlexibleItems(Ljava/util/List;)Z

    move-result v6

    if-eqz v6, :cond_1b

    .line 391
    invoke-static {v1, p1}, Lcom/itextpdf/layout/renderer/FlexUtil;->calculateFreeSpace(Ljava/util/List;F)F

    move-result v6

    .line 392
    .local v6, "remainingFreeSpace":F
    const/4 v7, 0x0

    .line 393
    .local v7, "flexFactorSum":F
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_6
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_9

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 394
    .local v9, "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    iget-boolean v10, v9, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isFrozen:Z

    if-nez v10, :cond_8

    .line 395
    if-eqz v3, :cond_7

    iget v10, v9, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexGrow:F

    goto :goto_7

    :cond_7
    iget v10, v9, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexShrink:F

    :goto_7
    add-float/2addr v7, v10

    .line 397
    .end local v9    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    :cond_8
    goto :goto_6

    .line 402
    :cond_9
    const/high16 v8, 0x3f800000    # 1.0f

    cmpg-float v8, v7, v8

    if-gez v8, :cond_a

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v8

    mul-float v9, v5, v7

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v9

    cmpl-float v8, v8, v9

    if-lez v8, :cond_a

    .line 403
    mul-float v6, v5, v7

    .line 407
    :cond_a
    invoke-static {v6}, Lcom/itextpdf/layout/renderer/FlexUtil;->isZero(F)Z

    move-result v8

    if-nez v8, :cond_10

    .line 408
    const/4 v8, 0x0

    .line 409
    .local v8, "scaledFlexShrinkFactorsSum":F
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_8
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_d

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 410
    .local v10, "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    iget-boolean v11, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isFrozen:Z

    if-nez v11, :cond_c

    .line 411
    if-eqz v3, :cond_b

    .line 412
    iget v11, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexGrow:F

    div-float/2addr v11, v7

    .line 413
    .local v11, "ratio":F
    iget v12, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexBaseSize:F

    mul-float v13, v6, v11

    add-float/2addr v12, v13

    iput v12, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    .line 414
    .end local v11    # "ratio":F
    goto :goto_9

    .line 415
    :cond_b
    iget v11, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexShrink:F

    iget v12, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexBaseSize:F

    mul-float/2addr v11, v12

    iput v11, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->scaledFlexShrinkFactor:F

    .line 416
    iget v11, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->scaledFlexShrinkFactor:F

    add-float/2addr v8, v11

    .line 419
    .end local v10    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    :cond_c
    :goto_9
    goto :goto_8

    .line 421
    :cond_d
    invoke-static {v8}, Lcom/itextpdf/layout/renderer/FlexUtil;->isZero(F)Z

    move-result v9

    if-nez v9, :cond_f

    .line 422
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_a
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_f

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 423
    .restart local v10    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    iget-boolean v11, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isFrozen:Z

    if-nez v11, :cond_e

    if-nez v3, :cond_e

    .line 424
    iget v11, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->scaledFlexShrinkFactor:F

    div-float/2addr v11, v8

    .line 425
    .restart local v11    # "ratio":F
    iget v12, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexBaseSize:F

    .line 426
    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v13

    mul-float/2addr v13, v11

    sub-float/2addr v12, v13

    iput v12, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    .line 428
    .end local v10    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    .end local v11    # "ratio":F
    :cond_e
    goto :goto_a

    .line 430
    .end local v8    # "scaledFlexShrinkFactorsSum":F
    :cond_f
    goto :goto_c

    .line 432
    :cond_10
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_b
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_12

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 433
    .restart local v9    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    iget-boolean v10, v9, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isFrozen:Z

    if-nez v10, :cond_11

    .line 434
    iget v10, v9, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexBaseSize:F

    iput v10, v9, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    .line 436
    .end local v9    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    :cond_11
    goto :goto_b

    .line 439
    :cond_12
    :goto_c
    const/4 v8, 0x0

    .line 440
    .local v8, "sum":F
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_d
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_16

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 441
    .restart local v10    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    iget-boolean v11, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isFrozen:Z

    if-nez v11, :cond_15

    .line 444
    iget v11, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    iget v12, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->minContent:F

    .line 445
    invoke-static {v11, v12}, Ljava/lang/Math;->max(FF)F

    move-result v11

    iget v12, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->maxContent:F

    invoke-static {v11, v12}, Ljava/lang/Math;->min(FF)F

    move-result v11

    .line 446
    .local v11, "clampedSize":F
    iget v12, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    cmpl-float v12, v12, v11

    if-lez v12, :cond_13

    .line 447
    iput-boolean v4, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isMaxViolated:Z

    goto :goto_e

    .line 448
    :cond_13
    iget v12, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    cmpg-float v12, v12, v11

    if-gez v12, :cond_14

    .line 449
    iput-boolean v4, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isMinViolated:Z

    .line 451
    :cond_14
    :goto_e
    iget v12, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    sub-float v12, v11, v12

    add-float/2addr v8, v12

    .line 452
    iput v11, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    .line 454
    .end local v10    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    .end local v11    # "clampedSize":F
    :cond_15
    goto :goto_d

    .line 455
    :cond_16
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_f
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1a

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 456
    .restart local v10    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    iget-boolean v11, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isFrozen:Z

    if-nez v11, :cond_19

    .line 457
    invoke-static {v8}, Lcom/itextpdf/layout/renderer/FlexUtil;->isZero(F)Z

    move-result v11

    if-nez v11, :cond_18

    const/4 v11, 0x0

    cmpg-float v12, v11, v8

    if-gez v12, :cond_17

    iget-boolean v12, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isMinViolated:Z

    if-nez v12, :cond_18

    :cond_17
    cmpl-float v11, v11, v8

    if-lez v11, :cond_19

    iget-boolean v11, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isMaxViolated:Z

    if-eqz v11, :cond_19

    .line 460
    :cond_18
    iput-boolean v4, v10, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isFrozen:Z

    .line 463
    .end local v10    # "info":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    :cond_19
    goto :goto_f

    .line 464
    .end local v6    # "remainingFreeSpace":F
    .end local v7    # "flexFactorSum":F
    .end local v8    # "sum":F
    :cond_1a
    goto/16 :goto_5

    .line 475
    .end local v1    # "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    .end local v2    # "hypotheticalMainSizesSum":F
    .end local v3    # "isFlexGrow":Z
    .end local v5    # "initialFreeSpace":F
    :cond_1b
    goto/16 :goto_0

    .line 476
    :cond_1c
    return-void
.end method

.method private static resolveFlexibleLengths(Ljava/util/List;FF)V
    .locals 7
    .param p1, "layoutBoxSize"    # F
    .param p2, "containerSize"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;",
            ">;>;FF)V"
        }
    .end annotation

    .line 480
    .local p0, "lines":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;>;"
    invoke-static {p0, p2}, Lcom/itextpdf/layout/renderer/FlexUtil;->resolveFlexibleLengths(Ljava/util/List;F)V

    .line 481
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    const v0, 0x38d1b717    # 1.0E-4f

    sub-float v1, p2, v0

    cmpg-float v1, p1, v1

    if-gez v1, :cond_1

    .line 482
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 483
    .local v1, "lineToRecalculate":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    const/4 v2, 0x0

    .line 484
    .local v2, "mainSize":F
    const/4 v3, 0x0

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    .line 485
    .local v5, "itemInfo":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    iget v6, v5, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    invoke-virtual {v5, v6}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getOuterMainSize(F)F

    move-result v6

    add-float/2addr v2, v6

    .line 486
    sub-float v6, p1, v0

    cmpg-float v6, v2, v6

    if-gez v6, :cond_0

    .line 487
    iput-boolean v3, v5, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isFrozen:Z

    .line 488
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 492
    .end local v5    # "itemInfo":Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
    goto :goto_0

    .line 493
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 494
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 495
    .local v0, "updatedLines":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;>;"
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 496
    invoke-static {v0, p1}, Lcom/itextpdf/layout/renderer/FlexUtil;->resolveFlexibleLengths(Ljava/util/List;F)V

    .line 499
    .end local v0    # "updatedLines":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;>;"
    .end local v1    # "lineToRecalculate":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;"
    .end local v2    # "mainSize":F
    :cond_1
    return-void
.end method

.method private static resolveUnitValue(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;IF)Ljava/lang/Float;
    .locals 3
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/FlexContainerRenderer;
    .param p1, "property"    # I
    .param p2, "baseValue"    # F

    .line 235
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/renderer/FlexContainerRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    .line 236
    .local v0, "value":Lcom/itextpdf/layout/properties/UnitValue;
    if-nez v0, :cond_0

    .line 237
    const/4 v1, 0x0

    return-object v1

    .line 239
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->isPercentValue()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 240
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    const/high16 v2, 0x42c80000    # 100.0f

    div-float/2addr v1, v2

    mul-float/2addr v1, p2

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    return-object v1

    .line 242
    :cond_1
    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    return-object v1
.end method

.method private static retrieveCurrentPageLineCrossSizes(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;Ljava/util/List;Ljava/util/List;Ljava/lang/Float;Lcom/itextpdf/kernel/geom/Rectangle;)Ljava/util/List;
    .locals 10
    .param p0, "flexContainerRenderer"    # Lcom/itextpdf/layout/renderer/FlexContainerRenderer;
    .param p3, "crossSize"    # Ljava/lang/Float;
    .param p4, "layoutBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/renderer/FlexContainerRenderer;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;",
            ">;>;",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;",
            "Ljava/lang/Float;",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 967
    .local p1, "lines":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;>;>;"
    .local p2, "lineCrossSizes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    invoke-static {p0, v0}, Lcom/itextpdf/layout/renderer/FlexUtil;->getMainSize(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;Lcom/itextpdf/kernel/geom/Rectangle;)F

    move-result v0

    .line 968
    .local v0, "mainSize":F
    invoke-static {p0}, Lcom/itextpdf/layout/renderer/FlexUtil;->isColumnDirection(Lcom/itextpdf/layout/renderer/FlexContainerRenderer;)Z

    move-result v1

    const/4 v2, 0x0

    const v3, 0x38d1b717    # 1.0E-4f

    if-eqz v1, :cond_1

    cmpg-float v1, v0, v3

    if-ltz v1, :cond_0

    .line 969
    invoke-virtual {p4}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v1

    add-float/2addr v1, v3

    cmpl-float v1, v0, v1

    if-lez v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    move v1, v2

    .line 970
    .local v1, "isColumnDirectionWithPagination":Z
    :goto_0
    if-eqz v1, :cond_6

    if-nez p3, :cond_2

    goto :goto_3

    .line 974
    :cond_2
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 975
    .local v4, "currentPageLineCrossSizes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    const/4 v5, 0x0

    .line 976
    .local v5, "flexLinesCrossSizesSum":F
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v7

    if-ge v6, v7, :cond_5

    .line 977
    invoke-interface {p2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    .line 978
    .local v7, "size":F
    add-float v8, v5, v7

    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result v9

    add-float/2addr v9, v3

    cmpl-float v8, v8, v9

    if-gtz v8, :cond_4

    .line 979
    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;

    iget v8, v8, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    invoke-virtual {p4}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v9

    add-float/2addr v9, v3

    cmpl-float v8, v8, v9

    if-lez v8, :cond_3

    goto :goto_2

    .line 986
    :cond_3
    add-float/2addr v5, v7

    .line 987
    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 976
    .end local v7    # "size":F
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 980
    .restart local v7    # "size":F
    :cond_4
    :goto_2
    if-nez v6, :cond_5

    .line 982
    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 989
    .end local v6    # "i":I
    .end local v7    # "size":F
    :cond_5
    return-object v4

    .line 971
    .end local v4    # "currentPageLineCrossSizes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v5    # "flexLinesCrossSizesSum":F
    :cond_6
    :goto_3
    return-object p2
.end method

.method private static retrieveMaxHeightForMainDirection(Lcom/itextpdf/layout/renderer/AbstractRenderer;)Ljava/lang/Float;
    .locals 2
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 691
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveMaxHeight()Ljava/lang/Float;

    move-result-object v0

    .line 692
    .local v0, "maxHeight":Ljava/lang/Float;
    const/16 v1, 0x54

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasProperty(I)Z

    move-result v1

    if-eqz v1, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method private static retrieveMinHeightForMainDirection(Lcom/itextpdf/layout/renderer/AbstractRenderer;)Ljava/lang/Float;
    .locals 3
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 696
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveMinHeight()Ljava/lang/Float;

    move-result-object v0

    .line 697
    .local v0, "minHeight":Ljava/lang/Float;
    const/16 v1, 0x55

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasProperty(I)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method
