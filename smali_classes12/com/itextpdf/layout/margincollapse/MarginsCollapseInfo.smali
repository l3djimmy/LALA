.class public Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
.super Ljava/lang/Object;
.source "MarginsCollapseInfo.java"


# instance fields
.field private bufferSpaceOnBottom:F

.field private bufferSpaceOnTop:F

.field private clearanceApplied:Z

.field private collapseAfter:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

.field private collapseBefore:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

.field private ignoreOwnMarginBottom:Z

.field private ignoreOwnMarginTop:Z

.field private isSelfCollapsing:Z

.field private ownCollapseAfter:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

.field private usedBufferSpaceOnBottom:F

.field private usedBufferSpaceOnTop:F


# direct methods
.method constructor <init>()V
    .locals 2

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->ignoreOwnMarginTop:Z

    .line 47
    iput-boolean v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->ignoreOwnMarginBottom:Z

    .line 48
    new-instance v1, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    invoke-direct {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->collapseBefore:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    .line 49
    new-instance v1, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    invoke-direct {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->collapseAfter:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    .line 50
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isSelfCollapsing:Z

    .line 51
    const/4 v1, 0x0

    iput v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->bufferSpaceOnTop:F

    .line 52
    iput v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->bufferSpaceOnBottom:F

    .line 53
    iput v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->usedBufferSpaceOnTop:F

    .line 54
    iput v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->usedBufferSpaceOnBottom:F

    .line 55
    iput-boolean v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->clearanceApplied:Z

    .line 56
    return-void
.end method

.method constructor <init>(ZZLcom/itextpdf/layout/margincollapse/MarginsCollapse;Lcom/itextpdf/layout/margincollapse/MarginsCollapse;)V
    .locals 1
    .param p1, "ignoreOwnMarginTop"    # Z
    .param p2, "ignoreOwnMarginBottom"    # Z
    .param p3, "collapseBefore"    # Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    .param p4, "collapseAfter"    # Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-boolean p1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->ignoreOwnMarginTop:Z

    .line 60
    iput-boolean p2, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->ignoreOwnMarginBottom:Z

    .line 61
    iput-object p3, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->collapseBefore:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    .line 62
    iput-object p4, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->collapseAfter:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    .line 63
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isSelfCollapsing:Z

    .line 64
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->bufferSpaceOnTop:F

    .line 65
    iput v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->bufferSpaceOnBottom:F

    .line 66
    iput v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->usedBufferSpaceOnTop:F

    .line 67
    iput v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->usedBufferSpaceOnBottom:F

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->clearanceApplied:Z

    .line 69
    return-void
.end method

.method public static createDeepCopy(Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;)Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .locals 2
    .param p0, "instance"    # Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 88
    new-instance v0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    invoke-direct {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;-><init>()V

    .line 89
    .local v0, "copy":Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->copyTo(Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;)V

    .line 91
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->collapseBefore:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    invoke-virtual {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->clone()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v1

    iput-object v1, v0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->collapseBefore:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    .line 92
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->collapseAfter:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    invoke-virtual {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->clone()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v1

    iput-object v1, v0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->collapseAfter:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    .line 93
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->ownCollapseAfter:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    if-eqz v1, :cond_0

    .line 94
    iget-object v1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->ownCollapseAfter:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    invoke-virtual {v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->clone()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setOwnCollapseAfter(Lcom/itextpdf/layout/margincollapse/MarginsCollapse;)V

    .line 97
    :cond_0
    return-object v0
.end method

.method public static updateFromCopy(Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;)V
    .locals 2
    .param p0, "originalInstance"    # Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;
    .param p1, "processedCopy"    # Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 101
    iget-boolean v0, p1, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->ignoreOwnMarginTop:Z

    iput-boolean v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->ignoreOwnMarginTop:Z

    .line 102
    iget-boolean v0, p1, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->ignoreOwnMarginBottom:Z

    iput-boolean v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->ignoreOwnMarginBottom:Z

    .line 104
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->collapseBefore:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    iget-object v1, p1, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->collapseBefore:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->joinMargin(Lcom/itextpdf/layout/margincollapse/MarginsCollapse;)V

    .line 105
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->collapseAfter:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    iget-object v1, p1, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->collapseAfter:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->joinMargin(Lcom/itextpdf/layout/margincollapse/MarginsCollapse;)V

    .line 107
    invoke-virtual {p1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getOwnCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 108
    invoke-virtual {p0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getOwnCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v0

    if-nez v0, :cond_0

    .line 109
    new-instance v0, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    invoke-direct {v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;-><init>()V

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setOwnCollapseAfter(Lcom/itextpdf/layout/margincollapse/MarginsCollapse;)V

    .line 111
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getOwnCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->getOwnCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/layout/margincollapse/MarginsCollapse;->joinMargin(Lcom/itextpdf/layout/margincollapse/MarginsCollapse;)V

    .line 113
    :cond_1
    iget-boolean v0, p1, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isSelfCollapsing:Z

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setSelfCollapsing(Z)V

    .line 114
    iget v0, p1, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->bufferSpaceOnTop:F

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setBufferSpaceOnTop(F)V

    .line 115
    iget v0, p1, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->bufferSpaceOnBottom:F

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setBufferSpaceOnBottom(F)V

    .line 116
    iget v0, p1, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->usedBufferSpaceOnTop:F

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setUsedBufferSpaceOnTop(F)V

    .line 117
    iget v0, p1, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->usedBufferSpaceOnBottom:F

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setUsedBufferSpaceOnBottom(F)V

    .line 119
    iget-boolean v0, p1, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->clearanceApplied:Z

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setClearanceApplied(Z)V

    .line 120
    return-void
.end method


# virtual methods
.method public copyTo(Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;)V
    .locals 1
    .param p1, "destInfo"    # Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;

    .line 72
    iget-boolean v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->ignoreOwnMarginTop:Z

    iput-boolean v0, p1, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->ignoreOwnMarginTop:Z

    .line 73
    iget-boolean v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->ignoreOwnMarginBottom:Z

    iput-boolean v0, p1, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->ignoreOwnMarginBottom:Z

    .line 74
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->collapseBefore:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    iput-object v0, p1, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->collapseBefore:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    .line 75
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->collapseAfter:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    iput-object v0, p1, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->collapseAfter:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    .line 77
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->ownCollapseAfter:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    invoke-virtual {p1, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setOwnCollapseAfter(Lcom/itextpdf/layout/margincollapse/MarginsCollapse;)V

    .line 78
    iget-boolean v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isSelfCollapsing:Z

    invoke-virtual {p1, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setSelfCollapsing(Z)V

    .line 79
    iget v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->bufferSpaceOnTop:F

    invoke-virtual {p1, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setBufferSpaceOnTop(F)V

    .line 80
    iget v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->bufferSpaceOnBottom:F

    invoke-virtual {p1, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setBufferSpaceOnBottom(F)V

    .line 81
    iget v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->usedBufferSpaceOnTop:F

    invoke-virtual {p1, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setUsedBufferSpaceOnTop(F)V

    .line 82
    iget v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->usedBufferSpaceOnBottom:F

    invoke-virtual {p1, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setUsedBufferSpaceOnBottom(F)V

    .line 84
    iget-boolean v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->clearanceApplied:Z

    invoke-virtual {p1, v0}, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->setClearanceApplied(Z)V

    .line 85
    return-void
.end method

.method getBufferSpaceOnBottom()F
    .locals 1

    .line 163
    iget v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->bufferSpaceOnBottom:F

    return v0
.end method

.method getBufferSpaceOnTop()F
    .locals 1

    .line 155
    iget v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->bufferSpaceOnTop:F

    return v0
.end method

.method getCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->collapseAfter:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    return-object v0
.end method

.method getCollapseBefore()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->collapseBefore:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    return-object v0
.end method

.method getOwnCollapseAfter()Lcom/itextpdf/layout/margincollapse/MarginsCollapse;
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->ownCollapseAfter:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    return-object v0
.end method

.method getUsedBufferSpaceOnBottom()F
    .locals 1

    .line 179
    iget v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->usedBufferSpaceOnBottom:F

    return v0
.end method

.method getUsedBufferSpaceOnTop()F
    .locals 1

    .line 171
    iget v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->usedBufferSpaceOnTop:F

    return v0
.end method

.method isClearanceApplied()Z
    .locals 1

    .line 187
    iget-boolean v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->clearanceApplied:Z

    return v0
.end method

.method isIgnoreOwnMarginBottom()Z
    .locals 1

    .line 151
    iget-boolean v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->ignoreOwnMarginBottom:Z

    return v0
.end method

.method isIgnoreOwnMarginTop()Z
    .locals 1

    .line 147
    iget-boolean v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->ignoreOwnMarginTop:Z

    return v0
.end method

.method isSelfCollapsing()Z
    .locals 1

    .line 143
    iget-boolean v0, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isSelfCollapsing:Z

    return v0
.end method

.method setBufferSpaceOnBottom(F)V
    .locals 0
    .param p1, "bufferSpaceOnBottom"    # F

    .line 167
    iput p1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->bufferSpaceOnBottom:F

    .line 168
    return-void
.end method

.method setBufferSpaceOnTop(F)V
    .locals 0
    .param p1, "bufferSpaceOnTop"    # F

    .line 159
    iput p1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->bufferSpaceOnTop:F

    .line 160
    return-void
.end method

.method setClearanceApplied(Z)V
    .locals 0
    .param p1, "clearanceApplied"    # Z

    .line 191
    iput-boolean p1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->clearanceApplied:Z

    .line 192
    return-void
.end method

.method setCollapseAfter(Lcom/itextpdf/layout/margincollapse/MarginsCollapse;)V
    .locals 0
    .param p1, "collapseAfter"    # Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    .line 129
    iput-object p1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->collapseAfter:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    .line 130
    return-void
.end method

.method setOwnCollapseAfter(Lcom/itextpdf/layout/margincollapse/MarginsCollapse;)V
    .locals 0
    .param p1, "marginsCollapse"    # Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    .line 135
    iput-object p1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->ownCollapseAfter:Lcom/itextpdf/layout/margincollapse/MarginsCollapse;

    .line 136
    return-void
.end method

.method setSelfCollapsing(Z)V
    .locals 0
    .param p1, "selfCollapsing"    # Z

    .line 139
    iput-boolean p1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->isSelfCollapsing:Z

    .line 140
    return-void
.end method

.method setUsedBufferSpaceOnBottom(F)V
    .locals 0
    .param p1, "usedBufferSpaceOnBottom"    # F

    .line 183
    iput p1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->usedBufferSpaceOnBottom:F

    .line 184
    return-void
.end method

.method setUsedBufferSpaceOnTop(F)V
    .locals 0
    .param p1, "usedBufferSpaceOnTop"    # F

    .line 175
    iput p1, p0, Lcom/itextpdf/layout/margincollapse/MarginsCollapseInfo;->usedBufferSpaceOnTop:F

    .line 176
    return-void
.end method
