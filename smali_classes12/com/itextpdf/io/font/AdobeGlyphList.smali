.class public Lcom/itextpdf/io/font/AdobeGlyphList;
.super Ljava/lang/Object;
.source "AdobeGlyphList.java"


# static fields
.field private static names2unicode:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static unicode2names:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 36
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/io/font/AdobeGlyphList;->unicode2names:Ljava/util/Map;

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/io/font/AdobeGlyphList;->names2unicode:Ljava/util/Map;

    .line 40
    const/4 v0, 0x0

    .line 42
    .local v0, "resource":Ljava/io/InputStream;
    :try_start_0
    const-string v1, "com/itextpdf/io/font/AdobeGlyphList.txt"

    invoke-static {v1}, Lcom/itextpdf/io/util/ResourceUtil;->getResourceStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    move-object v0, v1

    .line 43
    if-eqz v0, :cond_6

    .line 46
    const/16 v1, 0x400

    new-array v1, v1, [B

    .line 47
    .local v1, "buf":[B
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 49
    .local v2, "stream":Ljava/io/ByteArrayOutputStream;
    :goto_0
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .line 50
    .local v3, "size":I
    if-gez v3, :cond_5

    .line 51
    nop

    .line 55
    .end local v3    # "size":I
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 56
    const/4 v0, 0x0

    .line 57
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/itextpdf/io/font/PdfEncodings;->convertToString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 58
    .local v3, "s":Ljava/lang/String;
    new-instance v4, Ljava/util/StringTokenizer;

    const-string v5, "\r\n"

    invoke-direct {v4, v3, v5}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .local v4, "tk":Ljava/util/StringTokenizer;
    :goto_1
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 60
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    .line 61
    .local v5, "line":Ljava/lang/String;
    const-string v6, "#"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 62
    goto :goto_1

    .line 64
    :cond_0
    new-instance v6, Ljava/util/StringTokenizer;

    const-string v7, " ;\r\n\t\u000c"

    invoke-direct {v6, v5, v7}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .local v6, "t2":Ljava/util/StringTokenizer;
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v7

    if-nez v7, :cond_1

    .line 66
    goto :goto_1

    .line 68
    :cond_1
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v7

    .line 69
    .local v7, "name":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v8

    if-nez v8, :cond_2

    .line 70
    goto :goto_1

    .line 72
    :cond_2
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v8

    .line 77
    .local v8, "hex":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 78
    goto :goto_1

    .line 80
    :cond_3
    const/16 v9, 0x10

    invoke-static {v8, v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v9

    .line 81
    .local v9, "num":I
    sget-object v10, Lcom/itextpdf/io/font/AdobeGlyphList;->unicode2names:Ljava/util/Map;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v10, v11, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    sget-object v10, Lcom/itextpdf/io/font/AdobeGlyphList;->names2unicode:Ljava/util/Map;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v10, v7, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    nop

    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "t2":Ljava/util/StringTokenizer;
    .end local v7    # "name":Ljava/lang/String;
    .end local v8    # "hex":Ljava/lang/String;
    .end local v9    # "num":I
    goto :goto_1

    .line 87
    .end local v1    # "buf":[B
    .end local v2    # "stream":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "s":Ljava/lang/String;
    .end local v4    # "tk":Ljava/util/StringTokenizer;
    :cond_4
    if-eqz v0, :cond_7

    .line 89
    :goto_2
    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    .line 53
    .restart local v1    # "buf":[B
    .restart local v2    # "stream":Ljava/io/ByteArrayOutputStream;
    .local v3, "size":I
    :cond_5
    const/4 v4, 0x0

    :try_start_2
    invoke-virtual {v2, v1, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 54
    .end local v3    # "size":I
    goto :goto_0

    .line 44
    .end local v1    # "buf":[B
    .end local v2    # "stream":Ljava/io/ByteArrayOutputStream;
    :cond_6
    new-instance v1, Ljava/lang/Exception;

    const-string v2, "com/itextpdf/io/font/AdobeGlyphList.txt not found as resource."

    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .end local v0    # "resource":Ljava/io/InputStream;
    throw v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 87
    .restart local v0    # "resource":Ljava/io/InputStream;
    :catchall_0
    move-exception v1

    goto :goto_5

    .line 84
    :catch_0
    move-exception v1

    .line 85
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "AdobeGlyphList.txt loading error: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 87
    .end local v1    # "e":Ljava/lang/Exception;
    if-eqz v0, :cond_7

    .line 89
    goto :goto_2

    .line 92
    :goto_3
    goto :goto_4

    .line 90
    :catch_1
    move-exception v1

    goto :goto_3

    .line 95
    .end local v0    # "resource":Ljava/io/InputStream;
    :cond_7
    :goto_4
    return-void

    .line 87
    .restart local v0    # "resource":Ljava/io/InputStream;
    :goto_5
    if-eqz v0, :cond_8

    .line 89
    :try_start_4
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 92
    goto :goto_6

    .line 90
    :catch_2
    move-exception v2

    .line 94
    :cond_8
    :goto_6
    throw v1
.end method

.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getNameToUnicodeLength()I
    .locals 1

    .line 116
    sget-object v0, Lcom/itextpdf/io/font/AdobeGlyphList;->names2unicode:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public static getUnicodeToNameLength()I
    .locals 1

    .line 120
    sget-object v0, Lcom/itextpdf/io/font/AdobeGlyphList;->unicode2names:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public static nameToUnicode(Ljava/lang/String;)I
    .locals 3
    .param p0, "name"    # Ljava/lang/String;

    .line 98
    const/4 v0, -0x1

    .line 99
    .local v0, "v":I
    sget-object v1, Lcom/itextpdf/io/font/AdobeGlyphList;->names2unicode:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 100
    sget-object v1, Lcom/itextpdf/io/font/AdobeGlyphList;->names2unicode:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 102
    :cond_0
    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x7

    if-ne v1, v2, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "uni"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 104
    const/4 v1, 0x3

    :try_start_0
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    .line 105
    :catch_0
    move-exception v1

    .line 108
    :cond_1
    return v0
.end method

.method public static unicodeToName(I)Ljava/lang/String;
    .locals 2
    .param p0, "num"    # I

    .line 112
    sget-object v0, Lcom/itextpdf/io/font/AdobeGlyphList;->unicode2names:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method
