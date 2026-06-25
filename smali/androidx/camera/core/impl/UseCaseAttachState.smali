.class public final Landroidx/camera/core/impl/UseCaseAttachState;
.super Ljava/lang/Object;
.source "UseCaseAttachState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;,
        Landroidx/camera/core/impl/UseCaseAttachState$AttachStateFilter;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "UseCaseAttachState"


# instance fields
.field private final mAttachedUseCasesToInfoMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mCameraId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "cameraId"    # Ljava/lang/String;

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mAttachedUseCasesToInfoMap:Ljava/util/Map;

    .line 49
    iput-object p1, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mCameraId:Ljava/lang/String;

    .line 50
    return-void
.end method

.method private getOrCreateUseCaseAttachInfo(Ljava/lang/String;Landroidx/camera/core/impl/SessionConfig;Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;
    .locals 2
    .param p1, "useCaseId"    # Ljava/lang/String;
    .param p2, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroidx/camera/core/impl/SessionConfig;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;)",
            "Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;"
        }
    .end annotation

    .line 213
    .local p3, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    iget-object v0, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mAttachedUseCasesToInfoMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;

    .line 214
    .local v0, "useCaseAttachInfo":Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;
    if-nez v0, :cond_0

    .line 215
    new-instance v1, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;

    invoke-direct {v1, p2, p3}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;-><init>(Landroidx/camera/core/impl/SessionConfig;Landroidx/camera/core/impl/UseCaseConfig;)V

    move-object v0, v1

    .line 216
    iget-object v1, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mAttachedUseCasesToInfoMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    :cond_0
    return-object v0
.end method

.method private getSessionConfigs(Landroidx/camera/core/impl/UseCaseAttachState$AttachStateFilter;)Ljava/util/Collection;
    .locals 4
    .param p1, "attachStateFilter"    # Landroidx/camera/core/impl/UseCaseAttachState$AttachStateFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/UseCaseAttachState$AttachStateFilter;",
            ")",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/impl/SessionConfig;",
            ">;"
        }
    .end annotation

    .line 222
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 224
    .local v0, "sessionConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SessionConfig;>;"
    iget-object v1, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mAttachedUseCasesToInfoMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 225
    .local v2, "attachedUseCase":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;>;"
    if-eqz p1, :cond_0

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;

    invoke-interface {p1, v3}, Landroidx/camera/core/impl/UseCaseAttachState$AttachStateFilter;->filter(Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 226
    :cond_0
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;

    invoke-virtual {v3}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->getSessionConfig()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 228
    .end local v2    # "attachedUseCase":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;>;"
    :cond_1
    goto :goto_0

    .line 229
    :cond_2
    return-object v0
.end method

.method private getUseCaseConfigs(Landroidx/camera/core/impl/UseCaseAttachState$AttachStateFilter;)Ljava/util/Collection;
    .locals 4
    .param p1, "attachStateFilter"    # Landroidx/camera/core/impl/UseCaseAttachState$AttachStateFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/UseCaseAttachState$AttachStateFilter;",
            ")",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;"
        }
    .end annotation

    .line 233
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 235
    .local v0, "useCaseConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/UseCaseConfig<*>;>;"
    iget-object v1, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mAttachedUseCasesToInfoMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 236
    .local v2, "attachedUseCase":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;>;"
    if-eqz p1, :cond_0

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;

    invoke-interface {p1, v3}, Landroidx/camera/core/impl/UseCaseAttachState$AttachStateFilter;->filter(Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 237
    :cond_0
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;

    invoke-virtual {v3}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->getUseCaseConfig()Landroidx/camera/core/impl/UseCaseConfig;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 239
    .end local v2    # "attachedUseCase":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;>;"
    :cond_1
    goto :goto_0

    .line 240
    :cond_2
    return-object v0
.end method

.method static synthetic lambda$getActiveAndAttachedSessionConfigs$2(Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;)Z
    .locals 1
    .param p0, "useCaseAttachInfo"    # Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;

    .line 138
    invoke-virtual {p0}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->getActive()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->getAttached()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static synthetic lambda$getAttachedSessionConfigs$1(Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;)Z
    .locals 1
    .param p0, "useCaseAttachInfo"    # Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;

    .line 131
    invoke-virtual {p0}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->getAttached()Z

    move-result v0

    return v0
.end method

.method static synthetic lambda$getAttachedUseCaseConfigs$0(Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;)Z
    .locals 1
    .param p0, "useCaseAttachInfo"    # Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;

    .line 125
    invoke-virtual {p0}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->getAttached()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public getActiveAndAttachedBuilder()Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;
    .locals 7

    .line 175
    new-instance v0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;

    invoke-direct {v0}, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;-><init>()V

    .line 177
    .local v0, "validatingBuilder":Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 179
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v2, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mAttachedUseCasesToInfoMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 180
    .local v3, "attachedUseCase":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;

    .line 181
    .local v4, "useCaseAttachInfo":Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;
    invoke-virtual {v4}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->getActive()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v4}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->getAttached()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 182
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 183
    .local v5, "useCaseId":Ljava/lang/String;
    invoke-virtual {v4}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->getSessionConfig()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->add(Landroidx/camera/core/impl/SessionConfig;)V

    .line 184
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    .end local v3    # "attachedUseCase":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;>;"
    .end local v4    # "useCaseAttachInfo":Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;
    .end local v5    # "useCaseId":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 187
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Active and attached use case: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " for camera: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mCameraId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "UseCaseAttachState"

    invoke-static {v3, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    return-object v0
.end method

.method public getActiveAndAttachedSessionConfigs()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/impl/SessionConfig;",
            ">;"
        }
    .end annotation

    .line 136
    new-instance v0, Landroidx/camera/core/impl/UseCaseAttachState$$ExternalSyntheticLambda2;

    invoke-direct {v0}, Landroidx/camera/core/impl/UseCaseAttachState$$ExternalSyntheticLambda2;-><init>()V

    .line 137
    invoke-direct {p0, v0}, Landroidx/camera/core/impl/UseCaseAttachState;->getSessionConfigs(Landroidx/camera/core/impl/UseCaseAttachState$AttachStateFilter;)Ljava/util/Collection;

    move-result-object v0

    .line 136
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getAttachedBuilder()Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;
    .locals 6

    .line 194
    new-instance v0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;

    invoke-direct {v0}, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;-><init>()V

    .line 195
    .local v0, "validatingBuilder":Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 197
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v2, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mAttachedUseCasesToInfoMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 198
    .local v3, "attachedUseCase":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;

    .line 199
    .local v4, "useCaseAttachInfo":Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;
    invoke-virtual {v4}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->getAttached()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 200
    invoke-virtual {v4}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->getSessionConfig()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->add(Landroidx/camera/core/impl/SessionConfig;)V

    .line 201
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 202
    .local v5, "useCaseId":Ljava/lang/String;
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    .end local v3    # "attachedUseCase":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;>;"
    .end local v4    # "useCaseAttachInfo":Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;
    .end local v5    # "useCaseId":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 205
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "All use case: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " for camera: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mCameraId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "UseCaseAttachState"

    invoke-static {v3, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    return-object v0
.end method

.method public getAttachedSessionConfigs()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/impl/SessionConfig;",
            ">;"
        }
    .end annotation

    .line 130
    new-instance v0, Landroidx/camera/core/impl/UseCaseAttachState$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Landroidx/camera/core/impl/UseCaseAttachState$$ExternalSyntheticLambda0;-><init>()V

    .line 131
    invoke-direct {p0, v0}, Landroidx/camera/core/impl/UseCaseAttachState;->getSessionConfigs(Landroidx/camera/core/impl/UseCaseAttachState$AttachStateFilter;)Ljava/util/Collection;

    move-result-object v0

    .line 130
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getAttachedUseCaseConfigs()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;>;"
        }
    .end annotation

    .line 124
    new-instance v0, Landroidx/camera/core/impl/UseCaseAttachState$$ExternalSyntheticLambda1;

    invoke-direct {v0}, Landroidx/camera/core/impl/UseCaseAttachState$$ExternalSyntheticLambda1;-><init>()V

    .line 125
    invoke-direct {p0, v0}, Landroidx/camera/core/impl/UseCaseAttachState;->getUseCaseConfigs(Landroidx/camera/core/impl/UseCaseAttachState$AttachStateFilter;)Ljava/util/Collection;

    move-result-object v0

    .line 124
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public isUseCaseAttached(Ljava/lang/String;)Z
    .locals 2
    .param p1, "useCaseId"    # Ljava/lang/String;

    .line 114
    iget-object v0, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mAttachedUseCasesToInfoMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 115
    const/4 v0, 0x0

    return v0

    .line 118
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mAttachedUseCasesToInfoMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;

    .line 119
    .local v0, "useCaseAttachInfo":Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;
    invoke-virtual {v0}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->getAttached()Z

    move-result v1

    return v1
.end method

.method public removeUseCase(Ljava/lang/String;)V
    .locals 1
    .param p1, "useCaseId"    # Ljava/lang/String;

    .line 169
    iget-object v0, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mAttachedUseCasesToInfoMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    return-void
.end method

.method public setUseCaseActive(Ljava/lang/String;Landroidx/camera/core/impl/SessionConfig;Landroidx/camera/core/impl/UseCaseConfig;)V
    .locals 2
    .param p1, "useCaseId"    # Ljava/lang/String;
    .param p2, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroidx/camera/core/impl/SessionConfig;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;)V"
        }
    .end annotation

    .line 61
    .local p3, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-direct {p0, p1, p2, p3}, Landroidx/camera/core/impl/UseCaseAttachState;->getOrCreateUseCaseAttachInfo(Ljava/lang/String;Landroidx/camera/core/impl/SessionConfig;Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;

    move-result-object v0

    .line 63
    .local v0, "useCaseAttachInfo":Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->setActive(Z)V

    .line 64
    return-void
.end method

.method public setUseCaseAttached(Ljava/lang/String;Landroidx/camera/core/impl/SessionConfig;Landroidx/camera/core/impl/UseCaseConfig;)V
    .locals 2
    .param p1, "useCaseId"    # Ljava/lang/String;
    .param p2, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroidx/camera/core/impl/SessionConfig;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;)V"
        }
    .end annotation

    .line 91
    .local p3, "userCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    invoke-direct {p0, p1, p2, p3}, Landroidx/camera/core/impl/UseCaseAttachState;->getOrCreateUseCaseAttachInfo(Ljava/lang/String;Landroidx/camera/core/impl/SessionConfig;Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;

    move-result-object v0

    .line 93
    .local v0, "useCaseAttachInfo":Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->setAttached(Z)V

    .line 94
    return-void
.end method

.method public setUseCaseDetached(Ljava/lang/String;)V
    .locals 2
    .param p1, "useCaseId"    # Ljava/lang/String;

    .line 102
    iget-object v0, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mAttachedUseCasesToInfoMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 103
    return-void

    .line 105
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mAttachedUseCasesToInfoMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;

    .line 106
    .local v0, "useCaseAttachInfo":Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->setAttached(Z)V

    .line 107
    invoke-virtual {v0}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->getActive()Z

    move-result v1

    if-nez v1, :cond_1

    .line 108
    iget-object v1, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mAttachedUseCasesToInfoMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    :cond_1
    return-void
.end method

.method public setUseCaseInactive(Ljava/lang/String;)V
    .locals 2
    .param p1, "useCaseId"    # Ljava/lang/String;

    .line 72
    iget-object v0, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mAttachedUseCasesToInfoMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 73
    return-void

    .line 76
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mAttachedUseCasesToInfoMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;

    .line 77
    .local v0, "useCaseAttachInfo":Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->setActive(Z)V

    .line 78
    invoke-virtual {v0}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->getAttached()Z

    move-result v1

    if-nez v1, :cond_1

    .line 79
    iget-object v1, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mAttachedUseCasesToInfoMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    :cond_1
    return-void
.end method

.method public updateUseCase(Ljava/lang/String;Landroidx/camera/core/impl/SessionConfig;Landroidx/camera/core/impl/UseCaseConfig;)V
    .locals 3
    .param p1, "useCaseId"    # Ljava/lang/String;
    .param p2, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroidx/camera/core/impl/SessionConfig;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;)V"
        }
    .end annotation

    .line 150
    .local p3, "useCaseConfig":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    iget-object v0, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mAttachedUseCasesToInfoMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 151
    return-void

    .line 155
    :cond_0
    new-instance v0, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;

    invoke-direct {v0, p2, p3}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;-><init>(Landroidx/camera/core/impl/SessionConfig;Landroidx/camera/core/impl/UseCaseConfig;)V

    .line 159
    .local v0, "newUseCaseAttachInfo":Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;
    iget-object v1, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mAttachedUseCasesToInfoMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;

    .line 160
    .local v1, "oldUseCaseAttachInfo":Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;
    invoke-virtual {v1}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->getAttached()Z

    move-result v2

    invoke-virtual {v0, v2}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->setAttached(Z)V

    .line 161
    invoke-virtual {v1}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->getActive()Z

    move-result v2

    invoke-virtual {v0, v2}, Landroidx/camera/core/impl/UseCaseAttachState$UseCaseAttachInfo;->setActive(Z)V

    .line 162
    iget-object v2, p0, Landroidx/camera/core/impl/UseCaseAttachState;->mAttachedUseCasesToInfoMap:Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    return-void
.end method
