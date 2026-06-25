package androidx.camera.core;

import android.util.Log;
/* loaded from: classes.dex */
public final class Logger {
    static final int DEFAULT_MIN_LOG_LEVEL = 3;
    private static final int MAX_TAG_LENGTH = 23;
    private static int sMinLogLevel = 3;

    private Logger() {
    }

    private static boolean isLogLevelEnabled(String truncatedTag, int logLevel) {
        return sMinLogLevel <= logLevel || Log.isLoggable(truncatedTag, logLevel);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void setMinLogLevel(int logLevel) {
        sMinLogLevel = logLevel;
    }

    static int getMinLogLevel() {
        return sMinLogLevel;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void resetMinLogLevel() {
        sMinLogLevel = 3;
    }

    public static boolean isDebugEnabled(String tag) {
        return isLogLevelEnabled(truncateTag(tag), 3);
    }

    public static boolean isInfoEnabled(String tag) {
        return isLogLevelEnabled(truncateTag(tag), 4);
    }

    public static boolean isWarnEnabled(String tag) {
        return isLogLevelEnabled(truncateTag(tag), 5);
    }

    public static boolean isErrorEnabled(String tag) {
        return isLogLevelEnabled(truncateTag(tag), 6);
    }

    public static void d(String tag, String message) {
        String truncatedTag = truncateTag(tag);
        if (isLogLevelEnabled(truncatedTag, 3)) {
            Log.d(truncatedTag, message);
        }
    }

    public static void d(String tag, String message, Throwable throwable) {
        String truncatedTag = truncateTag(tag);
        if (isLogLevelEnabled(truncatedTag, 3)) {
            Log.d(truncatedTag, message, throwable);
        }
    }

    public static void i(String tag, String message) {
        String truncatedTag = truncateTag(tag);
        if (isLogLevelEnabled(truncatedTag, 4)) {
            Log.i(truncatedTag, message);
        }
    }

    public static void i(String tag, String message, Throwable throwable) {
        String truncatedTag = truncateTag(tag);
        if (isLogLevelEnabled(truncatedTag, 4)) {
            Log.i(truncatedTag, message, throwable);
        }
    }

    public static void w(String tag, String message) {
        String truncatedTag = truncateTag(tag);
        if (isLogLevelEnabled(truncatedTag, 5)) {
            Log.w(truncatedTag, message);
        }
    }

    public static void w(String tag, String message, Throwable throwable) {
        String truncatedTag = truncateTag(tag);
        if (isLogLevelEnabled(truncatedTag, 5)) {
            Log.w(truncatedTag, message, throwable);
        }
    }

    public static void e(String tag, String message) {
        String truncatedTag = truncateTag(tag);
        if (isLogLevelEnabled(truncatedTag, 6)) {
            Log.e(truncatedTag, message);
        }
    }

    public static void e(String tag, String message, Throwable throwable) {
        String truncatedTag = truncateTag(tag);
        if (isLogLevelEnabled(truncatedTag, 6)) {
            Log.e(truncatedTag, message, throwable);
        }
    }

    private static String truncateTag(String tag) {
        return tag;
    }
}
