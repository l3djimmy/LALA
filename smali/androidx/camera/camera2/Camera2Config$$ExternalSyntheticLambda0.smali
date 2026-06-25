.class public final synthetic Landroidx/camera/camera2/Camera2Config$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/core/impl/CameraFactory$Provider;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/camera2/internal/Camera2CameraFactory;"
    method = "<init>"
    proto = "(Landroid/content/Context;Landroidx/camera/core/impl/CameraThreadConfig;Landroidx/camera/core/CameraSelector;)V"
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
.method public final newInstance(Landroid/content/Context;Landroidx/camera/core/impl/CameraThreadConfig;Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/impl/CameraFactory;
    .locals 1

    .line 0
    new-instance v0, Landroidx/camera/camera2/internal/Camera2CameraFactory;

    invoke-direct {v0, p1, p2, p3}, Landroidx/camera/camera2/internal/Camera2CameraFactory;-><init>(Landroid/content/Context;Landroidx/camera/core/impl/CameraThreadConfig;Landroidx/camera/core/CameraSelector;)V

    check-cast v0, Landroidx/camera/core/impl/CameraFactory;

    return-object v0
.end method
