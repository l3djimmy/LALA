.class abstract Landroidx/camera/video/Recorder$RecordingRecord;
.super Ljava/lang/Object;
.source "Recorder.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/Recorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "RecordingRecord"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/Recorder$RecordingRecord$MediaMuxerSupplier;,
        Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;
    }
.end annotation


# instance fields
.field private final mAudioSourceSupplier:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;",
            ">;"
        }
    .end annotation
.end field

.field private final mCloseGuard:Landroidx/camera/core/impl/utils/CloseGuardHelper;

.field private final mInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mMediaMuxerSupplier:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Landroidx/camera/video/Recorder$RecordingRecord$MediaMuxerSupplier;",
            ">;"
        }
    .end annotation
.end field

.field private final mMuted:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mRecordingFinalizer:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Landroidx/core/util/Consumer<",
            "Landroid/net/Uri;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 3

    .line 2765
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2767
    invoke-static {}, Landroidx/camera/core/impl/utils/CloseGuardHelper;->create()Landroidx/camera/core/impl/utils/CloseGuardHelper;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mCloseGuard:Landroidx/camera/core/impl/utils/CloseGuardHelper;

    .line 2769
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2771
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mMediaMuxerSupplier:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2774
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mAudioSourceSupplier:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2777
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v2, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda5;

    invoke-direct {v2}, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda5;-><init>()V

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mRecordingFinalizer:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2782
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mMuted:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method private finalizeRecordingInternal(Landroidx/core/util/Consumer;Landroid/net/Uri;)V
    .locals 3
    .param p2, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Consumer<",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/net/Uri;",
            ")V"
        }
    .end annotation

    .line 3166
    .local p1, "finalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    if-eqz p1, :cond_0

    .line 3170
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mCloseGuard:Landroidx/camera/core/impl/utils/CloseGuardHelper;

    invoke-virtual {v0}, Landroidx/camera/core/impl/utils/CloseGuardHelper;->close()V

    .line 3171
    invoke-interface {p1, p2}, Landroidx/core/util/Consumer;->accept(Ljava/lang/Object;)V

    .line 3172
    return-void

    .line 3167
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Recording "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " has already been finalized"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method static from(Landroidx/camera/video/PendingRecording;J)Landroidx/camera/video/Recorder$RecordingRecord;
    .locals 8
    .param p0, "pendingRecording"    # Landroidx/camera/video/PendingRecording;
    .param p1, "recordingId"    # J

    .line 2786
    new-instance v0, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;

    .line 2787
    invoke-virtual {p0}, Landroidx/camera/video/PendingRecording;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v1

    .line 2788
    invoke-virtual {p0}, Landroidx/camera/video/PendingRecording;->getListenerExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 2789
    invoke-virtual {p0}, Landroidx/camera/video/PendingRecording;->getEventListener()Landroidx/core/util/Consumer;

    move-result-object v3

    .line 2790
    invoke-virtual {p0}, Landroidx/camera/video/PendingRecording;->isAudioEnabled()Z

    move-result v4

    .line 2791
    invoke-virtual {p0}, Landroidx/camera/video/PendingRecording;->isPersistent()Z

    move-result v5

    move-wide v6, p1

    .end local p1    # "recordingId":J
    .local v6, "recordingId":J
    invoke-direct/range {v0 .. v7}, Landroidx/camera/video/AutoValue_Recorder_RecordingRecord;-><init>(Landroidx/camera/video/OutputOptions;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;ZZJ)V

    .line 2786
    return-object v0
.end method

.method static synthetic lambda$initializeRecording$1(Landroidx/camera/video/OutputOptions;Landroid/os/ParcelFileDescriptor;ILandroidx/core/util/Consumer;)Landroid/media/MediaMuxer;
    .locals 7
    .param p0, "outputOptions"    # Landroidx/camera/video/OutputOptions;
    .param p1, "dupedParcelFileDescriptor"    # Landroid/os/ParcelFileDescriptor;
    .param p2, "muxerOutputFormat"    # I
    .param p3, "outputUriCreatedCallback"    # Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2840
    sget-object v0, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 2841
    .local v0, "outputUri":Landroid/net/Uri;
    instance-of v1, p0, Landroidx/camera/video/FileOutputOptions;

    if-eqz v1, :cond_1

    .line 2842
    move-object v1, p0

    check-cast v1, Landroidx/camera/video/FileOutputOptions;

    .line 2843
    .local v1, "fileOutputOptions":Landroidx/camera/video/FileOutputOptions;
    invoke-virtual {v1}, Landroidx/camera/video/FileOutputOptions;->getFile()Ljava/io/File;

    move-result-object v2

    .line 2844
    .local v2, "file":Ljava/io/File;
    invoke-static {v2}, Landroidx/camera/video/internal/utils/OutputUtil;->createParentFolder(Ljava/io/File;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2845
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to create folder for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 2846
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2845
    const-string/jumbo v4, "Recorder"

    invoke-static {v4, v3}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2848
    :cond_0
    new-instance v3, Landroid/media/MediaMuxer;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, p2}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V

    .line 2849
    .local v3, "mediaMuxer":Landroid/media/MediaMuxer;
    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 2850
    .end local v1    # "fileOutputOptions":Landroidx/camera/video/FileOutputOptions;
    .end local v2    # "file":Ljava/io/File;
    goto :goto_0

    .end local v3    # "mediaMuxer":Landroid/media/MediaMuxer;
    :cond_1
    instance-of v1, p0, Landroidx/camera/video/FileDescriptorOutputOptions;

    if-eqz v1, :cond_2

    .line 2851
    nop

    .line 2854
    nop

    .line 2855
    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    .line 2854
    invoke-static {v1, p2}, Landroidx/camera/video/internal/compat/Api26Impl;->createMediaMuxer(Ljava/io/FileDescriptor;I)Landroid/media/MediaMuxer;

    move-result-object v3

    .restart local v3    # "mediaMuxer":Landroid/media/MediaMuxer;
    goto :goto_0

    .line 2862
    .end local v3    # "mediaMuxer":Landroid/media/MediaMuxer;
    :cond_2
    instance-of v1, p0, Landroidx/camera/video/MediaStoreOutputOptions;

    if-eqz v1, :cond_5

    .line 2863
    move-object v1, p0

    check-cast v1, Landroidx/camera/video/MediaStoreOutputOptions;

    .line 2866
    .local v1, "mediaStoreOutputOptions":Landroidx/camera/video/MediaStoreOutputOptions;
    new-instance v2, Landroid/content/ContentValues;

    .line 2867
    invoke-virtual {v1}, Landroidx/camera/video/MediaStoreOutputOptions;->getContentValues()Landroid/content/ContentValues;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    .line 2868
    .local v2, "contentValues":Landroid/content/ContentValues;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1d

    if-lt v3, v4, :cond_3

    .line 2870
    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string/jumbo v4, "is_pending"

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2873
    :cond_3
    :try_start_0
    invoke-virtual {v1}, Landroidx/camera/video/MediaStoreOutputOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    .line 2874
    invoke-virtual {v1}, Landroidx/camera/video/MediaStoreOutputOptions;->getCollectionUri()Landroid/net/Uri;

    move-result-object v4

    .line 2873
    invoke-virtual {v3, v4, v2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v3

    .line 2878
    nop

    .line 2879
    if-eqz v0, :cond_4

    .line 2883
    nop

    .line 2896
    nop

    .line 2897
    invoke-virtual {v1}, Landroidx/camera/video/MediaStoreOutputOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    .line 2898
    const-string/jumbo v4, "rw"

    invoke-virtual {v3, v0, v4}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v3

    .line 2899
    .local v3, "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    nop

    .line 2900
    invoke-virtual {v3}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v4

    .line 2899
    invoke-static {v4, p2}, Landroidx/camera/video/internal/compat/Api26Impl;->createMediaMuxer(Ljava/io/FileDescriptor;I)Landroid/media/MediaMuxer;

    move-result-object v4

    .line 2902
    .local v4, "mediaMuxer":Landroid/media/MediaMuxer;
    invoke-virtual {v3}, Landroid/os/ParcelFileDescriptor;->close()V

    .line 2904
    .end local v1    # "mediaStoreOutputOptions":Landroidx/camera/video/MediaStoreOutputOptions;
    .end local v2    # "contentValues":Landroid/content/ContentValues;
    .end local v3    # "fileDescriptor":Landroid/os/ParcelFileDescriptor;
    move-object v3, v4

    .line 2909
    .end local v4    # "mediaMuxer":Landroid/media/MediaMuxer;
    .local v3, "mediaMuxer":Landroid/media/MediaMuxer;
    :goto_0
    invoke-interface {p3, v0}, Landroidx/core/util/Consumer;->accept(Ljava/lang/Object;)V

    .line 2910
    return-object v3

    .line 2880
    .end local v3    # "mediaMuxer":Landroid/media/MediaMuxer;
    .restart local v1    # "mediaStoreOutputOptions":Landroidx/camera/video/MediaStoreOutputOptions;
    .restart local v2    # "contentValues":Landroid/content/ContentValues;
    :cond_4
    new-instance v3, Ljava/io/IOException;

    const-string/jumbo v4, "Unable to create MediaStore entry."

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 2875
    :catch_0
    move-exception v3

    .line 2876
    .local v3, "e":Ljava/lang/RuntimeException;
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Unable to create MediaStore entry by "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 2905
    .end local v1    # "mediaStoreOutputOptions":Landroidx/camera/video/MediaStoreOutputOptions;
    .end local v2    # "contentValues":Landroid/content/ContentValues;
    .end local v3    # "e":Ljava/lang/RuntimeException;
    :cond_5
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid output options type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 2907
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method static synthetic lambda$initializeRecording$2(Landroidx/camera/video/MediaStoreOutputOptions;Landroid/net/Uri;)V
    .locals 3
    .param p0, "mediaStoreOutputOptions"    # Landroidx/camera/video/MediaStoreOutputOptions;
    .param p1, "outputUri"    # Landroid/net/Uri;

    .line 2959
    sget-object v0, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-virtual {p1, v0}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2960
    return-void

    .line 2962
    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 2963
    .local v0, "contentValues":Landroid/content/ContentValues;
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string/jumbo v2, "is_pending"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2964
    invoke-virtual {p0}, Landroidx/camera/video/MediaStoreOutputOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v0, v2, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2966
    return-void
.end method

.method static synthetic lambda$initializeRecording$3(Ljava/lang/String;Landroid/net/Uri;)V
    .locals 3
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "uri"    # Landroid/net/Uri;

    .line 2982
    const-string/jumbo v0, "Recorder"

    if-nez p1, :cond_0

    .line 2983
    const-string v1, "File scanning operation failed [path: %s]"

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 2986
    :cond_0
    const-string v1, "File scan completed successfully [path: %s, URI: %s]"

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2990
    :goto_0
    return-void
.end method

.method static synthetic lambda$initializeRecording$4(Landroidx/camera/video/MediaStoreOutputOptions;Landroid/content/Context;Landroid/net/Uri;)V
    .locals 4
    .param p0, "mediaStoreOutputOptions"    # Landroidx/camera/video/MediaStoreOutputOptions;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "outputUri"    # Landroid/net/Uri;

    .line 2971
    sget-object v0, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-virtual {p2, v0}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2972
    return-void

    .line 2974
    :cond_0
    nop

    .line 2975
    invoke-virtual {p0}, Landroidx/camera/video/MediaStoreOutputOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 2974
    const-string/jumbo v1, "_data"

    invoke-static {v0, p2, v1}, Landroidx/camera/video/internal/utils/OutputUtil;->getAbsolutePathFromUri(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2977
    .local v0, "filePath":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 2980
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    new-instance v2, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda4;

    invoke-direct {v2}, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda4;-><init>()V

    const/4 v3, 0x0

    invoke-static {p1, v1, v3, v2}, Landroid/media/MediaScannerConnection;->scanFile(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V

    goto :goto_0

    .line 2992
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Skipping media scanner scan. Unable to retrieve file path from URI: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "Recorder"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2996
    :goto_0
    return-void
.end method

.method static synthetic lambda$initializeRecording$5(Landroid/os/ParcelFileDescriptor;Landroid/net/Uri;)V
    .locals 3
    .param p0, "dupedParcelFileDescriptor"    # Landroid/os/ParcelFileDescriptor;
    .param p1, "ignored"    # Landroid/net/Uri;

    .line 3002
    :try_start_0
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3007
    goto :goto_0

    .line 3003
    :catch_0
    move-exception v0

    .line 3006
    .local v0, "e":Ljava/io/IOException;
    const-string/jumbo v1, "Recorder"

    const-string v2, "Failed to close dup\'d ParcelFileDescriptor"

    invoke-static {v1, v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 3008
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-void
.end method

.method static synthetic lambda$new$0(Landroid/net/Uri;)V
    .locals 0
    .param p0, "ignored"    # Landroid/net/Uri;

    .line 2780
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 3147
    sget-object v0, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-virtual {p0, v0}, Landroidx/camera/video/Recorder$RecordingRecord;->finalizeRecording(Landroid/net/Uri;)V

    .line 3148
    return-void
.end method

.method protected finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 3154
    :try_start_0
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mCloseGuard:Landroidx/camera/core/impl/utils/CloseGuardHelper;

    invoke-virtual {v0}, Landroidx/camera/core/impl/utils/CloseGuardHelper;->warnIfOpen()V

    .line 3155
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mRecordingFinalizer:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/core/util/Consumer;

    .line 3156
    .local v0, "finalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    if-eqz v0, :cond_0

    .line 3157
    sget-object v1, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-direct {p0, v0, v1}, Landroidx/camera/video/Recorder$RecordingRecord;->finalizeRecordingInternal(Landroidx/core/util/Consumer;Landroid/net/Uri;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3160
    .end local v0    # "finalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 3161
    nop

    .line 3162
    return-void

    .line 3160
    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 3161
    throw v0
.end method

.method finalizeRecording(Landroid/net/Uri;)V
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;

    .line 3119
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3120
    return-void

    .line 3122
    :cond_0
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mRecordingFinalizer:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/core/util/Consumer;

    invoke-direct {p0, v0, p1}, Landroidx/camera/video/Recorder$RecordingRecord;->finalizeRecordingInternal(Landroidx/core/util/Consumer;Landroid/net/Uri;)V

    .line 3123
    return-void
.end method

.method abstract getCallbackExecutor()Ljava/util/concurrent/Executor;
.end method

.method abstract getEventListener()Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;"
        }
    .end annotation
.end method

.method abstract getOutputOptions()Landroidx/camera/video/OutputOptions;
.end method

.method abstract getRecordingId()J
.end method

.method abstract hasAudioEnabled()Z
.end method

.method initializeRecording(Landroid/content/Context;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2819
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_7

    .line 2822
    invoke-virtual {p0}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v0

    .line 2825
    .local v0, "outputOptions":Landroidx/camera/video/OutputOptions;
    instance-of v1, v0, Landroidx/camera/video/FileDescriptorOutputOptions;

    if-eqz v1, :cond_0

    .line 2828
    move-object v1, v0

    check-cast v1, Landroidx/camera/video/FileDescriptorOutputOptions;

    .line 2830
    invoke-virtual {v1}, Landroidx/camera/video/FileDescriptorOutputOptions;->getParcelFileDescriptor()Landroid/os/ParcelFileDescriptor;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->dup()Landroid/os/ParcelFileDescriptor;

    move-result-object v1

    .local v1, "dupedParcelFileDescriptor":Landroid/os/ParcelFileDescriptor;
    goto :goto_0

    .line 2832
    .end local v1    # "dupedParcelFileDescriptor":Landroid/os/ParcelFileDescriptor;
    :cond_0
    const/4 v1, 0x0

    .line 2835
    .restart local v1    # "dupedParcelFileDescriptor":Landroid/os/ParcelFileDescriptor;
    :goto_0
    iget-object v2, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mCloseGuard:Landroidx/camera/core/impl/utils/CloseGuardHelper;

    const-string/jumbo v3, "finalizeRecording"

    invoke-virtual {v2, v3}, Landroidx/camera/core/impl/utils/CloseGuardHelper;->open(Ljava/lang/String;)V

    .line 2837
    new-instance v2, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda0;

    invoke-direct {v2, v0, v1}, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/video/OutputOptions;Landroid/os/ParcelFileDescriptor;)V

    .line 2912
    .local v2, "mediaMuxerSupplier":Landroidx/camera/video/Recorder$RecordingRecord$MediaMuxerSupplier;
    iget-object v3, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mMediaMuxerSupplier:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 2914
    const/4 v3, 0x0

    .line 2915
    .local v3, "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    invoke-virtual {p0}, Landroidx/camera/video/Recorder$RecordingRecord;->hasAudioEnabled()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 2916
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1f

    if-lt v4, v5, :cond_1

    .line 2920
    new-instance v4, Landroidx/camera/video/Recorder$RecordingRecord$1;

    invoke-direct {v4, p0, p1}, Landroidx/camera/video/Recorder$RecordingRecord$1;-><init>(Landroidx/camera/video/Recorder$RecordingRecord;Landroid/content/Context;)V

    .line 2932
    .local v4, "audioSourceSupplier":Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;
    iget-object v5, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mAudioSourceSupplier:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v4}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 2933
    .end local v4    # "audioSourceSupplier":Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;
    goto :goto_1

    .line 2937
    :cond_1
    new-instance v4, Landroidx/camera/video/Recorder$RecordingRecord$2;

    invoke-direct {v4, p0}, Landroidx/camera/video/Recorder$RecordingRecord$2;-><init>(Landroidx/camera/video/Recorder$RecordingRecord;)V

    .line 2948
    .restart local v4    # "audioSourceSupplier":Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;
    iget-object v5, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mAudioSourceSupplier:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v4}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 2952
    .end local v4    # "audioSourceSupplier":Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;
    :cond_2
    :goto_1
    instance-of v4, v0, Landroidx/camera/video/MediaStoreOutputOptions;

    if-eqz v4, :cond_4

    .line 2953
    move-object v4, v0

    check-cast v4, Landroidx/camera/video/MediaStoreOutputOptions;

    .line 2957
    .local v4, "mediaStoreOutputOptions":Landroidx/camera/video/MediaStoreOutputOptions;
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x1d

    if-lt v5, v6, :cond_3

    .line 2958
    new-instance v5, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda1;

    invoke-direct {v5, v4}, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/video/MediaStoreOutputOptions;)V

    move-object v3, v5

    .end local v3    # "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    .local v5, "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    goto :goto_2

    .line 2970
    .end local v5    # "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    .restart local v3    # "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    :cond_3
    new-instance v5, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda2;

    invoke-direct {v5, v4, p1}, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/video/MediaStoreOutputOptions;Landroid/content/Context;)V

    move-object v3, v5

    .end local v3    # "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    .restart local v5    # "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    goto :goto_2

    .line 2998
    .end local v4    # "mediaStoreOutputOptions":Landroidx/camera/video/MediaStoreOutputOptions;
    .end local v5    # "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    .restart local v3    # "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    :cond_4
    instance-of v4, v0, Landroidx/camera/video/FileDescriptorOutputOptions;

    if-eqz v4, :cond_5

    .line 2999
    new-instance v4, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda3;

    invoke-direct {v4, v1}, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda3;-><init>(Landroid/os/ParcelFileDescriptor;)V

    move-object v3, v4

    goto :goto_3

    .line 2998
    :cond_5
    :goto_2
    nop

    .line 3011
    :goto_3
    if-eqz v3, :cond_6

    .line 3012
    iget-object v4, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mRecordingFinalizer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 3014
    :cond_6
    return-void

    .line 2820
    .end local v0    # "outputOptions":Landroidx/camera/video/OutputOptions;
    .end local v1    # "dupedParcelFileDescriptor":Landroid/os/ParcelFileDescriptor;
    .end local v2    # "mediaMuxerSupplier":Landroidx/camera/video/Recorder$RecordingRecord$MediaMuxerSupplier;
    .end local v3    # "recordingFinalizer":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    :cond_7
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Recording "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " has already been initialized"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method isMuted()Z
    .locals 1

    .line 3130
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mMuted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method abstract isPersistent()Z
.end method

.method synthetic lambda$updateVideoRecordEvent$6$androidx-camera-video-Recorder$RecordingRecord(Landroidx/camera/video/VideoRecordEvent;)V
    .locals 1
    .param p1, "event"    # Landroidx/camera/video/VideoRecordEvent;

    .line 3037
    invoke-virtual {p0}, Landroidx/camera/video/Recorder$RecordingRecord;->getEventListener()Landroidx/core/util/Consumer;

    move-result-object v0

    invoke-interface {v0, p1}, Landroidx/core/util/Consumer;->accept(Ljava/lang/Object;)V

    return-void
.end method

.method mute(Z)V
    .locals 1
    .param p1, "muted"    # Z

    .line 3126
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mMuted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 3127
    return-void
.end method

.method performOneTimeAudioSourceCreation(Landroidx/camera/video/internal/audio/AudioSettings;Ljava/util/concurrent/Executor;)Landroidx/camera/video/internal/audio/AudioSource;
    .locals 4
    .param p1, "settings"    # Landroidx/camera/video/internal/audio/AudioSettings;
    .param p2, "audioSourceExecutor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/audio/AudioSourceAccessException;
        }
    .end annotation

    .line 3058
    invoke-virtual {p0}, Landroidx/camera/video/Recorder$RecordingRecord;->hasAudioEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3063
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mAudioSourceSupplier:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;

    .line 3064
    .local v0, "audioSourceSupplier":Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;
    if-eqz v0, :cond_0

    .line 3069
    invoke-interface {v0, p1, p2}, Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;->get(Landroidx/camera/video/internal/audio/AudioSettings;Ljava/util/concurrent/Executor;)Landroidx/camera/video/internal/audio/AudioSource;

    move-result-object v1

    return-object v1

    .line 3065
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "One-time audio source creation has already occurred for recording "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 3059
    .end local v0    # "audioSourceSupplier":Landroidx/camera/video/Recorder$RecordingRecord$AudioSourceSupplier;
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Recording does not have audio enabled. Unable to create audio source for recording "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method performOneTimeMediaMuxerCreation(ILandroidx/core/util/Consumer;)Landroid/media/MediaMuxer;
    .locals 5
    .param p1, "muxerOutputFormat"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroidx/core/util/Consumer<",
            "Landroid/net/Uri;",
            ">;)",
            "Landroid/media/MediaMuxer;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3092
    .local p2, "outputUriCreatedCallback":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroid/net/Uri;>;"
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3095
    iget-object v0, p0, Landroidx/camera/video/Recorder$RecordingRecord;->mMediaMuxerSupplier:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/Recorder$RecordingRecord$MediaMuxerSupplier;

    .line 3096
    .local v0, "mediaMuxerSupplier":Landroidx/camera/video/Recorder$RecordingRecord$MediaMuxerSupplier;
    if-eqz v0, :cond_0

    .line 3102
    :try_start_0
    invoke-interface {v0, p1, p2}, Landroidx/camera/video/Recorder$RecordingRecord$MediaMuxerSupplier;->get(ILandroidx/core/util/Consumer;)Landroid/media/MediaMuxer;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 3103
    :catch_0
    move-exception v1

    .line 3104
    .local v1, "e":Ljava/lang/RuntimeException;
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to create MediaMuxer by "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 3097
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "One-time media muxer creation has already occurred for recording "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 3093
    .end local v0    # "mediaMuxerSupplier":Landroidx/camera/video/Recorder$RecordingRecord$MediaMuxerSupplier;
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Recording "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " has not been initialized"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method updateVideoRecordEvent(Landroidx/camera/video/VideoRecordEvent;)V
    .locals 5
    .param p1, "event"    # Landroidx/camera/video/VideoRecordEvent;

    .line 3020
    invoke-virtual {p1}, Landroidx/camera/video/VideoRecordEvent;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 3025
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Sending VideoRecordEvent "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3026
    .local v0, "message":Ljava/lang/String;
    instance-of v1, p1, Landroidx/camera/video/VideoRecordEvent$Finalize;

    if-eqz v1, :cond_0

    .line 3027
    move-object v1, p1

    check-cast v1, Landroidx/camera/video/VideoRecordEvent$Finalize;

    .line 3028
    .local v1, "finalizeEvent":Landroidx/camera/video/VideoRecordEvent$Finalize;
    invoke-virtual {v1}, Landroidx/camera/video/VideoRecordEvent$Finalize;->hasError()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3029
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 3031
    invoke-virtual {v1}, Landroidx/camera/video/VideoRecordEvent$Finalize;->getError()I

    move-result v3

    .line 3030
    invoke-static {v3}, Landroidx/camera/video/VideoRecordEvent$Finalize;->errorToString(I)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 3029
    const-string v4, " [error: %s]"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3034
    .end local v1    # "finalizeEvent":Landroidx/camera/video/VideoRecordEvent$Finalize;
    :cond_0
    const-string/jumbo v1, "Recorder"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 3035
    invoke-virtual {p0}, Landroidx/camera/video/Recorder$RecordingRecord;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Landroidx/camera/video/Recorder$RecordingRecord;->getEventListener()Landroidx/core/util/Consumer;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 3037
    :try_start_0
    invoke-virtual {p0}, Landroidx/camera/video/Recorder$RecordingRecord;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    new-instance v3, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda6;

    invoke-direct {v3, p0, p1}, Landroidx/camera/video/Recorder$RecordingRecord$$ExternalSyntheticLambda6;-><init>(Landroidx/camera/video/Recorder$RecordingRecord;Landroidx/camera/video/VideoRecordEvent;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3040
    goto :goto_0

    .line 3038
    :catch_0
    move-exception v2

    .line 3039
    .local v2, "e":Ljava/util/concurrent/RejectedExecutionException;
    const-string/jumbo v3, "The callback executor is invalid."

    invoke-static {v1, v3, v2}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 3042
    .end local v2    # "e":Ljava/util/concurrent/RejectedExecutionException;
    :cond_1
    :goto_0
    return-void

    .line 3021
    .end local v0    # "message":Ljava/lang/String;
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Attempted to update event listener with event from incorrect recording [Recording: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 3022
    invoke-virtual {p1}, Landroidx/camera/video/VideoRecordEvent;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", Expected: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 3023
    invoke-virtual {p0}, Landroidx/camera/video/Recorder$RecordingRecord;->getOutputOptions()Landroidx/camera/video/OutputOptions;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method
