.class public final Lcom/rajat/pdfviewer/util/NetworkUtil;
.super Ljava/lang/Object;
.source "NetworkUtil.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/util/NetworkUtil;",
        "",
        "<init>",
        "()V",
        "checkInternetConnection",
        "",
        "context",
        "Landroid/content/Context;",
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

.field public static final INSTANCE:Lcom/rajat/pdfviewer/util/NetworkUtil;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/rajat/pdfviewer/util/NetworkUtil;

    invoke-direct {v0}, Lcom/rajat/pdfviewer/util/NetworkUtil;-><init>()V

    sput-object v0, Lcom/rajat/pdfviewer/util/NetworkUtil;->INSTANCE:Lcom/rajat/pdfviewer/util/NetworkUtil;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final checkInternetConnection(Landroid/content/Context;)Z
    .locals 9
    .param p1, "context"    # Landroid/content/Context;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    const/4 v0, 0x0

    .line 11
    .local v0, "result":I
    const-string v1, "connectivity"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 12
    .local v1, "cm":Landroid/net/ConnectivityManager;
    nop

    .line 13
    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_4

    move-object v4, v1

    .local v4, "$this$checkInternetConnection_u24lambda_u241":Landroid/net/ConnectivityManager;
    const/4 v5, 0x0

    .line 14
    .local v5, "$i$a$-run-NetworkUtil$checkInternetConnection$1":I
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v6

    if-eqz v6, :cond_3

    .local v6, "$this$checkInternetConnection_u24lambda_u241_u24lambda_u240":Landroid/net/NetworkCapabilities;
    const/4 v7, 0x0

    .line 15
    .local v7, "$i$a$-run-NetworkUtil$checkInternetConnection$1$1":I
    nop

    .line 16
    invoke-virtual {v6, v3}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 17
    const/4 v0, 0x2

    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {v6, v2}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 20
    const/4 v0, 0x1

    goto :goto_0

    .line 22
    :cond_1
    const/4 v8, 0x4

    invoke-virtual {v6, v8}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 23
    const/4 v0, 0x3

    .line 26
    :cond_2
    :goto_0
    nop

    .line 14
    .end local v6    # "$this$checkInternetConnection_u24lambda_u241_u24lambda_u240":Landroid/net/NetworkCapabilities;
    .end local v7    # "$i$a$-run-NetworkUtil$checkInternetConnection$1$1":I
    nop

    .line 26
    :cond_3
    nop

    .line 13
    .end local v4    # "$this$checkInternetConnection_u24lambda_u241":Landroid/net/ConnectivityManager;
    .end local v5    # "$i$a$-run-NetworkUtil$checkInternetConnection$1":I
    nop

    .line 45
    :cond_4
    if-eqz v0, :cond_5

    move v2, v3

    :cond_5
    return v2
.end method
