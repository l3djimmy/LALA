.class public Lcom/itextpdf/kernel/pdf/PdfDate;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfDate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfString;",
        ">;"
    }
.end annotation


# static fields
.field private static final DATE_SPACE:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 46
    const/16 v0, 0x12

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfDate;->DATE_SPACE:[I

    return-void

    :array_0
    .array-data 4
        0x1
        0x4
        0x0
        0x2
        0x2
        -0x1
        0x5
        0x2
        0x0
        0xb
        0x2
        0x0
        0xc
        0x2
        0x0
        0xd
        0x2
        0x0
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 62
    new-instance v0, Ljava/util/GregorianCalendar;

    invoke-direct {v0}, Ljava/util/GregorianCalendar;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDate;-><init>(Ljava/util/Calendar;)V

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/util/Calendar;)V
    .locals 2
    .param p1, "d"    # Ljava/util/Calendar;

    .line 55
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfDate;->generateStringByCalendar(Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 56
    return-void
.end method

.method public static decode(Ljava/lang/String;)Ljava/util/Calendar;
    .locals 9
    .param p0, "s"    # Ljava/lang/String;

    .line 143
    :try_start_0
    const-string v0, "D:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 144
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    move-object p0, v0

    .line 146
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 147
    .local v0, "slen":I
    const/16 v1, 0x5a

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    .local v1, "idx":I
    const-string v2, "ZPDF"

    if-ltz v1, :cond_1

    .line 149
    move v0, v1

    .line 150
    :try_start_1
    new-instance v3, Ljava/util/GregorianCalendar;

    new-instance v4, Ljava/util/SimpleTimeZone;

    const/4 v5, 0x0

    invoke-direct {v4, v5, v2}, Ljava/util/SimpleTimeZone;-><init>(ILjava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    .local v3, "calendar":Ljava/util/GregorianCalendar;
    goto :goto_1

    .line 153
    .end local v3    # "calendar":Ljava/util/GregorianCalendar;
    :cond_1
    const/4 v3, 0x1

    .line 154
    .local v3, "sign":I
    const/16 v4, 0x2b

    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 155
    .end local v1    # "idx":I
    .local v4, "idx":I
    if-gez v4, :cond_2

    .line 156
    const/16 v1, 0x2d

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 157
    .end local v4    # "idx":I
    .restart local v1    # "idx":I
    if-ltz v1, :cond_3

    .line 158
    const/4 v3, -0x1

    goto :goto_0

    .line 155
    .end local v1    # "idx":I
    .restart local v4    # "idx":I
    :cond_2
    move v1, v4

    .line 160
    .end local v4    # "idx":I
    .restart local v1    # "idx":I
    :cond_3
    :goto_0
    if-gez v1, :cond_4

    .line 161
    new-instance v2, Ljava/util/GregorianCalendar;

    invoke-direct {v2}, Ljava/util/GregorianCalendar;-><init>()V

    move-object v3, v2

    .local v2, "calendar":Ljava/util/GregorianCalendar;
    goto :goto_1

    .line 163
    .end local v2    # "calendar":Ljava/util/GregorianCalendar;
    :cond_4
    add-int/lit8 v4, v1, 0x1

    add-int/lit8 v5, v1, 0x3

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    mul-int/lit8 v4, v4, 0x3c

    .line 164
    .local v4, "offset":I
    add-int/lit8 v5, v1, 0x5

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v5, v6, :cond_5

    .line 165
    add-int/lit8 v5, v1, 0x4

    add-int/lit8 v6, v1, 0x6

    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    add-int/2addr v4, v5

    .line 166
    :cond_5
    new-instance v5, Ljava/util/GregorianCalendar;

    new-instance v6, Ljava/util/SimpleTimeZone;

    mul-int v7, v4, v3

    const v8, 0xea60

    mul-int/2addr v7, v8

    invoke-direct {v6, v7, v2}, Ljava/util/SimpleTimeZone;-><init>(ILjava/lang/String;)V

    invoke-direct {v5, v6}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    .line 167
    .local v5, "calendar":Ljava/util/GregorianCalendar;
    move v0, v1

    move-object v3, v5

    .line 170
    .end local v4    # "offset":I
    .end local v5    # "calendar":Ljava/util/GregorianCalendar;
    .local v3, "calendar":Ljava/util/GregorianCalendar;
    :goto_1
    invoke-virtual {v3}, Ljava/util/GregorianCalendar;->clear()V

    .line 171
    const/4 v1, 0x0

    .line 172
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_2
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfDate;->DATE_SPACE:[I

    array-length v4, v4

    if-ge v2, v4, :cond_7

    .line 173
    if-lt v1, v0, :cond_6

    .line 174
    goto :goto_3

    .line 175
    :cond_6
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfDate;->DATE_SPACE:[I

    aget v4, v4, v2

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfDate;->DATE_SPACE:[I

    add-int/lit8 v6, v2, 0x1

    aget v5, v5, v6

    add-int/2addr v5, v1

    invoke-virtual {p0, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfDate;->DATE_SPACE:[I

    add-int/lit8 v7, v2, 0x2

    aget v6, v6, v7

    add-int/2addr v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/util/GregorianCalendar;->set(II)V

    .line 176
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfDate;->DATE_SPACE:[I

    add-int/lit8 v5, v2, 0x1

    aget v4, v4, v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    add-int/2addr v1, v4

    .line 172
    add-int/lit8 v2, v2, 0x3

    goto :goto_2

    .line 178
    .end local v2    # "k":I
    :cond_7
    :goto_3
    return-object v3

    .line 180
    .end local v0    # "slen":I
    .end local v1    # "idx":I
    .end local v3    # "calendar":Ljava/util/GregorianCalendar;
    :catch_0
    move-exception v0

    .line 181
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    return-object v1
.end method

.method private static generateStringByCalendar(Ljava/util/Calendar;)Ljava/lang/String;
    .locals 7
    .param p0, "d"    # Ljava/util/Calendar;

    .line 191
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "D:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 192
    .local v0, "date":Ljava/lang/StringBuilder;
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v2

    const/4 v3, 0x4

    invoke-static {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDate;->setLength(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v3

    add-int/2addr v3, v1

    invoke-static {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfDate;->setLength(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    const/4 v1, 0x5

    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-static {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDate;->setLength(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    const/16 v1, 0xb

    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-static {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDate;->setLength(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    const/16 v1, 0xc

    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-static {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDate;->setLength(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    const/16 v1, 0xd

    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-static {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDate;->setLength(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    const/16 v1, 0xf

    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v3

    const/16 v4, 0x10

    invoke-virtual {p0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v5

    add-int/2addr v3, v5

    const v5, 0x36ee80

    div-int/2addr v3, v5

    .line 199
    .local v3, "timezone":I
    if-nez v3, :cond_0

    .line 200
    const/16 v5, 0x5a

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 202
    :cond_0
    if-gez v3, :cond_1

    .line 203
    const/16 v5, 0x2d

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 204
    neg-int v3, v3

    goto :goto_0

    .line 207
    :cond_1
    const/16 v5, 0x2b

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 209
    :goto_0
    if-eqz v3, :cond_2

    .line 210
    invoke-static {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfDate;->setLength(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x27

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 211
    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {p0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    add-int/2addr v1, v4

    const v4, 0xea60

    div-int/2addr v1, v4

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    mul-int/lit8 v4, v3, 0x3c

    sub-int/2addr v1, v4

    .line 212
    .local v1, "zone":I
    invoke-static {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDate;->setLength(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 214
    .end local v1    # "zone":I
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getW3CDate(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "d"    # Ljava/lang/String;

    .line 79
    const-string v0, "D:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_0

    .line 80
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 81
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x4

    if-ge v2, v3, :cond_1

    .line 83
    const-string v1, "0000"

    return-object v1

    .line 85
    :cond_1
    const/4 v2, 0x0

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 87
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v3, v1, :cond_2

    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 90
    :cond_2
    const/16 v3, 0x2d

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 92
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v4, v1, :cond_3

    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 95
    :cond_3
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 97
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v3, v1, :cond_4

    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 100
    :cond_4
    const/16 v3, 0x54

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 102
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v3, v1, :cond_5

    .line 103
    const-string v1, ":00Z"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 107
    :cond_5
    const/16 v3, 0x3a

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 109
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x5a

    if-ge v4, v1, :cond_6

    .line 110
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 111
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 114
    :cond_6
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 116
    const-string v4, "-"

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_7

    const-string v4, "+"

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 117
    :cond_7
    const/4 v4, 0x1

    invoke-virtual {p0, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 118
    .local v6, "sign":Ljava/lang/String;
    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 119
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-lt v4, v1, :cond_9

    .line 120
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 121
    .local v4, "h":Ljava/lang/String;
    const-string v5, "00"

    .line 122
    .local v5, "m":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    if-le v7, v1, :cond_8

    .line 123
    const/4 v7, 0x3

    invoke-virtual {p0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 124
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    if-lt v7, v1, :cond_8

    .line 125
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 127
    :cond_8
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 131
    .end local v4    # "h":Ljava/lang/String;
    .end local v5    # "m":Ljava/lang/String;
    .end local v6    # "sign":Ljava/lang/String;
    :cond_9
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 132
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static setLength(II)Ljava/lang/String;
    .locals 3
    .param p0, "i"    # I
    .param p1, "length"    # I

    .line 227
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 228
    .local v0, "tmp":Ljava/lang/StringBuilder;
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 229
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-ge v1, p1, :cond_0

    .line 230
    const/4 v1, 0x0

    const-string v2, "0"

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 232
    :cond_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 233
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public getW3CDate()Ljava/lang/String;
    .locals 1

    .line 70
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDate;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/PdfDate;->getW3CDate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 187
    const/4 v0, 0x0

    return v0
.end method
