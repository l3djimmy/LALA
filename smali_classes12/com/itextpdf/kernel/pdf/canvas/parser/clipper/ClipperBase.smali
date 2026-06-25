.class public abstract Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;
.super Ljava/lang/Object;
.source "ClipperBase.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;,
        Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;
    }
.end annotation


# static fields
.field private static final HI_RANGE:J = 0x3fffffffffffffffL

.field private static final LOGGER:Ljava/util/logging/Logger;

.field private static final LOW_RANGE:J = 0x3fffffffL


# instance fields
.field protected currentLM:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

.field private final edges:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;",
            ">;>;"
        }
    .end annotation
.end field

.field protected hasOpenPaths:Z

.field protected minimaList:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

.field protected final preserveCollinear:Z

.field protected useFullRange:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 109
    const-class v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->LOGGER:Ljava/util/logging/Logger;

    return-void
.end method

.method protected constructor <init>(Z)V
    .locals 1
    .param p1, "preserveCollinear"    # Z

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    iput-boolean p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->preserveCollinear:Z

    .line 114
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->minimaList:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    .line 115
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->currentLM:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    .line 116
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->hasOpenPaths:Z

    .line 117
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->edges:Ljava/util/List;

    .line 118
    return-void
.end method

.method private disposeLocalMinimaList()V
    .locals 2

    .line 336
    nop

    :goto_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->minimaList:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 337
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->minimaList:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    .line 338
    .local v0, "tmpLm":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;
    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->minimaList:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    .line 339
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->minimaList:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    .line 340
    .end local v0    # "tmpLm":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;
    goto :goto_0

    .line 341
    :cond_0
    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->currentLM:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    .line 342
    return-void
.end method

.method private static initEdge(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V
    .locals 1
    .param p0, "e"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p1, "eNext"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p2, "ePrev"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p3, "pt"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 54
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 55
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 56
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-direct {v0, p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->setCurrent(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 57
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 58
    return-void
.end method

.method private static initEdge2(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;)V
    .locals 4
    .param p0, "e"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p1, "polyType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    .line 61
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v0

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    .line 62
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->setBot(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 63
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->setTop(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    goto :goto_0

    .line 66
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->setTop(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 67
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->setBot(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 69
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->updateDeltaX()V

    .line 70
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    .line 71
    return-void
.end method

.method private insertLocalMinima(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;)V
    .locals 5
    .param p1, "newLm"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    .line 345
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->minimaList:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    if-nez v0, :cond_0

    .line 346
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->minimaList:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    goto :goto_1

    .line 348
    :cond_0
    iget-wide v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->y:J

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->minimaList:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    iget-wide v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->y:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    .line 349
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->minimaList:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    iput-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    .line 350
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->minimaList:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    goto :goto_1

    .line 353
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->minimaList:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    .line 354
    .local v0, "tmpLm":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;
    :goto_0
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    if-eqz v1, :cond_2

    iget-wide v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->y:J

    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    iget-wide v3, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->y:J

    cmp-long v1, v1, v3

    if-gez v1, :cond_2

    .line 355
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    goto :goto_0

    .line 357
    :cond_2
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    iput-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    .line 358
    iput-object p1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    .line 360
    .end local v0    # "tmpLm":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;
    :goto_1
    return-void
.end method

.method protected static parseFirstLeft(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    .locals 1
    .param p0, "FirstLeft"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 501
    nop

    :goto_0
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v0

    if-nez v0, :cond_0

    .line 502
    iget-object p0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    goto :goto_0

    .line 503
    :cond_0
    return-object p0
.end method

.method private processBound(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .locals 9
    .param p1, "e"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p2, "LeftBoundIsForward"    # Z

    .line 375
    move-object v0, p1

    .line 378
    .local v0, "result":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    const-wide v2, -0x381006cc38732053L    # -3.4E38

    const/4 v4, -0x2

    if-ne v1, v4, :cond_7

    .line 381
    move-object p1, v0

    .line 382
    if-eqz p2, :cond_1

    .line 383
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v4

    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v6

    cmp-long v1, v4, v6

    if-nez v1, :cond_0

    .line 384
    iget-object p1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_0

    .line 386
    :cond_0
    :goto_1
    if-eq p1, v0, :cond_3

    iget-wide v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    cmpl-double v1, v4, v2

    if-nez v1, :cond_3

    .line 387
    iget-object p1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_1

    .line 391
    :cond_1
    :goto_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v4

    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v6

    cmp-long v1, v4, v6

    if-nez v1, :cond_2

    .line 392
    iget-object p1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_2

    .line 394
    :cond_2
    :goto_3
    if-eq p1, v0, :cond_3

    iget-wide v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    cmpl-double v1, v4, v2

    if-nez v1, :cond_3

    .line 395
    iget-object p1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_3

    .line 398
    :cond_3
    if-ne p1, v0, :cond_5

    .line 399
    if-eqz p2, :cond_4

    .line 400
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_5

    .line 403
    :cond_4
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_5

    .line 408
    :cond_5
    if-eqz p2, :cond_6

    .line 409
    iget-object p1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_4

    .line 412
    :cond_6
    iget-object p1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 414
    :goto_4
    new-instance v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    invoke-direct {v1, p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;)V

    .line 415
    .local v1, "locMin":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;
    const/4 v2, 0x0

    iput-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    .line 416
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v3

    iput-wide v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->y:J

    .line 417
    iput-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->leftBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 418
    iput-object p1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->rightBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 419
    const/4 v2, 0x0

    iput v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    .line 420
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->processBound(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    move-result-object v0

    .line 421
    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->insertLocalMinima(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;)V

    .line 423
    .end local v1    # "locMin":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;
    :goto_5
    return-object v0

    .line 426
    :cond_7
    iget-wide v5, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    cmpl-double v1, v5, v2

    if-nez v1, :cond_a

    .line 430
    if-eqz p2, :cond_8

    .line 431
    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .local v1, "EStart":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    goto :goto_6

    .line 434
    .end local v1    # "EStart":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :cond_8
    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 436
    .restart local v1    # "EStart":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_6
    iget-wide v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    cmpl-double v5, v5, v2

    if-nez v5, :cond_9

    .line 438
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-eqz v5, :cond_a

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-eqz v5, :cond_a

    .line 439
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->reverseHorizontal()V

    goto :goto_7

    .line 441
    :cond_9
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-eqz v5, :cond_a

    .line 442
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->reverseHorizontal()V

    .line 445
    .end local v1    # "EStart":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :cond_a
    :goto_7
    move-object v1, p1

    .line 446
    .restart local v1    # "EStart":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    if-eqz p2, :cond_11

    .line 447
    :goto_8
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v5

    iget-object v7, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-nez v5, :cond_b

    iget-object v5, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget v5, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-eq v5, v4, :cond_b

    .line 448
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_8

    .line 450
    :cond_b
    iget-wide v5, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    cmpl-double v5, v5, v2

    if-nez v5, :cond_d

    iget-object v5, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget v5, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-eq v5, v4, :cond_d

    .line 454
    move-object v4, v0

    .line 455
    .local v4, "Horz":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_9
    iget-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-wide v5, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    cmpl-double v5, v5, v2

    if-nez v5, :cond_c

    .line 456
    iget-object v4, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_9

    .line 458
    :cond_c
    iget-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    iget-object v7, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-lez v5, :cond_d

    iget-object v0, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 460
    .end local v4    # "Horz":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :cond_d
    :goto_a
    if-eq p1, v0, :cond_f

    .line 461
    iget-object v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 462
    iget-wide v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    cmpl-double v4, v4, v2

    if-nez v4, :cond_e

    if-eq p1, v1, :cond_e

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v4

    iget-object v6, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-eqz v4, :cond_e

    .line 463
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->reverseHorizontal()V

    .line 465
    :cond_e
    iget-object p1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_a

    .line 467
    :cond_f
    iget-wide v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    cmpl-double v2, v4, v2

    if-nez v2, :cond_10

    if-eq p1, v1, :cond_10

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v2

    iget-object v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-eqz v2, :cond_10

    .line 468
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->reverseHorizontal()V

    .line 470
    :cond_10
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto/16 :goto_e

    .line 473
    :cond_11
    :goto_b
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v5

    iget-object v7, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-nez v5, :cond_12

    iget-object v5, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget v5, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-eq v5, v4, :cond_12

    .line 474
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_b

    .line 476
    :cond_12
    iget-wide v5, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    cmpl-double v5, v5, v2

    if-nez v5, :cond_15

    iget-object v5, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget v5, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-eq v5, v4, :cond_15

    .line 477
    move-object v4, v0

    .line 478
    .restart local v4    # "Horz":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_c
    iget-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-wide v5, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    cmpl-double v5, v5, v2

    if-nez v5, :cond_13

    .line 479
    iget-object v4, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_c

    .line 481
    :cond_13
    iget-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    iget-object v7, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-eqz v5, :cond_14

    iget-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 482
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    iget-object v7, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-lez v5, :cond_15

    :cond_14
    iget-object v0, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 485
    .end local v4    # "Horz":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :cond_15
    :goto_d
    if-eq p1, v0, :cond_17

    .line 486
    iget-object v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 487
    iget-wide v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    cmpl-double v4, v4, v2

    if-nez v4, :cond_16

    if-eq p1, v1, :cond_16

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v4

    iget-object v6, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-eqz v4, :cond_16

    .line 488
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->reverseHorizontal()V

    .line 490
    :cond_16
    iget-object p1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_d

    .line 492
    :cond_17
    iget-wide v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    cmpl-double v2, v4, v2

    if-nez v2, :cond_18

    if-eq p1, v1, :cond_18

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v2

    iget-object v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-eqz v2, :cond_18

    .line 493
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->reverseHorizontal()V

    .line 495
    :cond_18
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 497
    :goto_e
    return-object v0
.end method

.method private static rangeTest(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Z)Z
    .locals 4
    .param p0, "Pt"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    .param p1, "useFullRange"    # Z

    .line 74
    if-eqz p1, :cond_1

    .line 75
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v0

    const-wide v2, 0x3fffffffffffffffL    # 1.9999999999999998

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v0

    neg-long v0, v0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v0

    neg-long v0, v0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    goto :goto_0

    .line 76
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperException;

    const-string v1, "Coordinate outside allowed range."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 77
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v0

    const-wide/32 v2, 0x3fffffff

    cmp-long v0, v0, v2

    if-gtz v0, :cond_3

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_3

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v0

    neg-long v0, v0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_3

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v0

    neg-long v0, v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_2

    goto :goto_1

    .line 81
    :cond_2
    :goto_0
    return p1

    .line 78
    :cond_3
    :goto_1
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->rangeTest(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Z)Z

    move-result v0

    return v0
.end method

.method private static removeEdge(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .locals 2
    .param p0, "e"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 86
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 87
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 88
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 89
    .local v0, "result":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 90
    return-object v0
.end method


# virtual methods
.method public addPath(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;Z)Z
    .locals 20
    .param p1, "pg"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    .param p2, "polyType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;
    .param p3, "Closed"    # Z

    .line 122
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    if-nez p3, :cond_1

    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->CLIP:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    if-eq v2, v3, :cond_0

    goto :goto_0

    .line 123
    :cond_0
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "AddPath: Open paths must be subject."

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 126
    :cond_1
    :goto_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->size()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    .line 127
    .local v3, "highI":I
    const/4 v5, 0x0

    if-eqz p3, :cond_2

    .line 128
    :goto_1
    if-lez v3, :cond_2

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v1, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 129
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 132
    :cond_2
    :goto_2
    if-lez v3, :cond_3

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    add-int/lit8 v7, v3, -0x1

    invoke-virtual {v1, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 133
    add-int/lit8 v3, v3, -0x1

    goto :goto_2

    .line 135
    :cond_3
    if-eqz p3, :cond_4

    const/4 v6, 0x2

    if-lt v3, v6, :cond_5

    :cond_4
    if-nez p3, :cond_6

    if-ge v3, v4, :cond_6

    .line 136
    :cond_5
    return v5

    .line 140
    :cond_6
    new-instance v6, Ljava/util/ArrayList;

    add-int/lit8 v7, v3, 0x1

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 141
    .local v6, "edges":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;>;"
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_3
    if-gt v7, v3, :cond_7

    .line 142
    new-instance v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-direct {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;-><init>()V

    invoke-interface {v6, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 145
    .end local v7    # "i":I
    :cond_7
    const/4 v7, 0x1

    .line 148
    .local v7, "IsFlat":Z
    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    new-instance v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-direct {v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    invoke-virtual {v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->setCurrent(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 149
    invoke-virtual {v1, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-boolean v9, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->useFullRange:Z

    invoke-static {v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->rangeTest(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Z)Z

    move-result v8

    iput-boolean v8, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->useFullRange:Z

    .line 150
    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-boolean v9, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->useFullRange:Z

    invoke-static {v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->rangeTest(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Z)Z

    move-result v8

    iput-boolean v8, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->useFullRange:Z

    .line 151
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v1, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-static {v8, v9, v10, v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->initEdge(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 152
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    add-int/lit8 v10, v3, -0x1

    invoke-interface {v6, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-static {v8, v9, v10, v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->initEdge(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 153
    add-int/lit8 v8, v3, -0x1

    .local v8, "i":I
    :goto_4
    if-lt v8, v4, :cond_8

    .line 154
    invoke-virtual {v1, v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-boolean v10, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->useFullRange:Z

    invoke-static {v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->rangeTest(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Z)Z

    move-result v9

    iput-boolean v9, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->useFullRange:Z

    .line 155
    invoke-interface {v6, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    add-int/lit8 v10, v8, 0x1

    invoke-interface {v6, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    add-int/lit8 v11, v8, -0x1

    invoke-interface {v6, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v1, v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-static {v9, v10, v11, v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->initEdge(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 153
    add-int/lit8 v8, v8, -0x1

    goto :goto_4

    .line 157
    .end local v8    # "i":I
    :cond_8
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 160
    .local v8, "eStart":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    move-object v9, v8

    .local v9, "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    move-object v10, v8

    .line 163
    .local v10, "eLoopStop":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :cond_9
    :goto_5
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v11

    iget-object v12, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_d

    if-nez p3, :cond_a

    iget-object v11, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v11, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_d

    .line 164
    :cond_a
    iget-object v11, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-ne v9, v11, :cond_b

    .line 165
    goto :goto_6

    .line 167
    :cond_b
    if-ne v9, v8, :cond_c

    .line 168
    iget-object v8, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 170
    :cond_c
    invoke-static {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->removeEdge(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    move-result-object v9

    .line 171
    move-object v10, v9

    .line 172
    goto :goto_5

    .line 174
    :cond_d
    iget-object v11, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v12, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-ne v11, v12, :cond_e

    .line 175
    goto :goto_6

    .line 177
    :cond_e
    if-eqz p3, :cond_11

    iget-object v11, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v11

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v12

    iget-object v13, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v13

    iget-boolean v14, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->useFullRange:Z

    invoke-static {v11, v12, v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;->slopesEqual(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Z)Z

    move-result v11

    if-eqz v11, :cond_11

    .line 178
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->isPreserveCollinear()Z

    move-result v11

    if-eqz v11, :cond_f

    iget-object v11, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v11

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v12

    iget-object v13, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v13

    invoke-static {v11, v12, v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;->isPt2BetweenPt1AndPt3(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Z

    move-result v11

    if-nez v11, :cond_11

    .line 183
    :cond_f
    if-ne v9, v8, :cond_10

    .line 184
    iget-object v8, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 186
    :cond_10
    invoke-static {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->removeEdge(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    move-result-object v9

    .line 187
    iget-object v9, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 188
    move-object v10, v9

    .line 189
    goto :goto_5

    .line 191
    :cond_11
    iget-object v9, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 192
    if-eq v9, v10, :cond_12

    if-nez p3, :cond_9

    iget-object v11, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-ne v11, v8, :cond_9

    .line 193
    nop

    .line 197
    :cond_12
    :goto_6
    if-nez p3, :cond_13

    iget-object v11, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eq v9, v11, :cond_14

    :cond_13
    if-eqz p3, :cond_15

    iget-object v11, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v12, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-ne v11, v12, :cond_15

    .line 198
    :cond_14
    return v5

    .line 201
    :cond_15
    const/4 v11, -0x2

    if-nez p3, :cond_16

    .line 202
    iput-boolean v4, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->hasOpenPaths:Z

    .line 203
    iget-object v12, v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput v11, v12, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 207
    :cond_16
    move-object v9, v8

    .line 209
    :goto_7
    invoke-static {v9, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->initEdge2(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;)V

    .line 210
    iget-object v9, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 211
    if-eqz v7, :cond_17

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v12

    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v12

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v14

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v14

    cmp-long v12, v12, v14

    if-eqz v12, :cond_17

    .line 212
    const/4 v7, 0x0

    .line 215
    :cond_17
    if-ne v9, v8, :cond_27

    .line 221
    const/4 v12, 0x0

    if-eqz v7, :cond_1b

    .line 222
    if-eqz p3, :cond_18

    .line 223
    return v5

    .line 225
    :cond_18
    iget-object v13, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput v11, v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 226
    new-instance v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    invoke-direct {v13, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;)V

    .line 227
    .local v13, "locMin":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;
    iput-object v12, v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    .line 228
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v14

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v14

    iput-wide v14, v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->y:J

    .line 229
    iput-object v12, v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->leftBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 230
    iput-object v9, v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->rightBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 231
    iget-object v12, v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->rightBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    sget-object v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    iput-object v14, v12, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    .line 232
    iget-object v12, v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->rightBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput v5, v12, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    .line 235
    :goto_8
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v14

    iget-object v5, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v16

    cmp-long v5, v14, v16

    if-eqz v5, :cond_19

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->reverseHorizontal()V

    .line 236
    :cond_19
    iget-object v5, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget v5, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ne v5, v11, :cond_1a

    .line 240
    invoke-direct {v0, v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->insertLocalMinima(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;)V

    .line 241
    iget-object v5, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->edges:Ljava/util/List;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    return v4

    .line 237
    :cond_1a
    iget-object v5, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v5, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 238
    iget-object v9, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_8

    .line 245
    .end local v13    # "locMin":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;
    :cond_1b
    iget-object v13, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->edges:Ljava/util/List;

    invoke-interface {v13, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 247
    const/4 v13, 0x0

    .line 251
    .local v13, "EMin":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget-object v14, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v14

    iget-object v15, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v15}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v15

    invoke-virtual {v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_1c

    .line 252
    iget-object v9, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 256
    :cond_1c
    :goto_9
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->findNextLocMin()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    move-result-object v9

    .line 257
    if-ne v9, v13, :cond_1d

    .line 258
    nop

    .line 314
    return v4

    .line 260
    :cond_1d
    if-nez v13, :cond_1e

    .line 261
    move-object v13, v9

    .line 266
    :cond_1e
    new-instance v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    invoke-direct {v14, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;)V

    .line 267
    .local v14, "locMin":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;
    iput-object v12, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    .line 268
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v15

    move-object/from16 v17, v13

    .end local v13    # "EMin":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v17, "EMin":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    invoke-virtual {v15}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v12

    iput-wide v12, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->y:J

    .line 269
    iget-wide v12, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    iget-object v15, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    move-wide/from16 v18, v12

    iget-wide v11, v15, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    cmpg-double v11, v18, v11

    if-gez v11, :cond_1f

    .line 270
    iget-object v11, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v11, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->leftBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 271
    iput-object v9, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->rightBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 272
    const/4 v11, 0x0

    .local v11, "leftBoundIsForward":Z
    goto :goto_a

    .line 275
    .end local v11    # "leftBoundIsForward":Z
    :cond_1f
    iput-object v9, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->leftBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 276
    iget-object v11, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v11, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->rightBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 277
    const/4 v11, 0x1

    .line 279
    .restart local v11    # "leftBoundIsForward":Z
    :goto_a
    iget-object v12, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->leftBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    sget-object v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->LEFT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    iput-object v13, v12, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    .line 280
    iget-object v12, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->rightBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    sget-object v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    iput-object v13, v12, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    .line 282
    if-nez p3, :cond_20

    .line 283
    iget-object v12, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->leftBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput v5, v12, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    goto :goto_b

    .line 285
    :cond_20
    iget-object v12, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->leftBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v12, v12, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v13, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->rightBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-ne v12, v13, :cond_21

    .line 286
    iget-object v12, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->leftBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    const/4 v13, -0x1

    iput v13, v12, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    goto :goto_b

    .line 289
    :cond_21
    iget-object v12, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->leftBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput v4, v12, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    .line 291
    :goto_b
    iget-object v12, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->rightBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v13, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->leftBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget v13, v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    neg-int v13, v13

    iput v13, v12, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    .line 293
    iget-object v12, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->leftBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-direct {v0, v12, v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->processBound(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    move-result-object v9

    .line 294
    iget v12, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    const/4 v13, -0x2

    if-ne v12, v13, :cond_22

    .line 295
    invoke-direct {v0, v9, v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->processBound(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    move-result-object v9

    .line 298
    :cond_22
    iget-object v12, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->rightBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    xor-int/lit8 v13, v11, 0x1

    invoke-direct {v0, v12, v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->processBound(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    move-result-object v12

    .line 299
    .local v12, "E2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget v13, v12, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    const/4 v15, -0x2

    if-ne v13, v15, :cond_23

    .line 300
    xor-int/lit8 v13, v11, 0x1

    invoke-direct {v0, v12, v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->processBound(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    move-result-object v12

    .line 303
    :cond_23
    iget-object v13, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->leftBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget v13, v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    const/4 v15, -0x2

    if-ne v13, v15, :cond_24

    .line 304
    const/4 v13, 0x0

    iput-object v13, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->leftBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_c

    .line 306
    :cond_24
    const/4 v13, 0x0

    iget-object v4, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->rightBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget v4, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ne v4, v15, :cond_25

    .line 307
    iput-object v13, v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->rightBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 309
    :cond_25
    :goto_c
    invoke-direct {v0, v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->insertLocalMinima(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;)V

    .line 310
    if-nez v11, :cond_26

    .line 311
    move-object v4, v12

    move-object v9, v4

    .line 313
    .end local v12    # "E2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v14    # "locMin":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;
    :cond_26
    move-object v12, v13

    move v11, v15

    move-object/from16 v13, v17

    const/4 v4, 0x1

    goto/16 :goto_9

    .line 215
    .end local v11    # "leftBoundIsForward":Z
    .end local v17    # "EMin":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :cond_27
    move v15, v11

    const/4 v4, 0x1

    goto/16 :goto_7
.end method

.method public addPaths(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;Z)Z
    .locals 3
    .param p1, "ppg"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    .param p2, "polyType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;
    .param p3, "closed"    # Z

    .line 319
    const/4 v0, 0x0

    .line 320
    .local v0, "result":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 321
    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    invoke-virtual {p0, v2, p2, p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->addPath(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 322
    const/4 v0, 0x1

    .line 320
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 325
    .end local v1    # "i":I
    :cond_1
    return v0
.end method

.method public clear()V
    .locals 1

    .line 329
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->disposeLocalMinimaList()V

    .line 330
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->edges:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 331
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->useFullRange:Z

    .line 332
    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->hasOpenPaths:Z

    .line 333
    return-void
.end method

.method public isPreserveCollinear()Z
    .locals 1

    .line 363
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->preserveCollinear:Z

    return v0
.end method

.method protected popLocalMinima()V
    .locals 3

    .line 367
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->LOGGER:Ljava/util/logging/Logger;

    const-class v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "popLocalMinima"

    invoke-virtual {v0, v1, v2}, Ljava/util/logging/Logger;->entering(Ljava/lang/String;Ljava/lang/String;)V

    .line 368
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->currentLM:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    if-nez v0, :cond_0

    .line 369
    return-void

    .line 371
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->currentLM:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->currentLM:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    .line 372
    return-void
.end method

.method protected reset()V
    .locals 5

    .line 507
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->minimaList:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->currentLM:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    .line 508
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->currentLM:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    if-nez v0, :cond_0

    .line 509
    return-void

    .line 513
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->minimaList:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    .line 514
    .local v0, "lm":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;
    :goto_0
    if-eqz v0, :cond_3

    .line 515
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->leftBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 516
    .local v1, "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    const/4 v2, -0x1

    if-eqz v1, :cond_1

    .line 517
    new-instance v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->setCurrent(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 518
    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->LEFT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    iput-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    .line 519
    iput v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 521
    :cond_1
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->rightBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 522
    if-eqz v1, :cond_2

    .line 523
    new-instance v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->setCurrent(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 524
    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    iput-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    .line 525
    iput v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 527
    :cond_2
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    .line 528
    .end local v1    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    goto :goto_0

    .line 529
    :cond_3
    return-void
.end method
