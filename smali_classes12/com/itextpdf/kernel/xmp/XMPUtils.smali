.class public final Lcom/itextpdf/kernel/xmp/XMPUtils;
.super Ljava/lang/Object;
.source "XMPUtils.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method public static appendProperties(Lcom/itextpdf/kernel/xmp/XMPMeta;Lcom/itextpdf/kernel/xmp/XMPMeta;ZZ)V
    .locals 1
    .param p0, "source"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p1, "dest"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p2, "doAllProperties"    # Z
    .param p3, "replaceOldValues"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 157
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lcom/itextpdf/kernel/xmp/XMPUtils;->appendProperties(Lcom/itextpdf/kernel/xmp/XMPMeta;Lcom/itextpdf/kernel/xmp/XMPMeta;ZZZ)V

    .line 158
    return-void
.end method

.method public static appendProperties(Lcom/itextpdf/kernel/xmp/XMPMeta;Lcom/itextpdf/kernel/xmp/XMPMeta;ZZZ)V
    .locals 0
    .param p0, "source"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p1, "dest"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p2, "doAllProperties"    # Z
    .param p3, "replaceOldValues"    # Z
    .param p4, "deleteEmptyValues"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 241
    invoke-static {p0, p1, p2, p3, p4}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->appendProperties(Lcom/itextpdf/kernel/xmp/XMPMeta;Lcom/itextpdf/kernel/xmp/XMPMeta;ZZZ)V

    .line 243
    return-void
.end method

.method public static catenateArrayItems(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 1
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "arrayName"    # Ljava/lang/String;
    .param p3, "separator"    # Ljava/lang/String;
    .param p4, "quotes"    # Ljava/lang/String;
    .param p5, "allowCommas"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 60
    nop

    .line 61
    invoke-static/range {p0 .. p5}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->catenateArrayItems(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 60
    return-object v0
.end method

.method public static convertFromBoolean(Z)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # Z

    .line 297
    if-eqz p0, :cond_0

    const-string v0, "True"

    goto :goto_0

    :cond_0
    const-string v0, "False"

    :goto_0
    return-object v0
.end method

.method public static convertFromDate(Lcom/itextpdf/kernel/xmp/XMPDateTime;)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # Lcom/itextpdf/kernel/xmp/XMPDateTime;

    .line 470
    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/impl/ISO8601Converter;->render(Lcom/itextpdf/kernel/xmp/XMPDateTime;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static convertFromDouble(D)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # D

    .line 434
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static convertFromInteger(I)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # I

    .line 344
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static convertFromLong(J)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # J

    .line 391
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static convertToBoolean(Ljava/lang/String;)Z
    .locals 4
    .param p0, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 264
    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_3

    .line 268
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 273
    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    return v0

    .line 275
    :catch_0
    move-exception v2

    .line 277
    .local v2, "e":Ljava/lang/NumberFormatException;
    nop

    .line 278
    const-string/jumbo v3, "true"

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 279
    const-string/jumbo v3, "t"

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 280
    const-string/jumbo v3, "on"

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 281
    const-string/jumbo v3, "yes"

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_1
    move v0, v1

    goto :goto_2

    :cond_2
    :goto_1
    nop

    .line 277
    :goto_2
    return v0

    .line 266
    .end local v2    # "e":Ljava/lang/NumberFormatException;
    :cond_3
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Empty convert-string"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public static convertToDate(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/XMPDateTime;
    .locals 3
    .param p0, "rawValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 450
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 456
    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/impl/ISO8601Converter;->parse(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/XMPDateTime;

    move-result-object v0

    return-object v0

    .line 452
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Empty convert-string"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public static convertToDouble(Ljava/lang/String;)D
    .locals 4
    .param p0, "rawValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 409
    const/4 v0, 0x5

    if-eqz p0, :cond_0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 415
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    return-wide v0

    .line 411
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Empty convert-string"

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    .end local p0    # "rawValue":Ljava/lang/String;
    throw v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 418
    .restart local p0    # "rawValue":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 420
    .local v1, "e":Ljava/lang/NumberFormatException;
    new-instance v2, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v3, "Invalid double string"

    invoke-direct {v2, v3, v0}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v2
.end method

.method public static convertToInteger(Ljava/lang/String;)I
    .locals 4
    .param p0, "rawValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 315
    const/4 v0, 0x5

    if-eqz p0, :cond_1

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_1

    .line 319
    const-string v1, "0x"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 321
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    return v0

    .line 325
    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0

    .line 317
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Empty convert-string"

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    .end local p0    # "rawValue":Ljava/lang/String;
    throw v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 328
    .restart local p0    # "rawValue":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 330
    .local v1, "e":Ljava/lang/NumberFormatException;
    new-instance v2, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v3, "Invalid integer string"

    invoke-direct {v2, v3, v0}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v2
.end method

.method public static convertToLong(Ljava/lang/String;)J
    .locals 4
    .param p0, "rawValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 362
    const/4 v0, 0x5

    if-eqz p0, :cond_1

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_1

    .line 366
    const-string v1, "0x"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 368
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v0

    return-wide v0

    .line 372
    :cond_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0

    .line 364
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Empty convert-string"

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    .end local p0    # "rawValue":Ljava/lang/String;
    throw v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 375
    .restart local p0    # "rawValue":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 377
    .local v1, "e":Ljava/lang/NumberFormatException;
    new-instance v2, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v3, "Invalid long string"

    invoke-direct {v2, v3, v0}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v2
.end method

.method public static decodeBase64(Ljava/lang/String;)[B
    .locals 4
    .param p0, "base64String"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 499
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/xmp/impl/Base64;->decode([B)[B

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 501
    :catchall_0
    move-exception v0

    .line 503
    .local v0, "e":Ljava/lang/Throwable;
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Invalid base64 string"

    const/4 v3, 0x5

    invoke-direct {v1, v2, v3, v0}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;ILjava/lang/Throwable;)V

    throw v1
.end method

.method public static encodeBase64([B)Ljava/lang/String;
    .locals 2
    .param p0, "buffer"    # [B

    .line 483
    new-instance v0, Ljava/lang/String;

    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/impl/Base64;->encode([B)[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    return-object v0
.end method

.method public static removeProperties(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 0
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "propName"    # Ljava/lang/String;
    .param p3, "doAllProperties"    # Z
    .param p4, "includeAliases"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 141
    invoke-static {p0, p1, p2, p3, p4}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->removeProperties(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 142
    return-void
.end method

.method public static separateArrayItems(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Z)V
    .locals 0
    .param p0, "xmp"    # Lcom/itextpdf/kernel/xmp/XMPMeta;
    .param p1, "schemaNS"    # Ljava/lang/String;
    .param p2, "arrayName"    # Ljava/lang/String;
    .param p3, "catedStr"    # Ljava/lang/String;
    .param p4, "arrayOptions"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .param p5, "preserveCommas"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 87
    invoke-static/range {p0 .. p5}, Lcom/itextpdf/kernel/xmp/impl/XMPUtilsImpl;->separateArrayItems(Lcom/itextpdf/kernel/xmp/XMPMeta;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/itextpdf/kernel/xmp/options/PropertyOptions;Z)V

    .line 89
    return-void
.end method
