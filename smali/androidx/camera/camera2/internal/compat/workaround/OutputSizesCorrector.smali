.class public Landroidx/camera/camera2/internal/compat/workaround/OutputSizesCorrector;
.super Ljava/lang/Object;
.source "OutputSizesCorrector.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "OutputSizesCorrector"


# instance fields
.field private final mCameraId:Ljava/lang/String;

.field private final mExcludedSupportedSizesContainer:Landroidx/camera/camera2/internal/compat/workaround/ExcludedSupportedSizesContainer;

.field private final mExtraSupportedOutputSizeQuirk:Landroidx/camera/camera2/internal/compat/quirk/ExtraSupportedOutputSizeQuirk;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "cameraId"    # Ljava/lang/String;

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    const-class v0, Landroidx/camera/camera2/internal/compat/quirk/ExtraSupportedOutputSizeQuirk;

    .line 43
    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    check-cast v0, Landroidx/camera/camera2/internal/compat/quirk/ExtraSupportedOutputSizeQuirk;

    iput-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/OutputSizesCorrector;->mExtraSupportedOutputSizeQuirk:Landroidx/camera/camera2/internal/compat/quirk/ExtraSupportedOutputSizeQuirk;

    .line 51
    iput-object p1, p0, Landroidx/camera/camera2/internal/compat/workaround/OutputSizesCorrector;->mCameraId:Ljava/lang/String;

    .line 52
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/ExcludedSupportedSizesContainer;

    iget-object v1, p0, Landroidx/camera/camera2/internal/compat/workaround/OutputSizesCorrector;->mCameraId:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroidx/camera/camera2/internal/compat/workaround/ExcludedSupportedSizesContainer;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/OutputSizesCorrector;->mExcludedSupportedSizesContainer:Landroidx/camera/camera2/internal/compat/workaround/ExcludedSupportedSizesContainer;

    .line 53
    return-void
.end method

.method private addExtraSupportedOutputSizesByClass(Ljava/util/List;Ljava/lang/Class;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 109
    .local p1, "sizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local p2, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/OutputSizesCorrector;->mExtraSupportedOutputSizeQuirk:Landroidx/camera/camera2/internal/compat/quirk/ExtraSupportedOutputSizeQuirk;

    if-nez v0, :cond_0

    .line 110
    return-void

    .line 113
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/OutputSizesCorrector;->mExtraSupportedOutputSizeQuirk:Landroidx/camera/camera2/internal/compat/quirk/ExtraSupportedOutputSizeQuirk;

    invoke-virtual {v0, p2}, Landroidx/camera/camera2/internal/compat/quirk/ExtraSupportedOutputSizeQuirk;->getExtraSupportedResolutions(Ljava/lang/Class;)[Landroid/util/Size;

    move-result-object v0

    .line 115
    .local v0, "extraSizes":[Landroid/util/Size;
    array-length v1, v0

    if-lez v1, :cond_1

    .line 116
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 118
    :cond_1
    return-void
.end method

.method private addExtraSupportedOutputSizesByFormat(Ljava/util/List;I)V
    .locals 2
    .param p2, "format"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;I)V"
        }
    .end annotation

    .line 90
    .local p1, "sizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/OutputSizesCorrector;->mExtraSupportedOutputSizeQuirk:Landroidx/camera/camera2/internal/compat/quirk/ExtraSupportedOutputSizeQuirk;

    if-nez v0, :cond_0

    .line 91
    return-void

    .line 94
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/OutputSizesCorrector;->mExtraSupportedOutputSizeQuirk:Landroidx/camera/camera2/internal/compat/quirk/ExtraSupportedOutputSizeQuirk;

    invoke-virtual {v0, p2}, Landroidx/camera/camera2/internal/compat/quirk/ExtraSupportedOutputSizeQuirk;->getExtraSupportedResolutions(I)[Landroid/util/Size;

    move-result-object v0

    .line 96
    .local v0, "extraSizes":[Landroid/util/Size;
    array-length v1, v0

    if-lez v1, :cond_1

    .line 97
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 99
    :cond_1
    return-void
.end method

.method private excludeProblematicOutputSizesByClass(Ljava/util/List;Ljava/lang/Class;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 146
    .local p1, "sizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    .local p2, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/OutputSizesCorrector;->mExcludedSupportedSizesContainer:Landroidx/camera/camera2/internal/compat/workaround/ExcludedSupportedSizesContainer;

    invoke-virtual {v0, p2}, Landroidx/camera/camera2/internal/compat/workaround/ExcludedSupportedSizesContainer;->get(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 148
    .local v0, "excludedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 149
    return-void

    .line 152
    :cond_0
    invoke-interface {p1, v0}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 153
    return-void
.end method

.method private excludeProblematicOutputSizesByFormat(Ljava/util/List;I)V
    .locals 2
    .param p2, "format"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;I)V"
        }
    .end annotation

    .line 128
    .local p1, "sizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/workaround/OutputSizesCorrector;->mExcludedSupportedSizesContainer:Landroidx/camera/camera2/internal/compat/workaround/ExcludedSupportedSizesContainer;

    invoke-virtual {v0, p2}, Landroidx/camera/camera2/internal/compat/workaround/ExcludedSupportedSizesContainer;->get(I)Ljava/util/List;

    move-result-object v0

    .line 130
    .local v0, "excludedSizes":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 131
    return-void

    .line 134
    :cond_0
    invoke-interface {p1, v0}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 135
    return-void
.end method


# virtual methods
.method public applyQuirks([Landroid/util/Size;I)[Landroid/util/Size;
    .locals 3
    .param p1, "sizes"    # [Landroid/util/Size;
    .param p2, "format"    # I

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 61
    .local v0, "sizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-direct {p0, v0, p2}, Landroidx/camera/camera2/internal/compat/workaround/OutputSizesCorrector;->addExtraSupportedOutputSizesByFormat(Ljava/util/List;I)V

    .line 62
    invoke-direct {p0, v0, p2}, Landroidx/camera/camera2/internal/compat/workaround/OutputSizesCorrector;->excludeProblematicOutputSizesByFormat(Ljava/util/List;I)V

    .line 63
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 64
    const-string/jumbo v1, "OutputSizesCorrector"

    const-string/jumbo v2, "Sizes array becomes empty after excluding problematic output sizes."

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    :cond_0
    const/4 v1, 0x0

    new-array v1, v1, [Landroid/util/Size;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/util/Size;

    return-object v1
.end method

.method public applyQuirks([Landroid/util/Size;Ljava/lang/Class;)[Landroid/util/Size;
    .locals 3
    .param p1, "sizes"    # [Landroid/util/Size;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Landroid/util/Size;",
            "Ljava/lang/Class<",
            "TT;>;)[",
            "Landroid/util/Size;"
        }
    .end annotation

    .line 74
    .local p2, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 75
    .local v0, "sizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-direct {p0, v0, p2}, Landroidx/camera/camera2/internal/compat/workaround/OutputSizesCorrector;->addExtraSupportedOutputSizesByClass(Ljava/util/List;Ljava/lang/Class;)V

    .line 76
    invoke-direct {p0, v0, p2}, Landroidx/camera/camera2/internal/compat/workaround/OutputSizesCorrector;->excludeProblematicOutputSizesByClass(Ljava/util/List;Ljava/lang/Class;)V

    .line 77
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 78
    const-string/jumbo v1, "OutputSizesCorrector"

    const-string/jumbo v2, "Sizes array becomes empty after excluding problematic output sizes."

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    :cond_0
    const/4 v1, 0x0

    new-array v1, v1, [Landroid/util/Size;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/util/Size;

    return-object v1
.end method
