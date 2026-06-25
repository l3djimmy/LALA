.class public final Lcom/rajat/pdfviewer/util/ThemeValidator;
.super Ljava/lang/Object;
.source "ThemeValidator.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nThemeValidator.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ThemeValidator.kt\ncom/rajat/pdfviewer/util/ThemeValidator\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,35:1\n1869#2,2:36\n*S KotlinDebug\n*F\n+ 1 ThemeValidator.kt\ncom/rajat/pdfviewer/util/ThemeValidator\n*L\n17#1:36,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001c\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\u000c\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000bJ\u000e\u0010\r\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/util/ThemeValidator;",
        "",
        "<init>",
        "()V",
        "hasLoggedOnce",
        "",
        "validateThemeAttributes",
        "",
        "context",
        "Landroid/content/Context;",
        "attrs",
        "",
        "",
        "validatePdfViewerTheme",
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

.field public static final INSTANCE:Lcom/rajat/pdfviewer/util/ThemeValidator;

.field private static hasLoggedOnce:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/rajat/pdfviewer/util/ThemeValidator;

    invoke-direct {v0}, Lcom/rajat/pdfviewer/util/ThemeValidator;-><init>()V

    sput-object v0, Lcom/rajat/pdfviewer/util/ThemeValidator;->INSTANCE:Lcom/rajat/pdfviewer/util/ThemeValidator;

    const/16 v0, 0x8

    sput v0, Lcom/rajat/pdfviewer/util/ThemeValidator;->$stable:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final validatePdfViewerTheme(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    nop

    .line 28
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Integer;

    const v1, 0x1010031

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 29
    sget v1, Lcom/rajat/pdfviewer/R$attr;->pdfView_toolbarColor:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 28
    nop

    .line 30
    sget v1, Lcom/rajat/pdfviewer/R$attr;->pdfView_backgroundColor:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 28
    nop

    .line 31
    sget v1, Lcom/rajat/pdfviewer/R$attr;->pdfView_titleTextStyle:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x3

    aput-object v1, v0, v2

    .line 28
    nop

    .line 27
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/rajat/pdfviewer/util/ThemeValidator;->validateThemeAttributes(Landroid/content/Context;Ljava/util/List;)V

    .line 33
    return-void
.end method

.method public final validateThemeAttributes(Landroid/content/Context;Ljava/util/List;)V
    .locals 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "attrs"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    sget-boolean v0, Lcom/rajat/pdfviewer/util/ThemeValidator;->hasLoggedOnce:Z

    if-eqz v0, :cond_0

    return-void

    .line 14
    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lcom/rajat/pdfviewer/util/ThemeValidator;->hasLoggedOnce:Z

    .line 16
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    .line 17
    .local v1, "theme":Landroid/content/res/Resources$Theme;
    move-object v2, p2

    check-cast v2, Ljava/lang/Iterable;

    .local v2, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 36
    .local v3, "$i$f$forEach":I
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .local v5, "element$iv":Ljava/lang/Object;
    move-object v6, v5

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    .local v6, "attr":I
    const/4 v7, 0x0

    .line 18
    .local v7, "$i$a$-forEach-ThemeValidator$validateThemeAttributes$1":I
    new-instance v8, Landroid/util/TypedValue;

    invoke-direct {v8}, Landroid/util/TypedValue;-><init>()V

    .line 19
    .local v8, "resolved":Landroid/util/TypedValue;
    invoke-virtual {v1, v6, v8, v0}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v9

    .line 20
    .local v9, "success":Z
    if-nez v9, :cond_1

    .line 21
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "\u26a0\ufe0f Missing theme attribute: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v11, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const-string v11, "PdfViewerTheme"

    invoke-static {v11, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    :cond_1
    nop

    .line 36
    .end local v6    # "attr":I
    .end local v7    # "$i$a$-forEach-ThemeValidator$validateThemeAttributes$1":I
    .end local v8    # "resolved":Landroid/util/TypedValue;
    .end local v9    # "success":Z
    nop

    .end local v5    # "element$iv":Ljava/lang/Object;
    goto :goto_0

    .line 37
    :cond_2
    nop

    .line 24
    .end local v2    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v3    # "$i$f$forEach":I
    return-void
.end method
