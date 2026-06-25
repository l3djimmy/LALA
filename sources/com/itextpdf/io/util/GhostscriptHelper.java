package com.itextpdf.io.util;

import com.itextpdf.commons.utils.SystemUtil;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import java.io.IOException;
import java.util.regex.Pattern;
/* loaded from: classes12.dex */
public class GhostscriptHelper {
    public static final String GHOSTSCRIPT_ENVIRONMENT_VARIABLE = "ITEXT_GS_EXEC";
    @Deprecated
    static final String GHOSTSCRIPT_ENVIRONMENT_VARIABLE_LEGACY = "gsExec";
    static final String GHOSTSCRIPT_KEYWORD = "GPL Ghostscript";
    private static final String GHOSTSCRIPT_PARAMS = " -dSAFER -dNOPAUSE -dBATCH -sDEVICE=png16m -r150 {0} -sOutputFile=\"{1}\" \"{2}\"";
    private static final Pattern PAGE_LIST_REGEX = Pattern.compile("^(\\d+,)*\\d+$");
    private static final String PAGE_NUMBER_PATTERN = "%03d";
    private static final String RENDERED_IMAGE_EXTENSION = "png";
    private static final String TEMP_FILE_PREFIX = "itext_gs_io_temp";
    private String gsExec;

    public GhostscriptHelper() {
        this(null);
    }

    public GhostscriptHelper(String newGsExec) {
        this.gsExec = newGsExec;
        if (this.gsExec == null) {
            this.gsExec = SystemUtil.getPropertyOrEnvironmentVariable(GHOSTSCRIPT_ENVIRONMENT_VARIABLE);
            if (this.gsExec == null) {
                this.gsExec = SystemUtil.getPropertyOrEnvironmentVariable(GHOSTSCRIPT_ENVIRONMENT_VARIABLE_LEGACY);
            }
        }
        if (!CliCommandUtil.isVersionCommandExecutable(this.gsExec, GHOSTSCRIPT_KEYWORD)) {
            throw new IllegalArgumentException(IoExceptionMessageConstant.GS_ENVIRONMENT_VARIABLE_IS_NOT_SPECIFIED);
        }
    }

    public String getCliExecutionCommand() {
        return this.gsExec;
    }

    public void runGhostScriptImageGeneration(String pdf, String outDir, String image) throws IOException, InterruptedException {
        runGhostScriptImageGeneration(pdf, outDir, image, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x00e9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void runGhostScriptImageGeneration(java.lang.String r18, java.lang.String r19, java.lang.String r20, java.lang.String r21) throws java.io.IOException, java.lang.InterruptedException {
        /*
            Method dump skipped, instructions count: 320
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.io.util.GhostscriptHelper.runGhostScriptImageGeneration(java.lang.String, java.lang.String, java.lang.String, java.lang.String):void");
    }

    /* loaded from: classes12.dex */
    public static class GhostscriptExecutionException extends RuntimeException {
        public GhostscriptExecutionException(String msg) {
            super(msg);
        }
    }

    static boolean validatePageList(String pageList) {
        return pageList == null || PAGE_LIST_REGEX.matcher(pageList).matches();
    }

    static boolean validateImageFilePattern(String imageFilePattern) {
        return (imageFilePattern == null || imageFilePattern.trim().isEmpty() || imageFilePattern.contains("%")) ? false : true;
    }

    static String formatImageNumber(int pageNumber) {
        StringBuilder stringBuilder = new StringBuilder();
        for (int zeroFiller = pageNumber; zeroFiller / 100 == 0; zeroFiller *= 10) {
            stringBuilder.append('0');
        }
        stringBuilder.append(pageNumber);
        return stringBuilder.toString();
    }
}
