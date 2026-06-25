.class public final Lcom/rajat/pdfviewer/util/CachePolicy;
.super Ljava/lang/Object;
.source "CachePolicy.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rajat/pdfviewer/util/CachePolicy$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0018\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0008\u0081\u0008\u0018\u0000  2\u00020\u0001:\u0001 B7\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\u0006\u0010\u0008\u001a\u00020\u0003\u0012\u0006\u0010\t\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0015\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0016\u001a\u00020\u0006H\u00c6\u0003J\t\u0010\u0017\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0018\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0019\u001a\u00020\u0003H\u00c6\u0003JE\u0010\u001a\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u00032\u0008\u0008\u0002\u0010\t\u001a\u00020\u0003H\u00c6\u0001J\u0013\u0010\u001b\u001a\u00020\u00032\u0008\u0010\u001c\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u001d\u001a\u00020\u0006H\u00d6\u0001J\t\u0010\u001e\u001a\u00020\u001fH\u00d6\u0001R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\rR\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010R\u0011\u0010\u0007\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\rR\u0011\u0010\u0008\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\rR\u0011\u0010\t\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\r\u00a8\u0006!"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/util/CachePolicy;",
        "",
        "reuseRemoteFile",
        "",
        "persistRemoteFile",
        "maxRetainedDocuments",
        "",
        "useMemoryBitmapCache",
        "useDiskBitmapCache",
        "enablePrefetch",
        "<init>",
        "(ZZIZZZ)V",
        "getReuseRemoteFile",
        "()Z",
        "getPersistRemoteFile",
        "getMaxRetainedDocuments",
        "()I",
        "getUseMemoryBitmapCache",
        "getUseDiskBitmapCache",
        "getEnablePrefetch",
        "component1",
        "component2",
        "component3",
        "component4",
        "component5",
        "component6",
        "copy",
        "equals",
        "other",
        "hashCode",
        "toString",
        "",
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

.field public static final Companion:Lcom/rajat/pdfviewer/util/CachePolicy$Companion;


# instance fields
.field private final enablePrefetch:Z

.field private final maxRetainedDocuments:I

.field private final persistRemoteFile:Z

.field private final reuseRemoteFile:Z

.field private final useDiskBitmapCache:Z

.field private final useMemoryBitmapCache:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/rajat/pdfviewer/util/CachePolicy$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/rajat/pdfviewer/util/CachePolicy$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/rajat/pdfviewer/util/CachePolicy;->Companion:Lcom/rajat/pdfviewer/util/CachePolicy$Companion;

    return-void
.end method

.method public constructor <init>(ZZIZZZ)V
    .locals 0
    .param p1, "reuseRemoteFile"    # Z
    .param p2, "persistRemoteFile"    # Z
    .param p3, "maxRetainedDocuments"    # I
    .param p4, "useMemoryBitmapCache"    # Z
    .param p5, "useDiskBitmapCache"    # Z
    .param p6, "enablePrefetch"    # Z

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    iput-boolean p1, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->reuseRemoteFile:Z

    .line 7
    iput-boolean p2, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->persistRemoteFile:Z

    .line 8
    iput p3, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->maxRetainedDocuments:I

    .line 9
    iput-boolean p4, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->useMemoryBitmapCache:Z

    .line 10
    iput-boolean p5, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->useDiskBitmapCache:Z

    .line 11
    iput-boolean p6, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->enablePrefetch:Z

    .line 5
    return-void
.end method

.method public static synthetic copy$default(Lcom/rajat/pdfviewer/util/CachePolicy;ZZIZZZILjava/lang/Object;)Lcom/rajat/pdfviewer/util/CachePolicy;
    .locals 0

    and-int/lit8 p8, p7, 0x1

    if-eqz p8, :cond_0

    iget-boolean p1, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->reuseRemoteFile:Z

    :cond_0
    and-int/lit8 p8, p7, 0x2

    if-eqz p8, :cond_1

    iget-boolean p2, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->persistRemoteFile:Z

    :cond_1
    and-int/lit8 p8, p7, 0x4

    if-eqz p8, :cond_2

    iget p3, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->maxRetainedDocuments:I

    :cond_2
    and-int/lit8 p8, p7, 0x8

    if-eqz p8, :cond_3

    iget-boolean p4, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->useMemoryBitmapCache:Z

    :cond_3
    and-int/lit8 p8, p7, 0x10

    if-eqz p8, :cond_4

    iget-boolean p5, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->useDiskBitmapCache:Z

    :cond_4
    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_5

    iget-boolean p6, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->enablePrefetch:Z

    :cond_5
    move p7, p5

    move p8, p6

    move p5, p3

    move p6, p4

    move p3, p1

    move p4, p2

    move-object p2, p0

    invoke-virtual/range {p2 .. p8}, Lcom/rajat/pdfviewer/util/CachePolicy;->copy(ZZIZZZ)Lcom/rajat/pdfviewer/util/CachePolicy;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Z
    .locals 1

    iget-boolean v0, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->reuseRemoteFile:Z

    return v0
.end method

.method public final component2()Z
    .locals 1

    iget-boolean v0, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->persistRemoteFile:Z

    return v0
.end method

.method public final component3()I
    .locals 1

    iget v0, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->maxRetainedDocuments:I

    return v0
.end method

.method public final component4()Z
    .locals 1

    iget-boolean v0, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->useMemoryBitmapCache:Z

    return v0
.end method

.method public final component5()Z
    .locals 1

    iget-boolean v0, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->useDiskBitmapCache:Z

    return v0
.end method

.method public final component6()Z
    .locals 1

    iget-boolean v0, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->enablePrefetch:Z

    return v0
.end method

.method public final copy(ZZIZZZ)Lcom/rajat/pdfviewer/util/CachePolicy;
    .locals 7

    new-instance v0, Lcom/rajat/pdfviewer/util/CachePolicy;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/rajat/pdfviewer/util/CachePolicy;-><init>(ZZIZZZ)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/rajat/pdfviewer/util/CachePolicy;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/rajat/pdfviewer/util/CachePolicy;

    iget-boolean v3, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->reuseRemoteFile:Z

    iget-boolean v4, v1, Lcom/rajat/pdfviewer/util/CachePolicy;->reuseRemoteFile:Z

    if-eq v3, v4, :cond_2

    return v2

    :cond_2
    iget-boolean v3, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->persistRemoteFile:Z

    iget-boolean v4, v1, Lcom/rajat/pdfviewer/util/CachePolicy;->persistRemoteFile:Z

    if-eq v3, v4, :cond_3

    return v2

    :cond_3
    iget v3, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->maxRetainedDocuments:I

    iget v4, v1, Lcom/rajat/pdfviewer/util/CachePolicy;->maxRetainedDocuments:I

    if-eq v3, v4, :cond_4

    return v2

    :cond_4
    iget-boolean v3, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->useMemoryBitmapCache:Z

    iget-boolean v4, v1, Lcom/rajat/pdfviewer/util/CachePolicy;->useMemoryBitmapCache:Z

    if-eq v3, v4, :cond_5

    return v2

    :cond_5
    iget-boolean v3, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->useDiskBitmapCache:Z

    iget-boolean v4, v1, Lcom/rajat/pdfviewer/util/CachePolicy;->useDiskBitmapCache:Z

    if-eq v3, v4, :cond_6

    return v2

    :cond_6
    iget-boolean v3, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->enablePrefetch:Z

    iget-boolean v1, v1, Lcom/rajat/pdfviewer/util/CachePolicy;->enablePrefetch:Z

    if-eq v3, v1, :cond_7

    return v2

    :cond_7
    return v0
.end method

.method public final getEnablePrefetch()Z
    .locals 1

    .line 11
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->enablePrefetch:Z

    return v0
.end method

.method public final getMaxRetainedDocuments()I
    .locals 1

    .line 8
    iget v0, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->maxRetainedDocuments:I

    return v0
.end method

.method public final getPersistRemoteFile()Z
    .locals 1

    .line 7
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->persistRemoteFile:Z

    return v0
.end method

.method public final getReuseRemoteFile()Z
    .locals 1

    .line 6
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->reuseRemoteFile:Z

    return v0
.end method

.method public final getUseDiskBitmapCache()Z
    .locals 1

    .line 10
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->useDiskBitmapCache:Z

    return v0
.end method

.method public final getUseMemoryBitmapCache()Z
    .locals 1

    .line 9
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->useMemoryBitmapCache:Z

    return v0
.end method

.method public hashCode()I
    .locals 3

    iget-boolean v0, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->reuseRemoteFile:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v1, v0, 0x1f

    iget-boolean v2, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->persistRemoteFile:Z

    invoke-static {v2}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget v2, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->maxRetainedDocuments:I

    invoke-static {v2}, Ljava/lang/Integer;->hashCode(I)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-boolean v2, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->useMemoryBitmapCache:Z

    invoke-static {v2}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-boolean v2, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->useDiskBitmapCache:Z

    invoke-static {v2}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-boolean v2, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->enablePrefetch:Z

    invoke-static {v2}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v2

    add-int/2addr v1, v2

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CachePolicy(reuseRemoteFile="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->reuseRemoteFile:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", persistRemoteFile="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->persistRemoteFile:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", maxRetainedDocuments="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->maxRetainedDocuments:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", useMemoryBitmapCache="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->useMemoryBitmapCache:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", useDiskBitmapCache="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->useDiskBitmapCache:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", enablePrefetch="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/rajat/pdfviewer/util/CachePolicy;->enablePrefetch:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
