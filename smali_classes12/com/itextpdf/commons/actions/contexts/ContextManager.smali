.class public Lcom/itextpdf/commons/actions/contexts/ContextManager;
.super Ljava/lang/Object;
.source "ContextManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/commons/actions/contexts/ContextManager$LengthComparator;
    }
.end annotation


# static fields
.field private static final INSTANCE:Lcom/itextpdf/commons/actions/contexts/ContextManager;


# instance fields
.field private final contextMappings:Ljava/util/SortedMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/SortedMap<",
            "Ljava/lang/String;",
            "Lcom/itextpdf/commons/actions/contexts/IContext;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 43
    new-instance v0, Lcom/itextpdf/commons/actions/contexts/ContextManager;

    invoke-direct {v0}, Lcom/itextpdf/commons/actions/contexts/ContextManager;-><init>()V

    .line 44
    .local v0, "local":Lcom/itextpdf/commons/actions/contexts/ContextManager;
    sget-object v1, Lcom/itextpdf/commons/actions/NamespaceConstant;->ITEXT_CORE_NAMESPACES:Ljava/util/List;

    .line 45
    const-string v2, "itext-core"

    invoke-static {v2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    .line 44
    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/commons/actions/contexts/ContextManager;->registerGenericContext(Ljava/util/Collection;Ljava/util/Collection;)V

    .line 47
    const-string v1, "com.itextpdf.signatures"

    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    .line 48
    const-string v2, "itext-core-sign"

    invoke-static {v2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    .line 47
    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/commons/actions/contexts/ContextManager;->registerGenericContext(Ljava/util/Collection;Ljava/util/Collection;)V

    .line 50
    const-string v1, "com.itextpdf.html2pdf"

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 51
    const-string/jumbo v2, "pdfHtml"

    invoke-static {v2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    .line 50
    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/commons/actions/contexts/ContextManager;->registerGenericContext(Ljava/util/Collection;Ljava/util/Collection;)V

    .line 53
    const-string v1, "com.itextpdf.pdfcleanup"

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 54
    const-string/jumbo v2, "pdfSweep"

    invoke-static {v2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    .line 53
    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/commons/actions/contexts/ContextManager;->registerGenericContext(Ljava/util/Collection;Ljava/util/Collection;)V

    .line 56
    const-string v1, "com.itextpdf.pdfocr.tesseract4"

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 57
    const-string/jumbo v2, "pdfOcr-tesseract4"

    invoke-static {v2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    .line 56
    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/commons/actions/contexts/ContextManager;->registerGenericContext(Ljava/util/Collection;Ljava/util/Collection;)V

    .line 59
    sput-object v0, Lcom/itextpdf/commons/actions/contexts/ContextManager;->INSTANCE:Lcom/itextpdf/commons/actions/contexts/ContextManager;

    .line 60
    .end local v0    # "local":Lcom/itextpdf/commons/actions/contexts/ContextManager;
    return-void
.end method

.method constructor <init>()V
    .locals 3

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljava/util/TreeMap;

    new-instance v1, Lcom/itextpdf/commons/actions/contexts/ContextManager$LengthComparator;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/itextpdf/commons/actions/contexts/ContextManager$LengthComparator;-><init>(Lcom/itextpdf/commons/actions/contexts/ContextManager$1;)V

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lcom/itextpdf/commons/actions/contexts/ContextManager;->contextMappings:Ljava/util/SortedMap;

    .line 64
    return-void
.end method

.method public static getInstance()Lcom/itextpdf/commons/actions/contexts/ContextManager;
    .locals 1

    .line 72
    sget-object v0, Lcom/itextpdf/commons/actions/contexts/ContextManager;->INSTANCE:Lcom/itextpdf/commons/actions/contexts/ContextManager;

    return-object v0
.end method

.method private getNamespaceMapping(Ljava/lang/String;)Lcom/itextpdf/commons/actions/contexts/IContext;
    .locals 1
    .param p1, "namespace"    # Ljava/lang/String;

    .line 119
    if-eqz p1, :cond_0

    .line 120
    iget-object v0, p0, Lcom/itextpdf/commons/actions/contexts/ContextManager;->contextMappings:Ljava/util/SortedMap;

    invoke-interface {v0, p1}, Ljava/util/SortedMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/commons/actions/contexts/IContext;

    return-object v0

    .line 122
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private static normalize(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "namespace"    # Ljava/lang/String;

    .line 134
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getContext(Ljava/lang/Class;)Lcom/itextpdf/commons/actions/contexts/IContext;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Lcom/itextpdf/commons/actions/contexts/IContext;"
        }
    .end annotation

    .line 83
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/commons/actions/contexts/ContextManager;->getContext(Ljava/lang/String;)Lcom/itextpdf/commons/actions/contexts/IContext;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getContext(Ljava/lang/String;)Lcom/itextpdf/commons/actions/contexts/IContext;
    .locals 1
    .param p1, "className"    # Ljava/lang/String;

    .line 94
    invoke-virtual {p0, p1}, Lcom/itextpdf/commons/actions/contexts/ContextManager;->getRecognisedNamespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/commons/actions/contexts/ContextManager;->getNamespaceMapping(Ljava/lang/String;)Lcom/itextpdf/commons/actions/contexts/IContext;

    move-result-object v0

    return-object v0
.end method

.method getRecognisedNamespace(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "className"    # Ljava/lang/String;

    .line 98
    if-eqz p1, :cond_1

    .line 99
    invoke-static {p1}, Lcom/itextpdf/commons/actions/contexts/ContextManager;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 103
    .local v0, "normalizedClassName":Ljava/lang/String;
    iget-object v1, p0, Lcom/itextpdf/commons/actions/contexts/ContextManager;->contextMappings:Ljava/util/SortedMap;

    invoke-interface {v1}, Ljava/util/SortedMap;->keySet()Ljava/util/Set;

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

    .line 104
    .local v2, "namespace":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 105
    return-object v2

    .line 107
    .end local v2    # "namespace":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 109
    .end local v0    # "normalizedClassName":Ljava/lang/String;
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method registerGenericContext(Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 5
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

    .line 126
    .local p1, "namespaces":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .local p2, "products":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    new-instance v0, Lcom/itextpdf/commons/actions/contexts/GenericContext;

    invoke-direct {v0, p2}, Lcom/itextpdf/commons/actions/contexts/GenericContext;-><init>(Ljava/util/Collection;)V

    .line 127
    .local v0, "context":Lcom/itextpdf/commons/actions/contexts/GenericContext;
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 128
    .local v2, "namespace":Ljava/lang/String;
    iget-object v3, p0, Lcom/itextpdf/commons/actions/contexts/ContextManager;->contextMappings:Ljava/util/SortedMap;

    invoke-static {v2}, Lcom/itextpdf/commons/actions/contexts/ContextManager;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v0}, Ljava/util/SortedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .end local v2    # "namespace":Ljava/lang/String;
    goto :goto_0

    .line 130
    :cond_0
    return-void
.end method

.method unregisterContext(Ljava/util/Collection;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 113
    .local p1, "namespaces":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 114
    .local v1, "namespace":Ljava/lang/String;
    iget-object v2, p0, Lcom/itextpdf/commons/actions/contexts/ContextManager;->contextMappings:Ljava/util/SortedMap;

    invoke-static {v1}, Lcom/itextpdf/commons/actions/contexts/ContextManager;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/SortedMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .end local v1    # "namespace":Ljava/lang/String;
    goto :goto_0

    .line 116
    :cond_0
    return-void
.end method
