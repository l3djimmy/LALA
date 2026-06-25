.class Lcom/itextpdf/layout/tagging/TableTaggingPriorToOneFiveVersionRule;
.super Ljava/lang/Object;
.source "TableTaggingPriorToOneFiveVersionRule.java"

# interfaces
.implements Lcom/itextpdf/layout/tagging/ITaggingRule;


# instance fields
.field private finishForbidden:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/itextpdf/layout/tagging/TaggingHintKey;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/tagging/TableTaggingPriorToOneFiveVersionRule;->finishForbidden:Ljava/util/Set;

    return-void
.end method

.method private removeTagUnavailableInPriorToOneDotFivePdf(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;)V
    .locals 4
    .param p1, "taggingHintKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .param p2, "taggingHelper"    # Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;

    .line 56
    invoke-virtual {p2, p1}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getAccessibleKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p2, p1, v0}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->replaceKidHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;Ljava/util/Collection;)I

    .line 57
    invoke-virtual {p2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    .line 58
    .local v0, "pdfDocument":Lcom/itextpdf/kernel/pdf/PdfDocument;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTagStructureContext()Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->getWaitingTagsManager()Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;

    move-result-object v1

    .line 59
    .local v1, "waitingTagsManager":Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;
    new-instance v2, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    invoke-direct {v2, v0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 60
    .local v2, "tagPointer":Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    invoke-virtual {v1, v2, p1}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->tryMovePointerToWaitingTag(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 61
    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/pdf/tagutils/WaitingTagsManager;->removeWaitingState(Ljava/lang/Object;)Z

    .line 62
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->removeTag()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 64
    :cond_0
    iget-object v3, p0, Lcom/itextpdf/layout/tagging/TableTaggingPriorToOneFiveVersionRule;->finishForbidden:Ljava/util/Set;

    invoke-interface {v3, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 65
    invoke-virtual {p1}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->setFinished()V

    .line 67
    :cond_1
    return-void
.end method


# virtual methods
.method public onTagFinish(Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;Lcom/itextpdf/layout/tagging/TaggingHintKey;)Z
    .locals 6
    .param p1, "taggingHelper"    # Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;
    .param p2, "taggingHintKey"    # Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 37
    invoke-virtual {p2}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v0

    const-string v1, "TFoot"

    const-string v2, "THead"

    if-eqz v0, :cond_1

    .line 38
    invoke-virtual {p2}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v0

    invoke-interface {v0}, Lcom/itextpdf/layout/tagging/IAccessibleElement;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getRole()Ljava/lang/String;

    move-result-object v0

    .line 39
    .local v0, "role":Ljava/lang/String;
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 40
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/layout/tagging/TableTaggingPriorToOneFiveVersionRule;->finishForbidden:Ljava/util/Set;

    invoke-interface {v1, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 41
    const/4 v1, 0x0

    return v1

    .line 45
    .end local v0    # "role":Ljava/lang/String;
    :cond_1
    invoke-virtual {p1, p2}, Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;->getAccessibleKidsHint(Lcom/itextpdf/layout/tagging/TaggingHintKey;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/tagging/TaggingHintKey;

    .line 46
    .local v3, "hint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    invoke-virtual {v3}, Lcom/itextpdf/layout/tagging/TaggingHintKey;->getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;

    move-result-object v4

    invoke-interface {v4}, Lcom/itextpdf/layout/tagging/IAccessibleElement;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getRole()Ljava/lang/String;

    move-result-object v4

    .line 47
    .local v4, "role":Ljava/lang/String;
    const-string v5, "TBody"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 49
    :cond_2
    invoke-direct {p0, v3, p1}, Lcom/itextpdf/layout/tagging/TableTaggingPriorToOneFiveVersionRule;->removeTagUnavailableInPriorToOneDotFivePdf(Lcom/itextpdf/layout/tagging/TaggingHintKey;Lcom/itextpdf/layout/tagging/LayoutTaggingHelper;)V

    .line 51
    .end local v3    # "hint":Lcom/itextpdf/layout/tagging/TaggingHintKey;
    .end local v4    # "role":Ljava/lang/String;
    :cond_3
    goto :goto_0

    .line 52
    :cond_4
    const/4 v0, 0x1

    return v0
.end method
