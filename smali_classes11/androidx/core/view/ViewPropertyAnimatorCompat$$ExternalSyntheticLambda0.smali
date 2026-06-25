.class public final synthetic Landroidx/core/view/ViewPropertyAnimatorCompat$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/core/view/ViewPropertyAnimatorCompat;"
    method = "lambda$setUpdateListener$0"
    proto = "(Landroidx/core/view/ViewPropertyAnimatorUpdateListener;Landroid/view/View;Landroid/animation/ValueAnimator;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/core/view/ViewPropertyAnimatorUpdateListener;

.field public final synthetic f$1:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroidx/core/view/ViewPropertyAnimatorUpdateListener;Landroid/view/View;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/core/view/ViewPropertyAnimatorCompat$$ExternalSyntheticLambda0;->f$0:Landroidx/core/view/ViewPropertyAnimatorUpdateListener;

    iput-object p2, p0, Landroidx/core/view/ViewPropertyAnimatorCompat$$ExternalSyntheticLambda0;->f$1:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 0
    iget-object v0, p0, Landroidx/core/view/ViewPropertyAnimatorCompat$$ExternalSyntheticLambda0;->f$0:Landroidx/core/view/ViewPropertyAnimatorUpdateListener;

    iget-object v1, p0, Landroidx/core/view/ViewPropertyAnimatorCompat$$ExternalSyntheticLambda0;->f$1:Landroid/view/View;

    invoke-static {v0, v1, p1}, Landroidx/core/view/ViewPropertyAnimatorCompat;->lambda$setUpdateListener$0(Landroidx/core/view/ViewPropertyAnimatorUpdateListener;Landroid/view/View;Landroid/animation/ValueAnimator;)V

    return-void
.end method
