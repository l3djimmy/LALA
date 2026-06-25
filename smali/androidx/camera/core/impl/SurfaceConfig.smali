.class public abstract Landroidx/camera/core/impl/SurfaceConfig;
.super Ljava/lang/Object;
.source "SurfaceConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/SurfaceConfig$ConfigType;,
        Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;
    }
.end annotation


# static fields
.field public static final DEFAULT_STREAM_USE_CASE_VALUE:J


# direct methods
.method constructor <init>()V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    return-void
.end method

.method public static create(Landroidx/camera/core/impl/SurfaceConfig$ConfigType;Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;)Landroidx/camera/core/impl/SurfaceConfig;
    .locals 3
    .param p0, "type"    # Landroidx/camera/core/impl/SurfaceConfig$ConfigType;
    .param p1, "size"    # Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    .line 53
    new-instance v0, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;

    const-wide/16 v1, 0x0

    invoke-direct {v0, p0, p1, v1, v2}, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;-><init>(Landroidx/camera/core/impl/SurfaceConfig$ConfigType;Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;J)V

    return-object v0
.end method

.method public static create(Landroidx/camera/core/impl/SurfaceConfig$ConfigType;Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;J)Landroidx/camera/core/impl/SurfaceConfig;
    .locals 1
    .param p0, "type"    # Landroidx/camera/core/impl/SurfaceConfig$ConfigType;
    .param p1, "size"    # Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;
    .param p2, "streamUseCase"    # J

    .line 62
    new-instance v0, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;

    invoke-direct {v0, p0, p1, p2, p3}, Landroidx/camera/core/impl/AutoValue_SurfaceConfig;-><init>(Landroidx/camera/core/impl/SurfaceConfig$ConfigType;Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;J)V

    return-object v0
.end method

.method public static getConfigType(I)Landroidx/camera/core/impl/SurfaceConfig$ConfigType;
    .locals 1
    .param p0, "imageFormat"    # I

    .line 117
    const/16 v0, 0x23

    if-ne p0, v0, :cond_0

    .line 118
    sget-object v0, Landroidx/camera/core/impl/SurfaceConfig$ConfigType;->YUV:Landroidx/camera/core/impl/SurfaceConfig$ConfigType;

    return-object v0

    .line 119
    :cond_0
    const/16 v0, 0x100

    if-ne p0, v0, :cond_1

    .line 120
    sget-object v0, Landroidx/camera/core/impl/SurfaceConfig$ConfigType;->JPEG:Landroidx/camera/core/impl/SurfaceConfig$ConfigType;

    return-object v0

    .line 121
    :cond_1
    const/16 v0, 0x20

    if-ne p0, v0, :cond_2

    .line 122
    sget-object v0, Landroidx/camera/core/impl/SurfaceConfig$ConfigType;->RAW:Landroidx/camera/core/impl/SurfaceConfig$ConfigType;

    return-object v0

    .line 124
    :cond_2
    sget-object v0, Landroidx/camera/core/impl/SurfaceConfig$ConfigType;->PRIV:Landroidx/camera/core/impl/SurfaceConfig$ConfigType;

    return-object v0
.end method

.method public static transformSurfaceConfig(IILandroid/util/Size;Landroidx/camera/core/impl/SurfaceSizeDefinition;)Landroidx/camera/core/impl/SurfaceConfig;
    .locals 5
    .param p0, "cameraMode"    # I
    .param p1, "imageFormat"    # I
    .param p2, "size"    # Landroid/util/Size;
    .param p3, "surfaceSizeDefinition"    # Landroidx/camera/core/impl/SurfaceSizeDefinition;

    .line 143
    nop

    .line 144
    invoke-static {p1}, Landroidx/camera/core/impl/SurfaceConfig;->getConfigType(I)Landroidx/camera/core/impl/SurfaceConfig$ConfigType;

    move-result-object v0

    .line 145
    .local v0, "configType":Landroidx/camera/core/impl/SurfaceConfig$ConfigType;
    sget-object v1, Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;->NOT_SUPPORT:Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    .line 148
    .local v1, "configSize":Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;
    invoke-static {p2}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v2

    .line 150
    .local v2, "sizeArea":I
    const/4 v3, 0x1

    if-ne p0, v3, :cond_1

    .line 151
    invoke-virtual {p3, p1}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getS720pSize(I)Landroid/util/Size;

    move-result-object v3

    invoke-static {v3}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v3

    if-gt v2, v3, :cond_0

    .line 152
    sget-object v1, Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;->s720p:Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    goto :goto_0

    .line 153
    :cond_0
    invoke-virtual {p3, p1}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getS1440pSize(I)Landroid/util/Size;

    move-result-object v3

    invoke-static {v3}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v3

    if-gt v2, v3, :cond_6

    .line 155
    sget-object v1, Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;->s1440p:Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    goto :goto_0

    .line 158
    :cond_1
    invoke-virtual {p3}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getAnalysisSize()Landroid/util/Size;

    move-result-object v3

    invoke-static {v3}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v3

    if-gt v2, v3, :cond_2

    .line 159
    sget-object v1, Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;->VGA:Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    goto :goto_0

    .line 160
    :cond_2
    invoke-virtual {p3}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getPreviewSize()Landroid/util/Size;

    move-result-object v3

    invoke-static {v3}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v3

    if-gt v2, v3, :cond_3

    .line 161
    sget-object v1, Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;->PREVIEW:Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    goto :goto_0

    .line 162
    :cond_3
    invoke-virtual {p3}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getRecordSize()Landroid/util/Size;

    move-result-object v3

    invoke-static {v3}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v3

    if-gt v2, v3, :cond_4

    .line 163
    sget-object v1, Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;->RECORD:Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    goto :goto_0

    .line 164
    :cond_4
    nop

    .line 165
    invoke-virtual {p3, p1}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getMaximumSize(I)Landroid/util/Size;

    move-result-object v3

    .line 164
    invoke-static {v3}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v3

    if-gt v2, v3, :cond_5

    .line 166
    sget-object v1, Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;->MAXIMUM:Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    goto :goto_0

    .line 168
    :cond_5
    invoke-virtual {p3, p1}, Landroidx/camera/core/impl/SurfaceSizeDefinition;->getUltraMaximumSize(I)Landroid/util/Size;

    move-result-object v3

    .line 169
    .local v3, "ultraMaximumSize":Landroid/util/Size;
    if-eqz v3, :cond_6

    invoke-static {v3}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v4

    if-gt v2, v4, :cond_6

    .line 170
    sget-object v1, Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;->ULTRA_MAXIMUM:Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    .line 175
    .end local v3    # "ultraMaximumSize":Landroid/util/Size;
    :cond_6
    :goto_0
    invoke-static {v0, v1}, Landroidx/camera/core/impl/SurfaceConfig;->create(Landroidx/camera/core/impl/SurfaceConfig$ConfigType;Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;)Landroidx/camera/core/impl/SurfaceConfig;

    move-result-object v3

    return-object v3
.end method


# virtual methods
.method public abstract getConfigSize()Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;
.end method

.method public abstract getConfigType()Landroidx/camera/core/impl/SurfaceConfig$ConfigType;
.end method

.method public abstract getStreamUseCase()J
.end method

.method public final isSupported(Landroidx/camera/core/impl/SurfaceConfig;)Z
    .locals 5
    .param p1, "surfaceConfig"    # Landroidx/camera/core/impl/SurfaceConfig;

    .line 96
    const/4 v0, 0x0

    .line 97
    .local v0, "isSupported":Z
    invoke-virtual {p1}, Landroidx/camera/core/impl/SurfaceConfig;->getConfigType()Landroidx/camera/core/impl/SurfaceConfig$ConfigType;

    move-result-object v1

    .line 98
    .local v1, "configType":Landroidx/camera/core/impl/SurfaceConfig$ConfigType;
    invoke-virtual {p1}, Landroidx/camera/core/impl/SurfaceConfig;->getConfigSize()Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    move-result-object v2

    .line 101
    .local v2, "configSize":Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;
    invoke-virtual {v2}, Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;->getId()I

    move-result v3

    invoke-virtual {p0}, Landroidx/camera/core/impl/SurfaceConfig;->getConfigSize()Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/camera/core/impl/SurfaceConfig$ConfigSize;->getId()I

    move-result v4

    if-gt v3, v4, :cond_0

    invoke-virtual {p0}, Landroidx/camera/core/impl/SurfaceConfig;->getConfigType()Landroidx/camera/core/impl/SurfaceConfig$ConfigType;

    move-result-object v3

    if-ne v1, v3, :cond_0

    .line 102
    const/4 v0, 0x1

    .line 104
    :cond_0
    return v0
.end method
