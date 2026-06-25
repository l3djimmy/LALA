.class final Lcom/rajat/pdfviewer/util/FileUtils$createPdfDocumentUri$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "FileUtils.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/util/FileUtils;->createPdfDocumentUri(Landroid/content/ContentResolver;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
        "Landroid/net/Uri;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"
    }
    d2 = {
        "<anonymous>",
        "Landroid/net/Uri;",
        "Lkotlinx/coroutines/CoroutineScope;"
    }
    k = 0x3
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.rajat.pdfviewer.util.FileUtils$createPdfDocumentUri$2"
    f = "FileUtils.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $contentResolver:Landroid/content/ContentResolver;

.field final synthetic $fileName:Ljava/lang/String;

.field label:I


# direct methods
.method constructor <init>(Landroid/content/ContentResolver;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/rajat/pdfviewer/util/FileUtils$createPdfDocumentUri$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/rajat/pdfviewer/util/FileUtils$createPdfDocumentUri$2;->$contentResolver:Landroid/content/ContentResolver;

    iput-object p2, p0, Lcom/rajat/pdfviewer/util/FileUtils$createPdfDocumentUri$2;->$fileName:Ljava/lang/String;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p3}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 3
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

    new-instance v0, Lcom/rajat/pdfviewer/util/FileUtils$createPdfDocumentUri$2;

    iget-object v1, p0, Lcom/rajat/pdfviewer/util/FileUtils$createPdfDocumentUri$2;->$contentResolver:Landroid/content/ContentResolver;

    iget-object v2, p0, Lcom/rajat/pdfviewer/util/FileUtils$createPdfDocumentUri$2;->$fileName:Ljava/lang/String;

    invoke-direct {v0, v1, v2, p2}, Lcom/rajat/pdfviewer/util/FileUtils$createPdfDocumentUri$2;-><init>(Landroid/content/ContentResolver;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/util/FileUtils$createPdfDocumentUri$2;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
            "Landroid/net/Uri;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/util/FileUtils$createPdfDocumentUri$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/rajat/pdfviewer/util/FileUtils$createPdfDocumentUri$2;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/rajat/pdfviewer/util/FileUtils$createPdfDocumentUri$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 52
    iget v0, p0, Lcom/rajat/pdfviewer/util/FileUtils$createPdfDocumentUri$2;->label:I

    packed-switch v0, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 53
    .local p1, "$result":Ljava/lang/Object;
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    iget-object v1, p0, Lcom/rajat/pdfviewer/util/FileUtils$createPdfDocumentUri$2;->$fileName:Ljava/lang/String;

    move-object v2, v0

    .local v2, "$this$invokeSuspend_u24lambda_u240":Landroid/content/ContentValues;
    const/4 v3, 0x0

    .line 54
    .local v3, "$i$a$-apply-FileUtils$createPdfDocumentUri$2$contentValues$1":I
    const-string v4, "_display_name"

    invoke-virtual {v2, v4, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    const-string v1, "mime_type"

    const-string v4, "application/pdf"

    invoke-virtual {v2, v1, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1d

    if-lt v1, v4, :cond_0

    .line 57
    const-string/jumbo v1, "relative_path"

    sget-object v4, Landroid/os/Environment;->DIRECTORY_DOCUMENTS:Ljava/lang/String;

    invoke-virtual {v2, v1, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .end local v2    # "$this$invokeSuspend_u24lambda_u240":Landroid/content/ContentValues;
    :cond_0
    nop

    .line 53
    .end local v3    # "$i$a$-apply-FileUtils$createPdfDocumentUri$2$contentValues$1":I
    nop

    .line 61
    .local v0, "contentValues":Landroid/content/ContentValues;
    iget-object v1, p0, Lcom/rajat/pdfviewer/util/FileUtils$createPdfDocumentUri$2;->$contentResolver:Landroid/content/ContentResolver;

    const-string v2, "external"

    invoke-static {v2}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 62
    return-object v1

    :cond_1
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Failed to create new MediaStore record."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
