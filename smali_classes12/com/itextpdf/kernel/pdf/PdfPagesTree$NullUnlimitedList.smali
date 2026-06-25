.class final Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;
.super Ljava/lang/Object;
.source "PdfPagesTree.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/PdfPagesTree;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "NullUnlimitedList"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "TT;>;"
        }
    .end annotation
.end field

.field private size:I


# direct methods
.method constructor <init>()V
    .locals 1

    .line 524
    .local p0, "this":Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;, "Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 525
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->map:Ljava/util/Map;

    .line 526
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size:I

    return-void
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .locals 5
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .line 540
    .local p0, "this":Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;, "Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList<TT;>;"
    .local p2, "element":Ljava/lang/Object;, "TT;"
    if-ltz p1, :cond_2

    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size:I

    if-le p1, v0, :cond_0

    goto :goto_1

    .line 543
    :cond_0
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size:I

    .line 546
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->map:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 547
    .local v0, "previous":Ljava/lang/Object;, "TT;"
    add-int/lit8 v1, p1, 0x1

    .local v1, "i":I
    :goto_0
    iget v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size:I

    if-ge v1, v2, :cond_1

    .line 548
    move-object v2, v0

    .line 549
    .local v2, "currentToAdd":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->map:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 550
    invoke-virtual {p0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->set(ILjava/lang/Object;)V

    .line 547
    .end local v2    # "currentToAdd":Ljava/lang/Object;, "TT;"
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 553
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->set(ILjava/lang/Object;)V

    .line 554
    return-void

    .line 541
    .end local v0    # "previous":Ljava/lang/Object;, "TT;"
    :cond_2
    :goto_1
    return-void
.end method

.method public add(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 530
    .local p0, "this":Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;, "Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList<TT;>;"
    .local p1, "element":Ljava/lang/Object;, "TT;"
    if-nez p1, :cond_0

    .line 531
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size:I

    .line 532
    return-void

    .line 534
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->map:Ljava/util/Map;

    iget v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 535
    return-void
.end method

.method public get(I)Ljava/lang/Object;
    .locals 2
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 558
    .local p0, "this":Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;, "Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->map:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .line 572
    .local p0, "this":Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;, "Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList<TT;>;"
    .local p1, "element":Ljava/lang/Object;, "TT;"
    const/4 v0, -0x1

    if-nez p1, :cond_2

    .line 573
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size:I

    if-ge v1, v2, :cond_1

    .line 574
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->map:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 575
    return v1

    .line 573
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 578
    .end local v1    # "i":I
    :cond_1
    return v0

    .line 580
    :cond_2
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->map:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 581
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;TT;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 582
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    .line 584
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;TT;>;"
    :cond_3
    goto :goto_1

    .line 585
    :cond_4
    return v0
.end method

.method public remove(I)V
    .locals 5
    .param p1, "index"    # I

    .line 591
    .local p0, "this":Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;, "Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList<TT;>;"
    if-ltz p1, :cond_2

    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size:I

    if-lt p1, v0, :cond_0

    goto :goto_1

    .line 594
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->map:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 596
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->map:Ljava/util/Map;

    iget v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size:I

    add-int/lit8 v1, v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 597
    .local v0, "previous":Ljava/lang/Object;, "TT;"
    iget v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size:I

    add-int/lit8 v1, v1, -0x2

    .line 602
    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->map:Ljava/util/Map;

    .line 597
    if-lt v1, p1, :cond_1

    .line 598
    move-object v3, v0

    .line 599
    .local v3, "current":Ljava/lang/Object;, "TT;"
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 600
    invoke-virtual {p0, v1, v3}, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->set(ILjava/lang/Object;)V

    .line 597
    .end local v3    # "current":Ljava/lang/Object;, "TT;"
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 602
    .end local v1    # "i":I
    :cond_1
    iget v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 603
    return-void

    .line 592
    .end local v0    # "previous":Ljava/lang/Object;, "TT;"
    :cond_2
    :goto_1
    return-void
.end method

.method public set(ILjava/lang/Object;)V
    .locals 2
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .line 563
    .local p0, "this":Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;, "Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList<TT;>;"
    .local p2, "element":Ljava/lang/Object;, "TT;"
    nop

    .line 566
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->map:Ljava/util/Map;

    .line 563
    if-nez p2, :cond_0

    .line 564
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 566
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 568
    :goto_0
    return-void
.end method

.method public size()I
    .locals 1

    .line 607
    .local p0, "this":Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;, "Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList<TT;>;"
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfPagesTree$NullUnlimitedList;->size:I

    return v0
.end method
