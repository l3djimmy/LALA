.class public final Lcom/itextpdf/io/font/constants/FontWeights;
.super Ljava/lang/Object;
.source "FontWeights.java"


# static fields
.field public static final BLACK:I = 0x384

.field public static final BOLD:I = 0x2bc

.field public static final EXTRA_BOLD:I = 0x320

.field public static final EXTRA_LIGHT:I = 0xc8

.field public static final LIGHT:I = 0x12c

.field public static final MEDIUM:I = 0x1f4

.field public static final NORMAL:I = 0x190

.field public static final SEMI_BOLD:I = 0x258

.field public static final THIN:I = 0x64


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method public static fromType1FontWeight(Ljava/lang/String;)I
    .locals 3
    .param p0, "weight"    # Ljava/lang/String;

    .line 58
    const/16 v0, 0x190

    .line 59
    .local v0, "fontWeight":I
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_0
    goto/16 :goto_0

    :sswitch_0
    const-string/jumbo v2, "ultralight"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto/16 :goto_1

    :sswitch_1
    const-string/jumbo v2, "ultrablack"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x10

    goto/16 :goto_1

    :sswitch_2
    const-string/jumbo v2, "ultrabold"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0xc

    goto/16 :goto_1

    :sswitch_3
    const-string/jumbo v2, "semibold"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x9

    goto/16 :goto_1

    :sswitch_4
    const-string/jumbo v2, "regular"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x5

    goto/16 :goto_1

    :sswitch_5
    const-string v2, "demibold"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x8

    goto/16 :goto_1

    :sswitch_6
    const-string v2, "extralight"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x2

    goto/16 :goto_1

    :sswitch_7
    const-string v2, "extrablack"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x12

    goto/16 :goto_1

    :sswitch_8
    const-string/jumbo v2, "ultra"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0xf

    goto/16 :goto_1

    :sswitch_9
    const-string v2, "light"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x3

    goto :goto_1

    :sswitch_a
    const-string v2, "heavy"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0xd

    goto :goto_1

    :sswitch_b
    const-string v2, "black"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0xe

    goto :goto_1

    :sswitch_c
    const-string/jumbo v2, "thin"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_1

    :sswitch_d
    const-string v2, "book"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_1

    :sswitch_e
    const-string v2, "bold"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0xa

    goto :goto_1

    :sswitch_f
    const-string v2, "fat"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x11

    goto :goto_1

    :sswitch_10
    const-string v2, "extrabold"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0xb

    goto :goto_1

    :sswitch_11
    const-string/jumbo v2, "normal"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x6

    goto :goto_1

    :sswitch_12
    const-string v2, "medium"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x7

    goto :goto_1

    :goto_0
    const/4 v1, -0x1

    :goto_1
    packed-switch v1, :pswitch_data_0

    goto :goto_2

    .line 97
    :pswitch_0
    const/16 v0, 0x384

    goto :goto_2

    .line 93
    :pswitch_1
    const/16 v0, 0x384

    .line 94
    goto :goto_2

    .line 87
    :pswitch_2
    const/16 v0, 0x320

    .line 88
    goto :goto_2

    .line 83
    :pswitch_3
    const/16 v0, 0x2bc

    .line 84
    goto :goto_2

    .line 80
    :pswitch_4
    const/16 v0, 0x258

    .line 81
    goto :goto_2

    .line 76
    :pswitch_5
    const/16 v0, 0x1f4

    .line 77
    goto :goto_2

    .line 73
    :pswitch_6
    const/16 v0, 0x190

    .line 74
    goto :goto_2

    .line 68
    :pswitch_7
    const/16 v0, 0x12c

    .line 69
    goto :goto_2

    .line 65
    :pswitch_8
    const/16 v0, 0xc8

    .line 66
    goto :goto_2

    .line 61
    :pswitch_9
    const/16 v0, 0x64

    .line 62
    nop

    .line 100
    :goto_2
    return v0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x4041708b -> :sswitch_12
        -0x3df94319 -> :sswitch_11
        -0xf12b96b -> :sswitch_10
        0x18b19 -> :sswitch_f
        0x2e3a85 -> :sswitch_e
        0x2e3ae9 -> :sswitch_d
        0x364e99 -> :sswitch_c
        0x5978fff -> :sswitch_b
        0x5e8f0c7 -> :sswitch_a
        0x6233516 -> :sswitch_9
        0x6a397ac -> :sswitch_8
        0x2cba05ef -> :sswitch_7
        0x2d45ab06 -> :sswitch_6
        0x32c101e2 -> :sswitch_5
        0x40c21f9c -> :sswitch_4
        0x48f2a2f3 -> :sswitch_3
        0x56a61c31 -> :sswitch_2
        0x7e1be3d3 -> :sswitch_1
        0x7ea788ea -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_9
        :pswitch_8
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static normalizeFontWeight(I)I
    .locals 2
    .param p0, "fontWeight"    # I

    .line 104
    div-int/lit8 v0, p0, 0x64

    const/16 v1, 0x64

    mul-int/2addr v0, v1

    .line 105
    .end local p0    # "fontWeight":I
    .local v0, "fontWeight":I
    if-ge v0, v1, :cond_0

    return v1

    .line 106
    :cond_0
    const/16 p0, 0x384

    if-le v0, p0, :cond_1

    return p0

    .line 107
    :cond_1
    return v0
.end method
