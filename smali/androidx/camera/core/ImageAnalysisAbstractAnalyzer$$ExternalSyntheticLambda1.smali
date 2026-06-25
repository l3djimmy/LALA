.class public final synthetic Landroidx/camera/core/ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;"
    method = "lambda$analyzeImage$1"
    proto = "(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageProxy;Landroid/graphics/Matrix;Landroidx/camera/core/ImageProxy;Landroid/graphics/Rect;Landroidx/camera/core/ImageAnalysis$Analyzer;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;

.field public final synthetic f$1:Ljava/util/concurrent/Executor;

.field public final synthetic f$2:Landroidx/camera/core/ImageProxy;

.field public final synthetic f$3:Landroid/graphics/Matrix;

.field public final synthetic f$4:Landroidx/camera/core/ImageProxy;

.field public final synthetic f$5:Landroid/graphics/Rect;

.field public final synthetic f$6:Landroidx/camera/core/ImageAnalysis$Analyzer;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageProxy;Landroid/graphics/Matrix;Landroidx/camera/core/ImageProxy;Landroid/graphics/Rect;Landroidx/camera/core/ImageAnalysis$Analyzer;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda1;->f$0:Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;

    iput-object p2, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda1;->f$1:Ljava/util/concurrent/Executor;

    iput-object p3, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda1;->f$2:Landroidx/camera/core/ImageProxy;

    iput-object p4, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda1;->f$3:Landroid/graphics/Matrix;

    iput-object p5, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda1;->f$4:Landroidx/camera/core/ImageProxy;

    iput-object p6, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda1;->f$5:Landroid/graphics/Rect;

    iput-object p7, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda1;->f$6:Landroidx/camera/core/ImageAnalysis$Analyzer;

    return-void
.end method


# virtual methods
.method public final attachCompleter(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 8

    .line 0
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda1;->f$0:Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;

    iget-object v1, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda1;->f$1:Ljava/util/concurrent/Executor;

    iget-object v2, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda1;->f$2:Landroidx/camera/core/ImageProxy;

    iget-object v3, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda1;->f$3:Landroid/graphics/Matrix;

    iget-object v4, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda1;->f$4:Landroidx/camera/core/ImageProxy;

    iget-object v5, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda1;->f$5:Landroid/graphics/Rect;

    iget-object v6, p0, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer$$ExternalSyntheticLambda1;->f$6:Landroidx/camera/core/ImageAnalysis$Analyzer;

    move-object v7, p1

    invoke-virtual/range {v0 .. v7}, Landroidx/camera/core/ImageAnalysisAbstractAnalyzer;->lambda$analyzeImage$1$androidx-camera-core-ImageAnalysisAbstractAnalyzer(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageProxy;Landroid/graphics/Matrix;Landroidx/camera/core/ImageProxy;Landroid/graphics/Rect;Landroidx/camera/core/ImageAnalysis$Analyzer;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
