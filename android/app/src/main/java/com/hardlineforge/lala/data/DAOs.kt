package com.hardlineforge.lala.data

import androidx.room.*
import kotlinx.coroutines.flow.Flow
import java.time.Instant

@Dao
interface LogEntryDao {
    @Query("SELECT * FROM log_entries ORDER BY timestamp DESC")
    fun getAll(): Flow<List<LogEntry>>

    @Query("SELECT * FROM log_entries WHERE id = :id")
    suspend fun getById(id: String): LogEntry?

    @Query("SELECT * FROM log_entries WHERE category = :category ORDER BY timestamp DESC")
    fun getByCategory(category: String): Flow<List<LogEntry>>

    @Query("""
        SELECT * FROM log_entries
        WHERE comment LIKE '%' || :query || '%'
           OR locationName LIKE '%' || :query || '%'
           OR tags LIKE '%' || :query || '%'
           OR category LIKE '%' || :query || '%'
        ORDER BY timestamp DESC
    """)
    fun search(query: String): Flow<List<LogEntry>>

    @Query("SELECT * FROM log_entries WHERE timestamp BETWEEN :start AND :end ORDER BY timestamp DESC")
    fun getByDateRange(start: Instant, end: Instant): Flow<List<LogEntry>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(entry: LogEntry): Long

    @Update
    suspend fun update(entry: LogEntry)

    @Delete
    suspend fun delete(entry: LogEntry)

    @Query("DELETE FROM log_entries WHERE id = :id")
    suspend fun deleteById(id: String)
}

@Dao
interface PhotoDao {
    @Query("SELECT * FROM photos WHERE entryId = :entryId")
    suspend fun getByEntryId(entryId: String): List<Photo>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(photo: Photo)

    @Delete
    suspend fun delete(photo: Photo)
}

@Dao
interface VideoDao {
    @Query("SELECT * FROM videos WHERE entryId = :entryId")
    suspend fun getByEntryId(entryId: String): List<Video>

    @Query("SELECT * FROM videos WHERE id = :id")
    suspend fun getById(id: String): Video?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(video: Video)

    @Delete
    suspend fun delete(video: Video)
}

@Dao
interface VideoFrameDao {
    @Query("SELECT * FROM video_frames WHERE videoId = :videoId ORDER BY frameNumber")
    suspend fun getByVideoId(videoId: String): List<VideoFrame>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(frame: VideoFrame)

    @Query("DELETE FROM video_frames WHERE videoId = :videoId")
    suspend fun deleteByVideoId(videoId: String)
}

@Dao
interface EditHistoryDao {
    @Query("SELECT * FROM edit_history WHERE entryId = :entryId ORDER BY editedAt")
    suspend fun getByEntryId(entryId: String): List<EditHistory>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insert(history: EditHistory)
}

@Dao
interface CustomCategoryDao {
    @Query("SELECT * FROM custom_categories ORDER BY name")
    fun getAll(): Flow<List<CustomCategory>>

    @Insert(onConflict = OnConflictStrategy.ABORT)
    suspend fun insert(category: CustomCategory)

    @Delete
    suspend fun delete(category: CustomCategory)
}
