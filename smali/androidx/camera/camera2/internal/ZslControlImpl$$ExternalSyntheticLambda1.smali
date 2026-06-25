.class public final synthetic Landroidx/camera/camera2/internal/ZslControlImpl$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/core/internal/utils/RingBuffer$OnRemoveCallback;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/camera2/internal/ZslControlImpl;"
    method = "lambda$new$0"
    proto = "(Landroidx/camera/core/ImageProxy;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onRemove(Ljava/lang/Object;)V
    .locals 0

    .line 0
    check-cast p1, Landroidx/camera/core/ImageProxy;

    invoke-static {p1}, Landroidx/camera/camera2/internal/ZslControlImpl;->lambda$new$0(Landroidx/camera/core/ImageProxy;)V

    return-void
.end method
