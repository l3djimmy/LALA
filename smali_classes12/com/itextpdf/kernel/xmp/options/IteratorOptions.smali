.class public final Lcom/itextpdf/kernel/xmp/options/IteratorOptions;
.super Lcom/itextpdf/kernel/xmp/options/Options;
.source "IteratorOptions.java"


# static fields
.field public static final JUST_CHILDREN:I = 0x100

.field public static final JUST_LEAFNAME:I = 0x400

.field public static final JUST_LEAFNODES:I = 0x200

.field public static final OMIT_QUALIFIERS:I = 0x1000


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Lcom/itextpdf/kernel/xmp/options/Options;-><init>()V

    return-void
.end method


# virtual methods
.method protected defineOptionName(I)Ljava/lang/String;
    .locals 1
    .param p1, "option"    # I

    .line 149
    sparse-switch p1, :sswitch_data_0

    .line 155
    const/4 v0, 0x0

    return-object v0

    .line 154
    :sswitch_0
    const-string v0, "OMIT_QUALIFIERS"

    return-object v0

    .line 153
    :sswitch_1
    const-string v0, "JUST_LEAFNAME"

    return-object v0

    .line 152
    :sswitch_2
    const-string v0, "JUST_LEAFNODES"

    return-object v0

    .line 151
    :sswitch_3
    const-string v0, "JUST_CHILDREN"

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x100 -> :sswitch_3
        0x200 -> :sswitch_2
        0x400 -> :sswitch_1
        0x1000 -> :sswitch_0
    .end sparse-switch
.end method

.method protected getValidOptions()I
    .locals 1

    .line 165
    const/16 v0, 0x1700

    return v0
.end method

.method public isJustChildren()Z
    .locals 1

    .line 61
    const/16 v0, 0x100

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/IteratorOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isJustLeafname()Z
    .locals 1

    .line 70
    const/16 v0, 0x400

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/IteratorOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isJustLeafnodes()Z
    .locals 1

    .line 79
    const/16 v0, 0x200

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/IteratorOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isOmitQualifiers()Z
    .locals 1

    .line 88
    const/16 v0, 0x1000

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/xmp/options/IteratorOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public setJustChildren(Z)Lcom/itextpdf/kernel/xmp/options/IteratorOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 100
    const/16 v0, 0x100

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/IteratorOptions;->setOption(IZ)V

    .line 101
    return-object p0
.end method

.method public setJustLeafname(Z)Lcom/itextpdf/kernel/xmp/options/IteratorOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 113
    const/16 v0, 0x400

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/IteratorOptions;->setOption(IZ)V

    .line 114
    return-object p0
.end method

.method public setJustLeafnodes(Z)Lcom/itextpdf/kernel/xmp/options/IteratorOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 126
    const/16 v0, 0x200

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/IteratorOptions;->setOption(IZ)V

    .line 127
    return-object p0
.end method

.method public setOmitQualifiers(Z)Lcom/itextpdf/kernel/xmp/options/IteratorOptions;
    .locals 1
    .param p1, "value"    # Z

    .line 139
    const/16 v0, 0x1000

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/xmp/options/IteratorOptions;->setOption(IZ)V

    .line 140
    return-object p0
.end method
