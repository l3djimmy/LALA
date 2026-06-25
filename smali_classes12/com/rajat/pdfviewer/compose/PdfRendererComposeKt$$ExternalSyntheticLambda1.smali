.class public final synthetic Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt;"
    method = "PdfRendererViewCompose$lambda$13$lambda$12"
    proto = "(Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;FLcom/rajat/pdfviewer/util/PdfSource;Lcom/rajat/pdfviewer/HeaderData;Landroidx/lifecycle/LifecycleOwner;Lcom/rajat/pdfviewer/util/CacheStrategy;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Lcom/rajat/pdfviewer/PdfRendererView;)Lkotlin/Unit;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;

.field public final synthetic f$1:Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;

.field public final synthetic f$2:F

.field public final synthetic f$3:Lcom/rajat/pdfviewer/util/PdfSource;

.field public final synthetic f$4:Lcom/rajat/pdfviewer/HeaderData;

.field public final synthetic f$5:Landroidx/lifecycle/LifecycleOwner;

.field public final synthetic f$6:Lcom/rajat/pdfviewer/util/CacheStrategy;

.field public final synthetic f$7:Landroidx/compose/runtime/MutableState;

.field public final synthetic f$8:Landroidx/compose/runtime/MutableState;


# direct methods
.method public synthetic constructor <init>(Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;FLcom/rajat/pdfviewer/util/PdfSource;Lcom/rajat/pdfviewer/HeaderData;Landroidx/lifecycle/LifecycleOwner;Lcom/rajat/pdfviewer/util/CacheStrategy;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;->f$0:Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;

    iput-object p2, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;->f$1:Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;

    iput p3, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;->f$2:F

    iput-object p4, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;->f$3:Lcom/rajat/pdfviewer/util/PdfSource;

    iput-object p5, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;->f$4:Lcom/rajat/pdfviewer/HeaderData;

    iput-object p6, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;->f$5:Landroidx/lifecycle/LifecycleOwner;

    iput-object p7, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;->f$6:Lcom/rajat/pdfviewer/util/CacheStrategy;

    iput-object p8, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;->f$7:Landroidx/compose/runtime/MutableState;

    iput-object p9, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;->f$8:Landroidx/compose/runtime/MutableState;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 0
    iget-object v0, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;->f$0:Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;

    iget-object v1, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;->f$1:Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;

    iget v2, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;->f$2:F

    iget-object v3, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;->f$3:Lcom/rajat/pdfviewer/util/PdfSource;

    iget-object v4, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;->f$4:Lcom/rajat/pdfviewer/HeaderData;

    iget-object v5, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;->f$5:Landroidx/lifecycle/LifecycleOwner;

    iget-object v6, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;->f$6:Lcom/rajat/pdfviewer/util/CacheStrategy;

    iget-object v7, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;->f$7:Landroidx/compose/runtime/MutableState;

    iget-object v8, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda1;->f$8:Landroidx/compose/runtime/MutableState;

    move-object v9, p1

    check-cast v9, Lcom/rajat/pdfviewer/PdfRendererView;

    invoke-static/range {v0 .. v9}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt;->PdfRendererViewCompose$lambda$13$lambda$12(Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;FLcom/rajat/pdfviewer/util/PdfSource;Lcom/rajat/pdfviewer/HeaderData;Landroidx/lifecycle/LifecycleOwner;Lcom/rajat/pdfviewer/util/CacheStrategy;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Lcom/rajat/pdfviewer/PdfRendererView;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
