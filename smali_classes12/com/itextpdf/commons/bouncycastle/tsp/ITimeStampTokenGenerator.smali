.class public interface abstract Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampTokenGenerator;
.super Ljava/lang/Object;
.source "ITimeStampTokenGenerator.java"


# virtual methods
.method public abstract addCertificates(Lcom/itextpdf/commons/bouncycastle/cert/jcajce/IJcaCertStore;)V
.end method

.method public abstract generate(Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampRequest;Ljava/math/BigInteger;Ljava/util/Date;)Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampToken;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/tsp/AbstractTSPException;
        }
    .end annotation
.end method

.method public abstract setAccuracySeconds(I)V
.end method
