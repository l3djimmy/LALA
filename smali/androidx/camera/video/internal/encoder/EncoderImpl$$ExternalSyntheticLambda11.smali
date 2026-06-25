.class public final synthetic Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda11;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/video/internal/encoder/EncoderImpl;"
    method = "lambda$stop$4"
    proto = "(JJ)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/video/internal/encoder/EncoderImpl;

.field public final synthetic f$1:J

.field public final synthetic f$2:J


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/video/internal/encoder/EncoderImpl;JJ)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda11;->f$0:Landroidx/camera/video/internal/encoder/EncoderImpl;

    iput-wide p2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda11;->f$1:J

    iput-wide p4, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda11;->f$2:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda11;->f$0:Landroidx/camera/video/internal/encoder/EncoderImpl;

    iget-wide v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda11;->f$1:J

    iget-wide v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$$ExternalSyntheticLambda11;->f$2:J

    invoke-virtual {v0, v1, v2, v3, v4}, Landroidx/camera/video/internal/encoder/EncoderImpl;->lambda$stop$4$androidx-camera-video-internal-encoder-EncoderImpl(JJ)V

    return-void
.end method
