.class public interface abstract Lcom/itextpdf/commons/bouncycastle/cert/IX509v2CRLBuilder;
.super Ljava/lang/Object;
.source "IX509v2CRLBuilder.java"


# virtual methods
.method public abstract addCRLEntry(Ljava/math/BigInteger;Ljava/util/Date;I)Lcom/itextpdf/commons/bouncycastle/cert/IX509v2CRLBuilder;
.end method

.method public abstract addExtension(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;ZLcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/cert/IX509v2CRLBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract build(Lcom/itextpdf/commons/bouncycastle/operator/IContentSigner;)Lcom/itextpdf/commons/bouncycastle/cert/IX509CRLHolder;
.end method

.method public abstract setNextUpdate(Ljava/util/Date;)Lcom/itextpdf/commons/bouncycastle/cert/IX509v2CRLBuilder;
.end method
