.class public Lcom/itextpdf/kernel/utils/PdfMergerProperties;
.super Ljava/lang/Object;
.source "PdfMergerProperties.java"


# instance fields
.field private closeSrcDocuments:Z

.field private mergeOutlines:Z

.field private mergeScripts:Z

.field private mergeTags:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/utils/PdfMergerProperties;->closeSrcDocuments:Z

    .line 40
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/itextpdf/kernel/utils/PdfMergerProperties;->mergeTags:Z

    .line 41
    iput-boolean v1, p0, Lcom/itextpdf/kernel/utils/PdfMergerProperties;->mergeOutlines:Z

    .line 42
    iput-boolean v0, p0, Lcom/itextpdf/kernel/utils/PdfMergerProperties;->mergeScripts:Z

    .line 43
    return-void
.end method


# virtual methods
.method public isCloseSrcDocuments()Z
    .locals 1

    .line 51
    iget-boolean v0, p0, Lcom/itextpdf/kernel/utils/PdfMergerProperties;->closeSrcDocuments:Z

    return v0
.end method

.method public isMergeOutlines()Z
    .locals 1

    .line 69
    iget-boolean v0, p0, Lcom/itextpdf/kernel/utils/PdfMergerProperties;->mergeOutlines:Z

    return v0
.end method

.method public isMergeScripts()Z
    .locals 1

    .line 78
    iget-boolean v0, p0, Lcom/itextpdf/kernel/utils/PdfMergerProperties;->mergeScripts:Z

    return v0
.end method

.method public isMergeTags()Z
    .locals 1

    .line 60
    iget-boolean v0, p0, Lcom/itextpdf/kernel/utils/PdfMergerProperties;->mergeTags:Z

    return v0
.end method

.method public setCloseSrcDocuments(Z)Lcom/itextpdf/kernel/utils/PdfMergerProperties;
    .locals 0
    .param p1, "closeSrcDocuments"    # Z

    .line 89
    iput-boolean p1, p0, Lcom/itextpdf/kernel/utils/PdfMergerProperties;->closeSrcDocuments:Z

    .line 90
    return-object p0
.end method

.method public setMergeOutlines(Z)Lcom/itextpdf/kernel/utils/PdfMergerProperties;
    .locals 0
    .param p1, "mergeOutlines"    # Z

    .line 113
    iput-boolean p1, p0, Lcom/itextpdf/kernel/utils/PdfMergerProperties;->mergeOutlines:Z

    .line 114
    return-object p0
.end method

.method public setMergeScripts(Z)Lcom/itextpdf/kernel/utils/PdfMergerProperties;
    .locals 0
    .param p1, "mergeNames"    # Z

    .line 126
    iput-boolean p1, p0, Lcom/itextpdf/kernel/utils/PdfMergerProperties;->mergeScripts:Z

    .line 127
    return-object p0
.end method

.method public setMergeTags(Z)Lcom/itextpdf/kernel/utils/PdfMergerProperties;
    .locals 0
    .param p1, "mergeTags"    # Z

    .line 101
    iput-boolean p1, p0, Lcom/itextpdf/kernel/utils/PdfMergerProperties;->mergeTags:Z

    .line 102
    return-object p0
.end method
