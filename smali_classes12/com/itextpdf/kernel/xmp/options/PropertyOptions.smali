.class public final Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
.super Lcom/itextpdf/kernel/xmp/options/Options;
.source "PropertyOptions.java"


# static fields
.field public static final ARRAY:I = 0x200

.field public static final ARRAY_ALTERNATE:I = 0x800

.field public static final ARRAY_ALT_TEXT:I = 0x1000

.field public static final ARRAY_ORDERED:I = 0x400

.field public static final DELETE_EXISTING:I = 0x20000000

.field public static final HAS_LANGUAGE:I = 0x40

.field public static final HAS_QUALIFIERS:I = 0x10

.field public static final HAS_TYPE:I = 0x80

.field public static final NO_OPTIONS:I = 0x0

.field public static final QUALIFIER:I = 0x20

.field public static final SCHEMA_NODE:I = -0x80000000

.field public static final SEPARATE_NODE:I = 0x40000000

.field public static final STRUCT:I = 0x100

.field public static final URI:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 80
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/options/Options;-><init>()V

    .line 82
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 93
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/xmp/options/Options;-><init>(I)V

    .line 94
    return-void
.end method


# virtual methods
.method public assertConsistency(I)V
    .locals 3
    .param p1, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 436
    and-int/lit16 v0, p1, 0x100

    const/16 v1, 0x67

    if-lez v0, :cond_1

    and-int/lit16 v0, p1, 0x200

    if-gtz v0, :cond_0

    goto :goto_0

    .line 438
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "IsStruct and IsArray options are mutually exclusive"

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 441
    :cond_1
    :goto_0
    and-int/lit8 v0, p1, 0x2

    if-lez v0, :cond_3

    and-int/lit16 v0, p1, 0x300

    if-gtz v0, :cond_2

    goto :goto_1

    .line 443
    :cond_2
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v2, "Structs and arrays can\'t have \"value\" options"

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 446
    :cond_3
    :goto_1
    return-void
.end method

.method protected defineOptionName(I)Ljava/lang/String;
    .locals 1
    .param p1, "option"    # I

    .line 409
    sparse-switch p1, :sswitch_data_0

    .line 422
    const/4 v0, 0x0

    return-object v0

    .line 420
    :sswitch_0
    const-string v0, "ARRAY_ALT_TEXT"

    return-object v0

    .line 419
    :sswitch_1
    const-string v0, "ARRAY_ALTERNATE"

    return-object v0

    .line 418
    :sswitch_2
    const-string v0, "ARRAY_ORDERED"

    return-object v0

    .line 417
    :sswitch_3
    const-string v0, "ARRAY"

    return-object v0

    .line 416
    :sswitch_4
    const-string v0, "STRUCT"

    return-object v0

    .line 415
    :sswitch_5
    const-string v0, "HAS_TYPE"

    return-object v0

    .line 414
    :sswitch_6
    const-string v0, "HAS_LANGUAGE"

    return-object v0

    .line 413
    :sswitch_7
    const-string v0, "QUALIFIER"

    return-object v0

    .line 412
    :sswitch_8
    const-string v0, "HAS_QUALIFIER"

    return-object v0

    .line 411
    :sswitch_9
    const-string v0, "URI"

    return-object v0

    .line 421
    :sswitch_a
    const-string v0, "SCHEMA_NODE"

    return-object v0

    :sswitch_data_0
    .sparse-switch
        -0x80000000 -> :sswitch_a
        0x2 -> :sswitch_9
        0x10 -> :sswitch_8
        0x20 -> :sswitch_7
        0x40 -> :sswitch_6
        0x80 -> :sswitch_5
        0x100 -> :sswitch_4
        0x200 -> :sswitch_3
        0x400 -> :sswitch_2
        0x800 -> :sswitch_1
        0x1000 -> :sswitch_0
    .end sparse-switch
.end method

.method public equalArrayTypes(Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)Z
    .locals 2
    .param p1, "options"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    .line 349
    nop

    .line 350
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArray()Z

    move-result v1

    if-ne v0, v1, :cond_0

    .line 351
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayOrdered()Z

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayOrdered()Z

    move-result v1

    if-ne v0, v1, :cond_0

    .line 352
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAlternate()Z

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAlternate()Z

    move-result v1

    if-ne v0, v1, :cond_0

    .line 353
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 349
    :goto_0
    return v0
.end method

.method public getHasLanguage()Z
    .locals 1

    .line 166
    const/16 v0, 0x40

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public getHasQualifiers()Z
    .locals 1

    .line 125
    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public getHasType()Z
    .locals 1

    .line 184
    const/16 v0, 0x80

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method protected getValidOptions()I
    .locals 1

    .line 388
    const v0, -0x3fffe00e

    return v0
.end method

.method public isArray()Z
    .locals 1

    .line 223
    const/16 v0, 0x200

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isArrayAltText()Z
    .locals 1

    .line 287
    const/16 v0, 0x1000

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isArrayAlternate()Z
    .locals 1

    .line 265
    const/16 v0, 0x800

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isArrayOrdered()Z
    .locals 1

    .line 244
    const/16 v0, 0x400

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isCompositeProperty()Z
    .locals 1

    .line 328
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOptions()I

    move-result v0

    and-int/lit16 v0, v0, 0x300

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isOnlyArrayOptions()Z
    .locals 1

    .line 378
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOptions()I

    move-result v0

    and-int/lit16 v0, v0, -0x1e01

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isQualifier()Z
    .locals 1

    .line 148
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isSchemaNode()Z
    .locals 1

    .line 306
    const/high16 v0, -0x80000000

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isSimple()Z
    .locals 1

    .line 337
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOptions()I

    move-result v0

    and-int/lit16 v0, v0, 0x300

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isStruct()Z
    .locals 1

    .line 202
    const/16 v0, 0x100

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isURI()Z
    .locals 1

    .line 103
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public mergeWith(Lcom/itextpdf/kernel/xmp/options/PropertyOptions;)V
    .locals 2
    .param p1, "options"    # Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 366
    if-eqz p1, :cond_0

    .line 368
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOptions()I

    move-result v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->getOptions()I

    move-result v1

    or-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setOptions(I)V

    .line 370
    :cond_0
    return-void
.end method

.method public setArray(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 233
    const/16 v0, 0x200

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setOption(IZ)V

    .line 234
    return-object p0
.end method

.method public setArrayAltText(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 297
    const/16 v0, 0x1000

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setOption(IZ)V

    .line 298
    return-object p0
.end method

.method public setArrayAlternate(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 275
    const/16 v0, 0x800

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setOption(IZ)V

    .line 276
    return-object p0
.end method

.method public setArrayOrdered(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 254
    const/16 v0, 0x400

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setOption(IZ)V

    .line 255
    return-object p0
.end method

.method public setHasLanguage(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 176
    const/16 v0, 0x40

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setOption(IZ)V

    .line 177
    return-object p0
.end method

.method public setHasQualifiers(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 135
    const/16 v0, 0x10

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setOption(IZ)V

    .line 136
    return-object p0
.end method

.method public setHasType(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 194
    const/16 v0, 0x80

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setOption(IZ)V

    .line 195
    return-object p0
.end method

.method public setQualifier(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 158
    const/16 v0, 0x20

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setOption(IZ)V

    .line 159
    return-object p0
.end method

.method public setSchemaNode(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 316
    const/high16 v0, -0x80000000

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setOption(IZ)V

    .line 317
    return-object p0
.end method

.method public setStruct(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 212
    const/16 v0, 0x100

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setOption(IZ)V

    .line 213
    return-object p0
.end method

.method public setURI(Z)Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 113
    const/4 v0, 0x2

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;->setOption(IZ)V

    .line 114
    return-object p0
.end method
