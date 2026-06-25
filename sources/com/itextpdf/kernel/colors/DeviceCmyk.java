package com.itextpdf.kernel.colors;

import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.pdf.colorspace.PdfDeviceCs;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class DeviceCmyk extends Color {
    public static final DeviceCmyk CYAN = new DeviceCmyk(100, 0, 0, 0);
    public static final DeviceCmyk MAGENTA = new DeviceCmyk(0, 100, 0, 0);
    public static final DeviceCmyk YELLOW = new DeviceCmyk(0, 0, 100, 0);
    public static final DeviceCmyk BLACK = new DeviceCmyk(0, 0, 0, 100);

    public DeviceCmyk() {
        this(0.0f, 0.0f, 0.0f, 1.0f);
    }

    public DeviceCmyk(int c, int m, int y, int k) {
        this(c / 100.0f, m / 100.0f, y / 100.0f, k / 100.0f);
    }

    public DeviceCmyk(float c, float m, float y, float k) {
        super(new PdfDeviceCs.Cmyk(), new float[]{c > 1.0f ? 1.0f : c > 0.0f ? c : 0.0f, m > 1.0f ? 1.0f : m > 0.0f ? m : 0.0f, y > 1.0f ? 1.0f : y > 0.0f ? y : 0.0f, k > 1.0f ? 1.0f : k > 0.0f ? k : 0.0f});
        if (c > 1.0f || c < 0.0f || m > 1.0f || m < 0.0f || y > 1.0f || y < 0.0f || k > 1.0f || k < 0.0f) {
            Logger LOGGER = LoggerFactory.getLogger(DeviceCmyk.class);
            LOGGER.warn(IoLogMessageConstant.COLORANT_INTENSITIES_INVALID);
        }
    }

    public static DeviceCmyk makeLighter(DeviceCmyk cmykColor) {
        DeviceRgb rgbEquivalent = convertCmykToRgb(cmykColor);
        DeviceRgb lighterRgb = DeviceRgb.makeLighter(rgbEquivalent);
        return convertRgbToCmyk(lighterRgb);
    }

    public static DeviceCmyk makeDarker(DeviceCmyk cmykColor) {
        DeviceRgb rgbEquivalent = convertCmykToRgb(cmykColor);
        DeviceRgb darkerRgb = DeviceRgb.makeDarker(rgbEquivalent);
        return convertRgbToCmyk(darkerRgb);
    }
}
