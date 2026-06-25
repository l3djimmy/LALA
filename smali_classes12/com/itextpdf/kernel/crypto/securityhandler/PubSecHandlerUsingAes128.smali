.class public Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;
.super Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;
.source "PubSecHandlerUsingAes128.java"


# static fields
.field private static final salt:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 40
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->salt:[B

    return-void

    nop

    :array_0
    .array-data 1
        0x73t
        0x41t
        0x6ct
        0x54t
    .end array-data
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/security/Key;Ljava/security/cert/Certificate;Ljava/lang/String;Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;Z)V
    .locals 0
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "certificateKey"    # Ljava/security/Key;
    .param p3, "certificate"    # Ljava/security/cert/Certificate;
    .param p4, "certificateKeyProvider"    # Ljava/lang/String;
    .param p5, "externalDecryptionProcess"    # Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;
    .param p6, "encryptMetadata"    # Z

    .line 47
    invoke-direct {p0}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;-><init>()V

    .line 48
    invoke-virtual/range {p0 .. p6}, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->initKeyAndReadDictionary(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/security/Key;Ljava/security/cert/Certificate;Ljava/lang/String;Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;Z)V

    .line 50
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[Ljava/security/cert/Certificate;[IZZ)V
    .locals 0
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "certs"    # [Ljava/security/cert/Certificate;
    .param p3, "permissions"    # [I
    .param p4, "encryptMetadata"    # Z
    .param p5, "embeddedFilesOnly"    # Z

    .line 43
    invoke-direct {p0}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;-><init>()V

    .line 44
    invoke-virtual/range {p0 .. p5}, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->initKeyAndFillDictionary(Lcom/itextpdf/kernel/pdf/PdfDictionary;[Ljava/security/cert/Certificate;[IZZ)V

    .line 45
    return-void
.end method


# virtual methods
.method public getDecryptor()Lcom/itextpdf/kernel/crypto/IDecryptor;
    .locals 4

    .line 59
    new-instance v0, Lcom/itextpdf/kernel/crypto/AesDecryptor;

    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->nextObjectKey:[B

    const/4 v2, 0x0

    iget v3, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->nextObjectKeySize:I

    invoke-direct {v0, v1, v2, v3}, Lcom/itextpdf/kernel/crypto/AesDecryptor;-><init>([BII)V

    return-object v0
.end method

.method protected getDigestAlgorithm()Ljava/lang/String;
    .locals 1

    .line 81
    const-string v0, "SHA-1"

    return-object v0
.end method

.method public getEncryptionStream(Ljava/io/OutputStream;)Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;
    .locals 4
    .param p1, "os"    # Ljava/io/OutputStream;

    .line 54
    new-instance v0, Lcom/itextpdf/kernel/crypto/OutputStreamAesEncryption;

    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->nextObjectKey:[B

    const/4 v2, 0x0

    iget v3, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->nextObjectKeySize:I

    invoke-direct {v0, p1, v1, v2, v3}, Lcom/itextpdf/kernel/crypto/OutputStreamAesEncryption;-><init>(Ljava/io/OutputStream;[BII)V

    return-object v0
.end method

.method protected initKey([BI)V
    .locals 3
    .param p1, "globalKey"    # [B
    .param p2, "keyLength"    # I

    .line 85
    div-int/lit8 v0, p2, 0x8

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->mkey:[B

    .line 86
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->mkey:[B

    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->mkey:[B

    array-length v1, v1

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 87
    return-void
.end method

.method public setHashKeyForNextObject(II)V
    .locals 3
    .param p1, "objNumber"    # I
    .param p2, "objGeneration"    # I

    .line 65
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v0}, Ljava/security/MessageDigest;->reset()V

    .line 66
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->extra:[B

    const/4 v1, 0x0

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 67
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->extra:[B

    shr-int/lit8 v1, p1, 0x8

    int-to-byte v1, v1

    const/4 v2, 0x1

    aput-byte v1, v0, v2

    .line 68
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->extra:[B

    shr-int/lit8 v1, p1, 0x10

    int-to-byte v1, v1

    const/4 v2, 0x2

    aput-byte v1, v0, v2

    .line 69
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->extra:[B

    const/4 v1, 0x3

    int-to-byte v2, p2

    aput-byte v2, v0, v1

    .line 70
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->extra:[B

    shr-int/lit8 v1, p2, 0x8

    int-to-byte v1, v1

    const/4 v2, 0x4

    aput-byte v1, v0, v2

    .line 71
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->md5:Ljava/security/MessageDigest;

    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->mkey:[B

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 72
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->md5:Ljava/security/MessageDigest;

    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->extra:[B

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 73
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->md5:Ljava/security/MessageDigest;

    sget-object v1, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->salt:[B

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 74
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->nextObjectKey:[B

    .line 75
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->mkey:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x5

    iput v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->nextObjectKeySize:I

    .line 76
    iget v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->nextObjectKeySize:I

    const/16 v1, 0x10

    if-le v0, v1, :cond_0

    .line 77
    iput v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->nextObjectKeySize:I

    .line 78
    :cond_0
    return-void
.end method

.method protected setPubSecSpecificHandlerDicEntries(Lcom/itextpdf/kernel/pdf/PdfDictionary;ZZ)V
    .locals 5
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "encryptMetadata"    # Z
    .param p3, "embeddedFilesOnly"    # Z

    .line 91
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Adobe_PubSec:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 92
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->SubFilter:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Adbe_pkcs7_s5:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 94
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 95
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 97
    invoke-virtual {p0}, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;->createRecipientsArray()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 98
    .local v0, "recipients":Lcom/itextpdf/kernel/pdf/PdfArray;
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 99
    .local v1, "stdcf":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Recipients:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 100
    if-nez p2, :cond_0

    .line 101
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->EncryptMetadata:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfBoolean;->FALSE:Lcom/itextpdf/kernel/pdf/PdfBoolean;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 103
    :cond_0
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->CFM:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->AESV2:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 104
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Length:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/16 v4, 0x80

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 105
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 106
    .local v2, "cf":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->DefaultCryptFilter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 107
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->CF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 108
    if-eqz p3, :cond_1

    .line 109
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->EFF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->DefaultCryptFilter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 110
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->StrF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Identity:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 111
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->StmF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Identity:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 113
    :cond_1
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->StrF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->DefaultCryptFilter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 114
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->StmF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->DefaultCryptFilter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 116
    :goto_0
    return-void
.end method
