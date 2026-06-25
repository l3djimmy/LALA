.class public final Landroidx/camera/core/impl/utils/CompareSizesByArea;
.super Ljava/lang/Object;
.source "CompareSizesByArea.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Landroid/util/Size;",
        ">;"
    }
.end annotation


# instance fields
.field private mReverse:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 33
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroidx/camera/core/impl/utils/CompareSizesByArea;-><init>(Z)V

    .line 34
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1
    .param p1, "reverse"    # Z

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/core/impl/utils/CompareSizesByArea;->mReverse:Z

    .line 38
    iput-boolean p1, p0, Landroidx/camera/core/impl/utils/CompareSizesByArea;->mReverse:Z

    .line 39
    return-void
.end method


# virtual methods
.method public compare(Landroid/util/Size;Landroid/util/Size;)I
    .locals 6
    .param p1, "lhs"    # Landroid/util/Size;
    .param p2, "rhs"    # Landroid/util/Size;

    .line 44
    nop

    .line 46
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v2

    int-to-long v2, v2

    mul-long/2addr v0, v2

    .line 47
    invoke-virtual {p2}, Landroid/util/Size;->getWidth()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {p2}, Landroid/util/Size;->getHeight()I

    move-result v4

    int-to-long v4, v4

    mul-long/2addr v2, v4

    sub-long/2addr v0, v2

    .line 45
    invoke-static {v0, v1}, Ljava/lang/Long;->signum(J)I

    move-result v0

    .line 49
    .local v0, "result":I
    iget-boolean v1, p0, Landroidx/camera/core/impl/utils/CompareSizesByArea;->mReverse:Z

    if-eqz v1, :cond_0

    .line 50
    mul-int/lit8 v0, v0, -0x1

    .line 53
    :cond_0
    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 27
    check-cast p1, Landroid/util/Size;

    check-cast p2, Landroid/util/Size;

    invoke-virtual {p0, p1, p2}, Landroidx/camera/core/impl/utils/CompareSizesByArea;->compare(Landroid/util/Size;Landroid/util/Size;)I

    move-result p1

    return p1
.end method
