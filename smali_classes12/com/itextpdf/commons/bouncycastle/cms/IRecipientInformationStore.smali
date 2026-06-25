.class public interface abstract Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformationStore;
.super Ljava/lang/Object;
.source "IRecipientInformationStore.java"


# virtual methods
.method public abstract get(Lcom/itextpdf/commons/bouncycastle/cms/IRecipientId;)Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformation;
.end method

.method public abstract getRecipients()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformation;",
            ">;"
        }
    .end annotation
.end method
