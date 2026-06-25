.class public interface abstract Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IBasicOCSPResp;
.super Ljava/lang/Object;
.source "IBasicOCSPResp.java"


# virtual methods
.method public abstract getCerts()[Lcom/itextpdf/commons/bouncycastle/cert/IX509CertificateHolder;
.end method

.method public abstract getEncoded()[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getProducedAt()Ljava/util/Date;
.end method

.method public abstract getResponses()[Lcom/itextpdf/commons/bouncycastle/cert/ocsp/ISingleResp;
.end method

.method public abstract isSignatureValid(Lcom/itextpdf/commons/bouncycastle/operator/IContentVerifierProvider;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/cert/ocsp/AbstractOCSPException;
        }
    .end annotation
.end method
