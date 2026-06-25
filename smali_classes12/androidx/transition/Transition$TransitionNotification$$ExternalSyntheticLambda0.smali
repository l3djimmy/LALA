.class public final synthetic Landroidx/transition/Transition$TransitionNotification$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/transition/Transition$TransitionNotification;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/transition/Transition$TransitionListener;"
    method = "onTransitionStart"
    proto = "(Landroidx/transition/Transition;Z)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final notifyListener(Landroidx/transition/Transition$TransitionListener;Landroidx/transition/Transition;Z)V
    .locals 0

    .line 0
    invoke-interface {p1, p2, p3}, Landroidx/transition/Transition$TransitionListener;->onTransitionStart(Landroidx/transition/Transition;Z)V

    return-void
.end method
