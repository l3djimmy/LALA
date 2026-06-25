.class public interface abstract Lcom/itextpdf/commons/bouncycastle/asn1/pkcs/IRSASSAPSSParams;
.super Ljava/lang/Object;
.source "IRSASSAPSSParams.java"

# interfaces
.implements Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;


# virtual methods
.method public abstract getHashAlgorithm()Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;
.end method

.method public abstract getMaskGenAlgorithm()Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;
.end method

.method public abstract getSaltLength()Ljava/math/BigInteger;
.end method

.method public abstract getTrailerField()Ljava/math/BigInteger;
.end method
