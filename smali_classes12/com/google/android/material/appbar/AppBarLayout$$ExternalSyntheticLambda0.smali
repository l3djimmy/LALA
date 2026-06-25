.class public final synthetic Lcom/google/android/material/appbar/AppBarLayout$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/google/android/material/appbar/AppBarLayout;"
    method = "lambda$initializeLiftOnScrollWithColor$0"
    proto = "(Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;Lcom/google/android/material/shape/MaterialShapeDrawable;Ljava/lang/Integer;Landroid/animation/ValueAnimator;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/google/android/material/appbar/AppBarLayout;

.field public final synthetic f$1:Landroid/content/res/ColorStateList;

.field public final synthetic f$2:Landroid/content/res/ColorStateList;

.field public final synthetic f$3:Lcom/google/android/material/shape/MaterialShapeDrawable;

.field public final synthetic f$4:Ljava/lang/Integer;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/material/appbar/AppBarLayout;Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;Lcom/google/android/material/shape/MaterialShapeDrawable;Ljava/lang/Integer;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/material/appbar/AppBarLayout;

    iput-object p2, p0, Lcom/google/android/material/appbar/AppBarLayout$$ExternalSyntheticLambda0;->f$1:Landroid/content/res/ColorStateList;

    iput-object p3, p0, Lcom/google/android/material/appbar/AppBarLayout$$ExternalSyntheticLambda0;->f$2:Landroid/content/res/ColorStateList;

    iput-object p4, p0, Lcom/google/android/material/appbar/AppBarLayout$$ExternalSyntheticLambda0;->f$3:Lcom/google/android/material/shape/MaterialShapeDrawable;

    iput-object p5, p0, Lcom/google/android/material/appbar/AppBarLayout$$ExternalSyntheticLambda0;->f$4:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 6

    .line 0
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout$$ExternalSyntheticLambda0;->f$0:Lcom/google/android/material/appbar/AppBarLayout;

    iget-object v1, p0, Lcom/google/android/material/appbar/AppBarLayout$$ExternalSyntheticLambda0;->f$1:Landroid/content/res/ColorStateList;

    iget-object v2, p0, Lcom/google/android/material/appbar/AppBarLayout$$ExternalSyntheticLambda0;->f$2:Landroid/content/res/ColorStateList;

    iget-object v3, p0, Lcom/google/android/material/appbar/AppBarLayout$$ExternalSyntheticLambda0;->f$3:Lcom/google/android/material/shape/MaterialShapeDrawable;

    iget-object v4, p0, Lcom/google/android/material/appbar/AppBarLayout$$ExternalSyntheticLambda0;->f$4:Ljava/lang/Integer;

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/material/appbar/AppBarLayout;->lambda$initializeLiftOnScrollWithColor$0$com-google-android-material-appbar-AppBarLayout(Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;Lcom/google/android/material/shape/MaterialShapeDrawable;Ljava/lang/Integer;Landroid/animation/ValueAnimator;)V

    return-void
.end method
