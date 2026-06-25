.class public final Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;
.super Ljava/lang/Object;
.source "ViewerStrings.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rajat/pdfviewer/util/ViewerStrings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0003\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007J\u0012\u0010\u0008\u001a\u00020\t*\u00020\u00052\u0006\u0010\n\u001a\u00020\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;",
        "",
        "<init>",
        "()V",
        "from",
        "Lcom/rajat/pdfviewer/util/ViewerStrings;",
        "context",
        "Landroid/content/Context;",
        "getMessageForError",
        "",
        "error",
        "",
        "pdfViewer_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;-><init>()V

    return-void
.end method

.method private static final from$getString(Landroid/content/res/TypedArray;Landroid/content/Context;II)Ljava/lang/String;
    .locals 2
    .param p0, "typedArray"    # Landroid/content/res/TypedArray;
    .param p1, "$context"    # Landroid/content/Context;
    .param p2, "index"    # I
    .param p3, "fallback"    # I

    .line 33
    invoke-virtual {p0, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p1, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "getString(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_0
    return-object v0
.end method


# virtual methods
.method public final from(Landroid/content/Context;)Lcom/rajat/pdfviewer/util/ViewerStrings;
    .locals 16
    .param p1, "context"    # Landroid/content/Context;

    move-object/from16 v0, p1

    const-string v1, "context"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    nop

    .line 29
    sget-object v1, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_Strings:[I

    .line 28
    invoke-virtual {v0, v1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v1

    const-string/jumbo v2, "obtainStyledAttributes(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    .local v1, "typedArray":Landroid/content/res/TypedArray;
    new-instance v2, Lcom/rajat/pdfviewer/util/ViewerStrings;

    .line 36
    nop

    .line 37
    sget v3, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_Strings_error_pdf_corrupted:I

    .line 38
    sget v4, Lcom/rajat/pdfviewer/R$string;->error_pdf_corrupted:I

    .line 36
    invoke-static {v1, v0, v3, v4}, Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;->from$getString(Landroid/content/res/TypedArray;Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v3

    .line 40
    nop

    .line 41
    sget v4, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_Strings_error_no_internet_connection:I

    .line 42
    sget v5, Lcom/rajat/pdfviewer/R$string;->error_no_internet_connection:I

    .line 40
    invoke-static {v1, v0, v4, v5}, Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;->from$getString(Landroid/content/res/TypedArray;Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v4

    .line 44
    nop

    .line 45
    sget v5, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_Strings_file_saved_successfully:I

    .line 46
    sget v6, Lcom/rajat/pdfviewer/R$string;->file_saved_successfully:I

    .line 44
    invoke-static {v1, v0, v5, v6}, Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;->from$getString(Landroid/content/res/TypedArray;Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v5

    .line 48
    nop

    .line 49
    sget v6, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_Strings_file_saved_to_downloads:I

    .line 50
    sget v7, Lcom/rajat/pdfviewer/R$string;->file_saved_to_downloads:I

    .line 48
    invoke-static {v1, v0, v6, v7}, Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;->from$getString(Landroid/content/res/TypedArray;Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v6

    .line 52
    nop

    .line 53
    sget v7, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_Strings_file_not_downloaded_yet:I

    .line 54
    sget v8, Lcom/rajat/pdfviewer/R$string;->file_not_downloaded_yet:I

    .line 52
    invoke-static {v1, v0, v7, v8}, Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;->from$getString(Landroid/content/res/TypedArray;Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v7

    .line 56
    nop

    .line 57
    sget v8, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_Strings_permission_required:I

    .line 58
    sget v9, Lcom/rajat/pdfviewer/R$string;->permission_required:I

    .line 56
    invoke-static {v1, v0, v8, v9}, Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;->from$getString(Landroid/content/res/TypedArray;Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v8

    .line 60
    nop

    .line 61
    sget v9, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_Strings_permission_required_title:I

    .line 62
    sget v10, Lcom/rajat/pdfviewer/R$string;->permission_required_title:I

    .line 60
    invoke-static {v1, v0, v9, v10}, Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;->from$getString(Landroid/content/res/TypedArray;Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v9

    .line 64
    nop

    .line 65
    sget v10, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_Strings_pdf_viewer_error:I

    .line 66
    sget v11, Lcom/rajat/pdfviewer/R$string;->pdf_viewer_error:I

    .line 64
    invoke-static {v1, v0, v10, v11}, Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;->from$getString(Landroid/content/res/TypedArray;Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v10

    .line 68
    nop

    .line 69
    sget v11, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_Strings_pdf_viewer_retry:I

    .line 70
    sget v12, Lcom/rajat/pdfviewer/R$string;->pdf_viewer_retry:I

    .line 68
    invoke-static {v1, v0, v11, v12}, Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;->from$getString(Landroid/content/res/TypedArray;Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v11

    .line 72
    nop

    .line 73
    sget v12, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_Strings_pdf_viewer_cancel:I

    .line 74
    sget v13, Lcom/rajat/pdfviewer/R$string;->pdf_viewer_cancel:I

    .line 72
    invoke-static {v1, v0, v12, v13}, Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;->from$getString(Landroid/content/res/TypedArray;Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v12

    .line 76
    nop

    .line 77
    sget v13, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_Strings_pdf_viewer_grant:I

    .line 78
    sget v14, Lcom/rajat/pdfviewer/R$string;->pdf_viewer_grant:I

    .line 76
    invoke-static {v1, v0, v13, v14}, Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;->from$getString(Landroid/content/res/TypedArray;Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v13

    .line 80
    nop

    .line 81
    sget v14, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_Strings_pdf_viewer_error_dialog_title:I

    .line 82
    sget v15, Lcom/rajat/pdfviewer/R$string;->pdf_viewer_error_dialog_title:I

    .line 80
    invoke-static {v1, v0, v14, v15}, Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;->from$getString(Landroid/content/res/TypedArray;Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v14

    .line 35
    invoke-direct/range {v2 .. v14}, Lcom/rajat/pdfviewer/util/ViewerStrings;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .local v2, "result":Lcom/rajat/pdfviewer/util/ViewerStrings;
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 87
    return-object v2
.end method

.method public final getMessageForError(Lcom/rajat/pdfviewer/util/ViewerStrings;Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 6
    .param p1, "$this$getMessageForError"    # Lcom/rajat/pdfviewer/util/ViewerStrings;
    .param p2, "error"    # Ljava/lang/Throwable;

    const-string v0, "<this>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "error"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 91
    nop

    .line 92
    instance-of v0, p2, Ljava/net/UnknownHostException;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/rajat/pdfviewer/util/ViewerStrings;->getErrorNoInternet()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_4

    .line 93
    :cond_0
    instance-of v0, p2, Ljava/net/SocketTimeoutException;

    if-eqz v0, :cond_1

    const-string v0, "Network timeout! Please check your connection."

    goto/16 :goto_4

    .line 94
    :cond_1
    instance-of v0, p2, Ljava/io/FileNotFoundException;

    if-eqz v0, :cond_2

    const-string v0, "File not found on the server."

    goto/16 :goto_4

    .line 95
    :cond_2
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v0, :cond_3

    check-cast v0, Ljava/lang/CharSequence;

    const-string v5, "Invalid content type received"

    check-cast v5, Ljava/lang/CharSequence;

    invoke-static {v0, v5, v4, v2, v1}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v0

    if-ne v0, v3, :cond_3

    move v0, v3

    goto :goto_0

    :cond_3
    move v0, v4

    :goto_0
    if-eqz v0, :cond_4

    .line 96
    const-string v0, "The server returned a non-PDF file. Please check the URL."

    goto/16 :goto_4

    .line 97
    :cond_4
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    check-cast v0, Ljava/lang/CharSequence;

    const-string v5, "Downloaded file is not a valid PDF"

    check-cast v5, Ljava/lang/CharSequence;

    invoke-static {v0, v5, v4, v2, v1}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v0

    if-ne v0, v3, :cond_5

    move v0, v3

    goto :goto_1

    :cond_5
    move v0, v4

    :goto_1
    if-eqz v0, :cond_6

    .line 98
    const-string v0, "The file appears to be corrupted or is not a valid PDF."

    goto :goto_4

    .line 99
    :cond_6
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_7

    check-cast v0, Ljava/lang/CharSequence;

    const-string v5, "Incomplete download"

    check-cast v5, Ljava/lang/CharSequence;

    invoke-static {v0, v5, v4, v2, v1}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v0

    if-ne v0, v3, :cond_7

    move v0, v3

    goto :goto_2

    :cond_7
    move v0, v4

    :goto_2
    if-eqz v0, :cond_8

    .line 100
    const-string v0, "The download was incomplete. Please check your internet connection and try again."

    goto :goto_4

    .line 101
    :cond_8
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_9

    check-cast v0, Ljava/lang/CharSequence;

    const-string v5, "Failed to download after"

    check-cast v5, Ljava/lang/CharSequence;

    invoke-static {v0, v5, v4, v2, v1}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v0

    if-ne v0, v3, :cond_9

    goto :goto_3

    :cond_9
    move v3, v4

    :goto_3
    if-eqz v3, :cond_a

    .line 102
    const-string v0, "Failed to download the PDF after multiple attempts. Please check your internet connection."

    goto :goto_4

    .line 103
    :cond_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "An unexpected error occurred: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 91
    :goto_4
    return-object v0
.end method
