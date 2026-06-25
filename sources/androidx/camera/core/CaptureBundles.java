package androidx.camera.core;

import androidx.camera.core.impl.CaptureBundle;
import androidx.camera.core.impl.CaptureStage;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public final class CaptureBundles {
    public static CaptureBundle singleDefaultCaptureBundle() {
        return createCaptureBundle(new CaptureStage.DefaultCaptureStage());
    }

    static CaptureBundle createCaptureBundle(CaptureStage... captureStages) {
        return new CaptureBundleImpl(Arrays.asList(captureStages));
    }

    static CaptureBundle createCaptureBundle(List<CaptureStage> captureStageList) {
        return new CaptureBundleImpl(captureStageList);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static final class CaptureBundleImpl implements CaptureBundle {
        final List<CaptureStage> mCaptureStageList;

        CaptureBundleImpl(List<CaptureStage> captureStageList) {
            if (captureStageList != null && !captureStageList.isEmpty()) {
                this.mCaptureStageList = Collections.unmodifiableList(new ArrayList(captureStageList));
                return;
            }
            throw new IllegalArgumentException("Cannot set an empty CaptureStage list.");
        }

        @Override // androidx.camera.core.impl.CaptureBundle
        public List<CaptureStage> getCaptureStages() {
            return this.mCaptureStageList;
        }
    }

    private CaptureBundles() {
    }
}
