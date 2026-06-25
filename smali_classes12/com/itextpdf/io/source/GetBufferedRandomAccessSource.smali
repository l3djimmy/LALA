.class public Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;
.super Ljava/lang/Object;
.source "GetBufferedRandomAccessSource.java"

# interfaces
.implements Lcom/itextpdf/io/source/IRandomAccessSource;


# instance fields
.field private final getBuffer:[B

.field private getBufferEnd:J

.field private getBufferStart:J

.field private final source:Lcom/itextpdf/io/source/IRandomAccessSource;


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V
    .locals 6
    .param p1, "source"    # Lcom/itextpdf/io/source/IRandomAccessSource;

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->getBufferStart:J

    .line 32
    iput-wide v0, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->getBufferEnd:J

    .line 39
    iput-object p1, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    .line 40
    invoke-interface {p1}, Lcom/itextpdf/io/source/IRandomAccessSource;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x4

    div-long/2addr v2, v4

    const-wide/16 v4, 0x1

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    const-wide/16 v4, 0x1000

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v2, v2

    new-array v2, v2, [B

    iput-object v2, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->getBuffer:[B

    .line 41
    iput-wide v0, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->getBufferStart:J

    .line 42
    iput-wide v0, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->getBufferEnd:J

    .line 43
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    iget-object v0, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    invoke-interface {v0}, Lcom/itextpdf/io/source/IRandomAccessSource;->close()V

    .line 79
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->getBufferStart:J

    .line 80
    iput-wide v0, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->getBufferEnd:J

    .line 81
    return-void
.end method

.method public get(J)I
    .locals 7
    .param p1, "position"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 49
    iget-wide v0, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->getBufferStart:J

    cmp-long v0, p1, v0

    if-ltz v0, :cond_1

    iget-wide v0, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->getBufferEnd:J

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    move-wide v2, p1

    goto :goto_1

    .line 50
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    iget-object v4, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->getBuffer:[B

    iget-object v0, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->getBuffer:[B

    array-length v6, v0

    const/4 v5, 0x0

    move-wide v2, p1

    .end local p1    # "position":J
    .local v2, "position":J
    invoke-interface/range {v1 .. v6}, Lcom/itextpdf/io/source/IRandomAccessSource;->get(J[BII)I

    move-result p1

    .line 51
    .local p1, "count":I
    const/4 p2, -0x1

    if-ne p1, p2, :cond_2

    .line 52
    return p2

    .line 53
    :cond_2
    iput-wide v2, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->getBufferStart:J

    .line 54
    int-to-long v0, p1

    add-long/2addr v0, v2

    const-wide/16 v4, 0x1

    sub-long/2addr v0, v4

    iput-wide v0, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->getBufferEnd:J

    .line 56
    .end local p1    # "count":I
    :goto_1
    iget-wide p1, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->getBufferStart:J

    sub-long p1, v2, p1

    long-to-int p1, p1

    .line 57
    .local p1, "bufPos":I
    iget-object p2, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->getBuffer:[B

    aget-byte p2, p2, p1

    and-int/lit16 p2, p2, 0xff

    return p2
.end method

.method public get(J[BII)I
    .locals 6
    .param p1, "position"    # J
    .param p3, "bytes"    # [B
    .param p4, "off"    # I
    .param p5, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 64
    iget-object v0, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    move-wide v1, p1

    move-object v3, p3

    move v4, p4

    move v5, p5

    .end local p1    # "position":J
    .end local p3    # "bytes":[B
    .end local p4    # "off":I
    .end local p5    # "len":I
    .local v1, "position":J
    .local v3, "bytes":[B
    .local v4, "off":I
    .local v5, "len":I
    invoke-interface/range {v0 .. v5}, Lcom/itextpdf/io/source/IRandomAccessSource;->get(J[BII)I

    move-result p1

    return p1
.end method

.method public length()J
    .locals 2

    .line 71
    iget-object v0, p0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    invoke-interface {v0}, Lcom/itextpdf/io/source/IRandomAccessSource;->length()J

    move-result-wide v0

    return-wide v0
.end method
