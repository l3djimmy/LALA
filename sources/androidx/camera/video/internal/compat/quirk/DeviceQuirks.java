package androidx.camera.video.internal.compat.quirk;

import androidx.camera.core.impl.Quirk;
import androidx.camera.core.impl.Quirks;
import java.util.List;
/* loaded from: classes.dex */
public class DeviceQuirks {
    private static final Quirks QUIRKS = new Quirks(DeviceQuirksLoader.loadQuirks());

    private DeviceQuirks() {
    }

    public static Quirks getAll() {
        return QUIRKS;
    }

    public static <T extends Quirk> T get(Class<T> quirkClass) {
        return (T) QUIRKS.get(quirkClass);
    }

    public static <T extends Quirk> List<T> getAll(Class<T> quirkClass) {
        return QUIRKS.getAll(quirkClass);
    }
}
