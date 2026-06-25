.class final Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;
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
    c = "com.hardlineforge.lala.ui.screens.CameraCaptureScreenKt$CameraCaptureScreen$1$1"
    f = "CameraCaptureScreen.kt"
    i = {
        0x0
    }
    l = {
        0x57
    }
    m = "invokeSuspend"
    n = {
        "future"
    }
    s = {
        "L$0"
    }
.end annotation


# instance fields
.field final synthetic $context:Landroid/content/Context;

.field final synthetic $hasCameraPermission$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $imageCapture$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Landroidx/camera/core/ImageCapture;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $lensFacing$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $lifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

.field final synthetic $mode$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Lcom/hardlineforge/lala/ui/screens/CaptureMode;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $permissionLauncher:Landroidx/activity/compose/ManagedActivityResultLauncher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/activity/compose/ManagedActivityResultLauncher<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $previewView:Landroidx/camera/view/PreviewView;

.field final synthetic $videoCapture$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Landroidx/camera/video/VideoCapture<",
            "*>;>;"
        }
    .end annotation
.end field

.field L$0:Ljava/lang/Object;

.field label:I


# direct methods
.method constructor <init>(Landroidx/activity/compose/ManagedActivityResultLauncher;Landroid/content/Context;Landroidx/lifecycle/LifecycleOwner;Landroidx/compose/runtime/MutableState;Landroidx/camera/view/PreviewView;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/activity/compose/ManagedActivityResultLauncher<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;",
            "Landroid/content/Context;",
            "Landroidx/lifecycle/LifecycleOwner;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;",
            "Landroidx/camera/view/PreviewView;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Integer;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Lcom/hardlineforge/lala/ui/screens/CaptureMode;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Landroidx/camera/core/ImageCapture;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Landroidx/camera/video/VideoCapture<",
            "*>;>;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$permissionLauncher:Landroidx/activity/compose/ManagedActivityResultLauncher;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$lifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

    iput-object p4, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$hasCameraPermission$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p5, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$previewView:Landroidx/camera/view/PreviewView;

    iput-object p6, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$lensFacing$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p7, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$mode$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p8, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$imageCapture$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p9, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$videoCapture$delegate:Landroidx/compose/runtime/MutableState;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p10}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 11
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

    new-instance v0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$permissionLauncher:Landroidx/activity/compose/ManagedActivityResultLauncher;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$context:Landroid/content/Context;

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$lifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

    iget-object v4, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$hasCameraPermission$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v5, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$previewView:Landroidx/camera/view/PreviewView;

    iget-object v6, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$lensFacing$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v7, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$mode$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v8, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$imageCapture$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v9, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$videoCapture$delegate:Landroidx/compose/runtime/MutableState;

    move-object v10, p2

    invoke-direct/range {v0 .. v10}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;-><init>(Landroidx/activity/compose/ManagedActivityResultLauncher;Landroid/content/Context;Landroidx/lifecycle/LifecycleOwner;Landroidx/compose/runtime/MutableState;Landroidx/camera/view/PreviewView;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11
    .param p1, "$result"    # Ljava/lang/Object;

    const-string v0, "build(...)"

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    .line 79
    iget v2, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->label:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    packed-switch v2, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->L$0:Ljava/lang/Object;

    check-cast v1, Lcom/google/common/util/concurrent/ListenableFuture;

    .local v1, "future":Lcom/google/common/util/concurrent/ListenableFuture;
    :try_start_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v5, p1

    goto :goto_0

    .line 113
    :catch_0
    move-exception v0

    goto/16 :goto_1

    .line 79
    .end local v1    # "future":Lcom/google/common/util/concurrent/ListenableFuture;
    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 80
    iget-object v2, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$hasCameraPermission$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v2}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;->access$CameraCaptureScreen$lambda$1(Landroidx/compose/runtime/MutableState;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 81
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$permissionLauncher:Landroidx/activity/compose/ManagedActivityResultLauncher;

    const-string v1, "android.permission.CAMERA"

    invoke-virtual {v0, v1}, Landroidx/activity/compose/ManagedActivityResultLauncher;->launch(Ljava/lang/Object;)V

    .line 82
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    .line 85
    :cond_0
    iget-object v2, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$context:Landroid/content/Context;

    invoke-static {v2}, Landroidx/camera/lifecycle/ProcessCameraProvider;->getInstance(Landroid/content/Context;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v2

    const-string v5, "getInstance(...)"

    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 86
    .local v2, "future":Lcom/google/common/util/concurrent/ListenableFuture;
    nop

    .line 87
    :try_start_1
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v5

    check-cast v5, Lkotlin/coroutines/CoroutineContext;

    new-instance v6, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1$provider$1;

    invoke-direct {v6, v2, v3}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1$provider$1;-><init>(Lcom/google/common/util/concurrent/ListenableFuture;Lkotlin/coroutines/Continuation;)V

    check-cast v6, Lkotlin/jvm/functions/Function2;

    move-object v7, p0

    check-cast v7, Lkotlin/coroutines/Continuation;

    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    iput-object v8, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->L$0:Ljava/lang/Object;

    iput v4, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->label:I

    invoke-static {v5, v6, v7}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    if-ne v5, v1, :cond_1

    .line 79
    return-object v1

    .line 87
    :cond_1
    move-object v1, v2

    .line 79
    .end local v2    # "future":Lcom/google/common/util/concurrent/ListenableFuture;
    .restart local v1    # "future":Lcom/google/common/util/concurrent/ListenableFuture;
    :goto_0
    :try_start_2
    check-cast v5, Landroidx/camera/lifecycle/ProcessCameraProvider;

    .line 88
    .local v5, "provider":Landroidx/camera/lifecycle/ProcessCameraProvider;
    new-instance v2, Landroidx/camera/core/Preview$Builder;

    invoke-direct {v2}, Landroidx/camera/core/Preview$Builder;-><init>()V

    invoke-virtual {v2}, Landroidx/camera/core/Preview$Builder;->build()Landroidx/camera/core/Preview;

    move-result-object v2

    iget-object v6, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$previewView:Landroidx/camera/view/PreviewView;

    move-object v7, v2

    .local v7, "it\\1":Landroidx/camera/core/Preview;
    const/4 v8, 0x0

    .line 89
    .local v8, "$i$a$-also-CameraCaptureScreenKt$CameraCaptureScreen$1$1$preview$1\\1\\88\\0":I
    invoke-virtual {v6}, Landroidx/camera/view/PreviewView;->getSurfaceProvider()Landroidx/camera/core/Preview$SurfaceProvider;

    move-result-object v6

    invoke-virtual {v7, v6}, Landroidx/camera/core/Preview;->setSurfaceProvider(Landroidx/camera/core/Preview$SurfaceProvider;)V

    .line 90
    nop

    .line 88
    .end local v7    # "it\\1":Landroidx/camera/core/Preview;
    .end local v8    # "$i$a$-also-CameraCaptureScreenKt$CameraCaptureScreen$1$1$preview$1\\1\\88\\0":I
    const-string v6, "also(...)"

    invoke-static {v2, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 91
    .local v2, "preview":Landroidx/camera/core/Preview;
    new-instance v6, Landroidx/camera/core/CameraSelector$Builder;

    invoke-direct {v6}, Landroidx/camera/core/CameraSelector$Builder;-><init>()V

    .line 92
    iget-object v7, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$lensFacing$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v7}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;->access$CameraCaptureScreen$lambda$6(Landroidx/compose/runtime/MutableState;)I

    move-result v7

    invoke-virtual {v6, v7}, Landroidx/camera/core/CameraSelector$Builder;->requireLensFacing(I)Landroidx/camera/core/CameraSelector$Builder;

    move-result-object v6

    .line 93
    invoke-virtual {v6}, Landroidx/camera/core/CameraSelector$Builder;->build()Landroidx/camera/core/CameraSelector;

    move-result-object v6

    invoke-static {v6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 91
    nop

    .line 95
    .local v6, "selector":Landroidx/camera/core/CameraSelector;
    invoke-virtual {v5}, Landroidx/camera/lifecycle/ProcessCameraProvider;->unbindAll()V

    .line 97
    iget-object v7, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$mode$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v7}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;->access$CameraCaptureScreen$lambda$9(Landroidx/compose/runtime/MutableState;)Lcom/hardlineforge/lala/ui/screens/CaptureMode;

    move-result-object v7

    sget-object v8, Lcom/hardlineforge/lala/ui/screens/CaptureMode;->PHOTO:Lcom/hardlineforge/lala/ui/screens/CaptureMode;

    const/4 v9, 0x0

    const/4 v10, 0x2

    if-ne v7, v8, :cond_2

    .line 98
    new-instance v7, Landroidx/camera/core/ImageCapture$Builder;

    invoke-direct {v7}, Landroidx/camera/core/ImageCapture$Builder;-><init>()V

    .line 99
    invoke-virtual {v7, v4}, Landroidx/camera/core/ImageCapture$Builder;->setCaptureMode(I)Landroidx/camera/core/ImageCapture$Builder;

    move-result-object v7

    .line 100
    invoke-virtual {v7}, Landroidx/camera/core/ImageCapture$Builder;->build()Landroidx/camera/core/ImageCapture;

    move-result-object v7

    invoke-static {v7, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 98
    nop

    .line 101
    .local v7, "imgCap":Landroidx/camera/core/ImageCapture;
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$lifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

    new-array v8, v10, [Landroidx/camera/core/UseCase;

    aput-object v2, v8, v9

    aput-object v7, v8, v4

    invoke-virtual {v5, v0, v6, v8}, Landroidx/camera/lifecycle/ProcessCameraProvider;->bindToLifecycle(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;[Landroidx/camera/core/UseCase;)Landroidx/camera/core/Camera;

    .line 102
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$imageCapture$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v0, v7}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;->access$CameraCaptureScreen$lambda$20(Landroidx/compose/runtime/MutableState;Landroidx/camera/core/ImageCapture;)V

    .line 103
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$videoCapture$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v0, v3}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;->access$CameraCaptureScreen$lambda$23(Landroidx/compose/runtime/MutableState;Landroidx/camera/video/VideoCapture;)V

    .end local v7    # "imgCap":Landroidx/camera/core/ImageCapture;
    goto :goto_1

    .line 105
    :cond_2
    new-instance v7, Landroidx/camera/video/Recorder$Builder;

    invoke-direct {v7}, Landroidx/camera/video/Recorder$Builder;-><init>()V

    .line 106
    iget-object v8, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$context:Landroid/content/Context;

    invoke-static {v8}, Landroidx/core/content/ContextCompat;->getMainExecutor(Landroid/content/Context;)Ljava/util/concurrent/Executor;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroidx/camera/video/Recorder$Builder;->setExecutor(Ljava/util/concurrent/Executor;)Landroidx/camera/video/Recorder$Builder;

    move-result-object v7

    .line 107
    invoke-virtual {v7}, Landroidx/camera/video/Recorder$Builder;->build()Landroidx/camera/video/Recorder;

    move-result-object v7

    invoke-static {v7, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 105
    nop

    .line 108
    .local v7, "recorder":Landroidx/camera/video/Recorder;
    move-object v0, v7

    check-cast v0, Landroidx/camera/video/VideoOutput;

    invoke-static {v0}, Landroidx/camera/video/VideoCapture;->withOutput(Landroidx/camera/video/VideoOutput;)Landroidx/camera/video/VideoCapture;

    move-result-object v0

    const-string v8, "withOutput(...)"

    invoke-static {v0, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 109
    .local v0, "vidCap":Landroidx/camera/video/VideoCapture;
    iget-object v8, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$lifecycleOwner:Landroidx/lifecycle/LifecycleOwner;

    new-array v10, v10, [Landroidx/camera/core/UseCase;

    aput-object v2, v10, v9

    aput-object v0, v10, v4

    invoke-virtual {v5, v8, v6, v10}, Landroidx/camera/lifecycle/ProcessCameraProvider;->bindToLifecycle(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;[Landroidx/camera/core/UseCase;)Landroidx/camera/core/Camera;

    .line 110
    iget-object v4, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$videoCapture$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v4, v0}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;->access$CameraCaptureScreen$lambda$23(Landroidx/compose/runtime/MutableState;Landroidx/camera/video/VideoCapture;)V

    .line 111
    iget-object v4, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$1$1;->$imageCapture$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v4, v3}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;->access$CameraCaptureScreen$lambda$20(Landroidx/compose/runtime/MutableState;Landroidx/camera/core/ImageCapture;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .end local v0    # "vidCap":Landroidx/camera/video/VideoCapture;
    .end local v2    # "preview":Landroidx/camera/core/Preview;
    .end local v5    # "provider":Landroidx/camera/lifecycle/ProcessCameraProvider;
    .end local v6    # "selector":Landroidx/camera/core/CameraSelector;
    .end local v7    # "recorder":Landroidx/camera/video/Recorder;
    goto :goto_1

    .line 113
    .end local v1    # "future":Lcom/google/common/util/concurrent/ListenableFuture;
    .local v2, "future":Lcom/google/common/util/concurrent/ListenableFuture;
    :catch_1
    move-exception v0

    move-object v1, v2

    .line 116
    .end local v2    # "future":Lcom/google/common/util/concurrent/ListenableFuture;
    .restart local v1    # "future":Lcom/google/common/util/concurrent/ListenableFuture;
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
