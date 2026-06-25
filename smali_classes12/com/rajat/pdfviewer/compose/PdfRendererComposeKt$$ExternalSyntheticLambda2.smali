.class public final synthetic Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt;"
    method = "PdfRendererViewCompose$lambda$14"
    proto = "(Lcom/rajat/pdfviewer/util/PdfSource;Landroidx/compose/ui/Modifier;Lcom/rajat/pdfviewer/HeaderData;Lcom/rajat/pdfviewer/util/CacheStrategy;FLandroidx/lifecycle/LifecycleOwner;Ljava/lang/Integer;Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;Lkotlin/jvm/functions/Function1;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/rajat/pdfviewer/util/PdfSource;

.field public final synthetic f$1:Landroidx/compose/ui/Modifier;

.field public final synthetic f$10:I

.field public final synthetic f$11:I

.field public final synthetic f$2:Lcom/rajat/pdfviewer/HeaderData;

.field public final synthetic f$3:Lcom/rajat/pdfviewer/util/CacheStrategy;

.field public final synthetic f$4:F

.field public final synthetic f$5:Landroidx/lifecycle/LifecycleOwner;

.field public final synthetic f$6:Ljava/lang/Integer;

.field public final synthetic f$7:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

.field public final synthetic f$8:Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;

.field public final synthetic f$9:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Lcom/rajat/pdfviewer/util/PdfSource;Landroidx/compose/ui/Modifier;Lcom/rajat/pdfviewer/HeaderData;Lcom/rajat/pdfviewer/util/CacheStrategy;FLandroidx/lifecycle/LifecycleOwner;Ljava/lang/Integer;Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;Lkotlin/jvm/functions/Function1;II)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$0:Lcom/rajat/pdfviewer/util/PdfSource;

    iput-object p2, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$1:Landroidx/compose/ui/Modifier;

    iput-object p3, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$2:Lcom/rajat/pdfviewer/HeaderData;

    iput-object p4, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$3:Lcom/rajat/pdfviewer/util/CacheStrategy;

    iput p5, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$4:F

    iput-object p6, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$5:Landroidx/lifecycle/LifecycleOwner;

    iput-object p7, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$6:Ljava/lang/Integer;

    iput-object p8, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$7:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    iput-object p9, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$8:Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;

    iput-object p10, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$9:Lkotlin/jvm/functions/Function1;

    iput p11, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$10:I

    iput p12, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$11:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14

    .line 0
    iget-object v0, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$0:Lcom/rajat/pdfviewer/util/PdfSource;

    iget-object v1, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$1:Landroidx/compose/ui/Modifier;

    iget-object v2, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$2:Lcom/rajat/pdfviewer/HeaderData;

    iget-object v3, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$3:Lcom/rajat/pdfviewer/util/CacheStrategy;

    iget v4, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$4:F

    iget-object v5, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$5:Landroidx/lifecycle/LifecycleOwner;

    iget-object v6, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$6:Ljava/lang/Integer;

    iget-object v7, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$7:Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;

    iget-object v8, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$8:Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;

    iget-object v9, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$9:Lkotlin/jvm/functions/Function1;

    iget v10, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$10:I

    iget v11, p0, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt$$ExternalSyntheticLambda2;->f$11:I

    move-object v12, p1

    check-cast v12, Landroidx/compose/runtime/Composer;

    move-object/from16 p1, p2

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-static/range {v0 .. v13}, Lcom/rajat/pdfviewer/compose/PdfRendererComposeKt;->PdfRendererViewCompose$lambda$14(Lcom/rajat/pdfviewer/util/PdfSource;Landroidx/compose/ui/Modifier;Lcom/rajat/pdfviewer/HeaderData;Lcom/rajat/pdfviewer/util/CacheStrategy;FLandroidx/lifecycle/LifecycleOwner;Ljava/lang/Integer;Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;Lkotlin/jvm/functions/Function1;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
