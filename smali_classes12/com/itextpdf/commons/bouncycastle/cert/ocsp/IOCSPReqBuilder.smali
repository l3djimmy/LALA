.class public interface abstract Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPReqBuilder;
.super Ljava/lang/Object;
.source "IOCSPReqBuilder.java"


# virtual methods
.method public abstract addRequest(Lcom/itextpdf/commons/bouncycastle/cert/ocsp/ICertificateID;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPReqBuilder;
.end method

.method public abstract build()Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPReq;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/cert/ocsp/AbstractOCSPException;
        }
    .end annotation
.end method

.method public abstract setRequestExtensions(Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtensions;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPReqBuilder;
.end method
