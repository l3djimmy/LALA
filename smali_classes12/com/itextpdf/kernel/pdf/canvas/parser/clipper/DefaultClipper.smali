.class public Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;
.super Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;
.source "DefaultClipper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;
    }
.end annotation


# static fields
.field private static final LOGGER:Ljava/util/logging/Logger;


# instance fields
.field private activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

.field private clipFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

.field private clipType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

.field private final ghostJoins:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;",
            ">;"
        }
    .end annotation
.end field

.field private final intersectList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;",
            ">;"
        }
    .end annotation
.end field

.field private final intersectNodeComparer:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;",
            ">;"
        }
    .end annotation
.end field

.field private final joins:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;",
            ">;"
        }
    .end annotation
.end field

.field private maxima:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

.field protected final polyOuts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;",
            ">;"
        }
    .end annotation
.end field

.field private final reverseSolution:Z

.field private scanbeam:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

.field private sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

.field private final strictlySimple:Z

.field private subjFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

.field private usingPolyTree:Z

.field public zFillFunction:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$IZFillCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 585
    const-class v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 588
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;-><init>(I)V

    .line 589
    return-void
.end method

.method public constructor <init>(I)V
    .locals 4
    .param p1, "InitOptions"    # I

    .line 593
    and-int/lit8 v0, p1, 0x4

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;-><init>(Z)V

    .line 594
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->scanbeam:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    .line 595
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->maxima:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    .line 596
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 597
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 598
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectList:Ljava/util/List;

    .line 599
    new-instance v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$1;

    invoke-direct {v3, p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$1;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;)V

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectNodeComparer:Ljava/util/Comparator;

    .line 614
    iput-boolean v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->usingPolyTree:Z

    .line 615
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    .line 616
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->joins:Ljava/util/List;

    .line 617
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->ghostJoins:Ljava/util/List;

    .line 618
    and-int/lit8 v3, p1, 0x1

    if-eqz v3, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    move v3, v2

    :goto_1
    iput-boolean v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->reverseSolution:Z

    .line 619
    and-int/lit8 v3, p1, 0x2

    if-eqz v3, :cond_2

    goto :goto_2

    :cond_2
    move v1, v2

    :goto_2
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->strictlySimple:Z

    .line 621
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->zFillFunction:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$IZFillCallback;

    .line 623
    return-void
.end method

.method private EdgesAdjacent(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;)Z
    .locals 2
    .param p1, "inode"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;

    .line 1249
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;->edge1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;->Edge2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eq v0, v1, :cond_1

    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;->edge1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;->Edge2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private GetLastOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .locals 3
    .param p1, "e"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 831
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    iget v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 832
    .local v0, "outRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->LEFT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    if-ne v1, v2, :cond_0

    .line 833
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->pts:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    return-object v1

    .line 835
    :cond_0
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->pts:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iget-object v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    return-object v1
.end method

.method private InsertMaxima(J)V
    .locals 5
    .param p1, "X"    # J

    .line 658
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;-><init>()V

    .line 659
    .local v0, "newMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    iput-wide p1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->X:J

    .line 660
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->maxima:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 662
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->maxima:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    .line 663
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->maxima:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    iput-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    .line 664
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->maxima:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    iput-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    goto :goto_1

    .line 666
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->maxima:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    iget-wide v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->X:J

    cmp-long v1, p1, v3

    if-gez v1, :cond_1

    .line 668
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->maxima:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    .line 669
    iput-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    .line 670
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->maxima:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    goto :goto_1

    .line 674
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->maxima:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    .line 675
    .local v1, "m":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    :goto_0
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    if-eqz v2, :cond_2

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    iget-wide v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->X:J

    cmp-long v2, p1, v2

    if-ltz v2, :cond_2

    iget-object v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    goto :goto_0

    .line 676
    :cond_2
    iget-wide v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->X:J

    cmp-long v2, p1, v2

    if-nez v2, :cond_3

    return-void

    .line 678
    :cond_3
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    iput-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    .line 679
    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    .line 680
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    if-eqz v2, :cond_4

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    iput-object v0, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    .line 681
    :cond_4
    iput-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    .line 683
    .end local v1    # "m":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    :goto_1
    return-void
.end method

.method private addEdgeToSEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V
    .locals 3
    .param p1, "edge"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 687
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    const-class v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "addEdgeToSEL"

    invoke-virtual {v0, v1, v2}, Ljava/util/logging/Logger;->entering(Ljava/lang/String;Ljava/lang/String;)V

    .line 691
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 692
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 693
    iput-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 694
    iput-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_0

    .line 697
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 698
    iput-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 699
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object p1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 700
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 702
    :goto_0
    return-void
.end method

.method private addGhostJoin(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V
    .locals 2
    .param p1, "Op"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .param p2, "OffPt"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 705
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;-><init>()V

    .line 706
    .local v0, "j":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;
    iput-object p1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 707
    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->setOffPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 708
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->ghostJoins:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 709
    return-void
.end method

.method private addJoin(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V
    .locals 3
    .param p1, "Op1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .param p2, "Op2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .param p3, "OffPt"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 714
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    const-class v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "addJoin"

    invoke-virtual {v0, v1, v2}, Ljava/util/logging/Logger;->entering(Ljava/lang/String;Ljava/lang/String;)V

    .line 715
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;-><init>()V

    .line 716
    .local v0, "j":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;
    iput-object p1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 717
    iput-object p2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 718
    invoke-virtual {v0, p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->setOffPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 719
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->joins:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 720
    return-void
.end method

.method private addLocalMaxPoly(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V
    .locals 2
    .param p1, "e1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p2, "e2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p3, "pt"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 725
    invoke-direct {p0, p1, p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 726
    iget v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-nez v0, :cond_0

    .line 727
    invoke-direct {p0, p2, p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 729
    :cond_0
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    iget v1, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ne v0, v1, :cond_1

    .line 730
    const/4 v0, -0x1

    iput v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 731
    iput v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    goto :goto_0

    .line 733
    :cond_1
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    iget v1, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ge v0, v1, :cond_2

    .line 734
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->appendPolygon(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    goto :goto_0

    .line 737
    :cond_2
    invoke-direct {p0, p2, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->appendPolygon(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 739
    :goto_0
    return-void
.end method

.method private addLocalMinPoly(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .locals 7
    .param p1, "e1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p2, "e2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p3, "pt"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 744
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    const-class v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "addLocalMinPoly"

    invoke-virtual {v0, v1, v2}, Ljava/util/logging/Logger;->entering(Ljava/lang/String;Ljava/lang/String;)V

    .line 747
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isHorizontal()Z

    move-result v0

    if-nez v0, :cond_2

    iget-wide v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    iget-wide v2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    cmpl-double v0, v0, v2

    if-lez v0, :cond_0

    goto :goto_0

    .line 761
    :cond_0
    invoke-direct {p0, p2, p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v0

    .line 762
    .local v0, "result":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iget v1, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    iput v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 763
    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    iput-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    .line 764
    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->LEFT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    iput-object v1, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    .line 765
    move-object v1, p2

    .line 766
    .local v1, "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-ne v2, p1, :cond_1

    .line 767
    iget-object v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .local v2, "prevE":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    goto :goto_1

    .line 770
    .end local v2    # "prevE":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :cond_1
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .restart local v2    # "prevE":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    goto :goto_1

    .line 748
    .end local v0    # "result":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .end local v1    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v2    # "prevE":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :cond_2
    :goto_0
    invoke-direct {p0, p1, p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v0

    .line 749
    .restart local v0    # "result":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iget v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    iput v1, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 750
    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->LEFT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    iput-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    .line 751
    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    iput-object v1, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    .line 752
    move-object v1, p1

    .line 753
    .restart local v1    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-ne v2, p2, :cond_3

    .line 754
    iget-object v2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .restart local v2    # "prevE":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    goto :goto_1

    .line 757
    .end local v2    # "prevE":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :cond_3
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 774
    .restart local v2    # "prevE":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_1
    if-eqz v2, :cond_4

    iget v3, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v3, :cond_4

    .line 775
    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v3

    invoke-static {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->topX(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;J)J

    move-result-wide v3

    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v5

    invoke-static {v1, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->topX(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;J)J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_4

    iget-boolean v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->useFullRange:Z

    .line 776
    invoke-static {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->slopesEqual(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Z)Z

    move-result v3

    if-eqz v3, :cond_4

    iget v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eqz v3, :cond_4

    iget v3, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eqz v3, :cond_4

    .line 778
    invoke-direct {p0, v2, p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v3

    .line 779
    .local v3, "outPt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-direct {p0, v0, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addJoin(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 781
    .end local v3    # "outPt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :cond_4
    return-object v0
.end method

.method private addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .locals 6
    .param p1, "e"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p2, "pt"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 785
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    const-class v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "addOutPt"

    invoke-virtual {v0, v1, v2}, Ljava/util/logging/Logger;->entering(Ljava/lang/String;Ljava/lang/String;)V

    .line 786
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-gez v0, :cond_2

    .line 788
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->createOutRec()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    move-result-object v0

    .line 789
    .local v0, "outRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    iget v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-nez v3, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    iput-boolean v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isOpen:Z

    .line 790
    new-instance v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;-><init>()V

    .line 791
    .local v1, "newOp":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->pts:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 792
    iget v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->Idx:I

    iput v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->idx:I

    .line 793
    iput-object p2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->pt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 794
    iput-object v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 795
    iput-object v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 796
    iget-boolean v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isOpen:Z

    if-nez v2, :cond_1

    .line 797
    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->setHoleState(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)V

    .line 798
    :cond_1
    iget v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->Idx:I

    iput v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 799
    return-object v1

    .line 802
    .end local v0    # "outRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    .end local v1    # "newOp":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :cond_2
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    iget v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 804
    .restart local v0    # "outRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v3

    .line 805
    .local v3, "op":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iget-object v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    sget-object v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->LEFT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    if-ne v4, v5, :cond_3

    goto :goto_1

    :cond_3
    move v1, v2

    .line 806
    .local v1, "ToFront":Z
    :goto_1
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "op="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPointCount()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/logging/Logger;->finest(Ljava/lang/String;)V

    .line 807
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/logging/Logger;->finest(Ljava/lang/String;)V

    .line 808
    if-eqz v1, :cond_4

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 809
    return-object v3

    .line 811
    :cond_4
    if-nez v1, :cond_5

    iget-object v2, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {p2, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 812
    iget-object v2, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    return-object v2

    .line 815
    :cond_5
    new-instance v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;-><init>()V

    .line 816
    .local v2, "newOp":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iget v4, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->Idx:I

    iput v4, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->idx:I

    .line 817
    new-instance v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-direct {v4, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->setPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 818
    iput-object v3, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 819
    iget-object v4, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iput-object v4, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 820
    iget-object v4, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iput-object v2, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 821
    iput-object v2, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 822
    if-eqz v1, :cond_6

    .line 823
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->setPoints(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)V

    .line 825
    :cond_6
    return-object v2
.end method

.method private appendPolygon(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V
    .locals 12
    .param p1, "e1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p2, "e2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 840
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    const-class v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "appendPolygon"

    invoke-virtual {v0, v1, v2}, Ljava/util/logging/Logger;->entering(Ljava/lang/String;Ljava/lang/String;)V

    .line 843
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    iget v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 844
    .local v0, "outRec1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    iget v2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 845
    .local v1, "outRec2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v5, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->finest(Ljava/lang/String;)V

    .line 846
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/logging/Logger;->finest(Ljava/lang/String;)V

    .line 849
    invoke-static {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->isParam1RightOfParam2(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 850
    move-object v2, v1

    .local v2, "holeStateRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    goto :goto_0

    .line 852
    .end local v2    # "holeStateRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    :cond_0
    invoke-static {v1, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->isParam1RightOfParam2(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 853
    move-object v2, v0

    .restart local v2    # "holeStateRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    goto :goto_0

    .line 856
    .end local v2    # "holeStateRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    :cond_1
    invoke-static {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getLowerMostRec(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    move-result-object v2

    .line 859
    .restart local v2    # "holeStateRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v3

    .line 860
    .local v3, "p1_lft":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iget-object v4, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 861
    .local v4, "p1_rt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v5

    .line 862
    .local v5, "p2_lft":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iget-object v6, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 864
    .local v6, "p2_rt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    sget-object v7, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "p1_lft.getPointCount() = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPointCount()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/logging/Logger;->finest(Ljava/lang/String;)V

    .line 865
    sget-object v7, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "p1_rt.getPointCount() = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPointCount()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/logging/Logger;->finest(Ljava/lang/String;)V

    .line 866
    sget-object v7, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "p2_lft.getPointCount() = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPointCount()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/logging/Logger;->finest(Ljava/lang/String;)V

    .line 867
    sget-object v7, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "p2_rt.getPointCount() = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPointCount()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/logging/Logger;->finest(Ljava/lang/String;)V

    .line 871
    iget-object v7, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    sget-object v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->LEFT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    if-ne v7, v8, :cond_3

    .line 872
    iget-object v7, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    sget-object v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->LEFT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    if-ne v7, v8, :cond_2

    .line 874
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->reversePolyPtLinks()V

    .line 875
    iput-object v3, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 876
    iput-object v5, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 877
    iput-object v6, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 878
    iput-object v4, v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 879
    invoke-virtual {v0, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->setPoints(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)V

    goto :goto_1

    .line 883
    :cond_2
    iput-object v3, v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 884
    iput-object v6, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 885
    iput-object v4, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 886
    iput-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 887
    invoke-virtual {v0, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->setPoints(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)V

    .line 889
    :goto_1
    sget-object v7, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->LEFT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    .local v7, "side":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;
    goto :goto_3

    .line 892
    .end local v7    # "side":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;
    :cond_3
    iget-object v7, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    sget-object v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    if-ne v7, v8, :cond_4

    .line 894
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->reversePolyPtLinks()V

    .line 895
    iput-object v6, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 896
    iput-object v4, v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 897
    iput-object v3, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 898
    iput-object v5, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_2

    .line 902
    :cond_4
    iput-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 903
    iput-object v4, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 904
    iput-object v6, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 905
    iput-object v3, v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 907
    :goto_2
    sget-object v7, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;->RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    .line 909
    .restart local v7    # "side":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;
    :goto_3
    const/4 v8, 0x0

    iput-object v8, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->bottomPt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 910
    invoke-virtual {v2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 911
    iget-object v9, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    if-eq v9, v0, :cond_5

    .line 912
    iget-object v9, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    iput-object v9, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 914
    :cond_5
    iget-boolean v9, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    iput-boolean v9, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    .line 916
    :cond_6
    invoke-virtual {v1, v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->setPoints(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)V

    .line 917
    iput-object v8, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->bottomPt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 919
    iput-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 921
    iget v8, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 922
    .local v8, "OKIdx":I
    iget v9, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 924
    .local v9, "ObsoleteIdx":I
    const/4 v10, -0x1

    iput v10, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 925
    iput v10, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 927
    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 928
    .local v10, "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_4
    if-eqz v10, :cond_8

    .line 929
    iget v11, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ne v11, v9, :cond_7

    .line 930
    iput v8, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 931
    iput-object v7, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    .line 932
    goto :goto_5

    .line 934
    :cond_7
    iget-object v10, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_4

    .line 936
    :cond_8
    :goto_5
    iget v11, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->Idx:I

    iput v11, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->Idx:I

    .line 937
    return-void
.end method

.method private buildIntersectList(J)V
    .locals 9
    .param p1, "topY"    # J

    .line 942
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-nez v0, :cond_0

    .line 943
    return-void

    .line 947
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 948
    .local v0, "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 949
    :goto_0
    if-eqz v0, :cond_1

    .line 950
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 951
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 952
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-static {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->topX(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;J)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setX(Ljava/lang/Number;)V

    .line 953
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_0

    .line 957
    :cond_1
    const/4 v1, 0x1

    .line 958
    .local v1, "isModified":Z
    :goto_1
    const/4 v2, 0x0

    if-eqz v1, :cond_4

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v3, :cond_4

    .line 959
    const/4 v1, 0x0

    .line 960
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 961
    :goto_2
    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v3, :cond_3

    .line 962
    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 963
    .local v3, "eNext":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    const/4 v4, 0x1

    new-array v4, v4, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 964
    .local v4, "pt":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-lez v5, :cond_2

    .line 965
    invoke-direct {p0, v0, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectPoint(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 966
    new-instance v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;

    invoke-direct {v5, p0, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$1;)V

    .line 967
    .local v5, "newNode":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;
    iput-object v0, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;->edge1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 968
    iput-object v3, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;->Edge2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 969
    const/4 v6, 0x0

    aget-object v6, v4, v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;->setPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 970
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectList:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 972
    invoke-direct {p0, v0, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->swapPositionsInSEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 973
    const/4 v1, 0x1

    .line 974
    .end local v5    # "newNode":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;
    goto :goto_3

    .line 976
    :cond_2
    move-object v0, v3

    .line 978
    .end local v3    # "eNext":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v4    # "pt":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    :goto_3
    goto :goto_2

    .line 979
    :cond_3
    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v3, :cond_4

    .line 980
    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v2, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_1

    .line 986
    :cond_4
    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 987
    return-void
.end method

.method private buildResult(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;)V
    .locals 7
    .param p1, "polyg"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;

    .line 992
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;->clear()V

    .line 993
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 994
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 995
    .local v1, "outRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v2

    if-nez v2, :cond_0

    .line 996
    goto :goto_2

    .line 998
    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v2

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 999
    .local v2, "p":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPointCount()I

    move-result v3

    .line 1000
    .local v3, "cnt":I
    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "cnt = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/logging/Logger;->finest(Ljava/lang/String;)V

    .line 1001
    const/4 v4, 0x2

    if-ge v3, v4, :cond_1

    .line 1002
    goto :goto_2

    .line 1004
    :cond_1
    new-instance v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    invoke-direct {v4, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;-><init>(I)V

    .line 1005
    .local v4, "pg":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_1
    if-ge v5, v3, :cond_2

    .line 1006
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->add(Ljava/lang/Object;)Z

    .line 1007
    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1005
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1009
    .end local v5    # "j":I
    :cond_2
    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;->add(Ljava/lang/Object;)Z

    .line 993
    .end local v1    # "outRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    .end local v2    # "p":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .end local v3    # "cnt":I
    .end local v4    # "pg":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1011
    .end local v0    # "i":I
    :cond_3
    return-void
.end method

.method private buildResult2(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;)V
    .locals 8
    .param p1, "polytree"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;

    .line 1014
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;->Clear()V

    .line 1017
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 1018
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1019
    .local v1, "outRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPointCount()I

    move-result v2

    goto :goto_1

    :cond_0
    const/4 v2, 0x0

    .line 1020
    .local v2, "cnt":I
    :goto_1
    iget-boolean v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isOpen:Z

    if-eqz v3, :cond_1

    const/4 v3, 0x2

    if-lt v2, v3, :cond_3

    :cond_1
    iget-boolean v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isOpen:Z

    if-nez v3, :cond_2

    const/4 v3, 0x3

    if-ge v2, v3, :cond_2

    .line 1021
    goto :goto_3

    .line 1023
    :cond_2
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->fixHoleLinkage()V

    .line 1024
    new-instance v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;-><init>()V

    .line 1025
    .local v3, "pn":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;->getAllPolys()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1026
    iput-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->polyNode:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    .line 1027
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v4

    iget-object v4, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1028
    .local v4, "op":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_2
    if-ge v5, v2, :cond_3

    .line 1029
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->getPolygon()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    move-result-object v6

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->add(Ljava/lang/Object;)Z

    .line 1030
    iget-object v4, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1028
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 1017
    .end local v1    # "outRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    .end local v2    # "cnt":I
    .end local v3    # "pn":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;
    .end local v4    # "op":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .end local v5    # "j":I
    :cond_3
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1035
    .end local v0    # "i":I
    :cond_4
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_4
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_8

    .line 1036
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1037
    .restart local v1    # "outRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->polyNode:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    if-nez v2, :cond_5

    .line 1038
    goto :goto_5

    .line 1040
    :cond_5
    iget-boolean v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isOpen:Z

    if-eqz v2, :cond_6

    .line 1041
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->polyNode:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->setOpen(Z)V

    .line 1042
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->polyNode:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;->addChild(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;)V

    goto :goto_5

    .line 1044
    :cond_6
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    if-eqz v2, :cond_7

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->polyNode:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    if-eqz v2, :cond_7

    .line 1045
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->polyNode:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->polyNode:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;->addChild(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;)V

    goto :goto_5

    .line 1048
    :cond_7
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->polyNode:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;->addChild(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;)V

    .line 1035
    .end local v1    # "outRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    :goto_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 1051
    .end local v0    # "i":I
    :cond_8
    return-void
.end method

.method private copyAELToSEL()V
    .locals 2

    .line 1054
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1055
    .local v0, "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1056
    :goto_0
    if-eqz v0, :cond_0

    .line 1057
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1058
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1059
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_0

    .line 1061
    :cond_0
    return-void
.end method

.method private createOutRec()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    .locals 2

    .line 1064
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;-><init>()V

    .line 1065
    .local v0, "result":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    const/4 v1, -0x1

    iput v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->Idx:I

    .line 1066
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    .line 1067
    iput-boolean v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isOpen:Z

    .line 1068
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1069
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->setPoints(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)V

    .line 1070
    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->bottomPt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1071
    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->polyNode:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyNode;

    .line 1072
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1073
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->Idx:I

    .line 1074
    return-object v0
.end method

.method private deleteFromAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V
    .locals 5
    .param p1, "e"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1078
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    const-class v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "deleteFromAEL"

    invoke-virtual {v0, v2, v3}, Ljava/util/logging/Logger;->entering(Ljava/lang/String;Ljava/lang/String;)V

    .line 1080
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1081
    .local v0, "AelPrev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget-object v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1082
    .local v2, "AelNext":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    if-nez v0, :cond_0

    if-nez v2, :cond_0

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eq p1, v4, :cond_0

    .line 1083
    return-void

    .line 1085
    :cond_0
    if-eqz v0, :cond_1

    .line 1086
    iput-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_0

    .line 1089
    :cond_1
    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1091
    :goto_0
    if-eqz v2, :cond_2

    .line 1092
    iput-object v0, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1094
    :cond_2
    const/4 v4, 0x0

    iput-object v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1095
    iput-object v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1096
    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1, v3}, Ljava/util/logging/Logger;->exiting(Ljava/lang/String;Ljava/lang/String;)V

    .line 1097
    return-void
.end method

.method private deleteFromSEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V
    .locals 3
    .param p1, "e"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1100
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    const-class v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "deleteFromSEL"

    invoke-virtual {v0, v1, v2}, Ljava/util/logging/Logger;->entering(Ljava/lang/String;Ljava/lang/String;)V

    .line 1102
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1103
    .local v0, "SelPrev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1104
    .local v1, "SelNext":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    if-nez v0, :cond_0

    if-nez v1, :cond_0

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1105
    return-void

    .line 1107
    :cond_0
    if-eqz v0, :cond_1

    .line 1108
    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_0

    .line 1111
    :cond_1
    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1113
    :goto_0
    if-eqz v1, :cond_2

    .line 1114
    iput-object v0, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1116
    :cond_2
    const/4 v2, 0x0

    iput-object v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1117
    iput-object v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1118
    return-void
.end method

.method private doHorzSegmentsOverlap(JJJJ)Z
    .locals 2
    .param p1, "seg1a"    # J
    .param p3, "seg1b"    # J
    .param p5, "seg2a"    # J
    .param p7, "seg2b"    # J

    .line 1121
    cmp-long v0, p1, p3

    if-lez v0, :cond_0

    .line 1122
    move-wide v0, p1

    .line 1123
    .local v0, "tmp":J
    move-wide p1, p3

    .line 1124
    move-wide p3, v0

    .line 1126
    .end local v0    # "tmp":J
    :cond_0
    cmp-long v0, p5, p7

    if-lez v0, :cond_1

    .line 1127
    move-wide v0, p5

    .line 1128
    .restart local v0    # "tmp":J
    move-wide p5, p7

    .line 1129
    move-wide p7, v0

    .line 1131
    .end local v0    # "tmp":J
    :cond_1
    cmp-long v0, p1, p7

    if-gez v0, :cond_2

    cmp-long v0, p5, p3

    if-gez v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private doMaxima(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V
    .locals 4
    .param p1, "e"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1135
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getMaximaPair()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    move-result-object v0

    .line 1136
    .local v0, "eMaxPair":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    if-nez v0, :cond_1

    .line 1137
    iget v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v1, :cond_0

    .line 1138
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1140
    :cond_0
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->deleteFromAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 1141
    return-void

    .line 1144
    :cond_1
    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1145
    .local v1, "eNext":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_0
    if-eqz v1, :cond_2

    if-eq v1, v0, :cond_2

    .line 1146
    new-instance v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 1147
    .local v2, "tmp":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    invoke-direct {p0, p1, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectEdges(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 1148
    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->setTop(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 1149
    invoke-direct {p0, p1, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->swapPositionsInAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 1150
    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1151
    .end local v2    # "tmp":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    goto :goto_0

    .line 1153
    :cond_2
    iget v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_3

    iget v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ne v2, v3, :cond_3

    .line 1154
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->deleteFromAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 1155
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->deleteFromAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    goto :goto_1

    .line 1157
    :cond_3
    iget v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v2, :cond_5

    iget v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v2, :cond_5

    .line 1158
    iget v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v2, :cond_4

    .line 1159
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-direct {p0, p1, v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addLocalMaxPoly(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 1161
    :cond_4
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->deleteFromAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 1162
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->deleteFromAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    goto :goto_1

    .line 1165
    :cond_5
    iget v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-nez v2, :cond_8

    .line 1166
    iget v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v2, :cond_6

    .line 1167
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-direct {p0, p1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1168
    iput v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 1170
    :cond_6
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->deleteFromAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 1172
    iget v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v2, :cond_7

    .line 1173
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-direct {p0, v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1174
    iput v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 1176
    :cond_7
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->deleteFromAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 1181
    :goto_1
    return-void

    .line 1179
    :cond_8
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "DoMaxima error"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private doSimplePolygons()V
    .locals 9

    .line 1186
    const/4 v0, 0x0

    .line 1187
    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_7

    .line 1188
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    add-int/lit8 v2, v0, 0x1

    .end local v0    # "i":I
    .local v2, "i":I
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1189
    .local v0, "outrec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v1

    .line 1190
    .local v1, "op":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    if-eqz v1, :cond_6

    iget-boolean v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isOpen:Z

    if-eqz v3, :cond_0

    .line 1191
    goto/16 :goto_3

    .line 1195
    :cond_0
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1196
    .local v3, "op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :goto_1
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v4

    if-eq v3, v4, :cond_5

    .line 1197
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    iget-object v4, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v4, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    iget-object v4, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v4, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 1199
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1200
    .local v4, "op3":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iget-object v5, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1201
    .local v5, "op4":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iput-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1202
    iput-object v1, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1203
    iput-object v4, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1204
    iput-object v3, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1206
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->setPoints(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)V

    .line 1207
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->createOutRec()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    move-result-object v6

    .line 1208
    .local v6, "outrec2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    invoke-virtual {v6, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->setPoints(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)V

    .line 1209
    invoke-direct {p0, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->updateOutPtIdxs(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)V

    .line 1210
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v7

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->poly2ContainsPoly1(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1212
    iget-boolean v7, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    xor-int/lit8 v7, v7, 0x1

    iput-boolean v7, v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    .line 1213
    iput-object v0, v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1214
    iget-boolean v7, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->usingPolyTree:Z

    if-eqz v7, :cond_3

    .line 1215
    invoke-direct {p0, v6, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->fixupFirstLefts2(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)V

    goto :goto_2

    .line 1218
    :cond_1
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v7

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->poly2ContainsPoly1(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1220
    iget-boolean v7, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    iput-boolean v7, v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    .line 1221
    iget-boolean v7, v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    xor-int/lit8 v7, v7, 0x1

    iput-boolean v7, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    .line 1222
    iget-object v7, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    iput-object v7, v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1223
    iput-object v6, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1224
    iget-boolean v7, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->usingPolyTree:Z

    if-eqz v7, :cond_3

    .line 1225
    invoke-direct {p0, v0, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->fixupFirstLefts2(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)V

    goto :goto_2

    .line 1230
    :cond_2
    iget-boolean v7, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    iput-boolean v7, v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    .line 1231
    iget-object v7, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    iput-object v7, v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1232
    iget-boolean v7, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->usingPolyTree:Z

    if-eqz v7, :cond_3

    .line 1233
    invoke-direct {p0, v0, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->fixupFirstLefts1(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)V

    .line 1236
    :cond_3
    :goto_2
    move-object v3, v1

    .line 1238
    .end local v4    # "op3":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .end local v5    # "op4":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .end local v6    # "outrec2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    :cond_4
    iget-object v3, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto/16 :goto_1

    .line 1240
    :cond_5
    iget-object v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1242
    .end local v3    # "op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v3

    if-ne v1, v3, :cond_0

    .line 1243
    .end local v0    # "outrec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    .end local v1    # "op":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    nop

    .line 1187
    :cond_6
    :goto_3
    move v0, v2

    goto/16 :goto_0

    .line 1244
    .end local v2    # "i":I
    .local v0, "i":I
    :cond_7
    return-void
.end method

.method private executeInternal()Z
    .locals 11

    .line 1332
    :try_start_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->reset()V

    .line 1333
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->currentLM:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 1334
    nop

    .line 1377
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->joins:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1378
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->ghostJoins:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1334
    return v1

    .line 1336
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->popScanbeam()J

    move-result-wide v2

    .line 1338
    .local v2, "botY":J
    :cond_1
    invoke-direct {p0, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->insertLocalMinimaIntoAEL(J)V

    .line 1339
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->processHorizontals()V

    .line 1340
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->ghostJoins:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1341
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->scanbeam:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    if-nez v0, :cond_2

    .line 1342
    goto :goto_0

    .line 1343
    :cond_2
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->popScanbeam()J

    move-result-wide v4

    .line 1344
    .local v4, "topY":J
    invoke-direct {p0, v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->processIntersections(J)Z

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_3

    .line 1345
    nop

    .line 1377
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->joins:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1378
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->ghostJoins:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1345
    return v1

    .line 1346
    :cond_3
    :try_start_2
    invoke-direct {p0, v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->processEdgesAtTopOfScanbeam(J)V

    .line 1347
    move-wide v2, v4

    .line 1348
    .end local v4    # "topY":J
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->scanbeam:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->currentLM:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    if-nez v0, :cond_1

    .line 1351
    :goto_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    if-ge v0, v4, :cond_7

    .line 1352
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1353
    .local v4, "outRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    iget-object v6, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->pts:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-eqz v6, :cond_6

    iget-boolean v6, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isOpen:Z

    if-eqz v6, :cond_4

    .line 1354
    goto :goto_3

    .line 1355
    :cond_4
    iget-boolean v6, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    iget-boolean v7, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->reverseSolution:Z

    xor-int/2addr v6, v7

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->area()D

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmpl-double v7, v7, v9

    if-lez v7, :cond_5

    goto :goto_2

    :cond_5
    move v5, v1

    :goto_2
    if-ne v6, v5, :cond_6

    .line 1356
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->reversePolyPtLinks()V

    .line 1351
    .end local v4    # "outRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    :cond_6
    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1359
    .end local v0    # "i":I
    :cond_7
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->joinCommonEdges()V

    .line 1361
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_4
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_a

    .line 1362
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1363
    .local v1, "outRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v4

    if-nez v4, :cond_8

    .line 1364
    goto :goto_5

    .line 1365
    :cond_8
    iget-boolean v4, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isOpen:Z

    if-eqz v4, :cond_9

    .line 1366
    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->fixupOutPolyline(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)V

    goto :goto_5

    .line 1368
    :cond_9
    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->fixupOutPolygon(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)V

    .line 1361
    .end local v1    # "outRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    :goto_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 1371
    .end local v0    # "i":I
    :cond_a
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->strictlySimple:Z

    if-eqz v0, :cond_b

    .line 1372
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->doSimplePolygons()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1373
    :cond_b
    nop

    .line 1377
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->joins:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1378
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->ghostJoins:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1373
    return v5

    .line 1377
    .end local v2    # "botY":J
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->joins:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 1378
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->ghostJoins:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 1379
    throw v0
.end method

.method private fixupFirstLefts1(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)V
    .locals 5
    .param p1, "OldOutRec"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    .param p2, "NewOutRec"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1385
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 1386
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1387
    .local v1, "outRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    if-nez v2, :cond_0

    .line 1388
    goto :goto_1

    .line 1390
    :cond_0
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    invoke-static {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->parseFirstLeft(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    move-result-object v2

    .line 1391
    .local v2, "firstLeft":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1392
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v3

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->poly2ContainsPoly1(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1393
    iput-object p2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1385
    .end local v1    # "outRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    .end local v2    # "firstLeft":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1397
    .end local v0    # "i":I
    :cond_2
    return-void
.end method

.method private fixupFirstLefts2(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)V
    .locals 3
    .param p1, "OldOutRec"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    .param p2, "NewOutRec"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1400
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1401
    .local v1, "outRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    if-ne v2, p1, :cond_0

    .line 1402
    iput-object p2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1404
    .end local v1    # "outRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    :cond_0
    goto :goto_0

    .line 1405
    :cond_1
    return-void
.end method

.method private fixupIntersectionOrder()Z
    .locals 6

    .line 1411
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectList:Ljava/util/List;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectNodeComparer:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1413
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->copyAELToSEL()V

    .line 1414
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 1415
    .local v0, "cnt":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_3

    .line 1416
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;

    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->EdgesAdjacent(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 1417
    add-int/lit8 v2, v1, 0x1

    .line 1418
    .local v2, "j":I
    :goto_1
    if-ge v2, v0, :cond_0

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;

    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->EdgesAdjacent(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1419
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1421
    :cond_0
    if-ne v2, v0, :cond_1

    .line 1422
    const/4 v3, 0x0

    return v3

    .line 1425
    :cond_1
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectList:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;

    .line 1426
    .local v3, "tmp":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectList:Ljava/util/List;

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectList:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4, v1, v5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1427
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectList:Ljava/util/List;

    invoke-interface {v4, v2, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1430
    .end local v2    # "j":I
    .end local v3    # "tmp":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;
    :cond_2
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectList:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;->edge1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectList:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;

    iget-object v3, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;->Edge2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-direct {p0, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->swapPositionsInSEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 1415
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1432
    .end local v1    # "i":I
    :cond_3
    const/4 v1, 0x1

    return v1
.end method

.method private fixupOutPolygon(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)V
    .locals 8
    .param p1, "outRec"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1459
    const/4 v0, 0x0

    .line 1460
    .local v0, "lastOK":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    const/4 v1, 0x0

    iput-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->bottomPt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1461
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v2

    .line 1462
    .local v2, "pp":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iget-boolean v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->preserveCollinear:Z

    if-nez v3, :cond_1

    iget-boolean v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->strictlySimple:Z

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v3, 0x1

    .line 1464
    .local v3, "preserveCol":Z
    :goto_1
    iget-object v4, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-eq v4, v2, :cond_7

    iget-object v4, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iget-object v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-ne v4, v5, :cond_2

    goto/16 :goto_3

    .line 1469
    :cond_2
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    iget-object v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    iget-object v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    iget-object v4, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1470
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    iget-object v6, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    iget-boolean v7, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->useFullRange:Z

    invoke-static {v4, v5, v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;->slopesEqual(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Z)Z

    move-result v4

    if-eqz v4, :cond_3

    if-eqz v3, :cond_6

    iget-object v4, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1471
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    iget-object v6, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;->isPt2BetweenPt1AndPt3(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Z

    move-result v4

    if-nez v4, :cond_3

    goto :goto_2

    .line 1477
    :cond_3
    if-ne v2, v0, :cond_4

    .line 1478
    nop

    .line 1487
    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->setPoints(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)V

    .line 1488
    return-void

    .line 1481
    :cond_4
    if-nez v0, :cond_5

    .line 1482
    move-object v0, v2

    .line 1484
    :cond_5
    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_1

    .line 1472
    :cond_6
    :goto_2
    const/4 v0, 0x0

    .line 1473
    iget-object v4, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iget-object v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iput-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1474
    iget-object v4, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iget-object v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iput-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1475
    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_1

    .line 1465
    :cond_7
    :goto_3
    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->setPoints(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)V

    .line 1466
    return-void
.end method

.method private fixupOutPolyline(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)V
    .locals 4
    .param p1, "outrec"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1439
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->pts:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1440
    .local v0, "pp":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1441
    .local v1, "lastPP":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :cond_0
    :goto_0
    if-eq v0, v1, :cond_2

    .line 1443
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1444
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->pt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iget-object v3, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->pt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1446
    if-ne v0, v1, :cond_1

    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1447
    :cond_1
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1448
    .local v2, "tmpPP":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iput-object v3, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1449
    iget-object v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iput-object v2, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1450
    move-object v0, v2

    .line 1451
    .end local v2    # "tmpPP":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    goto :goto_0

    .line 1453
    :cond_2
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-ne v0, v2, :cond_3

    const/4 v2, 0x0

    iput-object v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->pts:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1454
    :cond_3
    return-void
.end method

.method private static getHorzDirection(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;[J[J)V
    .locals 4
    .param p0, "HorzEdge"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p1, "Dir"    # [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .param p2, "Left"    # [J
    .param p3, "Right"    # [J

    .line 61
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v2

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    if-gez v0, :cond_0

    .line 62
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v2

    aput-wide v2, p2, v1

    .line 63
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v2

    aput-wide v2, p3, v1

    .line 64
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->LEFT_TO_RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    aput-object v0, p1, v1

    goto :goto_0

    .line 67
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v2

    aput-wide v2, p2, v1

    .line 68
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v2

    aput-wide v2, p3, v1

    .line 69
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->RIGHT_TO_LEFT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    aput-object v0, p1, v1

    .line 71
    :goto_0
    return-void
.end method

.method private getOutRec(I)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    .locals 3
    .param p1, "idx"    # I

    .line 1491
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1492
    .local v0, "outrec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    iget v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->Idx:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eq v0, v1, :cond_0

    .line 1493
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    iget v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->Idx:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    goto :goto_0

    .line 1495
    :cond_0
    return-object v0
.end method

.method private static getOverlap(JJJJ[J[J)Z
    .locals 6
    .param p0, "a1"    # J
    .param p2, "a2"    # J
    .param p4, "b1"    # J
    .param p6, "b2"    # J
    .param p8, "Left"    # [J
    .param p9, "Right"    # [J

    .line 74
    cmp-long v0, p0, p2

    const/4 v1, 0x0

    if-gez v0, :cond_1

    .line 75
    cmp-long v0, p4, p6

    if-gez v0, :cond_0

    .line 76
    invoke-static {p0, p1, p4, p5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    aput-wide v2, p8, v1

    .line 77
    invoke-static {p2, p3, p6, p7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    aput-wide v2, p9, v1

    goto :goto_0

    .line 80
    :cond_0
    invoke-static {p0, p1, p6, p7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    aput-wide v2, p8, v1

    .line 81
    invoke-static {p2, p3, p4, p5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    aput-wide v2, p9, v1

    goto :goto_0

    .line 85
    :cond_1
    cmp-long v0, p4, p6

    if-gez v0, :cond_2

    .line 86
    invoke-static {p2, p3, p4, p5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    aput-wide v2, p8, v1

    .line 87
    invoke-static {p0, p1, p6, p7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    aput-wide v2, p9, v1

    goto :goto_0

    .line 90
    :cond_2
    invoke-static {p2, p3, p6, p7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    aput-wide v2, p8, v1

    .line 91
    invoke-static {p0, p1, p4, p5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    aput-wide v2, p9, v1

    .line 94
    :goto_0
    aget-wide v2, p8, v1

    aget-wide v4, p9, v1

    cmp-long v0, v2, v4

    if-gez v0, :cond_3

    const/4 v1, 0x1

    :cond_3
    return v1
.end method

.method private insertEdgeIntoAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V
    .locals 5
    .param p1, "edge"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p2, "startEdge"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1499
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    const-class v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "insertEdgeIntoAEL"

    invoke-virtual {v0, v1, v2}, Ljava/util/logging/Logger;->entering(Ljava/lang/String;Ljava/lang/String;)V

    .line 1501
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    const-string v1, " -> "

    const-string v2, "Edge "

    const/4 v3, 0x0

    if-nez v0, :cond_0

    .line 1502
    iput-object v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1503
    iput-object v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1504
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->finest(Ljava/lang/String;)V

    .line 1505
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_1

    .line 1507
    :cond_0
    if-nez p2, :cond_1

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->doesE2InsertBeforeE1(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1508
    iput-object v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1509
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1510
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->finest(Ljava/lang/String;)V

    .line 1511
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object p1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1512
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_1

    .line 1515
    :cond_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    const-string v1, "activeEdges unchanged"

    invoke-virtual {v0, v1}, Ljava/util/logging/Logger;->finest(Ljava/lang/String;)V

    .line 1516
    if-nez p2, :cond_2

    .line 1517
    iget-object p2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1519
    :cond_2
    :goto_0
    iget-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v0, :cond_3

    iget-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1520
    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->doesE2InsertBeforeE1(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1521
    iget-object p2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_0

    .line 1523
    :cond_3
    iget-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1524
    iget-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v0, :cond_4

    .line 1525
    iget-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object p1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1527
    :cond_4
    iput-object p2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1528
    iput-object p1, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1530
    :goto_1
    return-void
.end method

.method private insertLocalMinimaIntoAEL(J)V
    .locals 14
    .param p1, "botY"    # J

    .line 1535
    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    const-class v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "insertLocalMinimaIntoAEL"

    invoke-virtual {v1, v2, v3}, Ljava/util/logging/Logger;->entering(Ljava/lang/String;Ljava/lang/String;)V

    .line 1537
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->currentLM:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    if-eqz v1, :cond_e

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->currentLM:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    iget-wide v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->y:J

    cmp-long v1, v1, p1

    if-nez v1, :cond_e

    .line 1538
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->currentLM:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    iget-object v9, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->leftBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1539
    .local v9, "lb":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->currentLM:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    iget-object v10, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->rightBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1540
    .local v10, "rb":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->popLocalMinima()V

    .line 1542
    const/4 v1, 0x0

    .line 1543
    .local v1, "Op1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    const/4 v2, 0x0

    if-nez v9, :cond_2

    .line 1544
    invoke-direct {p0, v10, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->insertEdgeIntoAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 1545
    invoke-direct {p0, v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->updateWindingCount(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 1546
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->subjFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    invoke-virtual {v10, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isContributing(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1547
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-direct {p0, v10, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v1

    move-object v11, v1

    goto :goto_1

    .line 1546
    :cond_1
    move-object v11, v1

    goto :goto_1

    .line 1550
    :cond_2
    if-nez v10, :cond_4

    .line 1551
    invoke-direct {p0, v9, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->insertEdgeIntoAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 1552
    invoke-direct {p0, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->updateWindingCount(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 1553
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->subjFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    invoke-virtual {v9, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isContributing(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1554
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-direct {p0, v9, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v1

    .line 1556
    :cond_3
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->insertScanbeam(J)V

    move-object v11, v1

    goto :goto_1

    .line 1559
    :cond_4
    invoke-direct {p0, v9, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->insertEdgeIntoAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 1560
    invoke-direct {p0, v10, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->insertEdgeIntoAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 1561
    invoke-direct {p0, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->updateWindingCount(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 1562
    iget v2, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    iput v2, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    .line 1563
    iget v2, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    iput v2, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    .line 1564
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->subjFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    invoke-virtual {v9, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isContributing(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1565
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-direct {p0, v9, v10, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addLocalMinPoly(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v1

    .line 1567
    :cond_5
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->insertScanbeam(J)V

    move-object v11, v1

    .line 1570
    .end local v1    # "Op1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v11, "Op1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :goto_1
    if-eqz v10, :cond_7

    .line 1571
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isHorizontal()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 1572
    invoke-direct {p0, v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addEdgeToSEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    goto :goto_2

    .line 1575
    :cond_6
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v1

    invoke-direct {p0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->insertScanbeam(J)V

    .line 1579
    :cond_7
    :goto_2
    if-eqz v9, :cond_0

    if-nez v10, :cond_8

    .line 1580
    goto/16 :goto_0

    .line 1584
    :cond_8
    if-eqz v11, :cond_a

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isHorizontal()Z

    move-result v1

    if-eqz v1, :cond_a

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->ghostJoins:Ljava/util/List;

    .line 1585
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_a

    iget v1, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eqz v1, :cond_a

    .line 1586
    const/4 v1, 0x0

    move v12, v1

    .local v12, "i":I
    :goto_3
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->ghostJoins:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v12, v1, :cond_a

    .line 1589
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->ghostJoins:Ljava/util/List;

    invoke-interface {v1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;

    .line 1590
    .local v13, "j":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;
    iget-object v1, v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v1

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->getOffPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v7

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->doHorzSegmentsOverlap(JJJJ)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 1591
    iget-object v1, v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->getOffPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-direct {p0, v1, v11, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addJoin(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 1586
    .end local v13    # "j":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;
    :cond_9
    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 1596
    .end local v12    # "i":I
    :cond_a
    iget v1, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v1, :cond_b

    iget-object v1, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v1, :cond_b

    iget-object v1, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1597
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v1

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-nez v1, :cond_b

    iget-object v1, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v1, :cond_b

    iget-object v1, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-boolean v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->useFullRange:Z

    .line 1599
    invoke-static {v1, v9, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->slopesEqual(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Z)Z

    move-result v1

    if-eqz v1, :cond_b

    iget v1, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eqz v1, :cond_b

    iget-object v1, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eqz v1, :cond_b

    .line 1601
    iget-object v1, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v1

    .line 1602
    .local v1, "Op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-direct {p0, v11, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addJoin(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 1605
    .end local v1    # "Op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :cond_b
    iget-object v1, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eq v1, v10, :cond_d

    .line 1607
    iget v1, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v1, :cond_c

    iget-object v1, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v1, :cond_c

    iget-object v1, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-boolean v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->useFullRange:Z

    .line 1608
    invoke-static {v1, v10, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->slopesEqual(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Z)Z

    move-result v1

    if-eqz v1, :cond_c

    iget v1, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eqz v1, :cond_c

    iget-object v1, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eqz v1, :cond_c

    .line 1610
    iget-object v1, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v1

    .line 1611
    .restart local v1    # "Op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-direct {p0, v11, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addJoin(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 1614
    .end local v1    # "Op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :cond_c
    iget-object v1, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 1615
    .local v1, "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    if-eqz v1, :cond_d

    .line 1616
    :goto_4
    if-eq v1, v10, :cond_d

    .line 1619
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-direct {p0, v10, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectEdges(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 1620
    iget-object v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_4

    .line 1625
    .end local v1    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v9    # "lb":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v10    # "rb":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v11    # "Op1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :cond_d
    goto/16 :goto_0

    .line 1626
    :cond_e
    return-void
.end method

.method private insertScanbeam(J)V
    .locals 3
    .param p1, "Y"    # J

    .line 629
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->scanbeam:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    if-nez v0, :cond_0

    .line 631
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->scanbeam:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    .line 632
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->scanbeam:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    .line 633
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->scanbeam:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    iput-wide p1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;->y:J

    goto :goto_1

    .line 635
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->scanbeam:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    iget-wide v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;->y:J

    cmp-long v0, p1, v0

    if-lez v0, :cond_1

    .line 637
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;)V

    .line 638
    .local v0, "newSb":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;
    iput-wide p1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;->y:J

    .line 639
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->scanbeam:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    .line 640
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->scanbeam:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    .line 641
    .end local v0    # "newSb":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;
    goto :goto_1

    .line 644
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->scanbeam:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    .line 645
    .local v0, "sb2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;
    :goto_0
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    if-eqz v1, :cond_2

    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    iget-wide v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;->y:J

    cmp-long v1, p1, v1

    if-gtz v1, :cond_2

    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    goto :goto_0

    .line 646
    :cond_2
    iget-wide v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;->y:J

    cmp-long v1, p1, v1

    if-nez v1, :cond_3

    return-void

    .line 647
    :cond_3
    new-instance v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    invoke-direct {v1, p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;)V

    .line 648
    .local v1, "newSb":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;
    iput-wide p1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;->y:J

    .line 649
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    iput-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    .line 650
    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    .line 652
    .end local v0    # "sb2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;
    .end local v1    # "newSb":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;
    :goto_1
    return-void
.end method

.method private intersectEdges(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V
    .locals 16
    .param p1, "e1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p2, "e2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p3, "pt"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 1662
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    const-class v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "insersectEdges"

    invoke-virtual {v4, v5, v6}, Ljava/util/logging/Logger;->entering(Ljava/lang/String;Ljava/lang/String;)V

    .line 1667
    iget v4, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-ltz v4, :cond_0

    move v4, v6

    goto :goto_0

    :cond_0
    move v4, v5

    .line 1668
    .local v4, "e1Contributing":Z
    :goto_0
    iget v7, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v7, :cond_1

    move v7, v6

    goto :goto_1

    :cond_1
    move v7, v5

    .line 1670
    .local v7, "e2Contributing":Z
    :goto_1
    invoke-direct {v0, v3, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->setZ(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 1673
    iget v8, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eqz v8, :cond_1e

    iget v8, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-nez v8, :cond_2

    goto/16 :goto_e

    .line 1717
    :cond_2
    iget-object v8, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    iget-object v9, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    .line 1739
    iget-object v10, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 1717
    if-ne v8, v9, :cond_6

    .line 1718
    iget-object v5, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->subjFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    invoke-virtual {v1, v10, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isEvenOddFillType(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1719
    iget v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    .line 1720
    .local v5, "oldE1WindCnt":I
    iget v8, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    iput v8, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    .line 1721
    iput v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    .line 1722
    .end local v5    # "oldE1WindCnt":I
    goto :goto_5

    .line 1724
    :cond_3
    iget v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    iget v8, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    add-int/2addr v5, v8

    if-nez v5, :cond_4

    .line 1725
    iget v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    neg-int v5, v5

    iput v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    goto :goto_2

    .line 1728
    :cond_4
    iget v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    iget v8, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    add-int/2addr v5, v8

    iput v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    .line 1730
    :goto_2
    iget v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    iget v8, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    sub-int/2addr v5, v8

    if-nez v5, :cond_5

    .line 1731
    iget v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    neg-int v5, v5

    iput v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    goto :goto_5

    .line 1734
    :cond_5
    iget v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    iget v8, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    sub-int/2addr v5, v8

    iput v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    goto :goto_5

    .line 1739
    :cond_6
    iget-object v8, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->subjFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    invoke-virtual {v2, v10, v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isEvenOddFillType(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z

    move-result v8

    if-nez v8, :cond_7

    .line 1740
    iget v8, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    iget v9, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    add-int/2addr v8, v9

    iput v8, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    goto :goto_4

    .line 1743
    :cond_7
    iget v8, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-nez v8, :cond_8

    move v8, v6

    goto :goto_3

    :cond_8
    move v8, v5

    :goto_3
    iput v8, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    .line 1745
    :goto_4
    iget-object v8, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    iget-object v9, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->subjFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    invoke-virtual {v1, v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isEvenOddFillType(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z

    move-result v8

    if-nez v8, :cond_9

    .line 1746
    iget v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    iget v8, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    sub-int/2addr v5, v8

    iput v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    goto :goto_5

    .line 1749
    :cond_9
    iget v8, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-nez v8, :cond_a

    move v5, v6

    :cond_a
    iput v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    .line 1754
    :goto_5
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    sget-object v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->SUBJECT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    if-ne v5, v8, :cond_b

    .line 1755
    iget-object v5, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->subjFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 1756
    .local v5, "e1FillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    iget-object v8, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .local v8, "e1FillType2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    goto :goto_6

    .line 1759
    .end local v5    # "e1FillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .end local v8    # "e1FillType2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    :cond_b
    iget-object v5, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 1760
    .restart local v5    # "e1FillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    iget-object v8, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->subjFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 1762
    .restart local v8    # "e1FillType2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    :goto_6
    iget-object v9, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    sget-object v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->SUBJECT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    if-ne v9, v10, :cond_c

    .line 1763
    iget-object v9, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->subjFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 1764
    .local v9, "e2FillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    iget-object v10, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .local v10, "e2FillType2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    goto :goto_7

    .line 1767
    .end local v9    # "e2FillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .end local v10    # "e2FillType2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    :cond_c
    iget-object v9, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 1768
    .restart local v9    # "e2FillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    iget-object v10, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->subjFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 1772
    .restart local v10    # "e2FillType2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    :goto_7
    sget-object v11, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$2;->$SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$clipper$IClipper$PolyFillType:[I

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->ordinal()I

    move-result v12

    aget v11, v11, v12

    packed-switch v11, :pswitch_data_0

    .line 1780
    iget v11, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    invoke-static {v11}, Ljava/lang/Math;->abs(I)I

    move-result v11

    .local v11, "e1Wc":I
    goto :goto_8

    .line 1777
    .end local v11    # "e1Wc":I
    :pswitch_0
    iget v11, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    neg-int v11, v11

    .line 1778
    .restart local v11    # "e1Wc":I
    goto :goto_8

    .line 1774
    .end local v11    # "e1Wc":I
    :pswitch_1
    iget v11, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    .line 1775
    .restart local v11    # "e1Wc":I
    nop

    .line 1783
    :goto_8
    sget-object v12, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$2;->$SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$clipper$IClipper$PolyFillType:[I

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->ordinal()I

    move-result v13

    aget v12, v12, v13

    packed-switch v12, :pswitch_data_1

    .line 1791
    iget v12, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    invoke-static {v12}, Ljava/lang/Math;->abs(I)I

    move-result v12

    .local v12, "e2Wc":I
    goto :goto_9

    .line 1788
    .end local v12    # "e2Wc":I
    :pswitch_2
    iget v12, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    neg-int v12, v12

    .line 1789
    .restart local v12    # "e2Wc":I
    goto :goto_9

    .line 1785
    .end local v12    # "e2Wc":I
    :pswitch_3
    iget v12, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    .line 1786
    .restart local v12    # "e2Wc":I
    nop

    .line 1795
    :goto_9
    if-eqz v4, :cond_11

    if-eqz v7, :cond_11

    .line 1796
    if-eqz v11, :cond_d

    if-ne v11, v6, :cond_f

    :cond_d
    if-eqz v12, :cond_e

    if-ne v12, v6, :cond_f

    :cond_e
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    iget-object v13, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    if-eq v6, v13, :cond_10

    iget-object v6, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    sget-object v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->XOR:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    if-eq v6, v13, :cond_10

    .line 1797
    :cond_f
    invoke-direct/range {p0 .. p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addLocalMaxPoly(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    goto/16 :goto_d

    .line 1800
    :cond_10
    invoke-direct {v0, v1, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1801
    invoke-direct {v0, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1802
    invoke-static/range {p1 .. p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->swapSides(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 1803
    invoke-static/range {p1 .. p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->swapPolyIndexes(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    goto/16 :goto_d

    .line 1806
    :cond_11
    if-eqz v4, :cond_13

    .line 1807
    if-eqz v12, :cond_12

    if-ne v12, v6, :cond_1d

    .line 1808
    :cond_12
    invoke-direct {v0, v1, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1809
    invoke-static/range {p1 .. p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->swapSides(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 1810
    invoke-static/range {p1 .. p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->swapPolyIndexes(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    goto/16 :goto_d

    .line 1814
    :cond_13
    if-eqz v7, :cond_15

    .line 1815
    if-eqz v11, :cond_14

    if-ne v11, v6, :cond_1d

    .line 1816
    :cond_14
    invoke-direct {v0, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1817
    invoke-static/range {p1 .. p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->swapSides(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 1818
    invoke-static/range {p1 .. p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->swapPolyIndexes(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    goto/16 :goto_d

    .line 1821
    :cond_15
    if-eqz v11, :cond_16

    if-ne v11, v6, :cond_1d

    :cond_16
    if-eqz v12, :cond_17

    if-ne v12, v6, :cond_1d

    .line 1824
    :cond_17
    sget-object v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$2;->$SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$clipper$IClipper$PolyFillType:[I

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->ordinal()I

    move-result v14

    aget v13, v13, v14

    packed-switch v13, :pswitch_data_2

    .line 1832
    iget v13, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    invoke-static {v13}, Ljava/lang/Math;->abs(I)I

    move-result v13

    .local v13, "e1Wc2":I
    goto :goto_a

    .line 1829
    .end local v13    # "e1Wc2":I
    :pswitch_4
    iget v13, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    neg-int v13, v13

    .line 1830
    .restart local v13    # "e1Wc2":I
    goto :goto_a

    .line 1826
    .end local v13    # "e1Wc2":I
    :pswitch_5
    iget v13, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    .line 1827
    .restart local v13    # "e1Wc2":I
    nop

    .line 1835
    :goto_a
    sget-object v14, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$2;->$SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$clipper$IClipper$PolyFillType:[I

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->ordinal()I

    move-result v15

    aget v14, v14, v15

    packed-switch v14, :pswitch_data_3

    .line 1843
    iget v14, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    invoke-static {v14}, Ljava/lang/Math;->abs(I)I

    move-result v14

    .local v14, "e2Wc2":I
    goto :goto_b

    .line 1840
    .end local v14    # "e2Wc2":I
    :pswitch_6
    iget v14, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    neg-int v14, v14

    .line 1841
    .restart local v14    # "e2Wc2":I
    goto :goto_b

    .line 1837
    .end local v14    # "e2Wc2":I
    :pswitch_7
    iget v14, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    .line 1838
    .restart local v14    # "e2Wc2":I
    nop

    .line 1847
    :goto_b
    iget-object v15, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    iget-object v6, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    if-eq v15, v6, :cond_18

    .line 1848
    invoke-direct/range {p0 .. p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addLocalMinPoly(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_d

    .line 1850
    :cond_18
    const/4 v6, 0x1

    if-ne v11, v6, :cond_1c

    if-ne v12, v6, :cond_1c

    .line 1851
    sget-object v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$2;->$SwitchMap$com$itextpdf$kernel$pdf$canvas$parser$clipper$IClipper$ClipType:[I

    iget-object v15, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    invoke-virtual {v15}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->ordinal()I

    move-result v15

    aget v6, v6, v15

    packed-switch v6, :pswitch_data_4

    goto :goto_c

    .line 1868
    :pswitch_8
    invoke-direct/range {p0 .. p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addLocalMinPoly(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_c

    .line 1863
    :pswitch_9
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    sget-object v15, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->CLIP:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    if-ne v6, v15, :cond_19

    if-lez v13, :cond_19

    if-gtz v14, :cond_1a

    :cond_19
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    sget-object v15, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->SUBJECT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    if-ne v6, v15, :cond_1b

    if-gtz v13, :cond_1b

    if-gtz v14, :cond_1b

    .line 1864
    :cond_1a
    invoke-direct/range {p0 .. p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addLocalMinPoly(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_c

    .line 1858
    :pswitch_a
    if-gtz v13, :cond_1b

    if-gtz v14, :cond_1b

    .line 1859
    invoke-direct/range {p0 .. p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addLocalMinPoly(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_c

    .line 1853
    :pswitch_b
    if-lez v13, :cond_1b

    if-lez v14, :cond_1b

    .line 1854
    invoke-direct/range {p0 .. p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addLocalMinPoly(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1869
    :cond_1b
    :goto_c
    goto :goto_d

    .line 1873
    :cond_1c
    invoke-static/range {p1 .. p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->swapSides(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 1876
    .end local v13    # "e1Wc2":I
    .end local v14    # "e2Wc2":I
    :cond_1d
    :goto_d
    return-void

    .line 1676
    .end local v5    # "e1FillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .end local v8    # "e1FillType2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .end local v9    # "e2FillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .end local v10    # "e2FillType2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .end local v11    # "e1Wc":I
    .end local v12    # "e2Wc":I
    :cond_1e
    :goto_e
    iget v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-nez v5, :cond_1f

    iget v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-nez v5, :cond_1f

    .line 1677
    return-void

    .line 1679
    :cond_1f
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    iget-object v6, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    const/4 v8, -0x1

    if-ne v5, v6, :cond_21

    iget v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    iget v6, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eq v5, v6, :cond_21

    iget-object v5, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    sget-object v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->UNION:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    if-ne v5, v6, :cond_21

    .line 1681
    iget v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-nez v5, :cond_20

    .line 1682
    if-eqz v7, :cond_25

    .line 1683
    invoke-direct {v0, v1, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1684
    if-eqz v4, :cond_25

    .line 1685
    iput v8, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    goto :goto_f

    .line 1690
    :cond_20
    if-eqz v4, :cond_25

    .line 1691
    invoke-direct {v0, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1692
    if-eqz v7, :cond_25

    .line 1693
    iput v8, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    goto :goto_f

    .line 1698
    :cond_21
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    iget-object v6, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    if-eq v5, v6, :cond_25

    .line 1699
    iget v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-nez v5, :cond_23

    iget v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_23

    iget-object v5, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    sget-object v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->UNION:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    if-ne v5, v6, :cond_22

    iget v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-nez v5, :cond_23

    .line 1700
    :cond_22
    invoke-direct {v0, v1, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1701
    if-eqz v4, :cond_25

    .line 1702
    iput v8, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    goto :goto_f

    .line 1705
    :cond_23
    iget v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-nez v5, :cond_25

    iget v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_25

    iget-object v5, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    sget-object v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->UNION:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    if-ne v5, v6, :cond_24

    iget v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-nez v5, :cond_25

    .line 1706
    :cond_24
    invoke-direct {v0, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1707
    if-eqz v7, :cond_25

    .line 1708
    iput v8, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 1712
    :cond_25
    :goto_f
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
    .end packed-switch
.end method

.method private intersectPoint(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V
    .locals 11
    .param p1, "edge1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p2, "edge2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p3, "ipV"    # [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 1879
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>()V

    const/4 v1, 0x0

    aput-object v0, p3, v1

    .line 1884
    .local v0, "ip":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    iget-wide v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    iget-wide v3, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    cmpl-double v1, v1, v3

    if-nez v1, :cond_0

    .line 1885
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setY(Ljava/lang/Number;)V

    .line 1886
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v1

    invoke-static {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->topX(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;J)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setX(Ljava/lang/Number;)V

    .line 1887
    return-void

    .line 1890
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getDelta()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_2

    .line 1891
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setX(Ljava/lang/Number;)V

    .line 1892
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isHorizontal()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1893
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setY(Ljava/lang/Number;)V

    goto/16 :goto_0

    .line 1896
    :cond_1
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v1

    long-to-double v1, v1

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    long-to-double v3, v3

    iget-wide v5, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    div-double/2addr v3, v5

    sub-double/2addr v1, v3

    .line 1897
    .local v1, "b2":D
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    long-to-double v3, v3

    iget-wide v5, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    div-double/2addr v3, v5

    add-double/2addr v3, v1

    invoke-static {v3, v4}, Ljava/lang/Math;->round(D)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setY(Ljava/lang/Number;)V

    goto/16 :goto_0

    .line 1900
    .end local v1    # "b2":D
    :cond_2
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getDelta()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v1

    cmp-long v1, v1, v3

    if-nez v1, :cond_4

    .line 1901
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setX(Ljava/lang/Number;)V

    .line 1902
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isHorizontal()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1903
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setY(Ljava/lang/Number;)V

    goto/16 :goto_0

    .line 1906
    :cond_3
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v1

    long-to-double v1, v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    long-to-double v3, v3

    iget-wide v5, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    div-double/2addr v3, v5

    sub-double/2addr v1, v3

    .line 1907
    .local v1, "b1":D
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    long-to-double v3, v3

    iget-wide v5, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    div-double/2addr v3, v5

    add-double/2addr v3, v1

    invoke-static {v3, v4}, Ljava/lang/Math;->round(D)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setY(Ljava/lang/Number;)V

    goto :goto_0

    .line 1911
    .end local v1    # "b1":D
    :cond_4
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v1

    long-to-double v1, v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v3

    long-to-double v3, v3

    iget-wide v5, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    mul-double/2addr v3, v5

    sub-double/2addr v1, v3

    .line 1912
    .restart local v1    # "b1":D
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    long-to-double v3, v3

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v5

    long-to-double v5, v5

    iget-wide v7, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    mul-double/2addr v5, v7

    sub-double/2addr v3, v5

    .line 1913
    .local v3, "b2":D
    sub-double v5, v3, v1

    iget-wide v7, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    iget-wide v9, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    sub-double/2addr v7, v9

    div-double/2addr v5, v7

    .line 1914
    .local v5, "q":D
    invoke-static {v5, v6}, Ljava/lang/Math;->round(D)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setY(Ljava/lang/Number;)V

    .line 1915
    iget-wide v7, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    invoke-static {v7, v8}, Ljava/lang/Math;->abs(D)D

    move-result-wide v7

    iget-wide v9, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    invoke-static {v9, v10}, Ljava/lang/Math;->abs(D)D

    move-result-wide v9

    cmpg-double v7, v7, v9

    if-gez v7, :cond_5

    .line 1916
    iget-wide v7, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    mul-double/2addr v7, v5

    add-double/2addr v7, v1

    invoke-static {v7, v8}, Ljava/lang/Math;->round(D)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setX(Ljava/lang/Number;)V

    goto :goto_0

    .line 1919
    :cond_5
    iget-wide v7, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    mul-double/2addr v7, v5

    add-double/2addr v7, v3

    invoke-static {v7, v8}, Ljava/lang/Math;->round(D)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setX(Ljava/lang/Number;)V

    .line 1923
    .end local v1    # "b1":D
    .end local v3    # "b2":D
    .end local v5    # "q":D
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-ltz v1, :cond_6

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v1

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-gez v1, :cond_9

    .line 1924
    :cond_6
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v1

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-lez v1, :cond_7

    .line 1925
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setY(Ljava/lang/Number;)V

    goto :goto_1

    .line 1928
    :cond_7
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setY(Ljava/lang/Number;)V

    .line 1930
    :goto_1
    iget-wide v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    invoke-static {v1, v2}, Ljava/lang/Math;->abs(D)D

    move-result-wide v1

    iget-wide v3, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(D)D

    move-result-wide v3

    cmpg-double v1, v1, v3

    if-gez v1, :cond_8

    .line 1931
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v1

    invoke-static {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->topX(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;J)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setX(Ljava/lang/Number;)V

    goto :goto_2

    .line 1934
    :cond_8
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v1

    invoke-static {p2, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->topX(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;J)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setX(Ljava/lang/Number;)V

    .line 1938
    :cond_9
    :goto_2
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-lez v1, :cond_b

    .line 1939
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setY(Ljava/lang/Number;)V

    .line 1941
    iget-wide v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    invoke-static {v1, v2}, Ljava/lang/Math;->abs(D)D

    move-result-wide v1

    iget-wide v3, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(D)D

    move-result-wide v3

    cmpl-double v1, v1, v3

    if-lez v1, :cond_a

    .line 1942
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v1

    invoke-static {p2, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->topX(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;J)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setX(Ljava/lang/Number;)V

    goto :goto_3

    .line 1945
    :cond_a
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v1

    invoke-static {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->topX(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;J)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setX(Ljava/lang/Number;)V

    .line 1948
    :cond_b
    :goto_3
    return-void
.end method

.method private static isParam1RightOfParam2(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)Z
    .locals 1
    .param p0, "outRec1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    .param p1, "outRec2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 99
    nop

    :cond_0
    iget-object p0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 100
    if-ne p0, p1, :cond_1

    .line 101
    const/4 v0, 0x1

    return v0

    .line 104
    :cond_1
    if-nez p0, :cond_0

    .line 105
    const/4 v0, 0x0

    return v0
.end method

.method private static isPointInPolygon(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)I
    .locals 27
    .param p0, "pt"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    .param p1, "op"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 112
    const/4 v0, 0x0

    .line 113
    .local v0, "result":I
    move-object/from16 v1, p1

    .line 114
    .local v1, "startOp":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v2

    .local v2, "ptx":J
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v4

    .line 115
    .local v4, "pty":J
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v6

    .local v6, "poly0x":J
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v8

    move-wide v9, v8

    move-wide v7, v6

    move v6, v0

    move-object/from16 v0, p1

    .line 117
    .end local p1    # "op":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v0, "op":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v6, "result":I
    .local v7, "poly0x":J
    .local v9, "poly0y":J
    :goto_0
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 118
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v11

    .local v11, "poly1x":J
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v13

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v13

    .line 120
    .local v13, "poly1y":J
    cmp-long v15, v13, v4

    const/16 v16, -0x1

    const/16 v17, 0x0

    const/16 v18, 0x1

    if-nez v15, :cond_4

    .line 121
    cmp-long v15, v11, v2

    if-eqz v15, :cond_3

    cmp-long v15, v9, v4

    if-nez v15, :cond_2

    cmp-long v15, v11, v2

    if-lez v15, :cond_0

    move/from16 v15, v18

    goto :goto_1

    :cond_0
    move/from16 v15, v17

    :goto_1
    cmp-long v19, v7, v2

    if-gez v19, :cond_1

    move-wide/from16 v19, v2

    move/from16 v2, v18

    goto :goto_2

    :cond_1
    move-wide/from16 v19, v2

    move/from16 v2, v17

    .end local v2    # "ptx":J
    .local v19, "ptx":J
    :goto_2
    if-ne v15, v2, :cond_5

    goto :goto_3

    .end local v19    # "ptx":J
    .restart local v2    # "ptx":J
    :cond_2
    move-wide/from16 v19, v2

    .end local v2    # "ptx":J
    .restart local v19    # "ptx":J
    goto :goto_4

    .end local v19    # "ptx":J
    .restart local v2    # "ptx":J
    :cond_3
    move-wide/from16 v19, v2

    .line 122
    .end local v2    # "ptx":J
    .restart local v19    # "ptx":J
    :goto_3
    return v16

    .line 120
    .end local v19    # "ptx":J
    .restart local v2    # "ptx":J
    :cond_4
    move-wide/from16 v19, v2

    .line 125
    .end local v2    # "ptx":J
    .restart local v19    # "ptx":J
    :cond_5
    :goto_4
    cmp-long v2, v9, v4

    if-gez v2, :cond_6

    move/from16 v2, v18

    goto :goto_5

    :cond_6
    move/from16 v2, v17

    :goto_5
    cmp-long v3, v13, v4

    if-gez v3, :cond_7

    move/from16 v3, v18

    goto :goto_6

    :cond_7
    move/from16 v3, v17

    :goto_6
    if-eq v2, v3, :cond_11

    .line 126
    cmp-long v2, v7, v19

    const-wide/16 v21, 0x0

    if-ltz v2, :cond_d

    .line 127
    cmp-long v2, v11, v19

    if-lez v2, :cond_8

    .line 128
    rsub-int/lit8 v2, v6, 0x1

    move v6, v2

    .end local v6    # "result":I
    .local v2, "result":I
    goto/16 :goto_b

    .line 131
    .end local v2    # "result":I
    .restart local v6    # "result":I
    :cond_8
    sub-long v2, v7, v19

    long-to-double v2, v2

    move-wide/from16 v23, v2

    sub-long v2, v13, v4

    long-to-double v2, v2

    mul-double v2, v2, v23

    move-wide/from16 v23, v2

    sub-long v2, v11, v19

    long-to-double v2, v2

    move-wide/from16 v25, v2

    sub-long v2, v9, v4

    long-to-double v2, v2

    mul-double v2, v2, v25

    sub-double v2, v23, v2

    .line 132
    .local v2, "d":D
    cmpl-double v15, v2, v21

    if-nez v15, :cond_9

    .line 133
    return v16

    .line 135
    :cond_9
    cmpl-double v15, v2, v21

    if-lez v15, :cond_a

    move/from16 v15, v18

    goto :goto_7

    :cond_a
    move/from16 v15, v17

    :goto_7
    cmp-long v16, v13, v9

    move-wide/from16 v23, v2

    if-lez v16, :cond_b

    move/from16 v2, v18

    goto :goto_8

    :cond_b
    move/from16 v2, v17

    .end local v2    # "d":D
    .local v23, "d":D
    :goto_8
    if-ne v15, v2, :cond_c

    .line 136
    rsub-int/lit8 v6, v6, 0x1

    .line 138
    .end local v23    # "d":D
    :cond_c
    goto :goto_b

    .line 141
    :cond_d
    cmp-long v2, v11, v19

    if-lez v2, :cond_11

    .line 142
    sub-long v2, v7, v19

    long-to-double v2, v2

    move-wide/from16 v23, v2

    sub-long v2, v13, v4

    long-to-double v2, v2

    mul-double v2, v2, v23

    move-wide/from16 v23, v2

    sub-long v2, v11, v19

    long-to-double v2, v2

    move-wide/from16 v25, v2

    sub-long v2, v9, v4

    long-to-double v2, v2

    mul-double v2, v2, v25

    sub-double v2, v23, v2

    .line 143
    .restart local v2    # "d":D
    cmpl-double v15, v2, v21

    if-nez v15, :cond_e

    .line 144
    return v16

    .line 146
    :cond_e
    cmpl-double v15, v2, v21

    if-lez v15, :cond_f

    move/from16 v15, v18

    goto :goto_9

    :cond_f
    move/from16 v15, v17

    :goto_9
    cmp-long v16, v13, v9

    move-wide/from16 v21, v2

    if-lez v16, :cond_10

    move/from16 v2, v18

    goto :goto_a

    :cond_10
    move/from16 v2, v17

    .end local v2    # "d":D
    .local v21, "d":D
    :goto_a
    if-ne v15, v2, :cond_11

    .line 147
    rsub-int/lit8 v2, v6, 0x1

    move v6, v2

    .line 152
    .end local v21    # "d":D
    :cond_11
    :goto_b
    move-wide v7, v11

    .line 153
    move-wide v9, v13

    .line 155
    .end local v11    # "poly1x":J
    .end local v13    # "poly1y":J
    if-ne v1, v0, :cond_12

    .line 157
    return v6

    .line 155
    :cond_12
    move-wide/from16 v2, v19

    goto/16 :goto_0
.end method

.method private joinCommonEdges()V
    .locals 12

    .line 1951
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->joins:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_12

    .line 1952
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->joins:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;

    .line 1954
    .local v1, "join":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iget v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->idx:I

    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->getOutRec(I)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    move-result-object v2

    .line 1955
    .local v2, "outRec1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iget v3, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->idx:I

    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->getOutRec(I)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    move-result-object v3

    .line 1957
    .local v3, "outRec2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v4

    if-eqz v4, :cond_11

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v4

    if-nez v4, :cond_0

    .line 1958
    goto/16 :goto_6

    .line 1960
    :cond_0
    iget-boolean v4, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isOpen:Z

    if-nez v4, :cond_11

    iget-boolean v4, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isOpen:Z

    if-eqz v4, :cond_1

    goto/16 :goto_6

    .line 1965
    :cond_1
    if-ne v2, v3, :cond_2

    .line 1966
    move-object v4, v2

    .local v4, "holeStateRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    goto :goto_1

    .line 1968
    .end local v4    # "holeStateRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    :cond_2
    invoke-static {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->isParam1RightOfParam2(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 1969
    move-object v4, v3

    .restart local v4    # "holeStateRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    goto :goto_1

    .line 1971
    .end local v4    # "holeStateRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    :cond_3
    invoke-static {v3, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->isParam1RightOfParam2(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1972
    move-object v4, v2

    .restart local v4    # "holeStateRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    goto :goto_1

    .line 1975
    .end local v4    # "holeStateRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    :cond_4
    invoke-static {v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getLowerMostRec(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    move-result-object v4

    .line 1978
    .restart local v4    # "holeStateRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    :goto_1
    invoke-direct {p0, v1, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->joinPoints(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 1979
    goto/16 :goto_6

    .line 1982
    :cond_5
    const/4 v5, 0x0

    if-ne v2, v3, :cond_f

    .line 1985
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v2, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->setPoints(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)V

    .line 1986
    iput-object v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->bottomPt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 1987
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->createOutRec()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    move-result-object v3

    .line 1988
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->setPoints(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)V

    .line 1991
    invoke-direct {p0, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->updateOutPtIdxs(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)V

    .line 1995
    iget-boolean v5, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->usingPolyTree:Z

    const/4 v6, 0x1

    if-eqz v5, :cond_8

    .line 1996
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_2
    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    sub-int/2addr v7, v6

    if-ge v5, v7, :cond_8

    .line 1997
    iget-object v7, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1998
    .local v7, "oRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v8

    if-eqz v8, :cond_7

    iget-object v8, v7, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    invoke-static {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->parseFirstLeft(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    move-result-object v8

    if-ne v8, v2, :cond_7

    iget-boolean v8, v7, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    iget-boolean v9, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    if-ne v8, v9, :cond_6

    .line 1999
    goto :goto_3

    .line 2001
    :cond_6
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v8

    iget-object v9, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-static {v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->poly2ContainsPoly1(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 2002
    iput-object v3, v7, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 1996
    .end local v7    # "oRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    :cond_7
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 2007
    .end local v5    # "j":I
    :cond_8
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v5

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v7

    invoke-static {v5, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->poly2ContainsPoly1(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)Z

    move-result v5

    const/4 v7, 0x0

    const-wide/16 v8, 0x0

    if-eqz v5, :cond_b

    .line 2009
    iget-boolean v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    xor-int/2addr v5, v6

    iput-boolean v5, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    .line 2010
    iput-object v2, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 2013
    iget-boolean v5, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->usingPolyTree:Z

    if-eqz v5, :cond_9

    .line 2014
    invoke-direct {p0, v3, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->fixupFirstLefts2(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)V

    .line 2017
    :cond_9
    iget-boolean v5, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    iget-boolean v10, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->reverseSolution:Z

    xor-int/2addr v5, v10

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->area()D

    move-result-wide v10

    cmpl-double v8, v10, v8

    if-lez v8, :cond_a

    goto :goto_4

    :cond_a
    move v6, v7

    :goto_4
    if-ne v5, v6, :cond_11

    .line 2018
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->reversePolyPtLinks()V

    goto :goto_6

    .line 2022
    :cond_b
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v5

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v10

    invoke-static {v5, v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->poly2ContainsPoly1(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)Z

    move-result v5

    if-eqz v5, :cond_e

    .line 2024
    iget-boolean v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    iput-boolean v5, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    .line 2025
    iget-boolean v5, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    xor-int/2addr v5, v6

    iput-boolean v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    .line 2026
    iget-object v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    iput-object v5, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 2027
    iput-object v3, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 2030
    iget-boolean v5, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->usingPolyTree:Z

    if-eqz v5, :cond_c

    .line 2031
    invoke-direct {p0, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->fixupFirstLefts2(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)V

    .line 2034
    :cond_c
    iget-boolean v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    iget-boolean v10, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->reverseSolution:Z

    xor-int/2addr v5, v10

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->area()D

    move-result-wide v10

    cmpl-double v8, v10, v8

    if-lez v8, :cond_d

    goto :goto_5

    :cond_d
    move v6, v7

    :goto_5
    if-ne v5, v6, :cond_11

    .line 2035
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->reversePolyPtLinks()V

    goto :goto_6

    .line 2040
    :cond_e
    iget-boolean v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    iput-boolean v5, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    .line 2041
    iget-object v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    iput-object v5, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 2044
    iget-boolean v5, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->usingPolyTree:Z

    if-eqz v5, :cond_11

    .line 2045
    invoke-direct {p0, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->fixupFirstLefts1(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)V

    goto :goto_6

    .line 2053
    :cond_f
    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->setPoints(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)V

    .line 2054
    iput-object v5, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->bottomPt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 2055
    iget v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->Idx:I

    iput v5, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->Idx:I

    .line 2057
    iget-boolean v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    iput-boolean v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    .line 2058
    if-ne v4, v3, :cond_10

    .line 2059
    iget-object v5, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    iput-object v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 2061
    :cond_10
    iput-object v2, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 2064
    iget-boolean v5, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->usingPolyTree:Z

    if-eqz v5, :cond_11

    .line 2065
    invoke-direct {p0, v3, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->fixupFirstLefts2(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)V

    .line 1951
    .end local v1    # "join":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;
    .end local v2    # "outRec1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    .end local v3    # "outRec2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    .end local v4    # "holeStateRec":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    :cond_11
    :goto_6
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 2069
    .end local v0    # "i":I
    :cond_12
    return-void
.end method

.method private static joinHorz(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Z)Z
    .locals 7
    .param p0, "op1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .param p1, "op1b"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .param p2, "op2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .param p3, "op2b"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .param p4, "Pt"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    .param p5, "DiscardLeft"    # Z

    .line 162
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->RIGHT_TO_LEFT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->LEFT_TO_RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    .line 163
    .local v0, "Dir1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    :goto_0
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v1

    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-lez v1, :cond_1

    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->RIGHT_TO_LEFT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    goto :goto_1

    :cond_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->LEFT_TO_RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    .line 164
    .local v1, "Dir2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    :goto_1
    const/4 v2, 0x0

    if-ne v0, v1, :cond_2

    .line 165
    return v2

    .line 173
    :cond_2
    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->LEFT_TO_RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    if-ne v0, v3, :cond_5

    .line 174
    :goto_2
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-gtz v3, :cond_3

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-ltz v3, :cond_3

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v3

    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_3

    .line 175
    iget-object p0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_2

    .line 177
    :cond_3
    if-eqz p5, :cond_4

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-eqz v3, :cond_4

    .line 178
    iget-object p0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 180
    :cond_4
    xor-int/lit8 v3, p5, 0x1

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->duplicate(Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object p1

    .line 181
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3, p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    .line 182
    move-object p0, p1

    .line 183
    invoke-virtual {p0, p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->setPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 184
    xor-int/lit8 v3, p5, 0x1

    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->duplicate(Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object p1

    goto :goto_4

    .line 188
    :cond_5
    :goto_3
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-ltz v3, :cond_6

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-gtz v3, :cond_6

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v3

    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_6

    .line 189
    iget-object p0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_3

    .line 191
    :cond_6
    if-nez p5, :cond_7

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-eqz v3, :cond_7

    .line 192
    iget-object p0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 194
    :cond_7
    invoke-virtual {p0, p5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->duplicate(Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object p1

    .line 195
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3, p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    .line 196
    move-object p0, p1

    .line 197
    invoke-virtual {p0, p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->setPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 198
    invoke-virtual {p0, p5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->duplicate(Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object p1

    .line 202
    :cond_8
    :goto_4
    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->LEFT_TO_RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    if-ne v1, v3, :cond_b

    .line 203
    :goto_5
    iget-object v3, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-gtz v3, :cond_9

    iget-object v3, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-ltz v3, :cond_9

    iget-object v3, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v3

    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_9

    .line 204
    iget-object p2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_5

    .line 206
    :cond_9
    if-eqz p5, :cond_a

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-eqz v3, :cond_a

    .line 207
    iget-object p2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 209
    :cond_a
    xor-int/lit8 v3, p5, 0x1

    invoke-virtual {p2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->duplicate(Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object p3

    .line 210
    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3, p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_e

    .line 211
    move-object p2, p3

    .line 212
    invoke-virtual {p2, p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->setPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 213
    xor-int/lit8 v3, p5, 0x1

    invoke-virtual {p2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->duplicate(Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object p3

    goto :goto_7

    .line 218
    :cond_b
    :goto_6
    iget-object v3, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-ltz v3, :cond_c

    iget-object v3, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-gtz v3, :cond_c

    iget-object v3, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v3

    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_c

    .line 219
    iget-object p2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_6

    .line 221
    :cond_c
    if-nez p5, :cond_d

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v3

    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-eqz v3, :cond_d

    .line 222
    iget-object p2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 224
    :cond_d
    invoke-virtual {p2, p5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->duplicate(Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object p3

    .line 225
    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {v3, p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_e

    .line 226
    move-object p2, p3

    .line 227
    invoke-virtual {p2, p4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->setPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 228
    invoke-virtual {p2, p5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->duplicate(Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object p3

    .line 234
    :cond_e
    :goto_7
    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->LEFT_TO_RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    const/4 v4, 0x1

    if-ne v0, v3, :cond_f

    move v2, v4

    :cond_f
    if-ne v2, p5, :cond_10

    .line 235
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 236
    iput-object p0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 237
    iput-object p3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 238
    iput-object p1, p3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_8

    .line 241
    :cond_10
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 242
    iput-object p0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 243
    iput-object p3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 244
    iput-object p1, p3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 246
    :goto_8
    return v4
.end method

.method private joinPoints(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)Z
    .locals 24
    .param p1, "j"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;
    .param p2, "outRec1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;
    .param p3, "outRec2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 250
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 251
    .local v4, "op1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 260
    .local v5, "op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iget-object v6, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v6

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->getOffPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v8

    cmp-long v6, v6, v8

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-nez v6, :cond_0

    move v6, v7

    goto :goto_0

    :cond_0
    move v6, v8

    .line 262
    .local v6, "isHorizontal":Z
    :goto_0
    if-eqz v6, :cond_8

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->getOffPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v9

    iget-object v10, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->getOffPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v9

    iget-object v10, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 264
    if-eq v2, v3, :cond_1

    .line 265
    return v8

    .line 267
    :cond_1
    iget-object v9, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iget-object v9, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 268
    .local v9, "op1b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :goto_1
    if-eq v9, v4, :cond_2

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v10

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->getOffPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 269
    iget-object v9, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_1

    .line 271
    :cond_2
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v10

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v10

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->getOffPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v12

    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v12

    cmp-long v10, v10, v12

    if-lez v10, :cond_3

    move v10, v7

    goto :goto_2

    :cond_3
    move v10, v8

    .line 272
    .local v10, "reverse1":Z
    :goto_2
    iget-object v11, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    iget-object v11, v11, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 273
    .local v11, "op2b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :goto_3
    if-eq v11, v5, :cond_4

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v12

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->getOffPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 274
    iget-object v11, v11, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_3

    .line 276
    :cond_4
    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v12

    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v12

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->getOffPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v14

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v14

    cmp-long v12, v12, v14

    if-lez v12, :cond_5

    move v12, v7

    goto :goto_4

    :cond_5
    move v12, v8

    .line 277
    .local v12, "reverse2":Z
    :goto_4
    if-ne v10, v12, :cond_6

    .line 278
    return v8

    .line 280
    :cond_6
    if-eqz v10, :cond_7

    .line 281
    invoke-virtual {v4, v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->duplicate(Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v8

    .line 282
    .end local v9    # "op1b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v8, "op1b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    invoke-virtual {v5, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->duplicate(Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v9

    .line 283
    .end local v11    # "op2b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v9, "op2b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iput-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 284
    iput-object v4, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 285
    iput-object v9, v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 286
    iput-object v8, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 287
    iput-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 288
    iput-object v8, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 289
    return v7

    .line 292
    .end local v8    # "op1b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v9, "op1b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .restart local v11    # "op2b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :cond_7
    invoke-virtual {v4, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->duplicate(Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v9

    .line 293
    invoke-virtual {v5, v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->duplicate(Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v8

    .line 294
    .end local v11    # "op2b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v8, "op2b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iput-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 295
    iput-object v4, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 296
    iput-object v8, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 297
    iput-object v9, v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 298
    iput-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 299
    iput-object v9, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 300
    return v7

    .line 303
    .end local v8    # "op2b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .end local v9    # "op1b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .end local v10    # "reverse1":Z
    .end local v12    # "reverse2":Z
    :cond_8
    if-eqz v6, :cond_19

    .line 307
    move-object v9, v4

    move-object v10, v4

    .line 308
    .end local v4    # "op1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .restart local v9    # "op1b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v10, "op1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :goto_5
    iget-object v4, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v11

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v13

    cmp-long v4, v11, v13

    if-nez v4, :cond_9

    iget-object v4, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-eq v4, v9, :cond_9

    iget-object v4, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-eq v4, v5, :cond_9

    .line 309
    iget-object v10, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_5

    .line 311
    :cond_9
    move-object v11, v9

    .end local v9    # "op1b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v11, "op1b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :goto_6
    iget-object v4, v11, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v12

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v14

    cmp-long v4, v12, v14

    if-nez v4, :cond_a

    iget-object v4, v11, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-eq v4, v10, :cond_a

    iget-object v4, v11, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-eq v4, v5, :cond_a

    .line 312
    iget-object v11, v11, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_6

    .line 314
    :cond_a
    iget-object v4, v11, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-eq v4, v10, :cond_18

    iget-object v4, v11, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-ne v4, v5, :cond_b

    goto/16 :goto_f

    .line 318
    :cond_b
    move-object v4, v5

    move-object v12, v5

    .line 319
    .end local v5    # "op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v4, "op2b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v12, "op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :goto_7
    iget-object v5, v12, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v13

    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v15

    cmp-long v5, v13, v15

    if-nez v5, :cond_c

    iget-object v5, v12, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-eq v5, v4, :cond_c

    iget-object v5, v12, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-eq v5, v11, :cond_c

    .line 320
    iget-object v12, v12, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_7

    .line 322
    :cond_c
    move-object v13, v4

    .end local v4    # "op2b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v13, "op2b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :goto_8
    iget-object v4, v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v4

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v14

    cmp-long v4, v4, v14

    if-nez v4, :cond_d

    iget-object v4, v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-eq v4, v12, :cond_d

    iget-object v4, v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-eq v4, v10, :cond_d

    .line 323
    iget-object v13, v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_8

    .line 325
    :cond_d
    iget-object v4, v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-eq v4, v12, :cond_17

    iget-object v4, v13, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    if-ne v4, v10, :cond_e

    goto/16 :goto_e

    .line 329
    :cond_e
    new-array v4, v7, [J

    .local v4, "LeftV":[J
    new-array v5, v7, [J

    .line 331
    .local v5, "RightV":[J
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v14

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v16

    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v18

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v20

    move-object/from16 v22, v4

    move-object/from16 v23, v5

    .end local v4    # "LeftV":[J
    .end local v5    # "RightV":[J
    .local v22, "LeftV":[J
    .local v23, "RightV":[J
    invoke-static/range {v14 .. v23}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->getOverlap(JJJJ[J[J)Z

    move-result v4

    if-nez v4, :cond_f

    .line 332
    return v8

    .line 334
    :cond_f
    aget-wide v4, v22, v8

    .line 335
    .local v4, "Left":J
    aget-wide v16, v23, v8

    .line 342
    .local v16, "Right":J
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v14

    cmp-long v9, v14, v4

    if-ltz v9, :cond_11

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v14

    cmp-long v9, v14, v16

    if-gtz v9, :cond_11

    .line 343
    new-instance v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v14

    invoke-direct {v9, v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 344
    .local v9, "Pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v14

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v14

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v18

    cmp-long v14, v14, v18

    if-lez v14, :cond_10

    goto :goto_9

    :cond_10
    move v7, v8

    :goto_9
    move v15, v7

    move-object v14, v9

    .local v7, "DiscardLeftSide":Z
    goto/16 :goto_d

    .line 346
    .end local v7    # "DiscardLeftSide":Z
    .end local v9    # "Pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    :cond_11
    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v14

    cmp-long v9, v14, v4

    if-ltz v9, :cond_13

    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v14

    cmp-long v9, v14, v16

    if-gtz v9, :cond_13

    .line 347
    new-instance v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v14

    invoke-direct {v9, v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 348
    .restart local v9    # "Pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v14

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v14

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v18

    cmp-long v14, v14, v18

    if-lez v14, :cond_12

    goto :goto_a

    :cond_12
    move v7, v8

    :goto_a
    move v15, v7

    move-object v14, v9

    .restart local v7    # "DiscardLeftSide":Z
    goto :goto_d

    .line 350
    .end local v7    # "DiscardLeftSide":Z
    .end local v9    # "Pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    :cond_13
    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v14

    cmp-long v9, v14, v4

    if-ltz v9, :cond_15

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v14

    cmp-long v9, v14, v16

    if-gtz v9, :cond_15

    .line 351
    new-instance v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v14

    invoke-direct {v9, v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 352
    .restart local v9    # "Pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v14

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v14

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v18

    cmp-long v14, v14, v18

    if-lez v14, :cond_14

    goto :goto_b

    :cond_14
    move v7, v8

    :goto_b
    move v15, v7

    move-object v14, v9

    .restart local v7    # "DiscardLeftSide":Z
    goto :goto_d

    .line 355
    .end local v7    # "DiscardLeftSide":Z
    .end local v9    # "Pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    :cond_15
    new-instance v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v14

    invoke-direct {v9, v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 356
    .restart local v9    # "Pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v14

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v14

    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v18

    cmp-long v14, v14, v18

    if-lez v14, :cond_16

    goto :goto_c

    :cond_16
    move v7, v8

    :goto_c
    move v15, v7

    move-object v14, v9

    .line 358
    .end local v9    # "Pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    .local v14, "Pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    .local v15, "DiscardLeftSide":Z
    :goto_d
    iput-object v10, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 359
    iput-object v12, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 360
    invoke-static/range {v10 .. v15}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->joinHorz(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Z)Z

    move-result v7

    return v7

    .line 326
    .end local v4    # "Left":J
    .end local v14    # "Pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    .end local v15    # "DiscardLeftSide":Z
    .end local v16    # "Right":J
    .end local v22    # "LeftV":[J
    .end local v23    # "RightV":[J
    :cond_17
    :goto_e
    return v8

    .line 315
    .end local v12    # "op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .end local v13    # "op2b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v5, "op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :cond_18
    :goto_f
    return v8

    .line 368
    .end local v10    # "op1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .end local v11    # "op1b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v4, "op1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :cond_19
    iget-object v9, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 369
    .local v9, "op1b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :goto_10
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v10

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1a

    if-eq v9, v4, :cond_1a

    .line 370
    iget-object v9, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_10

    .line 372
    :cond_1a
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v10

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v10

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v12

    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v12

    cmp-long v10, v10, v12

    if-gtz v10, :cond_1c

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v10

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v11

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->getOffPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v12

    iget-boolean v13, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->useFullRange:Z

    invoke-static {v10, v11, v12, v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;->slopesEqual(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Z)Z

    move-result v10

    if-nez v10, :cond_1b

    goto :goto_11

    :cond_1b
    move v10, v8

    goto :goto_12

    :cond_1c
    :goto_11
    move v10, v7

    .line 373
    .local v10, "Reverse1":Z
    :goto_12
    if-eqz v10, :cond_1f

    .line 374
    iget-object v9, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 375
    :goto_13
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v11

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1d

    if-eq v9, v4, :cond_1d

    .line 376
    iget-object v9, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_13

    .line 378
    :cond_1d
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v11

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v13

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v13

    cmp-long v11, v11, v13

    if-gtz v11, :cond_1e

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v11

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v12

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->getOffPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v13

    iget-boolean v14, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->useFullRange:Z

    invoke-static {v11, v12, v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;->slopesEqual(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Z)Z

    move-result v11

    if-nez v11, :cond_1f

    .line 379
    :cond_1e
    return v8

    .line 383
    :cond_1f
    iget-object v11, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 384
    .local v11, "op2b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :goto_14
    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v12

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_20

    if-eq v11, v5, :cond_20

    .line 385
    iget-object v11, v11, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_14

    .line 387
    :cond_20
    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v12

    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v12

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v14

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v14

    cmp-long v12, v12, v14

    if-gtz v12, :cond_22

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v12

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v13

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->getOffPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v14

    iget-boolean v15, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->useFullRange:Z

    invoke-static {v12, v13, v14, v15}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;->slopesEqual(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Z)Z

    move-result v12

    if-nez v12, :cond_21

    goto :goto_15

    :cond_21
    move v12, v8

    goto :goto_16

    :cond_22
    :goto_15
    move v12, v7

    .line 388
    .local v12, "Reverse2":Z
    :goto_16
    if-eqz v12, :cond_25

    .line 389
    iget-object v11, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 390
    :goto_17
    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v13

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_23

    if-eq v11, v5, :cond_23

    .line 391
    iget-object v11, v11, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_17

    .line 393
    :cond_23
    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v13

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v13

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v15

    invoke-virtual {v15}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v15

    cmp-long v13, v13, v15

    if-gtz v13, :cond_24

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v13

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v14

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->getOffPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v15

    iget-boolean v7, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->useFullRange:Z

    invoke-static {v13, v14, v15, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point;->slopesEqual(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Z)Z

    move-result v7

    if-nez v7, :cond_25

    .line 394
    :cond_24
    return v8

    .line 398
    :cond_25
    if-eq v9, v4, :cond_28

    if-eq v11, v5, :cond_28

    if-eq v9, v11, :cond_28

    if-ne v2, v3, :cond_26

    if-ne v10, v12, :cond_26

    goto :goto_18

    .line 402
    :cond_26
    if-eqz v10, :cond_27

    .line 403
    invoke-virtual {v4, v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->duplicate(Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v7

    .line 404
    .end local v9    # "op1b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v7, "op1b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    const/4 v8, 0x1

    invoke-virtual {v5, v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->duplicate(Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v9

    .line 405
    .end local v11    # "op2b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v9, "op2b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iput-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 406
    iput-object v4, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 407
    iput-object v9, v7, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 408
    iput-object v7, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 409
    iput-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 410
    iput-object v7, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 411
    const/4 v13, 0x1

    return v13

    .line 414
    .end local v7    # "op1b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v9, "op1b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .restart local v11    # "op2b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :cond_27
    const/4 v13, 0x1

    invoke-virtual {v4, v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->duplicate(Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v7

    .line 415
    .end local v9    # "op1b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .restart local v7    # "op1b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    invoke-virtual {v5, v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->duplicate(Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v8

    .line 416
    .end local v11    # "op2b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .restart local v8    # "op2b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iput-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 417
    iput-object v4, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 418
    iput-object v8, v7, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 419
    iput-object v7, v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 420
    iput-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 421
    iput-object v7, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->outPt2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 422
    const/16 v16, 0x1

    return v16

    .line 399
    .end local v7    # "op1b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .end local v8    # "op2b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .restart local v9    # "op1b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .restart local v11    # "op2b":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :cond_28
    :goto_18
    return v8
.end method

.method private static minkowski(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;ZZ)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    .locals 16
    .param p0, "pattern"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    .param p1, "path"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    .param p2, "IsSum"    # Z
    .param p3, "IsClosed"    # Z

    .line 428
    move-object/from16 v0, p1

    move/from16 v1, p3

    .line 429
    .local v1, "delta":I
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->size()I

    move-result v2

    .line 430
    .local v2, "polyCnt":I
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->size()I

    move-result v3

    .line 431
    .local v3, "pathCnt":I
    new-instance v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;

    invoke-direct {v4, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;-><init>(I)V

    .line 432
    .local v4, "result":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    if-eqz p2, :cond_2

    .line 433
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-ge v5, v3, :cond_1

    .line 434
    new-instance v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    invoke-direct {v6, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;-><init>(I)V

    .line 435
    .local v6, "p":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 436
    .local v8, "ip":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    new-instance v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v10

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v12

    add-long/2addr v10, v12

    invoke-virtual {v0, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v12

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v14

    add-long/2addr v12, v14

    const-wide/16 v14, 0x0

    invoke-direct/range {v9 .. v15}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(JJJ)V

    invoke-virtual {v6, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->add(Ljava/lang/Object;)Z

    .line 437
    .end local v8    # "ip":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    goto :goto_1

    .line 438
    :cond_0
    invoke-virtual {v4, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;->add(Ljava/lang/Object;)Z

    .line 433
    .end local v6    # "p":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .end local v5    # "i":I
    :cond_1
    goto :goto_4

    .line 442
    :cond_2
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_2
    if-ge v5, v3, :cond_4

    .line 443
    new-instance v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    invoke-direct {v6, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;-><init>(I)V

    .line 444
    .restart local v6    # "p":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 445
    .restart local v8    # "ip":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    new-instance v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v10

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v12

    sub-long/2addr v10, v12

    invoke-virtual {v0, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v12

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v14

    sub-long/2addr v12, v14

    const-wide/16 v14, 0x0

    invoke-direct/range {v9 .. v15}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(JJJ)V

    invoke-virtual {v6, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->add(Ljava/lang/Object;)Z

    .line 446
    .end local v8    # "ip":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    goto :goto_3

    .line 447
    :cond_3
    invoke-virtual {v4, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;->add(Ljava/lang/Object;)Z

    .line 442
    .end local v6    # "p":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 451
    .end local v5    # "i":I
    :cond_4
    :goto_4
    new-instance v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;

    add-int v6, v3, v1

    add-int/lit8 v7, v2, 0x1

    mul-int/2addr v6, v7

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;-><init>(I)V

    .line 452
    .local v5, "quads":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_5
    add-int/lit8 v7, v3, -0x1

    add-int/2addr v7, v1

    if-ge v6, v7, :cond_7

    .line 453
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_6
    if-ge v7, v2, :cond_6

    .line 454
    new-instance v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    const/4 v9, 0x4

    invoke-direct {v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;-><init>(I)V

    .line 455
    .local v8, "quad":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    rem-int v9, v6, v3

    invoke-virtual {v4, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    rem-int v10, v7, v2

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->add(Ljava/lang/Object;)Z

    .line 456
    add-int/lit8 v9, v6, 0x1

    rem-int/2addr v9, v3

    invoke-virtual {v4, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    rem-int v10, v7, v2

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->add(Ljava/lang/Object;)Z

    .line 457
    add-int/lit8 v9, v6, 0x1

    rem-int/2addr v9, v3

    invoke-virtual {v4, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    add-int/lit8 v10, v7, 0x1

    rem-int/2addr v10, v2

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->add(Ljava/lang/Object;)Z

    .line 458
    rem-int v9, v6, v3

    invoke-virtual {v4, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    add-int/lit8 v10, v7, 0x1

    rem-int/2addr v10, v2

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->add(Ljava/lang/Object;)Z

    .line 459
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->orientation()Z

    move-result v9

    if-nez v9, :cond_5

    .line 460
    invoke-static {v8}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 462
    :cond_5
    invoke-virtual {v5, v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;->add(Ljava/lang/Object;)Z

    .line 453
    .end local v8    # "quad":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    add-int/lit8 v7, v7, 0x1

    goto :goto_6

    .line 452
    .end local v7    # "j":I
    :cond_6
    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 465
    .end local v6    # "i":I
    :cond_7
    return-object v5
.end method

.method public static minkowskiDiff(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    .locals 5
    .param p0, "poly1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    .param p1, "poly2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    .line 469
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->minkowski(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;ZZ)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;

    move-result-object v0

    .line 470
    .local v0, "paths":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    new-instance v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;-><init>()V

    .line 471
    .local v2, "c":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;
    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->SUBJECT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    invoke-virtual {v2, v0, v3, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addPaths(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;Z)Z

    .line 472
    sget-object v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->UNION:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->NON_ZERO:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->NON_ZERO:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    invoke-virtual {v2, v1, v0, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z

    .line 473
    return-object v0
.end method

.method public static minkowskiSum(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    .locals 5
    .param p0, "pattern"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    .param p1, "path"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    .param p2, "pathIsClosed"    # Z

    .line 477
    const/4 v0, 0x1

    invoke-static {p0, p1, v0, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->minkowski(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;ZZ)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;

    move-result-object v1

    .line 478
    .local v1, "paths":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    new-instance v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;-><init>()V

    .line 479
    .local v2, "c":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;
    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->SUBJECT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    invoke-virtual {v2, v1, v3, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addPaths(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;Z)Z

    .line 480
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->UNION:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->NON_ZERO:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->NON_ZERO:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    invoke-virtual {v2, v0, v1, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z

    .line 481
    return-object v1
.end method

.method public static minkowskiSum(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;Z)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    .locals 7
    .param p0, "pattern"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    .param p1, "paths"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    .param p2, "pathIsClosed"    # Z

    .line 485
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;-><init>()V

    .line 486
    .local v0, "solution":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    new-instance v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;-><init>()V

    .line 487
    .local v1, "c":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 488
    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    const/4 v4, 0x1

    invoke-static {p0, v3, v4, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->minkowski(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;ZZ)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;

    move-result-object v3

    .line 489
    .local v3, "tmp":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    sget-object v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->SUBJECT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    invoke-virtual {v1, v3, v5, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addPaths(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;Z)Z

    .line 490
    if-eqz p2, :cond_0

    .line 491
    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;->TranslatePath(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    move-result-object v5

    .line 492
    .local v5, "path":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    sget-object v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->CLIP:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    invoke-virtual {v1, v5, v6, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addPath(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;Z)Z

    .line 487
    .end local v3    # "tmp":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    .end local v5    # "path":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 495
    .end local v2    # "i":I
    :cond_1
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->UNION:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->NON_ZERO:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->NON_ZERO:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    invoke-virtual {v1, v2, v0, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z

    .line 496
    return-object v0
.end method

.method private static poly2ContainsPoly1(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)Z
    .locals 3
    .param p0, "outPt1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .param p1, "outPt2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 500
    move-object v0, p0

    .line 503
    .local v0, "op":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->isPointInPolygon(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;)I

    move-result v1

    .line 504
    .local v1, "res":I
    const/4 v2, 0x1

    if-ltz v1, :cond_2

    .line 505
    if-lez v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    return v2

    .line 507
    :cond_2
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 509
    .end local v1    # "res":I
    if-ne v0, p0, :cond_0

    .line 510
    return v2
.end method

.method private popScanbeam()J
    .locals 3

    .line 2072
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    const-class v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "popBeam"

    invoke-virtual {v0, v1, v2}, Ljava/util/logging/Logger;->entering(Ljava/lang/String;Ljava/lang/String;)V

    .line 2074
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->scanbeam:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    iget-wide v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;->y:J

    .line 2075
    .local v0, "y":J
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->scanbeam:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->scanbeam:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    .line 2076
    return-wide v0
.end method

.method private processEdgesAtTopOfScanbeam(J)V
    .locals 13
    .param p1, "topY"    # J

    .line 2080
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    const-class v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "processEdgesAtTopOfScanbeam"

    invoke-virtual {v0, v2, v3}, Ljava/util/logging/Logger;->entering(Ljava/lang/String;Ljava/lang/String;)V

    .line 2082
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2083
    .local v0, "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_0
    const/4 v2, 0x1

    const/4 v4, 0x0

    if-eqz v0, :cond_9

    .line 2086
    long-to-double v5, p1

    invoke-virtual {v0, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isMaxima(D)Z

    move-result v5

    .line 2088
    .local v5, "IsMaximaEdge":Z
    if-eqz v5, :cond_2

    .line 2089
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getMaximaPair()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    move-result-object v6

    .line 2090
    .local v6, "eMaxPair":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    if-eqz v6, :cond_1

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isHorizontal()Z

    move-result v7

    if-nez v7, :cond_0

    goto :goto_1

    :cond_0
    move v7, v4

    goto :goto_2

    :cond_1
    :goto_1
    move v7, v2

    :goto_2
    move v5, v7

    .line 2093
    .end local v6    # "eMaxPair":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :cond_2
    if-eqz v5, :cond_5

    .line 2094
    iget-boolean v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->strictlySimple:Z

    if-eqz v2, :cond_3

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v6

    invoke-direct {p0, v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->InsertMaxima(J)V

    .line 2095
    :cond_3
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2096
    .local v2, "ePrev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->doMaxima(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 2097
    if-nez v2, :cond_4

    .line 2098
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_3

    .line 2101
    :cond_4
    iget-object v0, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2103
    .end local v2    # "ePrev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_3
    goto/16 :goto_5

    .line 2106
    :cond_5
    long-to-double v6, p1

    invoke-virtual {v0, v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isIntermediate(D)Z

    move-result v6

    if-eqz v6, :cond_7

    iget-object v6, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isHorizontal()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 2107
    new-array v2, v2, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    aput-object v0, v2, v4

    .line 2108
    .local v2, "t":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->updateEdgeIntoAEL([Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 2109
    aget-object v0, v2, v4

    .line 2110
    iget v4, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v4, :cond_6

    .line 2111
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-direct {p0, v0, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 2113
    :cond_6
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addEdgeToSEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 2114
    .end local v2    # "t":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    goto :goto_4

    .line 2116
    :cond_7
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-static {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->topX(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;J)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setX(Ljava/lang/Number;)V

    .line 2117
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setY(Ljava/lang/Number;)V

    .line 2122
    :goto_4
    iget-boolean v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->strictlySimple:Z

    if-eqz v2, :cond_8

    .line 2123
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2124
    .local v2, "ePrev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget v4, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v4, :cond_8

    iget v4, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eqz v4, :cond_8

    if-eqz v2, :cond_8

    iget v4, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v4, :cond_8

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v6

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v8

    cmp-long v4, v6, v8

    if-nez v4, :cond_8

    iget v4, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eqz v4, :cond_8

    .line 2126
    new-instance v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-direct {v4, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 2128
    .local v4, "ip":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    invoke-direct {p0, v4, v2, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->setZ(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 2130
    invoke-direct {p0, v2, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v6

    .line 2131
    .local v6, "op":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    invoke-direct {p0, v0, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v7

    .line 2132
    .local v7, "op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    invoke-direct {p0, v6, v7, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addJoin(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 2136
    .end local v2    # "ePrev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v4    # "ip":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    .end local v6    # "op":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .end local v7    # "op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :cond_8
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2138
    .end local v5    # "IsMaximaEdge":Z
    :goto_5
    goto/16 :goto_0

    .line 2141
    :cond_9
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->processHorizontals()V

    .line 2142
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->maxima:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    .line 2145
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2146
    :goto_6
    if-eqz v0, :cond_d

    .line 2147
    long-to-double v5, p1

    invoke-virtual {v0, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isIntermediate(D)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 2148
    const/4 v5, 0x0

    .line 2149
    .local v5, "op":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iget v6, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v6, :cond_a

    .line 2150
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-direct {p0, v0, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v5

    .line 2152
    :cond_a
    new-array v6, v2, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    aput-object v0, v6, v4

    .line 2153
    .local v6, "t":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    invoke-direct {p0, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->updateEdgeIntoAEL([Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 2154
    aget-object v0, v6, v4

    .line 2157
    iget-object v7, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2158
    .local v7, "ePrev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget-object v8, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2159
    .local v8, "eNext":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    if-eqz v7, :cond_b

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v9

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_b

    if-eqz v5, :cond_b

    iget v9, v7, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v9, :cond_b

    .line 2160
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v9

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v11

    cmp-long v9, v9, v11

    if-lez v9, :cond_b

    iget-boolean v9, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->useFullRange:Z

    invoke-static {v0, v7, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->slopesEqual(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Z)Z

    move-result v9

    if-eqz v9, :cond_b

    iget v9, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eqz v9, :cond_b

    iget v9, v7, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eqz v9, :cond_b

    .line 2162
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v9

    invoke-direct {p0, v7, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v9

    .line 2163
    .local v9, "op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v10

    invoke-direct {p0, v5, v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addJoin(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 2164
    .end local v9    # "op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    goto :goto_7

    .line 2165
    :cond_b
    if-eqz v8, :cond_c

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v9

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_c

    if-eqz v5, :cond_c

    iget v9, v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v9, :cond_c

    .line 2166
    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v9

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v9

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v11

    invoke-virtual {v11}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v11

    cmp-long v9, v9, v11

    if-lez v9, :cond_c

    iget-boolean v9, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->useFullRange:Z

    invoke-static {v0, v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->slopesEqual(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Z)Z

    move-result v9

    if-eqz v9, :cond_c

    iget v9, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eqz v9, :cond_c

    iget v9, v8, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eqz v9, :cond_c

    .line 2168
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v9

    invoke-direct {p0, v8, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v9

    .line 2169
    .restart local v9    # "op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v10

    invoke-direct {p0, v5, v9, v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addJoin(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 2172
    .end local v5    # "op":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .end local v6    # "t":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v7    # "ePrev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v8    # "eNext":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v9    # "op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :cond_c
    :goto_7
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto/16 :goto_6

    .line 2174
    :cond_d
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1, v3}, Ljava/util/logging/Logger;->exiting(Ljava/lang/String;Ljava/lang/String;)V

    .line 2175
    return-void
.end method

.method private processHorizontal(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V
    .locals 28
    .param p1, "horzEdge"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2178
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    const-class v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "isHorizontal"

    invoke-virtual {v2, v3, v4}, Ljava/util/logging/Logger;->entering(Ljava/lang/String;Ljava/lang/String;)V

    .line 2179
    const/4 v9, 0x1

    new-array v10, v9, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    .line 2180
    .local v10, "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    new-array v11, v9, [J

    .local v11, "horzLeft":[J
    new-array v12, v9, [J

    .line 2181
    .local v12, "horzRight":[J
    iget v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    const/4 v13, 0x0

    if-ltz v2, :cond_0

    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    iget v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    iget-boolean v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isOpen:Z

    if-eqz v2, :cond_0

    move v2, v9

    goto :goto_0

    :cond_0
    move v2, v13

    :goto_0
    move v14, v2

    .line 2183
    .local v14, "IsOpen":Z
    invoke-static {v1, v10, v11, v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->getHorzDirection(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;[J[J)V

    .line 2185
    move-object/from16 v2, p1

    .local v2, "eLastHorz":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    const/4 v3, 0x0

    move-object v15, v2

    .line 2186
    .end local v2    # "eLastHorz":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v3, "eMaxPair":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v15, "eLastHorz":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_1
    iget-object v2, v15, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v2, :cond_1

    iget-object v2, v15, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isHorizontal()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2187
    iget-object v15, v15, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_1

    .line 2189
    :cond_1
    iget-object v2, v15, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-nez v2, :cond_2

    .line 2190
    invoke-virtual {v15}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getMaximaPair()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    move-result-object v3

    .line 2193
    :cond_2
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->maxima:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    .line 2194
    .local v2, "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    if-eqz v2, :cond_6

    .line 2197
    aget-object v4, v10, v13

    sget-object v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->LEFT_TO_RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    if-ne v4, v5, :cond_4

    .line 2199
    :goto_2
    if-eqz v2, :cond_3

    iget-wide v4, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->X:J

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-gtz v4, :cond_3

    .line 2200
    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    goto :goto_2

    .line 2201
    :cond_3
    if-eqz v2, :cond_6

    iget-wide v4, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->X:J

    invoke-virtual {v15}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-ltz v4, :cond_6

    .line 2202
    const/4 v2, 0x0

    goto :goto_4

    .line 2206
    :cond_4
    :goto_3
    iget-object v4, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    if-eqz v4, :cond_5

    iget-object v4, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    iget-wide v4, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->X:J

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-gez v4, :cond_5

    .line 2207
    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    goto :goto_3

    .line 2208
    :cond_5
    iget-wide v4, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->X:J

    invoke-virtual {v15}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-gtz v4, :cond_6

    const/4 v2, 0x0

    .line 2212
    :cond_6
    :goto_4
    const/4 v4, 0x0

    .line 2214
    .end local p1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v1, "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v4, "op1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :goto_5
    if-ne v1, v15, :cond_7

    move v5, v9

    goto :goto_6

    :cond_7
    move v5, v13

    :goto_6
    move/from16 v16, v5

    .line 2215
    .local v16, "IsLastHorz":Z
    aget-object v5, v10, v13

    invoke-virtual {v1, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getNextInAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    move-result-object v5

    .line 2216
    .local v5, "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_7
    if-eqz v5, :cond_1a

    .line 2221
    if-eqz v2, :cond_d

    .line 2223
    aget-object v6, v10, v13

    sget-object v7, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->LEFT_TO_RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    if-ne v6, v7, :cond_b

    .line 2225
    :goto_8
    if-eqz v2, :cond_9

    iget-wide v6, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->X:J

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v17

    cmp-long v6, v6, v17

    if-gez v6, :cond_9

    .line 2227
    iget v6, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v6, :cond_8

    if-nez v14, :cond_8

    .line 2228
    new-instance v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-wide v7, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->X:J

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v17

    move/from16 v18, v13

    move/from16 v19, v14

    .end local v14    # "IsOpen":Z
    .local v19, "IsOpen":Z
    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v13

    invoke-direct {v6, v7, v8, v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(JJ)V

    invoke-direct {v0, v1, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    goto :goto_9

    .line 2227
    .end local v19    # "IsOpen":Z
    .restart local v14    # "IsOpen":Z
    :cond_8
    move/from16 v18, v13

    move/from16 v19, v14

    .line 2229
    .end local v14    # "IsOpen":Z
    .restart local v19    # "IsOpen":Z
    :goto_9
    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    move/from16 v13, v18

    move/from16 v14, v19

    goto :goto_8

    .line 2225
    .end local v19    # "IsOpen":Z
    .restart local v14    # "IsOpen":Z
    :cond_9
    move/from16 v18, v13

    move/from16 v19, v14

    .line 2244
    .end local v14    # "IsOpen":Z
    .restart local v19    # "IsOpen":Z
    :cond_a
    move-object v13, v2

    goto :goto_b

    .line 2223
    .end local v19    # "IsOpen":Z
    .restart local v14    # "IsOpen":Z
    :cond_b
    move/from16 v18, v13

    move/from16 v19, v14

    .line 2234
    .end local v14    # "IsOpen":Z
    .restart local v19    # "IsOpen":Z
    :goto_a
    if-eqz v2, :cond_a

    iget-wide v6, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->X:J

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v13

    cmp-long v6, v6, v13

    if-lez v6, :cond_a

    .line 2236
    iget v6, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v6, :cond_c

    if-nez v19, :cond_c

    .line 2237
    new-instance v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    iget-wide v7, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->X:J

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v13

    invoke-virtual {v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v13

    invoke-direct {v6, v7, v8, v13, v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(JJ)V

    invoke-direct {v0, v1, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 2238
    :cond_c
    iget-object v2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;->Prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    goto :goto_a

    .line 2221
    .end local v19    # "IsOpen":Z
    .restart local v14    # "IsOpen":Z
    :cond_d
    move/from16 v18, v13

    move/from16 v19, v14

    .end local v14    # "IsOpen":Z
    .restart local v19    # "IsOpen":Z
    move-object v13, v2

    .line 2244
    .end local v2    # "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    .local v13, "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    :goto_b
    aget-object v2, v10, v18

    sget-object v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->LEFT_TO_RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    if-ne v2, v6, :cond_f

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v6

    aget-wide v20, v12, v18

    cmp-long v2, v6, v20

    if-gtz v2, :cond_e

    goto :goto_c

    :cond_e
    move-object/from16 v17, v10

    goto :goto_d

    :cond_f
    :goto_c
    aget-object v2, v10, v18

    sget-object v6, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->RIGHT_TO_LEFT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    if-ne v2, v6, :cond_10

    .line 2245
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v6

    aget-wide v20, v11, v18

    cmp-long v2, v6, v20

    if-gez v2, :cond_10

    move-object/from16 v17, v10

    goto :goto_d

    .line 2248
    :cond_10
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v6

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v20

    cmp-long v2, v6, v20

    if-nez v2, :cond_11

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v2, :cond_11

    iget-wide v6, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    move-object/from16 v17, v10

    .end local v10    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .local v17, "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    iget-wide v9, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->deltaX:D

    cmpg-double v2, v6, v9

    if-gez v2, :cond_12

    .line 2249
    nop

    .line 2297
    .end local v17    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .restart local v10    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    :goto_d
    move-object v9, v1

    move-object v14, v5

    move-object v10, v13

    move-object v13, v3

    .end local v10    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .restart local v17    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    goto/16 :goto_12

    .line 2248
    .end local v17    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .restart local v10    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    :cond_11
    move-object/from16 v17, v10

    .line 2251
    .end local v10    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .restart local v17    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    :cond_12
    iget v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v2, :cond_16

    if-nez v19, :cond_16

    .line 2253
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v9

    .line 2254
    .end local v4    # "op1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v9, "op1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    move-object v10, v2

    .line 2255
    .local v10, "eNextHorz":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_e
    if-eqz v10, :cond_15

    .line 2257
    iget v2, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v2, :cond_13

    .line 2258
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v6

    .line 2259
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v20

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v22

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v24

    .line 2258
    move-object/from16 p1, v13

    move-object v13, v3

    move-wide/from16 v3, v20

    move-object/from16 v21, p1

    move-object/from16 p1, v1

    move-object v14, v5

    move-wide v1, v6

    move-wide/from16 v5, v22

    move-wide/from16 v7, v24

    .end local v1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v3    # "eMaxPair":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v5    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v13, "eMaxPair":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v14, "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v21, "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    .restart local p1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    invoke-direct/range {v0 .. v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->doHorzSegmentsOverlap(JJJJ)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 2261
    invoke-direct {v0, v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->GetLastOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v1

    .line 2262
    .local v1, "op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-direct {v0, v1, v9, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addJoin(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    goto :goto_f

    .line 2257
    .end local v14    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v21    # "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    .end local p1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v1, "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v3    # "eMaxPair":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v5    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v13, "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    :cond_13
    move-object/from16 p1, v1

    move-object v14, v5

    move-object/from16 v21, v13

    move-object v13, v3

    .line 2264
    .end local v1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v3    # "eMaxPair":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v5    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v13, "eMaxPair":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v14    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v21    # "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    .restart local p1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :cond_14
    :goto_f
    iget-object v10, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    move-object/from16 v1, p1

    move-object v3, v13

    move-object v5, v14

    move-object/from16 v13, v21

    goto :goto_e

    .line 2266
    .end local v14    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v21    # "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    .end local p1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v3    # "eMaxPair":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v5    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v13, "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    :cond_15
    move-object/from16 p1, v1

    move-object v14, v5

    move-object/from16 v21, v13

    move-object v13, v3

    .end local v1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v3    # "eMaxPair":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v5    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v13, "eMaxPair":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v14    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v21    # "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    .restart local p1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-direct {v0, v9, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addGhostJoin(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    move-object v4, v9

    goto :goto_10

    .line 2251
    .end local v9    # "op1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .end local v10    # "eNextHorz":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v14    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v21    # "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    .end local p1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v3    # "eMaxPair":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v4    # "op1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .restart local v5    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v13, "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    :cond_16
    move-object/from16 p1, v1

    move-object v14, v5

    move-object/from16 v21, v13

    move-object v13, v3

    .line 2271
    .end local v1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v3    # "eMaxPair":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v5    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v13, "eMaxPair":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v14    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v21    # "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    .restart local p1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_10
    if-ne v14, v13, :cond_18

    if-eqz v16, :cond_18

    .line 2273
    move-object/from16 v9, p1

    .end local p1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v9, "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget v1, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v1, :cond_17

    .line 2274
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-direct {v0, v9, v13, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addLocalMaxPoly(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 2275
    :cond_17
    invoke-direct {v0, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->deleteFromAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 2276
    invoke-direct {v0, v13}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->deleteFromAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 2277
    return-void

    .line 2271
    .end local v9    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local p1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :cond_18
    move-object/from16 v9, p1

    .line 2280
    .end local p1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v9    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    aget-object v1, v17, v18

    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;->LEFT_TO_RIGHT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;

    if-ne v1, v2, :cond_19

    .line 2282
    new-instance v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v2

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v5

    invoke-direct {v1, v2, v3, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(JJ)V

    .line 2283
    .local v1, "Pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    invoke-direct {v0, v9, v14, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectEdges(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 2284
    .end local v1    # "Pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    goto :goto_11

    .line 2287
    :cond_19
    new-instance v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    invoke-virtual {v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v2

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v5

    invoke-direct {v1, v2, v3, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;-><init>(JJ)V

    .line 2288
    .restart local v1    # "Pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    invoke-direct {v0, v14, v9, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectEdges(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 2290
    .end local v1    # "Pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    :goto_11
    aget-object v1, v17, v18

    invoke-virtual {v14, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getNextInAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    move-result-object v1

    .line 2291
    .local v1, "eNext":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    invoke-direct {v0, v9, v14}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->swapPositionsInAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 2292
    move-object v5, v1

    .line 2294
    .end local v1    # "eNext":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v14    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v5    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    move-object v1, v9

    move-object v3, v13

    move-object/from16 v10, v17

    move/from16 v13, v18

    move/from16 v14, v19

    move-object/from16 v2, v21

    const/4 v9, 0x1

    goto/16 :goto_7

    .line 2216
    .end local v9    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v13    # "eMaxPair":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v17    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .end local v19    # "IsOpen":Z
    .end local v21    # "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    .local v1, "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v2    # "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    .restart local v3    # "eMaxPair":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v10, "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .local v14, "IsOpen":Z
    :cond_1a
    move-object v9, v1

    move-object/from16 v17, v10

    move/from16 v18, v13

    move/from16 v19, v14

    move-object v13, v3

    move-object v14, v5

    .end local v1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v3    # "eMaxPair":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v5    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v10    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .restart local v9    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v13    # "eMaxPair":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v14, "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v17    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .restart local v19    # "IsOpen":Z
    move-object v10, v2

    .line 2297
    .end local v2    # "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    .local v10, "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    :goto_12
    iget-object v1, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v1, :cond_1d

    iget-object v1, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isHorizontal()Z

    move-result v1

    if-nez v1, :cond_1b

    move-object/from16 v3, v17

    goto :goto_13

    .line 2299
    :cond_1b
    const/4 v1, 0x1

    new-array v2, v1, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2300
    .local v2, "temp":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    aput-object v9, v2, v18

    .line 2301
    invoke-direct {v0, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->updateEdgeIntoAEL([Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 2302
    aget-object v1, v2, v18

    .line 2304
    .end local v9    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v3, :cond_1c

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-direct {v0, v1, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 2305
    :cond_1c
    move-object/from16 v3, v17

    .end local v17    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .local v3, "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    invoke-static {v1, v3, v11, v12}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->getHorzDirection(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;[J[J)V

    .line 2307
    .end local v2    # "temp":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v14    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v16    # "IsLastHorz":Z
    move-object v2, v10

    move/from16 v14, v19

    const/4 v9, 0x1

    move-object v10, v3

    move-object v3, v13

    move/from16 v13, v18

    goto/16 :goto_5

    .line 2297
    .end local v1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v3    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .restart local v9    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v14    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v16    # "IsLastHorz":Z
    .restart local v17    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    :cond_1d
    move-object/from16 v3, v17

    .line 2309
    .end local v14    # "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v16    # "IsLastHorz":Z
    .end local v17    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .restart local v3    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    :goto_13
    iget v1, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v1, :cond_21

    if-nez v4, :cond_21

    .line 2311
    invoke-direct {v0, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->GetLastOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v14

    .line 2312
    .end local v4    # "op1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v14, "op1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2313
    .local v1, "eNextHorz":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_14
    if-eqz v1, :cond_20

    .line 2315
    iget v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v2, :cond_1e

    .line 2316
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v4

    .line 2317
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v6

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v16

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getX()J

    move-result-wide v21

    .line 2316
    move-object/from16 p1, v10

    move-object v10, v1

    move-wide v1, v4

    move-wide/from16 v26, v16

    move-object/from16 v17, v3

    move-wide v3, v6

    move-wide/from16 v5, v26

    move-wide/from16 v7, v21

    .end local v1    # "eNextHorz":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v3    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .local v10, "eNextHorz":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v17    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .local p1, "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    invoke-direct/range {v0 .. v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->doHorzSegmentsOverlap(JJJJ)Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 2319
    invoke-direct {v0, v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->GetLastOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v1

    .line 2320
    .local v1, "op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-direct {v0, v1, v14, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addJoin(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    goto :goto_15

    .line 2315
    .end local v17    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .end local p1    # "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    .local v1, "eNextHorz":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v3    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .local v10, "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    :cond_1e
    move-object/from16 v17, v3

    move-object/from16 p1, v10

    move-object v10, v1

    .line 2322
    .end local v1    # "eNextHorz":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v3    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .local v10, "eNextHorz":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v17    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .restart local p1    # "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    :cond_1f
    :goto_15
    iget-object v1, v10, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    move-object/from16 v10, p1

    move-object/from16 v3, v17

    .end local v10    # "eNextHorz":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v1    # "eNextHorz":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    goto :goto_14

    .line 2324
    .end local v17    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .end local p1    # "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    .restart local v3    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .local v10, "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    :cond_20
    move-object/from16 v17, v3

    move-object/from16 p1, v10

    move-object v10, v1

    .end local v1    # "eNextHorz":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v3    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .local v10, "eNextHorz":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v17    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .restart local p1    # "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-direct {v0, v14, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addGhostJoin(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    move-object v4, v14

    goto :goto_16

    .line 2309
    .end local v14    # "op1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .end local v17    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .end local p1    # "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    .restart local v3    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .restart local v4    # "op1":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    .local v10, "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    :cond_21
    move-object/from16 v17, v3

    move-object/from16 p1, v10

    .line 2327
    .end local v3    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .end local v10    # "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    .restart local v17    # "dir":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;
    .restart local p1    # "currMax":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;
    :goto_16
    iget-object v1, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v1, :cond_26

    .line 2328
    iget v1, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v1, :cond_25

    .line 2329
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-direct {v0, v9, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v4

    .line 2331
    const/4 v14, 0x1

    new-array v1, v14, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    aput-object v9, v1, v18

    .line 2332
    .local v1, "t":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->updateEdgeIntoAEL([Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 2333
    aget-object v2, v1, v18

    .line 2335
    .end local v9    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v2, "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget v3, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-nez v3, :cond_22

    .line 2336
    return-void

    .line 2339
    :cond_22
    iget-object v3, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2340
    .local v3, "ePrev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget-object v5, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2341
    .local v5, "eNext":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    if-eqz v3, :cond_23

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_23

    iget v6, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eqz v6, :cond_23

    iget v6, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v6, :cond_23

    .line 2342
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v6

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v8

    cmp-long v6, v6, v8

    if-lez v6, :cond_23

    iget-boolean v6, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->useFullRange:Z

    .line 2343
    invoke-static {v2, v3, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->slopesEqual(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Z)Z

    move-result v6

    if-eqz v6, :cond_23

    .line 2344
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-direct {v0, v3, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v6

    .line 2345
    .local v6, "op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v7

    invoke-direct {v0, v4, v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addJoin(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 2346
    .end local v6    # "op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    goto :goto_17

    .line 2347
    :cond_23
    if-eqz v5, :cond_24

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_24

    iget v6, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eqz v6, :cond_24

    iget v6, v5, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v6, :cond_24

    .line 2348
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getCurrent()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v6

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v8

    cmp-long v6, v6, v8

    if-lez v6, :cond_24

    iget-boolean v6, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->useFullRange:Z

    .line 2349
    invoke-static {v2, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->slopesEqual(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Z)Z

    move-result v6

    if-eqz v6, :cond_24

    .line 2350
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v6

    invoke-direct {v0, v5, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v6

    .line 2351
    .restart local v6    # "op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v7

    invoke-direct {v0, v4, v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addJoin(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 2353
    .end local v1    # "t":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v3    # "ePrev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v5    # "eNext":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v6    # "op2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :cond_24
    :goto_17
    move-object v1, v2

    goto :goto_18

    .line 2355
    .end local v2    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v9    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :cond_25
    const/4 v14, 0x1

    new-array v1, v14, [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    aput-object v9, v1, v18

    .line 2356
    .restart local v1    # "t":[Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->updateEdgeIntoAEL([Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 2357
    aget-object v1, v1, v18

    .line 2358
    .end local v9    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .local v1, "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    goto :goto_18

    .line 2361
    .end local v1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v9    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :cond_26
    iget v1, v9, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v1, :cond_27

    .line 2362
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v1

    invoke-direct {v0, v9, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addOutPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 2364
    :cond_27
    invoke-direct {v0, v9}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->deleteFromAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    move-object v1, v9

    .line 2366
    .end local v9    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .restart local v1    # "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_18
    return-void
.end method

.method private processHorizontals()V
    .locals 3

    .line 2371
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    const-class v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "processHorizontals"

    invoke-virtual {v0, v1, v2}, Ljava/util/logging/Logger;->entering(Ljava/lang/String;Ljava/lang/String;)V

    .line 2373
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2374
    .local v0, "horzEdge":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_0
    if-eqz v0, :cond_0

    .line 2375
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->deleteFromSEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 2376
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->processHorizontal(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 2377
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_0

    .line 2379
    :cond_0
    return-void
.end method

.method private processIntersectList()V
    .locals 5

    .line 2411
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .line 2418
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectList:Ljava/util/List;

    .line 2411
    if-ge v0, v1, :cond_0

    .line 2412
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;

    .line 2414
    .local v1, "iNode":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;->edge1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;->Edge2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;->getPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-direct {p0, v2, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectEdges(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 2415
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;->edge1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;->Edge2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    invoke-direct {p0, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->swapPositionsInAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V

    .line 2411
    .end local v1    # "iNode":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper$IntersectNode;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2418
    .end local v0    # "i":I
    :cond_0
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 2419
    return-void
.end method

.method private processIntersections(J)Z
    .locals 3
    .param p1, "topY"    # J

    .line 2384
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    const-class v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "processIntersections"

    invoke-virtual {v0, v1, v2}, Ljava/util/logging/Logger;->entering(Ljava/lang/String;Ljava/lang/String;)V

    .line 2386
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 2387
    return v1

    .line 2390
    :cond_0
    const/4 v0, 0x0

    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->buildIntersectList(J)V

    .line 2391
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-nez v2, :cond_1

    .line 2392
    return v1

    .line 2394
    :cond_1
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eq v2, v1, :cond_3

    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->fixupIntersectionOrder()Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_0

    .line 2398
    :cond_2
    const/4 v0, 0x0

    return v0

    .line 2395
    :cond_3
    :goto_0
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->processIntersectList()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2405
    nop

    .line 2406
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2407
    return v1

    .line 2401
    :catch_0
    move-exception v1

    .line 2402
    .local v1, "e":Ljava/lang/Exception;
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2403
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->intersectList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 2404
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "ProcessIntersections error"

    invoke-direct {v0, v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method private setHoleState(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)V
    .locals 4
    .param p1, "e"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p2, "outRec"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 2438
    const/4 v0, 0x0

    .line 2439
    .local v0, "isHole":Z
    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2440
    .local v1, "e2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_0
    const/4 v2, 0x1

    if-eqz v1, :cond_3

    .line 2441
    iget v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    if-ltz v3, :cond_2

    iget v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eqz v3, :cond_2

    .line 2442
    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v2, 0x0

    .line 2443
    .end local v0    # "isHole":Z
    .local v2, "isHole":Z
    :goto_1
    iget-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    if-nez v0, :cond_1

    .line 2444
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    iget v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    iput-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->firstLeft:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 2447
    :cond_1
    move v0, v2

    .end local v2    # "isHole":Z
    .restart local v0    # "isHole":Z
    :cond_2
    iget-object v1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_0

    .line 2449
    :cond_3
    if-eqz v0, :cond_4

    .line 2450
    iput-boolean v2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->isHole:Z

    .line 2452
    :cond_4
    return-void
.end method

.method private setZ(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V
    .locals 7
    .param p1, "pt"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    .param p2, "e1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p3, "e2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2455
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getZ()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->zFillFunction:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$IZFillCallback;

    if-nez v0, :cond_0

    move-object v6, p1

    goto/16 :goto_1

    .line 2458
    :cond_0
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2459
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getZ()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setZ(Ljava/lang/Number;)V

    move-object v6, p1

    goto :goto_0

    .line 2461
    :cond_1
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2462
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getZ()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setZ(Ljava/lang/Number;)V

    move-object v6, p1

    goto :goto_0

    .line 2464
    :cond_2
    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2465
    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getZ()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setZ(Ljava/lang/Number;)V

    move-object v6, p1

    goto :goto_0

    .line 2467
    :cond_3
    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2468
    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getZ()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->setZ(Ljava/lang/Number;)V

    move-object v6, p1

    goto :goto_0

    .line 2471
    :cond_4
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->zFillFunction:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$IZFillCallback;

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v2

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v3

    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v4

    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v5

    move-object v6, p1

    .end local p1    # "pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    .local v6, "pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    invoke-interface/range {v1 .. v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$IZFillCallback;->zFill(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 2473
    :goto_0
    return-void

    .line 2455
    .end local v6    # "pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    .restart local p1    # "pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    :cond_5
    move-object v6, p1

    .line 2456
    .end local p1    # "pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    .restart local v6    # "pt":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    :goto_1
    return-void
.end method

.method public static simplifyPolygon(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    .locals 1
    .param p0, "poly"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;

    .line 518
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->EVEN_ODD:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->simplifyPolygon(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;

    move-result-object v0

    return-object v0
.end method

.method public static simplifyPolygon(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    .locals 4
    .param p0, "poly"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
    .param p1, "fillType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 522
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;-><init>()V

    .line 523
    .local v0, "result":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    new-instance v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;-><init>(I)V

    .line 525
    .local v1, "c":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->SUBJECT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    const/4 v3, 0x1

    invoke-virtual {v1, p0, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addPath(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;Z)Z

    .line 526
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->UNION:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    invoke-virtual {v1, v2, v0, p1, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z

    .line 527
    return-object v0
.end method

.method public static simplifyPolygons(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    .locals 1
    .param p0, "polys"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;

    .line 531
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->EVEN_ODD:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->simplifyPolygons(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;

    move-result-object v0

    return-object v0
.end method

.method public static simplifyPolygons(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    .locals 4
    .param p0, "polys"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    .param p1, "fillType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 535
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;-><init>()V

    .line 536
    .local v0, "result":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    new-instance v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;-><init>(I)V

    .line 538
    .local v1, "c":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;->SUBJECT:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    const/4 v3, 0x1

    invoke-virtual {v1, p0, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->addPaths(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;Z)Z

    .line 539
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->UNION:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    invoke-virtual {v1, v2, v0, p1, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z

    .line 540
    return-object v0
.end method

.method private swapPositionsInAEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V
    .locals 5
    .param p1, "edge1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p2, "edge2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2476
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    const-class v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "swapPositionsInAEL"

    invoke-virtual {v0, v2, v3}, Ljava/util/logging/Logger;->entering(Ljava/lang/String;Ljava/lang/String;)V

    .line 2479
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eq v0, v2, :cond_d

    iget-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-ne v0, v2, :cond_0

    goto/16 :goto_2

    .line 2483
    :cond_0
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-ne v0, p2, :cond_3

    .line 2484
    iget-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2485
    .local v0, "next":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    if-eqz v0, :cond_1

    .line 2486
    iput-object p1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2488
    :cond_1
    iget-object v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2489
    .local v2, "prev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    if-eqz v2, :cond_2

    .line 2490
    iput-object p2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2492
    :cond_2
    iput-object v2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2493
    iput-object p1, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2494
    iput-object p2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2495
    iput-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2496
    .end local v0    # "next":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v2    # "prev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    goto :goto_0

    .line 2497
    :cond_3
    iget-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-ne v0, p1, :cond_6

    .line 2498
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2499
    .restart local v0    # "next":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    if-eqz v0, :cond_4

    .line 2500
    iput-object p2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2502
    :cond_4
    iget-object v2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2503
    .restart local v2    # "prev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    if-eqz v2, :cond_5

    .line 2504
    iput-object p1, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2506
    :cond_5
    iput-object v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2507
    iput-object p2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2508
    iput-object p1, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2509
    iput-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2510
    .end local v0    # "next":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v2    # "prev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    goto :goto_0

    .line 2512
    :cond_6
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2513
    .restart local v0    # "next":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget-object v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2514
    .restart local v2    # "prev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget-object v4, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2515
    iget-object v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v4, :cond_7

    .line 2516
    iget-object v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object p1, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2518
    :cond_7
    iget-object v4, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2519
    iget-object v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v4, :cond_8

    .line 2520
    iget-object v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object p1, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2522
    :cond_8
    iput-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2523
    iget-object v4, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v4, :cond_9

    .line 2524
    iget-object v4, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object p2, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2526
    :cond_9
    iput-object v2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2527
    iget-object v4, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v4, :cond_a

    .line 2528
    iget-object v4, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object p2, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2532
    .end local v0    # "next":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v2    # "prev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :cond_a
    :goto_0
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-nez v0, :cond_b

    .line 2533
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_1

    .line 2535
    :cond_b
    iget-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-nez v0, :cond_c

    .line 2536
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2539
    :cond_c
    :goto_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Ljava/util/logging/Logger;->exiting(Ljava/lang/String;Ljava/lang/String;)V

    .line 2540
    return-void

    .line 2480
    :cond_d
    :goto_2
    return-void
.end method

.method private swapPositionsInSEL(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V
    .locals 3
    .param p1, "edge1"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .param p2, "edge2"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2545
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-nez v0, :cond_0

    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-nez v0, :cond_0

    .line 2546
    return-void

    .line 2548
    :cond_0
    iget-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-nez v0, :cond_1

    iget-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-nez v0, :cond_1

    .line 2549
    return-void

    .line 2552
    :cond_1
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-ne v0, p2, :cond_4

    .line 2553
    iget-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2554
    .local v0, "next":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    if-eqz v0, :cond_2

    .line 2555
    iput-object p1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2557
    :cond_2
    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2558
    .local v1, "prev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    if-eqz v1, :cond_3

    .line 2559
    iput-object p2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2561
    :cond_3
    iput-object v1, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2562
    iput-object p1, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2563
    iput-object p2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2564
    iput-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2565
    .end local v0    # "next":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v1    # "prev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    goto :goto_0

    .line 2566
    :cond_4
    iget-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-ne v0, p1, :cond_7

    .line 2567
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2568
    .restart local v0    # "next":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    if-eqz v0, :cond_5

    .line 2569
    iput-object p2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2571
    :cond_5
    iget-object v1, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2572
    .restart local v1    # "prev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    if-eqz v1, :cond_6

    .line 2573
    iput-object p1, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2575
    :cond_6
    iput-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2576
    iput-object p2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2577
    iput-object p1, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2578
    iput-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2579
    .end local v0    # "next":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v1    # "prev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    goto :goto_0

    .line 2581
    :cond_7
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2582
    .restart local v0    # "next":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2583
    .restart local v1    # "prev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget-object v2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2584
    iget-object v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v2, :cond_8

    .line 2585
    iget-object v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object p1, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2587
    :cond_8
    iget-object v2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2588
    iget-object v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v2, :cond_9

    .line 2589
    iget-object v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object p1, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2591
    :cond_9
    iput-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2592
    iget-object v2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v2, :cond_a

    .line 2593
    iget-object v2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object p2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2595
    :cond_a
    iput-object v1, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2596
    iget-object v2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v2, :cond_b

    .line 2597
    iget-object v2, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object p2, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2601
    .end local v0    # "next":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v1    # "prev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :cond_b
    :goto_0
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-nez v0, :cond_c

    .line 2602
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_1

    .line 2604
    :cond_c
    iget-object v0, p2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInSEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-nez v0, :cond_d

    .line 2605
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2607
    :cond_d
    :goto_1
    return-void
.end method

.method private updateEdgeIntoAEL([Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V
    .locals 6
    .param p1, "eV"    # [Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2610
    const/4 v0, 0x0

    aget-object v1, p1, v0

    .line 2611
    .local v1, "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    if-eqz v2, :cond_3

    .line 2614
    iget-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2615
    .local v2, "AelPrev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2616
    .local v3, "AelNext":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    iput v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->outIdx:I

    .line 2617
    if-eqz v2, :cond_0

    .line 2618
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v4, v2, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_0

    .line 2621
    :cond_0
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2623
    :goto_0
    if-eqz v3, :cond_1

    .line 2624
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iput-object v4, v3, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2626
    :cond_1
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget-object v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    iput-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->side:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge$Side;

    .line 2627
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    iput v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    .line 2628
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    iput v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    .line 2629
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    iget v5, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    iput v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    .line 2630
    iget-object v4, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInLML:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    move-object v1, v4

    aput-object v4, p1, v0

    .line 2631
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getBot()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->setCurrent(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V

    .line 2632
    iput-object v2, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2633
    iput-object v3, v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2634
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isHorizontal()Z

    move-result v0

    if-nez v0, :cond_2

    .line 2635
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->getTop()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;->getY()J

    move-result-wide v4

    invoke-direct {p0, v4, v5}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->insertScanbeam(J)V

    .line 2637
    :cond_2
    return-void

    .line 2612
    .end local v2    # "AelPrev":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    .end local v3    # "AelNext":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "UpdateEdgeIntoAEL: invalid call"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private updateOutPtIdxs(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;)V
    .locals 2
    .param p1, "outrec"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;

    .line 2640
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v0

    .line 2642
    .local v0, "op":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;
    :cond_0
    iget v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->Idx:I

    iput v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->idx:I

    .line 2643
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;->prev:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    .line 2645
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutRec;->getPoints()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 2646
    return-void
.end method

.method private updateWindingCount(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;)V
    .locals 7
    .param p1, "edge"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2649
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->LOGGER:Ljava/util/logging/Logger;

    const-class v1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "updateWindingCount"

    invoke-virtual {v0, v1, v2}, Ljava/util/logging/Logger;->entering(Ljava/lang/String;Ljava/lang/String;)V

    .line 2651
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2653
    .local v0, "e":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_0
    if-eqz v0, :cond_1

    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    iget-object v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    if-ne v1, v2, :cond_0

    iget v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-nez v1, :cond_1

    .line 2654
    :cond_0
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_0

    .line 2656
    :cond_1
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_3

    .line 2657
    iget v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-nez v3, :cond_2

    move v3, v2

    goto :goto_1

    :cond_2
    iget v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    :goto_1
    iput v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    .line 2658
    iput v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    .line 2659
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto/16 :goto_9

    .line 2661
    :cond_3
    iget v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-nez v3, :cond_4

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    sget-object v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;->UNION:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    if-eq v3, v4, :cond_4

    .line 2662
    iput v2, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    .line 2663
    iget v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    iput v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    .line 2664
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto/16 :goto_9

    .line 2666
    :cond_4
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->subjFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isEvenOddFillType(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 2668
    iget v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-nez v3, :cond_9

    .line 2670
    const/4 v3, 0x1

    .line 2671
    .local v3, "Inside":Z
    iget-object v4, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2672
    .local v4, "e2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    :goto_2
    if-eqz v4, :cond_7

    .line 2673
    iget-object v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    iget-object v6, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->polyTyp:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;

    if-ne v5, v6, :cond_6

    iget v5, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eqz v5, :cond_6

    .line 2674
    if-nez v3, :cond_5

    move v5, v2

    goto :goto_3

    :cond_5
    move v5, v1

    :goto_3
    move v3, v5

    .line 2676
    :cond_6
    iget-object v4, v4, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->prevInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_2

    .line 2678
    :cond_7
    if-eqz v3, :cond_8

    move v5, v1

    goto :goto_4

    :cond_8
    move v5, v2

    :goto_4
    iput v5, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    .line 2679
    .end local v3    # "Inside":Z
    .end local v4    # "e2":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;
    goto :goto_5

    .line 2681
    :cond_9
    iget v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    iput v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    .line 2683
    :goto_5
    iget v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    iput v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    .line 2684
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_9

    .line 2688
    :cond_a
    iget v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    iget v4, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    mul-int/2addr v3, v4

    if-gez v3, :cond_e

    .line 2691
    iget v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    if-le v3, v2, :cond_c

    .line 2694
    iget v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    iget v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    mul-int/2addr v3, v4

    if-gez v3, :cond_b

    .line 2695
    iget v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    iput v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    goto :goto_8

    .line 2698
    :cond_b
    iget v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    iget v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    add-int/2addr v3, v4

    iput v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    goto :goto_8

    .line 2703
    :cond_c
    iget v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-nez v3, :cond_d

    move v3, v2

    goto :goto_6

    :cond_d
    iget v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    :goto_6
    iput v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    goto :goto_8

    .line 2709
    :cond_e
    iget v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-nez v3, :cond_10

    .line 2710
    iget v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    if-gez v3, :cond_f

    iget v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    sub-int/2addr v3, v2

    goto :goto_7

    :cond_f
    iget v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    add-int/2addr v3, v2

    :goto_7
    iput v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    goto :goto_8

    .line 2712
    :cond_10
    iget v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    iget v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    mul-int/2addr v3, v4

    if-gez v3, :cond_11

    .line 2713
    iget v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    iput v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    goto :goto_8

    .line 2716
    :cond_11
    iget v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    iget v4, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    add-int/2addr v3, v4

    iput v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt:I

    .line 2719
    :goto_8
    iget v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    iput v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    .line 2720
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2724
    :goto_9
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->subjFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->isEvenOddAltFillType(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 2726
    :goto_a
    if-eq v0, p1, :cond_15

    .line 2727
    iget v3, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    if-eqz v3, :cond_13

    .line 2728
    iget v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    if-nez v3, :cond_12

    move v3, v2

    goto :goto_b

    :cond_12
    move v3, v1

    :goto_b
    iput v3, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    .line 2730
    :cond_13
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_a

    .line 2735
    :cond_14
    :goto_c
    if-eq v0, p1, :cond_15

    .line 2736
    iget v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    iget v2, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windDelta:I

    add-int/2addr v1, v2

    iput v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->windCnt2:I

    .line 2737
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;->nextInAEL:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    goto :goto_c

    .line 2740
    :cond_15
    return-void
.end method


# virtual methods
.method public execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;)Z
    .locals 1
    .param p1, "clipType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;
    .param p2, "solution"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;

    .line 1274
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->EVEN_ODD:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z

    move-result v0

    return v0
.end method

.method public execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z
    .locals 1
    .param p1, "clipType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;
    .param p2, "solution"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    .param p3, "FillType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 1258
    invoke-virtual {p0, p1, p2, p3, p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z

    move-result v0

    return v0
.end method

.method public execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z
    .locals 2
    .param p1, "clipType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;
    .param p2, "solution"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    .param p3, "subjFillType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .param p4, "clipFillType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 1279
    monitor-enter p0

    .line 1281
    :try_start_0
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->hasOpenPaths:Z

    if-nez v0, :cond_1

    .line 1285
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;->clear()V

    .line 1286
    iput-object p3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->subjFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 1287
    iput-object p4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 1288
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    .line 1289
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->usingPolyTree:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1292
    :try_start_1
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->executeInternal()Z

    move-result v0

    .line 1294
    .local v0, "succeeded":Z
    if-eqz v0, :cond_0

    .line 1295
    invoke-direct {p0, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->buildResult(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1297
    :cond_0
    nop

    .line 1300
    :try_start_2
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    monitor-exit p0

    .line 1297
    return v0

    .line 1300
    .end local v0    # "succeeded":Z
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 1302
    nop

    .end local p1    # "clipType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;
    .end local p2    # "solution":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    .end local p3    # "subjFillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .end local p4    # "clipFillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    throw v0

    .line 1282
    .restart local p1    # "clipType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;
    .restart local p2    # "solution":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    .restart local p3    # "subjFillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .restart local p4    # "clipFillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Error: PolyTree struct is needed for open path clipping."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local p1    # "clipType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;
    .end local p2    # "solution":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    .end local p3    # "subjFillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .end local p4    # "clipFillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    throw v0

    .line 1303
    .restart local p1    # "clipType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;
    .restart local p2    # "solution":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;
    .restart local p3    # "subjFillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .restart local p4    # "clipFillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    :catchall_1
    move-exception v0

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0
.end method

.method public execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;)Z
    .locals 1
    .param p1, "clipType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;
    .param p2, "polytree"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;

    .line 1263
    sget-object v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;->EVEN_ODD:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z

    move-result v0

    return v0
.end method

.method public execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z
    .locals 1
    .param p1, "clipType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;
    .param p2, "polytree"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;
    .param p3, "FillType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 1269
    invoke-virtual {p0, p1, p2, p3, p3}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z

    move-result v0

    return v0
.end method

.method public execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z
    .locals 2
    .param p1, "clipType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;
    .param p2, "polytree"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;
    .param p3, "subjFillType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .param p4, "clipFillType"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 1308
    monitor-enter p0

    .line 1309
    :try_start_0
    iput-object p3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->subjFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 1310
    iput-object p4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipFillType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;

    .line 1311
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->clipType:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;

    .line 1312
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->usingPolyTree:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1315
    :try_start_1
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->executeInternal()Z

    move-result v0

    .line 1317
    .local v0, "succeeded":Z
    if-eqz v0, :cond_0

    .line 1318
    invoke-direct {p0, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->buildResult2(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1322
    :cond_0
    :try_start_2
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 1323
    nop

    .line 1324
    monitor-exit p0

    return v0

    .line 1322
    .end local v0    # "succeeded":Z
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->polyOuts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 1323
    nop

    .end local p1    # "clipType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;
    .end local p2    # "polytree":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;
    .end local p3    # "subjFillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .end local p4    # "clipFillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    throw v0

    .line 1325
    .restart local p1    # "clipType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;
    .restart local p2    # "polytree":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;
    .restart local p3    # "subjFillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    .restart local p4    # "clipFillType":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;
    :catchall_1
    move-exception v0

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0
.end method

.method protected reset()V
    .locals 3

    .line 2425
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;->reset()V

    .line 2426
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->scanbeam:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

    .line 2427
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->maxima:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Maxima;

    .line 2428
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->activeEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2429
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->sortedEdges:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

    .line 2430
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->minimaList:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    .line 2431
    .local v0, "lm":Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;
    :goto_0
    if-eqz v0, :cond_0

    .line 2432
    iget-wide v1, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->y:J

    invoke-direct {p0, v1, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/DefaultClipper;->insertScanbeam(J)V

    .line 2433
    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

    goto :goto_0

    .line 2435
    :cond_0
    return-void
.end method
