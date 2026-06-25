.class public Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;
.super Ljava/lang/Object;
.source "TaggedPdfReaderTool.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$MarkedContentEventListener;
    }
.end annotation


# instance fields
.field protected document:Lcom/itextpdf/kernel/pdf/PdfDocument;

.field protected out:Ljava/io/OutputStreamWriter;

.field protected parsedTags:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field protected rootTag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->parsedTags:Ljava/util/Map;

    .line 74
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 75
    return-void
.end method

.method protected static escapeXML(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 7
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "onlyASCII"    # Z

    .line 289
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 290
    .local v0, "cc":[C
    array-length v1, v0

    .line 291
    .local v1, "len":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 292
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_0
    if-ge v3, v1, :cond_2

    .line 293
    aget-char v4, v0, v3

    .line 294
    .local v4, "c":I
    sparse-switch v4, :sswitch_data_0

    .line 311
    invoke-static {v4}, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->isValidCharacterValue(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 312
    if-eqz p1, :cond_0

    const/16 v5, 0x7f

    if-le v4, v5, :cond_0

    .line 313
    const-string v5, "&#"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x3b

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 299
    :sswitch_0
    const-string v5, "&gt;"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    goto :goto_1

    .line 296
    :sswitch_1
    const-string v5, "&lt;"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    goto :goto_1

    .line 308
    :sswitch_2
    const-string v5, "&apos;"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    goto :goto_1

    .line 302
    :sswitch_3
    const-string v5, "&amp;"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    goto :goto_1

    .line 305
    :sswitch_4
    const-string v5, "&quot;"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    goto :goto_1

    .line 315
    :cond_0
    int-to-char v5, v4

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 292
    .end local v4    # "c":I
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 319
    .end local v3    # "k":I
    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_4
        0x26 -> :sswitch_3
        0x27 -> :sswitch_2
        0x3c -> :sswitch_1
        0x3e -> :sswitch_0
    .end sparse-switch
.end method

.method protected static fixTagName(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "tag"    # Ljava/lang/String;

    .line 240
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 241
    .local v0, "sb":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_15

    .line 242
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 243
    .local v2, "c":C
    const/16 v3, 0x3a

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eq v2, v3, :cond_d

    const/16 v3, 0x41

    if-lt v2, v3, :cond_0

    const/16 v3, 0x5a

    if-le v2, v3, :cond_d

    :cond_0
    const/16 v3, 0x5f

    if-eq v2, v3, :cond_d

    const/16 v3, 0x61

    if-lt v2, v3, :cond_1

    const/16 v3, 0x7a

    if-le v2, v3, :cond_d

    :cond_1
    const/16 v3, 0xc0

    if-lt v2, v3, :cond_2

    const/16 v3, 0xd6

    if-le v2, v3, :cond_d

    :cond_2
    const/16 v3, 0xd8

    if-lt v2, v3, :cond_3

    const/16 v3, 0xf6

    if-le v2, v3, :cond_d

    :cond_3
    const/16 v3, 0xf8

    if-lt v2, v3, :cond_4

    const/16 v3, 0x2ff

    if-le v2, v3, :cond_d

    :cond_4
    const/16 v3, 0x370

    if-lt v2, v3, :cond_5

    const/16 v3, 0x37d

    if-le v2, v3, :cond_d

    :cond_5
    const/16 v3, 0x37f

    if-lt v2, v3, :cond_6

    const/16 v3, 0x1fff

    if-le v2, v3, :cond_d

    :cond_6
    const/16 v3, 0x200c

    if-lt v2, v3, :cond_7

    const/16 v3, 0x200d

    if-le v2, v3, :cond_d

    :cond_7
    const/16 v3, 0x2070

    if-lt v2, v3, :cond_8

    const/16 v3, 0x218f

    if-le v2, v3, :cond_d

    :cond_8
    const/16 v3, 0x2c00

    if-lt v2, v3, :cond_9

    const/16 v3, 0x2fef

    if-le v2, v3, :cond_d

    :cond_9
    const/16 v3, 0x3001

    if-lt v2, v3, :cond_a

    const v3, 0xd7ff

    if-le v2, v3, :cond_d

    :cond_a
    const v3, 0xf900

    if-lt v2, v3, :cond_b

    const v3, 0xfdcf

    if-le v2, v3, :cond_d

    :cond_b
    const v3, 0xfdf0

    if-lt v2, v3, :cond_c

    const v3, 0xfffd

    if-gt v2, v3, :cond_c

    goto :goto_1

    :cond_c
    move v3, v4

    goto :goto_2

    :cond_d
    :goto_1
    move v3, v5

    .line 259
    .local v3, "nameStart":Z
    :goto_2
    const/16 v6, 0x2d

    if-eq v2, v6, :cond_11

    const/16 v6, 0x2e

    if-eq v2, v6, :cond_11

    const/16 v6, 0x30

    if-lt v2, v6, :cond_e

    const/16 v6, 0x39

    if-le v2, v6, :cond_11

    :cond_e
    const/16 v6, 0xb7

    if-eq v2, v6, :cond_11

    const/16 v6, 0x300

    if-lt v2, v6, :cond_f

    const/16 v6, 0x36f

    if-le v2, v6, :cond_11

    :cond_f
    const/16 v6, 0x203f

    if-lt v2, v6, :cond_10

    const/16 v6, 0x2040

    if-le v2, v6, :cond_11

    :cond_10
    if-eqz v3, :cond_12

    :cond_11
    move v4, v5

    .line 267
    .local v4, "nameMiddle":Z
    :cond_12
    if-nez v1, :cond_13

    .line 268
    if-nez v3, :cond_14

    .line 269
    const/16 v2, 0x5f

    goto :goto_3

    .line 271
    :cond_13
    if-nez v4, :cond_14

    .line 272
    const/16 v2, 0x2d

    .line 274
    :cond_14
    :goto_3
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 241
    .end local v2    # "c":C
    .end local v3    # "nameStart":Z
    .end local v4    # "nameMiddle":Z
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 276
    .end local v1    # "k":I
    :cond_15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static isValidCharacterValue(I)Z
    .locals 1
    .param p0, "c"    # I

    .line 84
    const/16 v0, 0x9

    if-eq p0, v0, :cond_3

    const/16 v0, 0xa

    if-eq p0, v0, :cond_3

    const/16 v0, 0xd

    if-eq p0, v0, :cond_3

    const/16 v0, 0x20

    if-lt p0, v0, :cond_0

    const v0, 0xd7ff

    if-le p0, v0, :cond_3

    :cond_0
    const v0, 0xe000

    if-lt p0, v0, :cond_1

    const v0, 0xfffd

    if-le p0, v0, :cond_3

    :cond_1
    const/high16 v0, 0x10000

    if-lt p0, v0, :cond_2

    const v0, 0x10ffff

    if-gt p0, v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_1

    :cond_3
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method


# virtual methods
.method public convertToXml(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 97
    const-string v0, "UTF-8"

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->convertToXml(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 98
    return-void
.end method

.method public convertToXml(Ljava/io/OutputStream;Ljava/lang/String;)V
    .locals 5
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 108
    new-instance v0, Ljava/io/OutputStreamWriter;

    invoke-static {p2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    .line 109
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->rootTag:Ljava/lang/String;

    const-string v1, ">"

    if-eqz v0, :cond_0

    .line 110
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "<"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->rootTag:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->lineSeparator()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 113
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getStructTreeRoot()Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;

    move-result-object v0

    .line 114
    .local v0, "structTreeRoot":Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;
    if-eqz v0, :cond_2

    .line 117
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructTreeRoot;->getKids()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->inspectKids(Ljava/util/List;)V

    .line 118
    iget-object v2, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->rootTag:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 119
    iget-object v2, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "</"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->rootTag:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 121
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    invoke-virtual {v1}, Ljava/io/OutputStreamWriter;->flush()V

    .line 122
    iget-object v1, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    invoke-virtual {v1}, Ljava/io/OutputStreamWriter;->close()V

    .line 123
    return-void

    .line 115
    :cond_2
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Document doesn\'t contain StructTreeRoot."

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected inspectAttributes(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V
    .locals 9
    .param p1, "kid"    # Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 181
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getAttributes(Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 183
    .local v1, "attrObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v1, :cond_2

    .line 185
    instance-of v2, v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    if-eqz v2, :cond_0

    .line 186
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .local v2, "attrDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    goto :goto_0

    .line 188
    .end local v2    # "attrDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_0
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 191
    .restart local v2    # "attrDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :goto_0
    :try_start_0
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 192
    .local v4, "key":Lcom/itextpdf/kernel/pdf/PdfName;
    iget-object v5, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    const/16 v6, 0x20

    invoke-virtual {v5, v6}, Ljava/io/OutputStreamWriter;->write(I)V

    .line 193
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v5

    .line 194
    .local v5, "attrName":Ljava/lang/String;
    iget-object v6, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-static {v8}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 195
    iget-object v6, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    const-string v7, "=\""

    invoke-virtual {v6, v7}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 196
    iget-object v6, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    invoke-virtual {v2, v4, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;Z)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 197
    iget-object v6, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    const-string v7, "\""

    invoke-virtual {v6, v7}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 198
    .end local v4    # "key":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v5    # "attrName":Ljava/lang/String;
    goto :goto_1

    .line 201
    :cond_1
    goto :goto_2

    .line 199
    :catch_0
    move-exception v0

    .line 200
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Lcom/itextpdf/io/exceptions/IOException;

    const-string v4, "Unknown I/O exception."

    invoke-direct {v3, v4, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 203
    .end local v0    # "e":Ljava/io/IOException;
    .end local v2    # "attrDict":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_2
    :goto_2
    return-void
.end method

.method protected inspectKid(Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;)V
    .locals 10
    .param p1, "kid"    # Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    .line 146
    const-string v0, ">"

    :try_start_0
    instance-of v1, p1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    if-eqz v1, :cond_1

    .line 147
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;

    .line 148
    .local v1, "structElemKid":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getRole()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    .line 149
    .local v2, "s":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 150
    .local v3, "tagN":Ljava/lang/String;
    invoke-static {v3}, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->fixTagName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 151
    .local v4, "tag":Ljava/lang/String;
    iget-object v5, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    const-string v6, "<"

    invoke-virtual {v5, v6}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 152
    iget-object v5, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    invoke-virtual {v5, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 154
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->inspectAttributes(Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;)V

    .line 156
    iget-object v5, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Ljava/lang/System;->lineSeparator()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 158
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getAlt()Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v5

    .line 160
    .local v5, "alt":Lcom/itextpdf/kernel/pdf/PdfString;
    if-eqz v5, :cond_0

    .line 161
    iget-object v6, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    const-string v7, "<alt><![CDATA["

    invoke-virtual {v6, v7}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 162
    iget-object v6, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v7

    const-string v8, "[\\000]*"

    const-string v9, ""

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 163
    iget-object v6, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "]]></alt>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Ljava/lang/System;->lineSeparator()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 166
    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;->getKids()Ljava/util/List;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->inspectKids(Ljava/util/List;)V

    .line 167
    iget-object v6, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    const-string v7, "</"

    invoke-virtual {v6, v7}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 168
    iget-object v6, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    invoke-virtual {v6, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 169
    iget-object v6, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->lineSeparator()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 170
    .end local v1    # "structElemKid":Lcom/itextpdf/kernel/pdf/tagging/PdfStructElem;
    .end local v2    # "s":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v3    # "tagN":Ljava/lang/String;
    .end local v4    # "tag":Ljava/lang/String;
    .end local v5    # "alt":Lcom/itextpdf/kernel/pdf/PdfString;
    goto :goto_0

    :cond_1
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    if-eqz v0, :cond_2

    .line 171
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->parseTag(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;)V

    goto :goto_0

    .line 173
    :cond_2
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    const-string v1, " <flushedKid/> "

    invoke-virtual {v0, v1}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    :goto_0
    nop

    .line 178
    return-void

    .line 175
    :catch_0
    move-exception v0

    .line 176
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v2, "Unknown I/O exception."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected inspectKids(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;",
            ">;)V"
        }
    .end annotation

    .line 136
    .local p1, "kids":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;>;"
    if-nez p1, :cond_0

    .line 137
    return-void

    .line 139
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    .line 140
    .local v1, "kid":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->inspectKid(Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;)V

    .line 141
    .end local v1    # "kid":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    goto :goto_0

    .line 142
    :cond_1
    return-void
.end method

.method protected parseTag(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;)V
    .locals 8
    .param p1, "kid"    # Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    .line 206
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getMcid()I

    move-result v0

    .line 207
    .local v0, "mcid":I
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getPageObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    .line 209
    .local v1, "pageDic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    const-string v2, ""

    .line 210
    .local v2, "tagContent":Ljava/lang/String;
    const/4 v3, -0x1

    if-eq v0, v3, :cond_1

    .line 211
    iget-object v3, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->parsedTags:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 212
    new-instance v3, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$MarkedContentEventListener;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$MarkedContentEventListener;-><init>(Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$1;)V

    .line 214
    .local v3, "listener":Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$MarkedContentEventListener;
    new-instance v4, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;

    invoke-direct {v4, v3}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;)V

    .line 215
    .local v4, "processor":Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;
    iget-object v5, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v5, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v5

    .line 216
    .local v5, "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfPage;->getContentBytes()[B

    move-result-object v6

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfPage;->getResources()Lcom/itextpdf/kernel/pdf/PdfResources;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;->processContent([BLcom/itextpdf/kernel/pdf/PdfResources;)V

    .line 218
    iget-object v6, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->parsedTags:Ljava/util/Map;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$MarkedContentEventListener;->getMcidContent()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v6, v1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    .end local v3    # "listener":Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool$MarkedContentEventListener;
    .end local v4    # "processor":Lcom/itextpdf/kernel/pdf/canvas/parser/PdfCanvasProcessor;
    .end local v5    # "page":Lcom/itextpdf/kernel/pdf/PdfPage;
    :cond_0
    iget-object v3, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->parsedTags:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 222
    iget-object v3, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->parsedTags:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v2, v3

    check-cast v2, Ljava/lang/String;

    goto :goto_0

    .line 225
    :cond_1
    move-object v3, p1

    check-cast v3, Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;

    .line 226
    .local v3, "objRef":Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;->getReferencedObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v4

    .line 227
    .local v4, "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 228
    move-object v5, v4

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v5

    .line 229
    .local v5, "subtype":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfName;->toString()Ljava/lang/String;

    move-result-object v2

    .line 233
    .end local v3    # "objRef":Lcom/itextpdf/kernel/pdf/tagging/PdfObjRef;
    .end local v4    # "object":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v5    # "subtype":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_2
    :goto_0
    :try_start_0
    iget-object v3, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->out:Ljava/io/OutputStreamWriter;

    const/4 v4, 0x1

    invoke-static {v2, v4}, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->escapeXML(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 236
    nop

    .line 237
    return-void

    .line 234
    :catch_0
    move-exception v3

    .line 235
    .local v3, "e":Ljava/io/IOException;
    new-instance v4, Lcom/itextpdf/io/exceptions/IOException;

    const-string v5, "Unknown I/O exception."

    invoke-direct {v4, v5, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method public setRootTag(Ljava/lang/String;)Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;
    .locals 0
    .param p1, "rootTagName"    # Ljava/lang/String;

    .line 131
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/TaggedPdfReaderTool;->rootTag:Ljava/lang/String;

    .line 132
    return-object p0
.end method
