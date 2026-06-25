.class public Lcom/itextpdf/kernel/font/PdfType0Font;
.super Lcom/itextpdf/kernel/font/PdfFont;
.source "PdfType0Font.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field protected static final CID_FONT_TYPE_0:I = 0x0

.field protected static final CID_FONT_TYPE_2:I = 0x2

.field private static final DEFAULT_ENCODING:Ljava/lang/String; = ""

.field private static final MAX_CID_CODE_LENGTH:I = 0x4

.field private static final rotbits:[B


# instance fields
.field protected cidFontType:I

.field protected cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

.field private final embeddedToUnicode:Lcom/itextpdf/io/font/cmap/CMapToUnicode;

.field protected specificUnicodeDifferences:[C

.field protected usedGlyphs:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected vertical:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 69
    nop

    .line 80
    const/16 v0, 0x8

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/kernel/font/PdfType0Font;->rotbits:[B

    return-void

    nop

    :array_0
    .array-data 1
        -0x80t
        0x40t
        0x20t
        0x10t
        0x8t
        0x4t
        0x2t
        0x1t
    .end array-data
.end method

.method constructor <init>(Lcom/itextpdf/io/font/CidFont;Ljava/lang/String;)V
    .locals 2
    .param p1, "font"    # Lcom/itextpdf/io/font/CidFont;
    .param p2, "cmap"    # Ljava/lang/String;

    .line 133
    invoke-direct {p0}, Lcom/itextpdf/kernel/font/PdfFont;-><init>()V

    .line 134
    invoke-virtual {p1}, Lcom/itextpdf/io/font/CidFont;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontNames;->getFontName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/itextpdf/io/font/CidFontProperties;->isCidFont(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 138
    iput-object p1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    .line 139
    const-string v0, "V"

    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->vertical:Z

    .line 140
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgram;->getRegistry()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getCompatibleUniMap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 141
    .local v0, "uniMap":Ljava/lang/String;
    new-instance v1, Lcom/itextpdf/io/font/CMapEncoding;

    invoke-direct {v1, p2, v0}, Lcom/itextpdf/io/font/CMapEncoding;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    .line 142
    new-instance v1, Ljava/util/TreeSet;

    invoke-direct {v1}, Ljava/util/TreeSet;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->usedGlyphs:Ljava/util/Set;

    .line 143
    const/4 v1, 0x0

    iput v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cidFontType:I

    .line 144
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->embeddedToUnicode:Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    .line 145
    return-void

    .line 135
    .end local v0    # "uniMap":Ljava/lang/String;
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Font {0} with {1} encoding is not a cjk font."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    .line 136
    invoke-virtual {p1}, Lcom/itextpdf/io/font/CidFont;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontNames;->getFontName()Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1, p2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v0

    throw v0
.end method

.method constructor <init>(Lcom/itextpdf/io/font/TrueTypeFont;Ljava/lang/String;)V
    .locals 7
    .param p1, "ttf"    # Lcom/itextpdf/io/font/TrueTypeFont;
    .param p2, "cmap"    # Ljava/lang/String;

    .line 100
    invoke-direct {p0}, Lcom/itextpdf/kernel/font/PdfFont;-><init>()V

    .line 101
    const-string v0, "Identity-H"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "Identity-V"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 102
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Only Identity CMaps supports with truetype"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 105
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/io/font/TrueTypeFont;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontNames;->allowEmbedding()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 109
    iput-object p1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    .line 110
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->embedded:Z

    .line 111
    const-string v1, "V"

    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->vertical:Z

    .line 112
    new-instance v1, Lcom/itextpdf/io/font/CMapEncoding;

    invoke-direct {v1, p2}, Lcom/itextpdf/io/font/CMapEncoding;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    .line 113
    new-instance v1, Ljava/util/TreeSet;

    invoke-direct {v1}, Ljava/util/TreeSet;-><init>()V

    iput-object v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->usedGlyphs:Ljava/util/Set;

    .line 114
    const/4 v1, 0x2

    iput v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cidFontType:I

    .line 115
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->embeddedToUnicode:Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    .line 116
    invoke-virtual {p1}, Lcom/itextpdf/io/font/TrueTypeFont;->isFontSpecific()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 117
    const/16 v2, 0x100

    new-array v3, v2, [C

    iput-object v3, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->specificUnicodeDifferences:[C

    .line 118
    new-array v0, v0, [B

    .line 119
    .local v0, "bytes":[B
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_1
    if-ge v3, v2, :cond_3

    .line 120
    int-to-byte v4, v3

    const/4 v5, 0x0

    aput-byte v4, v0, v5

    .line 121
    invoke-static {v0, v1}, Lcom/itextpdf/io/font/PdfEncodings;->convertToString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 122
    .local v4, "s":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_2

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    goto :goto_2

    :cond_2
    const/16 v5, 0x3f

    .line 123
    .local v5, "ch":C
    :goto_2
    iget-object v6, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->specificUnicodeDifferences:[C

    aput-char v5, v6, v3

    .line 119
    .end local v4    # "s":Ljava/lang/String;
    .end local v5    # "ch":C
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 126
    .end local v0    # "bytes":[B
    .end local v3    # "k":I
    :cond_3
    return-void

    .line 106
    :cond_4
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string/jumbo v1, "{0} cannot be embedded due to licensing restrictions."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    invoke-virtual {p1}, Lcom/itextpdf/io/font/TrueTypeFont;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/io/font/FontNames;->getFontName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/itextpdf/io/font/TrueTypeFont;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/io/font/FontNames;->getStyle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v0

    throw v0
.end method

.method constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 12
    .param p1, "fontDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 148
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/font/PdfFont;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 149
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->newFont:Z

    .line 150
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->DescendantFonts:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 151
    .local v1, "cidFont":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Encoding:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    .line 153
    .local v2, "cmap":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-static {v1}, Lcom/itextpdf/kernel/font/PdfType0Font;->getOrdering(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/lang/String;

    move-result-object v3

    .line 154
    .local v3, "ordering":Ljava/lang/String;
    if-eqz v3, :cond_c

    .line 158
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->ToUnicode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    .line 159
    .local v4, "toUnicode":Lcom/itextpdf/kernel/pdf/PdfObject;
    const/4 v5, 0x0

    if-nez v4, :cond_0

    .line 160
    invoke-static {v3}, Lcom/itextpdf/kernel/font/FontUtil;->parseUniversalToUnicodeCMap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    move-result-object v6

    .line 161
    .local v6, "toUnicodeCMap":Lcom/itextpdf/io/font/cmap/CMapToUnicode;
    iput-object v5, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->embeddedToUnicode:Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    goto :goto_0

    .line 163
    .end local v6    # "toUnicodeCMap":Lcom/itextpdf/io/font/cmap/CMapToUnicode;
    :cond_0
    invoke-static {v4}, Lcom/itextpdf/kernel/font/FontUtil;->processToUnicode(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    move-result-object v6

    .line 164
    .restart local v6    # "toUnicodeCMap":Lcom/itextpdf/io/font/cmap/CMapToUnicode;
    iput-object v6, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->embeddedToUnicode:Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    .line 167
    :goto_0
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfObject;->isName()Z

    move-result v7

    const/4 v8, 0x1

    if-eqz v7, :cond_5

    const-string v7, "Identity-H"

    if-nez v6, :cond_1

    move-object v9, v2

    check-cast v9, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    move-object v9, v2

    check-cast v9, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 168
    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v9

    const-string v10, "Identity-V"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 170
    :cond_1
    if-nez v6, :cond_2

    .line 171
    move-object v9, v2

    check-cast v9, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v9}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    invoke-static {v3, v9}, Lcom/itextpdf/kernel/font/PdfType0Font;->getUniMapFromOrdering(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v9

    .line 172
    .local v9, "uniMap":Ljava/lang/String;
    invoke-static {v9}, Lcom/itextpdf/kernel/font/FontUtil;->getToUnicodeFromUniMap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    move-result-object v6

    .line 173
    if-nez v6, :cond_2

    .line 174
    invoke-static {v7}, Lcom/itextpdf/kernel/font/FontUtil;->getToUnicodeFromUniMap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    move-result-object v6

    .line 175
    const-class v7, Lcom/itextpdf/kernel/font/PdfType0Font;

    invoke-static {v7}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v7

    .line 176
    .local v7, "logger":Lorg/slf4j/Logger;
    const-string v10, "Unknown CMap {0}"

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v7, v10}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 179
    .end local v7    # "logger":Lorg/slf4j/Logger;
    .end local v9    # "uniMap":Ljava/lang/String;
    :cond_2
    invoke-static {v1, v6}, Lcom/itextpdf/kernel/font/DocTrueTypeFont;->createFontProgram(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/io/font/cmap/CMapToUnicode;)Lcom/itextpdf/io/font/TrueTypeFont;

    move-result-object v7

    iput-object v7, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    .line 180
    invoke-static {v2, v5}, Lcom/itextpdf/kernel/font/PdfType0Font;->createCMap(Lcom/itextpdf/kernel/pdf/PdfObject;Ljava/lang/String;)Lcom/itextpdf/io/font/CMapEncoding;

    move-result-object v5

    iput-object v5, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    .line 181
    iget-object v5, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    instance-of v5, v5, Lcom/itextpdf/kernel/font/IDocFontProgram;

    if-eqz v5, :cond_4

    .line 182
    iget-object v5, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    check-cast v5, Lcom/itextpdf/kernel/font/IDocFontProgram;

    invoke-interface {v5}, Lcom/itextpdf/kernel/font/IDocFontProgram;->getFontFile()Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v5

    if-eqz v5, :cond_3

    goto :goto_1

    :cond_3
    move v8, v0

    :goto_1
    iput-boolean v8, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->embedded:Z

    goto :goto_4

    .line 181
    :cond_4
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 184
    :cond_5
    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->BaseFont:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v7

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v7

    .line 185
    .local v7, "cidFontName":Ljava/lang/String;
    invoke-static {v3, v8}, Lcom/itextpdf/kernel/font/PdfType0Font;->getUniMapFromOrdering(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v8

    .line 186
    .local v8, "uniMap":Ljava/lang/String;
    if-eqz v8, :cond_6

    const-string v9, "Uni"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6

    invoke-static {v7, v8}, Lcom/itextpdf/io/font/CidFontProperties;->isCidFont(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 188
    :try_start_0
    invoke-static {v7}, Lcom/itextpdf/io/font/FontProgramFactory;->createFont(Ljava/lang/String;)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v9

    iput-object v9, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    .line 189
    invoke-static {v2, v8}, Lcom/itextpdf/kernel/font/PdfType0Font;->createCMap(Lcom/itextpdf/kernel/pdf/PdfObject;Ljava/lang/String;)Lcom/itextpdf/io/font/CMapEncoding;

    move-result-object v9

    iput-object v9, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    .line 190
    iput-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->embedded:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 191
    :catch_0
    move-exception v9

    .line 192
    .local v9, "ignored":Ljava/io/IOException;
    iput-object v5, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    .line 193
    iput-object v5, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    .line 194
    .end local v9    # "ignored":Ljava/io/IOException;
    :goto_2
    goto :goto_3

    .line 196
    :cond_6
    if-nez v6, :cond_7

    .line 197
    invoke-static {v8}, Lcom/itextpdf/kernel/font/FontUtil;->getToUnicodeFromUniMap(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    move-result-object v6

    .line 199
    :cond_7
    if-eqz v6, :cond_8

    .line 200
    invoke-static {v1, v6}, Lcom/itextpdf/kernel/font/DocTrueTypeFont;->createFontProgram(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/io/font/cmap/CMapToUnicode;)Lcom/itextpdf/io/font/TrueTypeFont;

    move-result-object v5

    iput-object v5, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    .line 201
    invoke-static {v2, v8}, Lcom/itextpdf/kernel/font/PdfType0Font;->createCMap(Lcom/itextpdf/kernel/pdf/PdfObject;Ljava/lang/String;)Lcom/itextpdf/io/font/CMapEncoding;

    move-result-object v5

    iput-object v5, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    .line 204
    :cond_8
    :goto_3
    iget-object v5, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    if-eqz v5, :cond_b

    .line 212
    .end local v7    # "cidFontName":Ljava/lang/String;
    .end local v8    # "uniMap":Ljava/lang/String;
    :goto_4
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->DescendantFonts:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v5

    invoke-virtual {v5, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v5

    .line 214
    .local v5, "cidFontDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v7

    .line 215
    .local v7, "subtype":Lcom/itextpdf/kernel/pdf/PdfName;
    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->CIDFontType0:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v8, v7}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 216
    iput v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cidFontType:I

    goto :goto_5

    .line 217
    :cond_9
    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->CIDFontType2:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v8, v7}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 218
    const/4 v8, 0x2

    iput v8, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cidFontType:I

    goto :goto_5

    .line 220
    :cond_a
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-static {v8}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v8

    const-string v9, "Failed to determine CIDFont subtype. The type of CIDFont shall be CIDFontType0 or CIDFontType2."

    invoke-interface {v8, v9}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 222
    :goto_5
    new-instance v8, Ljava/util/TreeSet;

    invoke-direct {v8}, Ljava/util/TreeSet;-><init>()V

    iput-object v8, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->usedGlyphs:Ljava/util/Set;

    .line 223
    iput-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->subset:Z

    .line 224
    return-void

    .line 205
    .end local v5    # "cidFontDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v7, "cidFontName":Ljava/lang/String;
    .restart local v8    # "uniMap":Ljava/lang/String;
    :cond_b
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v5, "Cannot recognise document font {0} with {1} encoding"

    filled-new-array {v7, v2}, [Ljava/lang/Object;

    move-result-object v9

    invoke-static {v5, v9}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 155
    .end local v4    # "toUnicode":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v6    # "toUnicodeCMap":Lcom/itextpdf/io/font/cmap/CMapToUnicode;
    .end local v7    # "cidFontName":Ljava/lang/String;
    .end local v8    # "uniMap":Ljava/lang/String;
    :cond_c
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v4, "Ordering should be determined for CIDFont of Type0 font."

    invoke-direct {v0, v4}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private appendUniGlyphs(Ljava/lang/String;IILjava/util/List;)I
    .locals 6
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "from"    # I
    .param p3, "to"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;)I"
        }
    .end annotation

    .line 518
    .local p4, "glyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    const/4 v0, 0x0

    .line 519
    .local v0, "processed":I
    move v1, p2

    .local v1, "k":I
    :goto_0
    if-gt v1, p3, :cond_2

    .line 521
    move v2, v0

    .line 522
    .local v2, "currentlyProcessed":I
    invoke-static {p1, v1}, Lcom/itextpdf/io/util/TextUtil;->isSurrogatePair(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 523
    invoke-static {p1, v1}, Lcom/itextpdf/io/util/TextUtil;->convertToUtf32(Ljava/lang/String;I)I

    move-result v3

    .line 524
    .local v3, "val":I
    add-int/lit8 v0, v0, 0x2

    .line 526
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 528
    .end local v3    # "val":I
    :cond_0
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 529
    .restart local v3    # "val":I
    add-int/lit8 v0, v0, 0x1

    .line 531
    :goto_1
    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/font/PdfType0Font;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v4

    .line 532
    .local v4, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-direct {p0, v4}, Lcom/itextpdf/kernel/font/PdfType0Font;->isAppendableGlyph(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 533
    invoke-interface {p4, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 519
    .end local v2    # "currentlyProcessed":I
    .end local v3    # "val":I
    .end local v4    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 535
    .restart local v2    # "currentlyProcessed":I
    .restart local v3    # "val":I
    .restart local v4    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_1
    move v0, v2

    .line 536
    nop

    .line 539
    .end local v1    # "k":I
    .end local v2    # "currentlyProcessed":I
    .end local v3    # "val":I
    .end local v4    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_2
    return v0
.end method

.method private static bytesToLong([B)J
    .locals 6
    .param p0, "bytes"    # [B

    .line 763
    const-wide/16 v0, 0x0

    .line 764
    .local v0, "res":J
    const/4 v2, 0x0

    .line 765
    .local v2, "shift":I
    array-length v3, p0

    add-int/lit8 v3, v3, -0x1

    .local v3, "i":I
    :goto_0
    if-ltz v3, :cond_0

    .line 766
    aget-byte v4, p0, v3

    and-int/lit16 v4, v4, 0xff

    shl-int/2addr v4, v2

    int-to-long v4, v4

    add-long/2addr v0, v4

    .line 767
    add-int/lit8 v2, v2, 0x8

    .line 765
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 770
    .end local v3    # "i":I
    :cond_0
    return-wide v0
.end method

.method private static containsCodeInCodeSpaceRange(Ljava/util/List;II)Z
    .locals 10
    .param p1, "code"    # I
    .param p2, "length"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[B>;II)Z"
        }
    .end annotation

    .line 747
    .local p0, "codeSpaceRanges":Ljava/util/List;, "Ljava/util/List<[B>;"
    and-int/lit8 v0, p1, -0x1

    int-to-long v0, v0

    .line 748
    .local v0, "unsignedCode":J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 749
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    array-length v3, v3

    if-ne p2, v3, :cond_0

    .line 750
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    .line 751
    .local v3, "low":[B
    add-int/lit8 v4, v2, 0x1

    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    .line 752
    .local v4, "high":[B
    invoke-static {v3}, Lcom/itextpdf/kernel/font/PdfType0Font;->bytesToLong([B)J

    move-result-wide v5

    .line 753
    .local v5, "lowValue":J
    invoke-static {v4}, Lcom/itextpdf/kernel/font/PdfType0Font;->bytesToLong([B)J

    move-result-wide v7

    .line 754
    .local v7, "highValue":J
    cmp-long v9, v0, v5

    if-ltz v9, :cond_0

    cmp-long v9, v0, v7

    if-gtz v9, :cond_0

    .line 755
    const/4 v9, 0x1

    return v9

    .line 748
    .end local v3    # "low":[B
    .end local v4    # "high":[B
    .end local v5    # "lowValue":J
    .end local v7    # "highValue":J
    :cond_0
    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    .line 759
    .end local v2    # "i":I
    :cond_1
    const/4 v2, 0x0

    return v2
.end method

.method private converToBytesUsingEncoder(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;)[B
    .locals 8
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "encoder"    # Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    .line 342
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 343
    .local v0, "stream":Ljava/io/ByteArrayOutputStream;
    invoke-static {p1}, Lcom/itextpdf/io/util/TextUtil;->convertToUtf32(Ljava/lang/String;)[I

    move-result-object v1

    .line 344
    .local v1, "codePoints":[I
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget v4, v1, v3

    .line 346
    .local v4, "cp":I
    :try_start_0
    invoke-virtual {p2, v4}, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;->encodeUnicodeCodePoint(I)[B

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 347
    invoke-virtual {p0, v4}, Lcom/itextpdf/kernel/font/PdfType0Font;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v5

    .line 348
    .local v5, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v5}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v6

    if-lez v6, :cond_0

    .line 349
    iget-object v6, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->usedGlyphs:Ljava/util/Set;

    invoke-virtual {v5}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 354
    .end local v5    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_0
    nop

    .line 344
    .end local v4    # "cp":I
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 351
    .restart local v4    # "cp":I
    :catch_0
    move-exception v2

    .line 353
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Lcom/itextpdf/commons/exceptions/ITextException;

    invoke-direct {v3, v2}, Lcom/itextpdf/commons/exceptions/ITextException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 356
    .end local v2    # "e":Ljava/io/IOException;
    .end local v4    # "cp":I
    :cond_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2
.end method

.method private convertToBytes(Lcom/itextpdf/io/font/otf/Glyph;Lcom/itextpdf/io/source/ByteBuffer;)V
    .locals 3
    .param p1, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;
    .param p2, "result"    # Lcom/itextpdf/io/source/ByteBuffer;

    .line 734
    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v0

    .line 735
    .local v0, "code":I
    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->usedGlyphs:Ljava/util/Set;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 736
    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    invoke-virtual {v1, v0, p2}, Lcom/itextpdf/io/font/CMapEncoding;->fillCmapBytes(ILcom/itextpdf/io/source/ByteBuffer;)V

    .line 737
    return-void
.end method

.method private convertToBytesUsingCMap(Ljava/lang/String;)[B
    .locals 7
    .param p1, "text"    # Ljava/lang/String;

    .line 299
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 300
    .local v0, "len":I
    new-instance v1, Lcom/itextpdf/io/source/ByteBuffer;

    invoke-direct {v1}, Lcom/itextpdf/io/source/ByteBuffer;-><init>()V

    .line 301
    .local v1, "buffer":Lcom/itextpdf/io/source/ByteBuffer;
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v2}, Lcom/itextpdf/io/font/FontProgram;->isFontSpecific()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 302
    const-string/jumbo v2, "symboltt"

    invoke-static {p1, v2}, Lcom/itextpdf/io/font/PdfEncodings;->convertToBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v2

    .line 303
    .local v2, "b":[B
    array-length v0, v2

    .line 304
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_0
    if-ge v3, v0, :cond_1

    .line 305
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    aget-byte v5, v2, v3

    and-int/lit16 v5, v5, 0xff

    invoke-virtual {v4, v5}, Lcom/itextpdf/io/font/FontProgram;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v4

    .line 306
    .local v4, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v4, :cond_0

    .line 307
    invoke-direct {p0, v4, v1}, Lcom/itextpdf/kernel/font/PdfType0Font;->convertToBytes(Lcom/itextpdf/io/font/otf/Glyph;Lcom/itextpdf/io/source/ByteBuffer;)V

    .line 304
    .end local v4    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 310
    .end local v2    # "b":[B
    .end local v3    # "k":I
    :cond_1
    goto :goto_4

    .line 311
    :cond_2
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_1
    if-ge v2, v0, :cond_5

    .line 313
    invoke-static {p1, v2}, Lcom/itextpdf/io/util/TextUtil;->isSurrogatePair(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 314
    invoke-static {p1, v2}, Lcom/itextpdf/io/util/TextUtil;->convertToUtf32(Ljava/lang/String;I)I

    move-result v3

    .line 315
    .local v3, "val":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 317
    .end local v3    # "val":I
    :cond_3
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 319
    .restart local v3    # "val":I
    :goto_2
    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/font/PdfType0Font;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v4

    .line 320
    .restart local v4    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v4}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v5

    if-lez v5, :cond_4

    .line 321
    invoke-direct {p0, v4, v1}, Lcom/itextpdf/kernel/font/PdfType0Font;->convertToBytes(Lcom/itextpdf/io/font/otf/Glyph;Lcom/itextpdf/io/source/ByteBuffer;)V

    goto :goto_3

    .line 324
    :cond_4
    iget-object v5, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lcom/itextpdf/io/font/CMapEncoding;->getCmapBytes(I)[B

    move-result-object v5

    invoke-virtual {v1, v5}, Lcom/itextpdf/io/source/ByteBuffer;->append([B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 311
    .end local v3    # "val":I
    .end local v4    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 328
    .end local v2    # "k":I
    :cond_5
    :goto_4
    invoke-virtual {v1}, Lcom/itextpdf/io/source/ByteBuffer;->toByteArray()[B

    move-result-object v2

    return-object v2
.end method

.method private static createCMap(Lcom/itextpdf/kernel/pdf/PdfObject;Ljava/lang/String;)Lcom/itextpdf/io/font/CMapEncoding;
    .locals 4
    .param p0, "cmap"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p1, "uniMap"    # Ljava/lang/String;

    .line 1029
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isStream()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1030
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 1031
    .local v0, "cmapStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes()[B

    move-result-object v1

    .line 1032
    .local v1, "cmapBytes":[B
    new-instance v2, Lcom/itextpdf/io/font/CMapEncoding;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->CMapName:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lcom/itextpdf/io/font/CMapEncoding;-><init>(Ljava/lang/String;[B)V

    return-object v2

    .line 1034
    .end local v0    # "cmapStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local v1    # "cmapBytes":[B
    :cond_0
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 1035
    .local v0, "cmapName":Ljava/lang/String;
    const-string v1, "Identity-H"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "Identity-V"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 1038
    :cond_1
    new-instance v1, Lcom/itextpdf/io/font/CMapEncoding;

    invoke-direct {v1, v0, p1}, Lcom/itextpdf/io/font/CMapEncoding;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    .line 1036
    :cond_2
    :goto_0
    new-instance v1, Lcom/itextpdf/io/font/CMapEncoding;

    invoke-direct {v1, v0}, Lcom/itextpdf/io/font/CMapEncoding;-><init>(Ljava/lang/String;)V

    return-object v1
.end method

.method private flushFontData()V
    .locals 11

    .line 774
    iget v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cidFontType:I

    const-string/jumbo v1, "{0}-{1}"

    if-nez v0, :cond_1

    .line 775
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Font:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 776
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Type0:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 777
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgram;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontNames;->getFontName()Ljava/lang/String;

    move-result-object v0

    .line 778
    .local v0, "name":Ljava/lang/String;
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v2}, Lcom/itextpdf/io/font/FontProgram;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/io/font/FontNames;->getStyle()Ljava/lang/String;

    move-result-object v2

    .line 779
    .local v2, "style":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 780
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 782
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->BaseFont:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v6, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    invoke-virtual {v6}, Lcom/itextpdf/io/font/CMapEncoding;->getCmapName()Ljava/lang/String;

    move-result-object v6

    filled-new-array {v0, v6}, [Ljava/lang/Object;

    move-result-object v6

    invoke-static {v1, v6}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v5, v1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 783
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Encoding:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v5, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    invoke-virtual {v5}, Lcom/itextpdf/io/font/CMapEncoding;->getCmapName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 784
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getFontDescriptor(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 785
    .local v1, "fontDescriptor":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    iget-object v3, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontProgram;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontNames;->getFontName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {p0, v1, v3, v4}, Lcom/itextpdf/kernel/font/PdfType0Font;->getCidFont(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/lang/String;Z)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v3

    .line 786
    .local v3, "cidFont":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->DescendantFonts:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v6, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v6, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    invoke-virtual {v4, v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 788
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->flush()V

    .line 789
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->flush()V

    .line 790
    .end local v0    # "name":Ljava/lang/String;
    .end local v1    # "fontDescriptor":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v2    # "style":Ljava/lang/String;
    .end local v3    # "cidFont":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    goto/16 :goto_5

    :cond_1
    iget v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cidFontType:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_b

    .line 791
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/TrueTypeFont;

    .line 792
    .local v0, "ttf":Lcom/itextpdf/io/font/TrueTypeFont;
    invoke-virtual {v0}, Lcom/itextpdf/io/font/TrueTypeFont;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/io/font/FontNames;->getFontName()Ljava/lang/String;

    move-result-object v2

    iget-boolean v3, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->subset:Z

    iget-boolean v4, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->embedded:Z

    invoke-static {v2, v3, v4}, Lcom/itextpdf/kernel/font/PdfType0Font;->updateSubsetPrefix(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v2

    .line 793
    .local v2, "fontName":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/font/PdfType0Font;->getFontDescriptor(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v3

    .line 796
    .local v3, "fontDescriptor":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->usedGlyphs:Ljava/util/Set;

    check-cast v4, Ljava/util/SortedSet;

    iget-boolean v5, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->subset:Z

    iget-object v6, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->subsetRanges:Ljava/util/List;

    invoke-virtual {v0, v4, v5, v6}, Lcom/itextpdf/io/font/TrueTypeFont;->updateUsedGlyphs(Ljava/util/SortedSet;ZLjava/util/List;)V

    .line 797
    invoke-virtual {v0}, Lcom/itextpdf/io/font/TrueTypeFont;->isCff()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 799
    iget-boolean v4, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->subset:Z

    if-eqz v4, :cond_2

    .line 800
    invoke-virtual {v0}, Lcom/itextpdf/io/font/TrueTypeFont;->getFontStreamBytes()[B

    move-result-object v4

    .line 801
    .local v4, "bytes":[B
    iget-object v5, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->usedGlyphs:Ljava/util/Set;

    invoke-virtual {v0, v5}, Lcom/itextpdf/io/font/TrueTypeFont;->mapGlyphsCidsToGids(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v5

    .line 802
    .local v5, "usedGids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    new-instance v6, Lcom/itextpdf/io/font/CFFFontSubset;

    invoke-direct {v6, v4, v5}, Lcom/itextpdf/io/font/CFFFontSubset;-><init>([BLjava/util/Set;)V

    invoke-virtual {v6}, Lcom/itextpdf/io/font/CFFFontSubset;->Process()[B

    move-result-object v4

    .line 803
    .end local v5    # "usedGids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .local v4, "cffBytes":[B
    goto :goto_0

    .line 804
    .end local v4    # "cffBytes":[B
    :cond_2
    invoke-virtual {v0}, Lcom/itextpdf/io/font/TrueTypeFont;->getFontStreamBytes()[B

    move-result-object v4

    .line 806
    .restart local v4    # "cffBytes":[B
    :goto_0
    array-length v5, v4

    filled-new-array {v5}, [I

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/itextpdf/kernel/font/PdfType0Font;->getPdfFontStream([B[I)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v5

    .line 807
    .local v5, "fontStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v7, Lcom/itextpdf/kernel/pdf/PdfName;

    const-string v8, "CIDFontType0C"

    invoke-direct {v7, v8}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v6, v7}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 809
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->BaseFont:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v8, Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v9, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    .line 810
    invoke-virtual {v9}, Lcom/itextpdf/io/font/CMapEncoding;->getCmapName()Ljava/lang/String;

    move-result-object v9

    filled-new-array {v2, v9}, [Ljava/lang/Object;

    move-result-object v9

    invoke-static {v1, v9}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v8, v1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    .line 809
    invoke-virtual {v6, v7, v8}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 811
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FontFile3:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v1, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 812
    .end local v4    # "cffBytes":[B
    goto :goto_2

    .line 813
    .end local v5    # "fontStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :cond_3
    const/4 v1, 0x0

    .line 815
    .local v1, "ttfBytes":[B
    iget-boolean v4, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->subset:Z

    if-nez v4, :cond_4

    invoke-virtual {v0}, Lcom/itextpdf/io/font/TrueTypeFont;->getDirectoryOffset()I

    move-result v4

    if-lez v4, :cond_5

    .line 817
    :cond_4
    :try_start_0
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->usedGlyphs:Ljava/util/Set;

    iget-boolean v5, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->subset:Z

    invoke-virtual {v0, v4, v5}, Lcom/itextpdf/io/font/TrueTypeFont;->getSubset(Ljava/util/Set;Z)[B

    move-result-object v4
    :try_end_0
    .catch Lcom/itextpdf/io/exceptions/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v4

    .line 822
    goto :goto_1

    .line 818
    :catch_0
    move-exception v4

    .line 819
    .local v4, "e":Lcom/itextpdf/io/exceptions/IOException;
    const-class v5, Lcom/itextpdf/kernel/font/PdfType0Font;

    invoke-static {v5}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v5

    .line 820
    .local v5, "logger":Lorg/slf4j/Logger;
    const-string v6, "Font subset issue. Full font will be embedded."

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 821
    const/4 v1, 0x0

    .line 824
    .end local v4    # "e":Lcom/itextpdf/io/exceptions/IOException;
    .end local v5    # "logger":Lorg/slf4j/Logger;
    :cond_5
    :goto_1
    if-nez v1, :cond_6

    .line 825
    invoke-virtual {v0}, Lcom/itextpdf/io/font/TrueTypeFont;->getFontStreamBytes()[B

    move-result-object v1

    .line 827
    :cond_6
    array-length v4, v1

    filled-new-array {v4}, [I

    move-result-object v4

    invoke-virtual {p0, v1, v4}, Lcom/itextpdf/kernel/font/PdfType0Font;->getPdfFontStream([B[I)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v5

    .line 828
    .local v5, "fontStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->BaseFont:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v7, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v7, v2}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v6, v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 829
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->FontFile2:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 834
    .end local v1    # "ttfBytes":[B
    :goto_2
    invoke-virtual {v0}, Lcom/itextpdf/io/font/TrueTypeFont;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontMetrics;->getNumberOfGlyphs()I

    move-result v1

    .line 835
    .local v1, "numOfGlyphs":I
    invoke-virtual {v0}, Lcom/itextpdf/io/font/TrueTypeFont;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/io/font/FontMetrics;->getNumberOfGlyphs()I

    move-result v4

    div-int/lit8 v4, v4, 0x8

    add-int/lit8 v4, v4, 0x1

    new-array v4, v4, [B

    .line 836
    .local v4, "cidSetBytes":[B
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_3
    div-int/lit8 v7, v1, 0x8

    if-ge v6, v7, :cond_7

    .line 837
    aget-byte v7, v4, v6

    or-int/lit16 v7, v7, 0xff

    int-to-byte v7, v7

    aput-byte v7, v4, v6

    .line 836
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 839
    .end local v6    # "i":I
    :cond_7
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_4
    rem-int/lit8 v7, v1, 0x8

    if-ge v6, v7, :cond_8

    .line 840
    array-length v7, v4

    add-int/lit8 v7, v7, -0x1

    aget-byte v8, v4, v7

    sget-object v9, Lcom/itextpdf/kernel/font/PdfType0Font;->rotbits:[B

    aget-byte v9, v9, v6

    or-int/2addr v8, v9

    int-to-byte v8, v8

    aput-byte v8, v4, v7

    .line 839
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 842
    .end local v6    # "i":I
    :cond_8
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->CIDSet:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v7, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {v7, v4}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>([B)V

    invoke-virtual {v3, v6, v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 843
    invoke-virtual {v0}, Lcom/itextpdf/io/font/TrueTypeFont;->isCff()Z

    move-result v6

    xor-int/lit8 v6, v6, 0x1

    invoke-virtual {p0, v3, v2, v6}, Lcom/itextpdf/kernel/font/PdfType0Font;->getCidFont(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/lang/String;Z)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v6

    .line 845
    .local v6, "cidFont":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfName;->Font:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v8, v9}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 846
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfName;->Type0:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v8, v9}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 847
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Encoding:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v9, Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v10, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    invoke-virtual {v10}, Lcom/itextpdf/io/font/CMapEncoding;->getCmapName()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v8, v9}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 848
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->DescendantFonts:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v9, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v9, v6}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    invoke-virtual {v7, v8, v9}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 850
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getToUnicode()Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v7

    .line 851
    .local v7, "toUnicode":Lcom/itextpdf/kernel/pdf/PdfStream;
    if-eqz v7, :cond_9

    .line 852
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfName;->ToUnicode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v8, v9, v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 853
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfStream;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v8

    if-eqz v8, :cond_9

    .line 854
    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfStream;->flush()V

    .line 860
    :cond_9
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPdfVersion()Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v8

    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_2_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

    invoke-virtual {v8, v9}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result v8

    if-ltz v8, :cond_a

    .line 862
    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->CIDSet:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v8}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 864
    :cond_a
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->flush()V

    .line 865
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->flush()V

    .line 866
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfStream;->flush()V

    .line 867
    .end local v0    # "ttf":Lcom/itextpdf/io/font/TrueTypeFont;
    .end local v1    # "numOfGlyphs":I
    .end local v2    # "fontName":Ljava/lang/String;
    .end local v3    # "fontDescriptor":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v4    # "cidSetBytes":[B
    .end local v5    # "fontStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local v6    # "cidFont":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v7    # "toUnicode":Lcom/itextpdf/kernel/pdf/PdfStream;
    nop

    .line 870
    :goto_5
    return-void

    .line 868
    :cond_b
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unsupported CID Font"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private generateWidthsArray()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 10

    .line 914
    new-instance v0, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-direct {v0}, Lcom/itextpdf/io/source/ByteArrayOutputStream;-><init>()V

    .line 915
    .local v0, "bytes":Lcom/itextpdf/io/source/ByteArrayOutputStream;
    new-instance v1, Lcom/itextpdf/io/source/OutputStream;

    invoke-direct {v1, v0}, Lcom/itextpdf/io/source/OutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 916
    .local v1, "stream":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<Lcom/itextpdf/io/source/ByteArrayOutputStream;>;"
    const/16 v2, 0x5b

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/source/OutputStream;->writeByte(I)Ljava/io/OutputStream;

    .line 917
    const/16 v3, -0xa

    .line 918
    .local v3, "lastNumber":I
    const/4 v4, 0x1

    .line 919
    .local v4, "firstTime":Z
    iget-object v5, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->usedGlyphs:Ljava/util/Set;

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 920
    .local v6, "code":I
    iget-object v7, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v7, v6}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v7

    .line 921
    .local v7, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v7}, Lcom/itextpdf/io/font/otf/Glyph;->getWidth()I

    move-result v8

    const/16 v9, 0x3e8

    if-ne v8, v9, :cond_0

    .line 922
    goto :goto_0

    .line 924
    :cond_0
    invoke-virtual {v7}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v8

    add-int/lit8 v9, v3, 0x1

    if-ne v8, v9, :cond_1

    .line 925
    const/16 v8, 0x20

    invoke-virtual {v1, v8}, Lcom/itextpdf/io/source/OutputStream;->writeByte(I)Ljava/io/OutputStream;

    goto :goto_1

    .line 927
    :cond_1
    if-nez v4, :cond_2

    .line 928
    const/16 v8, 0x5d

    invoke-virtual {v1, v8}, Lcom/itextpdf/io/source/OutputStream;->writeByte(I)Ljava/io/OutputStream;

    .line 930
    :cond_2
    const/4 v4, 0x0

    .line 931
    invoke-virtual {v7}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v8

    invoke-virtual {v1, v8}, Lcom/itextpdf/io/source/OutputStream;->writeInteger(I)Ljava/io/OutputStream;

    .line 932
    invoke-virtual {v1, v2}, Lcom/itextpdf/io/source/OutputStream;->writeByte(I)Ljava/io/OutputStream;

    .line 934
    :goto_1
    invoke-virtual {v7}, Lcom/itextpdf/io/font/otf/Glyph;->getWidth()I

    move-result v8

    invoke-virtual {v1, v8}, Lcom/itextpdf/io/source/OutputStream;->writeInteger(I)Ljava/io/OutputStream;

    .line 935
    invoke-virtual {v7}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v3

    .line 936
    .end local v6    # "code":I
    .end local v7    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    goto :goto_0

    .line 937
    :cond_3
    invoke-virtual {v1}, Lcom/itextpdf/io/source/OutputStream;->getCurrentPos()J

    move-result-wide v5

    const-wide/16 v7, 0x1

    cmp-long v2, v5, v7

    if-lez v2, :cond_4

    .line 938
    const-string v2, "]]"

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/source/OutputStream;->writeString(Ljava/lang/String;)Ljava/io/OutputStream;

    .line 939
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfLiteral;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-direct {v2, v5}, Lcom/itextpdf/kernel/pdf/PdfLiteral;-><init>([B)V

    return-object v2

    .line 941
    :cond_4
    const/4 v2, 0x0

    return-object v2
.end method

.method private getCompatibleUniMap(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "registry"    # Ljava/lang/String;

    .line 1016
    const-string v0, ""

    .line 1017
    .local v0, "uniMap":Ljava/lang/String;
    invoke-static {}, Lcom/itextpdf/io/font/CidFontProperties;->getRegistryNames()Ljava/util/Map;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_Uni"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1018
    .local v2, "name":Ljava/lang/String;
    move-object v0, v2

    .line 1019
    const-string v3, "V"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-boolean v4, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->vertical:Z

    if-eqz v4, :cond_0

    .line 1020
    goto :goto_1

    .line 1021
    :cond_0
    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-boolean v3, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->vertical:Z

    if-nez v3, :cond_1

    .line 1022
    goto :goto_1

    .line 1024
    .end local v2    # "name":Ljava/lang/String;
    :cond_1
    goto :goto_0

    .line 1025
    :cond_2
    :goto_1
    return-object v0
.end method

.method private static getOrdering(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Ljava/lang/String;
    .locals 3
    .param p0, "cidFont"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 740
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->CIDSystemInfo:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 741
    .local v0, "cidinfo":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 742
    return-object v1

    .line 743
    :cond_0
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Ordering:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v2

    if-eqz v2, :cond_1

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Ordering:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_1
    return-object v1
.end method

.method public static getUniMapFromOrdering(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 3
    .param p0, "ordering"    # Ljava/lang/String;
    .param p1, "horizontal"    # Z

    .line 234
    const/4 v0, 0x0

    .line 235
    .local v0, "result":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    :cond_0
    goto :goto_0

    :sswitch_0
    const-string v1, "CNS1"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_1

    :sswitch_1
    const-string v1, "GB1"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x3

    goto :goto_1

    :sswitch_2
    const-string v1, "Identity"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_1

    :sswitch_3
    const-string v1, "Korea1"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x2

    goto :goto_1

    :sswitch_4
    const-string v1, "Japan1"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_1

    :goto_0
    const/4 v1, -0x1

    :goto_1
    packed-switch v1, :pswitch_data_0

    .line 252
    const/4 v1, 0x0

    return-object v1

    .line 249
    :pswitch_0
    const-string v0, "Identity-"

    .line 250
    goto :goto_2

    .line 246
    :pswitch_1
    const-string v0, "UniGB-UTF16-"

    .line 247
    goto :goto_2

    .line 243
    :pswitch_2
    const-string v0, "UniKS-UTF16-"

    .line 244
    goto :goto_2

    .line 240
    :pswitch_3
    const-string v0, "UniJIS-UTF16-"

    .line 241
    goto :goto_2

    .line 237
    :pswitch_4
    const-string v0, "UniCNS-UTF16-"

    .line 238
    nop

    .line 254
    :goto_2
    if-eqz p1, :cond_1

    .line 255
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x48

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 257
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x56

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    :sswitch_data_0
    .sparse-switch
        -0x7c2e16f5 -> :sswitch_4
        -0x79b2ff19 -> :sswitch_3
        -0x43d2b22 -> :sswitch_2
        0x112b6 -> :sswitch_1
        0x1fa3e9 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private isAppendableGlyph(Lcom/itextpdf/io/font/otf/Glyph;)Z
    .locals 1
    .param p1, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 591
    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v0

    if-gtz v0, :cond_1

    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v0

    invoke-static {v0}, Lcom/itextpdf/io/util/TextUtil;->isWhitespaceOrNonPrintable(I)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private static normalizeEncoding(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "encoding"    # Ljava/lang/String;

    .line 1044
    if-eqz p0, :cond_1

    const-string v0, ""

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move-object v0, p0

    goto :goto_1

    :cond_1
    :goto_0
    const-string v0, "Identity-H"

    :goto_1
    return-object v0
.end method

.method private static toHex4(C)Ljava/lang/String;
    .locals 2
    .param p0, "ch"    # C

    .line 1011
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "0000"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1012
    .local v0, "s":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x4

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private writeBfrange(Lcom/itextpdf/io/source/OutputStream;Ljava/util/List;)I
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/source/OutputStream<",
            "Lcom/itextpdf/io/source/ByteArrayOutputStream;",
            ">;",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;)I"
        }
    .end annotation

    .line 991
    .local p1, "stream":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<Lcom/itextpdf/io/source/ByteArrayOutputStream;>;"
    .local p2, "range":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 992
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/io/source/OutputStream;->writeInteger(I)Ljava/io/OutputStream;

    .line 993
    const-string v0, " beginbfrange\n"

    invoke-virtual {p1, v0}, Lcom/itextpdf/io/source/OutputStream;->writeString(Ljava/lang/String;)Ljava/io/OutputStream;

    .line 994
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/io/font/otf/Glyph;

    .line 995
    .local v2, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v3

    invoke-static {v3}, Lcom/itextpdf/io/font/cmap/CMapContentParser;->toHex(I)Ljava/lang/String;

    move-result-object v3

    .line 996
    .local v3, "fromTo":Ljava/lang/String;
    invoke-virtual {p1, v3}, Lcom/itextpdf/io/source/OutputStream;->writeString(Ljava/lang/String;)Ljava/io/OutputStream;

    .line 997
    invoke-virtual {p1, v3}, Lcom/itextpdf/io/source/OutputStream;->writeString(Ljava/lang/String;)Ljava/io/OutputStream;

    .line 998
    const/16 v4, 0x3c

    invoke-virtual {p1, v4}, Lcom/itextpdf/io/source/OutputStream;->writeByte(I)Ljava/io/OutputStream;

    .line 999
    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/Glyph;->getChars()[C

    move-result-object v4

    array-length v5, v4

    move v6, v1

    :goto_1
    if-ge v6, v5, :cond_1

    aget-char v7, v4, v6

    .line 1000
    .local v7, "ch":C
    invoke-static {v7}, Lcom/itextpdf/kernel/font/PdfType0Font;->toHex4(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Lcom/itextpdf/io/source/OutputStream;->writeString(Ljava/lang/String;)Ljava/io/OutputStream;

    .line 999
    .end local v7    # "ch":C
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 1002
    :cond_1
    const/16 v4, 0x3e

    invoke-virtual {p1, v4}, Lcom/itextpdf/io/source/OutputStream;->writeByte(I)Ljava/io/OutputStream;

    .line 1003
    const/16 v4, 0xa

    invoke-virtual {p1, v4}, Lcom/itextpdf/io/source/OutputStream;->writeByte(I)Ljava/io/OutputStream;

    .line 1004
    .end local v2    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v3    # "fromTo":Ljava/lang/String;
    goto :goto_0

    .line 1005
    :cond_2
    const-string v0, "endbfrange\n"

    invoke-virtual {p1, v0}, Lcom/itextpdf/io/source/OutputStream;->writeString(Ljava/lang/String;)Ljava/io/OutputStream;

    .line 1006
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 1007
    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method public appendAnyGlyph(Ljava/lang/String;ILjava/util/List;)I
    .locals 5
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "from"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;)I"
        }
    .end annotation

    .line 544
    .local p3, "glyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    const/4 v0, 0x1

    .line 546
    .local v0, "process":I
    iget v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cidFontType:I

    if-nez v1, :cond_3

    .line 547
    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/CMapEncoding;->isDirect()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 548
    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v1

    .line 549
    .local v1, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v1, :cond_0

    .line 550
    invoke-interface {p3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 552
    .end local v1    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_0
    goto :goto_3

    .line 554
    :cond_1
    invoke-static {p1, p2}, Lcom/itextpdf/io/util/TextUtil;->isSurrogatePair(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 555
    invoke-static {p1, p2}, Lcom/itextpdf/io/util/TextUtil;->convertToUtf32(Ljava/lang/String;I)I

    move-result v1

    .line 556
    .local v1, "ch":I
    const/4 v0, 0x2

    goto :goto_0

    .line 558
    .end local v1    # "ch":I
    :cond_2
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 560
    .restart local v1    # "ch":I
    :goto_0
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/font/PdfType0Font;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    invoke-interface {p3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 561
    .end local v1    # "ch":I
    goto :goto_3

    .line 562
    :cond_3
    iget v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cidFontType:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_7

    .line 563
    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    check-cast v1, Lcom/itextpdf/io/font/TrueTypeFont;

    .line 564
    .local v1, "ttf":Lcom/itextpdf/io/font/TrueTypeFont;
    invoke-virtual {v1}, Lcom/itextpdf/io/font/TrueTypeFont;->isFontSpecific()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 565
    const-string/jumbo v2, "symboltt"

    invoke-static {p1, v2}, Lcom/itextpdf/io/font/PdfEncodings;->convertToBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v2

    .line 566
    .local v2, "b":[B
    array-length v3, v2

    if-lez v3, :cond_4

    .line 567
    iget-object v3, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    const/4 v4, 0x0

    aget-byte v4, v2, v4

    and-int/lit16 v4, v4, 0xff

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/FontProgram;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    .line 568
    .local v3, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v3, :cond_4

    .line 569
    invoke-interface {p3, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 572
    .end local v2    # "b":[B
    .end local v3    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_4
    goto :goto_2

    .line 574
    :cond_5
    invoke-static {p1, p2}, Lcom/itextpdf/io/util/TextUtil;->isSurrogatePair(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 575
    invoke-static {p1, p2}, Lcom/itextpdf/io/util/TextUtil;->convertToUtf32(Ljava/lang/String;I)I

    move-result v2

    .line 576
    .local v2, "ch":I
    const/4 v0, 0x2

    goto :goto_1

    .line 578
    .end local v2    # "ch":I
    :cond_6
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 580
    .restart local v2    # "ch":I
    :goto_1
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/font/PdfType0Font;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    invoke-interface {p3, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 582
    .end local v1    # "ttf":Lcom/itextpdf/io/font/TrueTypeFont;
    .end local v2    # "ch":I
    :goto_2
    nop

    .line 585
    :goto_3
    return v0

    .line 583
    :cond_7
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Font has no suitable cmap."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public appendDecodedCodesToGlyphsList(Ljava/util/List;Lcom/itextpdf/kernel/pdf/PdfString;)Z
    .locals 17
    .param p2, "characterCodes"    # Lcom/itextpdf/kernel/pdf/PdfString;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfString;",
            ")Z"
        }
    .end annotation

    .line 614
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v2, 0x1

    .line 616
    .local v2, "allCodesDecoded":Z
    iget-object v3, v0, Lcom/itextpdf/kernel/font/PdfType0Font;->embeddedToUnicode:Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 617
    .local v3, "isToUnicodeEmbedded":Z
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getCmap()Lcom/itextpdf/io/font/CMapEncoding;

    move-result-object v6

    .line 618
    .local v6, "cmap":Lcom/itextpdf/io/font/CMapEncoding;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v7

    .line 619
    .local v7, "fontProgram":Lcom/itextpdf/io/font/FontProgram;
    if-eqz v3, :cond_1

    iget-object v8, v0, Lcom/itextpdf/kernel/font/PdfType0Font;->embeddedToUnicode:Lcom/itextpdf/io/font/cmap/CMapToUnicode;

    invoke-virtual {v8}, Lcom/itextpdf/io/font/cmap/CMapToUnicode;->getCodeSpaceRanges()Ljava/util/List;

    move-result-object v8

    goto :goto_1

    :cond_1
    invoke-virtual {v6}, Lcom/itextpdf/io/font/CMapEncoding;->getCodeSpaceRanges()Ljava/util/List;

    move-result-object v8

    .line 621
    .local v8, "codeSpaceRanges":Ljava/util/List;, "Ljava/util/List<[B>;"
    :goto_1
    invoke-virtual/range {p2 .. p2}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v9

    .line 627
    .local v9, "charCodesSequence":Ljava/lang/String;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_2
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v11

    if-ge v10, v11, :cond_b

    .line 628
    const/4 v11, 0x0

    .line 629
    .local v11, "code":I
    const/4 v12, 0x0

    .line 630
    .local v12, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    const/4 v13, 0x1

    .line 631
    .local v13, "codeSpaceMatchedLength":I
    const/4 v14, 0x1

    .local v14, "codeLength":I
    :goto_3
    const/4 v15, 0x4

    if-gt v14, v15, :cond_4

    const/16 v16, 0x1

    add-int v5, v10, v14

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v4

    if-gt v5, v4, :cond_5

    .line 633
    shl-int/lit8 v4, v11, 0x8

    add-int v5, v10, v14

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v9, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    add-int v11, v4, v5

    .line 635
    invoke-static {v8, v11, v14}, Lcom/itextpdf/kernel/font/PdfType0Font;->containsCodeInCodeSpaceRange(Ljava/util/List;II)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 636
    move v13, v14

    .line 644
    if-eqz v3, :cond_2

    move v4, v11

    goto :goto_4

    :cond_2
    invoke-virtual {v6, v11}, Lcom/itextpdf/io/font/CMapEncoding;->getCidCode(I)I

    move-result v4

    .line 645
    .local v4, "glyphCode":I
    :goto_4
    invoke-virtual {v7, v4}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v12

    .line 646
    if-eqz v12, :cond_3

    .line 647
    add-int/lit8 v5, v14, -0x1

    add-int/2addr v10, v5

    .line 648
    goto :goto_5

    .line 632
    .end local v4    # "glyphCode":I
    :cond_3
    add-int/lit8 v14, v14, 0x1

    goto :goto_3

    .line 631
    :cond_4
    const/16 v16, 0x1

    .line 651
    .end local v14    # "codeLength":I
    :cond_5
    :goto_5
    if-nez v12, :cond_8

    .line 652
    const-class v4, Lcom/itextpdf/kernel/font/PdfType0Font;

    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 653
    .local v4, "logger":Lorg/slf4j/Logger;
    invoke-interface {v4}, Lorg/slf4j/Logger;->isWarnEnabled()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 654
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 655
    .local v5, "failedCodes":Ljava/lang/StringBuilder;
    const/4 v14, 0x1

    .line 656
    .restart local v14    # "codeLength":I
    :goto_6
    if-gt v14, v15, :cond_6

    add-int v15, v10, v14

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v15, v0, :cond_6

    .line 658
    add-int v0, v10, v14

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v9, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v15, " "

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 657
    add-int/lit8 v14, v14, 0x1

    const/4 v15, 0x4

    move-object/from16 v0, p0

    goto :goto_6

    .line 660
    .end local v14    # "codeLength":I
    :cond_6
    nop

    .line 661
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v14, "Could not find glyph with the following code: {0}"

    invoke-static {v14, v0}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 660
    invoke-interface {v4, v0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 663
    .end local v5    # "failedCodes":Ljava/lang/StringBuilder;
    :cond_7
    add-int/lit8 v0, v13, -0x1

    add-int/2addr v10, v0

    .line 665
    .end local v4    # "logger":Lorg/slf4j/Logger;
    :cond_8
    if-eqz v12, :cond_a

    invoke-virtual {v12}, Lcom/itextpdf/io/font/otf/Glyph;->getChars()[C

    move-result-object v0

    if-nez v0, :cond_9

    goto :goto_7

    .line 669
    :cond_9
    invoke-interface {v1, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v4, 0x0

    goto :goto_8

    .line 666
    :cond_a
    :goto_7
    new-instance v0, Lcom/itextpdf/io/font/otf/Glyph;

    const/4 v4, 0x0

    invoke-virtual {v7, v4}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v5

    invoke-virtual {v5}, Lcom/itextpdf/io/font/otf/Glyph;->getWidth()I

    move-result v5

    const/4 v14, -0x1

    invoke-direct {v0, v4, v5, v14}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(III)V

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 667
    const/4 v0, 0x0

    move v2, v0

    .line 627
    .end local v11    # "code":I
    .end local v12    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v13    # "codeSpaceMatchedLength":I
    :goto_8
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v0, p0

    goto/16 :goto_2

    .line 672
    .end local v10    # "i":I
    :cond_b
    return v2
.end method

.method public appendGlyphs(Ljava/lang/String;IILjava/util/List;)I
    .locals 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "from"    # I
    .param p3, "to"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;)I"
        }
    .end annotation

    .line 480
    .local p4, "glyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    iget v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cidFontType:I

    if-nez v0, :cond_2

    .line 481
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/CMapEncoding;->isDirect()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 482
    const/4 v0, 0x0

    .line 483
    .local v0, "processed":I
    move v1, p2

    .local v1, "k":I
    :goto_0
    if-gt v1, p3, :cond_0

    .line 484
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    .line 485
    .local v2, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v2, :cond_0

    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/font/PdfType0Font;->isAppendableGlyph(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 486
    invoke-interface {p4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 487
    nop

    .end local v2    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    add-int/lit8 v0, v0, 0x1

    .line 483
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 492
    .end local v1    # "k":I
    :cond_0
    return v0

    .line 494
    .end local v0    # "processed":I
    :cond_1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/itextpdf/kernel/font/PdfType0Font;->appendUniGlyphs(Ljava/lang/String;IILjava/util/List;)I

    move-result v0

    return v0

    .line 496
    :cond_2
    iget v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cidFontType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_5

    .line 497
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgram;->isFontSpecific()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 498
    const/4 v0, 0x0

    .line 499
    .restart local v0    # "processed":I
    move v1, p2

    .restart local v1    # "k":I
    :goto_1
    if-gt v1, p3, :cond_3

    .line 500
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/font/FontProgram;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    .line 501
    .restart local v2    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v2, :cond_3

    invoke-direct {p0, v2}, Lcom/itextpdf/kernel/font/PdfType0Font;->isAppendableGlyph(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 502
    invoke-interface {p4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 503
    nop

    .end local v2    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    add-int/lit8 v0, v0, 0x1

    .line 499
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 508
    .end local v1    # "k":I
    :cond_3
    return v0

    .line 510
    .end local v0    # "processed":I
    :cond_4
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/itextpdf/kernel/font/PdfType0Font;->appendUniGlyphs(Ljava/lang/String;IILjava/util/List;)I

    move-result v0

    return v0

    .line 513
    :cond_5
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Font has no suitable cmap."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public containsGlyph(I)Z
    .locals 5
    .param p1, "unicode"    # I

    .line 280
    iget v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cidFontType:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_3

    .line 281
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/CMapEncoding;->isDirect()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 282
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1

    .line 284
    :cond_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontProgram;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    move v1, v2

    :goto_1
    return v1

    .line 286
    :cond_3
    iget v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cidFontType:I

    const/4 v3, 0x2

    if-ne v0, v3, :cond_7

    .line 287
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgram;->isFontSpecific()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 288
    int-to-char v0, p1

    const-string/jumbo v3, "symboltt"

    invoke-static {v0, v3}, Lcom/itextpdf/io/font/PdfEncodings;->convertToBytes(CLjava/lang/String;)[B

    move-result-object v0

    .line 289
    .local v0, "b":[B
    array-length v3, v0

    if-lez v3, :cond_4

    iget-object v3, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    aget-byte v4, v0, v2

    and-int/lit16 v4, v4, 0xff

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/FontProgram;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    if-eqz v3, :cond_4

    goto :goto_2

    :cond_4
    move v1, v2

    :goto_2
    return v1

    .line 291
    .end local v0    # "b":[B
    :cond_5
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontProgram;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    if-eqz v0, :cond_6

    goto :goto_3

    :cond_6
    move v1, v2

    :goto_3
    return v1

    .line 294
    :cond_7
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid CID font type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cidFontType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public convertToBytes(Lcom/itextpdf/io/font/otf/Glyph;)[B
    .locals 3
    .param p1, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 400
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->usedGlyphs:Ljava/util/Set;

    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 401
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/CMapEncoding;->getCmapName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->getEncoder(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    move-result-object v0

    .line 402
    .local v0, "encoder":Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;
    if-nez v0, :cond_0

    .line 403
    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/font/CMapEncoding;->getCmapBytes(I)[B

    move-result-object v1

    return-object v1

    .line 405
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v1

    .line 406
    .local v1, "cp":I
    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;->encodeUnicodeCodePoint(I)[B

    move-result-object v2

    return-object v2
.end method

.method public convertToBytes(Lcom/itextpdf/io/font/otf/GlyphLine;)[B
    .locals 7
    .param p1, "glyphLine"    # Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 361
    if-nez p1, :cond_0

    .line 362
    const/4 v0, 0x0

    new-array v0, v0, [B

    return-object v0

    .line 367
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/CMapEncoding;->getCmapName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->getEncoder(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    move-result-object v0

    .line 368
    .local v0, "encoder":Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;
    if-nez v0, :cond_3

    .line 369
    const/4 v1, 0x0

    .line 370
    .local v1, "totalByteCount":I
    iget v2, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .local v2, "i":I
    :goto_0
    iget v3, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v2, v3, :cond_1

    .line 371
    iget-object v3, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    invoke-virtual {p1, v2}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/CMapEncoding;->getCmapBytesLength(I)I

    move-result v3

    add-int/2addr v1, v3

    .line 370
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 374
    .end local v2    # "i":I
    :cond_1
    new-array v2, v1, [B

    .line 375
    .local v2, "bytes":[B
    const/4 v3, 0x0

    .line 376
    .local v3, "offset":I
    iget v4, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .local v4, "i":I
    :goto_1
    iget v5, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v4, v5, :cond_2

    .line 377
    iget-object v5, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->usedGlyphs:Ljava/util/Set;

    invoke-virtual {p1, v4}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 378
    iget-object v5, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    invoke-virtual {p1, v4}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v6

    invoke-virtual {v5, v6, v2, v3}, Lcom/itextpdf/io/font/CMapEncoding;->fillCmapBytes(I[BI)I

    move-result v3

    .line 376
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 380
    .end local v4    # "i":I
    :cond_2
    return-object v2

    .line 382
    .end local v1    # "totalByteCount":I
    .end local v2    # "bytes":[B
    .end local v3    # "offset":I
    :cond_3
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 383
    .local v1, "baos":Ljava/io/ByteArrayOutputStream;
    iget v2, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .local v2, "i":I
    :goto_2
    iget v3, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v2, v3, :cond_4

    .line 384
    invoke-virtual {p1, v2}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    .line 385
    .local v3, "g":Lcom/itextpdf/io/font/otf/Glyph;
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->usedGlyphs:Ljava/util/Set;

    invoke-virtual {v3}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 386
    invoke-virtual {v3}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;->encodeUnicodeCodePoint(I)[B

    move-result-object v4

    .line 388
    .local v4, "encodedBit":[B
    :try_start_0
    invoke-virtual {v1, v4}, Ljava/io/ByteArrayOutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 392
    nop

    .line 383
    .end local v3    # "g":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v4    # "encodedBit":[B
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 389
    .restart local v3    # "g":Lcom/itextpdf/io/font/otf/Glyph;
    .restart local v4    # "encodedBit":[B
    :catch_0
    move-exception v5

    .line 391
    .local v5, "e":Ljava/io/IOException;
    new-instance v6, Lcom/itextpdf/kernel/exceptions/PdfException;

    invoke-direct {v6, v5}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 394
    .end local v2    # "i":I
    .end local v3    # "g":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v4    # "encodedBit":[B
    .end local v5    # "e":Ljava/io/IOException;
    :cond_4
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2
.end method

.method public convertToBytes(Ljava/lang/String;)[B
    .locals 2
    .param p1, "text"    # Ljava/lang/String;

    .line 333
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    invoke-virtual {v0}, Lcom/itextpdf/io/font/CMapEncoding;->getCmapName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/font/cmap/StandardCMapCharsets;->getEncoder(Ljava/lang/String;)Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;

    move-result-object v0

    .line 334
    .local v0, "encoder":Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;
    if-nez v0, :cond_0

    .line 335
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/font/PdfType0Font;->convertToBytesUsingCMap(Ljava/lang/String;)[B

    move-result-object v1

    return-object v1

    .line 337
    :cond_0
    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/font/PdfType0Font;->converToBytesUsingEncoder(Ljava/lang/String;Lcom/itextpdf/io/font/cmap/CMapCharsetEncoder;)[B

    move-result-object v1

    return-object v1
.end method

.method public createGlyphLine(Ljava/lang/String;)Lcom/itextpdf/io/font/otf/GlyphLine;
    .locals 6
    .param p1, "content"    # Ljava/lang/String;

    .line 426
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 427
    .local v0, "glyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    iget v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cidFontType:I

    if-nez v1, :cond_5

    .line 428
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 429
    .local v1, "len":I
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    invoke-virtual {v2}, Lcom/itextpdf/io/font/CMapEncoding;->isDirect()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 430
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 431
    iget-object v3, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    .line 432
    .local v3, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v3, :cond_0

    .line 433
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 430
    .end local v3    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v2    # "k":I
    :cond_1
    goto :goto_3

    .line 437
    :cond_2
    const/4 v2, 0x0

    .restart local v2    # "k":I
    :goto_1
    if-ge v2, v1, :cond_4

    .line 439
    invoke-static {p1, v2}, Lcom/itextpdf/io/util/TextUtil;->isSurrogatePair(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 440
    invoke-static {p1, v2}, Lcom/itextpdf/io/util/TextUtil;->convertToUtf32(Ljava/lang/String;I)I

    move-result v3

    .line 441
    .local v3, "ch":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 443
    .end local v3    # "ch":I
    :cond_3
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 445
    .restart local v3    # "ch":I
    :goto_2
    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/font/PdfType0Font;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 437
    .end local v3    # "ch":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 448
    .end local v1    # "len":I
    .end local v2    # "k":I
    :cond_4
    :goto_3
    goto :goto_8

    :cond_5
    iget v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cidFontType:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_b

    .line 449
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 450
    .restart local v1    # "len":I
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v2}, Lcom/itextpdf/io/font/FontProgram;->isFontSpecific()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 451
    const-string/jumbo v2, "symboltt"

    invoke-static {p1, v2}, Lcom/itextpdf/io/font/PdfEncodings;->convertToBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v2

    .line 452
    .local v2, "b":[B
    array-length v1, v2

    .line 453
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_4
    if-ge v3, v1, :cond_7

    .line 454
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    aget-byte v5, v2, v3

    and-int/lit16 v5, v5, 0xff

    invoke-virtual {v4, v5}, Lcom/itextpdf/io/font/FontProgram;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v4

    .line 455
    .local v4, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v4, :cond_6

    .line 456
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 453
    .end local v4    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 459
    .end local v2    # "b":[B
    .end local v3    # "k":I
    :cond_7
    goto :goto_7

    .line 460
    :cond_8
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_5
    if-ge v2, v1, :cond_a

    .line 462
    invoke-static {p1, v2}, Lcom/itextpdf/io/util/TextUtil;->isSurrogatePair(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 463
    invoke-static {p1, v2}, Lcom/itextpdf/io/util/TextUtil;->convertToUtf32(Ljava/lang/String;I)I

    move-result v3

    .line 464
    .local v3, "val":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 466
    .end local v3    # "val":I
    :cond_9
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 468
    .restart local v3    # "val":I
    :goto_6
    invoke-virtual {p0, v3}, Lcom/itextpdf/kernel/font/PdfType0Font;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 460
    .end local v3    # "val":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 471
    .end local v1    # "len":I
    .end local v2    # "k":I
    :cond_a
    :goto_7
    nop

    .line 475
    :goto_8
    new-instance v1, Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-direct {v1, v0}, Lcom/itextpdf/io/font/otf/GlyphLine;-><init>(Ljava/util/List;)V

    return-object v1

    .line 472
    :cond_b
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Font has no suitable cmap."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public decode(Lcom/itextpdf/kernel/pdf/PdfString;)Ljava/lang/String;
    .locals 1
    .param p1, "content"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 596
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/font/PdfType0Font;->decodeIntoGlyphLine(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/GlyphLine;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public decodeIntoGlyphLine(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/io/font/otf/GlyphLine;
    .locals 2
    .param p1, "characterCodes"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 604
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 605
    .local v0, "glyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/font/PdfType0Font;->appendDecodedCodesToGlyphsList(Ljava/util/List;Lcom/itextpdf/kernel/pdf/PdfString;)Z

    .line 606
    new-instance v1, Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-direct {v1, v0}, Lcom/itextpdf/io/font/otf/GlyphLine;-><init>(Ljava/util/List;)V

    return-object v1
.end method

.method public flush()V
    .locals 1

    .line 693
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->isFlushed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 694
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->ensureUnderlyingObjectHasIndirectReference()V

    .line 695
    iget-boolean v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->newFont:Z

    if-eqz v0, :cond_1

    .line 696
    invoke-direct {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->flushFontData()V

    .line 698
    :cond_1
    invoke-super {p0}, Lcom/itextpdf/kernel/font/PdfFont;->flush()V

    .line 699
    return-void
.end method

.method protected getCidFont(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/lang/String;Z)Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 5
    .param p1, "fontDescriptor"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "fontName"    # Ljava/lang/String;
    .param p3, "isType2"    # Z

    .line 882
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 883
    .local v0, "cidFont":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-static {v0}, Lcom/itextpdf/kernel/font/PdfType0Font;->markObjectAsIndirect(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 884
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Font:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 886
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FontDescriptor:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 887
    if-eqz p3, :cond_0

    .line 888
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->CIDFontType2:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 889
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CIDToGIDMap:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Identity:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 891
    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->CIDFontType0:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 893
    :goto_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BaseFont:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v2, p2}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 894
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 895
    .local v1, "cidInfo":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Registry:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfString;

    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    invoke-virtual {v4}, Lcom/itextpdf/io/font/CMapEncoding;->getRegistry()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 896
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Ordering:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfString;

    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    invoke-virtual {v4}, Lcom/itextpdf/io/font/CMapEncoding;->getOrdering()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 897
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Supplement:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfNumber;

    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    invoke-virtual {v4}, Lcom/itextpdf/io/font/CMapEncoding;->getSupplement()I

    move-result v4

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 898
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->CIDSystemInfo:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 899
    iget-boolean v2, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->vertical:Z

    if-nez v2, :cond_2

    .line 900
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->DW:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/16 v4, 0x3e8

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 901
    invoke-direct {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->generateWidthsArray()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    .line 902
    .local v2, "widthsArray":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v2, :cond_1

    .line 903
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->W:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v3, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 905
    .end local v2    # "widthsArray":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_1
    goto :goto_1

    .line 907
    :cond_2
    const-class v2, Lcom/itextpdf/kernel/font/PdfType0Font;

    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 908
    .local v2, "logger":Lorg/slf4j/Logger;
    const-string v3, "Vertical writing has not been implemented yet."

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 910
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :goto_1
    return-object v0
.end method

.method public getCmap()Lcom/itextpdf/io/font/CMapEncoding;
    .locals 1

    .line 708
    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    return-object v0
.end method

.method public getContentWidth(Lcom/itextpdf/kernel/pdf/PdfString;)F
    .locals 4
    .param p1, "content"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 677
    const/4 v0, 0x0

    .line 678
    .local v0, "width":F
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/font/PdfType0Font;->decodeIntoGlyphLine(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v1

    .line 679
    .local v1, "glyphLine":Lcom/itextpdf/io/font/otf/GlyphLine;
    iget v2, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .local v2, "i":I
    :goto_0
    iget v3, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v2, v3, :cond_0

    .line 680
    invoke-virtual {v1, v2}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/otf/Glyph;->getWidth()I

    move-result v3

    int-to-float v3, v3

    add-float/2addr v0, v3

    .line 679
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 682
    .end local v2    # "i":I
    :cond_0
    return v0
.end method

.method protected getFontDescriptor(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 5
    .param p1, "fontName"    # Ljava/lang/String;

    .line 713
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 714
    .local v0, "fontDescriptor":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/font/PdfType0Font;->makeObjectIndirect(Lcom/itextpdf/kernel/pdf/PdfObject;)Z

    .line 715
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->FontDescriptor:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 716
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FontName:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 717
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->FontBBox:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontMetrics;->getBbox()[I

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 718
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Ascent:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontMetrics;->getTypoAscender()I

    move-result v3

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 719
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Descent:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontMetrics;->getTypoDescender()I

    move-result v3

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 720
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CapHeight:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontMetrics;->getCapHeight()I

    move-result v3

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 721
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ItalicAngle:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontMetrics;->getItalicAngle()F

    move-result v3

    float-to-double v3, v3

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 722
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->StemV:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontMetrics;->getStemV()I

    move-result v3

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 723
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Flags:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/FontProgram;->getPdfFontFlags()I

    move-result v3

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 724
    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontProgram;->getFontIdentification()Lcom/itextpdf/io/font/FontIdentification;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontIdentification;->getPanose()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 725
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 726
    .local v1, "styleDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Panose:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfString;

    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v4}, Lcom/itextpdf/io/font/FontProgram;->getFontIdentification()Lcom/itextpdf/io/font/FontIdentification;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/io/font/FontIdentification;->getPanose()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfString;->setHexWriting(Z)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 727
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Style:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 729
    .end local v1    # "styleDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_0
    return-object v0
.end method

.method public getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;
    .locals 5
    .param p1, "unicode"    # I

    .line 263
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontProgram;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    .line 264
    .local v0, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-nez v0, :cond_1

    iget-object v1, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->notdefGlyphs:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/io/font/otf/Glyph;

    move-object v0, v1

    if-nez v1, :cond_1

    .line 267
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v1

    .line 268
    .local v1, "notdef":Lcom/itextpdf/io/font/otf/Glyph;
    if-eqz v1, :cond_0

    .line 269
    new-instance v2, Lcom/itextpdf/io/font/otf/Glyph;

    invoke-direct {v2, v1, p1}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(Lcom/itextpdf/io/font/otf/Glyph;I)V

    move-object v0, v2

    .end local v0    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    .local v2, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    goto :goto_0

    .line 271
    .end local v2    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    .restart local v0    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_0
    new-instance v3, Lcom/itextpdf/io/font/otf/Glyph;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v2, p1}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(III)V

    move-object v0, v3

    .line 273
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->notdefGlyphs:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    .end local v1    # "notdef":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_1
    return-object v0
.end method

.method public getToUnicode()Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 8

    .line 950
    new-instance v0, Lcom/itextpdf/io/source/OutputStream;

    new-instance v1, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-direct {v1}, Lcom/itextpdf/io/source/ByteArrayOutputStream;-><init>()V

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/OutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 951
    .local v0, "stream":Lcom/itextpdf/io/source/OutputStream;, "Lcom/itextpdf/io/source/OutputStream<Lcom/itextpdf/io/source/ByteArrayOutputStream;>;"
    const-string v1, "/CIDInit /ProcSet findresource begin\n12 dict begin\nbegincmap\n/CIDSystemInfo\n<< /Registry (Adobe)\n/Ordering (UCS)\n/Supplement 0\n>> def\n/CMapName /Adobe-Identity-UCS def\n/CMapType 2 def\n1 begincodespacerange\n<0000><FFFF>\nendcodespacerange\n"

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/source/OutputStream;->writeString(Ljava/lang/String;)Ljava/io/OutputStream;

    .line 966
    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0x64

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 968
    .local v1, "glyphGroup":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/itextpdf/io/font/otf/Glyph;>;"
    const/4 v3, 0x0

    .line 969
    .local v3, "bfranges":I
    iget-object v4, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->usedGlyphs:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    .line 970
    .local v5, "glyphId":Ljava/lang/Integer;
    iget-object v6, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->fontProgram:Lcom/itextpdf/io/font/FontProgram;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {v6, v7}, Lcom/itextpdf/io/font/FontProgram;->getGlyphByCode(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v6

    .line 971
    .local v6, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v6}, Lcom/itextpdf/io/font/otf/Glyph;->getChars()[C

    move-result-object v7

    if-eqz v7, :cond_0

    .line 972
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 973
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ne v7, v2, :cond_0

    .line 974
    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/font/PdfType0Font;->writeBfrange(Lcom/itextpdf/io/source/OutputStream;Ljava/util/List;)I

    move-result v7

    add-int/2addr v3, v7

    .line 977
    .end local v5    # "glyphId":Ljava/lang/Integer;
    .end local v6    # "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_0
    goto :goto_0

    .line 979
    :cond_1
    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/font/PdfType0Font;->writeBfrange(Lcom/itextpdf/io/source/OutputStream;Ljava/util/List;)I

    move-result v2

    add-int/2addr v3, v2

    .line 981
    if-nez v3, :cond_2

    .line 982
    const/4 v2, 0x0

    return-object v2

    .line 984
    :cond_2
    const-string v2, "endcmap\nCMapName currentdict /CMap defineresource pop\nend end\n"

    invoke-virtual {v0, v2}, Lcom/itextpdf/io/source/OutputStream;->writeString(Ljava/lang/String;)Ljava/io/OutputStream;

    .line 987
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/OutputStream;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/io/source/ByteArrayOutputStream;

    invoke-virtual {v4}, Lcom/itextpdf/io/source/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>([B)V

    return-object v2
.end method

.method public isBuiltWith(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p1, "fontProgram"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;

    .line 687
    invoke-virtual {p0}, Lcom/itextpdf/kernel/font/PdfType0Font;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/FontProgram;->isBuiltWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/font/PdfType0Font;->cmapEncoding:Lcom/itextpdf/io/font/CMapEncoding;

    .line 688
    invoke-static {p2}, Lcom/itextpdf/kernel/font/PdfType0Font;->normalizeEncoding(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/CMapEncoding;->isBuiltWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 687
    :goto_0
    return v0
.end method

.method public writeText(Lcom/itextpdf/io/font/otf/GlyphLine;IILcom/itextpdf/kernel/pdf/PdfOutputStream;)V
    .locals 3
    .param p1, "text"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p2, "from"    # I
    .param p3, "to"    # I
    .param p4, "stream"    # Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 412
    sub-int v0, p3, p2

    add-int/lit8 v0, v0, 0x1

    .line 413
    .local v0, "len":I
    if-lez v0, :cond_0

    .line 414
    new-instance v1, Lcom/itextpdf/io/font/otf/GlyphLine;

    add-int/lit8 v2, p3, 0x1

    invoke-direct {v1, p1, p2, v2}, Lcom/itextpdf/io/font/otf/GlyphLine;-><init>(Lcom/itextpdf/io/font/otf/GlyphLine;II)V

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/font/PdfType0Font;->convertToBytes(Lcom/itextpdf/io/font/otf/GlyphLine;)[B

    move-result-object v1

    .line 415
    .local v1, "bytes":[B
    invoke-static {p4, v1}, Lcom/itextpdf/io/util/StreamUtil;->writeHexedString(Ljava/io/OutputStream;[B)V

    .line 417
    .end local v1    # "bytes":[B
    :cond_0
    return-void
.end method

.method public writeText(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfOutputStream;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "stream"    # Lcom/itextpdf/kernel/pdf/PdfOutputStream;

    .line 421
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/font/PdfType0Font;->convertToBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {p2, v0}, Lcom/itextpdf/io/util/StreamUtil;->writeHexedString(Ljava/io/OutputStream;[B)V

    .line 422
    return-void
.end method
