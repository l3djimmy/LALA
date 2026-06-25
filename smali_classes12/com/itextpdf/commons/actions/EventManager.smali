.class public final Lcom/itextpdf/commons/actions/EventManager;
.super Ljava/lang/Object;
.source "EventManager.java"


# static fields
.field private static final INSTANCE:Lcom/itextpdf/commons/actions/EventManager;


# instance fields
.field private final handlers:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/itextpdf/commons/actions/IEventHandler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 38
    new-instance v0, Lcom/itextpdf/commons/actions/EventManager;

    invoke-direct {v0}, Lcom/itextpdf/commons/actions/EventManager;-><init>()V

    sput-object v0, Lcom/itextpdf/commons/actions/EventManager;->INSTANCE:Lcom/itextpdf/commons/actions/EventManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/commons/actions/EventManager;->handlers:Ljava/util/Set;

    .line 43
    iget-object v0, p0, Lcom/itextpdf/commons/actions/EventManager;->handlers:Ljava/util/Set;

    sget-object v1, Lcom/itextpdf/commons/actions/ProductEventHandler;->INSTANCE:Lcom/itextpdf/commons/actions/ProductEventHandler;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 44
    return-void
.end method

.method public static acknowledgeAgplUsageDisableWarningMessage()V
    .locals 1

    .line 62
    new-instance v0, Lcom/itextpdf/commons/actions/processors/UnderAgplProductProcessorFactory;

    invoke-direct {v0}, Lcom/itextpdf/commons/actions/processors/UnderAgplProductProcessorFactory;-><init>()V

    invoke-static {v0}, Lcom/itextpdf/commons/actions/ProductProcessorFactoryKeeper;->setProductProcessorFactory(Lcom/itextpdf/commons/actions/processors/IProductProcessorFactory;)V

    .line 63
    return-void
.end method

.method public static getInstance()Lcom/itextpdf/commons/actions/EventManager;
    .locals 1

    .line 52
    sget-object v0, Lcom/itextpdf/commons/actions/EventManager;->INSTANCE:Lcom/itextpdf/commons/actions/EventManager;

    return-object v0
.end method


# virtual methods
.method public isRegistered(Lcom/itextpdf/commons/actions/IEventHandler;)Z
    .locals 1
    .param p1, "handler"    # Lcom/itextpdf/commons/actions/IEventHandler;

    .line 114
    if-eqz p1, :cond_0

    .line 115
    iget-object v0, p0, Lcom/itextpdf/commons/actions/EventManager;->handlers:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 117
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onEvent(Lcom/itextpdf/commons/actions/IEvent;)V
    .locals 4
    .param p1, "event"    # Lcom/itextpdf/commons/actions/IEvent;

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 72
    .local v0, "caughtExceptions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/RuntimeException;>;"
    iget-object v1, p0, Lcom/itextpdf/commons/actions/EventManager;->handlers:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/commons/actions/IEventHandler;

    .line 74
    .local v2, "handler":Lcom/itextpdf/commons/actions/IEventHandler;
    :try_start_0
    invoke-interface {v2, p1}, Lcom/itextpdf/commons/actions/IEventHandler;->onEvent(Lcom/itextpdf/commons/actions/IEvent;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    goto :goto_1

    .line 75
    :catch_0
    move-exception v3

    .line 76
    .local v3, "ex":Ljava/lang/RuntimeException;
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    .end local v2    # "handler":Lcom/itextpdf/commons/actions/IEventHandler;
    .end local v3    # "ex":Ljava/lang/RuntimeException;
    :goto_1
    goto :goto_0

    .line 79
    :cond_0
    instance-of v1, p1, Lcom/itextpdf/commons/actions/AbstractITextConfigurationEvent;

    if-eqz v1, :cond_1

    .line 81
    :try_start_1
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/commons/actions/AbstractITextConfigurationEvent;

    .line 82
    .local v1, "itce":Lcom/itextpdf/commons/actions/AbstractITextConfigurationEvent;
    invoke-virtual {v1}, Lcom/itextpdf/commons/actions/AbstractITextConfigurationEvent;->doAction()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 85
    .end local v1    # "itce":Lcom/itextpdf/commons/actions/AbstractITextConfigurationEvent;
    goto :goto_2

    .line 83
    :catch_1
    move-exception v1

    .line 84
    .local v1, "ex":Ljava/lang/RuntimeException;
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    .end local v1    # "ex":Ljava/lang/RuntimeException;
    :cond_1
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_3

    .line 91
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 94
    return-void

    .line 92
    :cond_2
    new-instance v1, Lcom/itextpdf/commons/exceptions/AggregatedException;

    const-string v2, "Error during event processing"

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/commons/exceptions/AggregatedException;-><init>(Ljava/lang/String;Ljava/util/List;)V

    throw v1

    .line 89
    :cond_3
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/RuntimeException;

    throw v1
.end method

.method public register(Lcom/itextpdf/commons/actions/IEventHandler;)V
    .locals 1
    .param p1, "handler"    # Lcom/itextpdf/commons/actions/IEventHandler;

    .line 102
    if-eqz p1, :cond_0

    .line 103
    iget-object v0, p0, Lcom/itextpdf/commons/actions/EventManager;->handlers:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 105
    :cond_0
    return-void
.end method

.method public unregister(Lcom/itextpdf/commons/actions/IEventHandler;)Z
    .locals 1
    .param p1, "handler"    # Lcom/itextpdf/commons/actions/IEventHandler;

    .line 128
    if-eqz p1, :cond_0

    .line 129
    iget-object v0, p0, Lcom/itextpdf/commons/actions/EventManager;->handlers:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 131
    :cond_0
    const/4 v0, 0x0

    return v0
.end method
