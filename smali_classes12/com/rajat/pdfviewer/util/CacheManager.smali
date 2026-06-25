.class public final Lcom/rajat/pdfviewer/util/CacheManager;
.super Ljava/lang/Object;
.source "CacheManager.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rajat/pdfviewer/util/CacheManager$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCacheManager.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CacheManager.kt\ncom/rajat/pdfviewer/util/CacheManager\n+ 2 _Sequences.kt\nkotlin/sequences/SequencesKt___SequencesKt\n*L\n1#1,131:1\n1321#2,2:132\n*S KotlinDebug\n*F\n+ 1 CacheManager.kt\ncom/rajat/pdfviewer/util/CacheManager\n*L\n58#1:132,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000L\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0005\u0008\u0007\u0018\u0000 $2\u00020\u0001:\u0001$B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000e\u0010\u0012\u001a\u00020\u0013H\u0086@\u00a2\u0006\u0002\u0010\u0014J\u0014\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u000f0\rH\u0002J\u0008\u0010\u0016\u001a\u00020\u0013H\u0002J\u0018\u0010\u0017\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\u0018\u001a\u00020\u000eH\u0086@\u00a2\u0006\u0002\u0010\u0019J\u0012\u0010\u001a\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\u0018\u001a\u00020\u000eH\u0002J\u001e\u0010\u001b\u001a\u00020\u00132\u0006\u0010\u0018\u001a\u00020\u000e2\u0006\u0010\u001c\u001a\u00020\u000fH\u0086@\u00a2\u0006\u0002\u0010\u001dJ&\u0010\u001e\u001a\u0008\u0012\u0004\u0012\u00020 0\u001f2\u0006\u0010\u0018\u001a\u00020\u000e2\u0006\u0010\u001c\u001a\u00020\u000fH\u0082@\u00a2\u0006\u0004\u0008!\u0010\u001dJ\u0016\u0010\"\u001a\u00020 2\u0006\u0010\u0018\u001a\u00020\u000eH\u0086@\u00a2\u0006\u0002\u0010\u0019J\u0006\u0010#\u001a\u00020 R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u000c\u001a\u000e\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u000f0\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006%"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/util/CacheManager;",
        "",
        "context",
        "Landroid/content/Context;",
        "currentOpenedFileName",
        "",
        "cacheStrategy",
        "Lcom/rajat/pdfviewer/util/CacheStrategy;",
        "<init>",
        "(Landroid/content/Context;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;)V",
        "cachePolicy",
        "Lcom/rajat/pdfviewer/util/CachePolicy;",
        "memoryCache",
        "Landroid/util/LruCache;",
        "",
        "Landroid/graphics/Bitmap;",
        "cacheDir",
        "Ljava/io/File;",
        "initialize",
        "",
        "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "createMemoryCache",
        "purgeDiskBitmapFiles",
        "getBitmapFromCache",
        "pageNo",
        "(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "decodeBitmapFromDiskCache",
        "addBitmapToCache",
        "bitmap",
        "(ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "writeBitmapToCache",
        "Lkotlin/Result;",
        "",
        "writeBitmapToCache-0E7RQCE",
        "pageExistsInCache",
        "shouldPrefetch",
        "Companion",
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

.field public static final CACHE_PATH:Ljava/lang/String; = "___pdf___cache___"

.field public static final Companion:Lcom/rajat/pdfviewer/util/CacheManager$Companion;


# instance fields
.field private cacheDir:Ljava/io/File;

.field private final cachePolicy:Lcom/rajat/pdfviewer/util/CachePolicy;

.field private final cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

.field private final context:Landroid/content/Context;

.field private final currentOpenedFileName:Ljava/lang/String;

.field private final memoryCache:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/Integer;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/rajat/pdfviewer/util/CacheManager$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/rajat/pdfviewer/util/CacheManager$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/rajat/pdfviewer/util/CacheManager;->Companion:Lcom/rajat/pdfviewer/util/CacheManager$Companion;

    const/16 v0, 0x8

    sput v0, Lcom/rajat/pdfviewer/util/CacheManager;->$stable:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "currentOpenedFileName"    # Ljava/lang/String;
    .param p3, "cacheStrategy"    # Lcom/rajat/pdfviewer/util/CacheStrategy;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "currentOpenedFileName"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cacheStrategy"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/rajat/pdfviewer/util/CacheManager;->context:Landroid/content/Context;

    .line 18
    iput-object p2, p0, Lcom/rajat/pdfviewer/util/CacheManager;->currentOpenedFileName:Ljava/lang/String;

    .line 19
    iput-object p3, p0, Lcom/rajat/pdfviewer/util/CacheManager;->cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

    .line 21
    sget-object v0, Lcom/rajat/pdfviewer/util/CachePolicy;->Companion:Lcom/rajat/pdfviewer/util/CachePolicy$Companion;

    iget-object v1, p0, Lcom/rajat/pdfviewer/util/CacheManager;->cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2}, Lcom/rajat/pdfviewer/util/CachePolicy$Companion;->from(Lcom/rajat/pdfviewer/util/CacheStrategy;I)Lcom/rajat/pdfviewer/util/CachePolicy;

    move-result-object v0

    iput-object v0, p0, Lcom/rajat/pdfviewer/util/CacheManager;->cachePolicy:Lcom/rajat/pdfviewer/util/CachePolicy;

    .line 22
    invoke-direct {p0}, Lcom/rajat/pdfviewer/util/CacheManager;->createMemoryCache()Landroid/util/LruCache;

    move-result-object v0

    iput-object v0, p0, Lcom/rajat/pdfviewer/util/CacheManager;->memoryCache:Landroid/util/LruCache;

    .line 23
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/rajat/pdfviewer/util/CacheManager;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "___pdf___cache___/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/rajat/pdfviewer/util/CacheManager;->currentOpenedFileName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/rajat/pdfviewer/util/CacheManager;->cacheDir:Ljava/io/File;

    .line 16
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 16
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    .line 19
    sget-object p3, Lcom/rajat/pdfviewer/util/CacheStrategy;->MAXIMIZE_PERFORMANCE:Lcom/rajat/pdfviewer/util/CacheStrategy;

    .line 16
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/rajat/pdfviewer/util/CacheManager;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;)V

    .line 20
    return-void
.end method

.method public static final synthetic access$decodeBitmapFromDiskCache(Lcom/rajat/pdfviewer/util/CacheManager;I)Landroid/graphics/Bitmap;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/util/CacheManager;
    .param p1, "pageNo"    # I

    .line 16
    invoke-direct {p0, p1}, Lcom/rajat/pdfviewer/util/CacheManager;->decodeBitmapFromDiskCache(I)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$getCacheDir$p(Lcom/rajat/pdfviewer/util/CacheManager;)Ljava/io/File;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/util/CacheManager;

    .line 16
    iget-object v0, p0, Lcom/rajat/pdfviewer/util/CacheManager;->cacheDir:Ljava/io/File;

    return-object v0
.end method

.method public static final synthetic access$getCachePolicy$p(Lcom/rajat/pdfviewer/util/CacheManager;)Lcom/rajat/pdfviewer/util/CachePolicy;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/util/CacheManager;

    .line 16
    iget-object v0, p0, Lcom/rajat/pdfviewer/util/CacheManager;->cachePolicy:Lcom/rajat/pdfviewer/util/CachePolicy;

    return-object v0
.end method

.method public static final synthetic access$getCacheStrategy$p(Lcom/rajat/pdfviewer/util/CacheManager;)Lcom/rajat/pdfviewer/util/CacheStrategy;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/util/CacheManager;

    .line 16
    iget-object v0, p0, Lcom/rajat/pdfviewer/util/CacheManager;->cacheStrategy:Lcom/rajat/pdfviewer/util/CacheStrategy;

    return-object v0
.end method

.method public static final synthetic access$getContext$p(Lcom/rajat/pdfviewer/util/CacheManager;)Landroid/content/Context;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/util/CacheManager;

    .line 16
    iget-object v0, p0, Lcom/rajat/pdfviewer/util/CacheManager;->context:Landroid/content/Context;

    return-object v0
.end method

.method public static final synthetic access$getCurrentOpenedFileName$p(Lcom/rajat/pdfviewer/util/CacheManager;)Ljava/lang/String;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/util/CacheManager;

    .line 16
    iget-object v0, p0, Lcom/rajat/pdfviewer/util/CacheManager;->currentOpenedFileName:Ljava/lang/String;

    return-object v0
.end method

.method public static final synthetic access$getMemoryCache$p(Lcom/rajat/pdfviewer/util/CacheManager;)Landroid/util/LruCache;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/util/CacheManager;

    .line 16
    iget-object v0, p0, Lcom/rajat/pdfviewer/util/CacheManager;->memoryCache:Landroid/util/LruCache;

    return-object v0
.end method

.method public static final synthetic access$purgeDiskBitmapFiles(Lcom/rajat/pdfviewer/util/CacheManager;)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/util/CacheManager;

    .line 16
    invoke-direct {p0}, Lcom/rajat/pdfviewer/util/CacheManager;->purgeDiskBitmapFiles()V

    return-void
.end method

.method public static final synthetic access$setCacheDir$p(Lcom/rajat/pdfviewer/util/CacheManager;Ljava/io/File;)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/util/CacheManager;
    .param p1, "<set-?>"    # Ljava/io/File;

    .line 16
    iput-object p1, p0, Lcom/rajat/pdfviewer/util/CacheManager;->cacheDir:Ljava/io/File;

    return-void
.end method

.method public static final synthetic access$writeBitmapToCache-0E7RQCE(Lcom/rajat/pdfviewer/util/CacheManager;ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/util/CacheManager;
    .param p1, "pageNo"    # I
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .param p3, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 16
    invoke-direct {p0, p1, p2, p3}, Lcom/rajat/pdfviewer/util/CacheManager;->writeBitmapToCache-0E7RQCE(ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private final createMemoryCache()Landroid/util/LruCache;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/LruCache<",
            "Ljava/lang/Integer;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 47
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v0

    const-wide/16 v2, 0x400

    div-long/2addr v0, v2

    long-to-int v0, v0

    .line 48
    .local v0, "maxMemory":I
    div-int/lit8 v1, v0, 0x6

    .line 49
    .local v1, "cacheSize":I
    new-instance v2, Lcom/rajat/pdfviewer/util/CacheManager$createMemoryCache$1;

    invoke-direct {v2, v1}, Lcom/rajat/pdfviewer/util/CacheManager$createMemoryCache$1;-><init>(I)V

    check-cast v2, Landroid/util/LruCache;

    return-object v2
.end method

.method private final decodeBitmapFromDiskCache(I)Landroid/graphics/Bitmap;
    .locals 6
    .param p1, "pageNo"    # I

    .line 80
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/rajat/pdfviewer/util/CacheManager;->cacheDir:Ljava/io/File;

    sget-object v2, Lcom/rajat/pdfviewer/util/FileUtils;->INSTANCE:Lcom/rajat/pdfviewer/util/FileUtils;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    const/4 v5, 0x0

    invoke-static {v2, v3, v5, v4, v5}, Lcom/rajat/pdfviewer/util/FileUtils;->cachedFileNameWithFormat$default(Lcom/rajat/pdfviewer/util/FileUtils;Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 81
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v5

    :cond_0
    return-object v5
.end method

.method private final purgeDiskBitmapFiles()V
    .locals 6

    .line 55
    iget-object v0, p0, Lcom/rajat/pdfviewer/util/CacheManager;->cacheDir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 56
    :cond_0
    iget-object v0, p0, Lcom/rajat/pdfviewer/util/CacheManager;->cacheDir:Ljava/io/File;

    invoke-static {v0}, Lkotlin/io/FilesKt;->walkTopDown(Ljava/io/File;)Lkotlin/io/FileTreeWalk;

    move-result-object v0

    check-cast v0, Lkotlin/sequences/Sequence;

    new-instance v1, Lcom/rajat/pdfviewer/util/CacheManager$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lcom/rajat/pdfviewer/util/CacheManager$$ExternalSyntheticLambda0;-><init>()V

    .line 57
    invoke-static {v0, v1}, Lkotlin/sequences/SequencesKt;->filter(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lkotlin/sequences/Sequence;

    move-result-object v0

    .line 58
    nop

    .local v0, "$this$forEach$iv":Lkotlin/sequences/Sequence;
    const/4 v1, 0x0

    .line 132
    .local v1, "$i$f$forEach":I
    invoke-interface {v0}, Lkotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .local v3, "element$iv":Ljava/lang/Object;
    move-object v4, v3

    check-cast v4, Ljava/io/File;

    .local v4, "file":Ljava/io/File;
    const/4 v5, 0x0

    .line 59
    .local v5, "$i$a$-forEach-CacheManager$purgeDiskBitmapFiles$2":I
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 60
    nop

    .line 132
    .end local v4    # "file":Ljava/io/File;
    .end local v5    # "$i$a$-forEach-CacheManager$purgeDiskBitmapFiles$2":I
    nop

    .end local v3    # "element$iv":Ljava/lang/Object;
    goto :goto_0

    .line 133
    :cond_1
    nop

    .line 61
    .end local v0    # "$this$forEach$iv":Lkotlin/sequences/Sequence;
    .end local v1    # "$i$f$forEach":I
    iget-object v0, p0, Lcom/rajat/pdfviewer/util/CacheManager;->cacheDir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/rajat/pdfviewer/util/CacheManager;->cacheDir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_4

    array-length v0, v0

    const/4 v2, 0x0

    if-nez v0, :cond_2

    move v0, v1

    goto :goto_1

    :cond_2
    move v0, v2

    :goto_1
    if-eqz v0, :cond_3

    goto :goto_2

    :cond_3
    move v1, v2

    :cond_4
    :goto_2
    if-eqz v1, :cond_5

    .line 62
    iget-object v0, p0, Lcom/rajat/pdfviewer/util/CacheManager;->cacheDir:Ljava/io/File;

    invoke-static {v0}, Lkotlin/io/FilesKt;->deleteRecursively(Ljava/io/File;)Z

    .line 64
    :cond_5
    return-void
.end method

.method static final purgeDiskBitmapFiles$lambda$0(Ljava/io/File;)Z
    .locals 3
    .param p0, "it"    # Ljava/io/File;

    const-string v0, "it"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 57
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lkotlin/io/FilesKt;->getExtension(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "jpg"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lkotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return v2
.end method

.method private final writeBitmapToCache-0E7RQCE(ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 7
    .param p3, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Result<",
            "Ljava/lang/Boolean;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    instance-of v0, p3, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$1;

    if-eqz v0, :cond_0

    move-object v0, p3

    check-cast v0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$1;

    iget v1, v0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$1;->label:I

    const/high16 v2, -0x80000000

    and-int/2addr v1, v2

    if-eqz v1, :cond_0

    iget v1, v0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$1;->label:I

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$1;->label:I

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$1;

    invoke-direct {v0, p0, p3}, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$1;-><init>(Lcom/rajat/pdfviewer/util/CacheManager;Lkotlin/coroutines/Continuation;)V

    .local v0, "$continuation":Lkotlin/coroutines/Continuation;
    :goto_0
    iget-object v1, v0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$1;->result:Ljava/lang/Object;

    .local v1, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v2

    .line 93
    iget v3, v0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$1;->label:I

    packed-switch v3, :pswitch_data_0

    .end local v0    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v1    # "$result":Ljava/lang/Object;
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .restart local v0    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v1    # "$result":Ljava/lang/Object;
    :pswitch_0
    invoke-static {v1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object p1, v1

    goto :goto_1

    :pswitch_1
    invoke-static {v1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v3, p0

    .local v3, "this":Lcom/rajat/pdfviewer/util/CacheManager;
    .local p1, "pageNo":I
    .local p2, "bitmap":Landroid/graphics/Bitmap;
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v4

    check-cast v4, Lkotlin/coroutines/CoroutineContext;

    new-instance v5, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;

    const/4 v6, 0x0

    invoke-direct {v5, v3, p1, p2, v6}, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$2;-><init>(Lcom/rajat/pdfviewer/util/CacheManager;ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)V

    check-cast v5, Lkotlin/jvm/functions/Function2;

    const/4 v6, 0x1

    iput v6, v0, Lcom/rajat/pdfviewer/util/CacheManager$writeBitmapToCache$1;->label:I

    invoke-static {v4, v5, v0}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    .end local v3    # "this":Lcom/rajat/pdfviewer/util/CacheManager;
    .end local p1    # "pageNo":I
    .end local p2    # "bitmap":Landroid/graphics/Bitmap;
    if-ne p1, v2, :cond_1

    return-object v2

    :cond_1
    :goto_1
    check-cast p1, Lkotlin/Result;

    invoke-virtual {p1}, Lkotlin/Result;->unbox-impl()Ljava/lang/Object;

    move-result-object p1

    .line 106
    return-object p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final addBitmapToCache(ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 6
    .param p3, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/graphics/Bitmap;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    instance-of v0, p3, Lcom/rajat/pdfviewer/util/CacheManager$addBitmapToCache$1;

    if-eqz v0, :cond_0

    move-object v0, p3

    check-cast v0, Lcom/rajat/pdfviewer/util/CacheManager$addBitmapToCache$1;

    iget v1, v0, Lcom/rajat/pdfviewer/util/CacheManager$addBitmapToCache$1;->label:I

    const/high16 v2, -0x80000000

    and-int/2addr v1, v2

    if-eqz v1, :cond_0

    iget v1, v0, Lcom/rajat/pdfviewer/util/CacheManager$addBitmapToCache$1;->label:I

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/rajat/pdfviewer/util/CacheManager$addBitmapToCache$1;->label:I

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/rajat/pdfviewer/util/CacheManager$addBitmapToCache$1;

    invoke-direct {v0, p0, p3}, Lcom/rajat/pdfviewer/util/CacheManager$addBitmapToCache$1;-><init>(Lcom/rajat/pdfviewer/util/CacheManager;Lkotlin/coroutines/Continuation;)V

    .local v0, "$continuation":Lkotlin/coroutines/Continuation;
    :goto_0
    iget-object v1, v0, Lcom/rajat/pdfviewer/util/CacheManager$addBitmapToCache$1;->result:Ljava/lang/Object;

    .local v1, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v2

    .line 84
    iget v3, v0, Lcom/rajat/pdfviewer/util/CacheManager$addBitmapToCache$1;->label:I

    packed-switch v3, :pswitch_data_0

    .end local v0    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v1    # "$result":Ljava/lang/Object;
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .restart local v0    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v1    # "$result":Ljava/lang/Object;
    :pswitch_0
    invoke-static {v1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object p1, v1

    check-cast p1, Lkotlin/Result;

    invoke-virtual {p1}, Lkotlin/Result;->unbox-impl()Ljava/lang/Object;

    goto :goto_1

    :pswitch_1
    invoke-static {v1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v3, p0

    .line 85
    .local v3, "this":Lcom/rajat/pdfviewer/util/CacheManager;
    .local p1, "pageNo":I
    .local p2, "bitmap":Landroid/graphics/Bitmap;
    iget-object v4, v3, Lcom/rajat/pdfviewer/util/CacheManager;->cachePolicy:Lcom/rajat/pdfviewer/util/CachePolicy;

    invoke-virtual {v4}, Lcom/rajat/pdfviewer/util/CachePolicy;->getUseMemoryBitmapCache()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 86
    iget-object v4, v3, Lcom/rajat/pdfviewer/util/CacheManager;->memoryCache:Landroid/util/LruCache;

    invoke-static {p1}, Lkotlin/coroutines/jvm/internal/Boxing;->boxInt(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5, p2}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    :cond_1
    iget-object v4, v3, Lcom/rajat/pdfviewer/util/CacheManager;->cachePolicy:Lcom/rajat/pdfviewer/util/CachePolicy;

    invoke-virtual {v4}, Lcom/rajat/pdfviewer/util/CachePolicy;->getUseDiskBitmapCache()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 89
    const/4 v4, 0x1

    iput v4, v0, Lcom/rajat/pdfviewer/util/CacheManager$addBitmapToCache$1;->label:I

    invoke-direct {v3, p1, p2, v0}, Lcom/rajat/pdfviewer/util/CacheManager;->writeBitmapToCache-0E7RQCE(ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    .end local v3    # "this":Lcom/rajat/pdfviewer/util/CacheManager;
    .end local p1    # "pageNo":I
    .end local p2    # "bitmap":Landroid/graphics/Bitmap;
    if-ne p1, v2, :cond_2

    .line 84
    return-object v2

    .line 89
    :cond_2
    :goto_1
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 91
    return-object p1

    :cond_3
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final getBitmapFromCache(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 3
    .param p1, "pageNo"    # I
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 66
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v0

    check-cast v0, Lkotlin/coroutines/CoroutineContext;

    new-instance v1, Lcom/rajat/pdfviewer/util/CacheManager$getBitmapFromCache$2;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lcom/rajat/pdfviewer/util/CacheManager$getBitmapFromCache$2;-><init>(Lcom/rajat/pdfviewer/util/CacheManager;ILkotlin/coroutines/Continuation;)V

    check-cast v1, Lkotlin/jvm/functions/Function2;

    invoke-static {v0, v1, p2}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    .line 77
    return-object v0
.end method

.method public final initialize(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 3
    .param p1, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 25
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v0

    check-cast v0, Lkotlin/coroutines/CoroutineContext;

    new-instance v1, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/rajat/pdfviewer/util/CacheManager$initialize$2;-><init>(Lcom/rajat/pdfviewer/util/CacheManager;Lkotlin/coroutines/Continuation;)V

    check-cast v1, Lkotlin/jvm/functions/Function2;

    invoke-static {v0, v1, p1}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 44
    return-object v0
.end method

.method public final pageExistsInCache(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 3
    .param p1, "pageNo"    # I
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 108
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v0

    check-cast v0, Lkotlin/coroutines/CoroutineContext;

    new-instance v1, Lcom/rajat/pdfviewer/util/CacheManager$pageExistsInCache$2;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lcom/rajat/pdfviewer/util/CacheManager$pageExistsInCache$2;-><init>(Lcom/rajat/pdfviewer/util/CacheManager;ILkotlin/coroutines/Continuation;)V

    check-cast v1, Lkotlin/jvm/functions/Function2;

    invoke-static {v0, v1, p2}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    .line 114
    return-object v0
.end method

.method public final shouldPrefetch()Z
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/rajat/pdfviewer/util/CacheManager;->cachePolicy:Lcom/rajat/pdfviewer/util/CachePolicy;

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/util/CachePolicy;->getEnablePrefetch()Z

    move-result v0

    return v0
.end method
