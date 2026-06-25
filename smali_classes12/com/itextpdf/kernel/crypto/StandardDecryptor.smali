.class public Lcom/itextpdf/kernel/crypto/StandardDecryptor;
.super Ljava/lang/Object;
.source "StandardDecryptor.java"

# interfaces
.implements Lcom/itextpdf/kernel/crypto/IDecryptor;


# instance fields
.field protected arcfour:Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;


# direct methods
.method public constructor <init>([BII)V
    .locals 1
    .param p1, "key"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;

    invoke-direct {v0}, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/crypto/StandardDecryptor;->arcfour:Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;

    .line 38
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/StandardDecryptor;->arcfour:Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;

    invoke-virtual {v0, p1, p2, p3}, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->prepareARCFOURKey([BII)V

    .line 39
    return-void
.end method


# virtual methods
.method public finish()[B
    .locals 1

    .line 48
    const/4 v0, 0x0

    return-object v0
.end method

.method public update([BII)[B
    .locals 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .line 42
    new-array v4, p3, [B

    .line 43
    .local v4, "b2":[B
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/StandardDecryptor;->arcfour:Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;

    const/4 v5, 0x0

    move-object v1, p1

    move v2, p2

    move v3, p3

    .end local p1    # "b":[B
    .end local p2    # "off":I
    .end local p3    # "len":I
    .local v1, "b":[B
    .local v2, "off":I
    .local v3, "len":I
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->encryptARCFOUR([BII[BI)V

    .line 44
    return-object v4
.end method
