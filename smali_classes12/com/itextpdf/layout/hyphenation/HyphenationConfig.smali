.class public Lcom/itextpdf/layout/hyphenation/HyphenationConfig;
.super Ljava/lang/Object;
.source "HyphenationConfig.java"


# instance fields
.field protected hyphenSymbol:C

.field protected hyphenator:Lcom/itextpdf/layout/hyphenation/Hyphenator;


# direct methods
.method public constructor <init>(II)V
    .locals 2
    .param p1, "leftMin"    # I
    .param p2, "rightMin"    # I

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/16 v0, 0x2d

    iput-char v0, p0, Lcom/itextpdf/layout/hyphenation/HyphenationConfig;->hyphenSymbol:C

    .line 47
    new-instance v0, Lcom/itextpdf/layout/hyphenation/Hyphenator;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, p1, p2}, Lcom/itextpdf/layout/hyphenation/Hyphenator;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/HyphenationConfig;->hyphenator:Lcom/itextpdf/layout/hyphenation/Hyphenator;

    .line 48
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/hyphenation/Hyphenator;)V
    .locals 1
    .param p1, "hyphenator"    # Lcom/itextpdf/layout/hyphenation/Hyphenator;

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/16 v0, 0x2d

    iput-char v0, p0, Lcom/itextpdf/layout/hyphenation/HyphenationConfig;->hyphenSymbol:C

    .line 56
    iput-object p1, p0, Lcom/itextpdf/layout/hyphenation/HyphenationConfig;->hyphenator:Lcom/itextpdf/layout/hyphenation/Hyphenator;

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 1
    .param p1, "lang"    # Ljava/lang/String;
    .param p2, "country"    # Ljava/lang/String;
    .param p3, "leftMin"    # I
    .param p4, "rightMin"    # I

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/16 v0, 0x2d

    iput-char v0, p0, Lcom/itextpdf/layout/hyphenation/HyphenationConfig;->hyphenSymbol:C

    .line 67
    new-instance v0, Lcom/itextpdf/layout/hyphenation/Hyphenator;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/itextpdf/layout/hyphenation/Hyphenator;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/HyphenationConfig;->hyphenator:Lcom/itextpdf/layout/hyphenation/Hyphenator;

    .line 68
    return-void
.end method


# virtual methods
.method public getHyphenSymbol()C
    .locals 1

    .line 88
    iget-char v0, p0, Lcom/itextpdf/layout/hyphenation/HyphenationConfig;->hyphenSymbol:C

    return v0
.end method

.method public hyphenate(Ljava/lang/String;)Lcom/itextpdf/layout/hyphenation/Hyphenation;
    .locals 1
    .param p1, "word"    # Ljava/lang/String;

    .line 79
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/HyphenationConfig;->hyphenator:Lcom/itextpdf/layout/hyphenation/Hyphenator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/HyphenationConfig;->hyphenator:Lcom/itextpdf/layout/hyphenation/Hyphenator;

    invoke-virtual {v0, p1}, Lcom/itextpdf/layout/hyphenation/Hyphenator;->hyphenate(Ljava/lang/String;)Lcom/itextpdf/layout/hyphenation/Hyphenation;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public setHyphenSymbol(C)V
    .locals 0
    .param p1, "hyphenSymbol"    # C

    .line 97
    iput-char p1, p0, Lcom/itextpdf/layout/hyphenation/HyphenationConfig;->hyphenSymbol:C

    .line 98
    return-void
.end method
