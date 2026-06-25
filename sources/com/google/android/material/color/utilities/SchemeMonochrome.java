package com.google.android.material.color.utilities;

import androidx.camera.video.AudioStats;
/* loaded from: classes12.dex */
public class SchemeMonochrome extends DynamicScheme {
    public SchemeMonochrome(Hct sourceColorHct, boolean isDark, double contrastLevel) {
        super(sourceColorHct, Variant.MONOCHROME, isDark, contrastLevel, TonalPalette.fromHueAndChroma(sourceColorHct.getHue(), AudioStats.AUDIO_AMPLITUDE_NONE), TonalPalette.fromHueAndChroma(sourceColorHct.getHue(), AudioStats.AUDIO_AMPLITUDE_NONE), TonalPalette.fromHueAndChroma(sourceColorHct.getHue(), AudioStats.AUDIO_AMPLITUDE_NONE), TonalPalette.fromHueAndChroma(sourceColorHct.getHue(), AudioStats.AUDIO_AMPLITUDE_NONE), TonalPalette.fromHueAndChroma(sourceColorHct.getHue(), AudioStats.AUDIO_AMPLITUDE_NONE));
    }
}
