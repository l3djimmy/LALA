.class Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
.super Ljava/lang/Object;
.source "Path.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "OutPt"
.end annotation


# instance fields
.field idx:I

.field next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

.field prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

.field protected pt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getLowerMostRec(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    .locals 6
    .param p0, "outRec1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    .param p1, "outRec2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 60
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->bottomPt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-nez v0, :cond_0

    .line 61
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->pts:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getBottomPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->bottomPt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 63
    :cond_0
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->bottomPt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-nez v0, :cond_1

    .line 64
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->pts:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getBottomPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v0

    iput-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->bottomPt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 66
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->bottomPt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 67
    .local v0, "bPt1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->bottomPt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 68
    .local v1, "bPt2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v2

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_2

    .line 69
    return-object p0

    .line 71
    :cond_2
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v2

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-gez v2, :cond_3

    .line 72
    return-object p1

    .line 74
    :cond_3
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v2

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-gez v2, :cond_4

    .line 75
    return-object p0

    .line 77
    :cond_4
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v2

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_5

    .line 78
    return-object p1

    .line 80
    :cond_5
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-ne v2, v0, :cond_6

    .line 81
    return-object p1

    .line 83
    :cond_6
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-ne v2, v1, :cond_7

    .line 84
    return-object p0

    .line 86
    :cond_7
    invoke-static {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->isFirstBottomPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 87
    return-object p0

    .line 90
    :cond_8
    return-object p1
.end method

.method private static isFirstBottomPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)Z
    .locals 10
    .param p0, "btmPt1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .param p1, "btmPt2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 95
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 96
    .local v0, "p":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 97
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_0

    .line 99
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getDeltaX(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Math;->abs(D)D

    move-result-wide v1

    .line 100
    .local v1, "dx1p":D
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 101
    :goto_1
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 102
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_1

    .line 104
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getDeltaX(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(D)D

    move-result-wide v3

    .line 106
    .local v3, "dx1n":D
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 107
    :goto_2
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 108
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_2

    .line 110
    :cond_2
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getDeltaX(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Math;->abs(D)D

    move-result-wide v5

    .line 111
    .local v5, "dx2p":D
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 112
    :goto_3
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v7

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 113
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_3

    .line 115
    :cond_3
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v7

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getDeltaX(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)D

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Math;->abs(D)D

    move-result-wide v7

    .line 116
    .local v7, "dx2n":D
    cmpl-double v9, v1, v5

    if-ltz v9, :cond_4

    cmpl-double v9, v1, v7

    if-gez v9, :cond_5

    :cond_4
    cmpl-double v9, v3, v5

    if-ltz v9, :cond_6

    cmpl-double v9, v3, v7

    if-ltz v9, :cond_6

    :cond_5
    const/4 v9, 0x1

    goto :goto_4

    :cond_6
    const/4 v9, 0x0

    :goto_4
    return v9
.end method


# virtual methods
.method public duplicate(Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .locals 3
    .param p1, "InsertAfter"    # Z

    .line 126
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;-><init>()V

    .line 127
    .local v0, "result":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    new-instance v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->setPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 128
    iget v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->idx:I

    iput v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->idx:I

    .line 129
    if-eqz p1, :cond_0

    .line 130
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 131
    iput-object p0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 132
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iput-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 133
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_0

    .line 136
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 137
    iput-object p0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 138
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iput-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 139
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 141
    :goto_0
    return-object v0
.end method

.method getBottomPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .locals 7

    .line 145
    const/4 v0, 0x0

    .line 146
    .local v0, "dups":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 147
    .local v1, "p":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    move-object v2, p0

    .line 148
    .local v2, "pp":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :goto_0
    if-eq v1, v2, :cond_3

    .line 149
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v3

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-lez v3, :cond_0

    .line 150
    move-object v2, v1

    .line 151
    const/4 v0, 0x0

    goto :goto_1

    .line 153
    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v3

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_2

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-gtz v3, :cond_2

    .line 154
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-gez v3, :cond_1

    .line 155
    const/4 v0, 0x0

    .line 156
    move-object v2, v1

    goto :goto_1

    .line 159
    :cond_1
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-eq v3, v2, :cond_2

    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-eq v3, v2, :cond_2

    .line 160
    move-object v0, v1

    .line 164
    :cond_2
    :goto_1
    iget-object v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_0

    .line 166
    :cond_3
    if-eqz v0, :cond_6

    .line 168
    :cond_4
    if-eq v0, v1, :cond_6

    .line 169
    invoke-static {v1, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->isFirstBottomPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 170
    move-object v2, v0

    .line 172
    :cond_5
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 173
    :goto_2
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 174
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_2

    .line 178
    :cond_6
    return-object v2
.end method

.method public getPointCount()I
    .locals 2

    .line 183
    const/4 v0, 0x0

    .line 184
    .local v0, "result":I
    move-object v1, p0

    .line 186
    .local v1, "p":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 187
    iget-object v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 189
    if-eq v1, p0, :cond_1

    if-nez v1, :cond_0

    .line 190
    :cond_1
    return v0
.end method

.method public getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    .locals 1

    .line 194
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->pt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    return-object v0
.end method

.method public reversePolyPtLinks()V
    .locals 3

    .line 201
    move-object v0, p0

    .line 203
    .local v0, "pp1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :cond_0
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 204
    .local v1, "pp2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iput-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 205
    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 206
    move-object v0, v1

    .line 208
    if-ne v0, p0, :cond_0

    .line 209
    return-void
.end method

.method public setPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V
    .locals 0
    .param p1, "pt"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 212
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->pt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 213
    return-void
.end method
