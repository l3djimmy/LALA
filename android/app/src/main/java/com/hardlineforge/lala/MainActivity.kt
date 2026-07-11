package com.hardlineforge.lala

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.hilt.navigation.compose.hiltViewModel
import com.hardlineforge.lala.ui.screens.LalaApp
import com.hardlineforge.lala.ui.theme.LalaTheme
import com.hardlineforge.lala.ui.theme.fontScaleFor
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            val vm: LalaViewModel = hiltViewModel()
            val darkMode by vm.darkMode.collectAsState()
            val fontSize by vm.fontSize.collectAsState()
            val accentColor by vm.accentColor.collectAsState()

            LalaTheme(
                darkTheme = darkMode,
                accentColor = accentColor,
                fontScale = fontScaleFor(fontSize)
            ) {
                Surface(modifier = Modifier.fillMaxSize()) {
                    LalaApp()
                }
            }
        }
    }
}
