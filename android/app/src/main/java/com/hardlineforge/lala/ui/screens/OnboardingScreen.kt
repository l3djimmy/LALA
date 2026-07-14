@file:OptIn(androidx.compose.foundation.ExperimentalFoundationApi::class)

package com.hardlineforge.lala.ui.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.pager.HorizontalPager
import androidx.compose.foundation.pager.rememberPagerState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.AddLocationAlt
import androidx.compose.material.icons.filled.CameraAlt
import androidx.compose.material.icons.filled.EditNote
import androidx.compose.material.icons.filled.Map
import androidx.compose.material.icons.filled.PictureAsPdf
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import kotlinx.coroutines.launch

private data class OnboardingPage(
    val icon: ImageVector,
    val title: String,
    val body: String
)

private val pages = listOf(
    OnboardingPage(
        icon = Icons.Filled.AddLocationAlt,
        title = "Welcome to Lala",
        body = "Your local area log. Every entry is automatically stamped with GPS location, date, and time — so you always know exactly what happened, when, and where."
    ),
    OnboardingPage(
        icon = Icons.Filled.EditNote,
        title = "Log events as they happen",
        body = "Tap the Log button on the timeline. Location and time fill in on their own — just add a title and describe what happened. Tap the mic icon to speak your comment instead of typing."
    ),
    OnboardingPage(
        icon = Icons.Filled.CameraAlt,
        title = "Attach photos & video",
        body = "Add photos or record video (with sound) straight from the entry. Captured media attaches to the entry automatically and shows up in your Media Gallery too."
    ),
    OnboardingPage(
        icon = Icons.Filled.Map,
        title = "See it all on the map",
        body = "Every geotagged entry appears as a pin on the Map View — entries with photos show a photo thumbnail. Tap a pin to open that entry."
    ),
    OnboardingPage(
        icon = Icons.Filled.PictureAsPdf,
        title = "Export a report",
        body = "Turn your log into a PDF report with entries, photos, and video filmstrips included. You can replay this tutorial anytime from Settings."
    )
)

@Composable
fun OnboardingScreen(onDone: () -> Unit) {
    val pagerState = rememberPagerState(pageCount = { pages.size })
    val scope = rememberCoroutineScope()
    val isLastPage = pagerState.currentPage == pages.lastIndex

    Surface(modifier = Modifier.fillMaxSize()) {
        Column(modifier = Modifier.fillMaxSize()) {
            Row(
                modifier = Modifier.fillMaxWidth().padding(horizontal = 8.dp, vertical = 4.dp),
                horizontalArrangement = Arrangement.End
            ) {
                TextButton(onClick = onDone) { Text("Skip") }
            }

            HorizontalPager(
                state = pagerState,
                modifier = Modifier.weight(1f)
            ) { pageIndex ->
                val page = pages[pageIndex]
                Column(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(horizontal = 32.dp),
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.Center
                ) {
                    Box(
                        modifier = Modifier
                            .size(120.dp)
                            .clip(CircleShape)
                            .background(MaterialTheme.colorScheme.primary.copy(alpha = 0.12f)),
                        contentAlignment = Alignment.Center
                    ) {
                        Icon(
                            imageVector = page.icon,
                            contentDescription = null,
                            modifier = Modifier.size(56.dp),
                            tint = MaterialTheme.colorScheme.primary
                        )
                    }
                    Spacer(modifier = Modifier.height(32.dp))
                    Text(
                        page.title,
                        style = MaterialTheme.typography.headlineMedium,
                        textAlign = TextAlign.Center
                    )
                    Spacer(modifier = Modifier.height(16.dp))
                    Text(
                        page.body,
                        style = MaterialTheme.typography.bodyLarge,
                        textAlign = TextAlign.Center,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            // Page indicator dots
            Row(
                modifier = Modifier.fillMaxWidth().padding(vertical = 16.dp),
                horizontalArrangement = Arrangement.Center,
                verticalAlignment = Alignment.CenterVertically
            ) {
                repeat(pages.size) { index ->
                    val selected = pagerState.currentPage == index
                    Box(
                        modifier = Modifier
                            .padding(horizontal = 4.dp)
                            .size(if (selected) 10.dp else 8.dp)
                            .clip(CircleShape)
                            .background(
                                if (selected) MaterialTheme.colorScheme.primary
                                else MaterialTheme.colorScheme.surfaceVariant
                            )
                    )
                }
            }

            Button(
                onClick = {
                    if (isLastPage) {
                        onDone()
                    } else {
                        scope.launch { pagerState.animateScrollToPage(pagerState.currentPage + 1) }
                    }
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 32.dp)
                    .padding(bottom = 32.dp)
                    .heightIn(min = 52.dp),
                shape = MaterialTheme.shapes.medium
            ) {
                Text(
                    if (isLastPage) "Get Started" else "Next",
                    style = MaterialTheme.typography.titleMedium
                )
            }
        }
    }
}
