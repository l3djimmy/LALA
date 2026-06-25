package com.hardlineforge.lala.data

import androidx.room.Database
import androidx.room.RoomDatabase
import androidx.room.TypeConverter
import androidx.room.TypeConverters
import java.time.Instant

@Database(
    entities = [
        LogEntry::class,
        Photo::class,
        Video::class,
        VideoFrame::class,
        EditHistory::class,
        CustomCategory::class
    ],
    version = 1,
    exportSchema = false
)
@TypeConverters(Converters::class)
abstract class AppDatabase : RoomDatabase() {
    abstract fun logEntryDao(): LogEntryDao
    abstract fun photoDao(): PhotoDao
    abstract fun videoDao(): VideoDao
    abstract fun videoFrameDao(): VideoFrameDao
    abstract fun editHistoryDao(): EditHistoryDao
    abstract fun customCategoryDao(): CustomCategoryDao
}

class Converters {
    @TypeConverter
    fun fromInstant(value: Instant?): Long? = value?.toEpochMilli()

    @TypeConverter
    fun toInstant(value: Long?): Instant? = value?.let { Instant.ofEpochMilli(it) }
}
