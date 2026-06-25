.class public final Lcom/itextpdf/kernel/xmp/impl/ISO8601Converter;
.super Ljava/lang/Object;
.source "ISO8601Converter.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    return-void
.end method

.method public static parse(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/XMPDateTime;
    .locals 1
    .param p0, "iso8601String"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 99
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;-><init>()V

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/ISO8601Converter;->parse(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/XMPDateTime;)Lcom/itextpdf/kernel/xmp/XMPDateTime;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/XMPDateTime;)Lcom/itextpdf/kernel/xmp/XMPDateTime;
    .locals 13
    .param p0, "iso8601String"    # Ljava/lang/String;
    .param p1, "binValue"    # Lcom/itextpdf/kernel/xmp/XMPDateTime;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 111
    if-eqz p0, :cond_21

    .line 115
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 117
    return-object p1

    .line 120
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/ParseState;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;-><init>(Ljava/lang/String;)V

    .line 123
    .local v0, "input":Lcom/itextpdf/kernel/xmp/impl/ParseState;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch(I)C

    move-result v2

    const/16 v3, 0x2d

    if-ne v2, v3, :cond_1

    .line 125
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->skip()V

    .line 129
    :cond_1
    const-string v2, "Invalid year in date string"

    const/16 v4, 0x270f

    invoke-virtual {v0, v2, v4}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->gatherInt(Ljava/lang/String;I)I

    move-result v2

    .line 130
    .local v2, "value":I
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->hasNext()Z

    move-result v4

    const/4 v5, 0x5

    if-eqz v4, :cond_3

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v4

    if-ne v4, v3, :cond_2

    goto :goto_0

    .line 132
    :cond_2
    new-instance v1, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v3, "Invalid date string, after year"

    invoke-direct {v1, v3, v5}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 135
    :cond_3
    :goto_0
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch(I)C

    move-result v1

    if-ne v1, v3, :cond_4

    .line 137
    neg-int v2, v2

    .line 139
    :cond_4
    invoke-interface {p1, v2}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->setYear(I)V

    .line 140
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->hasNext()Z

    move-result v1

    if-nez v1, :cond_5

    .line 142
    return-object p1

    .line 144
    :cond_5
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->skip()V

    .line 148
    const-string v1, "Invalid month in date string"

    const/16 v4, 0xc

    invoke-virtual {v0, v1, v4}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->gatherInt(Ljava/lang/String;I)I

    move-result v1

    .line 149
    .end local v2    # "value":I
    .local v1, "value":I
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v2

    if-ne v2, v3, :cond_6

    goto :goto_1

    .line 151
    :cond_6
    new-instance v2, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v3, "Invalid date string, after month"

    invoke-direct {v2, v3, v5}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 153
    :cond_7
    :goto_1
    invoke-interface {p1, v1}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->setMonth(I)V

    .line 154
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->hasNext()Z

    move-result v2

    if-nez v2, :cond_8

    .line 156
    return-object p1

    .line 158
    :cond_8
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->skip()V

    .line 162
    const-string v2, "Invalid day in date string"

    const/16 v4, 0x1f

    invoke-virtual {v0, v2, v4}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->gatherInt(Ljava/lang/String;I)I

    move-result v1

    .line 163
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v2

    const/16 v4, 0x54

    if-ne v2, v4, :cond_9

    goto :goto_2

    .line 165
    :cond_9
    new-instance v2, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v3, "Invalid date string, after day"

    invoke-direct {v2, v3, v5}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 167
    :cond_a
    :goto_2
    invoke-interface {p1, v1}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->setDay(I)V

    .line 168
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->hasNext()Z

    move-result v2

    if-nez v2, :cond_b

    .line 170
    return-object p1

    .line 172
    :cond_b
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->skip()V

    .line 175
    const-string v2, "Invalid hour in date string"

    const/16 v4, 0x17

    invoke-virtual {v0, v2, v4}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->gatherInt(Ljava/lang/String;I)I

    move-result v1

    .line 176
    invoke-interface {p1, v1}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->setHour(I)V

    .line 177
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->hasNext()Z

    move-result v2

    if-nez v2, :cond_c

    .line 179
    return-object p1

    .line 183
    :cond_c
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v2

    const/16 v6, 0x3b

    const/16 v7, 0x3a

    const/16 v8, 0x2b

    const/16 v9, 0x5a

    if-ne v2, v7, :cond_f

    .line 185
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->skip()V

    .line 186
    const-string v2, "Invalid minute in date string"

    invoke-virtual {v0, v2, v6}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->gatherInt(Ljava/lang/String;I)I

    move-result v1

    .line 187
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_e

    .line 188
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v2

    if-eq v2, v7, :cond_e

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v2

    if-eq v2, v9, :cond_e

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v2

    if-eq v2, v8, :cond_e

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v2

    if-ne v2, v3, :cond_d

    goto :goto_3

    .line 190
    :cond_d
    new-instance v2, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v3, "Invalid date string, after minute"

    invoke-direct {v2, v3, v5}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 192
    :cond_e
    :goto_3
    invoke-interface {p1, v1}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->setMinute(I)V

    .line 195
    :cond_f
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->hasNext()Z

    move-result v2

    if-nez v2, :cond_10

    .line 197
    return-object p1

    .line 199
    :cond_10
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_17

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v2

    if-ne v2, v7, :cond_17

    .line 201
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->skip()V

    .line 202
    const-string v2, "Invalid whole seconds in date string"

    invoke-virtual {v0, v2, v6}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->gatherInt(Ljava/lang/String;I)I

    move-result v1

    .line 203
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->hasNext()Z

    move-result v2

    const/16 v10, 0x2e

    if-eqz v2, :cond_12

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v2

    if-eq v2, v10, :cond_12

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v2

    if-eq v2, v9, :cond_12

    .line 204
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v2

    if-eq v2, v8, :cond_12

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v2

    if-ne v2, v3, :cond_11

    goto :goto_4

    .line 206
    :cond_11
    new-instance v2, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v3, "Invalid date string, after whole seconds"

    invoke-direct {v2, v3, v5}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 209
    :cond_12
    :goto_4
    invoke-interface {p1, v1}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->setSecond(I)V

    .line 210
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v2

    if-ne v2, v10, :cond_19

    .line 212
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->skip()V

    .line 213
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->pos()I

    move-result v2

    .line 214
    .local v2, "digits":I
    const-string v10, "Invalid fractional seconds in date string"

    const v11, 0x3b9ac9ff

    invoke-virtual {v0, v10, v11}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->gatherInt(Ljava/lang/String;I)I

    move-result v1

    .line 215
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_14

    .line 216
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v10

    if-eq v10, v9, :cond_14

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v10

    if-eq v10, v8, :cond_14

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v10

    if-ne v10, v3, :cond_13

    goto :goto_5

    .line 218
    :cond_13
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v4, "Invalid date string, after fractional second"

    invoke-direct {v3, v4, v5}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 221
    :cond_14
    :goto_5
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->pos()I

    move-result v10

    sub-int/2addr v10, v2

    .line 222
    .end local v2    # "digits":I
    .local v10, "digits":I
    :goto_6
    const/16 v2, 0x9

    if-le v10, v2, :cond_15

    .line 224
    div-int/lit8 v1, v1, 0xa

    .line 222
    add-int/lit8 v10, v10, -0x1

    goto :goto_6

    .line 226
    :cond_15
    :goto_7
    if-ge v10, v2, :cond_16

    .line 228
    mul-int/lit8 v1, v1, 0xa

    .line 226
    add-int/lit8 v10, v10, 0x1

    goto :goto_7

    .line 230
    :cond_16
    invoke-interface {p1, v1}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->setNanoSecond(I)V

    .line 231
    .end local v10    # "digits":I
    goto :goto_8

    .line 233
    :cond_17
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v2

    if-eq v2, v9, :cond_19

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v2

    if-eq v2, v8, :cond_19

    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v2

    if-ne v2, v3, :cond_18

    goto :goto_8

    .line 235
    :cond_18
    new-instance v2, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v3, "Invalid date string, after time"

    invoke-direct {v2, v3, v5}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 239
    :cond_19
    :goto_8
    const/4 v2, 0x0

    .line 240
    .local v2, "tzSign":I
    const/4 v10, 0x0

    .line 241
    .local v10, "tzHour":I
    const/4 v11, 0x0

    .line 243
    .local v11, "tzMinute":I
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->hasNext()Z

    move-result v12

    if-nez v12, :cond_1a

    .line 246
    return-object p1

    .line 248
    :cond_1a
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v12

    if-ne v12, v9, :cond_1b

    .line 250
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->skip()V

    goto :goto_a

    .line 252
    :cond_1b
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1f

    .line 254
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v9

    if-ne v9, v8, :cond_1c

    .line 256
    const/4 v2, 0x1

    goto :goto_9

    .line 258
    :cond_1c
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v8

    if-ne v8, v3, :cond_1e

    .line 260
    const/4 v2, -0x1

    .line 268
    :goto_9
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->skip()V

    .line 270
    const-string v3, "Invalid time zone hour in date string"

    invoke-virtual {v0, v3, v4}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->gatherInt(Ljava/lang/String;I)I

    move-result v10

    .line 271
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 273
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->ch()C

    move-result v3

    if-ne v3, v7, :cond_1d

    .line 275
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->skip()V

    .line 278
    const-string v3, "Invalid time zone minute in date string"

    invoke-virtual {v0, v3, v6}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->gatherInt(Ljava/lang/String;I)I

    move-result v11

    goto :goto_a

    .line 282
    :cond_1d
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v4, "Invalid date string, after time zone hour"

    invoke-direct {v3, v4, v5}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 264
    :cond_1e
    new-instance v3, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v4, "Time zone must begin with \'Z\', \'+\', or \'-\'"

    invoke-direct {v3, v4, v5}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 289
    :cond_1f
    :goto_a
    mul-int/lit16 v3, v10, 0xe10

    mul-int/lit16 v3, v3, 0x3e8

    mul-int/lit8 v4, v11, 0x3c

    mul-int/lit16 v4, v4, 0x3e8

    add-int/2addr v3, v4

    mul-int/2addr v3, v2

    .line 290
    .local v3, "offset":I
    new-instance v4, Ljava/util/SimpleTimeZone;

    const-string v6, ""

    invoke-direct {v4, v3, v6}, Ljava/util/SimpleTimeZone;-><init>(ILjava/lang/String;)V

    invoke-interface {p1, v4}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->setTimeZone(Ljava/util/TimeZone;)V

    .line 292
    invoke-virtual {v0}, Lcom/itextpdf/kernel/xmp/impl/ParseState;->hasNext()Z

    move-result v4

    if-nez v4, :cond_20

    .line 298
    return-object p1

    .line 294
    :cond_20
    new-instance v4, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v6, "Invalid date string, extra chars at end"

    invoke-direct {v4, v6, v5}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 113
    .end local v0    # "input":Lcom/itextpdf/kernel/xmp/impl/ParseState;
    .end local v1    # "value":I
    .end local v2    # "tzSign":I
    .end local v3    # "offset":I
    .end local v10    # "tzHour":I
    .end local v11    # "tzMinute":I
    :cond_21
    new-instance v0, Lcom/itextpdf/kernel/xmp/XMPException;

    const-string v1, "Parameter must not be null"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public static render(Lcom/itextpdf/kernel/xmp/XMPDateTime;)Ljava/lang/String;
    .locals 9
    .param p0, "dateTime"    # Lcom/itextpdf/kernel/xmp/XMPDateTime;

    .line 336
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 338
    .local v0, "buffer":Ljava/lang/StringBuffer;
    invoke-interface {p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->hasDate()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 341
    new-instance v1, Ljava/text/DecimalFormat;

    new-instance v2, Ljava/text/DecimalFormatSymbols;

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v2, v3}, Ljava/text/DecimalFormatSymbols;-><init>(Ljava/util/Locale;)V

    const-string v3, "0000"

    invoke-direct {v1, v3, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;Ljava/text/DecimalFormatSymbols;)V

    .line 342
    .local v1, "df":Ljava/text/DecimalFormat;
    invoke-interface {p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getYear()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 343
    invoke-interface {p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getMonth()I

    move-result v2

    if-nez v2, :cond_0

    .line 345
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 349
    :cond_0
    const-string v2, "\'-\'00"

    invoke-virtual {v1, v2}, Ljava/text/DecimalFormat;->applyPattern(Ljava/lang/String;)V

    .line 350
    invoke-interface {p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getMonth()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 351
    invoke-interface {p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getDay()I

    move-result v2

    if-nez v2, :cond_1

    .line 353
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 357
    :cond_1
    invoke-interface {p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getDay()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 360
    invoke-interface {p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->hasTime()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 363
    const/16 v2, 0x54

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 364
    const-string v2, "00"

    invoke-virtual {v1, v2}, Ljava/text/DecimalFormat;->applyPattern(Ljava/lang/String;)V

    .line 365
    invoke-interface {p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getHour()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 366
    const/16 v2, 0x3a

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 367
    invoke-interface {p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getMinute()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 370
    invoke-interface {p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getSecond()I

    move-result v2

    if-nez v2, :cond_2

    invoke-interface {p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getNanoSecond()I

    move-result v2

    if-eqz v2, :cond_3

    .line 372
    :cond_2
    invoke-interface {p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getSecond()I

    move-result v2

    int-to-double v2, v2

    invoke-interface {p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getNanoSecond()I

    move-result v4

    int-to-double v4, v4

    const-wide v6, 0x41cdcd6500000000L    # 1.0E9

    div-double/2addr v4, v6

    add-double/2addr v2, v4

    .line 374
    .local v2, "seconds":D
    const-string v4, ":00.#########"

    invoke-virtual {v1, v4}, Ljava/text/DecimalFormat;->applyPattern(Ljava/lang/String;)V

    .line 375
    invoke-virtual {v1, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 379
    .end local v2    # "seconds":D
    :cond_3
    invoke-interface {p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->hasTimeZone()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 382
    invoke-interface {p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getCalendar()Ljava/util/Calendar;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    .line 383
    .local v2, "timeInMillis":J
    invoke-interface {p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v4

    invoke-virtual {v4, v2, v3}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v4

    .line 384
    .local v4, "offset":I
    if-nez v4, :cond_4

    .line 387
    const/16 v5, 0x5a

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 391
    :cond_4
    const v5, 0x36ee80

    div-int v6, v4, v5

    .line 392
    .local v6, "thours":I
    rem-int v5, v4, v5

    const v7, 0xea60

    div-int/2addr v5, v7

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    .line 393
    .local v5, "tminutes":I
    const-string v7, "+00;-00"

    invoke-virtual {v1, v7}, Ljava/text/DecimalFormat;->applyPattern(Ljava/lang/String;)V

    .line 394
    int-to-long v7, v6

    invoke-virtual {v1, v7, v8}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 395
    const-string v7, ":00"

    invoke-virtual {v1, v7}, Ljava/text/DecimalFormat;->applyPattern(Ljava/lang/String;)V

    .line 396
    int-to-long v7, v5

    invoke-virtual {v1, v7, v8}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 401
    .end local v1    # "df":Ljava/text/DecimalFormat;
    .end local v2    # "timeInMillis":J
    .end local v4    # "offset":I
    .end local v5    # "tminutes":I
    .end local v6    # "thours":I
    :cond_5
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
