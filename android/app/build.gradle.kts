plugins {
    alias(libs.plugins.android.application)
    alias(libs.plugins.kotlin.android)
    alias(libs.plugins.compose.compiler)
    alias(libs.plugins.kotlin.kapt)
    alias(libs.plugins.hilt)
}

android {
    namespace = "com.hardlineforge.lala"
    compileSdk = 35

    defaultConfig {
        applicationId = "com.hardlineforge.lala"
        minSdk = 26
        targetSdk = 35
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            isMinifyEnabled = true
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions {
        jvmTarget = "17"
    }
    buildFeatures {
        compose = true
    }
    composeOptions {
        kotlinCompilerExtensionVersion = "1.5.14"
    }
    packaging {
        resources {
            excludes += "/META-INF/{AL2.0,LGPL2.1}"
            excludes += "META-INF/native-image/**"
            pickFirsts += "META-INF/native-image/reflect-config.json"
        }
    }
}

dependencies {
    implementation(libs.androidx.core.ktx)
    implementation(libs.androidx.lifecycle.runtime.ktx)
    implementation(libs.androidx.activity.compose)
    implementation(platform(libs.androidx.compose.bom))
    implementation(libs.androidx.ui)
    implementation(libs.androidx.ui.graphics)
    implementation(libs.androidx.ui.tooling.preview)
    implementation(libs.androidx.material3)
    implementation(libs.androidx.material.icons.extended)
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
    // Removed: Google Play Services Location
    // implementation(libs.google.play.services.location)
    // Using native Android LocationManager instead (GPS + Network providers)
    // PDF viewer libraries removed due to JitPack auth issues
    // implementation("com.github.barteksc:android-pdf-viewer:3.2.0-beta.1")
}
