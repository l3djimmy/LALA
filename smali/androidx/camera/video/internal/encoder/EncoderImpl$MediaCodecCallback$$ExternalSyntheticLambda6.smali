.class public final synthetic Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/video/internal/encoder/OutputConfig;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;"
    method = "lambda$onOutputFormatChanged$5"
    proto = "(Landroid/media/MediaFormat;)Landroid/media/MediaFormat;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/media/MediaFormat;


# direct methods
.method public synthetic constructor <init>(Landroid/media/MediaFormat;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda6;->f$0:Landroid/media/MediaFormat;

    return-void
.end method


# virtual methods
.method public final getMediaFormat()Landroid/media/MediaFormat;
    .locals 1

    .line 0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback$$ExternalSyntheticLambda6;->f$0:Landroid/media/MediaFormat;

    invoke-static {v0}, Landroidx/camera/video/internal/encoder/EncoderImpl$MediaCodecCallback;->lambda$onOutputFormatChanged$5(Landroid/media/MediaFormat;)Landroid/media/MediaFormat;

    move-result-object v0

    return-object v0
.end method
