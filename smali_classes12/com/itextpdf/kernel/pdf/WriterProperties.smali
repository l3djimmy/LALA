.class public Lcom/itextpdf/kernel/pdf/WriterProperties;
.super Ljava/lang/Object;
.source "WriterProperties.java"


# instance fields
.field protected addUAXmpMetadata:Z

.field protected addXmpMetadata:Z

.field protected compressionLevel:I

.field protected encryptionProperties:Lcom/itextpdf/kernel/pdf/EncryptionProperties;

.field protected initialDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

.field protected isFullCompression:Ljava/lang/Boolean;

.field protected modifiedDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

.field protected pdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

.field protected smartMode:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->smartMode:Z

    .line 60
    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->addUAXmpMetadata:Z

    .line 61
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->compressionLevel:I

    .line 62
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->isFullCompression:Ljava/lang/Boolean;

    .line 63
    new-instance v0, Lcom/itextpdf/kernel/pdf/EncryptionProperties;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/EncryptionProperties;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->encryptionProperties:Lcom/itextpdf/kernel/pdf/EncryptionProperties;

    .line 64
    return-void
.end method


# virtual methods
.method public addUAXmpMetadata()Lcom/itextpdf/kernel/pdf/WriterProperties;
    .locals 1

    .line 243
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->addUAXmpMetadata:Z

    .line 244
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/WriterProperties;->addXmpMetadata()Lcom/itextpdf/kernel/pdf/WriterProperties;

    move-result-object v0

    return-object v0
.end method

.method public addXmpMetadata()Lcom/itextpdf/kernel/pdf/WriterProperties;
    .locals 1

    .line 100
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->addXmpMetadata:Z

    .line 101
    return-object p0
.end method

.method isPublicKeyEncryptionUsed()Z
    .locals 1

    .line 252
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->encryptionProperties:Lcom/itextpdf/kernel/pdf/EncryptionProperties;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->isPublicKeyEncryptionUsed()Z

    move-result v0

    return v0
.end method

.method isStandardEncryptionUsed()Z
    .locals 1

    .line 248
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->encryptionProperties:Lcom/itextpdf/kernel/pdf/EncryptionProperties;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->isStandardEncryptionUsed()Z

    move-result v0

    return v0
.end method

.method public setCompressionLevel(I)Lcom/itextpdf/kernel/pdf/WriterProperties;
    .locals 0
    .param p1, "compressionLevel"    # I

    .line 112
    iput p1, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->compressionLevel:I

    .line 113
    return-object p0
.end method

.method public setFullCompressionMode(Z)Lcom/itextpdf/kernel/pdf/WriterProperties;
    .locals 1
    .param p1, "fullCompressionMode"    # Z

    .line 124
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->isFullCompression:Ljava/lang/Boolean;

    .line 125
    return-object p0
.end method

.method public setInitialDocumentId(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/WriterProperties;
    .locals 0
    .param p1, "initialDocumentId"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 217
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->initialDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 218
    return-object p0
.end method

.method public setModifiedDocumentId(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/WriterProperties;
    .locals 0
    .param p1, "modifiedDocumentId"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 230
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->modifiedDocumentId:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 231
    return-object p0
.end method

.method public setPdfVersion(Lcom/itextpdf/kernel/pdf/PdfVersion;)Lcom/itextpdf/kernel/pdf/WriterProperties;
    .locals 0
    .param p1, "version"    # Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 73
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->pdfVersion:Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 74
    return-object p0
.end method

.method public setPublicKeyEncryption([Ljava/security/cert/Certificate;[II)Lcom/itextpdf/kernel/pdf/WriterProperties;
    .locals 2
    .param p1, "certs"    # [Ljava/security/cert/Certificate;
    .param p2, "permissions"    # [I
    .param p3, "encryptionAlgorithm"    # I

    .line 200
    invoke-static {}, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->getFactory()Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, p3, v1}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->isEncryptionFeatureSupported(IZ)V

    .line 201
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->encryptionProperties:Lcom/itextpdf/kernel/pdf/EncryptionProperties;

    invoke-virtual {v0, p1, p2, p3}, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->setPublicKeyEncryption([Ljava/security/cert/Certificate;[II)Lcom/itextpdf/kernel/pdf/EncryptionProperties;

    .line 202
    return-object p0
.end method

.method public setStandardEncryption([B[BII)Lcom/itextpdf/kernel/pdf/WriterProperties;
    .locals 1
    .param p1, "userPassword"    # [B
    .param p2, "ownerPassword"    # [B
    .param p3, "permissions"    # I
    .param p4, "encryptionAlgorithm"    # I

    .line 163
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->encryptionProperties:Lcom/itextpdf/kernel/pdf/EncryptionProperties;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/itextpdf/kernel/pdf/EncryptionProperties;->setStandardEncryption([B[BII)Lcom/itextpdf/kernel/pdf/EncryptionProperties;

    .line 164
    return-object p0
.end method

.method public useSmartMode()Lcom/itextpdf/kernel/pdf/WriterProperties;
    .locals 1

    .line 89
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/WriterProperties;->smartMode:Z

    .line 90
    return-object p0
.end method
