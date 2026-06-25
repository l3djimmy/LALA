.class public Landroidx/camera/camera2/interop/CaptureRequestOptions;
.super Ljava/lang/Object;
.source "CaptureRequestOptions.java"

# interfaces
.implements Landroidx/camera/core/impl/ReadableConfig;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;
    }
.end annotation


# instance fields
.field private final mConfig:Landroidx/camera/core/impl/Config;


# direct methods
.method public constructor <init>(Landroidx/camera/core/impl/Config;)V
    .locals 0
    .param p1, "config"    # Landroidx/camera/core/impl/Config;

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Landroidx/camera/camera2/interop/CaptureRequestOptions;->mConfig:Landroidx/camera/core/impl/Config;

    .line 52
    return-void
.end method


# virtual methods
.method public getCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<ValueT:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CaptureRequest$Key<",
            "TValueT;>;)TValueT;"
        }
    .end annotation

    .line 66
    .local p1, "key":Landroid/hardware/camera2/CaptureRequest$Key;, "Landroid/hardware/camera2/CaptureRequest$Key<TValueT;>;"
    invoke-static {p1}, Landroidx/camera/camera2/impl/Camera2ImplConfig;->createCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    .line 68
    .local v0, "opt":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<TValueT;>;"
    iget-object v1, p0, Landroidx/camera/camera2/interop/CaptureRequestOptions;->mConfig:Landroidx/camera/core/impl/Config;

    const/4 v2, 0x0

    invoke-interface {v1, v0, v2}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public getCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<ValueT:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CaptureRequest$Key<",
            "TValueT;>;TValueT;)TValueT;"
        }
    .end annotation

    .line 86
    .local p1, "key":Landroid/hardware/camera2/CaptureRequest$Key;, "Landroid/hardware/camera2/CaptureRequest$Key<TValueT;>;"
    .local p2, "valueIfMissing":Ljava/lang/Object;, "TValueT;"
    invoke-static {p1}, Landroidx/camera/camera2/impl/Camera2ImplConfig;->createCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    .line 88
    .local v0, "opt":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<TValueT;>;"
    iget-object v1, p0, Landroidx/camera/camera2/interop/CaptureRequestOptions;->mConfig:Landroidx/camera/core/impl/Config;

    invoke-interface {v1, v0, p2}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public getConfig()Landroidx/camera/core/impl/Config;
    .locals 1

    .line 99
    iget-object v0, p0, Landroidx/camera/camera2/interop/CaptureRequestOptions;->mConfig:Landroidx/camera/core/impl/Config;

    return-object v0
.end method
