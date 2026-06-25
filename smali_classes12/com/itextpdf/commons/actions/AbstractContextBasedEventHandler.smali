.class public abstract Lcom/itextpdf/commons/actions/AbstractContextBasedEventHandler;
.super Ljava/lang/Object;
.source "AbstractContextBasedEventHandler.java"

# interfaces
.implements Lcom/itextpdf/commons/actions/IEventHandler;


# instance fields
.field private final defaultContext:Lcom/itextpdf/commons/actions/contexts/IContext;


# direct methods
.method protected constructor <init>(Lcom/itextpdf/commons/actions/contexts/IContext;)V
    .locals 0
    .param p1, "onUnknownContext"    # Lcom/itextpdf/commons/actions/contexts/IContext;

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/itextpdf/commons/actions/AbstractContextBasedEventHandler;->defaultContext:Lcom/itextpdf/commons/actions/contexts/IContext;

    .line 43
    return-void
.end method


# virtual methods
.method protected abstract onAcceptedEvent(Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;)V
.end method

.method public final onEvent(Lcom/itextpdf/commons/actions/IEvent;)V
    .locals 4
    .param p1, "event"    # Lcom/itextpdf/commons/actions/IEvent;

    .line 52
    instance-of v0, p1, Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;

    if-nez v0, :cond_0

    .line 53
    return-void

    .line 56
    :cond_0
    const/4 v0, 0x0

    .line 57
    .local v0, "context":Lcom/itextpdf/commons/actions/contexts/IContext;
    move-object v1, p1

    check-cast v1, Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;

    .line 58
    .local v1, "iTextEvent":Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;
    invoke-virtual {v1}, Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;->getMetaInfo()Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 59
    invoke-static {}, Lcom/itextpdf/commons/actions/contexts/ContextManager;->getInstance()Lcom/itextpdf/commons/actions/contexts/ContextManager;

    move-result-object v2

    invoke-virtual {v1}, Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;->getMetaInfo()Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/commons/actions/contexts/ContextManager;->getContext(Ljava/lang/Class;)Lcom/itextpdf/commons/actions/contexts/IContext;

    move-result-object v0

    .line 61
    :cond_1
    if-nez v0, :cond_2

    .line 62
    invoke-static {}, Lcom/itextpdf/commons/actions/contexts/ContextManager;->getInstance()Lcom/itextpdf/commons/actions/contexts/ContextManager;

    move-result-object v2

    invoke-virtual {v1}, Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;->getClassFromContext()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/commons/actions/contexts/ContextManager;->getContext(Ljava/lang/Class;)Lcom/itextpdf/commons/actions/contexts/IContext;

    move-result-object v0

    .line 65
    :cond_2
    if-nez v0, :cond_3

    .line 66
    iget-object v0, p0, Lcom/itextpdf/commons/actions/AbstractContextBasedEventHandler;->defaultContext:Lcom/itextpdf/commons/actions/contexts/IContext;

    .line 69
    :cond_3
    invoke-interface {v0, v1}, Lcom/itextpdf/commons/actions/contexts/IContext;->isAllowed(Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 70
    invoke-virtual {p0, v1}, Lcom/itextpdf/commons/actions/AbstractContextBasedEventHandler;->onAcceptedEvent(Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;)V

    .line 72
    :cond_4
    return-void
.end method
