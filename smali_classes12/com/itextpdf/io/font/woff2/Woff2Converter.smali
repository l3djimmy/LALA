.class public Lcom/itextpdf/io/font/woff2/Woff2Converter;
.super Ljava/lang/Object;
.source "Woff2Converter.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convert([B)[B
    .locals 3
    .param p0, "woff2Bytes"    # [B

    .line 40
    array-length v0, p0

    invoke-static {p0, v0}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->computeWoff2FinalSize([BI)I

    move-result v0

    new-array v0, v0, [B

    .line 41
    .local v0, "inner_byte_buffer":[B
    new-instance v1, Lcom/itextpdf/io/font/woff2/Woff2MemoryOut;

    array-length v2, v0

    invoke-direct {v1, v0, v2}, Lcom/itextpdf/io/font/woff2/Woff2MemoryOut;-><init>([BI)V

    .line 42
    .local v1, "out":Lcom/itextpdf/io/font/woff2/Woff2Out;
    array-length v2, p0

    invoke-static {p0, v2, v1}, Lcom/itextpdf/io/font/woff2/Woff2Dec;->convertWoff2ToTtf([BILcom/itextpdf/io/font/woff2/Woff2Out;)V

    .line 43
    return-object v0
.end method

.method public static isWoff2Font([B)Z
    .locals 4
    .param p0, "woff2Bytes"    # [B

    .line 28
    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x4

    if-ge v0, v2, :cond_0

    .line 29
    return v1

    .line 31
    :cond_0
    new-instance v0, Lcom/itextpdf/io/font/woff2/Buffer;

    invoke-direct {v0, p0, v1, v2}, Lcom/itextpdf/io/font/woff2/Buffer;-><init>([BII)V

    .line 33
    .local v0, "file":Lcom/itextpdf/io/font/woff2/Buffer;
    :try_start_0
    invoke-virtual {v0}, Lcom/itextpdf/io/font/woff2/Buffer;->readInt()I

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const v3, 0x774f4632

    if-ne v2, v3, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1

    .line 34
    :catch_0
    move-exception v2

    .line 35
    .local v2, "any":Ljava/lang/Exception;
    return v1
.end method
