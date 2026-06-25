package androidx.camera.camera2.internal;

import android.content.Context;
import android.graphics.Point;
import android.hardware.display.DisplayManager;
import android.util.Size;
import android.view.Display;
import androidx.camera.camera2.internal.compat.workaround.DisplaySizeCorrector;
import androidx.camera.camera2.internal.compat.workaround.MaxPreviewSize;
import androidx.camera.core.internal.utils.SizeUtil;
import com.itextpdf.io.codec.TIFFConstants;
/* loaded from: classes.dex */
public class DisplayInfoManager {
    private static volatile DisplayInfoManager sInstance;
    private final DisplayManager mDisplayManager;
    private static final Size MAX_PREVIEW_SIZE = new Size(1920, 1080);
    private static final Size ABNORMAL_DISPLAY_SIZE_THRESHOLD = new Size(TIFFConstants.TIFFTAG_COLORMAP, 240);
    private static final Size FALLBACK_DISPLAY_SIZE = new Size(640, 480);
    private static final Object INSTANCE_LOCK = new Object();
    private volatile Size mPreviewSize = null;
    private final MaxPreviewSize mMaxPreviewSize = new MaxPreviewSize();
    private final DisplaySizeCorrector mDisplaySizeCorrector = new DisplaySizeCorrector();

    private DisplayInfoManager(Context context) {
        this.mDisplayManager = (DisplayManager) context.getSystemService("display");
    }

    public static DisplayInfoManager getInstance(Context context) {
        if (sInstance == null) {
            synchronized (INSTANCE_LOCK) {
                if (sInstance == null) {
                    sInstance = new DisplayInfoManager(context);
                }
            }
        }
        return sInstance;
    }

    static void releaseInstance() {
        sInstance = null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void refresh() {
        this.mPreviewSize = calculatePreviewSize();
    }

    public Display getMaxSizeDisplay(boolean skipStateOffDisplay) {
        Display[] displays = this.mDisplayManager.getDisplays();
        if (displays.length == 1) {
            return displays[0];
        }
        Display maxDisplay = getMaxSizeDisplayInternal(displays, skipStateOffDisplay);
        if (maxDisplay == null && skipStateOffDisplay) {
            maxDisplay = getMaxSizeDisplayInternal(displays, false);
        }
        if (maxDisplay == null) {
            throw new IllegalArgumentException("No display can be found from the input display manager!");
        }
        return maxDisplay;
    }

    private Display getMaxSizeDisplayInternal(Display[] displays, boolean skipStateOffDisplay) {
        Display maxDisplay = null;
        int maxDisplaySize = -1;
        for (Display display : displays) {
            if (!skipStateOffDisplay || display.getState() != 1) {
                Point displaySize = new Point();
                display.getRealSize(displaySize);
                if (displaySize.x * displaySize.y > maxDisplaySize) {
                    int maxDisplaySize2 = displaySize.x * displaySize.y;
                    maxDisplay = display;
                    maxDisplaySize = maxDisplaySize2;
                }
            }
        }
        return maxDisplay;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Size getPreviewSize() {
        if (this.mPreviewSize != null) {
            return this.mPreviewSize;
        }
        this.mPreviewSize = calculatePreviewSize();
        return this.mPreviewSize;
    }

    private Size calculatePreviewSize() {
        Size displayViewSize = getCorrectedDisplaySize();
        if (displayViewSize.getWidth() * displayViewSize.getHeight() > MAX_PREVIEW_SIZE.getWidth() * MAX_PREVIEW_SIZE.getHeight()) {
            displayViewSize = MAX_PREVIEW_SIZE;
        }
        return this.mMaxPreviewSize.getMaxPreviewResolution(displayViewSize);
    }

    private Size getCorrectedDisplaySize() {
        Point displaySize = new Point();
        Display display = getMaxSizeDisplay(false);
        display.getRealSize(displaySize);
        Size displayViewSize = new Size(displaySize.x, displaySize.y);
        if (SizeUtil.isSmallerByArea(displayViewSize, ABNORMAL_DISPLAY_SIZE_THRESHOLD) && (displayViewSize = this.mDisplaySizeCorrector.getDisplaySize()) == null) {
            displayViewSize = FALLBACK_DISPLAY_SIZE;
        }
        if (displayViewSize.getHeight() > displayViewSize.getWidth()) {
            return new Size(displayViewSize.getHeight(), displayViewSize.getWidth());
        }
        return displayViewSize;
    }
}
