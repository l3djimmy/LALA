package com.itextpdf.kernel.colors;

import androidx.compose.runtime.ComposerKt;
import androidx.recyclerview.widget.ItemTouchHelper;
import com.itextpdf.layout.properties.Property;
import java.util.HashMap;
import java.util.StringTokenizer;
/* loaded from: classes12.dex */
public class WebColors extends HashMap<String, int[]> {
    public static final WebColors NAMES = new WebColors();
    private static final double RGB_MAX_VAL = 255.0d;
    private static final long serialVersionUID = 6350366251375926010L;

    static {
        NAMES.put("aliceblue", new int[]{240, 248, 255, 255});
        NAMES.put("antiquewhite", new int[]{ItemTouchHelper.Callback.DEFAULT_SWIPE_ANIMATION_DURATION, 235, 215, 255});
        NAMES.put("aqua", new int[]{0, 255, 255, 255});
        NAMES.put("aquamarine", new int[]{127, 255, 212, 255});
        NAMES.put("azure", new int[]{240, 255, 255, 255});
        NAMES.put("beige", new int[]{245, 245, 220, 255});
        NAMES.put("bisque", new int[]{255, 228, 196, 255});
        NAMES.put("black", new int[]{0, 0, 0, 255});
        NAMES.put("blanchedalmond", new int[]{255, 235, 205, 255});
        NAMES.put("blue", new int[]{0, 0, 255, 255});
        NAMES.put("blueviolet", new int[]{Property.COLUMN_COUNT, 43, 226, 255});
        NAMES.put("brown", new int[]{165, 42, 42, 255});
        NAMES.put("burlywood", new int[]{222, 184, Property.META_INFO, 255});
        NAMES.put("cadetblue", new int[]{95, 158, 160, 255});
        NAMES.put("chartreuse", new int[]{127, 255, 0, 255});
        NAMES.put("chocolate", new int[]{210, 105, 30, 255});
        NAMES.put("coral", new int[]{255, 127, 80, 255});
        NAMES.put("cornflowerblue", new int[]{100, 149, 237, 255});
        NAMES.put("cornsilk", new int[]{255, 248, 220, 255});
        NAMES.put("crimson", new int[]{220, 20, 60, 255});
        NAMES.put("cyan", new int[]{0, 255, 255, 255});
        NAMES.put("darkblue", new int[]{0, 0, Property.FLEX_DIRECTION, 255});
        NAMES.put("darkcyan", new int[]{0, Property.FLEX_DIRECTION, Property.FLEX_DIRECTION, 255});
        NAMES.put("darkgoldenrod", new int[]{184, Property.ALIGN_ITEMS, 11, 255});
        NAMES.put("darkgray", new int[]{169, 169, 169, 255});
        NAMES.put("darkgrey", new int[]{169, 169, 169, 255});
        NAMES.put("darkgreen", new int[]{0, 100, 0, 255});
        NAMES.put("darkkhaki", new int[]{189, 183, 107, 255});
        NAMES.put("darkmagenta", new int[]{Property.FLEX_DIRECTION, 0, Property.FLEX_DIRECTION, 255});
        NAMES.put("darkolivegreen", new int[]{85, 107, 47, 255});
        NAMES.put("darkorange", new int[]{255, Property.TREAT_AS_CONTINUOUS_CONTAINER, 0, 255});
        NAMES.put("darkorchid", new int[]{153, 50, 204, 255});
        NAMES.put("darkred", new int[]{Property.FLEX_DIRECTION, 0, 0, 255});
        NAMES.put("darksalmon", new int[]{233, 150, Property.WIDOWS_CONTROL, 255});
        NAMES.put("darkseagreen", new int[]{Property.COLUMN_GAP, 188, Property.COLUMN_GAP, 255});
        NAMES.put("darkslateblue", new int[]{72, 61, Property.FLEX_DIRECTION, 255});
        NAMES.put("darkslategray", new int[]{47, 79, 79, 255});
        NAMES.put("darkslategrey", new int[]{47, 79, 79, 255});
        NAMES.put("darkturquoise", new int[]{0, ComposerKt.referenceKey, 209, 255});
        NAMES.put("darkviolet", new int[]{148, 0, 211, 255});
        NAMES.put("deeppink", new int[]{255, 20, 147, 255});
        NAMES.put("deepskyblue", new int[]{0, 191, 255, 255});
        NAMES.put("dimgray", new int[]{105, 105, 105, 255});
        NAMES.put("dimgrey", new int[]{105, 105, 105, 255});
        NAMES.put("dodgerblue", new int[]{30, Property.COLUMN_GAP_BORDER, 255, 255});
        NAMES.put("firebrick", new int[]{178, 34, 34, 255});
        NAMES.put("floralwhite", new int[]{255, ItemTouchHelper.Callback.DEFAULT_SWIPE_ANIMATION_DURATION, 240, 255});
        NAMES.put("forestgreen", new int[]{34, Property.FLEX_DIRECTION, 34, 255});
        NAMES.put("fuchsia", new int[]{255, 0, 255, 255});
        NAMES.put("gainsboro", new int[]{220, 220, 220, 255});
        NAMES.put("ghostwhite", new int[]{248, 248, 255, 255});
        NAMES.put("gold", new int[]{255, 215, 0, 255});
        NAMES.put("goldenrod", new int[]{218, 165, 32, 255});
        NAMES.put("gray", new int[]{128, 128, 128, 255});
        NAMES.put("grey", new int[]{128, 128, 128, 255});
        NAMES.put("green", new int[]{0, 128, 0, 255});
        NAMES.put("greenyellow", new int[]{173, 255, 47, 255});
        NAMES.put("honeydew", new int[]{240, 255, 240, 255});
        NAMES.put("hotpink", new int[]{255, 105, 180, 255});
        NAMES.put("indianred", new int[]{205, 92, 92, 255});
        NAMES.put("indigo", new int[]{75, 0, Property.ALIGN_CONTENT, 255});
        NAMES.put("ivory", new int[]{255, 255, 240, 255});
        NAMES.put("khaki", new int[]{240, 230, Property.TREAT_AS_CONTINUOUS_CONTAINER, 255});
        NAMES.put("lavender", new int[]{230, 230, ItemTouchHelper.Callback.DEFAULT_SWIPE_ANIMATION_DURATION, 255});
        NAMES.put("lavenderblush", new int[]{255, 240, 245, 255});
        NAMES.put("lawngreen", new int[]{Property.LINE_HEIGHT, 252, 0, 255});
        NAMES.put("lemonchiffon", new int[]{255, ItemTouchHelper.Callback.DEFAULT_SWIPE_ANIMATION_DURATION, 205, 255});
        NAMES.put("lightblue", new int[]{173, 216, 230, 255});
        NAMES.put("lightcoral", new int[]{240, 128, 128, 255});
        NAMES.put("lightcyan", new int[]{224, 255, 255, 255});
        NAMES.put("lightgoldenrodyellow", new int[]{ItemTouchHelper.Callback.DEFAULT_SWIPE_ANIMATION_DURATION, ItemTouchHelper.Callback.DEFAULT_SWIPE_ANIMATION_DURATION, 210, 255});
        NAMES.put("lightgreen", new int[]{Property.COLUMN_GAP_BORDER, 238, Property.COLUMN_GAP_BORDER, 255});
        NAMES.put("lightgray", new int[]{211, 211, 211, 255});
        NAMES.put("lightgrey", new int[]{211, 211, 211, 255});
        NAMES.put("lightpink", new int[]{255, 182, 193, 255});
        NAMES.put("lightsalmon", new int[]{255, 160, Property.WIDOWS_CONTROL, 255});
        NAMES.put("lightseagreen", new int[]{32, 178, 170, 255});
        NAMES.put("lightskyblue", new int[]{Property.META_INFO, ComposerKt.referenceKey, ItemTouchHelper.Callback.DEFAULT_SWIPE_ANIMATION_DURATION, 255});
        NAMES.put("lightslategray", new int[]{Property.CAPTION_SIDE, Property.INLINE_VERTICAL_ALIGNMENT, 153, 255});
        NAMES.put("lightslategrey", new int[]{Property.CAPTION_SIDE, Property.INLINE_VERTICAL_ALIGNMENT, 153, 255});
        NAMES.put("lightsteelblue", new int[]{176, 196, 222, 255});
        NAMES.put("lightyellow", new int[]{255, 255, 224, 255});
        NAMES.put("lime", new int[]{0, 255, 0, 255});
        NAMES.put("limegreen", new int[]{50, 205, 50, 255});
        NAMES.put("linen", new int[]{ItemTouchHelper.Callback.DEFAULT_SWIPE_ANIMATION_DURATION, 240, 230, 255});
        NAMES.put("magenta", new int[]{255, 0, 255, 255});
        NAMES.put("maroon", new int[]{128, 0, 0, 255});
        NAMES.put("mediumaquamarine", new int[]{102, 205, 170, 255});
        NAMES.put("mediumblue", new int[]{0, 0, 205, 255});
        NAMES.put("mediumorchid", new int[]{186, 85, 211, 255});
        NAMES.put("mediumpurple", new int[]{147, Property.BORDER_BOTTOM_RIGHT_RADIUS, 219, 255});
        NAMES.put("mediumseagreen", new int[]{60, 179, Property.BORDER_BOTTOM_LEFT_RADIUS, 255});
        NAMES.put("mediumslateblue", new int[]{Property.RENDERING_MODE, 104, 238, 255});
        NAMES.put("mediumspringgreen", new int[]{0, ItemTouchHelper.Callback.DEFAULT_SWIPE_ANIMATION_DURATION, 154, 255});
        NAMES.put("mediumturquoise", new int[]{72, 209, 204, 255});
        NAMES.put("mediumvioletred", new int[]{199, 21, Property.JUSTIFY_CONTENT, 255});
        NAMES.put("midnightblue", new int[]{25, 25, Property.BORDER_BOTTOM_RIGHT_RADIUS, 255});
        NAMES.put("mintcream", new int[]{245, 255, ItemTouchHelper.Callback.DEFAULT_SWIPE_ANIMATION_DURATION, 255});
        NAMES.put("mistyrose", new int[]{255, 228, 225, 255});
        NAMES.put("moccasin", new int[]{255, 228, 181, 255});
        NAMES.put("navajowhite", new int[]{255, 222, 173, 255});
        NAMES.put("navy", new int[]{0, 0, 128, 255});
        NAMES.put("oldlace", new int[]{253, 245, 230, 255});
        NAMES.put("olive", new int[]{128, 128, 0, 255});
        NAMES.put("olivedrab", new int[]{107, Property.COLUMN_WIDTH, 35, 255});
        NAMES.put("orange", new int[]{255, 165, 0, 255});
        NAMES.put("orangered", new int[]{255, 69, 0, 255});
        NAMES.put("orchid", new int[]{218, Property.BORDER_BOTTOM_RIGHT_RADIUS, 214, 255});
        NAMES.put("palegoldenrod", new int[]{238, 232, 170, 255});
        NAMES.put("palegreen", new int[]{152, 251, 152, 255});
        NAMES.put("paleturquoise", new int[]{175, 238, 238, 255});
        NAMES.put("palevioletred", new int[]{219, Property.BORDER_BOTTOM_RIGHT_RADIUS, 147, 255});
        NAMES.put("papayawhip", new int[]{255, 239, 213, 255});
        NAMES.put("peachpuff", new int[]{255, 218, 185, 255});
        NAMES.put("peru", new int[]{205, Property.JUSTIFY_CONTENT, 63, 255});
        NAMES.put("pink", new int[]{255, 192, 203, 255});
        NAMES.put("plum", new int[]{221, 160, 221, 255});
        NAMES.put("powderblue", new int[]{176, 224, 230, 255});
        NAMES.put("purple", new int[]{128, 0, 128, 255});
        NAMES.put("red", new int[]{255, 0, 0, 255});
        NAMES.put("rosybrown", new int[]{188, Property.COLUMN_GAP, Property.COLUMN_GAP, 255});
        NAMES.put("royalblue", new int[]{65, 105, 225, 255});
        NAMES.put("saddlebrown", new int[]{Property.FLEX_DIRECTION, 69, 19, 255});
        NAMES.put("salmon", new int[]{ItemTouchHelper.Callback.DEFAULT_SWIPE_ANIMATION_DURATION, 128, Property.BORDER_COLLAPSE, 255});
        NAMES.put("sandybrown", new int[]{244, 164, 96, 255});
        NAMES.put("seagreen", new int[]{46, Property.FLEX_DIRECTION, 87, 255});
        NAMES.put("seashell", new int[]{255, 245, 238, 255});
        NAMES.put("sienna", new int[]{160, 82, 45, 255});
        NAMES.put("silver", new int[]{192, 192, 192, 255});
        NAMES.put("skyblue", new int[]{Property.META_INFO, ComposerKt.referenceKey, 235, 255});
        NAMES.put("slateblue", new int[]{Property.OUTLINE, 90, 205, 255});
        NAMES.put("slategray", new int[]{Property.BORDER_BOTTOM_RIGHT_RADIUS, 128, Property.COLUMN_GAP_BORDER, 255});
        NAMES.put("slategrey", new int[]{Property.BORDER_BOTTOM_RIGHT_RADIUS, 128, Property.COLUMN_GAP_BORDER, 255});
        NAMES.put("snow", new int[]{255, ItemTouchHelper.Callback.DEFAULT_SWIPE_ANIMATION_DURATION, ItemTouchHelper.Callback.DEFAULT_SWIPE_ANIMATION_DURATION, 255});
        NAMES.put("springgreen", new int[]{0, 255, 127, 255});
        NAMES.put("steelblue", new int[]{70, Property.ALIGN_CONTENT, 180, 255});
        NAMES.put("tan", new int[]{210, 180, Property.TREAT_AS_CONTINUOUS_CONTAINER, 255});
        NAMES.put("teal", new int[]{0, 128, 128, 255});
        NAMES.put("thistle", new int[]{216, 191, 216, 255});
        NAMES.put("tomato", new int[]{255, 99, 71, 255});
        NAMES.put("transparent", new int[]{255, 255, 255, 0});
        NAMES.put("turquoise", new int[]{64, 224, 208, 255});
        NAMES.put("violet", new int[]{238, Property.ALIGN_CONTENT, 238, 255});
        NAMES.put("wheat", new int[]{245, 222, 179, 255});
        NAMES.put("white", new int[]{255, 255, 255, 255});
        NAMES.put("whitesmoke", new int[]{245, 245, 245, 255});
        NAMES.put("yellow", new int[]{255, 255, 0, 255});
        NAMES.put("yellowgreen", new int[]{154, 205, 50, 255});
    }

    public static DeviceRgb getRGBColor(String name) {
        float[] rgbaColor = getRGBAColor(name);
        if (rgbaColor == null) {
            return new DeviceRgb(0, 0, 0);
        }
        return new DeviceRgb(rgbaColor[0], rgbaColor[1], rgbaColor[2]);
    }

    public static DeviceCmyk getCMYKColor(String name) {
        float[] cmykColor = getCMYKArray(name);
        if (cmykColor == null) {
            return new DeviceCmyk(0, 0, 0, 100);
        }
        return new DeviceCmyk(cmykColor[0], cmykColor[1], cmykColor[2], cmykColor[3]);
    }

    public static float[] getCMYKArray(String name) {
        try {
            String colorName = name.toLowerCase();
            if (colorName.startsWith("device-cmyk(")) {
                StringTokenizer tok = new StringTokenizer(colorName, "device-cmyk()/, \t\r\n\f");
                float[] color = {0.0f, 0.0f, 0.0f, 1.0f, 1.0f};
                parseCMYKColors(color, tok);
                if (tok.hasMoreTokens()) {
                    color[4] = getAlphaChannelValue(tok.nextToken());
                    return color;
                }
                return color;
            }
            return null;
        } catch (Exception e) {
            return null;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0098, code lost:
        r3 = r3.substring(1);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static float[] getRGBAColor(java.lang.String r13) {
        /*
            Method dump skipped, instructions count: 392
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.kernel.colors.WebColors.getRGBAColor(java.lang.String):float[]");
    }

    private static void parseRGBColors(float[] color, StringTokenizer tok) {
        for (int k = 0; k < 3; k++) {
            if (tok.hasMoreTokens()) {
                color[k] = getRGBChannelValue(tok.nextToken());
                color[k] = Math.max(0.0f, color[k]);
                color[k] = Math.min(1.0f, color[k]);
            }
        }
    }

    private static void parseCMYKColors(float[] color, StringTokenizer tok) {
        for (int k = 0; k < 4; k++) {
            if (tok.hasMoreTokens()) {
                color[k] = getCMYKChannelValue(tok.nextToken());
                color[k] = Math.max(0.0f, color[k]);
                color[k] = Math.min(1.0f, color[k]);
            }
        }
    }

    private static boolean missingHashColorFormat(String colStr) {
        int len = colStr.length();
        if (len == 3 || len == 6) {
            String match = "[0-9a-f]{" + len + "}";
            return colStr.matches(match);
        }
        return false;
    }

    private static float getRGBChannelValue(String rgbChannel) {
        if (rgbChannel.endsWith("%")) {
            return parsePercentValue(rgbChannel);
        }
        return (float) (Integer.parseInt(rgbChannel) / RGB_MAX_VAL);
    }

    private static float getCMYKChannelValue(String cmykChannel) {
        if (cmykChannel.endsWith("%")) {
            return parsePercentValue(cmykChannel);
        }
        return Float.parseFloat(cmykChannel);
    }

    private static float getAlphaChannelValue(String rgbChannel) {
        float alpha;
        if (rgbChannel.endsWith("%")) {
            alpha = parsePercentValue(rgbChannel);
        } else {
            alpha = Float.parseFloat(rgbChannel);
        }
        return Math.min(1.0f, Math.max(0.0f, alpha));
    }

    private static float parsePercentValue(String rgbChannel) {
        return (float) (Float.parseFloat(rgbChannel.substring(0, rgbChannel.length() - 1)) / 100.0d);
    }
}
