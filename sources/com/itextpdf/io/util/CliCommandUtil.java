package com.itextpdf.io.util;

import com.itextpdf.commons.utils.SystemUtil;
/* loaded from: classes12.dex */
public final class CliCommandUtil {
    private CliCommandUtil() {
    }

    public static boolean isVersionCommandExecutable(String command, String versionText) {
        if (command == null || versionText == null) {
            return false;
        }
        try {
            String result = SystemUtil.runProcessAndGetOutput(command, "-version");
            return result.contains(versionText);
        } catch (Exception e) {
            return false;
        }
    }
}
