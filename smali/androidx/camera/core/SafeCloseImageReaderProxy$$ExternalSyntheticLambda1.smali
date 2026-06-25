.class public final synthetic Landroidx/camera/core/SafeCloseImageReaderProxy$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/core/ForwardingImageProxy$OnImageCloseListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/core/SafeCloseImageReaderProxy;"
    method = "lambda$new$0"
    proto = "(Landroidx/camera/core/ImageProxy;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/core/SafeCloseImageReaderProxy;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/core/SafeCloseImageReaderProxy;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/core/SafeCloseImageReaderProxy$$ExternalSyntheticLambda1;->f$0:Landroidx/camera/core/SafeCloseImageReaderProxy;

    return-void
.end method


# virtual methods
.method public final onImageClose(Landroidx/camera/core/ImageProxy;)V
    .locals 1

    .line 0
    iget-object v0, p0, Landroidx/camera/core/SafeCloseImageReaderProxy$$ExternalSyntheticLambda1;->f$0:Landroidx/camera/core/SafeCloseImageReaderProxy;

    invoke-virtual {v0, p1}, Landroidx/camera/core/SafeCloseImageReaderProxy;->lambda$new$0$androidx-camera-core-SafeCloseImageReaderProxy(Landroidx/camera/core/ImageProxy;)V

    return-void
.end method
