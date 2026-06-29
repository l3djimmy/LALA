package com.hardlineforge.lala.ui.screens

import androidx.compose.foundation.layout.padding
import androidx.compose.material3.DrawerValue
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.ModalDrawerSheet
import androidx.compose.material3.ModalNavigationDrawer
import androidx.compose.material3.Scaffold
import androidx.compose.material3.rememberDrawerState
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.currentBackStackEntryAsState
import androidx.navigation.compose.rememberNavController
import kotlinx.coroutines.launch

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LalaApp() {
    val navController = rememberNavController()
    val drawerState = rememberDrawerState(initialValue = DrawerValue.Closed)
    val scope = rememberCoroutineScope()

    ModalNavigationDrawer(
        drawerState = drawerState,
        drawerContent = {
            ModalDrawerSheet {
                DrawerContent(navController) {
                    scope.launch { drawerState.close() }
                }
            }
        }
    ) {
        Scaffold(
            topBar = {
                val currentRoute = currentRoute(navController)
                if (currentRoute != null && currentRoute != "splash") {
                    LalaTopBar(
                        title = routeTitle(currentRoute),
                        onMenuClick = { scope.launch { drawerState.open() } },
                        onSearchClick = {
                            navController.navigate("search")
                        },
                        showMenu = currentRoute == "timeline"
                    )
                }
            }
        ) { padding ->
            NavHost(
                navController = navController,
                startDestination = "timeline",
                modifier = Modifier.padding(padding)
            ) {
                composable("timeline") { TimelineScreen(navController) }
                composable("map_view") { MapViewScreen() }
                composable("media_gallery") { MediaGalleryScreen(navController) }
                composable("reports") { ReportsScreen(navController) }
                composable("settings") { SettingsScreen() }
                composable("search") { SearchScreen(navController) }
                composable("new_entry") { AddEditScreen(navController, entryId = null) }
                composable("edit_entry/{entryId}") { backStack ->
                    val id = backStack.arguments?.getString("entryId") ?: ""
                    AddEditScreen(navController, entryId = id)
                }
                composable("entry_detail/{entryId}") { backStack ->
                    val id = backStack.arguments?.getString("entryId") ?: ""
                    EntryDetailScreen(navController, entryId = id)
                }
                composable("pdf_preview") { PdfPreviewScreen(navController) }
                composable("camera_capture/{entryId}") { backStack ->
                    val id = backStack.arguments?.getString("entryId") ?: ""
                    CameraCaptureScreen(navController, entryId = id)
                }
                composable("filmstrip/{videoId}") { backStack ->
                    val id = backStack.arguments?.getString("videoId") ?: ""
                    FilmstripScreen(navController, videoId = id)
                }
            }
        }
    }
}

@Composable
private fun currentRoute(navController: NavHostController): String? {
    val navBackStackEntry by navController.currentBackStackEntryAsState()
    return navBackStackEntry?.destination?.route?.substringBefore("/")
}

private fun routeTitle(route: String): String = when (route) {
    "timeline" -> "Timeline"
    "map_view" -> "Map View"
    "media_gallery" -> "Media Gallery"
    "reports" -> "Reports"
    "settings" -> "Settings"
    "search" -> "Search"
    "new_entry" -> "New Entry"
    "edit_entry" -> "Edit Entry"
    "entry_detail" -> "Entry Detail"
    "pdf_preview" -> "Report Preview"
    "camera_capture" -> "Camera"
    "filmstrip" -> "Filmstrip"
    else -> "LALA"
}
