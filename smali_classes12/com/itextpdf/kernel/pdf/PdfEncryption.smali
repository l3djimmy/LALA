.class public Lcom/itextpdf/kernel/pdf/PdfEncryption;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfEncryption.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# static fields
.field private static final AES_128:I = 0x4

.field private static final AES_256:I = 0x5

.field private static final DEFAULT_KEY_LENGTH:I = 0x28

.field private static final STANDARD_ENCRYPTION_128:I = 0x3

.field private static final STANDARD_ENCRYPTION_40:I = 0x2

.field private static seq:J


# instance fields
.field private cryptoMode:I

.field private documentId:[B

.field private embeddedFilesOnly:Z

.field private encryptMetadata:Z

.field private permissions:Ljava/lang/Long;

.field private securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 59
    invoke-static {}, Lcom/itextpdf/commons/utils/SystemUtil;->getTimeBasedSeed()J

    move-result-wide v0

    sput-wide v0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->seq:J

    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/security/Key;Ljava/security/cert/Certificate;Ljava/lang/String;Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;)V
    .locals 16
    .param p1, "pdfDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "certificateKey"    # Ljava/security/Key;
    .param p3, "certificate"    # Ljava/security/cert/Certificate;
    .param p4, "certificateKeyProvider"    # Ljava/lang/String;
    .param p5, "externalDecryptionProcess"    # Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;

    .line 233
    move-object/from16 v0, p0

    invoke-direct/range {p0 .. p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 234
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->setForbidRelease()V

    .line 235
    invoke-direct/range {p0 .. p1}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->readAndSetCryptoModeForPubSecHandler(Lcom/itextpdf/kernel/pdf/PdfDictionary;)I

    move-result v1

    .line 236
    .local v1, "revision":I
    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 250
    :pswitch_0
    new-instance v2, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes256;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    iget-boolean v8, v0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptMetadata:Z

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    invoke-direct/range {v2 .. v8}, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes256;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/security/Key;Ljava/security/cert/Certificate;Ljava/lang/String;Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;Z)V

    iput-object v2, v0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    goto :goto_0

    .line 246
    :pswitch_1
    new-instance v9, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    iget-boolean v15, v0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptMetadata:Z

    move-object/from16 v11, p2

    move-object/from16 v12, p3

    move-object/from16 v13, p4

    move-object/from16 v14, p5

    invoke-direct/range {v9 .. v15}, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/security/Key;Ljava/security/cert/Certificate;Ljava/lang/String;Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;Z)V

    iput-object v9, v0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    .line 248
    goto :goto_0

    .line 242
    :pswitch_2
    new-instance v9, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard128;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    iget-boolean v15, v0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptMetadata:Z

    move-object/from16 v11, p2

    move-object/from16 v12, p3

    move-object/from16 v13, p4

    move-object/from16 v14, p5

    invoke-direct/range {v9 .. v15}, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard128;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/security/Key;Ljava/security/cert/Certificate;Ljava/lang/String;Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;Z)V

    iput-object v9, v0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    .line 244
    goto :goto_0

    .line 238
    :pswitch_3
    new-instance v9, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard40;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    iget-boolean v15, v0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptMetadata:Z

    move-object/from16 v11, p2

    move-object/from16 v12, p3

    move-object/from16 v13, p4

    move-object/from16 v14, p5

    invoke-direct/range {v9 .. v15}, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard40;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/security/Key;Ljava/security/cert/Certificate;Ljava/lang/String;Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;Z)V

    iput-object v9, v0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    .line 240
    nop

    .line 254
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[B)V
    .locals 4
    .param p1, "pdfDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "password"    # [B
    .param p3, "documentId"    # [B

    .line 201
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 202
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->setForbidRelease()V

    .line 203
    iput-object p3, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->documentId:[B

    .line 205
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->readAndSetCryptoModeForStdHandler(Lcom/itextpdf/kernel/pdf/PdfDictionary;)I

    move-result v0

    .line 206
    .local v0, "revision":I
    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 223
    :pswitch_0
    new-instance v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1, v2, p2}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B)V

    .line 224
    .local v1, "aes256Handler":Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->getPermissions()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->permissions:Ljava/lang/Long;

    .line 225
    invoke-virtual {v1}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->isEncryptMetadata()Z

    move-result v2

    iput-boolean v2, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptMetadata:Z

    .line 226
    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    goto :goto_0

    .line 218
    .end local v1    # "aes256Handler":Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;
    :pswitch_1
    new-instance v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    iget-boolean v3, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptMetadata:Z

    invoke-direct {v1, v2, p2, p3, v3}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[BZ)V

    .line 219
    .local v1, "handlerAes128":Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->getPermissions()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->permissions:Ljava/lang/Long;

    .line 220
    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    .line 221
    goto :goto_0

    .line 213
    .end local v1    # "handlerAes128":Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;
    :pswitch_2
    new-instance v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    iget-boolean v3, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptMetadata:Z

    invoke-direct {v1, v2, p2, p3, v3}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[BZ)V

    .line 214
    .local v1, "handlerStd128":Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->getPermissions()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->permissions:Ljava/lang/Long;

    .line 215
    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    .line 216
    goto :goto_0

    .line 208
    .end local v1    # "handlerStd128":Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;
    :pswitch_3
    new-instance v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard40;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    iget-boolean v3, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptMetadata:Z

    invoke-direct {v1, v2, p2, p3, v3}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard40;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[BZ)V

    .line 209
    .local v1, "handlerStd40":Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard40;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard40;->getPermissions()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->permissions:Ljava/lang/Long;

    .line 210
    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    .line 211
    nop

    .line 229
    .end local v1    # "handlerStd40":Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard40;
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public constructor <init>([B[BII[BLcom/itextpdf/kernel/pdf/PdfVersion;)V
    .locals 8
    .param p1, "userPassword"    # [B
    .param p2, "ownerPassword"    # [B
    .param p3, "permissions"    # I
    .param p4, "encryptionType"    # I
    .param p5, "documentId"    # [B
    .param p6, "version"    # Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 107
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 108
    iput-object p5, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->documentId:[B

    .line 109
    if-eqz p6, :cond_0

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_2_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

    invoke-virtual {p6, v0}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result v0

    if-ltz v0, :cond_0

    .line 110
    invoke-direct {p0, p3}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->fixAccessibilityPermissionPdf20(I)I

    move-result p3

    move v4, p3

    goto :goto_0

    .line 112
    :cond_0
    move v4, p3

    .end local p3    # "permissions":I
    .local v4, "permissions":I
    :goto_0
    invoke-direct {p0, p4}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->setCryptoMode(I)I

    move-result p3

    .line 113
    .local p3, "revision":I
    packed-switch p3, :pswitch_data_0

    move-object v2, p1

    move-object v3, p2

    move-object v7, p5

    move-object p1, p6

    .end local p2    # "ownerPassword":[B
    .end local p5    # "documentId":[B
    .end local p6    # "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    .local v2, "userPassword":[B
    .local v3, "ownerPassword":[B
    .local v7, "documentId":[B
    .local p1, "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    goto/16 :goto_1

    .line 133
    .end local v2    # "userPassword":[B
    .end local v3    # "ownerPassword":[B
    .end local v7    # "documentId":[B
    .local p1, "userPassword":[B
    .restart local p2    # "ownerPassword":[B
    .restart local p5    # "documentId":[B
    .restart local p6    # "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    :pswitch_0
    new-instance v0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    iget-boolean v5, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptMetadata:Z

    iget-boolean v6, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->embeddedFilesOnly:Z

    move-object v2, p1

    move-object v3, p2

    move-object v7, p6

    .end local p1    # "userPassword":[B
    .end local p2    # "ownerPassword":[B
    .end local p6    # "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    .restart local v2    # "userPassword":[B
    .restart local v3    # "ownerPassword":[B
    .local v7, "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    invoke-direct/range {v0 .. v7}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[BIZZLcom/itextpdf/kernel/pdf/PdfVersion;)V

    move-object p1, v7

    .line 135
    .end local v7    # "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    .local v0, "handlerAes256":Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;
    .local p1, "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;->getPermissions()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->permissions:Ljava/lang/Long;

    .line 136
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    move-object v7, p5

    goto/16 :goto_1

    .line 127
    .end local v0    # "handlerAes256":Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes256;
    .end local v2    # "userPassword":[B
    .end local v3    # "ownerPassword":[B
    .local p1, "userPassword":[B
    .restart local p2    # "ownerPassword":[B
    .restart local p6    # "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    :pswitch_1
    move-object v2, p1

    move-object v3, p2

    move-object p1, p6

    .end local p2    # "ownerPassword":[B
    .end local p6    # "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    .restart local v2    # "userPassword":[B
    .restart local v3    # "ownerPassword":[B
    .local p1, "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    new-instance v0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object p2

    move-object v1, p2

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    iget-boolean v5, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptMetadata:Z

    iget-boolean v6, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->embeddedFilesOnly:Z

    move-object v7, p5

    .end local p5    # "documentId":[B
    .local v7, "documentId":[B
    invoke-direct/range {v0 .. v7}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[BIZZ[B)V

    .line 129
    .local v0, "handlerAes128":Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;->getPermissions()J

    move-result-wide p5

    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->permissions:Ljava/lang/Long;

    .line 130
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    .line 131
    goto :goto_1

    .line 121
    .end local v0    # "handlerAes128":Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingAes128;
    .end local v2    # "userPassword":[B
    .end local v3    # "ownerPassword":[B
    .end local v7    # "documentId":[B
    .local p1, "userPassword":[B
    .restart local p2    # "ownerPassword":[B
    .restart local p5    # "documentId":[B
    .restart local p6    # "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    :pswitch_2
    move-object v2, p1

    move-object v3, p2

    move-object v7, p5

    move-object p1, p6

    .end local p2    # "ownerPassword":[B
    .end local p5    # "documentId":[B
    .end local p6    # "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    .restart local v2    # "userPassword":[B
    .restart local v3    # "ownerPassword":[B
    .restart local v7    # "documentId":[B
    .local p1, "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    new-instance v0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object p2

    move-object v1, p2

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    iget-boolean v5, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptMetadata:Z

    iget-boolean v6, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->embeddedFilesOnly:Z

    invoke-direct/range {v0 .. v7}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[BIZZ[B)V

    .line 123
    .local v0, "handlerStd128":Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;->getPermissions()J

    move-result-wide p5

    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->permissions:Ljava/lang/Long;

    .line 124
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    .line 125
    goto :goto_1

    .line 115
    .end local v0    # "handlerStd128":Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard128;
    .end local v2    # "userPassword":[B
    .end local v3    # "ownerPassword":[B
    .end local v7    # "documentId":[B
    .local p1, "userPassword":[B
    .restart local p2    # "ownerPassword":[B
    .restart local p5    # "documentId":[B
    .restart local p6    # "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    :pswitch_3
    move-object v2, p1

    move-object v3, p2

    move-object v7, p5

    move-object p1, p6

    .end local p2    # "ownerPassword":[B
    .end local p5    # "documentId":[B
    .end local p6    # "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    .restart local v2    # "userPassword":[B
    .restart local v3    # "ownerPassword":[B
    .restart local v7    # "documentId":[B
    .local p1, "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    new-instance v0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard40;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object p2

    move-object v1, p2

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    iget-boolean v5, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptMetadata:Z

    iget-boolean v6, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->embeddedFilesOnly:Z

    invoke-direct/range {v0 .. v7}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard40;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[BIZZ[B)V

    .line 117
    .local v0, "handlerStd40":Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard40;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard40;->getPermissions()J

    move-result-wide p5

    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->permissions:Ljava/lang/Long;

    .line 118
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    .line 119
    nop

    .line 139
    .end local v0    # "handlerStd40":Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard40;
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public constructor <init>([Ljava/security/cert/Certificate;[IILcom/itextpdf/kernel/pdf/PdfVersion;)V
    .locals 7
    .param p1, "certs"    # [Ljava/security/cert/Certificate;
    .param p2, "permissions"    # [I
    .param p3, "encryptionType"    # I
    .param p4, "version"    # Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 177
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 178
    if-eqz p4, :cond_0

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_2_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

    invoke-virtual {p4, v0}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result v0

    if-ltz v0, :cond_0

    .line 179
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_0

    .line 180
    aget v1, p2, v0

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->fixAccessibilityPermissionPdf20(I)I

    move-result v1

    aput v1, p2, v0

    .line 179
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 183
    .end local v0    # "i":I
    :cond_0
    invoke-direct {p0, p3}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->setCryptoMode(I)I

    move-result v6

    .line 184
    .local v6, "revision":I
    packed-switch v6, :pswitch_data_0

    goto :goto_1

    .line 195
    :pswitch_0
    new-instance v0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes256;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    iget-boolean v4, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptMetadata:Z

    iget-boolean v5, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->embeddedFilesOnly:Z

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes256;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[Ljava/security/cert/Certificate;[IZZ)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    goto :goto_1

    .line 192
    :pswitch_1
    new-instance v0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    iget-boolean v4, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptMetadata:Z

    iget-boolean v5, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->embeddedFilesOnly:Z

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingAes128;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[Ljava/security/cert/Certificate;[IZZ)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    .line 193
    goto :goto_1

    .line 189
    :pswitch_2
    new-instance v0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard128;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    iget-boolean v4, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptMetadata:Z

    iget-boolean v5, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->embeddedFilesOnly:Z

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard128;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[Ljava/security/cert/Certificate;[IZZ)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    .line 190
    goto :goto_1

    .line 186
    :pswitch_3
    new-instance v0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard40;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    iget-boolean v4, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptMetadata:Z

    iget-boolean v5, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->embeddedFilesOnly:Z

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard40;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[Ljava/security/cert/Certificate;[IZZ)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    .line 187
    nop

    .line 198
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static createInfoId([BZ)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .param p0, "id"    # [B
    .param p1, "modified"    # Z

    .line 280
    if-eqz p1, :cond_0

    .line 281
    invoke-static {}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->generateNewDocumentId()[B

    move-result-object v0

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->createInfoId([B[B)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0

    .line 283
    :cond_0
    invoke-static {p0, p0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->createInfoId([B[B)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public static createInfoId([B[B)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .param p0, "firstId"    # [B
    .param p1, "secondId"    # [B
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 300
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->createInfoId([B[BZ)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public static createInfoId([B[BZ)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 4
    .param p0, "firstId"    # [B
    .param p1, "secondId"    # [B
    .param p2, "preserveEncryption"    # Z

    .line 315
    if-nez p2, :cond_1

    .line 316
    array-length v0, p0

    const/16 v1, 0x10

    if-ge v0, v1, :cond_0

    .line 317
    invoke-static {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->padByteArrayTo16([B)[B

    move-result-object p0

    .line 320
    :cond_0
    array-length v0, p1

    if-ge v0, v1, :cond_1

    .line 321
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->padByteArrayTo16([B)[B

    move-result-object p1

    .line 325
    :cond_1
    new-instance v0, Lcom/itextpdf/io/source/ByteBuffer;

    const/16 v1, 0x5a

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/ByteBuffer;-><init>(I)V

    .line 326
    .local v0, "buf":Lcom/itextpdf/io/source/ByteBuffer;
    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    move-result-object v1

    const/16 v2, 0x3c

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    .line 327
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_0
    array-length v3, p0

    if-ge v1, v3, :cond_2

    .line 328
    aget-byte v3, p0, v1

    invoke-virtual {v0, v3}, Lcom/itextpdf/io/source/ByteBuffer;->appendHex(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 327
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 329
    .end local v1    # "k":I
    :cond_2
    const/16 v1, 0x3e

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    .line 330
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_1
    array-length v3, p1

    if-ge v2, v3, :cond_3

    .line 331
    aget-byte v3, p1, v2

    invoke-virtual {v0, v3}, Lcom/itextpdf/io/source/ByteBuffer;->appendHex(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 330
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 332
    .end local v2    # "k":I
    :cond_3
    invoke-virtual {v0, v1}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    move-result-object v1

    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/source/ByteBuffer;->append(I)Lcom/itextpdf/io/source/ByteBuffer;

    .line 334
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfLiteral;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBuffer;->toByteArray()[B

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfLiteral;-><init>([B)V

    return-object v1
.end method

.method private fixAccessibilityPermissionPdf20(I)I
    .locals 1
    .param p1, "permissions"    # I

    .line 643
    or-int/lit16 v0, p1, 0x200

    return v0
.end method

.method public static generateNewDocumentId()[B
    .locals 10

    .line 259
    :try_start_0
    const-string v0, "SHA-512"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 262
    .local v0, "sha512":Ljava/security/MessageDigest;
    nop

    .line 263
    invoke-static {}, Lcom/itextpdf/commons/utils/SystemUtil;->getTimeBasedSeed()J

    move-result-wide v1

    .line 264
    .local v1, "time":J
    invoke-static {}, Lcom/itextpdf/commons/utils/SystemUtil;->getFreeMemory()J

    move-result-wide v3

    .line 265
    .local v3, "mem":J
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "+"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-wide v6, Lcom/itextpdf/kernel/pdf/PdfEncryption;->seq:J

    const-wide/16 v8, 0x1

    add-long/2addr v8, v6

    sput-wide v8, Lcom/itextpdf/kernel/pdf/PdfEncryption;->seq:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 267
    .local v5, "s":Ljava/lang/String;
    sget-object v6, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-virtual {v5, v6}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v6

    return-object v6

    .line 260
    .end local v0    # "sha512":Ljava/security/MessageDigest;
    .end local v1    # "time":J
    .end local v3    # "mem":J
    .end local v5    # "s":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 261
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "PdfEncryption exception."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static padByteArrayTo16([B)[B
    .locals 3
    .param p0, "documentId"    # [B

    .line 338
    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    .line 340
    .local v0, "paddingBytes":[B
    array-length v1, p0

    const/4 v2, 0x0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 342
    return-object v0

    nop

    :array_0
    .array-data 1
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
    .end array-data
.end method

.method private readAndSetCryptoModeForPubSecHandler(Lcom/itextpdf/kernel/pdf/PdfDictionary;)I
    .locals 8
    .param p1, "encDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 566
    const/4 v0, 0x0

    .line 568
    .local v0, "length":I
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v1

    .line 569
    .local v1, "vValue":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v1, :cond_9

    .line 571
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v2

    .line 572
    .local v2, "v":I
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->readEmbeddedFilesOnlyFromEncryptDictionary(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Z

    move-result v3

    .line 573
    .local v3, "embeddedFilesOnlyMode":Z
    packed-switch v2, :pswitch_data_0

    .line 614
    :pswitch_0
    new-instance v4, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v5, "Unknown encryption type V == {0}."

    invoke-direct {v4, v5, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    throw v4

    .line 587
    :pswitch_1
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->CF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v4

    .line 588
    .local v4, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v4, :cond_5

    .line 590
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->DefaultCryptFilter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    move-object v4, v5

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 591
    if-eqz v4, :cond_4

    .line 593
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->V2:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->CFM:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 594
    const/4 v5, 0x1

    .line 595
    .local v5, "cryptoMode":I
    const/16 v0, 0x80

    goto :goto_0

    .line 596
    .end local v5    # "cryptoMode":I
    :cond_0
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->AESV2:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->CFM:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 597
    const/4 v5, 0x2

    .line 598
    .restart local v5    # "cryptoMode":I
    const/16 v0, 0x80

    goto :goto_0

    .line 599
    .end local v5    # "cryptoMode":I
    :cond_1
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->AESV3:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->CFM:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 600
    const/4 v5, 0x3

    .line 601
    .restart local v5    # "cryptoMode":I
    const/16 v0, 0x100

    .line 605
    :goto_0
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->EncryptMetadata:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBoolean(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v6

    .line 606
    .local v6, "em":Lcom/itextpdf/kernel/pdf/PdfBoolean;
    if-eqz v6, :cond_2

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->getValue()Z

    move-result v7

    if-nez v7, :cond_2

    .line 607
    or-int/lit8 v5, v5, 0x8

    .line 609
    :cond_2
    if-eqz v3, :cond_8

    .line 610
    or-int/lit8 v5, v5, 0x18

    goto :goto_2

    .line 603
    .end local v5    # "cryptoMode":I
    .end local v6    # "em":Lcom/itextpdf/kernel/pdf/PdfBoolean;
    :cond_3
    new-instance v5, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v6, "No compatible encryption found."

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 592
    :cond_4
    new-instance v5, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v6, "/DefaultCryptFilter not found (encryption)."

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 589
    :cond_5
    new-instance v5, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v6, "/CF not found (encryption)"

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 579
    .end local v4    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :pswitch_2
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Length:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v4

    .line 580
    .local v4, "lengthValue":Lcom/itextpdf/kernel/pdf/PdfNumber;
    const/16 v5, 0x28

    if-nez v4, :cond_6

    move v6, v5

    goto :goto_1

    :cond_6
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v6

    :goto_1
    move v0, v6

    .line 581
    const/16 v6, 0x80

    if-gt v0, v6, :cond_7

    if-lt v0, v5, :cond_7

    rem-int/lit8 v5, v0, 0x8

    if-nez v5, :cond_7

    .line 583
    const/4 v5, 0x1

    .line 584
    .restart local v5    # "cryptoMode":I
    goto :goto_2

    .line 582
    .end local v5    # "cryptoMode":I
    :cond_7
    new-instance v5, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v6, "Illegal length value."

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 575
    .end local v4    # "lengthValue":Lcom/itextpdf/kernel/pdf/PdfNumber;
    :pswitch_3
    const/4 v5, 0x0

    .line 576
    .restart local v5    # "cryptoMode":I
    const/16 v0, 0x28

    .line 577
    nop

    .line 616
    :cond_8
    :goto_2
    invoke-direct {p0, v5, v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->setCryptoMode(II)I

    move-result v4

    return v4

    .line 570
    .end local v2    # "v":I
    .end local v3    # "embeddedFilesOnlyMode":Z
    .end local v5    # "cryptoMode":I
    :cond_9
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v3, "Illegal V value."

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private readAndSetCryptoModeForStdHandler(Lcom/itextpdf/kernel/pdf/PdfDictionary;)I
    .locals 8
    .param p1, "encDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 504
    const/4 v0, 0x0

    .line 506
    .local v0, "length":I
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v1

    .line 507
    .local v1, "rValue":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v1, :cond_a

    .line 509
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v2

    .line 510
    .local v2, "revision":I
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->readEmbeddedFilesOnlyFromEncryptDictionary(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Z

    move-result v3

    .line 511
    .local v3, "embeddedFilesOnlyMode":Z
    packed-switch v2, :pswitch_data_0

    .line 556
    new-instance v4, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v5, "Unknown encryption type R == {0}."

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v5

    .line 557
    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v4

    throw v4

    .line 546
    :pswitch_0
    const/4 v4, 0x3

    .line 547
    .local v4, "cryptoMode":I
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->EncryptMetadata:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBoolean(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v5

    .line 548
    .local v5, "em5":Lcom/itextpdf/kernel/pdf/PdfBoolean;
    if-eqz v5, :cond_0

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->getValue()Z

    move-result v6

    if-nez v6, :cond_0

    .line 549
    or-int/lit8 v4, v4, 0x8

    .line 551
    :cond_0
    if-eqz v3, :cond_9

    .line 552
    or-int/lit8 v4, v4, 0x18

    goto/16 :goto_2

    .line 523
    .end local v4    # "cryptoMode":I
    .end local v5    # "em5":Lcom/itextpdf/kernel/pdf/PdfBoolean;
    :pswitch_1
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->CF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 524
    .local v4, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v4, :cond_6

    .line 526
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->StdCF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v5

    move-object v4, v5

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 527
    if-eqz v4, :cond_5

    .line 529
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->V2:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->CFM:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 530
    const/4 v5, 0x1

    .local v5, "cryptoMode":I
    goto :goto_0

    .line 531
    .end local v5    # "cryptoMode":I
    :cond_1
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->AESV2:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->CFM:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 532
    const/4 v5, 0x2

    .line 536
    .restart local v5    # "cryptoMode":I
    :goto_0
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->EncryptMetadata:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBoolean(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v6

    .line 537
    .local v6, "em":Lcom/itextpdf/kernel/pdf/PdfBoolean;
    if-eqz v6, :cond_2

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->getValue()Z

    move-result v7

    if-nez v7, :cond_2

    .line 538
    or-int/lit8 v5, v5, 0x8

    .line 540
    :cond_2
    if-eqz v3, :cond_3

    .line 541
    or-int/lit8 v5, v5, 0x18

    move v4, v5

    goto :goto_2

    .line 540
    :cond_3
    move v4, v5

    goto :goto_2

    .line 534
    .end local v5    # "cryptoMode":I
    .end local v6    # "em":Lcom/itextpdf/kernel/pdf/PdfBoolean;
    :cond_4
    new-instance v5, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v6, "No compatible encryption found."

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 528
    :cond_5
    new-instance v5, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v6, "/StdCF not found (encryption)"

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 525
    :cond_6
    new-instance v5, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v6, "/CF not found (encryption)"

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 516
    .end local v4    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :pswitch_2
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Length:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v4

    .line 517
    .local v4, "lengthValue":Lcom/itextpdf/kernel/pdf/PdfNumber;
    const/16 v5, 0x28

    if-nez v4, :cond_7

    move v6, v5

    goto :goto_1

    :cond_7
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v6

    :goto_1
    move v0, v6

    .line 518
    const/16 v6, 0x80

    if-gt v0, v6, :cond_8

    if-lt v0, v5, :cond_8

    rem-int/lit8 v5, v0, 0x8

    if-nez v5, :cond_8

    .line 520
    const/4 v5, 0x1

    .line 521
    .restart local v5    # "cryptoMode":I
    move v4, v5

    goto :goto_2

    .line 519
    .end local v5    # "cryptoMode":I
    :cond_8
    new-instance v5, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v6, "Illegal length value."

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 513
    .end local v4    # "lengthValue":Lcom/itextpdf/kernel/pdf/PdfNumber;
    :pswitch_3
    const/4 v4, 0x0

    .line 514
    .local v4, "cryptoMode":I
    nop

    .line 560
    :cond_9
    :goto_2
    invoke-direct {p0, v4, v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->setCryptoMode(II)I

    move-result v2

    .line 561
    return v2

    .line 508
    .end local v2    # "revision":I
    .end local v3    # "embeddedFilesOnlyMode":Z
    .end local v4    # "cryptoMode":I
    :cond_a
    new-instance v2, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v3, "Illegal R value."

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v2

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method static readEmbeddedFilesOnlyFromEncryptDictionary(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Z
    .locals 8
    .param p0, "encDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 620
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->EFF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    .line 621
    .local v0, "embeddedFilesFilter":Lcom/itextpdf/kernel/pdf/PdfName;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Identity:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_0

    if-eqz v0, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    .line 622
    .local v1, "encryptEmbeddedFiles":Z
    :goto_0
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Identity:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->StmF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v4

    xor-int/2addr v4, v2

    .line 623
    .local v4, "encryptStreams":Z
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Identity:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->StrF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v5

    xor-int/2addr v5, v2

    .line 624
    .local v5, "encryptStrings":Z
    if-nez v4, :cond_4

    if-nez v5, :cond_4

    if-nez v1, :cond_1

    goto :goto_2

    .line 628
    :cond_1
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->CF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v6

    .line 629
    .local v6, "cfDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v6, :cond_3

    .line 631
    invoke-virtual {v6, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v7

    if-eqz v7, :cond_2

    goto :goto_1

    :cond_2
    move v2, v3

    :goto_1
    return v2

    .line 633
    :cond_3
    return v3

    .line 625
    .end local v6    # "cfDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_4
    :goto_2
    return v3
.end method

.method private setCryptoMode(I)I
    .locals 1
    .param p1, "mode"    # I

    .line 464
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->setCryptoMode(II)I

    move-result v0

    return v0
.end method

.method private setCryptoMode(II)I
    .locals 4
    .param p1, "mode"    # I
    .param p2, "length"    # I

    .line 469
    iput p1, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->cryptoMode:I

    .line 470
    and-int/lit8 v0, p1, 0x8

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/16 v3, 0x8

    if-eq v0, v3, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptMetadata:Z

    .line 471
    and-int/lit8 v0, p1, 0x18

    const/16 v3, 0x18

    if-ne v0, v3, :cond_1

    move v0, v1

    goto :goto_1

    :cond_1
    move v0, v2

    :goto_1
    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->embeddedFilesOnly:Z

    .line 472
    and-int/lit8 p1, p1, 0x7

    .line 473
    const/16 v0, 0x80

    packed-switch p1, :pswitch_data_0

    .line 497
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "No valid encryption mode."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 493
    :pswitch_0
    const/16 v0, 0x100

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->setKeyLength(I)V

    .line 494
    const/4 v0, 0x5

    .line 495
    .local v0, "revision":I
    goto :goto_3

    .line 489
    .end local v0    # "revision":I
    :pswitch_1
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->setKeyLength(I)V

    .line 490
    const/4 v0, 0x4

    .line 491
    .restart local v0    # "revision":I
    goto :goto_3

    .line 481
    .end local v0    # "revision":I
    :pswitch_2
    if-lez p2, :cond_2

    .line 482
    invoke-direct {p0, p2}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->setKeyLength(I)V

    goto :goto_2

    .line 484
    :cond_2
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->setKeyLength(I)V

    .line 486
    :goto_2
    const/4 v0, 0x3

    .line 487
    .restart local v0    # "revision":I
    goto :goto_3

    .line 475
    .end local v0    # "revision":I
    :pswitch_3
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptMetadata:Z

    .line 476
    iput-boolean v2, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->embeddedFilesOnly:Z

    .line 477
    const/16 v0, 0x28

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->setKeyLength(I)V

    .line 478
    const/4 v0, 0x2

    .line 479
    .restart local v0    # "revision":I
    nop

    .line 499
    :goto_3
    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private setKeyLength(I)V
    .locals 3
    .param p1, "keyLength"    # I

    .line 458
    const/16 v0, 0x28

    if-eq p1, v0, :cond_0

    .line 459
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Length:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 461
    :cond_0
    return-void
.end method


# virtual methods
.method public computeUserPassword([B)[B
    .locals 3
    .param p1, "ownerPassword"    # [B

    .line 433
    const/4 v0, 0x0

    .line 434
    .local v0, "userPassword":[B
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    instance-of v1, v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard40;

    if-eqz v1, :cond_0

    .line 435
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    check-cast v1, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard40;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v1, p1, v2}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardHandlerUsingStandard40;->computeUserPassword([BLcom/itextpdf/kernel/pdf/PdfDictionary;)[B

    move-result-object v0

    .line 437
    :cond_0
    return-object v0
.end method

.method public decryptByteArray([B)[B
    .locals 4
    .param p1, "b"    # [B

    .line 404
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 405
    .local v0, "ba":Ljava/io/ByteArrayOutputStream;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->getDecryptor()Lcom/itextpdf/kernel/crypto/IDecryptor;

    move-result-object v1

    .line 406
    .local v1, "dec":Lcom/itextpdf/kernel/crypto/IDecryptor;
    array-length v2, p1

    const/4 v3, 0x0

    invoke-interface {v1, p1, v3, v2}, Lcom/itextpdf/kernel/crypto/IDecryptor;->update([BII)[B

    move-result-object v2

    .line 407
    .local v2, "b2":[B
    if-eqz v2, :cond_0

    .line 408
    invoke-virtual {v0, v2}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 409
    :cond_0
    invoke-interface {v1}, Lcom/itextpdf/kernel/crypto/IDecryptor;->finish()[B

    move-result-object v3

    .line 410
    .end local v2    # "b2":[B
    .local v3, "b2":[B
    if-eqz v3, :cond_1

    .line 411
    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 412
    :cond_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 413
    .end local v0    # "ba":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "dec":Lcom/itextpdf/kernel/crypto/IDecryptor;
    .end local v3    # "b2":[B
    :catch_0
    move-exception v0

    .line 414
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "PdfEncryption exception."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public encryptByteArray([B)[B
    .locals 5
    .param p1, "b"    # [B

    .line 391
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 392
    .local v0, "ba":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->getEncryptionStream(Ljava/io/OutputStream;)Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;

    move-result-object v1

    .line 394
    .local v1, "ose":Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;
    :try_start_0
    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 397
    nop

    .line 398
    invoke-virtual {v1}, Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;->finish()V

    .line 399
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2

    .line 395
    :catch_0
    move-exception v2

    .line 396
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v4, "PdfEncryption exception."

    invoke-direct {v3, v4, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public flush()V
    .locals 0

    .line 449
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->flush()V

    .line 450
    return-void
.end method

.method public getCryptoMode()I
    .locals 1

    .line 363
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->cryptoMode:I

    return v0
.end method

.method public getDocumentId()[B
    .locals 1

    .line 378
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->documentId:[B

    return-object v0
.end method

.method public getEncryptionStream(Ljava/io/OutputStream;)Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;
    .locals 1
    .param p1, "os"    # Ljava/io/OutputStream;

    .line 387
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->getEncryptionStream(Ljava/io/OutputStream;)Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;

    move-result-object v0

    return-object v0
.end method

.method public getPermissions()Ljava/lang/Long;
    .locals 1

    .line 353
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->permissions:Ljava/lang/Long;

    return-object v0
.end method

.method public isEmbeddedFilesOnly()Z
    .locals 1

    .line 371
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->embeddedFilesOnly:Z

    return v0
.end method

.method public isMetadataEncrypted()Z
    .locals 1

    .line 367
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->encryptMetadata:Z

    return v0
.end method

.method public isOpenedWithFullPermission()Z
    .locals 2

    .line 419
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    instance-of v0, v0, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 420
    return v1

    .line 421
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    instance-of v0, v0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardSecurityHandler;

    if-eqz v0, :cond_1

    .line 422
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    check-cast v0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardSecurityHandler;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/crypto/securityhandler/StandardSecurityHandler;->isUsedOwnerPassword()Z

    move-result v0

    return v0

    .line 424
    :cond_1
    return v1
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 454
    const/4 v0, 0x1

    return v0
.end method

.method public setHashKeyForNextObject(II)V
    .locals 1
    .param p1, "objNumber"    # I
    .param p2, "objGeneration"    # I

    .line 382
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfEncryption;->securityHandler:Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->setHashKeyForNextObject(II)V

    .line 383
    return-void
.end method
