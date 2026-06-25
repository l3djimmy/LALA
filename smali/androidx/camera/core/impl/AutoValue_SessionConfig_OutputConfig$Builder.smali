.class final Landroidx/camera/core/impl/AutoValue_SessionConfig_OutputConfig$Builder;
.super Landroidx/camera/core/impl/SessionConfig$OutputConfig$Builder;
.source "AutoValue_SessionConfig_OutputConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/impl/AutoValue_SessionConfig_OutputConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Builder"
.end annotation


# instance fields
.field private dynamicRange:Landroidx/camera/core/DynamicRange;

.field private physicalCameraId:Ljava/lang/String;

.field private sharedSurfaces:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;"
        }
    .end annotation
.end field

.field private surface:Landroidx/camera/core/impl/DeferrableSurface;

.field private surfaceGroupId:Ljava/lang/Integer;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 114
    invoke-direct {p0}, Landroidx/camera/core/impl/SessionConfig$OutputConfig$Builder;-><init>()V

    .line 115
    return-void
.end method


# virtual methods
.method public build()Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    .locals 9

    .line 152
    const-string v0, ""

    .line 153
    .local v0, "missing":Ljava/lang/String;
    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_SessionConfig_OutputConfig$Builder;->surface:Landroidx/camera/core/impl/DeferrableSurface;

    if-nez v1, :cond_0

    .line 154
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " surface"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 156
    :cond_0
    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_SessionConfig_OutputConfig$Builder;->sharedSurfaces:Ljava/util/List;

    if-nez v1, :cond_1

    .line 157
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " sharedSurfaces"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 159
    :cond_1
    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_SessionConfig_OutputConfig$Builder;->surfaceGroupId:Ljava/lang/Integer;

    if-nez v1, :cond_2

    .line 160
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " surfaceGroupId"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 162
    :cond_2
    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_SessionConfig_OutputConfig$Builder;->dynamicRange:Landroidx/camera/core/DynamicRange;

    if-nez v1, :cond_3

    .line 163
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " dynamicRange"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 165
    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 168
    new-instance v2, Landroidx/camera/core/impl/AutoValue_SessionConfig_OutputConfig;

    iget-object v3, p0, Landroidx/camera/core/impl/AutoValue_SessionConfig_OutputConfig$Builder;->surface:Landroidx/camera/core/impl/DeferrableSurface;

    iget-object v4, p0, Landroidx/camera/core/impl/AutoValue_SessionConfig_OutputConfig$Builder;->sharedSurfaces:Ljava/util/List;

    iget-object v5, p0, Landroidx/camera/core/impl/AutoValue_SessionConfig_OutputConfig$Builder;->physicalCameraId:Ljava/lang/String;

    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_SessionConfig_OutputConfig$Builder;->surfaceGroupId:Ljava/lang/Integer;

    .line 172
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    iget-object v7, p0, Landroidx/camera/core/impl/AutoValue_SessionConfig_OutputConfig$Builder;->dynamicRange:Landroidx/camera/core/DynamicRange;

    const/4 v8, 0x0

    invoke-direct/range {v2 .. v8}, Landroidx/camera/core/impl/AutoValue_SessionConfig_OutputConfig;-><init>(Landroidx/camera/core/impl/DeferrableSurface;Ljava/util/List;Ljava/lang/String;ILandroidx/camera/core/DynamicRange;Landroidx/camera/core/impl/AutoValue_SessionConfig_OutputConfig$1;)V

    .line 168
    return-object v2

    .line 166
    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Missing required properties:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setDynamicRange(Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/impl/SessionConfig$OutputConfig$Builder;
    .locals 2
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 144
    if-eqz p1, :cond_0

    .line 147
    iput-object p1, p0, Landroidx/camera/core/impl/AutoValue_SessionConfig_OutputConfig$Builder;->dynamicRange:Landroidx/camera/core/DynamicRange;

    .line 148
    return-object p0

    .line 145
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null dynamicRange"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setPhysicalCameraId(Ljava/lang/String;)Landroidx/camera/core/impl/SessionConfig$OutputConfig$Builder;
    .locals 0
    .param p1, "physicalCameraId"    # Ljava/lang/String;

    .line 134
    iput-object p1, p0, Landroidx/camera/core/impl/AutoValue_SessionConfig_OutputConfig$Builder;->physicalCameraId:Ljava/lang/String;

    .line 135
    return-object p0
.end method

.method public setSharedSurfaces(Ljava/util/List;)Landroidx/camera/core/impl/SessionConfig$OutputConfig$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;)",
            "Landroidx/camera/core/impl/SessionConfig$OutputConfig$Builder;"
        }
    .end annotation

    .line 126
    .local p1, "sharedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    if-eqz p1, :cond_0

    .line 129
    iput-object p1, p0, Landroidx/camera/core/impl/AutoValue_SessionConfig_OutputConfig$Builder;->sharedSurfaces:Ljava/util/List;

    .line 130
    return-object p0

    .line 127
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null sharedSurfaces"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSurface(Landroidx/camera/core/impl/DeferrableSurface;)Landroidx/camera/core/impl/SessionConfig$OutputConfig$Builder;
    .locals 2
    .param p1, "surface"    # Landroidx/camera/core/impl/DeferrableSurface;

    .line 118
    if-eqz p1, :cond_0

    .line 121
    iput-object p1, p0, Landroidx/camera/core/impl/AutoValue_SessionConfig_OutputConfig$Builder;->surface:Landroidx/camera/core/impl/DeferrableSurface;

    .line 122
    return-object p0

    .line 119
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null surface"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSurfaceGroupId(I)Landroidx/camera/core/impl/SessionConfig$OutputConfig$Builder;
    .locals 1
    .param p1, "surfaceGroupId"    # I

    .line 139
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/impl/AutoValue_SessionConfig_OutputConfig$Builder;->surfaceGroupId:Ljava/lang/Integer;

    .line 140
    return-object p0
.end method
