package com.hardlineforge.lala.ui.viewmodel

import android.location.Location
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.hardlineforge.lala.data.*
import com.hardlineforge.lala.location.LocationManager
import com.hardlineforge.lala.media.VideoFrameExtractor
import com.hardlineforge.lala.pdf.PdfGenerator
import com.hardlineforge.lala.util.DebugLog
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import java.io.File
import java.time.Instant
import javax.inject.Inject

@OptIn(ExperimentalCoroutinesApi::class)
@HiltViewModel
class LalaViewModel @Inject constructor(
    private val repo: LogRepository,
    private val locationManager: LocationManager,
    private val videoFrameExtractor: VideoFrameExtractor,
    private val userPreferences: UserPreferences,
    private val pdfGenerator: PdfGenerator,
    private val appScope: CoroutineScope
) : ViewModel() {

    val frameExtractor: VideoFrameExtractor
        get() = videoFrameExtractor

    val isPremium: StateFlow<Boolean> = userPreferences.isPremium
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), false)

    fun setPremium(premium: Boolean) {
        viewModelScope.launch { userPreferences.setPremium(premium) }
    }

    val darkMode: StateFlow<Boolean> = userPreferences.darkMode
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), false)

    fun setDarkMode(enabled: Boolean) {
        viewModelScope.launch { userPreferences.setDarkMode(enabled) }
    }

    val fontSize: StateFlow<String> = userPreferences.fontSize
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), "default")

    fun setFontSize(size: String) {
        viewModelScope.launch { userPreferences.setFontSize(size) }
    }

    val accentColor: StateFlow<String> = userPreferences.accentColor
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), "blue")

    fun setAccentColor(color: String) {
        viewModelScope.launch { userPreferences.setAccentColor(color) }
    }

    /** Exposed as a raw Flow so the UI can distinguish "not loaded yet" (null initial) from false. */
    val onboardingComplete: Flow<Boolean> = userPreferences.onboardingComplete

    fun setOnboardingComplete(complete: Boolean) {
        viewModelScope.launch { userPreferences.setOnboardingComplete(complete) }
    }

    /** Generates the case log PDF, embedding photos/filmstrips and stamping a watermark for free-tier users. */
    suspend fun generatePdfReport(entries: List<LogEntry>, file: File): File =
        pdfGenerator.generate(entries, file, isPremium.value)

    val allEntries: StateFlow<List<LogEntry>> = repo.getAllEntries()
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    val customCategories: StateFlow<List<CustomCategory>> = repo.getCustomCategories()
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    private val _selectedEntry = MutableStateFlow<LogEntry?>(null)
    val selectedEntry: StateFlow<LogEntry?> = _selectedEntry.asStateFlow()

    private val _searchQuery = MutableStateFlow("")
    val searchResults: StateFlow<List<LogEntry>> = _searchQuery
        .flatMapLatest { q ->
            if (q.isBlank()) flowOf(emptyList()) else repo.searchEntries(q)
        }.stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    private val _photos = MutableStateFlow<List<Photo>>(emptyList())
    val photos: StateFlow<List<Photo>> = _photos.asStateFlow()

    private val _videos = MutableStateFlow<List<Video>>(emptyList())
    val videos: StateFlow<List<Video>> = _videos.asStateFlow()

    private val _editHistory = MutableStateFlow<List<EditHistory>>(emptyList())
    val editHistory: StateFlow<List<EditHistory>> = _editHistory.asStateFlow()

    private val _allMedia = MutableStateFlow<List<Any>>(emptyList())
    val allMedia: StateFlow<List<Any>> = _allMedia.asStateFlow()

    fun setSearchQuery(q: String) { _searchQuery.value = q }

    fun loadEntry(entryId: String) {
        viewModelScope.launch {
            val entry = repo.getEntryById(entryId)
            _selectedEntry.value = entry
            if (entry != null) {
                _photos.value = repo.getPhotos(entryId)
                _videos.value = repo.getVideos(entryId)
                _editHistory.value = repo.getEditHistory(entryId)
            }
        }
    }

    fun saveEntry(
        entry: LogEntry,
        isNew: Boolean,
        editNote: String? = null
    ) {
        viewModelScope.launch {
            DebugLog.log("Data", "saveEntry id=${entry.id} isNew=$isNew title='${entry.title}' gps=${entry.gpsLat != null}")
            if (isNew) {
                repo.insertEntry(entry)
            } else {
                repo.updateEntry(entry)
                if (!editNote.isNullOrBlank()) {
                    repo.insertEditHistory(
                        EditHistory(entryId = entry.id, note = editNote)
                    )
                }
            }
        }
    }

    fun deleteEntry(entry: LogEntry) {
        viewModelScope.launch {
            repo.deleteEntry(entry)
            _selectedEntry.value = null
        }
    }

    // Media inserts run on the app-lifetime scope, NOT viewModelScope: the camera
    // screen's ViewModel is destroyed when the user backs out, and a viewModelScope
    // insert racing that destruction (video finalize after fast back-out) gets
    // cancelled — silently dropping the attach.
    fun addPhoto(photo: Photo) {
        appScope.launch {
            repo.insertPhoto(photo)
            DebugLog.log("Data", "photo attached to entry ${photo.entryId}: ${photo.uri}")
        }
    }

    suspend fun getPhotos(entryId: String): List<Photo> = repo.getPhotos(entryId)
    fun observePhotos(entryId: String): Flow<List<Photo>> = repo.observePhotos(entryId)
    fun observeVideos(entryId: String): Flow<List<Video>> = repo.observeVideos(entryId)

    fun deletePhoto(photo: Photo) {
        viewModelScope.launch { repo.deletePhoto(photo) }
    }

    fun addVideo(video: Video) {
        appScope.launch {
            repo.insertVideo(video)
            DebugLog.log("Data", "video attached to entry ${video.entryId}: ${video.uri} (${video.durationSeconds}s)")
        }
    }

    suspend fun getVideoById(id: String): Video? = repo.getVideoById(id)
    suspend fun getVideoFrames(videoId: String): List<VideoFrame> = repo.getVideoFrames(videoId)

    fun addVideoFrame(frame: VideoFrame) {
        viewModelScope.launch { repo.insertVideoFrame(frame) }
    }

    fun deleteVideo(video: Video) {
        viewModelScope.launch { repo.deleteVideo(video) }
    }

    fun deleteVideoFrames(videoId: String) {
        viewModelScope.launch { repo.deleteVideoFrames(videoId) }
    }

    fun addCustomCategory(name: String) {
        viewModelScope.launch {
            repo.insertCustomCategory(CustomCategory(name = name))
        }
    }

    fun deleteCustomCategory(category: CustomCategory) {
        viewModelScope.launch {
            repo.deleteCustomCategory(category)
        }
    }

    fun getDefaultCategories(): List<String> = listOf(
        "Noise",
        "Suspicious Activity",
        "Property Damage",
        "Animal Issue",
        "Parking",
        "Trash / Yard",
        "HOA / Code Violation",
        "Safety Hazard",
        "Poaching / Wildlife",
        "Other"
    )

    fun loadAllMedia() {
        viewModelScope.launch {
            val entries = repo.getAllEntries().first()
            val media = mutableListOf<Any>()
            for (e in entries) {
                media.addAll(repo.getPhotos(e.id))
                media.addAll(repo.getVideos(e.id))
            }
            _allMedia.value = media
        }
    }

    fun exportEntries(start: Instant?, end: Instant?): Flow<List<LogEntry>> {
        return if (start != null && end != null) {
            repo.getEntriesByDateRange(start, end)
        } else {
            repo.getAllEntries()
        }
    }

    /** Returns current GPS location or null if permission denied / unavailable. */
    suspend fun captureLocation(): Location? {
        if (!locationManager.hasPermission()) return null
        return try {
            locationManager.currentLocation().firstOrNull()
        } catch (_: Exception) {
            null
        }
    }
}
