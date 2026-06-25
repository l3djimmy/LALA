.class public Lcom/itextpdf/commons/actions/processors/DefaultProductProcessorFactory;
.super Ljava/lang/Object;
.source "DefaultProductProcessorFactory.java"

# interfaces
.implements Lcom/itextpdf/commons/actions/processors/IProductProcessorFactory;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createProcessor(Ljava/lang/String;)Lcom/itextpdf/commons/actions/processors/ITextProductEventProcessor;
    .locals 1
    .param p1, "productName"    # Ljava/lang/String;

    .line 39
    new-instance v0, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;

    invoke-direct {v0, p1}, Lcom/itextpdf/commons/actions/processors/DefaultITextProductEventProcessor;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
