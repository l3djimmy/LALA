.class public interface abstract Lcom/itextpdf/commons/bouncycastle/operator/jcajce/IJcaContentSignerBuilder;
.super Ljava/lang/Object;
.source "IJcaContentSignerBuilder.java"


# virtual methods
.method public abstract build(Ljava/security/PrivateKey;)Lcom/itextpdf/commons/bouncycastle/operator/IContentSigner;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/operator/AbstractOperatorCreationException;
        }
    .end annotation
.end method

.method public abstract setProvider(Ljava/lang/String;)Lcom/itextpdf/commons/bouncycastle/operator/jcajce/IJcaContentSignerBuilder;
.end method
