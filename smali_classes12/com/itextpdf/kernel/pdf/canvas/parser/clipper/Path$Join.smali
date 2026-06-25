.class Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;
.super Ljava/lang/Object;
.source "Path.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Join"
.end annotation


# instance fields
.field private offPt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

.field outPt1:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;

.field outPt2:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$OutPt;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getOffPt()Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->offPt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    return-object v0
.end method

.method public setOffPt(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;)V
    .locals 0
    .param p1, "offPt"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 52
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path$Join;->offPt:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Point$LongPoint;

    .line 53
    return-void
.end method
