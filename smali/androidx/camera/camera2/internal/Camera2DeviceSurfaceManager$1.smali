.class Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager$1;
.super Ljava/lang/Object;
.source "Camera2DeviceSurfaceManager.java"

# interfaces
.implements Landroidx/camera/camera2/internal/CamcorderProfileHelper;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/camera/camera2/internal/Camera2DeviceSurfaceManager;-><init>(Landroid/content/Context;Ljava/lang/Object;Ljava/util/Set;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public get(II)Landroid/media/CamcorderProfile;
    .locals 1
    .param p1, "cameraId"    # I
    .param p2, "quality"    # I

    .line 78
    invoke-static {p1, p2}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v0

    return-object v0
.end method

.method public hasProfile(II)Z
    .locals 1
    .param p1, "cameraId"    # I
    .param p2, "quality"    # I

    .line 72
    invoke-static {p1, p2}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v0

    return v0
.end method
