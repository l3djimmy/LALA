.class public final synthetic Landroidx/camera/core/imagecapture/SingleBundlingNode$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/core/util/Consumer;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/core/imagecapture/SingleBundlingNode;"
    method = "trackIncomingRequest"
    proto = "(Landroidx/camera/core/imagecapture/ProcessingRequest;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/core/imagecapture/SingleBundlingNode;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/core/imagecapture/SingleBundlingNode;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/core/imagecapture/SingleBundlingNode$$ExternalSyntheticLambda1;->f$0:Landroidx/camera/core/imagecapture/SingleBundlingNode;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 0
    iget-object v0, p0, Landroidx/camera/core/imagecapture/SingleBundlingNode$$ExternalSyntheticLambda1;->f$0:Landroidx/camera/core/imagecapture/SingleBundlingNode;

    check-cast p1, Landroidx/camera/core/imagecapture/ProcessingRequest;

    invoke-static {v0, p1}, Landroidx/camera/core/imagecapture/SingleBundlingNode;->$r8$lambda$LKPD3Cnk40B6oGC5vabeF2y-qzk(Landroidx/camera/core/imagecapture/SingleBundlingNode;Landroidx/camera/core/imagecapture/ProcessingRequest;)V

    return-void
.end method
