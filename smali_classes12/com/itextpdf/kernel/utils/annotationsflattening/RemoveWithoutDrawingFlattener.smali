.class public Lcom/itextpdf/kernel/utils/annotationsflattening/RemoveWithoutDrawingFlattener;
.super Ljava/lang/Object;
.source "RemoveWithoutDrawingFlattener.java"

# interfaces
.implements Lcom/itextpdf/kernel/utils/annotationsflattening/IAnnotationFlattener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    return-void
.end method


# virtual methods
.method public flatten(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Lcom/itextpdf/kernel/pdf/PdfPage;)Z
    .locals 3
    .param p1, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .param p2, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 49
    const-string/jumbo v0, "{0} should not be null."

    if-eqz p1, :cond_1

    .line 53
    if-eqz p2, :cond_0

    .line 57
    invoke-virtual {p2, p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->removeAnnotation(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 58
    const/4 v0, 0x1

    return v0

    .line 54
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string/jumbo v2, "page"

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 55
    invoke-static {v0, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 50
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "annotation"

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 51
    invoke-static {v0, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
