.class final Lcom/itextpdf/commons/actions/ProductEventHandler;
.super Lcom/itextpdf/commons/actions/AbstractContextBasedEventHandler;
.source "ProductEventHandler.java"


# static fields
.field static final INSTANCE:Lcom/itextpdf/commons/actions/ProductEventHandler;

.field private static final LOGGER:Lorg/slf4j/Logger;

.field private static final MAX_EVENT_RETRY_COUNT:I = 0x4


# instance fields
.field private final events:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Lcom/itextpdf/commons/actions/sequence/SequenceId;",
            "Ljava/util/List<",
            "Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;",
            ">;>;"
        }
    .end annotation
.end field

.field private final processors:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 49
    new-instance v0, Lcom/itextpdf/commons/actions/ProductEventHandler;

    invoke-direct {v0}, Lcom/itextpdf/commons/actions/ProductEventHandler;-><init>()V

    sput-object v0, Lcom/itextpdf/commons/actions/ProductEventHandler;->INSTANCE:Lcom/itextpdf/commons/actions/ProductEventHandler;

    .line 51
    const-class v0, Lcom/itextpdf/commons/actions/ProductEventHandler;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/commons/actions/ProductEventHandler;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 60
    sget-object v0, Lcom/itextpdf/commons/actions/contexts/UnknownContext;->PERMISSIVE:Lcom/itextpdf/commons/actions/contexts/IContext;

    invoke-direct {p0, v0}, Lcom/itextpdf/commons/actions/AbstractContextBasedEventHandler;-><init>(Lcom/itextpdf/commons/actions/contexts/IContext;)V

    .line 56
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/commons/actions/ProductEventHandler;->processors:Ljava/util/concurrent/ConcurrentHashMap;

    .line 57
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/commons/actions/ProductEventHandler;->events:Ljava/util/WeakHashMap;

    .line 61
    return-void
.end method

.method private tryProcessEvent(Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;)V
    .locals 6
    .param p1, "event"    # Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;

    .line 139
    instance-of v0, p1, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    if-nez v0, :cond_0

    .line 140
    return-void

    .line 142
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    .line 143
    .local v0, "productEvent":Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;
    invoke-virtual {v0}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->getProductName()Ljava/lang/String;

    move-result-object v1

    .line 144
    .local v1, "productName":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/itextpdf/commons/actions/ProductEventHandler;->getActiveProcessor(Ljava/lang/String;)Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;

    move-result-object v2

    .line 145
    .local v2, "productEventProcessor":Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;
    if-eqz v2, :cond_3

    .line 150
    invoke-interface {v2, v0}, Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;->onEvent(Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;)V

    .line 152
    invoke-virtual {v0}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->getSequenceId()Lcom/itextpdf/commons/actions/sequence/SequenceId;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 153
    instance-of v3, v0, Lcom/itextpdf/commons/actions/confirmations/ConfirmEvent;

    if-eqz v3, :cond_1

    .line 154
    move-object v3, v0

    check-cast v3, Lcom/itextpdf/commons/actions/confirmations/ConfirmEvent;

    invoke-direct {p0, v3, v2}, Lcom/itextpdf/commons/actions/ProductEventHandler;->wrapConfirmedEvent(Lcom/itextpdf/commons/actions/confirmations/ConfirmEvent;Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;)V

    goto :goto_0

    .line 156
    :cond_1
    invoke-virtual {v0}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->getSequenceId()Lcom/itextpdf/commons/actions/sequence/SequenceId;

    move-result-object v3

    invoke-virtual {p0, v3, v0}, Lcom/itextpdf/commons/actions/ProductEventHandler;->addEvent(Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;)V

    .line 159
    :cond_2
    :goto_0
    return-void

    .line 146
    :cond_3
    new-instance v3, Lcom/itextpdf/commons/exceptions/UnknownProductException;

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v4

    .line 147
    const-string v5, "Product {0} is unknown. Probably you have to register it."

    invoke-static {v5, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/itextpdf/commons/exceptions/UnknownProductException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private wrapConfirmedEvent(Lcom/itextpdf/commons/actions/confirmations/ConfirmEvent;Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;)V
    .locals 8
    .param p1, "event"    # Lcom/itextpdf/commons/actions/confirmations/ConfirmEvent;
    .param p2, "productEventProcessor"    # Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;

    .line 162
    iget-object v0, p0, Lcom/itextpdf/commons/actions/ProductEventHandler;->events:Ljava/util/WeakHashMap;

    monitor-enter v0

    .line 163
    :try_start_0
    iget-object v1, p0, Lcom/itextpdf/commons/actions/ProductEventHandler;->events:Ljava/util/WeakHashMap;

    invoke-virtual {p1}, Lcom/itextpdf/commons/actions/confirmations/ConfirmEvent;->getSequenceId()Lcom/itextpdf/commons/actions/sequence/SequenceId;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 165
    .local v1, "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;>;"
    invoke-virtual {p1}, Lcom/itextpdf/commons/actions/confirmations/ConfirmEvent;->getConfirmedEvent()Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    move-result-object v2

    .line 166
    .local v2, "confirmedEvent":Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;
    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v3

    .line 167
    .local v3, "indexOfReportedEvent":I
    if-ltz v3, :cond_0

    .line 168
    new-instance v4, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;

    .line 169
    invoke-interface {p2}, Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;->getUsageType()Ljava/lang/String;

    move-result-object v5

    .line 170
    invoke-interface {p2}, Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;->getProducer()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v2, v5, v6}, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;-><init>(Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    invoke-interface {v1, v3, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 172
    :cond_0
    sget-object v4, Lcom/itextpdf/commons/actions/ProductEventHandler;->LOGGER:Lorg/slf4j/Logger;

    const-string v5, "Event for the product {0} with type {1} attempted to be confirmed but it had not been reported yet. Probably appropriate process fail"

    .line 173
    invoke-virtual {v2}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->getProductName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->getEventType()Ljava/lang/String;

    move-result-object v7

    filled-new-array {v6, v7}, [Ljava/lang/Object;

    move-result-object v6

    .line 172
    invoke-static {v5, v6}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 175
    .end local v1    # "eventsList":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;>;"
    .end local v2    # "confirmedEvent":Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;
    .end local v3    # "indexOfReportedEvent":I
    :goto_0
    monitor-exit v0

    .line 176
    return-void

    .line 175
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method addEvent(Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;)V
    .locals 3
    .param p1, "id"    # Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .param p2, "event"    # Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    .line 126
    iget-object v0, p0, Lcom/itextpdf/commons/actions/ProductEventHandler;->events:Ljava/util/WeakHashMap;

    monitor-enter v0

    .line 127
    :try_start_0
    iget-object v1, p0, Lcom/itextpdf/commons/actions/ProductEventHandler;->events:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 129
    .local v1, "listOfEvents":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;>;"
    if-nez v1, :cond_0

    .line 130
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    move-object v1, v2

    .line 131
    iget-object v2, p0, Lcom/itextpdf/commons/actions/ProductEventHandler;->events:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p1, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    :cond_0
    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    nop

    .end local v1    # "listOfEvents":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;>;"
    monitor-exit v0

    .line 136
    return-void

    .line 135
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method addProcessor(Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;)Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;
    .locals 2
    .param p1, "processor"    # Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;

    .line 84
    iget-object v0, p0, Lcom/itextpdf/commons/actions/ProductEventHandler;->processors:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-interface {p1}, Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;->getProductName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;

    return-object v0
.end method

.method clearProcessors()V
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/itextpdf/commons/actions/ProductEventHandler;->processors:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 113
    return-void
.end method

.method getActiveProcessor(Ljava/lang/String;)Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;
    .locals 2
    .param p1, "productName"    # Ljava/lang/String;

    .line 92
    iget-object v0, p0, Lcom/itextpdf/commons/actions/ProductEventHandler;->processors:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;

    .line 94
    .local v0, "processor":Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;
    if-eqz v0, :cond_0

    .line 95
    return-object v0

    .line 98
    :cond_0
    sget-object v1, Lcom/itextpdf/commons/actions/ProductNameConstant;->PRODUCT_NAMES:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 99
    invoke-static {}, Lcom/itextpdf/commons/actions/ProductProcessorFactoryKeeper;->getProductProcessorFactory()Lcom/itextpdf/commons/actions/processors/IProductProcessorFactory;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/itextpdf/commons/actions/processors/IProductProcessorFactory;->createProcessor(Ljava/lang/String;)Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;

    move-result-object v0

    .line 100
    iget-object v1, p0, Lcom/itextpdf/commons/actions/ProductEventHandler;->processors:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    return-object v0

    .line 103
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method

.method getEvents(Lcom/itextpdf/commons/actions/sequence/SequenceId;)Ljava/util/List;
    .locals 3
    .param p1, "id"    # Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/commons/actions/sequence/SequenceId;",
            ")",
            "Ljava/util/List<",
            "Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;",
            ">;"
        }
    .end annotation

    .line 116
    iget-object v0, p0, Lcom/itextpdf/commons/actions/ProductEventHandler;->events:Ljava/util/WeakHashMap;

    monitor-enter v0

    .line 117
    :try_start_0
    iget-object v1, p0, Lcom/itextpdf/commons/actions/ProductEventHandler;->events:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 118
    .local v1, "listOfEvents":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;>;"
    if-nez v1, :cond_0

    .line 119
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    monitor-exit v0

    return-object v2

    .line 121
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    monitor-exit v0

    return-object v2

    .line 122
    .end local v1    # "listOfEvents":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;>;"
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method getProcessors()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;",
            ">;"
        }
    .end annotation

    .line 108
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p0, Lcom/itextpdf/commons/actions/ProductEventHandler;->processors:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method protected onAcceptedEvent(Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;)V
    .locals 2
    .param p1, "event"    # Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;

    .line 70
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/4 v1, 0x4

    if-ge v0, v1, :cond_0

    .line 72
    :try_start_0
    invoke-direct {p0, p1}, Lcom/itextpdf/commons/actions/ProductEventHandler;->tryProcessEvent(Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;)V
    :try_end_0
    .catch Lcom/itextpdf/commons/exceptions/ProductEventHandlerRepeatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    return-void

    .line 75
    :catch_0
    move-exception v1

    .line 70
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 80
    .end local v0    # "i":I
    :cond_0
    invoke-direct {p0, p1}, Lcom/itextpdf/commons/actions/ProductEventHandler;->tryProcessEvent(Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;)V

    .line 81
    return-void
.end method

.method removeProcessor(Ljava/lang/String;)Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;
    .locals 1
    .param p1, "productName"    # Ljava/lang/String;

    .line 88
    iget-object v0, p0, Lcom/itextpdf/commons/actions/ProductEventHandler;->processors:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;

    return-object v0
.end method
