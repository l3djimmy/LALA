.class public Lcom/itextpdf/io/util/ImageMagickHelper;
.super Ljava/lang/Object;
.source "ImageMagickHelper.java"


# static fields
.field private static final DIFF_PIXELS_OUTPUT_REGEXP:Ljava/lang/String; = "^\\d+\\.*\\d*(e\\+\\d+)?"

.field public static final MAGICK_COMPARE_ENVIRONMENT_VARIABLE:Ljava/lang/String; = "ITEXT_MAGICK_COMPARE_EXEC"

.field static final MAGICK_COMPARE_ENVIRONMENT_VARIABLE_LEGACY:Ljava/lang/String; = "compareExec"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field static final MAGICK_COMPARE_KEYWORD:Ljava/lang/String; = "ImageMagick Studio LLC"

.field private static final TEMP_FILE_PREFIX:Ljava/lang/String; = "itext_im_io_temp"

.field private static final pattern:Ljava/util/regex/Pattern;


# instance fields
.field private compareExec:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 57
    const-string v0, "^\\d+\\.*\\d*(e\\+\\d+)?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/util/ImageMagickHelper;->pattern:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 66
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/itextpdf/io/util/ImageMagickHelper;-><init>(Ljava/lang/String;)V

    .line 67
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "newCompareExec"    # Ljava/lang/String;

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput-object p1, p0, Lcom/itextpdf/io/util/ImageMagickHelper;->compareExec:Ljava/lang/String;

    .line 76
    iget-object v0, p0, Lcom/itextpdf/io/util/ImageMagickHelper;->compareExec:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 77
    const-string v0, "ITEXT_MAGICK_COMPARE_EXEC"

    invoke-static {v0}, Lcom/itextpdf/commons/utils/SystemUtil;->getPropertyOrEnvironmentVariable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/util/ImageMagickHelper;->compareExec:Ljava/lang/String;

    .line 78
    iget-object v0, p0, Lcom/itextpdf/io/util/ImageMagickHelper;->compareExec:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 79
    const-string v0, "compareExec"

    invoke-static {v0}, Lcom/itextpdf/commons/utils/SystemUtil;->getPropertyOrEnvironmentVariable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/util/ImageMagickHelper;->compareExec:Ljava/lang/String;

    .line 83
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/util/ImageMagickHelper;->compareExec:Ljava/lang/String;

    const-string v1, "ImageMagick Studio LLC"

    invoke-static {v0, v1}, Lcom/itextpdf/io/util/CliCommandUtil;->isVersionCommandExecutable(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 86
    return-void

    .line 84
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ImageMagick comparison command specified incorrectly. Set the ITEXT_MAGICK_COMPARE_EXEC environment variable with the CLI command which can run the ImageMagic comparison. See BUILDING.MD in the root of the repository for more details."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static parseImageMagickProcessOutput(Ljava/lang/String;)J
    .locals 6
    .param p0, "processOutput"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 240
    if-eqz p0, :cond_3

    .line 244
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 245
    const-wide/16 v0, 0x0

    return-wide v0

    .line 248
    :cond_0
    const-string v0, "\n"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 250
    .local v0, "processOutputLines":[Ljava/lang/String;
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, v0, v2

    .line 252
    .local v3, "line":Ljava/lang/String;
    :try_start_0
    sget-object v4, Lcom/itextpdf/io/util/ImageMagickHelper;->pattern:Ljava/util/regex/Pattern;

    invoke-virtual {v4, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    .line 253
    .local v4, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 254
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Double;->longValue()J

    move-result-wide v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v1

    .line 258
    .end local v4    # "matcher":Ljava/util/regex/Matcher;
    :cond_1
    goto :goto_1

    .line 256
    :catch_0
    move-exception v4

    .line 250
    .end local v3    # "line":Ljava/lang/String;
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 261
    :cond_2
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ImageMagick process execution finished with errors: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 241
    .end local v0    # "processOutputLines":[Ljava/lang/String;
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ImageMagick process output is null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static validateFuzziness(Ljava/lang/String;)Z
    .locals 6
    .param p0, "fuzziness"    # Ljava/lang/String;

    .line 226
    const/4 v0, 0x1

    if-nez p0, :cond_0

    .line 227
    return v0

    .line 230
    :cond_0
    const/4 v1, 0x0

    :try_start_0
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    const-wide/16 v4, 0x0

    cmpl-double v2, v2, v4

    if-ltz v2, :cond_1

    goto :goto_0

    :cond_1
    move v0, v1

    :goto_0
    return v0

    .line 231
    :catch_0
    move-exception v0

    .line 234
    .local v0, "e":Ljava/lang/NumberFormatException;
    return v1
.end method


# virtual methods
.method public getCliExecutionCommand()Ljava/lang/String;
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/itextpdf/io/util/ImageMagickHelper;->compareExec:Ljava/lang/String;

    return-object v0
.end method

.method public runImageMagickImageCompare(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "outImageFilePath"    # Ljava/lang/String;
    .param p2, "cmpImageFilePath"    # Ljava/lang/String;
    .param p3, "diffImageName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 114
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/itextpdf/io/util/ImageMagickHelper;->runImageMagickImageCompare(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public runImageMagickImageCompare(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p1, "outImageFilePath"    # Ljava/lang/String;
    .param p2, "cmpImageFilePath"    # Ljava/lang/String;
    .param p3, "diffImageName"    # Ljava/lang/String;
    .param p4, "fuzzValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 134
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/itextpdf/io/util/ImageMagickHelper;->runImageMagickImageCompareAndGetResult(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/io/util/ImageMagickCompareResult;

    move-result-object v0

    .line 137
    .local v0, "compareResult":Lcom/itextpdf/io/util/ImageMagickCompareResult;
    invoke-virtual {v0}, Lcom/itextpdf/io/util/ImageMagickCompareResult;->isComparingResultSuccessful()Z

    move-result v1

    return v1
.end method

.method public runImageMagickImageCompareAndGetResult(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/io/util/ImageMagickCompareResult;
    .locals 17
    .param p1, "outImageFilePath"    # Ljava/lang/String;
    .param p2, "cmpImageFilePath"    # Ljava/lang/String;
    .param p3, "diffImageName"    # Ljava/lang/String;
    .param p4, "fuzzValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 192
    move-object/from16 v0, p4

    const-string v1, "\' \'"

    const-string v2, "itext_im_io_temp"

    invoke-static {v0}, Lcom/itextpdf/io/util/ImageMagickHelper;->validateFuzziness(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 195
    if-nez v0, :cond_0

    const-string v3, ""

    goto :goto_0

    :cond_0
    const-string v3, " -metric AE -fuzz <fuzzValue>%"

    const-string v4, "<fuzzValue>"

    invoke-virtual {v3, v4, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    .line 197
    .end local p4    # "fuzzValue":Ljava/lang/String;
    .local v3, "fuzzValue":Ljava/lang/String;
    :goto_0
    const/4 v4, 0x0

    .line 198
    .local v4, "replacementOutFile":Ljava/lang/String;
    const/4 v5, 0x0

    .line 199
    .local v5, "replacementCmpFile":Ljava/lang/String;
    const/4 v6, 0x0

    .line 201
    .local v6, "replacementDiff":Ljava/lang/String;
    const/4 v8, 0x3

    const/4 v10, 0x0

    const/4 v0, 0x0

    move-object/from16 v11, p1

    :try_start_0
    invoke-static {v11, v2, v0}, Lcom/itextpdf/commons/utils/FileUtil;->createTempCopy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    move-object v4, v12

    .line 202
    move-object/from16 v12, p2

    :try_start_1
    invoke-static {v12, v2, v0}, Lcom/itextpdf/commons/utils/FileUtil;->createTempCopy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v5, v0

    .line 206
    const-string v0, ".png"

    invoke-static {v2, v0}, Lcom/itextpdf/commons/utils/FileUtil;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    move-object v6, v0

    .line 207
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " \'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 211
    .local v0, "currCompareParams":Ljava/lang/String;
    move-object/from16 v1, p0

    :try_start_2
    iget-object v2, v1, Lcom/itextpdf/io/util/ImageMagickHelper;->compareExec:Ljava/lang/String;

    invoke-static {v2, v0}, Lcom/itextpdf/commons/utils/SystemUtil;->runProcessAndGetProcessInfo(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/commons/utils/ProcessInfo;

    move-result-object v2

    .line 212
    .local v2, "processInfo":Lcom/itextpdf/commons/utils/ProcessInfo;
    invoke-virtual {v2}, Lcom/itextpdf/commons/utils/ProcessInfo;->getExitCode()I

    move-result v13

    if-nez v13, :cond_1

    const/4 v13, 0x1

    goto :goto_1

    :cond_1
    move v13, v10

    .line 213
    .local v13, "comparingResult":Z
    :goto_1
    invoke-virtual {v2}, Lcom/itextpdf/commons/utils/ProcessInfo;->getProcessErrOutput()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/itextpdf/io/util/ImageMagickHelper;->parseImageMagickProcessOutput(Ljava/lang/String;)J

    move-result-wide v14
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 214
    .local v14, "diffPixels":J
    const/16 p4, 0x2

    :try_start_3
    new-instance v7, Lcom/itextpdf/io/util/ImageMagickCompareResult;

    invoke-direct {v7, v13, v14, v15}, Lcom/itextpdf/io/util/ImageMagickCompareResult;-><init>(ZJ)V

    .line 216
    .local v7, "resultInfo":Lcom/itextpdf/io/util/ImageMagickCompareResult;
    invoke-static {v6}, Lcom/itextpdf/commons/utils/FileUtil;->fileExists(Ljava/lang/String;)Z

    move-result v16
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v16, :cond_2

    .line 217
    move-object/from16 v9, p3

    const/16 v16, 0x1

    :try_start_4
    invoke-static {v6, v9}, Lcom/itextpdf/commons/utils/FileUtil;->copy(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_2

    .line 221
    .end local v0    # "currCompareParams":Ljava/lang/String;
    .end local v2    # "processInfo":Lcom/itextpdf/commons/utils/ProcessInfo;
    .end local v7    # "resultInfo":Lcom/itextpdf/io/util/ImageMagickCompareResult;
    .end local v13    # "comparingResult":Z
    .end local v14    # "diffPixels":J
    :catchall_0
    move-exception v0

    goto :goto_5

    .line 216
    .restart local v0    # "currCompareParams":Ljava/lang/String;
    .restart local v2    # "processInfo":Lcom/itextpdf/commons/utils/ProcessInfo;
    .restart local v7    # "resultInfo":Lcom/itextpdf/io/util/ImageMagickCompareResult;
    .restart local v13    # "comparingResult":Z
    .restart local v14    # "diffPixels":J
    :cond_2
    move-object/from16 v9, p3

    const/16 v16, 0x1

    .line 219
    :goto_2
    nop

    .line 221
    new-array v8, v8, [Ljava/lang/String;

    aput-object v4, v8, v10

    aput-object v5, v8, v16

    aput-object v6, v8, p4

    invoke-static {v8}, Lcom/itextpdf/commons/utils/FileUtil;->removeFiles([Ljava/lang/String;)Z

    .line 219
    return-object v7

    .line 221
    .end local v0    # "currCompareParams":Ljava/lang/String;
    .end local v2    # "processInfo":Lcom/itextpdf/commons/utils/ProcessInfo;
    .end local v7    # "resultInfo":Lcom/itextpdf/io/util/ImageMagickCompareResult;
    .end local v13    # "comparingResult":Z
    .end local v14    # "diffPixels":J
    :catchall_1
    move-exception v0

    move-object/from16 v9, p3

    goto :goto_4

    :catchall_2
    move-exception v0

    goto :goto_3

    :catchall_3
    move-exception v0

    const/16 p4, 0x2

    const/16 v16, 0x1

    move-object/from16 v1, p0

    move-object/from16 v9, p3

    goto :goto_5

    :catchall_4
    move-exception v0

    move-object/from16 v1, p0

    move-object/from16 v12, p2

    :goto_3
    move-object/from16 v9, p3

    const/16 p4, 0x2

    :goto_4
    const/16 v16, 0x1

    :goto_5
    new-array v2, v8, [Ljava/lang/String;

    aput-object v4, v2, v10

    aput-object v5, v2, v16

    aput-object v6, v2, p4

    invoke-static {v2}, Lcom/itextpdf/commons/utils/FileUtil;->removeFiles([Ljava/lang/String;)Z

    .line 222
    throw v0

    .line 193
    .end local v3    # "fuzzValue":Ljava/lang/String;
    .end local v4    # "replacementOutFile":Ljava/lang/String;
    .end local v5    # "replacementCmpFile":Ljava/lang/String;
    .end local v6    # "replacementDiff":Ljava/lang/String;
    .restart local p4    # "fuzzValue":Ljava/lang/String;
    :cond_3
    move-object/from16 v1, p0

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move-object/from16 v9, p3

    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid fuzziness value: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public runImageMagickImageCompareWithThreshold(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Z
    .locals 5
    .param p1, "outImageFilePath"    # Ljava/lang/String;
    .param p2, "cmpImageFilePath"    # Ljava/lang/String;
    .param p3, "diffImageName"    # Ljava/lang/String;
    .param p4, "fuzzValue"    # Ljava/lang/String;
    .param p5, "threshold"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 161
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/itextpdf/io/util/ImageMagickHelper;->runImageMagickImageCompareAndGetResult(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/io/util/ImageMagickCompareResult;

    move-result-object v0

    .line 164
    .local v0, "compareResult":Lcom/itextpdf/io/util/ImageMagickCompareResult;
    invoke-virtual {v0}, Lcom/itextpdf/io/util/ImageMagickCompareResult;->isComparingResultSuccessful()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 165
    return v2

    .line 167
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/io/util/ImageMagickCompareResult;->getDiffPixels()J

    move-result-wide v3

    cmp-long v1, v3, p5

    if-gtz v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    return v2
.end method
