.class Landroidx/camera/video/internal/audio/AudioStreamImpl$AudioRecordingApi29Callback;
.super Landroid/media/AudioManager$AudioRecordingCallback;
.source "AudioStreamImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/internal/audio/AudioStreamImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AudioRecordingApi29Callback"
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/camera/video/internal/audio/AudioStreamImpl;


# direct methods
.method constructor <init>(Landroidx/camera/video/internal/audio/AudioStreamImpl;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/camera/video/internal/audio/AudioStreamImpl;

    .line 311
    iput-object p1, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl$AudioRecordingApi29Callback;->this$0:Landroidx/camera/video/internal/audio/AudioStreamImpl;

    invoke-direct {p0}, Landroid/media/AudioManager$AudioRecordingCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onRecordingConfigChanged(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/media/AudioRecordingConfiguration;",
            ">;)V"
        }
    .end annotation

    .line 314
    .local p1, "configs":Ljava/util/List;, "Ljava/util/List<Landroid/media/AudioRecordingConfiguration;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/AudioRecordingConfiguration;

    .line 315
    .local v1, "config":Landroid/media/AudioRecordingConfiguration;
    invoke-static {v1}, Landroidx/camera/video/internal/compat/Api24Impl;->getClientAudioSessionId(Landroid/media/AudioRecordingConfiguration;)I

    move-result v2

    iget-object v3, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl$AudioRecordingApi29Callback;->this$0:Landroidx/camera/video/internal/audio/AudioStreamImpl;

    iget-object v3, v3, Landroidx/camera/video/internal/audio/AudioStreamImpl;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v3}, Landroid/media/AudioRecord;->getAudioSessionId()I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 316
    invoke-static {v1}, Landroidx/camera/video/internal/compat/Api29Impl;->isClientSilenced(Landroid/media/AudioRecordingConfiguration;)Z

    move-result v0

    .line 317
    .local v0, "isSilenced":Z
    iget-object v2, p0, Landroidx/camera/video/internal/audio/AudioStreamImpl$AudioRecordingApi29Callback;->this$0:Landroidx/camera/video/internal/audio/AudioStreamImpl;

    invoke-virtual {v2, v0}, Landroidx/camera/video/internal/audio/AudioStreamImpl;->notifySilenced(Z)V

    .line 318
    goto :goto_1

    .line 320
    .end local v0    # "isSilenced":Z
    .end local v1    # "config":Landroid/media/AudioRecordingConfiguration;
    :cond_0
    goto :goto_0

    .line 321
    :cond_1
    :goto_1
    return-void
.end method
