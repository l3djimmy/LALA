.class public abstract Lcom/hardlineforge/lala/data/AppDatabase;
.super Landroidx/room/RoomDatabase;
.source "AppDatabase.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\'\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\u0004\u001a\u00020\u0005H&J\u0008\u0010\u0006\u001a\u00020\u0007H&J\u0008\u0010\u0008\u001a\u00020\tH&J\u0008\u0010\n\u001a\u00020\u000bH&J\u0008\u0010\u000c\u001a\u00020\rH&J\u0008\u0010\u000e\u001a\u00020\u000fH&\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/hardlineforge/lala/data/AppDatabase;",
        "Landroidx/room/RoomDatabase;",
        "<init>",
        "()V",
        "logEntryDao",
        "Lcom/hardlineforge/lala/data/LogEntryDao;",
        "photoDao",
        "Lcom/hardlineforge/lala/data/PhotoDao;",
        "videoDao",
        "Lcom/hardlineforge/lala/data/VideoDao;",
        "videoFrameDao",
        "Lcom/hardlineforge/lala/data/VideoFrameDao;",
        "editHistoryDao",
        "Lcom/hardlineforge/lala/data/EditHistoryDao;",
        "customCategoryDao",
        "Lcom/hardlineforge/lala/data/CustomCategoryDao;",
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


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/hardlineforge/lala/data/AppDatabase;->$stable:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Landroidx/room/RoomDatabase;-><init>()V

    .line 9
    return-void
.end method


# virtual methods
.method public abstract customCategoryDao()Lcom/hardlineforge/lala/data/CustomCategoryDao;
.end method

.method public abstract editHistoryDao()Lcom/hardlineforge/lala/data/EditHistoryDao;
.end method

.method public abstract logEntryDao()Lcom/hardlineforge/lala/data/LogEntryDao;
.end method

.method public abstract photoDao()Lcom/hardlineforge/lala/data/PhotoDao;
.end method

.method public abstract videoDao()Lcom/hardlineforge/lala/data/VideoDao;
.end method

.method public abstract videoFrameDao()Lcom/hardlineforge/lala/data/VideoFrameDao;
.end method
