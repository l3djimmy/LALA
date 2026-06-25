.class public final Lcom/rajat/pdfviewer/util/ToolbarStyle$Companion;
.super Ljava/lang/Object;
.source "ToolbarStyle.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rajat/pdfviewer/util/ToolbarStyle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nToolbarStyle.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ToolbarStyle.kt\ncom/rajat/pdfviewer/util/ToolbarStyle$Companion\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,96:1\n1#2:97\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0016\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/util/ToolbarStyle$Companion;",
        "",
        "<init>",
        "()V",
        "from",
        "Lcom/rajat/pdfviewer/util/ToolbarStyle;",
        "context",
        "Landroid/content/Context;",
        "intent",
        "Landroid/content/Intent;",
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

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/rajat/pdfviewer/util/ToolbarStyle$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final from(Landroid/content/Context;Landroid/content/Intent;)Lcom/rajat/pdfviewer/util/ToolbarStyle;
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "intent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 48
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    .line 49
    sget-object v1, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_toolbar:[I

    .line 48
    invoke-virtual {v0, v1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    const-string/jumbo v1, "obtainStyledAttributes(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 52
    .local v0, "typedArray":Landroid/content/res/TypedArray;
    sget-object v1, Lcom/rajat/pdfviewer/util/ThemeUtils;->INSTANCE:Lcom/rajat/pdfviewer/util/ThemeUtils;

    .line 53
    sget v2, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_toolbar_pdfView_showToolbar:I

    .line 52
    const/4 v3, 0x1

    invoke-virtual {v1, v0, v2, v3}, Lcom/rajat/pdfviewer/util/ThemeUtils;->getBooleanFromTypedArray(Landroid/content/res/TypedArray;IZ)Z

    move-result v5

    .line 56
    .local v5, "showToolbar":Z
    nop

    .line 57
    sget v1, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_toolbar_pdfView_backIcon:I

    .line 56
    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-nez v1, :cond_0

    .line 58
    sget v1, Lcom/rajat/pdfviewer/R$drawable;->pdf_viewer_ic_arrow_back:I

    invoke-static {p1, v1}, Landroidx/core/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    move-object v7, v1

    goto :goto_0

    .line 56
    :cond_0
    move-object v7, v1

    :goto_0
    nop

    .line 60
    .local v7, "backIcon":Landroid/graphics/drawable/Drawable;
    sget-object v1, Lcom/rajat/pdfviewer/util/ThemeUtils;->INSTANCE:Lcom/rajat/pdfviewer/util/ThemeUtils;

    .line 61
    nop

    .line 62
    sget v2, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_toolbar_pdfView_toolbarColor:I

    .line 63
    sget v4, Lcom/rajat/pdfviewer/R$color;->pdf_viewer_primary:I

    invoke-static {p1, v4}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v4

    .line 60
    invoke-virtual {v1, v0, v2, v4}, Lcom/rajat/pdfviewer/util/ThemeUtils;->getColorFromTypedArray(Landroid/content/res/TypedArray;II)I

    move-result v6

    .line 66
    .local v6, "toolbarColor":I
    sget-object v1, Lcom/rajat/pdfviewer/util/ThemeUtils;->INSTANCE:Lcom/rajat/pdfviewer/util/ThemeUtils;

    .line 67
    nop

    .line 68
    sget v2, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_toolbar_pdfView_titleTextStyle:I

    .line 69
    sget v4, Lcom/rajat/pdfviewer/R$style;->pdfView_titleTextAppearance:I

    .line 66
    invoke-virtual {v1, v0, v2, v4}, Lcom/rajat/pdfviewer/util/ThemeUtils;->getResIdFromTypedArray(Landroid/content/res/TypedArray;II)I

    move-result v8

    .line 72
    .local v8, "titleTextStyle":I
    const-string/jumbo v1, "title_behavior"

    const/4 v2, -0x1

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    .line 97
    .local v4, "it":I
    const/4 v9, 0x0

    .line 72
    .local v9, "$i$a$-takeIf-ToolbarStyle$Companion$from$behaviorIndex$1":I
    if-eq v4, v2, :cond_1

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    .end local v4    # "it":I
    .end local v9    # "$i$a$-takeIf-ToolbarStyle$Companion$from$behaviorIndex$1":I
    :goto_1
    if-eqz v3, :cond_2

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    :goto_2
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_3

    .line 73
    :cond_3
    nop

    .line 74
    sget v1, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_toolbar_pdfView_titleBehavior:I

    .line 75
    sget-object v2, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->MULTI_LINE_WRAP:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    invoke-virtual {v2}, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->ordinal()I

    move-result v2

    .line 73
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    .line 72
    :goto_3
    nop

    .line 78
    .local v1, "behaviorIndex":I
    sget-object v2, Lcom/rajat/pdfviewer/util/ThemeUtils;->INSTANCE:Lcom/rajat/pdfviewer/util/ThemeUtils;

    .line 79
    nop

    .line 80
    sget v3, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_toolbar_pdfView_downloadIconTint:I

    .line 81
    const v4, 0x106000b

    invoke-static {p1, v4}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v4

    .line 78
    invoke-virtual {v2, v0, v3, v4}, Lcom/rajat/pdfviewer/util/ThemeUtils;->getColorFromTypedArray(Landroid/content/res/TypedArray;II)I

    move-result v10

    .line 84
    .local v10, "downloadIconTint":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 86
    new-instance v4, Lcom/rajat/pdfviewer/util/ToolbarStyle;

    .line 87
    nop

    .line 88
    nop

    .line 89
    nop

    .line 90
    nop

    .line 91
    sget-object v2, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;->Companion:Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior$Companion;

    invoke-virtual {v2, v1}, Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior$Companion;->fromXmlValue(I)Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;

    move-result-object v9

    .line 92
    nop

    .line 86
    invoke-direct/range {v4 .. v10}, Lcom/rajat/pdfviewer/util/ToolbarStyle;-><init>(ZILandroid/graphics/drawable/Drawable;ILcom/rajat/pdfviewer/util/ToolbarTitleBehavior;I)V

    return-object v4
.end method
