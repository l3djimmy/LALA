.class public interface abstract Lcom/itextpdf/kernel/pdf/canvas/parser/listener/IEventListener;
.super Ljava/lang/Object;
.source "IEventListener.java"


# virtual methods
.method public abstract eventOccurred(Lcom/itextpdf/kernel/pdf/canvas/parser/data/IEventData;Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;)V
.end method

.method public abstract getSupportedEvents()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/EventType;",
            ">;"
        }
    .end annotation
.end method
