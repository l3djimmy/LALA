.class public final Lcom/itextpdf/io/util/ResourceUtil;
.super Ljava/lang/Object;
.source "ResourceUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method public static getResourceStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 1
    .param p0, "key"    # Ljava/lang/String;

    .line 43
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/io/util/ResourceUtil;->getResourceStream(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public static getResourceStream(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/io/InputStream;
    .locals 4
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "loader"    # Ljava/lang/ClassLoader;

    .line 54
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 55
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 57
    :cond_0
    const/4 v1, 0x0

    .line 58
    .local v1, "stream":Ljava/io/InputStream;
    if-eqz p1, :cond_1

    .line 59
    invoke-virtual {p1, p0}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 60
    if-eqz v1, :cond_1

    .line 61
    return-object v1

    .line 66
    :cond_1
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    .line 67
    .local v2, "contextClassLoader":Ljava/lang/ClassLoader;
    if-eqz v2, :cond_2

    .line 68
    invoke-virtual {v2, p0}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v3

    .line 71
    .end local v2    # "contextClassLoader":Ljava/lang/ClassLoader;
    :cond_2
    goto :goto_0

    .line 70
    :catch_0
    move-exception v2

    .line 73
    :goto_0
    if-nez v1, :cond_3

    .line 74
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-class v2, Lcom/itextpdf/io/util/ResourceUtil;

    invoke-virtual {v2, v0}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 76
    :cond_3
    if-nez v1, :cond_4

    .line 77
    invoke-static {p0}, Ljava/lang/ClassLoader;->getSystemResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 79
    :cond_4
    return-object v1
.end method
