package com.itextpdf.commons.bouncycastle;

import com.itextpdf.commons.bouncycastle.asn1.IASN1BitString;
import com.itextpdf.commons.bouncycastle.asn1.IASN1Encodable;
import com.itextpdf.commons.bouncycastle.asn1.IASN1EncodableVector;
import com.itextpdf.commons.bouncycastle.asn1.IASN1Encoding;
import com.itextpdf.commons.bouncycastle.asn1.IASN1Enumerated;
import com.itextpdf.commons.bouncycastle.asn1.IASN1GeneralizedTime;
import com.itextpdf.commons.bouncycastle.asn1.IASN1InputStream;
import com.itextpdf.commons.bouncycastle.asn1.IASN1Integer;
import com.itextpdf.commons.bouncycastle.asn1.IASN1ObjectIdentifier;
import com.itextpdf.commons.bouncycastle.asn1.IASN1OctetString;
import com.itextpdf.commons.bouncycastle.asn1.IASN1OutputStream;
import com.itextpdf.commons.bouncycastle.asn1.IASN1Primitive;
import com.itextpdf.commons.bouncycastle.asn1.IASN1Sequence;
import com.itextpdf.commons.bouncycastle.asn1.IASN1Set;
import com.itextpdf.commons.bouncycastle.asn1.IASN1String;
import com.itextpdf.commons.bouncycastle.asn1.IASN1TaggedObject;
import com.itextpdf.commons.bouncycastle.asn1.IASN1UTCTime;
import com.itextpdf.commons.bouncycastle.asn1.IDERIA5String;
import com.itextpdf.commons.bouncycastle.asn1.IDERNull;
import com.itextpdf.commons.bouncycastle.asn1.IDEROctetString;
import com.itextpdf.commons.bouncycastle.asn1.IDERSequence;
import com.itextpdf.commons.bouncycastle.asn1.IDERSet;
import com.itextpdf.commons.bouncycastle.asn1.IDERTaggedObject;
import com.itextpdf.commons.bouncycastle.asn1.cms.IAttribute;
import com.itextpdf.commons.bouncycastle.asn1.cms.IAttributeTable;
import com.itextpdf.commons.bouncycastle.asn1.cms.IContentInfo;
import com.itextpdf.commons.bouncycastle.asn1.cms.IEncryptedContentInfo;
import com.itextpdf.commons.bouncycastle.asn1.cms.IEnvelopedData;
import com.itextpdf.commons.bouncycastle.asn1.cms.IIssuerAndSerialNumber;
import com.itextpdf.commons.bouncycastle.asn1.cms.IKeyTransRecipientInfo;
import com.itextpdf.commons.bouncycastle.asn1.cms.IOriginatorInfo;
import com.itextpdf.commons.bouncycastle.asn1.cms.IRecipientIdentifier;
import com.itextpdf.commons.bouncycastle.asn1.cms.IRecipientInfo;
import com.itextpdf.commons.bouncycastle.asn1.esf.IOtherHashAlgAndValue;
import com.itextpdf.commons.bouncycastle.asn1.esf.ISigPolicyQualifierInfo;
import com.itextpdf.commons.bouncycastle.asn1.esf.ISignaturePolicyId;
import com.itextpdf.commons.bouncycastle.asn1.esf.ISignaturePolicyIdentifier;
import com.itextpdf.commons.bouncycastle.asn1.ess.ISigningCertificate;
import com.itextpdf.commons.bouncycastle.asn1.ess.ISigningCertificateV2;
import com.itextpdf.commons.bouncycastle.asn1.ocsp.IBasicOCSPResponse;
import com.itextpdf.commons.bouncycastle.asn1.ocsp.IOCSPObjectIdentifiers;
import com.itextpdf.commons.bouncycastle.asn1.ocsp.IOCSPResponse;
import com.itextpdf.commons.bouncycastle.asn1.ocsp.IOCSPResponseStatus;
import com.itextpdf.commons.bouncycastle.asn1.ocsp.IResponseBytes;
import com.itextpdf.commons.bouncycastle.asn1.pkcs.IPKCSObjectIdentifiers;
import com.itextpdf.commons.bouncycastle.asn1.pkcs.IRSASSAPSSParams;
import com.itextpdf.commons.bouncycastle.asn1.tsp.ITSTInfo;
import com.itextpdf.commons.bouncycastle.asn1.util.IASN1Dump;
import com.itextpdf.commons.bouncycastle.asn1.x500.IX500Name;
import com.itextpdf.commons.bouncycastle.asn1.x509.IAlgorithmIdentifier;
import com.itextpdf.commons.bouncycastle.asn1.x509.IBasicConstraints;
import com.itextpdf.commons.bouncycastle.asn1.x509.ICRLDistPoint;
import com.itextpdf.commons.bouncycastle.asn1.x509.ICRLReason;
import com.itextpdf.commons.bouncycastle.asn1.x509.IDistributionPointName;
import com.itextpdf.commons.bouncycastle.asn1.x509.IExtendedKeyUsage;
import com.itextpdf.commons.bouncycastle.asn1.x509.IExtension;
import com.itextpdf.commons.bouncycastle.asn1.x509.IExtensions;
import com.itextpdf.commons.bouncycastle.asn1.x509.IGeneralName;
import com.itextpdf.commons.bouncycastle.asn1.x509.IGeneralNames;
import com.itextpdf.commons.bouncycastle.asn1.x509.IIssuingDistributionPoint;
import com.itextpdf.commons.bouncycastle.asn1.x509.IKeyPurposeId;
import com.itextpdf.commons.bouncycastle.asn1.x509.IKeyUsage;
import com.itextpdf.commons.bouncycastle.asn1.x509.IReasonFlags;
import com.itextpdf.commons.bouncycastle.asn1.x509.ISubjectPublicKeyInfo;
import com.itextpdf.commons.bouncycastle.asn1.x509.ITBSCertificate;
import com.itextpdf.commons.bouncycastle.asn1.x509.ITime;
import com.itextpdf.commons.bouncycastle.cert.IX509CertificateHolder;
import com.itextpdf.commons.bouncycastle.cert.IX509ExtensionUtils;
import com.itextpdf.commons.bouncycastle.cert.IX509v2CRLBuilder;
import com.itextpdf.commons.bouncycastle.cert.jcajce.IJcaCertStore;
import com.itextpdf.commons.bouncycastle.cert.jcajce.IJcaX509CertificateConverter;
import com.itextpdf.commons.bouncycastle.cert.jcajce.IJcaX509CertificateHolder;
import com.itextpdf.commons.bouncycastle.cert.jcajce.IJcaX509v3CertificateBuilder;
import com.itextpdf.commons.bouncycastle.cert.ocsp.AbstractOCSPException;
import com.itextpdf.commons.bouncycastle.cert.ocsp.IBasicOCSPResp;
import com.itextpdf.commons.bouncycastle.cert.ocsp.IBasicOCSPRespBuilder;
import com.itextpdf.commons.bouncycastle.cert.ocsp.ICertificateID;
import com.itextpdf.commons.bouncycastle.cert.ocsp.ICertificateStatus;
import com.itextpdf.commons.bouncycastle.cert.ocsp.IOCSPReq;
import com.itextpdf.commons.bouncycastle.cert.ocsp.IOCSPReqBuilder;
import com.itextpdf.commons.bouncycastle.cert.ocsp.IOCSPResp;
import com.itextpdf.commons.bouncycastle.cert.ocsp.IOCSPRespBuilder;
import com.itextpdf.commons.bouncycastle.cert.ocsp.IRespID;
import com.itextpdf.commons.bouncycastle.cert.ocsp.IRevokedStatus;
import com.itextpdf.commons.bouncycastle.cert.ocsp.ISingleResp;
import com.itextpdf.commons.bouncycastle.cert.ocsp.IUnknownStatus;
import com.itextpdf.commons.bouncycastle.cms.AbstractCMSException;
import com.itextpdf.commons.bouncycastle.cms.ICMSEnvelopedData;
import com.itextpdf.commons.bouncycastle.cms.ISignerInfoGenerator;
import com.itextpdf.commons.bouncycastle.cms.jcajce.IJcaSignerInfoGeneratorBuilder;
import com.itextpdf.commons.bouncycastle.cms.jcajce.IJcaSimpleSignerInfoVerifierBuilder;
import com.itextpdf.commons.bouncycastle.cms.jcajce.IJceKeyAgreeEnvelopedRecipient;
import com.itextpdf.commons.bouncycastle.cms.jcajce.IJceKeyTransEnvelopedRecipient;
import com.itextpdf.commons.bouncycastle.openssl.IPEMParser;
import com.itextpdf.commons.bouncycastle.openssl.jcajce.IJcaPEMKeyConverter;
import com.itextpdf.commons.bouncycastle.openssl.jcajce.IJceOpenSSLPKCS8DecryptorProviderBuilder;
import com.itextpdf.commons.bouncycastle.operator.IDigestCalculator;
import com.itextpdf.commons.bouncycastle.operator.IDigestCalculatorProvider;
import com.itextpdf.commons.bouncycastle.operator.jcajce.IJcaContentSignerBuilder;
import com.itextpdf.commons.bouncycastle.operator.jcajce.IJcaContentVerifierProviderBuilder;
import com.itextpdf.commons.bouncycastle.operator.jcajce.IJcaDigestCalculatorProviderBuilder;
import com.itextpdf.commons.bouncycastle.tsp.AbstractTSPException;
import com.itextpdf.commons.bouncycastle.tsp.ITimeStampRequest;
import com.itextpdf.commons.bouncycastle.tsp.ITimeStampRequestGenerator;
import com.itextpdf.commons.bouncycastle.tsp.ITimeStampResponse;
import com.itextpdf.commons.bouncycastle.tsp.ITimeStampResponseGenerator;
import com.itextpdf.commons.bouncycastle.tsp.ITimeStampToken;
import com.itextpdf.commons.bouncycastle.tsp.ITimeStampTokenGenerator;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.PrivateKey;
import java.security.Provider;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.cert.CRL;
import java.security.cert.Certificate;
import java.security.cert.CertificateEncodingException;
import java.security.cert.X509Certificate;
import java.util.Date;
import java.util.List;
import java.util.Set;
/* loaded from: classes12.dex */
public interface IBouncyCastleFactory {
    IASN1BitString createASN1BitString(IASN1Encodable iASN1Encodable);

    IASN1Dump createASN1Dump();

    IASN1EncodableVector createASN1EncodableVector();

    IASN1Encoding createASN1Encoding();

    IASN1Enumerated createASN1Enumerated(int i);

    IASN1Enumerated createASN1Enumerated(IASN1Encodable iASN1Encodable);

    IASN1GeneralizedTime createASN1GeneralizedTime(IASN1Encodable iASN1Encodable);

    IASN1InputStream createASN1InputStream(InputStream inputStream);

    IASN1InputStream createASN1InputStream(byte[] bArr);

    IASN1Integer createASN1Integer(int i);

    IASN1Integer createASN1Integer(IASN1Encodable iASN1Encodable);

    IASN1Integer createASN1Integer(BigInteger bigInteger);

    IASN1ObjectIdentifier createASN1ObjectIdentifier(IASN1Encodable iASN1Encodable);

    IASN1ObjectIdentifier createASN1ObjectIdentifier(String str);

    IASN1ObjectIdentifier createASN1ObjectIdentifierInstance(Object obj);

    IASN1OctetString createASN1OctetString(IASN1Encodable iASN1Encodable);

    IASN1OctetString createASN1OctetString(IASN1TaggedObject iASN1TaggedObject, boolean z);

    IASN1OctetString createASN1OctetString(byte[] bArr);

    IASN1OutputStream createASN1OutputStream(OutputStream outputStream);

    IASN1OutputStream createASN1OutputStream(OutputStream outputStream, String str);

    IASN1Primitive createASN1Primitive(IASN1Encodable iASN1Encodable);

    IASN1Primitive createASN1Primitive(byte[] bArr) throws IOException;

    IASN1Sequence createASN1Sequence(IASN1Encodable iASN1Encodable);

    IASN1Sequence createASN1Sequence(Object obj);

    IASN1Sequence createASN1Sequence(byte[] bArr) throws IOException;

    IASN1Sequence createASN1SequenceInstance(Object obj);

    IASN1Set createASN1Set(IASN1Encodable iASN1Encodable);

    IASN1Set createASN1Set(IASN1TaggedObject iASN1TaggedObject, boolean z);

    IASN1Set createASN1Set(Object obj);

    IASN1String createASN1String(IASN1Encodable iASN1Encodable);

    IASN1TaggedObject createASN1TaggedObject(IASN1Encodable iASN1Encodable);

    IASN1UTCTime createASN1UTCTime(IASN1Encodable iASN1Encodable);

    AbstractOCSPException createAbstractOCSPException(Exception exc);

    IAlgorithmIdentifier createAlgorithmIdentifier(IASN1ObjectIdentifier iASN1ObjectIdentifier);

    IAlgorithmIdentifier createAlgorithmIdentifier(IASN1ObjectIdentifier iASN1ObjectIdentifier, IASN1Encodable iASN1Encodable);

    IAttribute createAttribute(IASN1ObjectIdentifier iASN1ObjectIdentifier, IASN1Set iASN1Set);

    IAttributeTable createAttributeTable(IASN1Set iASN1Set);

    IBasicConstraints createBasicConstraints(int i);

    IBasicConstraints createBasicConstraints(boolean z);

    IBasicOCSPResp createBasicOCSPResp(IBasicOCSPResponse iBasicOCSPResponse);

    IBasicOCSPResp createBasicOCSPResp(Object obj);

    IBasicOCSPRespBuilder createBasicOCSPRespBuilder(IRespID iRespID);

    IBasicOCSPResponse createBasicOCSPResponse(IASN1Primitive iASN1Primitive);

    IBasicOCSPResponse createBasicOCSPResponse(byte[] bArr);

    ICMSEnvelopedData createCMSEnvelopedData(byte[] bArr) throws AbstractCMSException;

    ICRLDistPoint createCRLDistPoint(Object obj);

    ICRLReason createCRLReason();

    ICertificateID createCertificateID();

    ICertificateID createCertificateID(IDigestCalculator iDigestCalculator, IX509CertificateHolder iX509CertificateHolder, BigInteger bigInteger) throws AbstractOCSPException;

    ICertificateStatus createCertificateStatus();

    byte[] createCipherBytes(X509Certificate x509Certificate, byte[] bArr, IAlgorithmIdentifier iAlgorithmIdentifier) throws GeneralSecurityException;

    IContentInfo createContentInfo(IASN1ObjectIdentifier iASN1ObjectIdentifier, IASN1Encodable iASN1Encodable);

    IContentInfo createContentInfo(IASN1Sequence iASN1Sequence);

    IDERIA5String createDERIA5String(IASN1TaggedObject iASN1TaggedObject, boolean z);

    IDERIA5String createDERIA5String(String str);

    IDERNull createDERNull();

    IDEROctetString createDEROctetString(IASN1Encodable iASN1Encodable);

    IDEROctetString createDEROctetString(byte[] bArr);

    IDERSequence createDERSequence(IASN1EncodableVector iASN1EncodableVector);

    IDERSequence createDERSequence(IASN1Primitive iASN1Primitive);

    IDERSet createDERSet(IASN1EncodableVector iASN1EncodableVector);

    IDERSet createDERSet(IASN1Primitive iASN1Primitive);

    IDERSet createDERSet(IRecipientInfo iRecipientInfo);

    IDERSet createDERSet(ISignaturePolicyIdentifier iSignaturePolicyIdentifier);

    IDERTaggedObject createDERTaggedObject(int i, IASN1Primitive iASN1Primitive);

    IDERTaggedObject createDERTaggedObject(boolean z, int i, IASN1Primitive iASN1Primitive);

    IDistributionPointName createDistributionPointName();

    IDistributionPointName createDistributionPointName(IGeneralNames iGeneralNames);

    IEncryptedContentInfo createEncryptedContentInfo(IASN1ObjectIdentifier iASN1ObjectIdentifier, IAlgorithmIdentifier iAlgorithmIdentifier, IASN1OctetString iASN1OctetString);

    ITime createEndDate(X509Certificate x509Certificate);

    IEnvelopedData createEnvelopedData(IOriginatorInfo iOriginatorInfo, IASN1Set iASN1Set, IEncryptedContentInfo iEncryptedContentInfo, IASN1Set iASN1Set2);

    IExtendedKeyUsage createExtendedKeyUsage(IKeyPurposeId iKeyPurposeId);

    IExtendedKeyUsage createExtendedKeyUsage(IKeyPurposeId[] iKeyPurposeIdArr);

    IExtension createExtension();

    IExtension createExtension(IASN1ObjectIdentifier iASN1ObjectIdentifier, boolean z, IASN1OctetString iASN1OctetString);

    IExtensions createExtensions(IExtension iExtension);

    IGeneralName createGeneralName();

    IGeneralNames createGeneralNames(IASN1Encodable iASN1Encodable);

    IIssuerAndSerialNumber createIssuerAndSerialNumber(IX500Name iX500Name, BigInteger bigInteger);

    IIssuingDistributionPoint createIssuingDistributionPoint(IDistributionPointName iDistributionPointName, boolean z, boolean z2, IReasonFlags iReasonFlags, boolean z3, boolean z4);

    IIssuingDistributionPoint createIssuingDistributionPoint(Object obj);

    IJcaCertStore createJcaCertStore(List<Certificate> list) throws CertificateEncodingException;

    IJcaContentSignerBuilder createJcaContentSignerBuilder(String str);

    IJcaContentVerifierProviderBuilder createJcaContentVerifierProviderBuilder();

    IJcaDigestCalculatorProviderBuilder createJcaDigestCalculatorProviderBuilder();

    IJcaPEMKeyConverter createJcaPEMKeyConverter();

    IJcaSignerInfoGeneratorBuilder createJcaSignerInfoGeneratorBuilder(IDigestCalculatorProvider iDigestCalculatorProvider);

    IJcaSimpleSignerInfoVerifierBuilder createJcaSimpleSignerInfoVerifierBuilder();

    IJcaX509CertificateConverter createJcaX509CertificateConverter();

    IJcaX509CertificateHolder createJcaX509CertificateHolder(X509Certificate x509Certificate) throws CertificateEncodingException;

    IJcaX509v3CertificateBuilder createJcaX509v3CertificateBuilder(X509Certificate x509Certificate, BigInteger bigInteger, Date date, Date date2, IX500Name iX500Name, PublicKey publicKey);

    IJceKeyAgreeEnvelopedRecipient createJceKeyAgreeEnvelopedRecipient(PrivateKey privateKey);

    IJceKeyTransEnvelopedRecipient createJceKeyTransEnvelopedRecipient(PrivateKey privateKey);

    IJceOpenSSLPKCS8DecryptorProviderBuilder createJceOpenSSLPKCS8DecryptorProviderBuilder();

    IKeyPurposeId createKeyPurposeId();

    IKeyPurposeId createKeyPurposeId(IASN1ObjectIdentifier iASN1ObjectIdentifier);

    IKeyTransRecipientInfo createKeyTransRecipientInfo(IRecipientIdentifier iRecipientIdentifier, IAlgorithmIdentifier iAlgorithmIdentifier, IASN1OctetString iASN1OctetString);

    IKeyUsage createKeyUsage();

    IKeyUsage createKeyUsage(int i);

    IASN1Set createNullASN1Set();

    CRL createNullCrl();

    IExtensions createNullExtensions();

    IOriginatorInfo createNullOriginatorInfo();

    IOCSPObjectIdentifiers createOCSPObjectIdentifiers();

    IOCSPReq createOCSPReq(byte[] bArr) throws IOException;

    IOCSPReqBuilder createOCSPReqBuilder();

    IOCSPResp createOCSPResp();

    IOCSPResp createOCSPResp(IOCSPResponse iOCSPResponse);

    IOCSPResp createOCSPResp(byte[] bArr) throws IOException;

    IOCSPRespBuilder createOCSPRespBuilder();

    IOCSPRespBuilder createOCSPRespBuilderInstance();

    IOCSPResponse createOCSPResponse(IOCSPResponseStatus iOCSPResponseStatus, IResponseBytes iResponseBytes);

    IOCSPResponseStatus createOCSPResponseStatus();

    IOCSPResponseStatus createOCSPResponseStatus(int i);

    IOtherHashAlgAndValue createOtherHashAlgAndValue(IAlgorithmIdentifier iAlgorithmIdentifier, IASN1OctetString iASN1OctetString);

    IPEMParser createPEMParser(Reader reader);

    IPKCSObjectIdentifiers createPKCSObjectIdentifiers();

    IRSASSAPSSParams createRSASSAPSSParams(IASN1Encodable iASN1Encodable);

    IRSASSAPSSParams createRSASSAPSSParamsWithMGF1(IASN1ObjectIdentifier iASN1ObjectIdentifier, int i, int i2);

    IReasonFlags createReasonFlags(int i);

    IRecipientIdentifier createRecipientIdentifier(IIssuerAndSerialNumber iIssuerAndSerialNumber);

    IRecipientInfo createRecipientInfo(IKeyTransRecipientInfo iKeyTransRecipientInfo);

    IRespID createRespID(IX500Name iX500Name);

    IResponseBytes createResponseBytes(IASN1ObjectIdentifier iASN1ObjectIdentifier, IDEROctetString iDEROctetString);

    IRevokedStatus createRevokedStatus(ICertificateStatus iCertificateStatus);

    IRevokedStatus createRevokedStatus(Date date, int i);

    ISigPolicyQualifierInfo createSigPolicyQualifierInfo(IASN1ObjectIdentifier iASN1ObjectIdentifier, IDERIA5String iDERIA5String);

    ISignaturePolicyId createSignaturePolicyId(IASN1ObjectIdentifier iASN1ObjectIdentifier, IOtherHashAlgAndValue iOtherHashAlgAndValue);

    ISignaturePolicyId createSignaturePolicyId(IASN1ObjectIdentifier iASN1ObjectIdentifier, IOtherHashAlgAndValue iOtherHashAlgAndValue, ISigPolicyQualifierInfo... iSigPolicyQualifierInfoArr);

    ISignaturePolicyIdentifier createSignaturePolicyIdentifier(ISignaturePolicyId iSignaturePolicyId);

    ISigningCertificate createSigningCertificate(IASN1Sequence iASN1Sequence);

    ISigningCertificateV2 createSigningCertificateV2(IASN1Sequence iASN1Sequence);

    ISingleResp createSingleResp(IBasicOCSPResponse iBasicOCSPResponse);

    ISubjectPublicKeyInfo createSubjectPublicKeyInfo(Object obj);

    ITBSCertificate createTBSCertificate(IASN1Encodable iASN1Encodable);

    ITBSCertificate createTBSCertificate(byte[] bArr);

    ITSTInfo createTSTInfo(IContentInfo iContentInfo) throws AbstractTSPException, IOException;

    ITime createTime(Date date);

    ITimeStampRequest createTimeStampRequest(byte[] bArr) throws IOException;

    ITimeStampRequestGenerator createTimeStampRequestGenerator();

    ITimeStampResponse createTimeStampResponse(byte[] bArr) throws AbstractTSPException, IOException;

    ITimeStampResponseGenerator createTimeStampResponseGenerator(ITimeStampTokenGenerator iTimeStampTokenGenerator, Set<String> set);

    ITimeStampToken createTimeStampToken(IContentInfo iContentInfo) throws AbstractTSPException, IOException;

    ITimeStampTokenGenerator createTimeStampTokenGenerator(ISignerInfoGenerator iSignerInfoGenerator, IDigestCalculator iDigestCalculator, IASN1ObjectIdentifier iASN1ObjectIdentifier) throws AbstractTSPException;

    IUnknownStatus createUnknownStatus();

    IX500Name createX500Name(String str);

    IX500Name createX500Name(X509Certificate x509Certificate) throws CertificateEncodingException;

    X509Certificate createX509Certificate(Object obj);

    IX509CertificateHolder createX509CertificateHolder(byte[] bArr) throws IOException;

    IX509ExtensionUtils createX509ExtensionUtils(IDigestCalculator iDigestCalculator);

    IX509v2CRLBuilder createX509v2CRLBuilder(IX500Name iX500Name, Date date);

    String getAlgorithmName(String str);

    String getAlgorithmOid(String str);

    IBouncyCastleTestConstantsFactory getBouncyCastleFactoryTestUtil();

    String getDigestAlgorithmOid(String str);

    Provider getProvider();

    String getProviderName();

    SecureRandom getSecureRandom();

    void isEncryptionFeatureSupported(int i, boolean z);

    boolean isInApprovedOnlyMode();

    boolean isNull(IASN1Encodable iASN1Encodable);

    boolean isNullExtension(IExtension iExtension);
}
