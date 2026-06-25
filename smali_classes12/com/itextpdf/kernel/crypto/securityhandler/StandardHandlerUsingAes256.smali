.class public Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;
.super Lcom/itextpdf/kernel/crypto/securityhandler/StandardSecurityHandler;
.source "StandardHandlerUsingAes256.java"


# static fields
.field private static final KEY_SALT_OFFSET:I = 0x28

.field private static final SALT_LENGTH:I = 0x8

.field private static final VALIDATION_SALT_OFFSET:I = 0x20


# instance fields
.field protected encryptMetadata:Z

.field private isPdf2:Z


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B)V
    .locals 0
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "password"    # [B

    .line 67
    invoke-direct {p0}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardSecurityHandler;-><init>()V

    .line 68
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->initKeyAndReadDictionary(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B)V

    .line 69
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[BIZZLcom/itextpdf/kernel/pdf/PdfVersion;)V
    .locals 1
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "userPassword"    # [B
    .param p3, "ownerPassword"    # [B
    .param p4, "permissions"    # I
    .param p5, "encryptMetadata"    # Z
    .param p6, "embeddedFilesOnly"    # Z
    .param p7, "version"    # Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 62
    invoke-direct {p0}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardSecurityHandler;-><init>()V

    .line 63
    if-eqz p7, :cond_0

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_2_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

    invoke-virtual {p7, v0}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->isPdf2:Z

    .line 64
    invoke-direct/range {p0 .. p6}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->initKeyAndFillDictionary(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[BIZZ)V

    .line 65
    return-void
.end method

.method private static compareArray([B[BI)Z
    .locals 3
    .param p0, "a"    # [B
    .param p1, "b"    # [B
    .param p2, "len"    # I

    .line 344
    const/4 v0, 0x0

    .local v0, "k":I
    :goto_0
    if-ge v0, p2, :cond_1

    .line 345
    aget-byte v1, p0, v0

    aget-byte v2, p1, v0

    if-eq v1, v2, :cond_0

    .line 346
    const/4 v1, 0x0

    return v1

    .line 344
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 349
    .end local v0    # "k":I
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method private computeHash([B[BII)[B
    .locals 6
    .param p1, "password"    # [B
    .param p2, "salt"    # [B
    .param p3, "saltOffset"    # I
    .param p4, "saltLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 265
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    .end local p1    # "password":[B
    .end local p2    # "salt":[B
    .end local p3    # "saltOffset":I
    .end local p4    # "saltLen":I
    .local v1, "password":[B
    .local v2, "salt":[B
    .local v3, "saltOffset":I
    .local v4, "saltLen":I
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->computeHash([B[BII[B)[B

    move-result-object p1

    return-object p1
.end method

.method private computeHash([B[BII[B)[B
    .locals 20
    .param p1, "password"    # [B
    .param p2, "salt"    # [B
    .param p3, "saltOffset"    # I
    .param p4, "saltLen"    # I
    .param p5, "userKey"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 269
    move-object/from16 v0, p1

    move-object/from16 v1, p5

    const-string v2, "SHA-256"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 271
    .local v2, "mdSha256":Ljava/security/MessageDigest;
    invoke-virtual {v2, v0}, Ljava/security/MessageDigest;->update([B)V

    .line 272
    move-object/from16 v3, p2

    move/from16 v4, p3

    move/from16 v5, p4

    invoke-virtual {v2, v3, v4, v5}, Ljava/security/MessageDigest;->update([BII)V

    .line 273
    if-eqz v1, :cond_0

    .line 274
    invoke-virtual {v2, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 276
    :cond_0
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v6

    .line 278
    .local v6, "k":[B
    move-object/from16 v7, p0

    iget-boolean v8, v7, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->isPdf2:Z

    if-eqz v8, :cond_7

    .line 281
    const-string v8, "SHA-384"

    invoke-static {v8}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v8

    .line 282
    .local v8, "mdSha384":Ljava/security/MessageDigest;
    const-string v9, "SHA-512"

    invoke-static {v9}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v9

    .line 284
    .local v9, "mdSha512":Ljava/security/MessageDigest;
    const/4 v10, 0x0

    if-eqz v1, :cond_1

    array-length v11, v1

    goto :goto_0

    :cond_1
    move v11, v10

    .line 285
    .local v11, "userKeyLen":I
    :goto_0
    array-length v12, v0

    add-int/2addr v12, v11

    .line 289
    .local v12, "passAndUserKeyLen":I
    const/4 v13, 0x0

    .line 292
    .local v13, "roundNum":I
    :goto_1
    array-length v14, v6

    add-int/2addr v14, v12

    .line 293
    .local v14, "k1RepLen":I
    mul-int/lit8 v15, v14, 0x40

    new-array v15, v15, [B

    .line 294
    .local v15, "k1":[B
    move-object/from16 v16, v2

    .end local v2    # "mdSha256":Ljava/security/MessageDigest;
    .local v16, "mdSha256":Ljava/security/MessageDigest;
    array-length v2, v0

    invoke-static {v0, v10, v15, v10, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 295
    array-length v2, v0

    array-length v3, v6

    invoke-static {v6, v10, v15, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 296
    if-eqz v1, :cond_2

    .line 297
    array-length v2, v0

    array-length v3, v6

    add-int/2addr v2, v3

    invoke-static {v1, v10, v15, v2, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 299
    :cond_2
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_2
    const/16 v3, 0x40

    if-ge v2, v3, :cond_3

    .line 300
    mul-int v3, v14, v2

    invoke-static {v15, v10, v15, v3, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 299
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 304
    .end local v2    # "i":I
    :cond_3
    new-instance v2, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;

    const/16 v3, 0x10

    invoke-static {v6, v3}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v10

    const/16 v0, 0x20

    invoke-static {v6, v3, v0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v1

    const/4 v0, 0x1

    invoke-direct {v2, v0, v10, v1}, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;-><init>(Z[B[B)V

    .line 305
    .local v2, "cipher":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    array-length v1, v15

    const/4 v10, 0x0

    invoke-virtual {v2, v15, v10, v1}, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;->processBlock([BII)[B

    move-result-object v1

    .line 308
    .local v1, "e":[B
    const/16 v17, 0x0

    .line 309
    .local v17, "md":Ljava/security/MessageDigest;
    new-instance v10, Ljava/math/BigInteger;

    invoke-static {v1, v3}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v3

    invoke-direct {v10, v0, v3}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 310
    .local v10, "i":Ljava/math/BigInteger;
    const-wide/16 v18, 0x3

    invoke-static/range {v18 .. v19}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v10, v3}, Ljava/math/BigInteger;->remainder(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/math/BigInteger;->intValue()I

    move-result v3

    .line 311
    .local v3, "remainder":I
    packed-switch v3, :pswitch_data_0

    move/from16 v18, v0

    move-object/from16 v0, v17

    goto :goto_3

    .line 319
    :pswitch_0
    move-object/from16 v17, v9

    move/from16 v18, v0

    move-object/from16 v0, v17

    goto :goto_3

    .line 316
    :pswitch_1
    move-object/from16 v17, v8

    .line 317
    move/from16 v18, v0

    move-object/from16 v0, v17

    goto :goto_3

    .line 313
    :pswitch_2
    move-object/from16 v17, v16

    .line 314
    move/from16 v18, v0

    move-object/from16 v0, v17

    .line 324
    .end local v17    # "md":Ljava/security/MessageDigest;
    .local v0, "md":Ljava/security/MessageDigest;
    :goto_3
    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v6

    .line 326
    add-int/lit8 v13, v13, 0x1

    .line 327
    move-object/from16 v17, v0

    .end local v0    # "md":Ljava/security/MessageDigest;
    .restart local v17    # "md":Ljava/security/MessageDigest;
    const/16 v0, 0x3f

    if-le v13, v0, :cond_5

    .line 330
    array-length v0, v1

    add-int/lit8 v0, v0, -0x1

    aget-byte v0, v1, v0

    and-int/lit16 v0, v0, 0xff

    .line 331
    .local v0, "condVal":I
    move-object/from16 v18, v1

    .end local v1    # "e":[B
    .local v18, "e":[B
    add-int/lit8 v1, v13, -0x20

    if-gt v0, v1, :cond_6

    .line 332
    nop

    .line 337
    .end local v0    # "condVal":I
    .end local v2    # "cipher":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    .end local v3    # "remainder":I
    .end local v10    # "i":Ljava/math/BigInteger;
    .end local v15    # "k1":[B
    .end local v17    # "md":Ljava/security/MessageDigest;
    .end local v18    # "e":[B
    array-length v0, v6

    const/16 v1, 0x20

    if-ne v0, v1, :cond_4

    move-object v0, v6

    goto :goto_4

    :cond_4
    invoke-static {v6, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v0

    :goto_4
    move-object v6, v0

    goto :goto_5

    .line 327
    .restart local v1    # "e":[B
    .restart local v2    # "cipher":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    .restart local v3    # "remainder":I
    .restart local v10    # "i":Ljava/math/BigInteger;
    .restart local v15    # "k1":[B
    .restart local v17    # "md":Ljava/security/MessageDigest;
    :cond_5
    move-object/from16 v18, v1

    .line 335
    .end local v1    # "e":[B
    .end local v2    # "cipher":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    .end local v3    # "remainder":I
    .end local v10    # "i":Ljava/math/BigInteger;
    .end local v15    # "k1":[B
    .end local v17    # "md":Ljava/security/MessageDigest;
    :cond_6
    move-object/from16 v0, p1

    move-object/from16 v3, p2

    move-object/from16 v1, p5

    move-object/from16 v2, v16

    const/4 v10, 0x0

    goto/16 :goto_1

    .line 278
    .end local v8    # "mdSha384":Ljava/security/MessageDigest;
    .end local v9    # "mdSha512":Ljava/security/MessageDigest;
    .end local v11    # "userKeyLen":I
    .end local v12    # "passAndUserKeyLen":I
    .end local v13    # "roundNum":I
    .end local v14    # "k1RepLen":I
    .end local v16    # "mdSha256":Ljava/security/MessageDigest;
    .local v2, "mdSha256":Ljava/security/MessageDigest;
    :cond_7
    move-object/from16 v16, v2

    .line 340
    .end local v2    # "mdSha256":Ljava/security/MessageDigest;
    .restart local v16    # "mdSha256":Ljava/security/MessageDigest;
    :goto_5
    return-object v6

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private initKeyAndFillDictionary(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[BIZZ)V
    .locals 18
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "userPassword"    # [B
    .param p3, "ownerPassword"    # [B
    .param p4, "permissions"    # I
    .param p5, "encryptMetadata"    # Z
    .param p6, "embeddedFilesOnly"    # Z

    .line 92
    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move/from16 v7, p5

    move-object/from16 v0, p3

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->generateOwnerPasswordIfNullOrEmpty([B)[B

    move-result-object v3

    .line 93
    .end local p3    # "ownerPassword":[B
    .local v3, "ownerPassword":[B
    move/from16 v0, p4

    or-int/lit16 v0, v0, -0xf40

    .line 94
    .end local p4    # "permissions":I
    .local v0, "permissions":I
    and-int/lit8 v8, v0, -0x4

    .line 104
    .end local v0    # "permissions":I
    .local v8, "permissions":I
    const/16 v0, 0x7f

    const/4 v9, 0x0

    if-nez v2, :cond_0

    .line 105
    :try_start_0
    new-array v4, v9, [B

    move-object v10, v4

    .end local p2    # "userPassword":[B
    .local v4, "userPassword":[B
    goto :goto_0

    .line 106
    .end local v4    # "userPassword":[B
    .restart local p2    # "userPassword":[B
    :cond_0
    array-length v4, v2

    if-le v4, v0, :cond_1

    .line 107
    invoke-static {v2, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    move-object v10, v4

    .end local p2    # "userPassword":[B
    .restart local v4    # "userPassword":[B
    goto :goto_0

    .line 106
    .end local v4    # "userPassword":[B
    .restart local p2    # "userPassword":[B
    :cond_1
    move-object v10, v2

    .line 109
    .end local p2    # "userPassword":[B
    .local v10, "userPassword":[B
    :goto_0
    :try_start_1
    array-length v2, v3

    if-le v2, v0, :cond_2

    .line 110
    invoke-static {v3, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    move-object v3, v0

    move-object v2, v3

    goto :goto_1

    .line 109
    :cond_2
    move-object v2, v3

    .line 114
    .end local v3    # "ownerPassword":[B
    .local v2, "ownerPassword":[B
    :goto_1
    const/16 v0, 0x10

    :try_start_2
    invoke-static {v0}, Lcom/itextpdf/kernel/crypto/IVGenerator;->getIV(I)[B

    move-result-object v3

    move-object v11, v3

    .line 115
    .local v11, "userValAndKeySalt":[B
    invoke-static {v0}, Lcom/itextpdf/kernel/crypto/IVGenerator;->getIV(I)[B

    move-result-object v3

    .line 117
    .local v3, "ownerValAndKeySalt":[B
    const/16 v12, 0x20

    invoke-static {v12}, Lcom/itextpdf/kernel/crypto/IVGenerator;->getIV(I)[B

    move-result-object v4

    iput-object v4, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->nextObjectKey:[B

    .line 118
    iput v12, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->nextObjectKeySize:I

    .line 123
    const/16 v13, 0x8

    invoke-direct {v1, v10, v11, v9, v13}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->computeHash([B[BII)[B

    move-result-object v4

    .line 124
    .local v4, "hash":[B
    const/16 v14, 0x30

    invoke-static {v4, v14}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v6

    .line 125
    .local v6, "userKey":[B
    invoke-static {v11, v9, v6, v12, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 128
    invoke-direct {v1, v10, v11, v13, v13}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->computeHash([B[BII)[B

    move-result-object v5

    move-object v15, v5

    .line 129
    .end local v4    # "hash":[B
    .local v15, "hash":[B
    new-instance v4, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;

    const/4 v5, 0x1

    invoke-direct {v4, v5, v15}, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;-><init>(Z[B)V

    .line 130
    .local v4, "ac":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    iget-object v5, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->nextObjectKey:[B

    move/from16 p3, v13

    iget-object v13, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->nextObjectKey:[B

    array-length v13, v13

    invoke-virtual {v4, v5, v9, v13}, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;->processBlock([BII)[B

    move-result-object v5

    move-object v13, v5

    .line 134
    .local v13, "ueKey":[B
    move-object v5, v4

    .end local v4    # "ac":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    .local v5, "ac":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    const/4 v4, 0x0

    move-object/from16 v16, v5

    .end local v5    # "ac":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    .local v16, "ac":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    const/16 v5, 0x8

    invoke-direct/range {v1 .. v6}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->computeHash([B[BII[B)[B

    move-result-object v4

    move-object v15, v4

    .line 135
    invoke-static {v15, v14}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v1

    move-object v14, v1

    .line 136
    .local v14, "ownerKey":[B
    invoke-static {v3, v9, v14, v12, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 139
    const/16 v4, 0x8

    const/16 v5, 0x8

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->computeHash([B[BII[B)[B

    move-result-object v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-object v12, v2

    move-object/from16 v17, v3

    move-object v2, v6

    .end local v3    # "ownerValAndKeySalt":[B
    .end local v6    # "userKey":[B
    .local v2, "userKey":[B
    .local v12, "ownerPassword":[B
    .local v17, "ownerValAndKeySalt":[B
    move-object v15, v4

    .line 140
    :try_start_3
    new-instance v3, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;

    const/4 v4, 0x1

    invoke-direct {v3, v4, v15}, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;-><init>(Z[B)V

    .line 141
    .end local v16    # "ac":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    .local v3, "ac":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    iget-object v5, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->nextObjectKey:[B

    iget-object v6, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->nextObjectKey:[B

    array-length v6, v6

    invoke-virtual {v3, v5, v9, v6}, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;->processBlock([BII)[B

    move-result-object v5

    .line 145
    .local v5, "oeKey":[B
    invoke-static {v0}, Lcom/itextpdf/kernel/crypto/IVGenerator;->getIV(I)[B

    move-result-object v0

    .line 146
    .local v0, "permsp":[B
    int-to-byte v6, v8

    aput-byte v6, v0, v9

    .line 147
    shr-int/lit8 v6, v8, 0x8

    int-to-byte v6, v6

    aput-byte v6, v0, v4

    .line 148
    shr-int/lit8 v6, v8, 0x10

    int-to-byte v6, v6

    const/16 v16, 0x2

    aput-byte v6, v0, v16

    .line 149
    shr-int/lit8 v6, v8, 0x18

    int-to-byte v6, v6

    const/16 v16, 0x3

    aput-byte v6, v0, v16

    .line 150
    const/4 v6, 0x4

    const/16 v16, -0x1

    aput-byte v16, v0, v6

    .line 151
    const/4 v6, 0x5

    aput-byte v16, v0, v6

    .line 152
    const/4 v6, 0x6

    aput-byte v16, v0, v6

    .line 153
    const/4 v6, 0x7

    aput-byte v16, v0, v6

    .line 154
    if-eqz v7, :cond_3

    const/16 v6, 0x54

    goto :goto_2

    :cond_3
    const/16 v6, 0x46

    :goto_2
    aput-byte v6, v0, p3

    .line 155
    const/16 v6, 0x9

    const/16 v16, 0x61

    aput-byte v16, v0, v6

    .line 156
    const/16 v6, 0xa

    const/16 v16, 0x64

    aput-byte v16, v0, v6

    .line 157
    const/16 v6, 0xb

    const/16 v16, 0x62

    aput-byte v16, v0, v6

    .line 158
    new-instance v6, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;

    iget-object v9, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->nextObjectKey:[B

    invoke-direct {v6, v4, v9}, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;-><init>(Z[B)V

    move-object v9, v6

    .line 159
    .end local v3    # "ac":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    .local v9, "ac":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    array-length v3, v0

    const/4 v4, 0x0

    invoke-virtual {v9, v0, v4, v3}, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;->processBlock([BII)[B

    move-result-object v3

    .line 161
    .local v3, "aes256Perms":[B
    move-object/from16 p2, v3

    .end local v3    # "aes256Perms":[B
    .local p2, "aes256Perms":[B
    int-to-long v3, v8

    iput-wide v3, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->permissions:J

    .line 162
    iput-boolean v7, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->encryptMetadata:Z

    .line 163
    move-object/from16 v3, p1

    invoke-virtual {v1, v3, v2, v14}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->setStandardHandlerDicEntries(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[B)V

    .line 164
    move v6, v7

    move-object v4, v13

    move/from16 v7, p6

    move-object v13, v2

    move-object v2, v3

    move-object v3, v5

    move-object/from16 v5, p2

    .end local v2    # "userKey":[B
    .end local p2    # "aes256Perms":[B
    .local v3, "oeKey":[B
    .local v4, "ueKey":[B
    .local v5, "aes256Perms":[B
    .local v13, "userKey":[B
    invoke-direct/range {v1 .. v7}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->setAES256DicEntries(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[B[BZZ)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 167
    .end local v0    # "permsp":[B
    .end local v3    # "oeKey":[B
    .end local v4    # "ueKey":[B
    .end local v5    # "aes256Perms":[B
    .end local v9    # "ac":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    .end local v11    # "userValAndKeySalt":[B
    .end local v13    # "userKey":[B
    .end local v14    # "ownerKey":[B
    .end local v15    # "hash":[B
    .end local v17    # "ownerValAndKeySalt":[B
    nop

    .line 168
    return-void

    .line 165
    :catch_0
    move-exception v0

    move-object v3, v12

    goto :goto_3

    .end local v12    # "ownerPassword":[B
    .local v2, "ownerPassword":[B
    :catch_1
    move-exception v0

    move-object v12, v2

    move-object v3, v12

    .end local v2    # "ownerPassword":[B
    .restart local v12    # "ownerPassword":[B
    goto :goto_3

    .end local v12    # "ownerPassword":[B
    .local v3, "ownerPassword":[B
    :catch_2
    move-exception v0

    goto :goto_3

    .end local v10    # "userPassword":[B
    .local p2, "userPassword":[B
    :catch_3
    move-exception v0

    move-object v10, v2

    .line 166
    .end local p2    # "userPassword":[B
    .local v0, "ex":Ljava/lang/Exception;
    .restart local v10    # "userPassword":[B
    :goto_3
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "PdfEncryption exception."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private initKeyAndReadDictionary(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B)V
    .locals 19
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "password"    # [B

    .line 203
    move-object/from16 v1, p0

    move-object/from16 v7, p1

    move-object/from16 v2, p2

    const/4 v0, 0x0

    if-nez v2, :cond_0

    .line 204
    :try_start_0
    new-array v3, v0, [B

    move-object v2, v3

    .end local p2    # "password":[B
    .local v3, "password":[B
    goto :goto_0

    .line 205
    .end local v3    # "password":[B
    .restart local p2    # "password":[B
    :cond_0
    array-length v3, v2

    const/16 v4, 0x7f

    if-le v3, v4, :cond_1

    .line 206
    invoke-static {v2, v4}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v3
    :try_end_0
    .catch Lcom/itextpdf/kernel/exceptions/BadPasswordException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_6

    move-object v2, v3

    .line 209
    .end local p2    # "password":[B
    .local v2, "password":[B
    :cond_1
    :goto_0
    :try_start_1
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;->getValue()D

    move-result-wide v3

    const-wide/high16 v5, 0x4018000000000000L    # 6.0

    cmpl-double v3, v3, v5

    if-nez v3, :cond_2

    const/4 v3, 0x1

    goto :goto_1

    :cond_2
    move v3, v0

    :goto_1
    iput-boolean v3, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->isPdf2:Z

    .line 213
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->O:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->getIsoBytes(Lcom/itextpdf/kernel/pdf/PdfString;)[B

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->truncateArray([B)[B

    move-result-object v3

    .line 214
    .local v3, "oValue":[B
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->U:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->getIsoBytes(Lcom/itextpdf/kernel/pdf/PdfString;)[B

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->truncateArray([B)[B

    move-result-object v6

    .line 215
    .local v6, "uValue":[B
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->OE:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->getIsoBytes(Lcom/itextpdf/kernel/pdf/PdfString;)[B

    move-result-object v4

    move-object v9, v4

    .line 216
    .local v9, "oeValue":[B
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->UE:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->getIsoBytes(Lcom/itextpdf/kernel/pdf/PdfString;)[B

    move-result-object v4

    move-object v10, v4

    .line 217
    .local v10, "ueValue":[B
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Perms:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->getIsoBytes(Lcom/itextpdf/kernel/pdf/PdfString;)[B

    move-result-object v4

    move-object v11, v4

    .line 218
    .local v11, "perms":[B
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-object v12, v4

    .line 220
    .local v12, "pValue":Lcom/itextpdf/kernel/pdf/PdfNumber;
    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/PdfNumber;->longValue()J

    move-result-wide v4

    iput-wide v4, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->permissions:J

    .line 224
    const/16 v4, 0x20

    const/16 v5, 0x8

    invoke-direct/range {v1 .. v6}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->computeHash([B[BII[B)[B

    move-result-object v4

    move-object v13, v4

    .line 225
    .local v13, "hash":[B
    const/16 v14, 0x20

    invoke-static {v13, v3, v14}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->compareArray([B[BI)Z

    move-result v4

    iput-boolean v4, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->usedOwnerPassword:Z

    .line 227
    iget-boolean v4, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->usedOwnerPassword:Z
    :try_end_1
    .catch Lcom/itextpdf/kernel/exceptions/BadPasswordException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4

    const-string v15, "Bad user password. Password is not provided or wrong password provided. Correct password should be passed to PdfReader constructor with properties. See ReaderProperties#setPassword() method."

    const/16 v5, 0x8

    if-eqz v4, :cond_3

    .line 228
    const/16 v4, 0x28

    move/from16 v16, v5

    const/16 v5, 0x8

    move/from16 v8, v16

    const/16 p2, 0x1

    :try_start_2
    invoke-direct/range {v1 .. v6}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->computeHash([B[BII[B)[B

    move-result-object v4

    .line 229
    .end local v13    # "hash":[B
    .local v4, "hash":[B
    new-instance v5, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;

    invoke-direct {v5, v0, v4}, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;-><init>(Z[B)V

    .line 230
    .local v5, "ac":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    array-length v13, v9

    invoke-virtual {v5, v9, v0, v13}, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;->processBlock([BII)[B

    move-result-object v13

    iput-object v13, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->nextObjectKey:[B
    :try_end_2
    .catch Lcom/itextpdf/kernel/exceptions/BadPasswordException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 231
    .end local v5    # "ac":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    goto :goto_2

    .line 259
    .end local v3    # "oValue":[B
    .end local v4    # "hash":[B
    .end local v6    # "uValue":[B
    .end local v9    # "oeValue":[B
    .end local v10    # "ueValue":[B
    .end local v11    # "perms":[B
    .end local v12    # "pValue":Lcom/itextpdf/kernel/pdf/PdfNumber;
    :catch_0
    move-exception v0

    move-object/from16 v16, v2

    goto/16 :goto_3

    .line 257
    :catch_1
    move-exception v0

    move-object/from16 v16, v2

    goto/16 :goto_4

    .line 232
    .restart local v3    # "oValue":[B
    .restart local v6    # "uValue":[B
    .restart local v9    # "oeValue":[B
    .restart local v10    # "ueValue":[B
    .restart local v11    # "perms":[B
    .restart local v12    # "pValue":Lcom/itextpdf/kernel/pdf/PdfNumber;
    .restart local v13    # "hash":[B
    :cond_3
    move v8, v5

    const/16 p2, 0x1

    :try_start_3
    invoke-direct {v1, v2, v6, v14, v8}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->computeHash([B[BII)[B

    move-result-object v4

    .line 233
    .end local v13    # "hash":[B
    .restart local v4    # "hash":[B
    invoke-static {v4, v6, v14}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->compareArray([B[BI)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 236
    const/16 v5, 0x28

    invoke-direct {v1, v2, v6, v5, v8}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->computeHash([B[BII)[B

    move-result-object v5

    move-object v4, v5

    .line 237
    new-instance v5, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;

    invoke-direct {v5, v0, v4}, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;-><init>(Z[B)V

    .line 238
    .restart local v5    # "ac":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    array-length v13, v10

    invoke-virtual {v5, v10, v0, v13}, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;->processBlock([BII)[B

    move-result-object v13

    iput-object v13, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->nextObjectKey:[B

    .line 240
    .end local v5    # "ac":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    :goto_2
    iput v14, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->nextObjectKeySize:I

    .line 242
    new-instance v5, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;

    iget-object v13, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->nextObjectKey:[B

    invoke-direct {v5, v0, v13}, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;-><init>(Z[B)V

    .line 243
    .restart local v5    # "ac":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    array-length v13, v11

    invoke-virtual {v5, v11, v0, v13}, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;->processBlock([BII)[B

    move-result-object v13

    .line 244
    .local v13, "decPerms":[B
    const/16 v14, 0x9

    aget-byte v14, v13, v14

    move/from16 v16, v0

    const/16 v0, 0x61

    if-ne v14, v0, :cond_7

    const/16 v0, 0xa

    aget-byte v0, v13, v0

    const/16 v14, 0x64

    if-ne v0, v14, :cond_7

    const/16 v0, 0xb

    aget-byte v0, v13, v0

    const/16 v14, 0x62

    if-ne v0, v14, :cond_7

    .line 246
    aget-byte v0, v13, v16

    and-int/lit16 v0, v0, 0xff

    aget-byte v14, v13, p2

    and-int/lit16 v14, v14, 0xff

    shl-int/2addr v14, v8

    or-int/2addr v0, v14

    const/4 v14, 0x2

    aget-byte v14, v13, v14

    and-int/lit16 v14, v14, 0xff

    shl-int/lit8 v14, v14, 0x10

    or-int/2addr v0, v14

    const/4 v14, 0x3

    aget-byte v14, v13, v14

    and-int/lit16 v14, v14, 0xff

    shl-int/lit8 v14, v14, 0x18

    or-int/2addr v0, v14

    .line 248
    .local v0, "permissionsDecoded":I
    aget-byte v8, v13, v8

    const/16 v14, 0x54

    if-ne v8, v14, :cond_4

    move/from16 v16, p2

    :cond_4
    move/from16 v8, v16

    .line 250
    .local v8, "encryptMetadata":Z
    sget-object v14, Lcom/itextpdf/kernel/pdf/PdfName;->EncryptMetadata:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v14}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBool(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Boolean;

    move-result-object v14
    :try_end_3
    .catch Lcom/itextpdf/kernel/exceptions/BadPasswordException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    .line 251
    .local v14, "encryptMetadataEntry":Ljava/lang/Boolean;
    move-object/from16 v16, v2

    move-object/from16 p2, v3

    .end local v2    # "password":[B
    .end local v3    # "oValue":[B
    .local v16, "password":[B
    .local p2, "oValue":[B
    int-to-long v2, v0

    move-wide/from16 v17, v2

    :try_start_4
    iget-wide v2, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->permissions:J

    cmp-long v2, v17, v2

    if-nez v2, :cond_5

    if-eqz v14, :cond_6

    invoke-virtual {v14}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eq v8, v2, :cond_6

    .line 252
    :cond_5
    const-class v2, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;

    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 253
    .local v2, "logger":Lorg/slf4j/Logger;
    const-string v3, "Encryption dictionary entries P and EncryptMetadata have value that does not correspond to encrypted values in Perms key."

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 255
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :cond_6
    int-to-long v2, v0

    iput-wide v2, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->permissions:J

    .line 256
    iput-boolean v8, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->encryptMetadata:Z

    .line 261
    .end local v0    # "permissionsDecoded":I
    .end local v4    # "hash":[B
    .end local v5    # "ac":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    .end local v6    # "uValue":[B
    .end local v8    # "encryptMetadata":Z
    .end local v9    # "oeValue":[B
    .end local v10    # "ueValue":[B
    .end local v11    # "perms":[B
    .end local v12    # "pValue":Lcom/itextpdf/kernel/pdf/PdfNumber;
    .end local v13    # "decPerms":[B
    .end local v14    # "encryptMetadataEntry":Ljava/lang/Boolean;
    .end local p2    # "oValue":[B
    nop

    .line 262
    return-void

    .line 244
    .end local v16    # "password":[B
    .local v2, "password":[B
    .restart local v3    # "oValue":[B
    .restart local v4    # "hash":[B
    .restart local v5    # "ac":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    .restart local v6    # "uValue":[B
    .restart local v9    # "oeValue":[B
    .restart local v10    # "ueValue":[B
    .restart local v11    # "perms":[B
    .restart local v12    # "pValue":Lcom/itextpdf/kernel/pdf/PdfNumber;
    .restart local v13    # "decPerms":[B
    :cond_7
    move-object/from16 v16, v2

    move-object/from16 p2, v3

    .line 245
    .end local v2    # "password":[B
    .end local v3    # "oValue":[B
    .restart local v16    # "password":[B
    .restart local p2    # "oValue":[B
    new-instance v0, Lcom/itextpdf/kernel/exceptions/BadPasswordException;

    invoke-direct {v0, v15}, Lcom/itextpdf/kernel/exceptions/BadPasswordException;-><init>(Ljava/lang/String;)V

    .end local v16    # "password":[B
    .end local p1    # "encryptionDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    throw v0

    .line 234
    .end local v5    # "ac":Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
    .end local v13    # "decPerms":[B
    .end local p2    # "oValue":[B
    .restart local v2    # "password":[B
    .restart local v3    # "oValue":[B
    .restart local p1    # "encryptionDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_8
    move-object/from16 v16, v2

    move-object/from16 p2, v3

    .end local v2    # "password":[B
    .end local v3    # "oValue":[B
    .restart local v16    # "password":[B
    .restart local p2    # "oValue":[B
    new-instance v0, Lcom/itextpdf/kernel/exceptions/BadPasswordException;

    invoke-direct {v0, v15}, Lcom/itextpdf/kernel/exceptions/BadPasswordException;-><init>(Ljava/lang/String;)V

    .end local v16    # "password":[B
    .end local p1    # "encryptionDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    throw v0
    :try_end_4
    .catch Lcom/itextpdf/kernel/exceptions/BadPasswordException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 259
    .end local v4    # "hash":[B
    .end local v6    # "uValue":[B
    .end local v9    # "oeValue":[B
    .end local v10    # "ueValue":[B
    .end local v11    # "perms":[B
    .end local v12    # "pValue":Lcom/itextpdf/kernel/pdf/PdfNumber;
    .end local p2    # "oValue":[B
    .restart local v16    # "password":[B
    .restart local p1    # "encryptionDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :catch_2
    move-exception v0

    goto :goto_3

    .line 257
    :catch_3
    move-exception v0

    goto :goto_4

    .line 259
    .end local v16    # "password":[B
    .restart local v2    # "password":[B
    :catch_4
    move-exception v0

    move-object/from16 v16, v2

    .end local v2    # "password":[B
    .restart local v16    # "password":[B
    goto :goto_3

    .line 257
    .end local v16    # "password":[B
    .restart local v2    # "password":[B
    :catch_5
    move-exception v0

    move-object/from16 v16, v2

    .end local v2    # "password":[B
    .restart local v16    # "password":[B
    goto :goto_4

    .line 259
    .end local v16    # "password":[B
    .local p2, "password":[B
    :catch_6
    move-exception v0

    move-object/from16 v16, v2

    .line 260
    .end local p2    # "password":[B
    .local v0, "ex":Ljava/lang/Exception;
    .restart local v16    # "password":[B
    :goto_3
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v3, "PdfEncryption exception."

    invoke-direct {v2, v3, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 257
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v16    # "password":[B
    .restart local p2    # "password":[B
    :catch_7
    move-exception v0

    move-object/from16 v16, v2

    .line 258
    .end local p2    # "password":[B
    .local v0, "ex":Lcom/itextpdf/kernel/exceptions/BadPasswordException;
    .restart local v16    # "password":[B
    :goto_4
    throw v0
.end method

.method private setAES256DicEntries(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[B[BZZ)V
    .locals 7
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "oeKey"    # [B
    .param p3, "ueKey"    # [B
    .param p4, "aes256Perms"    # [B
    .param p5, "encryptMetadata"    # Z
    .param p6, "embeddedFilesOnly"    # Z

    .line 172
    const/4 v0, 0x5

    .line 173
    .local v0, "vAes256":I
    const/4 v1, 0x5

    .line 174
    .local v1, "rAes256":I
    const/4 v2, 0x6

    .line 175
    .local v2, "rAes256Pdf2":I
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->OE:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfLiteral;

    invoke-static {p2}, Lcom/itextpdf/io/util/StreamUtil;->createEscapedString([B)[B

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfLiteral;-><init>([B)V

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 176
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->UE:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfLiteral;

    invoke-static {p3}, Lcom/itextpdf/io/util/StreamUtil;->createEscapedString([B)[B

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfLiteral;-><init>([B)V

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 177
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Perms:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfLiteral;

    invoke-static {p4}, Lcom/itextpdf/io/util/StreamUtil;->createEscapedString([B)[B

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfLiteral;-><init>([B)V

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 178
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    iget-boolean v5, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->isPdf2:Z

    if-eqz v5, :cond_0

    move v5, v2

    goto :goto_0

    :cond_0
    move v5, v1

    :goto_0
    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 179
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v4, v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 180
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 181
    .local v3, "stdcf":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Length:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/16 v6, 0x20

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 182
    if-nez p5, :cond_1

    .line 183
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->EncryptMetadata:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfBoolean;->FALSE:Lcom/itextpdf/kernel/pdf/PdfBoolean;

    invoke-virtual {p1, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 185
    :cond_1
    if-eqz p6, :cond_2

    .line 186
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->AuthEvent:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->EFOpen:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 187
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->EFF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->StdCF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 188
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->StrF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Identity:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 189
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->StmF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Identity:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_1

    .line 191
    :cond_2
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->AuthEvent:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->DocOpen:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 192
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->StrF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->StdCF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 193
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->StmF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->StdCF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 195
    :goto_1
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->CFM:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->AESV3:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 196
    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 197
    .local v4, "cf":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->StdCF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v5, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 198
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->CF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v5, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 199
    return-void
.end method

.method private truncateArray([B)[B
    .locals 3
    .param p1, "array"    # [B

    .line 353
    array-length v0, p1

    const/16 v1, 0x30

    if-ne v0, v1, :cond_0

    .line 354
    return-object p1

    .line 356
    :cond_0
    const/16 v0, 0x30

    .local v0, "i":I
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_2

    .line 357
    aget-byte v2, p1, v0

    if-nez v2, :cond_1

    .line 356
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 358
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Password hash exceeds 48 bytes and extra bytes are not 0"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 361
    .end local v0    # "i":I
    :cond_2
    new-array v0, v1, [B

    .line 362
    .local v0, "truncated":[B
    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 363
    return-object v0
.end method


# virtual methods
.method public getDecryptor()Lcom/itextpdf/kernel/crypto/IDecryptor;
    .locals 4

    .line 87
    new-instance v0, Lcom/itextpdf/kernel/crypto/AesDecryptor;

    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->nextObjectKey:[B

    const/4 v2, 0x0

    iget v3, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->nextObjectKeySize:I

    invoke-direct {v0, v1, v2, v3}, Lcom/itextpdf/kernel/crypto/AesDecryptor;-><init>([BII)V

    return-object v0
.end method

.method public getEncryptionStream(Ljava/io/OutputStream;)Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;
    .locals 4
    .param p1, "os"    # Ljava/io/OutputStream;

    .line 82
    new-instance v0, Lcom/itextpdf/kernel/crypto/OutputStreamAesEncryption;

    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->nextObjectKey:[B

    const/4 v2, 0x0

    iget v3, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->nextObjectKeySize:I

    invoke-direct {v0, p1, v1, v2, v3}, Lcom/itextpdf/kernel/crypto/OutputStreamAesEncryption;-><init>(Ljava/io/OutputStream;[BII)V

    return-object v0
.end method

.method public isEncryptMetadata()Z
    .locals 1

    .line 72
    iget-boolean v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->encryptMetadata:Z

    return v0
.end method

.method public setHashKeyForNextObject(II)V
    .locals 0
    .param p1, "objNumber"    # I
    .param p2, "objGeneration"    # I

    .line 78
    return-void
.end method
