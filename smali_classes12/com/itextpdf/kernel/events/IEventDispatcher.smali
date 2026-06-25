.class public interface abstract Lcom/itextpdf/kernel/events/IEventDispatcher;
.super Ljava/lang/Object;
.source "IEventDispatcher.java"


# virtual methods
.method public abstract addEventHandler(Ljava/lang/String;Lcom/itextpdf/kernel/events/IEventHandler;)V
.end method

.method public abstract dispatchEvent(Lcom/itextpdf/kernel/events/Event;)V
.end method

.method public abstract dispatchEvent(Lcom/itextpdf/kernel/events/Event;Z)V
.end method

.method public abstract hasEventHandler(Ljava/lang/String;)Z
.end method

.method public abstract removeAllHandlers()V
.end method

.method public abstract removeEventHandler(Ljava/lang/String;Lcom/itextpdf/kernel/events/IEventHandler;)V
.end method
