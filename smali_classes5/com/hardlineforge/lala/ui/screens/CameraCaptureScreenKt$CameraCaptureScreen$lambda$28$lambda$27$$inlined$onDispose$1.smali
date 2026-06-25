.class public final Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$lambda$28$lambda$27$$inlined$onDispose$1;
.super Ljava/lang/Object;
.source "Effects.kt"

# interfaces
.implements Landroidx/compose/runtime/DisposableEffectResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;->CameraCaptureScreen(Landroidx/navigation/NavHostController;Ljava/lang/String;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nEffects.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Effects.kt\nandroidx/compose/runtime/DisposableEffectScope$onDispose$1\n+ 2 CameraCaptureScreen.kt\ncom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt\n*L\n1#1,67:1\n120#2,3:68\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016\u00a8\u0006\u0004\u00b8\u0006\u0000"
    }
    d2 = {
        "androidx/compose/runtime/DisposableEffectScope$onDispose$1",
        "Landroidx/compose/runtime/DisposableEffectResult;",
        "dispose",
        "",
        "runtime_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $executor$inlined:Ljava/util/concurrent/ExecutorService;

.field final synthetic $recording$delegate$inlined:Landroidx/compose/runtime/MutableState;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/ExecutorService;Landroidx/compose/runtime/MutableState;)V
    .locals 0

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$lambda$28$lambda$27$$inlined$onDispose$1;->$executor$inlined:Ljava/util/concurrent/ExecutorService;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$lambda$28$lambda$27$$inlined$onDispose$1;->$recording$delegate$inlined:Landroidx/compose/runtime/MutableState;

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .line 66
    const/4 v0, 0x0

    .line 68
    .local v0, "$i$a$-onDispose-CameraCaptureScreenKt$CameraCaptureScreen$2$1$1\\1\\66\\0":I
    :try_start_0
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$lambda$28$lambda$27$$inlined$onDispose$1;->$recording$delegate$inlined:Landroidx/compose/runtime/MutableState;

    invoke-static {v1}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;->access$CameraCaptureScreen$lambda$15(Landroidx/compose/runtime/MutableState;)Landroidx/camera/video/Recording;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroidx/camera/video/Recording;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 69
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$CameraCaptureScreen$lambda$28$lambda$27$$inlined$onDispose$1;->$executor$inlined:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 70
    nop

    .line 66
    .end local v0    # "$i$a$-onDispose-CameraCaptureScreenKt$CameraCaptureScreen$2$1$1\\1\\66\\0":I
    nop

    .line 67
    return-void
.end method
