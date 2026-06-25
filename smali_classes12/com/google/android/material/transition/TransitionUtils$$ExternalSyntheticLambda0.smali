.class public final synthetic Lcom/google/android/material/transition/TransitionUtils$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/material/shape/ShapeAppearanceModel$CornerSizeUnaryOperator;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/google/android/material/transition/TransitionUtils;"
    method = "lambda$convertToRelativeCornerSizes$0"
    proto = "(Landroid/graphics/RectF;Lcom/google/android/material/shape/CornerSize;)Lcom/google/android/material/shape/CornerSize;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/graphics/RectF;


# direct methods
.method public synthetic constructor <init>(Landroid/graphics/RectF;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/transition/TransitionUtils$$ExternalSyntheticLambda0;->f$0:Landroid/graphics/RectF;

    return-void
.end method


# virtual methods
.method public final apply(Lcom/google/android/material/shape/CornerSize;)Lcom/google/android/material/shape/CornerSize;
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/google/android/material/transition/TransitionUtils$$ExternalSyntheticLambda0;->f$0:Landroid/graphics/RectF;

    invoke-static {v0, p1}, Lcom/google/android/material/transition/TransitionUtils;->lambda$convertToRelativeCornerSizes$0(Landroid/graphics/RectF;Lcom/google/android/material/shape/CornerSize;)Lcom/google/android/material/shape/CornerSize;

    move-result-object p1

    return-object p1
.end method
