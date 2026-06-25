package androidx.camera.core.internal.utils;
/* loaded from: classes.dex */
public final class VideoUtil {
    private static final String TAG = "VideoUtil";

    private VideoUtil() {
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x005d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String getAbsolutePathFromUri(android.content.ContentResolver r10, android.net.Uri r11) {
        /*
            java.lang.String r0 = "_data"
            r1 = 0
            r2 = 1
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch: java.lang.Throwable -> L30 java.lang.RuntimeException -> L35
            r3 = 0
            r2[r3] = r0     // Catch: java.lang.Throwable -> L30 java.lang.RuntimeException -> L35
            r6 = r2
            r8 = 0
            r9 = 0
            r7 = 0
            r4 = r10
            r5 = r11
            android.database.Cursor r10 = r4.query(r5, r6, r7, r8, r9)     // Catch: java.lang.RuntimeException -> L2d java.lang.Throwable -> L59
            r1 = r10
            java.lang.Object r10 = androidx.core.util.Preconditions.checkNotNull(r1)     // Catch: java.lang.RuntimeException -> L2d java.lang.Throwable -> L59
            android.database.Cursor r10 = (android.database.Cursor) r10     // Catch: java.lang.RuntimeException -> L2d java.lang.Throwable -> L59
            r1 = r10
            int r10 = r1.getColumnIndexOrThrow(r0)     // Catch: java.lang.RuntimeException -> L2d java.lang.Throwable -> L59
            r1.moveToFirst()     // Catch: java.lang.RuntimeException -> L2d java.lang.Throwable -> L59
            java.lang.String r11 = r1.getString(r10)     // Catch: java.lang.RuntimeException -> L2d java.lang.Throwable -> L59
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
            goto L5b
        L35:
            r0 = move-exception
            r4 = r10
            r5 = r11
            r10 = r0
        L39:
            java.lang.String r11 = "VideoUtil"
            java.lang.String r0 = "Failed in getting absolute path for Uri %s with Exception %s"
            java.lang.String r2 = r5.toString()     // Catch: java.lang.Throwable -> L59
            java.lang.String r3 = r10.toString()     // Catch: java.lang.Throwable -> L59
            java.lang.Object[] r2 = new java.lang.Object[]{r2, r3}     // Catch: java.lang.Throwable -> L59
            java.lang.String r0 = java.lang.String.format(r0, r2)     // Catch: java.lang.Throwable -> L59
            androidx.camera.core.Logger.e(r11, r0)     // Catch: java.lang.Throwable -> L59
            java.lang.String r11 = ""
            if (r1 == 0) goto L58
            r1.close()
        L58:
            return r11
        L59:
            r0 = move-exception
            r10 = r0
        L5b:
            if (r1 == 0) goto L60
            r1.close()
        L60:
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.core.internal.utils.VideoUtil.getAbsolutePathFromUri(android.content.ContentResolver, android.net.Uri):java.lang.String");
    }
}
