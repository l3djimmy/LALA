.class public final Lcom/itextpdf/commons/utils/StringSplitUtil;
.super Ljava/lang/Object;
.source "StringSplitUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method public static splitKeepTrailingWhiteSpace(Ljava/lang/String;C)[Ljava/lang/String;
    .locals 2
    .param p0, "data"    # Ljava/lang/String;
    .param p1, "toSplitOn"    # C

    .line 46
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
