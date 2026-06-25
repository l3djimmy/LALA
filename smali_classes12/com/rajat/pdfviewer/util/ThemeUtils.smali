.class public final Lcom/rajat/pdfviewer/util/ThemeUtils;
.super Ljava/lang/Object;
.source "ThemeUtils.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\"\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0001\u0010\u0008\u001a\u00020\u00052\u0008\u0008\u0001\u0010\t\u001a\u00020\u0005J\"\u0010\n\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0001\u0010\u0008\u001a\u00020\u00052\u0008\u0008\u0001\u0010\t\u001a\u00020\u0005J \u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0010\u001a\u00020\u000cJ\u001e\u0010\u0011\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00052\u0006\u0010\u0012\u001a\u00020\u0005J\u001e\u0010\u0013\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00052\u0006\u0010\u0014\u001a\u00020\u0005\u00a8\u0006\u0015"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/util/ThemeUtils;",
        "",
        "<init>",
        "()V",
        "getColorFromAttr",
        "",
        "context",
        "Landroid/content/Context;",
        "attrRes",
        "fallbackRes",
        "getResourceIdFromAttr",
        "getBooleanFromTypedArray",
        "",
        "typedArray",
        "Landroid/content/res/TypedArray;",
        "index",
        "default",
        "getColorFromTypedArray",
        "fallbackColor",
        "getResIdFromTypedArray",
        "fallbackResId",
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

.field public static final INSTANCE:Lcom/rajat/pdfviewer/util/ThemeUtils;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/rajat/pdfviewer/util/ThemeUtils;

    invoke-direct {v0}, Lcom/rajat/pdfviewer/util/ThemeUtils;-><init>()V

    sput-object v0, Lcom/rajat/pdfviewer/util/ThemeUtils;->INSTANCE:Lcom/rajat/pdfviewer/util/ThemeUtils;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic getBooleanFromTypedArray$default(Lcom/rajat/pdfviewer/util/ThemeUtils;Landroid/content/res/TypedArray;IZILjava/lang/Object;)Z
    .locals 0

    .line 39
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    .line 42
    const/4 p3, 0x0

    .line 39
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/rajat/pdfviewer/util/ThemeUtils;->getBooleanFromTypedArray(Landroid/content/res/TypedArray;IZ)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final getBooleanFromTypedArray(Landroid/content/res/TypedArray;IZ)Z
    .locals 1
    .param p1, "typedArray"    # Landroid/content/res/TypedArray;
    .param p2, "index"    # I
    .param p3, "default"    # Z

    const-string/jumbo v0, "typedArray"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    nop

    .line 44
    :try_start_0
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 45
    :catch_0
    move-exception v0

    .line 46
    .local v0, "e":Ljava/lang/Exception;
    move v0, p3

    .line 47
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return v0
.end method

.method public final getColorFromAttr(Landroid/content/Context;II)I
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrRes"    # I
    .param p3, "fallbackRes"    # I

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 18
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 19
    .local v0, "typedValue":Landroid/util/TypedValue;
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p2, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 20
    iget v1, v0, Landroid/util/TypedValue;->data:I

    goto :goto_0

    .line 22
    :cond_0
    invoke-static {p1, p3}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    .line 19
    :goto_0
    return v1
.end method

.method public final getColorFromTypedArray(Landroid/content/res/TypedArray;II)I
    .locals 1
    .param p1, "typedArray"    # Landroid/content/res/TypedArray;
    .param p2, "index"    # I
    .param p3, "fallbackColor"    # I

    const-string/jumbo v0, "typedArray"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    nop

    .line 54
    :try_start_0
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 55
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/Exception;
    move v0, p3

    .line 57
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return v0
.end method

.method public final getResIdFromTypedArray(Landroid/content/res/TypedArray;II)I
    .locals 1
    .param p1, "typedArray"    # Landroid/content/res/TypedArray;
    .param p2, "index"    # I
    .param p3, "fallbackResId"    # I

    const-string/jumbo v0, "typedArray"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 63
    nop

    .line 64
    :try_start_0
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 65
    :catch_0
    move-exception v0

    .line 66
    .local v0, "e":Ljava/lang/Exception;
    move v0, p3

    .line 67
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return v0
.end method

.method public final getResourceIdFromAttr(Landroid/content/Context;II)I
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrRes"    # I
    .param p3, "fallbackRes"    # I

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 32
    .local v0, "typedValue":Landroid/util/TypedValue;
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p2, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 33
    iget v1, v0, Landroid/util/TypedValue;->resourceId:I

    goto :goto_0

    .line 35
    :cond_0
    move v1, p3

    .line 32
    :goto_0
    return v1
.end method
