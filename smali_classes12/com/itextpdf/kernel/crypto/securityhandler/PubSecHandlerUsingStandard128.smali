.class public Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard128;
.super Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard40;
.source "PubSecHandlerUsingStandard128.java"


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/security/Key;Ljava/security/cert/Certificate;Ljava/lang/String;Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;Z)V
    .locals 0
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "certificateKey"    # Ljava/security/Key;
    .param p3, "certificate"    # Ljava/security/cert/Certificate;
    .param p4, "certificateKeyProvider"    # Ljava/lang/String;
    .param p5, "externalDecryptionProcess"    # Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;
    .param p6, "encryptMetadata"    # Z

    .line 44
    invoke-direct/range {p0 .. p6}, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard40;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;Ljava/security/Key;Ljava/security/cert/Certificate;Ljava/lang/String;Lcom/itextpdf/kernel/security/IExternalDecryptionProcess;Z)V

    .line 45
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[Ljava/security/cert/Certificate;[IZZ)V
    .locals 0
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "certs"    # [Ljava/security/cert/Certificate;
    .param p3, "permissions"    # [I
    .param p4, "encryptMetadata"    # Z
    .param p5, "embeddedFilesOnly"    # Z

    .line 38
    invoke-direct/range {p0 .. p5}, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard40;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;[Ljava/security/cert/Certificate;[IZZ)V

    .line 39
    return-void
.end method


# virtual methods
.method protected setPubSecSpecificHandlerDicEntries(Lcom/itextpdf/kernel/pdf/PdfDictionary;ZZ)V
    .locals 5
    .param p1, "encryptionDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p2, "encryptMetadata"    # Z
    .param p3, "embeddedFilesOnly"    # Z

    .line 49
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Filter:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Adobe_PubSec:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 50
    invoke-virtual {p0}, Lcom/itextpdf/kernel/crypto/securityhandler/PubSecHandlerUsingStandard128;->createRecipientsArray()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 51
    .local v0, "recipients":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz p2, :cond_0

    .line 52
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/4 v3, 0x3

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 53
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/4 v3, 0x2

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 54
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->SubFilter:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Adbe_pkcs7_s4:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 55
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Recipients:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 57
    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/4 v3, 0x4

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 58
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 59
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->SubFilter:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Adbe_pkcs7_s5:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 61
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 62
    .local v1, "stdcf":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Recipients:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 63
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->EncryptMetadata:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfBoolean;->FALSE:Lcom/itextpdf/kernel/pdf/PdfBoolean;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 64
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->CFM:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->V2:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 66
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 67
    .local v2, "cf":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->DefaultCryptFilter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 68
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->CF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 70
    if-eqz p3, :cond_1

    .line 71
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->EFF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->DefaultCryptFilter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 72
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->StrF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Identity:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 73
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->StmF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Identity:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 75
    :cond_1
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->StrF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->DefaultCryptFilter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 76
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->StmF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->DefaultCryptFilter:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 80
    .end local v1    # "stdcf":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v2    # "cf":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :goto_0
    return-void
.end method
