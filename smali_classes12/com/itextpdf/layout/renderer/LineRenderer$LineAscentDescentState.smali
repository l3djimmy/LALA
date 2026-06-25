.class Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;
.super Ljava/lang/Object;
.source "LineRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/LineRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LineAscentDescentState"
.end annotation


# instance fields
.field maxAscent:F

.field maxDescent:F

.field maxTextAscent:F

.field maxTextDescent:F


# direct methods
.method constructor <init>(FFFF)V
    .locals 0
    .param p1, "maxAscent"    # F
    .param p2, "maxDescent"    # F
    .param p3, "maxTextAscent"    # F
    .param p4, "maxTextDescent"    # F

    .line 1639
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1640
    iput p1, p0, Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;->maxAscent:F

    .line 1641
    iput p2, p0, Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;->maxDescent:F

    .line 1642
    iput p3, p0, Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;->maxTextAscent:F

    .line 1643
    iput p4, p0, Lcom/itextpdf/layout/renderer/LineRenderer$LineAscentDescentState;->maxTextDescent:F

    .line 1644
    return-void
.end method
