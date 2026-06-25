.class public Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
.super Ljava/lang/Object;
.source "LayoutTaggingHelper.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final RETVAL_NO_PARENT:I

.field private final RETVAL_PARENT_AND_KID_FINISHED:I

.field private final autoTaggingPointerSavedPosition:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/layout/renderer/IRenderer;",
            "Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;",
            ">;"
        }
    .end annotation
.end field

.field private final context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

.field private final document:Lcom/itextpdf/kernel/pdf/PdfDocument;

.field private final dummiesForPreExistingTags:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfObject;",
            "Lcom/itextpdf/layout/tagging/TaggingDummyElement;",
            ">;"
        }
    .end annotation
.end field

.field private final immediateFlush:Z

.field private final kidsHints:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            ">;>;"
        }
    .end annotation
.end field

.field private final parentHints:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            ">;"
        }
    .end annotation
.end field

.field private final taggingRules:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/tagging/ITaggingRule;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 57
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Z)V
    .locals 1
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "immediateFlush"    # Z

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->RETVAL_NO_PARENT:I

    .line 75
    const/4 v0, -0x2

    iput v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->RETVAL_PARENT_AND_KID_FINISHED:I

    .line 78
    iput-object p1, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 79
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTagStructureContext()Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    .line 80
    iput-boolean p2, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->immediateFlush:Z

    .line 82
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->kidsHints:Ljava/util/Map;

    .line 83
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->parentHints:Ljava/util/Map;

    .line 84
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->autoTaggingPointerSavedPosition:Ljava/util/Map;

    .line 86
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->taggingRules:Ljava/util/Map;

    .line 87
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getTagStructureTargetVersion()Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->registerRules(Lcom/itextpdf/kernel/pdf/PdfVersion;)V

    .line 89
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->dummiesForPreExistingTags:Ljava/util/Map;

    .line 90
    return-void
.end method

.method private addKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Ljava/util/Collection;IZ)V
    .locals 11
    .param p1, "parentKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .param p3, "insertIndex"    # I
    .param p4, "skipFinishedChecks"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            ">;IZ)V"
        }
    .end annotation

    .line 490
    .local p2, "newKidsKeys":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 491
    return-void

    .line 493
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isArtifact()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 494
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 495
    .local v1, "kid":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->markArtifactHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)V

    .line 496
    .end local v1    # "kid":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    goto :goto_0

    .line 497
    :cond_1
    return-void

    .line 500
    :cond_2
    const-class v0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    if-nez p4, :cond_3

    invoke-virtual {p1}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isFinished()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 501
    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 502
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "Layout tagging hints addition failed: cannot add new kid hints to a parent which hint is already marked as finished. Consider using com.itextpdf.layout.tagging.LayoutTaggingHelper#replaceKidHint method for replacing not yet finished kid hint of a finished parent hint."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 503
    return-void

    .line 506
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_3
    iget-object v1, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->kidsHints:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 507
    .local v1, "kidsHint":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    if-nez v1, :cond_4

    .line 508
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    move-object v1, v2

    .line 511
    :cond_4
    invoke-static {p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->isNonAccessibleHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getAccessibleParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v2

    goto :goto_1

    :cond_5
    move-object v2, p1

    .line 512
    .local v2, "parentTagHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    :goto_1
    if-eqz v2, :cond_6

    invoke-direct {p0, v2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->isTagAlreadyExistsForHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z

    move-result v3

    if-eqz v3, :cond_6

    const/4 v3, 0x1

    goto :goto_2

    :cond_6
    const/4 v3, 0x0

    .line 513
    .local v3, "parentTagAlreadyCreated":Z
    :goto_2
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_10

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 514
    .local v5, "kidKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-virtual {v5}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isArtifact()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 515
    goto :goto_3

    .line 518
    :cond_7
    invoke-virtual {p0, v5}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v6

    .line 519
    .local v6, "prevParent":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    if-eqz v6, :cond_8

    .line 523
    goto :goto_3

    .line 525
    :cond_8
    if-nez p4, :cond_9

    invoke-virtual {v5}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isFinished()Z

    move-result v7

    if-eqz v7, :cond_9

    .line 526
    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v7

    .line 527
    .local v7, "logger":Lorg/slf4j/Logger;
    const-string v8, "Layout tagging hints addition failed: cannot add a hint that is already marked as finished. Consider using com.itextpdf.layout.tagging.LayoutTaggingHelper#moveKidHint method for moving already finished kid hint from not yet finished parent hint."

    invoke-interface {v7, v8}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 528
    goto :goto_3

    .line 530
    .end local v7    # "logger":Lorg/slf4j/Logger;
    :cond_9
    const/4 v7, -0x1

    if-le p3, v7, :cond_a

    .line 531
    add-int/lit8 v7, p3, 0x1

    .end local p3    # "insertIndex":I
    .local v7, "insertIndex":I
    invoke-interface {v1, p3, v5}, Ljava/util/List;->add(ILjava/lang/Object;)V

    move p3, v7

    goto :goto_4

    .line 533
    .end local v7    # "insertIndex":I
    .restart local p3    # "insertIndex":I
    :cond_a
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 535
    :goto_4
    iget-object v7, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->kidsHints:Ljava/util/Map;

    invoke-interface {v7, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 536
    iget-object v7, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->parentHints:Ljava/util/Map;

    invoke-interface {v7, v5, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 538
    if-eqz v3, :cond_f

    .line 539
    invoke-virtual {v5}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v7

    instance-of v7, v7, Lcom/itextpdf/layout/tagging/TaggingDummyElement;

    if-eqz v7, :cond_b

    .line 540
    new-instance v7, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    iget-object v8, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v7, v8}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    invoke-virtual {p0, v5, v7}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->createTag(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Z

    .line 542
    :cond_b
    invoke-static {v5}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->isNonAccessibleHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z

    move-result v7

    if-eqz v7, :cond_e

    .line 543
    invoke-virtual {p0, v5}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getAccessibleKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_5
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_d

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 544
    .local v8, "nestedKid":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-virtual {v8}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v9

    instance-of v9, v9, Lcom/itextpdf/layout/tagging/TaggingDummyElement;

    if-eqz v9, :cond_c

    .line 545
    new-instance v9, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    iget-object v10, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v9, v10}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    invoke-virtual {p0, v8, v9}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->createTag(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Z

    .line 547
    :cond_c
    invoke-direct {p0, v2, v8}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->moveKidTagIfCreated(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;)V

    .line 548
    .end local v8    # "nestedKid":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    goto :goto_5

    :cond_d
    goto :goto_6

    .line 550
    :cond_e
    invoke-direct {p0, v2, v5}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->moveKidTagIfCreated(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;)V

    .line 553
    .end local v5    # "kidKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .end local v6    # "prevParent":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    :cond_f
    :goto_6
    goto/16 :goto_3

    .line 554
    :cond_10
    return-void
.end method

.method public static addTreeHints(Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 3
    .param p0, "taggingHelper"    # Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .param p1, "rootRenderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 93
    invoke-interface {p1}, Lcom/itextpdf/layout/renderer/IRenderer;->getChildRenderers()Ljava/util/List;

    move-result-object v0

    .line 94
    .local v0, "childRenderers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/IRenderer;>;"
    if-nez v0, :cond_0

    .line 95
    return-void

    .line 97
    :cond_0
    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addKidsHint(Lcom/itextpdf/layout/IPropertyContainer;Ljava/lang/Iterable;)V

    .line 98
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    .line 99
    .local v2, "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    invoke-static {p0, v2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addTreeHints(Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 100
    .end local v2    # "childRenderer":Lcom/itextpdf/layout/renderer/IRenderer;
    goto :goto_0

    .line 101
    :cond_1
    return-void
.end method

.method private createSingleTag(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Z
    .locals 7
    .param p1, "hintKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .param p2, "tagPointer"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 557
    invoke-virtual {p1}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isFinished()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 558
    const-class v0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 559
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v2, "Attempt to create a tag for a hint which is already marked as finished, tag will not be created."

    invoke-interface {v0, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 560
    return v1

    .line 563
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_0
    invoke-static {p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->isNonAccessibleHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 566
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getAccessibleParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v0

    .line 567
    .local v0, "parentTagHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    iget-object v2, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getWaitingTagsManager()Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    move-result-object v2

    invoke-virtual {v2, p2, v0}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->tryMovePointerToWaitingTag(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;Ljava/lang/Object;)Z

    .line 568
    return v1

    .line 571
    .end local v0    # "parentTagHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getWaitingTagsManager()Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    move-result-object v0

    .line 572
    .local v0, "waitingTagsManager":Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;
    invoke-virtual {v0, p2, p1}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->tryMovePointerToWaitingTag(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 574
    invoke-virtual {p1}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v1

    .line 576
    .local v1, "modelElement":Lcom/itextpdf/layout/tagging/IAccessibleElement;
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getAccessibleParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v2

    .line 577
    .local v2, "parentHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    const/4 v3, -0x1

    .line 578
    .local v3, "ind":I
    if-eqz v2, :cond_2

    .line 580
    invoke-virtual {v0, p2, v2}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->tryMovePointerToWaitingTag(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 581
    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getAccessibleKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Ljava/util/List;

    move-result-object v4

    .line 582
    .local v4, "siblingsHint":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    invoke-interface {v4, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v5

    .line 583
    .local v5, "i":I
    invoke-direct {p0, v0, p2, v4, v5}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getNearestNextSiblingTagIndex(Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;Ljava/util/List;I)I

    move-result v3

    .line 587
    .end local v4    # "siblingsHint":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    .end local v5    # "i":I
    :cond_2
    invoke-interface {v1}, Lcom/itextpdf/layout/tagging/IAccessibleElement;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v4

    invoke-virtual {p2, v3, v4}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->addTag(ILcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 588
    new-instance v4, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    invoke-direct {v4, p2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)V

    invoke-virtual {p1, v4}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->setTagPointer(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)V

    .line 589
    invoke-virtual {p1}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getOverriddenRole()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 590
    invoke-virtual {p1}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getOverriddenRole()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setRole(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 592
    :cond_3
    invoke-virtual {v0, p2, p1}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->assignWaitingState(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;Ljava/lang/Object;)Ljava/lang/Object;

    .line 594
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getAccessibleKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Ljava/util/List;

    move-result-object v4

    .line 595
    .local v4, "kidsHint":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 596
    .local v6, "kidKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-direct {p0, p1, v6}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->moveKidTagIfCreated(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;)V

    .line 597
    .end local v6    # "kidKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    goto :goto_0

    .line 599
    :cond_4
    const/4 v5, 0x1

    return v5

    .line 602
    .end local v1    # "modelElement":Lcom/itextpdf/layout/tagging/IAccessibleElement;
    .end local v2    # "parentHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .end local v3    # "ind":I
    .end local v4    # "kidsHint":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    :cond_5
    return v1
.end method

.method private finishDummyKids(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            ">;)V"
        }
    .end annotation

    .line 641
    .local p1, "taggingHintKeys":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 642
    .local v1, "hintKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-virtual {v1}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v2

    instance-of v2, v2, Lcom/itextpdf/layout/tagging/TaggingDummyElement;

    .line 643
    .local v2, "isDummy":Z
    if-eqz v2, :cond_0

    .line 644
    invoke-virtual {v1}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/IPropertyContainer;

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->finishTaggingHint(Lcom/itextpdf/layout/IPropertyContainer;)V

    .line 646
    :cond_0
    invoke-static {v1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->isNonAccessibleHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z

    move-result v3

    if-nez v3, :cond_1

    if-eqz v2, :cond_2

    .line 647
    :cond_1
    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Ljava/util/List;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->finishDummyKids(Ljava/util/List;)V

    .line 649
    .end local v1    # "hintKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .end local v2    # "isDummy":Z
    :cond_2
    goto :goto_0

    .line 650
    :cond_3
    return-void
.end method

.method public static getHintKey(Lcom/itextpdf/layout/IPropertyContainer;)Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .locals 1
    .param p0, "container"    # Lcom/itextpdf/layout/IPropertyContainer;

    .line 104
    const/16 v0, 0x6d

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/IPropertyContainer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    return-object v0
.end method

.method private getNearestNextSiblingTagIndex(Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;Ljava/util/List;I)I
    .locals 3
    .param p1, "waitingTagsManager"    # Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;
    .param p2, "parentPointer"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .param p4, "start"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;",
            "Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            ">;I)I"
        }
    .end annotation

    .line 674
    .local p3, "siblingsHint":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    const/4 v0, -0x1

    .line 675
    .local v0, "ind":I
    new-instance v1, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    iget-object v2, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 676
    .local v1, "nextSiblingPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    :cond_0
    add-int/lit8 p4, p4, 0x1

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v2

    if-ge p4, v2, :cond_1

    .line 677
    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->tryMovePointerToWaitingTag(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    invoke-direct {v2, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)V

    .line 678
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->moveToParent()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->isPointingToSameTag(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 679
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getIndexInParentKidsList()I

    move-result v0

    .line 680
    nop

    .line 683
    :cond_1
    return v0
.end method

.method public static getOrCreateHintKey(Lcom/itextpdf/layout/IPropertyContainer;)Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .locals 1
    .param p0, "container"    # Lcom/itextpdf/layout/IPropertyContainer;

    .line 108
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getOrCreateHintKey(Lcom/itextpdf/layout/IPropertyContainer;Z)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v0

    return-object v0
.end method

.method private static getOrCreateHintKey(Lcom/itextpdf/layout/IPropertyContainer;Z)Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .locals 5
    .param p0, "hintOwner"    # Lcom/itextpdf/layout/IPropertyContainer;
    .param p1, "setProperty"    # Z

    .line 464
    const/16 v0, 0x6d

    invoke-interface {p0, v0}, Lcom/itextpdf/layout/IPropertyContainer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 465
    .local v1, "hintKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    if-nez v1, :cond_4

    .line 466
    const/4 v2, 0x0

    .line 467
    .local v2, "elem":Lcom/itextpdf/layout/tagging/IAccessibleElement;
    instance-of v3, p0, Lcom/itextpdf/layout/tagging/IAccessibleElement;

    if-eqz v3, :cond_0

    .line 468
    move-object v2, p0

    check-cast v2, Lcom/itextpdf/layout/tagging/IAccessibleElement;

    goto :goto_0

    .line 469
    :cond_0
    instance-of v3, p0, Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v3, :cond_1

    move-object v3, p0

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v3

    instance-of v3, v3, Lcom/itextpdf/layout/tagging/IAccessibleElement;

    if-eqz v3, :cond_1

    .line 470
    move-object v3, p0

    check-cast v3, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v3

    move-object v2, v3

    check-cast v2, Lcom/itextpdf/layout/tagging/IAccessibleElement;

    .line 472
    :cond_1
    :goto_0
    new-instance v3, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    instance-of v4, p0, Lcom/itextpdf/layout/element/IElement;

    invoke-direct {v3, v2, v4}, Lcom/itextpdf/layout/tagging/TaggingHintKey;-><init>(Lcom/itextpdf/layout/tagging/IAccessibleElement;Z)V

    move-object v1, v3

    .line 473
    if-eqz v2, :cond_2

    invoke-interface {v2}, Lcom/itextpdf/layout/tagging/IAccessibleElement;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getRole()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Artifact"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 474
    invoke-virtual {v1}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->setArtifact()V

    .line 475
    invoke-virtual {v1}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->setFinished()V

    .line 478
    :cond_2
    if-eqz p1, :cond_4

    .line 479
    instance-of v3, v2, Lcom/itextpdf/layout/element/ILargeElement;

    if-eqz v3, :cond_3

    move-object v3, v2

    check-cast v3, Lcom/itextpdf/layout/element/ILargeElement;

    invoke-interface {v3}, Lcom/itextpdf/layout/element/ILargeElement;->isComplete()Z

    move-result v3

    if-nez v3, :cond_3

    .line 480
    move-object v3, v2

    check-cast v3, Lcom/itextpdf/layout/element/ILargeElement;

    invoke-interface {v3, v0, v1}, Lcom/itextpdf/layout/element/ILargeElement;->setProperty(ILjava/lang/Object;)V

    goto :goto_1

    .line 482
    :cond_3
    invoke-interface {p0, v0, v1}, Lcom/itextpdf/layout/IPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 486
    .end local v2    # "elem":Lcom/itextpdf/layout/tagging/IAccessibleElement;
    :cond_4
    :goto_1
    return-object v1
.end method

.method private static isNonAccessibleHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z
    .locals 1
    .param p0, "hintKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 687
    invoke-virtual {p0}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v0

    invoke-interface {v0}, Lcom/itextpdf/layout/tagging/IAccessibleElement;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getRole()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

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

.method private isSomeKidNotFinished(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z
    .locals 4
    .param p1, "hint"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 752
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 753
    .local v1, "kidHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-virtual {v1}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isFinished()Z

    move-result v2

    const/4 v3, 0x1

    if-nez v2, :cond_0

    .line 754
    return v3

    .line 756
    :cond_0
    invoke-static {v1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->isNonAccessibleHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-direct {p0, v1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->isSomeKidNotFinished(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 757
    return v3

    .line 759
    .end local v1    # "kidHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    :cond_1
    goto :goto_0

    .line 760
    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method private isSomeParentNotFinished(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z
    .locals 3
    .param p1, "parentHint"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 736
    move-object v0, p1

    .line 738
    .local v0, "hintKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    :goto_0
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 739
    return v1

    .line 741
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isFinished()Z

    move-result v2

    if-nez v2, :cond_1

    .line 742
    const/4 v1, 0x1

    return v1

    .line 744
    :cond_1
    invoke-static {v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->isNonAccessibleHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 745
    return v1

    .line 747
    :cond_2
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v0

    goto :goto_0
.end method

.method private isTagAlreadyExistsForHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z
    .locals 1
    .param p1, "tagHint"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 691
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getWaitingTagsManager()Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->isObjectAssociatedWithWaitingTag(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private moveKidTagIfCreated(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;)V
    .locals 5
    .param p1, "parentKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .param p2, "kidKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 655
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    iget-object v1, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 656
    .local v0, "kidPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    iget-object v1, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getWaitingTagsManager()Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    move-result-object v1

    .line 657
    .local v1, "waitingTagsManager":Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;
    invoke-virtual {v1, v0, p2}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->tryMovePointerToWaitingTag(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 658
    return-void

    .line 661
    :cond_0
    new-instance v2, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    iget-object v3, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 662
    .local v2, "parentPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    invoke-virtual {v1, v2, p1}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->tryMovePointerToWaitingTag(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 663
    return-void

    .line 666
    :cond_1
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getAccessibleKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v3

    .line 667
    .local v3, "kidIndInParentKidsHint":I
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getAccessibleKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Ljava/util/List;

    move-result-object v4

    invoke-direct {p0, v1, v2, v4, v3}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getNearestNextSiblingTagIndex(Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;Ljava/util/List;I)I

    move-result v4

    .line 669
    .local v4, "ind":I
    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->setNextNewKidIndex(I)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 670
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->relocate(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 671
    return-void
.end method

.method private registerRules(Lcom/itextpdf/kernel/pdf/PdfVersion;)V
    .locals 6
    .param p1, "pdfVersion"    # Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 764
    new-instance v0, Lcom/itextpdf/layout/tagging/TableTaggingRule;

    invoke-direct {v0}, Lcom/itextpdf/layout/tagging/TableTaggingRule;-><init>()V

    .line 765
    .local v0, "tableRule":Lcom/itextpdf/layout/tagging/ITaggingRule;
    const-string v1, "Table"

    invoke-direct {p0, v1, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->registerSingleRule(Ljava/lang/String;Lcom/itextpdf/layout/tagging/ITaggingRule;)V

    .line 766
    const-string v2, "TFoot"

    invoke-direct {p0, v2, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->registerSingleRule(Ljava/lang/String;Lcom/itextpdf/layout/tagging/ITaggingRule;)V

    .line 767
    const-string v3, "THead"

    invoke-direct {p0, v3, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->registerSingleRule(Ljava/lang/String;Lcom/itextpdf/layout/tagging/ITaggingRule;)V

    .line 768
    new-instance v4, Lcom/itextpdf/layout/tagging/THTaggingRule;

    invoke-direct {v4}, Lcom/itextpdf/layout/tagging/THTaggingRule;-><init>()V

    const-string v5, "TH"

    invoke-direct {p0, v5, v4}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->registerSingleRule(Ljava/lang/String;Lcom/itextpdf/layout/tagging/ITaggingRule;)V

    .line 769
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_1_5:Lcom/itextpdf/kernel/pdf/PdfVersion;

    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result v4

    if-gez v4, :cond_0

    .line 770
    new-instance v4, Lcom/itextpdf/layout/tagging/TableTaggingPriorToOneFiveVersionRule;

    invoke-direct {v4}, Lcom/itextpdf/layout/tagging/TableTaggingPriorToOneFiveVersionRule;-><init>()V

    .line 771
    .local v4, "priorToOneFiveRule":Lcom/itextpdf/layout/tagging/TableTaggingPriorToOneFiveVersionRule;
    invoke-direct {p0, v1, v4}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->registerSingleRule(Ljava/lang/String;Lcom/itextpdf/layout/tagging/ITaggingRule;)V

    .line 772
    invoke-direct {p0, v3, v4}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->registerSingleRule(Ljava/lang/String;Lcom/itextpdf/layout/tagging/ITaggingRule;)V

    .line 773
    invoke-direct {p0, v2, v4}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->registerSingleRule(Ljava/lang/String;Lcom/itextpdf/layout/tagging/ITaggingRule;)V

    .line 775
    .end local v4    # "priorToOneFiveRule":Lcom/itextpdf/layout/tagging/TableTaggingPriorToOneFiveVersionRule;
    :cond_0
    return-void
.end method

.method private registerSingleRule(Ljava/lang/String;Lcom/itextpdf/layout/tagging/ITaggingRule;)V
    .locals 2
    .param p1, "role"    # Ljava/lang/String;
    .param p2, "rule"    # Lcom/itextpdf/layout/tagging/ITaggingRule;

    .line 778
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->taggingRules:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 779
    .local v0, "rules":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/ITaggingRule;>;"
    if-nez v0, :cond_0

    .line 780
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move-object v0, v1

    .line 781
    iget-object v1, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->taggingRules:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 783
    :cond_0
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 784
    return-void
.end method

.method private releaseHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Ljava/util/Set;Z)V
    .locals 5
    .param p1, "hint"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .param p3, "checkContextIsFinished"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            "Ljava/util/Set<",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            ">;Z)V"
        }
    .end annotation

    .line 695
    .local p2, "hintsToBeHeld":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->parentHints:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 696
    .local v0, "parentHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    iget-object v1, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->kidsHints:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 697
    .local v1, "kidsHint":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    if-eqz p3, :cond_0

    if-eqz v0, :cond_0

    .line 698
    invoke-direct {p0, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->isSomeParentNotFinished(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 699
    return-void

    .line 702
    :cond_0
    if-eqz p3, :cond_1

    if-eqz v1, :cond_1

    .line 703
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->isSomeKidNotFinished(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 704
    return-void

    .line 708
    :cond_1
    if-eqz p3, :cond_2

    if-eqz p2, :cond_2

    .line 709
    invoke-interface {p2, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 710
    return-void

    .line 714
    :cond_2
    if-eqz v0, :cond_3

    .line 715
    invoke-direct {p0, p1, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->removeParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;)I

    .line 717
    :cond_3
    if-eqz v1, :cond_5

    .line 718
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 719
    .local v3, "kidHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    iget-object v4, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->parentHints:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 720
    .end local v3    # "kidHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    goto :goto_0

    .line 721
    :cond_4
    iget-object v2, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->kidsHints:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 724
    :cond_5
    new-instance v2, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    iget-object v3, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 725
    .local v2, "tagPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    iget-object v3, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getWaitingTagsManager()Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    move-result-object v3

    invoke-virtual {v3, v2, p1}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->tryMovePointerToWaitingTag(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;Ljava/lang/Object;)Z

    move-result v3

    .line 731
    iget-object v4, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    .line 725
    if-eqz v3, :cond_6

    .line 726
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getWaitingTagsManager()Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->removeWaitingState(Ljava/lang/Object;)Z

    .line 727
    iget-boolean v3, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->immediateFlush:Z

    if-eqz v3, :cond_7

    .line 728
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->flushParentsIfAllKidsFlushed()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    goto :goto_1

    .line 731
    :cond_6
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getWaitingTagsManager()Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->removeWaitingState(Ljava/lang/Object;)Z

    .line 733
    :cond_7
    :goto_1
    return-void
.end method

.method private removeParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)I
    .locals 3
    .param p1, "hintKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 606
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->parentHints:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 608
    .local v0, "parentHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    if-nez v0, :cond_0

    .line 609
    const/4 v1, -0x1

    return v1

    .line 612
    :cond_0
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getAccessibleParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v1

    .line 613
    .local v1, "accessibleParentHint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-virtual {p1}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isFinished()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v0}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isFinished()Z

    move-result v2

    if-eqz v2, :cond_2

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isFinished()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 614
    :cond_1
    const/4 v2, -0x2

    return v2

    .line 617
    :cond_2
    invoke-direct {p0, p1, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->removeParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;)I

    move-result v2

    return v2
.end method

.method private removeParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;)I
    .locals 4
    .param p1, "hintKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .param p2, "parentHint"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 621
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->parentHints:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 623
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->kidsHints:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 625
    .local v0, "kidsHint":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    .line 626
    .local v1, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 627
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, p1, :cond_0

    .line 628
    invoke-interface {v0, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 629
    goto :goto_1

    .line 626
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 632
    :cond_1
    :goto_1
    if-ge v2, v1, :cond_3

    .line 634
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 635
    iget-object v3, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->kidsHints:Ljava/util/Map;

    invoke-interface {v3, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 637
    :cond_2
    return v2

    .line 632
    :cond_3
    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3
.end method


# virtual methods
.method public addKidsHint(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;Ljava/lang/Iterable;)V
    .locals 4
    .param p1, "parentPointer"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/itextpdf/layout/IPropertyContainer;",
            ">;)V"
        }
    .end annotation

    .line 112
    .local p2, "newKids":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lcom/itextpdf/layout/IPropertyContainer;>;"
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getPointerStructElem(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 113
    .local v0, "pointerStructElem":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    iget-object v1, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->dummiesForPreExistingTags:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/tagging/TaggingDummyElement;

    .line 114
    .local v1, "dummy":Lcom/itextpdf/layout/tagging/TaggingDummyElement;
    if-nez v1, :cond_0

    .line 115
    new-instance v2, Lcom/itextpdf/layout/tagging/TaggingDummyElement;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getRole()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/itextpdf/layout/tagging/TaggingDummyElement;-><init>(Ljava/lang/String;)V

    move-object v1, v2

    .line 116
    iget-object v2, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->dummiesForPreExistingTags:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    :cond_0
    iget-object v2, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getWaitingTagsManager()Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    move-result-object v2

    invoke-static {v1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getOrCreateHintKey(Lcom/itextpdf/layout/IPropertyContainer;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v3

    invoke-virtual {v2, p1, v3}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->assignWaitingState(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    invoke-virtual {p0, v1, p2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addKidsHint(Lcom/itextpdf/layout/IPropertyContainer;Ljava/lang/Iterable;)V

    .line 120
    return-void
.end method

.method public addKidsHint(Lcom/itextpdf/layout/IPropertyContainer;Ljava/lang/Iterable;)V
    .locals 1
    .param p1, "parent"    # Lcom/itextpdf/layout/IPropertyContainer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/IPropertyContainer;",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/itextpdf/layout/IPropertyContainer;",
            ">;)V"
        }
    .end annotation

    .line 123
    .local p2, "newKids":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lcom/itextpdf/layout/IPropertyContainer;>;"
    const/4 v0, -0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addKidsHint(Lcom/itextpdf/layout/IPropertyContainer;Ljava/lang/Iterable;I)V

    .line 124
    return-void
.end method

.method public addKidsHint(Lcom/itextpdf/layout/IPropertyContainer;Ljava/lang/Iterable;I)V
    .locals 5
    .param p1, "parent"    # Lcom/itextpdf/layout/IPropertyContainer;
    .param p3, "insertIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/IPropertyContainer;",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/itextpdf/layout/IPropertyContainer;",
            ">;I)V"
        }
    .end annotation

    .line 127
    .local p2, "newKids":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lcom/itextpdf/layout/IPropertyContainer;>;"
    instance-of v0, p1, Lcom/itextpdf/layout/renderer/AreaBreakRenderer;

    if-eqz v0, :cond_0

    .line 128
    return-void

    .line 131
    :cond_0
    invoke-static {p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getOrCreateHintKey(Lcom/itextpdf/layout/IPropertyContainer;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v0

    .line 133
    .local v0, "parentKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 134
    .local v1, "newKidsKeys":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/IPropertyContainer;

    .line 135
    .local v3, "kid":Lcom/itextpdf/layout/IPropertyContainer;
    instance-of v4, v3, Lcom/itextpdf/layout/renderer/AreaBreakRenderer;

    if-eqz v4, :cond_1

    .line 136
    return-void

    .line 138
    :cond_1
    invoke-static {v3}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getOrCreateHintKey(Lcom/itextpdf/layout/IPropertyContainer;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    .end local v3    # "kid":Lcom/itextpdf/layout/IPropertyContainer;
    goto :goto_0

    .line 140
    :cond_2
    invoke-virtual {p0, v0, v1, p3}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Ljava/util/Collection;I)V

    .line 141
    return-void
.end method

.method public addKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Ljava/util/Collection;)V
    .locals 1
    .param p1, "parentKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            ">;)V"
        }
    .end annotation

    .line 144
    .local p2, "newKidsKeys":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    const/4 v0, -0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Ljava/util/Collection;I)V

    .line 145
    return-void
.end method

.method public addKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Ljava/util/Collection;I)V
    .locals 1
    .param p1, "parentKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .param p3, "insertIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            ">;I)V"
        }
    .end annotation

    .line 148
    .local p2, "newKidsKeys":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Ljava/util/Collection;IZ)V

    .line 149
    return-void
.end method

.method public createTag(Lcom/itextpdf/layout/renderer/IRenderer;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Z
    .locals 4
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;
    .param p2, "tagPointer"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 336
    invoke-static {p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getHintKey(Lcom/itextpdf/layout/IPropertyContainer;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v0

    .line 338
    .local v0, "hintKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    move v2, v1

    .line 339
    .local v2, "noHint":Z
    :goto_0
    if-eqz v2, :cond_1

    .line 340
    invoke-static {p1, v1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getOrCreateHintKey(Lcom/itextpdf/layout/IPropertyContainer;Z)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v0

    .line 342
    :cond_1
    invoke-virtual {p0, v0, p2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->createTag(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Z

    move-result v1

    .line 343
    .local v1, "created":Z
    if-eqz v2, :cond_2

    .line 344
    invoke-virtual {v0}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->setFinished()V

    .line 345
    iget-object v3, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getWaitingTagsManager()Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->removeWaitingState(Ljava/lang/Object;)Z

    .line 347
    :cond_2
    return v1
.end method

.method public createTag(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Z
    .locals 6
    .param p1, "hintKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .param p2, "tagPointer"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 351
    invoke-virtual {p1}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isArtifact()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 352
    const/4 v0, 0x0

    return v0

    .line 355
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->createSingleTag(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Z

    move-result v0

    .line 357
    .local v0, "created":Z
    if-eqz v0, :cond_2

    .line 358
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getAccessibleKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Ljava/util/List;

    move-result-object v1

    .line 359
    .local v1, "kidsHint":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 360
    .local v3, "hint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-virtual {v3}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v4

    instance-of v4, v4, Lcom/itextpdf/layout/tagging/TaggingDummyElement;

    if-eqz v4, :cond_1

    .line 361
    new-instance v4, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    iget-object v5, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    invoke-virtual {p0, v3, v4}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->createTag(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Z

    .line 363
    .end local v3    # "hint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    :cond_1
    goto :goto_0

    .line 365
    .end local v1    # "kidsHint":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    :cond_2
    return v0
.end method

.method public finishTaggingHint(Lcom/itextpdf/layout/IPropertyContainer;)V
    .locals 8
    .param p1, "hintOwner"    # Lcom/itextpdf/layout/IPropertyContainer;

    .line 369
    invoke-static {p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getHintKey(Lcom/itextpdf/layout/IPropertyContainer;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v0

    .line 372
    .local v0, "rendererKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    if-eqz v0, :cond_6

    invoke-virtual {v0}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isFinished()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_2

    .line 376
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isElementBasedFinishingOnly()Z

    move-result v1

    if-eqz v1, :cond_1

    instance-of v1, p1, Lcom/itextpdf/layout/element/IElement;

    if-nez v1, :cond_1

    .line 378
    return-void

    .line 381
    :cond_1
    invoke-static {v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->isNonAccessibleHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 382
    invoke-virtual {v0}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v1

    .line 383
    .local v1, "modelElement":Lcom/itextpdf/layout/tagging/IAccessibleElement;
    invoke-interface {v1}, Lcom/itextpdf/layout/tagging/IAccessibleElement;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getRole()Ljava/lang/String;

    move-result-object v2

    .line 384
    .local v2, "role":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getOverriddenRole()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 385
    invoke-virtual {v0}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getOverriddenRole()Ljava/lang/String;

    move-result-object v2

    .line 387
    :cond_2
    iget-object v3, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->taggingRules:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 388
    .local v3, "rules":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/ITaggingRule;>;"
    const/4 v4, 0x1

    .line 389
    .local v4, "ruleResult":Z
    if-eqz v3, :cond_4

    .line 390
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/tagging/ITaggingRule;

    .line 391
    .local v6, "rule":Lcom/itextpdf/layout/tagging/ITaggingRule;
    if-eqz v4, :cond_3

    invoke-interface {v6, p0, v0}, Lcom/itextpdf/layout/tagging/ITaggingRule;->onTagFinish(Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z

    move-result v7

    if-eqz v7, :cond_3

    const/4 v7, 0x1

    goto :goto_1

    :cond_3
    const/4 v7, 0x0

    :goto_1
    move v4, v7

    .line 392
    .end local v6    # "rule":Lcom/itextpdf/layout/tagging/ITaggingRule;
    goto :goto_0

    .line 394
    :cond_4
    if-nez v4, :cond_5

    .line 395
    return-void

    .line 399
    .end local v1    # "modelElement":Lcom/itextpdf/layout/tagging/IAccessibleElement;
    .end local v2    # "role":Ljava/lang/String;
    .end local v3    # "rules":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/ITaggingRule;>;"
    .end local v4    # "ruleResult":Z
    :cond_5
    invoke-virtual {v0}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->setFinished()V

    .line 400
    return-void

    .line 373
    :cond_6
    :goto_2
    return-void
.end method

.method public getAccessibleKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Ljava/util/List;
    .locals 5
    .param p1, "parent"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            ">;"
        }
    .end annotation

    .line 229
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->kidsHints:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 230
    .local v0, "kidsHint":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    if-nez v0, :cond_0

    .line 231
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    return-object v1

    .line 234
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 236
    .local v1, "accessibleKids":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 237
    .local v3, "kid":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-static {v3}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->isNonAccessibleHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 238
    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getAccessibleKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    .line 240
    :cond_1
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    .end local v3    # "kid":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    :goto_1
    goto :goto_0

    .line 244
    :cond_2
    return-object v1
.end method

.method public getAccessibleParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .locals 1
    .param p1, "hintKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 261
    nop

    :cond_0
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object p1

    .line 262
    if-eqz p1, :cond_1

    invoke-static {p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->isNonAccessibleHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 263
    :cond_1
    return-object p1
.end method

.method public getKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Ljava/util/List;
    .locals 2
    .param p1, "parent"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            ">;"
        }
    .end annotation

    .line 221
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->kidsHints:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 222
    .local v0, "kidsHint":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    if-nez v0, :cond_0

    .line 223
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    return-object v1

    .line 225
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public getParentHint(Lcom/itextpdf/layout/IPropertyContainer;)Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .locals 2
    .param p1, "hintOwner"    # Lcom/itextpdf/layout/IPropertyContainer;

    .line 248
    invoke-static {p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getHintKey(Lcom/itextpdf/layout/IPropertyContainer;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v0

    .line 249
    .local v0, "hintKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    if-nez v0, :cond_0

    .line 250
    const/4 v1, 0x0

    return-object v1

    .line 252
    :cond_0
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v1

    return-object v1
.end method

.method public getParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .locals 1
    .param p1, "hintKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 256
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->parentHints:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    return-object v0
.end method

.method public getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 1

    .line 460
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    return-object v0
.end method

.method public isArtifact(Lcom/itextpdf/layout/IPropertyContainer;)Z
    .locals 4
    .param p1, "hintOwner"    # Lcom/itextpdf/layout/IPropertyContainer;

    .line 163
    invoke-static {p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getHintKey(Lcom/itextpdf/layout/IPropertyContainer;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v0

    .line 164
    .local v0, "key":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    if-eqz v0, :cond_0

    .line 165
    invoke-virtual {v0}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isArtifact()Z

    move-result v1

    return v1

    .line 167
    :cond_0
    const/4 v1, 0x0

    .line 168
    .local v1, "aElem":Lcom/itextpdf/layout/tagging/IAccessibleElement;
    instance-of v2, p1, Lcom/itextpdf/layout/renderer/IRenderer;

    if-eqz v2, :cond_1

    move-object v2, p1

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v2

    instance-of v2, v2, Lcom/itextpdf/layout/tagging/IAccessibleElement;

    if-eqz v2, :cond_1

    .line 169
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/layout/renderer/IRenderer;

    invoke-interface {v2}, Lcom/itextpdf/layout/renderer/IRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v2

    move-object v1, v2

    check-cast v1, Lcom/itextpdf/layout/tagging/IAccessibleElement;

    goto :goto_0

    .line 170
    :cond_1
    instance-of v2, p1, Lcom/itextpdf/layout/tagging/IAccessibleElement;

    if-eqz v2, :cond_2

    .line 171
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/layout/tagging/IAccessibleElement;

    .line 173
    :cond_2
    :goto_0
    if-eqz v1, :cond_3

    .line 174
    invoke-interface {v1}, Lcom/itextpdf/layout/tagging/IAccessibleElement;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getRole()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Artifact"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    return v2

    .line 177
    .end local v1    # "aElem":Lcom/itextpdf/layout/tagging/IAccessibleElement;
    :cond_3
    const/4 v1, 0x0

    return v1
.end method

.method public markArtifactHint(Lcom/itextpdf/layout/IPropertyContainer;)V
    .locals 1
    .param p1, "hintOwner"    # Lcom/itextpdf/layout/IPropertyContainer;

    .line 181
    invoke-static {p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getOrCreateHintKey(Lcom/itextpdf/layout/IPropertyContainer;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v0

    .line 182
    .local v0, "hintKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->markArtifactHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)V

    .line 183
    return-void
.end method

.method public markArtifactHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)V
    .locals 4
    .param p1, "hintKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 186
    invoke-virtual {p1}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->setArtifact()V

    .line 187
    invoke-virtual {p1}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->setFinished()V

    .line 188
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    iget-object v1, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 189
    .local v0, "existingArtifactTag":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    iget-object v1, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getWaitingTagsManager()Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->tryMovePointerToWaitingTag(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 190
    const-class v1, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 191
    .local v1, "logger":Lorg/slf4j/Logger;
    const-string v2, "A layout tagging hint for which an actual tag was already created in tags structure is marked as artifact. Existing tag will be left in the tags tree."

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 193
    iget-object v2, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getWaitingTagsManager()Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->removeWaitingState(Ljava/lang/Object;)Z

    .line 194
    iget-boolean v2, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->immediateFlush:Z

    if-eqz v2, :cond_0

    .line 195
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->flushParentsIfAllKidsFlushed()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 198
    .end local v1    # "logger":Lorg/slf4j/Logger;
    :cond_0
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Ljava/util/List;

    move-result-object v1

    .line 199
    .local v1, "kidsHint":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 200
    .local v3, "kidKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->markArtifactHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)V

    .line 201
    .end local v3    # "kidKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    goto :goto_0

    .line 202
    :cond_1
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->removeParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)I

    .line 203
    return-void
.end method

.method public moveKidHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;)I
    .locals 1
    .param p1, "hintKeyOfKidToMove"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .param p2, "newParent"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 437
    const/4 v0, -0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->moveKidHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;I)I

    move-result v0

    return v0
.end method

.method public moveKidHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;I)I
    .locals 4
    .param p1, "hintKeyOfKidToMove"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .param p2, "newParent"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .param p3, "insertIndex"    # I

    .line 441
    invoke-virtual {p2}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isFinished()Z

    move-result v0

    const-class v1, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    const/4 v2, -0x1

    if-eqz v0, :cond_0

    .line 442
    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 443
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "Layout tagging hints modification failed: cannot move kid hint to a parent that is already marked as finished."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 444
    return v2

    .line 447
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_0
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->removeParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)I

    move-result v0

    .line 448
    .local v0, "removeRes":I
    const/4 v3, -0x2

    if-eq v0, v3, :cond_2

    if-ne v0, v2, :cond_1

    .line 449
    invoke-virtual {p1}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isFinished()Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .line 454
    :cond_1
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, p2, v1, p3, v2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Ljava/util/Collection;IZ)V

    .line 456
    return v0

    .line 450
    :cond_2
    :goto_0
    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 451
    .local v1, "logger":Lorg/slf4j/Logger;
    const-string v3, "Layout tagging hints modification failed: cannot move kid hint for which both itself and it\'s parent are already marked as finished."

    invoke-interface {v1, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 452
    return v2
.end method

.method public releaseAllHints()V
    .locals 5

    .line 305
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->dummiesForPreExistingTags:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/tagging/TaggingDummyElement;

    .line 306
    .local v1, "dummy":Lcom/itextpdf/layout/tagging/TaggingDummyElement;
    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->finishTaggingHint(Lcom/itextpdf/layout/IPropertyContainer;)V

    .line 307
    invoke-static {v1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getHintKey(Lcom/itextpdf/layout/IPropertyContainer;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Ljava/util/List;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->finishDummyKids(Ljava/util/List;)V

    .line 308
    .end local v1    # "dummy":Lcom/itextpdf/layout/tagging/TaggingDummyElement;
    goto :goto_0

    .line 309
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->dummiesForPreExistingTags:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 311
    invoke-virtual {p0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->releaseFinishedHints()V

    .line 313
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 314
    .local v0, "hangingHints":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    iget-object v1, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->parentHints:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 315
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 316
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 317
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    goto :goto_1

    .line 319
    :cond_1
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 328
    .local v2, "hint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct {p0, v2, v3, v4}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->releaseHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Ljava/util/Set;Z)V

    .line 329
    .end local v2    # "hint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    goto :goto_2

    .line 331
    :cond_2
    iget-object v1, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->parentHints:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 332
    iget-object v1, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->kidsHints:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 333
    return-void

    .line 332
    :cond_3
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 331
    :cond_4
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method public releaseFinishedHints()V
    .locals 9

    .line 267
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 268
    .local v0, "allHints":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    iget-object v1, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->parentHints:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 269
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 270
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 271
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    goto :goto_0

    .line 273
    :cond_0
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 274
    .local v2, "hint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-virtual {v2}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isFinished()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-static {v2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->isNonAccessibleHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v2}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v3

    instance-of v3, v3, Lcom/itextpdf/layout/tagging/TaggingDummyElement;

    if-eqz v3, :cond_2

    .line 275
    goto :goto_1

    .line 277
    :cond_2
    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Ljava/util/List;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->finishDummyKids(Ljava/util/List;)V

    .line 278
    .end local v2    # "hint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    goto :goto_1

    .line 280
    :cond_3
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 281
    .local v1, "hintsToBeHeld":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 282
    .local v3, "hint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-static {v3}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->isNonAccessibleHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z

    move-result v4

    if-nez v4, :cond_6

    .line 283
    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getAccessibleKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Ljava/util/List;

    move-result-object v4

    .line 284
    .local v4, "siblingsHints":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    const/4 v5, 0x0

    .line 285
    .local v5, "holdTheFirstFinishedToBeFound":Z
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 286
    .local v7, "sibling":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-virtual {v7}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isFinished()Z

    move-result v8

    if-nez v8, :cond_4

    .line 287
    const/4 v5, 0x1

    goto :goto_4

    .line 288
    :cond_4
    if-eqz v5, :cond_5

    .line 290
    invoke-interface {v1, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 291
    const/4 v5, 0x0

    .line 293
    .end local v7    # "sibling":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    :cond_5
    :goto_4
    goto :goto_3

    .line 295
    .end local v3    # "hint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .end local v4    # "siblingsHints":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    .end local v5    # "holdTheFirstFinishedToBeFound":Z
    :cond_6
    goto :goto_2

    .line 297
    :cond_7
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 298
    .restart local v3    # "hint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-virtual {v3}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isFinished()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 299
    const/4 v4, 0x1

    invoke-direct {p0, v3, v1, v4}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->releaseHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Ljava/util/Set;Z)V

    .line 301
    .end local v3    # "hint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    :cond_8
    goto :goto_5

    .line 302
    :cond_9
    return-void
.end method

.method public replaceKidHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Ljava/util/Collection;)I
    .locals 10
    .param p1, "kidHintKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            ">;)I"
        }
    .end annotation

    .line 403
    .local p2, "newKidsHintKeys":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v0

    .line 404
    .local v0, "parentKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 405
    return v1

    .line 407
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isFinished()Z

    move-result v2

    const-class v3, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    if-eqz v2, :cond_1

    .line 408
    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 409
    .local v2, "logger":Lorg/slf4j/Logger;
    const-string v3, "Layout tagging hints modification failed: cannot replace a kid hint that is already marked as finished."

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 414
    return v1

    .line 417
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :cond_1
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->removeParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)I

    move-result v2

    .line 419
    .local v2, "kidIndex":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 420
    .local v4, "kidsToBeAdded":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/tagging/TaggingHintKey;>;"
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 421
    .local v6, "newKidKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-direct {p0, v6}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->removeParentHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)I

    move-result v7

    .line 422
    .local v7, "i":I
    const/4 v8, -0x2

    if-eq v7, v8, :cond_3

    if-ne v7, v1, :cond_2

    .line 423
    invoke-virtual {v6}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isFinished()Z

    move-result v8

    if-eqz v8, :cond_2

    goto :goto_1

    .line 428
    :cond_2
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 429
    .end local v6    # "newKidKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .end local v7    # "i":I
    goto :goto_0

    .line 424
    .restart local v6    # "newKidKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .restart local v7    # "i":I
    :cond_3
    :goto_1
    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v8

    .line 425
    .local v8, "logger":Lorg/slf4j/Logger;
    const-string v9, "Layout tagging hints modification failed: cannot move kid hint for which both itself and it\'s parent are already marked as finished."

    invoke-interface {v8, v9}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 426
    goto :goto_0

    .line 431
    .end local v6    # "newKidKey":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .end local v7    # "i":I
    .end local v8    # "logger":Lorg/slf4j/Logger;
    :cond_4
    const/4 v1, 0x1

    invoke-direct {p0, v0, v4, v2, v1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->addKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Ljava/util/Collection;IZ)V

    .line 433
    return v2
.end method

.method public restoreAutoTaggingPointerPosition(Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 2
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 213
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getAutoTaggingPointer()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v0

    .line 214
    .local v0, "autoTaggingPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    iget-object v1, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->autoTaggingPointerSavedPosition:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 215
    .local v1, "position":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    if-eqz v1, :cond_0

    .line 216
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->moveToPointer(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 218
    :cond_0
    return-void
.end method

.method public setRoleHint(Lcom/itextpdf/layout/IPropertyContainer;Ljava/lang/String;)V
    .locals 1
    .param p1, "hintOwner"    # Lcom/itextpdf/layout/IPropertyContainer;
    .param p2, "role"    # Ljava/lang/String;

    .line 159
    invoke-static {p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getOrCreateHintKey(Lcom/itextpdf/layout/IPropertyContainer;)Lcom/itextpdf/layout/tagging/TaggingHintKey;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->setOverriddenRole(Ljava/lang/String;)V

    .line 160
    return-void
.end method

.method public useAutoTaggingPointerAndRememberItsPosition(Lcom/itextpdf/layout/renderer/IRenderer;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 3
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 206
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->context:Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getAutoTaggingPointer()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    move-result-object v0

    .line 207
    .local v0, "autoTaggingPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    new-instance v1, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)V

    .line 208
    .local v1, "position":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    iget-object v2, p0, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->autoTaggingPointerSavedPosition:Ljava/util/Map;

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    return-object v0
.end method
