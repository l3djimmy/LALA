.class public final synthetic Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/core/impl/SessionConfig$ErrorListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/core/ImageAnalysis;"
    method = "lambda$createPipeline$2"
    proto = "(Ljava/lang/String;Landroidx/camera/core/impl/ImageAnalysisConfig;Landroidx/camera/core/impl/StreamSpec;Landroidx/camera/core/impl/SessionConfig;Landroidx/camera/core/impl/SessionConfig$SessionError;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/core/ImageAnalysis;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Landroidx/camera/core/impl/ImageAnalysisConfig;

.field public final synthetic f$3:Landroidx/camera/core/impl/StreamSpec;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/core/ImageAnalysis;Ljava/lang/String;Landroidx/camera/core/impl/ImageAnalysisConfig;Landroidx/camera/core/impl/StreamSpec;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda1;->f$0:Landroidx/camera/core/ImageAnalysis;

    iput-object p2, p0, Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda1;->f$1:Ljava/lang/String;

    iput-object p3, p0, Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda1;->f$2:Landroidx/camera/core/impl/ImageAnalysisConfig;

    iput-object p4, p0, Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda1;->f$3:Landroidx/camera/core/impl/StreamSpec;

    return-void
.end method


# virtual methods
.method public final onError(Landroidx/camera/core/impl/SessionConfig;Landroidx/camera/core/impl/SessionConfig$SessionError;)V
    .locals 6

    .line 0
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda1;->f$0:Landroidx/camera/core/ImageAnalysis;

    iget-object v1, p0, Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda1;->f$1:Ljava/lang/String;

    iget-object v2, p0, Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda1;->f$2:Landroidx/camera/core/impl/ImageAnalysisConfig;

    iget-object v3, p0, Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda1;->f$3:Landroidx/camera/core/impl/StreamSpec;

    move-object v4, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Landroidx/camera/core/ImageAnalysis;->lambda$createPipeline$2$androidx-camera-core-ImageAnalysis(Ljava/lang/String;Landroidx/camera/core/impl/ImageAnalysisConfig;Landroidx/camera/core/impl/StreamSpec;Landroidx/camera/core/impl/SessionConfig;Landroidx/camera/core/impl/SessionConfig$SessionError;)V

    return-void
.end method
