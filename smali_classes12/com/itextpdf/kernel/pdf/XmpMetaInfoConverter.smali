.class Lcom/itextpdf/kernel/pdf/XmpMetaInfoConverter;
.super Ljava/lang/Object;
.source "XmpMetaInfoConverter.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method private static appendArrayItemIfDoesNotExist(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 8
    .param p0, "meta"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p1, "ns"    # Ljava/lang/String;
    .param p2, "arrayName"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;
    .param p4, "arrayOption"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 141
    invoke-interface {p0, p1, p2}, Lcom/itextpdf/kernel/xmp/XMPMeta;->countArrayItems(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 142
    .local v0, "currentCnt":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 143
    add-int/lit8 v2, v1, 0x1

    invoke-interface {p0, p1, p2, v2}, Lcom/itextpdf/kernel/xmp/XMPMeta;->getArrayItem(Ljava/lang/String;Ljava/lang/String;I)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;

    move-result-object v2

    .line 144
    .local v2, "item":Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    invoke-interface {v2}, Lcom/itextpdf/kernel/xmp/properties/XMPProperty;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 145
    return-void

    .line 142
    .end local v2    # "item":Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 148
    .end local v1    # "i":I
    :cond_1
    new-instance v5, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    invoke-direct {v5, p4}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;-><init>(I)V

    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v6, p3

    .end local p0    # "meta":Lcom/itextpdf/kernel/xmp/XMPMeta;
    .end local p1    # "ns":Ljava/lang/String;
    .end local p2    # "arrayName":Ljava/lang/String;
    .end local p3    # "value":Ljava/lang/String;
    .local v2, "meta":Lcom/itextpdf/kernel/xmp/XMPMeta;
    .local v3, "ns":Ljava/lang/String;
    .local v4, "arrayName":Ljava/lang/String;
    .local v6, "value":Ljava/lang/String;
    invoke-interface/range {v2 .. v7}, Lcom/itextpdf/kernel/xmp/XMPMeta;->appendArrayItem(Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V

    .line 149
    return-void
.end method

.method static appendDocumentInfoToMetadata(Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;Lcom/itextpdf/kernel/xmp/XMPMeta;)V
    .locals 16
    .param p0, "info"    # Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;
    .param p1, "xmpMeta"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 91
    invoke-virtual/range {p0 .. p0}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v6

    .line 92
    .local v6, "docInfo":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v6, :cond_10

    .line 96
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/itextpdf/kernel/pdf/PdfName;

    .line 97
    .local v8, "pdfName":Lcom/itextpdf/kernel/pdf/PdfName;
    move-object v9, v8

    .line 98
    .local v9, "key":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {v6, v9}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v10

    .line 99
    .local v10, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-nez v10, :cond_0

    .line 100
    goto :goto_0

    .line 101
    :cond_0
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfObject;->isString()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 102
    move-object v0, v10

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfString;->toUnicodeString()Ljava/lang/String;

    move-result-object v0

    move-object v5, v0

    .local v0, "value":Ljava/lang/String;
    goto :goto_1

    .line 103
    .end local v0    # "value":Ljava/lang/String;
    :cond_1
    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/PdfObject;->isName()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 104
    move-object v0, v10

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v0

    move-object v5, v0

    .line 108
    .local v5, "value":Ljava/lang/String;
    :goto_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Title:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v9}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 109
    const-string/jumbo v3, "x-default"

    const-string/jumbo v4, "x-default"

    const-string v1, "http://purl.org/dc/elements/1.1/"

    const-string/jumbo v2, "title"

    move-object/from16 v0, p1

    invoke-interface/range {v0 .. v5}, Lcom/itextpdf/kernel/xmp/XMPMeta;->setLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_4

    .line 110
    :cond_2
    move-object/from16 v0, p1

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Author:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v9}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "http://purl.org/dc/elements/1.1/"

    const/4 v3, 0x0

    const-string v4, ",|;"

    if-eqz v1, :cond_4

    .line 111
    invoke-virtual {v5, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v4, v1

    :goto_2
    if-ge v3, v4, :cond_d

    aget-object v11, v1, v3

    .line 112
    .local v11, "v":Ljava/lang/String;
    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    if-lez v12, :cond_3

    .line 113
    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v12

    const/16 v13, 0x400

    const-string v14, "creator"

    invoke-static {v0, v2, v14, v12, v13}, Lcom/itextpdf/kernel/pdf/XmpMetaInfoConverter;->appendArrayItemIfDoesNotExist(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 111
    .end local v11    # "v":Ljava/lang/String;
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 116
    :cond_4
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subject:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v9}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 117
    const-string/jumbo v3, "x-default"

    const-string/jumbo v4, "x-default"

    const-string v1, "http://purl.org/dc/elements/1.1/"

    const-string v2, "description"

    invoke-interface/range {v0 .. v5}, Lcom/itextpdf/kernel/xmp/XMPMeta;->setLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_4

    .line 118
    :cond_5
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Keywords:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v9}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v11, "http://ns.adobe.com/pdf/1.3/"

    if-eqz v1, :cond_8

    .line 119
    invoke-virtual {v5, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v4, v1

    :goto_3
    if-ge v3, v4, :cond_7

    aget-object v12, v1, v3

    .line 120
    .local v12, "v":Ljava/lang/String;
    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v13

    if-lez v13, :cond_6

    .line 121
    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v13

    const/16 v14, 0x200

    const-string/jumbo v15, "subject"

    invoke-static {v0, v2, v15, v13, v14}, Lcom/itextpdf/kernel/pdf/XmpMetaInfoConverter;->appendArrayItemIfDoesNotExist(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 119
    .end local v12    # "v":Ljava/lang/String;
    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 124
    :cond_7
    const-string v1, "Keywords"

    invoke-interface {v0, v11, v1, v5}, Lcom/itextpdf/kernel/xmp/XMPMeta;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_4

    .line 125
    :cond_8
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Creator:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v9}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "http://ns.adobe.com/xap/1.0/"

    if-eqz v1, :cond_9

    .line 126
    const-string v1, "CreatorTool"

    invoke-interface {v0, v2, v1, v5}, Lcom/itextpdf/kernel/xmp/XMPMeta;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_4

    .line 127
    :cond_9
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Producer:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v9}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 128
    const-string v1, "Producer"

    invoke-interface {v0, v11, v1, v5}, Lcom/itextpdf/kernel/xmp/XMPMeta;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_4

    .line 129
    :cond_a
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CreationDate:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v9}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 130
    const-string v1, "CreateDate"

    invoke-static {v5}, Lcom/itextpdf/kernel/pdf/PdfDate;->getW3CDate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v1, v3}, Lcom/itextpdf/kernel/xmp/XMPMeta;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_4

    .line 131
    :cond_b
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ModDate:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v9}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 132
    const-string v1, "ModifyDate"

    invoke-static {v5}, Lcom/itextpdf/kernel/pdf/PdfDate;->getW3CDate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v1, v3}, Lcom/itextpdf/kernel/xmp/XMPMeta;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_4

    .line 133
    :cond_c
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Trapped:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v9}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 134
    const-string v1, "Trapped"

    invoke-interface {v0, v11, v1, v5}, Lcom/itextpdf/kernel/xmp/XMPMeta;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 136
    .end local v8    # "pdfName":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_d
    :goto_4
    goto/16 :goto_0

    .line 103
    .end local v5    # "value":Ljava/lang/String;
    .restart local v8    # "pdfName":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_e
    move-object/from16 v0, p1

    goto/16 :goto_0

    .line 96
    .end local v8    # "pdfName":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v9    # "key":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v10    # "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_f
    move-object/from16 v0, p1

    goto :goto_5

    .line 92
    :cond_10
    move-object/from16 v0, p1

    .line 138
    :goto_5
    return-void
.end method

.method static appendMetadataToInfo([BLcom/itextpdf/kernel/pdf/PdfDocumentInfo;)V
    .locals 12
    .param p0, "xmpMetadata"    # [B
    .param p1, "info"    # Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    .line 40
    const-string v0, "http://ns.adobe.com/pdf/1.3/"

    const-string/jumbo v1, "x-default"

    const-string v2, "http://purl.org/dc/elements/1.1/"

    if-eqz p0, :cond_8

    .line 42
    :try_start_0
    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/XMPMetaFactory;->parseFromBuffer([B)Lcom/itextpdf/kernel/xmp/XMPMeta;

    move-result-object v3

    .line 44
    .local v3, "meta":Lcom/itextpdf/kernel/xmp/XMPMeta;
    const-string/jumbo v4, "title"

    invoke-interface {v3, v2, v4, v1, v1}, Lcom/itextpdf/kernel/xmp/XMPMeta;->getLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;

    move-result-object v4

    .line 45
    .local v4, "title":Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    if-eqz v4, :cond_0

    .line 46
    invoke-interface {v4}, Lcom/itextpdf/kernel/xmp/properties/XMPProperty;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->setTitle(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    .line 49
    :cond_0
    const-string v5, "creator"

    invoke-static {v3, v2, v5}, Lcom/itextpdf/kernel/pdf/XmpMetaInfoConverter;->fetchArrayIntoString(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 50
    .local v5, "author":Ljava/lang/String;
    if-eqz v5, :cond_1

    .line 51
    invoke-virtual {p1, v5}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->setAuthor(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    .line 55
    :cond_1
    const-string v6, "Keywords"

    invoke-interface {v3, v0, v6}, Lcom/itextpdf/kernel/xmp/XMPMeta;->getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;

    move-result-object v6

    .line 56
    .local v6, "keywords":Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    if-eqz v6, :cond_2

    .line 57
    invoke-interface {v6}, Lcom/itextpdf/kernel/xmp/properties/XMPProperty;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->setKeywords(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    goto :goto_0

    .line 59
    :cond_2
    const-string/jumbo v7, "subject"

    invoke-static {v3, v2, v7}, Lcom/itextpdf/kernel/pdf/XmpMetaInfoConverter;->fetchArrayIntoString(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 60
    .local v7, "keywordsStr":Ljava/lang/String;
    if-eqz v7, :cond_3

    .line 61
    invoke-virtual {p1, v7}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->setKeywords(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    .line 65
    .end local v7    # "keywordsStr":Ljava/lang/String;
    :cond_3
    :goto_0
    const-string v7, "description"

    invoke-interface {v3, v2, v7, v1, v1}, Lcom/itextpdf/kernel/xmp/XMPMeta;->getLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;

    move-result-object v1

    .line 66
    .local v1, "subject":Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    if-eqz v1, :cond_4

    .line 67
    invoke-interface {v1}, Lcom/itextpdf/kernel/xmp/properties/XMPProperty;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->setSubject(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    .line 70
    :cond_4
    const-string v2, "http://ns.adobe.com/xap/1.0/"

    const-string v7, "CreatorTool"

    invoke-interface {v3, v2, v7}, Lcom/itextpdf/kernel/xmp/XMPMeta;->getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;

    move-result-object v2

    .line 71
    .local v2, "creator":Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    if-eqz v2, :cond_5

    .line 72
    invoke-interface {v2}, Lcom/itextpdf/kernel/xmp/properties/XMPProperty;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->setCreator(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    .line 75
    :cond_5
    const-string v7, "Producer"

    invoke-interface {v3, v0, v7}, Lcom/itextpdf/kernel/xmp/XMPMeta;->getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;

    move-result-object v7

    .line 76
    .local v7, "producer":Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    if-eqz v7, :cond_6

    .line 77
    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->Producer:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v9, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-interface {v7}, Lcom/itextpdf/kernel/xmp/properties/XMPProperty;->getValue()Ljava/lang/String;

    move-result-object v10

    const-string v11, "UnicodeBig"

    invoke-direct {v9, v10, v11}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v8, v9}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    .line 80
    :cond_6
    const-string v8, "Trapped"

    invoke-interface {v3, v0, v8}, Lcom/itextpdf/kernel/xmp/XMPMeta;->getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;

    move-result-object v0

    .line 81
    .local v0, "trapped":Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    if-eqz v0, :cond_7

    .line 82
    new-instance v8, Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v0}, Lcom/itextpdf/kernel/xmp/properties/XMPProperty;->getValue()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v8}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->setTrapped(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    .end local v0    # "trapped":Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    .end local v1    # "subject":Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    .end local v2    # "creator":Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    .end local v3    # "meta":Lcom/itextpdf/kernel/xmp/XMPMeta;
    .end local v4    # "title":Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    .end local v5    # "author":Ljava/lang/String;
    .end local v6    # "keywords":Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    .end local v7    # "producer":Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    :cond_7
    goto :goto_1

    .line 84
    :catch_0
    move-exception v0

    .line 88
    :cond_8
    :goto_1
    return-void
.end method

.method private static fetchArrayIntoString(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "meta"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p1, "ns"    # Ljava/lang/String;
    .param p2, "arrayName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 152
    invoke-interface {p0, p1, p2}, Lcom/itextpdf/kernel/xmp/XMPMeta;->countArrayItems(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 153
    .local v0, "keywordsCnt":I
    const/4 v1, 0x0

    .line 154
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_2

    .line 155
    add-int/lit8 v3, v2, 0x1

    invoke-interface {p0, p1, p2, v3}, Lcom/itextpdf/kernel/xmp/XMPMeta;->getArrayItem(Ljava/lang/String;Ljava/lang/String;I)Lcom/itextpdf/kernel/xmp/properties/XMPProperty;

    move-result-object v3

    .line 156
    .local v3, "curKeyword":Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    if-nez v1, :cond_0

    .line 157
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object v1, v4

    .end local v1    # "sb":Ljava/lang/StringBuilder;
    .local v4, "sb":Ljava/lang/StringBuilder;
    goto :goto_1

    .line 158
    .end local v4    # "sb":Ljava/lang/StringBuilder;
    .restart local v1    # "sb":Ljava/lang/StringBuilder;
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_1

    .line 159
    const-string v4, "; "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    :cond_1
    :goto_1
    invoke-interface {v3}, Lcom/itextpdf/kernel/xmp/properties/XMPProperty;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .end local v3    # "curKeyword":Lcom/itextpdf/kernel/xmp/properties/XMPProperty;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 163
    .end local v2    # "i":I
    :cond_2
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    :cond_3
    const/4 v2, 0x0

    :goto_2
    return-object v2
.end method
