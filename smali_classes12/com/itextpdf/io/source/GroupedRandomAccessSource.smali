.class Lcom/itextpdf/io/source/GroupedRandomAccessSource;
.super Ljava/lang/Object;
.source "GroupedRandomAccessSource.java"

# interfaces
.implements Lcom/itextpdf/io/source/IRandomAccessSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;
    }
.end annotation


# instance fields
.field private currentSourceEntry:Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

.field private final size:J

.field private final sources:[Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;


# direct methods
.method public constructor <init>([Lcom/itextpdf/io/source/IRandomAccessSource;)V
    .locals 6
    .param p1, "sources"    # [Lcom/itextpdf/io/source/IRandomAccessSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    array-length v0, p1

    new-array v0, v0, [Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    iput-object v0, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->sources:[Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    .line 58
    const-wide/16 v0, 0x0

    .line 59
    .local v0, "totalSize":J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, p1

    if-ge v2, v3, :cond_0

    .line 60
    iget-object v3, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->sources:[Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    new-instance v4, Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    aget-object v5, p1, v2

    invoke-direct {v4, v2, v5, v0, v1}, Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;-><init>(ILcom/itextpdf/io/source/IRandomAccessSource;J)V

    aput-object v4, v3, v2

    .line 61
    aget-object v3, p1, v2

    invoke-interface {v3}, Lcom/itextpdf/io/source/IRandomAccessSource;->length()J

    move-result-wide v3

    add-long/2addr v0, v3

    .line 59
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 63
    .end local v2    # "i":I
    :cond_0
    iput-wide v0, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->size:J

    .line 64
    iget-object v2, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->sources:[Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    array-length v3, p1

    add-int/lit8 v3, v3, -0x1

    aget-object v2, v2, v3

    iput-object v2, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->currentSourceEntry:Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    .line 65
    iget-object v2, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->currentSourceEntry:Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    iget-object v2, v2, Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    invoke-virtual {p0, v2}, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->sourceInUse(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    .line 66
    return-void
.end method

.method private getSourceEntryForOffset(J)Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;
    .locals 5
    .param p1, "offset"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 94
    iget-wide v0, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->size:J

    cmp-long v0, p1, v0

    const/4 v1, 0x0

    if-ltz v0, :cond_0

    .line 95
    return-object v1

    .line 97
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->currentSourceEntry:Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    iget-wide v2, v0, Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;->firstByte:J

    cmp-long v0, p1, v2

    if-ltz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->currentSourceEntry:Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    iget-wide v2, v0, Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;->lastByte:J

    cmp-long v0, p1, v2

    if-gtz v0, :cond_1

    .line 98
    iget-object v0, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->currentSourceEntry:Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    return-object v0

    .line 101
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->currentSourceEntry:Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    iget-object v0, v0, Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->sourceReleased(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    .line 103
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->getStartingSourceIndex(J)I

    move-result v0

    .line 104
    .local v0, "startAt":I
    move v2, v0

    .local v2, "i":I
    :goto_0
    iget-object v3, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->sources:[Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    array-length v3, v3

    if-ge v2, v3, :cond_3

    .line 105
    iget-object v3, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->sources:[Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    aget-object v3, v3, v2

    iget-wide v3, v3, Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;->firstByte:J

    cmp-long v3, p1, v3

    if-ltz v3, :cond_2

    iget-object v3, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->sources:[Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    aget-object v3, v3, v2

    iget-wide v3, v3, Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;->lastByte:J

    cmp-long v3, p1, v3

    if-gtz v3, :cond_2

    .line 106
    iget-object v1, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->sources:[Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    aget-object v1, v1, v2

    iput-object v1, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->currentSourceEntry:Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    .line 107
    iget-object v1, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->currentSourceEntry:Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    iget-object v1, v1, Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    invoke-virtual {p0, v1}, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->sourceInUse(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    .line 108
    iget-object v1, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->currentSourceEntry:Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    return-object v1

    .line 104
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 111
    .end local v2    # "i":I
    :cond_3
    return-object v1
.end method


# virtual methods
.method public close()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 197
    const-string v0, "Closing of one of the grouped sources failed."

    const-class v1, Lcom/itextpdf/io/source/GroupedRandomAccessSource;

    const/4 v2, 0x0

    .line 198
    .local v2, "firstThrownIOExc":Ljava/io/IOException;
    iget-object v3, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->sources:[Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    array-length v4, v3

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_1

    aget-object v6, v3, v5

    .line 200
    .local v6, "entry":Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;
    :try_start_0
    iget-object v7, v6, Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    invoke-interface {v7}, Lcom/itextpdf/io/source/IRandomAccessSource;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 208
    :catch_0
    move-exception v7

    .line 209
    .local v7, "ex":Ljava/lang/Exception;
    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v8

    .line 210
    .local v8, "logger":Lorg/slf4j/Logger;
    invoke-interface {v8, v0, v7}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 201
    .end local v7    # "ex":Ljava/lang/Exception;
    .end local v8    # "logger":Lorg/slf4j/Logger;
    :catch_1
    move-exception v7

    .line 202
    .local v7, "ex":Ljava/io/IOException;
    if-nez v2, :cond_0

    .line 203
    move-object v2, v7

    goto :goto_1

    .line 205
    :cond_0
    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v8

    .line 206
    .restart local v8    # "logger":Lorg/slf4j/Logger;
    invoke-interface {v8, v0, v7}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 211
    .end local v7    # "ex":Ljava/io/IOException;
    .end local v8    # "logger":Lorg/slf4j/Logger;
    :goto_1
    nop

    .line 198
    .end local v6    # "entry":Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 213
    :cond_1
    if-nez v2, :cond_2

    .line 216
    return-void

    .line 214
    :cond_2
    throw v2
.end method

.method public get(J)I
    .locals 4
    .param p1, "position"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 138
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->getSourceEntryForOffset(J)Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    move-result-object v0

    .line 141
    .local v0, "entry":Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;
    if-nez v0, :cond_0

    .line 142
    const/4 v1, -0x1

    return v1

    .line 144
    :cond_0
    iget-object v1, v0, Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;->offsetN(J)J

    move-result-wide v2

    invoke-interface {v1, v2, v3}, Lcom/itextpdf/io/source/IRandomAccessSource;->get(J)I

    move-result v1

    return v1
.end method

.method public get(J[BII)I
    .locals 10
    .param p1, "position"    # J
    .param p3, "bytes"    # [B
    .param p4, "off"    # I
    .param p5, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 151
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->getSourceEntryForOffset(J)Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    move-result-object v0

    .line 154
    .local v0, "entry":Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;
    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 155
    return v1

    .line 157
    :cond_0
    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;->offsetN(J)J

    move-result-wide v2

    .line 159
    .local v2, "offN":J
    move v4, p5

    move v6, p4

    move v7, v4

    move-wide v3, v2

    .line 161
    .end local v2    # "offN":J
    .end local p4    # "off":I
    .local v3, "offN":J
    .local v6, "off":I
    .local v7, "remaining":I
    :goto_0
    if-lez v7, :cond_4

    .line 164
    if-nez v0, :cond_1

    .line 165
    move-object v5, p3

    goto :goto_1

    .line 166
    :cond_1
    iget-object p4, v0, Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    invoke-interface {p4}, Lcom/itextpdf/io/source/IRandomAccessSource;->length()J

    move-result-wide v8

    cmp-long p4, v3, v8

    if-lez p4, :cond_2

    .line 167
    move-object v5, p3

    goto :goto_1

    .line 169
    :cond_2
    iget-object v2, v0, Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;->source:Lcom/itextpdf/io/source/IRandomAccessSource;

    move-object v5, p3

    .end local p3    # "bytes":[B
    .local v5, "bytes":[B
    invoke-interface/range {v2 .. v7}, Lcom/itextpdf/io/source/IRandomAccessSource;->get(J[BII)I

    move-result p3

    .line 170
    .local p3, "count":I
    if-ne p3, v1, :cond_3

    .line 171
    goto :goto_1

    .line 173
    :cond_3
    add-int/2addr v6, p3

    .line 174
    int-to-long v8, p3

    add-long/2addr p1, v8

    .line 175
    sub-int/2addr v7, p3

    .line 177
    const-wide/16 v3, 0x0

    .line 178
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->getSourceEntryForOffset(J)Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    move-result-object v0

    .line 179
    .end local p3    # "count":I
    move-object p3, v5

    goto :goto_0

    .line 161
    .end local v5    # "bytes":[B
    .local p3, "bytes":[B
    :cond_4
    move-object v5, p3

    .line 180
    .end local p3    # "bytes":[B
    .restart local v5    # "bytes":[B
    :goto_1
    if-ne v7, p5, :cond_5

    goto :goto_2

    :cond_5
    sub-int v1, p5, v7

    :goto_2
    return v1
.end method

.method protected getStartingSourceIndex(J)I
    .locals 2
    .param p1, "offset"    # J

    .line 79
    iget-object v0, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->currentSourceEntry:Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    iget-wide v0, v0, Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;->firstByte:J

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 80
    iget-object v0, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->currentSourceEntry:Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;

    iget v0, v0, Lcom/itextpdf/io/source/GroupedRandomAccessSource$SourceEntry;->index:I

    return v0

    .line 82
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public length()J
    .locals 2

    .line 188
    iget-wide v0, p0, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->size:J

    return-wide v0
.end method

.method protected sourceInUse(Lcom/itextpdf/io/source/IRandomAccessSource;)V
    .locals 0
    .param p1, "source"    # Lcom/itextpdf/io/source/IRandomAccessSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 130
    return-void
.end method

.method protected sourceReleased(Lcom/itextpdf/io/source/IRandomAccessSource;)V
    .locals 0
    .param p1, "source"    # Lcom/itextpdf/io/source/IRandomAccessSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 121
    return-void
.end method
