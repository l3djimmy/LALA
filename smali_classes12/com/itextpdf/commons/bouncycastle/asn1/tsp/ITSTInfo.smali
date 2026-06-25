.class public interface abstract Lcom/itextpdf/commons/bouncycastle/asn1/tsp/ITSTInfo;
.super Ljava/lang/Object;
.source "ITSTInfo.java"

# interfaces
.implements Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;


# virtual methods
.method public abstract getGenTime()Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract getMessageImprint()Lcom/itextpdf/commons/bouncycastle/asn1/tsp/IMessageImprint;
.end method
