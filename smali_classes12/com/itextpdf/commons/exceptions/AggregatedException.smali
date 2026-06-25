.class public Lcom/itextpdf/commons/exceptions/AggregatedException;
.super Lcom/itextpdf/commons/exceptions/ITextException;
.source "AggregatedException.java"


# static fields
.field private static final AGGREGATED_MESSAGE:Ljava/lang/String; = "Aggregated message"

.field public static final ERROR_DURING_EVENT_PROCESSING:Ljava/lang/String; = "Error during event processing"


# instance fields
.field private final aggregatedExceptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/RuntimeException;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/RuntimeException;",
            ">;)V"
        }
    .end annotation

    .line 58
    .local p2, "aggregatedExceptions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/RuntimeException;>;"
    invoke-direct {p0, p1}, Lcom/itextpdf/commons/exceptions/ITextException;-><init>(Ljava/lang/String;)V

    .line 59
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/itextpdf/commons/exceptions/AggregatedException;->aggregatedExceptions:Ljava/util/List;

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/RuntimeException;",
            ">;)V"
        }
    .end annotation

    .line 47
    .local p1, "aggregatedExceptions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/RuntimeException;>;"
    const-string v0, ""

    invoke-direct {p0, v0}, Lcom/itextpdf/commons/exceptions/ITextException;-><init>(Ljava/lang/String;)V

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/itextpdf/commons/exceptions/AggregatedException;->aggregatedExceptions:Ljava/util/List;

    .line 49
    return-void
.end method


# virtual methods
.method public getAggregatedExceptions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Exception;",
            ">;"
        }
    .end annotation

    .line 91
    iget-object v0, p0, Lcom/itextpdf/commons/exceptions/AggregatedException;->aggregatedExceptions:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 6

    .line 70
    invoke-super {p0}, Lcom/itextpdf/commons/exceptions/ITextException;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 71
    .local v0, "message":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 72
    :cond_0
    const-string v0, "Aggregated message"

    .line 74
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 75
    .local v1, "builder":Ljava/lang/StringBuilder;
    const-string v2, ":\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v3, p0, Lcom/itextpdf/commons/exceptions/AggregatedException;->aggregatedExceptions:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 77
    iget-object v3, p0, Lcom/itextpdf/commons/exceptions/AggregatedException;->aggregatedExceptions:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Exception;

    .line 78
    .local v3, "current":Ljava/lang/Exception;
    if-eqz v3, :cond_2

    .line 79
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ") "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 76
    .end local v3    # "current":Ljava/lang/Exception;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 82
    .end local v2    # "i":I
    :cond_3
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
