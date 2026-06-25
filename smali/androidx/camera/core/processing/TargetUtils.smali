.class public Landroidx/camera/core/processing/TargetUtils;
.super Ljava/lang/Object;
.source "TargetUtils.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method public static checkSupportedTargets(Ljava/util/Collection;I)V
    .locals 4
    .param p1, "targets"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/Integer;",
            ">;I)V"
        }
    .end annotation

    .line 63
    .local p0, "supportedTargets":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Integer;>;"
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 65
    invoke-static {p1}, Landroidx/camera/core/processing/TargetUtils;->getHumanReadableName(I)Ljava/lang/String;

    move-result-object v2

    .line 66
    invoke-static {p0}, Landroidx/camera/core/processing/TargetUtils;->getHumanReadableNames(Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    .line 63
    const-string v3, "Effects target %s is not in the supported list %s."

    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 67
    return-void
.end method

.method public static getHumanReadableName(I)Ljava/lang/String;
    .locals 2
    .param p0, "target"    # I

    .line 83
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .local v0, "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    and-int/lit8 v1, p0, 0x4

    if-eqz v1, :cond_0

    .line 85
    const-string v1, "IMAGE_CAPTURE"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    :cond_0
    and-int/lit8 v1, p0, 0x1

    if-eqz v1, :cond_1

    .line 88
    const-string/jumbo v1, "PREVIEW"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    :cond_1
    and-int/lit8 v1, p0, 0x2

    if-eqz v1, :cond_2

    .line 91
    const-string/jumbo v1, "VIDEO_CAPTURE"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    :cond_2
    const-string/jumbo v1, "|"

    invoke-static {v1, v0}, Ljava/lang/String;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static getHumanReadableNames(Ljava/util/Collection;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 71
    .local p0, "targets":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Integer;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 72
    .local v0, "targetNameList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 73
    .local v2, "target":Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3}, Landroidx/camera/core/processing/TargetUtils;->getHumanReadableName(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    .end local v2    # "target":Ljava/lang/Integer;
    goto :goto_0

    .line 75
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-static {v2, v0}, Ljava/lang/String;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getNumberOfTargets(I)I
    .locals 2
    .param p0, "targets"    # I

    .line 43
    const/4 v0, 0x0

    .line 44
    .local v0, "count":I
    :goto_0
    if-eqz p0, :cond_0

    .line 45
    and-int/lit8 v1, p0, 0x1

    add-int/2addr v0, v1

    .line 46
    shr-int/lit8 p0, p0, 0x1

    goto :goto_0

    .line 48
    :cond_0
    return v0
.end method

.method public static isSuperset(II)Z
    .locals 1
    .param p0, "superset"    # I
    .param p1, "subset"    # I

    .line 55
    and-int v0, p0, p1

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
