.class public final Lcom/rajat/pdfviewer/util/CacheManager$createMemoryCache$1;
.super Landroid/util/LruCache;
.source "CacheManager.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/rajat/pdfviewer/util/CacheManager;->createMemoryCache()Landroid/util/LruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/LruCache<",
        "Ljava/lang/Integer;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0015\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001J\u0018\u0010\u0004\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0003H\u0014\u00a8\u0006\u0007"
    }
    d2 = {
        "com/rajat/pdfviewer/util/CacheManager$createMemoryCache$1",
        "Landroid/util/LruCache;",
        "",
        "Landroid/graphics/Bitmap;",
        "sizeOf",
        "key",
        "value",
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
.method constructor <init>(I)V
    .locals 0
    .param p1, "$cacheSize"    # I

    .line 49
    invoke-direct {p0, p1}, Landroid/util/LruCache;-><init>(I)V

    return-void
.end method


# virtual methods
.method protected sizeOf(ILandroid/graphics/Bitmap;)I
    .locals 1
    .param p1, "key"    # I
    .param p2, "value"    # Landroid/graphics/Bitmap;

    const-string/jumbo v0, "value"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 50
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v0

    div-int/lit16 v0, v0, 0x400

    return v0
.end method

.method public bridge synthetic sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 2
    .param p1, "p0"    # Ljava/lang/Object;
    .param p2, "p1"    # Ljava/lang/Object;

    .line 49
    move-object v0, p1

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    move-object v1, p2

    check-cast v1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0, v1}, Lcom/rajat/pdfviewer/util/CacheManager$createMemoryCache$1;->sizeOf(ILandroid/graphics/Bitmap;)I

    move-result v0

    return v0
.end method
