.class final Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "CameraCaptureScreen.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;->CameraCaptureScreen(Landroidx/navigation/NavHostController;Ljava/lang/String;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lkotlinx/coroutines/CoroutineScope;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lkotlinx/coroutines/CoroutineScope;"
    }
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.hardlineforge.lala.ui.screens.CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1"
    f = "CameraCaptureScreen.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $context:Landroid/content/Context;

.field final synthetic $entryId:Ljava/lang/String;

.field final synthetic $executor:Ljava/util/concurrent/ExecutorService;

.field final synthetic $imageCapture$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Landroidx/camera/core/ImageCapture;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $navController:Landroidx/navigation/NavHostController;

.field final synthetic $vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

.field label:I


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/util/concurrent/ExecutorService;Ljava/lang/String;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/navigation/NavHostController;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/concurrent/ExecutorService;",
            "Ljava/lang/String;",
            "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;",
            "Landroidx/navigation/NavHostController;",
            "Landroidx/compose/runtime/MutableState<",
            "Landroidx/camera/core/ImageCapture;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->$executor:Ljava/util/concurrent/ExecutorService;

    iput-object p3, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->$entryId:Ljava/lang/String;

    iput-object p4, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->$vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iput-object p5, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->$navController:Landroidx/navigation/NavHostController;

    iput-object p6, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->$imageCapture$delegate:Landroidx/compose/runtime/MutableState;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p7}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->$executor:Ljava/util/concurrent/ExecutorService;

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->$entryId:Ljava/lang/String;

    iget-object v4, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->$vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iget-object v5, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->$navController:Landroidx/navigation/NavHostController;

    iget-object v6, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->$imageCapture$delegate:Landroidx/compose/runtime/MutableState;

    move-object v7, p2

    invoke-direct/range {v0 .. v7}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;-><init>(Landroid/content/Context;Ljava/util/concurrent/ExecutorService;Ljava/lang/String;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/navigation/NavHostController;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/CoroutineScope;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "$result"    # Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 225
    iget v0, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->label:I

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 226
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->$imageCapture$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v1}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;->access$CameraCaptureScreen$lambda$19(Landroidx/compose/runtime/MutableState;)Landroidx/camera/core/ImageCapture;

    move-result-object v1

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->$executor:Ljava/util/concurrent/ExecutorService;

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->$entryId:Ljava/lang/String;

    iget-object v4, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->$vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;->access$capturePhoto(Landroid/content/Context;Landroidx/camera/core/ImageCapture;Ljava/util/concurrent/ExecutorService;Ljava/lang/String;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Z

    move-result v0

    .line 227
    .local v0, "ok":Z
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$3$1$4$2$1$1$1;->$navController:Landroidx/navigation/NavHostController;

    invoke-virtual {v1}, Landroidx/navigation/NavHostController;->popBackStack()Z

    .line 228
    :cond_0
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
