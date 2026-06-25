.class public final Lcom/itextpdf/io/util/CliCommandUtil;
.super Ljava/lang/Object;
.source "CliCommandUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method public static isVersionCommandExecutable(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p0, "command"    # Ljava/lang/String;
    .param p1, "versionText"    # Ljava/lang/String;

    .line 42
    const/4 v0, 0x0

    if-eqz p0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    .line 47
    :cond_0
    :try_start_0
    const-string v1, "-version"

    invoke-static {p0, v1}, Lcom/itextpdf/commons/utils/SystemUtil;->runProcessAndGetOutput(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 48
    .local v1, "result":Ljava/lang/String;
    invoke-virtual {v1, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 49
    .end local v1    # "result":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 50
    .local v1, "e":Ljava/lang/Exception;
    return v0

    .line 43
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_0
    return v0
.end method
