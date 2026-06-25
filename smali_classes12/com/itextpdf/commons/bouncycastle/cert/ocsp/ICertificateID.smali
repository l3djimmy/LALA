.class public interface abstract Lcom/itextpdf/commons/bouncycastle/cert/ocsp/ICertificateID;
.super Ljava/lang/Object;
.source "ICertificateID.java"


# virtual methods
.method public abstract getHashAlgOID()Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;
.end method

.method public abstract getHashSha1()Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;
.end method

.method public abstract getSerialNumber()Ljava/math/BigInteger;
.end method

.method public abstract matchesIssuer(Lcom/itextpdf/commons/bouncycastle/cert/IX509CertificateHolder;Lcom/itextpdf/commons/bouncycastle/operator/IDigestCalculatorProvider;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/cert/ocsp/AbstractOCSPException;
        }
    .end annotation
.end method
