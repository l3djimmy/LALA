.class public Landroidx/recyclerview/widget/GridLayoutManager;
.super Landroidx/recyclerview/widget/LinearLayoutManager;
.source "GridLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/recyclerview/widget/GridLayoutManager$DefaultSpanSizeLookup;,
        Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;,
        Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;,
        Landroidx/recyclerview/widget/GridLayoutManager$Api21Impl;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field public static final DEFAULT_SPAN_COUNT:I = -0x1

.field private static final INVALID_POSITION:I = -0x1

.field private static final TAG:Ljava/lang/String; = "GridLayoutManager"

.field private static final sSupportedDirectionsForActionScrollInDirection:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field mCachedBorders:[I

.field mColumnWithAccessibilityFocus:I

.field final mDecorInsets:Landroid/graphics/Rect;

.field mPendingSpanCountChange:Z

.field private mPositionTargetedByScrollInDirection:I

.field final mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

.field final mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

.field mRowWithAccessibilityFocus:I

.field mSet:[Landroid/view/View;

.field mSpanCount:I

.field mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

.field private mUsingSpansToEstimateScrollBarDimensions:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 58
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Integer;

    .line 60
    const/16 v2, 0x11

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    .line 61
    const/16 v2, 0x42

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    .line 62
    const/16 v2, 0x21

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v1, v3

    .line 63
    const/16 v2, 0x82

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x3

    aput-object v2, v1, v3

    .line 59
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Landroidx/recyclerview/widget/GridLayoutManager;->sSupportedDirectionsForActionScrollInDirection:Ljava/util/Set;

    .line 58
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "spanCount"    # I

    .line 146
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPendingSpanCountChange:Z

    .line 69
    const/4 v0, -0x1

    iput v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    .line 80
    new-instance v1, Landroid/util/SparseIntArray;

    invoke-direct {v1}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

    .line 81
    new-instance v1, Landroid/util/SparseIntArray;

    invoke-direct {v1}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

    .line 82
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager$DefaultSpanSizeLookup;

    invoke-direct {v1}, Landroidx/recyclerview/widget/GridLayoutManager$DefaultSpanSizeLookup;-><init>()V

    iput-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    .line 84
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    .line 93
    iput v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPositionTargetedByScrollInDirection:I

    .line 108
    iput v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRowWithAccessibilityFocus:I

    .line 123
    iput v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mColumnWithAccessibilityFocus:I

    .line 147
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/GridLayoutManager;->setSpanCount(I)V

    .line 148
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IIZ)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "spanCount"    # I
    .param p3, "orientation"    # I
    .param p4, "reverseLayout"    # Z

    .line 159
    invoke-direct {p0, p1, p3, p4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPendingSpanCountChange:Z

    .line 69
    const/4 v0, -0x1

    iput v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    .line 80
    new-instance v1, Landroid/util/SparseIntArray;

    invoke-direct {v1}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

    .line 81
    new-instance v1, Landroid/util/SparseIntArray;

    invoke-direct {v1}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

    .line 82
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager$DefaultSpanSizeLookup;

    invoke-direct {v1}, Landroidx/recyclerview/widget/GridLayoutManager$DefaultSpanSizeLookup;-><init>()V

    iput-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    .line 84
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    .line 93
    iput v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPositionTargetedByScrollInDirection:I

    .line 108
    iput v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRowWithAccessibilityFocus:I

    .line 123
    iput v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mColumnWithAccessibilityFocus:I

    .line 160
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/GridLayoutManager;->setSpanCount(I)V

    .line 161
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .line 134
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPendingSpanCountChange:Z

    .line 69
    const/4 v0, -0x1

    iput v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    .line 80
    new-instance v1, Landroid/util/SparseIntArray;

    invoke-direct {v1}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

    .line 81
    new-instance v1, Landroid/util/SparseIntArray;

    invoke-direct {v1}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

    .line 82
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager$DefaultSpanSizeLookup;

    invoke-direct {v1}, Landroidx/recyclerview/widget/GridLayoutManager$DefaultSpanSizeLookup;-><init>()V

    iput-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    .line 84
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    .line 93
    iput v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPositionTargetedByScrollInDirection:I

    .line 108
    iput v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRowWithAccessibilityFocus:I

    .line 123
    iput v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mColumnWithAccessibilityFocus:I

    .line 135
    invoke-static {p1, p2, p3, p4}, Landroidx/recyclerview/widget/GridLayoutManager;->getProperties(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroidx/recyclerview/widget/RecyclerView$LayoutManager$Properties;

    move-result-object v0

    .line 136
    .local v0, "properties":Landroidx/recyclerview/widget/RecyclerView$LayoutManager$Properties;
    iget v1, v0, Landroidx/recyclerview/widget/RecyclerView$LayoutManager$Properties;->spanCount:I

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->setSpanCount(I)V

    .line 137
    return-void
.end method

.method private assignSpans(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;IZ)V
    .locals 8
    .param p1, "recycler"    # Landroidx/recyclerview/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;
    .param p3, "count"    # I
    .param p4, "layingOutInPrimaryDirection"    # Z

    .line 1464
    if-eqz p4, :cond_0

    .line 1465
    const/4 v0, 0x0

    .line 1466
    .local v0, "start":I
    move v1, p3

    .line 1467
    .local v1, "end":I
    const/4 v2, 0x1

    .local v2, "diff":I
    goto :goto_0

    .line 1469
    .end local v0    # "start":I
    .end local v1    # "end":I
    .end local v2    # "diff":I
    :cond_0
    add-int/lit8 v0, p3, -0x1

    .line 1470
    .restart local v0    # "start":I
    const/4 v1, -0x1

    .line 1471
    .restart local v1    # "end":I
    const/4 v2, -0x1

    .line 1473
    .restart local v2    # "diff":I
    :goto_0
    const/4 v3, 0x0

    .line 1474
    .local v3, "span":I
    move v4, v0

    .local v4, "i":I
    :goto_1
    if-eq v4, v1, :cond_1

    .line 1475
    iget-object v5, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    aget-object v5, v5, v4

    .line 1476
    .local v5, "view":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;

    .line 1477
    .local v6, "params":Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;
    invoke-virtual {p0, v5}, Landroidx/recyclerview/widget/GridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v7

    invoke-direct {p0, p1, p2, v7}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanSize(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v7

    iput v7, v6, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mSpanSize:I

    .line 1478
    iput v3, v6, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I

    .line 1479
    iget v7, v6, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mSpanSize:I

    add-int/2addr v3, v7

    .line 1474
    .end local v5    # "view":Landroid/view/View;
    .end local v6    # "params":Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;
    add-int/2addr v4, v2

    goto :goto_1

    .line 1481
    .end local v4    # "i":I
    :cond_1
    return-void
.end method

.method private cachePreLayoutSpanMapping()V
    .locals 6

    .line 868
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildCount()I

    move-result v0

    .line 869
    .local v0, "childCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 870
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;

    .line 871
    .local v2, "lp":Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;
    invoke-virtual {v2}, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->getViewLayoutPosition()I

    move-result v3

    .line 872
    .local v3, "viewPosition":I
    iget-object v4, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->getSpanSize()I

    move-result v5

    invoke-virtual {v4, v3, v5}, Landroid/util/SparseIntArray;->put(II)V

    .line 873
    iget-object v4, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->getSpanIndex()I

    move-result v5

    invoke-virtual {v4, v3, v5}, Landroid/util/SparseIntArray;->put(II)V

    .line 869
    .end local v2    # "lp":Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;
    .end local v3    # "viewPosition":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 875
    .end local v1    # "i":I
    :cond_0
    return-void
.end method

.method private calculateItemBorders(I)V
    .locals 2
    .param p1, "totalSpace"    # I

    .line 993
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mCachedBorders:[I

    iget v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    invoke-static {v0, v1, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->calculateItemBorders([III)[I

    move-result-object v0

    iput-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mCachedBorders:[I

    .line 994
    return-void
.end method

.method static calculateItemBorders([III)[I
    .locals 7
    .param p0, "cachedBorders"    # [I
    .param p1, "spanCount"    # I
    .param p2, "totalSpace"    # I

    .line 1004
    if-eqz p0, :cond_0

    array-length v0, p0

    add-int/lit8 v1, p1, 0x1

    if-ne v0, v1, :cond_0

    array-length v0, p0

    add-int/lit8 v0, v0, -0x1

    aget v0, p0, v0

    if-eq v0, p2, :cond_1

    .line 1006
    :cond_0
    add-int/lit8 v0, p1, 0x1

    new-array p0, v0, [I

    .line 1008
    :cond_1
    const/4 v0, 0x0

    aput v0, p0, v0

    .line 1009
    div-int v0, p2, p1

    .line 1010
    .local v0, "sizePerSpan":I
    rem-int v1, p2, p1

    .line 1011
    .local v1, "sizePerSpanRemainder":I
    const/4 v2, 0x0

    .line 1012
    .local v2, "consumedPixels":I
    const/4 v3, 0x0

    .line 1013
    .local v3, "additionalSize":I
    const/4 v4, 0x1

    .local v4, "i":I
    :goto_0
    if-gt v4, p1, :cond_3

    .line 1014
    move v5, v0

    .line 1015
    .local v5, "itemSize":I
    add-int/2addr v3, v1

    .line 1016
    if-lez v3, :cond_2

    sub-int v6, p1, v3

    if-ge v6, v1, :cond_2

    .line 1017
    add-int/lit8 v5, v5, 0x1

    .line 1018
    sub-int/2addr v3, p1

    .line 1020
    :cond_2
    add-int/2addr v2, v5

    .line 1021
    aput v2, p0, v4

    .line 1013
    .end local v5    # "itemSize":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1023
    .end local v4    # "i":I
    :cond_3
    return-object p0
.end method

.method private clearPreLayoutSpanMappingCache()V
    .locals 1

    .line 863
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->clear()V

    .line 864
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->clear()V

    .line 865
    return-void
.end method

.method private computeScrollOffsetWithSpanInfo(Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 18
    .param p1, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;

    .line 1999
    move-object/from16 v0, p0

    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_5

    invoke-virtual/range {p1 .. p1}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_2

    .line 2002
    :cond_0
    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager;->ensureLayoutState()V

    .line 2004
    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager;->isSmoothScrollbarEnabled()Z

    move-result v1

    .line 2005
    .local v1, "smoothScrollEnabled":Z
    xor-int/lit8 v3, v1, 0x1

    const/4 v4, 0x1

    invoke-virtual {v0, v3, v4}, Landroidx/recyclerview/widget/GridLayoutManager;->findFirstVisibleChildClosestToStart(ZZ)Landroid/view/View;

    move-result-object v3

    .line 2006
    .local v3, "startChild":Landroid/view/View;
    xor-int/lit8 v5, v1, 0x1

    invoke-virtual {v0, v5, v4}, Landroidx/recyclerview/widget/GridLayoutManager;->findFirstVisibleChildClosestToEnd(ZZ)Landroid/view/View;

    move-result-object v5

    .line 2007
    .local v5, "endChild":Landroid/view/View;
    if-eqz v3, :cond_4

    if-nez v5, :cond_1

    move/from16 v16, v1

    goto/16 :goto_1

    .line 2010
    :cond_1
    iget-object v6, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/GridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v7

    iget v8, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v6, v7, v8}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getCachedSpanGroupIndex(II)I

    move-result v6

    .line 2012
    .local v6, "startChildSpan":I
    iget-object v7, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0, v5}, Landroidx/recyclerview/widget/GridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v8

    iget v9, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v7, v8, v9}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getCachedSpanGroupIndex(II)I

    move-result v7

    .line 2015
    .local v7, "endChildSpan":I
    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 2016
    .local v8, "minSpan":I
    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 2017
    .local v9, "maxSpan":I
    iget-object v10, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual/range {p1 .. p1}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v11

    sub-int/2addr v11, v4

    iget v12, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v10, v11, v12}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getCachedSpanGroupIndex(II)I

    move-result v10

    add-int/2addr v10, v4

    .line 2020
    .local v10, "totalSpans":I
    iget-boolean v11, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v11, :cond_2

    .line 2021
    sub-int v11, v10, v9

    sub-int/2addr v11, v4

    invoke-static {v2, v11}, Ljava/lang/Math;->max(II)I

    move-result v2

    goto :goto_0

    .line 2022
    :cond_2
    invoke-static {v2, v8}, Ljava/lang/Math;->max(II)I

    move-result v2

    :goto_0
    nop

    .line 2023
    .local v2, "spansBefore":I
    if-nez v1, :cond_3

    .line 2024
    return v2

    .line 2026
    :cond_3
    iget-object v11, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    invoke-virtual {v11, v5}, Landroidx/recyclerview/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v11

    iget-object v12, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    .line 2027
    invoke-virtual {v12, v3}, Landroidx/recyclerview/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v12

    sub-int/2addr v11, v12

    .line 2026
    invoke-static {v11}, Ljava/lang/Math;->abs(I)I

    move-result v11

    .line 2029
    .local v11, "laidOutArea":I
    iget-object v12, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    .line 2030
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/GridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v13

    iget v14, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v12, v13, v14}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getCachedSpanGroupIndex(II)I

    move-result v12

    .line 2031
    .local v12, "firstVisibleSpan":I
    iget-object v13, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0, v5}, Landroidx/recyclerview/widget/GridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v14

    iget v15, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v13, v14, v15}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getCachedSpanGroupIndex(II)I

    move-result v13

    .line 2033
    .local v13, "lastVisibleSpan":I
    sub-int v14, v13, v12

    add-int/2addr v14, v4

    .line 2034
    .local v14, "laidOutSpans":I
    int-to-float v4, v11

    int-to-float v15, v14

    div-float/2addr v4, v15

    .line 2036
    .local v4, "avgSizePerSpan":F
    int-to-float v15, v2

    mul-float/2addr v15, v4

    move/from16 v16, v1

    .end local v1    # "smoothScrollEnabled":Z
    .local v16, "smoothScrollEnabled":Z
    iget-object v1, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v1

    move/from16 v17, v1

    iget-object v1, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    .line 2037
    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v1

    sub-int v1, v17, v1

    int-to-float v1, v1

    add-float/2addr v15, v1

    .line 2036
    invoke-static {v15}, Ljava/lang/Math;->round(F)I

    move-result v1

    return v1

    .line 2007
    .end local v2    # "spansBefore":I
    .end local v4    # "avgSizePerSpan":F
    .end local v6    # "startChildSpan":I
    .end local v7    # "endChildSpan":I
    .end local v8    # "minSpan":I
    .end local v9    # "maxSpan":I
    .end local v10    # "totalSpans":I
    .end local v11    # "laidOutArea":I
    .end local v12    # "firstVisibleSpan":I
    .end local v13    # "lastVisibleSpan":I
    .end local v14    # "laidOutSpans":I
    .end local v16    # "smoothScrollEnabled":Z
    .restart local v1    # "smoothScrollEnabled":Z
    :cond_4
    move/from16 v16, v1

    .line 2008
    .end local v1    # "smoothScrollEnabled":Z
    .restart local v16    # "smoothScrollEnabled":Z
    :goto_1
    return v2

    .line 2000
    .end local v3    # "startChild":Landroid/view/View;
    .end local v5    # "endChild":Landroid/view/View;
    .end local v16    # "smoothScrollEnabled":Z
    :cond_5
    :goto_2
    return v2
.end method

.method private computeScrollRangeWithSpanInfo(Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 9
    .param p1, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;

    .line 1966
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 1969
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->ensureLayoutState()V

    .line 1971
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->isSmoothScrollbarEnabled()Z

    move-result v0

    const/4 v2, 0x1

    xor-int/2addr v0, v2

    invoke-virtual {p0, v0, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->findFirstVisibleChildClosestToStart(ZZ)Landroid/view/View;

    move-result-object v0

    .line 1972
    .local v0, "startChild":Landroid/view/View;
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->isSmoothScrollbarEnabled()Z

    move-result v3

    xor-int/2addr v3, v2

    invoke-virtual {p0, v3, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->findFirstVisibleChildClosestToEnd(ZZ)Landroid/view/View;

    move-result-object v3

    .line 1974
    .local v3, "endChild":Landroid/view/View;
    if-eqz v0, :cond_3

    if-nez v3, :cond_1

    goto :goto_0

    .line 1977
    :cond_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->isSmoothScrollbarEnabled()Z

    move-result v1

    if-nez v1, :cond_2

    .line 1978
    iget-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    .line 1979
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v4

    sub-int/2addr v4, v2

    iget v5, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    .line 1978
    invoke-virtual {v1, v4, v5}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getCachedSpanGroupIndex(II)I

    move-result v1

    add-int/2addr v1, v2

    return v1

    .line 1983
    :cond_2
    iget-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v1

    iget-object v4, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    .line 1984
    invoke-virtual {v4, v0}, Landroidx/recyclerview/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v4

    sub-int/2addr v1, v4

    .line 1986
    .local v1, "laidOutArea":I
    iget-object v4, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    .line 1987
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/GridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v5

    iget v6, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v4, v5, v6}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getCachedSpanGroupIndex(II)I

    move-result v4

    .line 1988
    .local v4, "firstVisibleSpan":I
    iget-object v5, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/GridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v6

    iget v7, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v5, v6, v7}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getCachedSpanGroupIndex(II)I

    move-result v5

    .line 1990
    .local v5, "lastVisibleSpan":I
    iget-object v6, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v7

    sub-int/2addr v7, v2

    iget v8, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v6, v7, v8}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getCachedSpanGroupIndex(II)I

    move-result v6

    add-int/2addr v6, v2

    .line 1992
    .local v6, "totalSpans":I
    sub-int v7, v5, v4

    add-int/2addr v7, v2

    .line 1995
    .local v7, "laidOutSpans":I
    int-to-float v2, v1

    int-to-float v8, v7

    div-float/2addr v2, v8

    int-to-float v8, v6

    mul-float/2addr v2, v8

    float-to-int v2, v2

    return v2

    .line 1975
    .end local v1    # "laidOutArea":I
    .end local v4    # "firstVisibleSpan":I
    .end local v5    # "lastVisibleSpan":I
    .end local v6    # "totalSpans":I
    .end local v7    # "laidOutSpans":I
    :cond_3
    :goto_0
    return v1

    .line 1967
    .end local v0    # "startChild":Landroid/view/View;
    .end local v3    # "endChild":Landroid/view/View;
    :cond_4
    :goto_1
    return v1
.end method

.method private ensureAnchorIsInCorrectSpan(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;Landroidx/recyclerview/widget/LinearLayoutManager$AnchorInfo;I)V
    .locals 6
    .param p1, "recycler"    # Landroidx/recyclerview/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;
    .param p3, "anchorInfo"    # Landroidx/recyclerview/widget/LinearLayoutManager$AnchorInfo;
    .param p4, "itemDirection"    # I

    .line 1070
    const/4 v0, 0x1

    if-ne p4, v0, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 1072
    .local v1, "layingOutInPrimaryDirection":Z
    :goto_0
    iget v2, p3, Landroidx/recyclerview/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    invoke-direct {p0, p1, p2, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanIndex(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v2

    .line 1073
    .local v2, "span":I
    if-eqz v1, :cond_1

    .line 1075
    :goto_1
    if-lez v2, :cond_3

    iget v3, p3, Landroidx/recyclerview/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    if-lez v3, :cond_3

    .line 1076
    iget v3, p3, Landroidx/recyclerview/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    sub-int/2addr v3, v0

    iput v3, p3, Landroidx/recyclerview/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    .line 1077
    iget v3, p3, Landroidx/recyclerview/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    invoke-direct {p0, p1, p2, v3}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanIndex(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v2

    goto :goto_1

    .line 1081
    :cond_1
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v3

    sub-int/2addr v3, v0

    .line 1082
    .local v3, "indexLimit":I
    iget v0, p3, Landroidx/recyclerview/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    .line 1083
    .local v0, "pos":I
    move v4, v2

    .line 1084
    .local v4, "bestSpan":I
    :goto_2
    if-ge v0, v3, :cond_2

    .line 1085
    add-int/lit8 v5, v0, 0x1

    invoke-direct {p0, p1, p2, v5}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanIndex(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v5

    .line 1086
    .local v5, "next":I
    if-le v5, v4, :cond_2

    .line 1087
    add-int/lit8 v0, v0, 0x1

    .line 1088
    move v4, v5

    .line 1092
    .end local v5    # "next":I
    goto :goto_2

    .line 1093
    :cond_2
    iput v0, p3, Landroidx/recyclerview/widget/LinearLayoutManager$AnchorInfo;->mPosition:I

    .line 1095
    .end local v0    # "pos":I
    .end local v3    # "indexLimit":I
    .end local v4    # "bestSpan":I
    :cond_3
    return-void
.end method

.method private ensureViewSet()V
    .locals 2

    .line 1047
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    array-length v0, v0

    iget v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    if-eq v0, v1, :cond_1

    .line 1048
    :cond_0
    iget v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    new-array v0, v0, [Landroid/view/View;

    iput-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    .line 1050
    :cond_1
    return-void
.end method

.method private findChildWithAccessibilityFocus()Landroid/view/View;
    .locals 4

    .line 798
    const/4 v0, 0x0

    .line 800
    .local v0, "child":Landroid/view/View;
    nop

    .line 801
    const/4 v1, 0x0

    .line 803
    .local v1, "childFound":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 804
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    invoke-static {v3}, Landroidx/recyclerview/widget/GridLayoutManager$Api21Impl;->isAccessibilityFocused(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 805
    const/4 v1, 0x1

    .line 806
    goto :goto_1

    .line 803
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 809
    :cond_1
    :goto_1
    if-eqz v1, :cond_2

    .line 810
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 813
    .end local v1    # "childFound":Z
    .end local v2    # "i":I
    :cond_2
    return-object v0
.end method

.method private findScrollTargetPositionAbove(III)I
    .locals 6
    .param p1, "startingRow"    # I
    .param p2, "startingColumn"    # I
    .param p3, "startingAdapterPosition"    # I

    .line 507
    const/4 v0, -0x1

    .line 508
    .local v0, "scrollTargetPosition":I
    add-int/lit8 v1, p3, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_4

    .line 509
    invoke-direct {p0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->getRowIndex(I)I

    move-result v2

    .line 510
    .local v2, "currentRow":I
    invoke-direct {p0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->getColumnIndex(I)I

    move-result v3

    .line 512
    .local v3, "currentColumn":I
    if-ltz v2, :cond_3

    if-gez v3, :cond_0

    goto :goto_1

    .line 521
    :cond_0
    iget v4, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    .line 530
    if-ge v2, p1, :cond_2

    invoke-direct {p0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->getColumnIndices(I)Ljava/util/Set;

    move-result-object v4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 531
    move v0, v1

    .line 532
    iput v2, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRowWithAccessibilityFocus:I

    .line 535
    goto :goto_2

    .line 547
    :cond_1
    if-ge v2, p1, :cond_2

    if-ne v3, p2, :cond_2

    .line 548
    invoke-direct {p0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->getRowIndices(I)Ljava/util/Set;

    move-result-object v4

    .line 549
    .local v4, "rowIndices":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    move v0, v1

    .line 550
    invoke-static {v4}, Ljava/util/Collections;->max(Ljava/util/Collection;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iput v5, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRowWithAccessibilityFocus:I

    .line 553
    goto :goto_2

    .line 508
    .end local v2    # "currentRow":I
    .end local v3    # "currentColumn":I
    .end local v4    # "rowIndices":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :cond_2
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 518
    .restart local v2    # "currentRow":I
    .restart local v3    # "currentColumn":I
    :cond_3
    :goto_1
    const/4 v4, -0x1

    return v4

    .line 557
    .end local v1    # "i":I
    .end local v2    # "currentRow":I
    .end local v3    # "currentColumn":I
    :cond_4
    :goto_2
    return v0
.end method

.method private findScrollTargetPositionBelow(III)I
    .locals 6
    .param p1, "startingRow"    # I
    .param p2, "startingColumn"    # I
    .param p3, "startingAdapterPosition"    # I

    .line 562
    const/4 v0, -0x1

    .line 563
    .local v0, "scrollTargetPosition":I
    add-int/lit8 v1, p3, 0x1

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getItemCount()I

    move-result v2

    if-ge v1, v2, :cond_5

    .line 564
    invoke-direct {p0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->getRowIndex(I)I

    move-result v2

    .line 565
    .local v2, "currentRow":I
    invoke-direct {p0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->getColumnIndex(I)I

    move-result v3

    .line 567
    .local v3, "currentColumn":I
    if-ltz v2, :cond_4

    if-gez v3, :cond_0

    goto :goto_1

    .line 576
    :cond_0
    iget v4, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_2

    .line 585
    if-le v2, p1, :cond_3

    if-eq v3, p2, :cond_1

    .line 586
    invoke-direct {p0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->getColumnIndices(I)Ljava/util/Set;

    move-result-object v4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 587
    :cond_1
    move v0, v1

    .line 588
    iput v2, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRowWithAccessibilityFocus:I

    .line 589
    goto :goto_2

    .line 601
    :cond_2
    if-le v2, p1, :cond_3

    if-ne v3, p2, :cond_3

    .line 602
    move v0, v1

    .line 603
    invoke-direct {p0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->getRowIndex(I)I

    move-result v4

    iput v4, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRowWithAccessibilityFocus:I

    .line 604
    goto :goto_2

    .line 563
    .end local v2    # "currentRow":I
    .end local v3    # "currentColumn":I
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 573
    .restart local v2    # "currentRow":I
    .restart local v3    # "currentColumn":I
    :cond_4
    :goto_1
    const/4 v4, -0x1

    return v4

    .line 608
    .end local v1    # "i":I
    .end local v2    # "currentRow":I
    .end local v3    # "currentColumn":I
    :cond_5
    :goto_2
    return v0
.end method

.method private findScrollTargetPositionOnTheLeft(III)I
    .locals 6
    .param p1, "startingRow"    # I
    .param p2, "startingColumn"    # I
    .param p3, "startingAdapterPosition"    # I

    .line 454
    const/4 v0, -0x1

    .line 455
    .local v0, "scrollTargetPosition":I
    add-int/lit8 v1, p3, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_6

    .line 456
    invoke-direct {p0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->getRowIndex(I)I

    move-result v2

    .line 457
    .local v2, "currentRow":I
    invoke-direct {p0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->getColumnIndex(I)I

    move-result v3

    .line 459
    .local v3, "currentColumn":I
    if-ltz v2, :cond_5

    if-gez v3, :cond_0

    goto :goto_1

    .line 468
    :cond_0
    iget v4, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_3

    .line 477
    if-ne v2, p1, :cond_1

    if-lt v3, p2, :cond_2

    :cond_1
    if-ge v2, p1, :cond_4

    .line 479
    :cond_2
    move v0, v1

    .line 480
    iput v2, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRowWithAccessibilityFocus:I

    .line 481
    iput v3, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mColumnWithAccessibilityFocus:I

    .line 482
    goto :goto_2

    .line 494
    :cond_3
    invoke-direct {p0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->getRowIndices(I)Ljava/util/Set;

    move-result-object v4

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    if-ge v3, p2, :cond_4

    .line 497
    iput v3, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mColumnWithAccessibilityFocus:I

    .line 498
    return v1

    .line 455
    .end local v2    # "currentRow":I
    .end local v3    # "currentColumn":I
    :cond_4
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 465
    .restart local v2    # "currentRow":I
    .restart local v3    # "currentColumn":I
    :cond_5
    :goto_1
    const/4 v4, -0x1

    return v4

    .line 502
    .end local v1    # "i":I
    .end local v2    # "currentRow":I
    .end local v3    # "currentColumn":I
    :cond_6
    :goto_2
    return v0
.end method

.method private findScrollTargetPositionOnTheRight(III)I
    .locals 6
    .param p1, "startingRow"    # I
    .param p2, "startingColumn"    # I
    .param p3, "startingAdapterPosition"    # I

    .line 401
    const/4 v0, -0x1

    .line 402
    .local v0, "scrollTargetPosition":I
    add-int/lit8 v1, p3, 0x1

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getItemCount()I

    move-result v2

    if-ge v1, v2, :cond_6

    .line 403
    invoke-direct {p0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->getRowIndex(I)I

    move-result v2

    .line 404
    .local v2, "currentRow":I
    invoke-direct {p0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->getColumnIndex(I)I

    move-result v3

    .line 406
    .local v3, "currentColumn":I
    if-ltz v2, :cond_5

    if-gez v3, :cond_0

    goto :goto_1

    .line 415
    :cond_0
    iget v4, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_3

    .line 424
    if-ne v2, p1, :cond_1

    if-gt v3, p2, :cond_2

    :cond_1
    if-le v2, p1, :cond_4

    .line 426
    :cond_2
    iput v2, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRowWithAccessibilityFocus:I

    .line 427
    iput v3, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mColumnWithAccessibilityFocus:I

    .line 428
    return v1

    .line 440
    :cond_3
    if-le v3, p2, :cond_4

    invoke-direct {p0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->getRowIndices(I)Ljava/util/Set;

    move-result-object v4

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 443
    iput v3, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mColumnWithAccessibilityFocus:I

    .line 444
    return v1

    .line 402
    .end local v2    # "currentRow":I
    .end local v3    # "currentColumn":I
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 412
    .restart local v2    # "currentRow":I
    .restart local v3    # "currentColumn":I
    :cond_5
    :goto_1
    const/4 v4, -0x1

    return v4

    .line 449
    .end local v1    # "i":I
    .end local v2    # "currentRow":I
    .end local v3    # "currentColumn":I
    :cond_6
    return v0
.end method

.method private getColumnIndex(I)I
    .locals 2
    .param p1, "position"    # I

    .line 757
    iget v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    if-nez v0, :cond_0

    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->mRecycler:Landroidx/recyclerview/widget/RecyclerView$Recycler;

    iget-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    invoke-direct {p0, v0, v1, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanGroupIndex(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v0

    goto :goto_0

    .line 758
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->mRecycler:Landroidx/recyclerview/widget/RecyclerView$Recycler;

    iget-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    invoke-direct {p0, v0, v1, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanIndex(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v0

    .line 757
    :goto_0
    return v0
.end method

.method private getColumnIndices(I)Ljava/util/Set;
    .locals 1
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 784
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->getColumnIndex(I)I

    move-result v0

    invoke-direct {p0, v0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->getRowOrColumnIndices(II)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method private getRowIndex(I)I
    .locals 2
    .param p1, "position"    # I

    .line 746
    iget v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->mRecycler:Landroidx/recyclerview/widget/RecyclerView$Recycler;

    iget-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    invoke-direct {p0, v0, v1, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanGroupIndex(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v0

    goto :goto_0

    .line 747
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->mRecycler:Landroidx/recyclerview/widget/RecyclerView$Recycler;

    iget-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    invoke-direct {p0, v0, v1, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanIndex(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v0

    .line 746
    :goto_0
    return v0
.end method

.method private getRowIndices(I)Ljava/util/Set;
    .locals 1
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 771
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->getRowIndex(I)I

    move-result v0

    invoke-direct {p0, v0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->getRowOrColumnIndices(II)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method private getRowOrColumnIndices(II)Ljava/util/Set;
    .locals 4
    .param p1, "rowOrColumnIndex"    # I
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 788
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 789
    .local v0, "indices":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    iget-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->mRecycler:Landroidx/recyclerview/widget/RecyclerView$Recycler;

    iget-object v2, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v2, v2, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    invoke-direct {p0, v1, v2, p2}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanSize(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v1

    .line 790
    .local v1, "spanSize":I
    move v2, p1

    .local v2, "i":I
    :goto_0
    add-int v3, p1, v1

    if-ge v2, v3, :cond_0

    .line 791
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 790
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 793
    .end local v2    # "i":I
    :cond_0
    return-object v0
.end method

.method private getSpanGroupIndex(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I
    .locals 3
    .param p1, "recycler"    # Landroidx/recyclerview/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;
    .param p3, "viewPosition"    # I

    .line 1146
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$State;->isPreLayout()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1147
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    iget v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v0, p3, v1}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getCachedSpanGroupIndex(II)I

    move-result v0

    return v0

    .line 1149
    :cond_0
    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->convertPreLayoutPositionToPostLayout(I)I

    move-result v0

    .line 1150
    .local v0, "adapterPosition":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 1155
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot find span size for pre layout position. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "GridLayoutManager"

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1156
    const/4 v1, 0x0

    return v1

    .line 1158
    :cond_1
    iget-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    iget v2, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v1, v0, v2}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getCachedSpanGroupIndex(II)I

    move-result v1

    return v1
.end method

.method private getSpanIndex(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I
    .locals 4
    .param p1, "recycler"    # Landroidx/recyclerview/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;
    .param p3, "pos"    # I

    .line 1162
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$State;->isPreLayout()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1163
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    iget v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v0, p3, v1}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getCachedSpanIndex(II)I

    move-result v0

    return v0

    .line 1165
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPreLayoutSpanIndexCache:Landroid/util/SparseIntArray;

    const/4 v1, -0x1

    invoke-virtual {v0, p3, v1}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    .line 1166
    .local v0, "cached":I
    if-eq v0, v1, :cond_1

    .line 1167
    return v0

    .line 1169
    :cond_1
    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->convertPreLayoutPositionToPostLayout(I)I

    move-result v2

    .line 1170
    .local v2, "adapterPosition":I
    if-ne v2, v1, :cond_2

    .line 1175
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot find span size for pre layout position. It is not cached, not in the adapter. Pos:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "GridLayoutManager"

    invoke-static {v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1177
    const/4 v1, 0x0

    return v1

    .line 1179
    :cond_2
    iget-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    iget v3, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v1, v2, v3}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getCachedSpanIndex(II)I

    move-result v1

    return v1
.end method

.method private getSpanSize(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I
    .locals 4
    .param p1, "recycler"    # Landroidx/recyclerview/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;
    .param p3, "pos"    # I

    .line 1183
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$State;->isPreLayout()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1184
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0, p3}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v0

    return v0

    .line 1186
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPreLayoutSpanSizeCache:Landroid/util/SparseIntArray;

    const/4 v1, -0x1

    invoke-virtual {v0, p3, v1}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    .line 1187
    .local v0, "cached":I
    if-eq v0, v1, :cond_1

    .line 1188
    return v0

    .line 1190
    :cond_1
    invoke-virtual {p1, p3}, Landroidx/recyclerview/widget/RecyclerView$Recycler;->convertPreLayoutPositionToPostLayout(I)I

    move-result v2

    .line 1191
    .local v2, "adapterPosition":I
    if-ne v2, v1, :cond_2

    .line 1196
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot find span size for pre layout position. It is not cached, not in the adapter. Pos:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "GridLayoutManager"

    invoke-static {v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1198
    const/4 v1, 0x1

    return v1

    .line 1200
    :cond_2
    iget-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v1

    return v1
.end method

.method private guessMeasurement(FI)V
    .locals 2
    .param p1, "maxSizeInOther"    # F
    .param p2, "currentOtherDirSize"    # I

    .line 1439
    iget v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    int-to-float v0, v0

    mul-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 1441
    .local v0, "contentSize":I
    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-direct {p0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;->calculateItemBorders(I)V

    .line 1442
    return-void
.end method

.method private hasAccessibilityFocusChanged(I)Z
    .locals 2
    .param p1, "adapterPosition"    # I

    .line 828
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->getRowIndices(I)Ljava/util/Set;

    move-result-object v0

    iget v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRowWithAccessibilityFocus:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 829
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->getColumnIndices(I)Ljava/util/Set;

    move-result-object v0

    iget v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mColumnWithAccessibilityFocus:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 828
    :goto_1
    return v0
.end method

.method private measureChild(Landroid/view/View;IZ)V
    .locals 10
    .param p1, "view"    # Landroid/view/View;
    .param p2, "otherDirParentSpecMode"    # I
    .param p3, "alreadyMeasured"    # Z

    .line 1405
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;

    .line 1406
    .local v0, "lp":Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;
    iget-object v1, v0, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mDecorInsets:Landroid/graphics/Rect;

    .line 1407
    .local v1, "decorInsets":Landroid/graphics/Rect;
    iget v2, v1, Landroid/graphics/Rect;->top:I

    iget v3, v1, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v2, v3

    iget v3, v0, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->topMargin:I

    add-int/2addr v2, v3

    iget v3, v0, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->bottomMargin:I

    add-int/2addr v2, v3

    .line 1409
    .local v2, "verticalInsets":I
    iget v3, v1, Landroid/graphics/Rect;->left:I

    iget v4, v1, Landroid/graphics/Rect;->right:I

    add-int/2addr v3, v4

    iget v4, v0, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->leftMargin:I

    add-int/2addr v3, v4

    iget v4, v0, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->rightMargin:I

    add-int/2addr v3, v4

    .line 1411
    .local v3, "horizontalInsets":I
    iget v4, v0, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I

    iget v5, v0, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mSpanSize:I

    invoke-virtual {p0, v4, v5}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpaceForSpanRange(II)I

    move-result v4

    .line 1414
    .local v4, "availableSpaceInOther":I
    iget v5, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-ne v5, v7, :cond_0

    .line 1415
    iget v5, v0, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->width:I

    invoke-static {v4, p2, v3, v5, v6}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildMeasureSpec(IIIIZ)I

    move-result v5

    .line 1417
    .local v5, "wSpec":I
    iget-object v6, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    invoke-virtual {v6}, Landroidx/recyclerview/widget/OrientationHelper;->getTotalSpace()I

    move-result v6

    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getHeightMode()I

    move-result v8

    iget v9, v0, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->height:I

    invoke-static {v6, v8, v2, v9, v7}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildMeasureSpec(IIIIZ)I

    move-result v6

    .local v6, "hSpec":I
    goto :goto_0

    .line 1420
    .end local v5    # "wSpec":I
    .end local v6    # "hSpec":I
    :cond_0
    iget v5, v0, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->height:I

    invoke-static {v4, p2, v2, v5, v6}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildMeasureSpec(IIIIZ)I

    move-result v6

    .line 1422
    .restart local v6    # "hSpec":I
    iget-object v5, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    invoke-virtual {v5}, Landroidx/recyclerview/widget/OrientationHelper;->getTotalSpace()I

    move-result v5

    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getWidthMode()I

    move-result v8

    iget v9, v0, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->width:I

    invoke-static {v5, v8, v3, v9, v7}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildMeasureSpec(IIIIZ)I

    move-result v5

    .line 1425
    .restart local v5    # "wSpec":I
    :goto_0
    invoke-direct {p0, p1, v5, v6, p3}, Landroidx/recyclerview/widget/GridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;IIZ)V

    .line 1426
    return-void
.end method

.method private measureChildWithDecorationsAndMargin(Landroid/view/View;IIZ)V
    .locals 2
    .param p1, "child"    # Landroid/view/View;
    .param p2, "widthSpec"    # I
    .param p3, "heightSpec"    # I
    .param p4, "alreadyMeasured"    # Z

    .line 1446
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 1448
    .local v0, "lp":Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
    if-eqz p4, :cond_0

    .line 1449
    invoke-virtual {p0, p1, p2, p3, v0}, Landroidx/recyclerview/widget/GridLayoutManager;->shouldReMeasureChild(Landroid/view/View;IILandroidx/recyclerview/widget/RecyclerView$LayoutParams;)Z

    move-result v1

    .local v1, "measure":Z
    goto :goto_0

    .line 1451
    .end local v1    # "measure":Z
    :cond_0
    invoke-virtual {p0, p1, p2, p3, v0}, Landroidx/recyclerview/widget/GridLayoutManager;->shouldMeasureChild(Landroid/view/View;IILandroidx/recyclerview/widget/RecyclerView$LayoutParams;)Z

    move-result v1

    .line 1453
    .restart local v1    # "measure":Z
    :goto_0
    if-eqz v1, :cond_1

    .line 1454
    invoke-virtual {p1, p2, p3}, Landroid/view/View;->measure(II)V

    .line 1456
    :cond_1
    return-void
.end method

.method private updateMeasurements()V
    .locals 2

    .line 959
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getOrientation()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 960
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    .local v0, "totalSpace":I
    goto :goto_0

    .line 962
    .end local v0    # "totalSpace":I
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getPaddingTop()I

    move-result v1

    sub-int/2addr v0, v1

    .line 964
    .restart local v0    # "totalSpace":I
    :goto_0
    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/GridLayoutManager;->calculateItemBorders(I)V

    .line 965
    return-void
.end method


# virtual methods
.method public checkLayoutParams(Landroidx/recyclerview/widget/RecyclerView$LayoutParams;)Z
    .locals 1
    .param p1, "lp"    # Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 935
    instance-of v0, p1, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;

    return v0
.end method

.method collectPrefetchPositionsForLayoutState(Landroidx/recyclerview/widget/RecyclerView$State;Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;Landroidx/recyclerview/widget/RecyclerView$LayoutManager$LayoutPrefetchRegistry;)V
    .locals 6
    .param p1, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;
    .param p2, "layoutState"    # Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;
    .param p3, "layoutPrefetchRegistry"    # Landroidx/recyclerview/widget/RecyclerView$LayoutManager$LayoutPrefetchRegistry;

    .line 1206
    iget v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    .line 1207
    .local v0, "remainingSpan":I
    const/4 v1, 0x0

    .line 1208
    .local v1, "count":I
    :goto_0
    iget v2, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_0

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;->hasMore(Landroidx/recyclerview/widget/RecyclerView$State;)Z

    move-result v2

    if-eqz v2, :cond_0

    if-lez v0, :cond_0

    .line 1209
    iget v2, p2, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 1210
    .local v2, "pos":I
    const/4 v3, 0x0

    iget v4, p2, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;->mScrollingOffset:I

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-interface {p3, v2, v3}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager$LayoutPrefetchRegistry;->addPosition(II)V

    .line 1211
    iget-object v3, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v3, v2}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v3

    .line 1212
    .local v3, "spanSize":I
    sub-int/2addr v0, v3

    .line 1213
    iget v4, p2, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    iget v5, p2, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    add-int/2addr v4, v5

    iput v4, p2, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 1214
    nop

    .end local v2    # "pos":I
    .end local v3    # "spanSize":I
    add-int/lit8 v1, v1, 0x1

    .line 1215
    goto :goto_0

    .line 1216
    :cond_0
    return-void
.end method

.method public computeHorizontalScrollOffset(Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 1
    .param p1, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;

    .line 1908
    iget-boolean v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mUsingSpansToEstimateScrollBarDimensions:Z

    if-eqz v0, :cond_0

    .line 1909
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->computeScrollOffsetWithSpanInfo(Landroidx/recyclerview/widget/RecyclerView$State;)I

    move-result v0

    return v0

    .line 1911
    :cond_0
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->computeHorizontalScrollOffset(Landroidx/recyclerview/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeHorizontalScrollRange(Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 1
    .param p1, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;

    .line 1890
    iget-boolean v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mUsingSpansToEstimateScrollBarDimensions:Z

    if-eqz v0, :cond_0

    .line 1891
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->computeScrollRangeWithSpanInfo(Landroidx/recyclerview/widget/RecyclerView$State;)I

    move-result v0

    return v0

    .line 1893
    :cond_0
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->computeHorizontalScrollRange(Landroidx/recyclerview/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeVerticalScrollOffset(Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 1
    .param p1, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;

    .line 1917
    iget-boolean v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mUsingSpansToEstimateScrollBarDimensions:Z

    if-eqz v0, :cond_0

    .line 1918
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->computeScrollOffsetWithSpanInfo(Landroidx/recyclerview/widget/RecyclerView$State;)I

    move-result v0

    return v0

    .line 1920
    :cond_0
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->computeVerticalScrollOffset(Landroidx/recyclerview/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeVerticalScrollRange(Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 1
    .param p1, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;

    .line 1899
    iget-boolean v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mUsingSpansToEstimateScrollBarDimensions:Z

    if-eqz v0, :cond_0

    .line 1900
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/GridLayoutManager;->computeScrollRangeWithSpanInfo(Landroidx/recyclerview/widget/RecyclerView$State;)I

    move-result v0

    return v0

    .line 1902
    :cond_0
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->computeVerticalScrollRange(Landroidx/recyclerview/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method findPositionOfFirstItemOnARowBelowForHorizontalGrid(I)I
    .locals 8
    .param p1, "startingRow"    # I

    .line 678
    const/4 v0, -0x1

    if-gez p1, :cond_0

    .line 683
    return v0

    .line 686
    :cond_0
    iget v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 693
    return v0

    .line 711
    :cond_1
    new-instance v1, Ljava/util/TreeMap;

    invoke-direct {v1}, Ljava/util/TreeMap;-><init>()V

    .line 712
    .local v1, "rowToFirstItemPositionMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    const/4 v2, 0x0

    .local v2, "position":I
    :goto_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getItemCount()I

    move-result v3

    if-ge v2, v3, :cond_5

    .line 713
    invoke-direct {p0, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->getRowIndices(I)Ljava/util/Set;

    move-result-object v3

    .line 714
    .local v3, "rows":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 715
    .local v5, "row":I
    if-gez v5, :cond_2

    .line 720
    return v0

    .line 723
    :cond_2
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 724
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v1, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 726
    .end local v5    # "row":I
    :cond_3
    goto :goto_1

    .line 712
    .end local v3    # "rows":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 729
    .end local v2    # "position":I
    :cond_5
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 730
    .local v3, "row":I
    if-le v3, p1, :cond_6

    .line 731
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 732
    .local v0, "scrollTargetPosition":I
    iput v3, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRowWithAccessibilityFocus:I

    .line 733
    const/4 v2, 0x0

    iput v2, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mColumnWithAccessibilityFocus:I

    .line 734
    return v0

    .line 736
    .end local v0    # "scrollTargetPosition":I
    .end local v3    # "row":I
    :cond_6
    goto :goto_2

    .line 737
    :cond_7
    return v0
.end method

.method findPositionOfLastItemOnARowAboveForHorizontalGrid(I)I
    .locals 8
    .param p1, "startingRow"    # I

    .line 614
    const/4 v0, -0x1

    if-gez p1, :cond_0

    .line 619
    return v0

    .line 622
    :cond_0
    iget v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 629
    return v0

    .line 649
    :cond_1
    new-instance v1, Ljava/util/TreeMap;

    invoke-static {}, Ljava/util/Collections;->reverseOrder()Ljava/util/Comparator;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 650
    .local v1, "rowToLastItemPositionMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    const/4 v2, 0x0

    .local v2, "position":I
    :goto_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getItemCount()I

    move-result v3

    if-ge v2, v3, :cond_4

    .line 651
    invoke-direct {p0, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->getRowIndices(I)Ljava/util/Set;

    move-result-object v3

    .line 652
    .local v3, "rows":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 653
    .local v5, "row":I
    if-gez v5, :cond_2

    .line 658
    return v0

    .line 660
    :cond_2
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v1, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 661
    .end local v5    # "row":I
    goto :goto_1

    .line 650
    .end local v3    # "rows":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 664
    .end local v2    # "position":I
    :cond_4
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 665
    .local v3, "row":I
    if-ge v3, p1, :cond_5

    .line 666
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 667
    .local v0, "scrollTargetPosition":I
    iput v3, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRowWithAccessibilityFocus:I

    .line 668
    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/GridLayoutManager;->getColumnIndex(I)I

    move-result v2

    iput v2, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mColumnWithAccessibilityFocus:I

    .line 669
    return v0

    .line 671
    .end local v0    # "scrollTargetPosition":I
    .end local v3    # "row":I
    :cond_5
    goto :goto_2

    .line 672
    :cond_6
    return v0
.end method

.method findReferenceChild(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;ZZ)Landroid/view/View;
    .locals 16
    .param p1, "recycler"    # Landroidx/recyclerview/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;
    .param p3, "layoutFromEnd"    # Z
    .param p4, "traverseChildrenInReverseOrder"    # Z

    .line 1101
    move-object/from16 v0, p0

    const/4 v1, 0x0

    .line 1102
    .local v1, "start":I
    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildCount()I

    move-result v2

    .line 1103
    .local v2, "end":I
    const/4 v3, 0x1

    .line 1104
    .local v3, "diff":I
    if-eqz p4, :cond_0

    .line 1105
    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildCount()I

    move-result v4

    add-int/lit8 v1, v4, -0x1

    .line 1106
    const/4 v2, -0x1

    .line 1107
    const/4 v3, -0x1

    .line 1110
    :cond_0
    invoke-virtual/range {p2 .. p2}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v4

    .line 1112
    .local v4, "itemCount":I
    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager;->ensureLayoutState()V

    .line 1113
    const/4 v5, 0x0

    .line 1114
    .local v5, "invalidMatch":Landroid/view/View;
    const/4 v6, 0x0

    .line 1116
    .local v6, "outOfBoundsMatch":Landroid/view/View;
    iget-object v7, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    invoke-virtual {v7}, Landroidx/recyclerview/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v7

    .line 1117
    .local v7, "boundsStart":I
    iget-object v8, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    invoke-virtual {v8}, Landroidx/recyclerview/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v8

    .line 1119
    .local v8, "boundsEnd":I
    move v9, v1

    .local v9, "i":I
    :goto_0
    if-eq v9, v2, :cond_7

    .line 1120
    invoke-virtual {v0, v9}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    .line 1121
    .local v10, "view":Landroid/view/View;
    invoke-virtual {v0, v10}, Landroidx/recyclerview/widget/GridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v11

    .line 1122
    .local v11, "position":I
    if-ltz v11, :cond_5

    if-ge v11, v4, :cond_5

    .line 1123
    move-object/from16 v12, p1

    move-object/from16 v13, p2

    invoke-direct {v0, v12, v13, v11}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanIndex(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v14

    .line 1124
    .local v14, "span":I
    if-eqz v14, :cond_1

    .line 1125
    goto :goto_2

    .line 1127
    :cond_1
    invoke-virtual {v10}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v15

    check-cast v15, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    invoke-virtual {v15}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->isItemRemoved()Z

    move-result v15

    if-eqz v15, :cond_2

    .line 1128
    if-nez v5, :cond_6

    .line 1129
    move-object v5, v10

    goto :goto_2

    .line 1131
    :cond_2
    iget-object v15, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    invoke-virtual {v15, v10}, Landroidx/recyclerview/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v15

    if-ge v15, v8, :cond_4

    iget-object v15, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    .line 1132
    invoke-virtual {v15, v10}, Landroidx/recyclerview/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v15

    if-ge v15, v7, :cond_3

    goto :goto_1

    .line 1137
    :cond_3
    return-object v10

    .line 1133
    :cond_4
    :goto_1
    if-nez v6, :cond_6

    .line 1134
    move-object v6, v10

    goto :goto_2

    .line 1122
    .end local v14    # "span":I
    :cond_5
    move-object/from16 v12, p1

    move-object/from16 v13, p2

    .line 1119
    .end local v10    # "view":Landroid/view/View;
    .end local v11    # "position":I
    :cond_6
    :goto_2
    add-int/2addr v9, v3

    goto :goto_0

    :cond_7
    move-object/from16 v12, p1

    move-object/from16 v13, p2

    .line 1141
    .end local v9    # "i":I
    if-eqz v6, :cond_8

    move-object v9, v6

    goto :goto_3

    :cond_8
    move-object v9, v5

    :goto_3
    return-object v9
.end method

.method public generateDefaultLayoutParams()Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
    .locals 3

    .line 910
    iget v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    const/4 v1, -0x2

    const/4 v2, -0x1

    if-nez v0, :cond_0

    .line 911
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;

    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;-><init>(II)V

    return-object v0

    .line 914
    :cond_0
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;

    invoke-direct {v0, v2, v1}, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/content/Context;Landroid/util/AttributeSet;)Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
    .locals 1
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 921
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;

    invoke-direct {v0, p1, p2}, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
    .locals 2
    .param p1, "lp"    # Landroid/view/ViewGroup$LayoutParams;

    .line 926
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_0

    .line 927
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;

    move-object v1, p1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    return-object v0

    .line 929
    :cond_0
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;

    invoke-direct {v0, p1}, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public getColumnCountForAccessibility(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 2
    .param p1, "recycler"    # Landroidx/recyclerview/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;

    .line 194
    iget v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 195
    iget v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getItemCount()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0

    .line 197
    :cond_0
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    if-ge v0, v1, :cond_1

    .line 198
    const/4 v0, 0x0

    return v0

    .line 202
    :cond_1
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-direct {p0, p1, p2, v0}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanGroupIndex(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v0

    add-int/2addr v0, v1

    return v0
.end method

.method public getRowCountForAccessibility(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 2
    .param p1, "recycler"    # Landroidx/recyclerview/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;

    .line 180
    iget v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    if-nez v0, :cond_0

    .line 181
    iget v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getItemCount()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0

    .line 183
    :cond_0
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_1

    .line 184
    const/4 v0, 0x0

    return v0

    .line 188
    :cond_1
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    sub-int/2addr v0, v1

    invoke-direct {p0, p1, p2, v0}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanGroupIndex(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v0

    add-int/2addr v0, v1

    return v0
.end method

.method getSpaceForSpanRange(II)I
    .locals 3
    .param p1, "startSpan"    # I
    .param p2, "spanSize"    # I

    .line 1027
    iget v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->isLayoutRTL()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1028
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mCachedBorders:[I

    iget v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    sub-int/2addr v1, p1

    aget v0, v0, v1

    iget-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mCachedBorders:[I

    iget v2, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    sub-int/2addr v2, p1

    sub-int/2addr v2, p2

    aget v1, v1, v2

    sub-int/2addr v0, v1

    return v0

    .line 1031
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mCachedBorders:[I

    add-int v1, p1, p2

    aget v0, v0, v1

    iget-object v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mCachedBorders:[I

    aget v1, v1, p1

    sub-int/2addr v0, v1

    return v0
.end method

.method public getSpanCount()I
    .locals 1

    .line 1490
    iget v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    return v0
.end method

.method public getSpanSizeLookup()Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;
    .locals 1

    .line 954
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    return-object v0
.end method

.method public isUsingSpansToEstimateScrollbarDimensions()Z
    .locals 1

    .line 1962
    iget-boolean v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mUsingSpansToEstimateScrollBarDimensions:Z

    return v0
.end method

.method layoutChunk(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;Landroidx/recyclerview/widget/LinearLayoutManager$LayoutChunkResult;)V
    .locals 24
    .param p1, "recycler"    # Landroidx/recyclerview/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;
    .param p3, "layoutState"    # Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;
    .param p4, "result"    # Landroidx/recyclerview/widget/LinearLayoutManager$LayoutChunkResult;

    .line 1221
    move-object/from16 v0, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    move-object/from16 v9, p4

    iget-object v1, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/OrientationHelper;->getModeInOther()I

    move-result v10

    .line 1222
    .local v10, "otherDirSpecMode":I
    const/4 v11, 0x1

    const/high16 v2, 0x40000000    # 2.0f

    if-eq v10, v2, :cond_0

    move v3, v11

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    move v12, v3

    .line 1223
    .local v12, "flexibleInOtherDir":Z
    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildCount()I

    move-result v3

    if-lez v3, :cond_1

    iget-object v3, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mCachedBorders:[I

    iget v4, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    aget v3, v3, v4

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_1
    move v13, v3

    .line 1227
    .local v13, "currentOtherDirSize":I
    if-eqz v12, :cond_2

    .line 1228
    invoke-direct {v0}, Landroidx/recyclerview/widget/GridLayoutManager;->updateMeasurements()V

    .line 1230
    :cond_2
    iget v3, v8, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;->mItemDirection:I

    if-ne v3, v11, :cond_3

    move v3, v11

    goto :goto_2

    :cond_3
    const/4 v3, 0x0

    :goto_2
    move v14, v3

    .line 1232
    .local v14, "layingOutInPrimaryDirection":Z
    const/4 v3, 0x0

    .line 1233
    .local v3, "count":I
    iget v4, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    .line 1234
    .local v4, "remainingSpan":I
    if-nez v14, :cond_4

    .line 1235
    iget v5, v8, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    invoke-direct {v0, v6, v7, v5}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanIndex(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v5

    .line 1236
    .local v5, "itemSpanIndex":I
    iget v15, v8, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    invoke-direct {v0, v6, v7, v15}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanSize(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v15

    .line 1237
    .local v15, "itemSpanSize":I
    add-int v4, v5, v15

    move v15, v3

    goto :goto_3

    .line 1234
    .end local v5    # "itemSpanIndex":I
    .end local v15    # "itemSpanSize":I
    :cond_4
    move v15, v3

    .line 1239
    .end local v3    # "count":I
    .local v15, "count":I
    :goto_3
    iget v3, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    if-ge v15, v3, :cond_8

    invoke-virtual {v8, v7}, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;->hasMore(Landroidx/recyclerview/widget/RecyclerView$State;)Z

    move-result v3

    if-eqz v3, :cond_8

    if-lez v4, :cond_8

    .line 1240
    iget v3, v8, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;->mCurrentPosition:I

    .line 1241
    .local v3, "pos":I
    invoke-direct {v0, v6, v7, v3}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanSize(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v5

    .line 1242
    .local v5, "spanSize":I
    iget v2, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    if-gt v5, v2, :cond_7

    .line 1247
    sub-int/2addr v4, v5

    .line 1248
    if-gez v4, :cond_5

    .line 1249
    goto :goto_4

    .line 1251
    :cond_5
    invoke-virtual {v8, v6}, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;->next(Landroidx/recyclerview/widget/RecyclerView$Recycler;)Landroid/view/View;

    move-result-object v2

    .line 1252
    .local v2, "view":Landroid/view/View;
    if-nez v2, :cond_6

    .line 1253
    goto :goto_4

    .line 1255
    :cond_6
    iget-object v1, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    aput-object v2, v1, v15

    .line 1256
    nop

    .end local v2    # "view":Landroid/view/View;
    .end local v3    # "pos":I
    .end local v5    # "spanSize":I
    add-int/lit8 v15, v15, 0x1

    .line 1257
    const/high16 v2, 0x40000000    # 2.0f

    goto :goto_3

    .line 1243
    .restart local v3    # "pos":I
    .restart local v5    # "spanSize":I
    :cond_7
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Item at position "

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v11, " requires "

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v11, " spans but GridLayoutManager has only "

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v11, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v11, " spans."

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1259
    .end local v3    # "pos":I
    .end local v5    # "spanSize":I
    :cond_8
    :goto_4
    move/from16 v18, v4

    .end local v4    # "remainingSpan":I
    .local v18, "remainingSpan":I
    if-nez v15, :cond_9

    .line 1260
    iput-boolean v11, v9, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutChunkResult;->mFinished:Z

    .line 1261
    return-void

    .line 1264
    :cond_9
    const/4 v1, 0x0

    .line 1265
    .local v1, "maxSize":I
    const/4 v2, 0x0

    .line 1268
    .local v2, "maxSizeInOther":F
    invoke-direct {v0, v6, v7, v15, v14}, Landroidx/recyclerview/widget/GridLayoutManager;->assignSpans(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;IZ)V

    .line 1269
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_5
    if-ge v3, v15, :cond_f

    .line 1270
    iget-object v4, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    aget-object v4, v4, v3

    .line 1271
    .local v4, "view":Landroid/view/View;
    iget-object v5, v8, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;->mScrapList:Ljava/util/List;

    if-nez v5, :cond_b

    .line 1272
    if-eqz v14, :cond_a

    .line 1273
    invoke-virtual {v0, v4}, Landroidx/recyclerview/widget/GridLayoutManager;->addView(Landroid/view/View;)V

    const/4 v5, 0x0

    goto :goto_6

    .line 1275
    :cond_a
    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Landroidx/recyclerview/widget/GridLayoutManager;->addView(Landroid/view/View;I)V

    goto :goto_6

    .line 1278
    :cond_b
    const/4 v5, 0x0

    if-eqz v14, :cond_c

    .line 1279
    invoke-virtual {v0, v4}, Landroidx/recyclerview/widget/GridLayoutManager;->addDisappearingView(Landroid/view/View;)V

    goto :goto_6

    .line 1281
    :cond_c
    invoke-virtual {v0, v4, v5}, Landroidx/recyclerview/widget/GridLayoutManager;->addDisappearingView(Landroid/view/View;I)V

    .line 1284
    :goto_6
    iget-object v11, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mDecorInsets:Landroid/graphics/Rect;

    invoke-virtual {v0, v4, v11}, Landroidx/recyclerview/widget/GridLayoutManager;->calculateItemDecorationsForChild(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 1286
    invoke-direct {v0, v4, v10, v5}, Landroidx/recyclerview/widget/GridLayoutManager;->measureChild(Landroid/view/View;IZ)V

    .line 1287
    iget-object v5, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    invoke-virtual {v5, v4}, Landroidx/recyclerview/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v5

    .line 1288
    .local v5, "size":I
    if-le v5, v1, :cond_d

    .line 1289
    move v1, v5

    .line 1291
    :cond_d
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    check-cast v11, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;

    .line 1292
    .local v11, "lp":Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;
    move/from16 v19, v1

    .end local v1    # "maxSize":I
    .local v19, "maxSize":I
    iget-object v1, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    invoke-virtual {v1, v4}, Landroidx/recyclerview/widget/OrientationHelper;->getDecoratedMeasurementInOther(Landroid/view/View;)I

    move-result v1

    int-to-float v1, v1

    const/high16 v20, 0x3f800000    # 1.0f

    mul-float v1, v1, v20

    move/from16 v20, v1

    iget v1, v11, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mSpanSize:I

    int-to-float v1, v1

    div-float v1, v20, v1

    .line 1294
    .local v1, "otherSize":F
    cmpl-float v20, v1, v2

    if-lez v20, :cond_e

    .line 1295
    move v2, v1

    .line 1269
    .end local v1    # "otherSize":F
    .end local v4    # "view":Landroid/view/View;
    .end local v5    # "size":I
    .end local v11    # "lp":Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;
    :cond_e
    add-int/lit8 v3, v3, 0x1

    move/from16 v1, v19

    const/4 v11, 0x1

    goto :goto_5

    .line 1298
    .end local v3    # "i":I
    .end local v19    # "maxSize":I
    .local v1, "maxSize":I
    :cond_f
    if-eqz v12, :cond_12

    .line 1300
    invoke-direct {v0, v2, v13}, Landroidx/recyclerview/widget/GridLayoutManager;->guessMeasurement(FI)V

    .line 1302
    const/4 v1, 0x0

    .line 1303
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_7
    if-ge v3, v15, :cond_11

    .line 1304
    iget-object v4, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    aget-object v4, v4, v3

    .line 1305
    .restart local v4    # "view":Landroid/view/View;
    const/4 v5, 0x1

    const/high16 v11, 0x40000000    # 2.0f

    invoke-direct {v0, v4, v11, v5}, Landroidx/recyclerview/widget/GridLayoutManager;->measureChild(Landroid/view/View;IZ)V

    .line 1306
    iget-object v5, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    invoke-virtual {v5, v4}, Landroidx/recyclerview/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v5

    .line 1307
    .restart local v5    # "size":I
    if-le v5, v1, :cond_10

    .line 1308
    move v1, v5

    .line 1303
    .end local v4    # "view":Landroid/view/View;
    .end local v5    # "size":I
    :cond_10
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    :cond_11
    move v11, v1

    goto :goto_8

    .line 1298
    .end local v3    # "i":I
    :cond_12
    move v11, v1

    .line 1315
    .end local v1    # "maxSize":I
    .local v11, "maxSize":I
    :goto_8
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_9
    if-ge v1, v15, :cond_15

    .line 1316
    iget-object v3, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    aget-object v3, v3, v1

    .line 1317
    .local v3, "view":Landroid/view/View;
    iget-object v4, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    invoke-virtual {v4, v3}, Landroidx/recyclerview/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v4

    if-eq v4, v11, :cond_14

    .line 1318
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;

    .line 1319
    .local v4, "lp":Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;
    iget-object v5, v4, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mDecorInsets:Landroid/graphics/Rect;

    .line 1320
    .local v5, "decorInsets":Landroid/graphics/Rect;
    move/from16 v19, v1

    .end local v1    # "i":I
    .local v19, "i":I
    iget v1, v5, Landroid/graphics/Rect;->top:I

    move/from16 v20, v1

    iget v1, v5, Landroid/graphics/Rect;->bottom:I

    add-int v1, v20, v1

    move/from16 v20, v1

    iget v1, v4, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->topMargin:I

    add-int v1, v20, v1

    move/from16 v20, v1

    iget v1, v4, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->bottomMargin:I

    add-int v1, v20, v1

    .line 1322
    .local v1, "verticalInsets":I
    move/from16 v20, v2

    .end local v2    # "maxSizeInOther":F
    .local v20, "maxSizeInOther":F
    iget v2, v5, Landroid/graphics/Rect;->left:I

    move/from16 v21, v2

    iget v2, v5, Landroid/graphics/Rect;->right:I

    add-int v2, v21, v2

    move/from16 v21, v2

    iget v2, v4, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->leftMargin:I

    add-int v2, v21, v2

    move/from16 v21, v2

    iget v2, v4, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->rightMargin:I

    add-int v2, v21, v2

    .line 1324
    .local v2, "horizontalInsets":I
    move-object/from16 v21, v5

    .end local v5    # "decorInsets":Landroid/graphics/Rect;
    .local v21, "decorInsets":Landroid/graphics/Rect;
    iget v5, v4, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I

    iget v6, v4, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mSpanSize:I

    invoke-virtual {v0, v5, v6}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpaceForSpanRange(II)I

    move-result v5

    .line 1327
    .local v5, "totalSpaceInOther":I
    iget v6, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    const/4 v7, 0x1

    if-ne v6, v7, :cond_13

    .line 1328
    iget v6, v4, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->width:I

    move/from16 v16, v10

    const/4 v7, 0x0

    const/high16 v10, 0x40000000    # 2.0f

    .end local v10    # "otherDirSpecMode":I
    .local v16, "otherDirSpecMode":I
    invoke-static {v5, v10, v2, v6, v7}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildMeasureSpec(IIIIZ)I

    move-result v6

    .line 1330
    .local v6, "wSpec":I
    sub-int v7, v11, v1

    invoke-static {v7, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    move/from16 v22, v2

    const/4 v2, 0x0

    .local v7, "hSpec":I
    goto :goto_a

    .line 1333
    .end local v6    # "wSpec":I
    .end local v7    # "hSpec":I
    .end local v16    # "otherDirSpecMode":I
    .restart local v10    # "otherDirSpecMode":I
    :cond_13
    move/from16 v16, v10

    const/high16 v10, 0x40000000    # 2.0f

    .end local v10    # "otherDirSpecMode":I
    .restart local v16    # "otherDirSpecMode":I
    sub-int v6, v11, v2

    invoke-static {v6, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .line 1335
    .restart local v6    # "wSpec":I
    iget v7, v4, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->height:I

    move/from16 v22, v2

    const/4 v2, 0x0

    .end local v2    # "horizontalInsets":I
    .local v22, "horizontalInsets":I
    invoke-static {v5, v10, v1, v7, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildMeasureSpec(IIIIZ)I

    move-result v7

    .line 1338
    .restart local v7    # "hSpec":I
    :goto_a
    const/4 v2, 0x1

    invoke-direct {v0, v3, v6, v7, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;IIZ)V

    goto :goto_b

    .line 1317
    .end local v4    # "lp":Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;
    .end local v5    # "totalSpaceInOther":I
    .end local v6    # "wSpec":I
    .end local v7    # "hSpec":I
    .end local v16    # "otherDirSpecMode":I
    .end local v19    # "i":I
    .end local v20    # "maxSizeInOther":F
    .end local v21    # "decorInsets":Landroid/graphics/Rect;
    .end local v22    # "horizontalInsets":I
    .local v1, "i":I
    .local v2, "maxSizeInOther":F
    .restart local v10    # "otherDirSpecMode":I
    :cond_14
    move/from16 v19, v1

    move/from16 v20, v2

    move/from16 v16, v10

    const/high16 v10, 0x40000000    # 2.0f

    .line 1315
    .end local v1    # "i":I
    .end local v2    # "maxSizeInOther":F
    .end local v3    # "view":Landroid/view/View;
    .end local v10    # "otherDirSpecMode":I
    .restart local v16    # "otherDirSpecMode":I
    .restart local v19    # "i":I
    .restart local v20    # "maxSizeInOther":F
    :goto_b
    add-int/lit8 v1, v19, 0x1

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    move/from16 v10, v16

    move/from16 v2, v20

    .end local v19    # "i":I
    .restart local v1    # "i":I
    goto/16 :goto_9

    .end local v16    # "otherDirSpecMode":I
    .end local v20    # "maxSizeInOther":F
    .restart local v2    # "maxSizeInOther":F
    .restart local v10    # "otherDirSpecMode":I
    :cond_15
    move/from16 v19, v1

    move/from16 v20, v2

    move/from16 v16, v10

    .line 1342
    .end local v1    # "i":I
    .end local v2    # "maxSizeInOther":F
    .end local v10    # "otherDirSpecMode":I
    .restart local v16    # "otherDirSpecMode":I
    .restart local v20    # "maxSizeInOther":F
    iput v11, v9, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutChunkResult;->mConsumed:I

    .line 1344
    const/4 v1, 0x0

    .local v1, "left":I
    const/4 v2, 0x0

    .local v2, "right":I
    const/4 v3, 0x0

    .local v3, "top":I
    const/4 v4, 0x0

    .line 1345
    .local v4, "bottom":I
    iget v5, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    const/4 v6, -0x1

    const/4 v7, 0x1

    if-ne v5, v7, :cond_17

    .line 1346
    iget v5, v8, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    if-ne v5, v6, :cond_16

    .line 1347
    iget v4, v8, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 1348
    sub-int v3, v4, v11

    goto :goto_c

    .line 1350
    :cond_16
    iget v3, v8, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 1351
    add-int v4, v3, v11

    goto :goto_c

    .line 1354
    :cond_17
    iget v5, v8, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;->mLayoutDirection:I

    if-ne v5, v6, :cond_18

    .line 1355
    iget v2, v8, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 1356
    sub-int v1, v2, v11

    goto :goto_c

    .line 1358
    :cond_18
    iget v1, v8, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutState;->mOffset:I

    .line 1359
    add-int v2, v1, v11

    .line 1362
    :goto_c
    const/4 v5, 0x0

    move v6, v5

    .line 1392
    .local v6, "i":I
    :goto_d
    iget-object v5, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSet:[Landroid/view/View;

    .line 1362
    if-ge v6, v15, :cond_1d

    .line 1363
    move v7, v1

    .end local v1    # "left":I
    .local v7, "left":I
    aget-object v1, v5, v6

    .line 1364
    .local v1, "view":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;

    .line 1365
    .local v10, "params":Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;
    iget v5, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    move/from16 v17, v2

    const/4 v2, 0x1

    .end local v2    # "right":I
    .local v17, "right":I
    if-ne v5, v2, :cond_1a

    .line 1366
    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager;->isLayoutRTL()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 1367
    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager;->getPaddingLeft()I

    move-result v2

    iget-object v5, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mCachedBorders:[I

    move/from16 v19, v2

    iget v2, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    move/from16 v21, v2

    iget v2, v10, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I

    sub-int v2, v21, v2

    aget v2, v5, v2

    add-int v2, v19, v2

    .line 1368
    .end local v17    # "right":I
    .restart local v2    # "right":I
    iget-object v5, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    invoke-virtual {v5, v1}, Landroidx/recyclerview/widget/OrientationHelper;->getDecoratedMeasurementInOther(Landroid/view/View;)I

    move-result v5

    sub-int v5, v2, v5

    move/from16 v23, v4

    move v4, v2

    move v2, v5

    move/from16 v5, v23

    .end local v7    # "left":I
    .local v5, "left":I
    goto :goto_e

    .line 1370
    .end local v2    # "right":I
    .end local v5    # "left":I
    .restart local v7    # "left":I
    .restart local v17    # "right":I
    :cond_19
    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager;->getPaddingLeft()I

    move-result v2

    iget-object v5, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mCachedBorders:[I

    move/from16 v19, v2

    iget v2, v10, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I

    aget v2, v5, v2

    add-int v2, v19, v2

    .line 1371
    .end local v7    # "left":I
    .local v2, "left":I
    iget-object v5, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    invoke-virtual {v5, v1}, Landroidx/recyclerview/widget/OrientationHelper;->getDecoratedMeasurementInOther(Landroid/view/View;)I

    move-result v5

    add-int/2addr v5, v2

    move/from16 v23, v5

    move v5, v4

    move/from16 v4, v23

    .end local v17    # "right":I
    .local v5, "right":I
    goto :goto_e

    .line 1374
    .end local v2    # "left":I
    .end local v5    # "right":I
    .restart local v7    # "left":I
    .restart local v17    # "right":I
    :cond_1a
    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager;->getPaddingTop()I

    move-result v2

    iget-object v5, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mCachedBorders:[I

    move/from16 v19, v2

    iget v2, v10, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I

    aget v2, v5, v2

    add-int v3, v19, v2

    .line 1375
    iget-object v2, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientationHelper:Landroidx/recyclerview/widget/OrientationHelper;

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/OrientationHelper;->getDecoratedMeasurementInOther(Landroid/view/View;)I

    move-result v2

    add-int v4, v3, v2

    move v5, v4

    move v2, v7

    move/from16 v4, v17

    .line 1379
    .end local v7    # "left":I
    .end local v17    # "right":I
    .restart local v2    # "left":I
    .local v4, "right":I
    .local v5, "bottom":I
    :goto_e
    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/GridLayoutManager;->layoutDecoratedWithMargins(Landroid/view/View;IIII)V

    .line 1387
    invoke-virtual {v10}, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->isItemRemoved()Z

    move-result v0

    if-nez v0, :cond_1c

    invoke-virtual {v10}, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->isItemChanged()Z

    move-result v0

    if-eqz v0, :cond_1b

    goto :goto_f

    :cond_1b
    const/4 v0, 0x1

    goto :goto_10

    .line 1388
    :cond_1c
    :goto_f
    const/4 v0, 0x1

    iput-boolean v0, v9, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutChunkResult;->mIgnoreConsumed:Z

    .line 1390
    :goto_10
    iget-boolean v7, v9, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutChunkResult;->mFocusable:Z

    invoke-virtual {v1}, Landroid/view/View;->hasFocusable()Z

    move-result v17

    or-int v7, v7, v17

    iput-boolean v7, v9, Landroidx/recyclerview/widget/LinearLayoutManager$LayoutChunkResult;->mFocusable:Z

    .line 1362
    .end local v1    # "view":Landroid/view/View;
    .end local v10    # "params":Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, p0

    move v1, v2

    move v2, v4

    move v4, v5

    goto/16 :goto_d

    .line 1392
    .end local v5    # "bottom":I
    .end local v6    # "i":I
    .local v1, "left":I
    .local v2, "right":I
    .local v4, "bottom":I
    :cond_1d
    const/4 v0, 0x0

    invoke-static {v5, v0}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1393
    return-void
.end method

.method onAnchorReady(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;Landroidx/recyclerview/widget/LinearLayoutManager$AnchorInfo;I)V
    .locals 1
    .param p1, "recycler"    # Landroidx/recyclerview/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;
    .param p3, "anchorInfo"    # Landroidx/recyclerview/widget/LinearLayoutManager$AnchorInfo;
    .param p4, "itemDirection"    # I

    .line 1038
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/LinearLayoutManager;->onAnchorReady(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;Landroidx/recyclerview/widget/LinearLayoutManager$AnchorInfo;I)V

    .line 1039
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->updateMeasurements()V

    .line 1040
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$State;->isPreLayout()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1041
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/GridLayoutManager;->ensureAnchorIsInCorrectSpan(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;Landroidx/recyclerview/widget/LinearLayoutManager$AnchorInfo;I)V

    .line 1043
    :cond_0
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->ensureViewSet()V

    .line 1044
    return-void
.end method

.method public onFocusSearchFailed(Landroid/view/View;ILandroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)Landroid/view/View;
    .locals 32
    .param p1, "focused"    # Landroid/view/View;
    .param p2, "direction"    # I
    .param p3, "recycler"    # Landroidx/recyclerview/widget/RecyclerView$Recycler;
    .param p4, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;

    .line 1763
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual/range {p0 .. p1}, Landroidx/recyclerview/widget/GridLayoutManager;->findContainingItemView(Landroid/view/View;)Landroid/view/View;

    move-result-object v3

    .line 1764
    .local v3, "prevFocusedChild":Landroid/view/View;
    const/4 v4, 0x0

    if-nez v3, :cond_0

    .line 1765
    return-object v4

    .line 1767
    :cond_0
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;

    .line 1768
    .local v5, "lp":Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;
    iget v6, v5, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I

    .line 1769
    .local v6, "prevSpanStart":I
    iget v7, v5, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I

    iget v8, v5, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mSpanSize:I

    add-int/2addr v7, v8

    .line 1770
    .local v7, "prevSpanEnd":I
    invoke-super/range {p0 .. p4}, Landroidx/recyclerview/widget/LinearLayoutManager;->onFocusSearchFailed(Landroid/view/View;ILandroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)Landroid/view/View;

    move-result-object v8

    .line 1771
    .local v8, "view":Landroid/view/View;
    if-nez v8, :cond_1

    .line 1772
    return-object v4

    .line 1776
    :cond_1
    move/from16 v4, p2

    invoke-virtual {v0, v4}, Landroidx/recyclerview/widget/GridLayoutManager;->convertFocusDirectionToLayoutDirection(I)I

    move-result v9

    .line 1777
    .local v9, "layoutDir":I
    const/4 v11, 0x1

    if-ne v9, v11, :cond_2

    move v12, v11

    goto :goto_0

    :cond_2
    const/4 v12, 0x0

    :goto_0
    iget-boolean v13, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mShouldReverseLayout:Z

    if-eq v12, v13, :cond_3

    move v12, v11

    goto :goto_1

    :cond_3
    const/4 v12, 0x0

    .line 1779
    .local v12, "ascend":Z
    :goto_1
    if-eqz v12, :cond_4

    .line 1780
    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildCount()I

    move-result v13

    sub-int/2addr v13, v11

    .line 1781
    .local v13, "start":I
    const/4 v14, -0x1

    .line 1782
    .local v14, "inc":I
    const/4 v15, -0x1

    .local v15, "limit":I
    goto :goto_2

    .line 1784
    .end local v13    # "start":I
    .end local v14    # "inc":I
    .end local v15    # "limit":I
    :cond_4
    const/4 v13, 0x0

    .line 1785
    .restart local v13    # "start":I
    const/4 v14, 0x1

    .line 1786
    .restart local v14    # "inc":I
    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildCount()I

    move-result v15

    .line 1788
    .restart local v15    # "limit":I
    :goto_2
    iget v10, v0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    if-ne v10, v11, :cond_5

    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager;->isLayoutRTL()Z

    move-result v10

    if-eqz v10, :cond_5

    move v10, v11

    goto :goto_3

    :cond_5
    const/4 v10, 0x0

    .line 1793
    .local v10, "preferLastSpan":Z
    :goto_3
    const/16 v17, 0x0

    .line 1794
    .local v17, "focusableWeakCandidate":Landroid/view/View;
    const/16 v18, -0x1

    .line 1795
    .local v18, "focusableWeakCandidateSpanIndex":I
    const/16 v19, 0x0

    .line 1803
    .local v19, "focusableWeakCandidateOverlap":I
    const/16 v20, 0x0

    .line 1804
    .local v20, "unfocusableWeakCandidate":Landroid/view/View;
    const/16 v21, -0x1

    .line 1805
    .local v21, "unfocusableWeakCandidateSpanIndex":I
    const/16 v22, 0x0

    .line 1812
    .local v22, "unfocusableWeakCandidateOverlap":I
    invoke-direct {v0, v1, v2, v13}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanGroupIndex(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v11

    .line 1813
    .local v11, "focusableSpanGroupIndex":I
    move/from16 v24, v13

    move/from16 v4, v18

    move-object/from16 v18, v5

    move/from16 v5, v19

    move-object/from16 v19, v8

    move/from16 v8, v21

    move/from16 v21, v9

    move/from16 v9, v22

    move/from16 v22, v12

    move/from16 v12, v24

    .local v4, "focusableWeakCandidateSpanIndex":I
    .local v5, "focusableWeakCandidateOverlap":I
    .local v8, "unfocusableWeakCandidateSpanIndex":I
    .local v9, "unfocusableWeakCandidateOverlap":I
    .local v12, "i":I
    .local v18, "lp":Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;
    .local v19, "view":Landroid/view/View;
    .local v21, "layoutDir":I
    .local v22, "ascend":Z
    :goto_4
    if-eq v12, v15, :cond_18

    .line 1814
    move/from16 v24, v13

    .end local v13    # "start":I
    .local v24, "start":I
    invoke-direct {v0, v1, v2, v12}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanGroupIndex(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v13

    .line 1815
    .local v13, "spanGroupIndex":I
    invoke-virtual {v0, v12}, Landroidx/recyclerview/widget/GridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1816
    .local v1, "candidate":Landroid/view/View;
    if-ne v1, v3, :cond_6

    .line 1817
    move-object/from16 v25, v3

    move/from16 v31, v4

    move/from16 v16, v5

    move/from16 v26, v11

    goto/16 :goto_9

    .line 1820
    :cond_6
    invoke-virtual {v1}, Landroid/view/View;->hasFocusable()Z

    move-result v25

    if-eqz v25, :cond_8

    if-eq v13, v11, :cond_8

    .line 1825
    if-eqz v17, :cond_7

    .line 1826
    move-object/from16 v25, v3

    move/from16 v31, v4

    move/from16 v16, v5

    move/from16 v26, v11

    goto/16 :goto_9

    .line 1825
    :cond_7
    move-object/from16 v25, v3

    move/from16 v31, v4

    move/from16 v16, v5

    move/from16 v26, v11

    move/from16 v30, v12

    const/4 v5, 0x1

    goto/16 :goto_7

    .line 1831
    :cond_8
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v25

    move-object/from16 v2, v25

    check-cast v2, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;

    .line 1832
    .local v2, "candidateLp":Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;
    move-object/from16 v25, v3

    .end local v3    # "prevFocusedChild":Landroid/view/View;
    .local v25, "prevFocusedChild":Landroid/view/View;
    iget v3, v2, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I

    .line 1833
    .local v3, "candidateStart":I
    move/from16 v26, v11

    .end local v11    # "focusableSpanGroupIndex":I
    .local v26, "focusableSpanGroupIndex":I
    iget v11, v2, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I

    move/from16 v27, v11

    iget v11, v2, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mSpanSize:I

    add-int v11, v27, v11

    .line 1834
    .local v11, "candidateEnd":I
    invoke-virtual {v1}, Landroid/view/View;->hasFocusable()Z

    move-result v27

    if-eqz v27, :cond_9

    if-ne v3, v6, :cond_9

    if-ne v11, v7, :cond_9

    .line 1836
    return-object v1

    .line 1838
    :cond_9
    const/16 v27, 0x0

    .line 1839
    .local v27, "assignAsWeek":Z
    invoke-virtual {v1}, Landroid/view/View;->hasFocusable()Z

    move-result v28

    if-eqz v28, :cond_a

    if-eqz v17, :cond_b

    .line 1840
    :cond_a
    invoke-virtual {v1}, Landroid/view/View;->hasFocusable()Z

    move-result v28

    if-nez v28, :cond_c

    if-nez v20, :cond_c

    .line 1841
    :cond_b
    const/16 v27, 0x1

    move/from16 v31, v4

    move/from16 v16, v5

    move/from16 v30, v12

    const/4 v5, 0x1

    goto :goto_6

    .line 1843
    :cond_c
    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    move-result v28

    .line 1844
    .local v28, "maxStart":I
    invoke-static {v11, v7}, Ljava/lang/Math;->min(II)I

    move-result v29

    .line 1845
    .local v29, "minEnd":I
    move/from16 v30, v12

    .end local v12    # "i":I
    .local v30, "i":I
    sub-int v12, v29, v28

    .line 1846
    .local v12, "overlap":I
    invoke-virtual {v1}, Landroid/view/View;->hasFocusable()Z

    move-result v31

    if-eqz v31, :cond_11

    .line 1847
    if-le v12, v5, :cond_d

    .line 1848
    const/16 v27, 0x1

    move/from16 v31, v4

    move/from16 v16, v5

    const/4 v5, 0x1

    goto :goto_6

    .line 1849
    :cond_d
    if-ne v12, v5, :cond_f

    move/from16 v31, v4

    if-le v3, v4, :cond_e

    const/4 v4, 0x1

    goto :goto_5

    :cond_e
    const/4 v4, 0x0

    .end local v4    # "focusableWeakCandidateSpanIndex":I
    .local v31, "focusableWeakCandidateSpanIndex":I
    :goto_5
    if-ne v10, v4, :cond_10

    .line 1852
    const/16 v27, 0x1

    move/from16 v16, v5

    const/4 v5, 0x1

    goto :goto_6

    .line 1849
    .end local v31    # "focusableWeakCandidateSpanIndex":I
    .restart local v4    # "focusableWeakCandidateSpanIndex":I
    :cond_f
    move/from16 v31, v4

    .end local v4    # "focusableWeakCandidateSpanIndex":I
    .restart local v31    # "focusableWeakCandidateSpanIndex":I
    :cond_10
    move/from16 v16, v5

    const/4 v5, 0x1

    goto :goto_6

    .line 1854
    .end local v31    # "focusableWeakCandidateSpanIndex":I
    .restart local v4    # "focusableWeakCandidateSpanIndex":I
    :cond_11
    move/from16 v31, v4

    .end local v4    # "focusableWeakCandidateSpanIndex":I
    .restart local v31    # "focusableWeakCandidateSpanIndex":I
    if-nez v17, :cond_14

    .line 1855
    move/from16 v16, v5

    const/4 v4, 0x0

    const/4 v5, 0x1

    .end local v5    # "focusableWeakCandidateOverlap":I
    .local v16, "focusableWeakCandidateOverlap":I
    invoke-virtual {v0, v1, v4, v5}, Landroidx/recyclerview/widget/GridLayoutManager;->isViewPartiallyVisible(Landroid/view/View;ZZ)Z

    move-result v23

    if-eqz v23, :cond_15

    .line 1856
    if-le v12, v9, :cond_12

    .line 1857
    const/16 v27, 0x1

    goto :goto_6

    .line 1858
    :cond_12
    if-ne v12, v9, :cond_15

    if-le v3, v8, :cond_13

    move v4, v5

    :cond_13
    if-ne v10, v4, :cond_15

    .line 1861
    const/16 v27, 0x1

    goto :goto_6

    .line 1854
    .end local v16    # "focusableWeakCandidateOverlap":I
    .restart local v5    # "focusableWeakCandidateOverlap":I
    :cond_14
    move/from16 v16, v5

    const/4 v5, 0x1

    .line 1866
    .end local v5    # "focusableWeakCandidateOverlap":I
    .end local v12    # "overlap":I
    .end local v28    # "maxStart":I
    .end local v29    # "minEnd":I
    .restart local v16    # "focusableWeakCandidateOverlap":I
    :cond_15
    :goto_6
    if-eqz v27, :cond_17

    .line 1867
    invoke-virtual {v1}, Landroid/view/View;->hasFocusable()Z

    move-result v4

    if-eqz v4, :cond_16

    .line 1868
    move-object v4, v1

    .line 1869
    .end local v17    # "focusableWeakCandidate":Landroid/view/View;
    .local v4, "focusableWeakCandidate":Landroid/view/View;
    iget v12, v2, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I

    .line 1870
    .end local v31    # "focusableWeakCandidateSpanIndex":I
    .local v12, "focusableWeakCandidateSpanIndex":I
    invoke-static {v11, v7}, Ljava/lang/Math;->min(II)I

    move-result v17

    .line 1871
    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    move-result v28

    sub-int v17, v17, v28

    move/from16 v16, v17

    move-object/from16 v17, v4

    move v4, v12

    .end local v16    # "focusableWeakCandidateOverlap":I
    .local v17, "focusableWeakCandidateOverlap":I
    goto :goto_8

    .line 1873
    .end local v4    # "focusableWeakCandidate":Landroid/view/View;
    .end local v12    # "focusableWeakCandidateSpanIndex":I
    .restart local v16    # "focusableWeakCandidateOverlap":I
    .local v17, "focusableWeakCandidate":Landroid/view/View;
    .restart local v31    # "focusableWeakCandidateSpanIndex":I
    :cond_16
    move-object v4, v1

    .line 1874
    .end local v20    # "unfocusableWeakCandidate":Landroid/view/View;
    .local v4, "unfocusableWeakCandidate":Landroid/view/View;
    iget v8, v2, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->mSpanIndex:I

    .line 1875
    invoke-static {v11, v7}, Ljava/lang/Math;->min(II)I

    move-result v12

    .line 1876
    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    move-result v20

    sub-int v12, v12, v20

    move-object/from16 v20, v4

    move v9, v12

    move/from16 v4, v31

    .end local v9    # "unfocusableWeakCandidateOverlap":I
    .local v12, "unfocusableWeakCandidateOverlap":I
    goto :goto_8

    .line 1813
    .end local v1    # "candidate":Landroid/view/View;
    .end local v2    # "candidateLp":Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;
    .end local v13    # "spanGroupIndex":I
    .end local v16    # "focusableWeakCandidateOverlap":I
    .end local v25    # "prevFocusedChild":Landroid/view/View;
    .end local v26    # "focusableSpanGroupIndex":I
    .end local v27    # "assignAsWeek":Z
    .end local v30    # "i":I
    .end local v31    # "focusableWeakCandidateSpanIndex":I
    .local v3, "prevFocusedChild":Landroid/view/View;
    .local v4, "focusableWeakCandidateSpanIndex":I
    .restart local v5    # "focusableWeakCandidateOverlap":I
    .restart local v9    # "unfocusableWeakCandidateOverlap":I
    .local v11, "focusableSpanGroupIndex":I
    .local v12, "i":I
    .restart local v20    # "unfocusableWeakCandidate":Landroid/view/View;
    :cond_17
    :goto_7
    move/from16 v4, v31

    .end local v3    # "prevFocusedChild":Landroid/view/View;
    .end local v5    # "focusableWeakCandidateOverlap":I
    .end local v11    # "focusableSpanGroupIndex":I
    .end local v12    # "i":I
    .restart local v16    # "focusableWeakCandidateOverlap":I
    .restart local v25    # "prevFocusedChild":Landroid/view/View;
    .restart local v26    # "focusableSpanGroupIndex":I
    .restart local v30    # "i":I
    :goto_8
    add-int v12, v30, v14

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move/from16 v5, v16

    move/from16 v13, v24

    move-object/from16 v3, v25

    move/from16 v11, v26

    .end local v30    # "i":I
    .restart local v12    # "i":I
    goto/16 :goto_4

    .end local v16    # "focusableWeakCandidateOverlap":I
    .end local v24    # "start":I
    .end local v25    # "prevFocusedChild":Landroid/view/View;
    .end local v26    # "focusableSpanGroupIndex":I
    .restart local v3    # "prevFocusedChild":Landroid/view/View;
    .restart local v5    # "focusableWeakCandidateOverlap":I
    .restart local v11    # "focusableSpanGroupIndex":I
    .local v13, "start":I
    :cond_18
    move-object/from16 v25, v3

    move/from16 v31, v4

    move/from16 v16, v5

    move/from16 v26, v11

    move/from16 v30, v12

    move/from16 v24, v13

    .line 1880
    .end local v3    # "prevFocusedChild":Landroid/view/View;
    .end local v4    # "focusableWeakCandidateSpanIndex":I
    .end local v5    # "focusableWeakCandidateOverlap":I
    .end local v11    # "focusableSpanGroupIndex":I
    .end local v12    # "i":I
    .end local v13    # "start":I
    .restart local v16    # "focusableWeakCandidateOverlap":I
    .restart local v24    # "start":I
    .restart local v25    # "prevFocusedChild":Landroid/view/View;
    .restart local v26    # "focusableSpanGroupIndex":I
    .restart local v31    # "focusableWeakCandidateSpanIndex":I
    :goto_9
    if-eqz v17, :cond_19

    move-object/from16 v1, v17

    goto :goto_a

    :cond_19
    move-object/from16 v1, v20

    :goto_a
    return-object v1
.end method

.method public onInitializeAccessibilityNodeInfo(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)V
    .locals 2
    .param p1, "recycler"    # Landroidx/recyclerview/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;
    .param p3, "info"    # Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;

    .line 229
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->onInitializeAccessibilityNodeInfo(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)V

    .line 233
    const-class v0, Landroid/widget/GridView;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->setClassName(Ljava/lang/CharSequence;)V

    .line 235
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 236
    sget-object v0, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;->ACTION_SCROLL_IN_DIRECTION:Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;

    invoke-virtual {p3, v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->addAction(Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;)V

    .line 238
    :cond_0
    return-void
.end method

.method public onInitializeAccessibilityNodeInfoForItem(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;Landroid/view/View;Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)V
    .locals 9
    .param p1, "recycler"    # Landroidx/recyclerview/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;
    .param p3, "host"    # Landroid/view/View;
    .param p4, "info"    # Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;

    .line 208
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 209
    .local v0, "lp":Landroid/view/ViewGroup$LayoutParams;
    instance-of v1, v0, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;

    if-nez v1, :cond_0

    .line 210
    invoke-super {p0, p3, p4}, Landroidx/recyclerview/widget/LinearLayoutManager;->onInitializeAccessibilityNodeInfoForItem(Landroid/view/View;Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)V

    .line 211
    return-void

    .line 213
    :cond_0
    move-object v1, v0

    check-cast v1, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;

    .line 214
    .local v1, "glp":Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;
    invoke-virtual {v1}, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->getViewLayoutPosition()I

    move-result v2

    invoke-direct {p0, p1, p2, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanGroupIndex(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v3

    .line 215
    .local v3, "spanGroupIndex":I
    iget v2, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    if-nez v2, :cond_1

    .line 216
    nop

    .line 217
    move v5, v3

    .end local v3    # "spanGroupIndex":I
    .local v5, "spanGroupIndex":I
    invoke-virtual {v1}, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->getSpanIndex()I

    move-result v3

    invoke-virtual {v1}, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->getSpanSize()I

    move-result v4

    .line 216
    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static/range {v3 .. v8}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;->obtain(IIIIZZ)Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;

    move-result-object v2

    invoke-virtual {p4, v2}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->setCollectionItemInfo(Ljava/lang/Object;)V

    goto :goto_0

    .line 220
    .end local v5    # "spanGroupIndex":I
    .restart local v3    # "spanGroupIndex":I
    :cond_1
    move v5, v3

    .line 222
    .end local v3    # "spanGroupIndex":I
    .restart local v5    # "spanGroupIndex":I
    nop

    .end local v5    # "spanGroupIndex":I
    .restart local v3    # "spanGroupIndex":I
    invoke-virtual {v1}, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->getSpanIndex()I

    move-result v5

    invoke-virtual {v1}, Landroidx/recyclerview/widget/GridLayoutManager$LayoutParams;->getSpanSize()I

    move-result v6

    .line 220
    const/4 v4, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static/range {v3 .. v8}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;->obtain(IIIIZZ)Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;

    move-result-object v2

    move v5, v3

    .end local v3    # "spanGroupIndex":I
    .restart local v5    # "spanGroupIndex":I
    invoke-virtual {p4, v2}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->setCollectionItemInfo(Ljava/lang/Object;)V

    .line 224
    :goto_0
    return-void
.end method

.method public onItemsAdded(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 1
    .param p1, "recyclerView"    # Landroidx/recyclerview/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .line 879
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanIndexCache()V

    .line 880
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanGroupIndexCache()V

    .line 881
    return-void
.end method

.method public onItemsChanged(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1
    .param p1, "recyclerView"    # Landroidx/recyclerview/widget/RecyclerView;

    .line 885
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanIndexCache()V

    .line 886
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanGroupIndexCache()V

    .line 887
    return-void
.end method

.method public onItemsMoved(Landroidx/recyclerview/widget/RecyclerView;III)V
    .locals 1
    .param p1, "recyclerView"    # Landroidx/recyclerview/widget/RecyclerView;
    .param p2, "from"    # I
    .param p3, "to"    # I
    .param p4, "itemCount"    # I

    .line 904
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanIndexCache()V

    .line 905
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanGroupIndexCache()V

    .line 906
    return-void
.end method

.method public onItemsRemoved(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 1
    .param p1, "recyclerView"    # Landroidx/recyclerview/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I

    .line 891
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanIndexCache()V

    .line 892
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanGroupIndexCache()V

    .line 893
    return-void
.end method

.method public onItemsUpdated(Landroidx/recyclerview/widget/RecyclerView;IILjava/lang/Object;)V
    .locals 1
    .param p1, "recyclerView"    # Landroidx/recyclerview/widget/RecyclerView;
    .param p2, "positionStart"    # I
    .param p3, "itemCount"    # I
    .param p4, "payload"    # Ljava/lang/Object;

    .line 898
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanIndexCache()V

    .line 899
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanGroupIndexCache()V

    .line 900
    return-void
.end method

.method public onLayoutChildren(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 1
    .param p1, "recycler"    # Landroidx/recyclerview/widget/RecyclerView$Recycler;
    .param p2, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;

    .line 834
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$State;->isPreLayout()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 835
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->cachePreLayoutSpanMapping()V

    .line 837
    :cond_0
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->onLayoutChildren(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)V

    .line 841
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->clearPreLayoutSpanMappingCache()V

    .line 842
    return-void
.end method

.method public onLayoutCompleted(Landroidx/recyclerview/widget/RecyclerView$State;)V
    .locals 3
    .param p1, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;

    .line 846
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->onLayoutCompleted(Landroidx/recyclerview/widget/RecyclerView$State;)V

    .line 847
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPendingSpanCountChange:Z

    .line 848
    iget v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPositionTargetedByScrollInDirection:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 849
    iget v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPositionTargetedByScrollInDirection:I

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/GridLayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v0

    .line 851
    .local v0, "viewTargetedByScrollInDirection":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 855
    const/high16 v2, 0x4000000

    invoke-virtual {v0, v2}, Landroid/view/View;->sendAccessibilityEvent(I)V

    .line 857
    iput v1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPositionTargetedByScrollInDirection:I

    .line 860
    .end local v0    # "viewTargetedByScrollInDirection":Landroid/view/View;
    :cond_0
    return-void
.end method

.method performAccessibilityAction(ILandroid/os/Bundle;)Z
    .locals 13
    .param p1, "action"    # I
    .param p2, "args"    # Landroid/os/Bundle;

    .line 247
    sget-object v0, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;->ACTION_SCROLL_IN_DIRECTION:Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;

    invoke-virtual {v0}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat$AccessibilityActionCompat;->getId()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, -0x1

    if-ne p1, v0, :cond_c

    if-eq p1, v3, :cond_c

    .line 249
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->findChildWithAccessibilityFocus()Landroid/view/View;

    move-result-object v0

    .line 250
    .local v0, "viewWithAccessibilityFocus":Landroid/view/View;
    if-nez v0, :cond_0

    .line 253
    return v2

    .line 257
    :cond_0
    if-nez p2, :cond_1

    .line 258
    return v2

    .line 261
    :cond_1
    const-string v4, "android.view.accessibility.action.ARGUMENT_DIRECTION_INT"

    invoke-virtual {p2, v4, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v4

    .line 264
    .local v4, "direction":I
    sget-object v5, Landroidx/recyclerview/widget/GridLayoutManager;->sSupportedDirectionsForActionScrollInDirection:Ljava/util/Set;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 269
    return v2

    .line 272
    :cond_2
    iget-object v5, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 273
    invoke-virtual {v5, v0}, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object v5

    .line 274
    .local v5, "vh":Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    if-nez v5, :cond_3

    .line 279
    return v2

    .line 282
    :cond_3
    invoke-virtual {v5}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAbsoluteAdapterPosition()I

    move-result v6

    .line 283
    .local v6, "startingAdapterPosition":I
    invoke-direct {p0, v6}, Landroidx/recyclerview/widget/GridLayoutManager;->getRowIndex(I)I

    move-result v7

    .line 284
    .local v7, "startingRow":I
    invoke-direct {p0, v6}, Landroidx/recyclerview/widget/GridLayoutManager;->getColumnIndex(I)I

    move-result v8

    .line 286
    .local v8, "startingColumn":I
    if-ltz v7, :cond_b

    if-gez v8, :cond_4

    goto :goto_4

    .line 295
    :cond_4
    invoke-direct {p0, v6}, Landroidx/recyclerview/widget/GridLayoutManager;->hasAccessibilityFocusChanged(I)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 296
    iput v7, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRowWithAccessibilityFocus:I

    .line 297
    iput v8, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mColumnWithAccessibilityFocus:I

    .line 302
    :cond_5
    iget v9, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRowWithAccessibilityFocus:I

    if-ne v9, v3, :cond_6

    move v9, v7

    goto :goto_0

    .line 303
    :cond_6
    iget v9, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRowWithAccessibilityFocus:I

    :goto_0
    nop

    .line 304
    .local v9, "row":I
    iget v10, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mColumnWithAccessibilityFocus:I

    if-ne v10, v3, :cond_7

    .line 305
    move v10, v8

    goto :goto_1

    :cond_7
    iget v10, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mColumnWithAccessibilityFocus:I

    .line 307
    .local v10, "column":I
    :goto_1
    sparse-switch v4, :sswitch_data_0

    .line 326
    return v2

    .line 322
    :sswitch_0
    invoke-direct {p0, v9, v10, v6}, Landroidx/recyclerview/widget/GridLayoutManager;->findScrollTargetPositionBelow(III)I

    move-result v11

    .line 324
    .local v11, "scrollTargetPosition":I
    goto :goto_2

    .line 313
    .end local v11    # "scrollTargetPosition":I
    :sswitch_1
    nop

    .line 314
    invoke-direct {p0, v9, v10, v6}, Landroidx/recyclerview/widget/GridLayoutManager;->findScrollTargetPositionOnTheRight(III)I

    move-result v11

    .line 316
    .restart local v11    # "scrollTargetPosition":I
    goto :goto_2

    .line 318
    .end local v11    # "scrollTargetPosition":I
    :sswitch_2
    invoke-direct {p0, v9, v10, v6}, Landroidx/recyclerview/widget/GridLayoutManager;->findScrollTargetPositionAbove(III)I

    move-result v11

    .line 320
    .restart local v11    # "scrollTargetPosition":I
    goto :goto_2

    .line 309
    .end local v11    # "scrollTargetPosition":I
    :sswitch_3
    invoke-direct {p0, v9, v10, v6}, Landroidx/recyclerview/widget/GridLayoutManager;->findScrollTargetPositionOnTheLeft(III)I

    move-result v11

    .line 311
    .restart local v11    # "scrollTargetPosition":I
    nop

    .line 329
    :goto_2
    if-ne v11, v3, :cond_9

    iget v12, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    if-nez v12, :cond_9

    .line 334
    const/16 v12, 0x11

    if-ne v4, v12, :cond_8

    .line 335
    invoke-virtual {p0, v7}, Landroidx/recyclerview/widget/GridLayoutManager;->findPositionOfLastItemOnARowAboveForHorizontalGrid(I)I

    move-result v11

    goto :goto_3

    .line 337
    :cond_8
    const/16 v12, 0x42

    if-ne v4, v12, :cond_9

    .line 338
    invoke-virtual {p0, v7}, Landroidx/recyclerview/widget/GridLayoutManager;->findPositionOfFirstItemOnARowBelowForHorizontalGrid(I)I

    move-result v11

    .line 343
    :cond_9
    :goto_3
    if-eq v11, v3, :cond_a

    .line 344
    invoke-virtual {p0, v11}, Landroidx/recyclerview/widget/GridLayoutManager;->scrollToPosition(I)V

    .line 345
    iput v11, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPositionTargetedByScrollInDirection:I

    .line 346
    return v1

    .line 349
    :cond_a
    return v2

    .line 292
    .end local v9    # "row":I
    .end local v10    # "column":I
    .end local v11    # "scrollTargetPosition":I
    :cond_b
    :goto_4
    return v2

    .line 350
    .end local v0    # "viewWithAccessibilityFocus":Landroid/view/View;
    .end local v4    # "direction":I
    .end local v5    # "vh":Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .end local v6    # "startingAdapterPosition":I
    .end local v7    # "startingRow":I
    .end local v8    # "startingColumn":I
    :cond_c
    const v0, 0x1020037

    if-ne p1, v0, :cond_13

    .line 351
    const/4 v0, -0x1

    .line 352
    .local v0, "noRow":I
    const/4 v4, -0x1

    .line 353
    .local v4, "noColumn":I
    if-eqz p2, :cond_13

    .line 354
    const-string v5, "android.view.accessibility.action.ARGUMENT_ROW_INT"

    invoke-virtual {p2, v5, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    .line 356
    .local v5, "rowArg":I
    const-string v6, "android.view.accessibility.action.ARGUMENT_COLUMN_INT"

    invoke-virtual {p2, v6, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v6

    .line 359
    .local v6, "columnArg":I
    if-eq v5, v3, :cond_12

    if-ne v6, v3, :cond_d

    goto :goto_7

    .line 363
    :cond_d
    iget-object v7, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v7, v7, Landroidx/recyclerview/widget/RecyclerView;->mAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v7}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v7

    .line 365
    .local v7, "itemCount":I
    const/4 v8, -0x1

    .line 366
    .local v8, "position":I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_5
    if-ge v9, v7, :cond_10

    .line 369
    iget-object v10, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v10, v10, Landroidx/recyclerview/widget/RecyclerView;->mRecycler:Landroidx/recyclerview/widget/RecyclerView$Recycler;

    iget-object v11, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v11, v11, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    invoke-direct {p0, v10, v11, v9}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanIndex(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v10

    .line 373
    .local v10, "spanIndex":I
    iget-object v11, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v11, v11, Landroidx/recyclerview/widget/RecyclerView;->mRecycler:Landroidx/recyclerview/widget/RecyclerView$Recycler;

    iget-object v12, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v12, v12, Landroidx/recyclerview/widget/RecyclerView;->mState:Landroidx/recyclerview/widget/RecyclerView$State;

    invoke-direct {p0, v11, v12, v9}, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanGroupIndex(Landroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;I)I

    move-result v11

    .line 376
    .local v11, "spanGroupIndex":I
    iget v12, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    if-ne v12, v1, :cond_e

    .line 377
    if-ne v10, v6, :cond_f

    if-ne v11, v5, :cond_f

    .line 378
    move v8, v9

    .line 379
    goto :goto_6

    .line 382
    :cond_e
    if-ne v10, v5, :cond_f

    if-ne v11, v6, :cond_f

    .line 383
    move v8, v9

    .line 384
    goto :goto_6

    .line 366
    .end local v10    # "spanIndex":I
    .end local v11    # "spanGroupIndex":I
    :cond_f
    add-int/lit8 v9, v9, 0x1

    goto :goto_5

    .line 389
    .end local v9    # "i":I
    :cond_10
    :goto_6
    if-le v8, v3, :cond_11

    .line 390
    invoke-virtual {p0, v8, v2}, Landroidx/recyclerview/widget/GridLayoutManager;->scrollToPositionWithOffset(II)V

    .line 391
    return v1

    .line 393
    :cond_11
    return v2

    .line 360
    .end local v7    # "itemCount":I
    .end local v8    # "position":I
    :cond_12
    :goto_7
    return v2

    .line 396
    .end local v0    # "noRow":I
    .end local v4    # "noColumn":I
    .end local v5    # "rowArg":I
    .end local v6    # "columnArg":I
    :cond_13
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->performAccessibilityAction(ILandroid/os/Bundle;)Z

    move-result v0

    return v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x11 -> :sswitch_3
        0x21 -> :sswitch_2
        0x42 -> :sswitch_1
        0x82 -> :sswitch_0
    .end sparse-switch
.end method

.method public scrollHorizontallyBy(ILandroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 1
    .param p1, "dx"    # I
    .param p2, "recycler"    # Landroidx/recyclerview/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;

    .line 1055
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->updateMeasurements()V

    .line 1056
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->ensureViewSet()V

    .line 1057
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollHorizontallyBy(ILandroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public scrollVerticallyBy(ILandroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)I
    .locals 1
    .param p1, "dy"    # I
    .param p2, "recycler"    # Landroidx/recyclerview/widget/RecyclerView$Recycler;
    .param p3, "state"    # Landroidx/recyclerview/widget/RecyclerView$State;

    .line 1063
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->updateMeasurements()V

    .line 1064
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->ensureViewSet()V

    .line 1065
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollVerticallyBy(ILandroidx/recyclerview/widget/RecyclerView$Recycler;Landroidx/recyclerview/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public setMeasuredDimension(Landroid/graphics/Rect;II)V
    .locals 7
    .param p1, "childrenBounds"    # Landroid/graphics/Rect;
    .param p2, "wSpec"    # I
    .param p3, "hSpec"    # I

    .line 969
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mCachedBorders:[I

    if-nez v0, :cond_0

    .line 970
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->setMeasuredDimension(Landroid/graphics/Rect;II)V

    .line 973
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getPaddingRight()I

    move-result v1

    add-int/2addr v0, v1

    .line 974
    .local v0, "horizontalPadding":I
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getPaddingTop()I

    move-result v1

    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getPaddingBottom()I

    move-result v2

    add-int/2addr v1, v2

    .line 975
    .local v1, "verticalPadding":I
    iget v2, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mOrientation:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    .line 976
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v2

    add-int/2addr v2, v1

    .line 977
    .local v2, "usedHeight":I
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getMinimumHeight()I

    move-result v4

    invoke-static {p3, v2, v4}, Landroidx/recyclerview/widget/GridLayoutManager;->chooseSize(III)I

    move-result v4

    .line 978
    .local v4, "height":I
    iget-object v5, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mCachedBorders:[I

    iget-object v6, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mCachedBorders:[I

    array-length v6, v6

    sub-int/2addr v6, v3

    aget v3, v5, v6

    add-int/2addr v3, v0

    .line 979
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getMinimumWidth()I

    move-result v5

    .line 978
    invoke-static {p2, v3, v5}, Landroidx/recyclerview/widget/GridLayoutManager;->chooseSize(III)I

    move-result v2

    .line 980
    .local v2, "width":I
    goto :goto_0

    .line 981
    .end local v2    # "width":I
    .end local v4    # "height":I
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v2

    add-int/2addr v2, v0

    .line 982
    .local v2, "usedWidth":I
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getMinimumWidth()I

    move-result v4

    invoke-static {p2, v2, v4}, Landroidx/recyclerview/widget/GridLayoutManager;->chooseSize(III)I

    move-result v4

    .line 983
    .local v4, "width":I
    iget-object v5, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mCachedBorders:[I

    iget-object v6, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mCachedBorders:[I

    array-length v6, v6

    sub-int/2addr v6, v3

    aget v3, v5, v6

    add-int/2addr v3, v1

    .line 984
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->getMinimumHeight()I

    move-result v5

    .line 983
    invoke-static {p3, v3, v5}, Landroidx/recyclerview/widget/GridLayoutManager;->chooseSize(III)I

    move-result v3

    move v2, v4

    move v4, v3

    .line 986
    .local v2, "width":I
    .local v4, "height":I
    :goto_0
    invoke-virtual {p0, v2, v4}, Landroidx/recyclerview/widget/GridLayoutManager;->setMeasuredDimension(II)V

    .line 987
    return-void
.end method

.method public setSpanCount(I)V
    .locals 3
    .param p1, "spanCount"    # I

    .line 1503
    iget v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    if-ne p1, v0, :cond_0

    .line 1504
    return-void

    .line 1506
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPendingSpanCountChange:Z

    .line 1507
    if-lt p1, v0, :cond_1

    .line 1511
    iput p1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanCount:I

    .line 1512
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->invalidateSpanIndexCache()V

    .line 1513
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->requestLayout()V

    .line 1514
    return-void

    .line 1508
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Span count should be at least 1. Provided "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSpanSizeLookup(Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;)V
    .locals 0
    .param p1, "spanSizeLookup"    # Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    .line 945
    iput-object p1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mSpanSizeLookup:Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;

    .line 946
    return-void
.end method

.method public setStackFromEnd(Z)V
    .locals 2
    .param p1, "stackFromEnd"    # Z

    .line 169
    if-nez p1, :cond_0

    .line 174
    const/4 v0, 0x0

    invoke-super {p0, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->setStackFromEnd(Z)V

    .line 175
    return-void

    .line 170
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "GridLayoutManager does not support stack from end. Consider using reverse layout"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setUsingSpansToEstimateScrollbarDimensions(Z)V
    .locals 0
    .param p1, "useSpansToEstimateScrollBarDimensions"    # Z

    .line 1950
    iput-boolean p1, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mUsingSpansToEstimateScrollBarDimensions:Z

    .line 1951
    return-void
.end method

.method public supportsPredictiveItemAnimations()Z
    .locals 1

    .line 1885
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPendingSavedState:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Landroidx/recyclerview/widget/GridLayoutManager;->mPendingSpanCountChange:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
