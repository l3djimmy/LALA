.class public Lcom/itextpdf/io/source/ThreadSafeRandomAccessSource;
.super Ljava/lang/Object;
.source "ThreadSafeRandomAccessSource.java"

# interfaces
.implements Lcom/itextpdf/io/source/IRandomAccessSource;


# instance fields
.field private final lockObj:Ljava/lang/Object;

.field private final source:Lcom/itextpdf/io/source/IRandomAccessSource;


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V
    .locals 1
    .param p1, "source"    # Lcom/itextpdf/io/source/IRandomAccessSource;

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/source/ThreadSafeRandomAccessSource;->lockObj:Ljava/lang/Object;

    .line 32
    iput-object p1, p0, Lcom/itextpdf/io/source/ThreadSafeRandomAccessSource;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    .line 33
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

    .line 58
    iget-object v0, p0, Lcom/itextpdf/io/source/ThreadSafeRandomAccessSource;->lockObj:Ljava/lang/Object;

    monitor-enter v0

    .line 59
    :try_start_0
    iget-object v1, p0, Lcom/itextpdf/io/source/ThreadSafeRandomAccessSource;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    invoke-interface {v1}, Lcom/itextpdf/io/source/IRandomAccessSource;->close()V

    .line 60
    monitor-exit v0

    .line 61
    return-void

    .line 60
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public get(J)I
    .locals 2
    .param p1, "position"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 37
    iget-object v0, p0, Lcom/itextpdf/io/source/ThreadSafeRandomAccessSource;->lockObj:Ljava/lang/Object;

    monitor-enter v0

    .line 38
    :try_start_0
    iget-object v1, p0, Lcom/itextpdf/io/source/ThreadSafeRandomAccessSource;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    invoke-interface {v1, p1, p2}, Lcom/itextpdf/io/source/IRandomAccessSource;->get(J)I

    move-result v1

    monitor-exit v0

    return v1

    .line 39
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
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

    .line 44
    iget-object v1, p0, Lcom/itextpdf/io/source/ThreadSafeRandomAccessSource;->lockObj:Ljava/lang/Object;

    monitor-enter v1

    .line 45
    :try_start_0
    iget-object v2, p0, Lcom/itextpdf/io/source/ThreadSafeRandomAccessSource;->source:Lcom/itextpdf/io/source/IRandomAccessSource;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-wide v3, p1

    move-object v5, p3

    move v6, p4

    move v7, p5

    .end local p1    # "position":J
    .end local p3    # "bytes":[B
    .end local p4    # "off":I
    .end local p5    # "len":I
    .local v3, "position":J
    .local v5, "bytes":[B
    .local v6, "off":I
    .local v7, "len":I
    :try_start_1
    invoke-interface/range {v2 .. v7}, Lcom/itextpdf/io/source/IRandomAccessSource;->get(J[BII)I

    move-result p1

    monitor-exit v1

    return p1

    .line 46
    :catchall_0
    move-exception v0

    move-object p1, v0

    goto :goto_0

    .end local v3    # "position":J
    .end local v5    # "bytes":[B
    .end local v6    # "off":I
    .end local v7    # "len":I
    .restart local p1    # "position":J
    .restart local p3    # "bytes":[B
    .restart local p4    # "off":I
    .restart local p5    # "len":I
    :catchall_1
    move-exception v0

    move-wide v3, p1

    move-object v5, p3

    move v6, p4

    move v7, p5

    move-object p1, v0

    .end local p1    # "position":J
    .end local p3    # "bytes":[B
    .end local p4    # "off":I
    .end local p5    # "len":I
    .restart local v3    # "position":J
    .restart local v5    # "bytes":[B
    .restart local v6    # "off":I
    .restart local v7    # "len":I
    :goto_0
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public length()J
    .locals 3

    .line 51
    iget-object v0, p0, Lcom/itextpdf/io/source/ThreadSafeRandomAccessSource;->lockObj:Ljava/lang/Object;

    monitor-enter v0

    .line 52
    :try_start_0
    iget-object v1, p0, Lcom/itextpdf/io/source/ThreadSafeRandomAccessSource;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    invoke-interface {v1}, Lcom/itextpdf/io/source/IRandomAccessSource;->length()J

    move-result-wide v1

    monitor-exit v0

    return-wide v1

    .line 53
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
