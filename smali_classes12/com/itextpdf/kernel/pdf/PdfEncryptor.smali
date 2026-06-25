.class public final Lcom/itextpdf/kernel/pdf/PdfEncryptor;
.super Ljava/lang/Object;
.source "PdfEncryptor.java"


# static fields
.field private static final BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;


# instance fields
.field private metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

.field private properties:Lcom/itextpdf/kernel/pdf/EncryptionProperties;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 47
    invoke-static {}, Lcom/itextpdf/bouncycastleconnector/BouncyCastleFactoryCreator;->getFactory()Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfEncryptor;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    return-void
.end method

.method public static encrypt(Lcom/itextpdf/kernel/pdf/PdfReader;Ljava/io/OutputStream;Lcom/itextpdf/kernel/pdf/EncryptionProperties;)V
    .locals 1
    .param p0, "reader"    # Lcom/itextpdf/kernel/pdf/PdfReader;
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "properties"    # Lcom/itextpdf/kernel/pdf/EncryptionProperties;

    .line 77
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/PdfEncryptor;->encrypt(Lcom/itextpdf/kernel/pdf/PdfReader;Ljava/io/OutputStream;Lcom/itextpdf/kernel/pdf/EncryptionProperties;Ljava/util/Map;)V

    .line 78
    return-void
.end method

.method public static encrypt(Lcom/itextpdf/kernel/pdf/PdfReader;Ljava/io/OutputStream;Lcom/itextpdf/kernel/pdf/EncryptionProperties;Ljava/util/Map;)V
    .locals 1
    .param p0, "reader"    # Lcom/itextpdf/kernel/pdf/PdfReader;
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "properties"    # Lcom/itextpdf/kernel/pdf/EncryptionProperties;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfReader;",
            "Ljava/io/OutputStream;",
            "Lcom/itextpdf/kernel/pdf/EncryptionProperties;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 66
    .local p3, "newInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfEncryptor;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfEncryptor;-><init>()V

    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/PdfEncryptor;->setEncryptionProperties(Lcom/itextpdf/kernel/pdf/EncryptionProperties;)Lcom/itextpdf/kernel/pdf/PdfEncryptor;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p3}, Lcom/itextpdf/kernel/pdf/PdfEncryptor;->encrypt(Lcom/itextpdf/kernel/pdf/PdfReader;Ljava/io/OutputStream;Ljava/util/Map;)V

    .line 67
    return-void
.end method

.method public static getContent(Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformation;Ljava/security/PrivateKey;Ljava/lang/String;)[B
    .locals 4
    .param p0, "recipientInfo"    # Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformation;
    .param p1, "certificateKey"    # Ljava/security/PrivateKey;
    .param p2, "certificateKeyProvider"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/itextpdf/commons/bouncycastle/cms/AbstractCMSException;
        }
    .end annotation

    .line 194
    invoke-interface {p1}, Ljava/security/PrivateKey;->getAlgorithm()Ljava/lang/String;

    move-result-object v0

    .line 196
    .local v0, "algorithm":Ljava/lang/String;
    const-string v1, "RSA"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 197
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfEncryptor;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-interface {v1, p1}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createJceKeyTransEnvelopedRecipient(Ljava/security/PrivateKey;)Lcom/itextpdf/commons/bouncycastle/cms/jcajce/IJceKeyTransEnvelopedRecipient;

    move-result-object v1

    .line 198
    invoke-interface {v1, p2}, Lcom/itextpdf/commons/bouncycastle/cms/jcajce/IJceKeyTransEnvelopedRecipient;->setProvider(Ljava/lang/String;)Lcom/itextpdf/commons/bouncycastle/cms/jcajce/IJceKeyTransEnvelopedRecipient;

    move-result-object v1

    .local v1, "jceKeyRecipient":Lcom/itextpdf/commons/bouncycastle/cms/IRecipient;
    goto :goto_0

    .line 199
    .end local v1    # "jceKeyRecipient":Lcom/itextpdf/commons/bouncycastle/cms/IRecipient;
    :cond_0
    const-string v1, "EC"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 200
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfEncryptor;->BOUNCY_CASTLE_FACTORY:Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;

    invoke-interface {v1, p1}, Lcom/itextpdf/commons/bouncycastle/IBouncyCastleFactory;->createJceKeyAgreeEnvelopedRecipient(Ljava/security/PrivateKey;)Lcom/itextpdf/commons/bouncycastle/cms/jcajce/IJceKeyAgreeEnvelopedRecipient;

    move-result-object v1

    .line 201
    invoke-interface {v1, p2}, Lcom/itextpdf/commons/bouncycastle/cms/jcajce/IJceKeyAgreeEnvelopedRecipient;->setProvider(Ljava/lang/String;)Lcom/itextpdf/commons/bouncycastle/cms/jcajce/IJceKeyAgreeEnvelopedRecipient;

    move-result-object v1

    .line 206
    .restart local v1    # "jceKeyRecipient":Lcom/itextpdf/commons/bouncycastle/cms/IRecipient;
    :goto_0
    invoke-interface {p0, v1}, Lcom/itextpdf/commons/bouncycastle/cms/IRecipientInformation;->getContent(Lcom/itextpdf/commons/bouncycastle/cms/IRecipient;)[B

    move-result-object v2

    return-object v2

    .line 203
    .end local v1    # "jceKeyRecipient":Lcom/itextpdf/commons/bouncycastle/cms/IRecipient;
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "Algorithm {0} is not supported."

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getPermissionsVerbose(I)Ljava/lang/String;
    .locals 3
    .param p0, "permissions"    # I

    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Allowed:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .local v0, "buf":Ljava/lang/StringBuilder;
    and-int/lit16 v1, p0, 0x804

    const/16 v2, 0x804

    if-ne v1, v2, :cond_0

    const-string v1, " Printing"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    :cond_0
    and-int/lit8 v1, p0, 0x8

    const/16 v2, 0x8

    if-ne v1, v2, :cond_1

    .line 90
    const-string v1, " Modify contents"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    :cond_1
    and-int/lit8 v1, p0, 0x10

    const/16 v2, 0x10

    if-ne v1, v2, :cond_2

    const-string v1, " Copy"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    :cond_2
    and-int/lit8 v1, p0, 0x20

    const/16 v2, 0x20

    if-ne v1, v2, :cond_3

    .line 93
    const-string v1, " Modify annotations"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    :cond_3
    and-int/lit16 v1, p0, 0x100

    const/16 v2, 0x100

    if-ne v1, v2, :cond_4

    const-string v1, " Fill in"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    :cond_4
    and-int/lit16 v1, p0, 0x200

    const/16 v2, 0x200

    if-ne v1, v2, :cond_5

    .line 96
    const-string v1, " Screen readers"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    :cond_5
    and-int/lit16 v1, p0, 0x400

    const/16 v2, 0x400

    if-ne v1, v2, :cond_6

    const-string v1, " Assembly"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    :cond_6
    and-int/lit8 v1, p0, 0x4

    const/4 v2, 0x4

    if-ne v1, v2, :cond_7

    .line 99
    const-string v1, " Degraded printing"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    :cond_7
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static isAssemblyAllowed(I)Z
    .locals 2
    .param p0, "permissions"    # I

    .line 170
    and-int/lit16 v0, p0, 0x400

    const/16 v1, 0x400

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isCopyAllowed(I)Z
    .locals 2
    .param p0, "permissions"    # I

    .line 130
    and-int/lit8 v0, p0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isDegradedPrintingAllowed(I)Z
    .locals 2
    .param p0, "permissions"    # I

    .line 180
    and-int/lit8 v0, p0, 0x4

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isFillInAllowed(I)Z
    .locals 2
    .param p0, "permissions"    # I

    .line 150
    and-int/lit16 v0, p0, 0x100

    const/16 v1, 0x100

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isModifyAnnotationsAllowed(I)Z
    .locals 2
    .param p0, "permissions"    # I

    .line 140
    and-int/lit8 v0, p0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isModifyContentsAllowed(I)Z
    .locals 2
    .param p0, "permissions"    # I

    .line 120
    and-int/lit8 v0, p0, 0x8

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isPrintingAllowed(I)Z
    .locals 2
    .param p0, "permissions"    # I

    .line 110
    and-int/lit16 v0, p0, 0x804

    const/16 v1, 0x804

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isScreenReadersAllowed(I)Z
    .locals 2
    .param p0, "permissions"    # I

    .line 160
    and-int/lit16 v0, p0, 0x200

    const/16 v1, 0x200

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public encrypt(Lcom/itextpdf/kernel/pdf/PdfReader;Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "reader"    # Lcom/itextpdf/kernel/pdf/PdfReader;
    .param p2, "os"    # Ljava/io/OutputStream;

    .line 260
    const/4 v0, 0x0

    move-object v1, v0

    check-cast v1, Ljava/util/Map;

    invoke-virtual {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/PdfEncryptor;->encrypt(Lcom/itextpdf/kernel/pdf/PdfReader;Ljava/io/OutputStream;Ljava/util/Map;)V

    .line 261
    return-void
.end method

.method public encrypt(Lcom/itextpdf/kernel/pdf/PdfReader;Ljava/io/OutputStream;Ljava/util/Map;)V
    .locals 7
    .param p1, "reader"    # Lcom/itextpdf/kernel/pdf/PdfReader;
    .param p2, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfReader;",
            "Ljava/io/OutputStream;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 240
    .local p3, "newInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/itextpdf/kernel/pdf/WriterProperties;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/WriterProperties;-><init>()V

    .line 241
    .local v0, "writerProperties":Lcom/itextpdf/kernel/pdf/WriterProperties;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfEncryptor;->properties:Lcom/itextpdf/kernel/pdf/EncryptionProperties;

    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/WriterProperties;->encryptionProperties:Lcom/itextpdf/kernel/pdf/EncryptionProperties;

    .line 242
    new-instance v1, Lcom/itextpdf/kernel/pdf/StampingProperties;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/StampingProperties;-><init>()V

    .line 243
    .local v1, "stampingProperties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfEncryptor;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/StampingProperties;->setEventCountingMetaInfo(Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Lcom/itextpdf/kernel/pdf/DocumentProperties;

    .line 244
    :try_start_0
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfWriter;

    invoke-direct {v2, p2, v0}, Lcom/itextpdf/kernel/pdf/PdfWriter;-><init>(Ljava/io/OutputStream;Lcom/itextpdf/kernel/pdf/WriterProperties;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 245
    .local v2, "writer":Lcom/itextpdf/kernel/pdf/PdfWriter;
    :try_start_1
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-direct {v3, p1, v2, v1}, Lcom/itextpdf/kernel/pdf/PdfDocument;-><init>(Lcom/itextpdf/kernel/pdf/PdfReader;Lcom/itextpdf/kernel/pdf/PdfWriter;Lcom/itextpdf/kernel/pdf/StampingProperties;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 244
    .local v3, "document":Lcom/itextpdf/kernel/pdf/PdfDocument;
    nop

    .line 246
    :try_start_2
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getDocumentInfo()Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;

    move-result-object v4

    invoke-virtual {v4, p3}, Lcom/itextpdf/kernel/pdf/PdfDocumentInfo;->setMoreInfo(Ljava/util/Map;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 247
    :try_start_3
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .end local v3    # "document":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :try_start_4
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfWriter;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 250
    .end local v2    # "writer":Lcom/itextpdf/kernel/pdf/PdfWriter;
    goto :goto_2

    .line 244
    .restart local v2    # "writer":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local v3    # "document":Lcom/itextpdf/kernel/pdf/PdfDocument;
    :catchall_0
    move-exception v4

    .end local v0    # "writerProperties":Lcom/itextpdf/kernel/pdf/WriterProperties;
    .end local v1    # "stampingProperties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .end local v2    # "writer":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .end local v3    # "document":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local p1    # "reader":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p2    # "os":Ljava/io/OutputStream;
    .end local p3    # "newInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_5
    throw v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 247
    .restart local v0    # "writerProperties":Lcom/itextpdf/kernel/pdf/WriterProperties;
    .restart local v1    # "stampingProperties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .restart local v2    # "writer":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local v3    # "document":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local p1    # "reader":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p2    # "os":Ljava/io/OutputStream;
    .restart local p3    # "newInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catchall_1
    move-exception v5

    :try_start_6
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    goto :goto_0

    :catchall_2
    move-exception v6

    :try_start_7
    invoke-virtual {v4, v6}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "writerProperties":Lcom/itextpdf/kernel/pdf/WriterProperties;
    .end local v1    # "stampingProperties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .end local v2    # "writer":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .end local p1    # "reader":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p2    # "os":Ljava/io/OutputStream;
    .end local p3    # "newInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_0
    throw v5
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 244
    .end local v3    # "document":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .restart local v0    # "writerProperties":Lcom/itextpdf/kernel/pdf/WriterProperties;
    .restart local v1    # "stampingProperties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .restart local v2    # "writer":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local p1    # "reader":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p2    # "os":Ljava/io/OutputStream;
    .restart local p3    # "newInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catchall_3
    move-exception v3

    .end local v0    # "writerProperties":Lcom/itextpdf/kernel/pdf/WriterProperties;
    .end local v1    # "stampingProperties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .end local v2    # "writer":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .end local p1    # "reader":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p2    # "os":Ljava/io/OutputStream;
    .end local p3    # "newInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_8
    throw v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 247
    .restart local v0    # "writerProperties":Lcom/itextpdf/kernel/pdf/WriterProperties;
    .restart local v1    # "stampingProperties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .restart local v2    # "writer":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local p1    # "reader":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p2    # "os":Ljava/io/OutputStream;
    .restart local p3    # "newInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catchall_4
    move-exception v4

    :try_start_9
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfWriter;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    goto :goto_1

    :catchall_5
    move-exception v5

    :try_start_a
    invoke-virtual {v3, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "writerProperties":Lcom/itextpdf/kernel/pdf/WriterProperties;
    .end local v1    # "stampingProperties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .end local p1    # "reader":Lcom/itextpdf/kernel/pdf/PdfReader;
    .end local p2    # "os":Ljava/io/OutputStream;
    .end local p3    # "newInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_1
    throw v4
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_0

    .end local v2    # "writer":Lcom/itextpdf/kernel/pdf/PdfWriter;
    .restart local v0    # "writerProperties":Lcom/itextpdf/kernel/pdf/WriterProperties;
    .restart local v1    # "stampingProperties":Lcom/itextpdf/kernel/pdf/StampingProperties;
    .restart local p1    # "reader":Lcom/itextpdf/kernel/pdf/PdfReader;
    .restart local p2    # "os":Ljava/io/OutputStream;
    .restart local p3    # "newInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v2

    .line 251
    :goto_2
    return-void
.end method

.method public setEncryptionProperties(Lcom/itextpdf/kernel/pdf/EncryptionProperties;)Lcom/itextpdf/kernel/pdf/PdfEncryptor;
    .locals 0
    .param p1, "properties"    # Lcom/itextpdf/kernel/pdf/EncryptionProperties;

    .line 226
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfEncryptor;->properties:Lcom/itextpdf/kernel/pdf/EncryptionProperties;

    .line 227
    return-object p0
.end method

.method public setEventCountingMetaInfo(Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Lcom/itextpdf/kernel/pdf/PdfEncryptor;
    .locals 0
    .param p1, "metaInfo"    # Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 216
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfEncryptor;->metaInfo:Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 217
    return-object p0
.end method
