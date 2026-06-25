.class public interface abstract Lcom/itextpdf/commons/bouncycastle/cert/jcajce/IJcaX509CertificateConverter;
.super Ljava/lang/Object;
.source "IJcaX509CertificateConverter.java"


# virtual methods
.method public abstract getCertificate(Lcom/itextpdf/commons/bouncycastle/cert/IX509CertificateHolder;)Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation
.end method

.method public abstract setProvider(Ljava/security/Provider;)Lcom/itextpdf/commons/bouncycastle/cert/jcajce/IJcaX509CertificateConverter;
.end method
