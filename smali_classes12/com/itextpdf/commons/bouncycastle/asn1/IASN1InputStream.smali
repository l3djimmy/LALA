.class public interface abstract Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;
.super Ljava/lang/Object;
.source "IASN1InputStream.java"

# interfaces
.implements Ljava/io/Closeable;


# virtual methods
.method public abstract close()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract readObject()Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
