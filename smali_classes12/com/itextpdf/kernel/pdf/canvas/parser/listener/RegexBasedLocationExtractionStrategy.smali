.class public Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy;
.super Ljava/lang/Object;
.source "RegexBasedLocationExtractionStrategy.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ILocationExtractionStrategy;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy$PdfTextLocationComparator;
    }
.end annotation


# static fields
.field private static final EPS:F = 1.0E-4f


# instance fields
.field private parseResult:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;",
            ">;"
        }
    .end annotation
.end field

.field private pattern:Ljava/util/regex/Pattern;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "regex"    # Ljava/lang/String;

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy;->parseResult:Ljava/util/List;

    .line 50
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy;->pattern:Ljava/util/regex/Pattern;

    .line 51
    return-void
.end method

.method public constructor <init>(Ljava/util/regex/Pattern;)V
    .locals 1
    .param p1, "pattern"    # Ljava/util/regex/Pattern;

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy;->parseResult:Ljava/util/List;

    .line 54
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy;->pattern:Ljava/util/regex/Pattern;

    .line 55
    return-void
.end method

.method private static getEndIndex(Ljava/util/Map;I)Ljava/lang/Integer;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;I)",
            "Ljava/lang/Integer;"
        }
    .end annotation

    .line 181
    .local p0, "indexMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    nop

    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    if-ltz p1, :cond_0

    .line 182
    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    .line 184
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    return-object v0
.end method

.method private static getStartIndex(Ljava/util/Map;ILjava/lang/String;)Ljava/lang/Integer;
    .locals 1
    .param p1, "index"    # I
    .param p2, "txt"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;I",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Integer;"
        }
    .end annotation

    .line 174
    .local p0, "indexMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    nop

    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 175
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 177
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    return-object v0
.end method

.method private removeDuplicates(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;",
            ">;)V"
        }
    .end annotation

    .line 92
    .local p1, "sortedList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;>;"
    const/4 v0, 0x0

    .line 93
    .local v0, "lastItem":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    .line 94
    .local v1, "orgSize":I
    add-int/lit8 v2, v1, -0x1

    .local v2, "i":I
    :goto_0
    if-ltz v2, :cond_1

    .line 95
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;

    .line 96
    .local v3, "currItem":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;
    invoke-interface {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v4

    .line 97
    .local v4, "currRect":Lcom/itextpdf/kernel/geom/Rectangle;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;->getRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/geom/Rectangle;->equalsWithEpsilon(Lcom/itextpdf/kernel/geom/Rectangle;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 98
    invoke-interface {p1, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 100
    :cond_0
    move-object v0, v3

    .line 94
    .end local v3    # "currItem":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;
    .end local v4    # "currRect":Lcom/itextpdf/kernel/geom/Rectangle;
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 102
    .end local v2    # "i":I
    :cond_1
    return-void
.end method


# virtual methods
.method public eventOccurred(Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;)V
    .locals 2
    .param p1, "data"    # Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;
    .param p2, "type"    # Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;

    .line 106
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;

    if-eqz v0, :cond_0

    .line 107
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy;->parseResult:Ljava/util/List;

    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy;->toCRI(Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 109
    :cond_0
    return-void
.end method

.method public getResultantLocations()Ljava/util/Collection;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;",
            ">;"
        }
    .end annotation

    .line 60
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy;->parseResult:Ljava/util/List;

    new-instance v1, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationBasedComparator;

    new-instance v2, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/DefaultTextChunkLocationComparator;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/DefaultTextChunkLocationComparator;-><init>()V

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationBasedComparator;-><init>(Ljava/util/Comparator;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 65
    .local v0, "retval":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IPdfTextLocation;>;"
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy;->parseResult:Ljava/util/List;

    invoke-static {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;->mapString(Ljava/util/List;)Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo$StringConversionInfo;

    move-result-object v1

    .line 67
    .local v1, "txt":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo$StringConversionInfo;
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy;->pattern:Ljava/util/regex/Pattern;

    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo$StringConversionInfo;->text:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 68
    .local v2, "mat":Ljava/util/regex/Matcher;
    :goto_0
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 69
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo$StringConversionInfo;->indexMap:Ljava/util/Map;

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->start()I

    move-result v4

    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo$StringConversionInfo;->text:Ljava/lang/String;

    invoke-static {v3, v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy;->getStartIndex(Ljava/util/Map;ILjava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    .line 70
    .local v3, "startIndex":Ljava/lang/Integer;
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo$StringConversionInfo;->indexMap:Ljava/util/Map;

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->end()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-static {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy;->getEndIndex(Ljava/util/Map;I)Ljava/lang/Integer;

    move-result-object v4

    .line 71
    .local v4, "endIndex":Ljava/lang/Integer;
    if-eqz v3, :cond_0

    if-eqz v4, :cond_0

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-gt v5, v6, :cond_0

    .line 72
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy;->parseResult:Ljava/util/List;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-interface {v5, v6, v7}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy;->toRectangles(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/geom/Rectangle;

    .line 73
    .local v6, "r":Lcom/itextpdf/kernel/geom/Rectangle;
    new-instance v7, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/DefaultPdfTextLocation;

    const/4 v8, 0x0

    invoke-virtual {v2, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v8, v6, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/DefaultPdfTextLocation;-><init>(ILcom/itextpdf/kernel/geom/Rectangle;Ljava/lang/String;)V

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    .end local v6    # "r":Lcom/itextpdf/kernel/geom/Rectangle;
    goto :goto_1

    .line 76
    .end local v3    # "startIndex":Ljava/lang/Integer;
    .end local v4    # "endIndex":Ljava/lang/Integer;
    :cond_0
    goto :goto_0

    .line 83
    :cond_1
    new-instance v3, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy$PdfTextLocationComparator;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy$PdfTextLocationComparator;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy$1;)V

    invoke-static {v0, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 86
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/RegexBasedLocationExtractionStrategy;->removeDuplicates(Ljava/util/List;)V

    .line 88
    return-object v0
.end method

.method public getSupportedEvents()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;",
            ">;"
        }
    .end annotation

    .line 113
    const/4 v0, 0x0

    return-object v0
.end method

.method protected toCRI(Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;)Ljava/util/List;
    .locals 4
    .param p1, "tri"    # Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;",
            ">;"
        }
    .end annotation

    .line 128
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 129
    .local v0, "cris":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;>;"
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getCharacterRenderInfos()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;

    .line 130
    .local v2, "subTri":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    new-instance v3, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;

    invoke-direct {v3, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    .end local v2    # "subTri":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    goto :goto_0

    .line 132
    :cond_0
    return-object v0
.end method

.method protected toRectangles(Ljava/util/List;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/geom/Rectangle;",
            ">;"
        }
    .end annotation

    .line 149
    .local p1, "cris":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 150
    .local v0, "retval":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/geom/Rectangle;>;"
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 151
    return-object v0

    .line 153
    :cond_0
    const/4 v1, 0x0

    .line 154
    .local v1, "prev":I
    const/4 v2, 0x0

    .line 155
    .local v2, "curr":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 156
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;->sameLine(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 157
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 159
    :cond_1
    const/4 v3, 0x0

    .line 160
    .local v3, "resultRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-interface {p1, v1, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;

    .line 162
    .local v5, "cri":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;
    const/4 v6, 0x2

    new-array v6, v6, [Lcom/itextpdf/kernel/geom/Rectangle;

    const/4 v7, 0x0

    aput-object v3, v6, v7

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;->getBoundingBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v7

    const/4 v8, 0x1

    aput-object v7, v6, v8

    invoke-static {v6}, Lcom/itextpdf/kernel/geom/Rectangle;->getCommonRectangle([Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v3

    .line 163
    .end local v5    # "cri":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/CharacterRenderInfo;
    goto :goto_2

    .line 164
    :cond_2
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    move v1, v2

    .line 166
    .end local v3    # "resultRectangle":Lcom/itextpdf/kernel/geom/Rectangle;
    goto :goto_0

    .line 169
    :cond_3
    return-object v0
.end method
