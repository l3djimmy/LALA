.class public interface abstract Lcom/itextpdf/commons/bouncycastle/cert/ocsp/ISingleResp;
.super Ljava/lang/Object;
.source "ISingleResp.java"


# virtual methods
.method public abstract getCertID()Lcom/itextpdf/commons/bouncycastle/cert/ocsp/ICertificateID;
.end method

.method public abstract getCertStatus()Lcom/itextpdf/commons/bouncycastle/cert/ocsp/ICertificateStatus;
.end method

.method public abstract getNextUpdate()Ljava/util/Date;
.end method

.method public abstract getThisUpdate()Ljava/util/Date;
.end method
