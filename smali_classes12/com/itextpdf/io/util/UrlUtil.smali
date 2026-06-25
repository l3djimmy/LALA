.class public final Lcom/itextpdf/io/util/UrlUtil;
.super Ljava/lang/Object;
.source "UrlUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    return-void
.end method

.method public static getFileUriString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 89
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static getFinalConnection(Ljava/net/URL;)Ljava/net/URLConnection;
    .locals 4
    .param p0, "initialUrl"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 127
    move-object v0, p0

    .line 128
    .local v0, "nextUrl":Ljava/net/URL;
    const/4 v1, 0x0

    .line 129
    .local v1, "connection":Ljava/net/URLConnection;
    :goto_0
    if-eqz v0, :cond_2

    .line 130
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    .line 131
    const-string v2, "location"

    invoke-virtual {v1, v2}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 132
    .local v2, "location":Ljava/lang/String;
    if-nez v2, :cond_0

    const/4 v3, 0x0

    goto :goto_1

    :cond_0
    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    :goto_1
    move-object v0, v3

    .line 133
    if-eqz v0, :cond_1

    .line 135
    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 137
    .end local v2    # "location":Ljava/lang/String;
    :cond_1
    goto :goto_0

    .line 138
    :cond_2
    return-object v1
.end method

.method public static getInputStreamOfFinalConnection(Ljava/net/URL;)Ljava/io/InputStream;
    .locals 2
    .param p0, "initialUrl"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 112
    invoke-static {p0}, Lcom/itextpdf/io/util/UrlUtil;->getFinalConnection(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v0

    .line 113
    .local v0, "finalConnection":Ljava/net/URLConnection;
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    return-object v1
.end method

.method public static getNormalizedFileUriString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "filename"    # Ljava/lang/String;

    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "file://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/itextpdf/io/util/UrlUtil;->toNormalizedURI(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static openStream(Ljava/net/URL;)Ljava/io/InputStream;
    .locals 1
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 80
    invoke-virtual {p0}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public static toNormalizedURI(Ljava/io/File;)Ljava/net/URI;
    .locals 1
    .param p0, "file"    # Ljava/io/File;

    .line 76
    invoke-virtual {p0}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->normalize()Ljava/net/URI;

    move-result-object v0

    return-object v0
.end method

.method public static toNormalizedURI(Ljava/lang/String;)Ljava/net/URI;
    .locals 1
    .param p0, "filename"    # Ljava/lang/String;

    .line 67
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/itextpdf/io/util/UrlUtil;->toNormalizedURI(Ljava/io/File;)Ljava/net/URI;

    move-result-object v0

    return-object v0
.end method

.method public static toURL(Ljava/lang/String;)Ljava/net/URL;
    .locals 2
    .param p0, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 54
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .local v0, "url":Ljava/net/URL;
    goto :goto_0

    .line 55
    .end local v0    # "url":Ljava/net/URL;
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v1

    move-object v0, v1

    .line 58
    .local v0, "url":Ljava/net/URL;
    :goto_0
    return-object v0
.end method
