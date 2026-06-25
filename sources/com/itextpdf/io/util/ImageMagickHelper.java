package com.itextpdf.io.util;

import androidx.camera.video.AudioStats;
import com.itextpdf.commons.utils.FileUtil;
import com.itextpdf.commons.utils.ProcessInfo;
import com.itextpdf.commons.utils.SystemUtil;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/* loaded from: classes12.dex */
public class ImageMagickHelper {
    public static final String MAGICK_COMPARE_ENVIRONMENT_VARIABLE = "ITEXT_MAGICK_COMPARE_EXEC";
    @Deprecated
    static final String MAGICK_COMPARE_ENVIRONMENT_VARIABLE_LEGACY = "compareExec";
    static final String MAGICK_COMPARE_KEYWORD = "ImageMagick Studio LLC";
    private static final String TEMP_FILE_PREFIX = "itext_im_io_temp";
    private String compareExec;
    private static final String DIFF_PIXELS_OUTPUT_REGEXP = "^\\d+\\.*\\d*(e\\+\\d+)?";
    private static final Pattern pattern = Pattern.compile(DIFF_PIXELS_OUTPUT_REGEXP);

    public ImageMagickHelper() {
        this(null);
    }

    public ImageMagickHelper(String newCompareExec) {
        this.compareExec = newCompareExec;
        if (this.compareExec == null) {
            this.compareExec = SystemUtil.getPropertyOrEnvironmentVariable(MAGICK_COMPARE_ENVIRONMENT_VARIABLE);
            if (this.compareExec == null) {
                this.compareExec = SystemUtil.getPropertyOrEnvironmentVariable(MAGICK_COMPARE_ENVIRONMENT_VARIABLE_LEGACY);
            }
        }
        if (!CliCommandUtil.isVersionCommandExecutable(this.compareExec, MAGICK_COMPARE_KEYWORD)) {
            throw new IllegalArgumentException(IoExceptionMessageConstant.COMPARE_COMMAND_SPECIFIED_INCORRECTLY);
        }
    }

    public String getCliExecutionCommand() {
        return this.compareExec;
    }

    public boolean runImageMagickImageCompare(String outImageFilePath, String cmpImageFilePath, String diffImageName) throws IOException, InterruptedException {
        return runImageMagickImageCompare(outImageFilePath, cmpImageFilePath, diffImageName, null);
    }

    public boolean runImageMagickImageCompare(String outImageFilePath, String cmpImageFilePath, String diffImageName, String fuzzValue) throws IOException, InterruptedException {
        ImageMagickCompareResult compareResult = runImageMagickImageCompareAndGetResult(outImageFilePath, cmpImageFilePath, diffImageName, fuzzValue);
        return compareResult.isComparingResultSuccessful();
    }

    public boolean runImageMagickImageCompareWithThreshold(String outImageFilePath, String cmpImageFilePath, String diffImageName, String fuzzValue, long threshold) throws IOException, InterruptedException {
        ImageMagickCompareResult compareResult = runImageMagickImageCompareAndGetResult(outImageFilePath, cmpImageFilePath, diffImageName, fuzzValue);
        return compareResult.isComparingResultSuccessful() || compareResult.getDiffPixels() <= threshold;
    }

    public ImageMagickCompareResult runImageMagickImageCompareAndGetResult(String outImageFilePath, String cmpImageFilePath, String diffImageName, String fuzzValue) throws IOException, InterruptedException {
        char c;
        char c2;
        if (!validateFuzziness(fuzzValue)) {
            throw new IllegalArgumentException("Invalid fuzziness value: " + fuzzValue);
        }
        String fuzzValue2 = fuzzValue == null ? "" : " -metric AE -fuzz <fuzzValue>%".replace("<fuzzValue>", fuzzValue);
        String replacementOutFile = null;
        String replacementCmpFile = null;
        String replacementDiff = null;
        try {
            replacementOutFile = FileUtil.createTempCopy(outImageFilePath, TEMP_FILE_PREFIX, null);
            try {
                replacementCmpFile = FileUtil.createTempCopy(cmpImageFilePath, TEMP_FILE_PREFIX, null);
                replacementDiff = FileUtil.createTempFile(TEMP_FILE_PREFIX, ".png").getAbsolutePath();
                String currCompareParams = fuzzValue2 + " '" + replacementOutFile + "' '" + replacementCmpFile + "' '" + replacementDiff + "'";
                try {
                    ProcessInfo processInfo = SystemUtil.runProcessAndGetProcessInfo(this.compareExec, currCompareParams);
                    boolean comparingResult = processInfo.getExitCode() == 0;
                    long diffPixels = parseImageMagickProcessOutput(processInfo.getProcessErrOutput());
                    c = 2;
                    try {
                        ImageMagickCompareResult resultInfo = new ImageMagickCompareResult(comparingResult, diffPixels);
                        if (FileUtil.fileExists(replacementDiff)) {
                            c2 = 1;
                            try {
                                FileUtil.copy(replacementDiff, diffImageName);
                            } catch (Throwable th) {
                                th = th;
                                String[] strArr = new String[3];
                                strArr[0] = replacementOutFile;
                                strArr[c2] = replacementCmpFile;
                                strArr[c] = replacementDiff;
                                FileUtil.removeFiles(strArr);
                                throw th;
                            }
                        } else {
                            c2 = 1;
                        }
                        String[] strArr2 = new String[3];
                        strArr2[0] = replacementOutFile;
                        strArr2[c2] = replacementCmpFile;
                        strArr2[2] = replacementDiff;
                        FileUtil.removeFiles(strArr2);
                        return resultInfo;
                    } catch (Throwable th2) {
                        th = th2;
                        c2 = 1;
                        String[] strArr3 = new String[3];
                        strArr3[0] = replacementOutFile;
                        strArr3[c2] = replacementCmpFile;
                        strArr3[c] = replacementDiff;
                        FileUtil.removeFiles(strArr3);
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    c = 2;
                    c2 = 1;
                    String[] strArr32 = new String[3];
                    strArr32[0] = replacementOutFile;
                    strArr32[c2] = replacementCmpFile;
                    strArr32[c] = replacementDiff;
                    FileUtil.removeFiles(strArr32);
                    throw th;
                }
            } catch (Throwable th4) {
                th = th4;
                c = 2;
                c2 = 1;
            }
        } catch (Throwable th5) {
            th = th5;
        }
    }

    static boolean validateFuzziness(String fuzziness) {
        if (fuzziness == null) {
            return true;
        }
        try {
            if (Double.parseDouble(fuzziness) >= AudioStats.AUDIO_AMPLITUDE_NONE) {
                return true;
            }
            return false;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    private static long parseImageMagickProcessOutput(String processOutput) throws IOException {
        Matcher matcher;
        if (processOutput == null) {
            throw new IllegalArgumentException(IoExceptionMessageConstant.IMAGE_MAGICK_OUTPUT_IS_NULL);
        }
        if (processOutput.isEmpty()) {
            return 0L;
        }
        String[] processOutputLines = processOutput.split("\n");
        int length = processOutputLines.length;
        for (int i = 0; i < length; i++) {
            String line = processOutputLines[i];
            try {
                matcher = pattern.matcher(line);
            } catch (NumberFormatException e) {
            }
            if (!matcher.find()) {
                continue;
            } else {
                return Double.valueOf(matcher.group()).longValue();
            }
        }
        throw new IOException(IoExceptionMessageConstant.IMAGE_MAGICK_PROCESS_EXECUTION_FAILED + processOutput);
    }
}
