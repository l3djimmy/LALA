.class public Landroidx/camera/core/impl/utils/ResolutionSelectorUtil;
.super Ljava/lang/Object;
.source "ResolutionSelectorUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method

.method public static overrideResolutionSelectors(Landroidx/camera/core/resolutionselector/ResolutionSelector;Landroidx/camera/core/resolutionselector/ResolutionSelector;)Landroidx/camera/core/resolutionselector/ResolutionSelector;
    .locals 2
    .param p0, "baseResolutionSelector"    # Landroidx/camera/core/resolutionselector/ResolutionSelector;
    .param p1, "resolutionSelectorToOverride"    # Landroidx/camera/core/resolutionselector/ResolutionSelector;

    .line 45
    if-nez p1, :cond_0

    .line 46
    return-object p0

    .line 47
    :cond_0
    if-nez p0, :cond_1

    .line 48
    return-object p1

    .line 51
    :cond_1
    nop

    .line 52
    invoke-static {p0}, Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;->fromResolutionSelector(Landroidx/camera/core/resolutionselector/ResolutionSelector;)Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;

    move-result-object v0

    .line 54
    .local v0, "builder":Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;
    invoke-virtual {p1}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getAspectRatioStrategy()Landroidx/camera/core/resolutionselector/AspectRatioStrategy;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 55
    invoke-virtual {p1}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getAspectRatioStrategy()Landroidx/camera/core/resolutionselector/AspectRatioStrategy;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;->setAspectRatioStrategy(Landroidx/camera/core/resolutionselector/AspectRatioStrategy;)Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;

    .line 58
    :cond_2
    invoke-virtual {p1}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getResolutionStrategy()Landroidx/camera/core/resolutionselector/ResolutionStrategy;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 59
    invoke-virtual {p1}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getResolutionStrategy()Landroidx/camera/core/resolutionselector/ResolutionStrategy;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;->setResolutionStrategy(Landroidx/camera/core/resolutionselector/ResolutionStrategy;)Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;

    .line 62
    :cond_3
    invoke-virtual {p1}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getResolutionFilter()Landroidx/camera/core/resolutionselector/ResolutionFilter;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 63
    invoke-virtual {p1}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getResolutionFilter()Landroidx/camera/core/resolutionselector/ResolutionFilter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;->setResolutionFilter(Landroidx/camera/core/resolutionselector/ResolutionFilter;)Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;

    .line 66
    :cond_4
    invoke-virtual {p1}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getAllowedResolutionMode()I

    move-result v1

    if-eqz v1, :cond_5

    .line 68
    nop

    .line 69
    invoke-virtual {p1}, Landroidx/camera/core/resolutionselector/ResolutionSelector;->getAllowedResolutionMode()I

    move-result v1

    .line 68
    invoke-virtual {v0, v1}, Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;->setAllowedResolutionMode(I)Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;

    .line 72
    :cond_5
    invoke-virtual {v0}, Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;->build()Landroidx/camera/core/resolutionselector/ResolutionSelector;

    move-result-object v1

    return-object v1
.end method
