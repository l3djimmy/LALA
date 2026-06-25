.class public Lcom/itextpdf/kernel/crypto/CryptoUtil;
.super Ljava/lang/Object;
.source "CryptoUtil.java"


# static fields
.field private static final BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 44
    invoke-static {}, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->getFactory()Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/crypto/CryptoUtil;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    return-void
.end method

.method public static createAsn1OutputStream(Ljava/io/OutputStream;Ljava/lang/String;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OutputStream;
    .locals 3
    .param p0, "outputStream"    # Ljava/io/OutputStream;
    .param p1, "asn1Encoding"    # Ljava/lang/String;

    .line 64
    sget-object v0, Lcom/itextpdf/kernel/crypto/CryptoUtil;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-interface {v0}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createASN1Encoding()Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encoding;

    move-result-object v0

    invoke-interface {v0}, Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encoding;->getDer()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/itextpdf/kernel/crypto/CryptoUtil;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    .line 65
    invoke-interface {v0}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createASN1Encoding()Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encoding;

    move-result-object v0

    invoke-interface {v0}, Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encoding;->getBer()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 66
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v1

    .line 67
    const-string v2, "Unknown ASN1-encoding {0}. Only DER and BER encodings are supported!"

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
    :cond_1
    :goto_0
    sget-object v0, Lcom/itextpdf/kernel/crypto/CryptoUtil;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-interface {v0, p0, p1}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createASN1OutputStream(Ljava/io/OutputStream;Ljava/lang/String;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public static readPublicCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;
    .locals 1
    .param p0, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .line 51
    const-string v0, "X.509"

    invoke-static {v0}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v0

    return-object v0
.end method
