.class public interface abstract Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;
.super Ljava/lang/Object;
.source "IBouncyCastleFactory.java"


# virtual methods
.method public abstract createASN1BitString(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1BitString;
.end method

.method public abstract createASN1Dump()Lcom/itextpdf/commons/bouncycastle/asn1/util/IASN1Dump;
.end method

.method public abstract createASN1EncodableVector()Lcom/itextpdf/commons/bouncycastle/asn1/IASN1EncodableVector;
.end method

.method public abstract createASN1Encoding()Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encoding;
.end method

.method public abstract createASN1Enumerated(I)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Enumerated;
.end method

.method public abstract createASN1Enumerated(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Enumerated;
.end method

.method public abstract createASN1GeneralizedTime(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1GeneralizedTime;
.end method

.method public abstract createASN1InputStream(Ljava/io/InputStream;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;
.end method

.method public abstract createASN1InputStream([B)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;
.end method

.method public abstract createASN1Integer(I)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Integer;
.end method

.method public abstract createASN1Integer(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Integer;
.end method

.method public abstract createASN1Integer(Ljava/math/BigInteger;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Integer;
.end method

.method public abstract createASN1ObjectIdentifier(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;
.end method

.method public abstract createASN1ObjectIdentifier(Ljava/lang/String;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;
.end method

.method public abstract createASN1ObjectIdentifierInstance(Ljava/lang/Object;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;
.end method

.method public abstract createASN1OctetString(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;
.end method

.method public abstract createASN1OctetString(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1TaggedObject;Z)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;
.end method

.method public abstract createASN1OctetString([B)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;
.end method

.method public abstract createASN1OutputStream(Ljava/io/OutputStream;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OutputStream;
.end method

.method public abstract createASN1OutputStream(Ljava/io/OutputStream;Ljava/lang/String;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OutputStream;
.end method

.method public abstract createASN1Primitive(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;
.end method

.method public abstract createASN1Primitive([B)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract createASN1Sequence(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Sequence;
.end method

.method public abstract createASN1Sequence(Ljava/lang/Object;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Sequence;
.end method

.method public abstract createASN1Sequence([B)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Sequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract createASN1SequenceInstance(Ljava/lang/Object;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Sequence;
.end method

.method public abstract createASN1Set(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;
.end method

.method public abstract createASN1Set(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1TaggedObject;Z)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;
.end method

.method public abstract createASN1Set(Ljava/lang/Object;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;
.end method

.method public abstract createASN1String(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1String;
.end method

.method public abstract createASN1TaggedObject(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1TaggedObject;
.end method

.method public abstract createASN1UTCTime(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1UTCTime;
.end method

.method public abstract createAbstractOCSPException(Ljava/lang/Exception;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/AbstractOCSPException;
.end method

.method public abstract createAlgorithmIdentifier(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;
.end method

.method public abstract createAlgorithmIdentifier(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;
.end method

.method public abstract createAttribute(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IAttribute;
.end method

.method public abstract createAttributeTable(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IAttributeTable;
.end method

.method public abstract createBasicConstraints(I)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IBasicConstraints;
.end method

.method public abstract createBasicConstraints(Z)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IBasicConstraints;
.end method

.method public abstract createBasicOCSPResp(Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IBasicOCSPResponse;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IBasicOCSPResp;
.end method

.method public abstract createBasicOCSPResp(Ljava/lang/Object;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IBasicOCSPResp;
.end method

.method public abstract createBasicOCSPRespBuilder(Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IRespID;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IBasicOCSPRespBuilder;
.end method

.method public abstract createBasicOCSPResponse(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;)Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IBasicOCSPResponse;
.end method

.method public abstract createBasicOCSPResponse([B)Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IBasicOCSPResponse;
.end method

.method public abstract createCMSEnvelopedData([B)Lcom/itextpdf/commons/bouncycastle/cms/ICMSEnvelopedData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/cms/AbstractCMSException;
        }
    .end annotation
.end method

.method public abstract createCRLDistPoint(Ljava/lang/Object;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/ICRLDistPoint;
.end method

.method public abstract createCRLReason()Lcom/itextpdf/commons/bouncycastle/asn1/x509/ICRLReason;
.end method

.method public abstract createCertificateID()Lcom/itextpdf/commons/bouncycastle/cert/ocsp/ICertificateID;
.end method

.method public abstract createCertificateID(Lcom/itextpdf/commons/bouncycastle/operator/IDigestCalculator;Lcom/itextpdf/commons/bouncycastle/cert/IX509CertificateHolder;Ljava/math/BigInteger;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/ICertificateID;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/cert/ocsp/AbstractOCSPException;
        }
    .end annotation
.end method

.method public abstract createCertificateStatus()Lcom/itextpdf/commons/bouncycastle/cert/ocsp/ICertificateStatus;
.end method

.method public abstract createCipherBytes(Ljava/security/cert/X509Certificate;[BLcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation
.end method

.method public abstract createContentInfo(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IContentInfo;
.end method

.method public abstract createContentInfo(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Sequence;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IContentInfo;
.end method

.method public abstract createDERIA5String(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1TaggedObject;Z)Lcom/itextpdf/commons/bouncycastle/asn1/IDERIA5String;
.end method

.method public abstract createDERIA5String(Ljava/lang/String;)Lcom/itextpdf/commons/bouncycastle/asn1/IDERIA5String;
.end method

.method public abstract createDERNull()Lcom/itextpdf/commons/bouncycastle/asn1/IDERNull;
.end method

.method public abstract createDEROctetString(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IDEROctetString;
.end method

.method public abstract createDEROctetString([B)Lcom/itextpdf/commons/bouncycastle/asn1/IDEROctetString;
.end method

.method public abstract createDERSequence(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1EncodableVector;)Lcom/itextpdf/commons/bouncycastle/asn1/IDERSequence;
.end method

.method public abstract createDERSequence(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;)Lcom/itextpdf/commons/bouncycastle/asn1/IDERSequence;
.end method

.method public abstract createDERSet(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1EncodableVector;)Lcom/itextpdf/commons/bouncycastle/asn1/IDERSet;
.end method

.method public abstract createDERSet(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;)Lcom/itextpdf/commons/bouncycastle/asn1/IDERSet;
.end method

.method public abstract createDERSet(Lcom/itextpdf/commons/bouncycastle/asn1/cms/IRecipientInfo;)Lcom/itextpdf/commons/bouncycastle/asn1/IDERSet;
.end method

.method public abstract createDERSet(Lcom/itextpdf/commons/bouncycastle/asn1/esf/ISignaturePolicyIdentifier;)Lcom/itextpdf/commons/bouncycastle/asn1/IDERSet;
.end method

.method public abstract createDERTaggedObject(ILcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;)Lcom/itextpdf/commons/bouncycastle/asn1/IDERTaggedObject;
.end method

.method public abstract createDERTaggedObject(ZILcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;)Lcom/itextpdf/commons/bouncycastle/asn1/IDERTaggedObject;
.end method

.method public abstract createDistributionPointName()Lcom/itextpdf/commons/bouncycastle/asn1/x509/IDistributionPointName;
.end method

.method public abstract createDistributionPointName(Lcom/itextpdf/commons/bouncycastle/asn1/x509/IGeneralNames;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IDistributionPointName;
.end method

.method public abstract createEncryptedContentInfo(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IEncryptedContentInfo;
.end method

.method public abstract createEndDate(Ljava/security/cert/X509Certificate;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/ITime;
.end method

.method public abstract createEnvelopedData(Lcom/itextpdf/commons/bouncycastle/asn1/cms/IOriginatorInfo;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;Lcom/itextpdf/commons/bouncycastle/asn1/cms/IEncryptedContentInfo;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IEnvelopedData;
.end method

.method public abstract createExtendedKeyUsage(Lcom/itextpdf/commons/bouncycastle/asn1/x509/IKeyPurposeId;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtendedKeyUsage;
.end method

.method public abstract createExtendedKeyUsage([Lcom/itextpdf/commons/bouncycastle/asn1/x509/IKeyPurposeId;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtendedKeyUsage;
.end method

.method public abstract createExtension()Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtension;
.end method

.method public abstract createExtension(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;ZLcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtension;
.end method

.method public abstract createExtensions(Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtension;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtensions;
.end method

.method public abstract createGeneralName()Lcom/itextpdf/commons/bouncycastle/asn1/x509/IGeneralName;
.end method

.method public abstract createGeneralNames(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IGeneralNames;
.end method

.method public abstract createIssuerAndSerialNumber(Lcom/itextpdf/commons/bouncycastle/asn1/x500/IX500Name;Ljava/math/BigInteger;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IIssuerAndSerialNumber;
.end method

.method public abstract createIssuingDistributionPoint(Lcom/itextpdf/commons/bouncycastle/asn1/x509/IDistributionPointName;ZZLcom/itextpdf/commons/bouncycastle/asn1/x509/IReasonFlags;ZZ)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IIssuingDistributionPoint;
.end method

.method public abstract createIssuingDistributionPoint(Ljava/lang/Object;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IIssuingDistributionPoint;
.end method

.method public abstract createJcaCertStore(Ljava/util/List;)Lcom/itextpdf/commons/bouncycastle/cert/jcajce/IJcaCertStore;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/security/cert/Certificate;",
            ">;)",
            "Lcom/itextpdf/commons/bouncycastle/cert/jcajce/IJcaCertStore;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation
.end method

.method public abstract createJcaContentSignerBuilder(Ljava/lang/String;)Lcom/itextpdf/commons/bouncycastle/operator/jcajce/IJcaContentSignerBuilder;
.end method

.method public abstract createJcaContentVerifierProviderBuilder()Lcom/itextpdf/commons/bouncycastle/operator/jcajce/IJcaContentVerifierProviderBuilder;
.end method

.method public abstract createJcaDigestCalculatorProviderBuilder()Lcom/itextpdf/commons/bouncycastle/operator/jcajce/IJcaDigestCalculatorProviderBuilder;
.end method

.method public abstract createJcaPEMKeyConverter()Lcom/itextpdf/commons/bouncycastle/openssl/jcajce/IJcaPEMKeyConverter;
.end method

.method public abstract createJcaSignerInfoGeneratorBuilder(Lcom/itextpdf/commons/bouncycastle/operator/IDigestCalculatorProvider;)Lcom/itextpdf/commons/bouncycastle/cms/jcajce/IJcaSignerInfoGeneratorBuilder;
.end method

.method public abstract createJcaSimpleSignerInfoVerifierBuilder()Lcom/itextpdf/commons/bouncycastle/cms/jcajce/IJcaSimpleSignerInfoVerifierBuilder;
.end method

.method public abstract createJcaX509CertificateConverter()Lcom/itextpdf/commons/bouncycastle/cert/jcajce/IJcaX509CertificateConverter;
.end method

.method public abstract createJcaX509CertificateHolder(Ljava/security/cert/X509Certificate;)Lcom/itextpdf/commons/bouncycastle/cert/jcajce/IJcaX509CertificateHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation
.end method

.method public abstract createJcaX509v3CertificateBuilder(Ljava/security/cert/X509Certificate;Ljava/math/BigInteger;Ljava/util/Date;Ljava/util/Date;Lcom/itextpdf/commons/bouncycastle/asn1/x500/IX500Name;Ljava/security/PublicKey;)Lcom/itextpdf/commons/bouncycastle/cert/jcajce/IJcaX509v3CertificateBuilder;
.end method

.method public abstract createJceKeyAgreeEnvelopedRecipient(Ljava/security/PrivateKey;)Lcom/itextpdf/commons/bouncycastle/cms/jcajce/IJceKeyAgreeEnvelopedRecipient;
.end method

.method public abstract createJceKeyTransEnvelopedRecipient(Ljava/security/PrivateKey;)Lcom/itextpdf/commons/bouncycastle/cms/jcajce/IJceKeyTransEnvelopedRecipient;
.end method

.method public abstract createJceOpenSSLPKCS8DecryptorProviderBuilder()Lcom/itextpdf/commons/bouncycastle/openssl/jcajce/IJceOpenSSLPKCS8DecryptorProviderBuilder;
.end method

.method public abstract createKeyPurposeId()Lcom/itextpdf/commons/bouncycastle/asn1/x509/IKeyPurposeId;
.end method

.method public abstract createKeyPurposeId(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IKeyPurposeId;
.end method

.method public abstract createKeyTransRecipientInfo(Lcom/itextpdf/commons/bouncycastle/asn1/cms/IRecipientIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IKeyTransRecipientInfo;
.end method

.method public abstract createKeyUsage()Lcom/itextpdf/commons/bouncycastle/asn1/x509/IKeyUsage;
.end method

.method public abstract createKeyUsage(I)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IKeyUsage;
.end method

.method public abstract createNullASN1Set()Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;
.end method

.method public abstract createNullCrl()Ljava/security/cert/CRL;
.end method

.method public abstract createNullExtensions()Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtensions;
.end method

.method public abstract createNullOriginatorInfo()Lcom/itextpdf/commons/bouncycastle/asn1/cms/IOriginatorInfo;
.end method

.method public abstract createOCSPObjectIdentifiers()Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IOCSPObjectIdentifiers;
.end method

.method public abstract createOCSPReq([B)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPReq;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract createOCSPReqBuilder()Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPReqBuilder;
.end method

.method public abstract createOCSPResp()Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPResp;
.end method

.method public abstract createOCSPResp(Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IOCSPResponse;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPResp;
.end method

.method public abstract createOCSPResp([B)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPResp;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract createOCSPRespBuilder()Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPRespBuilder;
.end method

.method public abstract createOCSPRespBuilderInstance()Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPRespBuilder;
.end method

.method public abstract createOCSPResponse(Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IOCSPResponseStatus;Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IResponseBytes;)Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IOCSPResponse;
.end method

.method public abstract createOCSPResponseStatus()Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IOCSPResponseStatus;
.end method

.method public abstract createOCSPResponseStatus(I)Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IOCSPResponseStatus;
.end method

.method public abstract createOtherHashAlgAndValue(Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;)Lcom/itextpdf/commons/bouncycastle/asn1/esf/IOtherHashAlgAndValue;
.end method

.method public abstract createPEMParser(Ljava/io/Reader;)Lcom/itextpdf/commons/bouncycastle/openssl/IPEMParser;
.end method

.method public abstract createPKCSObjectIdentifiers()Lcom/itextpdf/commons/bouncycastle/asn1/pkcs/IPKCSObjectIdentifiers;
.end method

.method public abstract createRSASSAPSSParams(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/pkcs/IRSASSAPSSParams;
.end method

.method public abstract createRSASSAPSSParamsWithMGF1(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;II)Lcom/itextpdf/commons/bouncycastle/asn1/pkcs/IRSASSAPSSParams;
.end method

.method public abstract createReasonFlags(I)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IReasonFlags;
.end method

.method public abstract createRecipientIdentifier(Lcom/itextpdf/commons/bouncycastle/asn1/cms/IIssuerAndSerialNumber;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IRecipientIdentifier;
.end method

.method public abstract createRecipientInfo(Lcom/itextpdf/commons/bouncycastle/asn1/cms/IKeyTransRecipientInfo;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IRecipientInfo;
.end method

.method public abstract createRespID(Lcom/itextpdf/commons/bouncycastle/asn1/x500/IX500Name;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IRespID;
.end method

.method public abstract createResponseBytes(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IDEROctetString;)Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IResponseBytes;
.end method

.method public abstract createRevokedStatus(Lcom/itextpdf/commons/bouncycastle/cert/ocsp/ICertificateStatus;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IRevokedStatus;
.end method

.method public abstract createRevokedStatus(Ljava/util/Date;I)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IRevokedStatus;
.end method

.method public abstract createSigPolicyQualifierInfo(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IDERIA5String;)Lcom/itextpdf/commons/bouncycastle/asn1/esf/ISigPolicyQualifierInfo;
.end method

.method public abstract createSignaturePolicyId(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/esf/IOtherHashAlgAndValue;)Lcom/itextpdf/commons/bouncycastle/asn1/esf/ISignaturePolicyId;
.end method

.method public varargs abstract createSignaturePolicyId(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/esf/IOtherHashAlgAndValue;[Lcom/itextpdf/commons/bouncycastle/asn1/esf/ISigPolicyQualifierInfo;)Lcom/itextpdf/commons/bouncycastle/asn1/esf/ISignaturePolicyId;
.end method

.method public abstract createSignaturePolicyIdentifier(Lcom/itextpdf/commons/bouncycastle/asn1/esf/ISignaturePolicyId;)Lcom/itextpdf/commons/bouncycastle/asn1/esf/ISignaturePolicyIdentifier;
.end method

.method public abstract createSigningCertificate(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Sequence;)Lcom/itextpdf/commons/bouncycastle/asn1/ess/ISigningCertificate;
.end method

.method public abstract createSigningCertificateV2(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Sequence;)Lcom/itextpdf/commons/bouncycastle/asn1/ess/ISigningCertificateV2;
.end method

.method public abstract createSingleResp(Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IBasicOCSPResponse;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/ISingleResp;
.end method

.method public abstract createSubjectPublicKeyInfo(Ljava/lang/Object;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/ISubjectPublicKeyInfo;
.end method

.method public abstract createTBSCertificate(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/ITBSCertificate;
.end method

.method public abstract createTBSCertificate([B)Lcom/itextpdf/commons/bouncycastle/asn1/x509/ITBSCertificate;
.end method

.method public abstract createTSTInfo(Lcom/itextpdf/commons/bouncycastle/asn1/cms/IContentInfo;)Lcom/itextpdf/commons/bouncycastle/asn1/tsp/ITSTInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/tsp/AbstractTSPException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract createTime(Ljava/util/Date;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/ITime;
.end method

.method public abstract createTimeStampRequest([B)Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract createTimeStampRequestGenerator()Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampRequestGenerator;
.end method

.method public abstract createTimeStampResponse([B)Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/tsp/AbstractTSPException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract createTimeStampResponseGenerator(Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampTokenGenerator;Ljava/util/Set;)Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampResponseGenerator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampTokenGenerator;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampResponseGenerator;"
        }
    .end annotation
.end method

.method public abstract createTimeStampToken(Lcom/itextpdf/commons/bouncycastle/asn1/cms/IContentInfo;)Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampToken;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/tsp/AbstractTSPException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract createTimeStampTokenGenerator(Lcom/itextpdf/commons/bouncycastle/cms/ISignerInfoGenerator;Lcom/itextpdf/commons/bouncycastle/operator/IDigestCalculator;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;)Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampTokenGenerator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/tsp/AbstractTSPException;
        }
    .end annotation
.end method

.method public abstract createUnknownStatus()Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IUnknownStatus;
.end method

.method public abstract createX500Name(Ljava/lang/String;)Lcom/itextpdf/commons/bouncycastle/asn1/x500/IX500Name;
.end method

.method public abstract createX500Name(Ljava/security/cert/X509Certificate;)Lcom/itextpdf/commons/bouncycastle/asn1/x500/IX500Name;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation
.end method

.method public abstract createX509Certificate(Ljava/lang/Object;)Ljava/security/cert/X509Certificate;
.end method

.method public abstract createX509CertificateHolder([B)Lcom/itextpdf/commons/bouncycastle/cert/IX509CertificateHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract createX509ExtensionUtils(Lcom/itextpdf/commons/bouncycastle/operator/IDigestCalculator;)Lcom/itextpdf/commons/bouncycastle/cert/IX509ExtensionUtils;
.end method

.method public abstract createX509v2CRLBuilder(Lcom/itextpdf/commons/bouncycastle/asn1/x500/IX500Name;Ljava/util/Date;)Lcom/itextpdf/commons/bouncycastle/cert/IX509v2CRLBuilder;
.end method

.method public abstract getAlgorithmName(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getAlgorithmOid(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getBouncyCastleFactoryTestUtil()Lcom/itextpdf/commons/bouncycastle/IBouncyCastleTestConstantsFactory;
.end method

.method public abstract getDigestAlgorithmOid(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getProvider()Ljava/security/Provider;
.end method

.method public abstract getProviderName()Ljava/lang/String;
.end method

.method public abstract getSecureRandom()Ljava/security/SecureRandom;
.end method

.method public abstract isEncryptionFeatureSupported(IZ)V
.end method

.method public abstract isInApprovedOnlyMode()Z
.end method

.method public abstract isNull(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Z
.end method

.method public abstract isNullExtension(Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtension;)Z
.end method
