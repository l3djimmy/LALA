.class public final Lcom/itextpdf/io/util/FilterUtil;
.super Ljava/lang/Object;
.source "FilterUtil.java"


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 45
    const-class v0, Lcom/itextpdf/io/util/FilterUtil;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/util/FilterUtil;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    return-void
.end method

.method public static flateDecode([B)[B
    .locals 2
    .param p0, "input"    # [B

    .line 91
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/itextpdf/io/util/FilterUtil;->flateDecode([BZ)[B

    move-result-object v0

    .line 92
    .local v0, "b":[B
    if-nez v0, :cond_0

    .line 93
    const/4 v1, 0x0

    invoke-static {p0, v1}, Lcom/itextpdf/io/util/FilterUtil;->flateDecode([BZ)[B

    move-result-object v1

    return-object v1

    .line 94
    :cond_0
    return-object v0
.end method

.method public static flateDecode([BZ)[B
    .locals 9
    .param p0, "input"    # [B
    .param p1, "strict"    # Z

    .line 59
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 60
    .local v0, "stream":Ljava/io/ByteArrayInputStream;
    new-instance v1, Ljava/util/zip/InflaterInputStream;

    invoke-direct {v1, v0}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 61
    .local v1, "zip":Ljava/util/zip/InflaterInputStream;
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 62
    .local v2, "output":Ljava/io/ByteArrayOutputStream;
    if-eqz p1, :cond_0

    const/16 v3, 0xffc

    goto :goto_0

    :cond_0
    const/4 v3, 0x1

    :goto_0
    new-array v3, v3, [B

    .line 65
    .local v3, "b":[B
    :goto_1
    :try_start_0
    invoke-virtual {v1, v3}, Ljava/util/zip/InflaterInputStream;->read([B)I

    move-result v4

    move v5, v4

    .local v5, "n":I
    if-ltz v4, :cond_1

    .line 66
    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1

    .line 68
    :cond_1
    invoke-virtual {v1}, Ljava/util/zip/InflaterInputStream;->close()V

    .line 69
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 70
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    :try_start_1
    invoke-virtual {v1}, Ljava/util/zip/InflaterInputStream;->close()V

    .line 76
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 80
    goto :goto_2

    .line 77
    :catch_0
    move-exception v6

    .line 79
    .local v6, "e":Ljava/lang/Exception;
    sget-object v7, Lcom/itextpdf/io/util/FilterUtil;->LOGGER:Lorg/slf4j/Logger;

    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v6}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 70
    .end local v6    # "e":Ljava/lang/Exception;
    :goto_2
    return-object v4

    .line 74
    .end local v5    # "n":I
    :catchall_0
    move-exception v4

    goto :goto_5

    .line 71
    :catch_1
    move-exception v4

    .line 72
    .local v4, "e":Ljava/lang/Exception;
    if-eqz p1, :cond_2

    const/4 v5, 0x0

    goto :goto_3

    :cond_2
    :try_start_2
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 75
    :goto_3
    :try_start_3
    invoke-virtual {v1}, Ljava/util/zip/InflaterInputStream;->close()V

    .line 76
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 80
    goto :goto_4

    .line 77
    :catch_2
    move-exception v6

    .line 79
    .restart local v6    # "e":Ljava/lang/Exception;
    sget-object v7, Lcom/itextpdf/io/util/FilterUtil;->LOGGER:Lorg/slf4j/Logger;

    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v6}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 72
    .end local v6    # "e":Ljava/lang/Exception;
    :goto_4
    return-object v5

    .line 75
    .end local v4    # "e":Ljava/lang/Exception;
    :goto_5
    :try_start_4
    invoke-virtual {v1}, Ljava/util/zip/InflaterInputStream;->close()V

    .line 76
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 80
    goto :goto_6

    .line 77
    :catch_3
    move-exception v5

    .line 79
    .local v5, "e":Ljava/lang/Exception;
    sget-object v6, Lcom/itextpdf/io/util/FilterUtil;->LOGGER:Lorg/slf4j/Logger;

    invoke-virtual {v5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7, v5}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 81
    .end local v5    # "e":Ljava/lang/Exception;
    :goto_6
    throw v4
.end method

.method public static getInflaterInputStream(Ljava/io/InputStream;)Ljava/io/InputStream;
    .locals 2
    .param p0, "input"    # Ljava/io/InputStream;

    .line 114
    new-instance v0, Ljava/util/zip/InflaterInputStream;

    new-instance v1, Ljava/util/zip/Inflater;

    invoke-direct {v1}, Ljava/util/zip/Inflater;-><init>()V

    invoke-direct {v0, p0, v1}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;)V

    return-object v0
.end method

.method public static inflateData([B[B)V
    .locals 4
    .param p0, "deflated"    # [B
    .param p1, "inflated"    # [B

    .line 104
    new-instance v0, Ljava/util/zip/Inflater;

    invoke-direct {v0}, Ljava/util/zip/Inflater;-><init>()V

    .line 105
    .local v0, "inflater":Ljava/util/zip/Inflater;
    invoke-virtual {v0, p0}, Ljava/util/zip/Inflater;->setInput([B)V

    .line 107
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/util/zip/Inflater;->inflate([B)I
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    nop

    .line 111
    return-void

    .line 108
    :catch_0
    move-exception v1

    .line 109
    .local v1, "dfe":Ljava/util/zip/DataFormatException;
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v3, "Cannot inflate TIFF image."

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
