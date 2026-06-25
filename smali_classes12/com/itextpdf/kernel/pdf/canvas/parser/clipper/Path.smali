.class public Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
.super Ljava/util/ArrayList;
.source "Path.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;,
        Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;,
        Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;,
        Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList<",
        "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 284
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 285
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "cnt"    # I

    .line 295
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 296
    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;",
            ">;)V"
        }
    .end annotation

    .line 299
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<+Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;>;"
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 300
    return-void
.end method

.method public constructor <init>([Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V
    .locals 3
    .param p1, "points"    # [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 288
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;-><init>()V

    .line 289
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 290
    .local v2, "point":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->add(Ljava/lang/Object;)Z

    .line 289
    .end local v2    # "point":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 292
    :cond_0
    return-void
.end method

.method private static excludeOp(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .locals 2
    .param p0, "op"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 272
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 273
    .local v0, "result":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 274
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iput-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 275
    const/4 v1, 0x0

    iput v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->idx:I

    .line 276
    return-object v0
.end method


# virtual methods
.method public TranslatePath(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    .locals 9
    .param p1, "delta"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 436
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->size()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;-><init>(I)V

    .line 437
    .local v0, "outPath":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 438
    new-instance v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    add-long/2addr v3, v5

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v5

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v7

    add-long/2addr v5, v7

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(JJ)V

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->add(Ljava/lang/Object;)Z

    .line 437
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 440
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method public area()D
    .locals 11

    .line 303
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->size()I

    move-result v0

    .line 304
    .local v0, "cnt":I
    const/4 v1, 0x3

    if-ge v0, v1, :cond_0

    .line 305
    const-wide/16 v1, 0x0

    return-wide v1

    .line 307
    :cond_0
    const-wide/16 v1, 0x0

    .line 308
    .local v1, "a":D
    const/4 v3, 0x0

    .local v3, "i":I
    add-int/lit8 v4, v0, -0x1

    .local v4, "j":I
    :goto_0
    if-ge v3, v0, :cond_1

    .line 309
    invoke-virtual {p0, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    long-to-double v5, v5

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v7

    long-to-double v7, v7

    add-double/2addr v5, v7

    invoke-virtual {p0, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v7

    long-to-double v7, v7

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v9

    long-to-double v9, v9

    sub-double/2addr v7, v9

    mul-double/2addr v5, v7

    add-double/2addr v1, v5

    .line 310
    move v4, v3

    .line 308
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 312
    .end local v3    # "i":I
    .end local v4    # "j":I
    :cond_1
    neg-double v3, v1

    const-wide/high16 v5, 0x3fe0000000000000L    # 0.5

    mul-double/2addr v3, v5

    return-wide v3
.end method

.method public cleanPolygon()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    .locals 2

    .line 316
    const-wide v0, 0x3ff6a3d70a3d70a4L    # 1.415

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->cleanPolygon(D)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    move-result-object v0

    return-object v0
.end method

.method public cleanPolygon(D)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    .locals 8
    .param p1, "distance"    # D

    .line 324
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->size()I

    move-result v0

    .line 326
    .local v0, "cnt":I
    if-nez v0, :cond_0

    .line 327
    new-instance v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;-><init>()V

    return-object v1

    .line 330
    :cond_0
    new-array v1, v0, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 331
    .local v1, "outPts":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 332
    new-instance v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;-><init>()V

    aput-object v3, v1, v2

    .line 331
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 335
    .end local v2    # "i":I
    :cond_1
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_1
    const/4 v3, 0x0

    if-ge v2, v0, :cond_2

    .line 336
    aget-object v4, v1, v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iput-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->pt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 337
    aget-object v4, v1, v2

    add-int/lit8 v5, v2, 0x1

    rem-int/2addr v5, v0

    aget-object v5, v1, v5

    iput-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 338
    aget-object v4, v1, v2

    iget-object v4, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    aget-object v5, v1, v2

    iput-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 339
    aget-object v4, v1, v2

    iput v3, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->idx:I

    .line 335
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 342
    .end local v2    # "i":I
    :cond_2
    mul-double v4, p1, p1

    .line 343
    .local v4, "distSqrd":D
    aget-object v2, v1, v3

    .line 344
    .local v2, "op":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :goto_2
    iget v3, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->idx:I

    if-nez v3, :cond_6

    iget-object v3, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iget-object v6, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-eq v3, v6, :cond_6

    .line 345
    iget-object v3, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->pt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-object v6, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iget-object v6, v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->pt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-static {v3, v6, v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;->arePointsClose(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;D)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 346
    invoke-static {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->excludeOp(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v2

    .line 347
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    .line 349
    :cond_3
    iget-object v3, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iget-object v3, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->pt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-object v6, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iget-object v6, v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->pt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-static {v3, v6, v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;->arePointsClose(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;D)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 350
    iget-object v3, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-static {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->excludeOp(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 351
    invoke-static {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->excludeOp(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v2

    .line 352
    add-int/lit8 v0, v0, -0x2

    goto :goto_2

    .line 354
    :cond_4
    iget-object v3, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iget-object v3, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->pt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-object v6, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->pt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-object v7, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iget-object v7, v7, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->pt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-static {v3, v6, v7, v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;->slopesNearCollinear(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;D)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 355
    invoke-static {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->excludeOp(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v2

    .line 356
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    .line 359
    :cond_5
    const/4 v3, 0x1

    iput v3, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->idx:I

    .line 360
    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_2

    .line 364
    :cond_6
    const/4 v3, 0x3

    if-ge v0, v3, :cond_7

    .line 365
    const/4 v0, 0x0

    .line 367
    :cond_7
    new-instance v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    invoke-direct {v3, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;-><init>(I)V

    .line 368
    .local v3, "result":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_3
    if-ge v6, v0, :cond_8

    .line 369
    iget-object v7, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->pt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v3, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->add(Ljava/lang/Object;)Z

    .line 370
    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 368
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 372
    .end local v6    # "i":I
    :cond_8
    const/4 v1, 0x0

    .line 373
    return-object v3
.end method

.method public isPointInPolygon(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)I
    .locals 21
    .param p1, "pt"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 380
    move-object/from16 v0, p0

    const/4 v1, 0x0

    .line 381
    .local v1, "result":I
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->size()I

    move-result v2

    .line 382
    .local v2, "cnt":I
    const/4 v3, 0x3

    const/4 v4, 0x0

    if-ge v2, v3, :cond_0

    .line 383
    return v4

    .line 385
    :cond_0
    invoke-virtual {v0, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 386
    .local v3, "ip":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    const/4 v5, 0x1

    .local v5, "i":I
    :goto_0
    if-gt v5, v2, :cond_13

    .line 387
    if-ne v5, v2, :cond_1

    invoke-virtual {v0, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v6

    goto :goto_1

    :cond_1
    invoke-virtual {v0, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v6

    :goto_1
    check-cast v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 388
    .local v6, "ipNext":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v7

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v9

    cmp-long v7, v7, v9

    const/4 v8, -0x1

    const/4 v9, 0x1

    if-nez v7, :cond_5

    .line 389
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v10

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v12

    cmp-long v7, v10, v12

    if-eqz v7, :cond_4

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v10

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v12

    cmp-long v7, v10, v12

    if-nez v7, :cond_5

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v10

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v12

    cmp-long v7, v10, v12

    if-lez v7, :cond_2

    move v7, v9

    goto :goto_2

    :cond_2
    move v7, v4

    :goto_2
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v10

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v12

    cmp-long v10, v10, v12

    if-gez v10, :cond_3

    move v10, v9

    goto :goto_3

    :cond_3
    move v10, v4

    :goto_3
    if-ne v7, v10, :cond_5

    .line 390
    :cond_4
    return v8

    .line 393
    :cond_5
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v10

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v12

    cmp-long v7, v10, v12

    if-gez v7, :cond_6

    move v7, v9

    goto :goto_4

    :cond_6
    move v7, v4

    :goto_4
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v10

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v12

    cmp-long v10, v10, v12

    if-gez v10, :cond_7

    move v10, v9

    goto :goto_5

    :cond_7
    move v10, v4

    :goto_5
    if-eq v7, v10, :cond_11

    .line 394
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v10

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v12

    cmp-long v7, v10, v12

    const-wide/16 v10, 0x0

    if-ltz v7, :cond_d

    .line 395
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v12

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v14

    cmp-long v7, v12, v14

    if-lez v7, :cond_8

    .line 396
    rsub-int/lit8 v1, v1, 0x1

    move/from16 v20, v5

    goto/16 :goto_a

    .line 399
    :cond_8
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v12

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v14

    sub-long/2addr v12, v14

    long-to-double v12, v12

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v14

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v16

    sub-long v14, v14, v16

    long-to-double v14, v14

    mul-double/2addr v12, v14

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v14

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v16

    sub-long v14, v14, v16

    long-to-double v14, v14

    .line 400
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v16

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v18

    move/from16 v20, v5

    .end local v5    # "i":I
    .local v20, "i":I
    sub-long v4, v16, v18

    long-to-double v4, v4

    mul-double/2addr v14, v4

    sub-double/2addr v12, v14

    .line 401
    .local v12, "d":D
    cmpl-double v4, v12, v10

    if-nez v4, :cond_9

    .line 402
    return v8

    .line 404
    :cond_9
    cmpl-double v4, v12, v10

    if-lez v4, :cond_a

    move v4, v9

    goto :goto_6

    :cond_a
    const/4 v4, 0x0

    :goto_6
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v10

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v14

    cmp-long v5, v10, v14

    if-lez v5, :cond_b

    goto :goto_7

    :cond_b
    const/4 v9, 0x0

    :goto_7
    if-ne v4, v9, :cond_c

    .line 405
    rsub-int/lit8 v1, v1, 0x1

    .line 407
    .end local v12    # "d":D
    :cond_c
    goto :goto_a

    .line 410
    .end local v20    # "i":I
    .restart local v5    # "i":I
    :cond_d
    move/from16 v20, v5

    .end local v5    # "i":I
    .restart local v20    # "i":I
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v4

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v12

    cmp-long v4, v4, v12

    if-lez v4, :cond_12

    .line 411
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v4

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v12

    sub-long/2addr v4, v12

    long-to-double v4, v4

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v12

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v14

    sub-long/2addr v12, v14

    long-to-double v12, v12

    mul-double/2addr v4, v12

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v12

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v14

    sub-long/2addr v12, v14

    long-to-double v12, v12

    .line 412
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v14

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v16

    sub-long v14, v14, v16

    long-to-double v14, v14

    mul-double/2addr v12, v14

    sub-double/2addr v4, v12

    .line 413
    .local v4, "d":D
    cmpl-double v12, v4, v10

    if-nez v12, :cond_e

    .line 414
    return v8

    .line 416
    :cond_e
    cmpl-double v8, v4, v10

    if-lez v8, :cond_f

    move v8, v9

    goto :goto_8

    :cond_f
    const/4 v8, 0x0

    :goto_8
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v10

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v12

    cmp-long v10, v10, v12

    if-lez v10, :cond_10

    goto :goto_9

    :cond_10
    const/4 v9, 0x0

    :goto_9
    if-ne v8, v9, :cond_12

    .line 417
    rsub-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 393
    .end local v4    # "d":D
    .end local v20    # "i":I
    .restart local v5    # "i":I
    :cond_11
    move/from16 v20, v5

    .line 422
    .end local v5    # "i":I
    .restart local v20    # "i":I
    :cond_12
    :goto_a
    move-object v3, v6

    .line 386
    .end local v6    # "ipNext":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    add-int/lit8 v5, v20, 0x1

    const/4 v4, 0x0

    .end local v20    # "i":I
    .restart local v5    # "i":I
    goto/16 :goto_0

    .line 424
    .end local v5    # "i":I
    :cond_13
    return v1
.end method

.method public orientation()Z
    .locals 4

    .line 428
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->area()D

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public reverse()V
    .locals 0

    .line 432
    invoke-static {p0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 433
    return-void
.end method
