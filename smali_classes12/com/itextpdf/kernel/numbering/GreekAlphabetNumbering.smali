.class public Lcom/itextpdf/kernel/numbering/GreekAlphabetNumbering;
.super Ljava/lang/Object;
.source "GreekAlphabetNumbering.java"


# static fields
.field protected static final ALPHABET_LENGTH:I = 0x18

.field protected static final ALPHABET_LOWERCASE:[C

.field protected static final ALPHABET_UPPERCASE:[C


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 41
    const/16 v0, 0x18

    new-array v1, v0, [C

    sput-object v1, Lcom/itextpdf/kernel/numbering/GreekAlphabetNumbering;->ALPHABET_LOWERCASE:[C

    .line 42
    new-array v1, v0, [C

    sput-object v1, Lcom/itextpdf/kernel/numbering/GreekAlphabetNumbering;->ALPHABET_UPPERCASE:[C

    .line 43
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_2

    .line 44
    sget-object v2, Lcom/itextpdf/kernel/numbering/GreekAlphabetNumbering;->ALPHABET_LOWERCASE:[C

    add-int/lit16 v3, v1, 0x3b1

    const/4 v4, 0x0

    const/16 v5, 0x10

    const/4 v6, 0x1

    if-le v1, v5, :cond_0

    move v7, v6

    goto :goto_1

    :cond_0
    move v7, v4

    :goto_1
    add-int/2addr v3, v7

    int-to-char v3, v3

    aput-char v3, v2, v1

    .line 45
    sget-object v2, Lcom/itextpdf/kernel/numbering/GreekAlphabetNumbering;->ALPHABET_UPPERCASE:[C

    add-int/lit16 v3, v1, 0x391

    if-le v1, v5, :cond_1

    move v4, v6

    :cond_1
    add-int/2addr v3, v4

    int-to-char v3, v3

    aput-char v3, v2, v1

    .line 43
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 47
    .end local v1    # "i":I
    :cond_2
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getSymbolFontChar(C)C
    .locals 1
    .param p0, "unicodeChar"    # C

    .line 126
    packed-switch p0, :pswitch_data_0

    .line 275
    :pswitch_0
    const/16 v0, 0x20

    return v0

    .line 273
    :pswitch_1
    const/16 v0, 0x77

    return v0

    .line 270
    :pswitch_2
    const/16 v0, 0x79

    return v0

    .line 267
    :pswitch_3
    const/16 v0, 0x63

    return v0

    .line 264
    :pswitch_4
    const/16 v0, 0x66

    return v0

    .line 261
    :pswitch_5
    const/16 v0, 0x75

    return v0

    .line 258
    :pswitch_6
    const/16 v0, 0x74

    return v0

    .line 255
    :pswitch_7
    const/16 v0, 0x73

    return v0

    .line 252
    :pswitch_8
    const/16 v0, 0x56

    return v0

    .line 249
    :pswitch_9
    const/16 v0, 0x72

    return v0

    .line 246
    :pswitch_a
    const/16 v0, 0x70

    return v0

    .line 243
    :pswitch_b
    const/16 v0, 0x6f

    return v0

    .line 240
    :pswitch_c
    const/16 v0, 0x78

    return v0

    .line 237
    :pswitch_d
    const/16 v0, 0x6e

    return v0

    .line 234
    :pswitch_e
    const/16 v0, 0x6d

    return v0

    .line 231
    :pswitch_f
    const/16 v0, 0x6c

    return v0

    .line 228
    :pswitch_10
    const/16 v0, 0x6b

    return v0

    .line 225
    :pswitch_11
    const/16 v0, 0x69

    return v0

    .line 222
    :pswitch_12
    const/16 v0, 0x71

    return v0

    .line 219
    :pswitch_13
    const/16 v0, 0x68

    return v0

    .line 216
    :pswitch_14
    const/16 v0, 0x7a

    return v0

    .line 213
    :pswitch_15
    const/16 v0, 0x65

    return v0

    .line 210
    :pswitch_16
    const/16 v0, 0x64

    return v0

    .line 207
    :pswitch_17
    const/16 v0, 0x67

    return v0

    .line 204
    :pswitch_18
    const/16 v0, 0x62

    return v0

    .line 201
    :pswitch_19
    const/16 v0, 0x61

    return v0

    .line 198
    :pswitch_1a
    const/16 v0, 0x57

    return v0

    .line 195
    :pswitch_1b
    const/16 v0, 0x59

    return v0

    .line 192
    :pswitch_1c
    const/16 v0, 0x43

    return v0

    .line 189
    :pswitch_1d
    const/16 v0, 0x46

    return v0

    .line 186
    :pswitch_1e
    const/16 v0, 0x55

    return v0

    .line 183
    :pswitch_1f
    const/16 v0, 0x54

    return v0

    .line 180
    :pswitch_20
    const/16 v0, 0x53

    return v0

    .line 177
    :pswitch_21
    const/16 v0, 0x52

    return v0

    .line 174
    :pswitch_22
    const/16 v0, 0x50

    return v0

    .line 171
    :pswitch_23
    const/16 v0, 0x4f

    return v0

    .line 168
    :pswitch_24
    const/16 v0, 0x58

    return v0

    .line 165
    :pswitch_25
    const/16 v0, 0x4e

    return v0

    .line 162
    :pswitch_26
    const/16 v0, 0x4d

    return v0

    .line 159
    :pswitch_27
    const/16 v0, 0x4c

    return v0

    .line 156
    :pswitch_28
    const/16 v0, 0x4b

    return v0

    .line 153
    :pswitch_29
    const/16 v0, 0x49

    return v0

    .line 150
    :pswitch_2a
    const/16 v0, 0x51

    return v0

    .line 147
    :pswitch_2b
    const/16 v0, 0x48

    return v0

    .line 144
    :pswitch_2c
    const/16 v0, 0x5a

    return v0

    .line 141
    :pswitch_2d
    const/16 v0, 0x45

    return v0

    .line 138
    :pswitch_2e
    const/16 v0, 0x44

    return v0

    .line 135
    :pswitch_2f
    const/16 v0, 0x47

    return v0

    .line 132
    :pswitch_30
    const/16 v0, 0x42

    return v0

    .line 129
    :pswitch_31
    const/16 v0, 0x41

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x391
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_0
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static toGreekAlphabetNumber(IZ)Ljava/lang/String;
    .locals 1
    .param p0, "number"    # I
    .param p1, "upperCase"    # Z

    .line 87
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/itextpdf/kernel/numbering/GreekAlphabetNumbering;->toGreekAlphabetNumber(IZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toGreekAlphabetNumber(IZZ)Ljava/lang/String;
    .locals 4
    .param p0, "number"    # I
    .param p1, "upperCase"    # Z
    .param p2, "symbolFont"    # Z

    .line 107
    if-eqz p1, :cond_0

    invoke-static {p0}, Lcom/itextpdf/kernel/numbering/GreekAlphabetNumbering;->toGreekAlphabetNumberUpperCase(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Lcom/itextpdf/kernel/numbering/GreekAlphabetNumbering;->toGreekAlphabetNumberLowerCase(I)Ljava/lang/String;

    move-result-object v0

    .line 108
    .local v0, "result":Ljava/lang/String;
    :goto_0
    if-eqz p2, :cond_2

    .line 109
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 110
    .local v1, "symbolFontStr":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 111
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lcom/itextpdf/kernel/numbering/GreekAlphabetNumbering;->getSymbolFontChar(C)C

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 110
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 113
    .end local v2    # "i":I
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 115
    .end local v1    # "symbolFontStr":Ljava/lang/StringBuilder;
    :cond_2
    return-object v0
.end method

.method public static toGreekAlphabetNumberLowerCase(I)Ljava/lang/String;
    .locals 1
    .param p0, "number"    # I

    .line 59
    sget-object v0, Lcom/itextpdf/kernel/numbering/GreekAlphabetNumbering;->ALPHABET_LOWERCASE:[C

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/numbering/AlphabetNumbering;->toAlphabetNumber(I[C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toGreekAlphabetNumberUpperCase(I)Ljava/lang/String;
    .locals 1
    .param p0, "number"    # I

    .line 72
    sget-object v0, Lcom/itextpdf/kernel/numbering/GreekAlphabetNumbering;->ALPHABET_UPPERCASE:[C

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/numbering/AlphabetNumbering;->toAlphabetNumber(I[C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
