.class public interface abstract Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPResp;
.super Ljava/lang/Object;
.source "IOCSPResp.java"


# virtual methods
.method public abstract getEncoded()[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getResponseObject()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/cert/ocsp/AbstractOCSPException;
        }
    .end annotation
.end method

.method public abstract getStatus()I
.end method

.method public abstract getSuccessful()I
.end method
