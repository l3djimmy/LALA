.class public final synthetic Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/core/resolutionselector/ResolutionFilter;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/core/ImageAnalysis;"
    method = "lambda$onMergeConfig$0"
    proto = "(Landroid/util/Size;Ljava/util/List;I)Ljava/util/List;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/util/Size;


# direct methods
.method public synthetic constructor <init>(Landroid/util/Size;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda3;->f$0:Landroid/util/Size;

    return-void
.end method


# virtual methods
.method public final filter(Ljava/util/List;I)Ljava/util/List;
    .locals 1

    .line 0
    iget-object v0, p0, Landroidx/camera/core/ImageAnalysis$$ExternalSyntheticLambda3;->f$0:Landroid/util/Size;

    invoke-static {v0, p1, p2}, Landroidx/camera/core/ImageAnalysis;->lambda$onMergeConfig$0(Landroid/util/Size;Ljava/util/List;I)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method
