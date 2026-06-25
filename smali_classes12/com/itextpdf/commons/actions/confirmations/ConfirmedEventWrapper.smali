.class public Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;
.super Lcom/itextpdf/commons/actions/AbstractEventWrapper;
.source "ConfirmedEventWrapper.java"


# instance fields
.field private final producerLine:Ljava/lang/String;

.field private final productUsageType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "event"    # Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;
    .param p2, "productUsageType"    # Ljava/lang/String;
    .param p3, "producerLine"    # Ljava/lang/String;

    .line 47
    sget-object v0, Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;->UNCONFIRMABLE:Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/commons/actions/AbstractEventWrapper;-><init>(Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;)V

    .line 48
    iput-object p2, p0, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;->productUsageType:Ljava/lang/String;

    .line 49
    iput-object p3, p0, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;->producerLine:Ljava/lang/String;

    .line 50
    return-void
.end method


# virtual methods
.method public getProducerLine()Ljava/lang/String;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;->producerLine:Ljava/lang/String;

    return-object v0
.end method

.method public getProductUsageType()Ljava/lang/String;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/itextpdf/commons/actions/confirmations/ConfirmedEventWrapper;->productUsageType:Ljava/lang/String;

    return-object v0
.end method
