.class public Lcom/itextpdf/kernel/numbering/EnglishAlphabetNumbering;
.super Ljava/lang/Object;
.source "EnglishAlphabetNumbering.java"


# static fields
.field protected static final ALPHABET_LENGTH:I = 0x1a

.field protected static final ALPHABET_LOWERCASE:[C

.field protected static final ALPHABET_UPPERCASE:[C


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 36
    const/16 v0, 0x1a

    new-array v1, v0, [C

    sput-object v1, Lcom/itextpdf/kernel/numbering/EnglishAlphabetNumbering;->ALPHABET_LOWERCASE:[C

    .line 37
    new-array v1, v0, [C

    sput-object v1, Lcom/itextpdf/kernel/numbering/EnglishAlphabetNumbering;->ALPHABET_UPPERCASE:[C

    .line 38
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 39
    sget-object v2, Lcom/itextpdf/kernel/numbering/EnglishAlphabetNumbering;->ALPHABET_LOWERCASE:[C

    add-int/lit8 v3, v1, 0x61

    int-to-char v3, v3

    aput-char v3, v2, v1

    .line 40
    sget-object v2, Lcom/itextpdf/kernel/numbering/EnglishAlphabetNumbering;->ALPHABET_UPPERCASE:[C

    add-int/lit8 v3, v1, 0x41

    int-to-char v3, v3

    aput-char v3, v2, v1

    .line 38
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 42
    .end local v1    # "i":I
    :cond_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static toLatinAlphabetNumber(IZ)Ljava/lang/String;
    .locals 1
    .param p0, "number"    # I
    .param p1, "upperCase"    # Z

    .line 76
    if-eqz p1, :cond_0

    invoke-static {p0}, Lcom/itextpdf/kernel/numbering/EnglishAlphabetNumbering;->toLatinAlphabetNumberUpperCase(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Lcom/itextpdf/kernel/numbering/EnglishAlphabetNumbering;->toLatinAlphabetNumberLowerCase(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public static toLatinAlphabetNumberLowerCase(I)Ljava/lang/String;
    .locals 1
    .param p0, "number"    # I

    .line 52
    sget-object v0, Lcom/itextpdf/kernel/numbering/EnglishAlphabetNumbering;->ALPHABET_LOWERCASE:[C

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/numbering/AlphabetNumbering;->toAlphabetNumber(I[C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toLatinAlphabetNumberUpperCase(I)Ljava/lang/String;
    .locals 1
    .param p0, "number"    # I

    .line 63
    sget-object v0, Lcom/itextpdf/kernel/numbering/EnglishAlphabetNumbering;->ALPHABET_UPPERCASE:[C

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/numbering/AlphabetNumbering;->toAlphabetNumber(I[C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
