package com.hardlineforge.lala.location

import android.Manifest
import android.annotation.SuppressLint
import android.content.Context
import android.content.pm.PackageManager
import android.location.Location
import android.location.LocationListener
import android.location.LocationManager as AndroidLocationManager
import android.os.Bundle
import android.os.Looper
import androidx.core.content.ContextCompat
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.channels.awaitClose
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.callbackFlow
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class LocationManager @Inject constructor(
    @ApplicationContext private val context: Context
) {
    private val locationManager: AndroidLocationManager = context.getSystemService(Context.LOCATION_SERVICE) as AndroidLocationManager

    fun hasPermission(): Boolean {
        return ContextCompat.checkSelfPermission(
            context, Manifest.permission.ACCESS_FINE_LOCATION
        ) == PackageManager.PERMISSION_GRANTED ||
        ContextCompat.checkSelfPermission(
            context, Manifest.permission.ACCESS_COARSE_LOCATION
        ) == PackageManager.PERMISSION_GRANTED
    }

    @SuppressLint("MissingPermission")
    fun currentLocation(): Flow<Location> = callbackFlow {
        if (!hasPermission()) {
            close(IllegalStateException("Location permission not granted"))
            return@callbackFlow
        }

        val listener = object : LocationListener {
            override fun onLocationChanged(location: Location) {
                trySend(location)
            }
            override fun onStatusChanged(provider: String?, status: Int, extras: Bundle?) {}
            override fun onProviderEnabled(provider: String) {}
            override fun onProviderDisabled(provider: String) {}
        }

        try {
            locationManager.requestLocationUpdates(
                AndroidLocationManager.GPS_PROVIDER,
                5000L,  // minTimeMs
                10f,    // minDistanceM
                listener,
                Looper.getMainLooper()
            )
        } catch (e: Exception) {
            // GPS provider not available, try network
            try {
                locationManager.requestLocationUpdates(
                    AndroidLocationManager.NETWORK_PROVIDER,
                    5000L,
                    10f,
                    listener,
                    Looper.getMainLooper()
                )
            } catch (e2: Exception) {
                close(e2)
                return@callbackFlow
            }
        }

        awaitClose {
            locationManager.removeUpdates(listener)
        }
    }

    @SuppressLint("MissingPermission")
    fun getLastKnownLocation(): Location? {
        if (!hasPermission()) return null
        var location: Location? = null
        try {
            location = locationManager.getLastKnownLocation(AndroidLocationManager.GPS_PROVIDER)
        } catch (_: Exception) {}
        if (location == null) {
            try {
                location = locationManager.getLastKnownLocation(AndroidLocationManager.NETWORK_PROVIDER)
            } catch (_: Exception) {}
        }
        return location
    }
}
            Priority.PRIORITY_HIGH_ACCURACY, 5000L
        ).apply {
            setWaitForAccurateLocation(true)
            setMinUpdateIntervalMillis(2000L)
        }.build()

        val callback = object : LocationCallback() {
            override fun onLocationResult(result: LocationResult) {
                result.lastLocation?.let { trySend(it) }
            }
        }

        client.requestLocationUpdates(request, callback, Looper.getMainLooper())

        awaitClose { client.removeLocationUpdates(callback) }
    }

    @SuppressLint("MissingPermission")
    fun lastKnownLocation(onResult: (Location?) -> Unit) {
        if (!hasPermission()) { onResult(null); return }
        client.lastLocation.addOnSuccessListener { onResult(it) }
    }
}
