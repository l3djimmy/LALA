.class public final synthetic Lcom/google/android/material/search/SearchBarAnimationHelper$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/material/animation/AnimatableView$Listener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroid/animation/Animator;"
    method = "start"
    proto = "()V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/animation/Animator;


# direct methods
.method public synthetic constructor <init>(Landroid/animation/Animator;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/search/SearchBarAnimationHelper$$ExternalSyntheticLambda2;->f$0:Landroid/animation/Animator;

    return-void
.end method


# virtual methods
.method public final onAnimationEnd()V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/google/android/material/search/SearchBarAnimationHelper$$ExternalSyntheticLambda2;->f$0:Landroid/animation/Animator;

    invoke-static {v0}, Lcom/google/android/material/search/SearchBarAnimationHelper;->$r8$lambda$1r7Y4hRSo4F1Esrbw5SdK9GHD3Q(Landroid/animation/Animator;)V

    return-void
.end method
