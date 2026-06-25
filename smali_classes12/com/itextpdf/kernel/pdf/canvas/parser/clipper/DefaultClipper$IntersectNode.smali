.class Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;
.super Ljava/lang/Object;
.source "DefaultClipper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "IntersectNode"
.end annotation


# instance fields
.field Edge2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

.field edge1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

.field private pt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

.field final synthetic this$0:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;


# direct methods
.method private constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;)V
    .locals 0

    .line 45
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;->this$0:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;
    .param p2, "x1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$1;

    .line 45
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;)V

    return-void
.end method


# virtual methods
.method public getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;->pt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    return-object v0
.end method

.method public setPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V
    .locals 0
    .param p1, "pt"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 55
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;->pt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 56
    return-void
.end method
