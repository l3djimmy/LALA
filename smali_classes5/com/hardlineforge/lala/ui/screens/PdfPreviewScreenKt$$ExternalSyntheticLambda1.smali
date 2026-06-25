.class public final synthetic Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;"
    method = "PdfPreviewScreen$lambda$23$lambda$22$lambda$18$lambda$17"
    proto = "(Landroidx/compose/runtime/MutableState;Landroid/content/Context;)Lcom/rajat/pdfviewer/PdfRendererView;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/compose/runtime/MutableState;


# direct methods
.method public synthetic constructor <init>(Landroidx/compose/runtime/MutableState;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$$ExternalSyntheticLambda1;->f$0:Landroidx/compose/runtime/MutableState;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$$ExternalSyntheticLambda1;->f$0:Landroidx/compose/runtime/MutableState;

    check-cast p1, Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->PdfPreviewScreen$lambda$23$lambda$22$lambda$18$lambda$17(Landroidx/compose/runtime/MutableState;Landroid/content/Context;)Lcom/rajat/pdfviewer/PdfRendererView;

    move-result-object p1

    return-object p1
.end method
