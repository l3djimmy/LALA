package com.hardlineforge.lala.data

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.booleanPreferencesKey
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map
import javax.inject.Inject
import javax.inject.Singleton

private val Context.dataStore: DataStore<Preferences> by preferencesDataStore(name = "lala_settings")

@Singleton
class UserPreferences @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private object Keys {
        val IS_PREMIUM = booleanPreferencesKey("is_premium")
        val DARK_MODE = booleanPreferencesKey("dark_mode")
        val FONT_SIZE = stringPreferencesKey("font_size")
        val ACCENT_COLOR = stringPreferencesKey("accent_color")
        val ONBOARDING_COMPLETE = booleanPreferencesKey("onboarding_complete")
    }

    val onboardingComplete: Flow<Boolean> =
        context.dataStore.data.map { it[Keys.ONBOARDING_COMPLETE] ?: false }

    suspend fun setOnboardingComplete(complete: Boolean) {
        context.dataStore.edit { it[Keys.ONBOARDING_COMPLETE] = complete }
    }

    val isPremium: Flow<Boolean> = context.dataStore.data.map { it[Keys.IS_PREMIUM] ?: false }

    suspend fun setPremium(premium: Boolean) {
        context.dataStore.edit { it[Keys.IS_PREMIUM] = premium }
    }

    val darkMode: Flow<Boolean> = context.dataStore.data.map { it[Keys.DARK_MODE] ?: false }

    suspend fun setDarkMode(enabled: Boolean) {
        context.dataStore.edit { it[Keys.DARK_MODE] = enabled }
    }

    /** One of "small", "default", "large", "xlarge". */
    val fontSize: Flow<String> = context.dataStore.data.map { it[Keys.FONT_SIZE] ?: "default" }

    suspend fun setFontSize(size: String) {
        context.dataStore.edit { it[Keys.FONT_SIZE] = size }
    }

    /** One of "blue", "green", "purple", "orange". */
    val accentColor: Flow<String> = context.dataStore.data.map { it[Keys.ACCENT_COLOR] ?: "blue" }

    suspend fun setAccentColor(color: String) {
        context.dataStore.edit { it[Keys.ACCENT_COLOR] = color }
    }
}
