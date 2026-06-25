.class public Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;
.super Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;
.source "CharacterRenderInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo$StringConversionInfo;
    }
.end annotation


# instance fields
.field private boundingBox:Lcom/itextpdf/kernel/geom/Rectangle;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;)V
    .locals 9
    .param p1, "tri"    # Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;

    .line 88
    if-nez p1, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getText()Ljava/lang/String;

    move-result-object v0

    :goto_0
    if-nez p1, :cond_1

    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;->getLocation(Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;)Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    move-result-object v1

    :goto_1
    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;)V

    .line 89
    if-eqz p1, :cond_2

    .line 93
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .local v0, "points":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getDescentLine()Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/LineSegment;->getStartPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v2

    float-to-double v4, v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getDescentLine()Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/LineSegment;->getStartPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v2

    const/4 v6, 0x1

    invoke-virtual {v2, v6}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v2

    float-to-double v7, v2

    invoke-direct {v1, v4, v5, v7, v8}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getDescentLine()Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/LineSegment;->getEndPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v2

    float-to-double v4, v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getDescentLine()Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/LineSegment;->getEndPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v2

    invoke-virtual {v2, v6}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v2

    float-to-double v7, v2

    invoke-direct {v1, v4, v5, v7, v8}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getAscentLine()Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/LineSegment;->getStartPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v2

    float-to-double v4, v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getAscentLine()Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/LineSegment;->getStartPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v2

    invoke-virtual {v2, v6}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v2

    float-to-double v7, v2

    invoke-direct {v1, v4, v5, v7, v8}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getAscentLine()Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/geom/LineSegment;->getEndPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v2

    float-to-double v2, v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getAscentLine()Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/geom/LineSegment;->getEndPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v4

    invoke-virtual {v4, v6}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v4

    float-to-double v4, v4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/itextpdf/kernel/geom/Point;-><init>(DD)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    invoke-static {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->calculateBBox(Ljava/util/List;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;->boundingBox:Lcom/itextpdf/kernel/geom/Rectangle;

    .line 100
    return-void

    .line 90
    .end local v0    # "points":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Point;>;"
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "TextRenderInfo argument is not nullable."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static getLocation(Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;)Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;
    .locals 5
    .param p0, "tri"    # Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;

    .line 107
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getBaseline()Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v0

    .line 108
    .local v0, "baseline":Lcom/itextpdf/kernel/geom/LineSegment;
    new-instance v1, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/LineSegment;->getStartPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v2

    .line 109
    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/LineSegment;->getEndPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v3

    .line 110
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getSingleSpaceWidth()F

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;-><init>(Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;F)V

    .line 108
    return-object v1
.end method

.method static mapString(Ljava/util/List;)Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo$StringConversionInfo;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;",
            ">;)",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo$StringConversionInfo;"
        }
    .end annotation

    .line 51
    .local p0, "cris":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 52
    .local v0, "indexMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 54
    .local v2, "lastChunk":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_3

    .line 55
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;

    .line 56
    .local v4, "chunk":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;
    if-nez v2, :cond_0

    .line 57
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v3, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;->putCharsWithIndex(Ljava/lang/CharSequence;ILjava/util/Map;Ljava/lang/StringBuilder;)V

    goto :goto_1

    .line 59
    :cond_0
    invoke-virtual {v4, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;->sameLine(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 61
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;->getLocation()Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    move-result-object v5

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;->getLocation()Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->isAtWordBoundary(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;->getText()Ljava/lang/String;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 62
    const/16 v5, 0x20

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 64
    :cond_1
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v3, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;->putCharsWithIndex(Ljava/lang/CharSequence;ILjava/util/Map;Ljava/lang/StringBuilder;)V

    goto :goto_1

    .line 67
    :cond_2
    const/16 v5, 0xa

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 68
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v3, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;->putCharsWithIndex(Ljava/lang/CharSequence;ILjava/util/Map;Ljava/lang/StringBuilder;)V

    .line 71
    :goto_1
    move-object v2, v4

    .line 54
    .end local v4    # "chunk":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 73
    .end local v3    # "i":I
    :cond_3
    new-instance v3, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo$StringConversionInfo;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo$StringConversionInfo;-><init>()V

    .line 74
    .local v3, "ret":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo$StringConversionInfo;
    iput-object v0, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo$StringConversionInfo;->indexMap:Ljava/util/Map;

    .line 75
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo$StringConversionInfo;->text:Ljava/lang/String;

    .line 76
    return-object v3
.end method

.method private static putCharsWithIndex(Ljava/lang/CharSequence;ILjava/util/Map;Ljava/lang/StringBuilder;)V
    .locals 4
    .param p0, "seq"    # Ljava/lang/CharSequence;
    .param p1, "index"    # I
    .param p3, "sb"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "I",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/StringBuilder;",
            ")V"
        }
    .end annotation

    .line 80
    .local p2, "indexMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 81
    .local v0, "charCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 82
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {p2, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 81
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 85
    .end local v1    # "i":I
    :cond_0
    return-void
.end method


# virtual methods
.method public getBoundingBox()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;->boundingBox:Lcom/itextpdf/kernel/geom/Rectangle;

    return-object v0
.end method
