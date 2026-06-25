.class final Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$ITextChunkLocationStrategyImpl;
.super Ljava/lang/Object;
.source "LocationTextExtractionStrategy.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$ITextChunkLocationStrategy;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ITextChunkLocationStrategyImpl"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 327
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$1;

    .line 327
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$ITextChunkLocationStrategyImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public createLocation(Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;Lcom/itextpdf/kernel/geom/LineSegment;)Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;
    .locals 4
    .param p1, "renderInfo"    # Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    .param p2, "baseline"    # Lcom/itextpdf/kernel/geom/LineSegment;

    .line 332
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/LineSegment;->getStartPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v1

    invoke-virtual {p2}, Lcom/itextpdf/kernel/geom/LineSegment;->getEndPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v2

    .line 333
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getSingleSpaceWidth()F

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;-><init>(Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;F)V

    .line 332
    return-object v0
.end method
