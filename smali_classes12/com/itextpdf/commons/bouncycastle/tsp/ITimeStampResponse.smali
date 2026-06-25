.class public interface abstract Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampResponse;
.super Ljava/lang/Object;
.source "ITimeStampResponse.java"


# virtual methods
.method public abstract getEncoded()[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getFailInfo()Lcom/itextpdf/commons/bouncycastle/asn1/cmp/IPKIFailureInfo;
.end method

.method public abstract getStatusString()Ljava/lang/String;
.end method

.method public abstract getTimeStampToken()Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampToken;
.end method

.method public abstract validate(Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampRequest;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/tsp/AbstractTSPException;
        }
    .end annotation
.end method
