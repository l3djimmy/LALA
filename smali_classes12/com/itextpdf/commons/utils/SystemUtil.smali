.class public final Lcom/itextpdf/commons/utils/SystemUtil;
.super Ljava/lang/Object;
.source "SystemUtil.java"


# static fields
.field private static final SPLIT_REGEX:Ljava/lang/String; = "((\".+?\"|[^\'\\s]|\'.+?\')+)\\s*"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    return-void
.end method

.method public static getFreeMemory()J
    .locals 2

    .line 84
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v0

    return-wide v0
.end method

.method static getProcessOutput(Ljava/lang/Process;)Ljava/lang/String;
    .locals 5
    .param p0, "p"    # Ljava/lang/Process;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 289
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 290
    .local v0, "bri":Ljava/io/BufferedReader;
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 292
    .local v1, "bre":Ljava/io/BufferedReader;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 293
    .local v2, "result":Ljava/lang/StringBuilder;
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    move-object v4, v3

    .local v4, "line":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 294
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 296
    :cond_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 297
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_1

    .line 298
    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 300
    :cond_1
    :goto_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    move-object v4, v3

    if-eqz v3, :cond_2

    .line 301
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 303
    :cond_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 304
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static getPropertyOrEnvironmentVariable(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 94
    invoke-static {p0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 95
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 96
    invoke-static {p0}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 98
    :cond_0
    return-object v0
.end method

.method public static getRelativeTimeMillis()J
    .locals 2

    .line 75
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public static getTimeBasedIntSeed()I
    .locals 2

    .line 59
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public static getTimeBasedSeed()J
    .locals 2

    .line 50
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method static prepareProcessArguments(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .param p0, "exec"    # Ljava/lang/String;
    .param p1, "params"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 270
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 271
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .local v0, "cmdList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    goto :goto_0

    .line 273
    .end local v0    # "cmdList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p0}, Lcom/itextpdf/commons/utils/SystemUtil;->splitIntoProcessArguments(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 275
    .restart local v0    # "cmdList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_0
    invoke-static {p1}, Lcom/itextpdf/commons/utils/SystemUtil;->splitIntoProcessArguments(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 276
    return-object v0
.end method

.method static printProcessErrorsOutput(Ljava/lang/Process;)Ljava/lang/StringBuilder;
    .locals 1
    .param p0, "p"    # Ljava/lang/Process;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 308
    invoke-virtual {p0}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/commons/utils/SystemUtil;->printProcessOutput(Ljava/io/InputStream;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method private static printProcessOutput(Ljava/io/InputStream;)Ljava/lang/StringBuilder;
    .locals 4
    .param p0, "processStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 316
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 317
    .local v0, "builder":Ljava/lang/StringBuilder;
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, p0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 319
    .local v1, "bre":Ljava/io/BufferedReader;
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    move-object v3, v2

    .local v3, "line":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 320
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 321
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 323
    :cond_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 324
    return-object v0
.end method

.method static printProcessStandardOutput(Ljava/lang/Process;)Ljava/lang/StringBuilder;
    .locals 1
    .param p0, "p"    # Ljava/lang/Process;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 312
    invoke-virtual {p0}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/commons/utils/SystemUtil;->printProcessOutput(Ljava/io/InputStream;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method static runProcess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Process;
    .locals 5
    .param p0, "execPath"    # Ljava/lang/String;
    .param p1, "params"    # Ljava/lang/String;
    .param p2, "workingDirPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 258
    invoke-static {p0, p1}, Lcom/itextpdf/commons/utils/SystemUtil;->prepareProcessArguments(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 259
    .local v0, "cmdList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    .line 260
    .local v1, "cmdArray":[Ljava/lang/String;
    if-eqz p2, :cond_0

    .line 261
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 262
    .local v2, "workingDir":Ljava/io/File;
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v1, v4, v2}, Ljava/lang/Runtime;->exec([Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;)Ljava/lang/Process;

    move-result-object v3

    return-object v3

    .line 264
    .end local v2    # "workingDir":Ljava/io/File;
    :cond_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v2

    return-object v2
.end method

.method public static runProcessAndCollectErrors(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;
    .locals 1
    .param p0, "execPath"    # Ljava/lang/String;
    .param p1, "params"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 228
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/itextpdf/commons/utils/SystemUtil;->runProcess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/commons/utils/SystemUtil;->printProcessErrorsOutput(Ljava/lang/Process;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public static runProcessAndGetExitCode(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .param p0, "exec"    # Ljava/lang/String;
    .param p1, "params"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 161
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/itextpdf/commons/utils/SystemUtil;->runProcessAndGetExitCode(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static runProcessAndGetExitCode(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .param p0, "exec"    # Ljava/lang/String;
    .param p1, "params"    # Ljava/lang/String;
    .param p2, "workingDirPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 184
    invoke-static {p0, p1, p2}, Lcom/itextpdf/commons/utils/SystemUtil;->runProcess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v0

    .line 185
    .local v0, "p":Ljava/lang/Process;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {v0}, Lcom/itextpdf/commons/utils/SystemUtil;->getProcessOutput(Ljava/lang/Process;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 186
    invoke-virtual {v0}, Ljava/lang/Process;->waitFor()I

    move-result v1

    return v1
.end method

.method public static runProcessAndGetOutput(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "command"    # Ljava/lang/String;
    .param p1, "params"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 207
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/itextpdf/commons/utils/SystemUtil;->runProcess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/commons/utils/SystemUtil;->getProcessOutput(Ljava/lang/Process;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static runProcessAndGetProcessInfo(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/commons/utils/ProcessInfo;
    .locals 5
    .param p0, "command"    # Ljava/lang/String;
    .param p1, "params"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 251
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/itextpdf/commons/utils/SystemUtil;->runProcess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v0

    .line 252
    .local v0, "p":Ljava/lang/Process;
    invoke-static {v0}, Lcom/itextpdf/commons/utils/SystemUtil;->printProcessStandardOutput(Ljava/lang/Process;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 253
    .local v1, "processStdOutput":Ljava/lang/String;
    invoke-static {v0}, Lcom/itextpdf/commons/utils/SystemUtil;->printProcessErrorsOutput(Ljava/lang/Process;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 254
    .local v2, "processErrOutput":Ljava/lang/String;
    new-instance v3, Lcom/itextpdf/commons/utils/ProcessInfo;

    invoke-virtual {v0}, Ljava/lang/Process;->waitFor()I

    move-result v4

    invoke-direct {v3, v4, v1, v2}, Lcom/itextpdf/commons/utils/ProcessInfo;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    return-object v3
.end method

.method public static runProcessAndWait(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "exec"    # Ljava/lang/String;
    .param p1, "params"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 118
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/itextpdf/commons/utils/SystemUtil;->runProcessAndWait(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static runProcessAndWait(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "exec"    # Ljava/lang/String;
    .param p1, "params"    # Ljava/lang/String;
    .param p2, "workingDirPath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 141
    invoke-static {p0, p1, p2}, Lcom/itextpdf/commons/utils/SystemUtil;->runProcessAndGetExitCode(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static splitIntoProcessArguments(Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .param p0, "line"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 280
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 281
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v1, "((\".+?\"|[^\'\\s]|\'.+?\')+)\\s*"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 282
    .local v1, "m":Ljava/util/regex/Matcher;
    :goto_0
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 283
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "\'"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "\""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 285
    :cond_0
    return-object v0
.end method
