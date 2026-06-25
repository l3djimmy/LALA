.class public final Landroidx/camera/video/internal/audio/AudioSource;
.super Ljava/lang/Object;
.source "AudioSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/internal/audio/AudioSource$InternalState;,
        Landroidx/camera/video/internal/audio/AudioSource$AudioStreamCallback;,
        Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;
    }
.end annotation


# static fields
.field static final DEFAULT_START_RETRY_INTERVAL_MS:J = 0xbb8L

.field private static final TAG:Ljava/lang/String; = "AudioSource"


# instance fields
.field private mAcquireBufferCallback:Landroidx/camera/core/impl/utils/futures/FutureCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/utils/futures/FutureCallback<",
            "Landroidx/camera/video/internal/encoder/InputBuffer;",
            ">;"
        }
    .end annotation
.end field

.field mAmplitudeTimestamp:J

.field mAudioAmplitude:D

.field private final mAudioFormat:I

.field mAudioSourceCallback:Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;

.field final mAudioStream:Landroidx/camera/video/internal/audio/AudioStream;

.field mAudioStreamSilenced:Z

.field mBufferProvider:Landroidx/camera/video/internal/BufferProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/video/internal/BufferProvider<",
            "+",
            "Landroidx/camera/video/internal/encoder/InputBuffer;",
            ">;"
        }
    .end annotation
.end field

.field mBufferProviderState:Landroidx/camera/video/internal/BufferProvider$State;

.field mCallbackExecutor:Ljava/util/concurrent/Executor;

.field final mExecutor:Ljava/util/concurrent/Executor;

.field mInSilentStartState:Z

.field mIsSendingAudio:Z

.field private mLatestFailedStartTimeNs:J

.field mMuted:Z

.field final mNotifiedSilenceState:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field final mNotifiedSuspendState:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final mSilentAudioStream:Landroidx/camera/video/internal/audio/SilentAudioStream;

.field private final mStartRetryIntervalNs:J

.field mState:Landroidx/camera/video/internal/audio/AudioSource$InternalState;

.field private mStateObserver:Landroidx/camera/core/impl/Observable$Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Observable$Observer<",
            "Landroidx/camera/video/internal/BufferProvider$State;",
            ">;"
        }
    .end annotation
.end field

.field private mZeroBytes:[B


# direct methods
.method public constructor <init>(Landroidx/camera/video/internal/audio/AudioSettings;Ljava/util/concurrent/Executor;Landroid/content/Context;)V
    .locals 7
    .param p1, "settings"    # Landroidx/camera/video/internal/audio/AudioSettings;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "attributionContext"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/audio/AudioSourceAccessException;
        }
    .end annotation

    .line 177
    new-instance v4, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda12;

    invoke-direct {v4}, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda12;-><init>()V

    const-wide/16 v5, 0xbb8

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    .end local p1    # "settings":Landroidx/camera/video/internal/audio/AudioSettings;
    .end local p2    # "executor":Ljava/util/concurrent/Executor;
    .end local p3    # "attributionContext":Landroid/content/Context;
    .local v1, "settings":Landroidx/camera/video/internal/audio/AudioSettings;
    .local v2, "executor":Ljava/util/concurrent/Executor;
    .local v3, "attributionContext":Landroid/content/Context;
    invoke-direct/range {v0 .. v6}, Landroidx/camera/video/internal/audio/AudioSource;-><init>(Landroidx/camera/video/internal/audio/AudioSettings;Ljava/util/concurrent/Executor;Landroid/content/Context;Landroidx/camera/video/internal/audio/AudioStreamFactory;J)V

    .line 179
    return-void
.end method

.method constructor <init>(Landroidx/camera/video/internal/audio/AudioSettings;Ljava/util/concurrent/Executor;Landroid/content/Context;Landroidx/camera/video/internal/audio/AudioStreamFactory;J)V
    .locals 3
    .param p1, "settings"    # Landroidx/camera/video/internal/audio/AudioSettings;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "attributionContext"    # Landroid/content/Context;
    .param p4, "audioStreamFactory"    # Landroidx/camera/video/internal/audio/AudioStreamFactory;
    .param p5, "startRetryIntervalMs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/audio/AudioSourceAccessException;
        }
    .end annotation

    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mNotifiedSilenceState:Ljava/util/concurrent/atomic/AtomicReference;

    .line 102
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mNotifiedSuspendState:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 112
    sget-object v0, Landroidx/camera/video/internal/audio/AudioSource$InternalState;->CONFIGURED:Landroidx/camera/video/internal/audio/AudioSource$InternalState;

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mState:Landroidx/camera/video/internal/audio/AudioSource$InternalState;

    .line 116
    sget-object v0, Landroidx/camera/video/internal/BufferProvider$State;->INACTIVE:Landroidx/camera/video/internal/BufferProvider$State;

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mBufferProviderState:Landroidx/camera/video/internal/BufferProvider$State;

    .line 147
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAmplitudeTimestamp:J

    .line 186
    invoke-static {p2}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->newSequentialExecutor(Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Executor;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mExecutor:Ljava/util/concurrent/Executor;

    .line 187
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p5, p6}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mStartRetryIntervalNs:J

    .line 189
    :try_start_0
    new-instance v0, Landroidx/camera/video/internal/audio/BufferedAudioStream;

    invoke-interface {p4, p1, p3}, Landroidx/camera/video/internal/audio/AudioStreamFactory;->create(Landroidx/camera/video/internal/audio/AudioSettings;Landroid/content/Context;)Landroidx/camera/video/internal/audio/AudioStream;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroidx/camera/video/internal/audio/BufferedAudioStream;-><init>(Landroidx/camera/video/internal/audio/AudioStream;Landroidx/camera/video/internal/audio/AudioSettings;)V

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAudioStream:Landroidx/camera/video/internal/audio/AudioStream;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroidx/camera/video/internal/audio/AudioStream$AudioStreamException; {:try_start_0 .. :try_end_0} :catch_0

    .line 193
    nop

    .line 194
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAudioStream:Landroidx/camera/video/internal/audio/AudioStream;

    new-instance v1, Landroidx/camera/video/internal/audio/AudioSource$AudioStreamCallback;

    invoke-direct {v1, p0}, Landroidx/camera/video/internal/audio/AudioSource$AudioStreamCallback;-><init>(Landroidx/camera/video/internal/audio/AudioSource;)V

    iget-object v2, p0, Landroidx/camera/video/internal/audio/AudioSource;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v0, v1, v2}, Landroidx/camera/video/internal/audio/AudioStream;->setCallback(Landroidx/camera/video/internal/audio/AudioStream$AudioStreamCallback;Ljava/util/concurrent/Executor;)V

    .line 195
    new-instance v0, Landroidx/camera/video/internal/audio/SilentAudioStream;

    invoke-direct {v0, p1}, Landroidx/camera/video/internal/audio/SilentAudioStream;-><init>(Landroidx/camera/video/internal/audio/AudioSettings;)V

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mSilentAudioStream:Landroidx/camera/video/internal/audio/SilentAudioStream;

    .line 196
    invoke-virtual {p1}, Landroidx/camera/video/internal/audio/AudioSettings;->getAudioFormat()I

    move-result v0

    iput v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAudioFormat:I

    .line 197
    return-void

    .line 191
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 192
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    new-instance v1, Landroidx/camera/video/internal/audio/AudioSourceAccessException;

    const-string/jumbo v2, "Unable to create AudioStream"

    invoke-direct {v1, v2, v0}, Landroidx/camera/video/internal/audio/AudioSourceAccessException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static fetchBufferProviderState(Landroidx/camera/video/internal/BufferProvider;)Landroidx/camera/video/internal/BufferProvider$State;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/internal/BufferProvider<",
            "+",
            "Landroidx/camera/video/internal/encoder/InputBuffer;",
            ">;)",
            "Landroidx/camera/video/internal/BufferProvider$State;"
        }
    .end annotation

    .line 665
    .local p0, "bufferProvider":Landroidx/camera/video/internal/BufferProvider;, "Landroidx/camera/video/internal/BufferProvider<+Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    const/4 v0, 0x0

    :try_start_0
    invoke-interface {p0}, Landroidx/camera/video/internal/BufferProvider;->fetchData()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    .line 666
    .local v1, "state":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Landroidx/camera/video/internal/BufferProvider$State;>;"
    invoke-interface {v1}, Lcom/google/common/util/concurrent/ListenableFuture;->isDone()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/video/internal/BufferProvider$State;
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v2

    :cond_0
    return-object v0

    .line 667
    .end local v1    # "state":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Landroidx/camera/video/internal/BufferProvider$State;>;"
    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    .line 668
    .local v1, "e":Ljava/lang/Exception;
    :goto_0
    return-object v0
.end method

.method private static getCurrentSystemTimeNs()J
    .locals 2

    .line 678
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    return-wide v0
.end method

.method public static isSettingsSupported(III)Z
    .locals 1
    .param p0, "sampleRate"    # I
    .param p1, "channelCount"    # I
    .param p2, "audioFormat"    # I

    .line 674
    invoke-static {p0, p1, p2}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->isSettingsSupported(III)Z

    move-result v0

    return v0
.end method

.method static synthetic lambda$notifyError$8(Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;Ljava/lang/Throwable;)V
    .locals 0
    .param p0, "callback"    # Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .line 536
    invoke-interface {p0, p1}, Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;->onError(Ljava/lang/Throwable;)V

    return-void
.end method

.method static synthetic lambda$notifySilenced$9(Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;Z)V
    .locals 0
    .param p0, "callback"    # Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;
    .param p1, "isSilenced"    # Z

    .line 547
    invoke-interface {p0, p1}, Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;->onSilenceStateChanged(Z)V

    return-void
.end method

.method static synthetic lambda$notifySuspended$10(Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;Z)V
    .locals 0
    .param p0, "callback"    # Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;
    .param p1, "isSuspended"    # Z

    .line 558
    invoke-interface {p0, p1}, Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;->onSuspendStateChanged(Z)V

    return-void
.end method

.method private resetBufferProvider(Landroidx/camera/video/internal/BufferProvider;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/internal/BufferProvider<",
            "+",
            "Landroidx/camera/video/internal/encoder/InputBuffer;",
            ">;)V"
        }
    .end annotation

    .line 404
    .local p1, "bufferProvider":Landroidx/camera/video/internal/BufferProvider;, "Landroidx/camera/video/internal/BufferProvider<+Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mBufferProvider:Landroidx/camera/video/internal/BufferProvider;

    if-eqz v0, :cond_0

    .line 405
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mBufferProvider:Landroidx/camera/video/internal/BufferProvider;

    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mStateObserver:Landroidx/camera/core/impl/Observable$Observer;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/Observable$Observer;

    invoke-interface {v0, v1}, Landroidx/camera/video/internal/BufferProvider;->removeObserver(Landroidx/camera/core/impl/Observable$Observer;)V

    .line 406
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mBufferProvider:Landroidx/camera/video/internal/BufferProvider;

    .line 407
    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mStateObserver:Landroidx/camera/core/impl/Observable$Observer;

    .line 408
    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAcquireBufferCallback:Landroidx/camera/core/impl/utils/futures/FutureCallback;

    .line 409
    sget-object v0, Landroidx/camera/video/internal/BufferProvider$State;->INACTIVE:Landroidx/camera/video/internal/BufferProvider$State;

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mBufferProviderState:Landroidx/camera/video/internal/BufferProvider$State;

    .line 410
    invoke-virtual {p0}, Landroidx/camera/video/internal/audio/AudioSource;->updateSendingAudio()V

    .line 412
    :cond_0
    if-eqz p1, :cond_2

    .line 413
    iput-object p1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mBufferProvider:Landroidx/camera/video/internal/BufferProvider;

    .line 414
    new-instance v0, Landroidx/camera/video/internal/audio/AudioSource$1;

    invoke-direct {v0, p0, p1}, Landroidx/camera/video/internal/audio/AudioSource$1;-><init>(Landroidx/camera/video/internal/audio/AudioSource;Landroidx/camera/video/internal/BufferProvider;)V

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mStateObserver:Landroidx/camera/core/impl/Observable$Observer;

    .line 438
    new-instance v0, Landroidx/camera/video/internal/audio/AudioSource$2;

    invoke-direct {v0, p0, p1}, Landroidx/camera/video/internal/audio/AudioSource$2;-><init>(Landroidx/camera/video/internal/audio/AudioSource;Landroidx/camera/video/internal/BufferProvider;)V

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAcquireBufferCallback:Landroidx/camera/core/impl/utils/futures/FutureCallback;

    .line 495
    invoke-static {p1}, Landroidx/camera/video/internal/audio/AudioSource;->fetchBufferProviderState(Landroidx/camera/video/internal/BufferProvider;)Landroidx/camera/video/internal/BufferProvider$State;

    move-result-object v0

    .line 496
    .local v0, "state":Landroidx/camera/video/internal/BufferProvider$State;
    if-eqz v0, :cond_1

    .line 497
    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mBufferProviderState:Landroidx/camera/video/internal/BufferProvider$State;

    .line 498
    invoke-virtual {p0}, Landroidx/camera/video/internal/audio/AudioSource;->updateSendingAudio()V

    .line 500
    :cond_1
    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mBufferProvider:Landroidx/camera/video/internal/BufferProvider;

    iget-object v2, p0, Landroidx/camera/video/internal/audio/AudioSource;->mExecutor:Ljava/util/concurrent/Executor;

    iget-object v3, p0, Landroidx/camera/video/internal/audio/AudioSource;->mStateObserver:Landroidx/camera/core/impl/Observable$Observer;

    invoke-interface {v1, v2, v3}, Landroidx/camera/video/internal/BufferProvider;->addObserver(Ljava/util/concurrent/Executor;Landroidx/camera/core/impl/Observable$Observer;)V

    .line 502
    .end local v0    # "state":Landroidx/camera/video/internal/BufferProvider$State;
    :cond_2
    return-void
.end method

.method private startSendingAudio()V
    .locals 5

    .line 591
    const-string v0, "AudioSource"

    iget-boolean v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mIsSendingAudio:Z

    if-eqz v1, :cond_0

    .line 593
    return-void

    .line 596
    :cond_0
    const/4 v1, 0x1

    :try_start_0
    const-string/jumbo v2, "startSendingAudio"

    invoke-static {v0, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 597
    iget-object v2, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAudioStream:Landroidx/camera/video/internal/audio/AudioStream;

    invoke-interface {v2}, Landroidx/camera/video/internal/audio/AudioStream;->start()V

    .line 598
    const/4 v2, 0x0

    iput-boolean v2, p0, Landroidx/camera/video/internal/audio/AudioSource;->mInSilentStartState:Z
    :try_end_0
    .catch Landroidx/camera/video/internal/audio/AudioStream$AudioStreamException; {:try_start_0 .. :try_end_0} :catch_0

    .line 605
    goto :goto_0

    .line 599
    :catch_0
    move-exception v2

    .line 600
    .local v2, "e":Landroidx/camera/video/internal/audio/AudioStream$AudioStreamException;
    const-string v3, "Failed to start AudioStream"

    invoke-static {v0, v3, v2}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 601
    iput-boolean v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mInSilentStartState:Z

    .line 602
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mSilentAudioStream:Landroidx/camera/video/internal/audio/SilentAudioStream;

    invoke-virtual {v0}, Landroidx/camera/video/internal/audio/SilentAudioStream;->start()V

    .line 603
    invoke-static {}, Landroidx/camera/video/internal/audio/AudioSource;->getCurrentSystemTimeNs()J

    move-result-wide v3

    iput-wide v3, p0, Landroidx/camera/video/internal/audio/AudioSource;->mLatestFailedStartTimeNs:J

    .line 604
    invoke-virtual {p0}, Landroidx/camera/video/internal/audio/AudioSource;->notifySilenced()V

    .line 606
    .end local v2    # "e":Landroidx/camera/video/internal/audio/AudioStream$AudioStreamException;
    :goto_0
    iput-boolean v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mIsSendingAudio:Z

    .line 607
    invoke-virtual {p0}, Landroidx/camera/video/internal/audio/AudioSource;->sendNextAudio()V

    .line 608
    return-void
.end method

.method private stopSendingAudio()V
    .locals 2

    .line 612
    iget-boolean v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mIsSendingAudio:Z

    if-nez v0, :cond_0

    .line 614
    return-void

    .line 616
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mIsSendingAudio:Z

    .line 617
    const-string v0, "AudioSource"

    const-string/jumbo v1, "stopSendingAudio"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 618
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAudioStream:Landroidx/camera/video/internal/audio/AudioStream;

    invoke-interface {v0}, Landroidx/camera/video/internal/audio/AudioStream;->stop()V

    .line 619
    return-void
.end method


# virtual methods
.method getCurrentAudioStream()Landroidx/camera/video/internal/audio/AudioStream;
    .locals 1

    .line 507
    iget-boolean v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mInSilentStartState:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mSilentAudioStream:Landroidx/camera/video/internal/audio/SilentAudioStream;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAudioStream:Landroidx/camera/video/internal/audio/AudioStream;

    :goto_0
    return-object v0
.end method

.method isStartRetryIntervalReached()Z
    .locals 7

    .line 526
    iget-wide v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mLatestFailedStartTimeNs:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-lez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 527
    invoke-static {}, Landroidx/camera/video/internal/audio/AudioSource;->getCurrentSystemTimeNs()J

    move-result-wide v3

    iget-wide v5, p0, Landroidx/camera/video/internal/audio/AudioSource;->mLatestFailedStartTimeNs:J

    sub-long/2addr v3, v5

    iget-wide v5, p0, Landroidx/camera/video/internal/audio/AudioSource;->mStartRetryIntervalNs:J

    cmp-long v0, v3, v5

    if-ltz v0, :cond_1

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    return v1
.end method

.method synthetic lambda$mute$7$androidx-camera-video-internal-audio-AudioSource(Z)V
    .locals 2
    .param p1, "muted"    # Z

    .line 383
    sget-object v0, Landroidx/camera/video/internal/audio/AudioSource$3;->$SwitchMap$androidx$camera$video$internal$audio$AudioSource$InternalState:[I

    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mState:Landroidx/camera/video/internal/audio/AudioSource$InternalState;

    invoke-virtual {v1}, Landroidx/camera/video/internal/audio/AudioSource$InternalState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 396
    :pswitch_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "AudioSource is released"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 387
    :pswitch_1
    iget-boolean v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mMuted:Z

    if-ne v0, p1, :cond_0

    .line 388
    return-void

    .line 390
    :cond_0
    iput-boolean p1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mMuted:Z

    .line 391
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mState:Landroidx/camera/video/internal/audio/AudioSource$InternalState;

    sget-object v1, Landroidx/camera/video/internal/audio/AudioSource$InternalState;->STARTED:Landroidx/camera/video/internal/audio/AudioSource$InternalState;

    if-ne v0, v1, :cond_1

    .line 392
    invoke-virtual {p0}, Landroidx/camera/video/internal/audio/AudioSource;->notifySilenced()V

    .line 398
    :cond_1
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method synthetic lambda$postMaxAmplitude$11$androidx-camera-video-internal-audio-AudioSource(Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;)V
    .locals 2
    .param p1, "callback"    # Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;

    .line 655
    iget-wide v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAudioAmplitude:D

    invoke-interface {p1, v0, v1}, Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;->onAmplitudeValue(D)V

    return-void
.end method

.method synthetic lambda$release$4$androidx-camera-video-internal-audio-AudioSource(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 2
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 331
    :try_start_0
    sget-object v0, Landroidx/camera/video/internal/audio/AudioSource$3;->$SwitchMap$androidx$camera$video$internal$audio$AudioSource$InternalState:[I

    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mState:Landroidx/camera/video/internal/audio/AudioSource$InternalState;

    invoke-virtual {v1}, Landroidx/camera/video/internal/audio/AudioSource$InternalState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 335
    :pswitch_0
    invoke-direct {p0, v1}, Landroidx/camera/video/internal/audio/AudioSource;->resetBufferProvider(Landroidx/camera/video/internal/BufferProvider;)V

    .line 336
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mSilentAudioStream:Landroidx/camera/video/internal/audio/SilentAudioStream;

    invoke-virtual {v0}, Landroidx/camera/video/internal/audio/SilentAudioStream;->release()V

    .line 337
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAudioStream:Landroidx/camera/video/internal/audio/AudioStream;

    invoke-interface {v0}, Landroidx/camera/video/internal/audio/AudioStream;->release()V

    .line 338
    invoke-direct {p0}, Landroidx/camera/video/internal/audio/AudioSource;->stopSendingAudio()V

    .line 339
    sget-object v0, Landroidx/camera/video/internal/audio/AudioSource$InternalState;->RELEASED:Landroidx/camera/video/internal/audio/AudioSource$InternalState;

    invoke-virtual {p0, v0}, Landroidx/camera/video/internal/audio/AudioSource;->setState(Landroidx/camera/video/internal/audio/AudioSource$InternalState;)V

    .line 340
    nop

    .line 345
    :goto_0
    invoke-virtual {p1, v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 348
    goto :goto_1

    .line 346
    :catchall_0
    move-exception v0

    .line 347
    .local v0, "t":Ljava/lang/Throwable;
    invoke-virtual {p1, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 349
    .end local v0    # "t":Ljava/lang/Throwable;
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method synthetic lambda$release$5$androidx-camera-video-internal-audio-AudioSource(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 2
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 329
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1}, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda5;-><init>(Landroidx/camera/video/internal/audio/AudioSource;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 351
    const-string v0, "AudioSource-release"

    return-object v0
.end method

.method synthetic lambda$setAudioSourceCallback$6$androidx-camera-video-internal-audio-AudioSource(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "callback"    # Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;

    .line 366
    sget-object v0, Landroidx/camera/video/internal/audio/AudioSource$3;->$SwitchMap$androidx$camera$video$internal$audio$AudioSource$InternalState:[I

    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mState:Landroidx/camera/video/internal/audio/AudioSource$InternalState;

    invoke-virtual {v1}, Landroidx/camera/video/internal/audio/AudioSource$InternalState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 374
    :pswitch_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "The audio recording callback must be registered before the audio source is started."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 368
    :pswitch_1
    iput-object p1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 369
    iput-object p2, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAudioSourceCallback:Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;

    .line 370
    nop

    .line 377
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method synthetic lambda$setBufferProvider$0$androidx-camera-video-internal-audio-AudioSource(Landroidx/camera/video/internal/BufferProvider;)V
    .locals 2
    .param p1, "bufferProvider"    # Landroidx/camera/video/internal/BufferProvider;

    .line 221
    sget-object v0, Landroidx/camera/video/internal/audio/AudioSource$3;->$SwitchMap$androidx$camera$video$internal$audio$AudioSource$InternalState:[I

    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mState:Landroidx/camera/video/internal/audio/AudioSource$InternalState;

    invoke-virtual {v1}, Landroidx/camera/video/internal/audio/AudioSource$InternalState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 230
    :pswitch_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "AudioSource is released"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 225
    :pswitch_1
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mBufferProvider:Landroidx/camera/video/internal/BufferProvider;

    if-eq v0, p1, :cond_0

    .line 226
    invoke-direct {p0, p1}, Landroidx/camera/video/internal/audio/AudioSource;->resetBufferProvider(Landroidx/camera/video/internal/BufferProvider;)V

    .line 232
    :cond_0
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method synthetic lambda$start$1$androidx-camera-video-internal-audio-AudioSource()V
    .locals 1

    .line 257
    iget-boolean v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mMuted:Z

    invoke-virtual {p0, v0}, Landroidx/camera/video/internal/audio/AudioSource;->start(Z)V

    return-void
.end method

.method synthetic lambda$start$2$androidx-camera-video-internal-audio-AudioSource(Z)V
    .locals 2
    .param p1, "muted"    # Z

    .line 282
    sget-object v0, Landroidx/camera/video/internal/audio/AudioSource$3;->$SwitchMap$androidx$camera$video$internal$audio$AudioSource$InternalState:[I

    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mState:Landroidx/camera/video/internal/audio/AudioSource$InternalState;

    invoke-virtual {v1}, Landroidx/camera/video/internal/audio/AudioSource$InternalState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 294
    :pswitch_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "AudioSource is released"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 292
    :pswitch_1
    goto :goto_0

    .line 284
    :pswitch_2
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mNotifiedSilenceState:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 285
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mNotifiedSuspendState:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 286
    sget-object v0, Landroidx/camera/video/internal/audio/AudioSource$InternalState;->STARTED:Landroidx/camera/video/internal/audio/AudioSource$InternalState;

    invoke-virtual {p0, v0}, Landroidx/camera/video/internal/audio/AudioSource;->setState(Landroidx/camera/video/internal/audio/AudioSource$InternalState;)V

    .line 287
    invoke-virtual {p0, p1}, Landroidx/camera/video/internal/audio/AudioSource;->mute(Z)V

    .line 288
    invoke-virtual {p0}, Landroidx/camera/video/internal/audio/AudioSource;->updateSendingAudio()V

    .line 289
    nop

    .line 296
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method synthetic lambda$stop$3$androidx-camera-video-internal-audio-AudioSource()V
    .locals 2

    .line 306
    sget-object v0, Landroidx/camera/video/internal/audio/AudioSource$3;->$SwitchMap$androidx$camera$video$internal$audio$AudioSource$InternalState:[I

    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mState:Landroidx/camera/video/internal/audio/AudioSource$InternalState;

    invoke-virtual {v1}, Landroidx/camera/video/internal/audio/AudioSource$InternalState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 315
    :pswitch_0
    const-string v0, "AudioSource"

    const-string v1, "AudioSource is released. Calling stop() is a no-op."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 308
    :pswitch_1
    sget-object v0, Landroidx/camera/video/internal/audio/AudioSource$InternalState;->CONFIGURED:Landroidx/camera/video/internal/audio/AudioSource$InternalState;

    invoke-virtual {p0, v0}, Landroidx/camera/video/internal/audio/AudioSource;->setState(Landroidx/camera/video/internal/audio/AudioSource$InternalState;)V

    .line 309
    invoke-virtual {p0}, Landroidx/camera/video/internal/audio/AudioSource;->updateSendingAudio()V

    .line 310
    goto :goto_0

    .line 313
    :pswitch_2
    nop

    .line 318
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public mute(Z)V
    .locals 2
    .param p1, "muted"    # Z

    .line 382
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/video/internal/audio/AudioSource;Z)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 399
    return-void
.end method

.method notifyError(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .line 533
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 534
    .local v0, "executor":Ljava/util/concurrent/Executor;
    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAudioSourceCallback:Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;

    .line 535
    .local v1, "callback":Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 536
    new-instance v2, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda11;

    invoke-direct {v2, v1, p1}, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda11;-><init>(Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;Ljava/lang/Throwable;)V

    invoke-interface {v0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 538
    :cond_0
    return-void
.end method

.method notifySilenced()V
    .locals 5

    .line 542
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 543
    .local v0, "executor":Ljava/util/concurrent/Executor;
    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAudioSourceCallback:Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;

    .line 544
    .local v1, "callback":Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;
    if-eqz v0, :cond_2

    if-eqz v1, :cond_2

    .line 545
    iget-boolean v2, p0, Landroidx/camera/video/internal/audio/AudioSource;->mMuted:Z

    if-nez v2, :cond_1

    iget-boolean v2, p0, Landroidx/camera/video/internal/audio/AudioSource;->mInSilentStartState:Z

    if-nez v2, :cond_1

    iget-boolean v2, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAudioStreamSilenced:Z

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v2, 0x1

    .line 546
    .local v2, "isSilenced":Z
    :goto_1
    iget-object v3, p0, Landroidx/camera/video/internal/audio/AudioSource;->mNotifiedSilenceState:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v3, v4}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 547
    new-instance v3, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda4;

    invoke-direct {v3, v1, v2}, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;Z)V

    invoke-interface {v0, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 550
    .end local v2    # "isSilenced":Z
    :cond_2
    return-void
.end method

.method notifySuspended(Z)V
    .locals 3
    .param p1, "isSuspended"    # Z

    .line 554
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 555
    .local v0, "executor":Ljava/util/concurrent/Executor;
    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAudioSourceCallback:Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;

    .line 556
    .local v1, "callback":Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 557
    iget-object v2, p0, Landroidx/camera/video/internal/audio/AudioSource;->mNotifiedSuspendState:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v2

    if-eq v2, p1, :cond_0

    .line 558
    new-instance v2, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda9;

    invoke-direct {v2, v1, p1}, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda9;-><init>(Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;Z)V

    invoke-interface {v0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 561
    :cond_0
    return-void
.end method

.method overrideBySilence(Ljava/nio/ByteBuffer;I)V
    .locals 3
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .param p2, "sizeInBytes"    # I

    .line 565
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mZeroBytes:[B

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mZeroBytes:[B

    array-length v0, v0

    if-ge v0, p2, :cond_1

    .line 566
    :cond_0
    new-array v0, p2, [B

    iput-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mZeroBytes:[B

    .line 568
    :cond_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    .line 569
    .local v0, "positionBeforePut":I
    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mZeroBytes:[B

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2, p2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 570
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/nio/Buffer;->position(I)Ljava/nio/Buffer;

    .line 571
    return-void
.end method

.method postMaxAmplitude(Ljava/nio/ByteBuffer;)V
    .locals 7
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .line 637
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 638
    .local v0, "executor":Ljava/util/concurrent/Executor;
    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAudioSourceCallback:Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;

    .line 639
    .local v1, "callback":Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;
    const-wide/16 v2, 0x0

    .line 641
    .local v2, "maxAmplitude":D
    iget v4, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAudioFormat:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_1

    .line 644
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object v4

    .line 646
    .local v4, "shortBuffer":Ljava/nio/ShortBuffer;
    :goto_0
    invoke-virtual {v4}, Ljava/nio/ShortBuffer;->hasRemaining()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 647
    invoke-virtual {v4}, Ljava/nio/ShortBuffer;->get()S

    move-result v5

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    int-to-double v5, v5

    invoke-static {v2, v3, v5, v6}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    goto :goto_0

    .line 650
    :cond_0
    const-wide v5, 0x40dfffc000000000L    # 32767.0

    div-double/2addr v2, v5

    .line 652
    iput-wide v2, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAudioAmplitude:D

    .line 654
    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    .line 655
    new-instance v5, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda8;

    invoke-direct {v5, p0, v1}, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda8;-><init>(Landroidx/camera/video/internal/audio/AudioSource;Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;)V

    invoke-interface {v0, v5}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 658
    .end local v4    # "shortBuffer":Ljava/nio/ShortBuffer;
    :cond_1
    return-void
.end method

.method public release()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 328
    new-instance v0, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/video/internal/audio/AudioSource;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method retryStartAudioStream()V
    .locals 4

    .line 512
    const-string v0, "AudioSource"

    iget-boolean v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mInSilentStartState:Z

    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkState(Z)V

    .line 514
    :try_start_0
    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAudioStream:Landroidx/camera/video/internal/audio/AudioStream;

    invoke-interface {v1}, Landroidx/camera/video/internal/audio/AudioStream;->start()V

    .line 515
    const-string/jumbo v1, "Retry start AudioStream succeed"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 516
    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mSilentAudioStream:Landroidx/camera/video/internal/audio/SilentAudioStream;

    invoke-virtual {v1}, Landroidx/camera/video/internal/audio/SilentAudioStream;->stop()V

    .line 517
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mInSilentStartState:Z
    :try_end_0
    .catch Landroidx/camera/video/internal/audio/AudioStream$AudioStreamException; {:try_start_0 .. :try_end_0} :catch_0

    .line 521
    goto :goto_0

    .line 518
    :catch_0
    move-exception v1

    .line 519
    .local v1, "e":Landroidx/camera/video/internal/audio/AudioStream$AudioStreamException;
    const-string/jumbo v2, "Retry start AudioStream failed"

    invoke-static {v0, v2, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 520
    invoke-static {}, Landroidx/camera/video/internal/audio/AudioSource;->getCurrentSystemTimeNs()J

    move-result-wide v2

    iput-wide v2, p0, Landroidx/camera/video/internal/audio/AudioSource;->mLatestFailedStartTimeNs:J

    .line 522
    .end local v1    # "e":Landroidx/camera/video/internal/audio/AudioStream$AudioStreamException;
    :goto_0
    return-void
.end method

.method sendNextAudio()V
    .locals 3

    .line 624
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mBufferProvider:Landroidx/camera/video/internal/BufferProvider;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/internal/BufferProvider;

    invoke-interface {v0}, Landroidx/camera/video/internal/BufferProvider;->acquireBuffer()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mAcquireBufferCallback:Landroidx/camera/core/impl/utils/futures/FutureCallback;

    .line 625
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/utils/futures/FutureCallback;

    iget-object v2, p0, Landroidx/camera/video/internal/audio/AudioSource;->mExecutor:Ljava/util/concurrent/Executor;

    .line 624
    invoke-static {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 627
    return-void
.end method

.method public setAudioSourceCallback(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "callback"    # Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;

    .line 365
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0, p1, p2}, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda7;-><init>(Landroidx/camera/video/internal/audio/AudioSource;Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/audio/AudioSource$AudioSourceCallback;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 378
    return-void
.end method

.method public setBufferProvider(Landroidx/camera/video/internal/BufferProvider;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/internal/BufferProvider<",
            "+",
            "Landroidx/camera/video/internal/encoder/InputBuffer;",
            ">;)V"
        }
    .end annotation

    .line 220
    .local p1, "bufferProvider":Landroidx/camera/video/internal/BufferProvider;, "Landroidx/camera/video/internal/BufferProvider<+Landroidx/camera/video/internal/encoder/InputBuffer;>;"
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda10;

    invoke-direct {v1, p0, p1}, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda10;-><init>(Landroidx/camera/video/internal/audio/AudioSource;Landroidx/camera/video/internal/BufferProvider;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 233
    return-void
.end method

.method setState(Landroidx/camera/video/internal/audio/AudioSource$InternalState;)V
    .locals 2
    .param p1, "state"    # Landroidx/camera/video/internal/audio/AudioSource$InternalState;

    .line 632
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Transitioning internal state: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mState:Landroidx/camera/video/internal/audio/AudioSource$InternalState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " --> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AudioSource"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 633
    iput-object p1, p0, Landroidx/camera/video/internal/audio/AudioSource;->mState:Landroidx/camera/video/internal/audio/AudioSource$InternalState;

    .line 634
    return-void
.end method

.method public start()V
    .locals 2

    .line 257
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0}, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda6;-><init>(Landroidx/camera/video/internal/audio/AudioSource;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 258
    return-void
.end method

.method public start(Z)V
    .locals 2
    .param p1, "muted"    # Z

    .line 281
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/video/internal/audio/AudioSource;Z)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 297
    return-void
.end method

.method public stop()V
    .locals 2

    .line 305
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/video/internal/audio/AudioSource;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 319
    return-void
.end method

.method updateSendingAudio()V
    .locals 4

    .line 576
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mState:Landroidx/camera/video/internal/audio/AudioSource$InternalState;

    sget-object v1, Landroidx/camera/video/internal/audio/AudioSource$InternalState;->STARTED:Landroidx/camera/video/internal/audio/AudioSource$InternalState;

    if-ne v0, v1, :cond_3

    .line 577
    iget-object v0, p0, Landroidx/camera/video/internal/audio/AudioSource;->mBufferProviderState:Landroidx/camera/video/internal/BufferProvider$State;

    sget-object v1, Landroidx/camera/video/internal/BufferProvider$State;->ACTIVE:Landroidx/camera/video/internal/BufferProvider$State;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v3

    .line 578
    .local v0, "isBufferProviderActive":Z
    :goto_0
    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    move v2, v3

    :goto_1
    invoke-virtual {p0, v2}, Landroidx/camera/video/internal/audio/AudioSource;->notifySuspended(Z)V

    .line 579
    if-eqz v0, :cond_2

    .line 580
    invoke-direct {p0}, Landroidx/camera/video/internal/audio/AudioSource;->startSendingAudio()V

    goto :goto_2

    .line 582
    :cond_2
    invoke-direct {p0}, Landroidx/camera/video/internal/audio/AudioSource;->stopSendingAudio()V

    .line 584
    .end local v0    # "isBufferProviderActive":Z
    :goto_2
    goto :goto_3

    .line 585
    :cond_3
    invoke-direct {p0}, Landroidx/camera/video/internal/audio/AudioSource;->stopSendingAudio()V

    .line 587
    :goto_3
    return-void
.end method
