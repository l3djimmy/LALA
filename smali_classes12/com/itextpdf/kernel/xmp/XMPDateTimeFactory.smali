.class public final Lcom/itextpdf/kernel/xmp/XMPDateTimeFactory;
.super Ljava/lang/Object;
.source "XMPDateTimeFactory.java"


# static fields
.field private static final UTC:Ljava/util/TimeZone;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 50
    const-string v0, "UTC"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/xmp/XMPDateTimeFactory;->UTC:Ljava/util/TimeZone;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    return-void
.end method

.method public static convertToLocalTime(Lcom/itextpdf/kernel/xmp/XMPDateTime;)Lcom/itextpdf/kernel/xmp/XMPDateTime;
    .locals 4
    .param p0, "dateTime"    # Lcom/itextpdf/kernel/xmp/XMPDateTime;

    .line 196
    invoke-interface {p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getCalendar()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    .line 198
    .local v0, "timeInMillis":J
    new-instance v2, Ljava/util/GregorianCalendar;

    invoke-direct {v2}, Ljava/util/GregorianCalendar;-><init>()V

    .line 199
    .local v2, "cal":Ljava/util/GregorianCalendar;
    invoke-virtual {v2, v0, v1}, Ljava/util/GregorianCalendar;->setTimeInMillis(J)V

    .line 200
    new-instance v3, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;

    invoke-direct {v3, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;-><init>(Ljava/util/Calendar;)V

    return-object v3
.end method

.method public static convertToUTCTime(Lcom/itextpdf/kernel/xmp/XMPDateTime;)Lcom/itextpdf/kernel/xmp/XMPDateTime;
    .locals 6
    .param p0, "dateTime"    # Lcom/itextpdf/kernel/xmp/XMPDateTime;

    .line 179
    invoke-interface {p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getCalendar()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    .line 180
    .local v0, "timeInMillis":J
    new-instance v2, Ljava/util/GregorianCalendar;

    sget-object v3, Lcom/itextpdf/kernel/xmp/XMPDateTimeFactory;->UTC:Ljava/util/TimeZone;

    invoke-direct {v2, v3}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    .line 181
    .local v2, "cal":Ljava/util/GregorianCalendar;
    new-instance v3, Ljava/util/Date;

    const-wide/high16 v4, -0x8000000000000000L

    invoke-direct {v3, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v2, v3}, Ljava/util/GregorianCalendar;->setGregorianChange(Ljava/util/Date;)V

    .line 182
    invoke-virtual {v2, v0, v1}, Ljava/util/GregorianCalendar;->setTimeInMillis(J)V

    .line 183
    new-instance v3, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;

    invoke-direct {v3, v2}, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;-><init>(Ljava/util/Calendar;)V

    return-object v3
.end method

.method public static create()Lcom/itextpdf/kernel/xmp/XMPDateTime;
    .locals 1

    .line 79
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;-><init>()V

    return-object v0
.end method

.method public static create(III)Lcom/itextpdf/kernel/xmp/XMPDateTime;
    .locals 1
    .param p0, "year"    # I
    .param p1, "month"    # I
    .param p2, "day"    # I

    .line 93
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;-><init>()V

    .line 94
    .local v0, "dt":Lcom/itextpdf/kernel/xmp/XMPDateTime;
    invoke-interface {v0, p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->setYear(I)V

    .line 95
    invoke-interface {v0, p1}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->setMonth(I)V

    .line 96
    invoke-interface {v0, p2}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->setDay(I)V

    .line 97
    return-object v0
.end method

.method public static create(IIIIIII)Lcom/itextpdf/kernel/xmp/XMPDateTime;
    .locals 1
    .param p0, "year"    # I
    .param p1, "month"    # I
    .param p2, "day"    # I
    .param p3, "hour"    # I
    .param p4, "minute"    # I
    .param p5, "second"    # I
    .param p6, "nanoSecond"    # I

    .line 116
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;

    invoke-direct {v0}, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;-><init>()V

    .line 117
    .local v0, "dt":Lcom/itextpdf/kernel/xmp/XMPDateTime;
    invoke-interface {v0, p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->setYear(I)V

    .line 118
    invoke-interface {v0, p1}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->setMonth(I)V

    .line 119
    invoke-interface {v0, p2}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->setDay(I)V

    .line 120
    invoke-interface {v0, p3}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->setHour(I)V

    .line 121
    invoke-interface {v0, p4}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->setMinute(I)V

    .line 122
    invoke-interface {v0, p5}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->setSecond(I)V

    .line 123
    invoke-interface {v0, p6}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->setNanoSecond(I)V

    .line 124
    return-object v0
.end method

.method public static createFromCalendar(Ljava/util/Calendar;)Lcom/itextpdf/kernel/xmp/XMPDateTime;
    .locals 1
    .param p0, "calendar"    # Ljava/util/Calendar;

    .line 69
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;-><init>(Ljava/util/Calendar;)V

    return-object v0
.end method

.method public static createFromISO8601(Ljava/lang/String;)Lcom/itextpdf/kernel/xmp/XMPDateTime;
    .locals 1
    .param p0, "strValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/kernel/xmp/XMPException;
        }
    .end annotation

    .line 137
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static getCurrentDateTime()Lcom/itextpdf/kernel/xmp/XMPDateTime;
    .locals 2

    .line 149
    new-instance v0, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;

    new-instance v1, Ljava/util/GregorianCalendar;

    invoke-direct {v1}, Ljava/util/GregorianCalendar;-><init>()V

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;-><init>(Ljava/util/Calendar;)V

    return-object v0
.end method

.method public static setLocalTimeZone(Lcom/itextpdf/kernel/xmp/XMPDateTime;)Lcom/itextpdf/kernel/xmp/XMPDateTime;
    .locals 2
    .param p0, "dateTime"    # Lcom/itextpdf/kernel/xmp/XMPDateTime;

    .line 162
    invoke-interface {p0}, Lcom/itextpdf/kernel/xmp/XMPDateTime;->getCalendar()Ljava/util/Calendar;

    move-result-object v0

    .line 163
    .local v0, "cal":Ljava/util/Calendar;
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 164
    new-instance v1, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/xmp/impl/XMPDateTimeImpl;-><init>(Ljava/util/Calendar;)V

    return-object v1
.end method
