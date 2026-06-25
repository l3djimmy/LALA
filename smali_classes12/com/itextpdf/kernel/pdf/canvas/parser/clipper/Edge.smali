.class Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
.super Ljava/lang/Object;
.source "Edge.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;
    }
.end annotation


# static fields
.field protected static final HORIZONTAL:D = -3.4E38

.field private static final LOGGER:Ljava/util/logging/Logger;

.field protected static final SKIP:I = -0x2

.field protected static final UNASSIGNED:I = -0x1


# instance fields
.field private final bot:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

.field private final current:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

.field private final delta:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

.field deltaX:D

.field next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

.field nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

.field nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

.field nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

.field outIdx:I

.field polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

.field prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

.field prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

.field prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

.field side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

.field private final top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

.field windCnt:I

.field windCnt2:I

.field windDelta:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 122
    const-class v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->LOGGER:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 125
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->delta:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 126
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 127
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->bot:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 128
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->current:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 129
    return-void
.end method

.method static doesE2InsertBeforeE1(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)Z
    .locals 7
    .param p0, "e1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p1, "e2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 49
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->current:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v0

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->current:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v2

    cmp-long v0, v0, v2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_3

    .line 50
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v3

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v5

    cmp-long v0, v3, v5

    if-lez v0, :cond_1

    .line 51
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v5

    invoke-static {p0, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->topX(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;J)J

    move-result-wide v5

    cmp-long v0, v3, v5

    if-gez v0, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1

    .line 54
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v5

    invoke-static {p1, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->topX(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;J)J

    move-result-wide v5

    cmp-long v0, v3, v5

    if-lez v0, :cond_2

    goto :goto_1

    :cond_2
    move v1, v2

    :goto_1
    return v1

    .line 58
    :cond_3
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->current:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->current:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    cmp-long v0, v3, v5

    if-gez v0, :cond_4

    goto :goto_2

    :cond_4
    move v1, v2

    :goto_2
    return v1
.end method

.method static slopesEqual(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Z)Z
    .locals 6
    .param p0, "e1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p1, "e2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p2, "useFullRange"    # Z

    .line 63
    if-eqz p2, :cond_0

    .line 64
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getDelta()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getDelta()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    .line 65
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getDelta()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getDelta()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 67
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getDelta()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getDelta()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v2

    mul-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getDelta()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getDelta()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v4

    mul-long/2addr v2, v4

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static swapPolyIndexes(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V
    .locals 2
    .param p0, "edge1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p1, "edge2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 72
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 73
    .local v0, "outIdx":I
    iget v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    iput v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 74
    iput v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 75
    return-void
.end method

.method static swapSides(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V
    .locals 2
    .param p0, "edge1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p1, "edge2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 78
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    .line 79
    .local v0, "side":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;
    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    .line 80
    iput-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    .line 81
    return-void
.end method

.method static topX(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;J)J
    .locals 6
    .param p0, "edge"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p1, "currentY"    # J

    .line 84
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v0

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    .line 85
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v0

    return-wide v0

    .line 87
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v4

    sub-long v4, p1, v4

    long-to-double v4, v4

    mul-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v2

    add-long/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method public findNextLocMin()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .locals 7

    .line 132
    move-object v0, p0

    .line 135
    .local v0, "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_0
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->bot:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->bot:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->current:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_4

    .line 138
    :cond_0
    iget-wide v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    const-wide v3, -0x381006cc38732053L    # -3.4E38

    cmpl-double v1, v1, v3

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-wide v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    cmpl-double v1, v1, v3

    if-eqz v1, :cond_1

    .line 139
    goto :goto_3

    .line 141
    :cond_1
    :goto_1
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-wide v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    cmpl-double v1, v1, v3

    if-nez v1, :cond_2

    .line 142
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_1

    .line 144
    :cond_2
    move-object v1, v0

    .line 145
    .local v1, "e2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_2
    iget-wide v5, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    cmpl-double v2, v5, v3

    if-nez v2, :cond_3

    .line 146
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_2

    .line 148
    :cond_3
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v2

    iget-object v4, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v4, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->bot:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_4

    .line 149
    goto :goto_0

    .line 151
    :cond_4
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->bot:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v2

    iget-object v4, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->bot:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-gez v2, :cond_5

    .line 152
    move-object v0, v1

    .line 156
    .end local v1    # "e2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :cond_5
    :goto_3
    return-object v0

    .line 136
    :cond_6
    :goto_4
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_0
.end method

.method public getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    .locals 1

    .line 160
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->bot:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    return-object v0
.end method

.method public getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    .locals 1

    .line 164
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->current:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    return-object v0
.end method

.method public getDelta()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    .locals 1

    .line 168
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->delta:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    return-object v0
.end method

.method public getMaximaPair()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .locals 3

    .line 172
    const/4 v0, 0x0

    .line 173
    .local v0, "result":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-nez v1, :cond_0

    .line 174
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_0

    .line 176
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-nez v1, :cond_1

    .line 177
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 179
    :cond_1
    :goto_0
    if-eqz v0, :cond_3

    iget v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    const/4 v2, -0x2

    if-eq v1, v2, :cond_2

    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-ne v1, v2, :cond_3

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isHorizontal()Z

    move-result v1

    if-nez v1, :cond_3

    .line 180
    :cond_2
    const/4 v1, 0x0

    return-object v1

    .line 182
    :cond_3
    return-object v0
.end method

.method public getNextInAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .locals 1
    .param p1, "direction"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    .line 186
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->LEFT_TO_RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    :goto_0
    return-object v0
.end method

.method public getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    .locals 1

    .line 190
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    return-object v0
.end method

.method public isContributing(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;)Z
    .locals 6
    .param p1, "clipFillType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .param p2, "subjFillType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .param p3, "clipType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    .line 194
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->LOGGER:Ljava/util/logging/Logger;

    const-class v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "isContributing"

    invoke-virtual {v0, v1, v2}, Ljava/util/logging/Logger;->entering(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->SUBJECT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    if-ne v0, v1, :cond_0

    .line 198
    move-object v0, p2

    .line 199
    .local v0, "pft":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    move-object v1, p1

    .local v1, "pft2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    goto :goto_0

    .line 202
    .end local v0    # "pft":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .end local v1    # "pft2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    :cond_0
    move-object v0, p1

    .line 203
    .restart local v0    # "pft":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    move-object v1, p2

    .line 206
    .restart local v1    # "pft2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    :goto_0
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$1;->$SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$clipper$IClipper$PolyFillType:[I

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->ordinal()I

    move-result v3

    aget v2, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x1

    packed-switch v2, :pswitch_data_0

    .line 224
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    const/4 v5, -0x1

    if-eq v2, v5, :cond_1

    .line 225
    return v3

    .line 219
    :pswitch_0
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    if-eq v2, v4, :cond_1

    .line 220
    return v3

    .line 214
    :pswitch_1
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    if-eq v2, v4, :cond_1

    .line 215
    return v3

    .line 209
    :pswitch_2
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-nez v2, :cond_1

    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    if-eq v2, v4, :cond_1

    .line 210
    return v3

    .line 230
    :cond_1
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$1;->$SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$clipper$IClipper$ClipType:[I

    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->ordinal()I

    move-result v5

    aget v2, v2, v5

    packed-switch v2, :pswitch_data_1

    .line 290
    return v4

    .line 275
    :pswitch_3
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-nez v2, :cond_5

    .line 276
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$1;->$SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$clipper$IClipper$PolyFillType:[I

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->ordinal()I

    move-result v5

    aget v2, v2, v5

    packed-switch v2, :pswitch_data_2

    .line 283
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-ltz v2, :cond_4

    move v3, v4

    goto :goto_1

    .line 281
    :pswitch_4
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-gtz v2, :cond_2

    move v3, v4

    :cond_2
    return v3

    .line 279
    :pswitch_5
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-nez v2, :cond_3

    move v3, v4

    :cond_3
    return v3

    .line 283
    :cond_4
    :goto_1
    return v3

    .line 287
    :cond_5
    return v4

    .line 252
    :pswitch_6
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    sget-object v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->SUBJECT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    if-ne v2, v5, :cond_9

    .line 253
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$1;->$SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$clipper$IClipper$PolyFillType:[I

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->ordinal()I

    move-result v5

    aget v2, v2, v5

    packed-switch v2, :pswitch_data_3

    .line 260
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-ltz v2, :cond_8

    move v3, v4

    goto :goto_2

    .line 258
    :pswitch_7
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-gtz v2, :cond_6

    move v3, v4

    :cond_6
    return v3

    .line 256
    :pswitch_8
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-nez v2, :cond_7

    move v3, v4

    :cond_7
    return v3

    .line 260
    :cond_8
    :goto_2
    return v3

    .line 264
    :cond_9
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$1;->$SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$clipper$IClipper$PolyFillType:[I

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->ordinal()I

    move-result v5

    aget v2, v2, v5

    packed-switch v2, :pswitch_data_4

    .line 271
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-gez v2, :cond_c

    move v3, v4

    goto :goto_3

    .line 269
    :pswitch_9
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-lez v2, :cond_a

    move v3, v4

    :cond_a
    return v3

    .line 267
    :pswitch_a
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-eqz v2, :cond_b

    move v3, v4

    :cond_b
    return v3

    .line 271
    :cond_c
    :goto_3
    return v3

    .line 242
    :pswitch_b
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$1;->$SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$clipper$IClipper$PolyFillType:[I

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->ordinal()I

    move-result v5

    aget v2, v2, v5

    packed-switch v2, :pswitch_data_5

    .line 249
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-ltz v2, :cond_f

    move v3, v4

    goto :goto_4

    .line 247
    :pswitch_c
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-gtz v2, :cond_d

    move v3, v4

    :cond_d
    return v3

    .line 245
    :pswitch_d
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-nez v2, :cond_e

    move v3, v4

    :cond_e
    return v3

    .line 249
    :cond_f
    :goto_4
    return v3

    .line 232
    :pswitch_e
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$1;->$SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$clipper$IClipper$PolyFillType:[I

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->ordinal()I

    move-result v5

    aget v2, v2, v5

    packed-switch v2, :pswitch_data_6

    .line 239
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-gez v2, :cond_12

    move v3, v4

    goto :goto_5

    .line 237
    :pswitch_f
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-lez v2, :cond_10

    move v3, v4

    :cond_10
    return v3

    .line 235
    :pswitch_10
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-eqz v2, :cond_11

    move v3, v4

    :cond_11
    return v3

    .line 239
    :cond_12
    :goto_5
    return v3

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_e
        :pswitch_b
        :pswitch_6
        :pswitch_3
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_5
        :pswitch_5
        :pswitch_4
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x1
        :pswitch_8
        :pswitch_8
        :pswitch_7
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x1
        :pswitch_a
        :pswitch_a
        :pswitch_9
    .end packed-switch

    :pswitch_data_5
    .packed-switch 0x1
        :pswitch_d
        :pswitch_d
        :pswitch_c
    .end packed-switch

    :pswitch_data_6
    .packed-switch 0x1
        :pswitch_10
        :pswitch_10
        :pswitch_f
    .end packed-switch
.end method

.method public isEvenOddAltFillType(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z
    .locals 4
    .param p1, "clipFillType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .param p2, "subjFillType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 294
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->SUBJECT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_1

    .line 295
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->EVEN_ODD:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    move v2, v3

    :goto_0
    return v2

    .line 298
    :cond_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->EVEN_ODD:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    if-ne p2, v0, :cond_2

    goto :goto_1

    :cond_2
    move v2, v3

    :goto_1
    return v2
.end method

.method public isEvenOddFillType(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z
    .locals 4
    .param p1, "clipFillType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .param p2, "subjFillType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 303
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->SUBJECT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_1

    .line 304
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->EVEN_ODD:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    if-ne p2, v0, :cond_0

    goto :goto_0

    :cond_0
    move v2, v3

    :goto_0
    return v2

    .line 307
    :cond_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->EVEN_ODD:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    if-ne p1, v0, :cond_2

    goto :goto_1

    :cond_2
    move v2, v3

    :goto_1
    return v2
.end method

.method public isHorizontal()Z
    .locals 4

    .line 312
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->delta:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isIntermediate(D)Z
    .locals 2
    .param p1, "y"    # D

    .line 316
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v0

    long-to-double v0, v0

    cmpl-double v0, v0, p1

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isMaxima(D)Z
    .locals 2
    .param p1, "Y"    # D

    .line 320
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v0

    long-to-double v0, v0

    cmpl-double v0, v0, p1

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public reverseHorizontal()V
    .locals 5

    .line 327
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v0

    .line 328
    .local v0, "temp":J
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->bot:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setX(Ljava/lang/Number;)V

    .line 329
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->bot:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setX(Ljava/lang/Number;)V

    .line 331
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getZ()J

    move-result-wide v0

    .line 332
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->bot:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getZ()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setZ(Ljava/lang/Number;)V

    .line 333
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->bot:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setZ(Ljava/lang/Number;)V

    .line 335
    return-void
.end method

.method public setBot(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V
    .locals 1
    .param p1, "bot"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 338
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->bot:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->set(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;)V

    .line 339
    return-void
.end method

.method public setCurrent(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V
    .locals 1
    .param p1, "current"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 342
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->current:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->set(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;)V

    .line 343
    return-void
.end method

.method public setTop(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V
    .locals 1
    .param p1, "top"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 346
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->set(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;)V

    .line 347
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 351
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TEdge [Bot="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->bot:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", Curr="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->current:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", Top="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", Delta="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->delta:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", Dx="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", PolyTyp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", Side="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", WindDelta="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", WindCnt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", WindCnt2="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", OutIdx="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", Next="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", Prev="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", NextInLML="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", NextInAEL="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", PrevInAEL="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", NextInSEL="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", PrevInSEL="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public updateDeltaX()V
    .locals 5

    .line 359
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->delta:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v1

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->bot:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    sub-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setX(Ljava/lang/Number;)V

    .line 360
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->delta:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->top:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v1

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->bot:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v3

    sub-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setY(Ljava/lang/Number;)V

    .line 361
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->delta:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 362
    const-wide v0, -0x381006cc38732053L    # -3.4E38

    iput-wide v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    goto :goto_0

    .line 365
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->delta:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v0

    long-to-double v0, v0

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->delta:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v2

    long-to-double v2, v2

    div-double/2addr v0, v2

    iput-wide v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    .line 367
    :goto_0
    return-void
.end method
