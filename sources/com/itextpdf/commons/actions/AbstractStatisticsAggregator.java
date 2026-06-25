package com.itextpdf.commons.actions;
/* loaded from: classes12.dex */
public abstract class AbstractStatisticsAggregator {
    public abstract void aggregate(AbstractStatisticsEvent abstractStatisticsEvent);

    public abstract void merge(AbstractStatisticsAggregator abstractStatisticsAggregator);

    public abstract Object retrieveAggregation();
}
