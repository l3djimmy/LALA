.class public Lcom/itextpdf/io/font/FontProgramDescriptor;
.super Ljava/lang/Object;
.source "FontProgramDescriptor.java"


# static fields
.field private static final TT_FAMILY_ORDER:[Ljava/lang/String;


# instance fields
.field private final familyName2LowerCase:Ljava/lang/String;

.field private final familyNameEnglishOpenType:Ljava/lang/String;

.field private final familyNameLowerCase:Ljava/lang/String;

.field private final fontName:Ljava/lang/String;

.field private final fontNameLowerCase:Ljava/lang/String;

.field private final fullNameLowerCase:Ljava/lang/String;

.field private final fullNamesAllLangs:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final fullNamesEnglishOpenType:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final isMonospace:Z

.field private final italicAngle:F

.field private final macStyle:I

.field private final style:Ljava/lang/String;

.field private final weight:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 56
    const/16 v0, 0xc

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "3"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v3, "1"

    aput-object v3, v0, v1

    const/4 v1, 0x2

    const-string v4, "1033"

    aput-object v4, v0, v1

    const/4 v1, 0x3

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v5, "0"

    aput-object v5, v0, v1

    const/4 v1, 0x5

    aput-object v4, v0, v1

    const/4 v1, 0x6

    aput-object v3, v0, v1

    const/4 v1, 0x7

    aput-object v5, v0, v1

    const/16 v1, 0x8

    aput-object v5, v0, v1

    const/16 v1, 0x9

    aput-object v5, v0, v1

    const/16 v1, 0xa

    aput-object v2, v0, v1

    const/16 v1, 0xb

    aput-object v5, v0, v1

    sput-object v0, Lcom/itextpdf/io/font/FontProgramDescriptor;->TT_FAMILY_ORDER:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Lcom/itextpdf/io/font/FontNames;FZ)V
    .locals 4
    .param p1, "fontNames"    # Lcom/itextpdf/io/font/FontNames;
    .param p2, "italicAngle"    # F
    .param p3, "isMonospace"    # Z

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    invoke-virtual {p1}, Lcom/itextpdf/io/font/FontNames;->getFontName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->fontName:Ljava/lang/String;

    .line 65
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->fontName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->fontNameLowerCase:Ljava/lang/String;

    .line 66
    invoke-virtual {p1}, Lcom/itextpdf/io/font/FontNames;->getFullName()[[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const/4 v2, 0x3

    aget-object v0, v0, v2

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->fullNameLowerCase:Ljava/lang/String;

    .line 67
    invoke-virtual {p1}, Lcom/itextpdf/io/font/FontNames;->getFamilyName()[[Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/itextpdf/io/font/FontNames;->getFamilyName()[[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {p1}, Lcom/itextpdf/io/font/FontNames;->getFamilyName()[[Ljava/lang/String;

    move-result-object v0

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v3

    :goto_0
    iput-object v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->familyNameLowerCase:Ljava/lang/String;

    .line 72
    invoke-virtual {p1}, Lcom/itextpdf/io/font/FontNames;->getFamilyName2()[[Ljava/lang/String;

    move-result-object v0

    .line 73
    .local v0, "familyName2":[[Ljava/lang/String;
    if-eqz v0, :cond_1

    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aget-object v1, v0, v1

    aget-object v1, v1, v2

    if-eqz v1, :cond_1

    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aget-object v1, v0, v1

    aget-object v1, v1, v2

    .line 74
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    :cond_1
    nop

    :goto_1
    iput-object v3, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->familyName2LowerCase:Ljava/lang/String;

    .line 75
    invoke-virtual {p1}, Lcom/itextpdf/io/font/FontNames;->getStyle()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->style:Ljava/lang/String;

    .line 76
    invoke-virtual {p1}, Lcom/itextpdf/io/font/FontNames;->getFontWeight()I

    move-result v1

    iput v1, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->weight:I

    .line 77
    invoke-virtual {p1}, Lcom/itextpdf/io/font/FontNames;->getMacStyle()I

    move-result v1

    iput v1, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->macStyle:I

    .line 78
    iput p2, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->italicAngle:F

    .line 79
    iput-boolean p3, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->isMonospace:Z

    .line 80
    invoke-direct {p0, p1}, Lcom/itextpdf/io/font/FontProgramDescriptor;->extractFamilyNameEnglishOpenType(Lcom/itextpdf/io/font/FontNames;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->familyNameEnglishOpenType:Ljava/lang/String;

    .line 81
    invoke-direct {p0, p1}, Lcom/itextpdf/io/font/FontProgramDescriptor;->extractFullFontNames(Lcom/itextpdf/io/font/FontNames;)Ljava/util/Set;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->fullNamesAllLangs:Ljava/util/Set;

    .line 82
    invoke-direct {p0, p1}, Lcom/itextpdf/io/font/FontProgramDescriptor;->extractFullNamesEnglishOpenType(Lcom/itextpdf/io/font/FontNames;)Ljava/util/Set;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->fullNamesEnglishOpenType:Ljava/util/Set;

    .line 83
    return-void
.end method

.method constructor <init>(Lcom/itextpdf/io/font/FontNames;Lcom/itextpdf/io/font/FontMetrics;)V
    .locals 2
    .param p1, "fontNames"    # Lcom/itextpdf/io/font/FontNames;
    .param p2, "fontMetrics"    # Lcom/itextpdf/io/font/FontMetrics;

    .line 86
    invoke-virtual {p2}, Lcom/itextpdf/io/font/FontMetrics;->getItalicAngle()F

    move-result v0

    invoke-virtual {p2}, Lcom/itextpdf/io/font/FontMetrics;->isFixedPitch()Z

    move-result v1

    invoke-direct {p0, p1, v0, v1}, Lcom/itextpdf/io/font/FontProgramDescriptor;-><init>(Lcom/itextpdf/io/font/FontNames;FZ)V

    .line 87
    return-void
.end method

.method private extractFamilyNameEnglishOpenType(Lcom/itextpdf/io/font/FontNames;)Ljava/lang/String;
    .locals 8
    .param p1, "fontNames"    # Lcom/itextpdf/io/font/FontNames;

    .line 152
    invoke-virtual {p1}, Lcom/itextpdf/io/font/FontNames;->getFamilyName()[[Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 153
    const/4 v0, 0x0

    .local v0, "k":I
    :goto_0
    sget-object v1, Lcom/itextpdf/io/font/FontProgramDescriptor;->TT_FAMILY_ORDER:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 154
    invoke-virtual {p1}, Lcom/itextpdf/io/font/FontNames;->getFamilyName()[[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_1
    if-ge v4, v2, :cond_1

    aget-object v5, v1, v4

    .line 155
    .local v5, "name":[Ljava/lang/String;
    sget-object v6, Lcom/itextpdf/io/font/FontProgramDescriptor;->TT_FAMILY_ORDER:[Ljava/lang/String;

    aget-object v6, v6, v0

    aget-object v7, v5, v3

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    sget-object v6, Lcom/itextpdf/io/font/FontProgramDescriptor;->TT_FAMILY_ORDER:[Ljava/lang/String;

    add-int/lit8 v7, v0, 0x1

    aget-object v6, v6, v7

    const/4 v7, 0x1

    aget-object v7, v5, v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    sget-object v6, Lcom/itextpdf/io/font/FontProgramDescriptor;->TT_FAMILY_ORDER:[Ljava/lang/String;

    add-int/lit8 v7, v0, 0x2

    aget-object v6, v6, v7

    const/4 v7, 0x2

    aget-object v7, v5, v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 156
    const/4 v1, 0x3

    aget-object v1, v5, v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 154
    .end local v5    # "name":[Ljava/lang/String;
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 153
    :cond_1
    add-int/lit8 v0, v0, 0x3

    goto :goto_0

    .line 161
    .end local v0    # "k":I
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method

.method private extractFullFontNames(Lcom/itextpdf/io/font/FontNames;)Ljava/util/Set;
    .locals 6
    .param p1, "fontNames"    # Lcom/itextpdf/io/font/FontNames;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/font/FontNames;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 145
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 146
    .local v0, "uniqueFullNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual {p1}, Lcom/itextpdf/io/font/FontNames;->getFullName()[[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    .line 147
    .local v4, "fullName":[Ljava/lang/String;
    const/4 v5, 0x3

    aget-object v5, v4, v5

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 146
    .end local v4    # "fullName":[Ljava/lang/String;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 148
    :cond_0
    return-object v0
.end method

.method private extractFullNamesEnglishOpenType(Lcom/itextpdf/io/font/FontNames;)Ljava/util/Set;
    .locals 9
    .param p1, "fontNames"    # Lcom/itextpdf/io/font/FontNames;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/font/FontNames;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 165
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->familyNameEnglishOpenType:Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 166
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 167
    .local v0, "uniqueTtfSuitableFullNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual {p1}, Lcom/itextpdf/io/font/FontNames;->getFullName()[[Ljava/lang/String;

    move-result-object v1

    .line 168
    .local v1, "names":[[Ljava/lang/String;
    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_2

    aget-object v5, v1, v4

    .line 169
    .local v5, "name":[Ljava/lang/String;
    const/4 v6, 0x0

    .local v6, "k":I
    :goto_1
    sget-object v7, Lcom/itextpdf/io/font/FontProgramDescriptor;->TT_FAMILY_ORDER:[Ljava/lang/String;

    array-length v7, v7

    if-ge v6, v7, :cond_1

    .line 170
    sget-object v7, Lcom/itextpdf/io/font/FontProgramDescriptor;->TT_FAMILY_ORDER:[Ljava/lang/String;

    aget-object v7, v7, v6

    aget-object v8, v5, v3

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    sget-object v7, Lcom/itextpdf/io/font/FontProgramDescriptor;->TT_FAMILY_ORDER:[Ljava/lang/String;

    add-int/lit8 v8, v6, 0x1

    aget-object v7, v7, v8

    const/4 v8, 0x1

    aget-object v8, v5, v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    sget-object v7, Lcom/itextpdf/io/font/FontProgramDescriptor;->TT_FAMILY_ORDER:[Ljava/lang/String;

    add-int/lit8 v8, v6, 0x2

    aget-object v7, v7, v8

    const/4 v8, 0x2

    aget-object v8, v5, v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 171
    const/4 v7, 0x3

    aget-object v7, v5, v7

    invoke-interface {v0, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 172
    goto :goto_2

    .line 169
    :cond_0
    add-int/lit8 v6, v6, 0x3

    goto :goto_1

    .line 168
    .end local v5    # "name":[Ljava/lang/String;
    .end local v6    # "k":I
    :cond_1
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 176
    :cond_2
    return-object v0

    .line 178
    .end local v0    # "uniqueTtfSuitableFullNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v1    # "names":[[Ljava/lang/String;
    :cond_3
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    return-object v0
.end method


# virtual methods
.method public getFamilyName2LowerCase()Ljava/lang/String;
    .locals 1

    .line 135
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->familyName2LowerCase:Ljava/lang/String;

    return-object v0
.end method

.method getFamilyNameEnglishOpenType()Ljava/lang/String;
    .locals 1

    .line 142
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->familyNameEnglishOpenType:Ljava/lang/String;

    return-object v0
.end method

.method public getFamilyNameLowerCase()Ljava/lang/String;
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->familyNameLowerCase:Ljava/lang/String;

    return-object v0
.end method

.method public getFontName()Ljava/lang/String;
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->fontName:Ljava/lang/String;

    return-object v0
.end method

.method public getFontNameLowerCase()Ljava/lang/String;
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->fontNameLowerCase:Ljava/lang/String;

    return-object v0
.end method

.method public getFontWeight()I
    .locals 1

    .line 98
    iget v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->weight:I

    return v0
.end method

.method public getFullNameAllLangs()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 138
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->fullNamesAllLangs:Ljava/util/Set;

    return-object v0
.end method

.method public getFullNameLowerCase()Ljava/lang/String;
    .locals 1

    .line 118
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->fullNameLowerCase:Ljava/lang/String;

    return-object v0
.end method

.method public getFullNamesEnglishOpenType()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 140
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->fullNamesEnglishOpenType:Ljava/util/Set;

    return-object v0
.end method

.method public getItalicAngle()F
    .locals 1

    .line 102
    iget v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->italicAngle:F

    return v0
.end method

.method public getStyle()Ljava/lang/String;
    .locals 1

    .line 94
    iget-object v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->style:Ljava/lang/String;

    return-object v0
.end method

.method public isBold()Z
    .locals 2

    .line 110
    iget v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->macStyle:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isItalic()Z
    .locals 1

    .line 114
    iget v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->macStyle:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isMonospace()Z
    .locals 1

    .line 106
    iget-boolean v0, p0, Lcom/itextpdf/io/font/FontProgramDescriptor;->isMonospace:Z

    return v0
.end method
