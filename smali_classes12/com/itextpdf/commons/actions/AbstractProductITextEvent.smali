.class public abstract Lcom/itextpdf/commons/actions/AbstractProductITextEvent;
.super Lcom/itextpdf/commons/actions/AbstractITextEvent;
.source "AbstractProductITextEvent.java"


# instance fields
.field private final productData:Lcom/itextpdf/commons/actions/data/ProductData;


# direct methods
.method protected constructor <init>(Lcom/itextpdf/commons/actions/data/ProductData;)V
    .locals 2
    .param p1, "productData"    # Lcom/itextpdf/commons/actions/data/ProductData;

    .line 41
    invoke-direct {p0}, Lcom/itextpdf/commons/actions/AbstractITextEvent;-><init>()V

    .line 42
    if-eqz p1, :cond_0

    .line 46
    iput-object p1, p0, Lcom/itextpdf/commons/actions/AbstractProductITextEvent;->productData:Lcom/itextpdf/commons/actions/data/ProductData;

    .line 47
    return-void

    .line 44
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ProductData shouldn\'t be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getProductData()Lcom/itextpdf/commons/actions/data/ProductData;
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/itextpdf/commons/actions/AbstractProductITextEvent;->productData:Lcom/itextpdf/commons/actions/data/ProductData;

    return-object v0
.end method

.method public getProductName()Ljava/lang/String;
    .locals 1

    .line 64
    invoke-virtual {p0}, Lcom/itextpdf/commons/actions/AbstractProductITextEvent;->getProductData()Lcom/itextpdf/commons/actions/data/ProductData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/commons/actions/data/ProductData;->getProductName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
