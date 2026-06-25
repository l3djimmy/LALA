.class Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompatBaseImpl;
.super Ljava/lang/Object;
.source "StreamConfigurationMapCompatBaseImpl.java"

# interfaces
.implements Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat$StreamConfigurationMapCompatImpl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompatBaseImpl$Api23Impl;
    }
.end annotation


# instance fields
.field final mStreamConfigurationMap:Landroid/hardware/camera2/params/StreamConfigurationMap;


# direct methods
.method constructor <init>(Landroid/hardware/camera2/params/StreamConfigurationMap;)V
    .locals 0
    .param p1, "map"    # Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompatBaseImpl;->mStreamConfigurationMap:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 38
    return-void
.end method


# virtual methods
.method public getHighResolutionOutputSizes(I)[Landroid/util/Size;
    .locals 1
    .param p1, "format"    # I

    .line 66
    nop

    .line 67
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompatBaseImpl;->mStreamConfigurationMap:Landroid/hardware/camera2/params/StreamConfigurationMap;

    invoke-static {v0, p1}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompatBaseImpl$Api23Impl;->getHighResolutionOutputSizes(Landroid/hardware/camera2/params/StreamConfigurationMap;I)[Landroid/util/Size;

    move-result-object v0

    return-object v0
.end method

.method public getOutputSizes(I)[Landroid/util/Size;
    .locals 2
    .param p1, "format"    # I

    .line 44
    nop

    .line 52
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompatBaseImpl;->mStreamConfigurationMap:Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 44
    const/16 v1, 0x22

    if-ne p1, v1, :cond_0

    .line 50
    const-class v1, Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(Ljava/lang/Class;)[Landroid/util/Size;

    move-result-object v0

    .local v0, "sizes":[Landroid/util/Size;
    goto :goto_0

    .line 52
    .end local v0    # "sizes":[Landroid/util/Size;
    :cond_0
    invoke-virtual {v0, p1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(I)[Landroid/util/Size;

    move-result-object v0

    .line 54
    .restart local v0    # "sizes":[Landroid/util/Size;
    :goto_0
    return-object v0
.end method

.method public getOutputSizes(Ljava/lang/Class;)[Landroid/util/Size;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)[",
            "Landroid/util/Size;"
        }
    .end annotation

    .line 60
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompatBaseImpl;->mStreamConfigurationMap:Landroid/hardware/camera2/params/StreamConfigurationMap;

    invoke-virtual {v0, p1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(Ljava/lang/Class;)[Landroid/util/Size;

    move-result-object v0

    return-object v0
.end method

.method public unwrap()Landroid/hardware/camera2/params/StreamConfigurationMap;
    .locals 1

    .line 75
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompatBaseImpl;->mStreamConfigurationMap:Landroid/hardware/camera2/params/StreamConfigurationMap;

    return-object v0
.end method
