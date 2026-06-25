.class public Lcom/itextpdf/io/source/WindowRandomAccessSource;
.super Ljava/lang/Object;
.source "WindowRandomAccessSource.java"

# interfaces
.implements Lcom/itextpdf/io/source/IRandomAccessSource;


# instance fields
.field private final length:J

.field private final offset:J

.field private final source:Lcom/itextpdf/io/source/IRandomAccessSource;


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/source/IRandomAccessSource;J)V
    .locals 8
    .param p1, "source"    # Lcom/itextpdf/io/source/IRandomAccessSource;
    .param p2, "offset"    # J

    .line 52
    invoke-interface {p1}, Lcom/itextpdf/io/source/IRandomAccessSource;->length()J

    move-result-wide v0

    sub-long v6, v0, p2

    move-object v2, p0

    move-object v3, p1

    move-wide v4, p2

    .end local p1    # "source":Lcom/itextpdf/io/source/IRandomAccessSource;
    .end local p2    # "offset":J
    .local v3, "source":Lcom/itextpdf/io/source/IRandomAccessSource;
    .local v4, "offset":J
    invoke-direct/range {v2 .. v7}, Lcom/itextpdf/io/source/WindowRandomAccessSource;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;JJ)V

    .line 53
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/io/source/IRandomAccessSource;JJ)V
    .locals 0
    .param p1, "source"    # Lcom/itextpdf/io/source/IRandomAccessSource;
    .param p2, "offset"    # J
    .param p4, "length"    # J

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lcom/itextpdf/io/source/WindowRandomAccessSource;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    .line 63
    iput-wide p2, p0, Lcom/itextpdf/io/source/WindowRandomAccessSource;->offset:J

    .line 64
    iput-wide p4, p0, Lcom/itextpdf/io/source/WindowRandomAccessSource;->length:J

    .line 65
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 100
    iget-object v0, p0, Lcom/itextpdf/io/source/WindowRandomAccessSource;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    invoke-interface {v0}, Lcom/itextpdf/io/source/IRandomAccessSource;->close()V

    .line 101
    return-void
.end method

.method public get(J)I
    .locals 3
    .param p1, "position"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    iget-wide v0, p0, Lcom/itextpdf/io/source/WindowRandomAccessSource;->length:J

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    const/4 v0, -0x1

    return v0

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/source/WindowRandomAccessSource;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    iget-wide v1, p0, Lcom/itextpdf/io/source/WindowRandomAccessSource;->offset:J

    add-long/2addr v1, p1

    invoke-interface {v0, v1, v2}, Lcom/itextpdf/io/source/IRandomAccessSource;->get(J)I

    move-result v0

    return v0
.end method

.method public get(J[BII)I
    .locals 8
    .param p1, "position"    # J
    .param p3, "bytes"    # [B
    .param p4, "off"    # I
    .param p5, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 81
    iget-wide v0, p0, Lcom/itextpdf/io/source/WindowRandomAccessSource;->length:J

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 82
    const/4 v0, -0x1

    return v0

    .line 84
    :cond_0
    int-to-long v0, p5

    iget-wide v2, p0, Lcom/itextpdf/io/source/WindowRandomAccessSource;->length:J

    sub-long/2addr v2, p1

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    .line 85
    .local v0, "toRead":J
    iget-object v2, p0, Lcom/itextpdf/io/source/WindowRandomAccessSource;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    iget-wide v3, p0, Lcom/itextpdf/io/source/WindowRandomAccessSource;->offset:J

    add-long/2addr v3, p1

    long-to-int v7, v0

    move-object v5, p3

    move v6, p4

    .end local p3    # "bytes":[B
    .end local p4    # "off":I
    .local v5, "bytes":[B
    .local v6, "off":I
    invoke-interface/range {v2 .. v7}, Lcom/itextpdf/io/source/IRandomAccessSource;->get(J[BII)I

    move-result p3

    return p3
.end method

.method public length()J
    .locals 2

    .line 93
    iget-wide v0, p0, Lcom/itextpdf/io/source/WindowRandomAccessSource;->length:J

    return-wide v0
.end method
