.class public Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator;
.super Lcom/itextpdf/commons/actions/AbstractStatisticsAggregator;
.source "SizeOfPdfStatisticsAggregator.java"


# static fields
.field private static final DOCUMENT_SIZES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final MEASURE_COEFFICIENT:J = 0x400L

.field private static final SIZE_128KB:J = 0x20000L

.field private static final SIZE_128MB:J = 0x8000000L

.field private static final SIZE_16MB:J = 0x1000000L

.field private static final SIZE_1MB:J = 0x100000L

.field private static final SORTED_UPPER_BOUNDS_OF_SIZES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private static final STRING_FOR_128KB:Ljava/lang/String; = "<128kb"

.field private static final STRING_FOR_128MB:Ljava/lang/String; = "16mb-128mb"

.field private static final STRING_FOR_16MB:Ljava/lang/String; = "1mb-16mb"

.field private static final STRING_FOR_1MB:Ljava/lang/String; = "128kb-1mb"

.field private static final STRING_FOR_INF:Ljava/lang/String; = "128mb+"


# instance fields
.field private final lock:Ljava/lang/Object;

.field private final numberOfDocuments:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 57
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Long;

    .line 58
    const-wide/32 v1, 0x20000

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-wide/32 v2, 0x100000

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v0, v3

    const-wide/32 v3, 0x1000000

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v0, v4

    const-wide/32 v4, 0x8000000

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const/4 v5, 0x3

    aput-object v4, v0, v5

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator;->SORTED_UPPER_BOUNDS_OF_SIZES:Ljava/util/List;

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 62
    .local v0, "temp":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Ljava/lang/String;>;"
    const-string v5, "<128kb"

    invoke-interface {v0, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    const-string v1, "128kb-1mb"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    const-string v1, "1mb-16mb"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    const-string v1, "16mb-128mb"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    sput-object v1, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator;->DOCUMENT_SIZES:Ljava/util/Map;

    .line 67
    .end local v0    # "temp":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Ljava/lang/String;>;"
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 39
    invoke-direct {p0}, Lcom/itextpdf/commons/actions/AbstractStatisticsAggregator;-><init>()V

    .line 69
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator;->lock:Ljava/lang/Object;

    .line 71
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator;->numberOfDocuments:Ljava/util/Map;

    return-void
.end method

.method static synthetic lambda$merge$0(Ljava/lang/Long;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 4
    .param p0, "el1"    # Ljava/lang/Long;
    .param p1, "el2"    # Ljava/lang/Long;

    .line 122
    if-nez p1, :cond_0

    .line 123
    return-object p0

    .line 125
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    add-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public aggregate(Lcom/itextpdf/commons/actions/AbstractStatisticsEvent;)V
    .locals 9
    .param p1, "event"    # Lcom/itextpdf/commons/actions/AbstractStatisticsEvent;

    .line 80
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsEvent;

    if-nez v0, :cond_0

    .line 81
    return-void

    .line 83
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsEvent;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsEvent;->getAmountOfBytes()J

    move-result-wide v0

    .line 84
    .local v0, "sizeOfPdf":J
    const-string v2, "128mb+"

    .line 85
    .local v2, "range":Ljava/lang/String;
    sget-object v3, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator;->SORTED_UPPER_BOUNDS_OF_SIZES:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 86
    .local v4, "upperBound":J
    cmp-long v6, v0, v4

    if-gtz v6, :cond_1

    .line 87
    sget-object v3, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator;->DOCUMENT_SIZES:Ljava/util/Map;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v2, v3

    check-cast v2, Ljava/lang/String;

    .line 88
    goto :goto_1

    .line 90
    .end local v4    # "upperBound":J
    :cond_1
    goto :goto_0

    .line 91
    :cond_2
    :goto_1
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator;->lock:Ljava/lang/Object;

    monitor-enter v3

    .line 92
    :try_start_0
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator;->numberOfDocuments:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    .line 93
    .local v4, "documentsOfThisRange":Ljava/lang/Long;
    const-wide/16 v5, 0x1

    if-nez v4, :cond_3

    goto :goto_2

    :cond_3
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    add-long/2addr v5, v7

    :goto_2
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    .line 94
    .local v5, "currentValue":Ljava/lang/Long;
    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator;->numberOfDocuments:Ljava/util/Map;

    invoke-interface {v6, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    nop

    .end local v4    # "documentsOfThisRange":Ljava/lang/Long;
    .end local v5    # "currentValue":Ljava/lang/Long;
    monitor-exit v3

    .line 96
    return-void

    .line 95
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public merge(Lcom/itextpdf/commons/actions/AbstractStatisticsAggregator;)V
    .locals 4
    .param p1, "aggregator"    # Lcom/itextpdf/commons/actions/AbstractStatisticsAggregator;

    .line 115
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator;

    if-nez v0, :cond_0

    .line 116
    return-void

    .line 119
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator;

    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator;->numberOfDocuments:Ljava/util/Map;

    .line 120
    .local v0, "amountOfDocuments":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 121
    :try_start_0
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator;->numberOfDocuments:Ljava/util/Map;

    new-instance v3, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator$$ExternalSyntheticLambda0;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v2, v0, v3}, Lcom/itextpdf/commons/utils/MapUtil;->merge(Ljava/util/Map;Ljava/util/Map;Ljava/util/function/BiFunction;)V

    .line 128
    monitor-exit v1

    .line 129
    return-void

    .line 128
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public retrieveAggregation()Ljava/lang/Object;
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/statistics/SizeOfPdfStatisticsAggregator;->numberOfDocuments:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method
