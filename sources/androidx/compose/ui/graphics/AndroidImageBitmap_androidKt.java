package androidx.compose.ui.graphics;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import androidx.compose.ui.graphics.colorspace.ColorSpace;
import kotlin.Metadata;
/* compiled from: AndroidImageBitmap.android.kt */
@Metadata(d1 = {"\u0000:\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0012\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\u001a:\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00032\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\nH\u0000ø\u0001\u0000¢\u0006\u0004\b\u000b\u0010\f\u001a\u0010\u0010\r\u001a\u00020\u00012\u0006\u0010\u000e\u001a\u00020\u000fH\u0000\u001a\n\u0010\u0010\u001a\u00020\u0011*\u00020\u0001\u001a\n\u0010\u0012\u001a\u00020\u0001*\u00020\u0011\u001a\u0016\u0010\u0013\u001a\u00020\u0014*\u00020\u0006H\u0000ø\u0001\u0000¢\u0006\u0004\b\u0015\u0010\u0016\u001a\u0011\u0010\u0017\u001a\u00020\u0006*\u00020\u0014H\u0000¢\u0006\u0002\u0010\u0018\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0019"}, d2 = {"ActualImageBitmap", "Landroidx/compose/ui/graphics/ImageBitmap;", "width", "", "height", "config", "Landroidx/compose/ui/graphics/ImageBitmapConfig;", "hasAlpha", "", "colorSpace", "Landroidx/compose/ui/graphics/colorspace/ColorSpace;", "ActualImageBitmap-x__-hDU", "(IIIZLandroidx/compose/ui/graphics/colorspace/ColorSpace;)Landroidx/compose/ui/graphics/ImageBitmap;", "createImageBitmap", "bytes", "", "asAndroidBitmap", "Landroid/graphics/Bitmap;", "asImageBitmap", "toBitmapConfig", "Landroid/graphics/Bitmap$Config;", "toBitmapConfig-1JJdX4A", "(I)Landroid/graphics/Bitmap$Config;", "toImageConfig", "(Landroid/graphics/Bitmap$Config;)I", "ui-graphics_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class AndroidImageBitmap_androidKt {
    public static final ImageBitmap asImageBitmap(Bitmap $this$asImageBitmap) {
        return new AndroidImageBitmap($this$asImageBitmap);
    }

    public static final ImageBitmap createImageBitmap(byte[] bytes) {
        return asImageBitmap(BitmapFactory.decodeByteArray(bytes, 0, bytes.length));
    }

    /* renamed from: ActualImageBitmap-x__-hDU  reason: not valid java name */
    public static final ImageBitmap m4157ActualImageBitmapx__hDU(int width, int height, int config, boolean hasAlpha, ColorSpace colorSpace) {
        m4158toBitmapConfig1JJdX4A(config);
        Bitmap bitmap = Api26Bitmap.m4196createBitmapx__hDU$ui_graphics_release(width, height, config, hasAlpha, colorSpace);
        return new AndroidImageBitmap(bitmap);
    }

    public static final Bitmap asAndroidBitmap(ImageBitmap $this$asAndroidBitmap) {
        if ($this$asAndroidBitmap instanceof AndroidImageBitmap) {
            return ((AndroidImageBitmap) $this$asAndroidBitmap).getBitmap$ui_graphics_release();
        }
        throw new UnsupportedOperationException("Unable to obtain android.graphics.Bitmap");
    }

    /* renamed from: toBitmapConfig-1JJdX4A  reason: not valid java name */
    public static final Bitmap.Config m4158toBitmapConfig1JJdX4A(int $this$toBitmapConfig_u2d1JJdX4A) {
        if (ImageBitmapConfig.m4504equalsimpl0($this$toBitmapConfig_u2d1JJdX4A, ImageBitmapConfig.Companion.m4509getArgb8888_sVssgQ())) {
            return Bitmap.Config.ARGB_8888;
        }
        if (ImageBitmapConfig.m4504equalsimpl0($this$toBitmapConfig_u2d1JJdX4A, ImageBitmapConfig.Companion.m4508getAlpha8_sVssgQ())) {
            return Bitmap.Config.ALPHA_8;
        }
        if (ImageBitmapConfig.m4504equalsimpl0($this$toBitmapConfig_u2d1JJdX4A, ImageBitmapConfig.Companion.m4512getRgb565_sVssgQ())) {
            return Bitmap.Config.RGB_565;
        }
        if (ImageBitmapConfig.m4504equalsimpl0($this$toBitmapConfig_u2d1JJdX4A, ImageBitmapConfig.Companion.m4510getF16_sVssgQ())) {
            return Bitmap.Config.RGBA_F16;
        }
        if (ImageBitmapConfig.m4504equalsimpl0($this$toBitmapConfig_u2d1JJdX4A, ImageBitmapConfig.Companion.m4511getGpu_sVssgQ())) {
            return Bitmap.Config.HARDWARE;
        }
        return Bitmap.Config.ARGB_8888;
    }

    public static final int toImageConfig(Bitmap.Config $this$toImageConfig) {
        if ($this$toImageConfig == Bitmap.Config.ALPHA_8) {
            return ImageBitmapConfig.Companion.m4508getAlpha8_sVssgQ();
        }
        if ($this$toImageConfig == Bitmap.Config.RGB_565) {
            return ImageBitmapConfig.Companion.m4512getRgb565_sVssgQ();
        }
        if ($this$toImageConfig == Bitmap.Config.ARGB_4444) {
            return ImageBitmapConfig.Companion.m4509getArgb8888_sVssgQ();
        }
        if ($this$toImageConfig == Bitmap.Config.RGBA_F16) {
            return ImageBitmapConfig.Companion.m4510getF16_sVssgQ();
        }
        if ($this$toImageConfig == Bitmap.Config.HARDWARE) {
            return ImageBitmapConfig.Companion.m4511getGpu_sVssgQ();
        }
        return ImageBitmapConfig.Companion.m4509getArgb8888_sVssgQ();
    }
}
