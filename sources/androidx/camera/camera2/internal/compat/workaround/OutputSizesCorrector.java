package androidx.camera.camera2.internal.compat.workaround;

import android.util.Size;
import androidx.camera.camera2.internal.compat.quirk.DeviceQuirks;
import androidx.camera.camera2.internal.compat.quirk.ExtraSupportedOutputSizeQuirk;
import androidx.camera.core.Logger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes.dex */
public class OutputSizesCorrector {
    private static final String TAG = "OutputSizesCorrector";
    private final String mCameraId;
    private final ExcludedSupportedSizesContainer mExcludedSupportedSizesContainer;
    private final ExtraSupportedOutputSizeQuirk mExtraSupportedOutputSizeQuirk = (ExtraSupportedOutputSizeQuirk) DeviceQuirks.get(ExtraSupportedOutputSizeQuirk.class);

    public OutputSizesCorrector(String cameraId) {
        this.mCameraId = cameraId;
        this.mExcludedSupportedSizesContainer = new ExcludedSupportedSizesContainer(this.mCameraId);
    }

    public Size[] applyQuirks(Size[] sizes, int format) {
        List<Size> sizeList = new ArrayList<>(Arrays.asList(sizes));
        addExtraSupportedOutputSizesByFormat(sizeList, format);
        excludeProblematicOutputSizesByFormat(sizeList, format);
        if (sizeList.isEmpty()) {
            Logger.w(TAG, "Sizes array becomes empty after excluding problematic output sizes.");
        }
        return (Size[]) sizeList.toArray(new Size[0]);
    }

    public <T> Size[] applyQuirks(Size[] sizes, Class<T> klass) {
        List<Size> sizeList = new ArrayList<>(Arrays.asList(sizes));
        addExtraSupportedOutputSizesByClass(sizeList, klass);
        excludeProblematicOutputSizesByClass(sizeList, klass);
        if (sizeList.isEmpty()) {
            Logger.w(TAG, "Sizes array becomes empty after excluding problematic output sizes.");
        }
        return (Size[]) sizeList.toArray(new Size[0]);
    }

    private void addExtraSupportedOutputSizesByFormat(List<Size> sizeList, int format) {
        if (this.mExtraSupportedOutputSizeQuirk == null) {
            return;
        }
        Size[] extraSizes = this.mExtraSupportedOutputSizeQuirk.getExtraSupportedResolutions(format);
        if (extraSizes.length > 0) {
            sizeList.addAll(Arrays.asList(extraSizes));
        }
    }

    private void addExtraSupportedOutputSizesByClass(List<Size> sizeList, Class<?> klass) {
        if (this.mExtraSupportedOutputSizeQuirk == null) {
            return;
        }
        Size[] extraSizes = this.mExtraSupportedOutputSizeQuirk.getExtraSupportedResolutions(klass);
        if (extraSizes.length > 0) {
            sizeList.addAll(Arrays.asList(extraSizes));
        }
    }

    private void excludeProblematicOutputSizesByFormat(List<Size> sizeList, int format) {
        List<Size> excludedSizes = this.mExcludedSupportedSizesContainer.get(format);
        if (excludedSizes.isEmpty()) {
            return;
        }
        sizeList.removeAll(excludedSizes);
    }

    private void excludeProblematicOutputSizesByClass(List<Size> sizeList, Class<?> klass) {
        List<Size> excludedSizes = this.mExcludedSupportedSizesContainer.get(klass);
        if (excludedSizes.isEmpty()) {
            return;
        }
        sizeList.removeAll(excludedSizes);
    }
}
