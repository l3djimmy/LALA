.class Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$1;
.super Ljava/lang/Object;
.source "DefaultClipper.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;-><init>(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;


# direct methods
.method constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    .line 599
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$1;->this$0:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;)I
    .locals 5
    .param p1, "o1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;
    .param p2, "o2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;

    .line 601
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v2

    sub-long/2addr v0, v2

    .line 602
    .local v0, "i":J
    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    .line 603
    const/4 v2, 0x1

    return v2

    .line 605
    :cond_0
    cmp-long v2, v0, v2

    if-gez v2, :cond_1

    .line 606
    const/4 v2, -0x1

    return v2

    .line 609
    :cond_1
    const/4 v2, 0x0

    return v2
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 599
    check-cast p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;

    check-cast p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;

    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$1;->compare(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;)I

    move-result p1

    return p1
.end method
