.class public Lcom/itextpdf/kernel/pdf/canvas/parser/listener/SimpleTextExtractionStrategy;
.super Ljava/lang/Object;
.source "SimpleTextExtractionStrategy.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;


# instance fields
.field private lastEnd:Lcom/itextpdf/kernel/geom/Vector;

.field private lastStart:Lcom/itextpdf/kernel/geom/Vector;

.field private final result:Ljava/lang/StringBuilder;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/SimpleTextExtractionStrategy;->result:Ljava/lang/StringBuilder;

    return-void
.end method


# virtual methods
.method protected final appendTextChunk(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/CharSequence;

    .line 114
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/SimpleTextExtractionStrategy;->result:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 115
    return-void
.end method

.method public eventOccurred(Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;)V
    .locals 13
    .param p1, "data"    # Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;
    .param p2, "type"    # Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;

    .line 44
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;->RENDER_TEXT:Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;

    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 45
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;

    .line 46
    .local v0, "renderInfo":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/SimpleTextExtractionStrategy;->result:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    .line 47
    .local v1, "firstRender":Z
    :goto_0
    const/4 v4, 0x0

    .line 49
    .local v4, "hardReturn":Z
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getBaseline()Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v5

    .line 50
    .local v5, "segment":Lcom/itextpdf/kernel/geom/LineSegment;
    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/LineSegment;->getStartPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v6

    .line 51
    .local v6, "start":Lcom/itextpdf/kernel/geom/Vector;
    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/LineSegment;->getEndPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v7

    .line 53
    .local v7, "end":Lcom/itextpdf/kernel/geom/Vector;
    if-nez v1, :cond_1

    .line 54
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/SimpleTextExtractionStrategy;->lastStart:Lcom/itextpdf/kernel/geom/Vector;

    .line 55
    .local v8, "x1":Lcom/itextpdf/kernel/geom/Vector;
    iget-object v9, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/SimpleTextExtractionStrategy;->lastEnd:Lcom/itextpdf/kernel/geom/Vector;

    .line 58
    .local v9, "x2":Lcom/itextpdf/kernel/geom/Vector;
    invoke-virtual {v9, v8}, Lcom/itextpdf/kernel/geom/Vector;->subtract(Lcom/itextpdf/kernel/geom/Vector;)Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v10

    invoke-virtual {v8, v6}, Lcom/itextpdf/kernel/geom/Vector;->subtract(Lcom/itextpdf/kernel/geom/Vector;)Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/itextpdf/kernel/geom/Vector;->cross(Lcom/itextpdf/kernel/geom/Vector;)Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v10

    invoke-virtual {v10}, Lcom/itextpdf/kernel/geom/Vector;->lengthSquared()F

    move-result v10

    invoke-virtual {v9, v8}, Lcom/itextpdf/kernel/geom/Vector;->subtract(Lcom/itextpdf/kernel/geom/Vector;)Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/geom/Vector;->lengthSquared()F

    move-result v11

    div-float/2addr v10, v11

    .line 61
    .local v10, "dist":F
    const/high16 v11, 0x3f800000    # 1.0f

    .line 62
    .local v11, "sameLineThreshold":F
    cmpl-float v12, v10, v11

    if-lez v12, :cond_1

    .line 63
    const/4 v4, 0x1

    .line 69
    .end local v8    # "x1":Lcom/itextpdf/kernel/geom/Vector;
    .end local v9    # "x2":Lcom/itextpdf/kernel/geom/Vector;
    .end local v10    # "dist":F
    .end local v11    # "sameLineThreshold":F
    :cond_1
    if-eqz v4, :cond_2

    .line 71
    const-string v2, "\n"

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/SimpleTextExtractionStrategy;->appendTextChunk(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 72
    :cond_2
    if-nez v1, :cond_3

    .line 74
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/SimpleTextExtractionStrategy;->result:Ljava/lang/StringBuilder;

    iget-object v9, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/SimpleTextExtractionStrategy;->result:Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v9

    sub-int/2addr v9, v2

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v2

    const/16 v8, 0x20

    if-eq v2, v8, :cond_3

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_3

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v2, v8, :cond_3

    .line 75
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/SimpleTextExtractionStrategy;->lastEnd:Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual {v2, v6}, Lcom/itextpdf/kernel/geom/Vector;->subtract(Lcom/itextpdf/kernel/geom/Vector;)Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/Vector;->length()F

    move-result v2

    .line 76
    .local v2, "spacing":F
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getSingleSpaceWidth()F

    move-result v3

    const/high16 v8, 0x40000000    # 2.0f

    div-float/2addr v3, v8

    cmpl-float v3, v2, v3

    if-lez v3, :cond_3

    .line 77
    const-string v3, " "

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/SimpleTextExtractionStrategy;->appendTextChunk(Ljava/lang/CharSequence;)V

    .line 86
    .end local v2    # "spacing":F
    :cond_3
    :goto_1
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/SimpleTextExtractionStrategy;->appendTextChunk(Ljava/lang/CharSequence;)V

    .line 88
    iput-object v6, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/SimpleTextExtractionStrategy;->lastStart:Lcom/itextpdf/kernel/geom/Vector;

    .line 89
    iput-object v7, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/SimpleTextExtractionStrategy;->lastEnd:Lcom/itextpdf/kernel/geom/Vector;

    .line 91
    .end local v0    # "renderInfo":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    .end local v1    # "firstRender":Z
    .end local v4    # "hardReturn":Z
    .end local v5    # "segment":Lcom/itextpdf/kernel/geom/LineSegment;
    .end local v6    # "start":Lcom/itextpdf/kernel/geom/Vector;
    .end local v7    # "end":Lcom/itextpdf/kernel/geom/Vector;
    :cond_4
    return-void
.end method

.method public getResultantText()Ljava/lang/String;
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/SimpleTextExtractionStrategy;->result:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedEvents()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;",
            ">;"
        }
    .end annotation

    .line 95
    new-instance v0, Ljava/util/LinkedHashSet;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;->RENDER_TEXT:Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method
