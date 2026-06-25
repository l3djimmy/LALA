.class public final Lcom/hardlineforge/lala/data/AppDatabase_Impl$createOpenDelegate$_openDelegate$1;
.super Landroidx/room/RoomOpenDelegate;
.source "AppDatabase_Impl.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hardlineforge/lala/data/AppDatabase_Impl;->createOpenDelegate()Landroidx/room/RoomOpenDelegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J\u0010\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J\u0010\u0010\u0007\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J\u0010\u0010\u0008\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J\u0010\u0010\t\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J\u0010\u0010\n\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J\u0010\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\u0004\u001a\u00020\u0005H\u0016\u00a8\u0006\r"
    }
    d2 = {
        "com/hardlineforge/lala/data/AppDatabase_Impl$createOpenDelegate$_openDelegate$1",
        "Landroidx/room/RoomOpenDelegate;",
        "createAllTables",
        "",
        "connection",
        "Landroidx/sqlite/SQLiteConnection;",
        "dropAllTables",
        "onCreate",
        "onOpen",
        "onPreMigrate",
        "onPostMigrate",
        "onValidateSchema",
        "Landroidx/room/RoomOpenDelegate$ValidationResult;",
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
.field final synthetic this$0:Lcom/hardlineforge/lala/data/AppDatabase_Impl;


# direct methods
.method constructor <init>(Lcom/hardlineforge/lala/data/AppDatabase_Impl;)V
    .locals 3
    .param p1, "$receiver"    # Lcom/hardlineforge/lala/data/AppDatabase_Impl;

    iput-object p1, p0, Lcom/hardlineforge/lala/data/AppDatabase_Impl$createOpenDelegate$_openDelegate$1;->this$0:Lcom/hardlineforge/lala/data/AppDatabase_Impl;

    .line 55
    const-string v0, "d387235f00528952f059a53ac8b91dee"

    const-string v1, "1d4e2f31230fa906071682e618ad7d09"

    const/4 v2, 0x1

    invoke-direct {p0, v2, v0, v1}, Landroidx/room/RoomOpenDelegate;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public createAllTables(Landroidx/sqlite/SQLiteConnection;)V
    .locals 1
    .param p1, "connection"    # Landroidx/sqlite/SQLiteConnection;

    const-string v0, "connection"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 57
    const-string v0, "CREATE TABLE IF NOT EXISTS `log_entries` (`id` TEXT NOT NULL, `timestamp` INTEGER NOT NULL, `timezone` TEXT NOT NULL, `gpsLat` REAL, `gpsLon` REAL, `gpsAccuracy` REAL, `category` TEXT NOT NULL, `locationName` TEXT, `comment` TEXT NOT NULL, `tags` TEXT NOT NULL, `createdAt` INTEGER NOT NULL, `updatedAt` INTEGER NOT NULL, PRIMARY KEY(`id`))"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 58
    const-string v0, "CREATE TABLE IF NOT EXISTS `photos` (`id` TEXT NOT NULL, `entryId` TEXT NOT NULL, `uri` TEXT NOT NULL, `caption` TEXT, `timestamp` INTEGER NOT NULL, `gpsLat` REAL, `gpsLon` REAL, PRIMARY KEY(`id`), FOREIGN KEY(`entryId`) REFERENCES `log_entries`(`id`) ON UPDATE NO ACTION ON DELETE CASCADE )"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 59
    const-string v0, "CREATE TABLE IF NOT EXISTS `videos` (`id` TEXT NOT NULL, `entryId` TEXT NOT NULL, `uri` TEXT NOT NULL, `durationSeconds` INTEGER NOT NULL, `thumbnailUri` TEXT, `timestamp` INTEGER NOT NULL, `gpsLat` REAL, `gpsLon` REAL, PRIMARY KEY(`id`), FOREIGN KEY(`entryId`) REFERENCES `log_entries`(`id`) ON UPDATE NO ACTION ON DELETE CASCADE )"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 60
    const-string v0, "CREATE TABLE IF NOT EXISTS `video_frames` (`id` TEXT NOT NULL, `videoId` TEXT NOT NULL, `frameNumber` INTEGER NOT NULL, `timeOffsetMs` INTEGER NOT NULL, `uri` TEXT NOT NULL, `extractedAt` INTEGER NOT NULL, PRIMARY KEY(`id`), FOREIGN KEY(`videoId`) REFERENCES `videos`(`id`) ON UPDATE NO ACTION ON DELETE CASCADE )"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 61
    const-string v0, "CREATE TABLE IF NOT EXISTS `edit_history` (`id` TEXT NOT NULL, `entryId` TEXT NOT NULL, `editedAt` INTEGER NOT NULL, `note` TEXT, PRIMARY KEY(`id`))"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 62
    const-string v0, "CREATE TABLE IF NOT EXISTS `custom_categories` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `createdAt` INTEGER NOT NULL, PRIMARY KEY(`id`))"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 63
    const-string v0, "CREATE TABLE IF NOT EXISTS room_master_table (id INTEGER PRIMARY KEY,identity_hash TEXT)"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 64
    const-string v0, "INSERT OR REPLACE INTO room_master_table (id,identity_hash) VALUES(42, \'d387235f00528952f059a53ac8b91dee\')"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 65
    return-void
.end method

.method public dropAllTables(Landroidx/sqlite/SQLiteConnection;)V
    .locals 1
    .param p1, "connection"    # Landroidx/sqlite/SQLiteConnection;

    const-string v0, "connection"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 68
    const-string v0, "DROP TABLE IF EXISTS `log_entries`"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 69
    const-string v0, "DROP TABLE IF EXISTS `photos`"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 70
    const-string v0, "DROP TABLE IF EXISTS `videos`"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 71
    const-string v0, "DROP TABLE IF EXISTS `video_frames`"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 72
    const-string v0, "DROP TABLE IF EXISTS `edit_history`"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 73
    const-string v0, "DROP TABLE IF EXISTS `custom_categories`"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 74
    return-void
.end method

.method public onCreate(Landroidx/sqlite/SQLiteConnection;)V
    .locals 1
    .param p1, "connection"    # Landroidx/sqlite/SQLiteConnection;

    const-string v0, "connection"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 77
    return-void
.end method

.method public onOpen(Landroidx/sqlite/SQLiteConnection;)V
    .locals 1
    .param p1, "connection"    # Landroidx/sqlite/SQLiteConnection;

    const-string v0, "connection"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 80
    const-string v0, "PRAGMA foreign_keys = ON"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 81
    iget-object v0, p0, Lcom/hardlineforge/lala/data/AppDatabase_Impl$createOpenDelegate$_openDelegate$1;->this$0:Lcom/hardlineforge/lala/data/AppDatabase_Impl;

    invoke-static {v0, p1}, Lcom/hardlineforge/lala/data/AppDatabase_Impl;->access$internalInitInvalidationTracker(Lcom/hardlineforge/lala/data/AppDatabase_Impl;Landroidx/sqlite/SQLiteConnection;)V

    .line 82
    return-void
.end method

.method public onPostMigrate(Landroidx/sqlite/SQLiteConnection;)V
    .locals 1
    .param p1, "connection"    # Landroidx/sqlite/SQLiteConnection;

    const-string v0, "connection"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 89
    return-void
.end method

.method public onPreMigrate(Landroidx/sqlite/SQLiteConnection;)V
    .locals 1
    .param p1, "connection"    # Landroidx/sqlite/SQLiteConnection;

    const-string v0, "connection"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 85
    invoke-static {p1}, Landroidx/room/util/DBUtil;->dropFtsSyncTriggers(Landroidx/sqlite/SQLiteConnection;)V

    .line 86
    return-void
.end method

.method public onValidateSchema(Landroidx/sqlite/SQLiteConnection;)Landroidx/room/RoomOpenDelegate$ValidationResult;
    .locals 40
    .param p1, "connection"    # Landroidx/sqlite/SQLiteConnection;

    move-object/from16 v0, p1

    const-string v1, "connection"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 92
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v1, Ljava/util/Map;

    .line 93
    .local v1, "_columnsLogEntries":Ljava/util/Map;
    new-instance v2, Landroidx/room/util/TableInfo$Column;

    const/4 v7, 0x0

    const/4 v8, 0x1

    const-string v3, "id"

    const-string v4, "TEXT"

    const/4 v5, 0x1

    const/4 v6, 0x1

    invoke-direct/range {v2 .. v8}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v3, "id"

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    new-instance v4, Landroidx/room/util/TableInfo$Column;

    const/4 v9, 0x0

    const/4 v10, 0x1

    const-string v5, "timestamp"

    const-string v6, "INTEGER"

    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-direct/range {v4 .. v10}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v2, "timestamp"

    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    new-instance v5, Landroidx/room/util/TableInfo$Column;

    const/4 v10, 0x0

    const/4 v11, 0x1

    const-string v6, "timezone"

    const-string v7, "TEXT"

    const/4 v8, 0x1

    const/4 v9, 0x0

    invoke-direct/range {v5 .. v11}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v4, "timezone"

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    new-instance v6, Landroidx/room/util/TableInfo$Column;

    const/4 v11, 0x0

    const/4 v12, 0x1

    const-string v7, "gpsLat"

    const-string v8, "REAL"

    const/4 v10, 0x0

    invoke-direct/range {v6 .. v12}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v4, "gpsLat"

    invoke-interface {v1, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    new-instance v7, Landroidx/room/util/TableInfo$Column;

    const/4 v12, 0x0

    const/4 v13, 0x1

    const-string v8, "gpsLon"

    const-string v9, "REAL"

    const/4 v11, 0x0

    invoke-direct/range {v7 .. v13}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v5, "gpsLon"

    invoke-interface {v1, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    new-instance v8, Landroidx/room/util/TableInfo$Column;

    const/4 v13, 0x0

    const/4 v14, 0x1

    const-string v9, "gpsAccuracy"

    const-string v10, "REAL"

    const/4 v12, 0x0

    invoke-direct/range {v8 .. v14}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v6, "gpsAccuracy"

    invoke-interface {v1, v6, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    new-instance v9, Landroidx/room/util/TableInfo$Column;

    const/4 v14, 0x0

    const/4 v15, 0x1

    const-string v10, "category"

    const-string v11, "TEXT"

    const/4 v12, 0x1

    const/4 v13, 0x0

    invoke-direct/range {v9 .. v15}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v6, "category"

    invoke-interface {v1, v6, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    new-instance v10, Landroidx/room/util/TableInfo$Column;

    const/4 v15, 0x0

    const/16 v16, 0x1

    const-string v11, "locationName"

    const-string v12, "TEXT"

    const/4 v14, 0x0

    invoke-direct/range {v10 .. v16}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v6, "locationName"

    invoke-interface {v1, v6, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    new-instance v11, Landroidx/room/util/TableInfo$Column;

    const/16 v16, 0x0

    const/16 v17, 0x1

    const-string v12, "comment"

    const-string v13, "TEXT"

    const/4 v14, 0x1

    const/4 v15, 0x0

    invoke-direct/range {v11 .. v17}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v6, "comment"

    invoke-interface {v1, v6, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    new-instance v12, Landroidx/room/util/TableInfo$Column;

    const/16 v17, 0x0

    const/16 v18, 0x1

    const-string v13, "tags"

    const-string v14, "TEXT"

    const/4 v15, 0x1

    const/16 v16, 0x0

    invoke-direct/range {v12 .. v18}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v6, "tags"

    invoke-interface {v1, v6, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    new-instance v13, Landroidx/room/util/TableInfo$Column;

    const/16 v18, 0x0

    const/16 v19, 0x1

    const-string v14, "createdAt"

    const-string v15, "INTEGER"

    const/16 v16, 0x1

    const/16 v17, 0x0

    invoke-direct/range {v13 .. v19}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v6, "createdAt"

    invoke-interface {v1, v6, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    new-instance v14, Landroidx/room/util/TableInfo$Column;

    const/16 v19, 0x0

    const/16 v20, 0x1

    const-string v15, "updatedAt"

    const-string v16, "INTEGER"

    const/16 v17, 0x1

    const/16 v18, 0x0

    invoke-direct/range {v14 .. v20}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v7, "updatedAt"

    invoke-interface {v1, v7, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    new-instance v7, Ljava/util/LinkedHashSet;

    invoke-direct {v7}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v7, Ljava/util/Set;

    .line 106
    .local v7, "_foreignKeysLogEntries":Ljava/util/Set;
    new-instance v8, Ljava/util/LinkedHashSet;

    invoke-direct {v8}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v8, Ljava/util/Set;

    .line 107
    .local v8, "_indicesLogEntries":Ljava/util/Set;
    new-instance v9, Landroidx/room/util/TableInfo;

    const-string v10, "log_entries"

    invoke-direct {v9, v10, v1, v7, v8}, Landroidx/room/util/TableInfo;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Set;Ljava/util/Set;)V

    .line 108
    .local v9, "_infoLogEntries":Landroidx/room/util/TableInfo;
    sget-object v11, Landroidx/room/util/TableInfo;->Companion:Landroidx/room/util/TableInfo$Companion;

    invoke-virtual {v11, v0, v10}, Landroidx/room/util/TableInfo$Companion;->read(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)Landroidx/room/util/TableInfo;

    move-result-object v10

    .line 109
    .local v10, "_existingLogEntries":Landroidx/room/util/TableInfo;
    invoke-virtual {v9, v10}, Landroidx/room/util/TableInfo;->equals(Ljava/lang/Object;)Z

    move-result v11

    const-string v12, "\n Found:\n"

    const/4 v13, 0x0

    if-nez v11, :cond_0

    .line 110
    new-instance v2, Landroidx/room/RoomOpenDelegate$ValidationResult;

    .line 113
    nop

    .line 116
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "log_entries(com.hardlineforge.lala.data.LogEntry).\n Expected:\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 110
    invoke-direct {v2, v13, v3}, Landroidx/room/RoomOpenDelegate$ValidationResult;-><init>(ZLjava/lang/String;)V

    return-object v2

    .line 118
    :cond_0
    new-instance v11, Ljava/util/LinkedHashMap;

    invoke-direct {v11}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v11, Ljava/util/Map;

    .line 119
    .local v11, "_columnsPhotos":Ljava/util/Map;
    new-instance v14, Landroidx/room/util/TableInfo$Column;

    const/16 v19, 0x0

    const/16 v20, 0x1

    const-string v15, "id"

    const-string v16, "TEXT"

    const/16 v17, 0x1

    const/16 v18, 0x1

    invoke-direct/range {v14 .. v20}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    invoke-interface {v11, v3, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    new-instance v15, Landroidx/room/util/TableInfo$Column;

    const/16 v20, 0x0

    const/16 v21, 0x1

    const-string v16, "entryId"

    const-string v17, "TEXT"

    const/16 v19, 0x0

    invoke-direct/range {v15 .. v21}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v14, "entryId"

    invoke-interface {v11, v14, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    new-instance v16, Landroidx/room/util/TableInfo$Column;

    const/16 v21, 0x0

    const/16 v22, 0x1

    const-string v17, "uri"

    const-string v18, "TEXT"

    const/16 v19, 0x1

    const/16 v20, 0x0

    invoke-direct/range {v16 .. v22}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v15, v16

    const-string v13, "uri"

    invoke-interface {v11, v13, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    new-instance v17, Landroidx/room/util/TableInfo$Column;

    const/16 v22, 0x0

    const/16 v23, 0x1

    const-string v18, "caption"

    const-string v19, "TEXT"

    const/16 v21, 0x0

    invoke-direct/range {v17 .. v23}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v15, v17

    move-object/from16 v17, v1

    .end local v1    # "_columnsLogEntries":Ljava/util/Map;
    .local v17, "_columnsLogEntries":Ljava/util/Map;
    const-string v1, "caption"

    invoke-interface {v11, v1, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    new-instance v18, Landroidx/room/util/TableInfo$Column;

    const/16 v23, 0x0

    const/16 v24, 0x1

    const-string v19, "timestamp"

    const-string v20, "INTEGER"

    const/16 v21, 0x1

    const/16 v22, 0x0

    invoke-direct/range {v18 .. v24}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v18

    invoke-interface {v11, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    new-instance v18, Landroidx/room/util/TableInfo$Column;

    const-string v19, "gpsLat"

    const-string v20, "REAL"

    const/16 v21, 0x0

    invoke-direct/range {v18 .. v24}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v18

    invoke-interface {v11, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    new-instance v18, Landroidx/room/util/TableInfo$Column;

    const-string v19, "gpsLon"

    const-string v20, "REAL"

    invoke-direct/range {v18 .. v24}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v18

    invoke-interface {v11, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v1, Ljava/util/Set;

    .line 127
    .local v1, "_foreignKeysPhotos":Ljava/util/Set;
    new-instance v18, Landroidx/room/util/TableInfo$ForeignKey;

    invoke-static {v14}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v22

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v23

    const-string v19, "log_entries"

    const-string v20, "CASCADE"

    const-string v21, "NO ACTION"

    invoke-direct/range {v18 .. v23}, Landroidx/room/util/TableInfo$ForeignKey;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    move-object/from16 v15, v18

    invoke-interface {v1, v15}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 128
    new-instance v15, Ljava/util/LinkedHashSet;

    invoke-direct {v15}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v15, Ljava/util/Set;

    .line 129
    .local v15, "_indicesPhotos":Ljava/util/Set;
    move-object/from16 v18, v7

    .end local v7    # "_foreignKeysLogEntries":Ljava/util/Set;
    .local v18, "_foreignKeysLogEntries":Ljava/util/Set;
    new-instance v7, Landroidx/room/util/TableInfo;

    move-object/from16 v19, v8

    .end local v8    # "_indicesLogEntries":Ljava/util/Set;
    .local v19, "_indicesLogEntries":Ljava/util/Set;
    const-string v8, "photos"

    invoke-direct {v7, v8, v11, v1, v15}, Landroidx/room/util/TableInfo;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Set;Ljava/util/Set;)V

    .line 130
    .local v7, "_infoPhotos":Landroidx/room/util/TableInfo;
    move-object/from16 v20, v1

    .end local v1    # "_foreignKeysPhotos":Ljava/util/Set;
    .local v20, "_foreignKeysPhotos":Ljava/util/Set;
    sget-object v1, Landroidx/room/util/TableInfo;->Companion:Landroidx/room/util/TableInfo$Companion;

    invoke-virtual {v1, v0, v8}, Landroidx/room/util/TableInfo$Companion;->read(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)Landroidx/room/util/TableInfo;

    move-result-object v1

    .line 131
    .local v1, "_existingPhotos":Landroidx/room/util/TableInfo;
    invoke-virtual {v7, v1}, Landroidx/room/util/TableInfo;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 132
    new-instance v2, Landroidx/room/RoomOpenDelegate$ValidationResult;

    .line 135
    nop

    .line 138
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "photos(com.hardlineforge.lala.data.Photo).\n Expected:\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 132
    const/4 v4, 0x0

    invoke-direct {v2, v4, v3}, Landroidx/room/RoomOpenDelegate$ValidationResult;-><init>(ZLjava/lang/String;)V

    return-object v2

    .line 140
    :cond_1
    new-instance v8, Ljava/util/LinkedHashMap;

    invoke-direct {v8}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v8, Ljava/util/Map;

    .line 141
    .local v8, "_columnsVideos":Ljava/util/Map;
    new-instance v21, Landroidx/room/util/TableInfo$Column;

    const/16 v26, 0x0

    const/16 v27, 0x1

    const-string v22, "id"

    const-string v23, "TEXT"

    const/16 v24, 0x1

    const/16 v25, 0x1

    invoke-direct/range {v21 .. v27}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v22, v1

    move-object/from16 v1, v21

    .end local v1    # "_existingPhotos":Landroidx/room/util/TableInfo;
    .local v22, "_existingPhotos":Landroidx/room/util/TableInfo;
    invoke-interface {v8, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    new-instance v23, Landroidx/room/util/TableInfo$Column;

    const/16 v28, 0x0

    const/16 v29, 0x1

    const-string v24, "entryId"

    const-string v25, "TEXT"

    const/16 v26, 0x1

    const/16 v27, 0x0

    invoke-direct/range {v23 .. v29}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v23

    invoke-interface {v8, v14, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    new-instance v23, Landroidx/room/util/TableInfo$Column;

    const-string v24, "uri"

    const-string v25, "TEXT"

    invoke-direct/range {v23 .. v29}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v23

    invoke-interface {v8, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    new-instance v23, Landroidx/room/util/TableInfo$Column;

    const-string v24, "durationSeconds"

    const-string v25, "INTEGER"

    invoke-direct/range {v23 .. v29}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v21, v7

    move-object/from16 v1, v23

    .end local v7    # "_infoPhotos":Landroidx/room/util/TableInfo;
    .local v21, "_infoPhotos":Landroidx/room/util/TableInfo;
    const-string v7, "durationSeconds"

    invoke-interface {v8, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    new-instance v23, Landroidx/room/util/TableInfo$Column;

    const-string v24, "thumbnailUri"

    const-string v25, "TEXT"

    const/16 v26, 0x0

    invoke-direct/range {v23 .. v29}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v23

    const-string v7, "thumbnailUri"

    invoke-interface {v8, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    new-instance v23, Landroidx/room/util/TableInfo$Column;

    const-string v24, "timestamp"

    const-string v25, "INTEGER"

    const/16 v26, 0x1

    invoke-direct/range {v23 .. v29}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v23

    invoke-interface {v8, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    new-instance v23, Landroidx/room/util/TableInfo$Column;

    const-string v24, "gpsLat"

    const-string v25, "REAL"

    const/16 v26, 0x0

    invoke-direct/range {v23 .. v29}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v23

    invoke-interface {v8, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    new-instance v23, Landroidx/room/util/TableInfo$Column;

    const-string v24, "gpsLon"

    const-string v25, "REAL"

    invoke-direct/range {v23 .. v29}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v23

    invoke-interface {v8, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v1, Ljava/util/Set;

    .line 150
    .local v1, "_foreignKeysVideos":Ljava/util/Set;
    new-instance v23, Landroidx/room/util/TableInfo$ForeignKey;

    invoke-static {v14}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v27

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v28

    const-string v24, "log_entries"

    const-string v25, "CASCADE"

    const-string v26, "NO ACTION"

    invoke-direct/range {v23 .. v28}, Landroidx/room/util/TableInfo$ForeignKey;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    move-object/from16 v2, v23

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 151
    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v2, Ljava/util/Set;

    .line 152
    .local v2, "_indicesVideos":Ljava/util/Set;
    new-instance v4, Landroidx/room/util/TableInfo;

    const-string v5, "videos"

    invoke-direct {v4, v5, v8, v1, v2}, Landroidx/room/util/TableInfo;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Set;Ljava/util/Set;)V

    .line 153
    .local v4, "_infoVideos":Landroidx/room/util/TableInfo;
    sget-object v7, Landroidx/room/util/TableInfo;->Companion:Landroidx/room/util/TableInfo$Companion;

    invoke-virtual {v7, v0, v5}, Landroidx/room/util/TableInfo$Companion;->read(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)Landroidx/room/util/TableInfo;

    move-result-object v5

    .line 154
    .local v5, "_existingVideos":Landroidx/room/util/TableInfo;
    invoke-virtual {v4, v5}, Landroidx/room/util/TableInfo;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 155
    new-instance v3, Landroidx/room/RoomOpenDelegate$ValidationResult;

    .line 158
    nop

    .line 161
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "videos(com.hardlineforge.lala.data.Video).\n Expected:\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 155
    const/4 v7, 0x0

    invoke-direct {v3, v7, v6}, Landroidx/room/RoomOpenDelegate$ValidationResult;-><init>(ZLjava/lang/String;)V

    return-object v3

    .line 163
    :cond_2
    new-instance v7, Ljava/util/LinkedHashMap;

    invoke-direct {v7}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v7, Ljava/util/Map;

    .line 164
    .local v7, "_columnsVideoFrames":Ljava/util/Map;
    new-instance v23, Landroidx/room/util/TableInfo$Column;

    const/16 v28, 0x0

    const/16 v29, 0x1

    const-string v24, "id"

    const-string v25, "TEXT"

    const/16 v26, 0x1

    const/16 v27, 0x1

    invoke-direct/range {v23 .. v29}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v24, v1

    move-object/from16 v1, v23

    .end local v1    # "_foreignKeysVideos":Ljava/util/Set;
    .local v24, "_foreignKeysVideos":Ljava/util/Set;
    invoke-interface {v7, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    new-instance v25, Landroidx/room/util/TableInfo$Column;

    const/16 v30, 0x0

    const/16 v31, 0x1

    const-string v26, "videoId"

    const-string v27, "TEXT"

    const/16 v28, 0x1

    const/16 v29, 0x0

    invoke-direct/range {v25 .. v31}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v23, v2

    move-object/from16 v1, v25

    .end local v2    # "_indicesVideos":Ljava/util/Set;
    .local v23, "_indicesVideos":Ljava/util/Set;
    const-string v2, "videoId"

    invoke-interface {v7, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    new-instance v25, Landroidx/room/util/TableInfo$Column;

    const-string v26, "frameNumber"

    const-string v27, "INTEGER"

    invoke-direct/range {v25 .. v31}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v25

    move-object/from16 v25, v2

    const-string v2, "frameNumber"

    invoke-interface {v7, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    new-instance v26, Landroidx/room/util/TableInfo$Column;

    const/16 v31, 0x0

    const/16 v32, 0x1

    const-string v27, "timeOffsetMs"

    const-string v28, "INTEGER"

    const/16 v29, 0x1

    const/16 v30, 0x0

    invoke-direct/range {v26 .. v32}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v26

    const-string v2, "timeOffsetMs"

    invoke-interface {v7, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    new-instance v26, Landroidx/room/util/TableInfo$Column;

    const-string v27, "uri"

    const-string v28, "TEXT"

    invoke-direct/range {v26 .. v32}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v26

    invoke-interface {v7, v13, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    new-instance v26, Landroidx/room/util/TableInfo$Column;

    const-string v27, "extractedAt"

    const-string v28, "INTEGER"

    invoke-direct/range {v26 .. v32}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v26

    const-string v2, "extractedAt"

    invoke-interface {v7, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v1, Ljava/util/Set;

    .line 171
    .local v1, "_foreignKeysVideoFrames":Ljava/util/Set;
    new-instance v26, Landroidx/room/util/TableInfo$ForeignKey;

    invoke-static/range {v25 .. v25}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v30

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v31

    const-string v27, "videos"

    const-string v28, "CASCADE"

    const-string v29, "NO ACTION"

    invoke-direct/range {v26 .. v31}, Landroidx/room/util/TableInfo$ForeignKey;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    move-object/from16 v2, v26

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 172
    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v2, Ljava/util/Set;

    .line 173
    .local v2, "_indicesVideoFrames":Ljava/util/Set;
    new-instance v13, Landroidx/room/util/TableInfo;

    move-object/from16 v25, v4

    .end local v4    # "_infoVideos":Landroidx/room/util/TableInfo;
    .local v25, "_infoVideos":Landroidx/room/util/TableInfo;
    const-string v4, "video_frames"

    invoke-direct {v13, v4, v7, v1, v2}, Landroidx/room/util/TableInfo;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Set;Ljava/util/Set;)V

    .line 174
    .local v13, "_infoVideoFrames":Landroidx/room/util/TableInfo;
    move-object/from16 v26, v1

    .end local v1    # "_foreignKeysVideoFrames":Ljava/util/Set;
    .local v26, "_foreignKeysVideoFrames":Ljava/util/Set;
    sget-object v1, Landroidx/room/util/TableInfo;->Companion:Landroidx/room/util/TableInfo$Companion;

    invoke-virtual {v1, v0, v4}, Landroidx/room/util/TableInfo$Companion;->read(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)Landroidx/room/util/TableInfo;

    move-result-object v1

    .line 175
    .local v1, "_existingVideoFrames":Landroidx/room/util/TableInfo;
    invoke-virtual {v13, v1}, Landroidx/room/util/TableInfo;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 176
    new-instance v3, Landroidx/room/RoomOpenDelegate$ValidationResult;

    .line 179
    nop

    .line 182
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "video_frames(com.hardlineforge.lala.data.VideoFrame).\n Expected:\n"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 176
    const/4 v6, 0x0

    invoke-direct {v3, v6, v4}, Landroidx/room/RoomOpenDelegate$ValidationResult;-><init>(ZLjava/lang/String;)V

    return-object v3

    .line 184
    :cond_3
    new-instance v4, Ljava/util/LinkedHashMap;

    invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v4, Ljava/util/Map;

    .line 185
    .local v4, "_columnsEditHistory":Ljava/util/Map;
    new-instance v27, Landroidx/room/util/TableInfo$Column;

    const/16 v32, 0x0

    const/16 v33, 0x1

    const-string v28, "id"

    const-string v29, "TEXT"

    const/16 v30, 0x1

    const/16 v31, 0x1

    invoke-direct/range {v27 .. v33}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v28, v1

    move-object/from16 v1, v27

    .end local v1    # "_existingVideoFrames":Landroidx/room/util/TableInfo;
    .local v28, "_existingVideoFrames":Landroidx/room/util/TableInfo;
    invoke-interface {v4, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    new-instance v29, Landroidx/room/util/TableInfo$Column;

    const/16 v34, 0x0

    const/16 v35, 0x1

    const-string v30, "entryId"

    const-string v31, "TEXT"

    const/16 v32, 0x1

    const/16 v33, 0x0

    invoke-direct/range {v29 .. v35}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v29

    invoke-interface {v4, v14, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    new-instance v29, Landroidx/room/util/TableInfo$Column;

    const-string v30, "editedAt"

    const-string v31, "INTEGER"

    invoke-direct/range {v29 .. v35}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v29

    const-string v14, "editedAt"

    invoke-interface {v4, v14, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    new-instance v29, Landroidx/room/util/TableInfo$Column;

    const-string v30, "note"

    const-string v31, "TEXT"

    const/16 v32, 0x0

    invoke-direct/range {v29 .. v35}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v29

    const-string v14, "note"

    invoke-interface {v4, v14, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v1, Ljava/util/Set;

    .line 190
    .local v1, "_foreignKeysEditHistory":Ljava/util/Set;
    new-instance v14, Ljava/util/LinkedHashSet;

    invoke-direct {v14}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v14, Ljava/util/Set;

    .line 191
    .local v14, "_indicesEditHistory":Ljava/util/Set;
    move-object/from16 v27, v2

    .end local v2    # "_indicesVideoFrames":Ljava/util/Set;
    .local v27, "_indicesVideoFrames":Ljava/util/Set;
    new-instance v2, Landroidx/room/util/TableInfo;

    move-object/from16 v29, v5

    .end local v5    # "_existingVideos":Landroidx/room/util/TableInfo;
    .local v29, "_existingVideos":Landroidx/room/util/TableInfo;
    const-string v5, "edit_history"

    invoke-direct {v2, v5, v4, v1, v14}, Landroidx/room/util/TableInfo;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Set;Ljava/util/Set;)V

    .line 192
    .local v2, "_infoEditHistory":Landroidx/room/util/TableInfo;
    move-object/from16 v30, v1

    .end local v1    # "_foreignKeysEditHistory":Ljava/util/Set;
    .local v30, "_foreignKeysEditHistory":Ljava/util/Set;
    sget-object v1, Landroidx/room/util/TableInfo;->Companion:Landroidx/room/util/TableInfo$Companion;

    invoke-virtual {v1, v0, v5}, Landroidx/room/util/TableInfo$Companion;->read(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)Landroidx/room/util/TableInfo;

    move-result-object v1

    .line 193
    .local v1, "_existingEditHistory":Landroidx/room/util/TableInfo;
    invoke-virtual {v2, v1}, Landroidx/room/util/TableInfo;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 194
    new-instance v3, Landroidx/room/RoomOpenDelegate$ValidationResult;

    .line 197
    nop

    .line 200
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "edit_history(com.hardlineforge.lala.data.EditHistory).\n Expected:\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 194
    const/4 v6, 0x0

    invoke-direct {v3, v6, v5}, Landroidx/room/RoomOpenDelegate$ValidationResult;-><init>(ZLjava/lang/String;)V

    return-object v3

    .line 202
    :cond_4
    new-instance v5, Ljava/util/LinkedHashMap;

    invoke-direct {v5}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v5, Ljava/util/Map;

    .line 203
    .local v5, "_columnsCustomCategories":Ljava/util/Map;
    new-instance v31, Landroidx/room/util/TableInfo$Column;

    const/16 v36, 0x0

    const/16 v37, 0x1

    const-string v32, "id"

    const-string v33, "TEXT"

    const/16 v34, 0x1

    const/16 v35, 0x1

    invoke-direct/range {v31 .. v37}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v32, v1

    move-object/from16 v1, v31

    .end local v1    # "_existingEditHistory":Landroidx/room/util/TableInfo;
    .local v32, "_existingEditHistory":Landroidx/room/util/TableInfo;
    invoke-interface {v5, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const/16 v38, 0x0

    const/16 v39, 0x1

    const-string v34, "name"

    const-string v35, "TEXT"

    const/16 v36, 0x1

    const/16 v37, 0x0

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v33

    const-string v3, "name"

    invoke-interface {v5, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "createdAt"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v33

    invoke-interface {v5, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v1, Ljava/util/Set;

    .line 207
    .local v1, "_foreignKeysCustomCategories":Ljava/util/Set;
    new-instance v3, Ljava/util/LinkedHashSet;

    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v3, Ljava/util/Set;

    .line 208
    .local v3, "_indicesCustomCategories":Ljava/util/Set;
    new-instance v6, Landroidx/room/util/TableInfo;

    move-object/from16 v31, v2

    .end local v2    # "_infoEditHistory":Landroidx/room/util/TableInfo;
    .local v31, "_infoEditHistory":Landroidx/room/util/TableInfo;
    const-string v2, "custom_categories"

    invoke-direct {v6, v2, v5, v1, v3}, Landroidx/room/util/TableInfo;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Set;Ljava/util/Set;)V

    .line 209
    .local v6, "_infoCustomCategories":Landroidx/room/util/TableInfo;
    move-object/from16 v33, v1

    .end local v1    # "_foreignKeysCustomCategories":Ljava/util/Set;
    .local v33, "_foreignKeysCustomCategories":Ljava/util/Set;
    sget-object v1, Landroidx/room/util/TableInfo;->Companion:Landroidx/room/util/TableInfo$Companion;

    invoke-virtual {v1, v0, v2}, Landroidx/room/util/TableInfo$Companion;->read(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)Landroidx/room/util/TableInfo;

    move-result-object v1

    .line 210
    .local v1, "_existingCustomCategories":Landroidx/room/util/TableInfo;
    invoke-virtual {v6, v1}, Landroidx/room/util/TableInfo;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 211
    new-instance v2, Landroidx/room/RoomOpenDelegate$ValidationResult;

    .line 214
    nop

    .line 217
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v34, v3

    .end local v3    # "_indicesCustomCategories":Ljava/util/Set;
    .local v34, "_indicesCustomCategories":Ljava/util/Set;
    const-string v3, "custom_categories(com.hardlineforge.lala.data.CustomCategory).\n Expected:\n"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 211
    const/4 v3, 0x0

    invoke-direct {v2, v3, v0}, Landroidx/room/RoomOpenDelegate$ValidationResult;-><init>(ZLjava/lang/String;)V

    return-object v2

    .line 219
    .end local v34    # "_indicesCustomCategories":Ljava/util/Set;
    .restart local v3    # "_indicesCustomCategories":Ljava/util/Set;
    :cond_5
    move-object/from16 v34, v3

    .end local v3    # "_indicesCustomCategories":Ljava/util/Set;
    .restart local v34    # "_indicesCustomCategories":Ljava/util/Set;
    new-instance v0, Landroidx/room/RoomOpenDelegate$ValidationResult;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3}, Landroidx/room/RoomOpenDelegate$ValidationResult;-><init>(ZLjava/lang/String;)V

    return-object v0
.end method
