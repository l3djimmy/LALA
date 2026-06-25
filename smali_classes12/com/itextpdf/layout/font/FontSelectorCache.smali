.class Lcom/itextpdf/layout/font/FontSelectorCache;
.super Ljava/lang/Object;
.source "FontSelectorCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final caches:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;",
            ">;"
        }
    .end annotation
.end field

.field private final defaultFontSet:Lcom/itextpdf/layout/font/FontSet;

.field private final defaultSelectors:Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 28
    return-void
.end method

.method constructor <init>(Lcom/itextpdf/layout/font/FontSet;)V
    .locals 2
    .param p1, "defaultFontSet"    # Lcom/itextpdf/layout/font/FontSet;

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/font/FontSelectorCache;->caches:Ljava/util/Map;

    .line 35
    if-eqz p1, :cond_0

    .line 36
    new-instance v0, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;-><init>(Lcom/itextpdf/layout/font/FontSelectorCache$1;)V

    iput-object v0, p0, Lcom/itextpdf/layout/font/FontSelectorCache;->defaultSelectors:Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;

    .line 37
    iget-object v0, p0, Lcom/itextpdf/layout/font/FontSelectorCache;->defaultSelectors:Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;->update(Lcom/itextpdf/layout/font/FontSet;)Z

    .line 38
    iput-object p1, p0, Lcom/itextpdf/layout/font/FontSelectorCache;->defaultFontSet:Lcom/itextpdf/layout/font/FontSet;

    .line 39
    return-void

    .line 35
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private update(Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;Lcom/itextpdf/layout/font/FontSet;)Z
    .locals 3
    .param p1, "selectors"    # Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;
    .param p2, "fontSet"    # Lcom/itextpdf/layout/font/FontSet;

    .line 86
    const/4 v0, 0x0

    .line 87
    .local v0, "updated":Z
    iget-object v1, p0, Lcom/itextpdf/layout/font/FontSelectorCache;->defaultSelectors:Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;

    iget-object v2, p0, Lcom/itextpdf/layout/font/FontSelectorCache;->defaultFontSet:Lcom/itextpdf/layout/font/FontSet;

    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;->update(Lcom/itextpdf/layout/font/FontSet;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 88
    const/4 v0, 0x1

    .line 90
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1, p2}, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;->update(Lcom/itextpdf/layout/font/FontSet;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 91
    const/4 v0, 0x1

    .line 93
    :cond_1
    return v0
.end method


# virtual methods
.method get(Lcom/itextpdf/layout/font/FontSelectorKey;)Lcom/itextpdf/layout/font/FontSelector;
    .locals 2
    .param p1, "key"    # Lcom/itextpdf/layout/font/FontSelectorKey;

    .line 42
    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lcom/itextpdf/layout/font/FontSelectorCache;->update(Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;Lcom/itextpdf/layout/font/FontSet;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 43
    return-object v0

    .line 45
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/font/FontSelectorCache;->defaultSelectors:Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;

    iget-object v0, v0, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/font/FontSelector;

    return-object v0
.end method

.method get(Lcom/itextpdf/layout/font/FontSelectorKey;Lcom/itextpdf/layout/font/FontSet;)Lcom/itextpdf/layout/font/FontSelector;
    .locals 5
    .param p1, "key"    # Lcom/itextpdf/layout/font/FontSelectorKey;
    .param p2, "additionalFonts"    # Lcom/itextpdf/layout/font/FontSet;

    .line 50
    if-nez p2, :cond_0

    .line 51
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/font/FontSelectorCache;->get(Lcom/itextpdf/layout/font/FontSelectorKey;)Lcom/itextpdf/layout/font/FontSelector;

    move-result-object v0

    return-object v0

    .line 53
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/font/FontSelectorCache;->caches:Ljava/util/Map;

    invoke-virtual {p2}, Lcom/itextpdf/layout/font/FontSet;->getId()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;

    .line 54
    .local v0, "selectors":Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;
    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 55
    iget-object v2, p0, Lcom/itextpdf/layout/font/FontSelectorCache;->caches:Ljava/util/Map;

    invoke-virtual {p2}, Lcom/itextpdf/layout/font/FontSet;->getId()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    new-instance v4, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;

    invoke-direct {v4, v1}, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;-><init>(Lcom/itextpdf/layout/font/FontSelectorCache$1;)V

    move-object v0, v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    :cond_1
    invoke-direct {p0, v0, p2}, Lcom/itextpdf/layout/font/FontSelectorCache;->update(Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;Lcom/itextpdf/layout/font/FontSet;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 58
    return-object v1

    .line 60
    :cond_2
    iget-object v1, v0, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;->map:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/font/FontSelector;

    return-object v1
.end method

.method put(Lcom/itextpdf/layout/font/FontSelectorKey;Lcom/itextpdf/layout/font/FontSelector;)V
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/layout/font/FontSelectorKey;
    .param p2, "fontSelector"    # Lcom/itextpdf/layout/font/FontSelector;

    .line 67
    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lcom/itextpdf/layout/font/FontSelectorCache;->update(Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;Lcom/itextpdf/layout/font/FontSet;)Z

    .line 68
    iget-object v0, p0, Lcom/itextpdf/layout/font/FontSelectorCache;->defaultSelectors:Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;

    iget-object v0, v0, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;->map:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    return-void
.end method

.method put(Lcom/itextpdf/layout/font/FontSelectorKey;Lcom/itextpdf/layout/font/FontSelector;Lcom/itextpdf/layout/font/FontSet;)V
    .locals 5
    .param p1, "key"    # Lcom/itextpdf/layout/font/FontSelectorKey;
    .param p2, "fontSelector"    # Lcom/itextpdf/layout/font/FontSelector;
    .param p3, "fontSet"    # Lcom/itextpdf/layout/font/FontSet;

    .line 72
    if-nez p3, :cond_0

    .line 73
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/layout/font/FontSelectorCache;->put(Lcom/itextpdf/layout/font/FontSelectorKey;Lcom/itextpdf/layout/font/FontSelector;)V

    goto :goto_0

    .line 75
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/font/FontSelectorCache;->caches:Ljava/util/Map;

    invoke-virtual {p3}, Lcom/itextpdf/layout/font/FontSet;->getId()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;

    .line 76
    .local v0, "selectors":Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;
    if-nez v0, :cond_1

    .line 77
    iget-object v1, p0, Lcom/itextpdf/layout/font/FontSelectorCache;->caches:Ljava/util/Map;

    invoke-virtual {p3}, Lcom/itextpdf/layout/font/FontSet;->getId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    new-instance v3, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;-><init>(Lcom/itextpdf/layout/font/FontSelectorCache$1;)V

    move-object v0, v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    :cond_1
    invoke-direct {p0, v0, p3}, Lcom/itextpdf/layout/font/FontSelectorCache;->update(Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;Lcom/itextpdf/layout/font/FontSet;)Z

    .line 81
    iget-object v1, v0, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;->map:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .end local v0    # "selectors":Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;
    :goto_0
    return-void
.end method
