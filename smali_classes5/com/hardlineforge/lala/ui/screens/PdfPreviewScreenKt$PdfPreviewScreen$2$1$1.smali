.class final Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "PdfPreviewScreen.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->PdfPreviewScreen(Landroidx/navigation/NavHostController;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/Composer;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lkotlinx/coroutines/CoroutineScope;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lkotlinx/coroutines/CoroutineScope;"
    }
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.hardlineforge.lala.ui.screens.PdfPreviewScreenKt$PdfPreviewScreen$2$1$1"
    f = "PdfPreviewScreen.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $allEntries$delegate:Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/State<",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;>;"
        }
    .end annotation
.end field

.field final synthetic $context:Landroid/content/Context;

.field final synthetic $pdfFile$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $viewModel:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

.field label:I


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/State;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;",
            "Landroidx/compose/runtime/State<",
            "+",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;>;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/io/File;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;->$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;->$viewModel:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iput-object p3, p0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;->$allEntries$delegate:Landroidx/compose/runtime/State;

    iput-object p4, p0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;->$pdfFile$delegate:Landroidx/compose/runtime/MutableState;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p5}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;->$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;->$viewModel:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    iget-object v3, p0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;->$allEntries$delegate:Landroidx/compose/runtime/State;

    iget-object v4, p0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;->$pdfFile$delegate:Landroidx/compose/runtime/MutableState;

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;-><init>(Landroid/content/Context;Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;Landroidx/compose/runtime/State;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/CoroutineScope;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "$result"    # Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 45
    iget v0, p0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;->label:I

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 46
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;->$context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "preview.pdf"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 47
    .local v0, "file":Ljava/io/File;
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;->$viewModel:Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;

    invoke-virtual {v1}, Lcom/hardlineforge/lala/ui/viewmodel/LalaViewModel;->getPdfGen()Lcom/hardlineforge/lala/pdf/PdfGenerator;

    move-result-object v1

    iget-object v2, p0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;->$allEntries$delegate:Landroidx/compose/runtime/State;

    invoke-static {v2}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->access$PdfPreviewScreen$lambda$23$lambda$13(Landroidx/compose/runtime/State;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/hardlineforge/lala/pdf/PdfGenerator;->generate(Ljava/util/List;Ljava/io/File;)Ljava/io/File;

    .line 48
    iget-object v1, p0, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt$PdfPreviewScreen$2$1$1;->$pdfFile$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v1, v0}, Lcom/hardlineforge/lala/ui/screens/PdfPreviewScreenKt;->access$PdfPreviewScreen$lambda$23$lambda$6(Landroidx/compose/runtime/MutableState;Ljava/io/File;)V

    .line 49
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
