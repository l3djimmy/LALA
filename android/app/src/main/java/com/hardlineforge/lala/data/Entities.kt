package com.hardlineforge.lala.data

import androidx.room.*
import java.time.Instant
import java.util.UUID

@Entity(tableName = "log_entries")
data class LogEntry(
    @PrimaryKey val id: String = UUID.randomUUID().toString(),
    val title: String = "",
    val timestamp: Instant = Instant.now(),
    val timezone: String = java.time.ZoneId.systemDefault().id,
    val gpsLat: Double? = null,
    val gpsLon: Double? = null,
    val gpsAccuracy: Float? = null,
    val category: String,
    val locationName: String? = null,
    val comment: String,
    val tags: String = "",
    val createdAt: Instant = Instant.now(),
    val updatedAt: Instant = Instant.now()
)

// No FK on entryId: photos/videos are captured (and attached to a not-yet-saved
// draft entryId) before the parent LogEntry row exists, so this link is
// intentionally soft rather than DB-enforced.
@Entity(
    tableName = "photos",
    indices = [Index("entryId")]
)
data class Photo(
    @PrimaryKey val id: String = UUID.randomUUID().toString(),
    val entryId: String,
    val uri: String,
    val caption: String? = null,
    val timestamp: Instant = Instant.now(),
    val gpsLat: Double? = null,
    val gpsLon: Double? = null
)

@Entity(
    tableName = "videos",
    indices = [Index("entryId")]
)
data class Video(
    @PrimaryKey val id: String = UUID.randomUUID().toString(),
    val entryId: String,
    val uri: String,
    val durationSeconds: Int,
    val thumbnailUri: String? = null,
    val timestamp: Instant = Instant.now(),
    val gpsLat: Double? = null,
    val gpsLon: Double? = null
)

@Entity(
    tableName = "video_frames",
    foreignKeys = [ForeignKey(
        entity = Video::class,
        parentColumns = ["id"],
        childColumns = ["videoId"],
        onDelete = ForeignKey.CASCADE
    )],
    indices = [Index("videoId")]
)
data class VideoFrame(
    @PrimaryKey val id: String = UUID.randomUUID().toString(),
    val videoId: String,
    val frameNumber: Int,
    val timeOffsetMs: Int,
    val uri: String,
    val extractedAt: Instant = Instant.now()
)

@Entity(tableName = "edit_history")
data class EditHistory(
    @PrimaryKey val id: String = UUID.randomUUID().toString(),
    val entryId: String,
    val editedAt: Instant = Instant.now(),
    val note: String? = null
)

@Entity(tableName = "custom_categories")
data class CustomCategory(
    @PrimaryKey val id: String = UUID.randomUUID().toString(),
    val name: String,
    val createdAt: Instant = Instant.now()
)
