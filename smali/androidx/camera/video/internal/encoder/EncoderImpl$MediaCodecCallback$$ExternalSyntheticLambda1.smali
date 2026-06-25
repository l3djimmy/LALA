.class public final synthetic Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;"
    method = "lambda$onOutputBufferAvailable$2"
    proto = "(Landroid/media/MediaCodec$BufferInfo;Landroid/media/MediaCodec;I)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;

.field public final synthetic f$1:Landroid/media/MediaCodec$BufferInfo;

.field public final synthetic f$2:Landroid/media/MediaCodec;

.field public final synthetic f$3:I


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;Landroid/media/MediaCodec$BufferInfo;Landroid/media/MediaCodec;I)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda1;->f$0:Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;

    iput-object p2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda1;->f$1:Landroid/media/MediaCodec$BufferInfo;

    iput-object p3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda1;->f$2:Landroid/media/MediaCodec;

    iput p4, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda1;->f$3:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda1;->f$0:Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;

    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda1;->f$1:Landroid/media/MediaCodec$BufferInfo;

    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda1;->f$2:Landroid/media/MediaCodec;

    iget v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda1;->f$3:I

    invoke-virtual {v0, v1, v2, v3}, Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;->lambda$onOutputBufferAvailable$2$androidx-camera-video-internal-encoder-EncoderImpl$MediaCodecCallback(Landroid/media/MediaCodec$BufferInfo;Landroid/media/MediaCodec;I)V

    return-void
.end method
