.class public Lcom/itextpdf/commons/actions/confirmations/ConfirmEvent;
.super Lcom/itextpdf/commons/actions/AbstractEventWrapper;
.source "ConfirmEvent.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;)V
    .locals 1
    .param p1, "confirmedEvent"    # Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    .line 52
    invoke-virtual {p1}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->getSequenceId()Lcom/itextpdf/commons/actions/sequence/SequenceId;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/itextpdf/commons/actions/confirmations/ConfirmEvent;-><init>(Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;)V

    .line 53
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;)V
    .locals 1
    .param p1, "updatedSequenceId"    # Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .param p2, "confirmedEvent"    # Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    .line 43
    sget-object v0, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;->UNCONFIRMABLE:Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/commons/actions/AbstractEventWrapper;-><init>(Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;)V

    .line 44
    return-void
.end method


# virtual methods
.method public getConfirmedEvent()Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;
    .locals 2

    .line 61
    invoke-virtual {p0}, Lcom/itextpdf/commons/actions/confirmations/ConfirmEvent;->getEvent()Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    move-result-object v0

    .line 62
    .local v0, "event":Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;
    instance-of v1, v0, Lcom/itextpdf/commons/actions/confirmations/ConfirmEvent;

    if-eqz v1, :cond_0

    .line 63
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/commons/actions/confirmations/ConfirmEvent;

    invoke-virtual {v1}, Lcom/itextpdf/commons/actions/confirmations/ConfirmEvent;->getConfirmedEvent()Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;

    move-result-object v1

    return-object v1

    .line 65
    :cond_0
    return-object v0
.end method
