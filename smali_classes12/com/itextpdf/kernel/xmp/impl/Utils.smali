.class public final Lcom/itextpdf/kernel/xmp/impl/Utils;
.super Ljava/lang/Object;
.source "Utils.java"

# interfaces
.implements Lcom/itextpdf/kernel/xmp/XMPConst;


# static fields
.field public static final UUID_LENGTH:I = 0x24

.field public static final UUID_SEGMENT_COUNT:I = 0x4

.field private static xmlNameChars:[Z

.field private static xmlNameStartChars:[Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 55
    invoke-static {}, Lcom/itextpdf/kernel/xmp/impl/Utils;->initCharTables()V

    .line 56
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    return-void
.end method

.method static checkUUIDFormat(Ljava/lang/String;)Z
    .locals 7
    .param p0, "uuid"    # Ljava/lang/String;

    .line 295
    const/4 v0, 0x1

    .line 296
    .local v0, "result":Z
    const/4 v1, 0x0

    .line 297
    .local v1, "delimCnt":I
    const/4 v2, 0x0

    .line 299
    .local v2, "delimPos":I
    const/4 v3, 0x0

    if-nez p0, :cond_0

    .line 301
    return v3

    .line 304
    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x1

    if-ge v2, v4, :cond_4

    .line 306
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v6, 0x2d

    if-ne v4, v6, :cond_3

    .line 308
    add-int/lit8 v1, v1, 0x1

    .line 309
    if-eqz v0, :cond_2

    const/16 v4, 0x8

    if-eq v2, v4, :cond_1

    const/16 v4, 0xd

    if-eq v2, v4, :cond_1

    const/16 v4, 0x12

    if-eq v2, v4, :cond_1

    const/16 v4, 0x17

    if-ne v2, v4, :cond_2

    :cond_1
    goto :goto_1

    :cond_2
    move v5, v3

    :goto_1
    move v0, v5

    .line 304
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 314
    :cond_4
    if-eqz v0, :cond_5

    const/4 v4, 0x4

    if-ne v4, v1, :cond_5

    const/16 v4, 0x24

    if-ne v4, v2, :cond_5

    move v3, v5

    :cond_5
    return v3
.end method

.method public static escapeXML(Ljava/lang/String;ZZ)Ljava/lang/String;
    .locals 8
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "forAttribute"    # Z
    .param p2, "escapeWhitespaces"    # Z

    .line 394
    const/4 v0, 0x0

    .line 395
    .local v0, "needsEscaping":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xd

    const/16 v4, 0xa

    const/16 v5, 0x9

    if-ge v1, v2, :cond_3

    .line 397
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 398
    .local v2, "c":C
    const/16 v6, 0x3c

    if-eq v2, v6, :cond_2

    const/16 v6, 0x3e

    if-eq v2, v6, :cond_2

    const/16 v6, 0x26

    if-eq v2, v6, :cond_2

    if-eqz p2, :cond_0

    if-eq v2, v5, :cond_2

    if-eq v2, v4, :cond_2

    if-eq v2, v3, :cond_2

    :cond_0
    if-eqz p1, :cond_1

    const/16 v6, 0x22

    if-ne v2, v6, :cond_1

    goto :goto_1

    .line 395
    .end local v2    # "c":C
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 403
    .restart local v2    # "c":C
    :cond_2
    :goto_1
    const/4 v0, 0x1

    .line 404
    nop

    .line 408
    .end local v1    # "i":I
    .end local v2    # "c":C
    :cond_3
    if-nez v0, :cond_4

    .line 411
    return-object p0

    .line 416
    :cond_4
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    mul-int/lit8 v2, v2, 0x4

    div-int/lit8 v2, v2, 0x3

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 417
    .local v1, "buffer":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v2, v6, :cond_8

    .line 419
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 420
    .local v6, "c":C
    if-eqz p2, :cond_6

    if-eq v6, v5, :cond_5

    if-eq v6, v4, :cond_5

    if-eq v6, v3, :cond_5

    goto :goto_3

    .line 437
    :cond_5
    const-string v7, "&#x"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 438
    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 439
    const/16 v7, 0x3b

    invoke-virtual {v1, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_5

    .line 422
    :cond_6
    :goto_3
    sparse-switch v6, :sswitch_data_0

    .line 430
    invoke-virtual {v1, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_5

    .line 427
    :sswitch_0
    const-string v7, "&gt;"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5

    .line 426
    :sswitch_1
    const-string v7, "&lt;"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5

    .line 428
    :sswitch_2
    const-string v7, "&amp;"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_5

    .line 429
    :sswitch_3
    if-eqz p1, :cond_7

    const-string v7, "&quot;"

    goto :goto_4

    :cond_7
    const-string v7, "\""

    :goto_4
    invoke-virtual {v1, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 417
    .end local v6    # "c":C
    :goto_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 442
    .end local v2    # "i":I
    :cond_8
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    nop

    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_3
        0x26 -> :sswitch_2
        0x3c -> :sswitch_1
        0x3e -> :sswitch_0
    .end sparse-switch
.end method

.method private static initCharTables()V
    .locals 6

    .line 518
    const/16 v0, 0x100

    new-array v1, v0, [Z

    sput-object v1, Lcom/itextpdf/kernel/xmp/impl/Utils;->xmlNameChars:[Z

    .line 519
    new-array v0, v0, [Z

    sput-object v0, Lcom/itextpdf/kernel/xmp/impl/Utils;->xmlNameStartChars:[Z

    .line 521
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lcom/itextpdf/kernel/xmp/impl/Utils;->xmlNameChars:[Z

    array-length v1, v1

    if-ge v0, v1, :cond_9

    .line 523
    int-to-char v1, v0

    .line 524
    .local v1, "ch":C
    sget-object v2, Lcom/itextpdf/kernel/xmp/impl/Utils;->xmlNameStartChars:[Z

    const/16 v3, 0x3a

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eq v1, v3, :cond_5

    const/16 v3, 0x41

    if-gt v3, v1, :cond_0

    const/16 v3, 0x5a

    if-le v1, v3, :cond_5

    :cond_0
    const/16 v3, 0x5f

    if-eq v1, v3, :cond_5

    const/16 v3, 0x61

    if-gt v3, v1, :cond_1

    const/16 v3, 0x7a

    if-le v1, v3, :cond_5

    :cond_1
    const/16 v3, 0xc0

    if-gt v3, v1, :cond_2

    const/16 v3, 0xd6

    if-le v1, v3, :cond_5

    :cond_2
    const/16 v3, 0xd8

    if-gt v3, v1, :cond_3

    const/16 v3, 0xf6

    if-le v1, v3, :cond_5

    :cond_3
    const/16 v3, 0xf8

    if-gt v3, v1, :cond_4

    const/16 v3, 0xff

    if-gt v1, v3, :cond_4

    goto :goto_1

    :cond_4
    move v3, v4

    goto :goto_2

    :cond_5
    :goto_1
    move v3, v5

    :goto_2
    aput-boolean v3, v2, v1

    .line 533
    sget-object v2, Lcom/itextpdf/kernel/xmp/impl/Utils;->xmlNameChars:[Z

    sget-object v3, Lcom/itextpdf/kernel/xmp/impl/Utils;->xmlNameStartChars:[Z

    aget-boolean v3, v3, v1

    if-nez v3, :cond_7

    const/16 v3, 0x2d

    if-eq v1, v3, :cond_7

    const/16 v3, 0x2e

    if-eq v1, v3, :cond_7

    const/16 v3, 0x30

    if-gt v3, v1, :cond_6

    const/16 v3, 0x39

    if-le v1, v3, :cond_7

    :cond_6
    const/16 v3, 0xb7

    if-ne v1, v3, :cond_8

    :cond_7
    move v4, v5

    :cond_8
    aput-boolean v4, v2, v1

    .line 521
    .end local v1    # "ch":C
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 540
    .end local v0    # "i":I
    :cond_9
    return-void
.end method

.method static isControlChar(C)Z
    .locals 1
    .param p0, "c"    # C

    .line 374
    const/16 v0, 0x1f

    if-le p0, v0, :cond_0

    const/16 v0, 0x7f

    if-ne p0, v0, :cond_1

    :cond_0
    const/16 v0, 0x9

    if-eq p0, v0, :cond_1

    const/16 v0, 0xa

    if-eq p0, v0, :cond_1

    const/16 v0, 0xd

    if-eq p0, v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static isInternalProperty(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p0, "schema"    # Ljava/lang/String;
    .param p1, "prop"    # Ljava/lang/String;

    .line 184
    const/4 v0, 0x0

    .line 186
    .local v0, "isInternal":Z
    const-string v1, "http://purl.org/dc/elements/1.1/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 188
    const-string v1, "dc:format"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "dc:language"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 190
    :cond_0
    const/4 v0, 0x1

    goto/16 :goto_0

    .line 193
    :cond_1
    const-string v1, "http://ns.adobe.com/xap/1.0/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 195
    const-string/jumbo v1, "xmp:BaseURL"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string/jumbo v1, "xmp:CreatorTool"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 196
    const-string/jumbo v1, "xmp:Format"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string/jumbo v1, "xmp:Locale"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 197
    const-string/jumbo v1, "xmp:MetadataDate"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string/jumbo v1, "xmp:ModifyDate"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 199
    :cond_2
    const/4 v0, 0x1

    goto/16 :goto_0

    .line 202
    :cond_3
    const-string v1, "http://ns.adobe.com/pdf/1.3/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 204
    const-string/jumbo v1, "pdf:BaseURL"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string/jumbo v1, "pdf:Creator"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 205
    const-string/jumbo v1, "pdf:ModDate"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string/jumbo v1, "pdf:PDFVersion"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 206
    const-string/jumbo v1, "pdf:Producer"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 208
    :cond_4
    const/4 v0, 0x1

    goto/16 :goto_0

    .line 211
    :cond_5
    const-string v1, "http://ns.adobe.com/tiff/1.0/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 213
    const/4 v0, 0x1

    .line 214
    const-string/jumbo v1, "tiff:ImageDescription"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string/jumbo v1, "tiff:Artist"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 215
    const-string/jumbo v1, "tiff:Copyright"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 217
    :cond_6
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 220
    :cond_7
    const-string v1, "http://ns.adobe.com/exif/1.0/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 222
    const/4 v0, 0x1

    .line 223
    const-string v1, "exif:UserComment"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 225
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 228
    :cond_8
    const-string v1, "http://ns.adobe.com/exif/1.0/aux/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 230
    const/4 v0, 0x1

    goto/16 :goto_0

    .line 232
    :cond_9
    const-string v1, "http://ns.adobe.com/photoshop/1.0/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 234
    const-string/jumbo v1, "photoshop:ICCProfile"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 236
    const/4 v0, 0x1

    goto/16 :goto_0

    .line 239
    :cond_a
    const-string v1, "http://ns.adobe.com/camera-raw-settings/1.0/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 241
    const-string v1, "crs:Version"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b

    const-string v1, "crs:RawFileName"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b

    .line 242
    const-string v1, "crs:ToneCurveName"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 244
    :cond_b
    const/4 v0, 0x1

    goto :goto_0

    .line 247
    :cond_c
    const-string v1, "http://ns.adobe.com/StockPhoto/1.0/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 249
    const/4 v0, 0x1

    goto :goto_0

    .line 251
    :cond_d
    const-string v1, "http://ns.adobe.com/xap/1.0/mm/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 253
    const/4 v0, 0x1

    goto :goto_0

    .line 255
    :cond_e
    const-string v1, "http://ns.adobe.com/xap/1.0/t/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 257
    const/4 v0, 0x1

    goto :goto_0

    .line 259
    :cond_f
    const-string v1, "http://ns.adobe.com/xap/1.0/t/pg/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 261
    const/4 v0, 0x1

    goto :goto_0

    .line 263
    :cond_10
    const-string v1, "http://ns.adobe.com/xap/1.0/g/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 265
    const/4 v0, 0x1

    goto :goto_0

    .line 267
    :cond_11
    const-string v1, "http://ns.adobe.com/xap/1.0/g/img/"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 269
    const/4 v0, 0x1

    goto :goto_0

    .line 271
    :cond_12
    const-string v1, "http://ns.adobe.com/xap/1.0/sType/Font#"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 273
    const/4 v0, 0x1

    .line 276
    :cond_13
    :goto_0
    return v0
.end method

.method private static isNameChar(C)Z
    .locals 1
    .param p0, "ch"    # C

    .line 503
    const/16 v0, 0xff

    if-gt p0, v0, :cond_0

    sget-object v0, Lcom/itextpdf/kernel/xmp/impl/Utils;->xmlNameChars:[Z

    aget-boolean v0, v0, p0

    if-nez v0, :cond_3

    .line 505
    :cond_0
    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/impl/Utils;->isNameStartChar(C)Z

    move-result v0

    if-nez v0, :cond_3

    const/16 v0, 0x300

    if-lt p0, v0, :cond_1

    const/16 v0, 0x36f

    if-le p0, v0, :cond_3

    :cond_1
    const/16 v0, 0x203f

    if-lt p0, v0, :cond_2

    const/16 v0, 0x2040

    if-gt p0, v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    :cond_3
    :goto_0
    const/4 v0, 0x1

    .line 503
    :goto_1
    return v0
.end method

.method private static isNameStartChar(C)Z
    .locals 1
    .param p0, "ch"    # C

    .line 478
    const/16 v0, 0xff

    if-gt p0, v0, :cond_0

    sget-object v0, Lcom/itextpdf/kernel/xmp/impl/Utils;->xmlNameStartChars:[Z

    aget-boolean v0, v0, p0

    if-nez v0, :cond_a

    :cond_0
    const/16 v0, 0x100

    if-lt p0, v0, :cond_1

    const/16 v0, 0x2ff

    if-le p0, v0, :cond_a

    :cond_1
    const/16 v0, 0x370

    if-lt p0, v0, :cond_2

    const/16 v0, 0x37d

    if-le p0, v0, :cond_a

    :cond_2
    const/16 v0, 0x37f

    if-lt p0, v0, :cond_3

    const/16 v0, 0x1fff

    if-le p0, v0, :cond_a

    :cond_3
    const/16 v0, 0x200c

    if-lt p0, v0, :cond_4

    const/16 v0, 0x200d

    if-le p0, v0, :cond_a

    :cond_4
    const/16 v0, 0x2070

    if-lt p0, v0, :cond_5

    const/16 v0, 0x218f

    if-le p0, v0, :cond_a

    :cond_5
    const/16 v0, 0x2c00

    if-lt p0, v0, :cond_6

    const/16 v0, 0x2fef

    if-le p0, v0, :cond_a

    :cond_6
    const/16 v0, 0x3001

    if-lt p0, v0, :cond_7

    const v0, 0xd7ff

    if-le p0, v0, :cond_a

    :cond_7
    const v0, 0xf900

    if-lt p0, v0, :cond_8

    const v0, 0xfdcf

    if-le p0, v0, :cond_a

    :cond_8
    const v0, 0xfdf0

    if-lt p0, v0, :cond_9

    const v0, 0xfffd

    if-le p0, v0, :cond_a

    :cond_9
    const/high16 v0, 0x10000

    if-lt p0, v0, :cond_b

    const v0, 0xeffff

    if-gt p0, v0, :cond_b

    :cond_a
    const/4 v0, 0x1

    goto :goto_0

    :cond_b
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isXMLName(Ljava/lang/String;)Z
    .locals 3
    .param p0, "name"    # Ljava/lang/String;

    .line 329
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/Utils;->isNameStartChar(C)Z

    move-result v0

    if-nez v0, :cond_0

    .line 331
    return v1

    .line 333
    :cond_0
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 335
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/itextpdf/kernel/xmp/impl/Utils;->isNameChar(C)Z

    move-result v2

    if-nez v2, :cond_1

    .line 337
    return v1

    .line 333
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 340
    .end local v0    # "i":I
    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method public static isXMLNameNS(Ljava/lang/String;)Z
    .locals 4
    .param p0, "name"    # Ljava/lang/String;

    .line 353
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x3a

    const/4 v2, 0x0

    if-lez v0, :cond_1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/Utils;->isNameStartChar(C)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v1, :cond_1

    .line 355
    :cond_0
    return v2

    .line 357
    :cond_1
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_4

    .line 359
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lcom/itextpdf/kernel/xmp/impl/Utils;->isNameChar(C)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v1, :cond_2

    goto :goto_1

    .line 357
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 361
    :cond_3
    :goto_1
    return v2

    .line 364
    .end local v0    # "i":I
    :cond_4
    const/4 v0, 0x1

    return v0
.end method

.method public static normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "value"    # Ljava/lang/String;

    .line 86
    const-string/jumbo v0, "x-default"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 88
    return-object p0

    .line 91
    :cond_0
    const/4 v0, 0x1

    .line 92
    .local v0, "subTag":I
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 94
    .local v1, "buffer":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 96
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_0

    .line 109
    const/4 v3, 0x2

    if-eq v0, v3, :cond_1

    .line 111
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 101
    :sswitch_0
    const/16 v3, 0x2d

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 102
    add-int/lit8 v0, v0, 0x1

    .line 103
    goto :goto_1

    .line 106
    :sswitch_1
    goto :goto_1

    .line 115
    :cond_1
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 94
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 120
    .end local v2    # "i":I
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    nop

    :sswitch_data_0
    .sparse-switch
        0x20 -> :sswitch_1
        0x2d -> :sswitch_0
        0x5f -> :sswitch_0
    .end sparse-switch
.end method

.method static removeControlChars(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "value"    # Ljava/lang/String;

    .line 456
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 457
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 459
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/itextpdf/kernel/xmp/impl/Utils;->isControlChar(C)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 461
    const/16 v2, 0x20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 457
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 464
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method static splitNameAndValue(Ljava/lang/String;)[Ljava/lang/String;
    .locals 9
    .param p0, "selector"    # Ljava/lang/String;

    .line 145
    const/16 v0, 0x3d

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 146
    .local v0, "eq":I
    const/4 v1, 0x1

    .line 147
    .local v1, "pos":I
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x3f

    if-ne v2, v3, :cond_0

    .line 149
    add-int/lit8 v1, v1, 0x1

    .line 151
    :cond_0
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 154
    .local v2, "name":Ljava/lang/String;
    add-int/lit8 v1, v0, 0x1

    .line 155
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 156
    .local v3, "quote":C
    const/4 v4, 0x1

    add-int/2addr v1, v4

    .line 157
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x2

    sub-int/2addr v5, v6

    .line 158
    .local v5, "end":I
    new-instance v7, Ljava/lang/StringBuffer;

    sub-int v8, v5, v0

    invoke-direct {v7, v8}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 159
    .local v7, "value":Ljava/lang/StringBuffer;
    :cond_1
    :goto_0
    if-ge v1, v5, :cond_2

    .line 161
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 162
    add-int/lit8 v1, v1, 0x1

    .line 163
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-ne v8, v3, :cond_1

    .line 166
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 169
    :cond_2
    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    aput-object v2, v6, v8

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v4

    return-object v6
.end method
