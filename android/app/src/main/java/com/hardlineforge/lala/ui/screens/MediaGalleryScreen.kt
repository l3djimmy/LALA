package com.hardlineforge.lala.ui.screens

import android.graphics.BitmapFactory
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.outlined.Image
import androidx.compose.material.icons.outlined.Videocam
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavHostController
import com.hardlineforge.lala.data.Photo
import com.hardlineforge.lala.data.Video
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel

@Composable
fun MediaGalleryScreen(
    navController: NavHostController,
    vm: LalaViewModel = hiltViewModel()
) {
    LaunchedEffect(Unit) { vm.loadAllMedia() }
    val media by vm.allMedia.collectAsState()
    var filter by remember { mutableStateOf("all") }

    val filtered = when (filter) {
        "photo" -> media.filterIsInstance<Photo>()
        "video" -> media.filterIsInstance<Video>()
        else -> media
    }

    Column(modifier = Modifier.fillMaxSize().padding(16.dp)) {
        SingleChoiceSegmentedButtonRow {
            SegmentedButton(
                selected = filter == "all",
                onClick = { filter = "all" },
                shape = MaterialTheme.shapes.medium
            ) { Text("All") }
            SegmentedButton(
                selected = filter == "photo",
                onClick = { filter = "photo" },
                shape = MaterialTheme.shapes.medium
            ) { Icon(Icons.Outlined.Image, null); Spacer(modifier = Modifier.width(4.dp)); Text("Photos") }
            SegmentedButton(
                selected = filter == "video",
                onClick = { filter = "video" },
                shape = MaterialTheme.shapes.medium
            ) { Icon(Icons.Outlined.Videocam, null); Spacer(modifier = Modifier.width(4.dp)); Text("Videos") }
        }

        Spacer(modifier = Modifier.height(16.dp))

        if (filtered.isEmpty()) {
            Box(modifier = Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                Text("No media yet.", style = MaterialTheme.typography.bodyLarge)
            }
        } else {
            LazyVerticalGrid(
                columns = GridCells.Adaptive(minSize = 120.dp),
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(filtered, key = { when (it) {
                    is Photo -> it.id
                    is Video -> it.id
                    else -> it.hashCode()
                } }) { item ->
                    when (item) {
                        is Photo -> PhotoThumbnail(photo = item)
                        is Video -> VideoThumbnail(video = item, navController)
                    }
                }
            }
        }
    }
}

@Composable
private fun PhotoThumbnail(photo: Photo) {
    val bmp = remember(photo.uri) {
        BitmapFactory.decodeFile(photo.uri)?.asImageBitmap()
    }
    Box(
        modifier = Modifier
            .aspectRatio(1f)
            .background(MaterialTheme.colorScheme.surfaceVariant)
    ) {
        if (bmp != null) {
            Image(
                bitmap = bmp,
                contentDescription = photo.caption ?: "Photo",
                modifier = Modifier.fillMaxSize(),
                contentScale = ContentScale.Crop
            )
        } else {
            Icon(
                Icons.Outlined.Image,
                contentDescription = null,
                modifier = Modifier.align(Alignment.Center),
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun VideoThumbnail(video: Video, navController: NavHostController) {
    Box(
        modifier = Modifier
            .aspectRatio(1f)
            .background(MaterialTheme.colorScheme.surfaceVariant)
            .clickable { navController.navigate("filmstrip/${video.id}") },
        contentAlignment = Alignment.Center
    ) {
        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            Icon(
                Icons.Outlined.Videocam,
                contentDescription = null,
                modifier = Modifier.size(48.dp),
                tint = MaterialTheme.colorScheme.primary
            )
            Spacer(modifier = Modifier.height(4.dp))
            Text(
                "${video.durationSeconds}s",
                style = MaterialTheme.typography.labelSmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}
