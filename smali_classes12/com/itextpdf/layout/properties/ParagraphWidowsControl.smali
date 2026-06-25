.class public Lcom/itextpdf/layout/properties/ParagraphWidowsControl;
.super Ljava/lang/Object;
.source "ParagraphWidowsControl.java"


# instance fields
.field private maxLinesToMove:I

.field private minWidows:I

.field private overflowOnWidowsViolation:Z


# direct methods
.method public constructor <init>(IIZ)V
    .locals 0
    .param p1, "minWidows"    # I
    .param p2, "maxLinesToMove"    # I
    .param p3, "overflowParagraphOnViolation"    # Z

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput p1, p0, Lcom/itextpdf/layout/properties/ParagraphWidowsControl;->minWidows:I

    .line 52
    iput p2, p0, Lcom/itextpdf/layout/properties/ParagraphWidowsControl;->maxLinesToMove:I

    .line 53
    iput-boolean p3, p0, Lcom/itextpdf/layout/properties/ParagraphWidowsControl;->overflowOnWidowsViolation:Z

    .line 54
    return-void
.end method


# virtual methods
.method public getMaxLinesToMove()I
    .locals 1

    .line 90
    iget v0, p0, Lcom/itextpdf/layout/properties/ParagraphWidowsControl;->maxLinesToMove:I

    return v0
.end method

.method public getMinWidows()I
    .locals 1

    .line 80
    iget v0, p0, Lcom/itextpdf/layout/properties/ParagraphWidowsControl;->minWidows:I

    return v0
.end method

.method public handleViolatedWidows(Lcom/itextpdf/layout/renderer/ParagraphRenderer;Ljava/lang/String;)V
    .locals 5
    .param p1, "widowsRenderer"    # Lcom/itextpdf/layout/renderer/ParagraphRenderer;
    .param p2, "message"    # Ljava/lang/String;

    .line 113
    const-class v0, Lcom/itextpdf/layout/properties/ParagraphWidowsControl;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 114
    .local v0, "logger":Lorg/slf4j/Logger;
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getLines()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 115
    invoke-virtual {p1}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/layout/layout/LayoutArea;->getPageNumber()I

    move-result v1

    .line 116
    .local v1, "pageNumber":I
    nop

    .line 117
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, p0, Lcom/itextpdf/layout/properties/ParagraphWidowsControl;->minWidows:I

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

    .line 116
    const-string v3, "Widows constraint violated for paragraph split at page {0}. Min number of widows: {1}; actual: {2}.\nComment: {3}"

    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 118
    .local v2, "warnText":Ljava/lang/String;
    invoke-interface {v0, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 119
    .end local v1    # "pageNumber":I
    .end local v2    # "warnText":Ljava/lang/String;
    goto :goto_0

    .line 120
    :cond_0
    const-string v1, "Premature call of handleViolation method."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 122
    :goto_0
    return-void
.end method

.method public isOverflowOnWidowsViolation()Z
    .locals 1

    .line 101
    iget-boolean v0, p0, Lcom/itextpdf/layout/properties/ParagraphWidowsControl;->overflowOnWidowsViolation:Z

    return v0
.end method

.method public setMinAllowedWidows(IIZ)Lcom/itextpdf/layout/properties/ParagraphWidowsControl;
    .locals 0
    .param p1, "minWidows"    # I
    .param p2, "maxLinesToMove"    # I
    .param p3, "overflowParagraphOnViolation"    # Z

    .line 68
    iput p1, p0, Lcom/itextpdf/layout/properties/ParagraphWidowsControl;->minWidows:I

    .line 69
    iput p2, p0, Lcom/itextpdf/layout/properties/ParagraphWidowsControl;->maxLinesToMove:I

    .line 70
    iput-boolean p3, p0, Lcom/itextpdf/layout/properties/ParagraphWidowsControl;->overflowOnWidowsViolation:Z

    .line 71
    return-object p0
.end method
