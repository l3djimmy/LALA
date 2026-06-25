.class public final Lcom/itextpdf/layout/tagging/TaggingHintKey;
.super Ljava/lang/Object;
.source "TaggingHintKey.java"


# instance fields
.field private elem:Lcom/itextpdf/layout/tagging/IAccessibleElement;

.field private elementBasedFinishingOnly:Z

.field private isArtifact:Z

.field private isFinished:Z

.field private overriddenRole:Ljava/lang/String;

.field private tagPointer:Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;


# direct methods
.method constructor <init>(Lcom/itextpdf/layout/tagging/IAccessibleElement;Z)V
    .locals 0
    .param p1, "elem"    # Lcom/itextpdf/layout/tagging/IAccessibleElement;
    .param p2, "createdElementBased"    # Z

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lcom/itextpdf/layout/tagging/TaggingHintKey;->elem:Lcom/itextpdf/layout/tagging/IAccessibleElement;

    .line 51
    iput-boolean p2, p0, Lcom/itextpdf/layout/tagging/TaggingHintKey;->elementBasedFinishingOnly:Z

    .line 52
    return-void
.end method


# virtual methods
.method getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/TaggingHintKey;->elem:Lcom/itextpdf/layout/tagging/IAccessibleElement;

    if-nez v0, :cond_0

    .line 84
    const/4 v0, 0x0

    return-object v0

    .line 86
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/TaggingHintKey;->elem:Lcom/itextpdf/layout/tagging/IAccessibleElement;

    invoke-interface {v0}, Lcom/itextpdf/layout/tagging/IAccessibleElement;->getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v0

    return-object v0
.end method

.method public getAccessibleElement()Lcom/itextpdf/layout/tagging/IAccessibleElement;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/TaggingHintKey;->elem:Lcom/itextpdf/layout/tagging/IAccessibleElement;

    return-object v0
.end method

.method getOverriddenRole()Ljava/lang/String;
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/TaggingHintKey;->overriddenRole:Ljava/lang/String;

    return-object v0
.end method

.method public getTagPointer()Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/itextpdf/layout/tagging/TaggingHintKey;->tagPointer:Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    return-object v0
.end method

.method isArtifact()Z
    .locals 1

    .line 110
    iget-boolean v0, p0, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isArtifact:Z

    return v0
.end method

.method isElementBasedFinishingOnly()Z
    .locals 1

    .line 144
    iget-boolean v0, p0, Lcom/itextpdf/layout/tagging/TaggingHintKey;->elementBasedFinishingOnly:Z

    return v0
.end method

.method isFinished()Z
    .locals 1

    .line 94
    iget-boolean v0, p0, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isFinished:Z

    return v0
.end method

.method setArtifact()V
    .locals 1

    .line 117
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isArtifact:Z

    .line 118
    return-void
.end method

.method setFinished()V
    .locals 1

    .line 101
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/tagging/TaggingHintKey;->isFinished:Z

    .line 102
    return-void
.end method

.method setOverriddenRole(Ljava/lang/String;)V
    .locals 0
    .param p1, "overriddenRole"    # Ljava/lang/String;

    .line 135
    iput-object p1, p0, Lcom/itextpdf/layout/tagging/TaggingHintKey;->overriddenRole:Ljava/lang/String;

    .line 136
    return-void
.end method

.method public setTagPointer(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)V
    .locals 0
    .param p1, "tag"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 79
    iput-object p1, p0, Lcom/itextpdf/layout/tagging/TaggingHintKey;->tagPointer:Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 80
    return-void
.end method
