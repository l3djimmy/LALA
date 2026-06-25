.class public final Lcom/hardlineforge/lala/media/VideoFrameExtractor;
.super Ljava/lang/Object;
.source "VideoFrameExtractor.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;
    }
.end annotation

.annotation runtime Ljavax/inject/Singleton;
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0010B\u0013\u0008\u0007\u0012\u0008\u0008\u0001\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J,\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u00072\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000eH\u0086@\u00a2\u0006\u0002\u0010\u000fR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0011"
    }
    d2 = {
        "Lcom/hardlineforge/lala/media/VideoFrameExtractor;",
        "",
        "context",
        "Landroid/content/Context;",
        "<init>",
        "(Landroid/content/Context;)V",
        "extractFrames",
        "",
        "Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;",
        "videoUri",
        "Landroid/net/Uri;",
        "outputDir",
        "Ljava/io/File;",
        "fps",
        "",
        "(Landroid/net/Uri;Ljava/io/File;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "FrameResult",
        "app_debug"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/hardlineforge/lala/media/VideoFrameExtractor;->$stable:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation runtime Ldagger/hilt/android/qualifiers/ApplicationContext;
        .end annotation
    .end param
    .annotation runtime Ljavax/inject/Inject;
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/hardlineforge/lala/media/VideoFrameExtractor;->context:Landroid/content/Context;

    .line 17
    return-void
.end method

.method public static final synthetic access$getContext$p(Lcom/hardlineforge/lala/media/VideoFrameExtractor;)Landroid/content/Context;
    .locals 1
    .param p0, "$this"    # Lcom/hardlineforge/lala/media/VideoFrameExtractor;

    .line 16
    iget-object v0, p0, Lcom/hardlineforge/lala/media/VideoFrameExtractor;->context:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public final extractFrames(Landroid/net/Uri;Ljava/io/File;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 7
    .param p1, "videoUri"    # Landroid/net/Uri;
    .param p2, "outputDir"    # Ljava/io/File;
    .param p3, "fps"    # I
    .param p4, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/io/File;",
            "I",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 32
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v0

    check-cast v0, Lkotlin/coroutines/CoroutineContext;

    new-instance v1, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;

    const/4 v6, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v5, p2

    move v4, p3

    .end local p1    # "videoUri":Landroid/net/Uri;
    .end local p2    # "outputDir":Ljava/io/File;
    .end local p3    # "fps":I
    .local v3, "videoUri":Landroid/net/Uri;
    .local v4, "fps":I
    .local v5, "outputDir":Ljava/io/File;
    invoke-direct/range {v1 .. v6}, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;-><init>(Lcom/hardlineforge/lala/media/VideoFrameExtractor;Landroid/net/Uri;ILjava/io/File;Lkotlin/coroutines/Continuation;)V

    check-cast v1, Lkotlin/jvm/functions/Function2;

    invoke-static {v0, v1, p4}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    .line 71
    return-object p1
.end method
