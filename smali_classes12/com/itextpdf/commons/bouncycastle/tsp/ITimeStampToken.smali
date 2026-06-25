.class public interface abstract Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampToken;
.super Ljava/lang/Object;
.source "ITimeStampToken.java"


# virtual methods
.method public abstract getEncoded()[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getTimeStampInfo()Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampTokenInfo;
.end method

.method public abstract validate(Lcom/itextpdf/commons/bouncycastle/cms/ISignerInformationVerifier;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/tsp/AbstractTSPException;
        }
    .end annotation
.end method
