.class public Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;
.super Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard40;
.source "StandardHandlerUsingStandard128.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[BIZZ[B)V
    .locals 0
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "userPassword"    # [B
    .param p3, "ownerPassword"    # [B
    .param p4, "permissions"    # I
    .param p5, "encryptMetadata"    # Z
    .param p6, "embeddedFilesOnly"    # Z
    .param p7, "documentId"    # [B

    .line 35
    invoke-direct/range {p0 .. p7}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard40;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[BIZZ[B)V

    .line 36
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[BZ)V
    .locals 0
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "password"    # [B
    .param p3, "documentId"    # [B
    .param p4, "encryptMetadata"    # Z

    .line 39
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard40;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[BZ)V

    .line 40
    return-void
.end method


# virtual methods
.method protected calculatePermissions(I)V
    .locals 2
    .param p1, "permissions"    # I

    .line 44
    or-int/lit16 p1, p1, -0xf40

    .line 45
    and-int/lit8 p1, p1, -0x4

    .line 46
    int-to-long v0, p1

    iput-wide v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->permissions:J

    .line 47
    return-void
.end method

.method protected computeGlobalEncryptionKey([B[BZ)V
    .locals 7
    .param p1, "userPad"    # [B
    .param p2, "ownerKey"    # [B
    .param p3, "encryptMetadata"    # Z

    .line 71
    iget v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->keyLength:I

    const/16 v1, 0x8

    div-int/2addr v0, v1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->mkey:[B

    .line 74
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v0}, Ljava/security/MessageDigest;->reset()V

    .line 75
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->update([B)V

    .line 76
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v0, p2}, Ljava/security/MessageDigest;->update([B)V

    .line 78
    const/4 v0, 0x4

    new-array v2, v0, [B

    .line 79
    .local v2, "ext":[B
    iget-wide v3, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->permissions:J

    long-to-int v3, v3

    int-to-byte v3, v3

    const/4 v4, 0x0

    aput-byte v3, v2, v4

    .line 80
    iget-wide v5, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->permissions:J

    shr-long/2addr v5, v1

    long-to-int v1, v5

    int-to-byte v1, v1

    const/4 v3, 0x1

    aput-byte v1, v2, v3

    .line 81
    iget-wide v5, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->permissions:J

    const/16 v1, 0x10

    shr-long/2addr v5, v1

    long-to-int v1, v5

    int-to-byte v1, v1

    const/4 v3, 0x2

    aput-byte v1, v2, v3

    .line 82
    iget-wide v5, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->permissions:J

    const/16 v1, 0x18

    shr-long/2addr v5, v1

    long-to-int v1, v5

    int-to-byte v1, v1

    const/4 v3, 0x3

    aput-byte v1, v2, v3

    .line 83
    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v1, v2, v4, v0}, Ljava/security/MessageDigest;->update([BII)V

    .line 84
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->documentId:[B

    if-eqz v0, :cond_0

    .line 85
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->md5:Ljava/security/MessageDigest;

    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->documentId:[B

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 86
    :cond_0
    if-nez p3, :cond_1

    .line 87
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->md5:Ljava/security/MessageDigest;

    sget-object v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->metadataPad:[B

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 89
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->mkey:[B

    array-length v0, v0

    new-array v0, v0, [B

    .line 90
    .local v0, "digest":[B
    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    iget-object v3, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->mkey:[B

    array-length v3, v3

    invoke-static {v1, v4, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 92
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    const/16 v3, 0x32

    if-ge v1, v3, :cond_2

    .line 93
    iget-object v3, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v3, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v3

    iget-object v5, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->mkey:[B

    array-length v5, v5

    invoke-static {v3, v4, v0, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 92
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 96
    .end local v1    # "k":I
    :cond_2
    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->mkey:[B

    iget-object v3, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->mkey:[B

    array-length v3, v3

    invoke-static {v0, v4, v1, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 97
    return-void
.end method

.method protected computeOwnerKey([B[B)[B
    .locals 8
    .param p1, "userPad"    # [B
    .param p2, "ownerPad"    # [B

    .line 51
    const/16 v0, 0x20

    new-array v1, v0, [B

    .line 52
    .local v1, "ownerKey":[B
    iget-object v2, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v2, p2}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v2

    .line 53
    .local v2, "digest":[B
    iget v3, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->keyLength:I

    div-int/lit8 v3, v3, 0x8

    new-array v3, v3, [B

    .line 55
    .local v3, "mkey":[B
    const/4 v4, 0x0

    .local v4, "k":I
    :goto_0
    const/16 v5, 0x32

    const/4 v6, 0x0

    if-ge v4, v5, :cond_0

    .line 56
    iget-object v5, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->md5:Ljava/security/MessageDigest;

    array-length v7, v3

    invoke-virtual {v5, v2, v6, v7}, Ljava/security/MessageDigest;->update([BII)V

    .line 57
    iget-object v5, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v5}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v5

    array-length v7, v3

    invoke-static {v5, v6, v2, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 55
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 59
    .end local v4    # "k":I
    :cond_0
    invoke-static {p1, v6, v1, v6, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 60
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/16 v4, 0x14

    if-ge v0, v4, :cond_2

    .line 61
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_2
    array-length v5, v3

    if-ge v4, v5, :cond_1

    .line 62
    aget-byte v5, v2, v4

    xor-int/2addr v5, v0

    int-to-byte v5, v5

    aput-byte v5, v3, v4

    .line 61
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 63
    .end local v4    # "j":I
    :cond_1
    iget-object v4, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->arcfour:Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;

    invoke-virtual {v4, v3}, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->prepareARCFOURKey([B)V

    .line 64
    iget-object v4, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->arcfour:Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;

    invoke-virtual {v4, v1}, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->encryptARCFOUR([B)V

    .line 60
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 66
    .end local v0    # "i":I
    :cond_2
    return-object v1
.end method

.method protected computeUserKey()[B
    .locals 7

    .line 101
    const/16 v0, 0x20

    new-array v1, v0, [B

    .line 102
    .local v1, "userKey":[B
    iget-object v2, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->md5:Ljava/security/MessageDigest;

    sget-object v3, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->pad:[B

    invoke-virtual {v2, v3}, Ljava/security/MessageDigest;->update([B)V

    .line 103
    iget-object v2, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->md5:Ljava/security/MessageDigest;

    iget-object v3, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->documentId:[B

    invoke-virtual {v2, v3}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v2

    .line 104
    .local v2, "digest":[B
    const/4 v3, 0x0

    const/16 v4, 0x10

    invoke-static {v2, v3, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 105
    const/16 v5, 0x10

    .local v5, "k":I
    :goto_0
    if-ge v5, v0, :cond_0

    .line 106
    aput-byte v3, v1, v5

    .line 105
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 107
    .end local v5    # "k":I
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/16 v5, 0x14

    if-ge v0, v5, :cond_2

    .line 108
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_2
    iget-object v6, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->mkey:[B

    array-length v6, v6

    if-ge v5, v6, :cond_1

    .line 109
    iget-object v6, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->mkey:[B

    aget-byte v6, v6, v5

    xor-int/2addr v6, v0

    int-to-byte v6, v6

    aput-byte v6, v2, v5

    .line 108
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 110
    .end local v5    # "j":I
    :cond_1
    iget-object v5, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->arcfour:Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;

    iget-object v6, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->mkey:[B

    array-length v6, v6

    invoke-virtual {v5, v2, v3, v6}, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->prepareARCFOURKey([BII)V

    .line 111
    iget-object v5, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->arcfour:Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;

    invoke-virtual {v5, v1, v3, v4}, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->encryptARCFOUR([BII)V

    .line 107
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 113
    .end local v0    # "i":I
    :cond_2
    return-object v1
.end method

.method protected isValidPassword([B[B)Z
    .locals 1
    .param p1, "uValue"    # [B
    .param p2, "userKey"    # [B

    .line 146
    const/16 v0, 0x10

    invoke-static {p1, p2, v0}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->equalsArray([B[BI)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method protected setSpecificHandlerDicEntries(Lcom/itextpdf/kernel/pdf/PdfDictionary;ZZ)V
    .locals 4
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "encryptMetadata"    # Z
    .param p3, "embeddedFilesOnly"    # Z

    .line 118
    if-eqz p2, :cond_0

    .line 119
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 120
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_1

    .line 122
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->EncryptMetadata:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfBoolean;->FALSE:Lcom/itextpdf/kernel/pdf/PdfBoolean;

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 123
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 124
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 125
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 126
    .local v0, "stdcf":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Length:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/16 v3, 0x10

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 127
    if-eqz p3, :cond_1

    .line 128
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AuthEvent:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->EFOpen:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 129
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->EFF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->StdCF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 130
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->StrF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Identity:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 131
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->StmF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Identity:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 133
    :cond_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AuthEvent:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->DocOpen:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 134
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->StrF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->StdCF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 135
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->StmF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->StdCF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 137
    :goto_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CFM:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->V2:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 138
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 139
    .local v1, "cf":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->StdCF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 140
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->CF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 142
    .end local v0    # "stdcf":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v1    # "cf":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :goto_1
    return-void
.end method
