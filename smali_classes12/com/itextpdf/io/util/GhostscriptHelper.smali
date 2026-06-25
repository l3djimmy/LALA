.class public Lcom/itextpdf/io/util/GhostscriptHelper;
.super Ljava/lang/Object;
.source "GhostscriptHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/util/GhostscriptHelper$GhostscriptExecutionException;
    }
.end annotation


# static fields
.field public static final GHOSTSCRIPT_ENVIRONMENT_VARIABLE:Ljava/lang/String; = "ITEXT_GS_EXEC"

.field static final GHOSTSCRIPT_ENVIRONMENT_VARIABLE_LEGACY:Ljava/lang/String; = "gsExec"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field static final GHOSTSCRIPT_KEYWORD:Ljava/lang/String; = "GPL Ghostscript"

.field private static final GHOSTSCRIPT_PARAMS:Ljava/lang/String; = " -dSAFER -dNOPAUSE -dBATCH -sDEVICE=png16m -r150 {0} -sOutputFile=\"{1}\" \"{2}\""

.field private static final PAGE_LIST_REGEX:Ljava/util/regex/Pattern;

.field private static final PAGE_NUMBER_PATTERN:Ljava/lang/String; = "%03d"

.field private static final RENDERED_IMAGE_EXTENSION:Ljava/lang/String; = "png"

.field private static final TEMP_FILE_PREFIX:Ljava/lang/String; = "itext_gs_io_temp"


# instance fields
.field private gsExec:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 61
    const-string v0, "^(\\d+,)*\\d+$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/util/GhostscriptHelper;->PAGE_LIST_REGEX:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 70
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/itextpdf/io/util/GhostscriptHelper;-><init>(Ljava/lang/String;)V

    .line 71
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "newGsExec"    # Ljava/lang/String;

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    iput-object p1, p0, Lcom/itextpdf/io/util/GhostscriptHelper;->gsExec:Ljava/lang/String;

    .line 80
    iget-object v0, p0, Lcom/itextpdf/io/util/GhostscriptHelper;->gsExec:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 81
    const-string v0, "ITEXT_GS_EXEC"

    invoke-static {v0}, Lcom/itextpdf/commons/utils/SystemUtil;->getPropertyOrEnvironmentVariable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/util/GhostscriptHelper;->gsExec:Ljava/lang/String;

    .line 83
    iget-object v0, p0, Lcom/itextpdf/io/util/GhostscriptHelper;->gsExec:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 84
    const-string v0, "gsExec"

    invoke-static {v0}, Lcom/itextpdf/commons/utils/SystemUtil;->getPropertyOrEnvironmentVariable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/util/GhostscriptHelper;->gsExec:Ljava/lang/String;

    .line 88
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/util/GhostscriptHelper;->gsExec:Ljava/lang/String;

    const-string v1, "GPL Ghostscript"

    invoke-static {v0, v1}, Lcom/itextpdf/io/util/CliCommandUtil;->isVersionCommandExecutable(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 91
    return-void

    .line 89
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Ghostscript command is not specified or specified incorrectly. Set the ITEXT_GS_EXEC environment variable to a CLI command that can run the Ghostscript application. See BUILDING.MD in the root of the repository for more details."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static formatImageNumber(I)Ljava/lang/String;
    .locals 3
    .param p0, "pageNumber"    # I

    .line 228
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 229
    .local v0, "stringBuilder":Ljava/lang/StringBuilder;
    move v1, p0

    .line 230
    .local v1, "zeroFiller":I
    :goto_0
    div-int/lit8 v2, v1, 0x64

    if-nez v2, :cond_0

    .line 231
    const/16 v2, 0x30

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 232
    mul-int/lit8 v1, v1, 0xa

    goto :goto_0

    .line 234
    :cond_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 235
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method static validateImageFilePattern(Ljava/lang/String;)Z
    .locals 1
    .param p0, "imageFilePattern"    # Ljava/lang/String;

    .line 222
    if-eqz p0, :cond_0

    .line 223
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 224
    const-string v0, "%"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 222
    :goto_0
    return v0
.end method

.method static validatePageList(Ljava/lang/String;)Z
    .locals 1
    .param p0, "pageList"    # Ljava/lang/String;

    .line 217
    if-eqz p0, :cond_1

    sget-object v0, Lcom/itextpdf/io/util/GhostscriptHelper;->PAGE_LIST_REGEX:Ljava/util/regex/Pattern;

    .line 218
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 217
    :goto_1
    return v0
.end method


# virtual methods
.method public getCliExecutionCommand()Ljava/lang/String;
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/itextpdf/io/util/GhostscriptHelper;->gsExec:Ljava/lang/String;

    return-object v0
.end method

.method public runGhostScriptImageGeneration(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "pdf"    # Ljava/lang/String;
    .param p2, "outDir"    # Ljava/lang/String;
    .param p3, "image"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 125
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/itextpdf/io/util/GhostscriptHelper;->runGhostScriptImageGeneration(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    return-void
.end method

.method public runGhostScriptImageGeneration(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 17
    .param p1, "pdf"    # Ljava/lang/String;
    .param p2, "outDir"    # Ljava/lang/String;
    .param p3, "image"    # Ljava/lang/String;
    .param p4, "pageList"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 152
    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    const-string v0, "itext_gs_io_temp"

    invoke-static/range {p2 .. p2}, Lcom/itextpdf/commons/utils/FileUtil;->directoryExists(Ljava/lang/String;)Z

    move-result v4

    const-string v5, "<filename>"

    if-eqz v4, :cond_8

    .line 156
    invoke-static {v2}, Lcom/itextpdf/io/util/GhostscriptHelper;->validateImageFilePattern(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 159
    invoke-static {v3}, Lcom/itextpdf/io/util/GhostscriptHelper;->validatePageList(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 162
    if-nez v3, :cond_0

    const-string v4, ""

    goto :goto_0

    :cond_0
    const-string v4, "-sPageList=<pagelist>"

    const-string v6, "<pagelist>"

    invoke-virtual {v4, v6, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    .line 164
    .local v4, "formattedPageList":Ljava/lang/String;
    :goto_0
    const/4 v6, 0x0

    .line 165
    .local v6, "replacementPdf":Ljava/lang/String;
    const/4 v7, 0x0

    .line 166
    .local v7, "replacementImagesDirectory":Ljava/lang/String;
    const/4 v8, 0x0

    .line 168
    .local v8, "temporaryOutputImages":[Ljava/lang/String;
    const/4 v9, 0x2

    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v12, 0x0

    :try_start_0
    invoke-static {v1, v0, v12}, Lcom/itextpdf/commons/utils/FileUtil;->createTempCopy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    move-object v6, v12

    .line 169
    invoke-static {v0}, Lcom/itextpdf/commons/utils/FileUtil;->createTempDirectory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v7, v0

    .line 170
    const-string v0, " -dSAFER -dNOPAUSE -dBATCH -sDEVICE=png16m -r150 {0} -sOutputFile=\"{1}\" \"{2}\""

    new-array v12, v10, [Ljava/lang/String;

    const-string v13, "itext_gs_io_temp%03d.png"

    aput-object v13, v12, v11

    .line 171
    invoke-static {v7, v12}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v12

    .line 172
    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    filled-new-array {v4, v12, v6}, [Ljava/lang/Object;

    move-result-object v12

    .line 170
    invoke-static {v0, v12}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 175
    .local v0, "currGsParams":Ljava/lang/String;
    move-object/from16 v12, p0

    :try_start_1
    iget-object v13, v12, Lcom/itextpdf/io/util/GhostscriptHelper;->gsExec:Ljava/lang/String;

    invoke-static {v13, v0}, Lcom/itextpdf/commons/utils/SystemUtil;->runProcessAndWait(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 182
    nop

    .line 183
    invoke-static {v7, v11}, Lcom/itextpdf/commons/utils/FileUtil;->listFilesInDirectory(Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v5

    move-object v8, v5

    .line 184
    if-eqz v8, :cond_2

    .line 185
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    array-length v13, v8

    if-ge v5, v13, :cond_1

    .line 186
    aget-object v13, v8, v5

    new-array v14, v10, [Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move/from16 v16, v10

    :try_start_2
    const-string v10, "-"

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    add-int/lit8 v15, v5, 0x1

    .line 189
    invoke-static {v15}, Lcom/itextpdf/io/util/GhostscriptHelper;->formatImageNumber(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v15, "."

    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v15, "png"

    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v14, v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 187
    move-object/from16 v10, p2

    :try_start_3
    invoke-static {v10, v14}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v14

    .line 190
    invoke-virtual {v14}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    .line 186
    invoke-static {v13, v14}, Lcom/itextpdf/commons/utils/FileUtil;->copy(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 185
    add-int/lit8 v5, v5, 0x1

    move/from16 v10, v16

    goto :goto_1

    .line 194
    .end local v0    # "currGsParams":Ljava/lang/String;
    .end local v5    # "i":I
    :catchall_0
    move-exception v0

    goto :goto_4

    .line 185
    .restart local v0    # "currGsParams":Ljava/lang/String;
    .restart local v5    # "i":I
    :cond_1
    move/from16 v16, v10

    move-object/from16 v10, p2

    goto :goto_2

    .line 184
    .end local v5    # "i":I
    :cond_2
    move/from16 v16, v10

    move-object/from16 v10, p2

    .line 194
    .end local v0    # "currGsParams":Ljava/lang/String;
    :goto_2
    if-eqz v8, :cond_3

    .line 195
    invoke-static {v8}, Lcom/itextpdf/commons/utils/FileUtil;->removeFiles([Ljava/lang/String;)Z

    .line 197
    :cond_3
    new-array v0, v9, [Ljava/lang/String;

    aput-object v7, v0, v11

    aput-object v6, v0, v16

    invoke-static {v0}, Lcom/itextpdf/commons/utils/FileUtil;->removeFiles([Ljava/lang/String;)Z

    .line 198
    nop

    .line 199
    return-void

    .line 176
    .restart local v0    # "currGsParams":Ljava/lang/String;
    :cond_4
    move/from16 v16, v10

    move-object/from16 v10, p2

    .line 177
    :try_start_4
    invoke-static {v7, v11}, Lcom/itextpdf/commons/utils/FileUtil;->listFilesInDirectory(Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v13

    move-object v8, v13

    .line 178
    new-instance v13, Lcom/itextpdf/io/util/GhostscriptHelper$GhostscriptExecutionException;

    const-string v14, "GhostScript failed for <filename>"

    .line 179
    invoke-virtual {v14, v5, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v13, v5}, Lcom/itextpdf/io/util/GhostscriptHelper$GhostscriptExecutionException;-><init>(Ljava/lang/String;)V

    .end local v4    # "formattedPageList":Ljava/lang/String;
    .end local v6    # "replacementPdf":Ljava/lang/String;
    .end local v7    # "replacementImagesDirectory":Ljava/lang/String;
    .end local v8    # "temporaryOutputImages":[Ljava/lang/String;
    .end local p1    # "pdf":Ljava/lang/String;
    .end local p2    # "outDir":Ljava/lang/String;
    .end local p3    # "image":Ljava/lang/String;
    .end local p4    # "pageList":Ljava/lang/String;
    throw v13
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 194
    .end local v0    # "currGsParams":Ljava/lang/String;
    .restart local v4    # "formattedPageList":Ljava/lang/String;
    .restart local v6    # "replacementPdf":Ljava/lang/String;
    .restart local v7    # "replacementImagesDirectory":Ljava/lang/String;
    .restart local v8    # "temporaryOutputImages":[Ljava/lang/String;
    .restart local p1    # "pdf":Ljava/lang/String;
    .restart local p2    # "outDir":Ljava/lang/String;
    .restart local p3    # "image":Ljava/lang/String;
    .restart local p4    # "pageList":Ljava/lang/String;
    :catchall_1
    move-exception v0

    goto :goto_5

    :catchall_2
    move-exception v0

    goto :goto_3

    :catchall_3
    move-exception v0

    move-object/from16 v12, p0

    :goto_3
    move/from16 v16, v10

    :goto_4
    move-object/from16 v10, p2

    :goto_5
    if-eqz v8, :cond_5

    .line 195
    invoke-static {v8}, Lcom/itextpdf/commons/utils/FileUtil;->removeFiles([Ljava/lang/String;)Z

    .line 197
    :cond_5
    new-array v5, v9, [Ljava/lang/String;

    aput-object v7, v5, v11

    aput-object v6, v5, v16

    invoke-static {v5}, Lcom/itextpdf/commons/utils/FileUtil;->removeFiles([Ljava/lang/String;)Z

    .line 198
    throw v0

    .line 160
    .end local v4    # "formattedPageList":Ljava/lang/String;
    .end local v6    # "replacementPdf":Ljava/lang/String;
    .end local v7    # "replacementImagesDirectory":Ljava/lang/String;
    .end local v8    # "temporaryOutputImages":[Ljava/lang/String;
    :cond_6
    move-object/from16 v12, p0

    move-object/from16 v10, p2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid page list: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 157
    :cond_7
    move-object/from16 v12, p0

    move-object/from16 v10, p2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid output image pattern: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 153
    :cond_8
    move-object/from16 v12, p0

    move-object/from16 v10, p2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 154
    const-string v4, "Cannot open output directory for <filename>"

    invoke-virtual {v4, v5, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
