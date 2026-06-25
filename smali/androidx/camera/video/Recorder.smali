.class public final Landroidx/camera/video/Recorder;
.super Ljava/lang/Object;
.source "Recorder.java"

# interfaces
.implements Landroidx/camera/video/VideoOutput;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/Recorder$State;,
        Landroidx/camera/video/Recorder$RecordingRecord;,
        Landroidx/camera/video/Recorder$AudioState;,
        Landroidx/camera/video/Recorder$Builder;
    }
.end annotation


# static fields
.field private static final AUDIO_CACHE_SIZE:I = 0x3c

.field private static final AUDIO_EXECUTOR:Ljava/util/concurrent/Executor;

.field static final DEFAULT_ENCODER_FACTORY:Landroidx/camera/video/internal/encoder/EncoderFactory;

.field public static final DEFAULT_QUALITY_SELECTOR:Landroidx/camera/video/QualitySelector;

.field private static final MEDIA_COLUMN:Ljava/lang/String; = "_data"

.field private static final MEDIA_SPEC_DEFAULT:Landroidx/camera/video/MediaSpec;

.field private static final NOT_PENDING:I = 0x0

.field private static final PENDING:I = 0x1

.field private static final PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE:Ljava/lang/Exception;

.field private static final PENDING_STATES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/video/Recorder$State;",
            ">;"
        }
    .end annotation
.end field

.field private static final SOURCE_NON_STREAMING_TIMEOUT_MS:J = 0x3e8L

.field private static final TAG:Ljava/lang/String; = "Recorder"

.field private static final VALID_NON_PENDING_STATES_WHILE_PENDING:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/video/Recorder$State;",
            ">;"
        }
    .end annotation
.end field

.field private static final VIDEO_SPEC_DEFAULT:Landroidx/camera/video/VideoSpec;


# instance fields
.field mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

.field mActiveSurface:Landroid/view/Surface;

.field mAudioAmplitude:D

.field mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

.field private final mAudioEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

.field mAudioErrorCause:Ljava/lang/Throwable;

.field mAudioOutputConfig:Landroidx/camera/video/internal/encoder/OutputConfig;

.field mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

.field mAudioState:Landroidx/camera/video/Recorder$AudioState;

.field mAudioTrackIndex:Ljava/lang/Integer;

.field mDurationLimitNs:J

.field private final mEncoderNotUsePersistentInputSurface:Z

.field final mEncodingFutures:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field mFileSizeLimitInBytes:J

.field mFirstRecordingAudioDataTimeUs:J

.field mFirstRecordingVideoBitrate:I

.field mFirstRecordingVideoDataTimeUs:J

.field mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

.field mInProgressRecordingStopping:Z

.field private mInProgressTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

.field mIsAudioSourceSilenced:Z

.field private mLastGeneratedRecordingId:J

.field mLatestSurface:Landroid/view/Surface;

.field mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

.field private final mLock:Ljava/lang/Object;

.field mMediaMuxer:Landroid/media/MediaMuxer;

.field final mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/MutableStateObservable<",
            "Landroidx/camera/video/MediaSpec;",
            ">;"
        }
    .end annotation
.end field

.field private mNeedsResetBeforeNextStart:Z

.field private mNonPendingState:Landroidx/camera/video/Recorder$State;

.field mOutputUri:Landroid/net/Uri;

.field final mPendingAudioRingBuffer:Landroidx/camera/core/internal/utils/RingBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/internal/utils/RingBuffer<",
            "Landroidx/camera/video/internal/encoder/EncodedData;",
            ">;"
        }
    .end annotation
.end field

.field mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

.field mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

.field mPreviousRecordingAudioDataTimeUs:J

.field mPreviousRecordingVideoDataTimeUs:J

.field mRecordingBytes:J

.field mRecordingDurationNs:J

.field mRecordingStopError:I

.field mRecordingStopErrorCause:Ljava/lang/Throwable;

.field private mResolvedEncoderProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

.field final mSequentialExecutor:Ljava/util/concurrent/Executor;

.field private mShouldSendResumeEvent:Z

.field mSourceNonStreamingTimeout:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

.field private mSourceTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

.field private mState:Landroidx/camera/video/Recorder$State;

.field mStreamId:I

.field private final mStreamInfo:Landroidx/camera/core/impl/MutableStateObservable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/MutableStateObservable<",
            "Landroidx/camera/video/StreamInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mUserProvidedExecutor:Ljava/util/concurrent/Executor;

.field mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

.field mVideoEncoderBitrateRange:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mVideoEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

.field mVideoEncoderSession:Landroidx/camera/video/VideoEncoderSession;

.field mVideoEncoderSessionToRelease:Landroidx/camera/video/VideoEncoderSession;

.field mVideoOutputConfig:Landroidx/camera/video/internal/encoder/OutputConfig;

.field mVideoSourceTimebase:Landroidx/camera/core/impl/Timebase;

.field mVideoTrackIndex:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 248
    sget-object v0, Landroidx/camera/video/Recorder$State;->PENDING_RECORDING:Landroidx/camera/video/Recorder$State;

    sget-object v1, Landroidx/camera/video/Recorder$State;->PENDING_PAUSED:Landroidx/camera/video/Recorder$State;

    .line 249
    invoke-static {v0, v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Landroidx/camera/video/Recorder;->PENDING_STATES:Ljava/util/Set;

    .line 257
    sget-object v0, Landroidx/camera/video/Recorder$State;->CONFIGURING:Landroidx/camera/video/Recorder$State;

    sget-object v1, Landroidx/camera/video/Recorder$State;->IDLING:Landroidx/camera/video/Recorder$State;

    sget-object v2, Landroidx/camera/video/Recorder$State;->RESETTING:Landroidx/camera/video/Recorder$State;

    sget-object v3, Landroidx/camera/video/Recorder$State;->STOPPING:Landroidx/camera/video/Recorder$State;

    sget-object v4, Landroidx/camera/video/Recorder$State;->ERROR:Landroidx/camera/video/Recorder$State;

    .line 258
    invoke-static {v0, v1, v2, v3, v4}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Landroidx/camera/video/Recorder;->VALID_NON_PENDING_STATES_WHILE_PENDING:Ljava/util/Set;

    .line 278
    const/4 v0, 0x3

    new-array v0, v0, [Landroidx/camera/video/Quality;

    const/4 v1, 0x0

    sget-object v2, Landroidx/camera/video/Quality;->FHD:Landroidx/camera/video/Quality;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Landroidx/camera/video/Quality;->HD:Landroidx/camera/video/Quality;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Landroidx/camera/video/Quality;->SD:Landroidx/camera/video/Quality;

    aput-object v2, v0, v1

    .line 279
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sget-object v1, Landroidx/camera/video/Quality;->FHD:Landroidx/camera/video/Quality;

    .line 280
    invoke-static {v1}, Landroidx/camera/video/FallbackStrategy;->higherQualityOrLowerThan(Landroidx/camera/video/Quality;)Landroidx/camera/video/FallbackStrategy;

    move-result-object v1

    .line 279
    invoke-static {v0, v1}, Landroidx/camera/video/QualitySelector;->fromOrderedList(Ljava/util/List;Landroidx/camera/video/FallbackStrategy;)Landroidx/camera/video/QualitySelector;

    move-result-object v0

    sput-object v0, Landroidx/camera/video/Recorder;->DEFAULT_QUALITY_SELECTOR:Landroidx/camera/video/QualitySelector;

    .line 283
    invoke-static {}, Landroidx/camera/video/VideoSpec;->builder()Landroidx/camera/video/VideoSpec$Builder;

    move-result-object v0

    sget-object v1, Landroidx/camera/video/Recorder;->DEFAULT_QUALITY_SELECTOR:Landroidx/camera/video/QualitySelector;

    .line 284
    invoke-virtual {v0, v1}, Landroidx/camera/video/VideoSpec$Builder;->setQualitySelector(Landroidx/camera/video/QualitySelector;)Landroidx/camera/video/VideoSpec$Builder;

    move-result-object v0

    .line 285
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroidx/camera/video/VideoSpec$Builder;->setAspectRatio(I)Landroidx/camera/video/VideoSpec$Builder;

    move-result-object v0

    .line 286
    invoke-virtual {v0}, Landroidx/camera/video/VideoSpec$Builder;->build()Landroidx/camera/video/VideoSpec;

    move-result-object v0

    sput-object v0, Landroidx/camera/video/Recorder;->VIDEO_SPEC_DEFAULT:Landroidx/camera/video/VideoSpec;

    .line 288
    invoke-static {}, Landroidx/camera/video/MediaSpec;->builder()Landroidx/camera/video/MediaSpec$Builder;

    move-result-object v0

    .line 289
    invoke-virtual {v0, v1}, Landroidx/camera/video/MediaSpec$Builder;->setOutputFormat(I)Landroidx/camera/video/MediaSpec$Builder;

    move-result-object v0

    sget-object v1, Landroidx/camera/video/Recorder;->VIDEO_SPEC_DEFAULT:Landroidx/camera/video/VideoSpec;

    .line 290
    invoke-virtual {v0, v1}, Landroidx/camera/video/MediaSpec$Builder;->setVideoSpec(Landroidx/camera/video/VideoSpec;)Landroidx/camera/video/MediaSpec$Builder;

    move-result-object v0

    .line 291
    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec$Builder;->build()Landroidx/camera/video/MediaSpec;

    move-result-object v0

    sput-object v0, Landroidx/camera/video/Recorder;->MEDIA_SPEC_DEFAULT:Landroidx/camera/video/MediaSpec;

    .line 294
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "The video frame producer became inactive before any data was received."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    sput-object v0, Landroidx/camera/video/Recorder;->PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE:Ljava/lang/Exception;

    .line 304
    new-instance v0, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda18;

    invoke-direct {v0}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda18;-><init>()V

    sput-object v0, Landroidx/camera/video/Recorder;->DEFAULT_ENCODER_FACTORY:Landroidx/camera/video/internal/encoder/EncoderFactory;

    .line 306
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->ioExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->newSequentialExecutor(Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Executor;

    move-result-object v0

    sput-object v0, Landroidx/camera/video/Recorder;->AUDIO_EXECUTOR:Ljava/util/concurrent/Executor;

    .line 305
    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/Executor;Landroidx/camera/video/MediaSpec;Landroidx/camera/video/internal/encoder/EncoderFactory;Landroidx/camera/video/internal/encoder/EncoderFactory;)V
    .locals 7
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "mediaSpec"    # Landroidx/camera/video/MediaSpec;
    .param p3, "videoEncoderFactory"    # Landroidx/camera/video/internal/encoder/EncoderFactory;
    .param p4, "audioEncoderFactory"    # Landroidx/camera/video/internal/encoder/EncoderFactory;

    .line 450
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 318
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    .line 319
    const-class v0, Landroidx/camera/video/internal/compat/quirk/EncoderNotUsePersistentInputSurfaceQuirk;

    invoke-static {v0}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    iput-boolean v0, p0, Landroidx/camera/video/Recorder;->mEncoderNotUsePersistentInputSurface:Z

    .line 325
    sget-object v0, Landroidx/camera/video/Recorder$State;->CONFIGURING:Landroidx/camera/video/Recorder$State;

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    .line 329
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mNonPendingState:Landroidx/camera/video/Recorder$State;

    .line 331
    iput v2, p0, Landroidx/camera/video/Recorder;->mStreamId:I

    .line 334
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 339
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 342
    const-wide/16 v3, 0x0

    iput-wide v3, p0, Landroidx/camera/video/Recorder;->mLastGeneratedRecordingId:J

    .line 349
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 351
    iput-boolean v2, p0, Landroidx/camera/video/Recorder;->mInProgressRecordingStopping:Z

    .line 353
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    .line 355
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mSourceTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    .line 357
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mResolvedEncoderProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    .line 358
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Landroidx/camera/video/Recorder;->mEncodingFutures:Ljava/util/List;

    .line 360
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mAudioTrackIndex:Ljava/lang/Integer;

    .line 362
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoTrackIndex:Ljava/lang/Integer;

    .line 368
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mLatestSurface:Landroid/view/Surface;

    .line 370
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mActiveSurface:Landroid/view/Surface;

    .line 372
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 376
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    .line 378
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    .line 380
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoOutputConfig:Landroidx/camera/video/internal/encoder/OutputConfig;

    .line 382
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    .line 384
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mAudioOutputConfig:Landroidx/camera/video/internal/encoder/OutputConfig;

    .line 386
    sget-object v5, Landroidx/camera/video/Recorder$AudioState;->INITIALIZING:Landroidx/camera/video/Recorder$AudioState;

    iput-object v5, p0, Landroidx/camera/video/Recorder;->mAudioState:Landroidx/camera/video/Recorder$AudioState;

    .line 388
    sget-object v5, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    iput-object v5, p0, Landroidx/camera/video/Recorder;->mOutputUri:Landroid/net/Uri;

    .line 391
    iput-wide v3, p0, Landroidx/camera/video/Recorder;->mRecordingBytes:J

    .line 393
    iput-wide v3, p0, Landroidx/camera/video/Recorder;->mRecordingDurationNs:J

    .line 395
    const-wide v5, 0x7fffffffffffffffL

    iput-wide v5, p0, Landroidx/camera/video/Recorder;->mFirstRecordingVideoDataTimeUs:J

    .line 398
    iput v2, p0, Landroidx/camera/video/Recorder;->mFirstRecordingVideoBitrate:I

    .line 401
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderBitrateRange:Landroid/util/Range;

    .line 404
    iput-wide v5, p0, Landroidx/camera/video/Recorder;->mFirstRecordingAudioDataTimeUs:J

    .line 407
    iput-wide v5, p0, Landroidx/camera/video/Recorder;->mPreviousRecordingVideoDataTimeUs:J

    .line 409
    iput-wide v5, p0, Landroidx/camera/video/Recorder;->mPreviousRecordingAudioDataTimeUs:J

    .line 411
    iput-wide v3, p0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    .line 413
    iput-wide v3, p0, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    .line 415
    iput v1, p0, Landroidx/camera/video/Recorder;->mRecordingStopError:I

    .line 418
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mRecordingStopErrorCause:Ljava/lang/Throwable;

    .line 420
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

    .line 424
    new-instance v1, Landroidx/camera/core/internal/utils/ArrayRingBuffer;

    const/16 v3, 0x3c

    invoke-direct {v1, v3}, Landroidx/camera/core/internal/utils/ArrayRingBuffer;-><init>(I)V

    iput-object v1, p0, Landroidx/camera/video/Recorder;->mPendingAudioRingBuffer:Landroidx/camera/core/internal/utils/RingBuffer;

    .line 428
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mAudioErrorCause:Ljava/lang/Throwable;

    .line 430
    iput-boolean v2, p0, Landroidx/camera/video/Recorder;->mIsAudioSourceSilenced:Z

    .line 432
    sget-object v1, Landroidx/camera/video/VideoOutput$SourceState;->INACTIVE:Landroidx/camera/video/VideoOutput$SourceState;

    iput-object v1, p0, Landroidx/camera/video/Recorder;->mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

    .line 434
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mSourceNonStreamingTimeout:Ljava/util/concurrent/ScheduledFuture;

    .line 437
    iput-boolean v2, p0, Landroidx/camera/video/Recorder;->mNeedsResetBeforeNextStart:Z

    .line 441
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderSessionToRelease:Landroidx/camera/video/VideoEncoderSession;

    .line 444
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Landroidx/camera/video/Recorder;->mAudioAmplitude:D

    .line 445
    iput-boolean v2, p0, Landroidx/camera/video/Recorder;->mShouldSendResumeEvent:Z

    .line 451
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mUserProvidedExecutor:Ljava/util/concurrent/Executor;

    .line 452
    if-eqz p1, :cond_1

    move-object v0, p1

    goto :goto_1

    :cond_1
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->ioExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    :goto_1
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mExecutor:Ljava/util/concurrent/Executor;

    .line 453
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->newSequentialExecutor(Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Executor;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    .line 455
    invoke-direct {p0, p2}, Landroidx/camera/video/Recorder;->composeRecorderMediaSpec(Landroidx/camera/video/MediaSpec;)Landroidx/camera/video/MediaSpec;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/MutableStateObservable;->withInitialState(Ljava/lang/Object;)Landroidx/camera/core/impl/MutableStateObservable;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    .line 456
    iget v0, p0, Landroidx/camera/video/Recorder;->mStreamId:I

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    .line 457
    invoke-direct {p0, v1}, Landroidx/camera/video/Recorder;->internalStateToStreamState(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/StreamInfo$StreamState;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/video/StreamInfo;->of(ILandroidx/camera/video/StreamInfo$StreamState;)Landroidx/camera/video/StreamInfo;

    move-result-object v0

    .line 456
    invoke-static {v0}, Landroidx/camera/core/impl/MutableStateObservable;->withInitialState(Ljava/lang/Object;)Landroidx/camera/core/impl/MutableStateObservable;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mStreamInfo:Landroidx/camera/core/impl/MutableStateObservable;

    .line 458
    iput-object p3, p0, Landroidx/camera/video/Recorder;->mVideoEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

    .line 459
    iput-object p4, p0, Landroidx/camera/video/Recorder;->mAudioEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

    .line 460
    new-instance v0, Landroidx/camera/video/VideoEncoderSession;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mVideoEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-direct {v0, v1, v2, v3}, Landroidx/camera/video/VideoEncoderSession;-><init>(Landroidx/camera/video/internal/encoder/EncoderFactory;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderSession:Landroidx/camera/video/VideoEncoderSession;

    .line 462
    return-void
.end method

.method private clearPendingAudioRingBuffer()V
    .locals 1

    .line 2094
    nop

    :goto_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mPendingAudioRingBuffer:Landroidx/camera/core/internal/utils/RingBuffer;

    invoke-interface {v0}, Landroidx/camera/core/internal/utils/RingBuffer;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2095
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mPendingAudioRingBuffer:Landroidx/camera/core/internal/utils/RingBuffer;

    invoke-interface {v0}, Landroidx/camera/core/internal/utils/RingBuffer;->dequeue()Ljava/lang/Object;

    goto :goto_0

    .line 2097
    :cond_0
    return-void
.end method

.method private composeRecorderMediaSpec(Landroidx/camera/video/MediaSpec;)Landroidx/camera/video/MediaSpec;
    .locals 4
    .param p1, "mediaSpec"    # Landroidx/camera/video/MediaSpec;

    .line 1291
    invoke-virtual {p1}, Landroidx/camera/video/MediaSpec;->toBuilder()Landroidx/camera/video/MediaSpec$Builder;

    move-result-object v0

    .line 1294
    .local v0, "mediaSpecBuilder":Landroidx/camera/video/MediaSpec$Builder;
    invoke-virtual {p1}, Landroidx/camera/video/MediaSpec;->getVideoSpec()Landroidx/camera/video/VideoSpec;

    move-result-object v1

    .line 1295
    .local v1, "videoSpec":Landroidx/camera/video/VideoSpec;
    invoke-virtual {v1}, Landroidx/camera/video/VideoSpec;->getAspectRatio()I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 1296
    new-instance v2, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda0;

    invoke-direct {v2}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda0;-><init>()V

    invoke-virtual {v0, v2}, Landroidx/camera/video/MediaSpec$Builder;->configureVideo(Landroidx/core/util/Consumer;)Landroidx/camera/video/MediaSpec$Builder;

    .line 1300
    :cond_0
    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec$Builder;->build()Landroidx/camera/video/MediaSpec;

    move-result-object v2

    return-object v2
.end method

.method private configureInternal(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;)V
    .locals 7
    .param p1, "surfaceRequest"    # Landroidx/camera/core/SurfaceRequest;
    .param p2, "videoSourceTimebase"    # Landroidx/camera/core/impl/Timebase;

    .line 1087
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->isServiced()Z

    move-result v0

    const-string/jumbo v1, "Recorder"

    if-eqz v0, :cond_0

    .line 1088
    const-string v0, "Ignore the SurfaceRequest since it is already served."

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1089
    return-void

    .line 1091
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda4;

    invoke-direct {v2, p0}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/video/Recorder;)V

    invoke-virtual {p1, v0, v2}, Landroidx/camera/core/SurfaceRequest;->setTransformationInfoListener(Ljava/util/concurrent/Executor;Landroidx/camera/core/SurfaceRequest$TransformationInfoListener;)V

    .line 1093
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->getResolution()Landroid/util/Size;

    move-result-object v0

    .line 1095
    .local v0, "surfaceSize":Landroid/util/Size;
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v2

    .line 1096
    .local v2, "dynamicRange":Landroidx/camera/core/DynamicRange;
    nop

    .line 1097
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->getCamera()Landroidx/camera/core/impl/CameraInternal;

    move-result-object v3

    invoke-interface {v3}, Landroidx/camera/core/impl/CameraInternal;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v3

    .line 1096
    invoke-static {v3}, Landroidx/camera/video/Recorder;->getVideoCapabilities(Landroidx/camera/core/CameraInfo;)Landroidx/camera/video/VideoCapabilities;

    move-result-object v3

    .line 1098
    .local v3, "capabilities":Landroidx/camera/video/VideoCapabilities;
    invoke-interface {v3, v0, v2}, Landroidx/camera/video/VideoCapabilities;->findHighestSupportedQualityFor(Landroid/util/Size;Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/Quality;

    move-result-object v4

    .line 1100
    .local v4, "highestSupportedQuality":Landroidx/camera/video/Quality;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Using supported quality of "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " for surface size "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1102
    sget-object v1, Landroidx/camera/video/Quality;->NONE:Landroidx/camera/video/Quality;

    if-eq v4, v1, :cond_2

    .line 1103
    invoke-interface {v3, v4, v2}, Landroidx/camera/video/VideoCapabilities;->getProfiles(Landroidx/camera/video/Quality;Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/video/Recorder;->mResolvedEncoderProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    .line 1105
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mResolvedEncoderProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    if-eqz v1, :cond_1

    goto :goto_0

    .line 1106
    :cond_1
    new-instance v1, Ljava/lang/AssertionError;

    const-string v5, "Camera advertised available quality but did not produce EncoderProfiles  for advertised quality."

    invoke-direct {v1, v5}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 1110
    :cond_2
    :goto_0
    invoke-direct {p0, p1, p2}, Landroidx/camera/video/Recorder;->setupVideo(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;)V

    .line 1111
    return-void
.end method

.method private finalizePendingRecording(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V
    .locals 5
    .param p1, "recordingToFinalize"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "error"    # I
    .param p3, "cause"    # Ljava/lang/Throwable;

    .line 951
    sget-object v0, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-virtual {p1, v0}, Landroidx/camera/video/Recorder$RecordingRecord;->finalizeRecording(Landroid/net/Uri;)V

    .line 952
    nop

    .line 954
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mAudioErrorCause:Ljava/lang/Throwable;

    .line 957
    const/4 v2, 0x1

    const-wide/16 v3, 0x0

    invoke-static {v2, v1, v3, v4}, Landroidx/camera/video/AudioStats;->of(ILjava/lang/Throwable;D)Landroidx/camera/video/AudioStats;

    move-result-object v1

    .line 955
    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v2, v3, v1}, Landroidx/camera/video/RecordingStats;->of(JJLandroidx/camera/video/AudioStats;)Landroidx/camera/video/RecordingStats;

    move-result-object v1

    sget-object v2, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 959
    invoke-static {v2}, Landroidx/camera/video/OutputResults;->of(Landroid/net/Uri;)Landroidx/camera/video/OutputResults;

    move-result-object v2

    .line 953
    invoke-static {v0, v1, v2, p2, p3}, Landroidx/camera/video/VideoRecordEvent;->finalizeWithError(Landroidx/camera/video/OutputOptions;Landroidx/camera/video/RecordingStats;Landroidx/camera/video/OutputResults;ILjava/lang/Throwable;)Landroidx/camera/video/VideoRecordEvent$Finalize;

    move-result-object v0

    .line 952
    invoke-virtual {p1, v0}, Landroidx/camera/video/Recorder$RecordingRecord;->updateVideoRecordEvent(Landroidx/camera/video/VideoRecordEvent;)V

    .line 962
    return-void
.end method

.method private getAudioDataToWriteAndClearCache(J)Ljava/util/List;
    .locals 4
    .param p1, "firstVideoDataTimeUs"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Landroidx/camera/video/internal/encoder/EncodedData;",
            ">;"
        }
    .end annotation

    .line 1516
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1518
    .local v0, "res":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/video/internal/encoder/EncodedData;>;"
    :goto_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mPendingAudioRingBuffer:Landroidx/camera/core/internal/utils/RingBuffer;

    invoke-interface {v1}, Landroidx/camera/core/internal/utils/RingBuffer;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1519
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mPendingAudioRingBuffer:Landroidx/camera/core/internal/utils/RingBuffer;

    invoke-interface {v1}, Landroidx/camera/core/internal/utils/RingBuffer;->dequeue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/video/internal/encoder/EncodedData;

    .line 1523
    .local v1, "data":Landroidx/camera/video/internal/encoder/EncodedData;
    invoke-interface {v1}, Landroidx/camera/video/internal/encoder/EncodedData;->getPresentationTimeUs()J

    move-result-wide v2

    cmp-long v2, v2, p1

    if-ltz v2, :cond_0

    .line 1524
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1526
    .end local v1    # "data":Landroidx/camera/video/internal/encoder/EncodedData;
    :cond_0
    goto :goto_0

    .line 1528
    :cond_1
    return-object v0
.end method

.method public static getVideoCapabilities(Landroidx/camera/core/CameraInfo;)Landroidx/camera/video/VideoCapabilities;
    .locals 1
    .param p0, "cameraInfo"    # Landroidx/camera/core/CameraInfo;

    .line 2760
    invoke-static {p0}, Landroidx/camera/video/RecorderVideoCapabilities;->from(Landroidx/camera/core/CameraInfo;)Landroidx/camera/video/RecorderVideoCapabilities;

    move-result-object v0

    return-object v0
.end method

.method private internalAudioStateToAudioStatsState(Landroidx/camera/video/Recorder$AudioState;)I
    .locals 3
    .param p1, "audioState"    # Landroidx/camera/video/Recorder$AudioState;

    .line 2186
    sget-object v0, Landroidx/camera/video/Recorder$8;->$SwitchMap$androidx$camera$video$Recorder$AudioState:[I

    invoke-virtual {p1}, Landroidx/camera/video/Recorder$AudioState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 2210
    :pswitch_0
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid internal audio state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 2192
    :pswitch_1
    const/4 v0, 0x1

    return v0

    .line 2194
    :pswitch_2
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-virtual {v0}, Landroidx/camera/video/Recorder$RecordingRecord;->isMuted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2195
    const/4 v0, 0x5

    return v0

    .line 2196
    :cond_0
    iget-boolean v0, p0, Landroidx/camera/video/Recorder;->mIsAudioSourceSilenced:Z

    if-eqz v0, :cond_1

    .line 2197
    const/4 v0, 0x2

    return v0

    .line 2199
    :cond_1
    const/4 v0, 0x0

    return v0

    .line 2204
    :pswitch_3
    const/4 v0, 0x4

    return v0

    .line 2202
    :pswitch_4
    const/4 v0, 0x3

    return v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private internalStateToStreamState(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/StreamInfo$StreamState;
    .locals 2
    .param p1, "state"    # Landroidx/camera/video/Recorder$State;

    .line 2216
    const-class v0, Landroidx/camera/video/internal/compat/quirk/DeactivateEncoderSurfaceBeforeStopEncoderQuirk;

    .line 2217
    invoke-static {v0}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/internal/compat/quirk/DeactivateEncoderSurfaceBeforeStopEncoderQuirk;

    .line 2218
    .local v0, "quirk":Landroidx/camera/video/internal/compat/quirk/DeactivateEncoderSurfaceBeforeStopEncoderQuirk;
    sget-object v1, Landroidx/camera/video/Recorder$State;->RECORDING:Landroidx/camera/video/Recorder$State;

    if-eq p1, v1, :cond_1

    sget-object v1, Landroidx/camera/video/Recorder$State;->STOPPING:Landroidx/camera/video/Recorder$State;

    if-ne p1, v1, :cond_0

    if-nez v0, :cond_0

    goto :goto_0

    .line 2219
    :cond_0
    sget-object v1, Landroidx/camera/video/StreamInfo$StreamState;->INACTIVE:Landroidx/camera/video/StreamInfo$StreamState;

    goto :goto_1

    :cond_1
    :goto_0
    sget-object v1, Landroidx/camera/video/StreamInfo$StreamState;->ACTIVE:Landroidx/camera/video/StreamInfo$StreamState;

    .line 2218
    :goto_1
    return-object v1
.end method

.method private static isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z
    .locals 5
    .param p0, "activeRecording"    # Landroidx/camera/video/Recording;
    .param p1, "recordingRecord"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1305
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 1306
    return v0

    .line 1309
    :cond_0
    invoke-virtual {p0}, Landroidx/camera/video/Recording;->getRecordingId()J

    move-result-wide v1

    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getRecordingId()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method static synthetic lambda$composeRecorderMediaSpec$9(Landroidx/camera/video/VideoSpec$Builder;)V
    .locals 1
    .param p0, "builder"    # Landroidx/camera/video/VideoSpec$Builder;

    .line 1297
    sget-object v0, Landroidx/camera/video/Recorder;->VIDEO_SPEC_DEFAULT:Landroidx/camera/video/VideoSpec;

    invoke-virtual {v0}, Landroidx/camera/video/VideoSpec;->getAspectRatio()I

    move-result v0

    invoke-virtual {p0, v0}, Landroidx/camera/video/VideoSpec$Builder;->setAspectRatio(I)Landroidx/camera/video/VideoSpec$Builder;

    return-void
.end method

.method static synthetic lambda$stopInternal$14(Landroidx/camera/video/internal/encoder/Encoder;)V
    .locals 2
    .param p0, "finalVideoEncoder"    # Landroidx/camera/video/internal/encoder/Encoder;

    .line 2047
    const-string/jumbo v0, "Recorder"

    const-string/jumbo v1, "The source didn\'t become non-streaming before timeout. Waited 1000ms"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2050
    const-class v0, Landroidx/camera/video/internal/compat/quirk/DeactivateEncoderSurfaceBeforeStopEncoderQuirk;

    invoke-static {v0}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2056
    invoke-static {p0}, Landroidx/camera/video/Recorder;->notifyEncoderSourceStopped(Landroidx/camera/video/internal/encoder/Encoder;)V

    .line 2058
    :cond_0
    return-void
.end method

.method private makePendingRecordingActiveLocked(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/Recorder$RecordingRecord;
    .locals 3
    .param p1, "state"    # Landroidx/camera/video/Recorder$State;

    .line 2525
    const/4 v0, 0x0

    .line 2526
    .local v0, "startRecordingPaused":Z
    sget-object v1, Landroidx/camera/video/Recorder$State;->PENDING_PAUSED:Landroidx/camera/video/Recorder$State;

    if-ne p1, v1, :cond_0

    .line 2527
    const/4 v0, 0x1

    goto :goto_0

    .line 2528
    :cond_0
    sget-object v1, Landroidx/camera/video/Recorder$State;->PENDING_RECORDING:Landroidx/camera/video/Recorder$State;

    if-ne p1, v1, :cond_4

    .line 2532
    :goto_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    if-nez v1, :cond_3

    .line 2536
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    if-eqz v1, :cond_2

    .line 2541
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    iput-object v1, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2542
    .local v1, "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    const/4 v2, 0x0

    iput-object v2, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2544
    if-eqz v0, :cond_1

    .line 2545
    sget-object v2, Landroidx/camera/video/Recorder$State;->PAUSED:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v2}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    goto :goto_1

    .line 2547
    :cond_1
    sget-object v2, Landroidx/camera/video/Recorder$State;->RECORDING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v2}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 2550
    :goto_1
    return-object v1

    .line 2537
    .end local v1    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    :cond_2
    new-instance v1, Ljava/lang/AssertionError;

    const-string/jumbo v2, "Pending recording should exist when in a PENDING state."

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 2533
    :cond_3
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "Cannot make pending recording active because another recording is already active."

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 2529
    :cond_4
    new-instance v1, Ljava/lang/AssertionError;

    const-string/jumbo v2, "makePendingRecordingActiveLocked() can only be called from a pending state."

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method private muteInternal(Landroidx/camera/video/Recorder$RecordingRecord;Z)V
    .locals 1
    .param p1, "recordingToMute"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "muted"    # Z

    .line 2074
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->isMuted()Z

    move-result v0

    if-ne v0, p2, :cond_0

    .line 2075
    return-void

    .line 2077
    :cond_0
    invoke-virtual {p1, p2}, Landroidx/camera/video/Recorder$RecordingRecord;->mute(Z)V

    .line 2079
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-ne v0, p1, :cond_1

    iget-boolean v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecordingStopping:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    if-eqz v0, :cond_1

    .line 2081
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    invoke-virtual {v0, p2}, Landroidx/camera/video/internal/audio/AudioSource;->mute(Z)V

    .line 2083
    :cond_1
    return-void
.end method

.method static notifyEncoderSourceStopped(Landroidx/camera/video/internal/encoder/Encoder;)V
    .locals 1
    .param p0, "encoder"    # Landroidx/camera/video/internal/encoder/Encoder;

    .line 2087
    instance-of v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl;

    if-eqz v0, :cond_0

    .line 2088
    move-object v0, p0

    check-cast v0, Landroidx/camera/video/internal/encoder/EncoderImpl;

    invoke-virtual {v0}, Landroidx/camera/video/internal/encoder/EncoderImpl;->signalSourceStopped()V

    .line 2090
    :cond_0
    return-void
.end method

.method private onRecordingFinalized(Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 11
    .param p1, "finalizedRecording"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2317
    const/4 v0, 0x0

    .line 2318
    .local v0, "needsReset":Z
    const/4 v1, 0x0

    .line 2319
    .local v1, "startRecordingPaused":Z
    const/4 v2, 0x0

    .line 2320
    .local v2, "needsConfigure":Z
    const/4 v3, 0x0

    .line 2321
    .local v3, "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    const/4 v4, 0x0

    .line 2322
    .local v4, "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    const/4 v5, 0x0

    .line 2323
    .local v5, "error":I
    const/4 v6, 0x0

    .line 2324
    .local v6, "errorCause":Ljava/lang/Throwable;
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v7

    .line 2325
    :try_start_0
    iget-object v8, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    if-ne v8, p1, :cond_b

    .line 2330
    const/4 v8, 0x0

    iput-object v8, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2331
    sget-object v9, Landroidx/camera/video/Recorder$8;->$SwitchMap$androidx$camera$video$Recorder$State:[I

    iget-object v10, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v10}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_0

    goto/16 :goto_0

    .line 2390
    :pswitch_0
    new-instance v8, Ljava/lang/AssertionError;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Unexpected state on finalize of recording: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local v0    # "needsReset":Z
    .end local v1    # "startRecordingPaused":Z
    .end local v2    # "needsConfigure":Z
    .end local v3    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v4    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v5    # "error":I
    .end local v6    # "errorCause":Ljava/lang/Throwable;
    .end local p1    # "finalizedRecording":Landroidx/camera/video/Recorder$RecordingRecord;
    throw v8

    .line 2384
    .restart local v0    # "needsReset":Z
    .restart local v1    # "startRecordingPaused":Z
    .restart local v2    # "needsConfigure":Z
    .restart local v3    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v4    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v5    # "error":I
    .restart local v6    # "errorCause":Ljava/lang/Throwable;
    .restart local p1    # "finalizedRecording":Landroidx/camera/video/Recorder$RecordingRecord;
    :pswitch_1
    goto :goto_0

    .line 2388
    :pswitch_2
    goto :goto_0

    .line 2333
    :pswitch_3
    const/4 v0, 0x1

    .line 2334
    goto :goto_0

    .line 2357
    :pswitch_4
    const/4 v1, 0x1

    .line 2360
    :pswitch_5
    iget-object v9, p0, Landroidx/camera/video/Recorder;->mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

    sget-object v10, Landroidx/camera/video/VideoOutput$SourceState;->INACTIVE:Landroidx/camera/video/VideoOutput$SourceState;

    if-ne v9, v10, :cond_0

    .line 2361
    iget-object v9, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    move-object v4, v9

    .line 2362
    iput-object v8, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2363
    sget-object v8, Landroidx/camera/video/Recorder$State;->CONFIGURING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v8}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 2364
    const/4 v5, 0x4

    .line 2365
    sget-object v8, Landroidx/camera/video/Recorder;->PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE:Ljava/lang/Exception;

    move-object v6, v8

    goto :goto_0

    .line 2366
    :cond_0
    iget-boolean v9, p0, Landroidx/camera/video/Recorder;->mEncoderNotUsePersistentInputSurface:Z

    if-eqz v9, :cond_2

    .line 2371
    iput-object v8, p0, Landroidx/camera/video/Recorder;->mActiveSurface:Landroid/view/Surface;

    .line 2372
    iget-object v8, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    if-eqz v8, :cond_1

    iget-object v8, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    invoke-virtual {v8}, Landroidx/camera/core/SurfaceRequest;->isServiced()Z

    move-result v8

    if-nez v8, :cond_1

    .line 2373
    const/4 v2, 0x1

    .line 2375
    :cond_1
    sget-object v8, Landroidx/camera/video/Recorder$State;->CONFIGURING:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v8}, Landroidx/camera/video/Recorder;->updateNonPendingState(Landroidx/camera/video/Recorder$State;)V

    goto :goto_0

    .line 2376
    :cond_2
    iget-object v8, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    if-eqz v8, :cond_5

    .line 2379
    iget-object v8, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v8}, Landroidx/camera/video/Recorder;->makePendingRecordingActiveLocked(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/Recorder$RecordingRecord;

    move-result-object v8

    move-object v3, v8

    goto :goto_0

    .line 2342
    :pswitch_6
    iget-boolean v9, p0, Landroidx/camera/video/Recorder;->mEncoderNotUsePersistentInputSurface:Z

    if-eqz v9, :cond_4

    .line 2347
    iput-object v8, p0, Landroidx/camera/video/Recorder;->mActiveSurface:Landroid/view/Surface;

    .line 2348
    iget-object v8, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    if-eqz v8, :cond_3

    iget-object v8, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    invoke-virtual {v8}, Landroidx/camera/core/SurfaceRequest;->isServiced()Z

    move-result v8

    if-nez v8, :cond_3

    .line 2349
    const/4 v2, 0x1

    .line 2351
    :cond_3
    sget-object v8, Landroidx/camera/video/Recorder$State;->CONFIGURING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v8}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    goto :goto_0

    .line 2353
    :cond_4
    sget-object v8, Landroidx/camera/video/Recorder$State;->IDLING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v8}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 2355
    nop

    .line 2393
    :cond_5
    :goto_0
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2396
    if-eqz v2, :cond_6

    .line 2397
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    iget-object v8, p0, Landroidx/camera/video/Recorder;->mVideoSourceTimebase:Landroidx/camera/core/impl/Timebase;

    invoke-direct {p0, v7, v8}, Landroidx/camera/video/Recorder;->configureInternal(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;)V

    goto :goto_1

    .line 2398
    :cond_6
    if-eqz v0, :cond_7

    .line 2399
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->reset()V

    goto :goto_1

    .line 2400
    :cond_7
    if-eqz v3, :cond_9

    .line 2403
    iget-boolean v7, p0, Landroidx/camera/video/Recorder;->mEncoderNotUsePersistentInputSurface:Z

    if-nez v7, :cond_8

    .line 2407
    invoke-direct {p0, v3, v1}, Landroidx/camera/video/Recorder;->startRecording(Landroidx/camera/video/Recorder$RecordingRecord;Z)V

    goto :goto_1

    .line 2404
    :cond_8
    new-instance v7, Ljava/lang/AssertionError;

    const-string v8, "Attempt to start a pending recording while the Recorder is waiting for a new surface request."

    invoke-direct {v7, v8}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v7

    .line 2408
    :cond_9
    if-eqz v4, :cond_a

    .line 2409
    invoke-direct {p0, v4, v5, v6}, Landroidx/camera/video/Recorder;->finalizePendingRecording(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 2411
    :cond_a
    :goto_1
    return-void

    .line 2326
    :cond_b
    :try_start_1
    new-instance v8, Ljava/lang/AssertionError;

    const-string v9, "Active recording did not match finalized recording on finalize."

    invoke-direct {v8, v9}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local v0    # "needsReset":Z
    .end local v1    # "startRecordingPaused":Z
    .end local v2    # "needsConfigure":Z
    .end local v3    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v4    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v5    # "error":I
    .end local v6    # "errorCause":Ljava/lang/Throwable;
    .end local p1    # "finalizedRecording":Landroidx/camera/video/Recorder$RecordingRecord;
    throw v8

    .line 2393
    .restart local v0    # "needsReset":Z
    .restart local v1    # "startRecordingPaused":Z
    .restart local v2    # "needsConfigure":Z
    .restart local v3    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v4    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v5    # "error":I
    .restart local v6    # "errorCause":Ljava/lang/Throwable;
    .restart local p1    # "finalizedRecording":Landroidx/camera/video/Recorder$RecordingRecord;
    :catchall_0
    move-exception v8

    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v8

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_6
        :pswitch_4
        :pswitch_5
        :pswitch_3
        :pswitch_6
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private onResetVideo()V
    .locals 4

    .line 2135
    const/4 v0, 0x1

    .line 2136
    .local v0, "shouldConfigure":Z
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 2137
    :try_start_0
    sget-object v2, Landroidx/camera/video/Recorder$8;->$SwitchMap$androidx$camera$video$Recorder$State:[I

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v3}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 2141
    :pswitch_1
    sget-object v2, Landroidx/camera/video/Recorder$State;->CONFIGURING:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v2}, Landroidx/camera/video/Recorder;->updateNonPendingState(Landroidx/camera/video/Recorder$State;)V

    .line 2142
    goto :goto_0

    .line 2148
    :pswitch_2
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isPersistentRecordingInProgress()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2149
    const/4 v0, 0x0

    .line 2150
    goto :goto_0

    .line 2158
    :cond_0
    :pswitch_3
    sget-object v2, Landroidx/camera/video/Recorder$State;->CONFIGURING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v2}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 2159
    nop

    .line 2164
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2166
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroidx/camera/video/Recorder;->mNeedsResetBeforeNextStart:Z

    .line 2169
    if-eqz v0, :cond_1

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    .line 2170
    invoke-virtual {v1}, Landroidx/camera/core/SurfaceRequest;->isServiced()Z

    move-result v1

    if-nez v1, :cond_1

    .line 2171
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mVideoSourceTimebase:Landroidx/camera/core/impl/Timebase;

    invoke-direct {p0, v1, v2}, Landroidx/camera/video/Recorder;->configureInternal(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;)V

    .line 2173
    :cond_1
    return-void

    .line 2164
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private onSurfaceRequestedInternal(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;)V
    .locals 1
    .param p1, "request"    # Landroidx/camera/core/SurfaceRequest;
    .param p2, "timebase"    # Landroidx/camera/core/impl/Timebase;

    .line 967
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    invoke-virtual {v0}, Landroidx/camera/core/SurfaceRequest;->isServiced()Z

    move-result v0

    if-nez v0, :cond_0

    .line 968
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    invoke-virtual {v0}, Landroidx/camera/core/SurfaceRequest;->willNotProvideSurface()Z

    .line 970
    :cond_0
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    iput-object p2, p0, Landroidx/camera/video/Recorder;->mVideoSourceTimebase:Landroidx/camera/core/impl/Timebase;

    invoke-direct {p0, p1, p2}, Landroidx/camera/video/Recorder;->configureInternal(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;)V

    .line 971
    return-void
.end method

.method private pauseInternal(Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 3
    .param p1, "recordingToPause"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1981
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-ne v0, p1, :cond_1

    iget-boolean v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecordingStopping:Z

    if-nez v0, :cond_1

    .line 1982
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isAudioEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1983
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/Encoder;->pause()V

    .line 1985
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/Encoder;->pause()V

    .line 1987
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1988
    invoke-virtual {v1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v1

    .line 1989
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->getInProgressRecordingStats()Landroidx/camera/video/RecordingStats;

    move-result-object v2

    .line 1987
    invoke-static {v1, v2}, Landroidx/camera/video/VideoRecordEvent;->pause(Landroidx/camera/video/OutputOptions;Landroidx/camera/video/RecordingStats;)Landroidx/camera/video/VideoRecordEvent$Pause;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/video/Recorder$RecordingRecord;->updateVideoRecordEvent(Landroidx/camera/video/VideoRecordEvent;)V

    .line 1991
    :cond_1
    return-void
.end method

.method private prepareRecordingInternal(Landroid/content/Context;Landroidx/camera/video/OutputOptions;)Landroidx/camera/video/PendingRecording;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "options"    # Landroidx/camera/video/OutputOptions;

    .line 604
    const-string/jumbo v0, "The OutputOptions cannot be null."

    invoke-static {p2, v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 605
    new-instance v0, Landroidx/camera/video/PendingRecording;

    invoke-direct {v0, p1, p0, p2}, Landroidx/camera/video/PendingRecording;-><init>(Landroid/content/Context;Landroidx/camera/video/Recorder;Landroidx/camera/video/OutputOptions;)V

    return-object v0
.end method

.method private releaseCurrentAudioSource()V
    .locals 4

    .line 1360
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    if-eqz v0, :cond_0

    .line 1363
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    .line 1364
    .local v0, "audioSource":Landroidx/camera/video/internal/audio/AudioSource;
    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    .line 1365
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string/jumbo v2, "Releasing audio source: 0x%x"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "Recorder"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1367
    invoke-virtual {v0}, Landroidx/camera/video/internal/audio/AudioSource;->release()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    new-instance v2, Landroidx/camera/video/Recorder$3;

    invoke-direct {v2, p0, v0}, Landroidx/camera/video/Recorder$3;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/internal/audio/AudioSource;)V

    .line 1379
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    .line 1367
    invoke-static {v1, v2, v3}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 1380
    return-void

    .line 1361
    .end local v0    # "audioSource":Landroidx/camera/video/internal/audio/AudioSource;
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Cannot release null audio source."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method private reset()V
    .locals 2

    .line 2101
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    if-eqz v0, :cond_0

    .line 2102
    const-string/jumbo v0, "Recorder"

    const-string/jumbo v1, "Releasing audio encoder."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2103
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/Encoder;->release()V

    .line 2104
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    .line 2105
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mAudioOutputConfig:Landroidx/camera/video/internal/encoder/OutputConfig;

    .line 2107
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    if-eqz v0, :cond_1

    .line 2108
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->releaseCurrentAudioSource()V

    .line 2111
    :cond_1
    sget-object v0, Landroidx/camera/video/Recorder$AudioState;->INITIALIZING:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setAudioState(Landroidx/camera/video/Recorder$AudioState;)V

    .line 2112
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->resetVideo()V

    .line 2113
    return-void
.end method

.method private resetVideo()V
    .locals 2

    .line 2177
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    if-eqz v0, :cond_0

    .line 2178
    const-string/jumbo v0, "Recorder"

    const-string/jumbo v1, "Releasing video encoder."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2179
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->tryReleaseVideoEncoder()V

    .line 2181
    :cond_0
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->onResetVideo()V

    .line 2182
    return-void
.end method

.method private restoreNonPendingState()V
    .locals 3

    .line 2712
    sget-object v0, Landroidx/camera/video/Recorder;->PENDING_STATES:Ljava/util/Set;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2716
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mNonPendingState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 2717
    return-void

    .line 2713
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot restore non-pending state when in state "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method private resumeInternal(Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 3
    .param p1, "recordingToResume"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1996
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-ne v0, p1, :cond_2

    iget-boolean v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecordingStopping:Z

    if-nez v0, :cond_2

    .line 1997
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isAudioEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1998
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/Encoder;->start()V

    .line 2004
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    if-eqz v0, :cond_1

    .line 2005
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/Encoder;->start()V

    .line 2006
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2007
    invoke-virtual {v1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v1

    .line 2008
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->getInProgressRecordingStats()Landroidx/camera/video/RecordingStats;

    move-result-object v2

    .line 2006
    invoke-static {v1, v2}, Landroidx/camera/video/VideoRecordEvent;->resume(Landroidx/camera/video/OutputOptions;Landroidx/camera/video/RecordingStats;)Landroidx/camera/video/VideoRecordEvent$Resume;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/video/Recorder$RecordingRecord;->updateVideoRecordEvent(Landroidx/camera/video/VideoRecordEvent;)V

    goto :goto_0

    .line 2012
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/video/Recorder;->mShouldSendResumeEvent:Z

    .line 2015
    :cond_2
    :goto_0
    return-void
.end method

.method private safeToCloseVideoEncoder()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 1165
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Try to safely release video encoder: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Recorder"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1166
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderSession:Landroidx/camera/video/VideoEncoderSession;

    invoke-virtual {v0}, Landroidx/camera/video/VideoEncoderSession;->signalTermination()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method private setStreamId(I)V
    .locals 3
    .param p1, "streamId"    # I

    .line 2658
    iget v0, p0, Landroidx/camera/video/Recorder;->mStreamId:I

    if-ne v0, p1, :cond_0

    .line 2659
    return-void

    .line 2661
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Transitioning streamId: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/video/Recorder;->mStreamId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " --> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Recorder"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2662
    iput p1, p0, Landroidx/camera/video/Recorder;->mStreamId:I

    .line 2663
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mStreamInfo:Landroidx/camera/core/impl/MutableStateObservable;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v1}, Landroidx/camera/video/Recorder;->internalStateToStreamState(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/StreamInfo$StreamState;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mInProgressTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    invoke-static {p1, v1, v2}, Landroidx/camera/video/StreamInfo;->of(ILandroidx/camera/video/StreamInfo$StreamState;Landroidx/camera/core/SurfaceRequest$TransformationInfo;)Landroidx/camera/video/StreamInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/MutableStateObservable;->setState(Ljava/lang/Object;)V

    .line 2665
    return-void
.end method

.method private setupAudio(Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 8
    .param p1, "recordingToStart"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/audio/AudioSourceAccessException;,
            Landroidx/camera/video/internal/encoder/InvalidConfigException;
        }
    .end annotation

    .line 1322
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->getObservableData(Landroidx/camera/core/impl/StateObservable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/MediaSpec;

    .line 1324
    .local v0, "mediaSpec":Landroidx/camera/video/MediaSpec;
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mResolvedEncoderProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    invoke-static {v0, v1}, Landroidx/camera/video/internal/config/AudioConfigUtil;->resolveAudioMimeInfo(Landroidx/camera/video/MediaSpec;Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;)Landroidx/camera/video/internal/config/AudioMimeInfo;

    move-result-object v1

    .line 1325
    .local v1, "audioMimeInfo":Landroidx/camera/video/internal/config/AudioMimeInfo;
    sget-object v2, Landroidx/camera/core/impl/Timebase;->UPTIME:Landroidx/camera/core/impl/Timebase;

    .line 1328
    .local v2, "audioSourceTimebase":Landroidx/camera/core/impl/Timebase;
    nop

    .line 1329
    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec;->getAudioSpec()Landroidx/camera/video/AudioSpec;

    move-result-object v3

    invoke-static {v1, v3}, Landroidx/camera/video/internal/config/AudioConfigUtil;->resolveAudioSettings(Landroidx/camera/video/internal/config/AudioMimeInfo;Landroidx/camera/video/AudioSpec;)Landroidx/camera/video/internal/audio/AudioSettings;

    move-result-object v3

    .line 1330
    .local v3, "audioSettings":Landroidx/camera/video/internal/audio/AudioSettings;
    iget-object v4, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    if-eqz v4, :cond_0

    .line 1331
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->releaseCurrentAudioSource()V

    .line 1335
    :cond_0
    invoke-direct {p0, p1, v3}, Landroidx/camera/video/Recorder;->setupAudioSource(Landroidx/camera/video/Recorder$RecordingRecord;Landroidx/camera/video/internal/audio/AudioSettings;)Landroidx/camera/video/internal/audio/AudioSource;

    move-result-object v4

    iput-object v4, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    .line 1336
    iget-object v4, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const-string/jumbo v5, "Set up new audio source: 0x%x"

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "Recorder"

    invoke-static {v5, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1339
    nop

    .line 1340
    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec;->getAudioSpec()Landroidx/camera/video/AudioSpec;

    move-result-object v4

    .line 1339
    invoke-static {v1, v2, v3, v4}, Landroidx/camera/video/internal/config/AudioConfigUtil;->resolveAudioEncoderConfig(Landroidx/camera/video/internal/config/AudioMimeInfo;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/internal/audio/AudioSettings;Landroidx/camera/video/AudioSpec;)Landroidx/camera/video/internal/encoder/AudioEncoderConfig;

    move-result-object v4

    .line 1341
    .local v4, "audioEncoderConfig":Landroidx/camera/video/internal/encoder/AudioEncoderConfig;
    iget-object v5, p0, Landroidx/camera/video/Recorder;->mAudioEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

    iget-object v6, p0, Landroidx/camera/video/Recorder;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v5, v6, v4}, Landroidx/camera/video/internal/encoder/EncoderFactory;->createEncoder(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/encoder/EncoderConfig;)Landroidx/camera/video/internal/encoder/Encoder;

    move-result-object v5

    iput-object v5, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    .line 1344
    iget-object v5, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v5}, Landroidx/camera/video/internal/encoder/Encoder;->getInput()Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;

    move-result-object v5

    .line 1345
    .local v5, "bufferProvider":Landroidx/camera/video/internal/encoder/Encoder$EncoderInput;
    instance-of v6, v5, Landroidx/camera/video/internal/encoder/Encoder$ByteBufferInput;

    if-eqz v6, :cond_1

    .line 1348
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    move-object v7, v5

    check-cast v7, Landroidx/camera/video/internal/encoder/Encoder$ByteBufferInput;

    invoke-virtual {v6, v7}, Landroidx/camera/video/internal/audio/AudioSource;->setBufferProvider(Landroidx/camera/video/internal/BufferProvider;)V

    .line 1349
    return-void

    .line 1346
    :cond_1
    new-instance v6, Ljava/lang/AssertionError;

    const-string/jumbo v7, "The EncoderInput of audio isn\'t a ByteBufferInput."

    invoke-direct {v6, v7}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v6
.end method

.method private setupAudioSource(Landroidx/camera/video/Recorder$RecordingRecord;Landroidx/camera/video/internal/audio/AudioSettings;)Landroidx/camera/video/internal/audio/AudioSource;
    .locals 1
    .param p1, "recordingToStart"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "audioSettings"    # Landroidx/camera/video/internal/audio/AudioSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/audio/AudioSourceAccessException;
        }
    .end annotation

    .line 1356
    sget-object v0, Landroidx/camera/video/Recorder;->AUDIO_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-virtual {p1, p2, v0}, Landroidx/camera/video/Recorder$RecordingRecord;->performOneTimeAudioSourceCreation(Landroidx/camera/video/internal/audio/AudioSettings;Ljava/util/concurrent/Executor;)Landroidx/camera/video/internal/audio/AudioSource;

    move-result-object v0

    return-object v0
.end method

.method private setupVideo(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;)V
    .locals 3
    .param p1, "request"    # Landroidx/camera/core/SurfaceRequest;
    .param p2, "timebase"    # Landroidx/camera/core/impl/Timebase;

    .line 1116
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->safeToCloseVideoEncoder()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda15;

    invoke-direct {v1, p0, p1, p2}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda15;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;)V

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v0, v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 1154
    return-void
.end method

.method private startInternal(Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 8
    .param p1, "recordingToStart"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1534
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-nez v0, :cond_9

    .line 1539
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/video/OutputOptions;->getFileSizeLimit()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    const-string/jumbo v1, "Recorder"

    if-lez v0, :cond_0

    .line 1542
    nop

    .line 1543
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/video/OutputOptions;->getFileSizeLimit()J

    move-result-wide v4

    long-to-double v4, v4

    const-wide v6, 0x3fee666666666666L    # 0.95

    mul-double/2addr v4, v6

    .line 1542
    invoke-static {v4, v5}, Ljava/lang/Math;->round(D)J

    move-result-wide v4

    iput-wide v4, p0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    .line 1544
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "File size limit in bytes: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1546
    :cond_0
    iput-wide v2, p0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    .line 1549
    :goto_0
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/video/OutputOptions;->getDurationLimitMillis()J

    move-result-wide v4

    cmp-long v0, v4, v2

    if-lez v0, :cond_1

    .line 1550
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 1551
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/video/OutputOptions;->getDurationLimitMillis()J

    move-result-wide v2

    .line 1550
    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v2

    iput-wide v2, p0, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    .line 1552
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Duration limit in nanoseconds: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 1554
    :cond_1
    iput-wide v2, p0, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    .line 1557
    :goto_1
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1560
    sget-object v0, Landroidx/camera/video/Recorder$8;->$SwitchMap$androidx$camera$video$Recorder$AudioState:[I

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mAudioState:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {v2}, Landroidx/camera/video/Recorder$AudioState;->ordinal()I

    move-result v2

    aget v0, v0, v2

    packed-switch v0, :pswitch_data_0

    goto :goto_5

    .line 1575
    :pswitch_0
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->hasAudioEnabled()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1576
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isAudioSupported()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1581
    :try_start_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-virtual {v0}, Landroidx/camera/video/Recorder$RecordingRecord;->isPersistent()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    if-nez v0, :cond_3

    .line 1582
    :cond_2
    invoke-direct {p0, p1}, Landroidx/camera/video/Recorder;->setupAudio(Landroidx/camera/video/Recorder$RecordingRecord;)V

    .line 1584
    :cond_3
    sget-object v0, Landroidx/camera/video/Recorder$AudioState;->ENABLED:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setAudioState(Landroidx/camera/video/Recorder$AudioState;)V
    :try_end_0
    .catch Landroidx/camera/video/internal/audio/AudioSourceAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroidx/camera/video/internal/encoder/InvalidConfigException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1595
    goto :goto_5

    .line 1585
    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    .line 1586
    .local v0, "e":Ljava/lang/Exception;
    :goto_2
    const-string/jumbo v2, "Unable to create audio resource with error: "

    invoke-static {v1, v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1588
    instance-of v1, v0, Landroidx/camera/video/internal/encoder/InvalidConfigException;

    if-eqz v1, :cond_4

    .line 1589
    sget-object v1, Landroidx/camera/video/Recorder$AudioState;->ERROR_ENCODER:Landroidx/camera/video/Recorder$AudioState;

    .local v1, "audioState":Landroidx/camera/video/Recorder$AudioState;
    goto :goto_3

    .line 1591
    .end local v1    # "audioState":Landroidx/camera/video/Recorder$AudioState;
    :cond_4
    sget-object v1, Landroidx/camera/video/Recorder$AudioState;->ERROR_SOURCE:Landroidx/camera/video/Recorder$AudioState;

    .line 1593
    .restart local v1    # "audioState":Landroidx/camera/video/Recorder$AudioState;
    :goto_3
    invoke-virtual {p0, v1}, Landroidx/camera/video/Recorder;->setAudioState(Landroidx/camera/video/Recorder$AudioState;)V

    .line 1594
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mAudioErrorCause:Ljava/lang/Throwable;

    goto :goto_5

    .line 1577
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "audioState":Landroidx/camera/video/Recorder$AudioState;
    :cond_5
    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "The Recorder doesn\'t support recording with audio"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 1571
    :pswitch_1
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->hasAudioEnabled()Z

    move-result v0

    if-eqz v0, :cond_6

    sget-object v0, Landroidx/camera/video/Recorder$AudioState;->ENABLED:Landroidx/camera/video/Recorder$AudioState;

    goto :goto_4

    .line 1572
    :cond_6
    sget-object v0, Landroidx/camera/video/Recorder$AudioState;->DISABLED:Landroidx/camera/video/Recorder$AudioState;

    .line 1571
    :goto_4
    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setAudioState(Landroidx/camera/video/Recorder$AudioState;)V

    .line 1573
    goto :goto_5

    .line 1568
    :pswitch_2
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Incorrectly invoke startInternal in audio state "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mAudioState:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 1600
    :cond_7
    :goto_5
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/camera/video/Recorder;->updateEncoderCallbacks(Landroidx/camera/video/Recorder$RecordingRecord;Z)V

    .line 1601
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isAudioEnabled()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 1602
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->isMuted()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/camera/video/internal/audio/AudioSource;->start(Z)V

    .line 1603
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/Encoder;->start()V

    .line 1605
    :cond_8
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/Encoder;->start()V

    .line 1607
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1608
    invoke-virtual {v1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v1

    .line 1609
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->getInProgressRecordingStats()Landroidx/camera/video/RecordingStats;

    move-result-object v2

    .line 1607
    invoke-static {v1, v2}, Landroidx/camera/video/VideoRecordEvent;->start(Landroidx/camera/video/OutputOptions;Landroidx/camera/video/RecordingStats;)Landroidx/camera/video/VideoRecordEvent$Start;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/video/Recorder$RecordingRecord;->updateVideoRecordEvent(Landroidx/camera/video/VideoRecordEvent;)V

    .line 1610
    return-void

    .line 1535
    :cond_9
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Attempted to start a new recording while another was in progress."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private startRecording(Landroidx/camera/video/Recorder$RecordingRecord;Z)V
    .locals 0
    .param p1, "recordingToStart"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "startRecordingPaused"    # Z

    .line 2564
    invoke-direct {p0, p1}, Landroidx/camera/video/Recorder;->startInternal(Landroidx/camera/video/Recorder$RecordingRecord;)V

    .line 2565
    if-eqz p2, :cond_0

    .line 2566
    invoke-direct {p0, p1}, Landroidx/camera/video/Recorder;->pauseInternal(Landroidx/camera/video/Recorder$RecordingRecord;)V

    .line 2568
    :cond_0
    return-void
.end method

.method private static supportedMuxerFormatOrDefaultFrom(Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;I)I
    .locals 1
    .param p0, "profilesProxy"    # Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;
    .param p1, "defaultMuxerFormat"    # I

    .line 2728
    if-eqz p0, :cond_0

    .line 2729
    invoke-virtual {p0}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->getRecommendedFileFormat()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    .line 2733
    :sswitch_0
    const/4 v0, 0x1

    return v0

    .line 2731
    :sswitch_1
    const/4 v0, 0x0

    return v0

    .line 2735
    :sswitch_2
    nop

    .line 2739
    const/4 v0, 0x2

    return v0

    .line 2745
    :cond_0
    :goto_0
    return p1

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_2
        0x2 -> :sswitch_1
        0x9 -> :sswitch_0
    .end sparse-switch
.end method

.method private tryReleaseVideoEncoder()V
    .locals 2

    .line 2118
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderSessionToRelease:Landroidx/camera/video/VideoEncoderSession;

    if-eqz v0, :cond_1

    .line 2119
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderSessionToRelease:Landroidx/camera/video/VideoEncoderSession;

    .line 2120
    invoke-virtual {v0}, Landroidx/camera/video/VideoEncoderSession;->getVideoEncoder()Landroidx/camera/video/internal/encoder/Encoder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 2119
    :goto_0
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 2122
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Releasing video encoder: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Recorder"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2123
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderSessionToRelease:Landroidx/camera/video/VideoEncoderSession;

    invoke-virtual {v0}, Landroidx/camera/video/VideoEncoderSession;->terminateNow()V

    .line 2124
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderSessionToRelease:Landroidx/camera/video/VideoEncoderSession;

    .line 2125
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    .line 2126
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoOutputConfig:Landroidx/camera/video/internal/encoder/OutputConfig;

    .line 2127
    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setLatestSurface(Landroid/view/Surface;)V

    goto :goto_1

    .line 2129
    :cond_1
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->safeToCloseVideoEncoder()Lcom/google/common/util/concurrent/ListenableFuture;

    .line 2131
    :goto_1
    return-void
.end method

.method private updateEncoderCallbacks(Landroidx/camera/video/Recorder$RecordingRecord;Z)V
    .locals 3
    .param p1, "recordingToStart"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "videoOnly"    # Z

    .line 1616
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mEncodingFutures:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1617
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mEncodingFutures:Ljava/util/List;

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->allAsList(Ljava/util/Collection;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 1618
    .local v0, "listFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/util/List<Ljava/lang/Void;>;>;"
    invoke-interface {v0}, Lcom/google/common/util/concurrent/ListenableFuture;->isDone()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1619
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/google/common/util/concurrent/ListenableFuture;->cancel(Z)Z

    .line 1621
    :cond_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mEncodingFutures:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 1624
    .end local v0    # "listFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/util/List<Ljava/lang/Void;>;>;"
    :cond_1
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mEncodingFutures:Ljava/util/List;

    new-instance v1, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda11;

    invoke-direct {v1, p0, p1}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda11;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/Recorder$RecordingRecord;)V

    invoke-static {v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1719
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isAudioEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    if-nez p2, :cond_2

    .line 1720
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mEncodingFutures:Ljava/util/List;

    new-instance v1, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda12;

    invoke-direct {v1, p0, p1}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda12;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/Recorder$RecordingRecord;)V

    invoke-static {v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1840
    :cond_2
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mEncodingFutures:Ljava/util/List;

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->allAsList(Ljava/util/Collection;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/video/Recorder$7;

    invoke-direct {v1, p0}, Landroidx/camera/video/Recorder$7;-><init>(Landroidx/camera/video/Recorder;)V

    .line 1864
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 1840
    invoke-static {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 1865
    return-void
.end method

.method private updateNonPendingState(Landroidx/camera/video/Recorder$State;)V
    .locals 4
    .param p1, "state"    # Landroidx/camera/video/Recorder$State;

    .line 2686
    sget-object v0, Landroidx/camera/video/Recorder;->PENDING_STATES:Ljava/util/Set;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2691
    sget-object v0, Landroidx/camera/video/Recorder;->VALID_NON_PENDING_STATES_WHILE_PENDING:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2697
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mNonPendingState:Landroidx/camera/video/Recorder$State;

    if-eq v0, p1, :cond_0

    .line 2698
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mNonPendingState:Landroidx/camera/video/Recorder$State;

    .line 2699
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mStreamInfo:Landroidx/camera/core/impl/MutableStateObservable;

    iget v1, p0, Landroidx/camera/video/Recorder;->mStreamId:I

    invoke-direct {p0, p1}, Landroidx/camera/video/Recorder;->internalStateToStreamState(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/StreamInfo$StreamState;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mInProgressTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    invoke-static {v1, v2, v3}, Landroidx/camera/video/StreamInfo;->of(ILandroidx/camera/video/StreamInfo$StreamState;Landroidx/camera/core/SurfaceRequest$TransformationInfo;)Landroidx/camera/video/StreamInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/MutableStateObservable;->setState(Ljava/lang/Object;)V

    .line 2702
    :cond_0
    return-void

    .line 2692
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid state transition. State is not a valid non-pending state while in a pending state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 2687
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can only updated non-pending state from a pending state, but state is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method


# virtual methods
.method finalizeInProgressRecording(ILjava/lang/Throwable;)V
    .locals 8
    .param p1, "error"    # I
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .line 2231
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-eqz v0, :cond_4

    .line 2236
    move v0, p1

    .line 2237
    .local v0, "errorToSend":I
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 2239
    :try_start_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    invoke-virtual {v1}, Landroid/media/MediaMuxer;->stop()V

    .line 2240
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    invoke-virtual {v1}, Landroid/media/MediaMuxer;->release()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2246
    goto :goto_0

    .line 2241
    :catch_0
    move-exception v1

    .line 2242
    .local v1, "e":Ljava/lang/IllegalStateException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "MediaMuxer failed to stop or release with error: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "Recorder"

    invoke-static {v4, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 2243
    if-nez v0, :cond_0

    .line 2244
    const/4 v0, 0x1

    .line 2247
    .end local v1    # "e":Ljava/lang/IllegalStateException;
    :cond_0
    :goto_0
    iput-object v2, p0, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    goto :goto_1

    .line 2248
    :cond_1
    if-nez v0, :cond_2

    .line 2250
    const/16 v0, 0x8

    .line 2253
    :cond_2
    :goto_1
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mOutputUri:Landroid/net/Uri;

    invoke-virtual {v1, v3}, Landroidx/camera/video/Recorder$RecordingRecord;->finalizeRecording(Landroid/net/Uri;)V

    .line 2255
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-virtual {v1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v1

    .line 2256
    .local v1, "outputOptions":Landroidx/camera/video/OutputOptions;
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->getInProgressRecordingStats()Landroidx/camera/video/RecordingStats;

    move-result-object v3

    .line 2257
    .local v3, "stats":Landroidx/camera/video/RecordingStats;
    iget-object v4, p0, Landroidx/camera/video/Recorder;->mOutputUri:Landroid/net/Uri;

    invoke-static {v4}, Landroidx/camera/video/OutputResults;->of(Landroid/net/Uri;)Landroidx/camera/video/OutputResults;

    move-result-object v4

    .line 2258
    .local v4, "outputResults":Landroidx/camera/video/OutputResults;
    iget-object v5, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-nez v0, :cond_3

    .line 2259
    invoke-static {v1, v3, v4}, Landroidx/camera/video/VideoRecordEvent;->finalize(Landroidx/camera/video/OutputOptions;Landroidx/camera/video/RecordingStats;Landroidx/camera/video/OutputResults;)Landroidx/camera/video/VideoRecordEvent$Finalize;

    move-result-object v6

    goto :goto_2

    .line 2263
    :cond_3
    invoke-static {v1, v3, v4, v0, p2}, Landroidx/camera/video/VideoRecordEvent;->finalizeWithError(Landroidx/camera/video/OutputOptions;Landroidx/camera/video/RecordingStats;Landroidx/camera/video/OutputResults;ILjava/lang/Throwable;)Landroidx/camera/video/VideoRecordEvent$Finalize;

    move-result-object v6

    .line 2258
    :goto_2
    invoke-virtual {v5, v6}, Landroidx/camera/video/Recorder$RecordingRecord;->updateVideoRecordEvent(Landroidx/camera/video/VideoRecordEvent;)V

    .line 2270
    iget-object v5, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2271
    .local v5, "finalizedRecording":Landroidx/camera/video/Recorder$RecordingRecord;
    iput-object v2, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2272
    const/4 v6, 0x0

    iput-boolean v6, p0, Landroidx/camera/video/Recorder;->mInProgressRecordingStopping:Z

    .line 2273
    iput-object v2, p0, Landroidx/camera/video/Recorder;->mAudioTrackIndex:Ljava/lang/Integer;

    .line 2274
    iput-object v2, p0, Landroidx/camera/video/Recorder;->mVideoTrackIndex:Ljava/lang/Integer;

    .line 2275
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mEncodingFutures:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->clear()V

    .line 2276
    sget-object v6, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    iput-object v6, p0, Landroidx/camera/video/Recorder;->mOutputUri:Landroid/net/Uri;

    .line 2277
    const-wide/16 v6, 0x0

    iput-wide v6, p0, Landroidx/camera/video/Recorder;->mRecordingBytes:J

    .line 2278
    iput-wide v6, p0, Landroidx/camera/video/Recorder;->mRecordingDurationNs:J

    .line 2279
    const-wide v6, 0x7fffffffffffffffL

    iput-wide v6, p0, Landroidx/camera/video/Recorder;->mFirstRecordingVideoDataTimeUs:J

    .line 2280
    iput-wide v6, p0, Landroidx/camera/video/Recorder;->mFirstRecordingAudioDataTimeUs:J

    .line 2281
    iput-wide v6, p0, Landroidx/camera/video/Recorder;->mPreviousRecordingVideoDataTimeUs:J

    .line 2282
    iput-wide v6, p0, Landroidx/camera/video/Recorder;->mPreviousRecordingAudioDataTimeUs:J

    .line 2283
    const/4 v6, 0x1

    iput v6, p0, Landroidx/camera/video/Recorder;->mRecordingStopError:I

    .line 2284
    iput-object v2, p0, Landroidx/camera/video/Recorder;->mRecordingStopErrorCause:Ljava/lang/Throwable;

    .line 2285
    iput-object v2, p0, Landroidx/camera/video/Recorder;->mAudioErrorCause:Ljava/lang/Throwable;

    .line 2286
    const-wide/16 v6, 0x0

    iput-wide v6, p0, Landroidx/camera/video/Recorder;->mAudioAmplitude:D

    .line 2287
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->clearPendingAudioRingBuffer()V

    .line 2288
    invoke-virtual {p0, v2}, Landroidx/camera/video/Recorder;->setInProgressTransformationInfo(Landroidx/camera/core/SurfaceRequest$TransformationInfo;)V

    .line 2290
    sget-object v2, Landroidx/camera/video/Recorder$8;->$SwitchMap$androidx$camera$video$Recorder$AudioState:[I

    iget-object v6, p0, Landroidx/camera/video/Recorder;->mAudioState:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {v6}, Landroidx/camera/video/Recorder$AudioState;->ordinal()I

    move-result v6

    aget v2, v2, v6

    packed-switch v2, :pswitch_data_0

    goto :goto_3

    .line 2296
    :pswitch_0
    goto :goto_3

    .line 2292
    :pswitch_1
    new-instance v2, Ljava/lang/AssertionError;

    const-string v6, "Incorrectly finalize recording when audio state is IDLING"

    invoke-direct {v2, v6}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2

    .line 2300
    :pswitch_2
    sget-object v2, Landroidx/camera/video/Recorder$AudioState;->IDLING:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {p0, v2}, Landroidx/camera/video/Recorder;->setAudioState(Landroidx/camera/video/Recorder$AudioState;)V

    .line 2301
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    invoke-virtual {v2}, Landroidx/camera/video/internal/audio/AudioSource;->stop()V

    .line 2302
    goto :goto_3

    .line 2308
    :pswitch_3
    sget-object v2, Landroidx/camera/video/Recorder$AudioState;->INITIALIZING:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {p0, v2}, Landroidx/camera/video/Recorder;->setAudioState(Landroidx/camera/video/Recorder$AudioState;)V

    .line 2312
    :goto_3
    invoke-direct {p0, v5}, Landroidx/camera/video/Recorder;->onRecordingFinalized(Landroidx/camera/video/Recorder$RecordingRecord;)V

    .line 2313
    return-void

    .line 2232
    .end local v0    # "errorToSend":I
    .end local v1    # "outputOptions":Landroidx/camera/video/OutputOptions;
    .end local v3    # "stats":Landroidx/camera/video/RecordingStats;
    .end local v4    # "outputResults":Landroidx/camera/video/OutputResults;
    .end local v5    # "finalizedRecording":Landroidx/camera/video/Recorder$RecordingRecord;
    :cond_4
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Attempted to finalize in-progress recording, but no recording is in progress."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getAspectRatio()I
    .locals 1

    .line 663
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->getObservableData(Landroidx/camera/core/impl/StateObservable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/MediaSpec;

    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec;->getVideoSpec()Landroidx/camera/video/VideoSpec;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/video/VideoSpec;->getAspectRatio()I

    move-result v0

    return v0
.end method

.method getAudioSource()I
    .locals 1

    .line 630
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->getObservableData(Landroidx/camera/core/impl/StateObservable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/MediaSpec;

    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec;->getAudioSpec()Landroidx/camera/video/AudioSpec;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/video/AudioSpec;->getSource()I

    move-result v0

    return v0
.end method

.method public getExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 641
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mUserProvidedExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method getInProgressRecordingStats()Landroidx/camera/video/RecordingStats;
    .locals 8

    .line 2585
    iget-wide v0, p0, Landroidx/camera/video/Recorder;->mRecordingDurationNs:J

    iget-wide v2, p0, Landroidx/camera/video/Recorder;->mRecordingBytes:J

    iget-object v4, p0, Landroidx/camera/video/Recorder;->mAudioState:Landroidx/camera/video/Recorder$AudioState;

    .line 2586
    invoke-direct {p0, v4}, Landroidx/camera/video/Recorder;->internalAudioStateToAudioStatsState(Landroidx/camera/video/Recorder$AudioState;)I

    move-result v4

    iget-object v5, p0, Landroidx/camera/video/Recorder;->mAudioErrorCause:Ljava/lang/Throwable;

    iget-wide v6, p0, Landroidx/camera/video/Recorder;->mAudioAmplitude:D

    invoke-static {v4, v5, v6, v7}, Landroidx/camera/video/AudioStats;->of(ILjava/lang/Throwable;D)Landroidx/camera/video/AudioStats;

    move-result-object v4

    .line 2585
    invoke-static {v0, v1, v2, v3, v4}, Landroidx/camera/video/RecordingStats;->of(JJLandroidx/camera/video/AudioStats;)Landroidx/camera/video/RecordingStats;

    move-result-object v0

    return-object v0
.end method

.method public getMediaCapabilities(Landroidx/camera/core/CameraInfo;)Landroidx/camera/video/VideoCapabilities;
    .locals 1
    .param p1, "cameraInfo"    # Landroidx/camera/core/CameraInfo;

    .line 506
    invoke-static {p1}, Landroidx/camera/video/Recorder;->getVideoCapabilities(Landroidx/camera/core/CameraInfo;)Landroidx/camera/video/VideoCapabilities;

    move-result-object v0

    return-object v0
.end method

.method public getMediaSpec()Landroidx/camera/core/impl/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/impl/Observable<",
            "Landroidx/camera/video/MediaSpec;",
            ">;"
        }
    .end annotation

    .line 486
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    return-object v0
.end method

.method getObservableData(Landroidx/camera/core/impl/StateObservable;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/camera/core/impl/StateObservable<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 2592
    .local p1, "observable":Landroidx/camera/core/impl/StateObservable;, "Landroidx/camera/core/impl/StateObservable<TT;>;"
    invoke-virtual {p1}, Landroidx/camera/core/impl/StateObservable;->fetchData()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 2596
    .local v0, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<TT;>;"
    :try_start_0
    invoke-interface {v0}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 2597
    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    .line 2598
    .local v1, "e":Ljava/lang/Exception;
    :goto_0
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public getQualitySelector()Landroidx/camera/video/QualitySelector;
    .locals 1

    .line 618
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->getObservableData(Landroidx/camera/core/impl/StateObservable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/MediaSpec;

    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec;->getVideoSpec()Landroidx/camera/video/VideoSpec;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/video/VideoSpec;->getQualitySelector()Landroidx/camera/video/QualitySelector;

    move-result-object v0

    return-object v0
.end method

.method public getStreamInfo()Landroidx/camera/core/impl/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/core/impl/Observable<",
            "Landroidx/camera/video/StreamInfo;",
            ">;"
        }
    .end annotation

    .line 493
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mStreamInfo:Landroidx/camera/core/impl/MutableStateObservable;

    return-object v0
.end method

.method public getTargetVideoEncodingBitRate()I
    .locals 1

    .line 652
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->getObservableData(Landroidx/camera/core/impl/StateObservable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/MediaSpec;

    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec;->getVideoSpec()Landroidx/camera/video/VideoSpec;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/video/VideoSpec;->getBitrate()Landroid/util/Range;

    move-result-object v0

    invoke-virtual {v0}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method isAudioEnabled()Z
    .locals 2

    .line 2225
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioState:Landroidx/camera/video/Recorder$AudioState;

    sget-object v1, Landroidx/camera/video/Recorder$AudioState;->ENABLED:Landroidx/camera/video/Recorder$AudioState;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method isAudioSupported()Z
    .locals 1

    .line 2603
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->getObservableData(Landroidx/camera/core/impl/StateObservable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/MediaSpec;

    invoke-virtual {v0}, Landroidx/camera/video/MediaSpec;->getAudioSpec()Landroidx/camera/video/AudioSpec;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/video/AudioSpec;->getChannelCount()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method isPersistentRecordingInProgress()Z
    .locals 1

    .line 1159
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-virtual {v0}, Landroidx/camera/video/Recorder$RecordingRecord;->isPersistent()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method synthetic lambda$configureInternal$7$androidx-camera-video-Recorder(Landroidx/camera/core/SurfaceRequest$TransformationInfo;)V
    .locals 0
    .param p1, "transformationInfo"    # Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    .line 1092
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mSourceTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    return-void
.end method

.method synthetic lambda$mute$6$androidx-camera-video-Recorder(Landroidx/camera/video/Recorder$RecordingRecord;Z)V
    .locals 0
    .param p1, "finalRecordingRecord"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "muted"    # Z

    .line 945
    invoke-direct {p0, p1, p2}, Landroidx/camera/video/Recorder;->muteInternal(Landroidx/camera/video/Recorder$RecordingRecord;Z)V

    return-void
.end method

.method synthetic lambda$onSourceStateChanged$1$androidx-camera-video-Recorder(Landroidx/camera/video/VideoOutput$SourceState;)V
    .locals 0
    .param p1, "newState"    # Landroidx/camera/video/VideoOutput$SourceState;

    .line 499
    invoke-virtual {p0, p1}, Landroidx/camera/video/Recorder;->onSourceStateChangedInternal(Landroidx/camera/video/VideoOutput$SourceState;)V

    return-void
.end method

.method synthetic lambda$onSurfaceRequested$0$androidx-camera-video-Recorder(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;)V
    .locals 0
    .param p1, "request"    # Landroidx/camera/core/SurfaceRequest;
    .param p2, "timebase"    # Landroidx/camera/core/impl/Timebase;

    .line 479
    invoke-direct {p0, p1, p2}, Landroidx/camera/video/Recorder;->onSurfaceRequestedInternal(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;)V

    return-void
.end method

.method synthetic lambda$pause$3$androidx-camera-video-Recorder(Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 0
    .param p1, "finalActiveRecordingRecord"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 799
    invoke-direct {p0, p1}, Landroidx/camera/video/Recorder;->pauseInternal(Landroidx/camera/video/Recorder$RecordingRecord;)V

    return-void
.end method

.method synthetic lambda$resume$4$androidx-camera-video-Recorder(Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 0
    .param p1, "finalActiveRecordingRecord"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 855
    invoke-direct {p0, p1}, Landroidx/camera/video/Recorder;->resumeInternal(Landroidx/camera/video/Recorder$RecordingRecord;)V

    return-void
.end method

.method synthetic lambda$setupAndStartMediaMuxer$10$androidx-camera-video-Recorder(Landroid/net/Uri;)V
    .locals 0
    .param p1, "uri"    # Landroid/net/Uri;

    .line 1468
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mOutputUri:Landroid/net/Uri;

    return-void
.end method

.method synthetic lambda$setupVideo$8$androidx-camera-video-Recorder(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;)V
    .locals 5
    .param p1, "request"    # Landroidx/camera/core/SurfaceRequest;
    .param p2, "timebase"    # Landroidx/camera/core/impl/Timebase;

    .line 1117
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->isServiced()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderSession:Landroidx/camera/video/VideoEncoderSession;

    .line 1118
    invoke-virtual {v0, p1}, Landroidx/camera/video/VideoEncoderSession;->isConfiguredSurfaceRequest(Landroidx/camera/core/SurfaceRequest;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1119
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isPersistentRecordingInProgress()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1127
    :cond_0
    new-instance v0, Landroidx/camera/video/VideoEncoderSession;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mVideoEncoderFactory:Landroidx/camera/video/internal/encoder/EncoderFactory;

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-direct {v0, v1, v2, v3}, Landroidx/camera/video/VideoEncoderSession;-><init>(Landroidx/camera/video/internal/encoder/EncoderFactory;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;)V

    .line 1129
    .local v0, "videoEncoderSession":Landroidx/camera/video/VideoEncoderSession;
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    invoke-virtual {p0, v1}, Landroidx/camera/video/Recorder;->getObservableData(Landroidx/camera/core/impl/StateObservable;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/video/MediaSpec;

    .line 1130
    .local v1, "mediaSpec":Landroidx/camera/video/MediaSpec;
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mResolvedEncoderProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    .line 1131
    invoke-virtual {v0, p1, p2, v1, v2}, Landroidx/camera/video/VideoEncoderSession;->configure(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/MediaSpec;Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v2

    .line 1133
    .local v2, "configureFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Landroidx/camera/video/internal/encoder/Encoder;>;"
    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderSession:Landroidx/camera/video/VideoEncoderSession;

    .line 1134
    new-instance v3, Landroidx/camera/video/Recorder$1;

    invoke-direct {v3, p0, v0}, Landroidx/camera/video/Recorder$1;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/VideoEncoderSession;)V

    iget-object v4, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v2, v3, v4}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 1153
    return-void

    .line 1122
    .end local v0    # "videoEncoderSession":Landroidx/camera/video/VideoEncoderSession;
    .end local v1    # "mediaSpec":Landroidx/camera/video/MediaSpec;
    .end local v2    # "configureFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Landroidx/camera/video/internal/encoder/Encoder;>;"
    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Ignore the SurfaceRequest "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " isServiced: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1123
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->isServiced()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " VideoEncoderSession: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mVideoEncoderSession:Landroidx/camera/video/VideoEncoderSession;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " has been configured with a persistent in-progress recording."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1122
    const-string/jumbo v1, "Recorder"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 1125
    return-void
.end method

.method synthetic lambda$start$2$androidx-camera-video-Recorder()V
    .locals 2

    .line 739
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    if-eqz v0, :cond_0

    .line 744
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLatestSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mVideoSourceTimebase:Landroidx/camera/core/impl/Timebase;

    invoke-direct {p0, v0, v1}, Landroidx/camera/video/Recorder;->configureInternal(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;)V

    .line 745
    return-void

    .line 740
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "surface request is required to retry initialization."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method synthetic lambda$stop$5$androidx-camera-video-Recorder(Landroidx/camera/video/Recorder$RecordingRecord;JILjava/lang/Throwable;)V
    .locals 0
    .param p1, "finalActiveRecordingRecord"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "explicitlyStopTimeUs"    # J
    .param p4, "error"    # I
    .param p5, "errorCause"    # Ljava/lang/Throwable;

    .line 910
    invoke-virtual/range {p0 .. p5}, Landroidx/camera/video/Recorder;->stopInternal(Landroidx/camera/video/Recorder$RecordingRecord;JILjava/lang/Throwable;)V

    return-void
.end method

.method synthetic lambda$stopInternal$15$androidx-camera-video-Recorder(Landroidx/camera/video/internal/encoder/Encoder;)V
    .locals 2
    .param p1, "finalVideoEncoder"    # Landroidx/camera/video/internal/encoder/Encoder;

    .line 2046
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda3;

    invoke-direct {v1, p1}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/video/internal/encoder/Encoder;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$updateEncoderCallbacks$11$androidx-camera-video-Recorder(Landroidx/camera/video/Recorder$RecordingRecord;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 3
    .param p1, "recordingToStart"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1626
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    new-instance v1, Landroidx/camera/video/Recorder$4;

    invoke-direct {v1, p0, p2, p1}, Landroidx/camera/video/Recorder$4;-><init>(Landroidx/camera/video/Recorder;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/camera/video/Recorder$RecordingRecord;)V

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v0, v1, v2}, Landroidx/camera/video/internal/encoder/Encoder;->setEncoderCallback(Landroidx/camera/video/internal/encoder/EncoderCallback;Ljava/util/concurrent/Executor;)V

    .line 1716
    const-string/jumbo v0, "videoEncodingFuture"

    return-object v0
.end method

.method synthetic lambda$updateEncoderCallbacks$12$androidx-camera-video-Recorder(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .line 1723
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioErrorCause:Ljava/lang/Throwable;

    if-nez v0, :cond_1

    .line 1727
    instance-of v0, p2, Landroidx/camera/video/internal/encoder/EncodeException;

    if-eqz v0, :cond_0

    .line 1728
    sget-object v0, Landroidx/camera/video/Recorder$AudioState;->ERROR_ENCODER:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setAudioState(Landroidx/camera/video/Recorder$AudioState;)V

    goto :goto_0

    .line 1730
    :cond_0
    sget-object v0, Landroidx/camera/video/Recorder$AudioState;->ERROR_SOURCE:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setAudioState(Landroidx/camera/video/Recorder$AudioState;)V

    .line 1732
    :goto_0
    iput-object p2, p0, Landroidx/camera/video/Recorder;->mAudioErrorCause:Ljava/lang/Throwable;

    .line 1733
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->updateInProgressStatusEvent()V

    .line 1734
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 1736
    :cond_1
    return-void
.end method

.method synthetic lambda$updateEncoderCallbacks$13$androidx-camera-video-Recorder(Landroidx/camera/video/Recorder$RecordingRecord;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 4
    .param p1, "recordingToStart"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1722
    new-instance v0, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda10;

    invoke-direct {v0, p0, p2}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda10;-><init>(Landroidx/camera/video/Recorder;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    .line 1738
    .local v0, "audioErrorConsumer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Ljava/lang/Throwable;>;"
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mAudioSource:Landroidx/camera/video/internal/audio/AudioSource;

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v3, Landroidx/camera/video/Recorder$5;

    invoke-direct {v3, p0, v0}, Landroidx/camera/video/Recorder$5;-><init>(Landroidx/camera/video/Recorder;Landroidx/core/util/Consumer;)V

    invoke-virtual {v1, v2, v3}, Landroidx/camera/video/internal/audio/AudioSource;->setAudioSourceCallback(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;)V

    .line 1766
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    new-instance v2, Landroidx/camera/video/Recorder$6;

    invoke-direct {v2, p0, p2, v0, p1}, Landroidx/camera/video/Recorder$6;-><init>(Landroidx/camera/video/Recorder;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;Landroidx/core/util/Consumer;Landroidx/camera/video/Recorder$RecordingRecord;)V

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v1, v2, v3}, Landroidx/camera/video/internal/encoder/Encoder;->setEncoderCallback(Landroidx/camera/video/internal/encoder/EncoderCallback;Ljava/util/concurrent/Executor;)V

    .line 1836
    const-string/jumbo v1, "audioEncodingFuture"

    return-object v1
.end method

.method mute(Landroidx/camera/video/Recording;Z)V
    .locals 4
    .param p1, "activeRecording"    # Landroidx/camera/video/Recording;
    .param p2, "muted"    # Z

    .line 932
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 933
    :try_start_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v1}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v1}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 938
    const-string/jumbo v1, "Recorder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "mute() called on a recording that is no longer active: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 940
    invoke-virtual {p1}, Landroidx/camera/video/Recording;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 938
    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 941
    monitor-exit v0

    return-void

    .line 943
    :cond_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v1}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 944
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    goto :goto_0

    :cond_1
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 945
    .local v1, "finalRecordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    :goto_0
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v3, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda17;

    invoke-direct {v3, p0, v1, p2}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda17;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/Recorder$RecordingRecord;Z)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 946
    .end local v1    # "finalRecordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    monitor-exit v0

    .line 947
    return-void

    .line 946
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method onConfigured()V
    .locals 10

    .line 1212
    const/4 v0, 0x0

    .line 1213
    .local v0, "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    const/4 v1, 0x0

    .line 1214
    .local v1, "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    const/4 v2, 0x0

    .line 1215
    .local v2, "continuePersistentRecording":Z
    const/4 v3, 0x0

    .line 1216
    .local v3, "error":I
    const/4 v4, 0x0

    .line 1217
    .local v4, "errorCause":Ljava/lang/Throwable;
    const/4 v5, 0x0

    .line 1218
    .local v5, "recordingPaused":Z
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v6

    .line 1219
    :try_start_0
    sget-object v7, Landroidx/camera/video/Recorder$8;->$SwitchMap$androidx$camera$video$Recorder$State:[I

    iget-object v8, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v8}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v8

    aget v7, v7, v8

    packed-switch v7, :pswitch_data_0

    goto :goto_0

    .line 1244
    :pswitch_0
    const-string/jumbo v7, "Recorder"

    const-string/jumbo v8, "onConfigured() was invoked when the Recorder had encountered error"

    invoke-static {v7, v8}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1246
    goto :goto_0

    .line 1241
    :pswitch_1
    sget-object v7, Landroidx/camera/video/Recorder$State;->IDLING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v7}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 1242
    goto :goto_0

    .line 1226
    :pswitch_2
    iget-boolean v7, p0, Landroidx/camera/video/Recorder;->mEncoderNotUsePersistentInputSurface:Z

    if-eqz v7, :cond_0

    goto :goto_0

    .line 1227
    :cond_0
    new-instance v7, Ljava/lang/AssertionError;

    const-string/jumbo v8, "Unexpectedly invoke onConfigured() in a STOPPING state when it\'s not waiting for a new surface."

    invoke-direct {v7, v8}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local v0    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v1    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v2    # "continuePersistentRecording":Z
    .end local v3    # "error":I
    .end local v4    # "errorCause":Ljava/lang/Throwable;
    .end local v5    # "recordingPaused":Z
    throw v7

    .line 1223
    .restart local v0    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v1    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v2    # "continuePersistentRecording":Z
    .restart local v3    # "error":I
    .restart local v4    # "errorCause":Ljava/lang/Throwable;
    .restart local v5    # "recordingPaused":Z
    :pswitch_3
    new-instance v7, Ljava/lang/AssertionError;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Incorrectly invoke onConfigured() in state "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local v0    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v1    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v2    # "continuePersistentRecording":Z
    .end local v3    # "error":I
    .end local v4    # "errorCause":Ljava/lang/Throwable;
    .end local v5    # "recordingPaused":Z
    throw v7

    .line 1248
    .restart local v0    # "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v1    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v2    # "continuePersistentRecording":Z
    .restart local v3    # "error":I
    .restart local v4    # "errorCause":Ljava/lang/Throwable;
    .restart local v5    # "recordingPaused":Z
    :pswitch_4
    const/4 v5, 0x1

    .line 1251
    :pswitch_5
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    if-eqz v7, :cond_1

    .line 1254
    goto :goto_0

    .line 1256
    :cond_1
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

    sget-object v8, Landroidx/camera/video/VideoOutput$SourceState;->INACTIVE:Landroidx/camera/video/VideoOutput$SourceState;

    if-ne v7, v8, :cond_2

    .line 1257
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    move-object v1, v7

    .line 1258
    const/4 v7, 0x0

    iput-object v7, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1259
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->restoreNonPendingState()V

    .line 1260
    const/4 v3, 0x4

    .line 1261
    sget-object v7, Landroidx/camera/video/Recorder;->PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE:Ljava/lang/Exception;

    move-object v4, v7

    goto :goto_0

    .line 1263
    :cond_2
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v7}, Landroidx/camera/video/Recorder;->makePendingRecordingActiveLocked(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/Recorder$RecordingRecord;

    move-result-object v7

    move-object v0, v7

    goto :goto_0

    .line 1232
    :pswitch_6
    const/4 v5, 0x1

    .line 1235
    :pswitch_7
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isPersistentRecordingInProgress()Z

    move-result v7

    const-string/jumbo v8, "Unexpectedly invoke onConfigured() when there\'s a non-persistent in-progress recording"

    invoke-static {v7, v8}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 1238
    const/4 v2, 0x1

    .line 1239
    nop

    .line 1267
    :goto_0
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1269
    if-eqz v2, :cond_4

    .line 1270
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    const/4 v7, 0x1

    invoke-direct {p0, v6, v7}, Landroidx/camera/video/Recorder;->updateEncoderCallbacks(Landroidx/camera/video/Recorder$RecordingRecord;Z)V

    .line 1271
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v6}, Landroidx/camera/video/internal/encoder/Encoder;->start()V

    .line 1272
    iget-boolean v6, p0, Landroidx/camera/video/Recorder;->mShouldSendResumeEvent:Z

    if-eqz v6, :cond_3

    .line 1273
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    iget-object v7, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1274
    invoke-virtual {v7}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v7

    .line 1275
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->getInProgressRecordingStats()Landroidx/camera/video/RecordingStats;

    move-result-object v8

    .line 1273
    invoke-static {v7, v8}, Landroidx/camera/video/VideoRecordEvent;->resume(Landroidx/camera/video/OutputOptions;Landroidx/camera/video/RecordingStats;)Landroidx/camera/video/VideoRecordEvent$Resume;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroidx/camera/video/Recorder$RecordingRecord;->updateVideoRecordEvent(Landroidx/camera/video/VideoRecordEvent;)V

    .line 1276
    const/4 v6, 0x0

    iput-boolean v6, p0, Landroidx/camera/video/Recorder;->mShouldSendResumeEvent:Z

    .line 1278
    :cond_3
    if-eqz v5, :cond_6

    .line 1279
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v6}, Landroidx/camera/video/internal/encoder/Encoder;->pause()V

    goto :goto_1

    .line 1281
    :cond_4
    if-eqz v0, :cond_5

    .line 1283
    invoke-direct {p0, v0, v5}, Landroidx/camera/video/Recorder;->startRecording(Landroidx/camera/video/Recorder$RecordingRecord;Z)V

    goto :goto_1

    .line 1284
    :cond_5
    if-eqz v1, :cond_6

    .line 1285
    invoke-direct {p0, v1, v3, v4}, Landroidx/camera/video/Recorder;->finalizePendingRecording(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 1287
    :cond_6
    :goto_1
    return-void

    .line 1267
    :catchall_0
    move-exception v7

    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v7

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_7
        :pswitch_4
        :pswitch_5
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method onEncoderSetupError(Ljava/lang/Throwable;)V
    .locals 5
    .param p1, "cause"    # Ljava/lang/Throwable;

    .line 1385
    const/4 v0, 0x0

    .line 1386
    .local v0, "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1387
    :try_start_0
    sget-object v2, Landroidx/camera/video/Recorder$8;->$SwitchMap$androidx$camera$video$Recorder$State:[I

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v3}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    goto :goto_0

    .line 1400
    :pswitch_0
    goto :goto_0

    .line 1391
    :pswitch_1
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    move-object v0, v2

    .line 1392
    const/4 v2, 0x0

    iput-object v2, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1395
    :pswitch_2
    const/4 v2, -0x1

    invoke-direct {p0, v2}, Landroidx/camera/video/Recorder;->setStreamId(I)V

    .line 1396
    sget-object v2, Landroidx/camera/video/Recorder$State;->ERROR:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v2}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 1397
    goto :goto_0

    .line 1410
    :pswitch_3
    new-instance v2, Ljava/lang/AssertionError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Encountered encoder setup error while in unexpected state "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local v0    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local p1    # "cause":Ljava/lang/Throwable;
    throw v2

    .line 1413
    .restart local v0    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local p1    # "cause":Ljava/lang/Throwable;
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1415
    if-eqz v0, :cond_0

    .line 1416
    const/4 v1, 0x7

    invoke-direct {p0, v0, v1, p1}, Landroidx/camera/video/Recorder;->finalizePendingRecording(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 1418
    :cond_0
    return-void

    .line 1413
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_3
        :pswitch_1
        :pswitch_1
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V
    .locals 9
    .param p1, "recording"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "error"    # I
    .param p3, "cause"    # Ljava/lang/Throwable;

    .line 2416
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-ne p1, v0, :cond_2

    .line 2421
    const/4 v1, 0x0

    .line 2422
    .local v1, "needsStop":Z
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 2423
    :try_start_0
    sget-object v0, Landroidx/camera/video/Recorder$8;->$SwitchMap$androidx$camera$video$Recorder$State:[I

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v3}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v3

    aget v0, v0, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 2448
    :pswitch_0
    :try_start_1
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "In-progress recording error occurred while in unexpected state: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local v1    # "needsStop":Z
    .end local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local p2    # "error":I
    .end local p3    # "cause":Ljava/lang/Throwable;
    throw v0

    .line 2427
    .restart local v1    # "needsStop":Z
    .restart local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local p2    # "error":I
    .restart local p3    # "cause":Ljava/lang/Throwable;
    :pswitch_1
    sget-object v0, Landroidx/camera/video/Recorder$State;->STOPPING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 2428
    const/4 v0, 0x1

    move v1, v0

    .line 2438
    :pswitch_2
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 2439
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v3, "Internal error occurred for recording but it is not the active recording."

    invoke-direct {v0, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local v1    # "needsStop":Z
    .end local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local p2    # "error":I
    .end local p3    # "cause":Ljava/lang/Throwable;
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2451
    .restart local v1    # "needsStop":Z
    .restart local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local p2    # "error":I
    .restart local p3    # "cause":Ljava/lang/Throwable;
    :catchall_0
    move-exception v0

    move-object v4, p1

    move v7, p2

    move-object v8, p3

    goto :goto_2

    :goto_0
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 2453
    if-eqz v1, :cond_1

    .line 2454
    const-wide/16 v5, -0x1

    move-object v3, p0

    move-object v4, p1

    move v7, p2

    move-object v8, p3

    .end local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local p2    # "error":I
    .end local p3    # "cause":Ljava/lang/Throwable;
    .local v4, "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .local v7, "error":I
    .local v8, "cause":Ljava/lang/Throwable;
    invoke-virtual/range {v3 .. v8}, Landroidx/camera/video/Recorder;->stopInternal(Landroidx/camera/video/Recorder$RecordingRecord;JILjava/lang/Throwable;)V

    goto :goto_1

    .line 2453
    .end local v4    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v7    # "error":I
    .end local v8    # "cause":Ljava/lang/Throwable;
    .restart local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local p2    # "error":I
    .restart local p3    # "cause":Ljava/lang/Throwable;
    :cond_1
    move-object v4, p1

    move v7, p2

    move-object v8, p3

    .line 2456
    .end local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local p2    # "error":I
    .end local p3    # "cause":Ljava/lang/Throwable;
    .restart local v4    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v7    # "error":I
    .restart local v8    # "cause":Ljava/lang/Throwable;
    :goto_1
    return-void

    .line 2451
    .end local v4    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v7    # "error":I
    .end local v8    # "cause":Ljava/lang/Throwable;
    .restart local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local p2    # "error":I
    .restart local p3    # "cause":Ljava/lang/Throwable;
    :catchall_1
    move-exception v0

    move-object v4, p1

    move v7, p2

    move-object v8, p3

    .end local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local p2    # "error":I
    .end local p3    # "cause":Ljava/lang/Throwable;
    .restart local v4    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v7    # "error":I
    .restart local v8    # "cause":Ljava/lang/Throwable;
    :goto_2
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    goto :goto_2

    .line 2417
    .end local v1    # "needsStop":Z
    .end local v4    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v7    # "error":I
    .end local v8    # "cause":Ljava/lang/Throwable;
    .restart local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local p2    # "error":I
    .restart local p3    # "cause":Ljava/lang/Throwable;
    :cond_2
    move-object v4, p1

    move v7, p2

    .end local p1    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local p2    # "error":I
    .restart local v4    # "recording":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local v7    # "error":I
    new-instance p1, Ljava/lang/AssertionError;

    const-string p2, "Internal error occurred on recording that is not the current in-progress recording."

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onSourceStateChanged(Landroidx/camera/video/VideoOutput$SourceState;)V
    .locals 2
    .param p1, "newState"    # Landroidx/camera/video/VideoOutput$SourceState;

    .line 499
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda14;

    invoke-direct {v1, p0, p1}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda14;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/VideoOutput$SourceState;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 500
    return-void
.end method

.method onSourceStateChangedInternal(Landroidx/camera/video/VideoOutput$SourceState;)V
    .locals 5
    .param p1, "newState"    # Landroidx/camera/video/VideoOutput$SourceState;

    .line 975
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

    .line 976
    .local v0, "oldState":Landroidx/camera/video/VideoOutput$SourceState;
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

    .line 977
    const-string/jumbo v1, "Recorder"

    if-eq v0, p1, :cond_3

    .line 978
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Video source has transitioned to state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 984
    sget-object v1, Landroidx/camera/video/VideoOutput$SourceState;->INACTIVE:Landroidx/camera/video/VideoOutput$SourceState;

    const/4 v2, 0x0

    if-ne p1, v1, :cond_1

    .line 985
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mActiveSurface:Landroid/view/Surface;

    const/4 v3, 0x0

    const/4 v4, 0x4

    if-nez v1, :cond_0

    .line 989
    invoke-virtual {p0, v4, v3, v2}, Landroidx/camera/video/Recorder;->requestReset(ILjava/lang/Throwable;Z)V

    goto :goto_0

    .line 994
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroidx/camera/video/Recorder;->mNeedsResetBeforeNextStart:Z

    .line 995
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-virtual {v1}, Landroidx/camera/video/Recorder$RecordingRecord;->isPersistent()Z

    move-result v1

    if-nez v1, :cond_2

    .line 998
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-virtual {p0, v1, v4, v3}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    goto :goto_0

    .line 1002
    :cond_1
    sget-object v1, Landroidx/camera/video/VideoOutput$SourceState;->ACTIVE_NON_STREAMING:Landroidx/camera/video/VideoOutput$SourceState;

    if-ne p1, v1, :cond_2

    .line 1004
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mSourceNonStreamingTimeout:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mSourceNonStreamingTimeout:Ljava/util/concurrent/ScheduledFuture;

    invoke-interface {v1, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    if-eqz v1, :cond_2

    .line 1006
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-static {v1}, Landroidx/camera/video/Recorder;->notifyEncoderSourceStopped(Landroidx/camera/video/internal/encoder/Encoder;)V

    .line 1009
    :cond_2
    :goto_0
    return-void

    .line 980
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Video source transitions to the same state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 981
    return-void
.end method

.method public onSurfaceRequested(Landroidx/camera/core/SurfaceRequest;)V
    .locals 1
    .param p1, "request"    # Landroidx/camera/core/SurfaceRequest;

    .line 466
    sget-object v0, Landroidx/camera/core/impl/Timebase;->UPTIME:Landroidx/camera/core/impl/Timebase;

    invoke-virtual {p0, p1, v0}, Landroidx/camera/video/Recorder;->onSurfaceRequested(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;)V

    .line 467
    return-void
.end method

.method public onSurfaceRequested(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;)V
    .locals 4
    .param p1, "request"    # Landroidx/camera/core/SurfaceRequest;
    .param p2, "timebase"    # Landroidx/camera/core/impl/Timebase;

    .line 472
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 473
    :try_start_0
    const-string/jumbo v1, "Recorder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Surface is requested in state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", Current surface: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Landroidx/camera/video/Recorder;->mStreamId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 475
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    sget-object v2, Landroidx/camera/video/Recorder$State;->ERROR:Landroidx/camera/video/Recorder$State;

    if-ne v1, v2, :cond_0

    .line 476
    sget-object v1, Landroidx/camera/video/Recorder$State;->CONFIGURING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v1}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 478
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 479
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda13;

    invoke-direct {v1, p0, p1, p2}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda13;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/core/SurfaceRequest;Landroidx/camera/core/impl/Timebase;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 480
    return-void

    .line 478
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method onVideoEncoderReady(Landroidx/camera/video/VideoEncoderSession;)V
    .locals 3
    .param p1, "videoEncoderSession"    # Landroidx/camera/video/VideoEncoderSession;

    .line 1172
    invoke-virtual {p1}, Landroidx/camera/video/VideoEncoderSession;->getVideoEncoder()Landroidx/camera/video/internal/encoder/Encoder;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    .line 1173
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    .line 1174
    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/Encoder;->getEncoderInfo()Landroidx/camera/video/internal/encoder/EncoderInfo;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/VideoEncoderInfo;->getSupportedBitrateRange()Landroid/util/Range;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoderBitrateRange:Landroid/util/Range;

    .line 1175
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/Encoder;->getConfiguredBitrate()I

    move-result v0

    iput v0, p0, Landroidx/camera/video/Recorder;->mFirstRecordingVideoBitrate:I

    .line 1176
    invoke-virtual {p1}, Landroidx/camera/video/VideoEncoderSession;->getActiveSurface()Landroid/view/Surface;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mActiveSurface:Landroid/view/Surface;

    .line 1177
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mActiveSurface:Landroid/view/Surface;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setLatestSurface(Landroid/view/Surface;)V

    .line 1179
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda6;-><init>(Landroidx/camera/video/Recorder;)V

    invoke-virtual {p1, v0, v1}, Landroidx/camera/video/VideoEncoderSession;->setOnSurfaceUpdateListener(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;)V

    .line 1181
    invoke-virtual {p1}, Landroidx/camera/video/VideoEncoderSession;->getReadyToReleaseFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/video/Recorder$2;

    invoke-direct {v1, p0, p1}, Landroidx/camera/video/Recorder$2;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/VideoEncoderSession;)V

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 1207
    return-void
.end method

.method pause(Landroidx/camera/video/Recording;)V
    .locals 4
    .param p1, "activeRecording"    # Landroidx/camera/video/Recording;

    .line 775
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 776
    :try_start_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v1}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v1}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 781
    const-string/jumbo v1, "Recorder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "pause() called on a recording that is no longer active: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 783
    invoke-virtual {p1}, Landroidx/camera/video/Recording;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 781
    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 784
    monitor-exit v0

    return-void

    .line 787
    :cond_0
    sget-object v1, Landroidx/camera/video/Recorder$8;->$SwitchMap$androidx$camera$video$Recorder$State:[I

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v2}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 795
    :pswitch_1
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Called pause() from invalid state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local p1    # "activeRecording":Landroidx/camera/video/Recording;
    throw v1

    .line 810
    .restart local p1    # "activeRecording":Landroidx/camera/video/Recording;
    :pswitch_2
    goto :goto_0

    .line 790
    :pswitch_3
    sget-object v1, Landroidx/camera/video/Recorder$State;->PENDING_PAUSED:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v1}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 791
    goto :goto_0

    .line 797
    :pswitch_4
    sget-object v1, Landroidx/camera/video/Recorder$State;->PAUSED:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v1}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 798
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 799
    .local v1, "finalActiveRecordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v3, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda5;

    invoke-direct {v3, p0, v1}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda5;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/Recorder$RecordingRecord;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 800
    goto :goto_0

    .line 805
    .end local v1    # "finalActiveRecordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    :pswitch_5
    nop

    .line 816
    :goto_0
    monitor-exit v0

    .line 817
    return-void

    .line 816
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_5
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public prepareRecording(Landroid/content/Context;Landroidx/camera/video/FileDescriptorOutputOptions;)Landroidx/camera/video/PendingRecording;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileDescriptorOutputOptions"    # Landroidx/camera/video/FileDescriptorOutputOptions;

    .line 566
    nop

    .line 571
    invoke-direct {p0, p1, p2}, Landroidx/camera/video/Recorder;->prepareRecordingInternal(Landroid/content/Context;Landroidx/camera/video/OutputOptions;)Landroidx/camera/video/PendingRecording;

    move-result-object v0

    return-object v0
.end method

.method public prepareRecording(Landroid/content/Context;Landroidx/camera/video/FileOutputOptions;)Landroidx/camera/video/PendingRecording;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fileOutputOptions"    # Landroidx/camera/video/FileOutputOptions;

    .line 532
    invoke-direct {p0, p1, p2}, Landroidx/camera/video/Recorder;->prepareRecordingInternal(Landroid/content/Context;Landroidx/camera/video/OutputOptions;)Landroidx/camera/video/PendingRecording;

    move-result-object v0

    return-object v0
.end method

.method public prepareRecording(Landroid/content/Context;Landroidx/camera/video/MediaStoreOutputOptions;)Landroidx/camera/video/PendingRecording;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "mediaStoreOutputOptions"    # Landroidx/camera/video/MediaStoreOutputOptions;

    .line 598
    invoke-direct {p0, p1, p2}, Landroidx/camera/video/Recorder;->prepareRecordingInternal(Landroid/content/Context;Landroidx/camera/video/OutputOptions;)Landroidx/camera/video/PendingRecording;

    move-result-object v0

    return-object v0
.end method

.method requestReset(ILjava/lang/Throwable;Z)V
    .locals 10
    .param p1, "errorCode"    # I
    .param p2, "errorCause"    # Ljava/lang/Throwable;
    .param p3, "videoOnly"    # Z

    .line 1023
    const/4 v1, 0x0

    .line 1024
    .local v1, "shouldReset":Z
    const/4 v2, 0x0

    .line 1025
    .local v2, "shouldStop":Z
    iget-object v3, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 1026
    :try_start_0
    sget-object v0, Landroidx/camera/video/Recorder$8;->$SwitchMap$androidx$camera$video$Recorder$State:[I

    iget-object v4, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v4}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v4

    aget v0, v0, v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_1

    .line 1039
    :pswitch_1
    const/4 v1, 0x1

    .line 1040
    goto :goto_1

    .line 1063
    :pswitch_2
    :try_start_1
    sget-object v0, Landroidx/camera/video/Recorder$State;->RESETTING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 1064
    goto :goto_1

    .line 1031
    :pswitch_3
    const/4 v1, 0x1

    .line 1032
    sget-object v0, Landroidx/camera/video/Recorder$State;->RESETTING:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v0}, Landroidx/camera/video/Recorder;->updateNonPendingState(Landroidx/camera/video/Recorder$State;)V

    .line 1033
    goto :goto_1

    .line 1044
    :pswitch_4
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "In-progress recording shouldn\'t be null when in state "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 1046
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    iget-object v4, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-ne v0, v4, :cond_2

    .line 1053
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isPersistentRecordingInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1054
    const/4 v1, 0x1

    goto :goto_1

    .line 1056
    :cond_1
    const/4 v2, 0x1

    .line 1057
    sget-object v0, Landroidx/camera/video/Recorder$State;->RESETTING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 1059
    goto :goto_1

    .line 1047
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    const-string v4, "In-progress recording does not match the active recording. Unable to reset encoder."

    invoke-direct {v0, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local v1    # "shouldReset":Z
    .end local v2    # "shouldStop":Z
    .end local p1    # "errorCode":I
    .end local p2    # "errorCause":Ljava/lang/Throwable;
    .end local p3    # "videoOnly":Z
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1069
    .restart local v1    # "shouldReset":Z
    .restart local v2    # "shouldStop":Z
    .restart local p1    # "errorCode":I
    .restart local p2    # "errorCause":Ljava/lang/Throwable;
    .restart local p3    # "videoOnly":Z
    :catchall_0
    move-exception v0

    move v8, p1

    move-object v9, p2

    goto :goto_3

    :goto_1
    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1073
    if-eqz v1, :cond_4

    .line 1074
    if-eqz p3, :cond_3

    .line 1075
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->resetVideo()V

    move v8, p1

    move-object v9, p2

    goto :goto_2

    .line 1077
    :cond_3
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->reset()V

    move v8, p1

    move-object v9, p2

    goto :goto_2

    .line 1079
    :cond_4
    if-eqz v2, :cond_5

    .line 1080
    iget-object v5, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    const-wide/16 v6, -0x1

    move-object v4, p0

    move v8, p1

    move-object v9, p2

    .end local p1    # "errorCode":I
    .end local p2    # "errorCause":Ljava/lang/Throwable;
    .local v8, "errorCode":I
    .local v9, "errorCause":Ljava/lang/Throwable;
    invoke-virtual/range {v4 .. v9}, Landroidx/camera/video/Recorder;->stopInternal(Landroidx/camera/video/Recorder$RecordingRecord;JILjava/lang/Throwable;)V

    goto :goto_2

    .line 1079
    .end local v8    # "errorCode":I
    .end local v9    # "errorCause":Ljava/lang/Throwable;
    .restart local p1    # "errorCode":I
    .restart local p2    # "errorCause":Ljava/lang/Throwable;
    :cond_5
    move v8, p1

    move-object v9, p2

    .line 1082
    .end local p1    # "errorCode":I
    .end local p2    # "errorCause":Ljava/lang/Throwable;
    .restart local v8    # "errorCode":I
    .restart local v9    # "errorCause":Ljava/lang/Throwable;
    :goto_2
    return-void

    .line 1069
    .end local v8    # "errorCode":I
    .end local v9    # "errorCause":Ljava/lang/Throwable;
    .restart local p1    # "errorCode":I
    .restart local p2    # "errorCause":Ljava/lang/Throwable;
    :catchall_1
    move-exception v0

    move v8, p1

    move-object v9, p2

    .end local p1    # "errorCode":I
    .end local p2    # "errorCause":Ljava/lang/Throwable;
    .restart local v8    # "errorCode":I
    .restart local v9    # "errorCause":Ljava/lang/Throwable;
    :goto_3
    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    goto :goto_3

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method resume(Landroidx/camera/video/Recording;)V
    .locals 4
    .param p1, "activeRecording"    # Landroidx/camera/video/Recording;

    .line 820
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 821
    :try_start_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v1}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v1}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 826
    const-string/jumbo v1, "Recorder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "resume() called on a recording that is no longer active: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 828
    invoke-virtual {p1}, Landroidx/camera/video/Recording;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 826
    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 829
    monitor-exit v0

    return-void

    .line 831
    :cond_0
    sget-object v1, Landroidx/camera/video/Recorder$8;->$SwitchMap$androidx$camera$video$Recorder$State:[I

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v2}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 840
    :pswitch_1
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Called resume() from invalid state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local p1    # "activeRecording":Landroidx/camera/video/Recording;
    throw v1

    .line 834
    .restart local p1    # "activeRecording":Landroidx/camera/video/Recording;
    :pswitch_2
    sget-object v1, Landroidx/camera/video/Recorder$State;->PENDING_RECORDING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v1}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 835
    goto :goto_0

    .line 851
    :pswitch_3
    goto :goto_0

    .line 853
    :pswitch_4
    sget-object v1, Landroidx/camera/video/Recorder$State;->RECORDING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v1}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 854
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 855
    .local v1, "finalActiveRecordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v3, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda16;

    invoke-direct {v3, p0, v1}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda16;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/Recorder$RecordingRecord;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 856
    nop

    .line 862
    .end local v1    # "finalActiveRecordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    :goto_0
    monitor-exit v0

    .line 863
    return-void

    .line 862
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method setAudioState(Landroidx/camera/video/Recorder$AudioState;)V
    .locals 2
    .param p1, "audioState"    # Landroidx/camera/video/Recorder$AudioState;

    .line 2722
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Transitioning audio state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mAudioState:Landroidx/camera/video/Recorder$AudioState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " --> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Recorder"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2723
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mAudioState:Landroidx/camera/video/Recorder$AudioState;

    .line 2724
    return-void
.end method

.method setInProgressTransformationInfo(Landroidx/camera/core/SurfaceRequest$TransformationInfo;)V
    .locals 4
    .param p1, "transformationInfo"    # Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    .line 2671
    const-string/jumbo v0, "Recorder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Update stream transformation info: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2672
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mInProgressTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    .line 2673
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 2674
    :try_start_0
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mStreamInfo:Landroidx/camera/core/impl/MutableStateObservable;

    iget v2, p0, Landroidx/camera/video/Recorder;->mStreamId:I

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v3}, Landroidx/camera/video/Recorder;->internalStateToStreamState(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/StreamInfo$StreamState;

    move-result-object v3

    invoke-static {v2, v3, p1}, Landroidx/camera/video/StreamInfo;->of(ILandroidx/camera/video/StreamInfo$StreamState;Landroidx/camera/core/SurfaceRequest$TransformationInfo;)Landroidx/camera/video/StreamInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/MutableStateObservable;->setState(Ljava/lang/Object;)V

    .line 2676
    monitor-exit v0

    .line 2677
    return-void

    .line 2676
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method setLatestSurface(Landroid/view/Surface;)V
    .locals 2
    .param p1, "surface"    # Landroid/view/Surface;

    .line 2647
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLatestSurface:Landroid/view/Surface;

    if-ne v0, p1, :cond_0

    .line 2648
    return-void

    .line 2650
    :cond_0
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mLatestSurface:Landroid/view/Surface;

    .line 2651
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 2652
    if-eqz p1, :cond_1

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_0

    .line 2653
    :catchall_0
    move-exception v1

    goto :goto_1

    .line 2652
    :cond_1
    const/4 v1, 0x0

    :goto_0
    invoke-direct {p0, v1}, Landroidx/camera/video/Recorder;->setStreamId(I)V

    .line 2653
    monitor-exit v0

    .line 2654
    return-void

    .line 2653
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method setState(Landroidx/camera/video/Recorder$State;)V
    .locals 4
    .param p1, "state"    # Landroidx/camera/video/Recorder$State;

    .line 2612
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    if-eq v0, p1, :cond_4

    .line 2617
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Transitioning Recorder internal state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " --> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "Recorder"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2621
    const/4 v0, 0x0

    .line 2622
    .local v0, "streamState":Landroidx/camera/video/StreamInfo$StreamState;
    sget-object v1, Landroidx/camera/video/Recorder;->PENDING_STATES:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2623
    sget-object v1, Landroidx/camera/video/Recorder;->PENDING_STATES:Ljava/util/Set;

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 2624
    sget-object v1, Landroidx/camera/video/Recorder;->VALID_NON_PENDING_STATES_WHILE_PENDING:Ljava/util/Set;

    iget-object v2, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2629
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    iput-object v1, p0, Landroidx/camera/video/Recorder;->mNonPendingState:Landroidx/camera/video/Recorder$State;

    .line 2630
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mNonPendingState:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v1}, Landroidx/camera/video/Recorder;->internalStateToStreamState(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/StreamInfo$StreamState;

    move-result-object v0

    goto :goto_0

    .line 2625
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid state transition. Should not be transitioning to a PENDING state from state "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 2632
    :cond_1
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mNonPendingState:Landroidx/camera/video/Recorder$State;

    if-eqz v1, :cond_2

    .line 2634
    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/camera/video/Recorder;->mNonPendingState:Landroidx/camera/video/Recorder$State;

    .line 2637
    :cond_2
    :goto_0
    iput-object p1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    .line 2638
    if-nez v0, :cond_3

    .line 2639
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v1}, Landroidx/camera/video/Recorder;->internalStateToStreamState(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/StreamInfo$StreamState;

    move-result-object v0

    .line 2641
    :cond_3
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mStreamInfo:Landroidx/camera/core/impl/MutableStateObservable;

    iget v2, p0, Landroidx/camera/video/Recorder;->mStreamId:I

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mInProgressTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    invoke-static {v2, v0, v3}, Landroidx/camera/video/StreamInfo;->of(ILandroidx/camera/video/StreamInfo$StreamState;Landroidx/camera/core/SurfaceRequest$TransformationInfo;)Landroidx/camera/video/StreamInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/MutableStateObservable;->setState(Ljava/lang/Object;)V

    .line 2642
    return-void

    .line 2613
    .end local v0    # "streamState":Landroidx/camera/video/StreamInfo$StreamState;
    :cond_4
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Attempted to transition to state "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", but Recorder is already in state "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method setupAndStartMediaMuxer(Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 12
    .param p1, "recordingToStart"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1423
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    if-nez v0, :cond_f

    .line 1427
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isAudioEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/camera/video/Recorder;->mPendingAudioRingBuffer:Landroidx/camera/core/internal/utils/RingBuffer;

    invoke-interface {v0}, Landroidx/camera/core/internal/utils/RingBuffer;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1428
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Audio is enabled but no audio sample is ready. Cannot start media muxer."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 1432
    :cond_1
    :goto_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

    if-eqz v0, :cond_e

    .line 1437
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

    .line 1438
    .local v0, "videoDataToWrite":Landroidx/camera/video/internal/encoder/EncodedData;
    const/4 v1, 0x0

    :try_start_0
    iput-object v1, p0, Landroidx/camera/video/Recorder;->mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

    .line 1439
    nop

    .line 1440
    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->getPresentationTimeUs()J

    move-result-wide v2

    .line 1439
    invoke-direct {p0, v2, v3}, Landroidx/camera/video/Recorder;->getAudioDataToWriteAndClearCache(J)Ljava/util/List;

    move-result-object v2

    .line 1444
    .local v2, "audioDataToWrite":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/video/internal/encoder/EncodedData;>;"
    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->size()J

    move-result-wide v3

    .line 1445
    .local v3, "firstDataSize":J
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/video/internal/encoder/EncodedData;

    .line 1446
    .local v6, "data":Landroidx/camera/video/internal/encoder/EncodedData;
    invoke-interface {v6}, Landroidx/camera/video/internal/encoder/EncodedData;->size()J

    move-result-wide v7

    add-long/2addr v3, v7

    .line 1447
    .end local v6    # "data":Landroidx/camera/video/internal/encoder/EncodedData;
    goto :goto_1

    .line 1448
    :cond_2
    iget-wide v5, p0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-eqz v5, :cond_4

    iget-wide v5, p0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    cmp-long v5, v3, v5

    if-lez v5, :cond_4

    .line 1450
    const-string/jumbo v5, "Recorder"

    const-string v6, "Initial data exceeds file size limit %d > %d"

    .line 1451
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    iget-wide v8, p0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    .line 1452
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    filled-new-array {v7, v8}, [Ljava/lang/Object;

    move-result-object v7

    .line 1451
    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 1450
    invoke-static {v5, v6}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1453
    const/4 v5, 0x2

    invoke-virtual {p0, p1, v5, v1}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1510
    if-eqz v0, :cond_3

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V

    .line 1455
    :cond_3
    return-void

    .line 1460
    :cond_4
    const/4 v1, 0x5

    :try_start_1
    iget-object v5, p0, Landroidx/camera/video/Recorder;->mMediaSpec:Landroidx/camera/core/impl/MutableStateObservable;

    invoke-virtual {p0, v5}, Landroidx/camera/video/Recorder;->getObservableData(Landroidx/camera/core/impl/StateObservable;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/video/MediaSpec;

    .line 1462
    .local v5, "mediaSpec":Landroidx/camera/video/MediaSpec;
    invoke-virtual {v5}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v6

    const/4 v7, -0x1

    if-ne v6, v7, :cond_5

    .line 1463
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mResolvedEncoderProfiles:Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    sget-object v7, Landroidx/camera/video/Recorder;->MEDIA_SPEC_DEFAULT:Landroidx/camera/video/MediaSpec;

    .line 1465
    invoke-virtual {v7}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v7

    .line 1464
    invoke-static {v7}, Landroidx/camera/video/MediaSpec;->outputFormatToMuxerFormat(I)I

    move-result v7

    .line 1463
    invoke-static {v6, v7}, Landroidx/camera/video/Recorder;->supportedMuxerFormatOrDefaultFrom(Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;I)I

    move-result v6

    goto :goto_2

    .line 1466
    :cond_5
    invoke-virtual {v5}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v6

    invoke-static {v6}, Landroidx/camera/video/MediaSpec;->outputFormatToMuxerFormat(I)I

    move-result v6

    :goto_2
    nop

    .line 1467
    .local v6, "muxerOutputFormat":I
    new-instance v7, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda7;

    invoke-direct {v7, p0}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda7;-><init>(Landroidx/camera/video/Recorder;)V

    invoke-virtual {p1, v6, v7}, Landroidx/camera/video/Recorder$RecordingRecord;->performOneTimeMediaMuxerCreation(ILandroidx/core/util/Consumer;)Landroid/media/MediaMuxer;

    move-result-object v7
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1473
    .end local v5    # "mediaSpec":Landroidx/camera/video/MediaSpec;
    .end local v6    # "muxerOutputFormat":I
    .local v7, "mediaMuxer":Landroid/media/MediaMuxer;
    nop

    .line 1475
    :try_start_2
    iget-object v5, p0, Landroidx/camera/video/Recorder;->mSourceTransformationInfo:Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    .line 1476
    .local v5, "transformationInfo":Landroidx/camera/core/SurfaceRequest$TransformationInfo;
    if-eqz v5, :cond_6

    .line 1477
    invoke-virtual {p0, v5}, Landroidx/camera/video/Recorder;->setInProgressTransformationInfo(Landroidx/camera/core/SurfaceRequest$TransformationInfo;)V

    .line 1478
    invoke-virtual {v5}, Landroidx/camera/core/SurfaceRequest$TransformationInfo;->getRotationDegrees()I

    move-result v6

    invoke-virtual {v7, v6}, Landroid/media/MediaMuxer;->setOrientationHint(I)V

    .line 1480
    :cond_6
    invoke-virtual {p1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v6

    invoke-virtual {v6}, Landroidx/camera/video/OutputOptions;->getLocation()Landroid/location/Location;

    move-result-object v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1481
    .local v6, "location":Landroid/location/Location;
    if-eqz v6, :cond_8

    .line 1483
    nop

    .line 1485
    :try_start_3
    invoke-virtual {v6}, Landroid/location/Location;->getLatitude()D

    move-result-wide v8

    invoke-virtual {v6}, Landroid/location/Location;->getLongitude()D

    move-result-wide v10

    .line 1484
    invoke-static {v8, v9, v10, v11}, Landroidx/camera/video/internal/workaround/CorrectNegativeLatLongForMediaMuxer;->adjustGeoLocation(DD)Landroid/util/Pair;

    move-result-object v8

    .line 1486
    .local v8, "geoLocation":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Double;Ljava/lang/Double;>;"
    iget-object v9, v8, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v9, Ljava/lang/Double;

    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v9

    double-to-float v9, v9

    iget-object v10, v8, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v10, Ljava/lang/Double;

    .line 1487
    invoke-virtual {v10}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v10

    double-to-float v10, v10

    .line 1486
    invoke-virtual {v7, v9, v10}, Landroid/media/MediaMuxer;->setLocation(FF)V
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1493
    .end local v8    # "geoLocation":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Double;Ljava/lang/Double;>;"
    goto :goto_3

    .line 1488
    :catch_0
    move-exception v8

    .line 1489
    .local v8, "e":Ljava/lang/IllegalArgumentException;
    :try_start_4
    invoke-virtual {v7}, Landroid/media/MediaMuxer;->release()V

    .line 1490
    invoke-virtual {p0, p1, v1, v8}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1510
    if-eqz v0, :cond_7

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V

    .line 1492
    :cond_7
    return-void

    .line 1496
    .end local v8    # "e":Ljava/lang/IllegalArgumentException;
    :cond_8
    :goto_3
    :try_start_5
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mVideoOutputConfig:Landroidx/camera/video/internal/encoder/OutputConfig;

    invoke-interface {v1}, Landroidx/camera/video/internal/encoder/OutputConfig;->getMediaFormat()Landroid/media/MediaFormat;

    move-result-object v1

    invoke-virtual {v7, v1}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/video/Recorder;->mVideoTrackIndex:Ljava/lang/Integer;

    .line 1497
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isAudioEnabled()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 1498
    iget-object v1, p0, Landroidx/camera/video/Recorder;->mAudioOutputConfig:Landroidx/camera/video/internal/encoder/OutputConfig;

    invoke-interface {v1}, Landroidx/camera/video/internal/encoder/OutputConfig;->getMediaFormat()Landroid/media/MediaFormat;

    move-result-object v1

    invoke-virtual {v7, v1}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/video/Recorder;->mAudioTrackIndex:Ljava/lang/Integer;

    .line 1500
    :cond_9
    invoke-virtual {v7}, Landroid/media/MediaMuxer;->start()V

    .line 1503
    iput-object v7, p0, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    .line 1506
    invoke-virtual {p0, v0, p1}, Landroidx/camera/video/Recorder;->writeVideoData(Landroidx/camera/video/internal/encoder/EncodedData;Landroidx/camera/video/Recorder$RecordingRecord;)V

    .line 1507
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/camera/video/internal/encoder/EncodedData;

    .line 1508
    .local v8, "data":Landroidx/camera/video/internal/encoder/EncodedData;
    invoke-virtual {p0, v8, p1}, Landroidx/camera/video/Recorder;->writeAudioData(Landroidx/camera/video/internal/encoder/EncodedData;Landroidx/camera/video/Recorder$RecordingRecord;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1509
    .end local v8    # "data":Landroidx/camera/video/internal/encoder/EncodedData;
    goto :goto_4

    .line 1510
    .end local v2    # "audioDataToWrite":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/video/internal/encoder/EncodedData;>;"
    .end local v3    # "firstDataSize":J
    .end local v5    # "transformationInfo":Landroidx/camera/core/SurfaceRequest$TransformationInfo;
    .end local v6    # "location":Landroid/location/Location;
    .end local v7    # "mediaMuxer":Landroid/media/MediaMuxer;
    :cond_a
    if-eqz v0, :cond_b

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V

    .line 1511
    .end local v0    # "videoDataToWrite":Landroidx/camera/video/internal/encoder/EncodedData;
    :cond_b
    return-void

    .line 1469
    .restart local v0    # "videoDataToWrite":Landroidx/camera/video/internal/encoder/EncodedData;
    .restart local v2    # "audioDataToWrite":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/video/internal/encoder/EncodedData;>;"
    .restart local v3    # "firstDataSize":J
    :catch_1
    move-exception v5

    .line 1470
    .local v5, "e":Ljava/io/IOException;
    :try_start_6
    invoke-virtual {p0, p1, v1, v5}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 1510
    if-eqz v0, :cond_c

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V

    .line 1472
    :cond_c
    return-void

    .line 1437
    .end local v2    # "audioDataToWrite":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/video/internal/encoder/EncodedData;>;"
    .end local v3    # "firstDataSize":J
    .end local v5    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_d

    :try_start_7
    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_5

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_d
    :goto_5
    throw v1

    .line 1433
    .end local v0    # "videoDataToWrite":Landroidx/camera/video/internal/encoder/EncodedData;
    :cond_e
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Media muxer cannot be started without an encoded video frame."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 1424
    :cond_f
    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "Unable to set up media muxer when one already exists."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method start(Landroidx/camera/video/PendingRecording;)Landroidx/camera/video/Recording;
    .locals 9
    .param p1, "pendingRecording"    # Landroidx/camera/video/PendingRecording;

    .line 690
    const-string/jumbo v0, "The given PendingRecording cannot be null."

    invoke-static {p1, v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 691
    const/4 v0, 0x0

    .line 692
    .local v0, "alreadyInProgressRecording":Landroidx/camera/video/Recorder$RecordingRecord;
    const/4 v1, 0x0

    .line 693
    .local v1, "error":I
    const/4 v2, 0x0

    .line 695
    .local v2, "errorCause":Ljava/lang/Throwable;
    iget-object v3, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 696
    :try_start_0
    iget-wide v4, p0, Landroidx/camera/video/Recorder;->mLastGeneratedRecordingId:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    iput-wide v4, p0, Landroidx/camera/video/Recorder;->mLastGeneratedRecordingId:J

    .line 697
    .local v4, "recordingId":J
    sget-object v6, Landroidx/camera/video/Recorder$8;->$SwitchMap$androidx$camera$video$Recorder$State:[I

    iget-object v7, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v7}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    goto/16 :goto_2

    .line 719
    :pswitch_0
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    sget-object v7, Landroidx/camera/video/Recorder$State;->IDLING:Landroidx/camera/video/Recorder$State;

    if-ne v6, v7, :cond_1

    .line 720
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    if-nez v6, :cond_0

    iget-object v6, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    if-nez v6, :cond_0

    const/4 v6, 0x1

    goto :goto_0

    :cond_0
    const/4 v6, 0x0

    :goto_0
    const-string v7, "Expected recorder to be idle but a recording is either pending or in progress."

    invoke-static {v6, v7}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 727
    :cond_1
    :try_start_1
    invoke-static {p1, v4, v5}, Landroidx/camera/video/Recorder$RecordingRecord;->from(Landroidx/camera/video/PendingRecording;J)Landroidx/camera/video/Recorder$RecordingRecord;

    move-result-object v6

    .line 729
    .local v6, "recordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    nop

    .line 730
    invoke-virtual {p1}, Landroidx/camera/video/PendingRecording;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    .line 729
    invoke-virtual {v6, v7}, Landroidx/camera/video/Recorder$RecordingRecord;->initializeRecording(Landroid/content/Context;)V

    .line 731
    iput-object v6, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 732
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    sget-object v8, Landroidx/camera/video/Recorder$State;->IDLING:Landroidx/camera/video/Recorder$State;

    if-ne v7, v8, :cond_2

    .line 733
    sget-object v7, Landroidx/camera/video/Recorder$State;->PENDING_RECORDING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v7}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 734
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v8, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda1;

    invoke-direct {v8, p0}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/video/Recorder;)V

    invoke-interface {v7, v8}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 735
    :cond_2
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    sget-object v8, Landroidx/camera/video/Recorder$State;->ERROR:Landroidx/camera/video/Recorder$State;

    if-ne v7, v8, :cond_3

    .line 736
    sget-object v7, Landroidx/camera/video/Recorder$State;->PENDING_RECORDING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v7}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 738
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v8, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda2;

    invoke-direct {v8, p0}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/video/Recorder;)V

    invoke-interface {v7, v8}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 747
    :cond_3
    sget-object v7, Landroidx/camera/video/Recorder$State;->PENDING_RECORDING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v7}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 754
    .end local v6    # "recordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    :goto_1
    goto :goto_2

    .line 751
    :catch_0
    move-exception v6

    .line 752
    .local v6, "e":Ljava/io/IOException;
    const/4 v1, 0x5

    .line 753
    move-object v2, v6

    goto :goto_2

    .line 707
    .end local v6    # "e":Ljava/io/IOException;
    :pswitch_1
    :try_start_2
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 708
    invoke-static {v6}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/video/Recorder$RecordingRecord;

    move-object v0, v6

    .line 709
    goto :goto_2

    .line 701
    :pswitch_2
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    move-object v0, v6

    .line 702
    nop

    .line 757
    :goto_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 759
    if-nez v0, :cond_5

    .line 762
    if-eqz v1, :cond_4

    .line 763
    const-string/jumbo v3, "Recorder"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Recording was started when the Recorder had encountered error "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 766
    invoke-static {p1, v4, v5}, Landroidx/camera/video/Recorder$RecordingRecord;->from(Landroidx/camera/video/PendingRecording;J)Landroidx/camera/video/Recorder$RecordingRecord;

    move-result-object v3

    invoke-direct {p0, v3, v1, v2}, Landroidx/camera/video/Recorder;->finalizePendingRecording(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 768
    invoke-static {p1, v4, v5}, Landroidx/camera/video/Recording;->createFinalizedFrom(Landroidx/camera/video/PendingRecording;J)Landroidx/camera/video/Recording;

    move-result-object v3

    return-object v3

    .line 771
    :cond_4
    invoke-static {p1, v4, v5}, Landroidx/camera/video/Recording;->from(Landroidx/camera/video/PendingRecording;J)Landroidx/camera/video/Recording;

    move-result-object v3

    return-object v3

    .line 760
    :cond_5
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v6, "A recording is already in progress. Previous recordings must be stopped before a new recording can be started."

    invoke-direct {v3, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 757
    .end local v4    # "recordingId":J
    :catchall_0
    move-exception v4

    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v4

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method stop(Landroidx/camera/video/Recording;ILjava/lang/Throwable;)V
    .locals 12
    .param p1, "activeRecording"    # Landroidx/camera/video/Recording;
    .param p2, "error"    # I
    .param p3, "errorCause"    # Ljava/lang/Throwable;

    .line 867
    const/4 v1, 0x0

    .line 868
    .local v1, "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    iget-object v2, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 869
    :try_start_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v0}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v0, :cond_0

    :try_start_1
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v0}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 874
    const-string/jumbo v0, "Recorder"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "stop() called on a recording that is no longer active: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 876
    invoke-virtual {p1}, Landroidx/camera/video/Recording;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 874
    invoke-static {v0, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 877
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    .line 918
    :catchall_0
    move-exception v0

    move v10, p2

    move-object v11, p3

    goto/16 :goto_1

    .line 879
    :cond_0
    :try_start_2
    sget-object v0, Landroidx/camera/video/Recorder$8;->$SwitchMap$androidx$camera$video$Recorder$State:[I

    iget-object v3, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v3}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v3

    aget v0, v0, v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    move v10, p2

    move-object v11, p3

    .end local p2    # "error":I
    .end local p3    # "errorCause":Ljava/lang/Throwable;
    .local v10, "error":I
    .local v11, "errorCause":Ljava/lang/Throwable;
    goto :goto_0

    .line 902
    .end local v10    # "error":I
    .end local v11    # "errorCause":Ljava/lang/Throwable;
    .restart local p2    # "error":I
    .restart local p3    # "errorCause":Ljava/lang/Throwable;
    :pswitch_1
    :try_start_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v3, "Calling stop() while idling or initializing is invalid."

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v1    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local p1    # "activeRecording":Landroidx/camera/video/Recording;
    .end local p2    # "error":I
    .end local p3    # "errorCause":Ljava/lang/Throwable;
    throw v0

    .line 896
    .restart local v1    # "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    .restart local p1    # "activeRecording":Landroidx/camera/video/Recording;
    .restart local p2    # "error":I
    .restart local p3    # "errorCause":Ljava/lang/Throwable;
    :pswitch_2
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v0}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v0

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 898
    move v10, p2

    move-object v11, p3

    goto :goto_0

    .line 884
    :pswitch_3
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    invoke-static {p1, v0}, Landroidx/camera/video/Recorder;->isSameRecording(Landroidx/camera/video/Recording;Landroidx/camera/video/Recorder$RecordingRecord;)Z

    move-result v0

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 886
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    move-object v1, v0

    .line 887
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 888
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->restoreNonPendingState()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 889
    move v10, p2

    move-object v11, p3

    goto :goto_0

    .line 907
    :pswitch_4
    :try_start_4
    sget-object v0, Landroidx/camera/video/Recorder$State;->STOPPING:Landroidx/camera/video/Recorder$State;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder;->setState(Landroidx/camera/video/Recorder$State;)V

    .line 908
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Ljava/util/concurrent/TimeUnit;->toMicros(J)J

    move-result-wide v3

    move-wide v8, v3

    .line 909
    .local v8, "explicitlyStopTimeUs":J
    iget-object v7, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 910
    .local v7, "finalActiveRecordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mSequentialExecutor:Ljava/util/concurrent/Executor;

    new-instance v5, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda9;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-object v6, p0

    move v10, p2

    move-object v11, p3

    .end local p2    # "error":I
    .end local p3    # "errorCause":Ljava/lang/Throwable;
    .restart local v10    # "error":I
    .restart local v11    # "errorCause":Ljava/lang/Throwable;
    :try_start_5
    invoke-direct/range {v5 .. v11}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda9;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/Recorder$RecordingRecord;JILjava/lang/Throwable;)V

    invoke-interface {v0, v5}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 912
    nop

    .line 918
    .end local v7    # "finalActiveRecordingRecord":Landroidx/camera/video/Recorder$RecordingRecord;
    .end local v8    # "explicitlyStopTimeUs":J
    :goto_0
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 920
    if-eqz v1, :cond_2

    .line 921
    const/16 p2, 0xa

    if-ne v10, p2, :cond_1

    .line 922
    const-string/jumbo p2, "Recorder"

    const-string/jumbo p3, "Recording was stopped due to recording being garbage collected before any valid data has been produced."

    invoke-static {p2, p3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 925
    :cond_1
    new-instance p2, Ljava/lang/RuntimeException;

    const-string/jumbo p3, "Recording was stopped before any data could be produced."

    invoke-direct {p2, p3, v11}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/16 p3, 0x8

    invoke-direct {p0, v1, p3, p2}, Landroidx/camera/video/Recorder;->finalizePendingRecording(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 929
    :cond_2
    return-void

    .line 918
    .end local v10    # "error":I
    .end local v11    # "errorCause":Ljava/lang/Throwable;
    .restart local p2    # "error":I
    .restart local p3    # "errorCause":Ljava/lang/Throwable;
    :catchall_1
    move-exception v0

    move v10, p2

    move-object v11, p3

    .end local p2    # "error":I
    .end local p3    # "errorCause":Ljava/lang/Throwable;
    .restart local v10    # "error":I
    .restart local v11    # "errorCause":Ljava/lang/Throwable;
    :goto_1
    :try_start_6
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method stopInternal(Landroidx/camera/video/Recorder$RecordingRecord;JILjava/lang/Throwable;)V
    .locals 6
    .param p1, "recordingToStop"    # Landroidx/camera/video/Recorder$RecordingRecord;
    .param p2, "explicitlyStopTime"    # J
    .param p4, "stopError"    # I
    .param p5, "errorCause"    # Ljava/lang/Throwable;

    .line 2023
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-ne v0, p1, :cond_3

    iget-boolean v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecordingStopping:Z

    if-nez v0, :cond_3

    .line 2024
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecordingStopping:Z

    .line 2025
    iput p4, p0, Landroidx/camera/video/Recorder;->mRecordingStopError:I

    .line 2026
    iput-object p5, p0, Landroidx/camera/video/Recorder;->mRecordingStopErrorCause:Ljava/lang/Throwable;

    .line 2027
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->isAudioEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2028
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->clearPendingAudioRingBuffer()V

    .line 2029
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mAudioEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v0, p2, p3}, Landroidx/camera/video/internal/encoder/Encoder;->stop(J)V

    .line 2031
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

    if-eqz v0, :cond_1

    .line 2032
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/EncodedData;->close()V

    .line 2033
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/video/Recorder;->mPendingFirstVideoData:Landroidx/camera/video/internal/encoder/EncodedData;

    .line 2036
    :cond_1
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

    sget-object v1, Landroidx/camera/video/VideoOutput$SourceState;->ACTIVE_NON_STREAMING:Landroidx/camera/video/VideoOutput$SourceState;

    if-eq v0, v1, :cond_2

    .line 2044
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    .line 2045
    .local v0, "finalVideoEncoder":Landroidx/camera/video/internal/encoder/Encoder;
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    new-instance v2, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda8;

    invoke-direct {v2, p0, v0}, Landroidx/camera/video/Recorder$$ExternalSyntheticLambda8;-><init>(Landroidx/camera/video/Recorder;Landroidx/camera/video/internal/encoder/Encoder;)V

    const-wide/16 v3, 0x3e8

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v2, v3, v4, v5}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/video/Recorder;->mSourceNonStreamingTimeout:Ljava/util/concurrent/ScheduledFuture;

    .line 2059
    .end local v0    # "finalVideoEncoder":Landroidx/camera/video/internal/encoder/Encoder;
    goto :goto_0

    .line 2061
    :cond_2
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-static {v0}, Landroidx/camera/video/Recorder;->notifyEncoderSourceStopped(Landroidx/camera/video/internal/encoder/Encoder;)V

    .line 2068
    :goto_0
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    invoke-interface {v0, p2, p3}, Landroidx/camera/video/internal/encoder/Encoder;->stop(J)V

    .line 2070
    :cond_3
    return-void
.end method

.method tryServicePendingRecording()V
    .locals 8

    .line 2460
    const/4 v0, 0x0

    .line 2461
    .local v0, "startRecordingPaused":Z
    const/4 v1, 0x0

    .line 2462
    .local v1, "recordingToStart":Landroidx/camera/video/Recorder$RecordingRecord;
    const/4 v2, 0x0

    .line 2463
    .local v2, "pendingRecordingToFinalize":Landroidx/camera/video/Recorder$RecordingRecord;
    const/4 v3, 0x0

    .line 2464
    .local v3, "error":I
    const/4 v4, 0x0

    .line 2465
    .local v4, "errorCause":Ljava/lang/Throwable;
    iget-object v5, p0, Landroidx/camera/video/Recorder;->mLock:Ljava/lang/Object;

    monitor-enter v5

    .line 2466
    :try_start_0
    sget-object v6, Landroidx/camera/video/Recorder$8;->$SwitchMap$androidx$camera$video$Recorder$State:[I

    iget-object v7, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-virtual {v7}, Landroidx/camera/video/Recorder$State;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    goto :goto_0

    .line 2468
    :pswitch_0
    const/4 v0, 0x1

    .line 2471
    :pswitch_1
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mActiveRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    if-nez v6, :cond_2

    iget-boolean v6, p0, Landroidx/camera/video/Recorder;->mNeedsResetBeforeNextStart:Z

    if-eqz v6, :cond_0

    .line 2475
    goto :goto_0

    .line 2477
    :cond_0
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

    sget-object v7, Landroidx/camera/video/VideoOutput$SourceState;->INACTIVE:Landroidx/camera/video/VideoOutput$SourceState;

    if-ne v6, v7, :cond_1

    .line 2478
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    move-object v2, v6

    .line 2479
    const/4 v6, 0x0

    iput-object v6, p0, Landroidx/camera/video/Recorder;->mPendingRecordingRecord:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2480
    invoke-direct {p0}, Landroidx/camera/video/Recorder;->restoreNonPendingState()V

    .line 2481
    const/4 v3, 0x4

    .line 2482
    sget-object v6, Landroidx/camera/video/Recorder;->PENDING_RECORDING_ERROR_CAUSE_SOURCE_INACTIVE:Ljava/lang/Exception;

    move-object v4, v6

    .end local v4    # "errorCause":Ljava/lang/Throwable;
    .local v6, "errorCause":Ljava/lang/Throwable;
    goto :goto_0

    .line 2483
    .end local v6    # "errorCause":Ljava/lang/Throwable;
    .restart local v4    # "errorCause":Ljava/lang/Throwable;
    :cond_1
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mVideoEncoder:Landroidx/camera/video/internal/encoder/Encoder;

    if-eqz v6, :cond_2

    .line 2486
    iget-object v6, p0, Landroidx/camera/video/Recorder;->mState:Landroidx/camera/video/Recorder$State;

    invoke-direct {p0, v6}, Landroidx/camera/video/Recorder;->makePendingRecordingActiveLocked(Landroidx/camera/video/Recorder$State;)Landroidx/camera/video/Recorder$RecordingRecord;

    move-result-object v6

    move-object v1, v6

    .line 2504
    :cond_2
    :goto_0
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2506
    if-eqz v1, :cond_3

    .line 2508
    invoke-direct {p0, v1, v0}, Landroidx/camera/video/Recorder;->startRecording(Landroidx/camera/video/Recorder$RecordingRecord;Z)V

    goto :goto_1

    .line 2509
    :cond_3
    if-eqz v2, :cond_4

    .line 2510
    invoke-direct {p0, v2, v3, v4}, Landroidx/camera/video/Recorder;->finalizePendingRecording(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 2512
    :cond_4
    :goto_1
    return-void

    .line 2504
    :catchall_0
    move-exception v6

    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v6

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method updateInProgressStatusEvent()V
    .locals 3

    .line 2573
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    if-eqz v0, :cond_0

    .line 2574
    iget-object v0, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    iget-object v1, p0, Landroidx/camera/video/Recorder;->mInProgressRecording:Landroidx/camera/video/Recorder$RecordingRecord;

    .line 2576
    invoke-virtual {v1}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v1

    .line 2577
    invoke-virtual {p0}, Landroidx/camera/video/Recorder;->getInProgressRecordingStats()Landroidx/camera/video/RecordingStats;

    move-result-object v2

    .line 2575
    invoke-static {v1, v2}, Landroidx/camera/video/VideoRecordEvent;->status(Landroidx/camera/video/OutputOptions;Landroidx/camera/video/RecordingStats;)Landroidx/camera/video/VideoRecordEvent$Status;

    move-result-object v1

    .line 2574
    invoke-virtual {v0, v1}, Landroidx/camera/video/Recorder$RecordingRecord;->updateVideoRecordEvent(Landroidx/camera/video/VideoRecordEvent;)V

    .line 2579
    :cond_0
    return-void
.end method

.method writeAudioData(Landroidx/camera/video/internal/encoder/EncodedData;Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 19
    .param p1, "encodedData"    # Landroidx/camera/video/internal/encoder/EncodedData;
    .param p2, "recording"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1931
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    iget-wide v2, v0, Landroidx/camera/video/Recorder;->mRecordingBytes:J

    invoke-interface/range {p1 .. p1}, Landroidx/camera/video/internal/encoder/EncodedData;->size()J

    move-result-wide v4

    add-long/2addr v2, v4

    .line 1932
    .local v2, "newRecordingBytes":J
    iget-wide v4, v0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    const/4 v5, 0x0

    const-string/jumbo v8, "Recorder"

    if-eqz v4, :cond_0

    iget-wide v9, v0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    cmp-long v4, v2, v9

    if-lez v4, :cond_0

    .line 1934
    nop

    .line 1936
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iget-wide v6, v0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    .line 1937
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    filled-new-array {v4, v6}, [Ljava/lang/Object;

    move-result-object v4

    .line 1935
    const-string/jumbo v6, "Reach file size limit %d > %d"

    invoke-static {v6, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 1934
    invoke-static {v8, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1938
    const/4 v4, 0x2

    invoke-virtual {v0, v1, v4, v5}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 1939
    return-void

    .line 1942
    :cond_0
    const-wide/16 v9, 0x0

    .line 1943
    .local v9, "newRecordingDurationNs":J
    invoke-interface/range {p1 .. p1}, Landroidx/camera/video/internal/encoder/EncodedData;->getPresentationTimeUs()J

    move-result-wide v11

    .line 1944
    .local v11, "currentPresentationTimeUs":J
    iget-wide v13, v0, Landroidx/camera/video/Recorder;->mFirstRecordingAudioDataTimeUs:J

    const-wide v15, 0x7fffffffffffffffL

    cmp-long v4, v13, v15

    if-nez v4, :cond_1

    .line 1945
    iput-wide v11, v0, Landroidx/camera/video/Recorder;->mFirstRecordingAudioDataTimeUs:J

    .line 1946
    iget-wide v4, v0, Landroidx/camera/video/Recorder;->mFirstRecordingAudioDataTimeUs:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iget-wide v5, v0, Landroidx/camera/video/Recorder;->mFirstRecordingAudioDataTimeUs:J

    .line 1947
    invoke-static {v5, v6}, Landroidx/camera/video/internal/DebugUtils;->readableUs(J)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v4, v5}, [Ljava/lang/Object;

    move-result-object v4

    .line 1946
    const-string v5, "First audio time: %d (%s)"

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v8, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 1949
    :cond_1
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide v13, v0, Landroidx/camera/video/Recorder;->mFirstRecordingVideoDataTimeUs:J

    move-wide/from16 v17, v6

    iget-wide v6, v0, Landroidx/camera/video/Recorder;->mFirstRecordingAudioDataTimeUs:J

    .line 1950
    invoke-static {v13, v14, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    sub-long v6, v11, v6

    .line 1949
    invoke-virtual {v4, v6, v7}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v9

    .line 1952
    iget-wide v6, v0, Landroidx/camera/video/Recorder;->mPreviousRecordingAudioDataTimeUs:J

    cmp-long v4, v6, v15

    if-eqz v4, :cond_2

    const/4 v4, 0x1

    goto :goto_0

    :cond_2
    const/4 v4, 0x0

    :goto_0
    const-string/jumbo v6, "There should be a previous data for adjusting the duration."

    invoke-static {v4, v6}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 1959
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide v6, v0, Landroidx/camera/video/Recorder;->mPreviousRecordingAudioDataTimeUs:J

    sub-long v6, v11, v6

    invoke-virtual {v4, v6, v7}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v6

    add-long/2addr v6, v9

    .line 1961
    .local v6, "adjustedDurationNs":J
    iget-wide v13, v0, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    cmp-long v4, v13, v17

    if-eqz v4, :cond_3

    iget-wide v13, v0, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    cmp-long v4, v6, v13

    if-lez v4, :cond_3

    .line 1963
    nop

    .line 1964
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iget-wide v13, v0, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    filled-new-array {v4, v13}, [Ljava/lang/Object;

    move-result-object v4

    .line 1963
    const-string v13, "Audio data reaches duration limit %d > %d"

    invoke-static {v13, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v8, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1965
    const/16 v4, 0x9

    invoke-virtual {v0, v1, v4, v5}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 1966
    return-void

    .line 1970
    .end local v6    # "adjustedDurationNs":J
    :cond_3
    :goto_1
    iget-object v4, v0, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    iget-object v5, v0, Landroidx/camera/video/Recorder;->mAudioTrackIndex:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 1971
    invoke-interface/range {p1 .. p1}, Landroidx/camera/video/internal/encoder/EncodedData;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 1972
    invoke-interface/range {p1 .. p1}, Landroidx/camera/video/internal/encoder/EncodedData;->getBufferInfo()Landroid/media/MediaCodec$BufferInfo;

    move-result-object v7

    .line 1970
    invoke-virtual {v4, v5, v6, v7}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 1974
    iput-wide v2, v0, Landroidx/camera/video/Recorder;->mRecordingBytes:J

    .line 1975
    iput-wide v11, v0, Landroidx/camera/video/Recorder;->mPreviousRecordingAudioDataTimeUs:J

    .line 1976
    return-void
.end method

.method writeVideoData(Landroidx/camera/video/internal/encoder/EncodedData;Landroidx/camera/video/Recorder$RecordingRecord;)V
    .locals 19
    .param p1, "encodedData"    # Landroidx/camera/video/internal/encoder/EncodedData;
    .param p2, "recording"    # Landroidx/camera/video/Recorder$RecordingRecord;

    .line 1871
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    iget-object v2, v0, Landroidx/camera/video/Recorder;->mVideoTrackIndex:Ljava/lang/Integer;

    if-eqz v2, :cond_4

    .line 1877
    iget-wide v2, v0, Landroidx/camera/video/Recorder;->mRecordingBytes:J

    invoke-interface/range {p1 .. p1}, Landroidx/camera/video/internal/encoder/EncodedData;->size()J

    move-result-wide v4

    add-long/2addr v2, v4

    .line 1878
    .local v2, "newRecordingBytes":J
    iget-wide v4, v0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    const/4 v5, 0x0

    const-string/jumbo v8, "Recorder"

    if-eqz v4, :cond_0

    iget-wide v9, v0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    cmp-long v4, v2, v9

    if-lez v4, :cond_0

    .line 1880
    nop

    .line 1881
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iget-wide v6, v0, Landroidx/camera/video/Recorder;->mFileSizeLimitInBytes:J

    .line 1882
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    filled-new-array {v4, v6}, [Ljava/lang/Object;

    move-result-object v4

    .line 1881
    const-string/jumbo v6, "Reach file size limit %d > %d"

    invoke-static {v6, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 1880
    invoke-static {v8, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1883
    const/4 v4, 0x2

    invoke-virtual {v0, v1, v4, v5}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 1884
    return-void

    .line 1887
    :cond_0
    const-wide/16 v9, 0x0

    .line 1888
    .local v9, "newRecordingDurationNs":J
    invoke-interface/range {p1 .. p1}, Landroidx/camera/video/internal/encoder/EncodedData;->getPresentationTimeUs()J

    move-result-wide v11

    .line 1890
    .local v11, "currentPresentationTimeUs":J
    iget-wide v13, v0, Landroidx/camera/video/Recorder;->mFirstRecordingVideoDataTimeUs:J

    const-wide v15, 0x7fffffffffffffffL

    cmp-long v4, v13, v15

    if-nez v4, :cond_1

    .line 1891
    iput-wide v11, v0, Landroidx/camera/video/Recorder;->mFirstRecordingVideoDataTimeUs:J

    .line 1892
    iget-wide v4, v0, Landroidx/camera/video/Recorder;->mFirstRecordingVideoDataTimeUs:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iget-wide v5, v0, Landroidx/camera/video/Recorder;->mFirstRecordingVideoDataTimeUs:J

    .line 1893
    invoke-static {v5, v6}, Landroidx/camera/video/internal/DebugUtils;->readableUs(J)Ljava/lang/String;

    move-result-object v5

    filled-new-array {v4, v5}, [Ljava/lang/Object;

    move-result-object v4

    .line 1892
    const-string v5, "First video time: %d (%s)"

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v8, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 1895
    :cond_1
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide v13, v0, Landroidx/camera/video/Recorder;->mFirstRecordingVideoDataTimeUs:J

    move-wide/from16 v17, v6

    iget-wide v6, v0, Landroidx/camera/video/Recorder;->mFirstRecordingAudioDataTimeUs:J

    .line 1896
    invoke-static {v13, v14, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    sub-long v6, v11, v6

    .line 1895
    invoke-virtual {v4, v6, v7}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v9

    .line 1898
    iget-wide v6, v0, Landroidx/camera/video/Recorder;->mPreviousRecordingVideoDataTimeUs:J

    cmp-long v4, v6, v15

    if-eqz v4, :cond_2

    const/4 v4, 0x1

    goto :goto_0

    :cond_2
    const/4 v4, 0x0

    :goto_0
    const-string/jumbo v6, "There should be a previous data for adjusting the duration."

    invoke-static {v4, v6}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 1905
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide v6, v0, Landroidx/camera/video/Recorder;->mPreviousRecordingVideoDataTimeUs:J

    sub-long v6, v11, v6

    invoke-virtual {v4, v6, v7}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v6

    add-long/2addr v6, v9

    .line 1907
    .local v6, "adjustedDurationNs":J
    iget-wide v13, v0, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    cmp-long v4, v13, v17

    if-eqz v4, :cond_3

    iget-wide v13, v0, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    cmp-long v4, v6, v13

    if-lez v4, :cond_3

    .line 1909
    nop

    .line 1910
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iget-wide v13, v0, Landroidx/camera/video/Recorder;->mDurationLimitNs:J

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    filled-new-array {v4, v13}, [Ljava/lang/Object;

    move-result-object v4

    .line 1909
    const-string/jumbo v13, "Video data reaches duration limit %d > %d"

    invoke-static {v13, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v8, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1911
    const/16 v4, 0x9

    invoke-virtual {v0, v1, v4, v5}, Landroidx/camera/video/Recorder;->onInProgressRecordingInternalError(Landroidx/camera/video/Recorder$RecordingRecord;ILjava/lang/Throwable;)V

    .line 1912
    return-void

    .line 1916
    .end local v6    # "adjustedDurationNs":J
    :cond_3
    :goto_1
    iget-object v4, v0, Landroidx/camera/video/Recorder;->mMediaMuxer:Landroid/media/MediaMuxer;

    iget-object v5, v0, Landroidx/camera/video/Recorder;->mVideoTrackIndex:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-interface/range {p1 .. p1}, Landroidx/camera/video/internal/encoder/EncodedData;->getByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 1917
    invoke-interface/range {p1 .. p1}, Landroidx/camera/video/internal/encoder/EncodedData;->getBufferInfo()Landroid/media/MediaCodec$BufferInfo;

    move-result-object v7

    .line 1916
    invoke-virtual {v4, v5, v6, v7}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 1919
    iput-wide v2, v0, Landroidx/camera/video/Recorder;->mRecordingBytes:J

    .line 1920
    iput-wide v9, v0, Landroidx/camera/video/Recorder;->mRecordingDurationNs:J

    .line 1921
    iput-wide v11, v0, Landroidx/camera/video/Recorder;->mPreviousRecordingVideoDataTimeUs:J

    .line 1923
    invoke-virtual {v0}, Landroidx/camera/video/Recorder;->updateInProgressStatusEvent()V

    .line 1924
    return-void

    .line 1873
    .end local v2    # "newRecordingBytes":J
    .end local v9    # "newRecordingDurationNs":J
    .end local v11    # "currentPresentationTimeUs":J
    :cond_4
    new-instance v2, Ljava/lang/AssertionError;

    const-string/jumbo v3, "Video data comes before the track is added to MediaMuxer."

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
.end method
