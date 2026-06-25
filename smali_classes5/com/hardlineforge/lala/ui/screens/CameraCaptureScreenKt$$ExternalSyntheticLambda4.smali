.class public final synthetic Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/core/util/Consumer;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;"
    method = "startRecording$lambda$53"
    proto = "(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Ljava/lang/String;Ljava/io/File;Landroidx/camera/video/VideoRecordEvent;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Ljava/lang/String;Ljava/io/File;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$$ExternalSyntheticLambda4;->f$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$$ExternalSyntheticLambda4;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$$ExternalSyntheticLambda4;->f$2:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 3

    .line 0
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$$ExternalSyntheticLambda4;->f$0:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$$ExternalSyntheticLambda4;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt$$ExternalSyntheticLambda4;->f$2:Ljava/io/File;

    check-cast p1, Landroidx/camera/video/VideoRecordEvent;

    invoke-static {v0, v1, v2, p1}, Lcom/hardlineforge/lala/ui/screens/CameraCaptureScreenKt;->startRecording$lambda$53(Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Ljava/lang/String;Ljava/io/File;Landroidx/camera/video/VideoRecordEvent;)V

    return-void
.end method
