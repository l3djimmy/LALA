.class public final Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;
.super Ljava/lang/Object;
.source "CMapCharsetEncoder.java"


# instance fields
.field private final bmpOnly:Z

.field private final charBuf:Ljava/nio/CharBuffer;

.field private final encoder:Ljava/nio/charset/CharsetEncoder;

.field private final targetCharset:Ljava/nio/charset/Charset;


# direct methods
.method public constructor <init>(Ljava/nio/charset/Charset;)V
    .locals 1
    .param p1, "targetCharset"    # Ljava/nio/charset/Charset;

    .line 42
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;-><init>(Ljava/nio/charset/Charset;Z)V

    .line 43
    return-void
.end method

.method public constructor <init>(Ljava/nio/charset/Charset;Z)V
    .locals 1
    .param p1, "targetCharset"    # Ljava/nio/charset/Charset;
    .param p2, "bmpOnly"    # Z

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/nio/CharBuffer;->allocate(I)Ljava/nio/CharBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;->charBuf:Ljava/nio/CharBuffer;

    .line 46
    iput-boolean p2, p0, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;->bmpOnly:Z

    .line 47
    iput-object p1, p0, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;->targetCharset:Ljava/nio/charset/Charset;

    .line 48
    invoke-virtual {p1}, Ljava/nio/charset/Charset;->newEncoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;->encoder:Ljava/nio/charset/CharsetEncoder;

    .line 49
    return-void
.end method


# virtual methods
.method public encodeUnicodeCodePoint(I)[B
    .locals 4
    .param p1, "cp"    # I

    .line 52
    invoke-static {p1}, Ljava/lang/Character;->isBmpCodePoint(I)Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;->bmpOnly:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 53
    :cond_0
    new-instance v0, Lcom/itextpdf/commons/exceptions/ITextException;

    const-string v1, "This encoder only accepts BMP codepoints"

    invoke-direct {v0, v1}, Lcom/itextpdf/commons/exceptions/ITextException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;->charBuf:Ljava/nio/CharBuffer;

    invoke-virtual {v0}, Ljava/nio/CharBuffer;->clear()Ljava/nio/Buffer;

    .line 56
    iget-object v0, p0, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;->charBuf:Ljava/nio/CharBuffer;

    invoke-static {p1}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/CharBuffer;->put([C)Ljava/nio/CharBuffer;

    .line 57
    iget-object v0, p0, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;->charBuf:Ljava/nio/CharBuffer;

    invoke-virtual {v0}, Ljava/nio/CharBuffer;->flip()Ljava/nio/Buffer;

    .line 59
    iget-object v0, p0, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;->encoder:Ljava/nio/charset/CharsetEncoder;

    invoke-virtual {v0}, Ljava/nio/charset/CharsetEncoder;->reset()Ljava/nio/charset/CharsetEncoder;

    .line 62
    :try_start_0
    iget-object v0, p0, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;->encoder:Ljava/nio/charset/CharsetEncoder;

    iget-object v1, p0, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;->charBuf:Ljava/nio/CharBuffer;

    invoke-virtual {v0, v1}, Ljava/nio/charset/CharsetEncoder;->encode(Ljava/nio/CharBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0
    :try_end_0
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    .local v0, "destBuf":Ljava/nio/ByteBuffer;
    nop

    .line 67
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    new-array v1, v1, [B

    .line 69
    .local v1, "result":[B
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 70
    return-object v1

    .line 63
    .end local v0    # "destBuf":Ljava/nio/ByteBuffer;
    .end local v1    # "result":[B
    :catch_0
    move-exception v0

    .line 64
    .local v0, "e":Ljava/nio/charset/CharacterCodingException;
    new-instance v1, Lcom/itextpdf/commons/exceptions/ITextException;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v3, p0, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;->targetCharset:Ljava/nio/charset/Charset;

    .line 65
    invoke-virtual {v3}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    .line 64
    const-string v3, "Error during encoding the following code point: {0} in characterset: {1}"

    invoke-static {v3, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/commons/exceptions/ITextException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method
