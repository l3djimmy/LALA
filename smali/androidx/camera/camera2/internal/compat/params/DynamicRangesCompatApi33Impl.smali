.class Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompatApi33Impl;
.super Ljava/lang/Object;
.source "DynamicRangesCompatApi33Impl.java"

# interfaces
.implements Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat$DynamicRangeProfilesCompatImpl;


# instance fields
.field private final mDynamicRangeProfiles:Landroid/hardware/camera2/params/DynamicRangeProfiles;


# direct methods
.method constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .param p1, "dynamicRangeProfiles"    # Ljava/lang/Object;

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    move-object v0, p1

    check-cast v0, Landroid/hardware/camera2/params/DynamicRangeProfiles;

    iput-object v0, p0, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompatApi33Impl;->mDynamicRangeProfiles:Landroid/hardware/camera2/params/DynamicRangeProfiles;

    .line 37
    return-void
.end method

.method private dynamicRangeToFirstSupportedProfile(Landroidx/camera/core/DynamicRange;)Ljava/lang/Long;
    .locals 1
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 78
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompatApi33Impl;->mDynamicRangeProfiles:Landroid/hardware/camera2/params/DynamicRangeProfiles;

    invoke-static {p1, v0}, Landroidx/camera/camera2/internal/compat/params/DynamicRangeConversions;->dynamicRangeToFirstSupportedProfile(Landroidx/camera/core/DynamicRange;Landroid/hardware/camera2/params/DynamicRangeProfiles;)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method private static profileSetToDynamicRangeSet(Ljava/util/Set;)Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Long;",
            ">;)",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;"
        }
    .end annotation

    .line 84
    .local p0, "profileSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    return-object v0

    .line 87
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    .line 88
    .local v0, "dynamicRangeSet":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/DynamicRange;>;"
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 89
    .local v2, "profile":J
    invoke-static {v2, v3}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompatApi33Impl;->profileToDynamicRange(J)Landroidx/camera/core/DynamicRange;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 90
    .end local v2    # "profile":J
    goto :goto_0

    .line 91
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    return-object v1
.end method

.method private static profileToDynamicRange(J)Landroidx/camera/core/DynamicRange;
    .locals 3
    .param p0, "profile"    # J

    .line 72
    invoke-static {p0, p1}, Landroidx/camera/camera2/internal/compat/params/DynamicRangeConversions;->profileToDynamicRange(J)Landroidx/camera/core/DynamicRange;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Dynamic range profile cannot be converted to a DynamicRange object: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/DynamicRange;

    return-object v0
.end method


# virtual methods
.method public getDynamicRangeCaptureRequestConstraints(Landroidx/camera/core/DynamicRange;)Ljava/util/Set;
    .locals 4
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/DynamicRange;",
            ")",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;"
        }
    .end annotation

    .line 43
    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompatApi33Impl;->dynamicRangeToFirstSupportedProfile(Landroidx/camera/core/DynamicRange;)Ljava/lang/Long;

    move-result-object v0

    .line 44
    .local v0, "dynamicRangeProfile":Ljava/lang/Long;
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DynamicRange is not supported: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 46
    iget-object v1, p0, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompatApi33Impl;->mDynamicRangeProfiles:Landroid/hardware/camera2/params/DynamicRangeProfiles;

    .line 47
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Landroid/hardware/camera2/params/DynamicRangeProfiles;->getProfileCaptureRequestConstraints(J)Ljava/util/Set;

    move-result-object v1

    .line 46
    invoke-static {v1}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompatApi33Impl;->profileSetToDynamicRangeSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    return-object v1
.end method

.method public getSupportedDynamicRanges()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Landroidx/camera/core/DynamicRange;",
            ">;"
        }
    .end annotation

    .line 53
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompatApi33Impl;->mDynamicRangeProfiles:Landroid/hardware/camera2/params/DynamicRangeProfiles;

    invoke-virtual {v0}, Landroid/hardware/camera2/params/DynamicRangeProfiles;->getSupportedProfiles()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompatApi33Impl;->profileSetToDynamicRangeSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public isExtraLatencyPresent(Landroidx/camera/core/DynamicRange;)Z
    .locals 4
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 58
    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompatApi33Impl;->dynamicRangeToFirstSupportedProfile(Landroidx/camera/core/DynamicRange;)Ljava/lang/Long;

    move-result-object v0

    .line 59
    .local v0, "dynamicRangeProfile":Ljava/lang/Long;
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DynamicRange is not supported: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 61
    iget-object v1, p0, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompatApi33Impl;->mDynamicRangeProfiles:Landroid/hardware/camera2/params/DynamicRangeProfiles;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Landroid/hardware/camera2/params/DynamicRangeProfiles;->isExtraLatencyPresent(J)Z

    move-result v1

    return v1
.end method

.method public unwrap()Landroid/hardware/camera2/params/DynamicRangeProfiles;
    .locals 1

    .line 67
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompatApi33Impl;->mDynamicRangeProfiles:Landroid/hardware/camera2/params/DynamicRangeProfiles;

    return-object v0
.end method
