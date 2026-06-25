.class public Lcom/itextpdf/kernel/pdf/canvas/parser/listener/FilteredEventListener;
.super Ljava/lang/Object;
.source "FilteredEventListener.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;


# instance fields
.field protected final delegates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;",
            ">;"
        }
    .end annotation
.end field

.field protected final filters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/filter/IEventFilter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/FilteredEventListener;->delegates:Ljava/util/List;

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/FilteredEventListener;->filters:Ljava/util/List;

    .line 47
    return-void
.end method

.method public varargs constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;[Lcom/itextpdf/kernel/pdf/canvas/parser/filter/IEventFilter;)V
    .locals 0
    .param p1, "delegate"    # Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;
    .param p2, "filterSet"    # [Lcom/itextpdf/kernel/pdf/canvas/parser/filter/IEventFilter;

    .line 57
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/FilteredEventListener;-><init>()V

    .line 58
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/FilteredEventListener;->attachEventListener(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;[Lcom/itextpdf/kernel/pdf/canvas/parser/filter/IEventFilter;)Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;

    .line 59
    return-void
.end method


# virtual methods
.method public varargs attachEventListener(Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;[Lcom/itextpdf/kernel/pdf/canvas/parser/filter/IEventFilter;)Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;
    .locals 1
    .param p2, "filterSet"    # [Lcom/itextpdf/kernel/pdf/canvas/parser/filter/IEventFilter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;",
            ">(TT;[",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/filter/IEventFilter;",
            ")TT;"
        }
    .end annotation

    .line 75
    .local p1, "delegate":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;, "TT;"
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/FilteredEventListener;->delegates:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/FilteredEventListener;->filters:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    return-object p1
.end method

.method public eventOccurred(Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;)V
    .locals 8
    .param p1, "data"    # Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;
    .param p2, "type"    # Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;

    .line 83
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/FilteredEventListener;->delegates:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_5

    .line 84
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/FilteredEventListener;->delegates:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;

    .line 85
    .local v1, "delegate":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;
    invoke-interface {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;->getSupportedEvents()Ljava/util/Set;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    invoke-interface {v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;->getSupportedEvents()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    :cond_0
    move v2, v3

    goto :goto_2

    :cond_1
    :goto_1
    const/4 v2, 0x1

    .line 86
    .local v2, "filtersPassed":Z
    :goto_2
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/FilteredEventListener;->filters:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/itextpdf/kernel/pdf/canvas/parser/filter/IEventFilter;

    array-length v5, v4

    :goto_3
    if-ge v3, v5, :cond_3

    aget-object v6, v4, v3

    .line 87
    .local v6, "filter":Lcom/itextpdf/kernel/pdf/canvas/parser/filter/IEventFilter;
    invoke-interface {v6, p1, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/filter/IEventFilter;->accept(Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 88
    const/4 v2, 0x0

    .line 89
    goto :goto_4

    .line 86
    .end local v6    # "filter":Lcom/itextpdf/kernel/pdf/canvas/parser/filter/IEventFilter;
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 92
    :cond_3
    :goto_4
    if-eqz v2, :cond_4

    .line 93
    invoke-interface {v1, p1, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;->eventOccurred(Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;)V

    .line 83
    .end local v1    # "delegate":Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;
    .end local v2    # "filtersPassed":Z
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 96
    .end local v0    # "i":I
    :cond_5
    return-void
.end method

.method public getSupportedEvents()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;",
            ">;"
        }
    .end annotation

    .line 100
    const/4 v0, 0x0

    return-object v0
.end method
