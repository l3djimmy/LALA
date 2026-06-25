.class public final synthetic Lcom/rajat/pdfviewer/PinchZoomRecyclerView$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/rajat/pdfviewer/PinchZoomRecyclerView;"
    method = "zoomTo$lambda$4$lambda$3"
    proto = "(FFLcom/rajat/pdfviewer/PinchZoomRecyclerView;FFFFLandroid/animation/ValueAnimator;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:F

.field public final synthetic f$1:F

.field public final synthetic f$2:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

.field public final synthetic f$3:F

.field public final synthetic f$4:F

.field public final synthetic f$5:F

.field public final synthetic f$6:F


# direct methods
.method public synthetic constructor <init>(FFLcom/rajat/pdfviewer/PinchZoomRecyclerView;FFFF)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$$ExternalSyntheticLambda1;->f$0:F

    iput p2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$$ExternalSyntheticLambda1;->f$1:F

    iput-object p3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$$ExternalSyntheticLambda1;->f$2:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    iput p4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$$ExternalSyntheticLambda1;->f$3:F

    iput p5, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$$ExternalSyntheticLambda1;->f$4:F

    iput p6, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$$ExternalSyntheticLambda1;->f$5:F

    iput p7, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$$ExternalSyntheticLambda1;->f$6:F

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 8

    .line 0
    iget v0, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$$ExternalSyntheticLambda1;->f$0:F

    iget v1, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$$ExternalSyntheticLambda1;->f$1:F

    iget-object v2, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$$ExternalSyntheticLambda1;->f$2:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    iget v3, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$$ExternalSyntheticLambda1;->f$3:F

    iget v4, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$$ExternalSyntheticLambda1;->f$4:F

    iget v5, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$$ExternalSyntheticLambda1;->f$5:F

    iget v6, p0, Lcom/rajat/pdfviewer/PinchZoomRecyclerView$$ExternalSyntheticLambda1;->f$6:F

    move-object v7, p1

    invoke-static/range {v0 .. v7}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->zoomTo$lambda$4$lambda$3(FFLcom/rajat/pdfviewer/PinchZoomRecyclerView;FFFFLandroid/animation/ValueAnimator;)V

    return-void
.end method
