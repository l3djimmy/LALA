package com.hardlineforge.lala.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.platform.LocalLifecycleOwner
import androidx.compose.ui.viewinterop.AndroidView
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleEventObserver
import androidx.navigation.NavHostController
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel
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
            if (geotagged.isEmpty()) {
                Text(
                    "No geotagged entries yet.",
                    modifier = Modifier.align(Alignment.Center),
                    style = MaterialTheme.typography.bodyLarge
                )
            } else {
                AndroidView(
                    modifier = Modifier.fillMaxSize(),
                    factory = { mapView },
                    update = { view ->
                        view.overlays.clear()
                        geotagged.forEach { entry ->
                            val marker = Marker(view).apply {
                                position = GeoPoint(entry.gpsLat!!, entry.gpsLon!!)
                                setAnchor(Marker.ANCHOR_CENTER, Marker.ANCHOR_BOTTOM)
                                title = entry.category
                                snippet = entry.comment.take(80)
                                setOnMarkerClickListener { _, _ ->
                                    navController.navigate("entry_detail/${entry.id}")
                                    true
                                }
                            }
                            view.overlays.add(marker)
                        }

                        val lats = geotagged.map { it.gpsLat!! }
                        val lons = geotagged.map { it.gpsLon!! }
                        if (geotagged.size == 1) {
                            view.controller.setCenter(GeoPoint(lats[0], lons[0]))
                        } else {
                            val box = BoundingBox(
                                lats.max(), lons.max(),
                                lats.min(), lons.min()
                            )
                            view.post { view.zoomToBoundingBox(box, false, 100) }
                        }
                        view.invalidate()
                    }
                )
            }
        }
    }
}
