package androidx.camera.view;
/* loaded from: classes.dex */
final class FlashModeConverter {
    private FlashModeConverter() {
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public static int valueOf(String name) {
        char c;
        if (name == null) {
            throw new NullPointerException("name cannot be null");
        }
        switch (name.hashCode()) {
            case 2527:
                if (name.equals("ON")) {
                    c = 1;
                    break;
                }
                c = 65535;
                break;
            case 78159:
                if (name.equals("OFF")) {
                    c = 2;
                    break;
                }
                c = 65535;
                break;
            case 2020783:
                if (name.equals("AUTO")) {
                    c = 0;
                    break;
                }
                c = 65535;
                break;
            default:
                c = 65535;
                break;
        }
        switch (c) {
            case 0:
                return 0;
            case 1:
                return 1;
            case 2:
                return 2;
            default:
                throw new IllegalArgumentException("Unknown flash mode name " + name);
        }
    }

    public static String nameOf(int flashMode) {
        switch (flashMode) {
            case 0:
                return "AUTO";
            case 1:
                return "ON";
            case 2:
                return "OFF";
            default:
                throw new IllegalArgumentException("Unknown flash mode " + flashMode);
        }
    }
}
