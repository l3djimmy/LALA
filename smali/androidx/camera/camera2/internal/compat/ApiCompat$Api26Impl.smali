.class public Landroidx/camera/camera2/internal/compat/ApiCompat$Api26Impl;
.super Ljava/lang/Object;
.source "ApiCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/compat/ApiCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Api26Impl"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    return-void
.end method

.method public static newOutputConfiguration(Landroid/util/Size;Ljava/lang/Class;)Landroid/hardware/camera2/params/OutputConfiguration;
    .locals 1
    .param p0, "surfaceSize"    # Landroid/util/Size;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/util/Size;",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Landroid/hardware/camera2/params/OutputConfiguration;"
        }
    .end annotation

    .line 130
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Landroid/hardware/camera2/params/OutputConfiguration;

    invoke-direct {v0, p0, p1}, Landroid/hardware/camera2/params/OutputConfiguration;-><init>(Landroid/util/Size;Ljava/lang/Class;)V

    return-object v0
.end method

.method public static onCaptureQueueEmpty(Landroid/hardware/camera2/CameraCaptureSession$StateCallback;Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 0
    .param p0, "callback"    # Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;

    .line 120
    invoke-virtual {p0, p1}, Landroid/hardware/camera2/CameraCaptureSession$StateCallback;->onCaptureQueueEmpty(Landroid/hardware/camera2/CameraCaptureSession;)V

    .line 121
    return-void
.end method
