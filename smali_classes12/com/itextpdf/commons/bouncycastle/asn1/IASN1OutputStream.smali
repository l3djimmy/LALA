.class public interface abstract Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OutputStream;
.super Ljava/lang/Object;
.source "IASN1OutputStream.java"

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

.method public abstract writeObject(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
