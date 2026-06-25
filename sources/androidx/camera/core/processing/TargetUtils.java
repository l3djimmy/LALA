package androidx.camera.core.processing;

import androidx.core.util.Preconditions;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Locale;
/* loaded from: classes.dex */
public class TargetUtils {
    private TargetUtils() {
    }

    public static int getNumberOfTargets(int targets) {
        int count = 0;
        while (targets != 0) {
            count += targets & 1;
            targets >>= 1;
        }
        return count;
    }

    public static boolean isSuperset(int superset, int subset) {
        return (superset & subset) == subset;
    }

    public static void checkSupportedTargets(Collection<Integer> supportedTargets, int targets) {
        Preconditions.checkArgument(supportedTargets.contains(Integer.valueOf(targets)), String.format(Locale.US, "Effects target %s is not in the supported list %s.", getHumanReadableName(targets), getHumanReadableNames(supportedTargets)));
    }

    private static String getHumanReadableNames(Collection<Integer> targets) {
        List<String> targetNameList = new ArrayList<>();
        for (Integer target : targets) {
            targetNameList.add(getHumanReadableName(target.intValue()));
        }
        return "[" + String.join(", ", targetNameList) + "]";
    }

    public static String getHumanReadableName(int target) {
        List<String> names = new ArrayList<>();
        if ((target & 4) != 0) {
            names.add("IMAGE_CAPTURE");
        }
        if ((target & 1) != 0) {
            names.add("PREVIEW");
        }
        if ((target & 2) != 0) {
            names.add("VIDEO_CAPTURE");
        }
        return String.join("|", names);
    }
}
