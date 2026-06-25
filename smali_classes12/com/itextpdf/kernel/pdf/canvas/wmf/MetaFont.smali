.class public Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;
.super Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;
.source "MetaFont.java"


# static fields
.field static final BOLDTHRESHOLD:I = 0x258

.field static final DEFAULT_PITCH:I = 0x0

.field static final ETO_CLIPPED:I = 0x4

.field static final ETO_OPAQUE:I = 0x2

.field static final FF_DECORATIVE:I = 0x5

.field static final FF_DONTCARE:I = 0x0

.field static final FF_MODERN:I = 0x3

.field static final FF_ROMAN:I = 0x1

.field static final FF_SCRIPT:I = 0x4

.field static final FF_SWISS:I = 0x2

.field static final FIXED_PITCH:I = 0x1

.field static final MARKER_BOLD:I = 0x1

.field static final MARKER_COURIER:I = 0x0

.field static final MARKER_HELVETICA:I = 0x4

.field static final MARKER_ITALIC:I = 0x2

.field static final MARKER_SYMBOL:I = 0xc

.field static final MARKER_TIMES:I = 0x8

.field static final NAME_SIZE:I = 0x20

.field static final VARIABLE_PITCH:I = 0x2

.field static final fontNames:[Ljava/lang/String;


# instance fields
.field angle:F

.field bold:I

.field charset:I

.field encoding:Lcom/itextpdf/io/font/FontEncoding;

.field faceName:Ljava/lang/String;

.field font:Lcom/itextpdf/io/font/FontProgram;

.field height:I

.field italic:I

.field pitchAndFamily:I

.field strikeout:Z

.field underline:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 38
    const/16 v0, 0xe

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Courier"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Courier-Bold"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Courier-Oblique"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Courier-BoldOblique"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "Helvetica"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "Helvetica-Bold"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "Helvetica-Oblique"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "Helvetica-BoldOblique"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "Times-Roman"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "Times-Bold"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "Times-Italic"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "Times-BoldItalic"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "Symbol"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "ZapfDingbats"

    aput-object v2, v0, v1

    sput-object v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->fontNames:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 81
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;-><init>(I)V

    .line 73
    const-string v0, "arial"

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->faceName:Ljava/lang/String;

    .line 74
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->font:Lcom/itextpdf/io/font/FontProgram;

    .line 75
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->encoding:Lcom/itextpdf/io/font/FontEncoding;

    .line 82
    return-void
.end method


# virtual methods
.method public getAngle()F
    .locals 1

    .line 206
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->angle:F

    return v0
.end method

.method public getEncoding()Lcom/itextpdf/io/font/FontEncoding;
    .locals 1

    .line 197
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->encoding:Lcom/itextpdf/io/font/FontEncoding;

    return-object v0
.end method

.method public getFont()Lcom/itextpdf/io/font/FontProgram;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 126
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->font:Lcom/itextpdf/io/font/FontProgram;

    if-eqz v0, :cond_0

    .line 127
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->font:Lcom/itextpdf/io/font/FontProgram;

    return-object v0

    .line 128
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->faceName:Ljava/lang/String;

    iget v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->italic:I

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    const/4 v1, 0x2

    goto :goto_0

    :cond_1
    move v1, v2

    :goto_0
    iget v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->bold:I

    const/4 v4, 0x1

    if-eqz v3, :cond_2

    move v3, v4

    goto :goto_1

    :cond_2
    move v3, v2

    :goto_1
    or-int/2addr v1, v3

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/FontProgramFactory;->createRegisteredFont(Ljava/lang/String;I)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    .line 129
    .local v0, "ff2":Lcom/itextpdf/io/font/FontProgram;
    const-string v1, "Cp1252"

    invoke-static {v1}, Lcom/itextpdf/io/font/FontEncoding;->createFontEncoding(Ljava/lang/String;)Lcom/itextpdf/io/font/FontEncoding;

    move-result-object v3

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->encoding:Lcom/itextpdf/io/font/FontEncoding;

    .line 130
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->font:Lcom/itextpdf/io/font/FontProgram;

    .line 131
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->font:Lcom/itextpdf/io/font/FontProgram;

    if-eqz v3, :cond_3

    .line 132
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->font:Lcom/itextpdf/io/font/FontProgram;

    return-object v1

    .line 134
    :cond_3
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->faceName:Ljava/lang/String;

    const-string v5, "courier"

    invoke-virtual {v3, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_b

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->faceName:Ljava/lang/String;

    const-string/jumbo v5, "terminal"

    invoke-virtual {v3, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_b

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->faceName:Ljava/lang/String;

    .line 135
    const-string v5, "fixedsys"

    invoke-virtual {v3, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4

    goto/16 :goto_4

    .line 138
    :cond_4
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->faceName:Ljava/lang/String;

    const-string v5, "ms sans serif"

    invoke-virtual {v3, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_a

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->faceName:Ljava/lang/String;

    const-string v5, "arial"

    invoke-virtual {v3, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_a

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->faceName:Ljava/lang/String;

    .line 139
    const-string/jumbo v5, "system"

    invoke-virtual {v3, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_5

    goto/16 :goto_3

    .line 142
    :cond_5
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->faceName:Ljava/lang/String;

    const-string v5, "arial black"

    invoke-virtual {v3, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 143
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->fontNames:[Ljava/lang/String;

    iget v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->italic:I

    add-int/lit8 v3, v3, 0x4

    add-int/2addr v3, v4

    aget-object v2, v2, v3

    .local v2, "fontName":Ljava/lang/String;
    goto/16 :goto_5

    .line 145
    .end local v2    # "fontName":Ljava/lang/String;
    :cond_6
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->faceName:Ljava/lang/String;

    const-string/jumbo v4, "times"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_9

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->faceName:Ljava/lang/String;

    const-string v4, "ms serif"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_9

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->faceName:Ljava/lang/String;

    .line 146
    const-string/jumbo v4, "roman"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_7

    goto :goto_2

    .line 149
    :cond_7
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->faceName:Ljava/lang/String;

    const-string/jumbo v4, "symbol"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 150
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->fontNames:[Ljava/lang/String;

    const/16 v3, 0xc

    aget-object v2, v2, v3

    .restart local v2    # "fontName":Ljava/lang/String;
    goto :goto_5

    .line 153
    .end local v2    # "fontName":Ljava/lang/String;
    :cond_8
    iget v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->pitchAndFamily:I

    and-int/lit8 v3, v3, 0x3

    .line 154
    .local v3, "pitch":I
    iget v4, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->pitchAndFamily:I

    shr-int/lit8 v4, v4, 0x4

    and-int/lit8 v4, v4, 0x7

    .line 155
    .local v4, "family":I
    packed-switch v4, :pswitch_data_0

    .line 169
    nop

    .line 174
    iget v5, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->italic:I

    .line 169
    packed-switch v3, :pswitch_data_1

    .line 174
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->fontNames:[Ljava/lang/String;

    add-int/lit8 v5, v5, 0x4

    iget v6, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->bold:I

    add-int/2addr v5, v6

    aget-object v2, v2, v5

    .restart local v2    # "fontName":Ljava/lang/String;
    goto :goto_5

    .line 157
    .end local v2    # "fontName":Ljava/lang/String;
    :pswitch_0
    sget-object v5, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->fontNames:[Ljava/lang/String;

    iget v6, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->italic:I

    add-int/2addr v6, v2

    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->bold:I

    add-int/2addr v6, v2

    aget-object v2, v5, v6

    .line 158
    .restart local v2    # "fontName":Ljava/lang/String;
    goto :goto_5

    .line 165
    .end local v2    # "fontName":Ljava/lang/String;
    :pswitch_1
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->fontNames:[Ljava/lang/String;

    iget v5, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->italic:I

    add-int/lit8 v5, v5, 0x4

    iget v6, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->bold:I

    add-int/2addr v5, v6

    aget-object v2, v2, v5

    .line 166
    .restart local v2    # "fontName":Ljava/lang/String;
    goto :goto_5

    .line 160
    .end local v2    # "fontName":Ljava/lang/String;
    :pswitch_2
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->fontNames:[Ljava/lang/String;

    iget v5, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->italic:I

    add-int/lit8 v5, v5, 0x8

    iget v6, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->bold:I

    add-int/2addr v5, v6

    aget-object v2, v2, v5

    .line 161
    .restart local v2    # "fontName":Ljava/lang/String;
    goto :goto_5

    .line 171
    .end local v2    # "fontName":Ljava/lang/String;
    :pswitch_3
    sget-object v6, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->fontNames:[Ljava/lang/String;

    add-int/2addr v5, v2

    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->bold:I

    add-int/2addr v5, v2

    aget-object v2, v6, v5

    .line 172
    .restart local v2    # "fontName":Ljava/lang/String;
    goto :goto_5

    .line 147
    .end local v2    # "fontName":Ljava/lang/String;
    .end local v3    # "pitch":I
    .end local v4    # "family":I
    :cond_9
    :goto_2
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->fontNames:[Ljava/lang/String;

    iget v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->italic:I

    add-int/lit8 v3, v3, 0x8

    iget v4, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->bold:I

    add-int/2addr v3, v4

    aget-object v2, v2, v3

    .restart local v2    # "fontName":Ljava/lang/String;
    goto :goto_5

    .line 140
    .end local v2    # "fontName":Ljava/lang/String;
    :cond_a
    :goto_3
    sget-object v2, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->fontNames:[Ljava/lang/String;

    iget v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->italic:I

    add-int/lit8 v3, v3, 0x4

    iget v4, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->bold:I

    add-int/2addr v3, v4

    aget-object v2, v2, v3

    .restart local v2    # "fontName":Ljava/lang/String;
    goto :goto_5

    .line 136
    .end local v2    # "fontName":Ljava/lang/String;
    :cond_b
    :goto_4
    sget-object v3, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->fontNames:[Ljava/lang/String;

    iget v4, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->italic:I

    add-int/2addr v4, v2

    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->bold:I

    add-int/2addr v4, v2

    aget-object v2, v3, v4

    .line 181
    .restart local v2    # "fontName":Ljava/lang/String;
    :goto_5
    :try_start_0
    invoke-static {v2}, Lcom/itextpdf/io/font/FontProgramFactory;->createFont(Ljava/lang/String;)Lcom/itextpdf/io/font/FontProgram;

    move-result-object v3

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->font:Lcom/itextpdf/io/font/FontProgram;

    .line 182
    invoke-static {v1}, Lcom/itextpdf/io/font/FontEncoding;->createFontEncoding(Ljava/lang/String;)Lcom/itextpdf/io/font/FontEncoding;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->encoding:Lcom/itextpdf/io/font/FontEncoding;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    nop

    .line 188
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->font:Lcom/itextpdf/io/font/FontProgram;

    return-object v1

    .line 184
    :catch_0
    move-exception v1

    .line 185
    .local v1, "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
    .end packed-switch
.end method

.method public getFontSize(Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;)F
    .locals 2
    .param p1, "state"    # Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    .line 234
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->height:I

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->transformY(I)F

    move-result v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    sget v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/WmfImageHelper;->wmfFontCorrection:F

    mul-float/2addr v0, v1

    return v0
.end method

.method public init(Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;)V
    .locals 6
    .param p1, "in"    # Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 91
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->height:I

    .line 92
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->skip(I)V

    .line 93
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v1

    int-to-double v1, v1

    const-wide v3, 0x409c200000000000L    # 1800.0

    div-double/2addr v1, v3

    const-wide v3, 0x400921fb54442d18L    # Math.PI

    mul-double/2addr v1, v3

    double-to-float v1, v1

    iput v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->angle:F

    .line 94
    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->skip(I)V

    .line 95
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readShort()I

    move-result v1

    const/16 v2, 0x258

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-lt v1, v2, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    move v1, v4

    :goto_0
    iput v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->bold:I

    .line 96
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readByte()I

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    move v0, v4

    :goto_1
    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->italic:I

    .line 97
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readByte()I

    move-result v0

    if-eqz v0, :cond_2

    move v0, v3

    goto :goto_2

    :cond_2
    move v0, v4

    :goto_2
    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->underline:Z

    .line 98
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readByte()I

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_3

    :cond_3
    move v3, v4

    :goto_3
    iput-boolean v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->strikeout:Z

    .line 99
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readByte()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->charset:I

    .line 100
    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->skip(I)V

    .line 101
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readByte()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->pitchAndFamily:I

    .line 102
    const/16 v0, 0x20

    new-array v1, v0, [B

    .line 104
    .local v1, "name":[B
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_4
    if-ge v2, v0, :cond_5

    .line 105
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readByte()I

    move-result v3

    .line 106
    .local v3, "c":I
    if-nez v3, :cond_4

    .line 107
    goto :goto_5

    .line 109
    :cond_4
    int-to-byte v5, v3

    aput-byte v5, v1, v2

    .line 104
    .end local v3    # "c":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 112
    :cond_5
    :goto_5
    :try_start_0
    new-instance v0, Ljava/lang/String;

    const-string v3, "Cp1252"

    invoke-direct {v0, v1, v4, v2, v3}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->faceName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    goto :goto_6

    .line 113
    :catch_0
    move-exception v0

    .line 114
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v1, v4, v2}, Ljava/lang/String;-><init>([BII)V

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->faceName:Ljava/lang/String;

    .line 116
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :goto_6
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->faceName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->faceName:Ljava/lang/String;

    .line 117
    return-void
.end method

.method public isStrikeout()Z
    .locals 1

    .line 224
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->strikeout:Z

    return v0
.end method

.method public isUnderline()Z
    .locals 1

    .line 215
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;->underline:Z

    return v0
.end method
