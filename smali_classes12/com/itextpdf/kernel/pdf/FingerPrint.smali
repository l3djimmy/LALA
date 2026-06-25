.class public Lcom/itextpdf/kernel/pdf/FingerPrint;
.super Ljava/lang/Object;
.source "FingerPrint.java"


# instance fields
.field private productDataSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/itextpdf/commons/actions/data/ProductData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/FingerPrint;->productDataSet:Ljava/util/Set;

    .line 47
    return-void
.end method


# virtual methods
.method public getProducts()Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/commons/actions/data/ProductData;",
            ">;"
        }
    .end annotation

    .line 67
    new-instance v0, Ljava/util/LinkedHashSet;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/FingerPrint;->productDataSet:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public registerProduct(Lcom/itextpdf/commons/actions/data/ProductData;)Z
    .locals 2
    .param p1, "productData"    # Lcom/itextpdf/commons/actions/data/ProductData;

    .line 56
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/FingerPrint;->productDataSet:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    .line 57
    .local v0, "initialSize":I
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/FingerPrint;->productDataSet:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 58
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/FingerPrint;->productDataSet:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    if-eq v0, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method
