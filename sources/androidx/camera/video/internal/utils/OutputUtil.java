package androidx.camera.video.internal.utils;

import java.io.File;
/* loaded from: classes.dex */
public final class OutputUtil {
    private static final String TAG = "OutputUtil";

    private OutputUtil() {
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x005c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String getAbsolutePathFromUri(android.content.ContentResolver r10, android.net.Uri r11, java.lang.String r12) {
        /*
            r1 = 0
            r0 = 1
            r2 = 0
            java.lang.String[] r0 = new java.lang.String[r0]     // Catch: java.lang.Throwable -> L30 java.lang.RuntimeException -> L35
            r3 = 0
            r0[r3] = r12     // Catch: java.lang.Throwable -> L30 java.lang.RuntimeException -> L35
            r6 = r0
            r8 = 0
            r9 = 0
            r7 = 0
            r4 = r10
            r5 = r11
            android.database.Cursor r10 = r4.query(r5, r6, r7, r8, r9)     // Catch: java.lang.RuntimeException -> L2d java.lang.Throwable -> L58
            r1 = r10
            if (r1 != 0) goto L1c
        L16:
            if (r1 == 0) goto L1b
            r1.close()
        L1b:
            return r2
        L1c:
            int r10 = r1.getColumnIndexOrThrow(r12)     // Catch: java.lang.RuntimeException -> L2d java.lang.Throwable -> L58
            r1.moveToFirst()     // Catch: java.lang.RuntimeException -> L2d java.lang.Throwable -> L58
            java.lang.String r11 = r1.getString(r10)     // Catch: java.lang.RuntimeException -> L2d java.lang.Throwable -> L58
            if (r1 == 0) goto L2c
            r1.close()
        L2c:
            return r11
        L2d:
            r0 = move-exception
            r10 = r0
            goto L39
        L30:
            r0 = move-exception
            r4 = r10
            r5 = r11
            r10 = r0
            goto L5a
        L35:
            r0 = move-exception
            r4 = r10
            r5 = r11
            r10 = r0
        L39:
            java.lang.String r11 = "OutputUtil"
            java.lang.String r0 = "Failed in getting absolute path for Uri %s with Exception %s"
            java.lang.String r3 = r5.toString()     // Catch: java.lang.Throwable -> L58
            java.lang.String r6 = r10.toString()     // Catch: java.lang.Throwable -> L58
            java.lang.Object[] r3 = new java.lang.Object[]{r3, r6}     // Catch: java.lang.Throwable -> L58
            java.lang.String r0 = java.lang.String.format(r0, r3)     // Catch: java.lang.Throwable -> L58
            androidx.camera.core.Logger.e(r11, r0)     // Catch: java.lang.Throwable -> L58
            if (r1 == 0) goto L57
            r1.close()
        L57:
            return r2
        L58:
            r0 = move-exception
            r10 = r0
        L5a:
            if (r1 == 0) goto L5f
            r1.close()
        L5f:
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.video.internal.utils.OutputUtil.getAbsolutePathFromUri(android.content.ContentResolver, android.net.Uri, java.lang.String):java.lang.String");
    }

    public static boolean createParentFolder(File file) {
        File parentFile = file.getParentFile();
        if (parentFile == null) {
            return false;
        }
        return parentFile.exists() ? parentFile.isDirectory() : parentFile.mkdirs();
    }
}
