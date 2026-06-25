.class public Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;
.super Ljava/lang/Object;
.source "ClipperBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "LocalMinima"
.end annotation


# instance fields
.field leftBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

.field next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;

.field rightBound:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Edge;

.field final synthetic this$0:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;

.field y:J


# direct methods
.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;)V
    .locals 0
    .param p1, "this$0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;

    .line 41
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$LocalMinima;->this$0:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
