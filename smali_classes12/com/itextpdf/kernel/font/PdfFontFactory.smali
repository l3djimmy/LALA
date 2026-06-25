.class public final Lcom/itextpdf/kernel/font/PdfFontFactory;
.super Ljava/lang/Object;
.source "PdfFontFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;
    }
.end annotation


# static fields
.field private static final DEFAULT_CACHED:Z = true

.field private static final DEFAULT_EMBEDDING:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

.field private static final DEFAULT_ENCODING:Ljava/lang/String; = ""


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 58
    sget-object v0, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;->PREFER_EMBEDDED:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    sput-object v0, Lcom/itextpdf/kernel/font/PdfFontFactory;->DEFAULT_EMBEDDING:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createFont()Lcom/itextpdf/kernel/font/PdfFont;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 74
    const-string v0, "Helvetica"

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0
.end method

.method public static createFont(Lcom/itextpdf/io/font/FontProgram;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1
    .param p0, "fontProgram"    # Lcom/itextpdf/io/font/FontProgram;

    .line 281
    const-string v0, ""

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont(Lcom/itextpdf/io/font/FontProgram;Ljava/lang/String;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0
.end method

.method public static createFont(Lcom/itextpdf/io/font/FontProgram;Ljava/lang/String;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1
    .param p0, "fontProgram"    # Lcom/itextpdf/io/font/FontProgram;
    .param p1, "encoding"    # Ljava/lang/String;

    .line 271
    sget-object v0, Lcom/itextpdf/kernel/font/PdfFontFactory;->DEFAULT_EMBEDDING:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    invoke-static {p0, p1, v0}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont(Lcom/itextpdf/io/font/FontProgram;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0
.end method

.method public static createFont(Lcom/itextpdf/io/font/FontProgram;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 2
    .param p0, "fontProgram"    # Lcom/itextpdf/io/font/FontProgram;
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "embeddingStrategy"    # Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    .line 242
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 243
    return-object v0

    .line 244
    :cond_0
    instance-of v1, p0, Lcom/itextpdf/io/font/Type1Font;

    if-eqz v1, :cond_1

    .line 245
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/io/font/Type1Font;

    invoke-static {v0, p1, p2}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFontFromType1FontProgram(Lcom/itextpdf/io/font/Type1Font;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfType1Font;

    move-result-object v0

    return-object v0

    .line 246
    :cond_1
    instance-of v1, p0, Lcom/itextpdf/io/font/TrueTypeFont;

    if-eqz v1, :cond_6

    .line 247
    if-eqz p1, :cond_2

    const-string v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 248
    :cond_2
    const-string p1, "Identity-H"

    .line 250
    :cond_3
    const-string v0, "Identity-H"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "Identity-V"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_0

    .line 253
    :cond_4
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/io/font/TrueTypeFont;

    invoke-static {v0, p1, p2}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createTrueTypeFontFromTrueTypeFontProgram(Lcom/itextpdf/io/font/TrueTypeFont;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfTrueTypeFont;

    move-result-object v0

    return-object v0

    .line 251
    :cond_5
    :goto_0
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/io/font/TrueTypeFont;

    invoke-static {v0, p1, p2}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createType0FontFromTrueTypeFontProgram(Lcom/itextpdf/io/font/TrueTypeFont;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfType0Font;

    move-result-object v0

    return-object v0

    .line 256
    :cond_6
    instance-of v1, p0, Lcom/itextpdf/io/font/CidFont;

    if-eqz v1, :cond_7

    .line 257
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/io/font/CidFont;

    invoke-static {v0, p1, p2}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createType0FontFromCidFontProgram(Lcom/itextpdf/io/font/CidFont;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfType0Font;

    move-result-object v0

    return-object v0

    .line 259
    :cond_7
    return-object v0
.end method

.method public static createFont(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 3
    .param p0, "fontDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 92
    if-eqz p0, :cond_5

    .line 95
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 96
    .local v0, "subtypeObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type1:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 97
    new-instance v1, Lcom/itextpdf/kernel/font/PdfType1Font;

    invoke-direct {v1, p0}, Lcom/itextpdf/kernel/font/PdfType1Font;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v1

    .line 98
    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type0:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 99
    new-instance v1, Lcom/itextpdf/kernel/font/PdfType0Font;

    invoke-direct {v1, p0}, Lcom/itextpdf/kernel/font/PdfType0Font;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v1

    .line 100
    :cond_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->TrueType:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 101
    new-instance v1, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;

    invoke-direct {v1, p0}, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v1

    .line 102
    :cond_2
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type3:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 103
    new-instance v1, Lcom/itextpdf/kernel/font/PdfType3Font;

    invoke-direct {v1, p0}, Lcom/itextpdf/kernel/font/PdfType3Font;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v1

    .line 104
    :cond_3
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->MMType1:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 106
    new-instance v1, Lcom/itextpdf/kernel/font/PdfType1Font;

    invoke-direct {v1, p0}, Lcom/itextpdf/kernel/font/PdfType1Font;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v1

    .line 108
    :cond_4
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Dictionary doesn\'t have supported font data."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 93
    .end local v0    # "subtypeObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_5
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot create font from null pdf dictionary."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static createFont(Ljava/lang/String;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1
    .param p0, "fontProgram"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 169
    const-string v0, ""

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0
.end method

.method public static createFont(Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1
    .param p0, "fontProgram"    # Ljava/lang/String;
    .param p1, "embeddingStrategy"    # Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 195
    const-string v0, ""

    invoke-static {p0, v0, p1}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0
.end method

.method public static createFont(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1
    .param p0, "fontProgram"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 181
    sget-object v0, Lcom/itextpdf/kernel/font/PdfFontFactory;->DEFAULT_EMBEDDING:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    invoke-static {p0, p1, v0}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0
.end method

.method public static createFont(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1
    .param p0, "fontProgram"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "embeddingStrategy"    # Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 211
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;Z)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0
.end method

.method public static createFont(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1
    .param p0, "fontProgram"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "embeddingStrategy"    # Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;
    .param p3, "cacheTo"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 146
    if-nez p3, :cond_0

    .line 147
    invoke-static {p0, p1, p2}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0

    .line 150
    :cond_0
    invoke-virtual {p3, p0, p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->findFont(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    .line 151
    .local v0, "pdfFont":Lcom/itextpdf/kernel/font/PdfFont;
    if-nez v0, :cond_1

    .line 152
    invoke-static {p0, p1, p2}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    .line 153
    if-eqz v0, :cond_1

    .line 154
    invoke-virtual {v0, p3}, Lcom/itextpdf/kernel/font/PdfFont;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 158
    :cond_1
    return-object v0
.end method

.method public static createFont(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;Z)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 2
    .param p0, "fontProgram"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "embeddingStrategy"    # Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;
    .param p3, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 228
    invoke-static {p0, p1, p3}, Lcom/itextpdf/io/font/FontProgramFactory;->createFont(Ljava/lang/String;Ljava/lang/String;Z)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    .line 229
    .local v0, "fp":Lcom/itextpdf/io/font/FontProgram;
    invoke-static {v0, p1, p2}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont(Lcom/itextpdf/io/font/FontProgram;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v1

    return-object v1
.end method

.method public static createFont(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1
    .param p0, "fontProgram"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "cacheTo"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 127
    sget-object v0, Lcom/itextpdf/kernel/font/PdfFontFactory;->DEFAULT_EMBEDDING:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    invoke-static {p0, p1, v0, p2}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0
.end method

.method public static createFont([BLcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1
    .param p0, "fontProgram"    # [B
    .param p1, "embeddingStrategy"    # Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 307
    const-string v0, ""

    invoke-static {p0, v0, p1}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont([BLjava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0
.end method

.method public static createFont([BLjava/lang/String;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1
    .param p0, "fontProgram"    # [B
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 293
    sget-object v0, Lcom/itextpdf/kernel/font/PdfFontFactory;->DEFAULT_EMBEDDING:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    invoke-static {p0, p1, v0}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont([BLjava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0
.end method

.method public static createFont([BLjava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1
    .param p0, "fontProgram"    # [B
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "embeddingStrategy"    # Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 323
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont([BLjava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;Z)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0
.end method

.method public static createFont([BLjava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;Z)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 2
    .param p0, "fontProgram"    # [B
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "embeddingStrategy"    # Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;
    .param p3, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 340
    invoke-static {p0, p3}, Lcom/itextpdf/io/font/FontProgramFactory;->createFont([BZ)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    .line 341
    .local v0, "fp":Lcom/itextpdf/io/font/FontProgram;
    invoke-static {v0, p1, p2}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont(Lcom/itextpdf/io/font/FontProgram;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v1

    return-object v1
.end method

.method private static createFontFromType1FontProgram(Lcom/itextpdf/io/font/Type1Font;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfType1Font;
    .locals 2
    .param p0, "fontProgram"    # Lcom/itextpdf/io/font/Type1Font;
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "embeddingStrategy"    # Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    .line 640
    sget-object v0, Lcom/itextpdf/kernel/font/PdfFontFactory$1;->$SwitchMap$com$itextpdf$kernel$font$PdfFontFactory$EmbeddingStrategy:[I

    invoke-virtual {p2}, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 656
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Unsupported font embedding strategy."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 653
    :pswitch_0
    const/4 v0, 0x0

    .line 654
    .local v0, "embedded":Z
    goto :goto_0

    .line 649
    .end local v0    # "embedded":Z
    :pswitch_1
    invoke-virtual {p0}, Lcom/itextpdf/io/font/Type1Font;->isBuiltInFont()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    .line 650
    .restart local v0    # "embedded":Z
    goto :goto_0

    .line 642
    .end local v0    # "embedded":Z
    :pswitch_2
    invoke-virtual {p0}, Lcom/itextpdf/io/font/Type1Font;->isBuiltInFont()Z

    move-result v0

    if-nez v0, :cond_0

    .line 645
    const/4 v0, 0x1

    .line 646
    .restart local v0    # "embedded":Z
    nop

    .line 658
    :goto_0
    new-instance v1, Lcom/itextpdf/kernel/font/PdfType1Font;

    invoke-direct {v1, p0, p1, v0}, Lcom/itextpdf/kernel/font/PdfType1Font;-><init>(Lcom/itextpdf/io/font/Type1Font;Ljava/lang/String;Z)V

    return-object v1

    .line 643
    .end local v0    # "embedded":Z
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Standard fonts cannot be embedded."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static createRegisteredFont(Ljava/lang/String;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1
    .param p0, "fontName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 554
    const-string v0, ""

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createRegisteredFont(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0
.end method

.method public static createRegisteredFont(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1
    .param p0, "fontName"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 535
    sget-object v0, Lcom/itextpdf/kernel/font/PdfFontFactory;->DEFAULT_EMBEDDING:Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    invoke-static {p0, p1, v0}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createRegisteredFont(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0
.end method

.method public static createRegisteredFont(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1
    .param p0, "fontName"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "embeddingStrategy"    # Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 488
    const/4 v0, -0x1

    invoke-static {p0, p1, p2, v0}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createRegisteredFont(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;I)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0
.end method

.method public static createRegisteredFont(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;I)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1
    .param p0, "fontName"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "embeddingStrategy"    # Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;
    .param p3, "style"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 515
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, p3, v0}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createRegisteredFont(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;IZ)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0
.end method

.method public static createRegisteredFont(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;IZ)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 2
    .param p0, "fontName"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "embeddingStrategy"    # Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;
    .param p3, "style"    # I
    .param p4, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 434
    invoke-static {p0, p3, p4}, Lcom/itextpdf/io/font/FontProgramFactory;->createRegisteredFont(Ljava/lang/String;IZ)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    .line 435
    .local v0, "fp":Lcom/itextpdf/io/font/FontProgram;
    invoke-static {v0, p1, p2}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont(Lcom/itextpdf/io/font/FontProgram;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v1

    return-object v1
.end method

.method public static createRegisteredFont(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;Z)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1
    .param p0, "fontName"    # Ljava/lang/String;
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "embeddingStrategy"    # Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;
    .param p3, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 462
    const/4 v0, -0x1

    invoke-static {p0, p1, p2, v0, p3}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createRegisteredFont(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;IZ)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0
.end method

.method private static createTrueTypeFontFromTrueTypeFontProgram(Lcom/itextpdf/io/font/TrueTypeFont;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfTrueTypeFont;
    .locals 3
    .param p0, "fontProgram"    # Lcom/itextpdf/io/font/TrueTypeFont;
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "embeddingStrategy"    # Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    .line 683
    sget-object v0, Lcom/itextpdf/kernel/font/PdfFontFactory$1;->$SwitchMap$com$itextpdf$kernel$font$PdfFontFactory$EmbeddingStrategy:[I

    invoke-virtual {p2}, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 699
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Unsupported font embedding strategy."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 696
    :pswitch_0
    const/4 v0, 0x0

    .line 697
    .local v0, "embedded":Z
    goto :goto_0

    .line 692
    .end local v0    # "embedded":Z
    :pswitch_1
    invoke-virtual {p0}, Lcom/itextpdf/io/font/TrueTypeFont;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontNames;->allowEmbedding()Z

    move-result v0

    .line 693
    .restart local v0    # "embedded":Z
    goto :goto_0

    .line 685
    .end local v0    # "embedded":Z
    :pswitch_2
    invoke-virtual {p0}, Lcom/itextpdf/io/font/TrueTypeFont;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontNames;->allowEmbedding()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 689
    const/4 v0, 0x1

    .line 690
    .restart local v0    # "embedded":Z
    nop

    .line 701
    :goto_0
    new-instance v1, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;

    invoke-direct {v1, p0, p1, v0}, Lcom/itextpdf/kernel/font/PdfTrueTypeFont;-><init>(Lcom/itextpdf/io/font/TrueTypeFont;Ljava/lang/String;Z)V

    return-object v1

    .line 686
    .end local v0    # "embedded":Z
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string/jumbo v1, "{0} cannot be embedded due to licensing restrictions."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 687
    invoke-virtual {p0}, Lcom/itextpdf/io/font/TrueTypeFont;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/io/font/FontNames;->getFontName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/itextpdf/io/font/TrueTypeFont;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/io/font/FontNames;->getStyle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 686
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v0

    throw v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static createTtcFont(Ljava/lang/String;ILjava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;Z)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 2
    .param p0, "ttc"    # Ljava/lang/String;
    .param p1, "ttcIndex"    # I
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "embeddingStrategy"    # Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;
    .param p4, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 381
    invoke-static {p0, p1, p4}, Lcom/itextpdf/io/font/FontProgramFactory;->createFont(Ljava/lang/String;IZ)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    .line 382
    .local v0, "fontProgram":Lcom/itextpdf/io/font/FontProgram;
    invoke-static {v0, p2, p3}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont(Lcom/itextpdf/io/font/FontProgram;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v1

    return-object v1
.end method

.method public static createTtcFont([BILjava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;Z)Lcom/itextpdf/kernel/font/PdfFont;
    .locals 2
    .param p0, "ttc"    # [B
    .param p1, "ttcIndex"    # I
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "embeddingStrategy"    # Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;
    .param p4, "cached"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 361
    invoke-static {p0, p1, p4}, Lcom/itextpdf/io/font/FontProgramFactory;->createFont([BIZ)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    .line 362
    .local v0, "fontProgram":Lcom/itextpdf/io/font/FontProgram;
    invoke-static {v0, p2, p3}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont(Lcom/itextpdf/io/font/FontProgram;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v1

    return-object v1
.end method

.method private static createType0FontFromCidFontProgram(Lcom/itextpdf/io/font/CidFont;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfType0Font;
    .locals 2
    .param p0, "fontProgram"    # Lcom/itextpdf/io/font/CidFont;
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "embeddingStrategy"    # Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    .line 706
    invoke-virtual {p0, p1}, Lcom/itextpdf/io/font/CidFont;->compatibleWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 707
    const/4 v0, 0x0

    return-object v0

    .line 709
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/font/PdfFontFactory$1;->$SwitchMap$com$itextpdf$kernel$font$PdfFontFactory$EmbeddingStrategy:[I

    invoke-virtual {p2}, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 718
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Unsupported font embedding strategy."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 716
    :pswitch_0
    new-instance v0, Lcom/itextpdf/kernel/font/PdfType0Font;

    invoke-direct {v0, p0, p1}, Lcom/itextpdf/kernel/font/PdfType0Font;-><init>(Lcom/itextpdf/io/font/CidFont;Ljava/lang/String;)V

    return-object v0

    .line 711
    :pswitch_1
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot embed Type0 font with CID font program based on non-generic predefined CMap."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static createType0FontFromTrueTypeFontProgram(Lcom/itextpdf/io/font/TrueTypeFont;Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;)Lcom/itextpdf/kernel/font/PdfType0Font;
    .locals 3
    .param p0, "fontProgram"    # Lcom/itextpdf/io/font/TrueTypeFont;
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "embeddingStrategy"    # Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;

    .line 663
    invoke-virtual {p0}, Lcom/itextpdf/io/font/TrueTypeFont;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontNames;->allowEmbedding()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 667
    sget-object v0, Lcom/itextpdf/kernel/font/PdfFontFactory$1;->$SwitchMap$com$itextpdf$kernel$font$PdfFontFactory$EmbeddingStrategy:[I

    invoke-virtual {p2}, Lcom/itextpdf/kernel/font/PdfFontFactory$EmbeddingStrategy;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 676
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Unsupported font embedding strategy."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 674
    :pswitch_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "Cannot create Type0 font with true type font program without embedding it."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 672
    :pswitch_1
    new-instance v0, Lcom/itextpdf/kernel/font/PdfType0Font;

    invoke-direct {v0, p0, p1}, Lcom/itextpdf/kernel/font/PdfType0Font;-><init>(Lcom/itextpdf/io/font/TrueTypeFont;Ljava/lang/String;)V

    return-object v0

    .line 664
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string/jumbo v1, "{0} cannot be embedded due to licensing restrictions."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 665
    invoke-virtual {p0}, Lcom/itextpdf/io/font/TrueTypeFont;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/io/font/FontNames;->getFontName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/itextpdf/io/font/TrueTypeFont;->getFontNames()Lcom/itextpdf/io/font/FontNames;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/io/font/FontNames;->getStyle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 664
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v0

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static createType3Font(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/lang/String;Ljava/lang/String;Z)Lcom/itextpdf/kernel/font/PdfType3Font;
    .locals 1
    .param p0, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "fontName"    # Ljava/lang/String;
    .param p2, "fontFamily"    # Ljava/lang/String;
    .param p3, "colorized"    # Z

    .line 406
    new-instance v0, Lcom/itextpdf/kernel/font/PdfType3Font;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/itextpdf/kernel/font/PdfType3Font;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Ljava/lang/String;Ljava/lang/String;Z)V

    return-object v0
.end method

.method public static createType3Font(Lcom/itextpdf/kernel/pdf/PdfDocument;Z)Lcom/itextpdf/kernel/font/PdfType3Font;
    .locals 1
    .param p0, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "colorized"    # Z

    .line 393
    new-instance v0, Lcom/itextpdf/kernel/font/PdfType3Font;

    invoke-direct {v0, p0, p1}, Lcom/itextpdf/kernel/font/PdfType3Font;-><init>(Lcom/itextpdf/kernel/pdf/PdfDocument;Z)V

    return-object v0
.end method

.method public static getRegisteredFamilies()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 624
    invoke-static {}, Lcom/itextpdf/io/font/FontProgramFactory;->getRegisteredFontFamilies()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static getRegisteredFonts()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 615
    invoke-static {}, Lcom/itextpdf/io/font/FontProgramFactory;->getRegisteredFonts()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static isRegistered(Ljava/lang/String;)Z
    .locals 1
    .param p0, "fontName"    # Ljava/lang/String;

    .line 634
    invoke-static {p0}, Lcom/itextpdf/io/font/FontProgramFactory;->isRegisteredFont(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static register(Ljava/lang/String;)V
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .line 576
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/font/PdfFontFactory;->register(Ljava/lang/String;Ljava/lang/String;)V

    .line 577
    return-void
.end method

.method public static register(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "alias"    # Ljava/lang/String;

    .line 586
    invoke-static {p0, p1}, Lcom/itextpdf/io/font/FontProgramFactory;->registerFont(Ljava/lang/String;Ljava/lang/String;)V

    .line 587
    return-void
.end method

.method public static registerDirectory(Ljava/lang/String;)I
    .locals 1
    .param p0, "dirPath"    # Ljava/lang/String;

    .line 596
    invoke-static {p0}, Lcom/itextpdf/io/font/FontProgramFactory;->registerFontDirectory(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static registerFamily(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "familyName"    # Ljava/lang/String;
    .param p1, "fullName"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;

    .line 565
    invoke-static {p0, p1, p2}, Lcom/itextpdf/io/font/FontProgramFactory;->registerFontFamily(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 566
    return-void
.end method

.method public static registerSystemDirectories()I
    .locals 1

    .line 606
    invoke-static {}, Lcom/itextpdf/io/font/FontProgramFactory;->registerSystemFontDirectories()I

    move-result v0

    return v0
.end method
