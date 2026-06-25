.class Lcom/itextpdf/layout/renderer/CollapsedTableBorders$BorderComparator;
.super Ljava/lang/Object;
.source "CollapsedTableBorders.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/CollapsedTableBorders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BorderComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/itextpdf/layout/borders/Border;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 691
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/layout/renderer/CollapsedTableBorders$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/layout/renderer/CollapsedTableBorders$1;

    .line 691
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders$BorderComparator;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/itextpdf/layout/borders/Border;Lcom/itextpdf/layout/borders/Border;)I
    .locals 2
    .param p1, "o1"    # Lcom/itextpdf/layout/borders/Border;
    .param p2, "o2"    # Lcom/itextpdf/layout/borders/Border;

    .line 700
    if-ne p1, p2, :cond_0

    .line 701
    const/4 v0, 0x0

    return v0

    .line 702
    :cond_0
    if-nez p1, :cond_1

    .line 703
    const/4 v0, 0x1

    return v0

    .line 704
    :cond_1
    if-nez p2, :cond_2

    .line 705
    const/4 v0, -0x1

    return v0

    .line 707
    :cond_2
    invoke-virtual {p2}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 691
    check-cast p1, Lcom/itextpdf/layout/borders/Border;

    check-cast p2, Lcom/itextpdf/layout/borders/Border;

    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/layout/renderer/CollapsedTableBorders$BorderComparator;->compare(Lcom/itextpdf/layout/borders/Border;Lcom/itextpdf/layout/borders/Border;)I

    move-result p1

    return p1
.end method
