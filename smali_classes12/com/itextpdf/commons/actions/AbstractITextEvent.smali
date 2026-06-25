.class public abstract Lcom/itextpdf/commons/actions/AbstractITextEvent;
.super Ljava/lang/Object;
.source "AbstractITextEvent.java"

# interfaces
.implements Lcom/itextpdf/commons/actions/IEvent;


# static fields
.field private static final INTERNAL_PACKAGES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final ONLY_FOR_INTERNAL_USE:Ljava/lang/String; = "AbstractITextEvent is only for internal usage."


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 34
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/itextpdf/commons/actions/AbstractITextEvent;->INTERNAL_PACKAGES:Ljava/util/Map;

    .line 37
    const-string v0, "com.itextpdf"

    invoke-static {v0}, Lcom/itextpdf/commons/actions/AbstractITextEvent;->registerNamespace(Ljava/lang/String;)V

    .line 38
    return-void
.end method

.method protected constructor <init>()V
    .locals 4

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x1

    .line 45
    .local v0, "isUnknown":Z
    sget-object v1, Lcom/itextpdf/commons/actions/AbstractITextEvent;->INTERNAL_PACKAGES:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 46
    .local v2, "namespace":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 47
    const/4 v0, 0x0

    .line 48
    goto :goto_1

    .line 50
    .end local v2    # "namespace":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 51
    :cond_1
    :goto_1
    if-nez v0, :cond_2

    .line 54
    return-void

    .line 52
    :cond_2
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    const-string v2, "AbstractITextEvent is only for internal usage."

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static registerNamespace(Ljava/lang/String;)V
    .locals 3
    .param p0, "namespace"    # Ljava/lang/String;

    .line 57
    sget-object v0, Lcom/itextpdf/commons/actions/AbstractITextEvent;->INTERNAL_PACKAGES:Ljava/util/Map;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    return-void
.end method
