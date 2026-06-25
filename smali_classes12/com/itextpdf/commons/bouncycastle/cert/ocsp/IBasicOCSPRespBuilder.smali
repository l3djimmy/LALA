.class public interface abstract Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IBasicOCSPRespBuilder;
.super Ljava/lang/Object;
.source "IBasicOCSPRespBuilder.java"


# virtual methods
.method public abstract addResponse(Lcom/itextpdf/commons/bouncycastle/cert/ocsp/ICertificateID;Lcom/itextpdf/commons/bouncycastle/cert/ocsp/ICertificateStatus;Ljava/util/Date;Ljava/util/Date;Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtensions;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IBasicOCSPRespBuilder;
.end method

.method public abstract build(Lcom/itextpdf/commons/bouncycastle/operator/IContentSigner;[Lcom/itextpdf/commons/bouncycastle/cert/IX509CertificateHolder;Ljava/util/Date;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IBasicOCSPResp;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/cert/ocsp/AbstractOCSPException;
        }
    .end annotation
.end method

.method public abstract setResponseExtensions(Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtensions;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IBasicOCSPRespBuilder;
.end method
