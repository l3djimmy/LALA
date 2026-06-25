.class public Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;
.super Ljava/lang/Object;
.source "XMPDateTimeImpl.java"

# interfaces
.implements Lcom/itextpdf/kernel/xmp/XMPDateTime;


# instance fields
.field private day:I

.field private hasDate:Z

.field private hasTime:Z

.field private hasTimeZone:Z

.field private hour:I

.field private minute:I

.field private month:I

.field private nanoSeconds:I

.field private second:I

.field private timeZone:Ljava/util/TimeZone;

.field private year:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->year:I

    .line 55
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->month:I

    .line 57
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->day:I

    .line 59
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hour:I

    .line 61
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->minute:I

    .line 63
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->second:I

    .line 65
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->timeZone:Ljava/util/TimeZone;

    .line 71
    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasDate:Z

    .line 73
    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTime:Z

    .line 75
    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTimeZone:Z

    .line 85
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "strValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->year:I

    .line 55
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->month:I

    .line 57
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->day:I

    .line 59
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hour:I

    .line 61
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->minute:I

    .line 63
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->second:I

    .line 65
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->timeZone:Ljava/util/TimeZone;

    .line 71
    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasDate:Z

    .line 73
    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTime:Z

    .line 75
    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTimeZone:Z

    .line 155
    invoke-static {p1, p0}, Lcom/itextpdf/kernel/xmp/impl/ISO8601Converter;->parse(Ljava/lang/String;Lcom/itextpdf/kernel/xmp/XMPDateTime;)Lcom/itextpdf/kernel/xmp/XMPDateTime;

    .line 156
    return-void
.end method

.method public constructor <init>(Ljava/util/Calendar;)V
    .locals 6
    .param p1, "calendar"    # Ljava/util/Calendar;

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->year:I

    .line 55
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->month:I

    .line 57
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->day:I

    .line 59
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hour:I

    .line 61
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->minute:I

    .line 63
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->second:I

    .line 65
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->timeZone:Ljava/util/TimeZone;

    .line 71
    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasDate:Z

    .line 73
    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTime:Z

    .line 75
    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTimeZone:Z

    .line 96
    invoke-virtual {p1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    .line 97
    .local v0, "date":Ljava/util/Date;
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    .line 101
    .local v1, "zone":Ljava/util/TimeZone;
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 102
    invoke-static {v2}, Ljava/util/Calendar;->getInstance(Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v2

    check-cast v2, Ljava/util/GregorianCalendar;

    .line 103
    .local v2, "intCalendar":Ljava/util/GregorianCalendar;
    new-instance v3, Ljava/util/Date;

    const-wide/high16 v4, -0x8000000000000000L

    invoke-direct {v3, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v2, v3}, Ljava/util/GregorianCalendar;->setGregorianChange(Ljava/util/Date;)V

    .line 104
    invoke-virtual {v2, v1}, Ljava/util/GregorianCalendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 105
    invoke-virtual {v2, v0}, Ljava/util/GregorianCalendar;->setTime(Ljava/util/Date;)V

    .line 107
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v4

    iput v4, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->year:I

    .line 108
    const/4 v4, 0x2

    invoke-virtual {v2, v4}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v4

    add-int/2addr v4, v3

    iput v4, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->month:I

    .line 109
    const/4 v4, 0x5

    invoke-virtual {v2, v4}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v4

    iput v4, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->day:I

    .line 110
    const/16 v4, 0xb

    invoke-virtual {v2, v4}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v4

    iput v4, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hour:I

    .line 111
    const/16 v4, 0xc

    invoke-virtual {v2, v4}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v4

    iput v4, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->minute:I

    .line 112
    const/16 v4, 0xd

    invoke-virtual {v2, v4}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v4

    iput v4, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->second:I

    .line 113
    const/16 v4, 0xe

    invoke-virtual {v2, v4}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v4

    const v5, 0xf4240

    mul-int/2addr v4, v5

    iput v4, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->nanoSeconds:I

    .line 114
    invoke-virtual {v2}, Ljava/util/GregorianCalendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v4

    iput-object v4, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->timeZone:Ljava/util/TimeZone;

    .line 117
    iput-boolean v3, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTimeZone:Z

    iput-boolean v3, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTime:Z

    iput-boolean v3, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasDate:Z

    .line 118
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;Ljava/util/TimeZone;)V
    .locals 4
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "timeZone"    # Ljava/util/TimeZone;

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->year:I

    .line 55
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->month:I

    .line 57
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->day:I

    .line 59
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hour:I

    .line 61
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->minute:I

    .line 63
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->second:I

    .line 65
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->timeZone:Ljava/util/TimeZone;

    .line 71
    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasDate:Z

    .line 73
    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTime:Z

    .line 75
    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTimeZone:Z

    .line 130
    new-instance v0, Ljava/util/GregorianCalendar;

    invoke-direct {v0, p2}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    .line 131
    .local v0, "calendar":Ljava/util/GregorianCalendar;
    invoke-virtual {v0, p1}, Ljava/util/GregorianCalendar;->setTime(Ljava/util/Date;)V

    .line 133
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v2

    iput v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->year:I

    .line 134
    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v2

    add-int/2addr v2, v1

    iput v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->month:I

    .line 135
    const/4 v2, 0x5

    invoke-virtual {v0, v2}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v2

    iput v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->day:I

    .line 136
    const/16 v2, 0xb

    invoke-virtual {v0, v2}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v2

    iput v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hour:I

    .line 137
    const/16 v2, 0xc

    invoke-virtual {v0, v2}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v2

    iput v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->minute:I

    .line 138
    const/16 v2, 0xd

    invoke-virtual {v0, v2}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v2

    iput v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->second:I

    .line 139
    const/16 v2, 0xe

    invoke-virtual {v0, v2}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v2

    const v3, 0xf4240

    mul-int/2addr v2, v3

    iput v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->nanoSeconds:I

    .line 140
    iput-object p2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->timeZone:Ljava/util/TimeZone;

    .line 143
    iput-boolean v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTimeZone:Z

    iput-boolean v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTime:Z

    iput-boolean v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasDate:Z

    .line 144
    return-void
.end method


# virtual methods
.method public compareTo(Ljava/lang/Object;)I
    .locals 4
    .param p1, "dt"    # Ljava/lang/Object;

    .line 321
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->getCalendar()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    move-object v2, p1

    check-cast v2, Lcom/itextpdf/kernel/xmp/XMPDateTime;

    .line 322
    invoke-interface {v2}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getCalendar()Ljava/util/Calendar;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    sub-long/2addr v0, v2

    .line 323
    .local v0, "d":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 325
    long-to-float v2, v0

    invoke-static {v2}, Ljava/lang/Math;->signum(F)F

    move-result v2

    float-to-int v2, v2

    return v2

    .line 330
    :cond_0
    iget v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->nanoSeconds:I

    move-object v3, p1

    check-cast v3, Lcom/itextpdf/kernel/xmp/XMPDateTime;

    invoke-interface {v3}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getNanoSecond()I

    move-result v3

    sub-int/2addr v2, v3

    int-to-long v0, v2

    .line 331
    long-to-float v2, v0

    invoke-static {v2}, Ljava/lang/Math;->signum(F)F

    move-result v2

    float-to-int v2, v2

    return v2
.end method

.method public getCalendar()Ljava/util/Calendar;
    .locals 4

    .line 388
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v0}, Ljava/util/Calendar;->getInstance(Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v0

    check-cast v0, Ljava/util/GregorianCalendar;

    .line 389
    .local v0, "calendar":Ljava/util/GregorianCalendar;
    new-instance v1, Ljava/util/Date;

    const-wide/high16 v2, -0x8000000000000000L

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/util/GregorianCalendar;->setGregorianChange(Ljava/util/Date;)V

    .line 390
    iget-boolean v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTimeZone:Z

    if-eqz v1, :cond_0

    .line 392
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->timeZone:Ljava/util/TimeZone;

    invoke-virtual {v0, v1}, Ljava/util/GregorianCalendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 394
    :cond_0
    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->year:I

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Ljava/util/GregorianCalendar;->set(II)V

    .line 395
    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->month:I

    sub-int/2addr v1, v2

    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Ljava/util/GregorianCalendar;->set(II)V

    .line 396
    const/4 v1, 0x5

    iget v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->day:I

    invoke-virtual {v0, v1, v2}, Ljava/util/GregorianCalendar;->set(II)V

    .line 397
    const/16 v1, 0xb

    iget v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hour:I

    invoke-virtual {v0, v1, v2}, Ljava/util/GregorianCalendar;->set(II)V

    .line 398
    const/16 v1, 0xc

    iget v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->minute:I

    invoke-virtual {v0, v1, v2}, Ljava/util/GregorianCalendar;->set(II)V

    .line 399
    const/16 v1, 0xd

    iget v2, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->second:I

    invoke-virtual {v0, v1, v2}, Ljava/util/GregorianCalendar;->set(II)V

    .line 400
    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->nanoSeconds:I

    const v2, 0xf4240

    div-int/2addr v1, v2

    const/16 v2, 0xe

    invoke-virtual {v0, v2, v1}, Ljava/util/GregorianCalendar;->set(II)V

    .line 402
    return-object v0
.end method

.method public getDay()I
    .locals 1

    .line 214
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->day:I

    return v0
.end method

.method public getHour()I
    .locals 1

    .line 245
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hour:I

    return v0
.end method

.method public getISO8601String()Ljava/lang/String;
    .locals 1

    .line 411
    invoke-static {p0}, Lcom/itextpdf/kernel/xmp/impl/ISO8601Converter;->render(Lcom/itextpdf/kernel/xmp/XMPDateTime;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMinute()I
    .locals 1

    .line 264
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->minute:I

    return v0
.end method

.method public getMonth()I
    .locals 1

    .line 183
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->month:I

    return v0
.end method

.method public getNanoSecond()I
    .locals 1

    .line 302
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->nanoSeconds:I

    return v0
.end method

.method public getSecond()I
    .locals 1

    .line 283
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->second:I

    return v0
.end method

.method public getTimeZone()Ljava/util/TimeZone;
    .locals 1

    .line 341
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->timeZone:Ljava/util/TimeZone;

    return-object v0
.end method

.method public getYear()I
    .locals 1

    .line 164
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->year:I

    return v0
.end method

.method public hasDate()Z
    .locals 1

    .line 361
    iget-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasDate:Z

    return v0
.end method

.method public hasTime()Z
    .locals 1

    .line 370
    iget-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTime:Z

    return v0
.end method

.method public hasTimeZone()Z
    .locals 1

    .line 379
    iget-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTimeZone:Z

    return v0
.end method

.method public setDay(I)V
    .locals 2
    .param p1, "day"    # I

    .line 223
    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    .line 225
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->day:I

    goto :goto_0

    .line 227
    :cond_0
    const/16 v1, 0x1f

    if-le p1, v1, :cond_1

    .line 229
    iput v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->day:I

    goto :goto_0

    .line 233
    :cond_1
    iput p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->day:I

    .line 236
    :goto_0
    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasDate:Z

    .line 237
    return-void
.end method

.method public setHour(I)V
    .locals 2
    .param p1, "hour"    # I

    .line 254
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    const/16 v1, 0x17

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hour:I

    .line 255
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTime:Z

    .line 256
    return-void
.end method

.method public setMinute(I)V
    .locals 2
    .param p1, "minute"    # I

    .line 273
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    const/16 v1, 0x3b

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->minute:I

    .line 274
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTime:Z

    .line 275
    return-void
.end method

.method public setMonth(I)V
    .locals 2
    .param p1, "month"    # I

    .line 192
    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    .line 194
    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->month:I

    goto :goto_0

    .line 196
    :cond_0
    const/16 v1, 0xc

    if-le p1, v1, :cond_1

    .line 198
    iput v1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->month:I

    goto :goto_0

    .line 202
    :cond_1
    iput p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->month:I

    .line 205
    :goto_0
    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasDate:Z

    .line 206
    return-void
.end method

.method public setNanoSecond(I)V
    .locals 1
    .param p1, "nanoSecond"    # I

    .line 311
    iput p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->nanoSeconds:I

    .line 312
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTime:Z

    .line 313
    return-void
.end method

.method public setSecond(I)V
    .locals 2
    .param p1, "second"    # I

    .line 292
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    const/16 v1, 0x3b

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->second:I

    .line 293
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTime:Z

    .line 294
    return-void
.end method

.method public setTimeZone(Ljava/util/TimeZone;)V
    .locals 1
    .param p1, "timeZone"    # Ljava/util/TimeZone;

    .line 350
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->timeZone:Ljava/util/TimeZone;

    .line 351
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTime:Z

    .line 352
    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasTimeZone:Z

    .line 353
    return-void
.end method

.method public setYear(I)V
    .locals 2
    .param p1, "year"    # I

    .line 173
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    const/16 v1, 0x270f

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->year:I

    .line 174
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->hasDate:Z

    .line 175
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 420
    invoke-virtual {p0}, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;->getISO8601String()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
