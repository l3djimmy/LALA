.class public final synthetic Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;"
    method = "lambda$notifySurfaceUpdate$0"
    proto = "(Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;Landroid/view/Surface;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;

.field public final synthetic f$1:Landroid/view/Surface;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;Landroid/view/Surface;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;

    iput-object p2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput$$ExternalSyntheticLambda0;->f$1:Landroid/view/Surface;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;

    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput$$ExternalSyntheticLambda0;->f$1:Landroid/view/Surface;

    invoke-static {v0, v1}, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->lambda$notifySurfaceUpdate$0(Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;Landroid/view/Surface;)V

    return-void
.end method
