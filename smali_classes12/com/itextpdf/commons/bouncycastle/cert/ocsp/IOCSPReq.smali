.class public interface abstract Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPReq;
.super Ljava/lang/Object;
.source "IOCSPReq.java"


# virtual methods
.method public abstract getEncoded()[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getExtension(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtension;
.end method

.method public abstract getRequestList()[Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IReq;
.end method
