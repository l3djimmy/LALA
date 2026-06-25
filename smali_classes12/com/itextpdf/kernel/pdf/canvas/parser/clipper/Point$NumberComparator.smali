.class Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$NumberComparator;
.super Ljava/lang/Object;
.source "Point.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NumberComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Number;",
        ":",
        "Ljava/lang/Comparable<",
        "TT;>;>",
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "TT;>;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 247
    .local p0, "this":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$NumberComparator;, "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$NumberComparator<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$1;

    .line 247
    .local p0, "this":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$NumberComparator;, "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$NumberComparator<TT;>;"
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$NumberComparator;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Number;Ljava/lang/Number;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassCastException;
        }
    .end annotation

    .line 250
    .local p0, "this":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$NumberComparator;, "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$NumberComparator<TT;>;"
    .local p1, "a":Ljava/lang/Number;, "TT;"
    .local p2, "b":Ljava/lang/Number;, "TT;"
    move-object v0, p1

    check-cast v0, Ljava/lang/Comparable;

    invoke-interface {v0, p2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 247
    .local p0, "this":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$NumberComparator;, "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$NumberComparator<TT;>;"
    check-cast p1, Ljava/lang/Number;

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$NumberComparator;->compare(Ljava/lang/Number;Ljava/lang/Number;)I

    move-result p1

    return p1
.end method
