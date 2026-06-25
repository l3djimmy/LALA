.class final Lcom/itextpdf/layout/renderer/TableBorderUtil;
.super Ljava/lang/Object;
.source "TableBorderUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method public static createAndFillBorderList(Lcom/itextpdf/layout/borders/Border;I)Ljava/util/List;
    .locals 2
    .param p0, "border"    # Lcom/itextpdf/layout/borders/Border;
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/layout/borders/Border;",
            "I)",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation

    .line 72
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 73
    .local v0, "borderList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p1, :cond_0

    .line 74
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 76
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method public static createAndFillBorderList(Ljava/util/List;Lcom/itextpdf/layout/borders/Border;I)Ljava/util/List;
    .locals 5
    .param p1, "borderToCollapse"    # Lcom/itextpdf/layout/borders/Border;
    .param p2, "size"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;",
            "Lcom/itextpdf/layout/borders/Border;",
            "I)",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;"
        }
    .end annotation

    .line 80
    .local p0, "originalList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 81
    .local v0, "borderList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    if-eqz p0, :cond_0

    .line 82
    invoke-interface {v0, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 84
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-ge v1, p2, :cond_1

    .line 85
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 87
    :cond_1
    if-nez p0, :cond_2

    move v1, p2

    goto :goto_1

    :cond_2
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {v1, p2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 88
    .local v1, "end":I
    :goto_1
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    if-ge v2, v1, :cond_5

    .line 89
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3

    if-eqz p1, :cond_4

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/borders/Border;

    invoke-virtual {v3}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v3

    invoke-virtual {p1}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v4

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_4

    .line 90
    :cond_3
    invoke-interface {v0, v2, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 88
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 93
    .end local v2    # "i":I
    :cond_5
    return-object v0
.end method

.method public static getCellSideBorder(Lcom/itextpdf/layout/element/Cell;I)Lcom/itextpdf/layout/borders/Border;
    .locals 3
    .param p0, "cellModel"    # Lcom/itextpdf/layout/element/Cell;
    .param p1, "borderType"    # I

    .line 37
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/element/Cell;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/borders/Border;

    .line 38
    .local v0, "cellModelSideBorder":Lcom/itextpdf/layout/borders/Border;
    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/element/Cell;->hasProperty(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 39
    const/16 v1, 0x9

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/element/Cell;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lcom/itextpdf/layout/borders/Border;

    .line 40
    if-nez v0, :cond_0

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/element/Cell;->hasProperty(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 41
    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/element/Cell;->getDefaultProperty(I)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Lcom/itextpdf/layout/borders/Border;

    .line 44
    :cond_0
    return-object v0
.end method

.method public static getWidestBorder(Ljava/util/List;)Lcom/itextpdf/layout/borders/Border;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;)",
            "Lcom/itextpdf/layout/borders/Border;"
        }
    .end annotation

    .line 48
    .local p0, "borderList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    const/4 v0, 0x0

    .line 49
    .local v0, "theWidestBorder":Lcom/itextpdf/layout/borders/Border;
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_2

    .line 50
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/borders/Border;

    .line 51
    .local v2, "border":Lcom/itextpdf/layout/borders/Border;
    if-eqz v2, :cond_1

    if-eqz v0, :cond_0

    invoke-virtual {v2}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v3

    invoke-virtual {v0}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_1

    .line 52
    :cond_0
    move-object v0, v2

    .line 54
    .end local v2    # "border":Lcom/itextpdf/layout/borders/Border;
    :cond_1
    goto :goto_0

    .line 56
    :cond_2
    return-object v0
.end method

.method public static getWidestBorder(Ljava/util/List;II)Lcom/itextpdf/layout/borders/Border;
    .locals 5
    .param p1, "start"    # I
    .param p2, "end"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/borders/Border;",
            ">;II)",
            "Lcom/itextpdf/layout/borders/Border;"
        }
    .end annotation

    .line 60
    .local p0, "borderList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/borders/Border;>;"
    const/4 v0, 0x0

    .line 61
    .local v0, "theWidestBorder":Lcom/itextpdf/layout/borders/Border;
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_2

    .line 62
    invoke-interface {p0, p1, p2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/borders/Border;

    .line 63
    .local v2, "border":Lcom/itextpdf/layout/borders/Border;
    if-eqz v2, :cond_1

    if-eqz v0, :cond_0

    invoke-virtual {v2}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v3

    invoke-virtual {v0}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_1

    .line 64
    :cond_0
    move-object v0, v2

    .line 66
    .end local v2    # "border":Lcom/itextpdf/layout/borders/Border;
    :cond_1
    goto :goto_0

    .line 68
    :cond_2
    return-object v0
.end method
