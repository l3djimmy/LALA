.class public final Landroidx/camera/core/internal/utils/SizeUtil;
.super Ljava/lang/Object;
.source "SizeUtil.java"


# static fields
.field public static final RESOLUTION_1080P:Landroid/util/Size;

.field public static final RESOLUTION_1440P:Landroid/util/Size;

.field public static final RESOLUTION_480P:Landroid/util/Size;

.field public static final RESOLUTION_720P:Landroid/util/Size;

.field public static final RESOLUTION_QVGA:Landroid/util/Size;

.field public static final RESOLUTION_VGA:Landroid/util/Size;

.field public static final RESOLUTION_ZERO:Landroid/util/Size;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 34
    new-instance v0, Landroid/util/Size;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Landroid/util/Size;-><init>(II)V

    sput-object v0, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_ZERO:Landroid/util/Size;

    .line 35
    new-instance v0, Landroid/util/Size;

    const/16 v1, 0x140

    const/16 v2, 0xf0

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    sput-object v0, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_QVGA:Landroid/util/Size;

    .line 36
    new-instance v0, Landroid/util/Size;

    const/16 v1, 0x280

    const/16 v2, 0x1e0

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    sput-object v0, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_VGA:Landroid/util/Size;

    .line 37
    new-instance v0, Landroid/util/Size;

    const/16 v1, 0x2d0

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    sput-object v0, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_480P:Landroid/util/Size;

    .line 38
    new-instance v0, Landroid/util/Size;

    const/16 v2, 0x500

    invoke-direct {v0, v2, v1}, Landroid/util/Size;-><init>(II)V

    sput-object v0, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_720P:Landroid/util/Size;

    .line 39
    new-instance v0, Landroid/util/Size;

    const/16 v1, 0x438

    const/16 v2, 0x780

    invoke-direct {v0, v2, v1}, Landroid/util/Size;-><init>(II)V

    sput-object v0, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_1080P:Landroid/util/Size;

    .line 40
    new-instance v0, Landroid/util/Size;

    const/16 v1, 0x5a0

    invoke-direct {v0, v2, v1}, Landroid/util/Size;-><init>(II)V

    sput-object v0, Landroidx/camera/core/internal/utils/SizeUtil;->RESOLUTION_1440P:Landroid/util/Size;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    return-void
.end method

.method public static getArea(Landroid/util/Size;)I
    .locals 2
    .param p0, "size"    # Landroid/util/Size;

    .line 49
    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v1

    mul-int/2addr v0, v1

    return v0
.end method

.method public static getMaxSize(Ljava/util/List;)Landroid/util/Size;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;)",
            "Landroid/util/Size;"
        }
    .end annotation

    .line 75
    .local p0, "sizeList":Ljava/util/List;, "Ljava/util/List<Landroid/util/Size;>;"
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    const/4 v0, 0x0

    return-object v0

    .line 79
    :cond_0
    new-instance v0, Landroidx/camera/core/impl/utils/CompareSizesByArea;

    invoke-direct {v0}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>()V

    invoke-static {p0, v0}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Size;

    return-object v0
.end method

.method public static isLongerInAnyEdge(Landroid/util/Size;Landroid/util/Size;)Z
    .locals 2
    .param p0, "sourceSize"    # Landroid/util/Size;
    .param p1, "targetSize"    # Landroid/util/Size;

    .line 65
    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v1

    if-gt v0, v1, :cond_1

    .line 66
    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v0

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v1

    if-le v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 65
    :goto_1
    return v0
.end method

.method public static isSmallerByArea(Landroid/util/Size;Landroid/util/Size;)Z
    .locals 2
    .param p0, "sourceSize"    # Landroid/util/Size;
    .param p1, "targetSize"    # Landroid/util/Size;

    .line 57
    invoke-static {p0}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v0

    invoke-static {p1}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(Landroid/util/Size;)I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
