.class public Lcom/itextpdf/kernel/pdf/tagutils/TagTreeIterator;
.super Ljava/lang/Object;
.source "TagTreeIterator.java"


# instance fields
.field private final handlerList:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/tagutils/ITagTreeIteratorHandler;",
            ">;"
        }
    .end annotation
.end field

.field private final pointer:Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;)V
    .locals 3
    .param p1, "tagTreePointer"    # Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    if-eqz p1, :cond_0

    .line 57
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreeIterator;->pointer:Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    .line 58
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreeIterator;->handlerList:Ljava/util/Set;

    .line 59
    return-void

    .line 54
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "tagTreepointer"

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 55
    const-string/jumbo v2, "{0} should not be null."

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static traverse(Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;Ljava/util/Set;)V
    .locals 3
    .param p0, "elem"    # Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/tagutils/ITagTreeIteratorHandler;",
            ">;)V"
        }
    .end annotation

    .line 84
    .local p1, "handlerList":Ljava/util/Set;, "Ljava/util/Set<Lcom/itextpdf/kernel/pdf/tagutils/ITagTreeIteratorHandler;>;"
    if-nez p0, :cond_0

    .line 85
    return-void

    .line 87
    :cond_0
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/tagutils/ITagTreeIteratorHandler;

    .line 88
    .local v1, "handler":Lcom/itextpdf/kernel/pdf/tagutils/ITagTreeIteratorHandler;
    invoke-interface {v1, p0}, Lcom/itextpdf/kernel/pdf/tagutils/ITagTreeIteratorHandler;->nextElement(Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;)V

    .line 89
    .end local v1    # "handler":Lcom/itextpdf/kernel/pdf/tagutils/ITagTreeIteratorHandler;
    goto :goto_0

    .line 90
    :cond_1
    invoke-interface {p0}, Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;->getKids()Ljava/util/List;

    move-result-object v0

    .line 91
    .local v0, "kids":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;>;"
    if-eqz v0, :cond_2

    .line 92
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    .line 93
    .local v2, "kid":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    invoke-static {v2, p1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreeIterator;->traverse(Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;Ljava/util/Set;)V

    .line 94
    .end local v2    # "kid":Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;
    goto :goto_1

    .line 96
    :cond_2
    return-void
.end method


# virtual methods
.method public addHandler(Lcom/itextpdf/kernel/pdf/tagutils/ITagTreeIteratorHandler;)Lcom/itextpdf/kernel/pdf/tagutils/TagTreeIterator;
    .locals 1
    .param p1, "handler"    # Lcom/itextpdf/kernel/pdf/tagutils/ITagTreeIteratorHandler;

    .line 69
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreeIterator;->handlerList:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 70
    return-object p0
.end method

.method public traverse()V
    .locals 2

    .line 80
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreeIterator;->pointer:Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/tagutils/TagTreeIterator;->handlerList:Ljava/util/Set;

    invoke-static {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreeIterator;->traverse(Lcom/itextpdf/kernel/pdf/tagging/IStructureNode;Ljava/util/Set;)V

    .line 81
    return-void
.end method
