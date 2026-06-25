.class final Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;
.super Ljava/lang/Object;
.source "HuffmanTreeGroup.java"


# instance fields
.field private alphabetSize:I

.field codes:[I

.field trees:[I


# direct methods
.method constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static decode(Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V
    .locals 5
    .param p0, "group"    # Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;
    .param p1, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 49
    const/4 v0, 0x0

    .line 50
    .local v0, "next":I
    iget-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->trees:[I

    array-length v1, v1

    .line 51
    .local v1, "n":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 52
    iget-object v3, p0, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->trees:[I

    aput v0, v3, v2

    .line 53
    iget v3, p0, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->alphabetSize:I

    iget-object v4, p0, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->codes:[I

    invoke-static {v3, v4, v0, p1}, Lcom/itextpdf/io/codec/brotli/dec/Decode;->readHuffmanCode(I[IILcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 54
    add-int/lit16 v0, v0, 0x438

    .line 51
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 56
    .end local v2    # "i":I
    :cond_0
    return-void
.end method

.method static init(Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;II)V
    .locals 1
    .param p0, "group"    # Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;
    .param p1, "alphabetSize"    # I
    .param p2, "n"    # I

    .line 37
    iput p1, p0, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->alphabetSize:I

    .line 38
    mul-int/lit16 v0, p2, 0x438

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->codes:[I

    .line 39
    new-array v0, p2, [I

    iput-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/HuffmanTreeGroup;->trees:[I

    .line 40
    return-void
.end method
