.class public final Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;
.super Ljava/lang/Object;
.source "CommonUtils.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rajat/pdfviewer/util/CommonUtils$Companion;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "BitmapPool"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\u000b\u001a\u00020\u0008H\u0002J \u0010\u000c\u001a\u00020\u00062\u0006\u0010\r\u001a\u00020\u00082\u0006\u0010\u000e\u001a\u00020\u00082\u0008\u0008\u0002\u0010\u000f\u001a\u00020\u0010J\u000e\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0006R\u0014\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0007\u001a\u00020\u00088BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\t\u0010\n\u00a8\u0006\u0014"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;",
        "",
        "<init>",
        "()V",
        "pool",
        "Ljava/util/LinkedList;",
        "Landroid/graphics/Bitmap;",
        "maxPoolSize",
        "",
        "getMaxPoolSize",
        "()I",
        "calculateMaxPoolSize",
        "getBitmap",
        "width",
        "height",
        "config",
        "Landroid/graphics/Bitmap$Config;",
        "recycleBitmap",
        "",
        "bitmap",
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

.field public static final INSTANCE:Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;

.field private static final pool:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;

    invoke-direct {v0}, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;-><init>()V

    sput-object v0, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->INSTANCE:Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;

    .line 13
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->pool:Ljava/util/LinkedList;

    const/16 v0, 0x8

    sput v0, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->$stable:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final calculateMaxPoolSize()I
    .locals 4

    .line 20
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v0

    const-wide/16 v2, 0x400

    div-long/2addr v0, v2

    .line 21
    .local v0, "maxMemory":J
    const-wide/16 v2, 0x5000

    div-long v2, v0, v2

    long-to-int v2, v2

    return v2
.end method

.method public static synthetic getBitmap$default(Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;IILandroid/graphics/Bitmap$Config;ILjava/lang/Object;)Landroid/graphics/Bitmap;
    .locals 0

    .line 24
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    sget-object p3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->getBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method private final getMaxPoolSize()I
    .locals 1

    .line 15
    invoke-direct {p0}, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->calculateMaxPoolSize()I

    move-result v0

    return v0
.end method


# virtual methods
.method public final getBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    .locals 5
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "config"    # Landroid/graphics/Bitmap$Config;

    const-string v0, "config"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    sget-object v0, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->pool:Ljava/util/LinkedList;

    monitor-enter v0

    const/4 v1, 0x0

    .line 26
    .local v1, "$i$a$-synchronized-CommonUtils$Companion$BitmapPool$getBitmap$1":I
    :try_start_0
    sget-object v2, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->pool:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const-string v3, "iterator(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    .local v2, "iterator":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 28
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    const-string/jumbo v4, "next(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v3, Landroid/graphics/Bitmap;

    .line 29
    .local v3, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    if-ne v4, p1, :cond_0

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    if-ne v4, p2, :cond_0

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v4

    if-ne v4, p3, :cond_0

    .line 30
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    .line 31
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/graphics/Bitmap;->eraseColor(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    nop

    .end local v1    # "$i$a$-synchronized-CommonUtils$Companion$BitmapPool$getBitmap$1":I
    .end local v2    # "iterator":Ljava/util/Iterator;
    .end local v3    # "bitmap":Landroid/graphics/Bitmap;
    monitor-exit v0

    return-object v3

    .line 35
    .restart local v1    # "$i$a$-synchronized-CommonUtils$Companion$BitmapPool$getBitmap$1":I
    .restart local v2    # "iterator":Ljava/util/Iterator;
    :cond_1
    nop

    .end local v1    # "$i$a$-synchronized-CommonUtils$Companion$BitmapPool$getBitmap$1":I
    .end local v2    # "iterator":Ljava/util/Iterator;
    :try_start_1
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    monitor-exit v0

    .line 37
    invoke-static {p1, p2, p3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    const-string v1, "createBitmap(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0

    .line 25
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public final recycleBitmap(Landroid/graphics/Bitmap;)V
    .locals 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    const-string v0, "bitmap"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 42
    sget-object v0, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->pool:Ljava/util/LinkedList;

    monitor-enter v0

    const/4 v1, 0x0

    .line 44
    .local v1, "$i$a$-synchronized-CommonUtils$Companion$BitmapPool$recycleBitmap$1":I
    :try_start_0
    sget-object v2, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->pool:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    sget-object v3, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->INSTANCE:Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;

    invoke-direct {v3}, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->getMaxPoolSize()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 45
    sget-object v2, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->pool:Ljava/util/LinkedList;

    invoke-virtual {v2, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    goto :goto_0

    .line 48
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    :goto_0
    nop

    .line 42
    .end local v1    # "$i$a$-synchronized-CommonUtils$Companion$BitmapPool$recycleBitmap$1":I
    monitor-exit v0

    goto :goto_1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1

    .line 52
    :cond_1
    :goto_1
    return-void
.end method
