.class public final Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
.super Lcom/itextpdf/kernel/xmp/options/Options;
.source "SerializeOptions.java"


# static fields
.field public static final ENCODE_UTF16BE:I = 0x2

.field public static final ENCODE_UTF16LE:I = 0x3

.field public static final ENCODE_UTF8:I = 0x0

.field private static final ENCODING_MASK:I = 0x3

.field public static final EXACT_PACKET_LENGTH:I = 0x200

.field public static final INCLUDE_THUMBNAIL_PAD:I = 0x100

.field private static final LITTLEENDIAN_BIT:I = 0x1

.field public static final OMIT_PACKET_WRAPPER:I = 0x10

.field public static final OMIT_XMPMETA_ELEMENT:I = 0x1000

.field public static final READONLY_PACKET:I = 0x20

.field public static final SORT:I = 0x2000

.field public static final USE_CANONICAL_FORMAT:I = 0x80

.field public static final USE_COMPACT_FORMAT:I = 0x40

.field private static final UTF16_BIT:I = 0x2


# instance fields
.field private baseIndent:I

.field private indent:Ljava/lang/String;

.field private newline:Ljava/lang/String;

.field private omitVersionAttribute:Z

.field private padding:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 117
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/options/Options;-><init>()V

    .line 93
    const/16 v0, 0x800

    iput v0, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->padding:I

    .line 98
    const-string v0, "\n"

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->newline:Ljava/lang/String;

    .line 103
    const-string v0, "  "

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->indent:Ljava/lang/String;

    .line 108
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->baseIndent:I

    .line 110
    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->omitVersionAttribute:Z

    .line 119
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 129
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/xmp/options/Options;-><init>(I)V

    .line 93
    const/16 v0, 0x800

    iput v0, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->padding:I

    .line 98
    const-string v0, "\n"

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->newline:Ljava/lang/String;

    .line 103
    const-string v0, "  "

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->indent:Ljava/lang/String;

    .line 108
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->baseIndent:I

    .line 110
    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->omitVersionAttribute:Z

    .line 130
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 458
    :try_start_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getOptions()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;-><init>(I)V

    .line 459
    .local v0, "clone":Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    iget v1, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->baseIndent:I

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->setBaseIndent(I)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    .line 460
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->indent:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->setIndent(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    .line 461
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->newline:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->setNewline(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;

    .line 462
    iget v1, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->padding:I

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->setPadding(I)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    :try_end_0
    .catch Lcom/itextpdf/kernel/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 463
    return-object v0

    .line 465
    .end local v0    # "clone":Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    :catch_0
    move-exception v0

    .line 468
    .local v0, "e":Lcom/itextpdf/kernel/xmp/XMPException;
    const/4 v1, 0x0

    return-object v1
.end method

.method protected defineOptionName(I)Ljava/lang/String;
    .locals 1
    .param p1, "option"    # I

    .line 478
    sparse-switch p1, :sswitch_data_0

    .line 488
    const/4 v0, 0x0

    return-object v0

    .line 487
    :sswitch_0
    const-string v0, "NORMALIZED"

    return-object v0

    .line 486
    :sswitch_1
    const-string v0, "OMIT_XMPMETA_ELEMENT"

    return-object v0

    .line 485
    :sswitch_2
    const-string v0, "EXACT_PACKET_LENGTH"

    return-object v0

    .line 484
    :sswitch_3
    const-string v0, "INCLUDE_THUMBNAIL_PAD"

    return-object v0

    .line 482
    :sswitch_4
    const-string v0, "USE_COMPACT_FORMAT"

    return-object v0

    .line 481
    :sswitch_5
    const-string v0, "READONLY_PACKET"

    return-object v0

    .line 480
    :sswitch_6
    const-string v0, "OMIT_PACKET_WRAPPER"

    return-object v0

    :sswitch_data_0
    .sparse-switch
        0x10 -> :sswitch_6
        0x20 -> :sswitch_5
        0x40 -> :sswitch_4
        0x100 -> :sswitch_3
        0x200 -> :sswitch_2
        0x1000 -> :sswitch_1
        0x2000 -> :sswitch_0
    .end sparse-switch
.end method

.method public getBaseIndent()I
    .locals 1

    .line 341
    iget v0, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->baseIndent:I

    return v0
.end method

.method public getEncodeUTF16BE()Z
    .locals 2

    .line 297
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getOptions()I

    move-result v0

    and-int/lit8 v0, v0, 0x3

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getEncodeUTF16LE()Z
    .locals 2

    .line 319
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getOptions()I

    move-result v0

    const/4 v1, 0x3

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 1

    .line 435
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getEncodeUTF16BE()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 437
    const-string v0, "UTF-16BE"

    return-object v0

    .line 439
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getEncodeUTF16LE()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 441
    const-string v0, "UTF-16LE"

    return-object v0

    .line 445
    :cond_1
    const-string v0, "UTF-8"

    return-object v0
.end method

.method public getExactPacketLength()Z
    .locals 1

    .line 257
    const/16 v0, 0x200

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public getIncludeThumbnailPad()Z
    .locals 1

    .line 237
    const/16 v0, 0x100

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public getIndent()Ljava/lang/String;
    .locals 1

    .line 362
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->indent:Ljava/lang/String;

    return-object v0
.end method

.method public getNewline()Ljava/lang/String;
    .locals 1

    .line 383
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->newline:Ljava/lang/String;

    return-object v0
.end method

.method public getOmitPacketWrapper()Z
    .locals 1

    .line 138
    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public getOmitVersionAttribute()Z
    .locals 1

    .line 426
    iget-boolean v0, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->omitVersionAttribute:Z

    return v0
.end method

.method public getOmitXmpMetaElement()Z
    .locals 1

    .line 158
    const/16 v0, 0x1000

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public getPadding()I
    .locals 1

    .line 404
    iget v0, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->padding:I

    return v0
.end method

.method public getReadOnlyPacket()Z
    .locals 1

    .line 178
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public getSort()Z
    .locals 1

    .line 277
    const/16 v0, 0x2000

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public getUseCanonicalFormat()Z
    .locals 1

    .line 218
    const/16 v0, 0x80

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public getUseCompactFormat()Z
    .locals 1

    .line 198
    const/16 v0, 0x40

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method protected getValidOptions()I
    .locals 1

    .line 498
    const/16 v0, 0x3370

    return v0
.end method

.method public setBaseIndent(I)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .locals 0
    .param p1, "baseIndent"    # I

    .line 352
    iput p1, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->baseIndent:I

    .line 353
    return-object p0
.end method

.method public setEncodeUTF16BE(Z)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .locals 2
    .param p1, "value"    # Z

    .line 308
    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->setOption(IZ)V

    .line 309
    const/4 v0, 0x2

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->setOption(IZ)V

    .line 310
    return-object p0
.end method

.method public setEncodeUTF16LE(Z)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .locals 2
    .param p1, "value"    # Z

    .line 330
    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->setOption(IZ)V

    .line 331
    invoke-virtual {p0, v1, p1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->setOption(IZ)V

    .line 332
    return-object p0
.end method

.method public setExactPacketLength(Z)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 267
    const/16 v0, 0x200

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->setOption(IZ)V

    .line 268
    return-object p0
.end method

.method public setIncludeThumbnailPad(Z)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 247
    const/16 v0, 0x100

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->setOption(IZ)V

    .line 248
    return-object p0
.end method

.method public setIndent(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .locals 0
    .param p1, "indent"    # Ljava/lang/String;

    .line 373
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->indent:Ljava/lang/String;

    .line 374
    return-object p0
.end method

.method public setNewline(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .locals 0
    .param p1, "newline"    # Ljava/lang/String;

    .line 394
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->newline:Ljava/lang/String;

    .line 395
    return-object p0
.end method

.method public setOmitPacketWrapper(Z)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 148
    const/16 v0, 0x10

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->setOption(IZ)V

    .line 149
    return-object p0
.end method

.method public setOmitXmpMetaElement(Z)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 168
    const/16 v0, 0x1000

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->setOption(IZ)V

    .line 169
    return-object p0
.end method

.method public setPadding(I)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .locals 0
    .param p1, "padding"    # I

    .line 415
    iput p1, p0, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->padding:I

    .line 416
    return-object p0
.end method

.method public setReadOnlyPacket(Z)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 188
    const/16 v0, 0x20

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->setOption(IZ)V

    .line 189
    return-object p0
.end method

.method public setSort(Z)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 287
    const/16 v0, 0x2000

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->setOption(IZ)V

    .line 288
    return-object p0
.end method

.method public setUseCanonicalFormat(Z)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 228
    const/16 v0, 0x80

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->setOption(IZ)V

    .line 229
    return-object p0
.end method

.method public setUseCompactFormat(Z)Lcom/itextpdf/kernel/xmp/options/SerializeOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 208
    const/16 v0, 0x40

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/SerializeOptions;->setOption(IZ)V

    .line 209
    return-object p0
.end method
