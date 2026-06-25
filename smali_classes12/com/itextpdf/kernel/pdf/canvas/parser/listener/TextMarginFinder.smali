.class public Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextMarginFinder;
.super Ljava/lang/Object;
.source "TextMarginFinder.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;


# instance fields
.field private textRectangle:Lcom/itextpdf/kernel/geom/Rectangle;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextMarginFinder;->textRectangle:Lcom/itextpdf/kernel/geom/Rectangle;

    return-void
.end method


# virtual methods
.method public eventOccurred(Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;)V
    .locals 6
    .param p1, "data"    # Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;
    .param p2, "type"    # Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;

    .line 44
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;->RENDER_TEXT:Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;

    if-ne p2, v0, :cond_1

    .line 45
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;

    .line 46
    .local v0, "info":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextMarginFinder;->textRectangle:Lcom/itextpdf/kernel/geom/Rectangle;

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x2

    if-nez v1, :cond_0

    .line 47
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getDescentLine()Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/LineSegment;->getBoundingRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextMarginFinder;->textRectangle:Lcom/itextpdf/kernel/geom/Rectangle;

    goto :goto_0

    .line 49
    :cond_0
    new-array v1, v4, [Lcom/itextpdf/kernel/geom/Rectangle;

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextMarginFinder;->textRectangle:Lcom/itextpdf/kernel/geom/Rectangle;

    aput-object v5, v1, v3

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getDescentLine()Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/geom/LineSegment;->getBoundingRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    aput-object v5, v1, v2

    invoke-static {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getCommonRectangle([Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextMarginFinder;->textRectangle:Lcom/itextpdf/kernel/geom/Rectangle;

    .line 51
    :goto_0
    new-array v1, v4, [Lcom/itextpdf/kernel/geom/Rectangle;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextMarginFinder;->textRectangle:Lcom/itextpdf/kernel/geom/Rectangle;

    aput-object v4, v1, v3

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getAscentLine()Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/geom/LineSegment;->getBoundingRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getCommonRectangle([Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextMarginFinder;->textRectangle:Lcom/itextpdf/kernel/geom/Rectangle;

    .line 52
    .end local v0    # "info":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    nop

    .line 55
    return-void

    .line 53
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Event type not supported: {0}"

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
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

    .line 59
    new-instance v0, Ljava/util/LinkedHashSet;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;->RENDER_TEXT:Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getTextRectangle()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextMarginFinder;->textRectangle:Lcom/itextpdf/kernel/geom/Rectangle;

    return-object v0
.end method
