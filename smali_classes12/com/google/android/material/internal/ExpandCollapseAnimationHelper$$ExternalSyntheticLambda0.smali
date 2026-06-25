.class public final synthetic Lcom/google/android/material/internal/ExpandCollapseAnimationHelper$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/google/android/material/internal/ExpandCollapseAnimationHelper;"
    method = "lambda$getExpandCollapseAnimator$0"
    proto = "(Landroid/graphics/Rect;Landroid/animation/ValueAnimator;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/google/android/material/internal/ExpandCollapseAnimationHelper;

.field public final synthetic f$1:Landroid/graphics/Rect;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/material/internal/ExpandCollapseAnimationHelper;Landroid/graphics/Rect;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/internal/ExpandCollapseAnimationHelper$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/material/internal/ExpandCollapseAnimationHelper;

    iput-object p2, p0, Lcom/google/android/material/internal/ExpandCollapseAnimationHelper$$ExternalSyntheticLambda0;->f$1:Landroid/graphics/Rect;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/google/android/material/internal/ExpandCollapseAnimationHelper$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/material/internal/ExpandCollapseAnimationHelper;

    iget-object v1, p0, Lcom/google/android/material/internal/ExpandCollapseAnimationHelper$$ExternalSyntheticLambda0;->f$1:Landroid/graphics/Rect;

    invoke-virtual {v0, v1, p1}, Lcom/google/android/material/internal/ExpandCollapseAnimationHelper;->lambda$getExpandCollapseAnimator$0$com-google-android-material-internal-ExpandCollapseAnimationHelper(Landroid/graphics/Rect;Landroid/animation/ValueAnimator;)V

    return-void
.end method
