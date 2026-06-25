.class public Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;
.super Ljava/lang/Object;
.source "Jbig2SegmentReader.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/codec/Jbig2SegmentReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Jbig2Segment"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;",
        ">;"
    }
.end annotation


# instance fields
.field public countOfReferredToSegments:I

.field public data:[B

.field public dataLength:J

.field public deferredNonRetain:Z

.field public headerData:[B

.field public page:I

.field public page_association_offset:I

.field public page_association_size:Z

.field public referredToSegmentNumbers:[I

.field public final segmentNumber:I

.field public segmentRetentionFlags:[Z

.field public type:I


# direct methods
.method public constructor <init>(I)V
    .locals 3
    .param p1, "segment_number"    # I

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->dataLength:J

    .line 107
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->page:I

    .line 108
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->referredToSegmentNumbers:[I

    .line 109
    iput-object v1, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->segmentRetentionFlags:[Z

    .line 110
    iput v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->type:I

    .line 111
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->deferredNonRetain:Z

    .line 112
    iput v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->countOfReferredToSegments:I

    .line 113
    iput-object v1, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->data:[B

    .line 114
    iput-object v1, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->headerData:[B

    .line 115
    iput-boolean v2, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->page_association_size:Z

    .line 116
    iput v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->page_association_offset:I

    .line 119
    iput p1, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->segmentNumber:I

    .line 120
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;)I
    .locals 2
    .param p1, "s"    # Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;

    .line 123
    iget v0, p0, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->segmentNumber:I

    iget v1, p1, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->segmentNumber:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 103
    check-cast p1, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;

    invoke-virtual {p0, p1}, Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;->compareTo(Lcom/itextpdf/io/codec/Jbig2SegmentReader$Jbig2Segment;)I

    move-result p1

    return p1
.end method
