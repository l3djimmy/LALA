.class public Lcom/itextpdf/kernel/pdf/VersionConforming;
.super Ljava/lang/Object;
.source "VersionConforming.java"


# static fields
.field public static final DEPRECATED_AES256_REVISION:Ljava/lang/String; = "It seems that PDF 1.7 document encrypted with AES256 was updated to PDF 2.0 version and StampingProperties#preserveEncryption flag was set: encryption shall be updated via WriterProperties#setStandardEncryption method. Standard security handler was found with revision 5, which is deprecated and shall not be used in PDF 2.0 documents."

.field public static final DEPRECATED_ENCRYPTION_ALGORITHMS:Ljava/lang/String; = "Encryption algorithms STANDARD_ENCRYPTION_40, STANDARD_ENCRYPTION_128 and ENCRYPTION_AES_128 (see com.itextpdf.kernel.pdf.EncryptionConstants) are deprecated in PDF 2.0. It is highly recommended not to use it."

.field public static final DEPRECATED_NEED_APPEARANCES_IN_ACROFORM:Ljava/lang/String; = "NeedAppearances has been deprecated in PDF 2.0. Appearance streams are required in PDF 2.0."

.field public static final DEPRECATED_XFA_FORMS:Ljava/lang/String; = "XFA is deprecated in PDF 2.0. The XFA form will not be written to the document"

.field private static final logger:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 38
    const-class v0, Lcom/itextpdf/kernel/pdf/VersionConforming;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/VersionConforming;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static validatePdfVersionForDeprecatedFeatureLogError(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfVersion;Ljava/lang/String;)Z
    .locals 1
    .param p0, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "expectedVersion"    # Lcom/itextpdf/kernel/pdf/PdfVersion;
    .param p2, "deprecatedFeatureLogMessage"    # Ljava/lang/String;

    .line 61
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPdfVersion()Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result v0

    if-ltz v0, :cond_0

    .line 62
    sget-object v0, Lcom/itextpdf/kernel/pdf/VersionConforming;->logger:Lorg/slf4j/Logger;

    invoke-interface {v0, p2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 63
    const/4 v0, 0x1

    return v0

    .line 65
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static validatePdfVersionForDeprecatedFeatureLogWarn(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfVersion;Ljava/lang/String;)Z
    .locals 1
    .param p0, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "expectedVersion"    # Lcom/itextpdf/kernel/pdf/PdfVersion;
    .param p2, "deprecatedFeatureLogMessage"    # Ljava/lang/String;

    .line 52
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPdfVersion()Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result v0

    if-ltz v0, :cond_0

    .line 53
    sget-object v0, Lcom/itextpdf/kernel/pdf/VersionConforming;->logger:Lorg/slf4j/Logger;

    invoke-interface {v0, p2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 54
    const/4 v0, 0x1

    return v0

    .line 56
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static validatePdfVersionForDictEntry(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfVersion;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfName;)Z
    .locals 3
    .param p0, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p1, "expectedVersion"    # Lcom/itextpdf/kernel/pdf/PdfVersion;
    .param p2, "entryKey"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p3, "dictType"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 41
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPdfVersion()Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result v0

    if-gez v0, :cond_0

    .line 42
    sget-object v0, Lcom/itextpdf/kernel/pdf/VersionConforming;->logger:Lorg/slf4j/Logger;

    .line 44
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPdfVersion()Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v1

    filled-new-array {p2, p3, p1, v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 43
    const-string v2, "\"{0}\" entry in the \"{1}\" dictionary is a {2} and higher version feature. It is meaningless for the current {3} version."

    invoke-static {v2, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 42
    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 45
    const/4 v0, 0x1

    return v0

    .line 47
    :cond_0
    const/4 v0, 0x0

    return v0
.end method
