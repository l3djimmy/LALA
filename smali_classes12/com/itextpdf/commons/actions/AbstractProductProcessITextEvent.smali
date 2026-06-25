.class public abstract Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;
.super Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;
.source "AbstractProductProcessITextEvent.java"


# instance fields
.field private final confirmationType:Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

.field private final sequenceId:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/itextpdf/commons/actions/sequence/SequenceId;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lcom/itextpdf/commons/actions/data/ProductData;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;)V
    .locals 1
    .param p1, "productData"    # Lcom/itextpdf/commons/actions/data/ProductData;
    .param p2, "metaInfo"    # Lcom/itextpdf/commons/actions/contexts/IMetaInfo;
    .param p3, "confirmationType"    # Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    .line 66
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;-><init>(Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/data/ProductData;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;)V

    .line 67
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/data/ProductData;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;)V
    .locals 1
    .param p1, "sequenceId"    # Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .param p2, "productData"    # Lcom/itextpdf/commons/actions/data/ProductData;
    .param p3, "metaInfo"    # Lcom/itextpdf/commons/actions/contexts/IMetaInfo;
    .param p4, "confirmationType"    # Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    .line 50
    invoke-direct {p0, p2, p3}, Lcom/itextpdf/commons/actions/AbstractContextBasedITextEvent;-><init>(Lcom/itextpdf/commons/actions/data/ProductData;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)V

    .line 52
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->sequenceId:Ljava/lang/ref/WeakReference;

    .line 53
    iput-object p4, p0, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->confirmationType:Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    .line 54
    return-void
.end method


# virtual methods
.method public getConfirmationType()Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->confirmationType:Lcom/itextpdf/commons/actions/confirmations/EventConfirmationType;

    return-object v0
.end method

.method public abstract getEventType()Ljava/lang/String;
.end method

.method public getSequenceId()Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/itextpdf/commons/actions/AbstractProductProcessITextEvent;->sequenceId:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/commons/actions/sequence/SequenceId;

    return-object v0
.end method
