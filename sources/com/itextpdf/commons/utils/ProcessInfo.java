package com.itextpdf.commons.utils;
/* loaded from: classes12.dex */
public final class ProcessInfo {
    private final int exitCode;
    private final String processErrOutput;
    private final String processStdOutput;

    public ProcessInfo(int exitCode, String processStdOutput, String processErrOutput) {
        this.exitCode = exitCode;
        this.processStdOutput = processStdOutput;
        this.processErrOutput = processErrOutput;
    }

    public int getExitCode() {
        return this.exitCode;
    }

    public String getProcessStdOutput() {
        return this.processStdOutput;
    }

    public String getProcessErrOutput() {
        return this.processErrOutput;
    }
}
