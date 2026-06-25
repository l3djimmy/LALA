.class public Lcom/itextpdf/kernel/utils/annotationsflattening/WarnFormfieldFlattener;
.super Ljava/lang/Object;
.source "WarnFormfieldFlattener.java"

# interfaces
.implements Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 40
    const-class v0, Lcom/itextpdf/kernel/utils/annotationsflattening/WarnFormfieldFlattener;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/WarnFormfieldFlattener;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    return-void
.end method


# virtual methods
.method public flatten(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Lcom/itextpdf/kernel/pdf/PdfPage;)Z
    .locals 3
    .param p1, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .param p2, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 54
    const-string/jumbo v0, "{0} should not be null."

    if-eqz p1, :cond_1

    .line 58
    if-eqz p2, :cond_0

    .line 62
    sget-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/WarnFormfieldFlattener;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "Form field annotation flattening is not supported. Use the PdfAcroForm#flattenFields() method instead."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 63
    const/4 v0, 0x0

    return v0

    .line 59
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string/jumbo v2, "page"

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 60
    invoke-static {v0, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 55
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "annotation"

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 56
    invoke-static {v0, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
