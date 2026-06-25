.class public final Landroidx/camera/core/Logger;
.super Ljava/lang/Object;
.source "Logger.java"


# static fields
.field static final DEFAULT_MIN_LOG_LEVEL:I = 0x3

.field private static final MAX_TAG_LENGTH:I = 0x17

.field private static sMinLogLevel:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 65
    const/4 v0, 0x3

    sput v0, Landroidx/camera/core/Logger;->sMinLogLevel:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;

    .line 146
    invoke-static {p0}, Landroidx/camera/core/Logger;->truncateTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 147
    .local v0, "truncatedTag":Ljava/lang/String;
    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->isLogLevelEnabled(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 148
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    :cond_0
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .line 158
    invoke-static {p0}, Landroidx/camera/core/Logger;->truncateTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 159
    .local v0, "truncatedTag":Ljava/lang/String;
    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->isLogLevelEnabled(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 160
    invoke-static {v0, p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 162
    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;

    .line 215
    invoke-static {p0}, Landroidx/camera/core/Logger;->truncateTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 216
    .local v0, "truncatedTag":Ljava/lang/String;
    const/4 v1, 0x6

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->isLogLevelEnabled(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 217
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .line 227
    invoke-static {p0}, Landroidx/camera/core/Logger;->truncateTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 228
    .local v0, "truncatedTag":Ljava/lang/String;
    const/4 v1, 0x6

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->isLogLevelEnabled(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 229
    invoke-static {v0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 231
    :cond_0
    return-void
.end method

.method static getMinLogLevel()I
    .locals 1

    .line 90
    sget v0, Landroidx/camera/core/Logger;->sMinLogLevel:I

    return v0
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;

    .line 169
    invoke-static {p0}, Landroidx/camera/core/Logger;->truncateTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 170
    .local v0, "truncatedTag":Ljava/lang/String;
    const/4 v1, 0x4

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->isLogLevelEnabled(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 171
    invoke-static {v0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    :cond_0
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .line 181
    invoke-static {p0}, Landroidx/camera/core/Logger;->truncateTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 182
    .local v0, "truncatedTag":Ljava/lang/String;
    const/4 v1, 0x4

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->isLogLevelEnabled(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 183
    invoke-static {v0, p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 185
    :cond_0
    return-void
.end method

.method public static isDebugEnabled(Ljava/lang/String;)Z
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;

    .line 108
    invoke-static {p0}, Landroidx/camera/core/Logger;->truncateTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->isLogLevelEnabled(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public static isErrorEnabled(Ljava/lang/String;)Z
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;

    .line 138
    invoke-static {p0}, Landroidx/camera/core/Logger;->truncateTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x6

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->isLogLevelEnabled(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public static isInfoEnabled(Ljava/lang/String;)Z
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;

    .line 118
    invoke-static {p0}, Landroidx/camera/core/Logger;->truncateTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->isLogLevelEnabled(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method private static isLogLevelEnabled(Ljava/lang/String;I)Z
    .locals 1
    .param p0, "truncatedTag"    # Ljava/lang/String;
    .param p1, "logLevel"    # I

    .line 75
    sget v0, Landroidx/camera/core/Logger;->sMinLogLevel:I

    if-le v0, p1, :cond_1

    invoke-static {p0, p1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static isWarnEnabled(Ljava/lang/String;)Z
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;

    .line 128
    invoke-static {p0}, Landroidx/camera/core/Logger;->truncateTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x5

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->isLogLevelEnabled(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method static resetMinLogLevel()V
    .locals 1

    .line 98
    const/4 v0, 0x3

    sput v0, Landroidx/camera/core/Logger;->sMinLogLevel:I

    .line 99
    return-void
.end method

.method static setMinLogLevel(I)V
    .locals 0
    .param p0, "logLevel"    # I

    .line 83
    sput p0, Landroidx/camera/core/Logger;->sMinLogLevel:I

    .line 84
    return-void
.end method

.method private static truncateTag(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "tag"    # Ljava/lang/String;

    .line 240
    nop

    .line 243
    return-object p0
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;

    .line 192
    invoke-static {p0}, Landroidx/camera/core/Logger;->truncateTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 193
    .local v0, "truncatedTag":Ljava/lang/String;
    const/4 v1, 0x5

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->isLogLevelEnabled(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 194
    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    :cond_0
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .line 204
    invoke-static {p0}, Landroidx/camera/core/Logger;->truncateTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 205
    .local v0, "truncatedTag":Ljava/lang/String;
    const/4 v1, 0x5

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->isLogLevelEnabled(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 206
    invoke-static {v0, p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 208
    :cond_0
    return-void
.end method
