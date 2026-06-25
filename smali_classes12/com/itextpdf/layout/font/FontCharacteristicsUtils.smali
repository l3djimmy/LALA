.class final Lcom/itextpdf/layout/font/FontCharacteristicsUtils;
.super Ljava/lang/Object;
.source "FontCharacteristicsUtils.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static normalizeFontWeight(S)S
    .locals 2
    .param p0, "fw"    # S

    .line 30
    div-int/lit8 v0, p0, 0x64

    const/16 v1, 0x64

    mul-int/2addr v0, v1

    int-to-short p0, v0

    .line 31
    if-ge p0, v1, :cond_0

    return v1

    .line 32
    :cond_0
    const/16 v0, 0x384

    if-le p0, v0, :cond_1

    return v0

    .line 33
    :cond_1
    return p0
.end method

.method static parseFontWeight(Ljava/lang/String;)S
    .locals 2
    .param p0, "fw"    # Ljava/lang/String;

    .line 37
    const/4 v0, -0x1

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_3

    .line 40
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    :cond_1
    goto :goto_0

    :sswitch_0
    const-string v1, "bold"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    goto :goto_1

    :sswitch_1
    const-string/jumbo v1, "normal"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    goto :goto_1

    :goto_0
    move v1, v0

    :goto_1
    packed-switch v1, :pswitch_data_0

    .line 48
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    goto :goto_2

    .line 45
    :pswitch_0
    const/16 v0, 0x190

    return v0

    .line 43
    :pswitch_1
    const/16 v0, 0x2bc

    return v0

    .line 48
    :goto_2
    int-to-short v1, v1

    invoke-static {v1}, Lcom/itextpdf/layout/font/FontCharacteristicsUtils;->normalizeFontWeight(S)S

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 49
    :catch_0
    move-exception v1

    .line 50
    .local v1, "ignored":Ljava/lang/NumberFormatException;
    return v0

    .line 38
    .end local v1    # "ignored":Ljava/lang/NumberFormatException;
    :cond_2
    :goto_3
    return v0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x3df94319 -> :sswitch_1
        0x2e3a85 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
