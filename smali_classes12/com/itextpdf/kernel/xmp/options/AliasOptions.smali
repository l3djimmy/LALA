.class public final Lcom/itextpdf/kernel/xmp/options/AliasOptions;
.super Lcom/itextpdf/kernel/xmp/options/Options;
.source "AliasOptions.java"


# static fields
.field public static final PROP_ARRAY:I = 0x200

.field public static final PROP_ARRAY_ALTERNATE:I = 0x800

.field public static final PROP_ARRAY_ALT_TEXT:I = 0x1000

.field public static final PROP_ARRAY_ORDERED:I = 0x400

.field public static final PROP_DIRECT:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 61
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/options/Options;-><init>()V

    .line 63
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

    .line 72
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/xmp/options/Options;-><init>(I)V

    .line 73
    return-void
.end method


# virtual methods
.method protected defineOptionName(I)Ljava/lang/String;
    .locals 1
    .param p1, "option"    # I

    .line 181
    sparse-switch p1, :sswitch_data_0

    .line 188
    const/4 v0, 0x0

    return-object v0

    .line 187
    :sswitch_0
    const-string v0, "ARRAY_ALT_TEXT"

    return-object v0

    .line 186
    :sswitch_1
    const-string v0, "ARRAY_ALTERNATE"

    return-object v0

    .line 185
    :sswitch_2
    const-string v0, "ARRAY_ORDERED"

    return-object v0

    .line 184
    :sswitch_3
    const-string v0, "ARRAY"

    return-object v0

    .line 183
    :sswitch_4
    const-string v0, "PROP_DIRECT"

    return-object v0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_4
        0x200 -> :sswitch_3
        0x400 -> :sswitch_2
        0x800 -> :sswitch_1
        0x1000 -> :sswitch_0
    .end sparse-switch
.end method

.method protected getValidOptions()I
    .locals 1

    .line 198
    const/16 v0, 0x1e00

    return v0
.end method

.method public isArray()Z
    .locals 1

    .line 90
    const/16 v0, 0x200

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isArrayAltText()Z
    .locals 1

    .line 150
    const/16 v0, 0x1000

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isArrayAlternate()Z
    .locals 1

    .line 130
    const/16 v0, 0x800

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isArrayOrdered()Z
    .locals 1

    .line 110
    const/16 v0, 0x400

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isSimple()Z
    .locals 1

    .line 81
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->getOptions()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setArray(Z)Lcom/itextpdf/kernel/xmp/options/AliasOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 100
    const/16 v0, 0x200

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->setOption(IZ)V

    .line 101
    return-object p0
.end method

.method public setArrayAltText(Z)Lcom/itextpdf/kernel/xmp/options/AliasOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 160
    const/16 v0, 0x1e00

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->setOption(IZ)V

    .line 162
    return-object p0
.end method

.method public setArrayAlternate(Z)Lcom/itextpdf/kernel/xmp/options/AliasOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 140
    const/16 v0, 0xe00

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->setOption(IZ)V

    .line 141
    return-object p0
.end method

.method public setArrayOrdered(Z)Lcom/itextpdf/kernel/xmp/options/AliasOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 120
    const/16 v0, 0x600

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->setOption(IZ)V

    .line 121
    return-object p0
.end method

.method public toPropertyOptions()Lcom/itextpdf/kernel/xmp/options/PropertyOptions;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 172
    new-instance v0, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/options/AliasOptions;->getOptions()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/xmp/options/PropertyOptions;-><init>(I)V

    return-object v0
.end method
