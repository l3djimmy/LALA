.class Landroidx/camera/video/VideoCapture$1;
.super Ljava/lang/Object;
.source "VideoCapture.java"

# interfaces
.implements Landroidx/camera/core/impl/Observable$Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/VideoCapture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/impl/Observable$Observer<",
        "Landroidx/camera/video/StreamInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/camera/video/VideoCapture;


# direct methods
.method constructor <init>(Landroidx/camera/video/VideoCapture;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/camera/video/VideoCapture;

    .line 828
    .local p0, "this":Landroidx/camera/video/VideoCapture$1;, "Landroidx/camera/video/VideoCapture$1;"
    iput-object p1, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .line 879
    .local p0, "this":Landroidx/camera/video/VideoCapture$1;, "Landroidx/camera/video/VideoCapture$1;"
    const-string/jumbo v0, "VideoCapture"

    const-string/jumbo v1, "Receive onError from StreamState observer"

    invoke-static {v0, v1, p1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 880
    return-void
.end method

.method public onNewData(Landroidx/camera/video/StreamInfo;)V
    .locals 6
    .param p1, "streamInfo"    # Landroidx/camera/video/StreamInfo;

    .line 832
    .local p0, "this":Landroidx/camera/video/VideoCapture$1;, "Landroidx/camera/video/VideoCapture$1;"
    if-eqz p1, :cond_7

    .line 835
    iget-object v0, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    iget-object v0, v0, Landroidx/camera/video/VideoCapture;->mSourceState:Landroidx/camera/video/VideoOutput$SourceState;

    sget-object v1, Landroidx/camera/video/VideoOutput$SourceState;->INACTIVE:Landroidx/camera/video/VideoOutput$SourceState;

    if-ne v0, v1, :cond_0

    .line 837
    return-void

    .line 839
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Stream info update: old: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    iget-object v1, v1, Landroidx/camera/video/VideoCapture;->mStreamInfo:Landroidx/camera/video/StreamInfo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " new: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "VideoCapture"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 841
    iget-object v0, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    iget-object v0, v0, Landroidx/camera/video/VideoCapture;->mStreamInfo:Landroidx/camera/video/StreamInfo;

    .line 842
    .local v0, "currentStreamInfo":Landroidx/camera/video/StreamInfo;
    iget-object v1, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    iput-object p1, v1, Landroidx/camera/video/VideoCapture;->mStreamInfo:Landroidx/camera/video/StreamInfo;

    .line 847
    iget-object v1, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    invoke-virtual {v1}, Landroidx/camera/video/VideoCapture;->getAttachedStreamSpec()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v1

    invoke-static {v1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/StreamSpec;

    .line 848
    .local v1, "attachedStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    iget-object v2, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    invoke-virtual {v0}, Landroidx/camera/video/StreamInfo;->getId()I

    move-result v3

    invoke-virtual {p1}, Landroidx/camera/video/StreamInfo;->getId()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroidx/camera/video/VideoCapture;->isStreamIdChanged(II)Z

    move-result v2

    if-nez v2, :cond_5

    iget-object v2, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    .line 849
    invoke-virtual {v2, v0, p1}, Landroidx/camera/video/VideoCapture;->shouldResetCompensatingTransformation(Landroidx/camera/video/StreamInfo;Landroidx/camera/video/StreamInfo;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 857
    :cond_1
    invoke-virtual {v0}, Landroidx/camera/video/StreamInfo;->getId()I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_2

    .line 858
    invoke-virtual {p1}, Landroidx/camera/video/StreamInfo;->getId()I

    move-result v2

    if-eq v2, v3, :cond_3

    .line 859
    :cond_2
    invoke-virtual {v0}, Landroidx/camera/video/StreamInfo;->getId()I

    move-result v2

    if-ne v2, v3, :cond_4

    .line 860
    invoke-virtual {p1}, Landroidx/camera/video/StreamInfo;->getId()I

    move-result v2

    if-eq v2, v3, :cond_4

    .line 863
    :cond_3
    iget-object v2, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    iget-object v3, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    iget-object v3, v3, Landroidx/camera/video/VideoCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-virtual {v2, v3, p1, v1}, Landroidx/camera/video/VideoCapture;->applyStreamInfoAndStreamSpecToSessionConfigBuilder(Landroidx/camera/core/impl/SessionConfig$Builder;Landroidx/camera/video/StreamInfo;Landroidx/camera/core/impl/StreamSpec;)V

    .line 866
    iget-object v2, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    iget-object v3, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    iget-object v3, v3, Landroidx/camera/video/VideoCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-virtual {v3}, Landroidx/camera/core/impl/SessionConfig$Builder;->build()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v3

    invoke-static {v2, v3}, Landroidx/camera/video/VideoCapture;->access$100(Landroidx/camera/video/VideoCapture;Landroidx/camera/core/impl/SessionConfig;)V

    .line 867
    iget-object v2, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    invoke-static {v2}, Landroidx/camera/video/VideoCapture;->access$200(Landroidx/camera/video/VideoCapture;)V

    goto :goto_1

    .line 868
    :cond_4
    invoke-virtual {v0}, Landroidx/camera/video/StreamInfo;->getStreamState()Landroidx/camera/video/StreamInfo$StreamState;

    move-result-object v2

    invoke-virtual {p1}, Landroidx/camera/video/StreamInfo;->getStreamState()Landroidx/camera/video/StreamInfo$StreamState;

    move-result-object v3

    if-eq v2, v3, :cond_6

    .line 869
    iget-object v2, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    iget-object v3, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    iget-object v3, v3, Landroidx/camera/video/VideoCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-virtual {v2, v3, p1, v1}, Landroidx/camera/video/VideoCapture;->applyStreamInfoAndStreamSpecToSessionConfigBuilder(Landroidx/camera/core/impl/SessionConfig$Builder;Landroidx/camera/video/StreamInfo;Landroidx/camera/core/impl/StreamSpec;)V

    .line 872
    iget-object v2, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    iget-object v3, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    iget-object v3, v3, Landroidx/camera/video/VideoCapture;->mSessionConfigBuilder:Landroidx/camera/core/impl/SessionConfig$Builder;

    invoke-virtual {v3}, Landroidx/camera/core/impl/SessionConfig$Builder;->build()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v3

    invoke-static {v2, v3}, Landroidx/camera/video/VideoCapture;->access$300(Landroidx/camera/video/VideoCapture;Landroidx/camera/core/impl/SessionConfig;)V

    .line 873
    iget-object v2, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    invoke-static {v2}, Landroidx/camera/video/VideoCapture;->access$400(Landroidx/camera/video/VideoCapture;)V

    goto :goto_1

    .line 855
    :cond_5
    :goto_0
    iget-object v2, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    iget-object v3, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    invoke-static {v3}, Landroidx/camera/video/VideoCapture;->access$000(Landroidx/camera/video/VideoCapture;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    invoke-virtual {v4}, Landroidx/camera/video/VideoCapture;->getCurrentConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v4

    check-cast v4, Landroidx/camera/video/impl/VideoCaptureConfig;

    iget-object v5, p0, Landroidx/camera/video/VideoCapture$1;->this$0:Landroidx/camera/video/VideoCapture;

    .line 856
    invoke-virtual {v5}, Landroidx/camera/video/VideoCapture;->getAttachedStreamSpec()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v5

    invoke-static {v5}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/impl/StreamSpec;

    .line 855
    invoke-virtual {v2, v3, v4, v5}, Landroidx/camera/video/VideoCapture;->resetPipeline(Ljava/lang/String;Landroidx/camera/video/impl/VideoCaptureConfig;Landroidx/camera/core/impl/StreamSpec;)V

    .line 875
    :cond_6
    :goto_1
    return-void

    .line 833
    .end local v0    # "currentStreamInfo":Landroidx/camera/video/StreamInfo;
    .end local v1    # "attachedStreamSpec":Landroidx/camera/core/impl/StreamSpec;
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "StreamInfo can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic onNewData(Ljava/lang/Object;)V
    .locals 0

    .line 828
    .local p0, "this":Landroidx/camera/video/VideoCapture$1;, "Landroidx/camera/video/VideoCapture$1;"
    check-cast p1, Landroidx/camera/video/StreamInfo;

    invoke-virtual {p0, p1}, Landroidx/camera/video/VideoCapture$1;->onNewData(Landroidx/camera/video/StreamInfo;)V

    return-void
.end method
