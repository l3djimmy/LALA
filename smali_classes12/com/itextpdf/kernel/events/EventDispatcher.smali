.class public Lcom/itextpdf/kernel/events/EventDispatcher;
.super Ljava/lang/Object;
.source "EventDispatcher.java"

# interfaces
.implements Lcom/itextpdf/kernel/events/IEventDispatcher;


# instance fields
.field protected eventHandlers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/events/IEventHandler;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/events/EventDispatcher;->eventHandlers:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public addEventHandler(Ljava/lang/String;Lcom/itextpdf/kernel/events/IEventHandler;)V
    .locals 2
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "handler"    # Lcom/itextpdf/kernel/events/IEventHandler;

    .line 41
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/events/EventDispatcher;->removeEventHandler(Ljava/lang/String;Lcom/itextpdf/kernel/events/IEventHandler;)V

    .line 42
    iget-object v0, p0, Lcom/itextpdf/kernel/events/EventDispatcher;->eventHandlers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 43
    .local v0, "handlers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/events/IEventHandler;>;"
    if-nez v0, :cond_0

    .line 44
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move-object v0, v1

    .line 45
    iget-object v1, p0, Lcom/itextpdf/kernel/events/EventDispatcher;->eventHandlers:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    :cond_0
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    return-void
.end method

.method public dispatchEvent(Lcom/itextpdf/kernel/events/Event;)V
    .locals 1
    .param p1, "event"    # Lcom/itextpdf/kernel/events/Event;

    .line 52
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/events/EventDispatcher;->dispatchEvent(Lcom/itextpdf/kernel/events/Event;Z)V

    .line 53
    return-void
.end method

.method public dispatchEvent(Lcom/itextpdf/kernel/events/Event;Z)V
    .locals 3
    .param p1, "event"    # Lcom/itextpdf/kernel/events/Event;
    .param p2, "delayed"    # Z

    .line 57
    iget-object v0, p0, Lcom/itextpdf/kernel/events/EventDispatcher;->eventHandlers:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/events/Event;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 58
    .local v0, "handlers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/events/IEventHandler;>;"
    if-eqz v0, :cond_0

    .line 59
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/events/IEventHandler;

    .line 60
    .local v2, "handler":Lcom/itextpdf/kernel/events/IEventHandler;
    invoke-interface {v2, p1}, Lcom/itextpdf/kernel/events/IEventHandler;->handleEvent(Lcom/itextpdf/kernel/events/Event;)V

    .line 61
    .end local v2    # "handler":Lcom/itextpdf/kernel/events/IEventHandler;
    goto :goto_0

    .line 63
    :cond_0
    return-void
.end method

.method public hasEventHandler(Ljava/lang/String;)Z
    .locals 1
    .param p1, "type"    # Ljava/lang/String;

    .line 67
    iget-object v0, p0, Lcom/itextpdf/kernel/events/EventDispatcher;->eventHandlers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeAllHandlers()V
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/itextpdf/kernel/events/EventDispatcher;->eventHandlers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 83
    return-void
.end method

.method public removeEventHandler(Ljava/lang/String;Lcom/itextpdf/kernel/events/IEventHandler;)V
    .locals 2
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "handler"    # Lcom/itextpdf/kernel/events/IEventHandler;

    .line 72
    iget-object v0, p0, Lcom/itextpdf/kernel/events/EventDispatcher;->eventHandlers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 73
    .local v0, "handlers":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/events/IEventHandler;>;"
    if-nez v0, :cond_0

    .line 74
    return-void

    .line 75
    :cond_0
    invoke-interface {v0, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 76
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 77
    iget-object v1, p0, Lcom/itextpdf/kernel/events/EventDispatcher;->eventHandlers:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    :cond_1
    return-void
.end method
