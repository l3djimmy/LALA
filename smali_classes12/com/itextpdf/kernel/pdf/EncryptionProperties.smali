.class public Lcom/itextpdf/kernel/pdf/EncryptionProperties;
.super Ljava/lang/Object;
.source "EncryptionProperties.java"


# instance fields
.field protected encryptionAlgorithm:I

.field protected ownerPassword:[B

.field protected publicCertificates:[Ljava/security/cert/Certificate;

.field protected publicKeyEncryptPermissions:[I

.field protected standardEncryptPermissions:I

.field protected userPassword:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private clearEncryption()V
    .locals 1

    .line 148
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->publicCertificates:[Ljava/security/cert/Certificate;

    .line 149
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->publicKeyEncryptPermissions:[I

    .line 150
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->userPassword:[B

    .line 151
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->ownerPassword:[B

    .line 152
    return-void
.end method

.method private static randomBytes([B)V
    .locals 1
    .param p0, "bytes"    # [B

    .line 155
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v0, p0}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 156
    return-void
.end method


# virtual methods
.method isPublicKeyEncryptionUsed()Z
    .locals 1

    .line 144
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->publicCertificates:[Ljava/security/cert/Certificate;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method isStandardEncryptionUsed()Z
    .locals 1

    .line 140
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->ownerPassword:[B

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setPublicKeyEncryption([Ljava/security/cert/Certificate;[II)Lcom/itextpdf/kernel/pdf/EncryptionProperties;
    .locals 0
    .param p1, "certs"    # [Ljava/security/cert/Certificate;
    .param p2, "permissions"    # [I
    .param p3, "encryptionAlgorithm"    # I

    .line 131
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->clearEncryption()V

    .line 132
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->publicCertificates:[Ljava/security/cert/Certificate;

    .line 133
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->publicKeyEncryptPermissions:[I

    .line 134
    iput p3, p0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->encryptionAlgorithm:I

    .line 136
    return-object p0
.end method

.method public setStandardEncryption([B[BII)Lcom/itextpdf/kernel/pdf/EncryptionProperties;
    .locals 1
    .param p1, "userPassword"    # [B
    .param p2, "ownerPassword"    # [B
    .param p3, "permissions"    # I
    .param p4, "encryptionAlgorithm"    # I

    .line 81
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->clearEncryption()V

    .line 82
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->userPassword:[B

    .line 83
    if-eqz p2, :cond_0

    .line 84
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->ownerPassword:[B

    goto :goto_0

    .line 86
    :cond_0
    const/16 v0, 0x10

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->ownerPassword:[B

    .line 87
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->ownerPassword:[B

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->randomBytes([B)V

    .line 89
    :goto_0
    iput p3, p0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->standardEncryptPermissions:I

    .line 90
    iput p4, p0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->encryptionAlgorithm:I

    .line 92
    return-object p0
.end method
