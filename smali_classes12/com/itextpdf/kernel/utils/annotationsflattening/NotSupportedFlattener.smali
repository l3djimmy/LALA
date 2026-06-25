.class public Lcom/itextpdf/kernel/utils/annotationsflattening/NotSupportedFlattener;
.super Ljava/lang/Object;
.source "NotSupportedFlattener.java"

# interfaces
.implements Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 38
    const-class v0, Lcom/itextpdf/kernel/utils/annotationsflattening/NotSupportedFlattener;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/NotSupportedFlattener;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method


# virtual methods
.method public flatten(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Lcom/itextpdf/kernel/pdf/PdfPage;)Z
    .locals 2
    .param p1, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .param p2, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 57
    nop

    .line 58
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    .line 57
    const-string v1, "Flattening annotation type {0} is not yet supported, it will not be removed from the page"

    invoke-static {v1, v0}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 59
    .local v0, "message":Ljava/lang/String;
    sget-object v1, Lcom/itextpdf/kernel/utils/annotationsflattening/NotSupportedFlattener;->LOGGER:Lorg/slf4j/Logger;

    invoke-interface {v1, v0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 60
    const/4 v1, 0x0

    return v1
.end method
