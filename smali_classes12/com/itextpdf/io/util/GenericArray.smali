.class public Lcom/itextpdf/io/util/GenericArray;
.super Ljava/lang/Object;
.source "GenericArray.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private array:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .locals 3
    .param p1, "size"    # I

    .line 32
    .local p0, "this":Lcom/itextpdf/io/util/GenericArray;, "Lcom/itextpdf/io/util/GenericArray<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/itextpdf/io/util/GenericArray;->array:Ljava/util/List;

    .line 34
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_0

    .line 35
    iget-object v1, p0, Lcom/itextpdf/io/util/GenericArray;->array:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 37
    .end local v0    # "i":I
    :cond_0
    return-void
.end method


# virtual methods
.method public get(I)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 40
    .local p0, "this":Lcom/itextpdf/io/util/GenericArray;, "Lcom/itextpdf/io/util/GenericArray<TT;>;"
    iget-object v0, p0, Lcom/itextpdf/io/util/GenericArray;->array:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)TT;"
        }
    .end annotation

    .line 44
    .local p0, "this":Lcom/itextpdf/io/util/GenericArray;, "Lcom/itextpdf/io/util/GenericArray<TT;>;"
    .local p2, "element":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/itextpdf/io/util/GenericArray;->array:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
