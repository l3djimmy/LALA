.class Landroidx/camera/video/internal/audio/BufferedAudioStream$AudioData;
.super Ljava/lang/Object;
.source "BufferedAudioStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/internal/audio/BufferedAudioStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AudioData"
.end annotation


# instance fields
.field private final mByteBuffer:Ljava/nio/ByteBuffer;

.field private final mBytesPerFrame:I

.field private final mSampleRate:I

.field private mTimestampNs:J


# direct methods
.method constructor <init>(Ljava/nio/ByteBuffer;Landroidx/camera/video/internal/audio/AudioStream$PacketInfo;II)V
    .locals 4
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .param p2, "packetInfo"    # Landroidx/camera/video/internal/audio/AudioStream$PacketInfo;
    .param p3, "bytesPerFrame"    # I
    .param p4, "sampleRate"    # I

    .line 288
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 290
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 293
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    sub-int/2addr v0, v1

    .line 294
    .local v0, "bufferSize":I
    invoke-virtual {p2}, Landroidx/camera/video/internal/audio/AudioStream$PacketInfo;->getSizeInBytes()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 300
    iput p3, p0, Landroidx/camera/video/internal/audio/BufferedAudioStream$AudioData;->mBytesPerFrame:I

    .line 301
    iput p4, p0, Landroidx/camera/video/internal/audio/BufferedAudioStream$AudioData;->mSampleRate:I

    .line 302
    iput-object p1, p0, Landroidx/camera/video/internal/audio/BufferedAudioStream$AudioData;->mByteBuffer:Ljava/nio/ByteBuffer;

    .line 303
    invoke-virtual {p2}, Landroidx/camera/video/internal/audio/AudioStream$PacketInfo;->getTimestampNs()J

    move-result-wide v1

    iput-wide v1, p0, Landroidx/camera/video/internal/audio/BufferedAudioStream$AudioData;->mTimestampNs:J

    .line 304
    return-void

    .line 295
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Byte buffer size is not match with packet info: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " != "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 297
    invoke-virtual {p2}, Landroidx/camera/video/internal/audio/AudioStream$PacketInfo;->getSizeInBytes()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public getRemainingBufferSizeInBytes()I
    .locals 1

    .line 307
    iget-object v0, p0, Landroidx/camera/video/internal/audio/BufferedAudioStream$AudioData;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    return v0
.end method

.method public read(Ljava/nio/ByteBuffer;)Landroidx/camera/video/internal/audio/AudioStream$PacketInfo;
    .locals 12
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .line 311
    iget-wide v0, p0, Landroidx/camera/video/internal/audio/BufferedAudioStream$AudioData;->mTimestampNs:J

    .line 315
    .local v0, "timestampNs":J
    iget-object v2, p0, Landroidx/camera/video/internal/audio/BufferedAudioStream$AudioData;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    .line 316
    .local v2, "originalSourcePosition":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    .line 317
    .local v3, "originalDestinationPosition":I
    iget-object v4, p0, Landroidx/camera/video/internal/audio/BufferedAudioStream$AudioData;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    if-le v4, v5, :cond_0

    .line 318
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    .line 321
    .local v4, "readSizeInBytes":I
    int-to-long v5, v4

    iget v7, p0, Landroidx/camera/video/internal/audio/BufferedAudioStream$AudioData;->mBytesPerFrame:I

    invoke-static {v5, v6, v7}, Landroidx/camera/video/internal/audio/AudioUtils;->sizeToFrameCount(JI)J

    move-result-wide v5

    .line 322
    .local v5, "readFrames":J
    iget v7, p0, Landroidx/camera/video/internal/audio/BufferedAudioStream$AudioData;->mSampleRate:I

    invoke-static {v5, v6, v7}, Landroidx/camera/video/internal/audio/AudioUtils;->frameCountToDurationNs(JI)J

    move-result-wide v7

    .line 323
    .local v7, "readDurationNs":J
    iget-wide v9, p0, Landroidx/camera/video/internal/audio/BufferedAudioStream$AudioData;->mTimestampNs:J

    add-long/2addr v9, v7

    iput-wide v9, p0, Landroidx/camera/video/internal/audio/BufferedAudioStream$AudioData;->mTimestampNs:J

    .line 327
    iget-object v9, p0, Landroidx/camera/video/internal/audio/BufferedAudioStream$AudioData;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v9

    .line 328
    .local v9, "duplicatedByteBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v9, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v10

    add-int v11, v2, v4

    .line 329
    invoke-virtual {v10, v11}, Ljava/nio/Buffer;->limit(I)Ljava/nio/Buffer;

    .line 330
    invoke-virtual {p1, v9}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v10

    add-int v11, v3, v4

    .line 331
    invoke-virtual {v10, v11}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    move-result-object v10

    .line 332
    invoke-virtual {v10, v3}, Ljava/nio/Buffer;->position(I)Ljava/nio/Buffer;

    .line 334
    .end local v5    # "readFrames":J
    .end local v7    # "readDurationNs":J
    .end local v9    # "duplicatedByteBuffer":Ljava/nio/ByteBuffer;
    goto :goto_0

    .line 335
    .end local v4    # "readSizeInBytes":I
    :cond_0
    iget-object v4, p0, Landroidx/camera/video/internal/audio/BufferedAudioStream$AudioData;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    .line 338
    .restart local v4    # "readSizeInBytes":I
    iget-object v5, p0, Landroidx/camera/video/internal/audio/BufferedAudioStream$AudioData;->mByteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v5}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v5

    add-int v6, v3, v4

    .line 339
    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    move-result-object v5

    .line 340
    invoke-virtual {v5, v3}, Ljava/nio/Buffer;->position(I)Ljava/nio/Buffer;

    .line 344
    :goto_0
    iget-object v5, p0, Landroidx/camera/video/internal/audio/BufferedAudioStream$AudioData;->mByteBuffer:Ljava/nio/ByteBuffer;

    add-int v6, v2, v4

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 346
    invoke-static {v4, v0, v1}, Landroidx/camera/video/internal/audio/AudioStream$PacketInfo;->of(IJ)Landroidx/camera/video/internal/audio/AudioStream$PacketInfo;

    move-result-object v5

    return-object v5
.end method
