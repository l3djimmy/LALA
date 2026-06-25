.class final Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;
.super Ljava/lang/Object;
.source "EncryptionUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils$DERForRecipientParams;
    }
.end annotation


# static fields
.field private static final BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

.field private static final ENVELOPE_ENCRYPTION_ALGORITHM_JCA_NAME:Ljava/lang/String; = "AES/CBC/PKCS5Padding"

.field private static final ENVELOPE_ENCRYPTION_ALGORITHM_OID:Ljava/lang/String; = "2.16.840.1.101.3.4.1.42"

.field private static final ENVELOPE_ENCRYPTION_KEY_LENGTH:I = 0x100

.field private static final UNSUPPORTED_ALGORITHMS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 76
    invoke-static {}, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->getFactory()Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    .line 78
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->UNSUPPORTED_ALGORITHMS:Ljava/util/Set;

    .line 81
    sget-object v0, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->UNSUPPORTED_ALGORITHMS:Ljava/util/Set;

    const-string v1, "1.2.840.10045.2.1"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 82
    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static calculateDERForRecipientParams([B)Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils$DERForRecipientParams;
    .locals 11
    .param p0, "in"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 172
    new-instance v0, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils$DERForRecipientParams;

    invoke-direct {v0}, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils$DERForRecipientParams;-><init>()V

    .line 174
    .local v0, "parameters":Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils$DERForRecipientParams;
    const-string v1, "2.16.840.1.101.3.4.1.42"

    invoke-static {v1}, Ljava/security/AlgorithmParameterGenerator;->getInstance(Ljava/lang/String;)Ljava/security/AlgorithmParameterGenerator;

    move-result-object v2

    .line 176
    .local v2, "algorithmparametergenerator":Ljava/security/AlgorithmParameterGenerator;
    invoke-virtual {v2}, Ljava/security/AlgorithmParameterGenerator;->generateParameters()Ljava/security/AlgorithmParameters;

    move-result-object v3

    .line 177
    .local v3, "algorithmparameters":Ljava/security/AlgorithmParameters;
    new-instance v4, Ljava/io/ByteArrayInputStream;

    const-string v5, "ASN.1"

    invoke-virtual {v3, v5}, Ljava/security/AlgorithmParameters;->getEncoded(Ljava/lang/String;)[B

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 179
    .local v4, "bytearrayinputstream":Ljava/io/ByteArrayInputStream;
    sget-object v5, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-interface {v5, v4}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createASN1InputStream(Ljava/io/InputStream;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;

    move-result-object v5

    .line 180
    .local v5, "asn1inputstream":Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;
    :try_start_0
    invoke-interface {v5}, Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;->readObject()Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;

    move-result-object v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 181
    .local v6, "derobject":Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;
    if-eqz v5, :cond_0

    invoke-interface {v5}, Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;->close()V

    .line 184
    .end local v5    # "asn1inputstream":Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;
    :cond_0
    sget-object v5, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-interface {v5}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->getProviderName()Ljava/lang/String;

    move-result-object v5

    const-string v7, "BC"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 187
    invoke-static {v1}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    move-result-object v5

    .local v5, "keygenerator":Ljavax/crypto/KeyGenerator;
    goto :goto_0

    .line 189
    .end local v5    # "keygenerator":Ljavax/crypto/KeyGenerator;
    :cond_1
    sget-object v5, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    .line 190
    invoke-interface {v5}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->getProvider()Ljava/security/Provider;

    move-result-object v5

    .line 189
    invoke-static {v1, v5}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljavax/crypto/KeyGenerator;

    move-result-object v5

    .line 192
    .restart local v5    # "keygenerator":Ljavax/crypto/KeyGenerator;
    :goto_0
    sget-object v8, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-interface {v8}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->getSecureRandom()Ljava/security/SecureRandom;

    move-result-object v8

    const/16 v9, 0x100

    invoke-virtual {v5, v9, v8}, Ljavax/crypto/KeyGenerator;->init(ILjava/security/SecureRandom;)V

    .line 193
    invoke-virtual {v5}, Ljavax/crypto/KeyGenerator;->generateKey()Ljavax/crypto/SecretKey;

    move-result-object v8

    .line 196
    .local v8, "secretkey":Ljavax/crypto/SecretKey;
    sget-object v9, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-interface {v9}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->getProviderName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    const-string v9, "AES/CBC/PKCS5Padding"

    if-eqz v7, :cond_2

    .line 199
    invoke-static {v9}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v7

    .local v7, "cipher":Ljavax/crypto/Cipher;
    goto :goto_1

    .line 201
    .end local v7    # "cipher":Ljavax/crypto/Cipher;
    :cond_2
    sget-object v7, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-interface {v7}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->getProvider()Ljava/security/Provider;

    move-result-object v7

    invoke-static {v9, v7}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljavax/crypto/Cipher;

    move-result-object v7

    .line 203
    .restart local v7    # "cipher":Ljavax/crypto/Cipher;
    :goto_1
    const/4 v9, 0x1

    invoke-virtual {v7, v9, v8, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/AlgorithmParameters;)V

    .line 205
    invoke-interface {v8}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v9

    iput-object v9, v0, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils$DERForRecipientParams;->abyte0:[B

    .line 206
    invoke-virtual {v7, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v9

    iput-object v9, v0, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils$DERForRecipientParams;->abyte1:[B

    .line 207
    sget-object v9, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    sget-object v10, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    .line 208
    invoke-interface {v10, v1}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createASN1ObjectIdentifier(Ljava/lang/String;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;

    move-result-object v1

    .line 207
    invoke-interface {v9, v1, v6}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createAlgorithmIdentifier(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;

    move-result-object v1

    iput-object v1, v0, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils$DERForRecipientParams;->algorithmIdentifier:Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;

    .line 210
    return-object v0

    .line 179
    .end local v6    # "derobject":Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;
    .end local v7    # "cipher":Ljavax/crypto/Cipher;
    .end local v8    # "secretkey":Ljavax/crypto/SecretKey;
    .local v5, "asn1inputstream":Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;
    :catchall_0
    move-exception v1

    .end local v0    # "parameters":Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils$DERForRecipientParams;
    .end local v2    # "algorithmparametergenerator":Ljava/security/AlgorithmParameterGenerator;
    .end local v3    # "algorithmparameters":Ljava/security/AlgorithmParameters;
    .end local v4    # "bytearrayinputstream":Ljava/io/ByteArrayInputStream;
    .end local v5    # "asn1inputstream":Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;
    .end local p0    # "in":[B
    :try_start_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 181
    .restart local v0    # "parameters":Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils$DERForRecipientParams;
    .restart local v2    # "algorithmparametergenerator":Ljava/security/AlgorithmParameterGenerator;
    .restart local v3    # "algorithmparameters":Ljava/security/AlgorithmParameters;
    .restart local v4    # "bytearrayinputstream":Ljava/io/ByteArrayInputStream;
    .restart local v5    # "asn1inputstream":Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;
    .restart local p0    # "in":[B
    :catchall_1
    move-exception v6

    if-eqz v5, :cond_3

    :try_start_2
    invoke-interface {v5}, Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_2

    :catchall_2
    move-exception v7

    invoke-virtual {v1, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_2
    throw v6
.end method

.method static cipherBytes(Ljava/security/cert/X509Certificate;[BLcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;)[B
    .locals 4
    .param p0, "x509certificate"    # Ljava/security/cert/X509Certificate;
    .param p1, "abyte0"    # [B
    .param p2, "algorithmIdentifier"    # Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 162
    invoke-interface {p2}, Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;->getAlgorithm()Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;

    move-result-object v0

    invoke-interface {v0}, Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v0

    .line 163
    .local v0, "algorithm":Ljava/lang/String;
    sget-object v1, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->UNSUPPORTED_ALGORITHMS:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 167
    sget-object v1, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-interface {v1, p0, p1, p2}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createCipherBytes(Ljava/security/cert/X509Certificate;[BLcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;)[B

    move-result-object v1

    return-object v1

    .line 164
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Algorithm {0} is not supported."

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static fetchEnvelopedData(Ljava/security/Key;Ljava/security/cert/Certificate;Ljava/lang/String;Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;Lcom/itextpdf/kernel/pdf/PdfArray;)[B
    .locals 10
    .param p0, "certificateKey"    # Ljava/security/Key;
    .param p1, "certificate"    # Ljava/security/cert/Certificate;
    .param p2, "certificateKeyProvider"    # Ljava/lang/String;
    .param p3, "externalDecryptionProcess"    # Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;
    .param p4, "recipients"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 102
    const-string v0, "Exception occurred with PDF document decryption. One of the possible reasons is wrong password or wrong public key certificate and private key."

    const/4 v1, 0x0

    .line 103
    .local v1, "foundRecipient":Z
    const/4 v2, 0x0

    .line 107
    .local v2, "envelopedData":[B
    :try_start_0
    sget-object v3, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-virtual {p1}, Ljava/security/cert/Certificate;->getEncoded()[B

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createX509CertificateHolder([B)Lcom/itextpdf/commons/bouncycastle/cert/IX509CertificateHolder;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 110
    .local v3, "certHolder":Lcom/itextpdf/commons/bouncycastle/cert/IX509CertificateHolder;
    nop

    .line 111
    if-nez p3, :cond_3

    .line 112
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v5

    if-ge v4, v5, :cond_2

    .line 113
    invoke-virtual {p4, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsString(I)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v5

    .line 116
    .local v5, "recipient":Lcom/itextpdf/kernel/pdf/PdfString;
    :try_start_1
    sget-object v6, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfString;->getValueBytes()[B

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createCMSEnvelopedData([B)Lcom/itextpdf/commons/bouncycastle/cms/ICMSEnvelopedData;

    move-result-object v6

    .line 117
    .local v6, "data":Lcom/itextpdf/commons/bouncycastle/cms/ICMSEnvelopedData;
    nop

    .line 118
    invoke-interface {v6}, Lcom/itextpdf/commons/bouncycastle/cms/ICMSEnvelopedData;->getRecipientInfos()Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformationStore;

    move-result-object v7

    invoke-interface {v7}, Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformationStore;->getRecipients()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .line 119
    .local v7, "recipientCertificatesIt":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformation;>;"
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 120
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformation;

    .line 122
    .local v8, "recipientInfo":Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformation;
    invoke-interface {v8}, Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformation;->getRID()Lcom/itextpdf/commons/bouncycastle/cms/IRecipientId;

    move-result-object v9

    invoke-interface {v9, v3}, Lcom/itextpdf/commons/bouncycastle/cms/IRecipientId;->match(Lcom/itextpdf/commons/bouncycastle/cert/IX509CertificateHolder;)Z

    move-result v9

    if-eqz v9, :cond_0

    if-nez v1, :cond_0

    .line 123
    move-object v9, p0

    check-cast v9, Ljava/security/PrivateKey;

    invoke-static {v8, v9, p2}, Lcom/itextpdf/kernel/pdf/PdfEncryptor;->getContent(Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformation;Ljava/security/PrivateKey;Ljava/lang/String;)[B

    move-result-object v9
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object v2, v9

    .line 125
    const/4 v1, 0x1

    .line 127
    .end local v8    # "recipientInfo":Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformation;
    :cond_0
    goto :goto_1

    .line 134
    .end local v7    # "recipientCertificatesIt":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformation;>;"
    :cond_1
    nop

    .line 112
    .end local v5    # "recipient":Lcom/itextpdf/kernel/pdf/PdfString;
    .end local v6    # "data":Lcom/itextpdf/commons/bouncycastle/cms/ICMSEnvelopedData;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 128
    .restart local v5    # "recipient":Lcom/itextpdf/kernel/pdf/PdfString;
    :catch_0
    move-exception v6

    .line 131
    .local v6, "f":Ljava/lang/Exception;
    invoke-static {}, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->getFactory()Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    move-result-object v7

    const/4 v8, 0x0

    const/4 v9, 0x1

    invoke-interface {v7, v8, v9}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->isEncryptionFeatureSupported(IZ)V

    .line 133
    new-instance v7, Lcom/itextpdf/kernel/exceptions/PdfException;

    invoke-direct {v7, v0, v6}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 112
    .end local v4    # "i":I
    .end local v5    # "recipient":Lcom/itextpdf/kernel/pdf/PdfString;
    .end local v6    # "f":Ljava/lang/Exception;
    :cond_2
    goto :goto_3

    .line 137
    :cond_3
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_2
    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v5

    if-ge v4, v5, :cond_5

    .line 138
    invoke-virtual {p4, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsString(I)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v5

    .line 141
    .restart local v5    # "recipient":Lcom/itextpdf/kernel/pdf/PdfString;
    :try_start_2
    sget-object v6, Lcom/itextpdf/kernel/crypto/securityhandler/EncryptionUtils;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/PdfString;->getValueBytes()[B

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createCMSEnvelopedData([B)Lcom/itextpdf/commons/bouncycastle/cms/ICMSEnvelopedData;

    move-result-object v6

    .line 142
    .local v6, "data":Lcom/itextpdf/commons/bouncycastle/cms/ICMSEnvelopedData;
    invoke-interface {v6}, Lcom/itextpdf/commons/bouncycastle/cms/ICMSEnvelopedData;->getRecipientInfos()Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformationStore;

    move-result-object v7

    .line 143
    invoke-interface {p3}, Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;->getCmsRecipientId()Lcom/itextpdf/commons/bouncycastle/cms/IRecipientId;

    move-result-object v8

    invoke-interface {v7, v8}, Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformationStore;->get(Lcom/itextpdf/commons/bouncycastle/cms/IRecipientId;)Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformation;

    move-result-object v7

    .line 144
    .local v7, "recipientInfo":Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformation;
    if-eqz v7, :cond_4

    .line 145
    invoke-interface {p3}, Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;->getCmsRecipient()Lcom/itextpdf/commons/bouncycastle/cms/IRecipient;

    move-result-object v8

    invoke-interface {v7, v8}, Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformation;->getContent(Lcom/itextpdf/commons/bouncycastle/cms/IRecipient;)[B

    move-result-object v8
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 146
    .end local v2    # "envelopedData":[B
    .local v8, "envelopedData":[B
    const/4 v1, 0x1

    move-object v2, v8

    .line 150
    .end local v7    # "recipientInfo":Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformation;
    .end local v8    # "envelopedData":[B
    .restart local v2    # "envelopedData":[B
    :cond_4
    nop

    .line 137
    .end local v5    # "recipient":Lcom/itextpdf/kernel/pdf/PdfString;
    .end local v6    # "data":Lcom/itextpdf/commons/bouncycastle/cms/ICMSEnvelopedData;
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 148
    .restart local v5    # "recipient":Lcom/itextpdf/kernel/pdf/PdfString;
    :catch_1
    move-exception v6

    .line 149
    .local v6, "f":Ljava/lang/Exception;
    new-instance v7, Lcom/itextpdf/kernel/exceptions/PdfException;

    invoke-direct {v7, v0, v6}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 154
    .end local v4    # "i":I
    .end local v5    # "recipient":Lcom/itextpdf/kernel/pdf/PdfString;
    .end local v6    # "f":Ljava/lang/Exception;
    :cond_5
    :goto_3
    if-eqz v1, :cond_6

    if-eqz v2, :cond_6

    .line 157
    return-object v2

    .line 155
    :cond_6
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v4, "Bad public key certificate and/or private key."

    invoke-direct {v0, v4}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    .end local v3    # "certHolder":Lcom/itextpdf/commons/bouncycastle/cert/IX509CertificateHolder;
    :catch_2
    move-exception v3

    .line 109
    .local v3, "f":Ljava/lang/Exception;
    new-instance v4, Lcom/itextpdf/kernel/exceptions/PdfException;

    invoke-direct {v4, v0, v3}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method static generateSeed(I)[B
    .locals 5
    .param p0, "seedLength"    # I

    .line 88
    :try_start_0
    const-string v0, "AES"

    invoke-static {v0}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    move-result-object v0

    .line 89
    .local v0, "key":Ljavax/crypto/KeyGenerator;
    new-instance v1, Ljava/security/SecureRandom;

    invoke-direct {v1}, Ljava/security/SecureRandom;-><init>()V

    const/16 v2, 0xc0

    invoke-virtual {v0, v2, v1}, Ljavax/crypto/KeyGenerator;->init(ILjava/security/SecureRandom;)V

    .line 90
    invoke-virtual {v0}, Ljavax/crypto/KeyGenerator;->generateKey()Ljavax/crypto/SecretKey;

    move-result-object v1

    .line 91
    .local v1, "sk":Ljavax/crypto/SecretKey;
    new-array v2, p0, [B

    .line 93
    .local v2, "seedBytes":[B
    invoke-interface {v1}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v4, v2, v4, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    .end local v1    # "sk":Ljavax/crypto/SecretKey;
    goto :goto_0

    .line 94
    .end local v0    # "key":Ljavax/crypto/KeyGenerator;
    .end local v2    # "seedBytes":[B
    :catch_0
    move-exception v0

    .line 95
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-static {p0}, Ljava/security/SecureRandom;->getSeed(I)[B

    move-result-object v2

    .line 97
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    .restart local v2    # "seedBytes":[B
    :goto_0
    return-object v2
.end method
