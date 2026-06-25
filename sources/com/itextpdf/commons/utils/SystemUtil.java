package com.itextpdf.commons.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/* loaded from: classes12.dex */
public final class SystemUtil {
    private static final String SPLIT_REGEX = "((\".+?\"|[^'\\s]|'.+?')+)\\s*";

    public static long getTimeBasedSeed() {
        return System.currentTimeMillis();
    }

    public static int getTimeBasedIntSeed() {
        return (int) System.currentTimeMillis();
    }

    private SystemUtil() {
    }

    public static long getRelativeTimeMillis() {
        return System.currentTimeMillis();
    }

    public static long getFreeMemory() {
        return Runtime.getRuntime().freeMemory();
    }

    public static String getPropertyOrEnvironmentVariable(String name) {
        String s = System.getProperty(name);
        if (s == null) {
            return System.getenv(name);
        }
        return s;
    }

    public static boolean runProcessAndWait(String exec, String params) throws IOException, InterruptedException {
        return runProcessAndWait(exec, params, null);
    }

    public static boolean runProcessAndWait(String exec, String params, String workingDirPath) throws IOException, InterruptedException {
        return runProcessAndGetExitCode(exec, params, workingDirPath) == 0;
    }

    public static int runProcessAndGetExitCode(String exec, String params) throws IOException, InterruptedException {
        return runProcessAndGetExitCode(exec, params, null);
    }

    public static int runProcessAndGetExitCode(String exec, String params, String workingDirPath) throws IOException, InterruptedException {
        Process p = runProcess(exec, params, workingDirPath);
        System.out.println(getProcessOutput(p));
        return p.waitFor();
    }

    public static String runProcessAndGetOutput(String command, String params) throws IOException {
        return getProcessOutput(runProcess(command, params, null));
    }

    public static StringBuilder runProcessAndCollectErrors(String execPath, String params) throws IOException {
        return printProcessErrorsOutput(runProcess(execPath, params, null));
    }

    public static ProcessInfo runProcessAndGetProcessInfo(String command, String params) throws IOException, InterruptedException {
        Process p = runProcess(command, params, null);
        String processStdOutput = printProcessStandardOutput(p).toString();
        String processErrOutput = printProcessErrorsOutput(p).toString();
        return new ProcessInfo(p.waitFor(), processStdOutput, processErrOutput);
    }

    static Process runProcess(String execPath, String params, String workingDirPath) throws IOException {
        List<String> cmdList = prepareProcessArguments(execPath, params);
        String[] cmdArray = (String[]) cmdList.toArray(new String[0]);
        if (workingDirPath != null) {
            File workingDir = new File(workingDirPath);
            return Runtime.getRuntime().exec(cmdArray, (String[]) null, workingDir);
        }
        return Runtime.getRuntime().exec(cmdArray);
    }

    static List<String> prepareProcessArguments(String exec, String params) {
        List<String> cmdList;
        if (new File(exec).exists()) {
            cmdList = new ArrayList<>(Collections.singletonList(exec));
        } else {
            cmdList = new ArrayList<>(splitIntoProcessArguments(exec));
        }
        cmdList.addAll(splitIntoProcessArguments(params));
        return cmdList;
    }

    static List<String> splitIntoProcessArguments(String line) {
        List<String> list = new ArrayList<>();
        Matcher m = Pattern.compile(SPLIT_REGEX).matcher(line);
        while (m.find()) {
            list.add(m.group(1).replace("'", "").replace("\"", "").trim());
        }
        return list;
    }

    static String getProcessOutput(Process p) throws IOException {
        BufferedReader bri = new BufferedReader(new InputStreamReader(p.getInputStream()));
        BufferedReader bre = new BufferedReader(new InputStreamReader(p.getErrorStream()));
        StringBuilder result = new StringBuilder();
        while (true) {
            String line = bri.readLine();
            if (line == null) {
                break;
            }
            result.append(line);
        }
        bri.close();
        if (result.length() > 0) {
            result.append('\n');
        }
        while (true) {
            String line2 = bre.readLine();
            if (line2 != null) {
                result.append(line2);
            } else {
                bre.close();
                return result.toString();
            }
        }
    }

    static StringBuilder printProcessErrorsOutput(Process p) throws IOException {
        return printProcessOutput(p.getErrorStream());
    }

    static StringBuilder printProcessStandardOutput(Process p) throws IOException {
        return printProcessOutput(p.getInputStream());
    }

    private static StringBuilder printProcessOutput(InputStream processStream) throws IOException {
        StringBuilder builder = new StringBuilder();
        BufferedReader bre = new BufferedReader(new InputStreamReader(processStream));
        while (true) {
            String line = bre.readLine();
            if (line != null) {
                System.out.println(line);
                builder.append(line);
            } else {
                bre.close();
                return builder;
            }
        }
    }
}
