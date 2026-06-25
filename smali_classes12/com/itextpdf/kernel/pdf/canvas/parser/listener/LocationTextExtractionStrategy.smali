.class public Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;
.super Ljava/lang/Object;
.source "LocationTextExtractionStrategy.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextExtractionStrategy;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$ITextChunkLocationStrategyImpl;,
        Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;,
        Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$ITextChunkLocationStrategy;
    }
.end annotation


# static fields
.field private static DUMP_STATE:Z


# instance fields
.field private lastTextRenderInfo:Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;

.field private final locationalResult:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;",
            ">;"
        }
    .end annotation
.end field

.field private rightToLeftRunDirection:Z

.field private final tclStrat:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$ITextChunkLocationStrategy;

.field private useActualText:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 45
    const/4 v0, 0x0

    sput-boolean v0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->DUMP_STATE:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 64
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$ITextChunkLocationStrategyImpl;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$ITextChunkLocationStrategyImpl;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$1;)V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$ITextChunkLocationStrategy;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$ITextChunkLocationStrategy;)V
    .locals 1
    .param p1, "strat"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$ITextChunkLocationStrategy;

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->locationalResult:Ljava/util/List;

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->useActualText:Z

    .line 56
    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->rightToLeftRunDirection:Z

    .line 75
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->tclStrat:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$ITextChunkLocationStrategy;

    .line 76
    return-void
.end method

.method private dumpState()V
    .locals 3

    .line 231
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->locationalResult:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;

    .line 232
    .local v1, "location":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->printDiagnostics()V

    .line 233
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2}, Ljava/io/PrintStream;->println()V

    .line 234
    .end local v1    # "location":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;
    goto :goto_0

    .line 235
    :cond_0
    return-void
.end method

.method private endsWithSpace(Ljava/lang/String;)Z
    .locals 3
    .param p1, "str"    # Ljava/lang/String;

    .line 224
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x20

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private findLastTagWithActualText(Ljava/util/List;)Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;",
            ">;)",
            "Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;"
        }
    .end annotation

    .line 238
    .local p1, "canvasTagHierarchy":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;>;"
    const/4 v0, 0x0

    .line 239
    .local v0, "lastActualText":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;

    .line 240
    .local v2, "tag":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->getActualText()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 241
    move-object v0, v2

    .line 242
    goto :goto_1

    .line 244
    .end local v2    # "tag":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    :cond_0
    goto :goto_0

    .line 245
    :cond_1
    :goto_1
    return-object v0
.end method

.method private sortWithMarks(Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;",
            ">;)V"
        }
    .end annotation

    .line 249
    .local p1, "textChunks":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 250
    .local v0, "marks":Ljava/util/Map;, "Ljava/util/Map<Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 252
    .local v1, "toSort":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;>;"
    const/4 v2, 0x0

    .local v2, "markInd":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_6

    .line 253
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->getLocation()Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    move-result-object v3

    .line 254
    .local v3, "location":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;
    invoke-interface {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getStartLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v4

    invoke-interface {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getEndLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/geom/Vector;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 255
    const/4 v4, 0x0

    .line 256
    .local v4, "foundBaseToAttachTo":Z
    const/4 v5, 0x0

    .local v5, "baseInd":I
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_3

    .line 257
    if-eq v2, v5, :cond_2

    .line 258
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->getLocation()Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    move-result-object v6

    .line 259
    .local v6, "baseLocation":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;
    invoke-interface {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getStartLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v7

    invoke-interface {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getEndLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/itextpdf/kernel/geom/Vector;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    invoke-static {v6, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationDefaultImp;->containsMark(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 260
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;

    .line 261
    .local v7, "currentMarks":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;
    if-nez v7, :cond_0

    .line 262
    new-instance v8, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;

    const/4 v9, 0x0

    invoke-direct {v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$1;)V

    move-object v7, v8

    .line 263
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v0, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    :cond_0
    if-ge v2, v5, :cond_1

    .line 267
    iget-object v8, v7, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;->preceding:Ljava/util/List;

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 269
    :cond_1
    iget-object v8, v7, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;->succeeding:Ljava/util/List;

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 272
    :goto_2
    const/4 v4, 0x1

    .line 273
    goto :goto_3

    .line 256
    .end local v6    # "baseLocation":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;
    .end local v7    # "currentMarks":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 278
    .end local v5    # "baseInd":I
    :cond_3
    :goto_3
    if-nez v4, :cond_4

    .line 279
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 281
    .end local v4    # "foundBaseToAttachTo":Z
    :cond_4
    goto :goto_4

    .line 282
    :cond_5
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 252
    .end local v3    # "location":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;
    :goto_4
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 286
    .end local v2    # "markInd":I
    :cond_6
    new-instance v2, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationBasedComparator;

    new-instance v3, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/DefaultTextChunkLocationComparator;

    iget-boolean v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->rightToLeftRunDirection:Z

    xor-int/lit8 v4, v4, 0x1

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/DefaultTextChunkLocationComparator;-><init>(Z)V

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunkLocationBasedComparator;-><init>(Ljava/util/Comparator;)V

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 288
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 290
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;

    .line 291
    .local v3, "current":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;

    .line 292
    .local v4, "currentMarks":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;
    if-eqz v4, :cond_9

    .line 293
    iget-boolean v5, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->rightToLeftRunDirection:Z

    if-nez v5, :cond_8

    .line 294
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_6
    iget-object v6, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;->preceding:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_7

    .line 295
    iget-object v6, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;->preceding:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 294
    add-int/lit8 v5, v5, 0x1

    goto :goto_6

    .end local v5    # "j":I
    :cond_7
    goto :goto_8

    .line 298
    :cond_8
    iget-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;->succeeding:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    .restart local v5    # "j":I
    :goto_7
    if-ltz v5, :cond_9

    .line 299
    iget-object v6, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;->succeeding:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 298
    add-int/lit8 v5, v5, -0x1

    goto :goto_7

    .line 303
    .end local v5    # "j":I
    :cond_9
    :goto_8
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 304
    if-eqz v4, :cond_c

    .line 305
    iget-boolean v5, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->rightToLeftRunDirection:Z

    if-nez v5, :cond_b

    .line 306
    const/4 v5, 0x0

    .restart local v5    # "j":I
    :goto_9
    iget-object v6, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;->succeeding:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_a

    .line 307
    iget-object v6, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;->succeeding:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 306
    add-int/lit8 v5, v5, 0x1

    goto :goto_9

    .end local v5    # "j":I
    :cond_a
    goto :goto_b

    .line 310
    :cond_b
    iget-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;->preceding:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    .restart local v5    # "j":I
    :goto_a
    if-ltz v5, :cond_c

    .line 311
    iget-object v6, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;->preceding:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {p1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 310
    add-int/lit8 v5, v5, -0x1

    goto :goto_a

    .line 315
    .end local v3    # "current":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;
    .end local v4    # "currentMarks":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$TextChunkMarks;
    .end local v5    # "j":I
    :cond_c
    :goto_b
    goto :goto_5

    .line 316
    :cond_d
    return-void
.end method

.method private startsWithSpace(Ljava/lang/String;)Z
    .locals 3
    .param p1, "str"    # Ljava/lang/String;

    .line 214
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x20

    if-ne v0, v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method


# virtual methods
.method public eventOccurred(Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;)V
    .locals 12
    .param p1, "data"    # Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;
    .param p2, "type"    # Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;

    .line 116
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;->RENDER_TEXT:Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;

    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 117
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;

    .line 118
    .local v0, "renderInfo":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getBaseline()Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v1

    .line 119
    .local v1, "segment":Lcom/itextpdf/kernel/geom/LineSegment;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getRise()F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_0

    .line 121
    new-instance v2, Lcom/itextpdf/kernel/geom/Matrix;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getRise()F

    move-result v4

    neg-float v4, v4

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/geom/Matrix;-><init>(FF)V

    .line 122
    .local v2, "riseOffsetTransform":Lcom/itextpdf/kernel/geom/Matrix;
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/geom/LineSegment;->transformBy(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v1

    .line 125
    .end local v2    # "riseOffsetTransform":Lcom/itextpdf/kernel/geom/Matrix;
    :cond_0
    iget-boolean v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->useActualText:Z

    if-eqz v2, :cond_4

    .line 126
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->lastTextRenderInfo:Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->lastTextRenderInfo:Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;

    .line 127
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getCanvasTagHierarchy()Ljava/util/List;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->findLastTagWithActualText(Ljava/util/List;)Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;

    move-result-object v2

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    .line 129
    .local v2, "lastTagWithActualText":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    :goto_0
    if-eqz v2, :cond_2

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getCanvasTagHierarchy()Ljava/util/List;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->findLastTagWithActualText(Ljava/util/List;)Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;

    move-result-object v3

    if-ne v2, v3, :cond_2

    .line 131
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->locationalResult:Ljava/util/List;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->locationalResult:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;

    .line 132
    .local v3, "lastTextChunk":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;
    new-instance v4, Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->getLocation()Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    move-result-object v6

    invoke-interface {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getStartLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v6

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/LineSegment;->getStartPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v8

    invoke-virtual {v8, v7}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v8

    invoke-static {v6, v8}, Ljava/lang/Math;->min(FF)F

    move-result v6

    .line 133
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->getLocation()Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    move-result-object v8

    invoke-interface {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getStartLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v8

    invoke-virtual {v8, v5}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v8

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/LineSegment;->getStartPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v9

    invoke-virtual {v9, v5}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->min(FF)F

    move-result v8

    .line 134
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->getLocation()Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    move-result-object v9

    invoke-interface {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getStartLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v9

    const/4 v10, 0x2

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v9

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/LineSegment;->getStartPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v11

    invoke-virtual {v11, v10}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v11

    invoke-static {v9, v11}, Ljava/lang/Math;->min(FF)F

    move-result v9

    invoke-direct {v4, v6, v8, v9}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    .line 135
    .local v4, "mergedStart":Lcom/itextpdf/kernel/geom/Vector;
    new-instance v6, Lcom/itextpdf/kernel/geom/Vector;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->getLocation()Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    move-result-object v8

    invoke-interface {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getEndLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v8

    invoke-virtual {v8, v7}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v8

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/LineSegment;->getEndPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v9

    invoke-virtual {v9, v7}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v7

    invoke-static {v8, v7}, Ljava/lang/Math;->max(FF)F

    move-result v7

    .line 136
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->getLocation()Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    move-result-object v8

    invoke-interface {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getEndLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v8

    invoke-virtual {v8, v5}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v8

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/LineSegment;->getEndPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v9

    invoke-virtual {v9, v5}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->max(FF)F

    move-result v8

    .line 137
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->getLocation()Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    move-result-object v9

    invoke-interface {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->getEndLocation()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v9

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v9

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/LineSegment;->getEndPoint()Lcom/itextpdf/kernel/geom/Vector;

    move-result-object v11

    invoke-virtual {v11, v10}, Lcom/itextpdf/kernel/geom/Vector;->get(I)F

    move-result v10

    invoke-static {v9, v10}, Ljava/lang/Math;->max(FF)F

    move-result v9

    invoke-direct {v6, v7, v8, v9}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    .line 138
    .local v6, "mergedEnd":Lcom/itextpdf/kernel/geom/Vector;
    new-instance v7, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->getText()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->tclStrat:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$ITextChunkLocationStrategy;

    new-instance v10, Lcom/itextpdf/kernel/geom/LineSegment;

    invoke-direct {v10, v4, v6}, Lcom/itextpdf/kernel/geom/LineSegment;-><init>(Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;)V

    invoke-interface {v9, v0, v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$ITextChunkLocationStrategy;->createLocation(Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;Lcom/itextpdf/kernel/geom/LineSegment;)Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;)V

    .line 140
    .local v7, "merged":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;
    iget-object v8, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->locationalResult:Ljava/util/List;

    iget-object v9, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->locationalResult:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    sub-int/2addr v9, v5

    invoke-interface {v8, v9, v7}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 141
    .end local v3    # "lastTextChunk":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;
    .end local v4    # "mergedStart":Lcom/itextpdf/kernel/geom/Vector;
    .end local v6    # "mergedEnd":Lcom/itextpdf/kernel/geom/Vector;
    .end local v7    # "merged":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;
    goto :goto_2

    .line 142
    :cond_2
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getActualText()Ljava/lang/String;

    move-result-object v3

    .line 143
    .local v3, "actualText":Ljava/lang/String;
    new-instance v4, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;

    if-eqz v3, :cond_3

    move-object v5, v3

    goto :goto_1

    :cond_3
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getText()Ljava/lang/String;

    move-result-object v5

    :goto_1
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->tclStrat:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$ITextChunkLocationStrategy;

    .line 144
    invoke-interface {v6, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$ITextChunkLocationStrategy;->createLocation(Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;Lcom/itextpdf/kernel/geom/LineSegment;)Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;)V

    .line 145
    .local v4, "tc":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->locationalResult:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    .end local v2    # "lastTagWithActualText":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    .end local v3    # "actualText":Ljava/lang/String;
    .end local v4    # "tc":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;
    :goto_2
    goto :goto_3

    .line 148
    :cond_4
    new-instance v2, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getText()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->tclStrat:Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$ITextChunkLocationStrategy;

    invoke-interface {v4, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy$ITextChunkLocationStrategy;->createLocation(Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;Lcom/itextpdf/kernel/geom/LineSegment;)Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;)V

    .line 149
    .local v2, "tc":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->locationalResult:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    .end local v2    # "tc":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;
    :goto_3
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->lastTextRenderInfo:Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;

    .line 154
    .end local v0    # "renderInfo":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    .end local v1    # "segment":Lcom/itextpdf/kernel/geom/LineSegment;
    :cond_5
    return-void
.end method

.method public getResultantText()Ljava/lang/String;
    .locals 6

    .line 163
    sget-boolean v0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->DUMP_STATE:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->dumpState()V

    .line 165
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->locationalResult:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 166
    .local v0, "textChunks":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;>;"
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->sortWithMarks(Ljava/util/List;)V

    .line 168
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 169
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 170
    .local v2, "lastChunk":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;

    .line 171
    .local v4, "chunk":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;
    if-nez v2, :cond_1

    .line 172
    iget-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->text:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 174
    :cond_1
    invoke-virtual {v4, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->sameLine(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 176
    invoke-virtual {p0, v4, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->isChunkAtWordBoundary(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->text:Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->startsWithSpace(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    iget-object v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->text:Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->endsWithSpace(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 177
    const/16 v5, 0x20

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 180
    :cond_2
    iget-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->text:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 182
    :cond_3
    const/16 v5, 0xa

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 183
    iget-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->text:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    :goto_1
    move-object v2, v4

    .line 187
    .end local v4    # "chunk":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;
    goto :goto_0

    .line 189
    :cond_4
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
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

    .line 158
    const/4 v0, 0x0

    return-object v0
.end method

.method protected isChunkAtWordBoundary(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;)Z
    .locals 2
    .param p1, "chunk"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;
    .param p2, "previousChunk"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;

    .line 204
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->getLocation()Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    move-result-object v0

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/TextChunk;->getLocation()Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;->isAtWordBoundary(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/ITextChunkLocation;)Z

    move-result v0

    return v0
.end method

.method public isUseActualText()Z
    .locals 1

    .line 111
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->useActualText:Z

    return v0
.end method

.method public setRightToLeftRunDirection(Z)Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;
    .locals 0
    .param p1, "rightToLeftRunDirection"    # Z

    .line 100
    iput-boolean p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->rightToLeftRunDirection:Z

    .line 101
    return-object p0
.end method

.method public setUseActualText(Z)Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;
    .locals 0
    .param p1, "useActualText"    # Z

    .line 87
    iput-boolean p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/LocationTextExtractionStrategy;->useActualText:Z

    .line 88
    return-object p0
.end method
