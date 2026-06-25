package com.itextpdf.kernel.colors;

import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.pdf.colorspace.PdfDeviceCs;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class DeviceGray extends Color {
    public static final DeviceGray WHITE = new DeviceGray(1.0f);
    public static final DeviceGray GRAY = new DeviceGray(0.5f);
    public static final DeviceGray BLACK = new DeviceGray();

    public DeviceGray(float value) {
        super(new PdfDeviceCs.Gray(), new float[]{value > 1.0f ? 1.0f : value > 0.0f ? value : 0.0f});
        if (value > 1.0f || value < 0.0f) {
            Logger LOGGER = LoggerFactory.getLogger(DeviceGray.class);
            LOGGER.warn(IoLogMessageConstant.COLORANT_INTENSITIES_INVALID);
        }
    }

    public DeviceGray() {
        this(0.0f);
    }

    public static DeviceGray makeLighter(DeviceGray grayColor) {
        float v = grayColor.getColorValue()[0];
        if (v == 0.0f) {
            return new DeviceGray(0.3f);
        }
        float multiplier = Math.min(1.0f, 0.33f + v) / v;
        return new DeviceGray(v * multiplier);
    }

    public static DeviceGray makeDarker(DeviceGray grayColor) {
        float v = grayColor.getColorValue()[0];
        float multiplier = Math.max(0.0f, (v - 0.33f) / v);
        return new DeviceGray(v * multiplier);
    }
}
