.class public interface abstract Lcom/itextpdf/commons/bouncycastle/cms/jcajce/IJcaSimpleSignerInfoVerifierBuilder;
.super Ljava/lang/Object;
.source "IJcaSimpleSignerInfoVerifierBuilder.java"


# virtual methods
.method public abstract build(Ljava/security/cert/X509Certificate;)Lcom/itextpdf/commons/bouncycastle/cms/ISignerInformationVerifier;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/operator/AbstractOperatorCreationException;
        }
    .end annotation
.end method

.method public abstract setProvider(Ljava/lang/String;)Lcom/itextpdf/commons/bouncycastle/cms/jcajce/IJcaSimpleSignerInfoVerifierBuilder;
.end method
