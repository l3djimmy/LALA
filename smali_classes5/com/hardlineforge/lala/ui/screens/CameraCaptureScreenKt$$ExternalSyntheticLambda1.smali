.class public final synthetic Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;"
    method = "CameraCaptureScreen$lambda$28$lambda$27"
    proto = "(Ljava/util/concurrent/ExecutorService;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/DisposableEffectScope;)Landroidx/compose/runtime/DisposableEffectResult;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/util/concurrent/ExecutorService;

.field public final synthetic f$1:Landroidx/compose/runtime/MutableState;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/ExecutorService;Landroidx/compose/runtime/MutableState;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$$ExternalSyntheticLambda1;->f$0:Ljava/util/concurrent/ExecutorService;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$$ExternalSyntheticLambda1;->f$1:Landroidx/compose/runtime/MutableState;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$$ExternalSyntheticLambda1;->f$0:Ljava/util/concurrent/ExecutorService;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$$ExternalSyntheticLambda1;->f$1:Landroidx/compose/runtime/MutableState;

    check-cast p1, Landroidx/compose/runtime/DisposableEffectScope;

    invoke-static {v0, v1, p1}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;->CameraCaptureScreen$lambda$28$lambda$27(Ljava/util/concurrent/ExecutorService;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/DisposableEffectScope;)Landroidx/compose/runtime/DisposableEffectResult;

    move-result-object p1

    return-object p1
.end method
