.class public Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;
.super Ljava/lang/Object;
.source "ClipperBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "Scanbeam"
.end annotation


# instance fields
.field next:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;

.field final synthetic this$0:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;

.field y:J


# direct methods
.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;)V
    .locals 0
    .param p1, "this$0"    # Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;

    .line 48
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase$Scanbeam;->this$0:Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/ClipperBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
