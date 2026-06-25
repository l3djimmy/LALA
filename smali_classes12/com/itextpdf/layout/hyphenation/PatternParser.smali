.class public Lcom/itextpdf/layout/hyphenation/PatternParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "PatternParser.java"


# static fields
.field static final ELEM_CLASSES:I = 0x1

.field static final ELEM_EXCEPTIONS:I = 0x2

.field static final ELEM_HYPHEN:I = 0x4

.field static final ELEM_PATTERNS:I = 0x3


# instance fields
.field private consumer:Lcom/itextpdf/layout/hyphenation/IPatternConsumer;

.field private currElement:I

.field private errMsg:Ljava/lang/String;

.field private exception:Ljava/util/ArrayList;

.field private hasClasses:Z

.field private hyphenChar:C

.field private parser:Lorg/xml/sax/XMLReader;

.field private token:Ljava/lang/StringBuilder;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 60
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->token:Ljava/lang/StringBuilder;

    .line 62
    invoke-static {}, Lcom/itextpdf/layout/hyphenation/PatternParser;->createParser()Lorg/xml/sax/XMLReader;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->parser:Lorg/xml/sax/XMLReader;

    .line 63
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->parser:Lorg/xml/sax/XMLReader;

    invoke-interface {v0, p0}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 64
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->parser:Lorg/xml/sax/XMLReader;

    invoke-interface {v0, p0}, Lorg/xml/sax/XMLReader;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    .line 67
    const/16 v0, 0x2d

    iput-char v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->hyphenChar:C

    .line 68
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/hyphenation/IPatternConsumer;)V
    .locals 0
    .param p1, "consumer"    # Lcom/itextpdf/layout/hyphenation/IPatternConsumer;

    .line 75
    invoke-direct {p0}, Lcom/itextpdf/layout/hyphenation/PatternParser;-><init>()V

    .line 76
    iput-object p1, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->consumer:Lcom/itextpdf/layout/hyphenation/IPatternConsumer;

    .line 77
    return-void
.end method

.method static createParser()Lorg/xml/sax/XMLReader;
    .locals 4

    .line 116
    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_0
    invoke-static {v0, v1}, Lcom/itextpdf/kernel/utils/XmlProcessorCreator;->createSafeXMLReader(ZZ)Lorg/xml/sax/XMLReader;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 117
    :catch_0
    move-exception v0

    .line 122
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Couldn\'t create XMLReader: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getExceptionWord(Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 4
    .param p1, "ex"    # Ljava/util/ArrayList;

    .line 214
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 215
    .local v0, "res":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 216
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 217
    .local v2, "item":Ljava/lang/Object;
    instance-of v3, v2, Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 218
    move-object v3, v2

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 220
    :cond_0
    move-object v3, v2

    check-cast v3, Lcom/itextpdf/layout/hyphenation/Hyphen;

    iget-object v3, v3, Lcom/itextpdf/layout/hyphenation/Hyphen;->noBreak:Ljava/lang/String;

    if-eqz v3, :cond_1

    .line 221
    move-object v3, v2

    check-cast v3, Lcom/itextpdf/layout/hyphenation/Hyphen;

    iget-object v3, v3, Lcom/itextpdf/layout/hyphenation/Hyphen;->noBreak:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .end local v2    # "item":Ljava/lang/Object;
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 225
    .end local v1    # "i":I
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static getInterletterValues(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "pat"    # Ljava/lang/String;

    .line 229
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 232
    .local v0, "il":Ljava/lang/StringBuilder;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 233
    .local v1, "word":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    .line 234
    .local v2, "len":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v2, :cond_1

    .line 235
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 236
    .local v4, "c":C
    invoke-static {v4}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 237
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 238
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 240
    :cond_0
    const/16 v5, 0x30

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 234
    .end local v4    # "c":C
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 243
    .end local v3    # "i":I
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private getLocationString(Lorg/xml/sax/SAXParseException;)Ljava/lang/String;
    .locals 4
    .param p1, "ex"    # Lorg/xml/sax/SAXParseException;

    .line 409
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 411
    .local v0, "str":Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getSystemId()Ljava/lang/String;

    move-result-object v1

    .line 412
    .local v1, "systemId":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 413
    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 414
    .local v2, "index":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 415
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 417
    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 419
    .end local v2    # "index":I
    :cond_1
    const/16 v2, 0x3a

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 420
    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getLineNumber()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 421
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 422
    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getColumnNumber()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 425
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static getPattern(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "word"    # Ljava/lang/String;

    .line 172
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 173
    .local v0, "pat":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 174
    .local v1, "len":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 175
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v3

    if-nez v3, :cond_0

    .line 176
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 174
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 179
    .end local v2    # "i":I
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private normalizeException(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 11
    .param p1, "ex"    # Ljava/util/ArrayList;

    .line 183
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 184
    .local v0, "res":Ljava/util/ArrayList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 185
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 186
    .local v2, "item":Ljava/lang/Object;
    instance-of v3, v2, Ljava/lang/String;

    if-eqz v3, :cond_3

    .line 187
    move-object v3, v2

    check-cast v3, Ljava/lang/String;

    .line 188
    .local v3, "str":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 189
    .local v4, "buf":Ljava/lang/StringBuilder;
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_1
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v5, v6, :cond_1

    .line 190
    invoke-virtual {v3, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 191
    .local v6, "c":C
    iget-char v7, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->hyphenChar:C

    if-eq v6, v7, :cond_0

    .line 192
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 194
    :cond_0
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 195
    const/4 v7, 0x0

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 196
    const/4 v8, 0x1

    new-array v8, v8, [C

    .line 197
    .local v8, "h":[C
    iget-char v9, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->hyphenChar:C

    aput-char v9, v8, v7

    .line 200
    new-instance v7, Lcom/itextpdf/layout/hyphenation/Hyphen;

    new-instance v9, Ljava/lang/String;

    invoke-direct {v9, v8}, Ljava/lang/String;-><init>([C)V

    const/4 v10, 0x0

    invoke-direct {v7, v9, v10, v10}, Lcom/itextpdf/layout/hyphenation/Hyphen;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 189
    .end local v6    # "c":C
    .end local v8    # "h":[C
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 203
    .end local v5    # "j":I
    :cond_1
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_2

    .line 204
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 206
    .end local v3    # "str":Ljava/lang/String;
    .end local v4    # "buf":Ljava/lang/StringBuilder;
    :cond_2
    goto :goto_3

    .line 207
    :cond_3
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 184
    .end local v2    # "item":Ljava/lang/Object;
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 210
    .end local v1    # "i":I
    :cond_4
    return-object v0
.end method

.method private readToken(Ljava/lang/StringBuilder;)Ljava/lang/String;
    .locals 6
    .param p1, "chars"    # Ljava/lang/StringBuilder;

    .line 128
    const/4 v0, 0x0

    .line 130
    .local v0, "space":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 131
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 132
    const/4 v0, 0x1

    .line 130
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 137
    :cond_0
    const/4 v2, 0x0

    if-eqz v0, :cond_2

    .line 139
    move v3, v1

    .local v3, "countr":I
    :goto_1
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 140
    sub-int v4, v3, v1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v5

    invoke-virtual {p1, v4, v5}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 139
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 142
    .end local v3    # "countr":I
    :cond_1
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    sub-int/2addr v3, v1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 143
    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->token:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_2

    .line 144
    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->token:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 145
    .local v3, "word":Ljava/lang/String;
    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->token:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 146
    return-object v3

    .line 149
    .end local v3    # "word":Ljava/lang/String;
    :cond_2
    const/4 v0, 0x0

    .line 150
    const/4 v1, 0x0

    :goto_2
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-ge v1, v3, :cond_4

    .line 151
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 152
    const/4 v0, 0x1

    .line 153
    goto :goto_3

    .line 150
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 156
    :cond_4
    :goto_3
    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->token:Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    move v3, v1

    .local v3, "countr":I
    :goto_4
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-ge v3, v4, :cond_5

    .line 159
    sub-int v4, v3, v1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v5

    invoke-virtual {p1, v4, v5}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 158
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 161
    .end local v3    # "countr":I
    :cond_5
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    sub-int/2addr v3, v1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 162
    nop

    .line 167
    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->token:Ljava/lang/StringBuilder;

    .line 162
    if-eqz v0, :cond_6

    .line 163
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 164
    .local v3, "word":Ljava/lang/String;
    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->token:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 165
    return-object v3

    .line 167
    .end local v3    # "word":Ljava/lang/String;
    :cond_6
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 168
    const/4 v2, 0x0

    return-object v2
.end method


# virtual methods
.method public characters([CII)V
    .locals 5
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I

    .line 349
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 350
    .local v0, "chars":Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 351
    invoke-direct {p0, v0}, Lcom/itextpdf/layout/hyphenation/PatternParser;->readToken(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v1

    .line 352
    .local v1, "word":Ljava/lang/String;
    :goto_0
    if-eqz v1, :cond_0

    .line 354
    iget v2, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->currElement:I

    packed-switch v2, :pswitch_data_0

    goto :goto_1

    .line 366
    :pswitch_0
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->consumer:Lcom/itextpdf/layout/hyphenation/IPatternConsumer;

    invoke-static {v1}, Lcom/itextpdf/layout/hyphenation/PatternParser;->getPattern(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 367
    invoke-static {v1}, Lcom/itextpdf/layout/hyphenation/PatternParser;->getInterletterValues(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 366
    invoke-interface {v2, v3, v4}, Lcom/itextpdf/layout/hyphenation/IPatternConsumer;->addPattern(Ljava/lang/String;Ljava/lang/String;)V

    .line 368
    goto :goto_1

    .line 359
    :pswitch_1
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->exception:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 360
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->exception:Ljava/util/ArrayList;

    invoke-direct {p0, v2}, Lcom/itextpdf/layout/hyphenation/PatternParser;->normalizeException(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->exception:Ljava/util/ArrayList;

    .line 361
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->consumer:Lcom/itextpdf/layout/hyphenation/IPatternConsumer;

    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->exception:Ljava/util/ArrayList;

    invoke-direct {p0, v3}, Lcom/itextpdf/layout/hyphenation/PatternParser;->getExceptionWord(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->exception:Ljava/util/ArrayList;

    .line 362
    invoke-virtual {v4}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    .line 361
    invoke-interface {v2, v3, v4}, Lcom/itextpdf/layout/hyphenation/IPatternConsumer;->addException(Ljava/lang/String;Ljava/util/List;)V

    .line 363
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->exception:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 364
    goto :goto_1

    .line 356
    :pswitch_2
    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->consumer:Lcom/itextpdf/layout/hyphenation/IPatternConsumer;

    invoke-interface {v2, v1}, Lcom/itextpdf/layout/hyphenation/IPatternConsumer;->addClass(Ljava/lang/String;)V

    .line 357
    nop

    .line 372
    :goto_1
    invoke-direct {p0, v0}, Lcom/itextpdf/layout/hyphenation/PatternParser;->readToken(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 375
    :cond_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "local"    # Ljava/lang/String;
    .param p3, "raw"    # Ljava/lang/String;

    .line 308
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->token:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x4

    if-lez v0, :cond_0

    .line 309
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->token:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 310
    .local v0, "word":Ljava/lang/String;
    iget v3, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->currElement:I

    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 326
    :pswitch_0
    goto :goto_0

    .line 321
    :pswitch_1
    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->consumer:Lcom/itextpdf/layout/hyphenation/IPatternConsumer;

    invoke-static {v0}, Lcom/itextpdf/layout/hyphenation/PatternParser;->getPattern(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 322
    invoke-static {v0}, Lcom/itextpdf/layout/hyphenation/PatternParser;->getInterletterValues(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 321
    invoke-interface {v3, v4, v5}, Lcom/itextpdf/layout/hyphenation/IPatternConsumer;->addPattern(Ljava/lang/String;Ljava/lang/String;)V

    .line 323
    goto :goto_0

    .line 315
    :pswitch_2
    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->exception:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 316
    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->exception:Ljava/util/ArrayList;

    invoke-direct {p0, v3}, Lcom/itextpdf/layout/hyphenation/PatternParser;->normalizeException(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v3

    iput-object v3, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->exception:Ljava/util/ArrayList;

    .line 317
    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->consumer:Lcom/itextpdf/layout/hyphenation/IPatternConsumer;

    iget-object v4, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->exception:Ljava/util/ArrayList;

    invoke-direct {p0, v4}, Lcom/itextpdf/layout/hyphenation/PatternParser;->getExceptionWord(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->exception:Ljava/util/ArrayList;

    .line 318
    invoke-virtual {v5}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    .line 317
    invoke-interface {v3, v4, v5}, Lcom/itextpdf/layout/hyphenation/IPatternConsumer;->addException(Ljava/lang/String;Ljava/util/List;)V

    .line 319
    goto :goto_0

    .line 312
    :pswitch_3
    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->consumer:Lcom/itextpdf/layout/hyphenation/IPatternConsumer;

    invoke-interface {v3, v0}, Lcom/itextpdf/layout/hyphenation/IPatternConsumer;->addClass(Ljava/lang/String;)V

    .line 313
    nop

    .line 330
    :goto_0
    iget v3, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->currElement:I

    if-eq v3, v2, :cond_0

    .line 331
    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->token:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 334
    .end local v0    # "word":Ljava/lang/String;
    :cond_0
    iget v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->currElement:I

    const/4 v3, 0x1

    if-ne v0, v3, :cond_1

    .line 335
    iput-boolean v3, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->hasClasses:Z

    .line 337
    :cond_1
    iget v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->currElement:I

    if-ne v0, v2, :cond_2

    .line 338
    const/4 v0, 0x2

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->currElement:I

    goto :goto_1

    .line 340
    :cond_2
    iput v1, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->currElement:I

    .line 343
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public error(Lorg/xml/sax/SAXParseException;)V
    .locals 2
    .param p1, "ex"    # Lorg/xml/sax/SAXParseException;

    .line 393
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[Error] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/itextpdf/layout/hyphenation/PatternParser;->getLocationString(Lorg/xml/sax/SAXParseException;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->errMsg:Ljava/lang/String;

    .line 394
    return-void
.end method

.method public fatalError(Lorg/xml/sax/SAXParseException;)V
    .locals 2
    .param p1, "ex"    # Lorg/xml/sax/SAXParseException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 400
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[Fatal Error] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/itextpdf/layout/hyphenation/PatternParser;->getLocationString(Lorg/xml/sax/SAXParseException;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 401
    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->errMsg:Ljava/lang/String;

    .line 402
    throw p1
.end method

.method protected getExternalClasses()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 248
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->parser:Lorg/xml/sax/XMLReader;

    .line 249
    .local v0, "mainParser":Lorg/xml/sax/XMLReader;
    invoke-static {}, Lcom/itextpdf/layout/hyphenation/PatternParser;->createParser()Lorg/xml/sax/XMLReader;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->parser:Lorg/xml/sax/XMLReader;

    .line 250
    iget-object v1, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->parser:Lorg/xml/sax/XMLReader;

    invoke-interface {v1, p0}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 251
    iget-object v1, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->parser:Lorg/xml/sax/XMLReader;

    invoke-interface {v1, p0}, Lorg/xml/sax/XMLReader;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    .line 252
    const-string v1, "com/itextpdf/hyph/external/classes.xml"

    invoke-static {v1}, Lcom/itextpdf/io/util/ResourceUtil;->getResourceStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 253
    .local v1, "stream":Ljava/io/InputStream;
    new-instance v2, Lorg/xml/sax/InputSource;

    invoke-direct {v2, v1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 255
    .local v2, "source":Lorg/xml/sax/InputSource;
    :try_start_0
    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->parser:Lorg/xml/sax/XMLReader;

    invoke-interface {v3, v2}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 259
    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->parser:Lorg/xml/sax/XMLReader;

    .line 260
    nop

    .line 261
    return-void

    .line 259
    :catchall_0
    move-exception v3

    goto :goto_0

    .line 256
    :catch_0
    move-exception v3

    .line 257
    .local v3, "ioe":Ljava/io/IOException;
    :try_start_1
    new-instance v4, Lorg/xml/sax/SAXException;

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/String;)V

    .end local v0    # "mainParser":Lorg/xml/sax/XMLReader;
    .end local v1    # "stream":Ljava/io/InputStream;
    .end local v2    # "source":Lorg/xml/sax/InputSource;
    throw v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 259
    .end local v3    # "ioe":Ljava/io/IOException;
    .restart local v0    # "mainParser":Lorg/xml/sax/XMLReader;
    .restart local v1    # "stream":Ljava/io/InputStream;
    .restart local v2    # "source":Lorg/xml/sax/InputSource;
    :goto_0
    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->parser:Lorg/xml/sax/XMLReader;

    .line 260
    throw v3
.end method

.method public parse(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 5
    .param p1, "stream"    # Ljava/io/InputStream;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/layout/hyphenation/HyphenationException;
        }
    .end annotation

    .line 97
    new-instance v0, Lorg/xml/sax/InputSource;

    invoke-direct {v0, p1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    .line 98
    .local v0, "source":Lorg/xml/sax/InputSource;
    invoke-virtual {v0, p2}, Lorg/xml/sax/InputSource;->setSystemId(Ljava/lang/String;)V

    .line 100
    :try_start_0
    iget-object v1, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->parser:Lorg/xml/sax/XMLReader;

    invoke-interface {v1, v0}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    nop

    .line 108
    return-void

    .line 105
    :catch_0
    move-exception v1

    .line 106
    .local v1, "e":Lorg/xml/sax/SAXException;
    new-instance v2, Lcom/itextpdf/layout/hyphenation/HyphenationException;

    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->errMsg:Ljava/lang/String;

    invoke-direct {v2, v3}, Lcom/itextpdf/layout/hyphenation/HyphenationException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 103
    .end local v1    # "e":Lorg/xml/sax/SAXException;
    :catch_1
    move-exception v1

    .line 104
    .local v1, "ioe":Ljava/io/IOException;
    new-instance v2, Lcom/itextpdf/layout/hyphenation/HyphenationException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/itextpdf/layout/hyphenation/HyphenationException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 101
    .end local v1    # "ioe":Ljava/io/IOException;
    :catch_2
    move-exception v1

    .line 102
    .local v1, "fnfe":Ljava/io/FileNotFoundException;
    new-instance v2, Lcom/itextpdf/layout/hyphenation/HyphenationException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "File not found: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/itextpdf/layout/hyphenation/HyphenationException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public parse(Ljava/lang/String;)V
    .locals 1
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/layout/hyphenation/HyphenationException;,
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 86
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/hyphenation/PatternParser;->parse(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 87
    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 6
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "local"    # Ljava/lang/String;
    .param p3, "raw"    # Ljava/lang/String;
    .param p4, "attrs"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 273
    const-string v0, "hyphen-char"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 274
    const-string/jumbo v0, "value"

    invoke-interface {p4, v0}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 275
    .local v0, "h":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-ne v3, v2, :cond_0

    .line 276
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    iput-char v2, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->hyphenChar:C

    .line 278
    .end local v0    # "h":Ljava/lang/String;
    :cond_0
    goto/16 :goto_0

    :cond_1
    const-string v0, "classes"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 279
    iput v2, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->currElement:I

    goto :goto_0

    .line 280
    :cond_2
    const-string/jumbo v0, "patterns"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 281
    iget-boolean v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->hasClasses:Z

    if-nez v0, :cond_3

    .line 282
    invoke-virtual {p0}, Lcom/itextpdf/layout/hyphenation/PatternParser;->getExternalClasses()V

    .line 284
    :cond_3
    const/4 v0, 0x3

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->currElement:I

    goto :goto_0

    .line 285
    :cond_4
    const-string v0, "exceptions"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 286
    iget-boolean v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->hasClasses:Z

    if-nez v0, :cond_5

    .line 287
    invoke-virtual {p0}, Lcom/itextpdf/layout/hyphenation/PatternParser;->getExternalClasses()V

    .line 289
    :cond_5
    const/4 v0, 0x2

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->currElement:I

    .line 290
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->exception:Ljava/util/ArrayList;

    goto :goto_0

    .line 291
    :cond_6
    const-string v0, "hyphen"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 292
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->token:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_7

    .line 293
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->exception:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->token:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 295
    :cond_7
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->exception:Ljava/util/ArrayList;

    new-instance v2, Lcom/itextpdf/layout/hyphenation/Hyphen;

    const-string/jumbo v3, "pre"

    invoke-interface {p4, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 296
    const-string/jumbo v4, "no"

    invoke-interface {p4, v4}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 297
    const-string/jumbo v5, "post"

    invoke-interface {p4, v5}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v3, v4, v5}, Lcom/itextpdf/layout/hyphenation/Hyphen;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 298
    const/4 v0, 0x4

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->currElement:I

    .line 300
    :cond_8
    :goto_0
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->token:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 301
    return-void
.end method

.method public warning(Lorg/xml/sax/SAXParseException;)V
    .locals 2
    .param p1, "ex"    # Lorg/xml/sax/SAXParseException;

    .line 385
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[Warning] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/itextpdf/layout/hyphenation/PatternParser;->getLocationString(Lorg/xml/sax/SAXParseException;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 386
    invoke-virtual {p1}, Lorg/xml/sax/SAXParseException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/PatternParser;->errMsg:Ljava/lang/String;

    .line 387
    return-void
.end method
