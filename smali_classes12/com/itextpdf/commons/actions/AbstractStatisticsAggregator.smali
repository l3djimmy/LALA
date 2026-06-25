.class public abstract Lcom/itextpdf/commons/actions/AbstractStatisticsAggregator;
.super Ljava/lang/Object;
.source "AbstractStatisticsAggregator.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract aggregate(Lcom/itextpdf/commons/actions/AbstractStatisticsEvent;)V
.end method

.method public abstract merge(Lcom/itextpdf/commons/actions/AbstractStatisticsAggregator;)V
.end method

.method public abstract retrieveAggregation()Ljava/lang/Object;
.end method
