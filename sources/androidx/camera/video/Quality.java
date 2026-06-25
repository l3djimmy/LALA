package androidx.camera.video;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
/* loaded from: classes.dex */
public class Quality {
    public static final Quality SD = ConstantQuality.of(4, "SD");
    public static final Quality HD = ConstantQuality.of(5, "HD");
    public static final Quality FHD = ConstantQuality.of(6, "FHD");
    public static final Quality UHD = ConstantQuality.of(8, "UHD");
    public static final Quality LOWEST = ConstantQuality.of(0, "LOWEST");
    public static final Quality HIGHEST = ConstantQuality.of(1, "HIGHEST");
    static final Quality NONE = ConstantQuality.of(-1, "NONE");
    private static final Set<Quality> QUALITIES = new HashSet(Arrays.asList(LOWEST, HIGHEST, SD, HD, FHD, UHD));
    private static final List<Quality> QUALITIES_ORDER_BY_SIZE = Arrays.asList(UHD, FHD, HD, SD);

    private Quality() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean containsQuality(Quality quality) {
        return QUALITIES.contains(quality);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static List<Quality> getSortedQualities() {
        return new ArrayList(QUALITIES_ORDER_BY_SIZE);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static abstract class ConstantQuality extends Quality {
        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract String getName();

        /* JADX INFO: Access modifiers changed from: package-private */
        public abstract int getValue();

        /* JADX INFO: Access modifiers changed from: package-private */
        public ConstantQuality() {
            super();
        }

        static ConstantQuality of(int value, String name) {
            return new AutoValue_Quality_ConstantQuality(value, name);
        }
    }
}
