.class public Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;
.super Ljava/lang/Object;
.source "DefaultAnnotationFlattener.java"

# interfaces
.implements Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 48
    const-class v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    return-void
.end method


# virtual methods
.method protected createCanvas(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .locals 4
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 105
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->newContentStreamAfter()Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getResources()Lcom/itextpdf/kernel/pdf/PdfResources;

    move-result-object v2

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    return-object v0
.end method

.method protected draw(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Lcom/itextpdf/kernel/pdf/PdfPage;)Z
    .locals 1
    .param p1, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .param p2, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 119
    const/4 v0, 0x0

    return v0
.end method

.method public flatten(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Lcom/itextpdf/kernel/pdf/PdfPage;)Z
    .locals 7
    .param p1, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .param p2, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 63
    const-string/jumbo v0, "{0} should not be null."

    if-eqz p1, :cond_4

    .line 67
    if-eqz p2, :cond_3

    .line 71
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getRectangle()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 72
    .local v0, "pdfArrayRectangle":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 73
    return v1

    .line 76
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getNormalAppearanceObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 77
    .local v2, "normalAppearance":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v3, v2, Lcom/itextpdf/kernel/pdf/PdfStream;

    const/4 v4, 0x1

    if-eqz v3, :cond_1

    .line 78
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getRectangle()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->toRectangle()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 79
    .local v1, "area":Lcom/itextpdf/kernel/geom/Rectangle;
    invoke-virtual {p0, p2}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;->createCanvas(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move-result-object v3

    .line 80
    .local v3, "under":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    move-object v5, v2

    check-cast v5, Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 81
    .local v5, "annotationNormalAppearanceStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    new-instance v6, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    invoke-direct {v6, v5}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    invoke-virtual {v3, v6, v1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->addXObjectFittedIntoRectangle(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;Lcom/itextpdf/kernel/geom/Rectangle;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 82
    invoke-virtual {p2, p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->removeAnnotation(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 83
    return v4

    .line 85
    .end local v1    # "area":Lcom/itextpdf/kernel/geom/Rectangle;
    .end local v3    # "under":Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;
    .end local v5    # "annotationNormalAppearanceStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;->draw(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Lcom/itextpdf/kernel/pdf/PdfPage;)Z

    move-result v3

    .line 86
    .local v3, "drawn":Z
    if-eqz v3, :cond_2

    .line 87
    invoke-virtual {p2, p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->removeAnnotation(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 88
    return v4

    .line 91
    :cond_2
    nop

    .line 92
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    .line 91
    const-string v5, "Flattening annotation type {0} is not yet supported, it will not be removed from the page"

    invoke-static {v5, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 93
    .local v4, "message":Ljava/lang/String;
    sget-object v5, Lcom/itextpdf/kernel/utils/annotationsflattening/DefaultAnnotationFlattener;->LOGGER:Lorg/slf4j/Logger;

    invoke-interface {v5, v4}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 94
    return v1

    .line 68
    .end local v0    # "pdfArrayRectangle":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v2    # "normalAppearance":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v3    # "drawn":Z
    .end local v4    # "message":Ljava/lang/String;
    :cond_3
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string/jumbo v2, "page"

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 69
    invoke-static {v0, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 64
    :cond_4
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "annotation"

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 65
    invoke-static {v0, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
