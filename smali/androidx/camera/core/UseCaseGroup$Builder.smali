.class public final Landroidx/camera/core/UseCaseGroup$Builder;
.super Ljava/lang/Object;
.source "UseCaseGroup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/UseCaseGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# static fields
.field private static final SUPPORTED_TARGETS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mEffects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraEffect;",
            ">;"
        }
    .end annotation
.end field

.field private final mUseCases:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/UseCase;",
            ">;"
        }
    .end annotation
.end field

.field private mViewPort:Landroidx/camera/core/ViewPort;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 90
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Integer;

    .line 91
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v0, v3

    .line 92
    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v1

    .line 93
    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    .line 94
    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    .line 95
    const/4 v2, 0x7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    .line 90
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/UseCaseGroup$Builder;->SUPPORTED_TARGETS:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/UseCaseGroup$Builder;->mUseCases:Ljava/util/List;

    .line 104
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/UseCaseGroup$Builder;->mEffects:Ljava/util/List;

    .line 105
    return-void
.end method

.method private checkEffectTargets()V
    .locals 8

    .line 152
    const/4 v0, 0x0

    .line 153
    .local v0, "existingTargets":I
    iget-object v1, p0, Landroidx/camera/core/UseCaseGroup$Builder;->mEffects:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/CameraEffect;

    .line 154
    .local v2, "effect":Landroidx/camera/core/CameraEffect;
    invoke-virtual {v2}, Landroidx/camera/core/CameraEffect;->getTargets()I

    move-result v3

    .line 155
    .local v3, "targets":I
    sget-object v4, Landroidx/camera/core/UseCaseGroup$Builder;->SUPPORTED_TARGETS:Ljava/util/List;

    invoke-static {v4, v3}, Landroidx/camera/core/processing/TargetUtils;->checkSupportedTargets(Ljava/util/Collection;I)V

    .line 156
    and-int v4, v0, v3

    .line 157
    .local v4, "overlappingTargets":I
    if-gtz v4, :cond_0

    .line 162
    or-int/2addr v0, v3

    .line 163
    .end local v2    # "effect":Landroidx/camera/core/CameraEffect;
    .end local v3    # "targets":I
    .end local v4    # "overlappingTargets":I
    goto :goto_0

    .line 158
    .restart local v2    # "effect":Landroidx/camera/core/CameraEffect;
    .restart local v3    # "targets":I
    .restart local v4    # "overlappingTargets":I
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 160
    invoke-static {v4}, Landroidx/camera/core/processing/TargetUtils;->getHumanReadableName(I)Ljava/lang/String;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    .line 158
    const-string v7, "More than one effects has targets %s."

    invoke-static {v5, v7, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 164
    .end local v2    # "effect":Landroidx/camera/core/CameraEffect;
    .end local v3    # "targets":I
    .end local v4    # "overlappingTargets":I
    :cond_1
    return-void
.end method


# virtual methods
.method public addEffect(Landroidx/camera/core/CameraEffect;)Landroidx/camera/core/UseCaseGroup$Builder;
    .locals 1
    .param p1, "cameraEffect"    # Landroidx/camera/core/CameraEffect;

    .line 141
    iget-object v0, p0, Landroidx/camera/core/UseCaseGroup$Builder;->mEffects:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    return-object p0
.end method

.method public addUseCase(Landroidx/camera/core/UseCase;)Landroidx/camera/core/UseCaseGroup$Builder;
    .locals 1
    .param p1, "useCase"    # Landroidx/camera/core/UseCase;

    .line 172
    iget-object v0, p0, Landroidx/camera/core/UseCaseGroup$Builder;->mUseCases:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 173
    return-object p0
.end method

.method public build()Landroidx/camera/core/UseCaseGroup;
    .locals 4

    .line 181
    iget-object v0, p0, Landroidx/camera/core/UseCaseGroup$Builder;->mUseCases:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string/jumbo v1, "UseCase must not be empty."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 182
    invoke-direct {p0}, Landroidx/camera/core/UseCaseGroup$Builder;->checkEffectTargets()V

    .line 183
    new-instance v0, Landroidx/camera/core/UseCaseGroup;

    iget-object v1, p0, Landroidx/camera/core/UseCaseGroup$Builder;->mViewPort:Landroidx/camera/core/ViewPort;

    iget-object v2, p0, Landroidx/camera/core/UseCaseGroup$Builder;->mUseCases:Ljava/util/List;

    iget-object v3, p0, Landroidx/camera/core/UseCaseGroup$Builder;->mEffects:Ljava/util/List;

    invoke-direct {v0, v1, v2, v3}, Landroidx/camera/core/UseCaseGroup;-><init>(Landroidx/camera/core/ViewPort;Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method public setViewPort(Landroidx/camera/core/ViewPort;)Landroidx/camera/core/UseCaseGroup$Builder;
    .locals 0
    .param p1, "viewPort"    # Landroidx/camera/core/ViewPort;

    .line 112
    iput-object p1, p0, Landroidx/camera/core/UseCaseGroup$Builder;->mViewPort:Landroidx/camera/core/ViewPort;

    .line 113
    return-object p0
.end method
