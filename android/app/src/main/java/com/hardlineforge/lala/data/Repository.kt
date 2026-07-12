package com.hardlineforge.lala.data

import kotlinx.coroutines.flow.Flow
import java.time.Instant
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class LogRepository @Inject constructor(
    private val db: AppDatabase
) {
    private val entryDao = db.logEntryDao()
    private val photoDao = db.photoDao()
    private val videoDao = db.videoDao()
    private val frameDao = db.videoFrameDao()
    private val editDao = db.editHistoryDao()
    private val categoryDao = db.customCategoryDao()

    fun getAllEntries(): Flow<List<LogEntry>> = entryDao.getAll()

    fun getEntriesByCategory(category: String): Flow<List<LogEntry>> =
        entryDao.getByCategory(category)

    fun searchEntries(query: String): Flow<List<LogEntry>> =
        entryDao.search(query)

    fun getEntriesByDateRange(start: Instant, end: Instant): Flow<List<LogEntry>> =
        entryDao.getByDateRange(start, end)

    suspend fun getEntryById(id: String): LogEntry? = entryDao.getById(id)

    suspend fun insertEntry(entry: LogEntry) = entryDao.insert(entry)
    suspend fun updateEntry(entry: LogEntry) = entryDao.update(entry)

    suspend fun deleteEntry(entry: LogEntry) {
        entryDao.delete(entry)
        photoDao.deleteByEntryId(entry.id)
        videoDao.deleteByEntryId(entry.id)
    }

    suspend fun deleteEntryById(id: String) {
        entryDao.deleteById(id)
        photoDao.deleteByEntryId(id)
        videoDao.deleteByEntryId(id)
    }

    suspend fun getPhotos(entryId: String): List<Photo> = photoDao.getByEntryId(entryId)
    fun observePhotos(entryId: String): Flow<List<Photo>> = photoDao.observeByEntryId(entryId)
    suspend fun insertPhoto(photo: Photo) = photoDao.insert(photo)
    suspend fun deletePhoto(photo: Photo) = photoDao.delete(photo)

    suspend fun getVideos(entryId: String): List<Video> = videoDao.getByEntryId(entryId)
    fun observeVideos(entryId: String): Flow<List<Video>> = videoDao.observeByEntryId(entryId)
    suspend fun getVideoById(id: String): Video? = videoDao.getById(id)
    suspend fun insertVideo(video: Video) = videoDao.insert(video)
    suspend fun deleteVideo(video: Video) = videoDao.delete(video)

    suspend fun getVideoFrames(videoId: String): List<VideoFrame> = frameDao.getByVideoId(videoId)
    suspend fun insertVideoFrame(frame: VideoFrame) = frameDao.insert(frame)
    suspend fun deleteVideoFrames(videoId: String) = frameDao.deleteByVideoId(videoId)

    suspend fun getEditHistory(entryId: String): List<EditHistory> =
        editDao.getByEntryId(entryId)
    suspend fun insertEditHistory(history: EditHistory) = editDao.insert(history)

    fun getCustomCategories(): Flow<List<CustomCategory>> = categoryDao.getAll()
    suspend fun insertCustomCategory(category: CustomCategory) = categoryDao.insert(category)
    suspend fun deleteCustomCategory(category: CustomCategory) = categoryDao.delete(category)

    /**
     * Reattaches photos/videos whose entryId no longer matches any log entry (e.g. captures
     * from a draft that was never saved) to a single auto-created "Recovered media" entry,
     * so they become visible again instead of sitting invisibly in the database.
     * Returns the number of recovered items.
     */
    suspend fun recoverOrphanedMedia(): Int {
        val orphanPhotos = photoDao.getOrphaned()
        val orphanVideos = videoDao.getOrphaned()
        if (orphanPhotos.isEmpty() && orphanVideos.isEmpty()) return 0

        val recovery = LogEntry(
            title = "Recovered media",
            category = "Other",
            comment = "Photos/videos recovered from entries that were never saved. " +
                "They were re-attached here automatically so they wouldn't be lost."
        )
        entryDao.insert(recovery)
        if (orphanPhotos.isNotEmpty()) photoDao.reassign(orphanPhotos.map { it.id }, recovery.id)
        if (orphanVideos.isNotEmpty()) videoDao.reassign(orphanVideos.map { it.id }, recovery.id)
        return orphanPhotos.size + orphanVideos.size
    }
}
