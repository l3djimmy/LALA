package com.hardlineforge.lala.data

import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.booleanPreferencesKey
import androidx.datastore.preferences.core.edit
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
    }

    val isPremium: Flow<Boolean> = context.dataStore.data.map { it[Keys.IS_PREMIUM] ?: false }

    suspend fun setPremium(premium: Boolean) {
        context.dataStore.edit { it[Keys.IS_PREMIUM] = premium }
    }
}
