.class Lcom/itextpdf/io/font/FontCacheKey$FontCacheStringKey;
.super Lcom/itextpdf/io/font/FontCacheKey;
.source "FontCacheKey.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/FontCacheKey;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FontCacheStringKey"
.end annotation


# instance fields
.field private fontName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "fontName"    # Ljava/lang/String;

    .line 48
    invoke-direct {p0}, Lcom/itextpdf/io/font/FontCacheKey;-><init>()V

    .line 49
    iput-object p1, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheStringKey;->fontName:Ljava/lang/String;

    .line 50
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .line 54
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 55
    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 57
    :cond_1
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/io/font/FontCacheKey$FontCacheStringKey;

    .line 59
    .local v2, "that":Lcom/itextpdf/io/font/FontCacheKey$FontCacheStringKey;
    iget-object v3, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheStringKey;->fontName:Ljava/lang/String;

    if-eqz v3, :cond_2

    iget-object v0, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheStringKey;->fontName:Ljava/lang/String;

    iget-object v1, v2, Lcom/itextpdf/io/font/FontCacheKey$FontCacheStringKey;->fontName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :cond_2
    iget-object v3, v2, Lcom/itextpdf/io/font/FontCacheKey$FontCacheStringKey;->fontName:Ljava/lang/String;

    if-nez v3, :cond_3

    goto :goto_0

    :cond_3
    move v0, v1

    :goto_0
    return v0

    .line 55
    .end local v2    # "that":Lcom/itextpdf/io/font/FontCacheKey$FontCacheStringKey;
    :cond_4
    :goto_1
    return v1
.end method

.method public hashCode()I
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheStringKey;->fontName:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheStringKey;->fontName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
