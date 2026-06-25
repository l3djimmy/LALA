.class public Lcom/itextpdf/layout/properties/ParagraphOrphansControl;
.super Ljava/lang/Object;
.source "ParagraphOrphansControl.java"


# instance fields
.field private minOrphans:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "minOrphans"    # I

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput p1, p0, Lcom/itextpdf/layout/properties/ParagraphOrphansControl;->minOrphans:I

    .line 46
    return-void
.end method


# virtual methods
.method public getMinOrphans()I
    .locals 1

    .line 65
    iget v0, p0, Lcom/itextpdf/layout/properties/ParagraphOrphansControl;->minOrphans:I

    return v0
.end method

.method public handleViolatedOrphans(Lcom/itextpdf/layout/renderer/ParagraphRenderer;Ljava/lang/String;)V
    .locals 5
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .param p2, "message"    # Ljava/lang/String;

    .line 77
    const-class v0, Lcom/itextpdf/layout/properties/ParagraphOrphansControl;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 78
    .local v0, "logger":Lorg/slf4j/Logger;
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getLines()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 79
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v1

    .line 80
    .local v1, "pageNumber":I
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, p0, Lcom/itextpdf/layout/properties/ParagraphOrphansControl;->minOrphans:I

    .line 81
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getLines()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v2, v3, v4, p2}, [Ljava/lang/Object;

    move-result-object v2

    .line 80
    const-string v3, "Orphans constraint violated for paragraph split at page {0}. Min number of orphans: {1}; actual: {2}. \nComment: {3}"

    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 82
    .local v2, "warnText":Ljava/lang/String;
    invoke-interface {v0, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 83
    .end local v1    # "pageNumber":I
    .end local v2    # "warnText":Ljava/lang/String;
    goto :goto_0

    .line 84
    :cond_0
    const-string v1, "Premature call of handleViolation method."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 86
    :goto_0
    return-void
.end method

.method public setMinAllowedOrphans(I)Lcom/itextpdf/layout/properties/ParagraphOrphansControl;
    .locals 0
    .param p1, "minOrphans"    # I

    .line 55
    iput p1, p0, Lcom/itextpdf/layout/properties/ParagraphOrphansControl;->minOrphans:I

    .line 56
    return-object p0
.end method
