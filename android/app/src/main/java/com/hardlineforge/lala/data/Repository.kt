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
    suspend fun deleteEntry(entry: LogEntry) = entryDao.delete(entry)
    suspend fun deleteEntryById(id: String) = entryDao.deleteById(id)

    suspend fun getPhotos(entryId: String): List<Photo> = photoDao.getByEntryId(entryId)
    suspend fun insertPhoto(photo: Photo) = photoDao.insert(photo)
    suspend fun deletePhoto(photo: Photo) = photoDao.delete(photo)

    suspend fun getVideos(entryId: String): List<Video> = videoDao.getByEntryId(entryId)
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
}
