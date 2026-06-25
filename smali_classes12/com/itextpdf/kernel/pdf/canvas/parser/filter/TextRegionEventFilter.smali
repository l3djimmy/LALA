.class public Lcom/itextpdf/kernel/pdf/canvas/parser/filter/TextRegionEventFilter;
.super Ljava/lang/Object;
.source "TextRegionEventFilter.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/canvas/parser/filter/IEventFilter;


# instance fields
.field private final filterRect:Lcom/itextpdf/kernel/geom/Rectangle;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 0
    .param p1, "filterRect"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/filter/TextRegionEventFilter;->filterRect:Lcom/itextpdf/kernel/geom/Rectangle;

    .line 46
    return-void
.end method


# virtual methods
.method public accept(Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;)Z
    .locals 11
    .param p1, "data"    # Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;
    .param p2, "type"    # Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;

    .line 50
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;->RENDER_TEXT:Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;

    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 51
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;

    .line 53
    .local v0, "renderInfo":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getBaseline()Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v2

    .line 54
    .local v2, "segment":Lcom/itextpdf/kernel/geom/LineSegment;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/LineSegment;->getStartPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v3

    .line 55
    .local v3, "startPoint":Lcom/itextpdf/kernel/geom/Vector;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/LineSegment;->getEndPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v4

    .line 57
    .local v4, "endPoint":Lcom/itextpdf/kernel/geom/Vector;
    invoke-virtual {v3, v1}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v5

    .line 58
    .local v5, "x1":F
    const/4 v6, 0x1

    invoke-virtual {v3, v6}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v7

    .line 59
    .local v7, "y1":F
    invoke-virtual {v4, v1}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v8

    .line 60
    .local v8, "x2":F
    invoke-virtual {v4, v6}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v9

    .line 62
    .local v9, "y2":F
    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/filter/TextRegionEventFilter;->filterRect:Lcom/itextpdf/kernel/geom/Rectangle;

    if-eqz v10, :cond_0

    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/filter/TextRegionEventFilter;->filterRect:Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v10, v5, v7, v8, v9}, Lcom/itextpdf/kernel/geom/Rectangle;->intersectsLine(FFFF)Z

    move-result v10

    if-eqz v10, :cond_1

    :cond_0
    move v1, v6

    :cond_1
    return v1

    .line 64
    .end local v0    # "renderInfo":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    .end local v2    # "segment":Lcom/itextpdf/kernel/geom/LineSegment;
    .end local v3    # "startPoint":Lcom/itextpdf/kernel/geom/Vector;
    .end local v4    # "endPoint":Lcom/itextpdf/kernel/geom/Vector;
    .end local v5    # "x1":F
    .end local v7    # "y1":F
    .end local v8    # "x2":F
    .end local v9    # "y2":F
    :cond_2
    return v1
.end method
