.class public Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsAggregator;
.super Lcom/itextpdf/commons/actions/AbstractStatisticsAggregator;
.source "NumberOfPagesStatisticsAggregator.java"


# static fields
.field private static final HUNDRED:I = 0x64

.field private static final NUMBERS_OF_PAGES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final ONE:I = 0x1

.field private static final SORTED_UPPER_BOUNDS_OF_PAGES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final STRING_FOR_HUNDRED_PAGES:Ljava/lang/String; = "11-100"

.field private static final STRING_FOR_INF:Ljava/lang/String; = "1001+"

.field private static final STRING_FOR_ONE_PAGE:Ljava/lang/String; = "1"

.field private static final STRING_FOR_TEN_PAGES:Ljava/lang/String; = "2-10"

.field private static final STRING_FOR_THOUSAND_PAGES:Ljava/lang/String; = "101-1000"

.field private static final TEN:I = 0xa

.field private static final THOUSAND:I = 0x3e8


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

    .line 55
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Integer;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v0, v3

    const/16 v3, 0xa

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v1

    const/16 v1, 0x64

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v4, 0x2

    aput-object v1, v0, v4

    const/16 v4, 0x3e8

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x3

    aput-object v4, v0, v5

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsAggregator;->SORTED_UPPER_BOUNDS_OF_PAGES:Ljava/util/List;

    .line 58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 59
    .local v0, "temp":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    const-string v5, "1"

    invoke-interface {v0, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    const-string v2, "2-10"

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    const-string v2, "11-100"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    const-string v1, "101-1000"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    sput-object v1, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsAggregator;->NUMBERS_OF_PAGES:Ljava/util/Map;

    .line 64
    .end local v0    # "temp":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 39
    invoke-direct {p0}, Lcom/itextpdf/commons/actions/AbstractStatisticsAggregator;-><init>()V

    .line 66
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsAggregator;->lock:Ljava/lang/Object;

    .line 68
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsAggregator;->numberOfDocuments:Ljava/util/Map;

    return-void
.end method

.method static synthetic lambda$merge$0(Ljava/lang/Long;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 4
    .param p0, "el1"    # Ljava/lang/Long;
    .param p1, "el2"    # Ljava/lang/Long;

    .line 119
    if-nez p1, :cond_0

    .line 120
    return-object p0

    .line 122
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
    .locals 8
    .param p1, "event"    # Lcom/itextpdf/commons/actions/AbstractStatisticsEvent;

    .line 77
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsEvent;

    if-nez v0, :cond_0

    .line 78
    return-void

    .line 80
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsEvent;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsEvent;->getNumberOfPages()I

    move-result v0

    .line 81
    .local v0, "numberOfPages":I
    const-string v1, "1001+"

    .line 82
    .local v1, "range":Ljava/lang/String;
    sget-object v2, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsAggregator;->SORTED_UPPER_BOUNDS_OF_PAGES:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 83
    .local v3, "upperBound":I
    if-gt v0, v3, :cond_1

    .line 84
    sget-object v2, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsAggregator;->NUMBERS_OF_PAGES:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v1, v2

    check-cast v1, Ljava/lang/String;

    .line 85
    goto :goto_1

    .line 87
    .end local v3    # "upperBound":I
    :cond_1
    goto :goto_0

    .line 88
    :cond_2
    :goto_1
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsAggregator;->lock:Ljava/lang/Object;

    monitor-enter v2

    .line 89
    :try_start_0
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsAggregator;->numberOfDocuments:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    .line 90
    .local v3, "documentsOfThisRange":Ljava/lang/Long;
    const-wide/16 v4, 0x1

    if-nez v3, :cond_3

    goto :goto_2

    :cond_3
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    add-long/2addr v4, v6

    :goto_2
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    .line 91
    .local v4, "currentValue":Ljava/lang/Long;
    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsAggregator;->numberOfDocuments:Ljava/util/Map;

    invoke-interface {v5, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    nop

    .end local v3    # "documentsOfThisRange":Ljava/lang/Long;
    .end local v4    # "currentValue":Ljava/lang/Long;
    monitor-exit v2

    .line 93
    return-void

    .line 92
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method public merge(Lcom/itextpdf/commons/actions/AbstractStatisticsAggregator;)V
    .locals 4
    .param p1, "aggregator"    # Lcom/itextpdf/commons/actions/AbstractStatisticsAggregator;

    .line 112
    instance-of v0, p1, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsAggregator;

    if-nez v0, :cond_0

    .line 113
    return-void

    .line 116
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsAggregator;

    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsAggregator;->numberOfDocuments:Ljava/util/Map;

    .line 117
    .local v0, "numberOfDocuments":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsAggregator;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 118
    :try_start_0
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsAggregator;->numberOfDocuments:Ljava/util/Map;

    new-instance v3, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsAggregator$$ExternalSyntheticLambda0;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsAggregator$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v2, v0, v3}, Lcom/itextpdf/commons/utils/MapUtil;->merge(Ljava/util/Map;Ljava/util/Map;Ljava/util/function/BiFunction;)V

    .line 125
    monitor-exit v1

    .line 126
    return-void

    .line 125
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public retrieveAggregation()Ljava/lang/Object;
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/statistics/NumberOfPagesStatisticsAggregator;->numberOfDocuments:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method
