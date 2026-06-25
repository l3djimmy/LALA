.class public final Lcom/rajat/pdfviewer/util/EdgeToEdgeHelper;
.super Ljava/lang/Object;
.source "EdgeToEdgeHelper.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nEdgeToEdgeHelper.kt\nKotlin\n*S Kotlin\n*F\n+ 1 EdgeToEdgeHelper.kt\ncom/rajat/pdfviewer/util/EdgeToEdgeHelper\n+ 2 View.kt\nandroidx/core/view/ViewKt\n*L\n1#1,48:1\n167#2,2:49\n*S KotlinDebug\n*F\n+ 1 EdgeToEdgeHelper.kt\ncom/rajat/pdfviewer/util/EdgeToEdgeHelper\n*L\n30#1:49,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J6\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0016\u0008\u0002\u0010\u000c\u001a\u0010\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u0005\u0018\u00010\rJ\u000e\u0010\u000f\u001a\u00020\u000b2\u0006\u0010\u0010\u001a\u00020\u0011\u00a8\u0006\u0012"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/util/EdgeToEdgeHelper;",
        "",
        "<init>",
        "()V",
        "applyInsets",
        "",
        "window",
        "Landroid/view/Window;",
        "rootView",
        "Landroid/view/View;",
        "darkMode",
        "",
        "onInsetsApplied",
        "Lkotlin/Function1;",
        "Landroidx/core/view/WindowInsetsCompat;",
        "isDarkModeEnabled",
        "configUiMode",
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


# static fields
.field public static final $stable:I

.field public static final INSTANCE:Lcom/rajat/pdfviewer/util/EdgeToEdgeHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/rajat/pdfviewer/util/EdgeToEdgeHelper;

    invoke-direct {v0}, Lcom/rajat/pdfviewer/util/EdgeToEdgeHelper;-><init>()V

    sput-object v0, Lcom/rajat/pdfviewer/util/EdgeToEdgeHelper;->INSTANCE:Lcom/rajat/pdfviewer/util/EdgeToEdgeHelper;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic applyInsets$default(Lcom/rajat/pdfviewer/util/EdgeToEdgeHelper;Landroid/view/Window;Landroid/view/View;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)V
    .locals 0

    .line 12
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_0

    .line 16
    const/4 p4, 0x0

    .line 12
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rajat/pdfviewer/util/EdgeToEdgeHelper;->applyInsets(Landroid/view/Window;Landroid/view/View;ZLkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method static final applyInsets$lambda$1(Lkotlin/jvm/functions/Function1;Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;
    .locals 7
    .param p0, "$onInsetsApplied"    # Lkotlin/jvm/functions/Function1;
    .param p1, "v"    # Landroid/view/View;
    .param p2, "insets"    # Landroidx/core/view/WindowInsetsCompat;

    const-string/jumbo v0, "v"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "insets"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    nop

    .line 25
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->systemBars()I

    move-result v0

    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->displayCutout()I

    move-result v1

    or-int/2addr v0, v1

    .line 24
    invoke-virtual {p2, v0}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object v0

    const-string v1, "getInsets(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    .local v0, "bars":Landroidx/core/graphics/Insets;
    iget v1, v0, Landroidx/core/graphics/Insets;->top:I

    if-gtz v1, :cond_0

    iget v1, v0, Landroidx/core/graphics/Insets;->bottom:I

    if-gtz v1, :cond_0

    iget v1, v0, Landroidx/core/graphics/Insets;->left:I

    if-gtz v1, :cond_0

    iget v1, v0, Landroidx/core/graphics/Insets;->right:I

    if-lez v1, :cond_1

    .line 30
    :cond_0
    nop

    .line 31
    iget v1, v0, Landroidx/core/graphics/Insets;->top:I

    .line 32
    iget v2, v0, Landroidx/core/graphics/Insets;->bottom:I

    .line 33
    iget v3, v0, Landroidx/core/graphics/Insets;->left:I

    .line 34
    iget v4, v0, Landroidx/core/graphics/Insets;->right:I

    .line 30
    move-object v5, p1

    .local v5, "$this$updatePadding$iv":Landroid/view/View;
    const/4 v6, 0x0

    .line 49
    .local v6, "$i$f$updatePadding":I
    invoke-virtual {v5, v3, v1, v4, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 50
    nop

    .line 38
    .end local v5    # "$this$updatePadding$iv":Landroid/view/View;
    .end local v6    # "$i$f$updatePadding":I
    :cond_1
    if-eqz p0, :cond_2

    invoke-interface {p0, p2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    :cond_2
    sget-object v1, Landroidx/core/view/WindowInsetsCompat;->CONSUMED:Landroidx/core/view/WindowInsetsCompat;

    return-object v1
.end method


# virtual methods
.method public final applyInsets(Landroid/view/Window;Landroid/view/View;ZLkotlin/jvm/functions/Function1;)V
    .locals 4
    .param p1, "window"    # Landroid/view/Window;
    .param p2, "rootView"    # Landroid/view/View;
    .param p3, "darkMode"    # Z
    .param p4, "onInsetsApplied"    # Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/Window;",
            "Landroid/view/View;",
            "Z",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/core/view/WindowInsetsCompat;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string/jumbo v0, "window"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "rootView"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    new-instance v0, Landroidx/core/view/WindowInsetsControllerCompat;

    invoke-direct {v0, p1, p2}, Landroidx/core/view/WindowInsetsControllerCompat;-><init>(Landroid/view/Window;Landroid/view/View;)V

    move-object v1, v0

    .local v1, "$this$applyInsets_u24lambda_u240":Landroidx/core/view/WindowInsetsControllerCompat;
    const/4 v2, 0x0

    .line 19
    .local v2, "$i$a$-apply-EdgeToEdgeHelper$applyInsets$controller$1":I
    xor-int/lit8 v3, p3, 0x1

    invoke-virtual {v1, v3}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightStatusBars(Z)V

    .line 20
    xor-int/lit8 v3, p3, 0x1

    invoke-virtual {v1, v3}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightNavigationBars(Z)V

    .line 21
    nop

    .line 18
    .end local v1    # "$this$applyInsets_u24lambda_u240":Landroidx/core/view/WindowInsetsControllerCompat;
    .end local v2    # "$i$a$-apply-EdgeToEdgeHelper$applyInsets$controller$1":I
    nop

    .line 23
    .local v0, "controller":Landroidx/core/view/WindowInsetsControllerCompat;
    new-instance v1, Lcom/rajat/pdfviewer/util/EdgeToEdgeHelper$$ExternalSyntheticLambda0;

    invoke-direct {v1, p4}, Lcom/rajat/pdfviewer/util/EdgeToEdgeHelper$$ExternalSyntheticLambda0;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-static {p2, v1}, Landroidx/core/view/ViewCompat;->setOnApplyWindowInsetsListener(Landroid/view/View;Landroidx/core/view/OnApplyWindowInsetsListener;)V

    .line 41
    return-void
.end method

.method public final isDarkModeEnabled(I)Z
    .locals 2
    .param p1, "configUiMode"    # I

    .line 44
    and-int/lit8 v0, p1, 0x30

    .line 45
    nop

    .line 44
    const/16 v1, 0x20

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
