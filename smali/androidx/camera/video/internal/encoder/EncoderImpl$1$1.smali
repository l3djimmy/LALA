.class Landroidx/camera/video/internal/encoder/EncoderImpl$1$1;
.super Ljava/lang/Object;
.source "EncoderImpl.java"

# interfaces
.implements Landroidx/camera/core/impl/utils/futures/FutureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/camera/video/internal/encoder/EncoderImpl$1;->onSuccess(Landroidx/camera/video/internal/encoder/InputBuffer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/impl/utils/futures/FutureCallback<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/camera/video/internal/encoder/EncoderImpl$1;


# direct methods
.method constructor <init>(Landroidx/camera/video/internal/encoder/EncoderImpl$1;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/camera/video/internal/encoder/EncoderImpl$1;

    .line 745
    iput-object p1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$1$1;->this$1:Landroidx/camera/video/internal/encoder/EncoderImpl$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "t"    # Ljava/lang/Throwable;

    .line 755
    instance-of v0, p1, Landroid/media/MediaCodec$CodecException;

    .line 759
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$1$1;->this$1:Landroidx/camera/video/internal/encoder/EncoderImpl$1;

    .line 755
    if-eqz v0, :cond_0

    .line 756
    iget-object v0, v1, Landroidx/camera/video/internal/encoder/EncoderImpl$1;->this$0:Landroidx/camera/video/internal/encoder/EncoderImpl;

    move-object v1, p1

    check-cast v1, Landroid/media/MediaCodec$CodecException;

    invoke-virtual {v0, v1}, Landroidx/camera/video/internal/encoder/EncoderImpl;->handleEncodeError(Landroid/media/MediaCodec$CodecException;)V

    goto :goto_0

    .line 759
    :cond_0
    iget-object v0, v1, Landroidx/camera/video/internal/encoder/EncoderImpl$1;->this$0:Landroidx/camera/video/internal/encoder/EncoderImpl;

    .line 760
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 759
    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1, p1}, Landroidx/camera/video/internal/encoder/EncoderImpl;->handleEncodeError(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 762
    :goto_0
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 745
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Landroidx/camera/video/internal/encoder/EncoderImpl$1$1;->onSuccess(Ljava/lang/Void;)V

    return-void
.end method

.method public onSuccess(Ljava/lang/Void;)V
    .locals 0
    .param p1, "result"    # Ljava/lang/Void;

    .line 750
    return-void
.end method
