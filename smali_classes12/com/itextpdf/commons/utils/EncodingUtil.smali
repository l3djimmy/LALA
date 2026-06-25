.class public final Lcom/itextpdf/commons/utils/EncodingUtil;
.super Ljava/lang/Object;
.source "EncodingUtil.java"


# static fields
.field private static final UTF8:Ljava/lang/String; = "UTF-8"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    return-void
.end method

.method public static convertToBytes([CLjava/lang/String;)[B
    .locals 8
    .param p0, "chars"    # [C
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/charset/CharacterCodingException;
        }
    .end annotation

    .line 54
    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    .line 55
    .local v0, "cc":Ljava/nio/charset/Charset;
    invoke-virtual {v0}, Ljava/nio/charset/Charset;->newEncoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object v1

    .line 56
    .local v1, "ce":Ljava/nio/charset/CharsetEncoder;
    sget-object v2, Ljava/nio/charset/CodingErrorAction;->IGNORE:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v1, v2}, Ljava/nio/charset/CharsetEncoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetEncoder;

    .line 57
    invoke-static {p0}, Ljava/nio/CharBuffer;->wrap([C)Ljava/nio/CharBuffer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/charset/CharsetEncoder;->encode(Ljava/nio/CharBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 58
    .local v2, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v2}, Ljava/nio/Buffer;->rewind()Ljava/nio/Buffer;

    .line 59
    invoke-virtual {v2}, Ljava/nio/Buffer;->limit()I

    move-result v3

    .line 60
    .local v3, "lim":I
    const-string v4, "UTF-8"

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const/4 v6, 0x0

    if-eqz v5, :cond_0

    const/4 v5, 0x3

    goto :goto_0

    :cond_0
    move v5, v6

    .line 61
    .local v5, "offset":I
    :goto_0
    add-int v7, v3, v5

    new-array v7, v7, [B

    .line 62
    .local v7, "br":[B
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 63
    const/16 v4, -0x11

    aput-byte v4, v7, v6

    .line 64
    const/4 v4, 0x1

    const/16 v6, -0x45

    aput-byte v6, v7, v4

    .line 65
    const/4 v4, 0x2

    const/16 v6, -0x41

    aput-byte v6, v7, v4

    .line 67
    :cond_1
    invoke-virtual {v2, v7, v5, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 68
    return-object v7
.end method

.method public static convertToString([BLjava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "bytes"    # [B
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 82
    const/4 v0, 0x0

    aget-byte v0, p0, v0

    const/16 v1, -0x11

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    aget-byte v0, p0, v0

    const/16 v1, -0x45

    if-ne v0, v1, :cond_0

    const/4 v0, 0x2

    aget-byte v0, p0, v0

    const/16 v1, -0x41

    if-ne v0, v1, :cond_0

    .line 83
    const-string v0, "UTF-8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 84
    new-instance v1, Ljava/lang/String;

    array-length v2, p0

    const/4 v3, 0x3

    sub-int/2addr v2, v3

    invoke-direct {v1, p0, v3, v2, v0}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    return-object v1

    .line 86
    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p0, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v0
.end method
