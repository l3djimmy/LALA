package com.hardlineforge.lala.ui.screens

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.Path
import android.graphics.drawable.BitmapDrawable
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalLifecycleOwner
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleEventObserver
import androidx.navigation.NavHostController
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.osmdroid.tileprovider.tilesource.TileSourceFactory
import org.osmdroid.util.BoundingBox
import org.osmdroid.util.GeoPoint
import org.osmdroid.views.MapView
import org.osmdroid.views.overlay.Marker

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MapViewScreen(navController: NavHostController, vm: LalaViewModel = hiltViewModel()) {
    val entries by vm.allEntries.collectAsState()
    val geotagged = entries.filter { it.gpsLat != null && it.gpsLon != null }
    val context = LocalContext.current
    val lifecycleOwner = LocalLifecycleOwner.current

    var thumbnails by remember { mutableStateOf(mapOf<String, Bitmap>()) }

    LaunchedEffect(geotagged.map { it.id }) {
        val result = mutableMapOf<String, Bitmap>()
        for (entry in geotagged) {
            val photoUri = vm.getPhotos(entry.id).firstOrNull()?.uri ?: continue
            val thumb = withContext(Dispatchers.IO) {
                BitmapFactory.decodeFile(photoUri)?.let { toMarkerThumbnail(it) }
            }
            if (thumb != null) result[entry.id] = thumb
        }
        thumbnails = result
    }

    val mapView = remember {
        MapView(context).apply {
            setTileSource(TileSourceFactory.MAPNIK)
            setMultiTouchControls(true)
            controller.setZoom(13.0)
        }
    }

    DisposableEffect(lifecycleOwner, mapView) {
        val observer = LifecycleEventObserver { _, event ->
            when (event) {
                Lifecycle.Event.ON_RESUME -> mapView.onResume()
                Lifecycle.Event.ON_PAUSE -> mapView.onPause()
                else -> {}
            }
        }
        lifecycleOwner.lifecycle.addObserver(observer)
        onDispose {
            lifecycleOwner.lifecycle.removeObserver(observer)
            mapView.onDetach()
        }
    }

    Scaffold(
        topBar = { TopAppBar(title = { Text("Map View") }) }
    ) { innerPadding ->
        Box(modifier = Modifier.padding(innerPadding).fillMaxSize()) {
            AndroidView(
                modifier = Modifier.fillMaxSize(),
                factory = { mapView },
                update = { view ->
                    view.overlays.clear()
                    geotagged.forEach { entry ->
                        val thumb = thumbnails[entry.id]
                        val marker = Marker(view).apply {
                            position = GeoPoint(entry.gpsLat!!, entry.gpsLon!!)
                            title = entry.category
                            snippet = entry.comment.take(80)
                            setOnMarkerClickListener { _, _ ->
                                navController.navigate("entry_detail/${entry.id}")
                                true
                            }
                        }
                        if (thumb != null) {
                            marker.icon = BitmapDrawable(context.resources, thumb)
                            marker.setAnchor(Marker.ANCHOR_CENTER, Marker.ANCHOR_CENTER)
                        } else {
                            marker.setAnchor(Marker.ANCHOR_CENTER, Marker.ANCHOR_BOTTOM)
                        }
                        view.overlays.add(marker)
                    }

                    val lats = geotagged.map { it.gpsLat!! }
                    val lons = geotagged.map { it.gpsLon!! }
                    if (geotagged.size == 1) {
                        view.controller.setZoom(15.0)
                        view.controller.setCenter(GeoPoint(lats[0], lons[0]))
                    } else if (geotagged.size > 1) {
                        val box = BoundingBox(
                            lats.max(), lons.max(),
                            lats.min(), lons.min()
                        )
                        view.post { view.zoomToBoundingBox(box, false, 100) }
                    } else {
                        view.controller.setZoom(2.0)
                    }
                    view.invalidate()
                }
            )

            if (geotagged.isEmpty()) {
                Surface(
                    modifier = Modifier.align(Alignment.TopCenter).padding(16.dp),
                    color = MaterialTheme.colorScheme.surface.copy(alpha = 0.9f),
                    shape = MaterialTheme.shapes.medium
                ) {
                    Text(
                        "No geotagged entries yet.",
                        modifier = Modifier.padding(horizontal = 16.dp, vertical = 8.dp),
                        style = MaterialTheme.typography.bodyMedium
                    )
                }
            }
        }
    }
}

/** Crops [source] to a square, scales it down, and draws it inside a white-ringed circle for use as a map marker. */
private fun toMarkerThumbnail(source: Bitmap, sizePx: Int = 120, ringPx: Int = 6): Bitmap {
    val side = minOf(source.width, source.height)
    val cropped = Bitmap.createBitmap(
        source,
        (source.width - side) / 2,
        (source.height - side) / 2,
        side,
        side
    )
    val scaled = Bitmap.createScaledBitmap(cropped, sizePx, sizePx, true)

    val outputSize = sizePx + ringPx * 2
    val output = Bitmap.createBitmap(outputSize, outputSize, Bitmap.Config.ARGB_8888)
    val canvas = Canvas(output)
    val center = outputSize / 2f

    val ringPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply { color = Color.WHITE }
    canvas.drawCircle(center, center, center, ringPaint)

    val clipPath = Path().apply {
        addCircle(center, center, sizePx / 2f, Path.Direction.CW)
    }
    canvas.save()
    canvas.clipPath(clipPath)
    canvas.drawBitmap(scaled, ringPx.toFloat(), ringPx.toFloat(), null)
    canvas.restore()

    return output
}
