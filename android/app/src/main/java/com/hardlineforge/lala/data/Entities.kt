package com.hardlineforge.lala.data

import androidx.room.*
import java.time.Instant
import java.util.UUID

@Entity(tableName = "log_entries")
data class LogEntry(
    @PrimaryKey val id: String = UUID.randomUUID().toString(),
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

@Entity(
    tableName = "photos",
    foreignKeys = [ForeignKey(
        entity = LogEntry::class,
        parentColumns = ["id"],
        childColumns = ["entryId"],
        onDelete = ForeignKey.CASCADE
    )]
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
    foreignKeys = [ForeignKey(
        entity = LogEntry::class,
        parentColumns = ["id"],
        childColumns = ["entryId"],
        onDelete = ForeignKey.CASCADE
    )]
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
    )]
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
