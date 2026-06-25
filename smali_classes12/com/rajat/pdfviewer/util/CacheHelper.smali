.class public final Lcom/rajat/pdfviewer/util/CacheHelper;
.super Ljava/lang/Object;
.source "CacheHelper.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCacheHelper.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CacheHelper.kt\ncom/rajat/pdfviewer/util/CacheHelper\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,96:1\n3829#2:97\n4344#2,2:98\n774#3:100\n865#3,2:101\n1056#3:103\n1869#3,2:104\n*S KotlinDebug\n*F\n+ 1 CacheHelper.kt\ncom/rajat/pdfviewer/util/CacheHelper\n*L\n30#1:97\n30#1:98,2\n35#1:100\n35#1:101,2\n36#1:103\n38#1:104,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u000f\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J.\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\rH\u0086@\u00a2\u0006\u0002\u0010\u000eJ%\u0010\u000f\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\u0011H\u0000\u00a2\u0006\u0002\u0008\u0012J\u0015\u0010\u0013\u001a\u00020\u00052\u0006\u0010\u0014\u001a\u00020\tH\u0000\u00a2\u0006\u0002\u0008\u0015J\u0010\u0010\u0016\u001a\u00020\u00052\u0006\u0010\u0008\u001a\u00020\tH\u0002J\u0010\u0010\u0017\u001a\u00020\u00052\u0006\u0010\u0018\u001a\u00020\u0007H\u0002J\u000e\u0010\u0019\u001a\u00020\u00072\u0006\u0010\u001a\u001a\u00020\u0007J\u000e\u0010\u001b\u001a\u00020\u00072\u0006\u0010\u001c\u001a\u00020\u0007J \u0010\u001b\u001a\u00020\u00072\u0006\u0010\u001c\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0008\u0002\u0010\u001d\u001a\u00020\u0007J\u0010\u0010\u001e\u001a\u00020\u00072\u0006\u0010\u001f\u001a\u00020\u0007H\u0002\u00a8\u0006 "
    }
    d2 = {
        "Lcom/rajat/pdfviewer/util/CacheHelper;",
        "",
        "<init>",
        "()V",
        "handleCacheStrategy",
        "",
        "origin",
        "",
        "cacheDir",
        "Ljava/io/File;",
        "cacheStrategy",
        "Lcom/rajat/pdfviewer/util/CacheStrategy;",
        "maxCachedPdfs",
        "",
        "(Ljava/lang/String;Ljava/io/File;Lcom/rajat/pdfviewer/util/CacheStrategy;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "applyDocumentRetention",
        "cachePolicy",
        "Lcom/rajat/pdfviewer/util/CachePolicy;",
        "applyDocumentRetention$pdfViewer_release",
        "cleanupTransientDocument",
        "file",
        "cleanupTransientDocument$pdfViewer_release",
        "updateCacheAccessTime",
        "logDebug",
        "message",
        "getCacheKey",
        "source",
        "getRemoteDocumentCacheKey",
        "url",
        "sessionToken",
        "sha256",
        "input",
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

.field public static final INSTANCE:Lcom/rajat/pdfviewer/util/CacheHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/rajat/pdfviewer/util/CacheHelper;

    invoke-direct {v0}, Lcom/rajat/pdfviewer/util/CacheHelper;-><init>()V

    sput-object v0, Lcom/rajat/pdfviewer/util/CacheHelper;->INSTANCE:Lcom/rajat/pdfviewer/util/CacheHelper;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final synthetic access$logDebug(Lcom/rajat/pdfviewer/util/CacheHelper;Ljava/lang/String;)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/util/CacheHelper;
    .param p1, "message"    # Ljava/lang/String;

    .line 10
    invoke-direct {p0, p1}, Lcom/rajat/pdfviewer/util/CacheHelper;->logDebug(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic getRemoteDocumentCacheKey$default(Lcom/rajat/pdfviewer/util/CacheHelper;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 79
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    .line 82
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p3

    .line 79
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/rajat/pdfviewer/util/CacheHelper;->getRemoteDocumentCacheKey(Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private final logDebug(Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;

    .line 61
    :try_start_0
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object v0, p0

    check-cast v0, Lcom/rajat/pdfviewer/util/CacheHelper;

    .local v0, "$this$logDebug_u24lambda_u245":Lcom/rajat/pdfviewer/util/CacheHelper;
    const/4 v1, 0x0

    .line 62
    .local v1, "$i$a$-runCatching-CacheHelper$logDebug$1":I
    const-string v2, "CacheHelper"

    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .end local v0    # "$this$logDebug_u24lambda_u245":Lcom/rajat/pdfviewer/util/CacheHelper;
    .end local v1    # "$i$a$-runCatching-CacheHelper$logDebug$1":I
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 61
    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    :goto_0
    return-void
.end method

.method private final sha256(Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .param p1, "input"    # Ljava/lang/String;

    .line 92
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    sget-object v1, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    const-string v2, "getBytes(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v3

    .line 93
    .local v3, "bytes":[B
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const-string v0, ""

    move-object v4, v0

    check-cast v4, Ljava/lang/CharSequence;

    new-instance v9, Lcom/rajat/pdfviewer/util/CacheHelper$$ExternalSyntheticLambda0;

    invoke-direct {v9}, Lcom/rajat/pdfviewer/util/CacheHelper$$ExternalSyntheticLambda0;-><init>()V

    const/16 v10, 0x1e

    const/4 v11, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static/range {v3 .. v11}, Lkotlin/collections/ArraysKt;->joinToString$default([BLjava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static final sha256$lambda$6(B)Ljava/lang/CharSequence;
    .locals 2
    .param p0, "it"    # B

    .line 93
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    const-string v1, "%02x"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "format(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/CharSequence;

    return-object v0
.end method

.method private final updateCacheAccessTime(Ljava/io/File;)V
    .locals 2
    .param p1, "cacheDir"    # Ljava/io/File;

    .line 57
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/io/File;->setLastModified(J)Z

    .line 58
    return-void
.end method


# virtual methods
.method public final applyDocumentRetention$pdfViewer_release(Ljava/lang/String;Ljava/io/File;Lcom/rajat/pdfviewer/util/CachePolicy;)V
    .locals 16
    .param p1, "origin"    # Ljava/lang/String;
    .param p2, "cacheDir"    # Ljava/io/File;
    .param p3, "cachePolicy"    # Lcom/rajat/pdfviewer/util/CachePolicy;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    const-string/jumbo v2, "origin"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "cacheDir"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "cachePolicy"

    move-object/from16 v3, p3

    invoke-static {v3, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    invoke-virtual {v3}, Lcom/rajat/pdfviewer/util/CachePolicy;->getMaxRetainedDocuments()I

    move-result v2

    if-gtz v2, :cond_0

    return-void

    .line 26
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 27
    move-object/from16 v2, p0

    invoke-direct {v2, v1}, Lcom/rajat/pdfviewer/util/CacheHelper;->updateCacheAccessTime(Ljava/io/File;)V

    .line 29
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    if-nez v4, :cond_1

    return-void

    .line 30
    .local v4, "cacheRoot":Ljava/io/File;
    :cond_1
    invoke-virtual {v4}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v5

    if-eqz v5, :cond_8

    .local v5, "$this$filter$iv":[Ljava/lang/Object;
    const/4 v6, 0x0

    .line 97
    .local v6, "$i$f$filter":I
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    check-cast v7, Ljava/util/Collection;

    .local v7, "destination$iv$iv":Ljava/util/Collection;
    move-object v8, v5

    .local v8, "$this$filterTo$iv$iv":[Ljava/lang/Object;
    const/4 v9, 0x0

    .line 98
    .local v9, "$i$f$filterTo":I
    array-length v10, v8

    const/4 v11, 0x0

    :goto_0
    if-ge v11, v10, :cond_3

    aget-object v12, v8, v11

    .local v12, "element$iv$iv":Ljava/lang/Object;
    move-object v13, v12

    .local v13, "it":Ljava/io/File;
    const/4 v14, 0x0

    .line 30
    .local v14, "$i$a$-filter-CacheHelper$applyDocumentRetention$cachedFolders$1":I
    invoke-virtual {v13}, Ljava/io/File;->isDirectory()Z

    move-result v13

    .line 98
    .end local v13    # "it":Ljava/io/File;
    .end local v14    # "$i$a$-filter-CacheHelper$applyDocumentRetention$cachedFolders$1":I
    if-eqz v13, :cond_2

    invoke-interface {v7, v12}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .end local v12    # "element$iv$iv":Ljava/lang/Object;
    :cond_2
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 99
    :cond_3
    nop

    .end local v7    # "destination$iv$iv":Ljava/util/Collection;
    .end local v8    # "$this$filterTo$iv$iv":[Ljava/lang/Object;
    .end local v9    # "$i$f$filterTo":I
    check-cast v7, Ljava/util/List;

    .line 97
    nop

    .line 30
    .end local v5    # "$this$filter$iv":[Ljava/lang/Object;
    .end local v6    # "$i$f$filter":I
    nop

    .line 31
    .local v7, "cachedFolders":Ljava/util/List;
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v3}, Lcom/rajat/pdfviewer/util/CachePolicy;->getMaxRetainedDocuments()I

    move-result v6

    sub-int/2addr v5, v6

    .line 32
    .local v5, "overflowCount":I
    if-gtz v5, :cond_4

    return-void

    .line 34
    :cond_4
    move-object v6, v7

    check-cast v6, Ljava/lang/Iterable;

    .line 35
    nop

    .local v6, "$this$filter$iv":Ljava/lang/Iterable;
    const/4 v8, 0x0

    .line 100
    .local v8, "$i$f$filter":I
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    check-cast v9, Ljava/util/Collection;

    .local v9, "destination$iv$iv":Ljava/util/Collection;
    move-object v10, v6

    .local v10, "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    const/4 v11, 0x0

    .line 101
    .local v11, "$i$f$filterTo":I
    invoke-interface {v10}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_6

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    .local v13, "element$iv$iv":Ljava/lang/Object;
    move-object v14, v13

    check-cast v14, Ljava/io/File;

    .local v14, "it":Ljava/io/File;
    const/4 v15, 0x0

    .line 35
    .local v15, "$i$a$-filter-CacheHelper$applyDocumentRetention$1":I
    invoke-virtual {v14}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    .line 101
    .end local v14    # "it":Ljava/io/File;
    .end local v15    # "$i$a$-filter-CacheHelper$applyDocumentRetention$1":I
    if-nez v1, :cond_5

    invoke-interface {v9, v13}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_5
    move-object/from16 v2, p0

    move-object/from16 v1, p2

    goto :goto_1

    .line 102
    .end local v13    # "element$iv$iv":Ljava/lang/Object;
    :cond_6
    nop

    .end local v9    # "destination$iv$iv":Ljava/util/Collection;
    .end local v10    # "$this$filterTo$iv$iv":Ljava/lang/Iterable;
    .end local v11    # "$i$f$filterTo":I
    move-object v1, v9

    check-cast v1, Ljava/util/List;

    .line 100
    nop

    .end local v6    # "$this$filter$iv":Ljava/lang/Iterable;
    .end local v8    # "$i$f$filter":I
    check-cast v1, Ljava/lang/Iterable;

    .line 36
    nop

    .local v1, "$this$sortedBy$iv":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 103
    .local v2, "$i$f$sortedBy":I
    new-instance v6, Lcom/rajat/pdfviewer/util/CacheHelper$applyDocumentRetention$$inlined$sortedBy$1;

    invoke-direct {v6}, Lcom/rajat/pdfviewer/util/CacheHelper$applyDocumentRetention$$inlined$sortedBy$1;-><init>()V

    check-cast v6, Ljava/util/Comparator;

    invoke-static {v1, v6}, Lkotlin/collections/CollectionsKt;->sortedWith(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v1

    .end local v1    # "$this$sortedBy$iv":Ljava/lang/Iterable;
    .end local v2    # "$i$f$sortedBy":I
    check-cast v1, Ljava/lang/Iterable;

    .line 37
    invoke-static {v1, v5}, Lkotlin/collections/CollectionsKt;->take(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    .line 38
    nop

    .local v1, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 104
    .local v2, "$i$f$forEach":I
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_7

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .local v8, "element$iv":Ljava/lang/Object;
    move-object v9, v8

    check-cast v9, Ljava/io/File;

    .local v9, "file":Ljava/io/File;
    const/4 v10, 0x0

    .line 39
    .local v10, "$i$a$-forEach-CacheHelper$applyDocumentRetention$3":I
    sget-object v11, Lcom/rajat/pdfviewer/util/CacheHelper;->INSTANCE:Lcom/rajat/pdfviewer/util/CacheHelper;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v13, 0x5b

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "] Evicting cached folder: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/rajat/pdfviewer/util/CacheHelper;->logDebug(Ljava/lang/String;)V

    .line 40
    invoke-static {v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {v9}, Lkotlin/io/FilesKt;->deleteRecursively(Ljava/io/File;)Z

    .line 41
    nop

    .line 104
    .end local v9    # "file":Ljava/io/File;
    .end local v10    # "$i$a$-forEach-CacheHelper$applyDocumentRetention$3":I
    nop

    .end local v8    # "element$iv":Ljava/lang/Object;
    goto :goto_2

    .line 105
    :cond_7
    nop

    .line 42
    .end local v1    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v2    # "$i$f$forEach":I
    return-void

    .line 30
    .end local v5    # "overflowCount":I
    .end local v7    # "cachedFolders":Ljava/util/List;
    :cond_8
    return-void
.end method

.method public final cleanupTransientDocument$pdfViewer_release(Ljava/io/File;)V
    .locals 6
    .param p1, "file"    # Ljava/io/File;

    const-string v0, "file"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    :try_start_0
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object v0, p0

    check-cast v0, Lcom/rajat/pdfviewer/util/CacheHelper;

    .local v0, "$this$cleanupTransientDocument_u24lambda_u244":Lcom/rajat/pdfviewer/util/CacheHelper;
    const/4 v1, 0x0

    .line 46
    .local v1, "$i$a$-runCatching-CacheHelper$cleanupTransientDocument$1":I
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 47
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 49
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    if-nez v2, :cond_1

    return-void

    .line 50
    .local v2, "parent":Ljava/io/File;
    :cond_1
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    const/4 v4, 0x1

    if-eqz v3, :cond_4

    array-length v3, v3

    const/4 v5, 0x0

    if-nez v3, :cond_2

    move v3, v4

    goto :goto_0

    :cond_2
    move v3, v5

    :goto_0
    if-eqz v3, :cond_3

    goto :goto_1

    :cond_3
    move v4, v5

    :cond_4
    :goto_1
    if-eqz v4, :cond_5

    .line 51
    invoke-static {v2}, Lkotlin/io/FilesKt;->deleteRecursively(Ljava/io/File;)Z

    .line 53
    :cond_5
    nop

    .end local v0    # "$this$cleanupTransientDocument_u24lambda_u244":Lcom/rajat/pdfviewer/util/CacheHelper;
    .end local v1    # "$i$a$-runCatching-CacheHelper$cleanupTransientDocument$1":I
    .end local v2    # "parent":Ljava/io/File;
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 45
    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    :goto_2
    return-void
.end method

.method public final getCacheKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "source"    # Ljava/lang/String;

    const-string/jumbo v0, "source"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 67
    const/4 v0, 0x2

    const/4 v1, 0x0

    const-string v2, "http"

    const/4 v3, 0x0

    invoke-static {p1, v2, v3, v0, v1}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "url_"

    goto :goto_0

    :cond_0
    const-string v0, "file_"

    .line 68
    .local v0, "prefix":Ljava/lang/String;
    :goto_0
    invoke-direct {p0, p1}, Lcom/rajat/pdfviewer/util/CacheHelper;->sha256(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 69
    .local v1, "hash":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public final getRemoteDocumentCacheKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    const-string/jumbo v0, "url"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Lcom/rajat/pdfviewer/util/CacheHelper;->getCacheKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".pdf"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getRemoteDocumentCacheKey(Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "cacheStrategy"    # Lcom/rajat/pdfviewer/util/CacheStrategy;
    .param p3, "sessionToken"    # Ljava/lang/String;

    const-string/jumbo v0, "url"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cacheStrategy"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "sessionToken"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 84
    sget-object v0, Lcom/rajat/pdfviewer/util/CachePolicy;->Companion:Lcom/rajat/pdfviewer/util/CachePolicy$Companion;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v0, p2, v3, v1, v2}, Lcom/rajat/pdfviewer/util/CachePolicy$Companion;->from$default(Lcom/rajat/pdfviewer/util/CachePolicy$Companion;Lcom/rajat/pdfviewer/util/CacheStrategy;IILjava/lang/Object;)Lcom/rajat/pdfviewer/util/CachePolicy;

    move-result-object v0

    .line 85
    .local v0, "cachePolicy":Lcom/rajat/pdfviewer/util/CachePolicy;
    invoke-virtual {v0}, Lcom/rajat/pdfviewer/util/CachePolicy;->getPersistRemoteFile()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 86
    invoke-virtual {p0, p1}, Lcom/rajat/pdfviewer/util/CacheHelper;->getRemoteDocumentCacheKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 88
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "session_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x23

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/rajat/pdfviewer/util/CacheHelper;->sha256(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".pdf"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public final handleCacheStrategy(Ljava/lang/String;Ljava/io/File;Lcom/rajat/pdfviewer/util/CacheStrategy;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 7
    .param p1, "origin"    # Ljava/lang/String;
    .param p2, "cacheDir"    # Ljava/io/File;
    .param p3, "cacheStrategy"    # Lcom/rajat/pdfviewer/util/CacheStrategy;
    .param p4, "maxCachedPdfs"    # I
    .param p5, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/io/File;",
            "Lcom/rajat/pdfviewer/util/CacheStrategy;",
            "I",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 17
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v0

    check-cast v0, Lkotlin/coroutines/CoroutineContext;

    new-instance v1, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;

    const/4 v6, 0x0

    move-object v4, p1

    move-object v5, p2

    move-object v2, p3

    move v3, p4

    .end local p1    # "origin":Ljava/lang/String;
    .end local p2    # "cacheDir":Ljava/io/File;
    .end local p3    # "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .end local p4    # "maxCachedPdfs":I
    .local v2, "cacheStrategy":Lcom/rajat/pdfviewer/util/CacheStrategy;
    .local v3, "maxCachedPdfs":I
    .local v4, "origin":Ljava/lang/String;
    .local v5, "cacheDir":Ljava/io/File;
    invoke-direct/range {v1 .. v6}, Lcom/rajat/pdfviewer/util/CacheHelper$handleCacheStrategy$2;-><init>(Lcom/rajat/pdfviewer/util/CacheStrategy;ILjava/lang/String;Ljava/io/File;Lkotlin/coroutines/Continuation;)V

    check-cast v1, Lkotlin/jvm/functions/Function2;

    invoke-static {v0, v1, p5}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p2

    if-ne p1, p2, :cond_0

    return-object p1

    :cond_0
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 21
    return-object p1
.end method
