.class public Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;
.super Ljava/lang/Object;
.source "Jbig2SegmentReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/codec/Jbig2SegmentReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Jbig2Page"
.end annotation


# instance fields
.field public final page:I

.field public pageBitmapHeight:I

.field public pageBitmapWidth:I

.field private final segs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;",
            ">;"
        }
    .end annotation
.end field

.field private final sr:Lcom/itextpdf/io/codec/Jbig2SegmentReader;


# direct methods
.method public constructor <init>(ILcom/itextpdf/io/codec/Jbig2SegmentReader;)V
    .locals 1
    .param p1, "page"    # I
    .param p2, "sr"    # Lcom/itextpdf/io/codec/Jbig2SegmentReader;

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 135
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;->segs:Ljava/util/Map;

    .line 136
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;->pageBitmapWidth:I

    .line 137
    iput v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;->pageBitmapHeight:I

    .line 140
    iput p1, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;->page:I

    .line 141
    iput-object p2, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;->sr:Lcom/itextpdf/io/codec/Jbig2SegmentReader;

    .line 142
    return-void
.end method


# virtual methods
.method public addSegment(Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;)V
    .locals 2
    .param p1, "s"    # Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;

    .line 187
    iget-object v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;->segs:Ljava/util/Map;

    iget v1, p1, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->segmentNumber:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    return-void
.end method

.method public getData(Z)[B
    .locals 8
    .param p1, "for_embedding"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 154
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 155
    .local v0, "os":Ljava/io/ByteArrayOutputStream;
    iget-object v1, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;->segs:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 156
    .local v2, "sn":I
    iget-object v3, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Page;->segs:Ljava/util/Map;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;

    .line 160
    .local v3, "s":Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;
    if-eqz p1, :cond_1

    iget v4, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->type:I

    const/16 v5, 0x33

    if-eq v4, v5, :cond_0

    iget v4, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->type:I

    const/16 v5, 0x31

    if-ne v4, v5, :cond_1

    .line 162
    goto :goto_0

    .line 165
    :cond_1
    if-eqz p1, :cond_3

    .line 167
    iget-object v4, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->headerData:[B

    invoke-static {v4}, Lcom/itextpdf/io/codec/Jbig2SegmentReader;->copyByteArray([B)[B

    move-result-object v4

    .line 168
    .local v4, "headerData_emb":[B
    iget-boolean v5, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->page_association_size:Z

    const/4 v6, 0x1

    if-eqz v5, :cond_2

    .line 169
    iget v5, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->page_association_offset:I

    const/4 v7, 0x0

    aput-byte v7, v4, v5

    .line 170
    iget v5, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->page_association_offset:I

    add-int/2addr v5, v6

    aput-byte v7, v4, v5

    .line 171
    iget v5, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->page_association_offset:I

    add-int/lit8 v5, v5, 0x2

    aput-byte v7, v4, v5

    .line 172
    iget v5, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->page_association_offset:I

    add-int/lit8 v5, v5, 0x3

    aput-byte v6, v4, v5

    goto :goto_1

    .line 174
    :cond_2
    iget v5, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->page_association_offset:I

    aput-byte v6, v4, v5

    .line 176
    :goto_1
    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 177
    .end local v4    # "headerData_emb":[B
    goto :goto_2

    .line 178
    :cond_3
    iget-object v4, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->headerData:[B

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 180
    :goto_2
    iget-object v4, v3, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->data:[B

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 181
    .end local v2    # "sn":I
    .end local v3    # "s":Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;
    goto :goto_0

    .line 182
    :cond_4
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 183
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method
