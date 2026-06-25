.class Lcom/itextpdf/bouncycastleconnector/BouncyCastleDefaultFactory;
.super Ljava/lang/Object;
.source "BouncyCastleDefaultFactory.java"

# interfaces
.implements Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 157
    return-void
.end method


# virtual methods
.method public createASN1BitString(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1BitString;
    .locals 2
    .param p1, "encodable"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;

    .line 768
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1Dump()Lcom/itextpdf/commons/bouncycastle/asn1/util/IASN1Dump;
    .locals 2

    .line 763
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1EncodableVector()Lcom/itextpdf/commons/bouncycastle/asn1/IASN1EncodableVector;
    .locals 2

    .line 306
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1Encoding()Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encoding;
    .locals 2

    .line 356
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1Enumerated(I)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Enumerated;
    .locals 2
    .param p1, "i"    # I

    .line 346
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1Enumerated(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Enumerated;
    .locals 2
    .param p1, "object"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;

    .line 351
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1GeneralizedTime(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1GeneralizedTime;
    .locals 2
    .param p1, "encodable"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;

    .line 773
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1InputStream(Ljava/io/InputStream;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;
    .locals 2
    .param p1, "stream"    # Ljava/io/InputStream;

    .line 191
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1InputStream([B)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1InputStream;
    .locals 2
    .param p1, "bytes"    # [B

    .line 196
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1Integer(I)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Integer;
    .locals 2
    .param p1, "i"    # I

    .line 256
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1Integer(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Integer;
    .locals 2
    .param p1, "encodable"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;

    .line 251
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1Integer(Ljava/math/BigInteger;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Integer;
    .locals 2
    .param p1, "i"    # Ljava/math/BigInteger;

    .line 261
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1ObjectIdentifier(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;
    .locals 2
    .param p1, "encodable"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;

    .line 176
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1ObjectIdentifier(Ljava/lang/String;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    .line 181
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1ObjectIdentifierInstance(Ljava/lang/Object;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;
    .locals 2
    .param p1, "object"    # Ljava/lang/Object;

    .line 186
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1OctetString(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;
    .locals 2
    .param p1, "encodable"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;

    .line 201
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1OctetString(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1TaggedObject;Z)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;
    .locals 2
    .param p1, "taggedObject"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1TaggedObject;
    .param p2, "b"    # Z

    .line 206
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1OctetString([B)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;
    .locals 2
    .param p1, "bytes"    # [B

    .line 211
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1OutputStream(Ljava/io/OutputStream;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OutputStream;
    .locals 2
    .param p1, "stream"    # Ljava/io/OutputStream;

    .line 286
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1OutputStream(Ljava/io/OutputStream;Ljava/lang/String;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OutputStream;
    .locals 2
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .param p2, "asn1Encoding"    # Ljava/lang/String;

    .line 291
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1Primitive(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;
    .locals 2
    .param p1, "encodable"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;

    .line 545
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1Primitive([B)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;
    .locals 2
    .param p1, "array"    # [B

    .line 550
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1Sequence(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Sequence;
    .locals 2
    .param p1, "encodable"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;

    .line 221
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1Sequence(Ljava/lang/Object;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Sequence;
    .locals 2
    .param p1, "object"    # Ljava/lang/Object;

    .line 216
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1Sequence([B)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Sequence;
    .locals 2
    .param p1, "array"    # [B

    .line 226
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1SequenceInstance(Ljava/lang/Object;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Sequence;
    .locals 2
    .param p1, "object"    # Ljava/lang/Object;

    .line 231
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1Set(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;
    .locals 2
    .param p1, "encodable"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;

    .line 266
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1Set(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1TaggedObject;Z)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;
    .locals 2
    .param p1, "taggedObject"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1TaggedObject;
    .param p2, "b"    # Z

    .line 276
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1Set(Ljava/lang/Object;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;
    .locals 2
    .param p1, "encodable"    # Ljava/lang/Object;

    .line 271
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1String(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1String;
    .locals 2
    .param p1, "encodable"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;

    .line 540
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1TaggedObject(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1TaggedObject;
    .locals 2
    .param p1, "encodable"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;

    .line 246
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createASN1UTCTime(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IASN1UTCTime;
    .locals 2
    .param p1, "encodable"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;

    .line 778
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createAbstractOCSPException(Ljava/lang/Exception;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/AbstractOCSPException;
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .line 753
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createAlgorithmIdentifier(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;
    .locals 2
    .param p1, "algorithm"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;

    .line 426
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createAlgorithmIdentifier(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;
    .locals 2
    .param p1, "algorithm"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;
    .param p2, "encodable"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;

    .line 431
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createAttribute(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IAttribute;
    .locals 2
    .param p1, "attrType"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;
    .param p2, "attrValues"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;

    .line 371
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createAttributeTable(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IAttributeTable;
    .locals 2
    .param p1, "unat"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;

    .line 361
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createBasicConstraints(I)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IBasicConstraints;
    .locals 2
    .param p1, "pathLength"    # I

    .line 857
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createBasicConstraints(Z)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IBasicConstraints;
    .locals 2
    .param p1, "b"    # Z

    .line 852
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createBasicOCSPResp(Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IBasicOCSPResponse;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IBasicOCSPResp;
    .locals 2
    .param p1, "response"    # Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IBasicOCSPResponse;

    .line 411
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createBasicOCSPResp(Ljava/lang/Object;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IBasicOCSPResp;
    .locals 2
    .param p1, "response"    # Ljava/lang/Object;

    .line 416
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createBasicOCSPRespBuilder(Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IRespID;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IBasicOCSPRespBuilder;
    .locals 2
    .param p1, "respID"    # Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IRespID;

    .line 831
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createBasicOCSPResponse(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;)Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IBasicOCSPResponse;
    .locals 2
    .param p1, "primitive"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;

    .line 401
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createBasicOCSPResponse([B)Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IBasicOCSPResponse;
    .locals 2
    .param p1, "bytes"    # [B

    .line 406
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createCMSEnvelopedData([B)Lcom/itextpdf/commons/bouncycastle/cms/ICMSEnvelopedData;
    .locals 2
    .param p1, "valueBytes"    # [B

    .line 738
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createCRLDistPoint(Ljava/lang/Object;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/ICRLDistPoint;
    .locals 2
    .param p1, "object"    # Ljava/lang/Object;

    .line 626
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createCRLReason()Lcom/itextpdf/commons/bouncycastle/asn1/x509/ICRLReason;
    .locals 2

    .line 902
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createCertificateID()Lcom/itextpdf/commons/bouncycastle/cert/ocsp/ICertificateID;
    .locals 2

    .line 493
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createCertificateID(Lcom/itextpdf/commons/bouncycastle/operator/IDigestCalculator;Lcom/itextpdf/commons/bouncycastle/cert/IX509CertificateHolder;Ljava/math/BigInteger;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/ICertificateID;
    .locals 2
    .param p1, "digestCalculator"    # Lcom/itextpdf/commons/bouncycastle/operator/IDigestCalculator;
    .param p2, "certificateHolder"    # Lcom/itextpdf/commons/bouncycastle/cert/IX509CertificateHolder;
    .param p3, "bigInteger"    # Ljava/math/BigInteger;

    .line 488
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createCertificateStatus()Lcom/itextpdf/commons/bouncycastle/cert/ocsp/ICertificateStatus;
    .locals 2

    .line 601
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createCipherBytes(Ljava/security/cert/X509Certificate;[BLcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;)[B
    .locals 2
    .param p1, "x509certificate"    # Ljava/security/cert/X509Certificate;
    .param p2, "abyte0"    # [B
    .param p3, "algorithmIdentifier"    # Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;

    .line 978
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createContentInfo(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IContentInfo;
    .locals 2
    .param p1, "objectIdentifier"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;
    .param p2, "encodable"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;

    .line 381
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createContentInfo(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Sequence;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IContentInfo;
    .locals 2
    .param p1, "sequence"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Sequence;

    .line 376
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createDERIA5String(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1TaggedObject;Z)Lcom/itextpdf/commons/bouncycastle/asn1/IDERIA5String;
    .locals 2
    .param p1, "taggedObject"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1TaggedObject;
    .param p2, "b"    # Z

    .line 616
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createDERIA5String(Ljava/lang/String;)Lcom/itextpdf/commons/bouncycastle/asn1/IDERIA5String;
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    .line 621
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createDERNull()Lcom/itextpdf/commons/bouncycastle/asn1/IDERNull;
    .locals 2

    .line 311
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createDEROctetString(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/IDEROctetString;
    .locals 2
    .param p1, "encodable"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;

    .line 301
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createDEROctetString([B)Lcom/itextpdf/commons/bouncycastle/asn1/IDEROctetString;
    .locals 2
    .param p1, "bytes"    # [B

    .line 296
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createDERSequence(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1EncodableVector;)Lcom/itextpdf/commons/bouncycastle/asn1/IDERSequence;
    .locals 2
    .param p1, "encodableVector"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1EncodableVector;

    .line 236
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createDERSequence(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;)Lcom/itextpdf/commons/bouncycastle/asn1/IDERSequence;
    .locals 2
    .param p1, "primitive"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;

    .line 241
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createDERSet(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1EncodableVector;)Lcom/itextpdf/commons/bouncycastle/asn1/IDERSet;
    .locals 2
    .param p1, "encodableVector"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1EncodableVector;

    .line 326
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createDERSet(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;)Lcom/itextpdf/commons/bouncycastle/asn1/IDERSet;
    .locals 2
    .param p1, "primitive"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;

    .line 331
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createDERSet(Lcom/itextpdf/commons/bouncycastle/asn1/cms/IRecipientInfo;)Lcom/itextpdf/commons/bouncycastle/asn1/IDERSet;
    .locals 2
    .param p1, "recipientInfo"    # Lcom/itextpdf/commons/bouncycastle/asn1/cms/IRecipientInfo;

    .line 341
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createDERSet(Lcom/itextpdf/commons/bouncycastle/asn1/esf/ISignaturePolicyIdentifier;)Lcom/itextpdf/commons/bouncycastle/asn1/IDERSet;
    .locals 2
    .param p1, "identifier"    # Lcom/itextpdf/commons/bouncycastle/asn1/esf/ISignaturePolicyIdentifier;

    .line 336
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createDERTaggedObject(ILcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;)Lcom/itextpdf/commons/bouncycastle/asn1/IDERTaggedObject;
    .locals 2
    .param p1, "i"    # I
    .param p2, "primitive"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;

    .line 316
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createDERTaggedObject(ZILcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;)Lcom/itextpdf/commons/bouncycastle/asn1/IDERTaggedObject;
    .locals 2
    .param p1, "b"    # Z
    .param p2, "i"    # I
    .param p3, "primitive"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Primitive;

    .line 321
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createDistributionPointName()Lcom/itextpdf/commons/bouncycastle/asn1/x509/IDistributionPointName;
    .locals 2

    .line 648
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createDistributionPointName(Lcom/itextpdf/commons/bouncycastle/asn1/x509/IGeneralNames;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IDistributionPointName;
    .locals 2
    .param p1, "generalNames"    # Lcom/itextpdf/commons/bouncycastle/asn1/x509/IGeneralNames;

    .line 653
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createEncryptedContentInfo(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IEncryptedContentInfo;
    .locals 2
    .param p1, "data"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;
    .param p2, "algorithmIdentifier"    # Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;
    .param p3, "octetString"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;

    .line 703
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createEndDate(Ljava/security/cert/X509Certificate;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/ITime;
    .locals 2
    .param p1, "certificate"    # Ljava/security/cert/X509Certificate;

    .line 952
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createEnvelopedData(Lcom/itextpdf/commons/bouncycastle/asn1/cms/IOriginatorInfo;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;Lcom/itextpdf/commons/bouncycastle/asn1/cms/IEncryptedContentInfo;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IEnvelopedData;
    .locals 2
    .param p1, "originatorInfo"    # Lcom/itextpdf/commons/bouncycastle/asn1/cms/IOriginatorInfo;
    .param p2, "set"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;
    .param p3, "encryptedContentInfo"    # Lcom/itextpdf/commons/bouncycastle/asn1/cms/IEncryptedContentInfo;
    .param p4, "set1"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;

    .line 692
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createExtendedKeyUsage(Lcom/itextpdf/commons/bouncycastle/asn1/x509/IKeyPurposeId;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtendedKeyUsage;
    .locals 2
    .param p1, "purposeId"    # Lcom/itextpdf/commons/bouncycastle/asn1/x509/IKeyPurposeId;

    .line 882
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createExtendedKeyUsage([Lcom/itextpdf/commons/bouncycastle/asn1/x509/IKeyPurposeId;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtendedKeyUsage;
    .locals 2
    .param p1, "purposeIds"    # [Lcom/itextpdf/commons/bouncycastle/asn1/x509/IKeyPurposeId;

    .line 887
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createExtension()Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtension;
    .locals 2

    .line 514
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createExtension(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;ZLcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtension;
    .locals 2
    .param p1, "objectIdentifier"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;
    .param p2, "critical"    # Z
    .param p3, "octetString"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;

    .line 509
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createExtensions(Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtension;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtensions;
    .locals 2
    .param p1, "extension"    # Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtension;

    .line 519
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createGeneralName()Lcom/itextpdf/commons/bouncycastle/asn1/x509/IGeneralName;
    .locals 2

    .line 663
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createGeneralNames(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IGeneralNames;
    .locals 2
    .param p1, "encodable"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;

    .line 658
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createIssuerAndSerialNumber(Lcom/itextpdf/commons/bouncycastle/asn1/x500/IX500Name;Ljava/math/BigInteger;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IIssuerAndSerialNumber;
    .locals 2
    .param p1, "issuer"    # Lcom/itextpdf/commons/bouncycastle/asn1/x500/IX500Name;
    .param p2, "value"    # Ljava/math/BigInteger;

    .line 717
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createIssuingDistributionPoint(Lcom/itextpdf/commons/bouncycastle/asn1/x509/IDistributionPointName;ZZLcom/itextpdf/commons/bouncycastle/asn1/x509/IReasonFlags;ZZ)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IIssuingDistributionPoint;
    .locals 2
    .param p1, "distributionPoint"    # Lcom/itextpdf/commons/bouncycastle/asn1/x509/IDistributionPointName;
    .param p2, "onlyContainsUserCerts"    # Z
    .param p3, "onlyContainsCACerts"    # Z
    .param p4, "onlySomeReasons"    # Lcom/itextpdf/commons/bouncycastle/asn1/x509/IReasonFlags;
    .param p5, "indirectCRL"    # Z
    .param p6, "onlyContainsAttrCerts"    # Z

    .line 638
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createIssuingDistributionPoint(Ljava/lang/Object;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IIssuingDistributionPoint;
    .locals 2
    .param p1, "point"    # Ljava/lang/Object;

    .line 631
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createJcaCertStore(Ljava/util/List;)Lcom/itextpdf/commons/bouncycastle/cert/jcajce/IJcaCertStore;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/security/cert/Certificate;",
            ">;)",
            "Lcom/itextpdf/commons/bouncycastle/cert/jcajce/IJcaCertStore;"
        }
    .end annotation

    .line 783
    .local p1, "certificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/Certificate;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createJcaContentSignerBuilder(Ljava/lang/String;)Lcom/itextpdf/commons/bouncycastle/operator/jcajce/IJcaContentSignerBuilder;
    .locals 2
    .param p1, "algorithm"    # Ljava/lang/String;

    .line 799
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createJcaContentVerifierProviderBuilder()Lcom/itextpdf/commons/bouncycastle/operator/jcajce/IJcaContentVerifierProviderBuilder;
    .locals 2

    .line 467
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createJcaDigestCalculatorProviderBuilder()Lcom/itextpdf/commons/bouncycastle/operator/jcajce/IJcaDigestCalculatorProviderBuilder;
    .locals 2

    .line 482
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createJcaPEMKeyConverter()Lcom/itextpdf/commons/bouncycastle/openssl/jcajce/IJcaPEMKeyConverter;
    .locals 2

    .line 942
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createJcaSignerInfoGeneratorBuilder(Lcom/itextpdf/commons/bouncycastle/operator/IDigestCalculatorProvider;)Lcom/itextpdf/commons/bouncycastle/cms/jcajce/IJcaSignerInfoGeneratorBuilder;
    .locals 2
    .param p1, "digestCalcProviderProvider"    # Lcom/itextpdf/commons/bouncycastle/operator/IDigestCalculatorProvider;

    .line 805
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createJcaSimpleSignerInfoVerifierBuilder()Lcom/itextpdf/commons/bouncycastle/cms/jcajce/IJcaSimpleSignerInfoVerifierBuilder;
    .locals 2

    .line 472
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createJcaX509CertificateConverter()Lcom/itextpdf/commons/bouncycastle/cert/jcajce/IJcaX509CertificateConverter;
    .locals 2

    .line 477
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createJcaX509CertificateHolder(Ljava/security/cert/X509Certificate;)Lcom/itextpdf/commons/bouncycastle/cert/jcajce/IJcaX509CertificateHolder;
    .locals 2
    .param p1, "certificate"    # Ljava/security/cert/X509Certificate;

    .line 503
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createJcaX509v3CertificateBuilder(Ljava/security/cert/X509Certificate;Ljava/math/BigInteger;Ljava/util/Date;Ljava/util/Date;Lcom/itextpdf/commons/bouncycastle/asn1/x500/IX500Name;Ljava/security/PublicKey;)Lcom/itextpdf/commons/bouncycastle/cert/jcajce/IJcaX509v3CertificateBuilder;
    .locals 2
    .param p1, "signingCert"    # Ljava/security/cert/X509Certificate;
    .param p2, "certSerialNumber"    # Ljava/math/BigInteger;
    .param p3, "startDate"    # Ljava/util/Date;
    .param p4, "endDate"    # Ljava/util/Date;
    .param p5, "subjectDnName"    # Lcom/itextpdf/commons/bouncycastle/asn1/x500/IX500Name;
    .param p6, "publicKey"    # Ljava/security/PublicKey;

    .line 847
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createJceKeyAgreeEnvelopedRecipient(Ljava/security/PrivateKey;)Lcom/itextpdf/commons/bouncycastle/cms/jcajce/IJceKeyAgreeEnvelopedRecipient;
    .locals 2
    .param p1, "privateKey"    # Ljava/security/PrivateKey;

    .line 462
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createJceKeyTransEnvelopedRecipient(Ljava/security/PrivateKey;)Lcom/itextpdf/commons/bouncycastle/cms/jcajce/IJceKeyTransEnvelopedRecipient;
    .locals 2
    .param p1, "privateKey"    # Ljava/security/PrivateKey;

    .line 457
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createJceOpenSSLPKCS8DecryptorProviderBuilder()Lcom/itextpdf/commons/bouncycastle/openssl/jcajce/IJceOpenSSLPKCS8DecryptorProviderBuilder;
    .locals 2

    .line 937
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createKeyPurposeId()Lcom/itextpdf/commons/bouncycastle/asn1/x509/IKeyPurposeId;
    .locals 2

    .line 872
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createKeyPurposeId(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IKeyPurposeId;
    .locals 2
    .param p1, "objectIdentifier"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;

    .line 877
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createKeyTransRecipientInfo(Lcom/itextpdf/commons/bouncycastle/asn1/cms/IRecipientIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IKeyTransRecipientInfo;
    .locals 2
    .param p1, "recipientIdentifier"    # Lcom/itextpdf/commons/bouncycastle/asn1/cms/IRecipientIdentifier;
    .param p2, "algorithmIdentifier"    # Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;
    .param p3, "octetString"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;

    .line 728
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createKeyUsage()Lcom/itextpdf/commons/bouncycastle/asn1/x509/IKeyUsage;
    .locals 2

    .line 862
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createKeyUsage(I)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IKeyUsage;
    .locals 2
    .param p1, "i"    # I

    .line 867
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createNullASN1Set()Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Set;
    .locals 2

    .line 281
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createNullCrl()Ljava/security/cert/CRL;
    .locals 2

    .line 927
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createNullExtensions()Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtensions;
    .locals 2

    .line 524
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createNullOriginatorInfo()Lcom/itextpdf/commons/bouncycastle/asn1/cms/IOriginatorInfo;
    .locals 2

    .line 733
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createOCSPObjectIdentifiers()Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IOCSPObjectIdentifiers;
    .locals 2

    .line 421
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createOCSPReq([B)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPReq;
    .locals 2
    .param p1, "requestBytes"    # [B

    .line 836
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createOCSPReqBuilder()Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPReqBuilder;
    .locals 2

    .line 529
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createOCSPResp()Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPResp;
    .locals 2

    .line 565
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createOCSPResp(Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IOCSPResponse;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPResp;
    .locals 2
    .param p1, "ocspResponse"    # Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IOCSPResponse;

    .line 555
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createOCSPResp([B)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPResp;
    .locals 2
    .param p1, "bytes"    # [B

    .line 560
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createOCSPRespBuilder()Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPRespBuilder;
    .locals 2

    .line 586
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createOCSPRespBuilderInstance()Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IOCSPRespBuilder;
    .locals 2

    .line 581
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createOCSPResponse(Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IOCSPResponseStatus;Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IResponseBytes;)Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IOCSPResponse;
    .locals 2
    .param p1, "respStatus"    # Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IOCSPResponseStatus;
    .param p2, "responseBytes"    # Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IResponseBytes;

    .line 570
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createOCSPResponseStatus()Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IOCSPResponseStatus;
    .locals 2

    .line 596
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createOCSPResponseStatus(I)Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IOCSPResponseStatus;
    .locals 2
    .param p1, "status"    # I

    .line 591
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createOtherHashAlgAndValue(Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;)Lcom/itextpdf/commons/bouncycastle/asn1/esf/IOtherHashAlgAndValue;
    .locals 2
    .param p1, "algorithmIdentifier"    # Lcom/itextpdf/commons/bouncycastle/asn1/x509/IAlgorithmIdentifier;
    .param p2, "octetString"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1OctetString;

    .line 669
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createPEMParser(Ljava/io/Reader;)Lcom/itextpdf/commons/bouncycastle/openssl/IPEMParser;
    .locals 2
    .param p1, "reader"    # Ljava/io/Reader;

    .line 932
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createPKCSObjectIdentifiers()Lcom/itextpdf/commons/bouncycastle/asn1/pkcs/IPKCSObjectIdentifiers;
    .locals 2

    .line 366
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createRSASSAPSSParams(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/pkcs/IRSASSAPSSParams;
    .locals 2
    .param p1, "encodable"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;

    .line 436
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createRSASSAPSSParamsWithMGF1(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;II)Lcom/itextpdf/commons/bouncycastle/asn1/pkcs/IRSASSAPSSParams;
    .locals 2
    .param p1, "digestAlgoOid"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;
    .param p2, "saltLen"    # I
    .param p3, "trailerField"    # I

    .line 442
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createReasonFlags(I)Lcom/itextpdf/commons/bouncycastle/asn1/x509/IReasonFlags;
    .locals 2
    .param p1, "reasons"    # I

    .line 643
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createRecipientIdentifier(Lcom/itextpdf/commons/bouncycastle/asn1/cms/IIssuerAndSerialNumber;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IRecipientIdentifier;
    .locals 2
    .param p1, "issuerAndSerialNumber"    # Lcom/itextpdf/commons/bouncycastle/asn1/cms/IIssuerAndSerialNumber;

    .line 722
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createRecipientInfo(Lcom/itextpdf/commons/bouncycastle/asn1/cms/IKeyTransRecipientInfo;)Lcom/itextpdf/commons/bouncycastle/asn1/cms/IRecipientInfo;
    .locals 2
    .param p1, "keyTransRecipientInfo"    # Lcom/itextpdf/commons/bouncycastle/asn1/cms/IKeyTransRecipientInfo;

    .line 697
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createRespID(Lcom/itextpdf/commons/bouncycastle/asn1/x500/IX500Name;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IRespID;
    .locals 2
    .param p1, "x500Name"    # Lcom/itextpdf/commons/bouncycastle/asn1/x500/IX500Name;

    .line 826
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createResponseBytes(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IDEROctetString;)Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IResponseBytes;
    .locals 2
    .param p1, "asn1ObjectIdentifier"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;
    .param p2, "derOctetString"    # Lcom/itextpdf/commons/bouncycastle/asn1/IDEROctetString;

    .line 576
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createRevokedStatus(Lcom/itextpdf/commons/bouncycastle/cert/ocsp/ICertificateStatus;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IRevokedStatus;
    .locals 2
    .param p1, "certificateStatus"    # Lcom/itextpdf/commons/bouncycastle/cert/ocsp/ICertificateStatus;

    .line 606
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createRevokedStatus(Ljava/util/Date;I)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IRevokedStatus;
    .locals 2
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "i"    # I

    .line 611
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createSigPolicyQualifierInfo(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/IDERIA5String;)Lcom/itextpdf/commons/bouncycastle/asn1/esf/ISigPolicyQualifierInfo;
    .locals 2
    .param p1, "objectIdentifier"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;
    .param p2, "string"    # Lcom/itextpdf/commons/bouncycastle/asn1/IDERIA5String;

    .line 535
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createSignaturePolicyId(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/esf/IOtherHashAlgAndValue;)Lcom/itextpdf/commons/bouncycastle/asn1/esf/ISignaturePolicyId;
    .locals 2
    .param p1, "objectIdentifier"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;
    .param p2, "algAndValue"    # Lcom/itextpdf/commons/bouncycastle/asn1/esf/IOtherHashAlgAndValue;

    .line 675
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public varargs createSignaturePolicyId(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;Lcom/itextpdf/commons/bouncycastle/asn1/esf/IOtherHashAlgAndValue;[Lcom/itextpdf/commons/bouncycastle/asn1/esf/ISigPolicyQualifierInfo;)Lcom/itextpdf/commons/bouncycastle/asn1/esf/ISignaturePolicyId;
    .locals 2
    .param p1, "objectIdentifier"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;
    .param p2, "algAndValue"    # Lcom/itextpdf/commons/bouncycastle/asn1/esf/IOtherHashAlgAndValue;
    .param p3, "policyQualifiers"    # [Lcom/itextpdf/commons/bouncycastle/asn1/esf/ISigPolicyQualifierInfo;

    .line 681
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createSignaturePolicyIdentifier(Lcom/itextpdf/commons/bouncycastle/asn1/esf/ISignaturePolicyId;)Lcom/itextpdf/commons/bouncycastle/asn1/esf/ISignaturePolicyIdentifier;
    .locals 2
    .param p1, "policyId"    # Lcom/itextpdf/commons/bouncycastle/asn1/esf/ISignaturePolicyId;

    .line 686
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createSigningCertificate(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Sequence;)Lcom/itextpdf/commons/bouncycastle/asn1/ess/ISigningCertificate;
    .locals 2
    .param p1, "sequence"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Sequence;

    .line 391
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createSigningCertificateV2(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Sequence;)Lcom/itextpdf/commons/bouncycastle/asn1/ess/ISigningCertificateV2;
    .locals 2
    .param p1, "sequence"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Sequence;

    .line 396
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createSingleResp(Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IBasicOCSPResponse;)Lcom/itextpdf/commons/bouncycastle/cert/ocsp/ISingleResp;
    .locals 2
    .param p1, "basicResp"    # Lcom/itextpdf/commons/bouncycastle/asn1/ocsp/IBasicOCSPResponse;

    .line 912
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createSubjectPublicKeyInfo(Ljava/lang/Object;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/ISubjectPublicKeyInfo;
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;

    .line 897
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createTBSCertificate(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/ITBSCertificate;
    .locals 2
    .param p1, "encodable"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;

    .line 708
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createTBSCertificate([B)Lcom/itextpdf/commons/bouncycastle/asn1/x509/ITBSCertificate;
    .locals 2
    .param p1, "bytes"    # [B

    .line 713
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createTSTInfo(Lcom/itextpdf/commons/bouncycastle/asn1/cms/IContentInfo;)Lcom/itextpdf/commons/bouncycastle/asn1/tsp/ITSTInfo;
    .locals 2
    .param p1, "contentInfo"    # Lcom/itextpdf/commons/bouncycastle/asn1/cms/IContentInfo;

    .line 907
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createTime(Ljava/util/Date;)Lcom/itextpdf/commons/bouncycastle/asn1/x509/ITime;
    .locals 2
    .param p1, "date"    # Ljava/util/Date;

    .line 947
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createTimeStampRequest([B)Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampRequest;
    .locals 2
    .param p1, "bytes"    # [B

    .line 794
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createTimeStampRequestGenerator()Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampRequestGenerator;
    .locals 2

    .line 743
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createTimeStampResponse([B)Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampResponse;
    .locals 2
    .param p1, "respBytes"    # [B

    .line 748
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createTimeStampResponseGenerator(Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampTokenGenerator;Ljava/util/Set;)Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampResponseGenerator;
    .locals 2
    .param p1, "tokenGenerator"    # Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampTokenGenerator;
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

    .line 789
    .local p2, "algorithms":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createTimeStampToken(Lcom/itextpdf/commons/bouncycastle/asn1/cms/IContentInfo;)Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampToken;
    .locals 2
    .param p1, "contentInfo"    # Lcom/itextpdf/commons/bouncycastle/asn1/cms/IContentInfo;

    .line 386
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createTimeStampTokenGenerator(Lcom/itextpdf/commons/bouncycastle/cms/ISignerInfoGenerator;Lcom/itextpdf/commons/bouncycastle/operator/IDigestCalculator;Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;)Lcom/itextpdf/commons/bouncycastle/tsp/ITimeStampTokenGenerator;
    .locals 2
    .param p1, "siGen"    # Lcom/itextpdf/commons/bouncycastle/cms/ISignerInfoGenerator;
    .param p2, "dgCalc"    # Lcom/itextpdf/commons/bouncycastle/operator/IDigestCalculator;
    .param p3, "policy"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1ObjectIdentifier;

    .line 811
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createUnknownStatus()Lcom/itextpdf/commons/bouncycastle/cert/ocsp/IUnknownStatus;
    .locals 2

    .line 758
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createX500Name(Ljava/lang/String;)Lcom/itextpdf/commons/bouncycastle/asn1/x500/IX500Name;
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .line 821
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createX500Name(Ljava/security/cert/X509Certificate;)Lcom/itextpdf/commons/bouncycastle/asn1/x500/IX500Name;
    .locals 2
    .param p1, "certificate"    # Ljava/security/cert/X509Certificate;

    .line 816
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createX509Certificate(Ljava/lang/Object;)Ljava/security/cert/X509Certificate;
    .locals 2
    .param p1, "element"    # Ljava/lang/Object;

    .line 917
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createX509CertificateHolder([B)Lcom/itextpdf/commons/bouncycastle/cert/IX509CertificateHolder;
    .locals 2
    .param p1, "bytes"    # [B

    .line 498
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createX509ExtensionUtils(Lcom/itextpdf/commons/bouncycastle/operator/IDigestCalculator;)Lcom/itextpdf/commons/bouncycastle/cert/IX509ExtensionUtils;
    .locals 2
    .param p1, "digestCalculator"    # Lcom/itextpdf/commons/bouncycastle/operator/IDigestCalculator;

    .line 892
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createX509v2CRLBuilder(Lcom/itextpdf/commons/bouncycastle/asn1/x500/IX500Name;Ljava/util/Date;)Lcom/itextpdf/commons/bouncycastle/cert/IX509v2CRLBuilder;
    .locals 2
    .param p1, "x500Name"    # Lcom/itextpdf/commons/bouncycastle/asn1/x500/IX500Name;
    .param p2, "thisUpdate"    # Ljava/util/Date;

    .line 841
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAlgorithmName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "oid"    # Ljava/lang/String;

    .line 171
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAlgorithmOid(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 161
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getBouncyCastleFactoryTestUtil()Lcom/itextpdf/commons/bouncycastle/IBouncyCastleTestConstantsFactory;
    .locals 2

    .line 922
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDigestAlgorithmOid(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 166
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getProvider()Ljava/security/Provider;
    .locals 2

    .line 447
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getProviderName()Ljava/lang/String;
    .locals 2

    .line 452
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSecureRandom()Ljava/security/SecureRandom;
    .locals 2

    .line 967
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isEncryptionFeatureSupported(IZ)V
    .locals 2
    .param p1, "encryptionType"    # I
    .param p2, "withCertificate"    # Z

    .line 983
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isInApprovedOnlyMode()Z
    .locals 2

    .line 972
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isNull(Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;)Z
    .locals 2
    .param p1, "encodable"    # Lcom/itextpdf/commons/bouncycastle/asn1/IASN1Encodable;

    .line 962
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isNullExtension(Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtension;)Z
    .locals 2
    .param p1, "extNonce"    # Lcom/itextpdf/commons/bouncycastle/asn1/x509/IExtension;

    .line 957
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Either com.itextpdf:bouncy-castle-adapter or com.itextpdf:bouncy-castle-fips-adapter dependency must be added in order to use BouncyCastleFactoryCreator"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
