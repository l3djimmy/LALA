# Keep Room entities
-keep class com.hardlineforge.lala.data.** { *; }

# Keep Hilt
-keep class * extends androidx.lifecycle.ViewModel { *; }
-keep class * extends android.app.Application { *; }
-keep class dagger.hilt.** { *; }

# Keep iText classes used
-keep class com.itextpdf.** { *; }
-dontwarn com.itextpdf.**
# Optional iText deps we don't ship
-dontwarn org.bouncycastle.**
-dontwarn org.slf4j.**

# osmdroid
-dontwarn org.osmdroid.**

# Keep Compose
-keep class androidx.compose.** { *; }

# General
-keepattributes *Annotation*
-keepattributes Signature
