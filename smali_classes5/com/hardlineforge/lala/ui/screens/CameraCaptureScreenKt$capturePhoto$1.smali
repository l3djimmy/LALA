.class public final Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$capturePhoto$1;
.super Ljava/lang/Object;
.source "CameraCaptureScreen.kt"

# interfaces
.implements Landroidx/camera/core/ImageCapture$OnImageSavedCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;->capturePhoto(Landroid/content/Context;Landroidx/camera/core/ImageCapture;Ljava/util/concurrent/ExecutorService;Ljava/lang/String;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J\u0010\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0007\u001a\u00020\u0008H\u0016\u00a8\u0006\t"
    }
    d2 = {
        "com/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$capturePhoto$1",
        "Landroidx/camera/core/ImageCapture$OnImageSavedCallback;",
        "onError",
        "",
        "exc",
        "Landroidx/camera/core/ImageCaptureException;",
        "onImageSaved",
        "output",
        "Landroidx/camera/core/ImageCapture$OutputFileResults;",
        "app_debug"
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
.field final synthetic $entryId:Ljava/lang/String;

.field final synthetic $file:Ljava/io/File;

.field final synthetic $success:Lkotlin/jvm/internal/Ref$BooleanRef;

.field final synthetic $vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;


# direct methods
.method constructor <init>(Lkotlin/jvm/internal/Ref$BooleanRef;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Ljava/lang/String;Ljava/io/File;)V
    .locals 0
    .param p1, "$success"    # Lkotlin/jvm/internal/Ref$BooleanRef;
    .param p2, "$vm"    # Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;
    .param p3, "$entryId"    # Ljava/lang/String;
    .param p4, "$file"    # Ljava/io/File;

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$capturePhoto$1;->$success:Lkotlin/jvm/internal/Ref$BooleanRef;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$capturePhoto$1;->$vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iput-object p3, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$capturePhoto$1;->$entryId:Ljava/lang/String;

    iput-object p4, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$capturePhoto$1;->$file:Ljava/io/File;

    .line 293
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Landroidx/camera/core/ImageCaptureException;)V
    .locals 2
    .param p1, "exc"    # Landroidx/camera/core/ImageCaptureException;

    const-string v0, "exc"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 295
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$capturePhoto$1;->$success:Lkotlin/jvm/internal/Ref$BooleanRef;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    .line 296
    return-void
.end method

.method public onImageSaved(Landroidx/camera/core/ImageCapture$OutputFileResults;)V
    .locals 11
    .param p1, "output"    # Landroidx/camera/core/ImageCapture$OutputFileResults;

    const-string v0, "output"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 298
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$capturePhoto$1;->$vm:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    .line 299
    new-instance v1, Lcom/hardlineforge/lala/data/Photo;

    .line 300
    iget-object v3, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$capturePhoto$1;->$entryId:Ljava/lang/String;

    .line 301
    iget-object v2, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$capturePhoto$1;->$file:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    const-string v2, "getAbsolutePath(...)"

    invoke-static {v4, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 299
    nop

    .line 302
    invoke-static {}, Ljava/time/Instant;->now()Ljava/time/Instant;

    move-result-object v6

    const-string v2, "now(...)"

    invoke-static {v6, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 299
    const/16 v9, 0x69

    const/4 v10, 0x0

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v1 .. v10}, Lcom/hardlineforge/lala/data/Photo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/time/Instant;Ljava/lang/Double;Ljava/lang/Double;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 298
    invoke-virtual {v0, v1}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->addPhoto(Lcom/hardlineforge/lala/data/Photo;)V

    .line 305
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$capturePhoto$1;->$success:Lkotlin/jvm/internal/Ref$BooleanRef;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    .line 306
    return-void
.end method
