.class public final Lcom/hardlineforge/lala/data/VideoFrame;
.super Ljava/lang/Object;
.source "Entities.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0013\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0008\u0087\u0008\u0018\u00002\u00020\u0001B;\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\u0008\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\t\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\t\u0010\u0016\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0017\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0018\u001a\u00020\u0006H\u00c6\u0003J\t\u0010\u0019\u001a\u00020\u0006H\u00c6\u0003J\t\u0010\u001a\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u001b\u001a\u00020\nH\u00c6\u0003JE\u0010\u001c\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u00032\u0008\u0008\u0002\u0010\t\u001a\u00020\nH\u00c6\u0001J\u0013\u0010\u001d\u001a\u00020\u001e2\u0008\u0010\u001f\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010 \u001a\u00020\u0006H\u00d6\u0001J\t\u0010!\u001a\u00020\u0003H\u00d6\u0001R\u0016\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u000eR\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011R\u0011\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u0011R\u0011\u0010\u0008\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u000eR\u0011\u0010\t\u001a\u00020\n\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015\u00a8\u0006\""
    }
    d2 = {
        "Lcom/hardlineforge/lala/data/VideoFrame;",
        "",
        "id",
        "",
        "videoId",
        "frameNumber",
        "",
        "timeOffsetMs",
        "uri",
        "extractedAt",
        "Ljava/time/Instant;",
        "<init>",
        "(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/time/Instant;)V",
        "getId",
        "()Ljava/lang/String;",
        "getVideoId",
        "getFrameNumber",
        "()I",
        "getTimeOffsetMs",
        "getUri",
        "getExtractedAt",
        "()Ljava/time/Instant;",
        "component1",
        "component2",
        "component3",
        "component4",
        "component5",
        "component6",
        "copy",
        "equals",
        "",
        "other",
        "hashCode",
        "toString",
        "app_debug"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I


# instance fields
.field private final extractedAt:Ljava/time/Instant;

.field private final frameNumber:I

.field private final id:Ljava/lang/String;

.field private final timeOffsetMs:I

.field private final uri:Ljava/lang/String;

.field private final videoId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/hardlineforge/lala/data/VideoFrame;->$stable:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/time/Instant;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "videoId"    # Ljava/lang/String;
    .param p3, "frameNumber"    # I
    .param p4, "timeOffsetMs"    # I
    .param p5, "uri"    # Ljava/lang/String;
    .param p6, "extractedAt"    # Ljava/time/Instant;

    const-string v0, "id"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "videoId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "uri"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "extractedAt"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-object p1, p0, Lcom/hardlineforge/lala/data/VideoFrame;->id:Ljava/lang/String;

    .line 73
    iput-object p2, p0, Lcom/hardlineforge/lala/data/VideoFrame;->videoId:Ljava/lang/String;

    .line 74
    iput p3, p0, Lcom/hardlineforge/lala/data/VideoFrame;->frameNumber:I

    .line 75
    iput p4, p0, Lcom/hardlineforge/lala/data/VideoFrame;->timeOffsetMs:I

    .line 76
    iput-object p5, p0, Lcom/hardlineforge/lala/data/VideoFrame;->uri:Ljava/lang/String;

    .line 77
    iput-object p6, p0, Lcom/hardlineforge/lala/data/VideoFrame;->extractedAt:Ljava/time/Instant;

    .line 71
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/time/Instant;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 7

    .line 71
    and-int/lit8 p8, p7, 0x1

    if-eqz p8, :cond_0

    .line 72
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p8, "toString(...)"

    invoke-static {p1, p8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v1, p1

    goto :goto_0

    .line 71
    :cond_0
    move-object v1, p1

    :goto_0
    and-int/lit8 p1, p7, 0x20

    if-eqz p1, :cond_1

    .line 77
    invoke-static {}, Ljava/time/Instant;->now()Ljava/time/Instant;

    move-result-object p6

    const-string p1, "now(...)"

    invoke-static {p6, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v6, p6

    goto :goto_1

    .line 71
    :cond_1
    move-object v6, p6

    :goto_1
    move-object v0, p0

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/hardlineforge/lala/data/VideoFrame;-><init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/time/Instant;)V

    .line 78
    return-void
.end method

.method public static synthetic copy$default(Lcom/hardlineforge/lala/data/VideoFrame;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/time/Instant;ILjava/lang/Object;)Lcom/hardlineforge/lala/data/VideoFrame;
    .locals 0

    and-int/lit8 p8, p7, 0x1

    if-eqz p8, :cond_0

    iget-object p1, p0, Lcom/hardlineforge/lala/data/VideoFrame;->id:Ljava/lang/String;

    :cond_0
    and-int/lit8 p8, p7, 0x2

    if-eqz p8, :cond_1

    iget-object p2, p0, Lcom/hardlineforge/lala/data/VideoFrame;->videoId:Ljava/lang/String;

    :cond_1
    and-int/lit8 p8, p7, 0x4

    if-eqz p8, :cond_2

    iget p3, p0, Lcom/hardlineforge/lala/data/VideoFrame;->frameNumber:I

    :cond_2
    and-int/lit8 p8, p7, 0x8

    if-eqz p8, :cond_3

    iget p4, p0, Lcom/hardlineforge/lala/data/VideoFrame;->timeOffsetMs:I

    :cond_3
    and-int/lit8 p8, p7, 0x10

    if-eqz p8, :cond_4

    iget-object p5, p0, Lcom/hardlineforge/lala/data/VideoFrame;->uri:Ljava/lang/String;

    :cond_4
    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_5

    iget-object p6, p0, Lcom/hardlineforge/lala/data/VideoFrame;->extractedAt:Ljava/time/Instant;

    :cond_5
    move-object p7, p5

    move-object p8, p6

    move p5, p3

    move p6, p4

    move-object p3, p1

    move-object p4, p2

    move-object p2, p0

    invoke-virtual/range {p2 .. p8}, Lcom/hardlineforge/lala/data/VideoFrame;->copy(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/time/Instant;)Lcom/hardlineforge/lala/data/VideoFrame;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/VideoFrame;->id:Ljava/lang/String;

    return-object v0
.end method

.method public final component2()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/VideoFrame;->videoId:Ljava/lang/String;

    return-object v0
.end method

.method public final component3()I
    .locals 1

    iget v0, p0, Lcom/hardlineforge/lala/data/VideoFrame;->frameNumber:I

    return v0
.end method

.method public final component4()I
    .locals 1

    iget v0, p0, Lcom/hardlineforge/lala/data/VideoFrame;->timeOffsetMs:I

    return v0
.end method

.method public final component5()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/VideoFrame;->uri:Ljava/lang/String;

    return-object v0
.end method

.method public final component6()Ljava/time/Instant;
    .locals 1

    iget-object v0, p0, Lcom/hardlineforge/lala/data/VideoFrame;->extractedAt:Ljava/time/Instant;

    return-object v0
.end method

.method public final copy(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/time/Instant;)Lcom/hardlineforge/lala/data/VideoFrame;
    .locals 8

    const-string v0, "id"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "videoId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "uri"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "extractedAt"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lcom/hardlineforge/lala/data/VideoFrame;

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v1 .. v7}, Lcom/hardlineforge/lala/data/VideoFrame;-><init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/time/Instant;)V

    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/hardlineforge/lala/data/VideoFrame;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/hardlineforge/lala/data/VideoFrame;

    iget-object v3, p0, Lcom/hardlineforge/lala/data/VideoFrame;->id:Ljava/lang/String;

    iget-object v4, v1, Lcom/hardlineforge/lala/data/VideoFrame;->id:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    return v2

    :cond_2
    iget-object v3, p0, Lcom/hardlineforge/lala/data/VideoFrame;->videoId:Ljava/lang/String;

    iget-object v4, v1, Lcom/hardlineforge/lala/data/VideoFrame;->videoId:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    return v2

    :cond_3
    iget v3, p0, Lcom/hardlineforge/lala/data/VideoFrame;->frameNumber:I

    iget v4, v1, Lcom/hardlineforge/lala/data/VideoFrame;->frameNumber:I

    if-eq v3, v4, :cond_4

    return v2

    :cond_4
    iget v3, p0, Lcom/hardlineforge/lala/data/VideoFrame;->timeOffsetMs:I

    iget v4, v1, Lcom/hardlineforge/lala/data/VideoFrame;->timeOffsetMs:I

    if-eq v3, v4, :cond_5

    return v2

    :cond_5
    iget-object v3, p0, Lcom/hardlineforge/lala/data/VideoFrame;->uri:Ljava/lang/String;

    iget-object v4, v1, Lcom/hardlineforge/lala/data/VideoFrame;->uri:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    return v2

    :cond_6
    iget-object v3, p0, Lcom/hardlineforge/lala/data/VideoFrame;->extractedAt:Ljava/time/Instant;

    iget-object v1, v1, Lcom/hardlineforge/lala/data/VideoFrame;->extractedAt:Ljava/time/Instant;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    return v2

    :cond_7
    return v0
.end method

.method public final getExtractedAt()Ljava/time/Instant;
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/hardlineforge/lala/data/VideoFrame;->extractedAt:Ljava/time/Instant;

    return-object v0
.end method

.method public final getFrameNumber()I
    .locals 1

    .line 74
    iget v0, p0, Lcom/hardlineforge/lala/data/VideoFrame;->frameNumber:I

    return v0
.end method

.method public final getId()Ljava/lang/String;
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/hardlineforge/lala/data/VideoFrame;->id:Ljava/lang/String;

    return-object v0
.end method

.method public final getTimeOffsetMs()I
    .locals 1

    .line 75
    iget v0, p0, Lcom/hardlineforge/lala/data/VideoFrame;->timeOffsetMs:I

    return v0
.end method

.method public final getUri()Ljava/lang/String;
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/hardlineforge/lala/data/VideoFrame;->uri:Ljava/lang/String;

    return-object v0
.end method

.method public final getVideoId()Ljava/lang/String;
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/hardlineforge/lala/data/VideoFrame;->videoId:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lcom/hardlineforge/lala/data/VideoFrame;->id:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/hardlineforge/lala/data/VideoFrame;->videoId:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget v2, p0, Lcom/hardlineforge/lala/data/VideoFrame;->frameNumber:I

    invoke-static {v2}, Ljava/lang/Integer;->hashCode(I)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/hardlineforge/lala/data/VideoFrame;->timeOffsetMs:I

    invoke-static {v2}, Ljava/lang/Integer;->hashCode(I)I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/hardlineforge/lala/data/VideoFrame;->uri:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/hardlineforge/lala/data/VideoFrame;->extractedAt:Ljava/time/Instant;

    invoke-virtual {v2}, Ljava/time/Instant;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 8

    iget-object v0, p0, Lcom/hardlineforge/lala/data/VideoFrame;->id:Ljava/lang/String;

    iget-object v1, p0, Lcom/hardlineforge/lala/data/VideoFrame;->videoId:Ljava/lang/String;

    iget v2, p0, Lcom/hardlineforge/lala/data/VideoFrame;->frameNumber:I

    iget v3, p0, Lcom/hardlineforge/lala/data/VideoFrame;->timeOffsetMs:I

    iget-object v4, p0, Lcom/hardlineforge/lala/data/VideoFrame;->uri:Ljava/lang/String;

    iget-object v5, p0, Lcom/hardlineforge/lala/data/VideoFrame;->extractedAt:Ljava/time/Instant;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "VideoFrame(id="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, ", videoId="

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", frameNumber="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", timeOffsetMs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", uri="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", extractedAt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
