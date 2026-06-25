.class public abstract Lcom/itextpdf/kernel/crypto/securityhandler/StandardSecurityHandler;
.super Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;
.source "StandardSecurityHandler.java"


# static fields
.field protected static final PERMS_MASK_1_FOR_REVISION_2:I = -0x40

.field protected static final PERMS_MASK_1_FOR_REVISION_3_OR_GREATER:I = -0xf40

.field protected static final PERMS_MASK_2:I = -0x4


# instance fields
.field protected permissions:J

.field protected usedOwnerPassword:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Lcom/itextpdf/kernel/crypto/securityhandler/SecurityHandler;-><init>()V

    .line 41
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardSecurityHandler;->usedOwnerPassword:Z

    return-void
.end method

.method protected static equalsArray([B[BI)Z
    .locals 3
    .param p0, "ar1"    # [B
    .param p1, "ar2"    # [B
    .param p2, "size"    # I

    .line 76
    const/4 v0, 0x0

    .local v0, "k":I
    :goto_0
    if-ge v0, p2, :cond_1

    .line 77
    aget-byte v1, p0, v0

    aget-byte v2, p1, v0

    if-eq v1, v2, :cond_0

    .line 78
    const/4 v1, 0x0

    return v1

    .line 76
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 81
    .end local v0    # "k":I
    :cond_1
    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method protected generateOwnerPasswordIfNullOrEmpty([B)[B
    .locals 2
    .param p1, "ownerPassword"    # [B

    .line 59
    if-eqz p1, :cond_0

    array-length v0, p1

    if-nez v0, :cond_1

    .line 60
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardSecurityHandler;->md5:Ljava/security/MessageDigest;

    invoke-static {}, Lcom/itextpdf/kernel/pdf/PdfEncryption;->generateNewDocumentId()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p1

    .line 62
    :cond_1
    return-object p1
.end method

.method protected getIsoBytes(Lcom/itextpdf/kernel/pdf/PdfString;)[B
    .locals 1
    .param p1, "string"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 72
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public getPermissions()J
    .locals 2

    .line 44
    iget-wide v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardSecurityHandler;->permissions:J

    return-wide v0
.end method

.method public isUsedOwnerPassword()Z
    .locals 1

    .line 48
    iget-boolean v0, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardSecurityHandler;->usedOwnerPassword:Z

    return v0
.end method

.method protected setStandardHandlerDicEntries(Lcom/itextpdf/kernel/pdf/PdfDictionary;[B[B)V
    .locals 4
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "userKey"    # [B
    .param p3, "ownerKey"    # [B

    .line 52
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Standard:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 53
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->O:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfLiteral;

    invoke-static {p3}, Lcom/itextpdf/io/util/StreamUtil;->createEscapedString([B)[B

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfLiteral;-><init>([B)V

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 54
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->U:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfLiteral;

    invoke-static {p2}, Lcom/itextpdf/io/util/StreamUtil;->createEscapedString([B)[B

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfLiteral;-><init>([B)V

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 55
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    iget-wide v2, p0, Lcom/itextpdf/kernel/crypto/securityhandler/StandardSecurityHandler;->permissions:J

    long-to-double v2, v2

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 56
    return-void
.end method
