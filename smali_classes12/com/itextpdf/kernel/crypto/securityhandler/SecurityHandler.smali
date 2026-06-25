.class public abstract Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;
.super Ljava/lang/Object;
.source "SecurityHandler.java"


# static fields
.field private static final FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

.field private static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field protected extra:[B

.field protected md5:Ljava/security/MessageDigest;

.field protected mkey:[B

.field protected nextObjectKey:[B

.field protected nextObjectKeySize:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 38
    invoke-static {}, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->getFactory()Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    .line 39
    const-class v0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x0

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->mkey:[B

    .line 64
    const/4 v0, 0x5

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->extra:[B

    .line 67
    invoke-direct {p0}, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->safeInitMessageDigest()V

    .line 68
    return-void
.end method

.method private safeInitMessageDigest()V
    .locals 3

    .line 100
    :try_start_0
    const-string v0, "MD5"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->md5:Ljava/security/MessageDigest;

    .line 101
    sget-object v0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-interface {v0}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->isInApprovedOnlyMode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 102
    sget-object v0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "MD5 hash algorithm is not FIPS compliant. However we still use this algorithm since it is required according to the PDF specification."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    :cond_0
    nop

    .line 107
    return-void

    .line 104
    :catch_0
    move-exception v0

    .line 105
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "PdfEncryption exception."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public abstract getDecryptor()Lcom/itextpdf/kernel/crypto/IDecryptor;
.end method

.method public abstract getEncryptionStream(Ljava/io/OutputStream;)Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;
.end method

.method public setHashKeyForNextObject(II)V
    .locals 3
    .param p1, "objNumber"    # I
    .param p2, "objGeneration"    # I

    .line 79
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v0}, Ljava/security/MessageDigest;->reset()V

    .line 80
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->extra:[B

    const/4 v1, 0x0

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 81
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->extra:[B

    shr-int/lit8 v1, p1, 0x8

    int-to-byte v1, v1

    const/4 v2, 0x1

    aput-byte v1, v0, v2

    .line 82
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->extra:[B

    shr-int/lit8 v1, p1, 0x10

    int-to-byte v1, v1

    const/4 v2, 0x2

    aput-byte v1, v0, v2

    .line 83
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->extra:[B

    const/4 v1, 0x3

    int-to-byte v2, p2

    aput-byte v2, v0, v1

    .line 84
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->extra:[B

    shr-int/lit8 v1, p2, 0x8

    int-to-byte v1, v1

    const/4 v2, 0x4

    aput-byte v1, v0, v2

    .line 85
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->md5:Ljava/security/MessageDigest;

    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->mkey:[B

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 86
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->md5:Ljava/security/MessageDigest;

    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->extra:[B

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 87
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->md5:Ljava/security/MessageDigest;

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->nextObjectKey:[B

    .line 88
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->mkey:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x5

    iput v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->nextObjectKeySize:I

    .line 89
    iget v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->nextObjectKeySize:I

    const/16 v1, 0x10

    if-le v0, v1, :cond_0

    .line 90
    iput v1, p0, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;->nextObjectKeySize:I

    .line 92
    :cond_0
    return-void
.end method
