package com.hardlineforge.lala.data;

import androidx.autofill.HintConstants;
import androidx.room.InvalidationTracker;
import androidx.room.RoomMasterTable;
import androidx.room.RoomOpenDelegate;
import androidx.room.migration.AutoMigrationSpec;
import androidx.room.migration.Migration;
import androidx.room.util.DBUtil;
import androidx.room.util.TableInfo;
import androidx.sqlite.SQLite;
import androidx.sqlite.SQLiteConnection;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KClass;
/* compiled from: AppDatabase_Impl.kt */
@Metadata(d1 = {"\u0000f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0000\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\b\u0010\u0011\u001a\u00020\u0012H\u0014J\b\u0010\u0013\u001a\u00020\u0014H\u0014J\b\u0010\u0015\u001a\u00020\u0016H\u0016J\"\u0010\u0017\u001a\u001c\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u0019\u0012\u000e\u0012\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00190\u001a0\u0018H\u0014J\u0016\u0010\u001b\u001a\u0010\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\u001d0\u00190\u001cH\u0016J*\u0010\u001e\u001a\b\u0012\u0004\u0012\u00020\u001f0\u001a2\u001a\u0010 \u001a\u0016\u0012\f\u0012\n\u0012\u0006\b\u0001\u0012\u00020\u001d0\u0019\u0012\u0004\u0012\u00020\u001d0\u0018H\u0016J\b\u0010!\u001a\u00020\u0006H\u0016J\b\u0010\"\u001a\u00020\bH\u0016J\b\u0010#\u001a\u00020\nH\u0016J\b\u0010$\u001a\u00020\fH\u0016J\b\u0010%\u001a\u00020\u000eH\u0016J\b\u0010&\u001a\u00020\u0010H\u0016R\u0014\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\b0\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\t\u001a\b\u0012\u0004\u0012\u00020\n0\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\f0\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00100\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006'"}, d2 = {"Lcom/hardlineforge/lala/data/AppDatabase_Impl;", "Lcom/hardlineforge/lala/data/AppDatabase;", "<init>", "()V", "_logEntryDao", "Lkotlin/Lazy;", "Lcom/hardlineforge/lala/data/LogEntryDao;", "_photoDao", "Lcom/hardlineforge/lala/data/PhotoDao;", "_videoDao", "Lcom/hardlineforge/lala/data/VideoDao;", "_videoFrameDao", "Lcom/hardlineforge/lala/data/VideoFrameDao;", "_editHistoryDao", "Lcom/hardlineforge/lala/data/EditHistoryDao;", "_customCategoryDao", "Lcom/hardlineforge/lala/data/CustomCategoryDao;", "createOpenDelegate", "Landroidx/room/RoomOpenDelegate;", "createInvalidationTracker", "Landroidx/room/InvalidationTracker;", "clearAllTables", "", "getRequiredTypeConverterClasses", "", "Lkotlin/reflect/KClass;", "", "getRequiredAutoMigrationSpecClasses", "", "Landroidx/room/migration/AutoMigrationSpec;", "createAutoMigrations", "Landroidx/room/migration/Migration;", "autoMigrationSpecs", "logEntryDao", "photoDao", "videoDao", "videoFrameDao", "editHistoryDao", "customCategoryDao", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes7.dex */
public final class AppDatabase_Impl extends AppDatabase {
    public static final int $stable = 8;
    private final Lazy<LogEntryDao> _logEntryDao = LazyKt.lazy(new Function0() { // from class: com.hardlineforge.lala.data.AppDatabase_Impl$$ExternalSyntheticLambda0
        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return AppDatabase_Impl._logEntryDao$lambda$0(AppDatabase_Impl.this);
        }
    });
    private final Lazy<PhotoDao> _photoDao = LazyKt.lazy(new Function0() { // from class: com.hardlineforge.lala.data.AppDatabase_Impl$$ExternalSyntheticLambda1
        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return AppDatabase_Impl._photoDao$lambda$1(AppDatabase_Impl.this);
        }
    });
    private final Lazy<VideoDao> _videoDao = LazyKt.lazy(new Function0() { // from class: com.hardlineforge.lala.data.AppDatabase_Impl$$ExternalSyntheticLambda2
        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return AppDatabase_Impl._videoDao$lambda$2(AppDatabase_Impl.this);
        }
    });
    private final Lazy<VideoFrameDao> _videoFrameDao = LazyKt.lazy(new Function0() { // from class: com.hardlineforge.lala.data.AppDatabase_Impl$$ExternalSyntheticLambda3
        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return AppDatabase_Impl._videoFrameDao$lambda$3(AppDatabase_Impl.this);
        }
    });
    private final Lazy<EditHistoryDao> _editHistoryDao = LazyKt.lazy(new Function0() { // from class: com.hardlineforge.lala.data.AppDatabase_Impl$$ExternalSyntheticLambda4
        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return AppDatabase_Impl._editHistoryDao$lambda$4(AppDatabase_Impl.this);
        }
    });
    private final Lazy<CustomCategoryDao> _customCategoryDao = LazyKt.lazy(new Function0() { // from class: com.hardlineforge.lala.data.AppDatabase_Impl$$ExternalSyntheticLambda5
        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return AppDatabase_Impl._customCategoryDao$lambda$5(AppDatabase_Impl.this);
        }
    });

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final LogEntryDao_Impl _logEntryDao$lambda$0(AppDatabase_Impl this$0) {
        return new LogEntryDao_Impl(this$0);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final PhotoDao_Impl _photoDao$lambda$1(AppDatabase_Impl this$0) {
        return new PhotoDao_Impl(this$0);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final VideoDao_Impl _videoDao$lambda$2(AppDatabase_Impl this$0) {
        return new VideoDao_Impl(this$0);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final VideoFrameDao_Impl _videoFrameDao$lambda$3(AppDatabase_Impl this$0) {
        return new VideoFrameDao_Impl(this$0);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final EditHistoryDao_Impl _editHistoryDao$lambda$4(AppDatabase_Impl this$0) {
        return new EditHistoryDao_Impl(this$0);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final CustomCategoryDao_Impl _customCategoryDao$lambda$5(AppDatabase_Impl this$0) {
        return new CustomCategoryDao_Impl(this$0);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // androidx.room.RoomDatabase
    public RoomOpenDelegate createOpenDelegate() {
        RoomOpenDelegate _openDelegate = new RoomOpenDelegate() { // from class: com.hardlineforge.lala.data.AppDatabase_Impl$createOpenDelegate$_openDelegate$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1, "d387235f00528952f059a53ac8b91dee", "1d4e2f31230fa906071682e618ad7d09");
            }

            @Override // androidx.room.RoomOpenDelegate
            public void createAllTables(SQLiteConnection connection) {
                Intrinsics.checkNotNullParameter(connection, "connection");
                SQLite.execSQL(connection, "CREATE TABLE IF NOT EXISTS `log_entries` (`id` TEXT NOT NULL, `timestamp` INTEGER NOT NULL, `timezone` TEXT NOT NULL, `gpsLat` REAL, `gpsLon` REAL, `gpsAccuracy` REAL, `category` TEXT NOT NULL, `locationName` TEXT, `comment` TEXT NOT NULL, `tags` TEXT NOT NULL, `createdAt` INTEGER NOT NULL, `updatedAt` INTEGER NOT NULL, PRIMARY KEY(`id`))");
                SQLite.execSQL(connection, "CREATE TABLE IF NOT EXISTS `photos` (`id` TEXT NOT NULL, `entryId` TEXT NOT NULL, `uri` TEXT NOT NULL, `caption` TEXT, `timestamp` INTEGER NOT NULL, `gpsLat` REAL, `gpsLon` REAL, PRIMARY KEY(`id`), FOREIGN KEY(`entryId`) REFERENCES `log_entries`(`id`) ON UPDATE NO ACTION ON DELETE CASCADE )");
                SQLite.execSQL(connection, "CREATE TABLE IF NOT EXISTS `videos` (`id` TEXT NOT NULL, `entryId` TEXT NOT NULL, `uri` TEXT NOT NULL, `durationSeconds` INTEGER NOT NULL, `thumbnailUri` TEXT, `timestamp` INTEGER NOT NULL, `gpsLat` REAL, `gpsLon` REAL, PRIMARY KEY(`id`), FOREIGN KEY(`entryId`) REFERENCES `log_entries`(`id`) ON UPDATE NO ACTION ON DELETE CASCADE )");
                SQLite.execSQL(connection, "CREATE TABLE IF NOT EXISTS `video_frames` (`id` TEXT NOT NULL, `videoId` TEXT NOT NULL, `frameNumber` INTEGER NOT NULL, `timeOffsetMs` INTEGER NOT NULL, `uri` TEXT NOT NULL, `extractedAt` INTEGER NOT NULL, PRIMARY KEY(`id`), FOREIGN KEY(`videoId`) REFERENCES `videos`(`id`) ON UPDATE NO ACTION ON DELETE CASCADE )");
                SQLite.execSQL(connection, "CREATE TABLE IF NOT EXISTS `edit_history` (`id` TEXT NOT NULL, `entryId` TEXT NOT NULL, `editedAt` INTEGER NOT NULL, `note` TEXT, PRIMARY KEY(`id`))");
                SQLite.execSQL(connection, "CREATE TABLE IF NOT EXISTS `custom_categories` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `createdAt` INTEGER NOT NULL, PRIMARY KEY(`id`))");
                SQLite.execSQL(connection, RoomMasterTable.CREATE_QUERY);
                SQLite.execSQL(connection, "INSERT OR REPLACE INTO room_master_table (id,identity_hash) VALUES(42, 'd387235f00528952f059a53ac8b91dee')");
            }

            @Override // androidx.room.RoomOpenDelegate
            public void dropAllTables(SQLiteConnection connection) {
                Intrinsics.checkNotNullParameter(connection, "connection");
                SQLite.execSQL(connection, "DROP TABLE IF EXISTS `log_entries`");
                SQLite.execSQL(connection, "DROP TABLE IF EXISTS `photos`");
                SQLite.execSQL(connection, "DROP TABLE IF EXISTS `videos`");
                SQLite.execSQL(connection, "DROP TABLE IF EXISTS `video_frames`");
                SQLite.execSQL(connection, "DROP TABLE IF EXISTS `edit_history`");
                SQLite.execSQL(connection, "DROP TABLE IF EXISTS `custom_categories`");
            }

            @Override // androidx.room.RoomOpenDelegate
            public void onCreate(SQLiteConnection connection) {
                Intrinsics.checkNotNullParameter(connection, "connection");
            }

            @Override // androidx.room.RoomOpenDelegate
            public void onOpen(SQLiteConnection connection) {
                Intrinsics.checkNotNullParameter(connection, "connection");
                SQLite.execSQL(connection, "PRAGMA foreign_keys = ON");
                AppDatabase_Impl.this.internalInitInvalidationTracker(connection);
            }

            @Override // androidx.room.RoomOpenDelegate
            public void onPreMigrate(SQLiteConnection connection) {
                Intrinsics.checkNotNullParameter(connection, "connection");
                DBUtil.dropFtsSyncTriggers(connection);
            }

            @Override // androidx.room.RoomOpenDelegate
            public void onPostMigrate(SQLiteConnection connection) {
                Intrinsics.checkNotNullParameter(connection, "connection");
            }

            @Override // androidx.room.RoomOpenDelegate
            public RoomOpenDelegate.ValidationResult onValidateSchema(SQLiteConnection connection) {
                Intrinsics.checkNotNullParameter(connection, "connection");
                Map _columnsLogEntries = new LinkedHashMap();
                _columnsLogEntries.put("id", new TableInfo.Column("id", "TEXT", true, 1, null, 1));
                _columnsLogEntries.put("timestamp", new TableInfo.Column("timestamp", "INTEGER", true, 0, null, 1));
                _columnsLogEntries.put("timezone", new TableInfo.Column("timezone", "TEXT", true, 0, null, 1));
                _columnsLogEntries.put("gpsLat", new TableInfo.Column("gpsLat", "REAL", false, 0, null, 1));
                _columnsLogEntries.put("gpsLon", new TableInfo.Column("gpsLon", "REAL", false, 0, null, 1));
                _columnsLogEntries.put("gpsAccuracy", new TableInfo.Column("gpsAccuracy", "REAL", false, 0, null, 1));
                _columnsLogEntries.put("category", new TableInfo.Column("category", "TEXT", true, 0, null, 1));
                _columnsLogEntries.put("locationName", new TableInfo.Column("locationName", "TEXT", false, 0, null, 1));
                _columnsLogEntries.put("comment", new TableInfo.Column("comment", "TEXT", true, 0, null, 1));
                _columnsLogEntries.put("tags", new TableInfo.Column("tags", "TEXT", true, 0, null, 1));
                _columnsLogEntries.put("createdAt", new TableInfo.Column("createdAt", "INTEGER", true, 0, null, 1));
                _columnsLogEntries.put("updatedAt", new TableInfo.Column("updatedAt", "INTEGER", true, 0, null, 1));
                Set _foreignKeysLogEntries = new LinkedHashSet();
                Set _indicesLogEntries = new LinkedHashSet();
                TableInfo _infoLogEntries = new TableInfo("log_entries", _columnsLogEntries, _foreignKeysLogEntries, _indicesLogEntries);
                TableInfo _existingLogEntries = TableInfo.Companion.read(connection, "log_entries");
                if (!_infoLogEntries.equals(_existingLogEntries)) {
                    return new RoomOpenDelegate.ValidationResult(false, "log_entries(com.hardlineforge.lala.data.LogEntry).\n Expected:\n" + _infoLogEntries + "\n Found:\n" + _existingLogEntries);
                }
                Map _columnsPhotos = new LinkedHashMap();
                _columnsPhotos.put("id", new TableInfo.Column("id", "TEXT", true, 1, null, 1));
                _columnsPhotos.put("entryId", new TableInfo.Column("entryId", "TEXT", true, 0, null, 1));
                _columnsPhotos.put("uri", new TableInfo.Column("uri", "TEXT", true, 0, null, 1));
                _columnsPhotos.put("caption", new TableInfo.Column("caption", "TEXT", false, 0, null, 1));
                _columnsPhotos.put("timestamp", new TableInfo.Column("timestamp", "INTEGER", true, 0, null, 1));
                _columnsPhotos.put("gpsLat", new TableInfo.Column("gpsLat", "REAL", false, 0, null, 1));
                _columnsPhotos.put("gpsLon", new TableInfo.Column("gpsLon", "REAL", false, 0, null, 1));
                Set _foreignKeysPhotos = new LinkedHashSet();
                _foreignKeysPhotos.add(new TableInfo.ForeignKey("log_entries", "CASCADE", "NO ACTION", CollectionsKt.listOf("entryId"), CollectionsKt.listOf("id")));
                Set _indicesPhotos = new LinkedHashSet();
                TableInfo _infoPhotos = new TableInfo("photos", _columnsPhotos, _foreignKeysPhotos, _indicesPhotos);
                TableInfo _existingPhotos = TableInfo.Companion.read(connection, "photos");
                if (!_infoPhotos.equals(_existingPhotos)) {
                    return new RoomOpenDelegate.ValidationResult(false, "photos(com.hardlineforge.lala.data.Photo).\n Expected:\n" + _infoPhotos + "\n Found:\n" + _existingPhotos);
                }
                Map _columnsVideos = new LinkedHashMap();
                _columnsVideos.put("id", new TableInfo.Column("id", "TEXT", true, 1, null, 1));
                _columnsVideos.put("entryId", new TableInfo.Column("entryId", "TEXT", true, 0, null, 1));
                _columnsVideos.put("uri", new TableInfo.Column("uri", "TEXT", true, 0, null, 1));
                _columnsVideos.put("durationSeconds", new TableInfo.Column("durationSeconds", "INTEGER", true, 0, null, 1));
                _columnsVideos.put("thumbnailUri", new TableInfo.Column("thumbnailUri", "TEXT", false, 0, null, 1));
                _columnsVideos.put("timestamp", new TableInfo.Column("timestamp", "INTEGER", true, 0, null, 1));
                _columnsVideos.put("gpsLat", new TableInfo.Column("gpsLat", "REAL", false, 0, null, 1));
                _columnsVideos.put("gpsLon", new TableInfo.Column("gpsLon", "REAL", false, 0, null, 1));
                Set _foreignKeysVideos = new LinkedHashSet();
                _foreignKeysVideos.add(new TableInfo.ForeignKey("log_entries", "CASCADE", "NO ACTION", CollectionsKt.listOf("entryId"), CollectionsKt.listOf("id")));
                Set _indicesVideos = new LinkedHashSet();
                TableInfo _infoVideos = new TableInfo("videos", _columnsVideos, _foreignKeysVideos, _indicesVideos);
                TableInfo _existingVideos = TableInfo.Companion.read(connection, "videos");
                if (!_infoVideos.equals(_existingVideos)) {
                    return new RoomOpenDelegate.ValidationResult(false, "videos(com.hardlineforge.lala.data.Video).\n Expected:\n" + _infoVideos + "\n Found:\n" + _existingVideos);
                }
                Map _columnsVideoFrames = new LinkedHashMap();
                _columnsVideoFrames.put("id", new TableInfo.Column("id", "TEXT", true, 1, null, 1));
                _columnsVideoFrames.put("videoId", new TableInfo.Column("videoId", "TEXT", true, 0, null, 1));
                _columnsVideoFrames.put("frameNumber", new TableInfo.Column("frameNumber", "INTEGER", true, 0, null, 1));
                _columnsVideoFrames.put("timeOffsetMs", new TableInfo.Column("timeOffsetMs", "INTEGER", true, 0, null, 1));
                _columnsVideoFrames.put("uri", new TableInfo.Column("uri", "TEXT", true, 0, null, 1));
                _columnsVideoFrames.put("extractedAt", new TableInfo.Column("extractedAt", "INTEGER", true, 0, null, 1));
                Set _foreignKeysVideoFrames = new LinkedHashSet();
                _foreignKeysVideoFrames.add(new TableInfo.ForeignKey("videos", "CASCADE", "NO ACTION", CollectionsKt.listOf("videoId"), CollectionsKt.listOf("id")));
                Set _indicesVideoFrames = new LinkedHashSet();
                TableInfo _infoVideoFrames = new TableInfo("video_frames", _columnsVideoFrames, _foreignKeysVideoFrames, _indicesVideoFrames);
                TableInfo _existingVideoFrames = TableInfo.Companion.read(connection, "video_frames");
                if (!_infoVideoFrames.equals(_existingVideoFrames)) {
                    return new RoomOpenDelegate.ValidationResult(false, "video_frames(com.hardlineforge.lala.data.VideoFrame).\n Expected:\n" + _infoVideoFrames + "\n Found:\n" + _existingVideoFrames);
                }
                Map _columnsEditHistory = new LinkedHashMap();
                _columnsEditHistory.put("id", new TableInfo.Column("id", "TEXT", true, 1, null, 1));
                _columnsEditHistory.put("entryId", new TableInfo.Column("entryId", "TEXT", true, 0, null, 1));
                _columnsEditHistory.put("editedAt", new TableInfo.Column("editedAt", "INTEGER", true, 0, null, 1));
                _columnsEditHistory.put("note", new TableInfo.Column("note", "TEXT", false, 0, null, 1));
                Set _foreignKeysEditHistory = new LinkedHashSet();
                Set _indicesEditHistory = new LinkedHashSet();
                TableInfo _infoEditHistory = new TableInfo("edit_history", _columnsEditHistory, _foreignKeysEditHistory, _indicesEditHistory);
                TableInfo _existingEditHistory = TableInfo.Companion.read(connection, "edit_history");
                if (!_infoEditHistory.equals(_existingEditHistory)) {
                    return new RoomOpenDelegate.ValidationResult(false, "edit_history(com.hardlineforge.lala.data.EditHistory).\n Expected:\n" + _infoEditHistory + "\n Found:\n" + _existingEditHistory);
                }
                Map _columnsCustomCategories = new LinkedHashMap();
                _columnsCustomCategories.put("id", new TableInfo.Column("id", "TEXT", true, 1, null, 1));
                _columnsCustomCategories.put(HintConstants.AUTOFILL_HINT_NAME, new TableInfo.Column(HintConstants.AUTOFILL_HINT_NAME, "TEXT", true, 0, null, 1));
                _columnsCustomCategories.put("createdAt", new TableInfo.Column("createdAt", "INTEGER", true, 0, null, 1));
                Set _foreignKeysCustomCategories = new LinkedHashSet();
                Set _indicesCustomCategories = new LinkedHashSet();
                TableInfo _infoCustomCategories = new TableInfo("custom_categories", _columnsCustomCategories, _foreignKeysCustomCategories, _indicesCustomCategories);
                TableInfo _existingCustomCategories = TableInfo.Companion.read(connection, "custom_categories");
                return !_infoCustomCategories.equals(_existingCustomCategories) ? new RoomOpenDelegate.ValidationResult(false, "custom_categories(com.hardlineforge.lala.data.CustomCategory).\n Expected:\n" + _infoCustomCategories + "\n Found:\n" + _existingCustomCategories) : new RoomOpenDelegate.ValidationResult(true, null);
            }
        };
        return _openDelegate;
    }

    @Override // androidx.room.RoomDatabase
    protected InvalidationTracker createInvalidationTracker() {
        Map _shadowTablesMap = new LinkedHashMap();
        Map _viewTables = new LinkedHashMap();
        return new InvalidationTracker(this, _shadowTablesMap, _viewTables, "log_entries", "photos", "videos", "video_frames", "edit_history", "custom_categories");
    }

    @Override // androidx.room.RoomDatabase
    public void clearAllTables() {
        super.performClear(true, "log_entries", "photos", "videos", "video_frames", "edit_history", "custom_categories");
    }

    @Override // androidx.room.RoomDatabase
    protected Map<KClass<?>, List<KClass<?>>> getRequiredTypeConverterClasses() {
        Map _typeConvertersMap = new LinkedHashMap();
        _typeConvertersMap.put(Reflection.getOrCreateKotlinClass(LogEntryDao.class), LogEntryDao_Impl.Companion.getRequiredConverters());
        _typeConvertersMap.put(Reflection.getOrCreateKotlinClass(PhotoDao.class), PhotoDao_Impl.Companion.getRequiredConverters());
        _typeConvertersMap.put(Reflection.getOrCreateKotlinClass(VideoDao.class), VideoDao_Impl.Companion.getRequiredConverters());
        _typeConvertersMap.put(Reflection.getOrCreateKotlinClass(VideoFrameDao.class), VideoFrameDao_Impl.Companion.getRequiredConverters());
        _typeConvertersMap.put(Reflection.getOrCreateKotlinClass(EditHistoryDao.class), EditHistoryDao_Impl.Companion.getRequiredConverters());
        _typeConvertersMap.put(Reflection.getOrCreateKotlinClass(CustomCategoryDao.class), CustomCategoryDao_Impl.Companion.getRequiredConverters());
        return _typeConvertersMap;
    }

    @Override // androidx.room.RoomDatabase
    public Set<KClass<? extends AutoMigrationSpec>> getRequiredAutoMigrationSpecClasses() {
        Set _autoMigrationSpecsSet = new LinkedHashSet();
        return _autoMigrationSpecsSet;
    }

    @Override // androidx.room.RoomDatabase
    public List<Migration> createAutoMigrations(Map<KClass<? extends AutoMigrationSpec>, ? extends AutoMigrationSpec> autoMigrationSpecs) {
        Intrinsics.checkNotNullParameter(autoMigrationSpecs, "autoMigrationSpecs");
        List _autoMigrations = new ArrayList();
        return _autoMigrations;
    }

    @Override // com.hardlineforge.lala.data.AppDatabase
    public LogEntryDao logEntryDao() {
        return this._logEntryDao.getValue();
    }

    @Override // com.hardlineforge.lala.data.AppDatabase
    public PhotoDao photoDao() {
        return this._photoDao.getValue();
    }

    @Override // com.hardlineforge.lala.data.AppDatabase
    public VideoDao videoDao() {
        return this._videoDao.getValue();
    }

    @Override // com.hardlineforge.lala.data.AppDatabase
    public VideoFrameDao videoFrameDao() {
        return this._videoFrameDao.getValue();
    }

    @Override // com.hardlineforge.lala.data.AppDatabase
    public EditHistoryDao editHistoryDao() {
        return this._editHistoryDao.getValue();
    }

    @Override // com.hardlineforge.lala.data.AppDatabase
    public CustomCategoryDao customCategoryDao() {
        return this._customCategoryDao.getValue();
    }
}
