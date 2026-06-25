.class public final Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;
.super Landroidx/camera/core/impl/SessionConfig$BaseBuilder;
.source "SessionConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/impl/SessionConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ValidatingBuilder"
.end annotation


# static fields
.field private static final SUPPORTED_TEMPLATE_PRIORITY:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "ValidatingBuilder"


# instance fields
.field private final mSurfaceSorter:Landroidx/camera/core/internal/compat/workaround/SurfaceSorter;

.field private mTemplateSet:Z

.field private mValid:Z


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 713
    const/4 v0, 0x3

    new-array v1, v0, [Ljava/lang/Integer;

    .line 714
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v1, v4

    .line 717
    const/4 v3, 0x5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    .line 718
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v2, 0x2

    aput-object v0, v1, v2

    .line 713
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->SUPPORTED_TEMPLATE_PRIORITY:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 710
    invoke-direct {p0}, Landroidx/camera/core/impl/SessionConfig$BaseBuilder;-><init>()V

    .line 722
    new-instance v0, Landroidx/camera/core/internal/compat/workaround/SurfaceSorter;

    invoke-direct {v0}, Landroidx/camera/core/internal/compat/workaround/SurfaceSorter;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mSurfaceSorter:Landroidx/camera/core/internal/compat/workaround/SurfaceSorter;

    .line 723
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mValid:Z

    .line 724
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mTemplateSet:Z

    return-void
.end method

.method private getSurfaces()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;"
        }
    .end annotation

    .line 814
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 815
    .local v0, "surfaces":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    iget-object v1, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mOutputConfigs:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/SessionConfig$OutputConfig;

    .line 816
    .local v2, "outputConfig":Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    invoke-virtual {v2}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 817
    invoke-virtual {v2}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSharedSurfaces()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/DeferrableSurface;

    .line 818
    .local v4, "sharedSurface":Landroidx/camera/core/impl/DeferrableSurface;
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 819
    .end local v4    # "sharedSurface":Landroidx/camera/core/impl/DeferrableSurface;
    goto :goto_1

    .line 820
    .end local v2    # "outputConfig":Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    :cond_0
    goto :goto_0

    .line 821
    :cond_1
    return-object v0
.end method

.method private selectTemplateType(II)I
    .locals 3
    .param p1, "type1"    # I
    .param p2, "type2"    # I

    .line 860
    sget-object v0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->SUPPORTED_TEMPLATE_PRIORITY:Ljava/util/List;

    .line 859
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    sget-object v1, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->SUPPORTED_TEMPLATE_PRIORITY:Ljava/util/List;

    .line 860
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    if-lt v0, v1, :cond_0

    move v0, p1

    goto :goto_0

    :cond_0
    move v0, p2

    .line 859
    :goto_0
    return v0
.end method

.method private setOrVerifyExpectFrameRateRange(Landroid/util/Range;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 797
    .local p1, "expectedFrameRateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    sget-object v0, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-virtual {p1, v0}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 798
    return-void

    .line 801
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v0}, Landroidx/camera/core/impl/CaptureConfig$Builder;->getExpectedFrameRateRange()Landroid/util/Range;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-virtual {v0, v1}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 803
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setExpectedFrameRateRange(Landroid/util/Range;)V

    .line 804
    return-void

    .line 807
    :cond_1
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v0}, Landroidx/camera/core/impl/CaptureConfig$Builder;->getExpectedFrameRateRange()Landroid/util/Range;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 808
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mValid:Z

    .line 809
    const-string/jumbo v0, "ValidatingBuilder"

    const-string v1, "Different ExpectedFrameRateRange values"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 811
    :cond_2
    return-void
.end method


# virtual methods
.method public add(Landroidx/camera/core/impl/SessionConfig;)V
    .locals 4
    .param p1, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;

    .line 740
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCaptureConfig()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v0

    .line 743
    .local v0, "captureConfig":Landroidx/camera/core/impl/CaptureConfig;
    invoke-virtual {v0}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 744
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mTemplateSet:Z

    .line 745
    iget-object v1, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    .line 746
    invoke-virtual {v0}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v2

    iget-object v3, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    .line 747
    invoke-virtual {v3}, Landroidx/camera/core/impl/CaptureConfig$Builder;->getTemplateType()I

    move-result v3

    .line 746
    invoke-direct {p0, v2, v3}, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->selectTemplateType(II)I

    move-result v2

    .line 745
    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setTemplateType(I)V

    .line 750
    :cond_0
    invoke-virtual {v0}, Landroidx/camera/core/impl/CaptureConfig;->getExpectedFrameRateRange()Landroid/util/Range;

    move-result-object v1

    invoke-direct {p0, v1}, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->setOrVerifyExpectFrameRateRange(Landroid/util/Range;)V

    .line 752
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCaptureConfig()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/camera/core/impl/CaptureConfig;->getTagBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v1

    .line 753
    .local v1, "tagBundle":Landroidx/camera/core/impl/TagBundle;
    iget-object v2, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v2, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addAllTags(Landroidx/camera/core/impl/TagBundle;)V

    .line 756
    iget-object v2, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mDeviceStateCallbacks:Ljava/util/List;

    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getDeviceStateCallbacks()Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 759
    iget-object v2, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mSessionStateCallbacks:Ljava/util/List;

    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getSessionStateCallbacks()Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 762
    iget-object v2, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    .line 763
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCameraCaptureCallbacks()Ljava/util/List;

    move-result-object v3

    .line 762
    invoke-virtual {v2, v3}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addAllCameraCaptureCallbacks(Ljava/util/Collection;)V

    .line 766
    iget-object v2, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mSingleCameraCaptureCallbacks:Ljava/util/List;

    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getSingleCameraCaptureCallbacks()Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 768
    iget-object v2, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mErrorListeners:Ljava/util/List;

    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getErrorListeners()Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 771
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getInputConfiguration()Landroid/hardware/camera2/params/InputConfiguration;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 772
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getInputConfiguration()Landroid/hardware/camera2/params/InputConfiguration;

    move-result-object v2

    iput-object v2, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mInputConfiguration:Landroid/hardware/camera2/params/InputConfiguration;

    .line 776
    :cond_1
    iget-object v2, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mOutputConfigs:Ljava/util/Set;

    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getOutputConfigs()Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 779
    iget-object v2, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v2}, Landroidx/camera/core/impl/CaptureConfig$Builder;->getSurfaces()Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v0}, Landroidx/camera/core/impl/CaptureConfig;->getSurfaces()Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 781
    invoke-direct {p0}, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->getSurfaces()Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v3}, Landroidx/camera/core/impl/CaptureConfig$Builder;->getSurfaces()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->containsAll(Ljava/util/Collection;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 782
    const-string v2, "Invalid configuration due to capture request surfaces are not a subset of surfaces"

    .line 785
    .local v2, "errorMessage":Ljava/lang/String;
    const-string/jumbo v3, "ValidatingBuilder"

    invoke-static {v3, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 786
    const/4 v3, 0x0

    iput-boolean v3, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mValid:Z

    .line 791
    .end local v2    # "errorMessage":Ljava/lang/String;
    :cond_2
    iget-object v2, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    .line 792
    invoke-virtual {v0}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v3

    .line 791
    invoke-virtual {v2, v3}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)V

    .line 793
    return-void
.end method

.method public addImplementationOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/camera/core/impl/Config$Option<",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 732
    .local p1, "option":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<TT;>;"
    .local p2, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v0, p1, p2}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addImplementationOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 733
    return-void
.end method

.method public build()Landroidx/camera/core/impl/SessionConfig;
    .locals 10

    .line 841
    iget-boolean v0, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mValid:Z

    if-eqz v0, :cond_0

    .line 845
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mOutputConfigs:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v3, v0

    .line 846
    .local v3, "outputConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SessionConfig$OutputConfig;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mSurfaceSorter:Landroidx/camera/core/internal/compat/workaround/SurfaceSorter;

    invoke-virtual {v0, v3}, Landroidx/camera/core/internal/compat/workaround/SurfaceSorter;->sort(Ljava/util/List;)V

    .line 848
    new-instance v2, Landroidx/camera/core/impl/SessionConfig;

    new-instance v4, Ljava/util/ArrayList;

    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mDeviceStateCallbacks:Ljava/util/List;

    invoke-direct {v4, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v5, Ljava/util/ArrayList;

    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mSessionStateCallbacks:Ljava/util/List;

    invoke-direct {v5, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v6, Ljava/util/ArrayList;

    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mSingleCameraCaptureCallbacks:Ljava/util/List;

    invoke-direct {v6, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v7, Ljava/util/ArrayList;

    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mErrorListeners:Ljava/util/List;

    invoke-direct {v7, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    .line 854
    invoke-virtual {v0}, Landroidx/camera/core/impl/CaptureConfig$Builder;->build()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v8

    iget-object v9, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mInputConfiguration:Landroid/hardware/camera2/params/InputConfiguration;

    invoke-direct/range {v2 .. v9}, Landroidx/camera/core/impl/SessionConfig;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Landroidx/camera/core/impl/CaptureConfig;Landroid/hardware/camera2/params/InputConfiguration;)V

    .line 848
    return-object v2

    .line 842
    .end local v3    # "outputConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SessionConfig$OutputConfig;>;"
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Unsupported session configuration combination"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public clearSurfaces()V
    .locals 1

    .line 826
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mOutputConfigs:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 827
    iget-object v0, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mCaptureConfigBuilder:Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-virtual {v0}, Landroidx/camera/core/impl/CaptureConfig$Builder;->clearSurfaces()V

    .line 828
    return-void
.end method

.method public isValid()Z
    .locals 1

    .line 832
    iget-boolean v0, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mTemplateSet:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->mValid:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
