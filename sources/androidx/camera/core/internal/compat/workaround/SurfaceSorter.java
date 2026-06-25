package androidx.camera.core.internal.compat.workaround;

import android.media.MediaCodec;
import androidx.camera.core.Preview;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.internal.compat.quirk.DeviceQuirks;
import androidx.camera.core.internal.compat.quirk.SurfaceOrderQuirk;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
/* loaded from: classes.dex */
public class SurfaceSorter {
    private static final int PRIORITY_MEDIA_CODEC_SURFACE = 2;
    private static final int PRIORITY_OTHERS = 1;
    private static final int PRIORITY_PREVIEW_SURFACE = 0;
    private final boolean mHasQuirk;

    public SurfaceSorter() {
        this.mHasQuirk = DeviceQuirks.get(SurfaceOrderQuirk.class) != null;
    }

    public void sort(List<SessionConfig.OutputConfig> outputConfigs) {
        if (!this.mHasQuirk) {
            return;
        }
        Collections.sort(outputConfigs, new Comparator() { // from class: androidx.camera.core.internal.compat.workaround.SurfaceSorter$$ExternalSyntheticLambda0
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return SurfaceSorter.this.m155xa3d7ce91((SessionConfig.OutputConfig) obj, (SessionConfig.OutputConfig) obj2);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$sort$0$androidx-camera-core-internal-compat-workaround-SurfaceSorter  reason: not valid java name */
    public /* synthetic */ int m155xa3d7ce91(SessionConfig.OutputConfig outputConfig1, SessionConfig.OutputConfig outputConfig2) {
        int p1 = getSurfacePriority(outputConfig1.getSurface());
        int p2 = getSurfacePriority(outputConfig2.getSurface());
        return p1 - p2;
    }

    private int getSurfacePriority(DeferrableSurface surface) {
        if (surface.getContainerClass() == MediaCodec.class) {
            return 2;
        }
        if (surface.getContainerClass() == Preview.class) {
            return 0;
        }
        return 1;
    }
}
