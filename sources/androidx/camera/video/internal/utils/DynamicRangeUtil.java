package androidx.camera.video.internal.utils;

import androidx.camera.core.DynamicRange;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
/* loaded from: classes.dex */
public class DynamicRangeUtil {
    public static final Map<Integer, Set<Integer>> DR_TO_VP_BIT_DEPTH_MAP = new HashMap();
    public static final Map<Integer, Set<Integer>> DR_TO_VP_FORMAT_MAP = new HashMap();
    public static final Map<Integer, Integer> VP_TO_DR_FORMAT_MAP = new HashMap();
    private static final Map<String, Map<DynamicRange, Integer>> MIME_TO_DEFAULT_PROFILE_LEVEL_MAP = new HashMap();

    static {
        DR_TO_VP_BIT_DEPTH_MAP.put(8, new HashSet(Collections.singletonList(8)));
        DR_TO_VP_BIT_DEPTH_MAP.put(10, new HashSet(Collections.singletonList(10)));
        DR_TO_VP_BIT_DEPTH_MAP.put(0, new HashSet(Arrays.asList(8, 10)));
        DR_TO_VP_FORMAT_MAP.put(0, new HashSet(Arrays.asList(0, 1, 2, 3, 4)));
        DR_TO_VP_FORMAT_MAP.put(1, new HashSet(Collections.singletonList(0)));
        DR_TO_VP_FORMAT_MAP.put(2, new HashSet(Arrays.asList(1, 2, 3, 4)));
        DR_TO_VP_FORMAT_MAP.put(3, new HashSet(Collections.singletonList(1)));
        DR_TO_VP_FORMAT_MAP.put(4, new HashSet(Collections.singletonList(2)));
        DR_TO_VP_FORMAT_MAP.put(5, new HashSet(Collections.singletonList(3)));
        DR_TO_VP_FORMAT_MAP.put(6, new HashSet(Collections.singletonList(4)));
        VP_TO_DR_FORMAT_MAP.put(0, 1);
        VP_TO_DR_FORMAT_MAP.put(1, 3);
        VP_TO_DR_FORMAT_MAP.put(2, 4);
        VP_TO_DR_FORMAT_MAP.put(3, 5);
        VP_TO_DR_FORMAT_MAP.put(4, 6);
        Map<DynamicRange, Integer> hevcMap = new HashMap<>();
        hevcMap.put(DynamicRange.SDR, 1);
        hevcMap.put(DynamicRange.HLG_10_BIT, 2);
        hevcMap.put(DynamicRange.HDR10_10_BIT, 4096);
        hevcMap.put(DynamicRange.HDR10_PLUS_10_BIT, 8192);
        Map<DynamicRange, Integer> av1420Map = new HashMap<>();
        av1420Map.put(DynamicRange.SDR, 1);
        av1420Map.put(DynamicRange.HLG_10_BIT, 2);
        av1420Map.put(DynamicRange.HDR10_10_BIT, 4096);
        av1420Map.put(DynamicRange.HDR10_PLUS_10_BIT, 8192);
        Map<DynamicRange, Integer> vp9420Map = new HashMap<>();
        vp9420Map.put(DynamicRange.SDR, 1);
        vp9420Map.put(DynamicRange.HLG_10_BIT, 4);
        vp9420Map.put(DynamicRange.HDR10_10_BIT, 4096);
        vp9420Map.put(DynamicRange.HDR10_PLUS_10_BIT, 16384);
        Map<DynamicRange, Integer> dvMap = new HashMap<>();
        dvMap.put(DynamicRange.DOLBY_VISION_10_BIT, 256);
        dvMap.put(DynamicRange.DOLBY_VISION_8_BIT, 512);
        MIME_TO_DEFAULT_PROFILE_LEVEL_MAP.put("video/hevc", hevcMap);
        MIME_TO_DEFAULT_PROFILE_LEVEL_MAP.put("video/av01", av1420Map);
        MIME_TO_DEFAULT_PROFILE_LEVEL_MAP.put("video/x-vnd.on2.vp9", vp9420Map);
        MIME_TO_DEFAULT_PROFILE_LEVEL_MAP.put("video/dolby-vision", dvMap);
    }

    private DynamicRangeUtil() {
    }

    public static Set<Integer> dynamicRangeToVideoProfileHdrFormats(DynamicRange dynamicRange) {
        Set<Integer> hdrFormats = DR_TO_VP_FORMAT_MAP.get(Integer.valueOf(dynamicRange.getEncoding()));
        if (hdrFormats == null) {
            return Collections.emptySet();
        }
        return hdrFormats;
    }

    public static Set<Integer> dynamicRangeToVideoProfileBitDepth(DynamicRange dynamicRange) {
        Set<Integer> bitDepths = DR_TO_VP_BIT_DEPTH_MAP.get(Integer.valueOf(dynamicRange.getBitDepth()));
        if (bitDepths == null) {
            return Collections.emptySet();
        }
        return bitDepths;
    }

    public static int dynamicRangeToCodecProfileLevelForMime(String mimeType, DynamicRange dynamicRange) {
        Integer profile;
        Map<DynamicRange, Integer> hdrToProfile = MIME_TO_DEFAULT_PROFILE_LEVEL_MAP.get(mimeType);
        if (hdrToProfile != null && (profile = hdrToProfile.get(dynamicRange)) != null) {
            return profile.intValue();
        }
        return -1;
    }
}
