.class public Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;
.super Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;
.source "StandardHandlerUsingAes128.java"


# static fields
.field private static final salt:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 36
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->salt:[B

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

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[BIZZ[B)V
    .locals 0
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "userPassword"    # [B
    .param p3, "ownerPassword"    # [B
    .param p4, "permissions"    # I
    .param p5, "encryptMetadata"    # Z
    .param p6, "embeddedFilesOnly"    # Z
    .param p7, "documentId"    # [B

    .line 41
    invoke-direct/range {p0 .. p7}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[BIZZ[B)V

    .line 42
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[BZ)V
    .locals 0
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "password"    # [B
    .param p3, "documentId"    # [B
    .param p4, "encryptMetadata"    # Z

    .line 45
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[BZ)V

    .line 46
    return-void
.end method


# virtual methods
.method public getDecryptor()Lcom/itextpdf/kernel/crypto/IDecryptor;
    .locals 4

    .line 55
    new-instance v0, Lcom/itextpdf/kernel/crypto/AesDecryptor;

    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->nextObjectKey:[B

    const/4 v2, 0x0

    iget v3, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->nextObjectKeySize:I

    invoke-direct {v0, v1, v2, v3}, Lcom/itextpdf/kernel/crypto/AesDecryptor;-><init>([BII)V

    return-object v0
.end method

.method public getEncryptionStream(Ljava/io/OutputStream;)Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;
    .locals 4
    .param p1, "os"    # Ljava/io/OutputStream;

    .line 50
    new-instance v0, Lcom/itextpdf/kernel/crypto/OutputStreamAesEncryption;

    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->nextObjectKey:[B

    const/4 v2, 0x0

    iget v3, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->nextObjectKeySize:I

    invoke-direct {v0, p1, v1, v2, v3}, Lcom/itextpdf/kernel/crypto/OutputStreamAesEncryption;-><init>(Ljava/io/OutputStream;[BII)V

    return-object v0
.end method

.method public setHashKeyForNextObject(II)V
    .locals 3
    .param p1, "objNumber"    # I
    .param p2, "objGeneration"    # I

    .line 61
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v0}, Ljava/security/MessageDigest;->reset()V

    .line 62
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->extra:[B

    const/4 v1, 0x0

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 63
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->extra:[B

    shr-int/lit8 v1, p1, 0x8

    int-to-byte v1, v1

    const/4 v2, 0x1

    aput-byte v1, v0, v2

    .line 64
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->extra:[B

    shr-int/lit8 v1, p1, 0x10

    int-to-byte v1, v1

    const/4 v2, 0x2

    aput-byte v1, v0, v2

    .line 65
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->extra:[B

    const/4 v1, 0x3

    int-to-byte v2, p2

    aput-byte v2, v0, v1

    .line 66
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->extra:[B

    shr-int/lit8 v1, p2, 0x8

    int-to-byte v1, v1

    const/4 v2, 0x4

    aput-byte v1, v0, v2

    .line 67
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->md5:Ljava/security/MessageDigest;

    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->mkey:[B

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 68
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->md5:Ljava/security/MessageDigest;

    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->extra:[B

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 69
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->md5:Ljava/security/MessageDigest;

    sget-object v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->salt:[B

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 70
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->nextObjectKey:[B

    .line 71
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->mkey:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x5

    iput v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->nextObjectKeySize:I

    .line 72
    iget v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->nextObjectKeySize:I

    const/16 v1, 0x10

    if-le v0, v1, :cond_0

    .line 73
    iput v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->nextObjectKeySize:I

    .line 74
    :cond_0
    return-void
.end method

.method protected setSpecificHandlerDicEntries(Lcom/itextpdf/kernel/pdf/PdfDictionary;ZZ)V
    .locals 4
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "encryptMetadata"    # Z
    .param p3, "embeddedFilesOnly"    # Z

    .line 78
    if-nez p2, :cond_0

    .line 79
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->EncryptMetadata:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfBoolean;->FALSE:Lcom/itextpdf/kernel/pdf/PdfBoolean;

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 81
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 82
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 83
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 84
    .local v0, "stdcf":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Length:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/16 v3, 0x10

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 85
    if-eqz p3, :cond_1

    .line 86
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AuthEvent:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->EFOpen:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 87
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->EFF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->StdCF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 88
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->StrF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Identity:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 89
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->StmF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Identity:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 91
    :cond_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AuthEvent:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->DocOpen:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 92
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->StrF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->StdCF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 93
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->StmF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->StdCF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 95
    :goto_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CFM:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->AESV2:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 96
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 97
    .local v1, "cf":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->StdCF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 98
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->CF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 99
    return-void
.end method
