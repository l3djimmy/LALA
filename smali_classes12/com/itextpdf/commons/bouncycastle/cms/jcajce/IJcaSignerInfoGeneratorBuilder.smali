.class public interface abstract Lcom/itextpdf/commons/bouncycastle/cms/jcajce/IJcaSignerInfoGeneratorBuilder;
.super Ljava/lang/Object;
.source "IJcaSignerInfoGeneratorBuilder.java"


# virtual methods
.method public abstract build(Lcom/itextpdf/commons/bouncycastle/operator/IContentSigner;Ljava/security/cert/X509Certificate;)Lcom/itextpdf/commons/bouncycastle/cms/ISignerInfoGenerator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/operator/AbstractOperatorCreationException;,
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation
.end method
