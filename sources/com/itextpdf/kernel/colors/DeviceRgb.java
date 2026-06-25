package com.itextpdf.kernel.colors;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.pdf.colorspace.PdfDeviceCs;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class DeviceRgb extends Color {
    public static final Color BLACK = new DeviceRgb(0, 0, 0);
    public static final Color WHITE = new DeviceRgb(255, 255, 255);
    public static final Color RED = new DeviceRgb(255, 0, 0);
    public static final Color GREEN = new DeviceRgb(0, 255, 0);
    public static final Color BLUE = new DeviceRgb(0, 0, 255);

    public DeviceRgb(int r, int g, int b) {
        this(r / 255.0f, g / 255.0f, b / 255.0f);
    }

    public DeviceRgb(float r, float g, float b) {
        super(new PdfDeviceCs.Rgb(), new float[]{r > 1.0f ? 1.0f : r > 0.0f ? r : 0.0f, g > 1.0f ? 1.0f : g > 0.0f ? g : 0.0f, b > 1.0f ? 1.0f : b > 0.0f ? b : 0.0f});
        if (r > 1.0f || r < 0.0f || g > 1.0f || g < 0.0f || b > 1.0f || b < 0.0f) {
            Logger LOGGER = LoggerFactory.getLogger(DeviceRgb.class);
            LOGGER.warn(IoLogMessageConstant.COLORANT_INTENSITIES_INVALID);
        }
    }

    public DeviceRgb(java.awt.Color color) {
        this(color.getRed(), color.getGreen(), color.getBlue());
        if (color.getAlpha() != 255) {
            Logger LOGGER = LoggerFactory.getLogger(DeviceRgb.class);
            LOGGER.warn(MessageFormatUtil.format(IoLogMessageConstant.COLOR_ALPHA_CHANNEL_IS_IGNORED, Integer.valueOf(color.getAlpha())));
        }
    }

    public DeviceRgb() {
        this(0.0f, 0.0f, 0.0f);
    }

    public static DeviceRgb makeLighter(DeviceRgb rgbColor) {
        float r = rgbColor.getColorValue()[0];
        float g = rgbColor.getColorValue()[1];
        float b = rgbColor.getColorValue()[2];
        float v = Math.max(r, Math.max(g, b));
        if (v == 0.0f) {
            return new DeviceRgb(84, 84, 84);
        }
        float multiplier = Math.min(1.0f, 0.33f + v) / v;
        return new DeviceRgb(r * multiplier, g * multiplier, b * multiplier);
    }

    public static DeviceRgb makeDarker(DeviceRgb rgbColor) {
        float r = rgbColor.getColorValue()[0];
        float g = rgbColor.getColorValue()[1];
        float b = rgbColor.getColorValue()[2];
        float v = Math.max(r, Math.max(g, b));
        float multiplier = Math.max(0.0f, (v - 0.33f) / v);
        return new DeviceRgb(r * multiplier, g * multiplier, b * multiplier);
    }
}
