.class public Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;
.super Ljava/lang/Object;
.source "Camera2EncoderProfilesProvider.java"

# interfaces
.implements Landroidx/camera/core/impl/EncoderProfilesProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider$Api31Impl;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Camera2EncoderProfilesProvider"


# instance fields
.field private final mCameraId:Ljava/lang/String;

.field private final mEncoderProfilesCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroidx/camera/core/impl/EncoderProfilesProxy;",
            ">;"
        }
    .end annotation
.end field

.field private final mHasValidCameraId:Z

.field private final mIntCameraId:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 5
    .param p1, "cameraId"    # Ljava/lang/String;

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;->mEncoderProfilesCache:Ljava/util/Map;

    .line 49
    iput-object p1, p0, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;->mCameraId:Ljava/lang/String;

    .line 50
    const/4 v0, 0x0

    .line 51
    .local v0, "hasValidCameraId":Z
    const/4 v1, -0x1

    .line 53
    .local v1, "intCameraId":I
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move v1, v2

    .line 54
    const/4 v0, 0x1

    .line 58
    goto :goto_0

    .line 55
    :catch_0
    move-exception v2

    .line 56
    .local v2, "e":Ljava/lang/NumberFormatException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Camera id is not an integer: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", unable to create Camera2EncoderProfilesProvider"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Camera2EncoderProfilesProvider"

    invoke-static {v4, v3}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .end local v2    # "e":Ljava/lang/NumberFormatException;
    :goto_0
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;->mHasValidCameraId:Z

    .line 60
    iput v1, p0, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;->mIntCameraId:I

    .line 61
    return-void
.end method

.method private createProfilesFromCamcorderProfile(I)Landroidx/camera/core/impl/EncoderProfilesProxy;
    .locals 4
    .param p1, "quality"    # I

    .line 124
    const/4 v0, 0x0

    .line 126
    .local v0, "profile":Landroid/media/CamcorderProfile;
    :try_start_0
    iget v1, p0, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;->mIntCameraId:I

    invoke-static {v1, p1}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 132
    goto :goto_0

    .line 127
    :catch_0
    move-exception v1

    .line 131
    .local v1, "e":Ljava/lang/RuntimeException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unable to get CamcorderProfile by quality: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Camera2EncoderProfilesProvider"

    invoke-static {v3, v2, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 133
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :goto_0
    if-eqz v0, :cond_0

    invoke-static {v0}, Landroidx/camera/core/impl/compat/EncoderProfilesProxyCompat;->from(Landroid/media/CamcorderProfile;)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v1

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    :goto_1
    return-object v1
.end method

.method private getProfilesInternal(I)Landroidx/camera/core/impl/EncoderProfilesProxy;
    .locals 5
    .param p1, "quality"    # I

    .line 97
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_3

    .line 98
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;->mCameraId:Ljava/lang/String;

    invoke-static {v0, p1}, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider$Api31Impl;->getAll(Ljava/lang/String;I)Landroid/media/EncoderProfiles;

    move-result-object v0

    .line 99
    .local v0, "profiles":Landroid/media/EncoderProfiles;
    if-nez v0, :cond_0

    .line 100
    const/4 v1, 0x0

    return-object v1

    .line 103
    :cond_0
    const-class v1, Landroidx/camera/camera2/internal/compat/quirk/InvalidVideoProfilesQuirk;

    invoke-static {v1}, Landroidx/camera/camera2/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 105
    .local v1, "isVideoProfilesInvalid":Z
    :goto_0
    const-string v2, "Camera2EncoderProfilesProvider"

    if-eqz v1, :cond_2

    .line 106
    const-string v3, "EncoderProfiles contains invalid video profiles, use CamcorderProfile to create EncoderProfilesProxy."

    invoke-static {v2, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 110
    :cond_2
    :try_start_0
    invoke-static {v0}, Landroidx/camera/core/impl/compat/EncoderProfilesProxyCompat;->from(Landroid/media/EncoderProfiles;)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 111
    :catch_0
    move-exception v3

    .line 112
    .local v3, "e":Ljava/lang/NullPointerException;
    const-string v4, "Failed to create EncoderProfilesProxy, EncoderProfiles might  contain invalid video profiles. Use CamcorderProfile instead."

    invoke-static {v2, v4, v3}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 118
    .end local v0    # "profiles":Landroid/media/EncoderProfiles;
    .end local v1    # "isVideoProfilesInvalid":Z
    .end local v3    # "e":Ljava/lang/NullPointerException;
    :cond_3
    :goto_1
    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;->createProfilesFromCamcorderProfile(I)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getAll(I)Landroidx/camera/core/impl/EncoderProfilesProxy;
    .locals 3
    .param p1, "quality"    # I

    .line 77
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;->mHasValidCameraId:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 78
    return-object v1

    .line 81
    :cond_0
    iget v0, p0, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;->mIntCameraId:I

    invoke-static {v0, p1}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v0

    if-nez v0, :cond_1

    .line 82
    return-object v1

    .line 86
    :cond_1
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;->mEncoderProfilesCache:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 87
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;->mEncoderProfilesCache:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/EncoderProfilesProxy;

    return-object v0

    .line 89
    :cond_2
    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;->getProfilesInternal(I)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v0

    .line 90
    .local v0, "profiles":Landroidx/camera/core/impl/EncoderProfilesProxy;
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;->mEncoderProfilesCache:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    return-object v0
.end method

.method public hasProfile(I)Z
    .locals 1
    .param p1, "quality"    # I

    .line 66
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;->mHasValidCameraId:Z

    if-nez v0, :cond_0

    .line 67
    const/4 v0, 0x0

    return v0

    .line 70
    :cond_0
    iget v0, p0, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;->mIntCameraId:I

    invoke-static {v0, p1}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v0

    return v0
.end method
