.class final Lcom/itextpdf/commons/actions/ProductProcessorFactoryKeeper;
.super Ljava/lang/Object;
.source "ProductProcessorFactoryKeeper.java"


# static fields
.field private static final DEFAULT_FACTORY:Lcom/itextpdf/commons/actions/processors/IProductProcessorFactory;

.field private static productProcessorFactory:Lcom/itextpdf/commons/actions/processors/IProductProcessorFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 32
    new-instance v0, Lcom/itextpdf/commons/actions/processors/DefaultProductProcessorFactory;

    invoke-direct {v0}, Lcom/itextpdf/commons/actions/processors/DefaultProductProcessorFactory;-><init>()V

    sput-object v0, Lcom/itextpdf/commons/actions/ProductProcessorFactoryKeeper;->DEFAULT_FACTORY:Lcom/itextpdf/commons/actions/processors/IProductProcessorFactory;

    .line 33
    sget-object v0, Lcom/itextpdf/commons/actions/ProductProcessorFactoryKeeper;->DEFAULT_FACTORY:Lcom/itextpdf/commons/actions/processors/IProductProcessorFactory;

    sput-object v0, Lcom/itextpdf/commons/actions/ProductProcessorFactoryKeeper;->productProcessorFactory:Lcom/itextpdf/commons/actions/processors/IProductProcessorFactory;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method

.method static getProductProcessorFactory()Lcom/itextpdf/commons/actions/processors/IProductProcessorFactory;
    .locals 1

    .line 61
    sget-object v0, Lcom/itextpdf/commons/actions/ProductProcessorFactoryKeeper;->productProcessorFactory:Lcom/itextpdf/commons/actions/processors/IProductProcessorFactory;

    return-object v0
.end method

.method static restoreDefaultProductProcessorFactory()V
    .locals 1

    .line 52
    sget-object v0, Lcom/itextpdf/commons/actions/ProductProcessorFactoryKeeper;->DEFAULT_FACTORY:Lcom/itextpdf/commons/actions/processors/IProductProcessorFactory;

    sput-object v0, Lcom/itextpdf/commons/actions/ProductProcessorFactoryKeeper;->productProcessorFactory:Lcom/itextpdf/commons/actions/processors/IProductProcessorFactory;

    .line 53
    return-void
.end method

.method static setProductProcessorFactory(Lcom/itextpdf/commons/actions/processors/IProductProcessorFactory;)V
    .locals 0
    .param p0, "productProcessorFactory"    # Lcom/itextpdf/commons/actions/processors/IProductProcessorFactory;

    .line 45
    sput-object p0, Lcom/itextpdf/commons/actions/ProductProcessorFactoryKeeper;->productProcessorFactory:Lcom/itextpdf/commons/actions/processors/IProductProcessorFactory;

    .line 46
    return-void
.end method
