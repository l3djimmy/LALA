.class public interface abstract Lcom/itextpdf/kernel/utils/PageRange$IPageRangePart;
.super Ljava/lang/Object;
.source "PageRange.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/utils/PageRange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IPageRangePart"
.end annotation


# virtual methods
.method public abstract getAllPagesInRange(I)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end method

.method public abstract isPageInRange(I)Z
.end method
