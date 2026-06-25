.class public Lcom/itextpdf/commons/actions/processors/UnderAgplITextProductEventProcessor;
.super Lcom/itextpdf/commons/actions/processors/AbstractITextProductEventProcessor;
.source "UnderAgplITextProductEventProcessor.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "productName"    # Ljava/lang/String;

    .line 37
    invoke-direct {p0, p1}, Lcom/itextpdf/commons/actions/processors/AbstractITextProductEventProcessor;-><init>(Ljava/lang/String;)V

    .line 38
    return-void
.end method


# virtual methods
.method public getUsageType()Ljava/lang/String;
    .locals 1

    .line 47
    const-string v0, "AGPL"

    return-object v0
.end method

.method public onEvent(Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;)V
    .locals 0
    .param p1, "event"    # Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    .line 43
    return-void
.end method
