.class public interface abstract Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampRequest;
.super Ljava/lang/Object;
.source "ITimeStampRequest.java"


# virtual methods
.method public abstract getEncoded()[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getNonce()Ljava/math/BigInteger;
.end method
