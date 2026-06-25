.class public Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsEvent;
.super Lcom/itextpdf/commons/actions/AbstractStatisticsEvent;
.source "SizeOfPdfStatisticsEvent.java"


# static fields
.field private static final PDF_SIZE_STATISTICS:Ljava/lang/String; = "pdfSize"


# instance fields
.field private final amountOfBytes:J


# direct methods
.method public constructor <init>(JLcom/itextpdf/commons/actions/data/ProductData;)V
    .locals 2
    .param p1, "amountOfBytes"    # J
    .param p3, "productData"    # Lcom/itextpdf/commons/actions/data/ProductData;

    .line 49
    invoke-direct {p0, p3}, Lcom/itextpdf/commons/actions/AbstractStatisticsEvent;-><init>(Lcom/itextpdf/commons/actions/data/ProductData;)V

    .line 50
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 53
    iput-wide p1, p0, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsEvent;->amountOfBytes:J

    .line 54
    return-void

    .line 51
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Amount of bytes in the PDF document cannot be less than zero"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public createStatisticsAggregatorFromName(Ljava/lang/String;)Lcom/itextpdf/commons/actions/AbstractStatisticsAggregator;
    .locals 1
    .param p1, "statisticsName"    # Ljava/lang/String;

    .line 61
    const-string/jumbo v0, "pdfSize"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    new-instance v0, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator;-><init>()V

    return-object v0

    .line 64
    :cond_0
    invoke-super {p0, p1}, Lcom/itextpdf/commons/actions/AbstractStatisticsEvent;->createStatisticsAggregatorFromName(Ljava/lang/String;)Lcom/itextpdf/commons/actions/AbstractStatisticsAggregator;

    move-result-object v0

    return-object v0
.end method

.method public getAmountOfBytes()J
    .locals 2

    .line 81
    iget-wide v0, p0, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsEvent;->amountOfBytes:J

    return-wide v0
.end method

.method public getStatisticsNames()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 72
    const-string/jumbo v0, "pdfSize"

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
