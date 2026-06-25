.class public final Lcom/rajat/pdfviewer/util/CachePolicy$Companion;
.super Ljava/lang/Object;
.source "CachePolicy.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rajat/pdfviewer/util/CachePolicy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rajat/pdfviewer/util/CachePolicy$Companion$WhenMappings;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0018\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/util/CachePolicy$Companion;",
        "",
        "<init>",
        "()V",
        "from",
        "Lcom/rajat/pdfviewer/util/CachePolicy;",
        "strategy",
        "Lcom/rajat/pdfviewer/util/CacheStrategy;",
        "maxRetainedDocuments",
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

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/rajat/pdfviewer/util/CachePolicy$Companion;-><init>()V

    return-void
.end method

.method public static synthetic from$default(Lcom/rajat/pdfviewer/util/CachePolicy$Companion;Lcom/rajat/pdfviewer/util/CacheStrategy;IILjava/lang/Object;)Lcom/rajat/pdfviewer/util/CachePolicy;
    .locals 0

    .line 14
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    .line 16
    const/4 p2, 0x5

    .line 14
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/util/CachePolicy$Companion;->from(Lcom/rajat/pdfviewer/util/CacheStrategy;I)Lcom/rajat/pdfviewer/util/CachePolicy;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final from(Lcom/rajat/pdfviewer/util/CacheStrategy;I)Lcom/rajat/pdfviewer/util/CachePolicy;
    .locals 10
    .param p1, "strategy"    # Lcom/rajat/pdfviewer/util/CacheStrategy;
    .param p2, "maxRetainedDocuments"    # I

    const-string/jumbo v0, "strategy"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    sget-object v0, Lcom/rajat/pdfviewer/util/CachePolicy$Companion$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p1}, Lcom/rajat/pdfviewer/util/CacheStrategy;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    move v6, p2

    .end local p2    # "maxRetainedDocuments":I
    .local v6, "maxRetainedDocuments":I
    new-instance p2, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {p2}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw p2

    .line 36
    .end local v6    # "maxRetainedDocuments":I
    .restart local p2    # "maxRetainedDocuments":I
    :pswitch_0
    new-instance v1, Lcom/rajat/pdfviewer/util/CachePolicy;

    .line 37
    nop

    .line 38
    nop

    .line 39
    nop

    .line 40
    nop

    .line 41
    nop

    .line 42
    nop

    .line 36
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v7}, Lcom/rajat/pdfviewer/util/CachePolicy;-><init>(ZZIZZZ)V

    move v6, p2

    goto :goto_0

    .line 27
    :pswitch_1
    new-instance v2, Lcom/rajat/pdfviewer/util/CachePolicy;

    .line 28
    nop

    .line 29
    nop

    .line 30
    nop

    .line 31
    nop

    .line 32
    nop

    .line 33
    nop

    .line 27
    const/4 v3, 0x1

    const/4 v4, 0x1

    const/4 v5, 0x1

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-direct/range {v2 .. v8}, Lcom/rajat/pdfviewer/util/CachePolicy;-><init>(ZZIZZZ)V

    move v6, p2

    move-object v1, v2

    goto :goto_0

    .line 18
    :pswitch_2
    new-instance v3, Lcom/rajat/pdfviewer/util/CachePolicy;

    .line 19
    nop

    .line 20
    nop

    .line 21
    nop

    .line 22
    nop

    .line 23
    nop

    .line 24
    nop

    .line 18
    const/4 v4, 0x1

    const/4 v5, 0x1

    const/4 v7, 0x1

    const/4 v8, 0x1

    const/4 v9, 0x1

    move v6, p2

    .end local p2    # "maxRetainedDocuments":I
    .restart local v6    # "maxRetainedDocuments":I
    invoke-direct/range {v3 .. v9}, Lcom/rajat/pdfviewer/util/CachePolicy;-><init>(ZZIZZZ)V

    move-object v1, v3

    .line 44
    :goto_0
    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
