.class Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer$CacheAnalyzingImageProxy;
.super Landroidx/camera/core/ForwardingImageProxy;
.source "ImageAnalysisNonBlockingAnalyzer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "CacheAnalyzingImageProxy"
.end annotation


# instance fields
.field final mNonBlockingAnalyzerWeakReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroidx/camera/core/ImageProxy;Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer;)V
    .locals 1
    .param p1, "image"    # Landroidx/camera/core/ImageProxy;
    .param p2, "nonBlockingAnalyzer"    # Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer;

    .line 161
    invoke-direct {p0, p1}, Landroidx/camera/core/ForwardingImageProxy;-><init>(Landroidx/camera/core/ImageProxy;)V

    .line 162
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer$CacheAnalyzingImageProxy;->mNonBlockingAnalyzerWeakReference:Ljava/lang/ref/WeakReference;

    .line 164
    new-instance v0, Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer$CacheAnalyzingImageProxy$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer$CacheAnalyzingImageProxy$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer$CacheAnalyzingImageProxy;)V

    invoke-virtual {p0, v0}, Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer$CacheAnalyzingImageProxy;->addOnImageCloseListener(Landroidx/camera/core/ForwardingImageProxy$OnImageCloseListener;)V

    .line 171
    return-void
.end method

.method static synthetic lambda$new$0(Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer;)V
    .locals 0
    .param p0, "analyzer"    # Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer;

    .line 168
    invoke-virtual {p0}, Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer;->analyzeCachedImage()V

    return-void
.end method


# virtual methods
.method synthetic lambda$new$1$androidx-camera-core-ImageAnalysisNonBlockingAnalyzer$CacheAnalyzingImageProxy(Landroidx/camera/core/ImageProxy;)V
    .locals 3
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 165
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer$CacheAnalyzingImageProxy;->mNonBlockingAnalyzerWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer;

    .line 166
    .local v0, "analyzer":Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer;
    if-eqz v0, :cond_0

    .line 167
    iget-object v1, v0, Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer;->mBackgroundExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer$CacheAnalyzingImageProxy$$ExternalSyntheticLambda1;

    invoke-direct {v2, v0}, Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer$CacheAnalyzingImageProxy$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/ImageAnalysisNonBlockingAnalyzer;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 170
    :cond_0
    return-void
.end method
