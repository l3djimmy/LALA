.class public final Lcom/itextpdf/kernel/xmp/options/ParseOptions;
.super Lcom/itextpdf/kernel/xmp/options/Options;
.source "ParseOptions.java"


# static fields
.field public static final ACCEPT_LATIN_1:I = 0x10

.field public static final FIX_CONTROL_CHARS:I = 0x8

.field public static final OMIT_NORMALIZATION:I = 0x20

.field public static final REQUIRE_XMP_META:I = 0x1

.field public static final STRICT_ALIASING:I = 0x4


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 59
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/options/Options;-><init>()V

    .line 60
    const/16 v0, 0x18

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->setOption(IZ)V

    .line 61
    return-void
.end method


# virtual methods
.method protected defineOptionName(I)Ljava/lang/String;
    .locals 1
    .param p1, "option"    # I

    .line 169
    sparse-switch p1, :sswitch_data_0

    .line 176
    const/4 v0, 0x0

    return-object v0

    .line 175
    :sswitch_0
    const-string v0, "OMIT_NORMALIZATION"

    return-object v0

    .line 174
    :sswitch_1
    const-string v0, "ACCEPT_LATIN_1"

    return-object v0

    .line 173
    :sswitch_2
    const-string v0, "FIX_CONTROL_CHARS"

    return-object v0

    .line 172
    :sswitch_3
    const-string v0, "STRICT_ALIASING"

    return-object v0

    .line 171
    :sswitch_4
    const-string v0, "REQUIRE_XMP_META"

    return-object v0

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_4
        0x4 -> :sswitch_3
        0x8 -> :sswitch_2
        0x10 -> :sswitch_1
        0x20 -> :sswitch_0
    .end sparse-switch
.end method

.method public getAcceptLatin1()Z
    .locals 1

    .line 129
    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public getFixControlChars()Z
    .locals 1

    .line 109
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public getOmitNormalization()Z
    .locals 1

    .line 149
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public getRequireXMPMeta()Z
    .locals 1

    .line 69
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public getStrictAliasing()Z
    .locals 1

    .line 89
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method protected getValidOptions()I
    .locals 1

    .line 186
    const/16 v0, 0x3d

    return v0
.end method

.method public setAcceptLatin1(Z)Lcom/itextpdf/kernel/xmp/options/ParseOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 159
    const/16 v0, 0x10

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->setOption(IZ)V

    .line 160
    return-object p0
.end method

.method public setFixControlChars(Z)Lcom/itextpdf/kernel/xmp/options/ParseOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 119
    const/16 v0, 0x8

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->setOption(IZ)V

    .line 120
    return-object p0
.end method

.method public setOmitNormalization(Z)Lcom/itextpdf/kernel/xmp/options/ParseOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 139
    const/16 v0, 0x20

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->setOption(IZ)V

    .line 140
    return-object p0
.end method

.method public setRequireXMPMeta(Z)Lcom/itextpdf/kernel/xmp/options/ParseOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 79
    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->setOption(IZ)V

    .line 80
    return-object p0
.end method

.method public setStrictAliasing(Z)Lcom/itextpdf/kernel/xmp/options/ParseOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 99
    const/4 v0, 0x4

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/ParseOptions;->setOption(IZ)V

    .line 100
    return-object p0
.end method
