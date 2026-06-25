.class public final Lcom/itextpdf/commons/utils/DateTimeUtil;
.super Ljava/lang/Object;
.source "DateTimeUtil.java"


# static fields
.field private static final DEFAULT_PATTERN:Ljava/lang/String; = "yyyy-MM-dd"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    return-void
.end method

.method public static addDaysToCalendar(Ljava/util/Calendar;I)Ljava/util/Calendar;
    .locals 1
    .param p0, "calendar"    # Ljava/util/Calendar;
    .param p1, "days"    # I

    .line 100
    const/4 v0, 0x6

    invoke-virtual {p0, v0, p1}, Ljava/util/Calendar;->add(II)V

    .line 101
    return-object p0
.end method

.method public static addDaysToDate(Ljava/util/Date;I)Ljava/util/Date;
    .locals 2
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "days"    # I

    .line 150
    new-instance v0, Ljava/util/GregorianCalendar;

    invoke-direct {v0}, Ljava/util/GregorianCalendar;-><init>()V

    .line 151
    .local v0, "cal":Ljava/util/Calendar;
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 152
    const/4 v1, 0x6

    invoke-virtual {v0, v1, p1}, Ljava/util/Calendar;->add(II)V

    .line 153
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    return-object v1
.end method

.method public static addMillisToDate(Ljava/util/Date;J)Ljava/util/Date;
    .locals 3
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "millis"    # J

    .line 137
    new-instance v0, Ljava/util/Date;

    invoke-static {p0}, Lcom/itextpdf/commons/utils/DateTimeUtil;->getRelativeTime(Ljava/util/Date;)J

    move-result-wide v1

    add-long/2addr v1, p1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public static addYearsToDate(Ljava/util/Date;I)Ljava/util/Date;
    .locals 2
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "years"    # I

    .line 166
    new-instance v0, Ljava/util/GregorianCalendar;

    invoke-direct {v0}, Ljava/util/GregorianCalendar;-><init>()V

    .line 167
    .local v0, "cal":Ljava/util/Calendar;
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 168
    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Ljava/util/Calendar;->add(II)V

    .line 169
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    return-object v1
.end method

.method public static dateToString(Ljava/util/Calendar;)Ljava/lang/String;
    .locals 2
    .param p0, "date"    # Ljava/util/Calendar;

    .line 243
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyy.MM.dd HH:mm:ss z"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static format(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "pattern"    # Ljava/lang/String;

    .line 219
    invoke-static {p1}, Lcom/itextpdf/commons/utils/DateTimeUtil;->initParserSDF(Ljava/lang/String;)Ljava/text/DateFormat;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatWithDefaultPattern(Ljava/util/Date;)Ljava/lang/String;
    .locals 1
    .param p0, "date"    # Ljava/util/Date;

    .line 207
    const-string/jumbo v0, "yyyy-MM-dd"

    invoke-static {p0, v0}, Lcom/itextpdf/commons/utils/DateTimeUtil;->format(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCalendar(Ljava/util/Date;)Ljava/util/Calendar;
    .locals 1
    .param p0, "date"    # Ljava/util/Date;

    .line 66
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 67
    .local v0, "calendar":Ljava/util/Calendar;
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 68
    return-object v0
.end method

.method public static getCurrentTimeCalendar()Ljava/util/Calendar;
    .locals 1

    .line 78
    new-instance v0, Ljava/util/GregorianCalendar;

    invoke-direct {v0}, Ljava/util/GregorianCalendar;-><init>()V

    return-object v0
.end method

.method public static getCurrentTimeDate()Ljava/util/Date;
    .locals 1

    .line 88
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    return-object v0
.end method

.method public static getCurrentTimeZoneOffset(Ljava/util/Date;)J
    .locals 3
    .param p0, "date"    # Ljava/util/Date;

    .line 231
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    .line 232
    .local v0, "tz":Ljava/util/TimeZone;
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v1

    int-to-long v1, v1

    return-wide v1
.end method

.method public static getRelativeTime(Ljava/util/Date;)J
    .locals 2
    .param p0, "date"    # Ljava/util/Date;

    .line 125
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    return-wide v0
.end method

.method public static getUtcMillisFromEpoch(Ljava/util/Calendar;)D
    .locals 2
    .param p0, "calendar"    # Ljava/util/Calendar;

    .line 52
    if-nez p0, :cond_0

    .line 53
    new-instance v0, Ljava/util/GregorianCalendar;

    invoke-direct {v0}, Ljava/util/GregorianCalendar;-><init>()V

    move-object p0, v0

    .line 55
    :cond_0
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    long-to-double v0, v0

    return-wide v0
.end method

.method private static initParserSDF(Ljava/lang/String;)Ljava/text/DateFormat;
    .locals 2
    .param p0, "pattern"    # Ljava/lang/String;

    .line 247
    new-instance v0, Ljava/text/SimpleDateFormat;

    invoke-direct {v0, p0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 248
    .local v0, "parserSDF":Ljava/text/SimpleDateFormat;
    new-instance v1, Ljava/util/GregorianCalendar;

    invoke-direct {v1}, Ljava/util/GregorianCalendar;-><init>()V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setCalendar(Ljava/util/Calendar;)V

    .line 249
    return-object v0
.end method

.method public static isInPast(Ljava/util/Date;)Z
    .locals 1
    .param p0, "date"    # Ljava/util/Date;

    .line 112
    invoke-static {}, Lcom/itextpdf/commons/utils/DateTimeUtil;->getCurrentTimeDate()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v0

    return v0
.end method

.method public static parse(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Date;
    .locals 2
    .param p0, "date"    # Ljava/lang/String;
    .param p1, "format"    # Ljava/lang/String;

    .line 193
    :try_start_0
    invoke-static {p1}, Lcom/itextpdf/commons/utils/DateTimeUtil;->initParserSDF(Ljava/lang/String;)Ljava/text/DateFormat;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 194
    :catch_0
    move-exception v0

    .line 195
    .local v0, "e":Ljava/text/ParseException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static parseWithDefaultPattern(Ljava/lang/String;)Ljava/util/Date;
    .locals 1
    .param p0, "date"    # Ljava/lang/String;

    .line 180
    const-string/jumbo v0, "yyyy-MM-dd"

    invoke-static {p0, v0}, Lcom/itextpdf/commons/utils/DateTimeUtil;->parse(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method
