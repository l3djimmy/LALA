.class public abstract Lcom/itextpdf/commons/actions/contexts/AbstractContextManagerConfigurationEvent;
.super Lcom/itextpdf/commons/actions/AbstractITextConfigurationEvent;
.source "AbstractContextManagerConfigurationEvent.java"


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Lcom/itextpdf/commons/actions/AbstractITextConfigurationEvent;-><init>()V

    .line 38
    return-void
.end method


# virtual methods
.method protected registerGenericContext(Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 47
    .local p1, "namespaces":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .local p2, "products":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-static {}, Lcom/itextpdf/commons/actions/contexts/ContextManager;->getInstance()Lcom/itextpdf/commons/actions/contexts/ContextManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/commons/actions/contexts/ContextManager;->registerGenericContext(Ljava/util/Collection;Ljava/util/Collection;)V

    .line 48
    return-void
.end method

.method protected unregisterContext(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 56
    .local p1, "namespaces":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-static {}, Lcom/itextpdf/commons/actions/contexts/ContextManager;->getInstance()Lcom/itextpdf/commons/actions/contexts/ContextManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/commons/actions/contexts/ContextManager;->unregisterContext(Ljava/util/Collection;)V

    .line 57
    return-void
.end method
