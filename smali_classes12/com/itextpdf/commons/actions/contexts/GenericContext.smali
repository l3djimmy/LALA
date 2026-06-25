.class public Lcom/itextpdf/commons/actions/contexts/GenericContext;
.super Ljava/lang/Object;
.source "GenericContext.java"

# interfaces
.implements Lcom/itextpdf/commons/actions/contexts/IContext;


# instance fields
.field private final supportedProducts:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 43
    .local p1, "supportedProducts":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/commons/actions/contexts/GenericContext;->supportedProducts:Ljava/util/Set;

    .line 44
    iget-object v0, p0, Lcom/itextpdf/commons/actions/contexts/GenericContext;->supportedProducts:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 45
    return-void
.end method


# virtual methods
.method public isAllowed(Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;)Z
    .locals 2
    .param p1, "event"    # Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;

    .line 56
    iget-object v0, p0, Lcom/itextpdf/commons/actions/contexts/GenericContext;->supportedProducts:Ljava/util/Set;

    invoke-virtual {p1}, Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;->getProductName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
