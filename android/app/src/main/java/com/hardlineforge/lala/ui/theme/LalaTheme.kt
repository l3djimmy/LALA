package com.hardlineforge.lala.ui.theme

import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.ColorScheme
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Shapes
import androidx.compose.material3.Typography
import androidx.compose.material3.darkColorScheme
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.isUnspecified
import androidx.compose.ui.unit.sp

val LalaLight = lightColorScheme(
    primary = Color(0xFF007AFF),
    onPrimary = Color.White,
    secondary = Color(0xFF5856D6),
    tertiary = Color(0xFF34C759),
    surface = Color(0xFFF2F2F7),
    onSurface = Color(0xFF1C1C1E),
    background = Color(0xFFFFFFFF),
    onBackground = Color(0xFF1C1C1E),
    error = Color(0xFFFF3B30),
    outline = Color(0xFFC7C7CC),
    surfaceVariant = Color(0xFFE5E5EA),
    onSurfaceVariant = Color(0xFF3A3A3C)
)

val LalaDark = darkColorScheme(
    primary = Color(0xFF0A84FF),
    onPrimary = Color.White,
    secondary = Color(0xFF5E5CE6),
    tertiary = Color(0xFF30D158),
    surface = Color(0xFF1C1C1E),
    onSurface = Color(0xFFFFFFFF),
    background = Color(0xFF000000),
    onBackground = Color(0xFFFFFFFF),
    error = Color(0xFFFF453A),
    outline = Color(0xFF48484A),
    surfaceVariant = Color(0xFF2C2C2E),
    onSurfaceVariant = Color(0xFF8E8E93)
)

val LalaTypography = Typography(
    displayLarge = TextStyle(fontFamily = FontFamily.Default, fontWeight = FontWeight.SemiBold, fontSize = 32.sp, letterSpacing = (-0.5).sp),
    displayMedium = TextStyle(fontFamily = FontFamily.Default, fontWeight = FontWeight.SemiBold, fontSize = 26.sp, letterSpacing = (-0.5).sp),
    headlineLarge = TextStyle(fontFamily = FontFamily.Default, fontWeight = FontWeight.SemiBold, fontSize = 20.sp),
    headlineMedium = TextStyle(fontFamily = FontFamily.Default, fontWeight = FontWeight.SemiBold, fontSize = 18.sp),
    titleLarge = TextStyle(fontFamily = FontFamily.Default, fontWeight = FontWeight.Medium, fontSize = 18.sp),
    titleMedium = TextStyle(fontFamily = FontFamily.Default, fontWeight = FontWeight.Medium, fontSize = 16.sp),
    bodyLarge = TextStyle(fontFamily = FontFamily.Default, fontWeight = FontWeight.Normal, fontSize = 16.sp, lineHeight = 22.sp),
    bodyMedium = TextStyle(fontFamily = FontFamily.Default, fontWeight = FontWeight.Normal, fontSize = 14.sp, lineHeight = 20.sp),
    labelLarge = TextStyle(fontFamily = FontFamily.Default, fontWeight = FontWeight.Medium, fontSize = 14.sp),
    labelMedium = TextStyle(fontFamily = FontFamily.Default, fontWeight = FontWeight.Medium, fontSize = 12.sp),
    labelSmall = TextStyle(fontFamily = FontFamily.Default, fontWeight = FontWeight.Medium, fontSize = 10.sp)
)

val LalaShapes = Shapes(
    small = RoundedCornerShape(8.dp),
    medium = RoundedCornerShape(12.dp),
    large = RoundedCornerShape(16.dp)
)

private val AccentColors = mapOf(
    "blue" to null, // keep each scheme's own default blue
    "green" to Color(0xFF34C759),
    "purple" to Color(0xFFAF52DE),
    "orange" to Color(0xFFFF9500)
)

private fun ColorScheme.withAccent(accent: String): ColorScheme {
    val color = AccentColors[accent] ?: return this
    return copy(primary = color, secondary = color, tertiary = color)
}

/** "small", "default", "large", "xlarge" -> a font-size multiplier. */
fun fontScaleFor(fontSize: String): Float = when (fontSize) {
    "small" -> 0.85f
    "large" -> 1.15f
    "xlarge" -> 1.3f
    else -> 1f
}

private fun TextStyle.scaled(scale: Float): TextStyle = copy(
    fontSize = if (fontSize.isUnspecified) fontSize else fontSize * scale,
    lineHeight = if (lineHeight.isUnspecified) lineHeight else lineHeight * scale
)

private fun Typography.scaled(scale: Float): Typography {
    if (scale == 1f) return this
    return copy(
        displayLarge = displayLarge.scaled(scale),
        displayMedium = displayMedium.scaled(scale),
        displaySmall = displaySmall.scaled(scale),
        headlineLarge = headlineLarge.scaled(scale),
        headlineMedium = headlineMedium.scaled(scale),
        headlineSmall = headlineSmall.scaled(scale),
        titleLarge = titleLarge.scaled(scale),
        titleMedium = titleMedium.scaled(scale),
        titleSmall = titleSmall.scaled(scale),
        bodyLarge = bodyLarge.scaled(scale),
        bodyMedium = bodyMedium.scaled(scale),
        bodySmall = bodySmall.scaled(scale),
        labelLarge = labelLarge.scaled(scale),
        labelMedium = labelMedium.scaled(scale),
        labelSmall = labelSmall.scaled(scale)
    )
}

@Composable
fun LalaTheme(
    darkTheme: Boolean = false,
    accentColor: String = "blue",
    fontScale: Float = 1f,
    content: @Composable () -> Unit
) {
    MaterialTheme(
        colorScheme = (if (darkTheme) LalaDark else LalaLight).withAccent(accentColor),
        typography = LalaTypography.scaled(fontScale),
        shapes = LalaShapes,
        content = content
    )
}

@Composable
fun categoryColor(category: String): Color = when (category) {
    "Noise" -> MaterialTheme.colorScheme.error
    "Suspicious Activity" -> MaterialTheme.colorScheme.secondary
    "Property Damage" -> MaterialTheme.colorScheme.tertiary
    "Animal Issue" -> MaterialTheme.colorScheme.primary
    "Parking" -> MaterialTheme.colorScheme.outline
    "Trash / Yard" -> MaterialTheme.colorScheme.surfaceVariant
    "HOA / Code Violation" -> MaterialTheme.colorScheme.error.copy(alpha = 0.8f)
    "Safety Hazard" -> MaterialTheme.colorScheme.error
    "Poaching / Wildlife" -> MaterialTheme.colorScheme.tertiary
    else -> MaterialTheme.colorScheme.primary
}
