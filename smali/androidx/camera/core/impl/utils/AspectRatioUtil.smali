.class public final Landroidx/camera/core/impl/utils/AspectRatioUtil;
.super Ljava/lang/Object;
.source "AspectRatioUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/utils/AspectRatioUtil$CompareAspectRatiosByMappingAreaInFullFovAspectRatioSpace;
    }
.end annotation


# static fields
.field private static final ALIGN16:I = 0x10

.field public static final ASPECT_RATIO_16_9:Landroid/util/Rational;

.field public static final ASPECT_RATIO_3_4:Landroid/util/Rational;

.field public static final ASPECT_RATIO_4_3:Landroid/util/Rational;

.field public static final ASPECT_RATIO_9_16:Landroid/util/Rational;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 38
    new-instance v0, Landroid/util/Rational;

    const/4 v1, 0x4

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Landroid/util/Rational;-><init>(II)V

    sput-object v0, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    .line 39
    new-instance v0, Landroid/util/Rational;

    invoke-direct {v0, v2, v1}, Landroid/util/Rational;-><init>(II)V

    sput-object v0, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_3_4:Landroid/util/Rational;

    .line 40
    new-instance v0, Landroid/util/Rational;

    const/16 v1, 0x10

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Landroid/util/Rational;-><init>(II)V

    sput-object v0, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    .line 41
    new-instance v0, Landroid/util/Rational;

    invoke-direct {v0, v2, v1}, Landroid/util/Rational;-><init>(II)V

    sput-object v0, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_9_16:Landroid/util/Rational;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    return-void
.end method

.method public static hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z
    .locals 1
    .param p0, "resolution"    # Landroid/util/Size;
    .param p1, "aspectRatio"    # Landroid/util/Rational;

    .line 59
    sget-object v0, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_VGA:Landroid/util/Size;

    invoke-static {p0, p1, v0}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;Landroid/util/Size;)Z

    move-result v0

    return v0
.end method

.method public static hasMatchingAspectRatio(Landroid/util/Size;Landroid/util/Rational;Landroid/util/Size;)Z
    .locals 4
    .param p0, "resolution"    # Landroid/util/Size;
    .param p1, "aspectRatio"    # Landroid/util/Rational;
    .param p2, "mod16ResolutionLowerBound"    # Landroid/util/Size;

    .line 70
    const/4 v0, 0x0

    .line 71
    .local v0, "isMatch":Z
    if-nez p1, :cond_0

    .line 72
    const/4 v0, 0x0

    goto :goto_0

    .line 73
    :cond_0
    new-instance v1, Landroid/util/Rational;

    .line 74
    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/util/Rational;-><init>(II)V

    .line 73
    invoke-virtual {p1, v1}, Landroid/util/Rational;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 75
    const/4 v0, 0x1

    goto :goto_0

    .line 76
    :cond_1
    invoke-static {p0}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v1

    invoke-static {p2}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v2

    if-lt v1, v2, :cond_2

    .line 77
    invoke-static {p0, p1}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->isPossibleMod16FromAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z

    move-result v0

    .line 79
    :cond_2
    :goto_0
    return v0
.end method

.method private static isPossibleMod16FromAspectRatio(Landroid/util/Size;Landroid/util/Rational;)Z
    .locals 5
    .param p0, "resolution"    # Landroid/util/Size;
    .param p1, "aspectRatio"    # Landroid/util/Rational;

    .line 94
    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v0

    .line 95
    .local v0, "width":I
    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v1

    .line 97
    .local v1, "height":I
    new-instance v2, Landroid/util/Rational;

    invoke-virtual {p1}, Landroid/util/Rational;->getDenominator()I

    move-result v3

    .line 98
    invoke-virtual {p1}, Landroid/util/Rational;->getNumerator()I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/util/Rational;-><init>(II)V

    .line 99
    .local v2, "invAspectRatio":Landroid/util/Rational;
    rem-int/lit8 v3, v0, 0x10

    const/4 v4, 0x0

    if-nez v3, :cond_2

    rem-int/lit8 v3, v1, 0x10

    if-nez v3, :cond_2

    .line 100
    add-int/lit8 v3, v1, -0x10

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {v3, v0, p1}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ratioIntersectsMod16Segment(IILandroid/util/Rational;)Z

    move-result v3

    if-nez v3, :cond_0

    add-int/lit8 v3, v0, -0x10

    .line 101
    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {v3, v1, v2}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ratioIntersectsMod16Segment(IILandroid/util/Rational;)Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    const/4 v4, 0x1

    .line 100
    :cond_1
    return v4

    .line 103
    :cond_2
    rem-int/lit8 v3, v0, 0x10

    if-nez v3, :cond_3

    .line 104
    invoke-static {v1, v0, p1}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ratioIntersectsMod16Segment(IILandroid/util/Rational;)Z

    move-result v3

    return v3

    .line 105
    :cond_3
    rem-int/lit8 v3, v1, 0x10

    if-nez v3, :cond_4

    .line 106
    invoke-static {v0, v1, v2}, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ratioIntersectsMod16Segment(IILandroid/util/Rational;)Z

    move-result v3

    return v3

    .line 108
    :cond_4
    return v4
.end method

.method private static ratioIntersectsMod16Segment(IILandroid/util/Rational;)Z
    .locals 7
    .param p0, "height"    # I
    .param p1, "mod16Width"    # I
    .param p2, "aspectRatio"    # Landroid/util/Rational;

    .line 113
    rem-int/lit8 v0, p1, 0x10

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 114
    nop

    .line 115
    invoke-virtual {p2}, Landroid/util/Rational;->getNumerator()I

    move-result v0

    mul-int/2addr v0, p0

    int-to-double v3, v0

    invoke-virtual {p2}, Landroid/util/Rational;->getDenominator()I

    move-result v0

    int-to-double v5, v0

    div-double/2addr v3, v5

    .line 116
    .local v3, "aspectRatioWidth":D
    add-int/lit8 v0, p1, -0x10

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-double v5, v0

    cmpl-double v0, v3, v5

    if-lez v0, :cond_1

    add-int/lit8 v0, p1, 0x10

    int-to-double v5, v0

    cmpg-double v0, v3, v5

    if-gez v0, :cond_1

    goto :goto_1

    :cond_1
    move v1, v2

    :goto_1
    return v1
.end method
