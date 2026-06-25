.class public Landroidx/camera/video/internal/encoder/EncoderImpl;
.super Ljava/lang/Object;
.source "EncoderImpl.java"

# interfaces
.implements Landroidx/camera/video/internal/encoder/Encoder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;,
        Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;,
        Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;,
        Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;,
        Landroidx/camera/video/internal/encoder/EncoderImpl$Api23Impl;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final FAKE_BUFFER_INDEX:I = -0x270f

.field private static final NO_LIMIT_LONG:J = 0x7fffffffffffffffL

.field private static final NO_RANGE:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private static final STOP_TIMEOUT_MS:J = 0x3e8L


# instance fields
.field private final mAcquisitionQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Landroidx/camera/video/internal/encoder/InputBuffer;",
            ">;>;"
        }
    .end annotation
.end field

.field final mActivePauseResumeTimeRanges:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Landroid/util/Range<",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation
.end field

.field final mEncodedDataSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/video/internal/encoder/EncodedDataImpl;",
            ">;"
        }
    .end annotation
.end field

.field mEncoderCallback:Landroidx/camera/video/internal/encoder/EncoderCallback;

.field mEncoderCallbackExecutor:Ljava/util/concurrent/Executor;

.field final mEncoderExecutor:Ljava/util/concurrent/Executor;

.field final mEncoderFinder:Landroidx/camera/video/internal/workaround/EncoderFinder;

.field private final mEncoderInfo:Landroidx/camera/video/internal/encoder/EncoderInfo;

.field final mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

.field final mFreeInputBufferIndexQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mInputBufferSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/video/internal/encoder/InputBuffer;",
            ">;"
        }
    .end annotation
.end field

.field final mInputTimebase:Landroidx/camera/core/impl/Timebase;

.field private mIsFlushedAfterEndOfStream:Z

.field final mIsVideoEncoder:Z

.field mLastDataStopTimestamp:Ljava/lang/Long;

.field final mLock:Ljava/lang/Object;

.field final mMediaCodec:Landroid/media/MediaCodec;

.field private mMediaCodecCallback:Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;

.field mMediaCodecEosSignalled:Z

.field private final mMediaFormat:Landroid/media/MediaFormat;

.field mPendingCodecStop:Z

.field private final mReleasedCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final mReleasedFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mSourceStoppedSignalled:Z

.field mStartStopTimeRangeUs:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

.field mStopTimeoutFuture:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation
.end field

.field final mTag:Ljava/lang/String;

.field final mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

.field mTotalPausedDurationUs:J


# direct methods
.method public static synthetic $r8$lambda$SlAnbggd9lEp59VusripYrYneuw(Landroidx/camera/video/internal/encoder/EncoderImpl;)V
    .locals 0

    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->signalEndOfInputStream()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 149
    const-wide v0, 0x7fffffffffffffffL

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v0, v0}, Landroid/util/Range;->create(Ljava/lang/Comparable;Ljava/lang/Comparable;)Landroid/util/Range;

    move-result-object v0

    sput-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl;->NO_RANGE:Landroid/util/Range;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/encoder/EncoderConfig;)V
    .locals 3
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "encoderConfig"    # Landroidx/camera/video/internal/encoder/EncoderConfig;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/encoder/InvalidConfigException;
        }
    .end annotation

    .line 222
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mLock:Ljava/lang/Object;

    .line 169
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mFreeInputBufferIndexQueue:Ljava/util/Queue;

    .line 171
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mAcquisitionQueue:Ljava/util/Queue;

    .line 172
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mInputBufferSet:Ljava/util/Set;

    .line 173
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncodedDataSet:Ljava/util/Set;

    .line 181
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mActivePauseResumeTimeRanges:Ljava/util/Deque;

    .line 184
    new-instance v0, Landroidx/camera/video/internal/encoder/SystemTimeProvider;

    invoke-direct {v0}, Landroidx/camera/video/internal/encoder/SystemTimeProvider;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

    .line 186
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderCallback;->EMPTY:Landroidx/camera/video/internal/encoder/EncoderCallback;

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderCallback:Landroidx/camera/video/internal/encoder/EncoderCallback;

    .line 189
    nop

    .line 191
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 194
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl;->NO_RANGE:Landroid/util/Range;

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStartStopTimeRangeUs:Landroid/util/Range;

    .line 196
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTotalPausedDurationUs:J

    .line 198
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mPendingCodecStop:Z

    .line 202
    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mLastDataStopTimestamp:Ljava/lang/Long;

    .line 204
    iput-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStopTimeoutFuture:Ljava/util/concurrent/Future;

    .line 206
    iput-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodecCallback:Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;

    .line 208
    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsFlushedAfterEndOfStream:Z

    .line 209
    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mSourceStoppedSignalled:Z

    .line 210
    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodecEosSignalled:Z

    .line 212
    new-instance v1, Landroidx/camera/video/internal/workaround/EncoderFinder;

    invoke-direct {v1}, Landroidx/camera/video/internal/workaround/EncoderFinder;-><init>()V

    iput-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderFinder:Landroidx/camera/video/internal/workaround/EncoderFinder;

    .line 223
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    invoke-static {p2}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    invoke-static {p1}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->newSequentialExecutor(Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Executor;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    .line 228
    instance-of v1, p2, Landroidx/camera/video/internal/encoder/AudioEncoderConfig;

    if-eqz v1, :cond_0

    .line 229
    const-string v1, "AudioEncoder"

    iput-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    .line 230
    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsVideoEncoder:Z

    .line 231
    new-instance v0, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;

    invoke-direct {v0, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    goto :goto_0

    .line 232
    :cond_0
    instance-of v0, p2, Landroidx/camera/video/internal/encoder/VideoEncoderConfig;

    if-eqz v0, :cond_2

    .line 233
    const-string/jumbo v0, "VideoEncoder"

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    .line 234
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsVideoEncoder:Z

    .line 235
    new-instance v0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;

    invoke-direct {v0, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    .line 240
    :goto_0
    invoke-interface {p2}, Landroidx/camera/video/internal/encoder/EncoderConfig;->getInputTimebase()Landroidx/camera/core/impl/Timebase;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mInputTimebase:Landroidx/camera/core/impl/Timebase;

    .line 241
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "mInputTimebase = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mInputTimebase:Landroidx/camera/core/impl/Timebase;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    invoke-interface {p2}, Landroidx/camera/video/internal/encoder/EncoderConfig;->toMediaFormat()Landroid/media/MediaFormat;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaFormat:Landroid/media/MediaFormat;

    .line 243
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "mMediaFormat = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaFormat:Landroid/media/MediaFormat;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderFinder:Landroidx/camera/video/internal/workaround/EncoderFinder;

    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaFormat:Landroid/media/MediaFormat;

    invoke-virtual {v0, v1}, Landroidx/camera/video/internal/workaround/EncoderFinder;->findEncoder(Landroid/media/MediaFormat;)Landroid/media/MediaCodec;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    .line 245
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Selected encoder: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v2}, Landroid/media/MediaCodec;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    iget-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsVideoEncoder:Z

    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->getCodecInfo()Landroid/media/MediaCodecInfo;

    move-result-object v1

    .line 247
    invoke-interface {p2}, Landroidx/camera/video/internal/encoder/EncoderConfig;->getMimeType()Ljava/lang/String;

    move-result-object v2

    .line 246
    invoke-static {v0, v1, v2}, Landroidx/camera/video/internal/encoder/EncoderImpl;->createEncoderInfo(ZLandroid/media/MediaCodecInfo;Ljava/lang/String;)Landroidx/camera/video/internal/encoder/EncoderInfo;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInfo:Landroidx/camera/video/internal/encoder/EncoderInfo;

    .line 248
    iget-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsVideoEncoder:Z

    if-eqz v0, :cond_1

    .line 249
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInfo:Landroidx/camera/video/internal/encoder/EncoderInfo;

    check-cast v0, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;

    .line 250
    .local v0, "videoEncoderInfo":Landroidx/camera/video/internal/encoder/VideoEncoderInfo;
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaFormat:Landroid/media/MediaFormat;

    invoke-direct {p0, v0, v1}, Landroidx/camera/video/internal/encoder/EncoderImpl;->clampVideoBitrateIfNotSupported(Landroidx/camera/video/internal/encoder/VideoEncoderInfo;Landroid/media/MediaFormat;)V

    .line 254
    .end local v0    # "videoEncoderInfo":Landroidx/camera/video/internal/encoder/VideoEncoderInfo;
    :cond_1
    :try_start_0
    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->reset()V
    :try_end_0
    .catch Landroid/media/MediaCodec$CodecException; {:try_start_0 .. :try_end_0} :catch_0

    .line 257
    nop

    .line 259
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 260
    .local v0, "releaseFutureRef":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Ljava/lang/Void;>;>;"
    new-instance v1, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda15;

    invoke-direct {v1, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda15;-><init>(Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 261
    invoke-static {v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    .line 260
    invoke-static {v1}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mReleasedFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 265
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    iput-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mReleasedCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 267
    sget-object v1, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->CONFIGURED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v1}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 268
    return-void

    .line 255
    .end local v0    # "releaseFutureRef":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Ljava/lang/Void;>;>;"
    :catch_0
    move-exception v0

    .line 256
    .local v0, "e":Landroid/media/MediaCodec$CodecException;
    new-instance v1, Landroidx/camera/video/internal/encoder/InvalidConfigException;

    invoke-direct {v1, v0}, Landroidx/camera/video/internal/encoder/InvalidConfigException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 237
    .end local v0    # "e":Landroid/media/MediaCodec$CodecException;
    :cond_2
    new-instance v0, Landroidx/camera/video/internal/encoder/InvalidConfigException;

    const-string/jumbo v1, "Unknown encoder config type"

    invoke-direct {v0, v1}, Landroidx/camera/video/internal/encoder/InvalidConfigException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private clampVideoBitrateIfNotSupported(Landroidx/camera/video/internal/encoder/VideoEncoderInfo;Landroid/media/MediaFormat;)V
    .locals 5
    .param p1, "videoEncoderInfo"    # Landroidx/camera/video/internal/encoder/VideoEncoderInfo;
    .param p2, "mediaFormat"    # Landroid/media/MediaFormat;

    .line 279
    iget-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsVideoEncoder:Z

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 280
    const-string/jumbo v0, "bitrate"

    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 281
    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v1

    .line 282
    .local v1, "origBitrate":I
    invoke-interface {p1}, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;->getSupportedBitrateRange()Landroid/util/Range;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/util/Range;->clamp(Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 283
    .local v2, "newBitrate":I
    if-eq v1, v2, :cond_0

    .line 284
    invoke-virtual {p2, v0, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 285
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "updated bitrate from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 288
    .end local v1    # "origBitrate":I
    .end local v2    # "newBitrate":I
    :cond_0
    return-void
.end method

.method private static createEncoderInfo(ZLandroid/media/MediaCodecInfo;Ljava/lang/String;)Landroidx/camera/video/internal/encoder/EncoderInfo;
    .locals 1
    .param p0, "isVideoEncoder"    # Z
    .param p1, "codecInfo"    # Landroid/media/MediaCodecInfo;
    .param p2, "mime"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/encoder/InvalidConfigException;
        }
    .end annotation

    .line 1014
    if-eqz p0, :cond_0

    new-instance v0, Landroidx/camera/video/internal/encoder/VideoEncoderInfoImpl;

    invoke-direct {v0, p1, p2}, Landroidx/camera/video/internal/encoder/VideoEncoderInfoImpl;-><init>(Landroid/media/MediaCodecInfo;Ljava/lang/String;)V

    goto :goto_0

    .line 1015
    :cond_0
    new-instance v0, Landroidx/camera/video/internal/encoder/AudioEncoderInfoImpl;

    invoke-direct {v0, p1, p2}, Landroidx/camera/video/internal/encoder/AudioEncoderInfoImpl;-><init>(Landroid/media/MediaCodecInfo;Ljava/lang/String;)V

    .line 1014
    :goto_0
    return-object v0
.end method

.method static hasEndOfStreamFlag(Landroid/media/MediaCodec$BufferInfo;)Z
    .locals 1
    .param p0, "bufferInfo"    # Landroid/media/MediaCodec$BufferInfo;

    .line 1030
    iget v0, p0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static isKeyFrame(Landroid/media/MediaCodec$BufferInfo;)Z
    .locals 2
    .param p0, "bufferInfo"    # Landroid/media/MediaCodec$BufferInfo;

    .line 1025
    iget v0, p0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method static synthetic lambda$acquireInputBuffer$12(Ljava/util/concurrent/atomic/AtomicReference;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 1
    .param p0, "ref"    # Ljava/util/concurrent/atomic/AtomicReference;
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 967
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 968
    const-string/jumbo v0, "acquireInputBuffer"

    return-object v0
.end method

.method static synthetic lambda$new$0(Ljava/util/concurrent/atomic/AtomicReference;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 1
    .param p0, "releaseFutureRef"    # Ljava/util/concurrent/atomic/AtomicReference;
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 262
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 263
    const-string/jumbo v0, "mReleasedFuture"

    return-object v0
.end method

.method static synthetic lambda$notifyError$10(Landroidx/camera/video/internal/encoder/EncoderCallback;ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p0, "callback"    # Landroidx/camera/video/internal/encoder/EncoderCallback;
    .param p1, "error"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;

    .line 821
    new-instance v0, Landroidx/camera/video/internal/encoder/EncodeException;

    invoke-direct {v0, p1, p2, p3}, Landroidx/camera/video/internal/encoder/EncodeException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-interface {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderCallback;->onEncodeError(Landroidx/camera/video/internal/encoder/EncodeException;)V

    return-void
.end method

.method private releaseInternal()V
    .locals 2

    .line 654
    iget-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsFlushedAfterEndOfStream:Z

    if-eqz v0, :cond_0

    .line 655
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 656
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsFlushedAfterEndOfStream:Z

    .line 659
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 661
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    instance-of v0, v0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;

    if-eqz v0, :cond_1

    .line 662
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    check-cast v0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;

    invoke-virtual {v0}, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->releaseSurface()V

    .line 665
    :cond_1
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->RELEASED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 667
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mReleasedCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 668
    return-void
.end method

.method private reset()V
    .locals 4

    .line 292
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl;->NO_RANGE:Landroid/util/Range;

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStartStopTimeRangeUs:Landroid/util/Range;

    .line 293
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTotalPausedDurationUs:J

    .line 294
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mActivePauseResumeTimeRanges:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->clear()V

    .line 295
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mFreeInputBufferIndexQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    .line 298
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mAcquisitionQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 299
    .local v1, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    invoke-virtual {v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setCancelled()Z

    .line 300
    .end local v1    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    goto :goto_0

    .line 301
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mAcquisitionQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    .line 303
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->reset()V

    .line 304
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsFlushedAfterEndOfStream:Z

    .line 305
    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mSourceStoppedSignalled:Z

    .line 306
    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodecEosSignalled:Z

    .line 307
    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mPendingCodecStop:Z

    .line 308
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStopTimeoutFuture:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 309
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStopTimeoutFuture:Ljava/util/concurrent/Future;

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 310
    iput-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStopTimeoutFuture:Ljava/util/concurrent/Future;

    .line 312
    :cond_1
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodecCallback:Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;

    if-eqz v0, :cond_2

    .line 313
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodecCallback:Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;

    invoke-virtual {v0}, Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;->stop()V

    .line 315
    :cond_2
    new-instance v0, Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;

    invoke-direct {v0, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodecCallback:Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;

    .line 316
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodecCallback:Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;

    invoke-virtual {v0, v3}, Landroid/media/MediaCodec;->setCallback(Landroid/media/MediaCodec$Callback;)V

    .line 318
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaFormat:Landroid/media/MediaFormat;

    invoke-virtual {v0, v3, v2, v2, v1}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 320
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    instance-of v0, v0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;

    if-eqz v0, :cond_3

    .line 321
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    check-cast v0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;

    invoke-virtual {v0}, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->resetSurface()V

    .line 323
    :cond_3
    return-void
.end method

.method private setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V
    .locals 3
    .param p1, "state"    # Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    .line 711
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    if-ne v0, p1, :cond_0

    .line 712
    return-void

    .line 714
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Transitioning encoder internal state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " --> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 715
    iput-object p1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    .line 716
    return-void
.end method

.method private signalEndOfInputStream()V
    .locals 3

    .line 736
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->acquireInputBuffer()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/video/internal/encoder/EncoderImpl$1;

    invoke-direct {v1, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$1;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 772
    return-void
.end method


# virtual methods
.method acquireInputBuffer()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/video/internal/encoder/InputBuffer;",
            ">;"
        }
    .end annotation

    .line 954
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$2;->$SwitchMap$androidx$camera$video$internal$encoder$EncoderImpl$InternalState:[I

    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v1}, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 983
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unknown state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 980
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Encoder is released."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 977
    :pswitch_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Encoder is in error state."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 964
    :pswitch_2
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 965
    .local v0, "ref":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;>;"
    new-instance v1, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda12;

    invoke-direct {v1, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda12;-><init>(Ljava/util/concurrent/atomic/AtomicReference;)V

    invoke-static {v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    .line 970
    .local v1, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-static {v2}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 971
    .local v2, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mAcquisitionQueue:Ljava/util/Queue;

    invoke-interface {v3, v2}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 972
    new-instance v3, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda13;

    invoke-direct {v3, p0, v2}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda13;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    iget-object v4, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {v2, v3, v4}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->addCancellationListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 974
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->matchAcquisitionsAndFreeBufferIndexes()V

    .line 975
    return-object v1

    .line 956
    .end local v0    # "ref":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;>;"
    .end local v1    # "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    .end local v2    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    :pswitch_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Encoder is not started yet."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method generatePresentationTimeUs()J
    .locals 2

    .line 1020
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/TimeProvider;->uptimeUs()J

    move-result-wide v0

    return-wide v0
.end method

.method getAdjustedTimeUs(Landroid/media/MediaCodec$BufferInfo;)J
    .locals 4
    .param p1, "bufferInfo"    # Landroid/media/MediaCodec$BufferInfo;

    .line 927
    iget-wide v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTotalPausedDurationUs:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 928
    iget-wide v0, p1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iget-wide v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTotalPausedDurationUs:J

    sub-long/2addr v0, v2

    .local v0, "adjustedTimeUs":J
    goto :goto_0

    .line 930
    .end local v0    # "adjustedTimeUs":J
    :cond_0
    iget-wide v0, p1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 932
    .restart local v0    # "adjustedTimeUs":J
    :goto_0
    return-wide v0
.end method

.method public getConfiguredBitrate()I
    .locals 3

    .line 340
    const/4 v0, 0x0

    .line 341
    .local v0, "configuredBitrate":I
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaFormat:Landroid/media/MediaFormat;

    const-string/jumbo v2, "bitrate"

    invoke-virtual {v1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 342
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaFormat:Landroid/media/MediaFormat;

    invoke-virtual {v1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v0

    .line 344
    :cond_0
    return v0
.end method

.method public getEncoderInfo()Landroidx/camera/video/internal/encoder/EncoderInfo;
    .locals 1

    .line 335
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInfo:Landroidx/camera/video/internal/encoder/EncoderInfo;

    return-object v0
.end method

.method public getInput()Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;
    .locals 1

    .line 329
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    return-object v0
.end method

.method public getReleasedFuture()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 631
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mReleasedFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    return-object v0
.end method

.method handleEncodeError(ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "error"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;

    .line 784
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$2;->$SwitchMap$androidx$camera$video$internal$encoder$EncoderImpl$InternalState:[I

    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v1}, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 801
    :pswitch_0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Get more than one error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p3}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 803
    goto :goto_0

    .line 796
    :pswitch_1
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->ERROR:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 797
    new-instance v0, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda7;

    invoke-direct {v0, p0, p1, p2, p3}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda7;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->stopMediaCodec(Ljava/lang/Runnable;)V

    .line 798
    goto :goto_0

    .line 787
    :pswitch_2
    invoke-virtual {p0, p1, p2, p3}, Landroidx/camera/video/internal/encoder/EncoderImpl;->notifyError(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 788
    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->reset()V

    .line 789
    nop

    .line 808
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method handleEncodeError(Landroid/media/MediaCodec$CodecException;)V
    .locals 2
    .param p1, "e"    # Landroid/media/MediaCodec$CodecException;

    .line 777
    const/4 v0, 0x1

    invoke-virtual {p1}, Landroid/media/MediaCodec$CodecException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1, p1}, Landroidx/camera/video/internal/encoder/EncoderImpl;->handleEncodeError(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 778
    return-void
.end method

.method handleStopped()V
    .locals 2

    .line 886
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    sget-object v1, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->PENDING_RELEASE:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    if-ne v0, v1, :cond_0

    .line 887
    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->releaseInternal()V

    goto :goto_0

    .line 889
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    .line 890
    .local v0, "oldState":Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;
    iget-boolean v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsFlushedAfterEndOfStream:Z

    if-nez v1, :cond_1

    .line 894
    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->reset()V

    .line 896
    :cond_1
    sget-object v1, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->CONFIGURED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v1}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 897
    sget-object v1, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->PENDING_START:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    if-eq v0, v1, :cond_2

    sget-object v1, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->PENDING_START_PAUSED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    if-ne v0, v1, :cond_3

    .line 898
    :cond_2
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->start()V

    .line 899
    sget-object v1, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->PENDING_START_PAUSED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    if-ne v0, v1, :cond_3

    .line 900
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->pause()V

    .line 904
    .end local v0    # "oldState":Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;
    :cond_3
    :goto_0
    return-void
.end method

.method isInPauseRange(J)Z
    .locals 5
    .param p1, "timeUs"    # J

    .line 938
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mActivePauseResumeTimeRanges:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Range;

    .line 939
    .local v1, "range":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Long;>;"
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/util/Range;->contains(Ljava/lang/Comparable;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 940
    const/4 v0, 0x1

    return v0

    .line 941
    :cond_0
    invoke-virtual {v1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    cmp-long v3, p1, v3

    if-gez v3, :cond_1

    .line 943
    return v2

    .line 946
    .end local v1    # "range":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Long;>;"
    :cond_1
    goto :goto_0

    .line 947
    :cond_2
    return v2
.end method

.method synthetic lambda$acquireInputBuffer$13$androidx-camera-video-internal-encoder-EncoderImpl(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 1
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 972
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mAcquisitionQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method synthetic lambda$handleEncodeError$9$androidx-camera-video-internal-encoder-EncoderImpl(ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "error"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;

    .line 797
    invoke-virtual {p0, p1, p2, p3}, Landroidx/camera/video/internal/encoder/EncoderImpl;->notifyError(ILjava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method synthetic lambda$matchAcquisitionsAndFreeBufferIndexes$14$androidx-camera-video-internal-encoder-EncoderImpl(Landroidx/camera/video/internal/encoder/InputBufferImpl;)V
    .locals 1
    .param p1, "inputBuffer"    # Landroidx/camera/video/internal/encoder/InputBufferImpl;

    .line 1004
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mInputBufferSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method synthetic lambda$pause$5$androidx-camera-video-internal-encoder-EncoderImpl(J)V
    .locals 4
    .param p1, "pauseTriggerTimeUs"    # J

    .line 567
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$2;->$SwitchMap$androidx$camera$video$internal$encoder$EncoderImpl$InternalState:[I

    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v1}, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 589
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unknown state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 587
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Encoder is released"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 576
    :pswitch_1
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->PENDING_START_PAUSED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 577
    goto :goto_0

    .line 580
    :pswitch_2
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Pause on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1, p2}, Landroidx/camera/video/internal/DebugUtils;->readableUs(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 581
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mActivePauseResumeTimeRanges:Ljava/util/Deque;

    .line 582
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-wide v2, 0x7fffffffffffffffL

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Range;->create(Ljava/lang/Comparable;Ljava/lang/Comparable;)Landroid/util/Range;

    move-result-object v1

    .line 581
    invoke-interface {v0, v1}, Ljava/util/Deque;->addLast(Ljava/lang/Object;)V

    .line 583
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->PAUSED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 584
    goto :goto_0

    .line 574
    :pswitch_3
    nop

    .line 591
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method

.method synthetic lambda$release$6$androidx-camera-video-internal-encoder-EncoderImpl()V
    .locals 3

    .line 605
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$2;->$SwitchMap$androidx$camera$video$internal$encoder$EncoderImpl$InternalState:[I

    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v1}, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 622
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unknown state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 620
    :pswitch_0
    goto :goto_0

    .line 615
    :pswitch_1
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->PENDING_RELEASE:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 616
    goto :goto_0

    .line 610
    :pswitch_2
    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->releaseInternal()V

    .line 611
    nop

    .line 624
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method synthetic lambda$requestKeyFrame$8$androidx-camera-video-internal-encoder-EncoderImpl()V
    .locals 2

    .line 690
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$2;->$SwitchMap$androidx$camera$video$internal$encoder$EncoderImpl$InternalState:[I

    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v1}, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 704
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Encoder is released"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 692
    :pswitch_1
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->requestKeyFrameToMediaCodec()V

    .line 693
    goto :goto_0

    .line 701
    :pswitch_2
    nop

    .line 706
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method synthetic lambda$signalSourceStopped$7$androidx-camera-video-internal-encoder-EncoderImpl()V
    .locals 1

    .line 644
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mSourceStoppedSignalled:Z

    .line 645
    iget-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsFlushedAfterEndOfStream:Z

    if-eqz v0, :cond_0

    .line 646
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 647
    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->reset()V

    .line 649
    :cond_0
    return-void
.end method

.method synthetic lambda$start$1$androidx-camera-video-internal-encoder-EncoderImpl(J)V
    .locals 9
    .param p1, "startTriggerTimeUs"    # J

    .line 361
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$2;->$SwitchMap$androidx$camera$video$internal$encoder$EncoderImpl$InternalState:[I

    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v1}, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const-wide v1, 0x7fffffffffffffffL

    const/4 v3, 0x0

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_0

    .line 440
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unknown state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 438
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Encoder is released"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 434
    :pswitch_1
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->PENDING_START:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 435
    goto/16 :goto_2

    .line 388
    :pswitch_2
    iput-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mLastDataStopTimestamp:Ljava/lang/Long;

    .line 390
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mActivePauseResumeTimeRanges:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->removeLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Range;

    .line 391
    .local v0, "pauseRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Long;>;"
    const/4 v3, 0x0

    if-eqz v0, :cond_0

    .line 392
    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    cmp-long v1, v5, v1

    if-nez v1, :cond_0

    move v1, v4

    goto :goto_0

    :cond_0
    move v1, v3

    .line 391
    :goto_0
    const-string/jumbo v2, "There should be a \"pause\" before \"resume\""

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 394
    invoke-virtual {v0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 395
    .local v1, "pauseTimeUs":J
    iget-object v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mActivePauseResumeTimeRanges:Ljava/util/Deque;

    .line 396
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Range;->create(Ljava/lang/Comparable;Ljava/lang/Comparable;)Landroid/util/Range;

    move-result-object v6

    .line 395
    invoke-interface {v5, v6}, Ljava/util/Deque;->addLast(Ljava/lang/Object;)V

    .line 400
    iget-object v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Resume on "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {p1, p2}, Landroidx/camera/video/internal/DebugUtils;->readableUs(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\nPaused duration = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sub-long v7, p1, v1

    .line 401
    invoke-static {v7, v8}, Landroidx/camera/video/internal/DebugUtils;->readableUs(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 400
    invoke-static {v5, v6}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 405
    iget-boolean v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsVideoEncoder:Z

    if-nez v5, :cond_1

    const-class v5, Landroidx/camera/video/internal/compat/quirk/AudioEncoderIgnoresInputTimestampQuirk;

    invoke-static {v5}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v5

    if-eqz v5, :cond_1

    goto :goto_1

    .line 409
    :cond_1
    iget-boolean v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsVideoEncoder:Z

    if-eqz v5, :cond_2

    const-class v5, Landroidx/camera/video/internal/compat/quirk/VideoEncoderSuspendDoesNotIncludeSuspendTimeQuirk;

    invoke-static {v5}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v5

    if-eqz v5, :cond_2

    goto :goto_1

    .line 414
    :cond_2
    invoke-virtual {p0, v3}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setMediaCodecPaused(Z)V

    .line 415
    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    instance-of v3, v3, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;

    if-eqz v3, :cond_3

    .line 416
    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    check-cast v3, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;

    invoke-virtual {v3, v4}, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;->setActive(Z)V

    .line 422
    :cond_3
    :goto_1
    iget-boolean v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsVideoEncoder:Z

    if-eqz v3, :cond_4

    .line 423
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->requestKeyFrameToMediaCodec()V

    .line 425
    :cond_4
    sget-object v3, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->STARTED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v3}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 426
    goto :goto_2

    .line 431
    .end local v0    # "pauseRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Long;>;"
    .end local v1    # "pauseTimeUs":J
    :pswitch_3
    goto :goto_2

    .line 363
    :pswitch_4
    iput-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mLastDataStopTimestamp:Ljava/lang/Long;

    .line 365
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Start on "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p1, p2}, Landroidx/camera/video/internal/DebugUtils;->readableUs(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 367
    :try_start_0
    iget-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsFlushedAfterEndOfStream:Z

    if-eqz v0, :cond_5

    .line 371
    invoke-direct {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->reset()V

    .line 373
    :cond_5
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Range;->create(Ljava/lang/Comparable;Ljava/lang/Comparable;)Landroid/util/Range;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStartStopTimeRangeUs:Landroid/util/Range;

    .line 374
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V
    :try_end_0
    .catch Landroid/media/MediaCodec$CodecException; {:try_start_0 .. :try_end_0} :catch_0

    .line 378
    nop

    .line 379
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    instance-of v0, v0, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;

    if-eqz v0, :cond_6

    .line 380
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    check-cast v0, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;

    invoke-virtual {v0, v4}, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;->setActive(Z)V

    .line 382
    :cond_6
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->STARTED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 383
    nop

    .line 442
    :goto_2
    return-void

    .line 375
    :catch_0
    move-exception v0

    .line 376
    .local v0, "e":Landroid/media/MediaCodec$CodecException;
    invoke-virtual {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->handleEncodeError(Landroid/media/MediaCodec$CodecException;)V

    .line 377
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method

.method synthetic lambda$stop$2$androidx-camera-video-internal-encoder-EncoderImpl()V
    .locals 2

    .line 508
    iget-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mPendingCodecStop:Z

    if-eqz v0, :cond_0

    .line 509
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string/jumbo v1, "The data didn\'t reach the expected timestamp before timeout, stop the codec."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 513
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mLastDataStopTimestamp:Ljava/lang/Long;

    .line 514
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->signalCodecStop()V

    .line 515
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mPendingCodecStop:Z

    .line 517
    :cond_0
    return-void
.end method

.method synthetic lambda$stop$3$androidx-camera-video-internal-encoder-EncoderImpl()V
    .locals 2

    .line 507
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$stop$4$androidx-camera-video-internal-encoder-EncoderImpl(JJ)V
    .locals 10
    .param p1, "expectedStopTimeUs"    # J
    .param p3, "stopTriggerTimeUs"    # J

    .line 461
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$2;->$SwitchMap$androidx$camera$video$internal$encoder$EncoderImpl$InternalState:[I

    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v1}, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 528
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unknown state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 526
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Encoder is released"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 522
    :pswitch_1
    sget-object v0, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->CONFIGURED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 523
    goto/16 :goto_1

    .line 469
    :pswitch_2
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    .line 470
    .local v0, "currentState":Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;
    sget-object v1, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->STOPPING:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    invoke-direct {p0, v1}, Landroidx/camera/video/internal/encoder/EncoderImpl;->setState(Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;)V

    .line 471
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStartStopTimeRangeUs:Landroid/util/Range;

    invoke-virtual {v1}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 472
    .local v1, "startTimeUs":J
    const-wide v3, 0x7fffffffffffffffL

    cmp-long v3, v1, v3

    if-eqz v3, :cond_4

    .line 476
    const-wide/16 v3, -0x1

    cmp-long v3, p1, v3

    if-nez v3, :cond_0

    .line 477
    move-wide v3, p3

    .local v3, "stopTimeUs":J
    goto :goto_0

    .line 478
    .end local v3    # "stopTimeUs":J
    :cond_0
    cmp-long v3, p1, v1

    if-gez v3, :cond_1

    .line 483
    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string/jumbo v4, "The expected stop time is less than the start time. Use current time as stop time."

    invoke-static {v3, v4}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 485
    move-wide v3, p3

    .restart local v3    # "stopTimeUs":J
    goto :goto_0

    .line 487
    .end local v3    # "stopTimeUs":J
    :cond_1
    move-wide v3, p1

    .line 489
    .restart local v3    # "stopTimeUs":J
    :goto_0
    cmp-long v5, v3, v1

    if-ltz v5, :cond_3

    .line 494
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Range;->create(Ljava/lang/Comparable;Ljava/lang/Comparable;)Landroid/util/Range;

    move-result-object v5

    iput-object v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStartStopTimeRangeUs:Landroid/util/Range;

    .line 495
    iget-object v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Stop on "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v3, v4}, Landroidx/camera/video/internal/DebugUtils;->readableUs(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 498
    sget-object v5, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->PAUSED:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    if-ne v0, v5, :cond_2

    iget-object v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mLastDataStopTimestamp:Ljava/lang/Long;

    if-eqz v5, :cond_2

    .line 499
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->signalCodecStop()V

    goto :goto_1

    .line 501
    :cond_2
    const/4 v5, 0x1

    iput-boolean v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mPendingCodecStop:Z

    .line 505
    nop

    .line 506
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v5

    new-instance v6, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda9;

    invoke-direct {v6, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda9;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    const-wide/16 v7, 0x3e8

    sget-object v9, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v5, v6, v7, v8, v9}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v5

    iput-object v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mStopTimeoutFuture:Ljava/util/concurrent/Future;

    .line 519
    goto :goto_1

    .line 490
    :cond_3
    new-instance v5, Ljava/lang/AssertionError;

    const-string/jumbo v6, "The start time should be before the stop time."

    invoke-direct {v5, v6}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v5

    .line 473
    .end local v3    # "stopTimeUs":J
    :cond_4
    new-instance v3, Ljava/lang/AssertionError;

    const-string/jumbo v4, "There should be a \"start\" before \"stop\""

    invoke-direct {v3, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v3

    .line 466
    .end local v0    # "currentState":Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;
    .end local v1    # "startTimeUs":J
    :pswitch_3
    nop

    .line 530
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method

.method synthetic lambda$stopMediaCodec$11$androidx-camera-video-internal-encoder-EncoderImpl(Ljava/util/List;Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "futures"    # Ljava/util/List;
    .param p2, "afterStop"    # Ljava/lang/Runnable;

    .line 851
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mState:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    sget-object v1, Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;->ERROR:Landroidx/camera/video/internal/encoder/EncoderImpl$InternalState;

    if-eq v0, v1, :cond_2

    .line 852
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 853
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string/jumbo v1, "encoded data and input buffers are returned"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 855
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    instance-of v0, v0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mSourceStoppedSignalled:Z

    if-nez v0, :cond_1

    .line 865
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->flush()V

    .line 866
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mIsFlushedAfterEndOfStream:Z

    goto :goto_0

    .line 873
    :cond_1
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 876
    :cond_2
    :goto_0
    if-eqz p2, :cond_3

    .line 877
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 879
    :cond_3
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->handleStopped()V

    .line 880
    return-void
.end method

.method matchAcquisitionsAndFreeBufferIndexes()V
    .locals 6

    .line 990
    nop

    :goto_0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mAcquisitionQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mFreeInputBufferIndexQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 991
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mAcquisitionQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 992
    .local v0, "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mFreeInputBufferIndexQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 996
    .local v1, "bufferIndex":I
    :try_start_0
    new-instance v2, Landroidx/camera/video/internal/encoder/InputBufferImpl;

    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-direct {v2, v3, v1}, Landroidx/camera/video/internal/encoder/InputBufferImpl;-><init>(Landroid/media/MediaCodec;I)V
    :try_end_0
    .catch Landroid/media/MediaCodec$CodecException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1000
    .local v2, "inputBuffer":Landroidx/camera/video/internal/encoder/InputBufferImpl;
    nop

    .line 1001
    invoke-virtual {v0, v2}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1002
    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mInputBufferSet:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1003
    invoke-virtual {v2}, Landroidx/camera/video/internal/encoder/InputBufferImpl;->getTerminationFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    new-instance v4, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda14;

    invoke-direct {v4, p0, v2}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda14;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;Landroidx/camera/video/internal/encoder/InputBufferImpl;)V

    iget-object v5, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v3, v4, v5}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    goto :goto_1

    .line 1006
    :cond_0
    invoke-virtual {v2}, Landroidx/camera/video/internal/encoder/InputBufferImpl;->cancel()Z

    .line 1008
    .end local v0    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    .end local v1    # "bufferIndex":I
    .end local v2    # "inputBuffer":Landroidx/camera/video/internal/encoder/InputBufferImpl;
    :goto_1
    goto :goto_0

    .line 997
    .restart local v0    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    .restart local v1    # "bufferIndex":I
    :catch_0
    move-exception v2

    .line 998
    .local v2, "e":Landroid/media/MediaCodec$CodecException;
    invoke-virtual {p0, v2}, Landroidx/camera/video/internal/encoder/EncoderImpl;->handleEncodeError(Landroid/media/MediaCodec$CodecException;)V

    .line 999
    return-void

    .line 1009
    .end local v0    # "completer":Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;, "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    .end local v1    # "bufferIndex":I
    .end local v2    # "e":Landroid/media/MediaCodec$CodecException;
    :cond_1
    return-void
.end method

.method notifyError(ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 5
    .param p1, "error"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "throwable"    # Ljava/lang/Throwable;

    .line 815
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 816
    :try_start_0
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderCallback:Landroidx/camera/video/internal/encoder/EncoderCallback;

    .line 817
    .local v1, "callback":Landroidx/camera/video/internal/encoder/EncoderCallback;
    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 818
    .local v2, "executor":Ljava/util/concurrent/Executor;
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 820
    :try_start_1
    new-instance v0, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda0;

    invoke-direct {v0, v1, p1, p2, p3}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/video/internal/encoder/EncoderCallback;ILjava/lang/String;Ljava/lang/Throwable;)V

    invoke-interface {v2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0

    .line 824
    goto :goto_0

    .line 822
    :catch_0
    move-exception v0

    .line 823
    .local v0, "e":Ljava/util/concurrent/RejectedExecutionException;
    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string/jumbo v4, "Unable to post to the supplied executor."

    invoke-static {v3, v4, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 825
    .end local v0    # "e":Ljava/util/concurrent/RejectedExecutionException;
    :goto_0
    return-void

    .line 818
    .end local v1    # "callback":Landroidx/camera/video/internal/encoder/EncoderCallback;
    .end local v2    # "executor":Ljava/util/concurrent/Executor;
    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public pause()V
    .locals 4

    .line 565
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->generatePresentationTimeUs()J

    move-result-wide v0

    .line 566
    .local v0, "pauseTriggerTimeUs":J
    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    new-instance v3, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0, v0, v1}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;J)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 592
    return-void
.end method

.method public release()V
    .locals 2

    .line 604
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 625
    return-void
.end method

.method public requestKeyFrame()V
    .locals 2

    .line 689
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 707
    return-void
.end method

.method requestKeyFrameToMediaCodec()V
    .locals 3

    .line 729
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 730
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v1, "request-sync"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 731
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v1, v0}, Landroid/media/MediaCodec;->setParameters(Landroid/os/Bundle;)V

    .line 732
    return-void
.end method

.method public setEncoderCallback(Landroidx/camera/video/internal/encoder/EncoderCallback;Ljava/util/concurrent/Executor;)V
    .locals 2
    .param p1, "encoderCallback"    # Landroidx/camera/video/internal/encoder/EncoderCallback;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;

    .line 680
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 681
    :try_start_0
    iput-object p1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderCallback:Landroidx/camera/video/internal/encoder/EncoderCallback;

    .line 682
    iput-object p2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 683
    monitor-exit v0

    .line 684
    return-void

    .line 683
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method setMediaCodecPaused(Z)V
    .locals 2
    .param p1, "paused"    # Z

    .line 721
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 722
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v1, "drop-input-frames"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 723
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v1, v0}, Landroid/media/MediaCodec;->setParameters(Landroid/os/Bundle;)V

    .line 724
    return-void
.end method

.method signalCodecStop()V
    .locals 4

    .line 536
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    instance-of v0, v0, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;

    .line 545
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderInput:Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    .line 536
    if-eqz v0, :cond_1

    .line 537
    check-cast v1, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl$ByteBufferInput;->setActive(Z)V

    .line 539
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 540
    .local v0, "futures":Ljava/util/List;, "Ljava/util/List<Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;>;"
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mInputBufferSet:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/video/internal/encoder/InputBuffer;

    .line 541
    .local v2, "inputBuffer":Landroidx/camera/video/internal/encoder/InputBuffer;
    invoke-interface {v2}, Landroidx/camera/video/internal/encoder/InputBuffer;->getTerminationFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 542
    .end local v2    # "inputBuffer":Landroidx/camera/video/internal/encoder/InputBuffer;
    goto :goto_0

    .line 543
    :cond_0
    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->successfulAsList(Ljava/util/Collection;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    new-instance v2, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda8;

    invoke-direct {v2, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda8;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v1, v2, v3}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .end local v0    # "futures":Ljava/util/List;, "Ljava/util/List<Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;>;"
    goto :goto_1

    .line 545
    :cond_1
    instance-of v0, v1, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;

    if-eqz v0, :cond_2

    .line 547
    :try_start_0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->signalEndOfInputStream()V

    .line 550
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodecEosSignalled:Z
    :try_end_0
    .catch Landroid/media/MediaCodec$CodecException; {:try_start_0 .. :try_end_0} :catch_0

    .line 553
    goto :goto_2

    .line 551
    :catch_0
    move-exception v0

    .line 552
    .local v0, "e":Landroid/media/MediaCodec$CodecException;
    invoke-virtual {p0, v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->handleEncodeError(Landroid/media/MediaCodec$CodecException;)V

    goto :goto_2

    .line 545
    .end local v0    # "e":Landroid/media/MediaCodec$CodecException;
    :cond_2
    :goto_1
    nop

    .line 555
    :goto_2
    return-void
.end method

.method public signalSourceStopped()V
    .locals 2

    .line 643
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda5;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 650
    return-void
.end method

.method public start()V
    .locals 4

    .line 359
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->generatePresentationTimeUs()J

    move-result-wide v0

    .line 360
    .local v0, "startTriggerTimeUs":J
    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    new-instance v3, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda10;

    invoke-direct {v3, p0, v0, v1}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda10;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;J)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 443
    return-void
.end method

.method public stop()V
    .locals 2

    .line 450
    const-wide/16 v0, -0x1

    invoke-virtual {p0, v0, v1}, Landroidx/camera/video/internal/encoder/EncoderImpl;->stop(J)V

    .line 451
    return-void
.end method

.method public stop(J)V
    .locals 7
    .param p1, "expectedStopTimeUs"    # J

    .line 459
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->generatePresentationTimeUs()J

    move-result-wide v4

    .line 460
    .local v4, "stopTriggerTimeUs":J
    iget-object v6, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    new-instance v0, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda11;

    move-object v1, p0

    move-wide v2, p1

    .end local p1    # "expectedStopTimeUs":J
    .local v2, "expectedStopTimeUs":J
    invoke-direct/range {v0 .. v5}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda11;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;JJ)V

    invoke-interface {v6, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 531
    return-void
.end method

.method stopMediaCodec(Ljava/lang/Runnable;)V
    .locals 4
    .param p1, "afterStop"    # Ljava/lang/Runnable;

    .line 836
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 837
    .local v0, "futures":Ljava/util/List;, "Ljava/util/List<Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;>;"
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncodedDataSet:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/video/internal/encoder/EncodedDataImpl;

    .line 838
    .local v2, "dataToClose":Landroidx/camera/video/internal/encoder/EncodedDataImpl;
    invoke-virtual {v2}, Landroidx/camera/video/internal/encoder/EncodedDataImpl;->getClosedFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 839
    .end local v2    # "dataToClose":Landroidx/camera/video/internal/encoder/EncodedDataImpl;
    goto :goto_0

    .line 840
    :cond_0
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mInputBufferSet:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/video/internal/encoder/InputBuffer;

    .line 841
    .local v2, "inputBuffer":Landroidx/camera/video/internal/encoder/InputBuffer;
    invoke-interface {v2}, Landroidx/camera/video/internal/encoder/InputBuffer;->getTerminationFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 842
    .end local v2    # "inputBuffer":Landroidx/camera/video/internal/encoder/InputBuffer;
    goto :goto_1

    .line 843
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 844
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Waiting for resources to return. encoded data = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncodedDataSet:Ljava/util/Set;

    .line 845
    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", input buffers = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mInputBufferSet:Ljava/util/Set;

    .line 846
    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 844
    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 848
    :cond_2
    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->successfulAsList(Ljava/util/Collection;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    new-instance v2, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda6;

    invoke-direct {v2, p0, v0, p1}, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda6;-><init>(Landroidx/camera/video/internal/encoder/EncoderImpl;Ljava/util/List;Ljava/lang/Runnable;)V

    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mEncoderExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v1, v2, v3}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 881
    return-void
.end method

.method updateTotalPausedDuration(J)V
    .locals 7
    .param p1, "bufferPresentationTimeUs"    # J

    .line 909
    nop

    :goto_0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mActivePauseResumeTimeRanges:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 910
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mActivePauseResumeTimeRanges:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Range;

    .line 911
    .local v0, "pauseRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Long;>;"
    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    cmp-long v1, p1, v1

    if-lez v1, :cond_0

    .line 913
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mActivePauseResumeTimeRanges:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->removeFirst()Ljava/lang/Object;

    .line 914
    iget-wide v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTotalPausedDurationUs:J

    invoke-virtual {v0}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {v0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    sub-long/2addr v3, v5

    add-long/2addr v1, v3

    iput-wide v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTotalPausedDurationUs:J

    .line 915
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Total paused duration = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTotalPausedDurationUs:J

    .line 916
    invoke-static {v3, v4}, Landroidx/camera/video/internal/DebugUtils;->readableUs(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 915
    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 920
    .end local v0    # "pauseRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Long;>;"
    goto :goto_0

    .line 921
    :cond_0
    return-void
.end method
