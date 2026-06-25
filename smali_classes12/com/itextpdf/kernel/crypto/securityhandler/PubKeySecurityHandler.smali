.class public abstract Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;
.super Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;
.source "PubKeySecurityHandler.java"


# static fields
.field private static final BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

.field private static final DEFAULT_KEY_LENGTH:I = 0x28

.field private static final SEED_LENGTH:I = 0x14


# instance fields
.field private recipients:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;",
            ">;"
        }
    .end annotation
.end field

.field private seed:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 64
    invoke-static {}, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->getFactory()Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .line 73
    invoke-direct {p0}, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;-><init>()V

    .line 69
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->recipients:Ljava/util/List;

    .line 74
    const/16 v0, 0x14

    invoke-static {v0}, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->generateSeed(I)[B

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->seed:[B

    .line 75
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->recipients:Ljava/util/List;

    .line 76
    return-void
.end method

.method private addRecipient(Ljava/security/cert/Certificate;I)V
    .locals 2
    .param p1, "cert"    # Ljava/security/cert/Certificate;
    .param p2, "permission"    # I

    .line 187
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->recipients:Ljava/util/List;

    new-instance v1, Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;

    invoke-direct {v1, p1, p2}, Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;-><init>(Ljava/security/cert/Certificate;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 188
    return-void
.end method

.method protected static computeGlobalKeyOnReading(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/security/PrivateKey;Ljava/security/cert/Certificate;Ljava/lang/String;Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;ZLjava/lang/String;)[B
    .locals 5
    .param p0, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p1, "certificateKey"    # Ljava/security/PrivateKey;
    .param p2, "certificate"    # Ljava/security/cert/Certificate;
    .param p3, "certificateKeyProvider"    # Ljava/lang/String;
    .param p4, "externalDecryptionProcess"    # Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;
    .param p5, "encryptMetadata"    # Z
    .param p6, "digestAlgorithm"    # Ljava/lang/String;

    .line 106
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Recipients:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 107
    .local v0, "recipients":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_0

    .line 108
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->DefaultCryptFilter:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 109
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Recipients:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 110
    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 113
    :cond_0
    invoke-static {p1, p2, p3, p4, v0}, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->fetchEnvelopedData(Ljava/security/Key;Ljava/security/cert/Certificate;Ljava/lang/String;Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;Lcom/itextpdf/kernel/pdf/PdfArray;)[B

    move-result-object v1

    .line 119
    .local v1, "envelopedData":[B
    :try_start_0
    invoke-static {p6}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 120
    .local v2, "md":Ljava/security/MessageDigest;
    const/4 v3, 0x0

    const/16 v4, 0x14

    invoke-virtual {v2, v1, v3, v4}, Ljava/security/MessageDigest;->update([BII)V

    .line 121
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 122
    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsString(I)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfString;->getValueBytes()[B

    move-result-object v4

    .line 123
    .local v4, "encodedRecipient":[B
    invoke-virtual {v2, v4}, Ljava/security/MessageDigest;->update([B)V

    .line 121
    .end local v4    # "encodedRecipient":[B
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 125
    .end local v3    # "i":I
    :cond_1
    if-nez p5, :cond_2

    .line 126
    const/4 v3, 0x4

    new-array v3, v3, [B

    fill-array-data v3, :array_0

    invoke-virtual {v2, v3}, Ljava/security/MessageDigest;->update([B)V

    .line 128
    :cond_2
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    .local v3, "encryptionKey":[B
    nop

    .line 132
    return-object v3

    .line 129
    .end local v2    # "md":Ljava/security/MessageDigest;
    .end local v3    # "encryptionKey":[B
    :catch_0
    move-exception v2

    .line 130
    .local v2, "f":Ljava/lang/Exception;
    new-instance v3, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v4, "Exception occurred with PDF document decryption. One of the possible reasons is wrong password or wrong public key certificate and private key."

    invoke-direct {v3, v4, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    nop

    :array_0
    .array-data 1
        -0x1t
        -0x1t
        -0x1t
        -0x1t
    .end array-data
.end method

.method private computeRecipientInfo(Ljava/security/cert/X509Certificate;[B)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IKeyTransRecipientInfo;
    .locals 7
    .param p1, "x509Certificate"    # Ljava/security/cert/X509Certificate;
    .param p2, "abyte0"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 288
    sget-object v0, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    new-instance v1, Ljava/io/ByteArrayInputStream;

    .line 289
    invoke-virtual {p1}, Ljava/security/cert/X509Certificate;->getTBSCertificate()[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 288
    invoke-interface {v0, v1}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createASN1InputStream(Ljava/io/InputStream;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;

    move-result-object v0

    .line 290
    .local v0, "asn1InputStream":Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;
    :try_start_0
    sget-object v1, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-interface {v0}, Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;->readObject()Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createTBSCertificate(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/ITBSCertificate;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 291
    .local v1, "tbsCertificate":Lcom/itextpdf/commons/bouncycastle/asn1/x509/ITBSCertificate;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;->close()V

    .line 292
    .end local v0    # "asn1InputStream":Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;
    :cond_0
    invoke-interface {v1}, Lcom/itextpdf/commons/bouncycastle/asn1/x509/ITBSCertificate;->getSubjectPublicKeyInfo()Lcom/itextpdf/commons/bouncycastle/asn1/x509/ISubjectPublicKeyInfo;

    move-result-object v0

    invoke-interface {v0}, Lcom/itextpdf/commons/bouncycastle/asn1/x509/ISubjectPublicKeyInfo;->getAlgorithm()Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;

    move-result-object v0

    .line 293
    .local v0, "algorithmIdentifier":Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;
    sget-object v2, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    .line 294
    invoke-interface {v1}, Lcom/itextpdf/commons/bouncycastle/asn1/x509/ITBSCertificate;->getIssuer()Lcom/itextpdf/commons/bouncycastle/asn1/x500/IX500Name;

    move-result-object v3

    .line 295
    invoke-interface {v1}, Lcom/itextpdf/commons/bouncycastle/asn1/x509/ITBSCertificate;->getSerialNumber()Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Integer;

    move-result-object v4

    invoke-interface {v4}, Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v4

    .line 293
    invoke-interface {v2, v3, v4}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createIssuerAndSerialNumber(Lcom/itextpdf/commons/bouncycastle/asn1/x500/IX500Name;Ljava/math/BigInteger;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IIssuerAndSerialNumber;

    move-result-object v2

    .line 296
    .local v2, "issuerAndSerialNumber":Lcom/itextpdf/commons/bouncycastle/asn1/cms/IIssuerAndSerialNumber;
    invoke-static {p1, p2, v0}, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->cipherBytes(Ljava/security/cert/X509Certificate;[BLcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;)[B

    move-result-object v3

    .line 297
    .local v3, "cipheredBytes":[B
    sget-object v4, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-interface {v4, v3}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createDEROctetString([B)Lcom/itextpdf/commons/bouncycastle/asn1/IDEROctetString;

    move-result-object v4

    .line 298
    .local v4, "derOctetString":Lcom/itextpdf/commons/bouncycastle/asn1/IDEROctetString;
    sget-object v5, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-interface {v5, v2}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createRecipientIdentifier(Lcom/itextpdf/commons/bouncycastle/asn1/cms/IIssuerAndSerialNumber;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IRecipientIdentifier;

    move-result-object v5

    .line 299
    .local v5, "recipId":Lcom/itextpdf/commons/bouncycastle/asn1/cms/IRecipientIdentifier;
    sget-object v6, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-interface {v6, v5, v0, v4}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createKeyTransRecipientInfo(Lcom/itextpdf/commons/bouncycastle/asn1/cms/IRecipientIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IKeyTransRecipientInfo;

    move-result-object v6

    return-object v6

    .line 288
    .end local v1    # "tbsCertificate":Lcom/itextpdf/commons/bouncycastle/asn1/x509/ITBSCertificate;
    .end local v2    # "issuerAndSerialNumber":Lcom/itextpdf/commons/bouncycastle/asn1/cms/IIssuerAndSerialNumber;
    .end local v3    # "cipheredBytes":[B
    .end local v4    # "derOctetString":Lcom/itextpdf/commons/bouncycastle/asn1/IDEROctetString;
    .end local v5    # "recipId":Lcom/itextpdf/commons/bouncycastle/asn1/cms/IRecipientIdentifier;
    .local v0, "asn1InputStream":Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;
    :catchall_0
    move-exception v1

    .end local v0    # "asn1InputStream":Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;
    .end local p1    # "x509Certificate":Ljava/security/cert/X509Certificate;
    .end local p2    # "abyte0":[B
    :try_start_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 291
    .restart local v0    # "asn1InputStream":Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;
    .restart local p1    # "x509Certificate":Ljava/security/cert/X509Certificate;
    .restart local p2    # "abyte0":[B
    :catchall_1
    move-exception v2

    if-eqz v0, :cond_1

    :try_start_2
    invoke-interface {v0}, Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_0

    :catchall_2
    move-exception v3

    invoke-virtual {v1, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw v2
.end method

.method private createDERForRecipient([BLjava/security/cert/X509Certificate;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;
    .locals 8
    .param p1, "in"    # [B
    .param p2, "cert"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 268
    invoke-static {p1}, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->calculateDERForRecipientParams([B)Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils$DERForRecipientParams;

    move-result-object v0

    .line 270
    .local v0, "parameters":Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils$DERForRecipientParams;
    iget-object v1, v0, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils$DERForRecipientParams;->abyte0:[B

    invoke-direct {p0, p2, v1}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->computeRecipientInfo(Ljava/security/cert/X509Certificate;[B)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IKeyTransRecipientInfo;

    move-result-object v1

    .line 271
    .local v1, "keytransrecipientinfo":Lcom/itextpdf/commons/bouncycastle/asn1/cms/IKeyTransRecipientInfo;
    sget-object v2, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    iget-object v3, v0, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils$DERForRecipientParams;->abyte1:[B

    invoke-interface {v2, v3}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createDEROctetString([B)Lcom/itextpdf/commons/bouncycastle/asn1/IDEROctetString;

    move-result-object v2

    .line 272
    .local v2, "deroctetstring":Lcom/itextpdf/commons/bouncycastle/asn1/IDEROctetString;
    sget-object v3, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    sget-object v4, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    .line 273
    invoke-interface {v4, v1}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createRecipientInfo(Lcom/itextpdf/commons/bouncycastle/asn1/cms/IKeyTransRecipientInfo;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IRecipientInfo;

    move-result-object v4

    .line 272
    invoke-interface {v3, v4}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createDERSet(Lcom/itextpdf/commons/bouncycastle/asn1/cms/IRecipientInfo;)Lcom/itextpdf/commons/bouncycastle/asn1/IDERSet;

    move-result-object v3

    .line 274
    .local v3, "derset":Lcom/itextpdf/commons/bouncycastle/asn1/IDERSet;
    sget-object v4, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    sget-object v5, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    .line 276
    invoke-interface {v5}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createPKCSObjectIdentifiers()Lcom/itextpdf/commons/bouncycastle/asn1/pkcs/IPKCSObjectIdentifiers;

    move-result-object v5

    invoke-interface {v5}, Lcom/itextpdf/commons/bouncycastle/asn1/pkcs/IPKCSObjectIdentifiers;->getData()Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;

    move-result-object v5

    iget-object v6, v0, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils$DERForRecipientParams;->algorithmIdentifier:Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;

    .line 275
    invoke-interface {v4, v5, v6, v2}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createEncryptedContentInfo(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IEncryptedContentInfo;

    move-result-object v4

    .line 278
    .local v4, "encryptedcontentinfo":Lcom/itextpdf/commons/bouncycastle/asn1/cms/IEncryptedContentInfo;
    sget-object v5, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    sget-object v6, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-interface {v6}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createNullOriginatorInfo()Lcom/itextpdf/commons/bouncycastle/asn1/cms/IOriginatorInfo;

    move-result-object v6

    sget-object v7, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    .line 279
    invoke-interface {v7}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createNullASN1Set()Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;

    move-result-object v7

    .line 278
    invoke-interface {v5, v6, v3, v4, v7}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createEnvelopedData(Lcom/itextpdf/commons/bouncycastle/asn1/cms/IOriginatorInfo;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;Lcom/itextpdf/commons/bouncycastle/asn1/cms/IEncryptedContentInfo;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IEnvelopedData;

    move-result-object v5

    .line 280
    .local v5, "env":Lcom/itextpdf/commons/bouncycastle/asn1/cms/IEnvelopedData;
    sget-object v6, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    sget-object v7, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    .line 281
    invoke-interface {v7}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createPKCSObjectIdentifiers()Lcom/itextpdf/commons/bouncycastle/asn1/pkcs/IPKCSObjectIdentifiers;

    move-result-object v7

    invoke-interface {v7}, Lcom/itextpdf/commons/bouncycastle/asn1/pkcs/IPKCSObjectIdentifiers;->getEnvelopedData()Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;

    move-result-object v7

    .line 280
    invoke-interface {v6, v7, v5}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createContentInfo(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IContentInfo;

    move-result-object v6

    .line 282
    .local v6, "contentinfo":Lcom/itextpdf/commons/bouncycastle/asn1/cms/IContentInfo;
    invoke-interface {v6}, Lcom/itextpdf/commons/bouncycastle/asn1/cms/IContentInfo;->toASN1Primitive()Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;

    move-result-object v7

    return-object v7
.end method

.method private getEncodedRecipient(I)[B
    .locals 14
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 202
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->recipients:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;

    .line 203
    .local v0, "recipient":Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;->getCms()[B

    move-result-object v1

    .line 205
    .local v1, "cms":[B
    if-eqz v1, :cond_0

    .line 206
    return-object v1

    .line 209
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;->getCertificate()Ljava/security/cert/Certificate;

    move-result-object v2

    .line 212
    .local v2, "certificate":Ljava/security/cert/Certificate;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;->getPermission()I

    move-result v3

    .line 218
    .local v3, "permission":I
    or-int/lit16 v3, v3, -0xf40

    .line 219
    and-int/lit8 v3, v3, -0x4

    .line 220
    add-int/lit8 v3, v3, 0x1

    .line 222
    const/16 v4, 0x18

    new-array v4, v4, [B

    .line 224
    .local v4, "pkcs7input":[B
    int-to-byte v5, v3

    .line 225
    .local v5, "one":B
    shr-int/lit8 v6, v3, 0x8

    int-to-byte v6, v6

    .line 226
    .local v6, "two":B
    shr-int/lit8 v7, v3, 0x10

    int-to-byte v7, v7

    .line 227
    .local v7, "three":B
    shr-int/lit8 v8, v3, 0x18

    int-to-byte v8, v8

    .line 230
    .local v8, "four":B
    iget-object v9, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->seed:[B

    const/4 v10, 0x0

    const/16 v11, 0x14

    invoke-static {v9, v10, v4, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 232
    aput-byte v8, v4, v11

    .line 233
    const/16 v9, 0x15

    aput-byte v7, v4, v9

    .line 234
    const/16 v9, 0x16

    aput-byte v6, v4, v9

    .line 235
    const/16 v9, 0x17

    aput-byte v5, v4, v9

    .line 237
    new-instance v9, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v9}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 238
    .local v9, "baos":Ljava/io/ByteArrayOutputStream;
    sget-object v10, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    .line 239
    invoke-interface {v10}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createASN1Encoding()Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encoding;

    move-result-object v10

    invoke-interface {v10}, Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encoding;->getDer()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/itextpdf/kernel/crypto/CryptoUtil;->createAsn1OutputStream(Ljava/io/OutputStream;Ljava/lang/String;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OutputStream;

    move-result-object v10

    .line 238
    .local v10, "k":Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OutputStream;
    nop

    .line 240
    :try_start_0
    move-object v11, v2

    check-cast v11, Ljava/security/cert/X509Certificate;

    invoke-direct {p0, v4, v11}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->createDERForRecipient([BLjava/security/cert/X509Certificate;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;

    move-result-object v11

    .line 241
    .local v11, "obj":Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;
    invoke-interface {v10, v11}, Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OutputStream;->writeObject(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 242
    .end local v11    # "obj":Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;
    if-eqz v10, :cond_1

    invoke-interface {v10}, Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OutputStream;->close()V

    .line 243
    .end local v10    # "k":Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OutputStream;
    :cond_1
    invoke-virtual {v9}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 244
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;->setCms([B)V

    .line 246
    return-object v1

    .line 238
    .restart local v10    # "k":Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OutputStream;
    :catchall_0
    move-exception v11

    .end local v0    # "recipient":Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;
    .end local v1    # "cms":[B
    .end local v2    # "certificate":Ljava/security/cert/Certificate;
    .end local v3    # "permission":I
    .end local v4    # "pkcs7input":[B
    .end local v5    # "one":B
    .end local v6    # "two":B
    .end local v7    # "three":B
    .end local v8    # "four":B
    .end local v9    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v10    # "k":Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OutputStream;
    .end local p1    # "index":I
    :try_start_1
    throw v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 242
    .restart local v0    # "recipient":Lcom/itextpdf/kernel/crypto/securityhandler/PublicKeyRecipient;
    .restart local v1    # "cms":[B
    .restart local v2    # "certificate":Ljava/security/cert/Certificate;
    .restart local v3    # "permission":I
    .restart local v4    # "pkcs7input":[B
    .restart local v5    # "one":B
    .restart local v6    # "two":B
    .restart local v7    # "three":B
    .restart local v8    # "four":B
    .restart local v9    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v10    # "k":Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OutputStream;
    .restart local p1    # "index":I
    :catchall_1
    move-exception v12

    if-eqz v10, :cond_2

    :try_start_2
    invoke-interface {v10}, Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_0

    :catchall_2
    move-exception v13

    invoke-virtual {v11, v13}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    throw v12
.end method

.method private getEncodedRecipients()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 5

    .line 250
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 252
    .local v0, "EncodedRecipients":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->recipients:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 254
    :try_start_0
    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->getEncodedRecipient(I)[B

    move-result-object v2

    .line 255
    .local v2, "cms":[B
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfLiteral;

    invoke-static {v2}, Lcom/itextpdf/io/util/StreamUtil;->createEscapedString([B)[B

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfLiteral;-><init>([B)V

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 260
    nop

    .line 252
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 256
    .end local v2    # "cms":[B
    :catch_0
    move-exception v2

    goto :goto_1

    :catch_1
    move-exception v2

    .line 257
    .local v2, "e":Ljava/lang/Exception;
    :goto_1
    const/4 v0, 0x0

    .line 259
    nop

    .line 263
    .end local v1    # "i":I
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_0
    return-object v0
.end method

.method private getKeyLength(Lcom/itextpdf/kernel/pdf/PdfDictionary;)I
    .locals 2
    .param p1, "encryptionDict"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 303
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Length:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsInt(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Integer;

    move-result-object v0

    .line 304
    .local v0, "keyLength":Ljava/lang/Integer;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_0

    :cond_0
    const/16 v1, 0x28

    :goto_0
    return v1
.end method

.method private getRecipientsSize()I
    .locals 1

    .line 197
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->recipients:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method private getSeed()[B
    .locals 4

    .line 191
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->seed:[B

    array-length v0, v0

    new-array v0, v0, [B

    .line 192
    .local v0, "clonedSeed":[B
    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->seed:[B

    iget-object v2, p0, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->seed:[B

    array-length v2, v2

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 193
    return-object v0
.end method


# virtual methods
.method protected addAllRecipients([Ljava/security/cert/Certificate;[I)V
    .locals 3
    .param p1, "certs"    # [Ljava/security/cert/Certificate;
    .param p2, "permissions"    # [I

    .line 136
    if-eqz p1, :cond_0

    .line 137
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 138
    aget-object v1, p1, v0

    aget v2, p2, v0

    invoke-direct {p0, v1, v2}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->addRecipient(Ljava/security/cert/Certificate;I)V

    .line 137
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 141
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method protected computeGlobalKey(Ljava/lang/String;Z)[B
    .locals 3
    .param p1, "messageDigestAlgorithm"    # Ljava/lang/String;
    .param p2, "encryptMetadata"    # Z

    .line 83
    :try_start_0
    invoke-static {p1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 84
    .local v0, "md":Ljava/security/MessageDigest;
    invoke-direct {p0}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->getSeed()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 85
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-direct {p0}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->getRecipientsSize()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 86
    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->getEncodedRecipient(I)[B

    move-result-object v2

    .line 87
    .local v2, "encodedRecipient":[B
    invoke-virtual {v0, v2}, Ljava/security/MessageDigest;->update([B)V

    .line 85
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 89
    .end local v1    # "i":I
    .end local v2    # "encodedRecipient":[B
    :cond_0
    if-nez p2, :cond_1

    .line 90
    const/4 v1, 0x4

    new-array v1, v1, [B

    fill-array-data v1, :array_0

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V
    :try_end_0
    .catch Lcom/itextpdf/kernel/exceptions/PdfException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    :cond_1
    nop

    .line 99
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    return-object v1

    .line 95
    .end local v0    # "md":Ljava/security/MessageDigest;
    :catch_0
    move-exception v0

    .line 96
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "PdfEncryption exception."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 93
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 94
    .local v0, "pdfException":Lcom/itextpdf/kernel/exceptions/PdfException;
    throw v0

    :array_0
    .array-data 1
        -0x1t
        -0x1t
        -0x1t
        -0x1t
    .end array-data
.end method

.method protected createRecipientsArray()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 3

    .line 146
    :try_start_0
    invoke-direct {p0}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->getEncodedRecipients()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 149
    .local v0, "recipients":Lcom/itextpdf/kernel/pdf/PdfArray;
    nop

    .line 150
    return-object v0

    .line 147
    .end local v0    # "recipients":Lcom/itextpdf/kernel/pdf/PdfArray;
    :catch_0
    move-exception v0

    .line 148
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "PdfEncryption exception."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected abstract getDigestAlgorithm()Ljava/lang/String;
.end method

.method protected abstract initKey([BI)V
.end method

.method protected initKeyAndFillDictionary(Lcom/itextpdf/kernel/pdf/PdfDictionary;[Ljava/security/cert/Certificate;[IZZ)V
    .locals 3
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "certs"    # [Ljava/security/cert/Certificate;
    .param p3, "permissions"    # [I
    .param p4, "encryptMetadata"    # Z
    .param p5, "embeddedFilesOnly"    # Z

    .line 162
    invoke-virtual {p0, p2, p3}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->addAllRecipients([Ljava/security/cert/Certificate;[I)V

    .line 164
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->getKeyLength(Lcom/itextpdf/kernel/pdf/PdfDictionary;)I

    move-result v0

    .line 166
    .local v0, "keyLength":I
    invoke-virtual {p0}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->getDigestAlgorithm()Ljava/lang/String;

    move-result-object v1

    .line 167
    .local v1, "digestAlgorithm":Ljava/lang/String;
    invoke-virtual {p0, v1, p4}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->computeGlobalKey(Ljava/lang/String;Z)[B

    move-result-object v2

    .line 168
    .local v2, "digest":[B
    invoke-virtual {p0, v2, v0}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->initKey([BI)V

    .line 170
    invoke-virtual {p0, p1, p4, p5}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->setPubSecSpecificHandlerDicEntries(Lcom/itextpdf/kernel/pdf/PdfDictionary;ZZ)V

    .line 171
    return-void
.end method

.method protected initKeyAndReadDictionary(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/security/Key;Ljava/security/cert/Certificate;Ljava/lang/String;Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;Z)V
    .locals 7
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "certificateKey"    # Ljava/security/Key;
    .param p3, "certificate"    # Ljava/security/cert/Certificate;
    .param p4, "certificateKeyProvider"    # Ljava/lang/String;
    .param p5, "externalDecryptionProcess"    # Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;
    .param p6, "encryptMetadata"    # Z

    .line 177
    invoke-virtual {p0}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->getDigestAlgorithm()Ljava/lang/String;

    move-result-object v6

    .line 178
    .local v6, "digestAlgorithm":Ljava/lang/String;
    move-object v1, p2

    check-cast v1, Ljava/security/PrivateKey;

    move-object v0, p1

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move v5, p6

    .end local p1    # "encryptionDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local p3    # "certificate":Ljava/security/cert/Certificate;
    .end local p4    # "certificateKeyProvider":Ljava/lang/String;
    .end local p5    # "externalDecryptionProcess":Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;
    .end local p6    # "encryptMetadata":Z
    .local v0, "encryptionDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .local v2, "certificate":Ljava/security/cert/Certificate;
    .local v3, "certificateKeyProvider":Ljava/lang/String;
    .local v4, "externalDecryptionProcess":Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;
    .local v5, "encryptMetadata":Z
    invoke-static/range {v0 .. v6}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->computeGlobalKeyOnReading(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/security/PrivateKey;Ljava/security/cert/Certificate;Ljava/lang/String;Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;ZLjava/lang/String;)[B

    move-result-object p1

    .line 181
    .local p1, "encryptionKey":[B
    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->getKeyLength(Lcom/itextpdf/kernel/pdf/PdfDictionary;)I

    move-result p3

    .line 182
    .local p3, "keyLength":I
    invoke-virtual {p0, p1, p3}, Lcom/itextpdf/kernel/crypto/securityhandler/PubKeySecurityHandler;->initKey([BI)V

    .line 183
    return-void
.end method

.method protected abstract setPubSecSpecificHandlerDicEntries(Lcom/itextpdf/kernel/pdf/PdfDictionary;ZZ)V
.end method
