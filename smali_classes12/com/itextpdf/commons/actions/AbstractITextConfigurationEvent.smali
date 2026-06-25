.class public abstract Lcom/itextpdf/commons/actions/AbstractITextConfigurationEvent;
.super Lcom/itextpdf/commons/actions/AbstractITextEvent;
.source "AbstractITextConfigurationEvent.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Lcom/itextpdf/commons/actions/AbstractITextEvent;-><init>()V

    return-void
.end method


# virtual methods
.method protected addEvent(Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;)V
    .locals 1
    .param p1, "id"    # Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .param p2, "event"    # Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    .line 100
    sget-object v0, Lcom/itextpdf/commons/actions/ProductEventHandler;->INSTANCE:Lcom/itextpdf/commons/actions/ProductEventHandler;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/commons/actions/ProductEventHandler;->addEvent(Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;)V

    .line 101
    return-void
.end method

.method protected addProcessor(Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;)Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;
    .locals 1
    .param p1, "processor"    # Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;

    .line 44
    sget-object v0, Lcom/itextpdf/commons/actions/ProductEventHandler;->INSTANCE:Lcom/itextpdf/commons/actions/ProductEventHandler;

    invoke-virtual {v0, p1}, Lcom/itextpdf/commons/actions/ProductEventHandler;->addProcessor(Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;)Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;

    move-result-object v0

    return-object v0
.end method

.method protected abstract doAction()V
.end method

.method protected getActiveProcessor(Ljava/lang/String;)Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;
    .locals 1
    .param p1, "productName"    # Ljava/lang/String;

    .line 70
    sget-object v0, Lcom/itextpdf/commons/actions/ProductEventHandler;->INSTANCE:Lcom/itextpdf/commons/actions/ProductEventHandler;

    invoke-virtual {v0, p1}, Lcom/itextpdf/commons/actions/ProductEventHandler;->getActiveProcessor(Ljava/lang/String;)Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;

    move-result-object v0

    return-object v0
.end method

.method protected getEvents(Lcom/itextpdf/commons/actions/sequence/SequenceId;)Ljava/util/List;
    .locals 1
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

    .line 90
    sget-object v0, Lcom/itextpdf/commons/actions/ProductEventHandler;->INSTANCE:Lcom/itextpdf/commons/actions/ProductEventHandler;

    invoke-virtual {v0, p1}, Lcom/itextpdf/commons/actions/ProductEventHandler;->getEvents(Lcom/itextpdf/commons/actions/sequence/SequenceId;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected getProcessors()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;",
            ">;"
        }
    .end annotation

    .line 79
    sget-object v0, Lcom/itextpdf/commons/actions/ProductEventHandler;->INSTANCE:Lcom/itextpdf/commons/actions/ProductEventHandler;

    invoke-virtual {v0}, Lcom/itextpdf/commons/actions/ProductEventHandler;->getProcessors()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method protected registerInternalNamespace(Ljava/lang/String;)V
    .locals 0
    .param p1, "namespace"    # Ljava/lang/String;

    .line 109
    invoke-static {p1}, Lcom/itextpdf/commons/actions/AbstractITextEvent;->registerNamespace(Ljava/lang/String;)V

    .line 110
    return-void
.end method

.method protected removeProcessor(Ljava/lang/String;)Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;
    .locals 1
    .param p1, "productName"    # Ljava/lang/String;

    .line 55
    sget-object v0, Lcom/itextpdf/commons/actions/ProductEventHandler;->INSTANCE:Lcom/itextpdf/commons/actions/ProductEventHandler;

    invoke-virtual {v0, p1}, Lcom/itextpdf/commons/actions/ProductEventHandler;->removeProcessor(Ljava/lang/String;)Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;

    move-result-object v0

    return-object v0
.end method
