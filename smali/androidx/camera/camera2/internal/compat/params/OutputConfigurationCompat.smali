.class public final Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;
.super Ljava/lang/Object;
.source "OutputConfigurationCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;
    }
.end annotation


# static fields
.field public static final STREAM_USE_CASE_NONE:I = -0x1

.field public static final SURFACE_GROUP_ID_NONE:I = -0x1


# instance fields
.field private final mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;


# direct methods
.method public constructor <init>(ILandroid/view/Surface;)V
    .locals 2
    .param p1, "surfaceGroupId"    # I
    .param p2, "surface"    # Landroid/view/Surface;

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_0

    .line 64
    new-instance v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi33Impl;

    invoke-direct {v0, p1, p2}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi33Impl;-><init>(ILandroid/view/Surface;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    goto :goto_0

    .line 65
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_1

    .line 66
    new-instance v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi28Impl;

    invoke-direct {v0, p1, p2}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi28Impl;-><init>(ILandroid/view/Surface;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    goto :goto_0

    .line 67
    :cond_1
    nop

    .line 68
    new-instance v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl;

    invoke-direct {v0, p1, p2}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl;-><init>(ILandroid/view/Surface;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    .line 74
    :goto_0
    return-void
.end method

.method public constructor <init>(Landroid/util/Size;Ljava/lang/Class;)V
    .locals 3
    .param p1, "surfaceSize"    # Landroid/util/Size;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/util/Size;",
            "Ljava/lang/Class<",
            "TT;>;)V"
        }
    .end annotation

    .line 107
    .local p2, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    nop

    .line 109
    invoke-static {p1, p2}, Landroidx/camera/camera2/internal/compat/ApiCompat$Api26Impl;->newOutputConfiguration(Landroid/util/Size;Ljava/lang/Class;)Landroid/hardware/camera2/params/OutputConfiguration;

    move-result-object v0

    .line 110
    .local v0, "deferredConfig":Landroid/hardware/camera2/params/OutputConfiguration;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v1, v2, :cond_0

    .line 111
    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi33Impl;->wrap(Landroid/hardware/camera2/params/OutputConfiguration;)Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi33Impl;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    goto :goto_0

    .line 112
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v1, v2, :cond_1

    .line 113
    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi28Impl;->wrap(Landroid/hardware/camera2/params/OutputConfiguration;)Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi28Impl;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    goto :goto_0

    .line 115
    :cond_1
    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl;->wrap(Landroid/hardware/camera2/params/OutputConfiguration;)Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    .line 117
    :goto_0
    return-void
.end method

.method public constructor <init>(Landroid/view/Surface;)V
    .locals 1
    .param p1, "surface"    # Landroid/view/Surface;

    .line 59
    const/4 v0, -0x1

    invoke-direct {p0, v0, p1}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;-><init>(ILandroid/view/Surface;)V

    .line 60
    return-void
.end method

.method private constructor <init>(Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;)V
    .locals 0
    .param p1, "impl"    # Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    iput-object p1, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    .line 121
    return-void
.end method

.method public static wrap(Ljava/lang/Object;)Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;
    .locals 4
    .param p0, "outputConfiguration"    # Ljava/lang/Object;

    .line 136
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 137
    return-object v0

    .line 140
    :cond_0
    const/4 v1, 0x0

    .line 141
    .local v1, "outputConfigurationCompatImpl":Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x21

    if-lt v2, v3, :cond_1

    .line 142
    move-object v2, p0

    check-cast v2, Landroid/hardware/camera2/params/OutputConfiguration;

    invoke-static {v2}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi33Impl;->wrap(Landroid/hardware/camera2/params/OutputConfiguration;)Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi33Impl;

    move-result-object v1

    goto :goto_0

    .line 144
    :cond_1
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1c

    if-lt v2, v3, :cond_2

    .line 145
    move-object v2, p0

    check-cast v2, Landroid/hardware/camera2/params/OutputConfiguration;

    invoke-static {v2}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi28Impl;->wrap(Landroid/hardware/camera2/params/OutputConfiguration;)Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi28Impl;

    move-result-object v1

    goto :goto_0

    .line 147
    :cond_2
    nop

    .line 148
    move-object v2, p0

    check-cast v2, Landroid/hardware/camera2/params/OutputConfiguration;

    invoke-static {v2}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl;->wrap(Landroid/hardware/camera2/params/OutputConfiguration;)Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompatApi26Impl;

    move-result-object v1

    .line 155
    :goto_0
    if-nez v1, :cond_3

    .line 156
    return-object v0

    .line 159
    :cond_3
    new-instance v0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;

    invoke-direct {v0, v1}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;-><init>(Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;)V

    return-object v0
.end method


# virtual methods
.method public addSurface(Landroid/view/Surface;)V
    .locals 1
    .param p1, "surface"    # Landroid/view/Surface;

    .line 285
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    invoke-interface {v0, p1}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;->addSurface(Landroid/view/Surface;)V

    .line 286
    return-void
.end method

.method public enableSurfaceSharing()V
    .locals 1

    .line 199
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    invoke-interface {v0}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;->enableSurfaceSharing()V

    .line 200
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;

    .line 460
    instance-of v0, p1, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;

    if-nez v0, :cond_0

    .line 461
    const/4 v0, 0x0

    return v0

    .line 464
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    move-object v1, p1

    check-cast v1, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;

    iget-object v1, v1, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getDynamicRangeProfile()J
    .locals 2

    .line 362
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    invoke-interface {v0}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;->getDynamicRangeProfile()J

    move-result-wide v0

    return-wide v0
.end method

.method public getMaxSharedSurfaceCount()I
    .locals 1

    .line 313
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    invoke-interface {v0}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;->getMaxSharedSurfaceCount()I

    move-result v0

    return v0
.end method

.method public getPhysicalCameraId()Ljava/lang/String;
    .locals 1

    .line 209
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    invoke-interface {v0}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;->getPhysicalCameraId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStreamUseCase()J
    .locals 2

    .line 445
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    invoke-interface {v0}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;->getStreamUseCase()J

    move-result-wide v0

    return-wide v0
.end method

.method public getSurface()Landroid/view/Surface;
    .locals 1

    .line 325
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    invoke-interface {v0}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;->getSurface()Landroid/view/Surface;

    move-result-object v0

    return-object v0
.end method

.method public getSurfaceGroupId()I
    .locals 1

    .line 348
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    invoke-interface {v0}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;->getSurfaceGroupId()I

    move-result v0

    return v0
.end method

.method public getSurfaces()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;"
        }
    .end annotation

    .line 338
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    invoke-interface {v0}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;->getSurfaces()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 472
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public removeSurface(Landroid/view/Surface;)V
    .locals 1
    .param p1, "surface"    # Landroid/view/Surface;

    .line 303
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    invoke-interface {v0, p1}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;->removeSurface(Landroid/view/Surface;)V

    .line 304
    return-void
.end method

.method public setDynamicRangeProfile(J)V
    .locals 1
    .param p1, "profile"    # J

    .line 395
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    invoke-interface {v0, p1, p2}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;->setDynamicRangeProfile(J)V

    .line 396
    return-void
.end method

.method public setPhysicalCameraId(Ljava/lang/String;)V
    .locals 1
    .param p1, "physicalCameraId"    # Ljava/lang/String;

    .line 240
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    invoke-interface {v0, p1}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;->setPhysicalCameraId(Ljava/lang/String;)V

    .line 241
    return-void
.end method

.method public setStreamUseCase(J)V
    .locals 1
    .param p1, "streamUseCase"    # J

    .line 434
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    invoke-interface {v0, p1, p2}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;->setStreamUseCase(J)V

    .line 435
    return-void
.end method

.method public unwrap()Ljava/lang/Object;
    .locals 1

    .line 485
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->mImpl:Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;

    invoke-interface {v0}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat$OutputConfigurationCompatImpl;->getOutputConfiguration()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
