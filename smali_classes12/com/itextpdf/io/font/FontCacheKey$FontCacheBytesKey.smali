.class Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;
.super Lcom/itextpdf/io/font/FontCacheKey;
.source "FontCacheKey.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/FontCacheKey;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FontCacheBytesKey"
.end annotation


# instance fields
.field private firstFontBytes:[B

.field private fontLength:I

.field private hashcode:I


# direct methods
.method constructor <init>([B)V
    .locals 2
    .param p1, "fontBytes"    # [B

    .line 74
    invoke-direct {p0}, Lcom/itextpdf/io/font/FontCacheKey;-><init>()V

    .line 75
    if-eqz p1, :cond_1

    .line 76
    const/16 v0, 0x2710

    .line 77
    .local v0, "maxBytesNum":I
    array-length v1, p1

    if-le v1, v0, :cond_0

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, p1

    :goto_0
    iput-object v1, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;->firstFontBytes:[B

    .line 78
    array-length v1, p1

    iput v1, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;->fontLength:I

    .line 80
    .end local v0    # "maxBytesNum":I
    :cond_1
    invoke-direct {p0}, Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;->calcHashCode()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;->hashcode:I

    .line 81
    return-void
.end method

.method private calcHashCode()I
    .locals 3

    .line 100
    iget-object v0, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;->firstFontBytes:[B

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    .line 101
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;->fontLength:I

    add-int/2addr v1, v2

    .line 102
    .end local v0    # "result":I
    .local v1, "result":I
    return v1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .line 85
    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    return v0

    .line 86
    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_1

    goto :goto_0

    .line 88
    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;

    .line 90
    .local v1, "that":Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;
    iget v2, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;->fontLength:I

    iget v3, v1, Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;->fontLength:I

    if-eq v2, v3, :cond_2

    return v0

    .line 91
    :cond_2
    iget-object v0, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;->firstFontBytes:[B

    iget-object v2, v1, Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;->firstFontBytes:[B

    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    return v0

    .line 86
    .end local v1    # "that":Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;
    :cond_3
    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 96
    iget v0, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;->hashcode:I

    return v0
.end method
