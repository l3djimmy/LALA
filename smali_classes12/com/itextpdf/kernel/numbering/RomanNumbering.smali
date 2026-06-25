.class public Lcom/itextpdf/kernel/numbering/RomanNumbering;
.super Ljava/lang/Object;
.source "RomanNumbering.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;
    }
.end annotation


# static fields
.field private static final ROMAN_DIGITS:[Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 35
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;

    new-instance v1, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;

    const/16 v2, 0x6d

    const/16 v3, 0x3e8

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;-><init>(CIZ)V

    aput-object v1, v0, v4

    new-instance v1, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;

    const/16 v2, 0x1f4

    const/16 v3, 0x64

    invoke-direct {v1, v3, v2, v4}, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;-><init>(CIZ)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;

    const/16 v5, 0x63

    invoke-direct {v1, v5, v3, v2}, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;-><init>(CIZ)V

    const/4 v3, 0x2

    aput-object v1, v0, v3

    new-instance v1, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;

    const/16 v3, 0x6c

    const/16 v5, 0x32

    invoke-direct {v1, v3, v5, v4}, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;-><init>(CIZ)V

    const/4 v3, 0x3

    aput-object v1, v0, v3

    new-instance v1, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;

    const/16 v3, 0x78

    const/16 v5, 0xa

    invoke-direct {v1, v3, v5, v2}, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;-><init>(CIZ)V

    const/4 v3, 0x4

    aput-object v1, v0, v3

    new-instance v1, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;

    const/16 v3, 0x76

    const/4 v5, 0x5

    invoke-direct {v1, v3, v5, v4}, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;-><init>(CIZ)V

    aput-object v1, v0, v5

    new-instance v1, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;

    const/16 v3, 0x69

    invoke-direct {v1, v3, v2, v2}, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;-><init>(CIZ)V

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sput-object v0, Lcom/itextpdf/kernel/numbering/RomanNumbering;->ROMAN_DIGITS:[Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static convert(I)Ljava/lang/String;
    .locals 6
    .param p0, "index"    # I

    .line 84
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 87
    .local v0, "buf":Ljava/lang/StringBuilder;
    if-gez p0, :cond_0

    .line 88
    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 89
    neg-int p0, p0

    .line 92
    :cond_0
    const/16 v1, 0xfa0

    if-lt p0, v1, :cond_1

    .line 93
    const/16 v1, 0x7c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 94
    div-int/lit16 v2, p0, 0x3e8

    invoke-static {v2}, Lcom/itextpdf/kernel/numbering/RomanNumbering;->convert(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 97
    div-int/lit16 v1, p0, 0x3e8

    mul-int/lit16 v1, v1, 0x3e8

    sub-int/2addr p0, v1

    .line 101
    :cond_1
    const/4 v1, 0x0

    .line 104
    .local v1, "pos":I
    :goto_0
    sget-object v2, Lcom/itextpdf/kernel/numbering/RomanNumbering;->ROMAN_DIGITS:[Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;

    aget-object v2, v2, v1

    .line 106
    .local v2, "dig":Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;
    :goto_1
    iget v3, v2, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;->value:I

    if-lt p0, v3, :cond_2

    .line 107
    iget-char v3, v2, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;->digit:C

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 108
    iget v3, v2, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;->value:I

    sub-int/2addr p0, v3

    goto :goto_1

    .line 111
    :cond_2
    if-gtz p0, :cond_3

    .line 112
    nop

    .line 125
    .end local v2    # "dig":Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 115
    .restart local v2    # "dig":Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;
    :cond_3
    move v3, v1

    .line 116
    .local v3, "j":I
    :goto_2
    sget-object v4, Lcom/itextpdf/kernel/numbering/RomanNumbering;->ROMAN_DIGITS:[Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;

    add-int/lit8 v3, v3, 0x1

    aget-object v4, v4, v3

    iget-boolean v4, v4, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;->pre:Z

    if-nez v4, :cond_4

    goto :goto_2

    .line 119
    :cond_4
    sget-object v4, Lcom/itextpdf/kernel/numbering/RomanNumbering;->ROMAN_DIGITS:[Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;

    aget-object v4, v4, v3

    iget v4, v4, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;->value:I

    add-int/2addr v4, p0

    iget v5, v2, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;->value:I

    if-lt v4, v5, :cond_5

    .line 120
    sget-object v4, Lcom/itextpdf/kernel/numbering/RomanNumbering;->ROMAN_DIGITS:[Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;

    aget-object v4, v4, v3

    iget-char v4, v4, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;->digit:C

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-char v5, v2, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;->digit:C

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 121
    iget v4, v2, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;->value:I

    sget-object v5, Lcom/itextpdf/kernel/numbering/RomanNumbering;->ROMAN_DIGITS:[Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;

    aget-object v5, v5, v3

    iget v5, v5, Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;->value:I

    sub-int/2addr v4, v5

    sub-int/2addr p0, v4

    .line 123
    :cond_5
    nop

    .end local v2    # "dig":Lcom/itextpdf/kernel/numbering/RomanNumbering$RomanDigit;
    .end local v3    # "j":I
    add-int/lit8 v1, v1, 0x1

    .line 124
    goto :goto_0
.end method

.method public static toRoman(IZ)Ljava/lang/String;
    .locals 1
    .param p0, "number"    # I
    .param p1, "upperCase"    # Z

    .line 74
    if-eqz p1, :cond_0

    invoke-static {p0}, Lcom/itextpdf/kernel/numbering/RomanNumbering;->toRomanUpperCase(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Lcom/itextpdf/kernel/numbering/RomanNumbering;->toRomanLowerCase(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public static toRomanLowerCase(I)Ljava/lang/String;
    .locals 1
    .param p0, "number"    # I

    .line 52
    invoke-static {p0}, Lcom/itextpdf/kernel/numbering/RomanNumbering;->convert(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toRomanUpperCase(I)Ljava/lang/String;
    .locals 1
    .param p0, "number"    # I

    .line 62
    invoke-static {p0}, Lcom/itextpdf/kernel/numbering/RomanNumbering;->convert(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
