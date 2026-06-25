.class public final Lcom/itextpdf/io/util/DecimalFormatUtil;
.super Ljava/lang/Object;
.source "DecimalFormatUtil.java"


# static fields
.field private static final dfs:Ljava/text/DecimalFormatSymbols;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 35
    new-instance v0, Ljava/text/DecimalFormatSymbols;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1}, Ljava/text/DecimalFormatSymbols;-><init>(Ljava/util/Locale;)V

    sput-object v0, Lcom/itextpdf/io/util/DecimalFormatUtil;->dfs:Ljava/text/DecimalFormatSymbols;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    return-void
.end method

.method public static formatNumber(DLjava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "d"    # D
    .param p2, "pattern"    # Ljava/lang/String;

    .line 41
    new-instance v0, Ljava/text/DecimalFormat;

    sget-object v1, Lcom/itextpdf/io/util/DecimalFormatUtil;->dfs:Ljava/text/DecimalFormatSymbols;

    invoke-direct {v0, p2, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;Ljava/text/DecimalFormatSymbols;)V

    .line 42
    .local v0, "dn":Ljava/text/DecimalFormat;
    invoke-virtual {v0, p0, p1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
