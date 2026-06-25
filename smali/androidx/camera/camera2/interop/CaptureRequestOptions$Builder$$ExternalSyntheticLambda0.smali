.class public final synthetic Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/core/impl/Config$OptionMatcher;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;"
    method = "lambda$from$0"
    proto = "(Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;Landroidx/camera/core/impl/Config;Landroidx/camera/core/impl/Config$Option;)Z"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;

.field public final synthetic f$1:Landroidx/camera/core/impl/Config;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;Landroidx/camera/core/impl/Config;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;

    iput-object p2, p0, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder$$ExternalSyntheticLambda0;->f$1:Landroidx/camera/core/impl/Config;

    return-void
.end method


# virtual methods
.method public final onOptionMatched(Landroidx/camera/core/impl/Config$Option;)Z
    .locals 2

    .line 0
    iget-object v0, p0, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;

    iget-object v1, p0, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder$$ExternalSyntheticLambda0;->f$1:Landroidx/camera/core/impl/Config;

    invoke-static {v0, v1, p1}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->lambda$from$0(Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;Landroidx/camera/core/impl/Config;Landroidx/camera/core/impl/Config$Option;)Z

    move-result p1

    return p1
.end method
