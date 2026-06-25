.class final Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "VideoFrameExtractor.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/media/VideoFrameExtractor;->extractFrames(Landroid/net/Uri;Ljava/io/File;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
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
        "Ljava/util/List<",
        "+",
        "Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;",
        ">;>;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0003H\n"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;",
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
    c = "com.hardlineforge.lala.media.VideoFrameExtractor$extractFrames$2"
    f = "VideoFrameExtractor.kt"
    i = {}
    l = {}
    m = "invokeSuspend"
    n = {}
    s = {}
.end annotation


# instance fields
.field final synthetic $fps:I

.field final synthetic $outputDir:Ljava/io/File;

.field final synthetic $videoUri:Landroid/net/Uri;

.field label:I

.field final synthetic this$0:Lcom/hardlineforge/lala/media/VideoFrameExtractor;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/media/VideoFrameExtractor;Landroid/net/Uri;ILjava/io/File;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/media/VideoFrameExtractor;",
            "Landroid/net/Uri;",
            "I",
            "Ljava/io/File;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;->this$0:Lcom/hardlineforge/lala/media/VideoFrameExtractor;

    iput-object p2, p0, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;->$videoUri:Landroid/net/Uri;

    iput p3, p0, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;->$fps:I

    iput-object p4, p0, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;->$outputDir:Ljava/io/File;

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

    new-instance v0, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;

    iget-object v1, p0, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;->this$0:Lcom/hardlineforge/lala/media/VideoFrameExtractor;

    iget-object v2, p0, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;->$videoUri:Landroid/net/Uri;

    iget v3, p0, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;->$fps:I

    iget-object v4, p0, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;->$outputDir:Ljava/io/File;

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;-><init>(Lcom/hardlineforge/lala/media/VideoFrameExtractor;Landroid/net/Uri;ILjava/io/File;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 20
    .param p1, "$result"    # Ljava/lang/Object;

    move-object/from16 v1, p0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    .line 32
    iget v0, v1, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;->label:I

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 33
    new-instance v0, Landroid/media/MediaMetadataRetriever;

    invoke-direct {v0}, Landroid/media/MediaMetadataRetriever;-><init>()V

    move-object v2, v0

    .line 34
    .local v2, "retriever":Landroid/media/MediaMetadataRetriever;
    iget-object v0, v1, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;->this$0:Lcom/hardlineforge/lala/media/VideoFrameExtractor;

    invoke-static {v0}, Lcom/hardlineforge/lala/media/VideoFrameExtractor;->access$getContext$p(Lcom/hardlineforge/lala/media/VideoFrameExtractor;)Landroid/content/Context;

    move-result-object v0

    iget-object v3, v1, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;->$videoUri:Landroid/net/Uri;

    invoke-virtual {v2, v0, v3}, Landroid/media/MediaMetadataRetriever;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    .line 36
    nop

    .line 37
    nop

    .line 36
    const/16 v0, 0x9

    invoke-virtual {v2, v0}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v0

    .line 37
    const-wide/16 v3, 0x3e8

    const-wide/16 v5, 0x0

    if-eqz v0, :cond_0

    .line 36
    nop

    .line 37
    invoke-static {v0}, Lkotlin/text/StringsKt;->toLongOrNull(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 36
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    .line 37
    mul-long/2addr v7, v3

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move-wide v7, v5

    .line 36
    :goto_0
    nop

    .line 39
    .local v7, "durationUs":J
    cmp-long v0, v7, v5

    if-gtz v0, :cond_1

    .line 40
    invoke-virtual {v2}, Landroid/media/MediaMetadataRetriever;->release()V

    .line 41
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 44
    :cond_1
    iget v0, v1, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;->$fps:I

    const/16 v5, 0x1e

    const/4 v6, 0x1

    invoke-static {v0, v6, v5}, Lkotlin/ranges/RangesKt;->coerceIn(III)I

    move-result v0

    int-to-long v9, v0

    const-wide/32 v11, 0xf4240

    div-long/2addr v11, v9

    .line 45
    .local v11, "intervalUs":J
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v5, v0

    check-cast v5, Ljava/util/List;

    .line 47
    .local v5, "frames":Ljava/util/List;
    const-wide/16 v9, 0x0

    .line 48
    .local v9, "timeUs":J
    const/4 v0, 0x0

    .line 49
    .local v0, "frameNumber":I
    iget-object v13, v1, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;->$outputDir:Ljava/io/File;

    invoke-virtual {v13}, Ljava/io/File;->mkdirs()Z

    move-wide v13, v9

    move v9, v0

    .line 51
    .end local v0    # "frameNumber":I
    .local v9, "frameNumber":I
    .local v13, "timeUs":J
    :goto_1
    cmp-long v0, v13, v7

    if-gtz v0, :cond_3

    .line 52
    const/4 v0, 0x3

    invoke-virtual {v2, v13, v14, v0}, Landroid/media/MediaMetadataRetriever;->getFrameAtTime(JI)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 53
    .local v10, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v10, :cond_2

    .line 54
    new-instance v0, Ljava/io/File;

    iget-object v15, v1, Lcom/hardlineforge/lala/media/VideoFrameExtractor$extractFrames$2;->$outputDir:Ljava/io/File;

    sget-object v16, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    invoke-static {v9}, Lkotlin/coroutines/jvm/internal/Boxing;->boxInt(I)Ljava/lang/Integer;

    move-result-object v16

    move-wide/from16 v17, v3

    filled-new-array/range {v16 .. v16}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3, v6}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v3

    const-string v4, "%04d"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "format(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "frame_"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".jpg"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v15, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v3, v0

    .local v3, "file":Ljava/io/File;
    new-instance v0, Ljava/io/FileOutputStream;

    .line 55
    invoke-direct {v0, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object v4, v0

    check-cast v4, Ljava/io/Closeable;

    :try_start_0
    move-object v0, v4

    check-cast v0, Ljava/io/FileOutputStream;

    .local v0, "out\\1":Ljava/io/FileOutputStream;
    const/4 v6, 0x0

    .line 56
    .local v6, "$i$a$-use-VideoFrameExtractor$extractFrames$2$1\\1\\55\\0":I
    sget-object v15, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    move-object/from16 v19, v0

    .end local v0    # "out\\1":Ljava/io/FileOutputStream;
    .local v19, "out\\1":Ljava/io/FileOutputStream;
    move-object/from16 v0, v19

    check-cast v0, Ljava/io/OutputStream;

    const/16 v1, 0x55

    invoke-virtual {v10, v15, v1, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    .end local v6    # "$i$a$-use-VideoFrameExtractor$extractFrames$2$1\\1\\55\\0":I
    .end local v19    # "out\\1":Ljava/io/FileOutputStream;
    const/4 v0, 0x0

    invoke-static {v4, v0}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 58
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->recycle()V

    .line 59
    new-instance v0, Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;

    .line 60
    nop

    .line 61
    move-object v6, v2

    .end local v2    # "retriever":Landroid/media/MediaMetadataRetriever;
    .local v6, "retriever":Landroid/media/MediaMetadataRetriever;
    div-long v1, v13, v17

    long-to-int v1, v1

    .line 62
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    const-string v4, "getAbsolutePath(...)"

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 59
    invoke-direct {v0, v9, v1, v2}, Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;-><init>(IILjava/lang/String;)V

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .end local v3    # "file":Ljava/io/File;
    goto :goto_2

    .line 55
    .end local v6    # "retriever":Landroid/media/MediaMetadataRetriever;
    .restart local v2    # "retriever":Landroid/media/MediaMetadataRetriever;
    .restart local v3    # "file":Ljava/io/File;
    :catchall_0
    move-exception v0

    move-object v6, v2

    move-object v1, v0

    .end local v2    # "retriever":Landroid/media/MediaMetadataRetriever;
    .end local v3    # "file":Ljava/io/File;
    .end local v5    # "frames":Ljava/util/List;
    .end local v7    # "durationUs":J
    .end local v9    # "frameNumber":I
    .end local v10    # "bitmap":Landroid/graphics/Bitmap;
    .end local v11    # "intervalUs":J
    .end local v13    # "timeUs":J
    .end local p1    # "$result":Ljava/lang/Object;
    :try_start_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .restart local v3    # "file":Ljava/io/File;
    .restart local v5    # "frames":Ljava/util/List;
    .restart local v6    # "retriever":Landroid/media/MediaMetadataRetriever;
    .restart local v7    # "durationUs":J
    .restart local v9    # "frameNumber":I
    .restart local v10    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v11    # "intervalUs":J
    .restart local v13    # "timeUs":J
    .restart local p1    # "$result":Ljava/lang/Object;
    :catchall_1
    move-exception v0

    invoke-static {v4, v1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    .line 53
    .end local v3    # "file":Ljava/io/File;
    .end local v6    # "retriever":Landroid/media/MediaMetadataRetriever;
    .restart local v2    # "retriever":Landroid/media/MediaMetadataRetriever;
    :cond_2
    move-object v6, v2

    move-wide/from16 v17, v3

    .line 65
    .end local v2    # "retriever":Landroid/media/MediaMetadataRetriever;
    .restart local v6    # "retriever":Landroid/media/MediaMetadataRetriever;
    :goto_2
    add-long/2addr v13, v11

    .line 66
    nop

    .end local v10    # "bitmap":Landroid/graphics/Bitmap;
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v1, p0

    move-object v2, v6

    move-wide/from16 v3, v17

    const/4 v6, 0x1

    goto/16 :goto_1

    .line 69
    .end local v6    # "retriever":Landroid/media/MediaMetadataRetriever;
    .restart local v2    # "retriever":Landroid/media/MediaMetadataRetriever;
    :cond_3
    move-object v6, v2

    .end local v2    # "retriever":Landroid/media/MediaMetadataRetriever;
    .restart local v6    # "retriever":Landroid/media/MediaMetadataRetriever;
    invoke-virtual {v6}, Landroid/media/MediaMetadataRetriever;->release()V

    .line 70
    return-object v5

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
