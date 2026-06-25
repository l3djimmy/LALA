.class public Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;
.super Ljava/lang/Object;
.source "AESCipherCBCnoPad.java"


# static fields
.field private static final BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

.field private static final CIPHER_WITHOUT_PADDING:Ljava/lang/String; = "AES/CBC/NoPadding"

.field private static cipher:Ljavax/crypto/Cipher;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 45
    invoke-static {}, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->getFactory()Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    .line 51
    :try_start_0
    const-string v0, "BC"

    sget-object v1, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-interface {v1}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->getProviderName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v1, "AES/CBC/NoPadding"

    if-eqz v0, :cond_0

    .line 54
    :try_start_1
    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;->cipher:Ljavax/crypto/Cipher;

    goto :goto_0

    .line 56
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-interface {v0}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->getProvider()Ljava/security/Provider;

    move-result-object v0

    invoke-static {v1, v0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljavax/crypto/Cipher;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;->cipher:Ljavax/crypto/Cipher;
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_1 .. :try_end_1} :catch_0

    .line 60
    :goto_0
    nop

    .line 61
    return-void

    .line 58
    :catch_0
    move-exception v0

    .line 59
    .local v0, "e":Ljava/security/GeneralSecurityException;
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Exception initializing AES cipher."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public constructor <init>(Z[B)V
    .locals 1
    .param p1, "forEncryption"    # Z
    .param p2, "key"    # [B

    .line 71
    const/16 v0, 0x10

    new-array v0, v0, [B

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;-><init>(Z[B[B)V

    .line 72
    return-void
.end method

.method public constructor <init>(Z[B[B)V
    .locals 4
    .param p1, "forEncryption"    # Z
    .param p2, "key"    # [B
    .param p3, "initVector"    # [B

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    :try_start_0
    sget-object v0, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;->cipher:Ljavax/crypto/Cipher;

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    :goto_0
    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    const-string v3, "AES"

    invoke-direct {v2, p2, v3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    new-instance v3, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v3, p3}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    invoke-virtual {v0, v1, v2, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_0 .. :try_end_0} :catch_0

    .line 89
    nop

    .line 90
    return-void

    .line 87
    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    .line 88
    .local v0, "e":Ljava/security/GeneralSecurityException;
    :goto_1
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Exception initializing AES cipher."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public processBlock([BII)[B
    .locals 1
    .param p1, "inp"    # [B
    .param p2, "inpOff"    # I
    .param p3, "inpLen"    # I

    .line 93
    sget-object v0, Lcom/itextpdf/kernel/crypto/AESCipherCBCnoPad;->cipher:Ljavax/crypto/Cipher;

    invoke-virtual {v0, p1, p2, p3}, Ljavax/crypto/Cipher;->update([BII)[B

    move-result-object v0

    return-object v0
.end method
