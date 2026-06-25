.class public interface abstract Lcom/itextpdf/commons/bouncycastle/asn1/x509/IIssuingDistributionPoint;
.super Ljava/lang/Object;
.source "IIssuingDistributionPoint.java"

# interfaces
.implements Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;


# virtual methods
.method public abstract getDistributionPoint()Lcom/itextpdf/commons/bouncycastle/asn1/x509/IDistributionPointName;
.end method

.method public abstract getOnlySomeReasons()Lcom/itextpdf/commons/bouncycastle/asn1/x509/IReasonFlags;
.end method

.method public abstract isIndirectCRL()Z
.end method

.method public abstract onlyContainsAttributeCerts()Z
.end method

.method public abstract onlyContainsCACerts()Z
.end method

.method public abstract onlyContainsUserCerts()Z
.end method
