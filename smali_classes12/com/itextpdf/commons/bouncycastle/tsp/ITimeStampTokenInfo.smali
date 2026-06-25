.class public interface abstract Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampTokenInfo;
.super Ljava/lang/Object;
.source "ITimeStampTokenInfo.java"


# virtual methods
.method public abstract getEncoded()[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getGenTime()Ljava/util/Date;
.end method

.method public abstract getHashAlgorithm()Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;
.end method

.method public abstract toASN1Structure()Lcom/itextpdf/commons/bouncycastle/asn1/tsp/ITSTInfo;
.end method
