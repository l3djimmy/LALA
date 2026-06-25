.class public final synthetic Landroidx/transition/Transition$SeekController$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/transition/Transition$SeekController;"
    method = "lambda$ensureAnimation$0"
    proto = "(Landroidx/dynamicanimation/animation/DynamicAnimation;ZFF)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/transition/Transition$SeekController;


# direct methods
.method public synthetic constructor <init>(Landroidx/transition/Transition$SeekController;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/transition/Transition$SeekController$$ExternalSyntheticLambda0;->f$0:Landroidx/transition/Transition$SeekController;

    return-void
.end method


# virtual methods
.method public final onAnimationEnd(Landroidx/dynamicanimation/animation/DynamicAnimation;ZFF)V
    .locals 1

    .line 0
    iget-object v0, p0, Landroidx/transition/Transition$SeekController$$ExternalSyntheticLambda0;->f$0:Landroidx/transition/Transition$SeekController;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroidx/transition/Transition$SeekController;->lambda$ensureAnimation$0$androidx-transition-Transition$SeekController(Landroidx/dynamicanimation/animation/DynamicAnimation;ZFF)V

    return-void
.end method
