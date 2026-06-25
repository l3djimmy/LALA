.class public Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard40;
.super Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;
.source "PubSecHandlerUsingStandard40.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/security/Key;Ljava/security/cert/Certificate;Ljava/lang/String;Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;Z)V
    .locals 0
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "certificateKey"    # Ljava/security/Key;
    .param p3, "certificate"    # Ljava/security/cert/Certificate;
    .param p4, "certificateKeyProvider"    # Ljava/lang/String;
    .param p5, "externalDecryptionProcess"    # Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;
    .param p6, "encryptMetadata"    # Z

    .line 46
    invoke-direct {p0}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;-><init>()V

    .line 47
    invoke-virtual/range {p0 .. p6}, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard40;->initKeyAndReadDictionary(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/security/Key;Ljava/security/cert/Certificate;Ljava/lang/String;Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;Z)V

    .line 49
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[Ljava/security/cert/Certificate;[IZZ)V
    .locals 0
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "certs"    # [Ljava/security/cert/Certificate;
    .param p3, "permissions"    # [I
    .param p4, "encryptMetadata"    # Z
    .param p5, "embeddedFilesOnly"    # Z

    .line 40
    invoke-direct {p0}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;-><init>()V

    .line 41
    invoke-virtual/range {p0 .. p5}, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard40;->initKeyAndFillDictionary(Lcom/itextpdf/kernel/pdf/PdfDictionary;[Ljava/security/cert/Certificate;[IZZ)V

    .line 42
    return-void
.end method


# virtual methods
.method public getDecryptor()Lcom/itextpdf/kernel/crypto/IDecryptor;
    .locals 4

    .line 58
    new-instance v0, Lcom/itextpdf/kernel/crypto/StandardDecryptor;

    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard40;->nextObjectKey:[B

    const/4 v2, 0x0

    iget v3, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard40;->nextObjectKeySize:I

    invoke-direct {v0, v1, v2, v3}, Lcom/itextpdf/kernel/crypto/StandardDecryptor;-><init>([BII)V

    return-object v0
.end method

.method protected getDigestAlgorithm()Ljava/lang/String;
    .locals 1

    .line 62
    const-string v0, "SHA-1"

    return-object v0
.end method

.method public getEncryptionStream(Ljava/io/OutputStream;)Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;
    .locals 4
    .param p1, "os"    # Ljava/io/OutputStream;

    .line 53
    new-instance v0, Lcom/itextpdf/kernel/crypto/OutputStreamStandardEncryption;

    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard40;->nextObjectKey:[B

    const/4 v2, 0x0

    iget v3, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard40;->nextObjectKeySize:I

    invoke-direct {v0, p1, v1, v2, v3}, Lcom/itextpdf/kernel/crypto/OutputStreamStandardEncryption;-><init>(Ljava/io/OutputStream;[BII)V

    return-object v0
.end method

.method protected initKey([BI)V
    .locals 3
    .param p1, "globalKey"    # [B
    .param p2, "keyLength"    # I

    .line 66
    div-int/lit8 v0, p2, 0x8

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard40;->mkey:[B

    .line 67
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard40;->mkey:[B

    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard40;->mkey:[B

    array-length v1, v1

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 68
    return-void
.end method

.method protected setPubSecSpecificHandlerDicEntries(Lcom/itextpdf/kernel/pdf/PdfDictionary;ZZ)V
    .locals 4
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "encryptMetadata"    # Z
    .param p3, "embeddedFilesOnly"    # Z

    .line 71
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Adobe_PubSec:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 72
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 74
    invoke-virtual {p0}, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard40;->createRecipientsArray()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 75
    .local v0, "recipients":Lcom/itextpdf/kernel/pdf/PdfArray;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 76
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->SubFilter:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Adbe_pkcs7_s4:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 77
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Recipients:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 78
    return-void
.end method
