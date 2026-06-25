.class public interface abstract Lcom/itextpdf/commons/bouncycastle/openssl/jcajce/IJcaPEMKeyConverter;
.super Ljava/lang/Object;
.source "IJcaPEMKeyConverter.java"


# virtual methods
.method public abstract getPrivateKey(Lcom/itextpdf/commons/bouncycastle/asn1/pkcs/IPrivateKeyInfo;)Ljava/security/PrivateKey;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/openssl/AbstractPEMException;
        }
    .end annotation
.end method

.method public abstract setProvider(Ljava/security/Provider;)Lcom/itextpdf/commons/bouncycastle/openssl/jcajce/IJcaPEMKeyConverter;
.end method
