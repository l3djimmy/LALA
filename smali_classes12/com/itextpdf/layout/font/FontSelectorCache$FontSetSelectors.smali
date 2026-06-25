.class Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;
.super Ljava/lang/Object;
.source "FontSelectorCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/font/FontSelectorCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FontSetSelectors"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private fontSetSize:I

.field final map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/layout/font/FontSelectorKey;",
            "Lcom/itextpdf/layout/font/FontSelector;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 96
    const-class v0, Lcom/itextpdf/layout/font/FontSelectorCache;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;->map:Ljava/util/Map;

    .line 98
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;->fontSetSize:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/layout/font/FontSelectorCache$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/layout/font/FontSelectorCache$1;

    .line 96
    invoke-direct {p0}, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;-><init>()V

    return-void
.end method


# virtual methods
.method update(Lcom/itextpdf/layout/font/FontSet;)Z
    .locals 2
    .param p1, "fontSet"    # Lcom/itextpdf/layout/font/FontSet;

    .line 101
    if-eqz p1, :cond_1

    .line 102
    iget v0, p0, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;->fontSetSize:I

    invoke-virtual {p1}, Lcom/itextpdf/layout/font/FontSet;->size()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 103
    const/4 v0, 0x0

    return v0

    .line 105
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 106
    invoke-virtual {p1}, Lcom/itextpdf/layout/font/FontSet;->size()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/layout/font/FontSelectorCache$FontSetSelectors;->fontSetSize:I

    .line 107
    const/4 v0, 0x1

    return v0

    .line 101
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method
