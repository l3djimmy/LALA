.class public abstract Lcom/itextpdf/commons/actions/AbstractEventWrapper;
.super Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;
.source "AbstractEventWrapper.java"


# instance fields
.field private final event:Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;


# direct methods
.method protected constructor <init>(Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;)V
    .locals 3
    .param p1, "event"    # Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;
    .param p2, "confirmationType"    # Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    .line 41
    invoke-virtual {p1}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->getSequenceId()Lcom/itextpdf/commons/actions/sequence/SequenceId;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->getProductData()Lcom/itextpdf/commons/actions/data/ProductData;

    move-result-object v1

    invoke-virtual {p1}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->getMetaInfo()Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2, p2}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;-><init>(Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/data/ProductData;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;)V

    .line 42
    iput-object p1, p0, Lcom/itextpdf/commons/actions/AbstractEventWrapper;->event:Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    .line 43
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;)V
    .locals 2
    .param p1, "updatedSequenceId"    # Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .param p2, "event"    # Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;
    .param p3, "confirmationType"    # Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    .line 55
    invoke-virtual {p2}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->getProductData()Lcom/itextpdf/commons/actions/data/ProductData;

    move-result-object v0

    invoke-virtual {p2}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->getMetaInfo()Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1, p3}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;-><init>(Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/data/ProductData;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;)V

    .line 56
    iput-object p2, p0, Lcom/itextpdf/commons/actions/AbstractEventWrapper;->event:Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    .line 57
    return-void
.end method


# virtual methods
.method public getClassFromContext()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 70
    invoke-virtual {p0}, Lcom/itextpdf/commons/actions/AbstractEventWrapper;->getEvent()Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->getClassFromContext()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public getEvent()Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/itextpdf/commons/actions/AbstractEventWrapper;->event:Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    return-object v0
.end method

.method public getEventType()Ljava/lang/String;
    .locals 1

    .line 75
    invoke-virtual {p0}, Lcom/itextpdf/commons/actions/AbstractEventWrapper;->getEvent()Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->getEventType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
