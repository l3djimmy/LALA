.class public abstract Lcom/itextpdf/io/font/FontCacheKey;
.super Ljava/lang/Object;
.source "FontCacheKey.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/font/FontCacheKey$FontCacheTtcKey;,
        Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;,
        Lcom/itextpdf/io/font/FontCacheKey$FontCacheStringKey;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/lang/String;)Lcom/itextpdf/io/font/FontCacheKey;
    .locals 1
    .param p0, "fontName"    # Ljava/lang/String;

    .line 30
    new-instance v0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheStringKey;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/font/FontCacheKey$FontCacheStringKey;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static create(Ljava/lang/String;I)Lcom/itextpdf/io/font/FontCacheKey;
    .locals 1
    .param p0, "fontName"    # Ljava/lang/String;
    .param p1, "ttcIndex"    # I

    .line 34
    new-instance v0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheTtcKey;

    invoke-direct {v0, p0, p1}, Lcom/itextpdf/io/font/FontCacheKey$FontCacheTtcKey;-><init>(Ljava/lang/String;I)V

    return-object v0
.end method

.method public static create([B)Lcom/itextpdf/io/font/FontCacheKey;
    .locals 1
    .param p0, "fontProgram"    # [B

    .line 38
    new-instance v0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/font/FontCacheKey$FontCacheBytesKey;-><init>([B)V

    return-object v0
.end method

.method public static create([BI)Lcom/itextpdf/io/font/FontCacheKey;
    .locals 1
    .param p0, "fontProgram"    # [B
    .param p1, "ttcIndex"    # I

    .line 42
    new-instance v0, Lcom/itextpdf/io/font/FontCacheKey$FontCacheTtcKey;

    invoke-direct {v0, p0, p1}, Lcom/itextpdf/io/font/FontCacheKey$FontCacheTtcKey;-><init>([BI)V

    return-object v0
.end method
