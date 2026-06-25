.class public abstract Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;
.super Ljava/lang/Object;
.source "AbstractLinearGradientBuilder.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field protected static final ZERO_EPSILON:D = 1.0E-10


# instance fields
.field private spreadMethod:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

.field private final stops:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 59
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->stops:Ljava/util/List;

    .line 67
    sget-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;->NONE:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    iput-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->spreadMethod:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    return-void
.end method

.method private static adjustNormalizedStopsToCoverDomain(Ljava/util/List;[DLcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;)Ljava/util/List;
    .locals 28
    .param p1, "targetDomain"    # [D
    .param p2, "spreadMethod"    # Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;",
            ">;[D",
            "Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;",
            ">;"
        }
    .end annotation

    .line 493
    .local p0, "normalizedStops":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 495
    .local v2, "adjustedStops":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 496
    .local v3, "lastColorStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffset()D

    move-result-wide v5

    .line 497
    .local v5, "originalIntervalEnd":D
    const/4 v7, 0x0

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffset()D

    move-result-wide v8

    .line 498
    .local v8, "originalIntervalStart":D
    sub-double v10, v5, v8

    .line 500
    .local v10, "originalIntervalLength":D
    const-wide v12, 0x3ddb7cdfd9d7bdbbL    # 1.0E-10

    cmpg-double v12, v10, v12

    const/4 v13, 0x2

    if-gtz v12, :cond_0

    .line 501
    new-array v12, v13, [Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    new-instance v13, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    aget-wide v14, p1, v7

    move/from16 v16, v4

    sget-object v4, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->RELATIVE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    invoke-direct {v13, v3, v14, v15, v4}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;-><init>(Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;)V

    aput-object v13, v12, v7

    new-instance v4, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    aget-wide v13, p1, v16

    sget-object v7, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->RELATIVE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    invoke-direct {v4, v3, v13, v14, v7}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;-><init>(Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;)V

    aput-object v4, v12, v16

    invoke-static {v12}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    return-object v4

    .line 505
    :cond_0
    move/from16 v16, v4

    aget-wide v14, p1, v7

    sub-double/2addr v14, v8

    div-double/2addr v14, v10

    invoke-static {v14, v15}, Ljava/lang/Math;->floor(D)D

    move-result-wide v14

    .line 506
    .local v14, "startIntervalsShift":D
    mul-double v17, v10, v14

    add-double v17, v8, v17

    .line 507
    .local v17, "iterationOffset":D
    sget-object v4, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;->REFLECT:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    if-ne v1, v4, :cond_1

    .line 508
    invoke-static {v14, v15}, Ljava/lang/Math;->abs(D)D

    move-result-wide v19

    const-wide/high16 v21, 0x4000000000000000L    # 2.0

    rem-double v19, v19, v21

    const-wide/16 v21, 0x0

    cmpl-double v4, v19, v21

    if-eqz v4, :cond_1

    move/from16 v4, v16

    goto :goto_0

    :cond_1
    move v4, v7

    .line 510
    .local v4, "isIterationInverse":Z
    :goto_0
    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    goto :goto_1

    :cond_2
    move v12, v7

    .line 512
    .local v12, "currentIterationIndex":I
    :goto_1
    move-wide/from16 v19, v17

    .line 513
    .local v19, "lastComputedOffset":D
    :goto_2
    aget-wide v21, p1, v16

    cmpg-double v21, v19, v21

    if-gtz v21, :cond_a

    .line 514
    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v21

    move/from16 v22, v13

    move-object/from16 v13, v21

    check-cast v13, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 515
    .local v13, "currentStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    if-eqz v4, :cond_3

    add-double v23, v17, v5

    .line 516
    invoke-virtual {v13}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffset()D

    move-result-wide v25

    sub-double v23, v23, v25

    goto :goto_3

    .line 517
    :cond_3
    invoke-virtual {v13}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffset()D

    move-result-wide v23

    add-double v23, v17, v23

    sub-double v23, v23, v8

    :goto_3
    move-wide/from16 v19, v23

    .line 518
    move/from16 v21, v7

    new-instance v7, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    move-object/from16 v23, v3

    .end local v3    # "lastColorStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    .local v23, "lastColorStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    sget-object v3, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->RELATIVE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    move-wide/from16 v24, v5

    move v6, v4

    move-wide/from16 v4, v19

    .end local v5    # "originalIntervalEnd":D
    .end local v19    # "lastComputedOffset":D
    .local v4, "lastComputedOffset":D
    .local v6, "isIterationInverse":Z
    .local v24, "originalIntervalEnd":D
    invoke-direct {v7, v13, v4, v5, v3}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;-><init>(Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;)V

    .line 521
    .local v7, "computedStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    aget-wide v19, p1, v21

    cmpg-double v3, v4, v19

    if-gez v3, :cond_4

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4

    .line 522
    move/from16 v3, v21

    invoke-interface {v2, v3, v7}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 521
    :cond_4
    move/from16 v3, v21

    .line 524
    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 527
    :goto_4
    if-eqz v6, :cond_5

    .line 528
    add-int/lit8 v12, v12, -0x1

    .line 529
    if-gez v12, :cond_8

    .line 530
    add-double v17, v17, v10

    .line 531
    const/4 v6, 0x0

    .line 532
    const/4 v12, 0x1

    goto :goto_7

    .line 535
    :cond_5
    add-int/lit8 v12, v12, 0x1

    .line 536
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ne v12, v3, :cond_8

    .line 537
    add-double v17, v17, v10

    .line 538
    sget-object v3, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;->REFLECT:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    if-ne v1, v3, :cond_6

    move/from16 v3, v16

    goto :goto_5

    :cond_6
    const/4 v3, 0x0

    .line 539
    .end local v6    # "isIterationInverse":Z
    .local v3, "isIterationInverse":Z
    :goto_5
    if-eqz v3, :cond_7

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x2

    goto :goto_6

    :cond_7
    const/4 v6, 0x0

    :goto_6
    move v12, v6

    move v6, v3

    .line 543
    .end local v3    # "isIterationInverse":Z
    .restart local v6    # "isIterationInverse":Z
    :cond_8
    :goto_7
    if-eqz v6, :cond_9

    .line 544
    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 549
    .local v3, "nextColor":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    const-wide/high16 v19, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v3}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getHintOffset()D

    move-result-wide v26

    sub-double v0, v19, v26

    move-object/from16 v26, v2

    .end local v2    # "adjustedStops":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    .local v26, "adjustedStops":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    invoke-virtual {v3}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getHintOffsetType()Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    move-result-object v2

    invoke-virtual {v7, v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->setHint(DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;)Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 550
    .end local v3    # "nextColor":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    goto :goto_8

    .line 551
    .end local v26    # "adjustedStops":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    .restart local v2    # "adjustedStops":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    :cond_9
    move-object/from16 v26, v2

    .end local v2    # "adjustedStops":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    .restart local v26    # "adjustedStops":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    invoke-virtual {v13}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getHintOffset()D

    move-result-wide v0

    invoke-virtual {v13}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getHintOffsetType()Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    move-result-object v2

    invoke-virtual {v7, v0, v1, v2}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->setHint(DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;)Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 553
    .end local v7    # "computedStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    .end local v13    # "currentStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    :goto_8
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-wide/from16 v19, v4

    move v4, v6

    move/from16 v13, v22

    move-object/from16 v3, v23

    move-wide/from16 v5, v24

    move-object/from16 v2, v26

    const/4 v7, 0x0

    goto/16 :goto_2

    .line 555
    .end local v6    # "isIterationInverse":Z
    .end local v23    # "lastColorStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    .end local v24    # "originalIntervalEnd":D
    .end local v26    # "adjustedStops":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    .restart local v2    # "adjustedStops":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    .local v3, "lastColorStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    .local v4, "isIterationInverse":Z
    .restart local v5    # "originalIntervalEnd":D
    .restart local v19    # "lastComputedOffset":D
    :cond_a
    move-object/from16 v26, v2

    .end local v2    # "adjustedStops":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    .restart local v26    # "adjustedStops":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    return-object v26
.end method

.method private static adjustStopsForPadIfNeeded(Ljava/util/List;[D)V
    .locals 7
    .param p1, "coordinatesDomain"    # [D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;",
            ">;[D)V"
        }
    .end annotation

    .line 481
    .local p0, "stopsToConstruct":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 482
    .local v1, "firstStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    aget-wide v2, p1, v0

    invoke-virtual {v1}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffset()D

    move-result-wide v4

    cmpg-double v2, v2, v4

    if-gez v2, :cond_0

    .line 483
    new-instance v2, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    aget-wide v3, p1, v0

    sget-object v5, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->RELATIVE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    invoke-direct {v2, v1, v3, v4, v5}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;-><init>(Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;)V

    invoke-interface {p0, v0, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 485
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v2, 0x1

    sub-int/2addr v0, v2

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 486
    .local v0, "lastStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    aget-wide v3, p1, v2

    invoke-virtual {v0}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffset()D

    move-result-wide v5

    cmpl-double v3, v3, v5

    if-lez v3, :cond_1

    .line 487
    new-instance v3, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    aget-wide v4, p1, v2

    sget-object v2, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->RELATIVE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    invoke-direct {v3, v0, v4, v5, v2}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;-><init>(Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;)V

    invoke-interface {p0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 489
    :cond_1
    return-void
.end method

.method private static constructFunction(Ljava/util/List;)Lcom/itextpdf/kernel/pdf/function/IPdfFunction;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;",
            ">;)",
            "Lcom/itextpdf/kernel/pdf/function/IPdfFunction;"
        }
    .end annotation

    .line 559
    .local p0, "toConstruct":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    move-object/from16 v0, p0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    .line 561
    .local v1, "functionsAmount":I
    add-int/lit8 v3, v1, -0x1

    new-array v8, v3, [D

    .line 562
    .local v8, "bounds":[D
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 565
    .local v7, "type2Functions":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<+Lcom/itextpdf/kernel/pdf/PdfDictionary;>;>;"
    const/4 v3, 0x0

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 566
    .local v4, "nextStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffset()D

    move-result-wide v10

    .line 567
    .local v10, "domainStart":D
    const/4 v5, 0x1

    .local v5, "i":I
    :goto_0
    if-ge v5, v1, :cond_0

    .line 568
    move-object v6, v4

    .line 569
    .local v6, "currentStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    move-object v4, v9

    check-cast v4, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 570
    add-int/lit8 v9, v5, -0x1

    invoke-virtual {v4}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffset()D

    move-result-wide v12

    aput-wide v12, v8, v9

    .line 571
    invoke-static {v6, v4}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->constructSingleGradientSegmentFunction(Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;)Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;

    move-result-object v9

    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 567
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 574
    .end local v5    # "i":I
    .end local v6    # "currentStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    :cond_0
    move-object v12, v4

    .line 575
    .local v12, "currentStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    sub-int/2addr v5, v2

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    move-object v13, v5

    check-cast v13, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 576
    .end local v4    # "nextStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    .local v13, "nextStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    invoke-static {v12, v13}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->constructSingleGradientSegmentFunction(Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;)Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;

    move-result-object v4

    invoke-interface {v7, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 577
    invoke-virtual {v13}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffset()D

    move-result-wide v14

    .line 579
    .local v14, "domainEnd":D
    mul-int/lit8 v4, v1, 0x2

    new-array v9, v4, [D

    .line 580
    .local v9, "encode":[D
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    array-length v5, v9

    if-ge v4, v5, :cond_1

    .line 581
    const-wide/16 v5, 0x0

    aput-wide v5, v9, v4

    .line 582
    add-int/lit8 v5, v4, 0x1

    const-wide/high16 v16, 0x3ff0000000000000L    # 1.0

    aput-wide v16, v9, v5

    .line 580
    add-int/lit8 v4, v4, 0x2

    goto :goto_1

    .line 585
    .end local v4    # "i":I
    :cond_1
    new-instance v4, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;

    const/4 v5, 0x2

    new-array v5, v5, [D

    aput-wide v10, v5, v3

    aput-wide v14, v5, v2

    const/4 v6, 0x0

    invoke-direct/range {v4 .. v9}, Lcom/itextpdf/kernel/pdf/function/PdfType3Function;-><init>([D[DLjava/util/List;[D[D)V

    return-object v4
.end method

.method private static constructSingleGradientSegmentFunction(Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;)Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction;
    .locals 13
    .param p0, "from"    # Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    .param p1, "to"    # Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;",
            "Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;",
            ")",
            "Lcom/itextpdf/kernel/pdf/function/AbstractPdfFunction<",
            "+",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            ">;"
        }
    .end annotation

    .line 591
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 592
    .local v0, "exponent":D
    invoke-virtual {p0}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getRgbArray()[F

    move-result-object v2

    .line 593
    .local v2, "fromColor":[F
    invoke-virtual {p1}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getRgbArray()[F

    move-result-object v3

    .line 594
    .local v3, "toColor":[F
    invoke-virtual {p0}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getHintOffsetType()Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    move-result-object v4

    sget-object v5, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->RELATIVE_BETWEEN_COLORS:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    if-ne v4, v5, :cond_2

    .line 595
    invoke-virtual {p0}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getHintOffset()D

    move-result-wide v4

    .line 596
    .local v4, "hintOffset":D
    const-wide v6, 0x3ddb7cdfd9d7bdbbL    # 1.0E-10

    cmpg-double v6, v4, v6

    if-gtz v6, :cond_0

    .line 597
    move-object v2, v3

    move-wide v11, v0

    move-object v9, v2

    move-object v10, v3

    goto :goto_0

    .line 598
    :cond_0
    const-wide v6, 0x3feffffffff24190L    # 0.9999999999

    cmpl-double v6, v4, v6

    if-ltz v6, :cond_1

    .line 599
    move-object v3, v2

    move-wide v11, v0

    move-object v9, v2

    move-object v10, v3

    goto :goto_0

    .line 602
    :cond_1
    const-wide/high16 v6, 0x3fe0000000000000L    # 0.5

    invoke-static {v6, v7}, Ljava/lang/Math;->log(D)D

    move-result-wide v6

    invoke-static {v4, v5}, Ljava/lang/Math;->log(D)D

    move-result-wide v8

    div-double v0, v6, v8

    move-wide v11, v0

    move-object v9, v2

    move-object v10, v3

    goto :goto_0

    .line 594
    .end local v4    # "hintOffset":D
    :cond_2
    move-wide v11, v0

    move-object v9, v2

    move-object v10, v3

    .line 605
    .end local v0    # "exponent":D
    .end local v2    # "fromColor":[F
    .end local v3    # "toColor":[F
    .local v9, "fromColor":[F
    .local v10, "toColor":[F
    .local v11, "exponent":D
    :goto_0
    new-instance v6, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;

    const/4 v0, 0x2

    new-array v7, v0, [F

    fill-array-data v7, :array_0

    const/4 v8, 0x0

    invoke-direct/range {v6 .. v12}, Lcom/itextpdf/kernel/pdf/function/PdfType2Function;-><init>([F[F[F[FD)V

    return-object v6

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private static copyStopsAndNormalizeAbsoluteOffsets(Ljava/util/List;D)Ljava/util/List;
    .locals 13
    .param p1, "baseVectorLength"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;",
            ">;D)",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;",
            ">;"
        }
    .end annotation

    .line 440
    .local p0, "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    const-wide/high16 v0, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    .line 441
    .local v0, "lastUsedOffset":D
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 442
    .local v2, "copy":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 443
    .local v4, "stop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffset()D

    move-result-wide v5

    .line 444
    .local v5, "offset":D
    invoke-virtual {v4}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffsetType()Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    move-result-object v7

    .line 445
    .local v7, "offsetType":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;
    sget-object v8, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->ABSOLUTE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    if-ne v7, v8, :cond_0

    .line 446
    sget-object v7, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->RELATIVE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    .line 447
    div-double/2addr v5, p1

    .line 450
    :cond_0
    sget-object v8, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->RELATIVE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    if-ne v7, v8, :cond_2

    .line 451
    cmpg-double v8, v5, v0

    if-gez v8, :cond_1

    .line 452
    move-wide v5, v0

    .line 454
    :cond_1
    move-wide v0, v5

    .line 457
    :cond_2
    new-instance v8, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    invoke-direct {v8, v4, v5, v6, v7}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;-><init>(Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;)V

    .line 459
    .local v8, "result":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getHintOffset()D

    move-result-wide v9

    .line 460
    .local v9, "hintOffset":D
    invoke-virtual {v4}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getHintOffsetType()Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    move-result-object v11

    .line 461
    .local v11, "hintOffsetType":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;
    sget-object v12, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->ABSOLUTE_ON_GRADIENT:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    if-ne v11, v12, :cond_3

    .line 462
    sget-object v11, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->RELATIVE_ON_GRADIENT:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    .line 463
    div-double/2addr v9, p1

    .line 466
    :cond_3
    sget-object v12, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->RELATIVE_ON_GRADIENT:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    if-ne v11, v12, :cond_5

    .line 467
    cmpg-double v12, v9, v0

    if-gez v12, :cond_4

    .line 468
    move-wide v9, v0

    .line 470
    :cond_4
    move-wide v0, v9

    .line 473
    :cond_5
    invoke-virtual {v8, v9, v10, v11}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->setHint(DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;)Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 474
    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 475
    .end local v4    # "stop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    .end local v5    # "offset":D
    .end local v7    # "offsetType":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;
    .end local v8    # "result":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    .end local v9    # "hintOffset":D
    .end local v11    # "hintOffsetType":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;
    goto :goto_0

    .line 476
    :cond_6
    return-object v2
.end method

.method private static createAxialShading([Lcom/itextpdf/kernel/geom/Point;Ljava/util/List;Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;
    .locals 19
    .param p0, "baseCoordinatesVector"    # [Lcom/itextpdf/kernel/geom/Point;
    .param p2, "spreadMethod"    # Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;
    .param p3, "targetBoundingBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/itextpdf/kernel/geom/Point;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;",
            ">;",
            "Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ")",
            "Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;"
        }
    .end annotation

    .line 278
    .local p1, "stops":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    const/4 v2, 0x1

    aget-object v3, v0, v2

    const/4 v4, 0x0

    aget-object v5, v0, v4

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/geom/Point;->distance(Lcom/itextpdf/kernel/geom/Point;)D

    move-result-wide v5

    .line 280
    .local v5, "baseVectorLength":D
    move-object/from16 v3, p1

    invoke-static {v3, v5, v6}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->normalizeStops(Ljava/util/List;D)Ljava/util/List;

    move-result-object v7

    .line 281
    .local v7, "stopsToConstruct":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    const/4 v8, 0x2

    new-array v9, v8, [D

    fill-array-data v9, :array_0

    .line 283
    .local v9, "coordinatesDomain":[D
    const-wide v10, 0x3ddb7cdfd9d7bdbbL    # 1.0E-10

    cmpg-double v12, v5, v10

    const/4 v13, 0x0

    if-ltz v12, :cond_7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v12

    if-ne v12, v2, :cond_0

    move-object/from16 v12, p3

    move/from16 v16, v2

    goto/16 :goto_3

    .line 295
    :cond_0
    move-object/from16 v12, p3

    invoke-static {v0, v12}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->evaluateCoveringDomain([Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Rectangle;)[D

    move-result-object v9

    .line 296
    sget-object v8, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;->REPEAT:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    if-eq v1, v8, :cond_5

    sget-object v8, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;->REFLECT:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    if-ne v1, v8, :cond_1

    move/from16 v16, v2

    goto :goto_1

    .line 299
    :cond_1
    sget-object v8, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;->PAD:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    if-ne v1, v8, :cond_2

    .line 300
    invoke-static {v7, v9}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->adjustStopsForPadIfNeeded(Ljava/util/List;[D)V

    move/from16 v16, v2

    goto :goto_2

    .line 303
    :cond_2
    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffset()D

    move-result-wide v14

    .line 304
    .local v14, "firstStopOffset":D
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    sub-int/2addr v8, v2

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    move/from16 v16, v2

    invoke-virtual {v8}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffset()D

    move-result-wide v2

    .line 305
    .local v2, "lastStopOffset":D
    sub-double v17, v2, v14

    cmpg-double v8, v17, v10

    if-ltz v8, :cond_4

    aget-wide v10, v9, v16

    cmpg-double v8, v10, v14

    if-lez v8, :cond_4

    aget-wide v10, v9, v4

    cmpl-double v8, v10, v2

    if-ltz v8, :cond_3

    goto :goto_0

    .line 310
    :cond_3
    aget-wide v10, v9, v4

    invoke-static {v10, v11, v14, v15}, Ljava/lang/Math;->max(DD)D

    move-result-wide v10

    aput-wide v10, v9, v4

    .line 311
    aget-wide v10, v9, v16

    invoke-static {v10, v11, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v10

    aput-wide v10, v9, v16

    goto :goto_2

    .line 308
    :cond_4
    :goto_0
    return-object v13

    .line 296
    .end local v2    # "lastStopOffset":D
    .end local v14    # "firstStopOffset":D
    :cond_5
    move/from16 v16, v2

    .line 297
    :goto_1
    invoke-static {v7, v9, v1}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->adjustNormalizedStopsToCoverDomain(Ljava/util/List;[DLcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;)Ljava/util/List;

    move-result-object v7

    .line 313
    :goto_2
    aget-wide v2, v9, v4

    aget-wide v10, v9, v16

    cmpg-double v2, v2, v10

    if-gtz v2, :cond_6

    .line 315
    invoke-static {v9, v0}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->createCoordinatesForNewDomain([D[Lcom/itextpdf/kernel/geom/Point;)[Lcom/itextpdf/kernel/geom/Point;

    move-result-object v2

    .local v2, "actualCoordinates":[Lcom/itextpdf/kernel/geom/Point;
    goto :goto_4

    .line 313
    .end local v2    # "actualCoordinates":[Lcom/itextpdf/kernel/geom/Point;
    :cond_6
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 283
    :cond_7
    move-object/from16 v12, p3

    move/from16 v16, v2

    .line 285
    :goto_3
    sget-object v2, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;->NONE:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    if-ne v1, v2, :cond_8

    .line 286
    return-object v13

    .line 288
    :cond_8
    new-array v2, v8, [Lcom/itextpdf/kernel/geom/Point;

    new-instance v3, Lcom/itextpdf/kernel/geom/Point;

    invoke-virtual {v12}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v10

    float-to-double v10, v10

    invoke-virtual {v12}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v13

    float-to-double v13, v13

    invoke-direct {v3, v10, v11, v13, v14}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    aput-object v3, v2, v4

    new-instance v3, Lcom/itextpdf/kernel/geom/Point;

    .line 289
    invoke-virtual {v12}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v10

    float-to-double v10, v10

    invoke-virtual {v12}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v13

    float-to-double v13, v13

    invoke-direct {v3, v10, v11, v13, v14}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    aput-object v3, v2, v16

    .line 291
    .restart local v2    # "actualCoordinates":[Lcom/itextpdf/kernel/geom/Point;
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 292
    .local v3, "lastColorStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    new-array v8, v8, [Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    new-instance v10, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    sget-object v11, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->RELATIVE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    const-wide/16 v13, 0x0

    invoke-direct {v10, v3, v13, v14, v11}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;-><init>(Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;)V

    aput-object v10, v8, v4

    new-instance v4, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    sget-object v10, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->RELATIVE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    const-wide/high16 v13, 0x3ff0000000000000L    # 1.0

    invoke-direct {v4, v3, v13, v14, v10}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;-><init>(Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;)V

    aput-object v4, v8, v16

    invoke-static {v8}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    .line 294
    .end local v3    # "lastColorStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    nop

    .line 318
    :goto_4
    new-instance v3, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;

    new-instance v4, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Rgb;

    invoke-direct {v4}, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Rgb;-><init>()V

    .line 320
    invoke-static {v2}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->createCoordsPdfArray([Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v8

    new-instance v10, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v10, v9}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([D)V

    .line 322
    invoke-static {v7}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->constructFunction(Ljava/util/List;)Lcom/itextpdf/kernel/pdf/function/IPdfFunction;

    move-result-object v11

    invoke-direct {v3, v4, v8, v10, v11}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/PdfArray;Lcom/itextpdf/kernel/pdf/function/IPdfFunction;)V

    .line 318
    return-object v3

    :array_0
    .array-data 8
        0x0
        0x3ff0000000000000L    # 1.0
    .end array-data
.end method

.method protected static createCoordinatesForNewDomain([D[Lcom/itextpdf/kernel/geom/Point;)[Lcom/itextpdf/kernel/geom/Point;
    .locals 13
    .param p0, "newDomain"    # [D
    .param p1, "baseVector"    # [Lcom/itextpdf/kernel/geom/Point;

    .line 264
    const/4 v0, 0x1

    aget-object v1, p1, v0

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v1

    const/4 v3, 0x0

    aget-object v4, p1, v3

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v4

    sub-double/2addr v1, v4

    .line 265
    .local v1, "xDiff":D
    aget-object v4, p1, v0

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v4

    aget-object v6, p1, v3

    invoke-virtual {v6}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v6

    sub-double/2addr v4, v6

    .line 267
    .local v4, "yDiff":D
    const/4 v6, 0x2

    new-array v6, v6, [Lcom/itextpdf/kernel/geom/Point;

    aget-object v7, p1, v3

    .line 268
    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Point;->getLocation()Lcom/itextpdf/kernel/geom/Point;

    move-result-object v7

    aput-object v7, v6, v3

    aget-object v7, p1, v0

    .line 269
    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Point;->getLocation()Lcom/itextpdf/kernel/geom/Point;

    move-result-object v7

    aput-object v7, v6, v0

    .line 271
    .local v6, "targetCoords":[Lcom/itextpdf/kernel/geom/Point;
    aget-object v7, v6, v3

    aget-wide v8, p0, v3

    mul-double/2addr v8, v1

    aget-wide v10, p0, v3

    mul-double/2addr v10, v4

    invoke-virtual {v7, v8, v9, v10, v11}, Lcom/itextpdf/kernel/geom/Point;->translate(DD)V

    .line 272
    aget-object v3, v6, v0

    aget-wide v7, p0, v0

    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v7, v9

    mul-double/2addr v7, v1

    aget-wide v11, p0, v0

    sub-double/2addr v11, v9

    mul-double/2addr v11, v4

    invoke-virtual {v3, v7, v8, v11, v12}, Lcom/itextpdf/kernel/geom/Point;->translate(DD)V

    .line 273
    return-object v6
.end method

.method private static createCoordsPdfArray([Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 13
    .param p0, "coordsPoints"    # [Lcom/itextpdf/kernel/geom/Point;

    .line 609
    if-eqz p0, :cond_0

    array-length v0, p0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 611
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v2, 0x0

    aget-object v3, p0, v2

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v3

    aget-object v5, p0, v2

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v5

    const/4 v7, 0x1

    aget-object v8, p0, v7

    .line 612
    invoke-virtual {v8}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v8

    aget-object v10, p0, v7

    invoke-virtual {v10}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v10

    const/4 v12, 0x4

    new-array v12, v12, [D

    aput-wide v3, v12, v2

    aput-wide v5, v12, v7

    aput-wide v8, v12, v1

    const/4 v1, 0x3

    aput-wide v10, v12, v1

    invoke-direct {v0, v12}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([D)V

    .line 611
    return-object v0

    .line 609
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method protected static evaluateCoveringDomain([Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Rectangle;)[D
    .locals 26
    .param p0, "coords"    # [Lcom/itextpdf/kernel/geom/Point;
    .param p1, "toCover"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 223
    const/4 v0, 0x2

    if-nez p1, :cond_0

    .line 224
    new-array v0, v0, [D

    fill-array-data v0, :array_0

    return-object v0

    .line 226
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/geom/AffineTransform;

    invoke-direct {v1}, Lcom/itextpdf/kernel/geom/AffineTransform;-><init>()V

    .line 227
    .local v1, "transform":Lcom/itextpdf/kernel/geom/AffineTransform;
    const/4 v2, 0x0

    aget-object v3, p0, v2

    const/4 v4, 0x1

    aget-object v5, p0, v4

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/geom/Point;->distance(Lcom/itextpdf/kernel/geom/Point;)D

    move-result-wide v5

    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    div-double v5, v7, v5

    .line 228
    .local v5, "scale":D
    aget-object v3, p0, v4

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v9

    aget-object v3, p0, v2

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v11

    sub-double/2addr v9, v11

    neg-double v9, v9

    mul-double/2addr v9, v5

    .line 229
    .local v9, "sin":D
    aget-object v3, p0, v4

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v11

    aget-object v3, p0, v2

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v13

    sub-double/2addr v11, v13

    mul-double/2addr v11, v5

    .line 230
    .local v11, "cos":D
    invoke-static {v11, v12}, Ljava/lang/Math;->abs(D)D

    move-result-wide v13

    const-wide v15, 0x3ddb7cdfd9d7bdbbL    # 1.0E-10

    cmpg-double v3, v13, v15

    const-wide/high16 v13, -0x4010000000000000L    # -1.0

    const-wide/16 v17, 0x0

    if-gez v3, :cond_2

    .line 231
    const-wide/16 v11, 0x0

    .line 232
    cmpl-double v3, v9, v17

    if-lez v3, :cond_1

    goto :goto_0

    :cond_1
    move-wide v7, v13

    :goto_0
    move-wide v9, v7

    move-wide v14, v11

    goto :goto_2

    .line 233
    :cond_2
    invoke-static {v9, v10}, Ljava/lang/Math;->abs(D)D

    move-result-wide v19

    cmpg-double v3, v19, v15

    if-gez v3, :cond_4

    .line 234
    const-wide/16 v9, 0x0

    .line 235
    cmpl-double v3, v11, v17

    if-lez v3, :cond_3

    goto :goto_1

    :cond_3
    move-wide v7, v13

    :goto_1
    move-wide v11, v7

    move-wide v14, v11

    goto :goto_2

    .line 233
    :cond_4
    move-wide v14, v11

    .line 237
    .end local v11    # "cos":D
    .local v14, "cos":D
    :goto_2
    new-instance v13, Lcom/itextpdf/kernel/geom/AffineTransform;

    neg-double v7, v9

    const-wide/16 v22, 0x0

    const-wide/16 v24, 0x0

    move-wide/from16 v20, v14

    move-wide/from16 v18, v7

    move-wide/from16 v16, v9

    .end local v9    # "sin":D
    .local v16, "sin":D
    invoke-direct/range {v13 .. v25}, Lcom/itextpdf/kernel/geom/AffineTransform;-><init>(DDDDDD)V

    invoke-virtual {v1, v13}, Lcom/itextpdf/kernel/geom/AffineTransform;->concatenate(Lcom/itextpdf/kernel/geom/AffineTransform;)V

    .line 239
    invoke-virtual {v1, v5, v6, v5, v6}, Lcom/itextpdf/kernel/geom/AffineTransform;->scale(DD)V

    .line 240
    aget-object v3, p0, v2

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v7

    neg-double v7, v7

    aget-object v3, p0, v2

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/Point;->getY()D

    move-result-wide v9

    neg-double v9, v9

    invoke-virtual {v1, v7, v8, v9, v10}, Lcom/itextpdf/kernel/geom/AffineTransform;->translate(DD)V

    .line 242
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/geom/Rectangle;->toPointsArray()[Lcom/itextpdf/kernel/geom/Point;

    move-result-object v3

    .line 243
    .local v3, "rectanglePoints":[Lcom/itextpdf/kernel/geom/Point;
    aget-object v7, v3, v2

    const/4 v8, 0x0

    invoke-virtual {v1, v7, v8}, Lcom/itextpdf/kernel/geom/AffineTransform;->transform(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v9

    .line 244
    .local v9, "minX":D
    move-wide v11, v9

    .line 245
    .local v11, "maxX":D
    const/4 v7, 0x1

    .local v7, "i":I
    :goto_3
    array-length v13, v3

    if-ge v7, v13, :cond_5

    .line 246
    aget-object v13, v3, v7

    invoke-virtual {v1, v13, v8}, Lcom/itextpdf/kernel/geom/AffineTransform;->transform(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v13

    move/from16 v18, v2

    move-object/from16 v19, v3

    .end local v3    # "rectanglePoints":[Lcom/itextpdf/kernel/geom/Point;
    .local v19, "rectanglePoints":[Lcom/itextpdf/kernel/geom/Point;
    invoke-virtual {v13}, Lcom/itextpdf/kernel/geom/Point;->getX()D

    move-result-wide v2

    .line 247
    .local v2, "currentX":D
    invoke-static {v9, v10, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v9

    .line 248
    invoke-static {v11, v12, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v11

    .line 245
    .end local v2    # "currentX":D
    add-int/lit8 v7, v7, 0x1

    move/from16 v2, v18

    move-object/from16 v3, v19

    goto :goto_3

    .end local v19    # "rectanglePoints":[Lcom/itextpdf/kernel/geom/Point;
    .restart local v3    # "rectanglePoints":[Lcom/itextpdf/kernel/geom/Point;
    :cond_5
    move/from16 v18, v2

    .line 251
    .end local v7    # "i":I
    new-array v0, v0, [D

    aput-wide v9, v0, v18

    aput-wide v11, v0, v4

    return-object v0

    :array_0
    .array-data 8
        0x0
        0x3ff0000000000000L    # 1.0
    .end array-data
.end method

.method private static normalizeAutoStops(Ljava/util/List;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;",
            ">;)V"
        }
    .end annotation

    .line 367
    .local p0, "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffsetType()Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->RELATIVE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    if-ne v1, v2, :cond_7

    .line 369
    const/4 v1, 0x1

    .line 370
    .local v1, "firstAutoStopIndex":I
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 371
    .local v0, "firstStopColor":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getHintOffsetType()Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->RELATIVE_ON_GRADIENT:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    if-ne v2, v3, :cond_0

    .line 372
    invoke-virtual {v0}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getHintOffset()D

    move-result-wide v2

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffset()D

    move-result-wide v2

    .line 373
    .local v2, "prevOffset":D
    :goto_0
    const/4 v4, 0x1

    move v6, v1

    move-wide v8, v2

    .end local v1    # "firstAutoStopIndex":I
    .end local v2    # "prevOffset":D
    .local v4, "i":I
    .local v6, "firstAutoStopIndex":I
    .local v8, "prevOffset":D
    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-ge v4, v1, :cond_5

    .line 374
    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 375
    .local v1, "currentStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffsetType()Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->AUTO:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    if-ne v2, v3, :cond_2

    .line 376
    invoke-virtual {v1}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getHintOffsetType()Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    move-result-object v2

    sget-object v3, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->RELATIVE_ON_GRADIENT:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    if-ne v2, v3, :cond_1

    .line 377
    invoke-virtual {v1}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getHintOffset()D

    move-result-wide v10

    .line 378
    .local v10, "hintOffset":D
    add-int/lit8 v7, v4, 0x1

    move-object v5, p0

    .end local p0    # "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    .local v5, "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    invoke-static/range {v5 .. v11}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->normalizeAutoStops(Ljava/util/List;IIDD)V

    .line 379
    move-wide v2, v10

    .line 380
    .end local v8    # "prevOffset":D
    .restart local v2    # "prevOffset":D
    add-int/lit8 p0, v4, 0x1

    .line 381
    .end local v6    # "firstAutoStopIndex":I
    .end local v10    # "hintOffset":D
    .local p0, "firstAutoStopIndex":I
    move v6, p0

    move-wide v8, v2

    move v7, v4

    goto :goto_4

    .line 376
    .end local v2    # "prevOffset":D
    .end local v5    # "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    .restart local v6    # "firstAutoStopIndex":I
    .restart local v8    # "prevOffset":D
    .local p0, "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    :cond_1
    move-object v5, p0

    .end local p0    # "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    .restart local v5    # "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    move v7, v4

    goto :goto_4

    .line 383
    .end local v5    # "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    .restart local p0    # "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    :cond_2
    move-object v5, p0

    .end local p0    # "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    .restart local v5    # "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    if-ge v6, v4, :cond_3

    .line 385
    invoke-virtual {v1}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffset()D

    move-result-wide v10

    .line 386
    .local v10, "offset":D
    move v7, v4

    .end local v4    # "i":I
    .local v7, "i":I
    invoke-static/range {v5 .. v11}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->normalizeAutoStops(Ljava/util/List;IIDD)V

    goto :goto_2

    .line 383
    .end local v7    # "i":I
    .end local v10    # "offset":D
    .restart local v4    # "i":I
    :cond_3
    move v7, v4

    .line 388
    .end local v4    # "i":I
    .restart local v7    # "i":I
    :goto_2
    add-int/lit8 v4, v7, 0x1

    .line 389
    .end local v6    # "firstAutoStopIndex":I
    .local v4, "firstAutoStopIndex":I
    invoke-virtual {v1}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getHintOffsetType()Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    move-result-object p0

    sget-object v2, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->RELATIVE_ON_GRADIENT:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    if-ne p0, v2, :cond_4

    .line 390
    invoke-virtual {v1}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getHintOffset()D

    move-result-wide v2

    goto :goto_3

    :cond_4
    invoke-virtual {v1}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffset()D

    move-result-wide v2

    :goto_3
    move-wide v8, v2

    move v6, v4

    .line 373
    .end local v1    # "currentStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    .end local v4    # "firstAutoStopIndex":I
    .restart local v6    # "firstAutoStopIndex":I
    :goto_4
    add-int/lit8 v4, v7, 0x1

    move-object p0, v5

    .end local v7    # "i":I
    .local v4, "i":I
    goto :goto_1

    .end local v5    # "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    .restart local p0    # "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    :cond_5
    move-object v5, p0

    move v7, v4

    .line 395
    .end local v4    # "i":I
    .end local p0    # "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    .restart local v5    # "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result p0

    if-ge v6, p0, :cond_6

    .line 396
    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    invoke-static {v1, v2, v8, v9}, Ljava/lang/Math;->max(DD)D

    move-result-wide v10

    .line 397
    .local v10, "lastStopOffset":D
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v7

    invoke-static/range {v5 .. v11}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->normalizeAutoStops(Ljava/util/List;IIDD)V

    .line 399
    .end local v10    # "lastStopOffset":D
    :cond_6
    return-void

    .line 367
    .end local v0    # "firstStopColor":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    .end local v5    # "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    .end local v6    # "firstAutoStopIndex":I
    .end local v8    # "prevOffset":D
    .restart local p0    # "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    :cond_7
    move-object v5, p0

    .end local p0    # "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    .restart local v5    # "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    new-instance p0, Ljava/lang/AssertionError;

    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    throw p0
.end method

.method private static normalizeAutoStops(Ljava/util/List;IIDD)V
    .locals 9
    .param p1, "fromIndex"    # I
    .param p2, "toIndex"    # I
    .param p3, "prevOffset"    # D
    .param p5, "nextOffset"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;",
            ">;IIDD)V"
        }
    .end annotation

    .line 403
    .local p0, "toNormalizeList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    if-lt p2, p1, :cond_2

    .line 405
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    sub-int/2addr v0, p1

    add-int/lit8 v0, v0, 0x1

    .line 406
    .local v0, "intervalsCount":I
    sub-double v1, p5, p3

    int-to-double v3, v0

    div-double/2addr v1, v3

    .line 407
    .local v1, "offsetShift":D
    move-wide v3, p3

    .line 408
    .local v3, "currentOffset":D
    move v5, p1

    .local v5, "i":I
    :goto_0
    if-ge v5, p2, :cond_1

    .line 409
    add-double/2addr v3, v1

    .line 410
    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 412
    .local v6, "currentAutoStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    invoke-virtual {v6}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffsetType()Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    move-result-object v7

    sget-object v8, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->AUTO:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    if-ne v7, v8, :cond_0

    .line 414
    sget-object v7, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->RELATIVE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    invoke-virtual {v6, v3, v4, v7}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->setOffset(DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;)Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 408
    .end local v6    # "currentAutoStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 412
    .restart local v6    # "currentAutoStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    :cond_0
    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 416
    .end local v5    # "i":I
    .end local v6    # "currentAutoStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    :cond_1
    return-void

    .line 403
    .end local v0    # "intervalsCount":I
    .end local v1    # "offsetShift":D
    .end local v3    # "currentOffset":D
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private static normalizeFirstStopOffset(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;",
            ">;)V"
        }
    .end annotation

    .line 420
    .local p0, "result":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 421
    .local v0, "firstStop":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffsetType()Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->AUTO:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    if-eq v1, v2, :cond_0

    .line 422
    return-void

    .line 424
    :cond_0
    const-wide/16 v1, 0x0

    .line 425
    .local v1, "firstStopOffset":D
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 426
    .local v4, "stopColor":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffsetType()Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    move-result-object v5

    sget-object v6, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->RELATIVE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    if-ne v5, v6, :cond_1

    .line 427
    invoke-virtual {v4}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffset()D

    move-result-wide v1

    .line 428
    goto :goto_1

    .line 429
    :cond_1
    invoke-virtual {v4}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getHintOffsetType()Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    move-result-object v5

    sget-object v6, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->RELATIVE_ON_GRADIENT:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    if-ne v5, v6, :cond_2

    .line 430
    invoke-virtual {v4}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getHintOffset()D

    move-result-wide v1

    .line 431
    goto :goto_1

    .line 433
    .end local v4    # "stopColor":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    :cond_2
    goto :goto_0

    .line 434
    :cond_3
    :goto_1
    const-wide/16 v3, 0x0

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->min(DD)D

    move-result-wide v1

    .line 435
    sget-object v3, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->RELATIVE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    invoke-virtual {v0, v1, v2, v3}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->setOffset(DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;)Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 436
    return-void
.end method

.method private static normalizeHintsOffsets(Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;",
            ">;)V"
        }
    .end annotation

    .line 347
    .local p0, "result":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const-wide/16 v2, 0x0

    if-ge v0, v1, :cond_2

    .line 348
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 349
    .local v1, "stopColor":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getHintOffsetType()Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    move-result-object v4

    sget-object v5, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->RELATIVE_ON_GRADIENT:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    if-ne v4, v5, :cond_1

    .line 350
    invoke-virtual {v1}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffset()D

    move-result-wide v4

    .line 351
    .local v4, "currentStopOffset":D
    add-int/lit8 v6, v0, 0x1

    invoke-interface {p0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getOffset()D

    move-result-wide v6

    .line 352
    .local v6, "nextStopOffset":D
    cmpl-double v8, v4, v6

    if-eqz v8, :cond_0

    .line 353
    invoke-virtual {v1}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->getHintOffset()D

    move-result-wide v2

    sub-double/2addr v2, v4

    sub-double v8, v6, v4

    div-double/2addr v2, v8

    .line 355
    .local v2, "hintOffset":D
    sget-object v8, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->RELATIVE_BETWEEN_COLORS:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    invoke-virtual {v1, v2, v3, v8}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->setHint(DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;)Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 356
    .end local v2    # "hintOffset":D
    goto :goto_1

    .line 358
    :cond_0
    sget-object v8, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->NONE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    invoke-virtual {v1, v2, v3, v8}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->setHint(DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;)Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 347
    .end local v1    # "stopColor":Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;
    .end local v4    # "currentStopOffset":D
    .end local v6    # "nextStopOffset":D
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 363
    .end local v0    # "i":I
    :cond_2
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    sget-object v1, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;->NONE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;

    invoke-virtual {v0, v2, v3, v1}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;->setHint(DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$HintOffsetType;)Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 364
    return-void
.end method

.method private static normalizeStops(Ljava/util/List;D)Ljava/util/List;
    .locals 6
    .param p1, "baseVectorLength"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;",
            ">;D)",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;",
            ">;"
        }
    .end annotation

    .line 329
    .local p0, "toNormalize":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    const-wide v0, 0x3ddb7cdfd9d7bdbbL    # 1.0E-10

    cmpg-double v0, p1, v0

    if-gez v0, :cond_0

    .line 330
    const/4 v0, 0x1

    new-array v1, v0, [Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    new-instance v2, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    sub-int/2addr v3, v0

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    const-wide/16 v3, 0x0

    sget-object v5, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;->RELATIVE:Lcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;

    invoke-direct {v2, v0, v3, v4, v5}, Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;-><init>(Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;DLcom/itextpdf/kernel/colors/gradients/GradientColorStop$OffsetType;)V

    const/4 v0, 0x0

    aput-object v2, v1, v0

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 334
    :cond_0
    invoke-static {p0, p1, p2}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->copyStopsAndNormalizeAbsoluteOffsets(Ljava/util/List;D)Ljava/util/List;

    move-result-object v0

    .line 336
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;>;"
    invoke-static {v0}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->normalizeFirstStopOffset(Ljava/util/List;)V

    .line 338
    invoke-static {v0}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->normalizeAutoStops(Ljava/util/List;)V

    .line 340
    invoke-static {v0}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->normalizeHintsOffsets(Ljava/util/List;)V

    .line 342
    return-object v0
.end method


# virtual methods
.method public addColorStop(Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;)Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;
    .locals 1
    .param p1, "gradientColorStop"    # Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;

    .line 81
    if-eqz p1, :cond_0

    .line 82
    iget-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->stops:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    :cond_0
    return-object p0
.end method

.method public buildColor(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/AffineTransform;Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/colors/Color;
    .locals 10
    .param p1, "targetBoundingBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "contextTransform"    # Lcom/itextpdf/kernel/geom/AffineTransform;
    .param p3, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 135
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->getGradientVector(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/AffineTransform;)[Lcom/itextpdf/kernel/geom/Point;

    move-result-object v0

    .line 136
    .local v0, "baseCoordinatesVector":[Lcom/itextpdf/kernel/geom/Point;
    const/4 v1, 0x0

    if-eqz v0, :cond_6

    iget-object v2, p0, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->stops:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_1

    .line 142
    :cond_0
    new-instance v2, Lcom/itextpdf/kernel/geom/AffineTransform;

    invoke-direct {v2}, Lcom/itextpdf/kernel/geom/AffineTransform;-><init>()V

    .line 143
    .local v2, "shadingTransform":Lcom/itextpdf/kernel/geom/AffineTransform;
    if-eqz p2, :cond_1

    .line 144
    invoke-virtual {v2, p2}, Lcom/itextpdf/kernel/geom/AffineTransform;->concatenate(Lcom/itextpdf/kernel/geom/AffineTransform;)V

    .line 147
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->getCurrentSpaceToGradientVectorSpaceTransformation(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/AffineTransform;)Lcom/itextpdf/kernel/geom/AffineTransform;

    move-result-object v3

    .line 149
    .local v3, "gradientTransformation":Lcom/itextpdf/kernel/geom/AffineTransform;
    if-eqz v3, :cond_3

    .line 151
    if-eqz p1, :cond_2

    .line 152
    const/4 v4, 0x4

    :try_start_0
    new-array v4, v4, [Lcom/itextpdf/kernel/geom/Point;

    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    .line 154
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v6

    float-to-double v6, v6

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v8

    float-to-double v8, v8

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    .line 153
    invoke-virtual {v3, v5, v1}, Lcom/itextpdf/kernel/geom/AffineTransform;->inverseTransform(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    .line 156
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getLeft()F

    move-result v6

    float-to-double v6, v6

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v8

    float-to-double v8, v8

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    .line 155
    invoke-virtual {v3, v5, v1}, Lcom/itextpdf/kernel/geom/AffineTransform;->inverseTransform(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v4, v6

    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    .line 158
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v6

    float-to-double v6, v6

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getBottom()F

    move-result v8

    float-to-double v8, v8

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    .line 157
    invoke-virtual {v3, v5, v1}, Lcom/itextpdf/kernel/geom/AffineTransform;->inverseTransform(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v5

    const/4 v6, 0x2

    aput-object v5, v4, v6

    new-instance v5, Lcom/itextpdf/kernel/geom/Point;

    .line 160
    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getRight()F

    move-result v6

    float-to-double v6, v6

    invoke-virtual {p1}, Lcom/itextpdf/kernel/geom/Rectangle;->getTop()F

    move-result v8

    float-to-double v8, v8

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    .line 159
    invoke-virtual {v3, v5, v1}, Lcom/itextpdf/kernel/geom/AffineTransform;->inverseTransform(Lcom/itextpdf/kernel/geom/Point;Lcom/itextpdf/kernel/geom/Point;)Lcom/itextpdf/kernel/geom/Point;

    move-result-object v5

    const/4 v6, 0x3

    aput-object v5, v4, v6

    .line 152
    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-static {v4}, Lcom/itextpdf/kernel/geom/Rectangle;->calculateBBox(Ljava/util/List;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    move-object p1, v4

    .line 163
    :cond_2
    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/AffineTransform;->concatenate(Lcom/itextpdf/kernel/geom/AffineTransform;)V
    :try_end_0
    .catch Lcom/itextpdf/kernel/geom/NoninvertibleTransformException; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    goto :goto_0

    .line 164
    :catch_0
    move-exception v4

    .line 165
    .local v4, "e":Lcom/itextpdf/kernel/geom/NoninvertibleTransformException;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-static {v5}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v5

    const-string v6, "Unable to invert gradient transformation, ignoring it"

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 169
    .end local v4    # "e":Lcom/itextpdf/kernel/geom/NoninvertibleTransformException;
    :cond_3
    :goto_0
    iget-object v4, p0, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->stops:Ljava/util/List;

    iget-object v5, p0, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->spreadMethod:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    invoke-static {v0, v4, v5, p1}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->createAxialShading([Lcom/itextpdf/kernel/geom/Point;Ljava/util/List;Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;

    move-result-object v4

    .line 171
    .local v4, "axial":Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;
    if-nez v4, :cond_4

    .line 172
    return-object v1

    .line 175
    :cond_4
    new-instance v1, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Shading;

    invoke-direct {v1, v4}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Shading;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfShading;)V

    .line 176
    .local v1, "shading":Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Shading;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/AffineTransform;->isIdentity()Z

    move-result v5

    if-nez v5, :cond_5

    .line 177
    const/4 v5, 0x6

    new-array v5, v5, [D

    .line 178
    .local v5, "matrix":[D
    invoke-virtual {v2, v5}, Lcom/itextpdf/kernel/geom/AffineTransform;->getMatrix([D)V

    .line 179
    new-instance v6, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v6, v5}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([D)V

    invoke-virtual {v1, v6}, Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Shading;->setMatrix(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 181
    .end local v5    # "matrix":[D
    :cond_5
    new-instance v5, Lcom/itextpdf/kernel/colors/PatternColor;

    invoke-direct {v5, v1}, Lcom/itextpdf/kernel/colors/PatternColor;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern;)V

    return-object v5

    .line 138
    .end local v1    # "shading":Lcom/itextpdf/kernel/pdf/colorspace/PdfPattern$Shading;
    .end local v2    # "shadingTransform":Lcom/itextpdf/kernel/geom/AffineTransform;
    .end local v3    # "gradientTransformation":Lcom/itextpdf/kernel/geom/AffineTransform;
    .end local v4    # "axial":Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$Axial;
    :cond_6
    :goto_1
    return-object v1
.end method

.method public getColorStops()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/colors/gradients/GradientColorStop;",
            ">;"
        }
    .end annotation

    .line 108
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->stops:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method protected getCurrentSpaceToGradientVectorSpaceTransformation(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/AffineTransform;)Lcom/itextpdf/kernel/geom/AffineTransform;
    .locals 1
    .param p1, "targetBoundingBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "contextTransform"    # Lcom/itextpdf/kernel/geom/AffineTransform;

    .line 208
    const/4 v0, 0x0

    return-object v0
.end method

.method protected abstract getGradientVector(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/AffineTransform;)[Lcom/itextpdf/kernel/geom/Point;
.end method

.method public getSpreadMethod()Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->spreadMethod:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    return-object v0
.end method

.method public setSpreadMethod(Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;)Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;
    .locals 1
    .param p1, "gradientSpreadMethod"    # Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    .line 94
    iget-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->spreadMethod:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    if-eqz v0, :cond_0

    .line 95
    iput-object p1, p0, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->spreadMethod:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    goto :goto_0

    .line 97
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;->NONE:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    iput-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;->spreadMethod:Lcom/itextpdf/kernel/colors/gradients/GradientSpreadMethod;

    .line 99
    :goto_0
    return-object p0
.end method
