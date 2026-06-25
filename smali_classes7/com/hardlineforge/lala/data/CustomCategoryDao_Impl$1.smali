.class public final Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$1;
.super Landroidx/room/EntityInsertAdapter;
.source "CustomCategoryDao_Impl.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;-><init>(Landroidx/room/RoomDatabase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/room/EntityInsertAdapter<",
        "Lcom/hardlineforge/lala/data/CustomCategory;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000#\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002*\u0001\u0000\u0008\n\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001J\u0008\u0010\u0003\u001a\u00020\u0004H\u0014J\u0018\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\u0002H\u0014\u00a8\u0006\n"
    }
    d2 = {
        "com/hardlineforge/lala/data/CustomCategoryDao_Impl$1",
        "Landroidx/room/EntityInsertAdapter;",
        "Lcom/hardlineforge/lala/data/CustomCategory;",
        "createQuery",
        "",
        "bind",
        "",
        "statement",
        "Landroidx/sqlite/SQLiteStatement;",
        "entity",
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


# instance fields
.field final synthetic this$0:Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;)V
    .locals 0
    .param p1, "$receiver"    # Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;

    iput-object p1, p0, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$1;->this$0:Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;

    .line 37
    invoke-direct {p0}, Landroidx/room/EntityInsertAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method protected bind(Landroidx/sqlite/SQLiteStatement;Lcom/hardlineforge/lala/data/CustomCategory;)V
    .locals 4
    .param p1, "statement"    # Landroidx/sqlite/SQLiteStatement;
    .param p2, "entity"    # Lcom/hardlineforge/lala/data/CustomCategory;

    const-string v0, "statement"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "entity"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    const/4 v0, 0x1

    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/CustomCategory;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 42
    const/4 v0, 0x2

    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/CustomCategory;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 43
    iget-object v0, p0, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$1;->this$0:Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;

    invoke-static {v0}, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;->access$get__converters$p(Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl;)Lcom/hardlineforge/lala/data/Converters;

    move-result-object v0

    invoke-virtual {p2}, Lcom/hardlineforge/lala/data/CustomCategory;->getCreatedAt()Ljava/time/Instant;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/hardlineforge/lala/data/Converters;->fromInstant(Ljava/time/Instant;)Ljava/lang/Long;

    move-result-object v0

    .line 44
    .local v0, "_tmp":Ljava/lang/Long;
    const/4 v1, 0x3

    if-nez v0, :cond_0

    .line 45
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 47
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {p1, v1, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 49
    :goto_0
    return-void
.end method

.method public bridge synthetic bind(Landroidx/sqlite/SQLiteStatement;Ljava/lang/Object;)V
    .locals 1
    .param p1, "statement"    # Landroidx/sqlite/SQLiteStatement;
    .param p2, "entity"    # Ljava/lang/Object;

    .line 37
    move-object v0, p2

    check-cast v0, Lcom/hardlineforge/lala/data/CustomCategory;

    invoke-virtual {p0, p1, v0}, Lcom/hardlineforge/lala/data/CustomCategoryDao_Impl$1;->bind(Landroidx/sqlite/SQLiteStatement;Lcom/hardlineforge/lala/data/CustomCategory;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 38
    const-string v0, "INSERT OR ABORT INTO `custom_categories` (`id`,`name`,`createdAt`) VALUES (?,?,?)"

    return-object v0
.end method
