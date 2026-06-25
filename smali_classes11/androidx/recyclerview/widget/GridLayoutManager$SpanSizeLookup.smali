.class public abstract Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;
.super Ljava/lang/Object;
.source "GridLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/GridLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SpanSizeLookup"
.end annotation


# instance fields
.field private mCacheSpanGroupIndices:Z

.field private mCacheSpanIndices:Z

.field final mSpanGroupIndexCache:Landroid/util/SparseIntArray;

.field final mSpanIndexCache:Landroid/util/SparseIntArray;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1523
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1525
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    .line 1526
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mSpanGroupIndexCache:Landroid/util/SparseIntArray;

    .line 1528
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanIndices:Z

    .line 1529
    iput-boolean v0, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanGroupIndices:Z

    return-void
.end method

.method static findFirstKeyLessThan(Landroid/util/SparseIntArray;I)I
    .locals 4
    .param p0, "cache"    # Landroid/util/SparseIntArray;
    .param p1, "position"    # I

    .line 1689
    const/4 v0, 0x0

    .line 1690
    .local v0, "lo":I
    invoke-virtual {p0}, Landroid/util/SparseIntArray;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .line 1692
    .local v1, "hi":I
    :goto_0
    if-gt v0, v1, :cond_1

    .line 1695
    add-int v2, v0, v1

    ushr-int/lit8 v2, v2, 0x1

    .line 1696
    .local v2, "mid":I
    invoke-virtual {p0, v2}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v3

    .line 1697
    .local v3, "midVal":I
    if-ge v3, p1, :cond_0

    .line 1698
    add-int/lit8 v0, v2, 0x1

    goto :goto_1

    .line 1700
    :cond_0
    add-int/lit8 v1, v2, -0x1

    .line 1702
    .end local v2    # "mid":I
    .end local v3    # "midVal":I
    :goto_1
    goto :goto_0

    .line 1703
    :cond_1
    add-int/lit8 v2, v0, -0x1

    .line 1704
    .local v2, "index":I
    if-ltz v2, :cond_2

    invoke-virtual {p0}, Landroid/util/SparseIntArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 1705
    invoke-virtual {p0, v2}, Landroid/util/SparseIntArray;->keyAt(I)I

    move-result v3

    return v3

    .line 1707
    :cond_2
    const/4 v3, -0x1

    return v3
.end method


# virtual methods
.method getCachedSpanGroupIndex(II)I
    .locals 3
    .param p1, "position"    # I
    .param p2, "spanCount"    # I

    .line 1619
    iget-boolean v0, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanGroupIndices:Z

    if-nez v0, :cond_0

    .line 1620
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getSpanGroupIndex(II)I

    move-result v0

    return v0

    .line 1622
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mSpanGroupIndexCache:Landroid/util/SparseIntArray;

    const/4 v1, -0x1

    invoke-virtual {v0, p1, v1}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    .line 1623
    .local v0, "existing":I
    if-eq v0, v1, :cond_1

    .line 1624
    return v0

    .line 1626
    :cond_1
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getSpanGroupIndex(II)I

    move-result v1

    .line 1627
    .local v1, "value":I
    iget-object v2, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mSpanGroupIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v2, p1, v1}, Landroid/util/SparseIntArray;->put(II)V

    .line 1628
    return v1
.end method

.method getCachedSpanIndex(II)I
    .locals 3
    .param p1, "position"    # I
    .param p2, "spanCount"    # I

    .line 1606
    iget-boolean v0, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanIndices:Z

    if-nez v0, :cond_0

    .line 1607
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getSpanIndex(II)I

    move-result v0

    return v0

    .line 1609
    :cond_0
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    const/4 v1, -0x1

    invoke-virtual {v0, p1, v1}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    .line 1610
    .local v0, "existing":I
    if-eq v0, v1, :cond_1

    .line 1611
    return v0

    .line 1613
    :cond_1
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getSpanIndex(II)I

    move-result v1

    .line 1614
    .local v1, "value":I
    iget-object v2, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v2, p1, v1}, Landroid/util/SparseIntArray;->put(II)V

    .line 1615
    return v1
.end method

.method public getSpanGroupIndex(II)I
    .locals 6
    .param p1, "adapterPosition"    # I
    .param p2, "spanCount"    # I

    .line 1724
    const/4 v0, 0x0

    .line 1725
    .local v0, "span":I
    const/4 v1, 0x0

    .line 1726
    .local v1, "group":I
    const/4 v2, 0x0

    .line 1727
    .local v2, "start":I
    iget-boolean v3, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanGroupIndices:Z

    if-eqz v3, :cond_0

    .line 1729
    iget-object v3, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mSpanGroupIndexCache:Landroid/util/SparseIntArray;

    invoke-static {v3, p1}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->findFirstKeyLessThan(Landroid/util/SparseIntArray;I)I

    move-result v3

    .line 1730
    .local v3, "prevKey":I
    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    .line 1731
    iget-object v4, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mSpanGroupIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v4, v3}, Landroid/util/SparseIntArray;->get(I)I

    move-result v1

    .line 1732
    add-int/lit8 v2, v3, 0x1

    .line 1733
    invoke-virtual {p0, v3, p2}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getCachedSpanIndex(II)I

    move-result v4

    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v5

    add-int v0, v4, v5

    .line 1734
    if-ne v0, p2, :cond_0

    .line 1735
    const/4 v0, 0x0

    .line 1736
    add-int/lit8 v1, v1, 0x1

    .line 1740
    .end local v3    # "prevKey":I
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v3

    .line 1741
    .local v3, "positionSpanSize":I
    move v4, v2

    .local v4, "i":I
    :goto_0
    if-ge v4, p1, :cond_3

    .line 1742
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v5

    .line 1743
    .local v5, "size":I
    add-int/2addr v0, v5

    .line 1744
    if-ne v0, p2, :cond_1

    .line 1745
    const/4 v0, 0x0

    .line 1746
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1747
    :cond_1
    if-le v0, p2, :cond_2

    .line 1749
    move v0, v5

    .line 1750
    add-int/lit8 v1, v1, 0x1

    .line 1741
    .end local v5    # "size":I
    :cond_2
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1753
    .end local v4    # "i":I
    :cond_3
    add-int v4, v0, v3

    if-le v4, p2, :cond_4

    .line 1754
    add-int/lit8 v1, v1, 0x1

    .line 1756
    :cond_4
    return v1
.end method

.method public getSpanIndex(II)I
    .locals 7
    .param p1, "position"    # I
    .param p2, "spanCount"    # I

    .line 1658
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v0

    .line 1659
    .local v0, "positionSpanSize":I
    const/4 v1, 0x0

    if-ne v0, p2, :cond_0

    .line 1660
    return v1

    .line 1662
    :cond_0
    const/4 v2, 0x0

    .line 1663
    .local v2, "span":I
    const/4 v3, 0x0

    .line 1665
    .local v3, "startPos":I
    iget-boolean v4, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanIndices:Z

    if-eqz v4, :cond_1

    .line 1666
    iget-object v4, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-static {v4, p1}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->findFirstKeyLessThan(Landroid/util/SparseIntArray;I)I

    move-result v4

    .line 1667
    .local v4, "prevKey":I
    if-ltz v4, :cond_1

    .line 1668
    iget-object v5, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v5, v4}, Landroid/util/SparseIntArray;->get(I)I

    move-result v5

    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v6

    add-int v2, v5, v6

    .line 1669
    add-int/lit8 v3, v4, 0x1

    .line 1672
    .end local v4    # "prevKey":I
    :cond_1
    move v4, v3

    .local v4, "i":I
    :goto_0
    if-ge v4, p1, :cond_4

    .line 1673
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v5

    .line 1674
    .local v5, "size":I
    add-int/2addr v2, v5

    .line 1675
    if-ne v2, p2, :cond_2

    .line 1676
    const/4 v2, 0x0

    goto :goto_1

    .line 1677
    :cond_2
    if-le v2, p2, :cond_3

    .line 1679
    move v2, v5

    .line 1672
    .end local v5    # "size":I
    :cond_3
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1682
    .end local v4    # "i":I
    :cond_4
    add-int v4, v2, v0

    if-gt v4, p2, :cond_5

    .line 1683
    return v2

    .line 1685
    :cond_5
    return v1
.end method

.method public abstract getSpanSize(I)I
.end method

.method public invalidateSpanGroupIndexCache()V
    .locals 1

    .line 1584
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mSpanGroupIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->clear()V

    .line 1585
    return-void
.end method

.method public invalidateSpanIndexCache()V
    .locals 1

    .line 1576
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mSpanIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->clear()V

    .line 1577
    return-void
.end method

.method public isSpanGroupIndexCacheEnabled()Z
    .locals 1

    .line 1602
    iget-boolean v0, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanGroupIndices:Z

    return v0
.end method

.method public isSpanIndexCacheEnabled()Z
    .locals 1

    .line 1593
    iget-boolean v0, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanIndices:Z

    return v0
.end method

.method public setSpanGroupIndexCacheEnabled(Z)V
    .locals 1
    .param p1, "cacheSpanGroupIndices"    # Z

    .line 1565
    if-nez p1, :cond_0

    .line 1566
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mSpanGroupIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->clear()V

    .line 1568
    :cond_0
    iput-boolean p1, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanGroupIndices:Z

    .line 1569
    return-void
.end method

.method public setSpanIndexCacheEnabled(Z)V
    .locals 1
    .param p1, "cacheSpanIndices"    # Z

    .line 1548
    if-nez p1, :cond_0

    .line 1549
    iget-object v0, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mSpanGroupIndexCache:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->clear()V

    .line 1551
    :cond_0
    iput-boolean p1, p0, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;->mCacheSpanIndices:Z

    .line 1552
    return-void
.end method
