     1|plugins {
     2|    alias(libs.plugins.android.application)
     3|    alias(libs.plugins.kotlin.android)
     4|    alias(libs.plugins.kotlin.kapt)
     5|    alias(libs.plugins.hilt)
     6|}
     7|
     8|android {
     9|    namespace = "com.hardlineforge.lala"
    10|    compileSdk = 35
    11|
    12|    defaultConfig {
    13|        applicationId = "com.hardlineforge.lala"
    14|        minSdk = 26
    15|        targetSdk = 35
    16|        versionCode = 1
    17|        versionName = "1.0"
    18|    }
    19|
    20|    buildTypes {
    21|        release {
    22|            isMinifyEnabled = true
    23|            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
    24|        }
    25|    }
    26|    compileOptions {
    27|        sourceCompatibility = JavaVersion.VERSION_17
    28|        targetCompatibility = JavaVersion.VERSION_17
    29|    }
    30|    kotlinOptions {
    31|        jvmTarget = "17"
    32|    }
    33|    buildFeatures {
    34|        compose = true
    35|    }
    36|    composeOptions {
    37|        kotlinCompilerExtensionVersion = "1.5.14"
    38|    }
    39|    packaging {
    40|        resources {
    41|            excludes += "/META-INF/{AL2.0,LGPL2.1}"
    42|        }
    43|    }
    44|}
    45|
    dependencies {
        implementation(libs.androidx.core.ktx)
        implementation(libs.androidx.lifecycle.runtime.ktx)
        implementation(libs.androidx.activity.compose)
        implementation(platform(libs.androidx.compose.bom))
        implementation(libs.androidx.ui)
        implementation(libs.androidx.ui.graphics)
        implementation(libs.androidx.ui.tooling.preview)
        implementation(libs.androidx.material3)
        implementation(libs.androidx.navigation.compose)
        implementation(libs.androidx.room.runtime)
        implementation(libs.androidx.room.ktx)
        kapt(libs.androidx.room.compiler)
        implementation(libs.hilt.android)
        kapt(libs.hilt.compiler)
        implementation(libs.hilt.navigation.compose)
        implementation(libs.kotlinx.coroutines.android)
        implementation(libs.itextpdf.core)
        implementation(libs.itextpdf.layout)
        implementation(libs.camera.core)
        implementation(libs.camera.camera2)
        implementation(libs.camera.lifecycle)
        implementation(libs.camera.view)
        implementation(libs.google.play.services.location)
        implementation("com.github.afreakyelf:AndroidPdfViewer:3.2.0-beta.1")
}
    70|