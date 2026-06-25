.class public final Lcom/hardlineforge/lala/data/LogRepository;
.super Ljava/lang/Object;
.source "Repository.kt"


# annotations
.annotation runtime Ljavax/inject/Singleton;
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u008e\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001B\u0011\u0008\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0012\u0010\u0012\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00150\u00140\u0013J\u001a\u0010\u0016\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00150\u00140\u00132\u0006\u0010\u0017\u001a\u00020\u0018J\u001a\u0010\u0019\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00150\u00140\u00132\u0006\u0010\u001a\u001a\u00020\u0018J\"\u0010\u001b\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00150\u00140\u00132\u0006\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u001dJ\u0018\u0010\u001f\u001a\u0004\u0018\u00010\u00152\u0006\u0010 \u001a\u00020\u0018H\u0086@\u00a2\u0006\u0002\u0010!J\u0016\u0010\"\u001a\u00020#2\u0006\u0010$\u001a\u00020\u0015H\u0086@\u00a2\u0006\u0002\u0010%J\u0016\u0010&\u001a\u00020\'2\u0006\u0010$\u001a\u00020\u0015H\u0086@\u00a2\u0006\u0002\u0010%J\u0016\u0010(\u001a\u00020\'2\u0006\u0010$\u001a\u00020\u0015H\u0086@\u00a2\u0006\u0002\u0010%J\u0016\u0010)\u001a\u00020\'2\u0006\u0010 \u001a\u00020\u0018H\u0086@\u00a2\u0006\u0002\u0010!J\u001c\u0010*\u001a\u0008\u0012\u0004\u0012\u00020+0\u00142\u0006\u0010,\u001a\u00020\u0018H\u0086@\u00a2\u0006\u0002\u0010!J\u0016\u0010-\u001a\u00020\'2\u0006\u0010.\u001a\u00020+H\u0086@\u00a2\u0006\u0002\u0010/J\u0016\u00100\u001a\u00020\'2\u0006\u0010.\u001a\u00020+H\u0086@\u00a2\u0006\u0002\u0010/J\u001c\u00101\u001a\u0008\u0012\u0004\u0012\u0002020\u00142\u0006\u0010,\u001a\u00020\u0018H\u0086@\u00a2\u0006\u0002\u0010!J\u0018\u00103\u001a\u0004\u0018\u0001022\u0006\u0010 \u001a\u00020\u0018H\u0086@\u00a2\u0006\u0002\u0010!J\u0016\u00104\u001a\u00020\'2\u0006\u00105\u001a\u000202H\u0086@\u00a2\u0006\u0002\u00106J\u0016\u00107\u001a\u00020\'2\u0006\u00105\u001a\u000202H\u0086@\u00a2\u0006\u0002\u00106J\u001c\u00108\u001a\u0008\u0012\u0004\u0012\u0002090\u00142\u0006\u0010:\u001a\u00020\u0018H\u0086@\u00a2\u0006\u0002\u0010!J\u0016\u0010;\u001a\u00020\'2\u0006\u0010<\u001a\u000209H\u0086@\u00a2\u0006\u0002\u0010=J\u0016\u0010>\u001a\u00020\'2\u0006\u0010:\u001a\u00020\u0018H\u0086@\u00a2\u0006\u0002\u0010!J\u001c\u0010?\u001a\u0008\u0012\u0004\u0012\u00020@0\u00142\u0006\u0010,\u001a\u00020\u0018H\u0086@\u00a2\u0006\u0002\u0010!J\u0016\u0010A\u001a\u00020\'2\u0006\u0010B\u001a\u00020@H\u0086@\u00a2\u0006\u0002\u0010CJ\u0012\u0010D\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020E0\u00140\u0013J\u0016\u0010F\u001a\u00020\'2\u0006\u0010\u0017\u001a\u00020EH\u0086@\u00a2\u0006\u0002\u0010GJ\u0016\u0010H\u001a\u00020\'2\u0006\u0010\u0017\u001a\u00020EH\u0086@\u00a2\u0006\u0002\u0010GR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006I"
    }
    d2 = {
        "Lcom/hardlineforge/lala/data/LogRepository;",
        "",
        "db",
        "Lcom/hardlineforge/lala/data/AppDatabase;",
        "<init>",
        "(Lcom/hardlineforge/lala/data/AppDatabase;)V",
        "entryDao",
        "Lcom/hardlineforge/lala/data/LogEntryDao;",
        "photoDao",
        "Lcom/hardlineforge/lala/data/PhotoDao;",
        "videoDao",
        "Lcom/hardlineforge/lala/data/VideoDao;",
        "frameDao",
        "Lcom/hardlineforge/lala/data/VideoFrameDao;",
        "editDao",
        "Lcom/hardlineforge/lala/data/EditHistoryDao;",
        "categoryDao",
        "Lcom/hardlineforge/lala/data/CustomCategoryDao;",
        "getAllEntries",
        "Lkotlinx/coroutines/flow/Flow;",
        "",
        "Lcom/hardlineforge/lala/data/LogEntry;",
        "getEntriesByCategory",
        "category",
        "",
        "searchEntries",
        "query",
        "getEntriesByDateRange",
        "start",
        "Ljava/time/Instant;",
        "end",
        "getEntryById",
        "id",
        "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "insertEntry",
        "",
        "entry",
        "(Lcom/hardlineforge/lala/data/LogEntry;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "updateEntry",
        "",
        "deleteEntry",
        "deleteEntryById",
        "getPhotos",
        "Lcom/hardlineforge/lala/data/Photo;",
        "entryId",
        "insertPhoto",
        "photo",
        "(Lcom/hardlineforge/lala/data/Photo;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "deletePhoto",
        "getVideos",
        "Lcom/hardlineforge/lala/data/Video;",
        "getVideoById",
        "insertVideo",
        "video",
        "(Lcom/hardlineforge/lala/data/Video;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "deleteVideo",
        "getVideoFrames",
        "Lcom/hardlineforge/lala/data/VideoFrame;",
        "videoId",
        "insertVideoFrame",
        "frame",
        "(Lcom/hardlineforge/lala/data/VideoFrame;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "deleteVideoFrames",
        "getEditHistory",
        "Lcom/hardlineforge/lala/data/EditHistory;",
        "insertEditHistory",
        "history",
        "(Lcom/hardlineforge/lala/data/EditHistory;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "getCustomCategories",
        "Lcom/hardlineforge/lala/data/CustomCategory;",
        "insertCustomCategory",
        "(Lcom/hardlineforge/lala/data/CustomCategory;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "deleteCustomCategory",
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
.field private final categoryDao:Lcom/hardlineforge/lala/data/CustomCategoryDao;

.field private final db:Lcom/hardlineforge/lala/data/AppDatabase;

.field private final editDao:Lcom/hardlineforge/lala/data/EditHistoryDao;

.field private final entryDao:Lcom/hardlineforge/lala/data/LogEntryDao;

.field private final frameDao:Lcom/hardlineforge/lala/data/VideoFrameDao;

.field private final photoDao:Lcom/hardlineforge/lala/data/PhotoDao;

.field private final videoDao:Lcom/hardlineforge/lala/data/VideoDao;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/hardlineforge/lala/data/LogRepository;->$stable:I

    return-void
.end method

.method public constructor <init>(Lcom/hardlineforge/lala/data/AppDatabase;)V
    .locals 1
    .param p1, "db"    # Lcom/hardlineforge/lala/data/AppDatabase;
    .annotation runtime Ljavax/inject/Inject;
    .end annotation

    const-string v0, "db"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/hardlineforge/lala/data/LogRepository;->db:Lcom/hardlineforge/lala/data/AppDatabase;

    .line 12
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->db:Lcom/hardlineforge/lala/data/AppDatabase;

    invoke-virtual {v0}, Lcom/hardlineforge/lala/data/AppDatabase;->logEntryDao()Lcom/hardlineforge/lala/data/LogEntryDao;

    move-result-object v0

    iput-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->entryDao:Lcom/hardlineforge/lala/data/LogEntryDao;

    .line 13
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->db:Lcom/hardlineforge/lala/data/AppDatabase;

    invoke-virtual {v0}, Lcom/hardlineforge/lala/data/AppDatabase;->photoDao()Lcom/hardlineforge/lala/data/PhotoDao;

    move-result-object v0

    iput-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->photoDao:Lcom/hardlineforge/lala/data/PhotoDao;

    .line 14
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->db:Lcom/hardlineforge/lala/data/AppDatabase;

    invoke-virtual {v0}, Lcom/hardlineforge/lala/data/AppDatabase;->videoDao()Lcom/hardlineforge/lala/data/VideoDao;

    move-result-object v0

    iput-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->videoDao:Lcom/hardlineforge/lala/data/VideoDao;

    .line 15
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->db:Lcom/hardlineforge/lala/data/AppDatabase;

    invoke-virtual {v0}, Lcom/hardlineforge/lala/data/AppDatabase;->videoFrameDao()Lcom/hardlineforge/lala/data/VideoFrameDao;

    move-result-object v0

    iput-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->frameDao:Lcom/hardlineforge/lala/data/VideoFrameDao;

    .line 16
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->db:Lcom/hardlineforge/lala/data/AppDatabase;

    invoke-virtual {v0}, Lcom/hardlineforge/lala/data/AppDatabase;->editHistoryDao()Lcom/hardlineforge/lala/data/EditHistoryDao;

    move-result-object v0

    iput-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->editDao:Lcom/hardlineforge/lala/data/EditHistoryDao;

    .line 17
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->db:Lcom/hardlineforge/lala/data/AppDatabase;

    invoke-virtual {v0}, Lcom/hardlineforge/lala/data/AppDatabase;->customCategoryDao()Lcom/hardlineforge/lala/data/CustomCategoryDao;

    move-result-object v0

    iput-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->categoryDao:Lcom/hardlineforge/lala/data/CustomCategoryDao;

    .line 9
    return-void
.end method


# virtual methods
.method public final deleteCustomCategory(Lcom/hardlineforge/lala/data/CustomCategory;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .param p1, "category"    # Lcom/hardlineforge/lala/data/CustomCategory;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/CustomCategory;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 56
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->categoryDao:Lcom/hardlineforge/lala/data/CustomCategoryDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/CustomCategoryDao;->delete(Lcom/hardlineforge/lala/data/CustomCategory;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final deleteEntry(Lcom/hardlineforge/lala/data/LogEntry;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .param p1, "entry"    # Lcom/hardlineforge/lala/data/LogEntry;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 34
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->entryDao:Lcom/hardlineforge/lala/data/LogEntryDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/LogEntryDao;->delete(Lcom/hardlineforge/lala/data/LogEntry;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final deleteEntryById(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 35
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->entryDao:Lcom/hardlineforge/lala/data/LogEntryDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/LogEntryDao;->deleteById(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final deletePhoto(Lcom/hardlineforge/lala/data/Photo;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .param p1, "photo"    # Lcom/hardlineforge/lala/data/Photo;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/Photo;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 39
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->photoDao:Lcom/hardlineforge/lala/data/PhotoDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/PhotoDao;->delete(Lcom/hardlineforge/lala/data/Photo;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final deleteVideo(Lcom/hardlineforge/lala/data/Video;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .param p1, "video"    # Lcom/hardlineforge/lala/data/Video;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/Video;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 44
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->videoDao:Lcom/hardlineforge/lala/data/VideoDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/VideoDao;->delete(Lcom/hardlineforge/lala/data/Video;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final deleteVideoFrames(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .param p1, "videoId"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 48
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->frameDao:Lcom/hardlineforge/lala/data/VideoFrameDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/VideoFrameDao;->deleteByVideoId(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final getAllEntries()Lkotlinx/coroutines/flow/Flow;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlinx/coroutines/flow/Flow<",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;>;"
        }
    .end annotation

    .line 19
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->entryDao:Lcom/hardlineforge/lala/data/LogEntryDao;

    invoke-interface {v0}, Lcom/hardlineforge/lala/data/LogEntryDao;->getAll()Lkotlinx/coroutines/flow/Flow;

    move-result-object v0

    return-object v0
.end method

.method public final getCustomCategories()Lkotlinx/coroutines/flow/Flow;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlinx/coroutines/flow/Flow<",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/CustomCategory;",
            ">;>;"
        }
    .end annotation

    .line 54
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->categoryDao:Lcom/hardlineforge/lala/data/CustomCategoryDao;

    invoke-interface {v0}, Lcom/hardlineforge/lala/data/CustomCategoryDao;->getAll()Lkotlinx/coroutines/flow/Flow;

    move-result-object v0

    return-object v0
.end method

.method public final getEditHistory(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p1, "entryId"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/EditHistory;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 51
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->editDao:Lcom/hardlineforge/lala/data/EditHistoryDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/EditHistoryDao;->getByEntryId(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final getEntriesByCategory(Ljava/lang/String;)Lkotlinx/coroutines/flow/Flow;
    .locals 1
    .param p1, "category"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lkotlinx/coroutines/flow/Flow<",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;>;"
        }
    .end annotation

    const-string v0, "category"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->entryDao:Lcom/hardlineforge/lala/data/LogEntryDao;

    invoke-interface {v0, p1}, Lcom/hardlineforge/lala/data/LogEntryDao;->getByCategory(Ljava/lang/String;)Lkotlinx/coroutines/flow/Flow;

    move-result-object v0

    return-object v0
.end method

.method public final getEntriesByDateRange(Ljava/time/Instant;Ljava/time/Instant;)Lkotlinx/coroutines/flow/Flow;
    .locals 1
    .param p1, "start"    # Ljava/time/Instant;
    .param p2, "end"    # Ljava/time/Instant;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/time/Instant;",
            "Ljava/time/Instant;",
            ")",
            "Lkotlinx/coroutines/flow/Flow<",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;>;"
        }
    .end annotation

    const-string v0, "start"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "end"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->entryDao:Lcom/hardlineforge/lala/data/LogEntryDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/LogEntryDao;->getByDateRange(Ljava/time/Instant;Ljava/time/Instant;)Lkotlinx/coroutines/flow/Flow;

    move-result-object v0

    return-object v0
.end method

.method public final getEntryById(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 30
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->entryDao:Lcom/hardlineforge/lala/data/LogEntryDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/LogEntryDao;->getById(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final getPhotos(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p1, "entryId"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/Photo;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 37
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->photoDao:Lcom/hardlineforge/lala/data/PhotoDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/PhotoDao;->getByEntryId(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final getVideoById(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/hardlineforge/lala/data/Video;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 42
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->videoDao:Lcom/hardlineforge/lala/data/VideoDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/VideoDao;->getById(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final getVideoFrames(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p1, "videoId"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/VideoFrame;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->frameDao:Lcom/hardlineforge/lala/data/VideoFrameDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/VideoFrameDao;->getByVideoId(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final getVideos(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p1, "entryId"    # Ljava/lang/String;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/Video;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 41
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->videoDao:Lcom/hardlineforge/lala/data/VideoDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/VideoDao;->getByEntryId(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final insertCustomCategory(Lcom/hardlineforge/lala/data/CustomCategory;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .param p1, "category"    # Lcom/hardlineforge/lala/data/CustomCategory;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/CustomCategory;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 55
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->categoryDao:Lcom/hardlineforge/lala/data/CustomCategoryDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/CustomCategoryDao;->insert(Lcom/hardlineforge/lala/data/CustomCategory;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final insertEditHistory(Lcom/hardlineforge/lala/data/EditHistory;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .param p1, "history"    # Lcom/hardlineforge/lala/data/EditHistory;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/EditHistory;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 52
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->editDao:Lcom/hardlineforge/lala/data/EditHistoryDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/EditHistoryDao;->insert(Lcom/hardlineforge/lala/data/EditHistory;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final insertEntry(Lcom/hardlineforge/lala/data/LogEntry;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p1, "entry"    # Lcom/hardlineforge/lala/data/LogEntry;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Ljava/lang/Long;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 32
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->entryDao:Lcom/hardlineforge/lala/data/LogEntryDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/LogEntryDao;->insert(Lcom/hardlineforge/lala/data/LogEntry;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final insertPhoto(Lcom/hardlineforge/lala/data/Photo;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .param p1, "photo"    # Lcom/hardlineforge/lala/data/Photo;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/Photo;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 38
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->photoDao:Lcom/hardlineforge/lala/data/PhotoDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/PhotoDao;->insert(Lcom/hardlineforge/lala/data/Photo;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final insertVideo(Lcom/hardlineforge/lala/data/Video;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .param p1, "video"    # Lcom/hardlineforge/lala/data/Video;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/Video;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 43
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->videoDao:Lcom/hardlineforge/lala/data/VideoDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/VideoDao;->insert(Lcom/hardlineforge/lala/data/Video;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final insertVideoFrame(Lcom/hardlineforge/lala/data/VideoFrame;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .param p1, "frame"    # Lcom/hardlineforge/lala/data/VideoFrame;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/VideoFrame;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 47
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->frameDao:Lcom/hardlineforge/lala/data/VideoFrameDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/VideoFrameDao;->insert(Lcom/hardlineforge/lala/data/VideoFrame;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final searchEntries(Ljava/lang/String;)Lkotlinx/coroutines/flow/Flow;
    .locals 1
    .param p1, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lkotlinx/coroutines/flow/Flow<",
            "Ljava/util/List<",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            ">;>;"
        }
    .end annotation

    const-string v0, "query"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->entryDao:Lcom/hardlineforge/lala/data/LogEntryDao;

    invoke-interface {v0, p1}, Lcom/hardlineforge/lala/data/LogEntryDao;->search(Ljava/lang/String;)Lkotlinx/coroutines/flow/Flow;

    move-result-object v0

    return-object v0
.end method

.method public final updateEntry(Lcom/hardlineforge/lala/data/LogEntry;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .param p1, "entry"    # Lcom/hardlineforge/lala/data/LogEntry;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/hardlineforge/lala/data/LogEntry;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 33
    iget-object v0, p0, Lcom/hardlineforge/lala/data/LogRepository;->entryDao:Lcom/hardlineforge/lala/data/LogEntryDao;

    invoke-interface {v0, p1, p2}, Lcom/hardlineforge/lala/data/LogEntryDao;->update(Lcom/hardlineforge/lala/data/LogEntry;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    return-object v0

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method
