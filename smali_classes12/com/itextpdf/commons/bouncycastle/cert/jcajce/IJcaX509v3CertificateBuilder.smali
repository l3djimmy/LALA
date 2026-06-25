.class public interface abstract Lcom/itextpdf/commons/bouncycastle/cert/jcajce/IJcaX509v3CertificateBuilder;
.super Ljava/lang/Object;
.source "IJcaX509v3CertificateBuilder.java"


# virtual methods
.method public abstract addExtension(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;ZLcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/cert/jcajce/IJcaX509v3CertificateBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/cert/AbstractCertIOException;
        }
    .end annotation
.end method

.method public abstract build(Lcom/itextpdf/commons/bouncycastle/operator/IContentSigner;)Lcom/itextpdf/commons/bouncycastle/cert/IX509CertificateHolder;
.end method
