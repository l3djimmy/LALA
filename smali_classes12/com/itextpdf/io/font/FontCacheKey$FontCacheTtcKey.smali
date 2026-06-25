.class Lcom/itextpdf/io/font/FontCacheKey$FontCacheTtcKey;
.super Lcom/itextpdf/io/font/FontCacheKey;
.source "FontCacheKey.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/FontCacheKey;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FontCacheTtcKey"
.end annotation


# instance fields
.field private ttcIndex:I

.field private ttcKey:Lcom/itextpdf/io/font/FontCacheKey;


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .param p1, "fontName"    # Ljava/lang/String;
    .param p2, "ttcIndex"    # I

    .line 110
    invoke-direct {p0}, Lcom/itextpdf/io/font/FontCacheKey;-><init>()V

    .line 111
    new-instance v0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheStringKey;

    invoke-direct {v0, p1}, Lcom/itextpdf/io/font/FontCacheKey$FontCacheStringKey;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheTtcKey;->ttcKey:Lcom/itextpdf/io/font/FontCacheKey;

    .line 112
    iput p2, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheTtcKey;->ttcIndex:I

    .line 113
    return-void
.end method

.method constructor <init>([BI)V
    .locals 1
    .param p1, "fontBytes"    # [B
    .param p2, "ttcIndex"    # I

    .line 115
    invoke-direct {p0}, Lcom/itextpdf/io/font/FontCacheKey;-><init>()V

    .line 116
    new-instance v0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;

    invoke-direct {v0, p1}, Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;-><init>([B)V

    iput-object v0, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheTtcKey;->ttcKey:Lcom/itextpdf/io/font/FontCacheKey;

    .line 117
    iput p2, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheTtcKey;->ttcIndex:I

    .line 118
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .line 122
    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    return v0

    .line 123
    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_1

    goto :goto_0

    .line 125
    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/io/font/FontCacheKey$FontCacheTtcKey;

    .line 127
    .local v1, "that":Lcom/itextpdf/io/font/FontCacheKey$FontCacheTtcKey;
    iget v2, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheTtcKey;->ttcIndex:I

    iget v3, v1, Lcom/itextpdf/io/font/FontCacheKey$FontCacheTtcKey;->ttcIndex:I

    if-eq v2, v3, :cond_2

    return v0

    .line 128
    :cond_2
    iget-object v0, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheTtcKey;->ttcKey:Lcom/itextpdf/io/font/FontCacheKey;

    iget-object v2, v1, Lcom/itextpdf/io/font/FontCacheKey$FontCacheTtcKey;->ttcKey:Lcom/itextpdf/io/font/FontCacheKey;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 123
    .end local v1    # "that":Lcom/itextpdf/io/font/FontCacheKey$FontCacheTtcKey;
    :cond_3
    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 133
    iget-object v0, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheTtcKey;->ttcKey:Lcom/itextpdf/io/font/FontCacheKey;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 134
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheTtcKey;->ttcIndex:I

    add-int/2addr v1, v2

    .line 135
    .end local v0    # "result":I
    .local v1, "result":I
    return v1
.end method
