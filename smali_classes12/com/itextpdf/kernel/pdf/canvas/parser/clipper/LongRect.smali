.class public Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/LongRect;
.super Ljava/lang/Object;
.source "LongRect.java"


# instance fields
.field public bottom:J

.field public left:J

.field public right:J

.field public top:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    return-void
.end method

.method public constructor <init>(JJJJ)V
    .locals 0
    .param p1, "l"    # J
    .param p3, "t"    # J
    .param p5, "r"    # J
    .param p7, "b"    # J

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-wide p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/LongRect;->left:J

    .line 46
    iput-wide p3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/LongRect;->top:J

    .line 47
    iput-wide p5, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/LongRect;->right:J

    .line 48
    iput-wide p7, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/LongRect;->bottom:J

    .line 49
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/LongRect;)V
    .locals 2
    .param p1, "ir"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/LongRect;

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iget-wide v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/LongRect;->left:J

    iput-wide v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/LongRect;->left:J

    .line 53
    iget-wide v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/LongRect;->top:J

    iput-wide v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/LongRect;->top:J

    .line 54
    iget-wide v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/LongRect;->right:J

    iput-wide v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/LongRect;->right:J

    .line 55
    iget-wide v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/LongRect;->bottom:J

    iput-wide v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/LongRect;->bottom:J

    .line 56
    return-void
.end method
