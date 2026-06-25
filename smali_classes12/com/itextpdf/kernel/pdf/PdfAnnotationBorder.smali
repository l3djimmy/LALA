.class public Lcom/itextpdf/kernel/pdf/PdfAnnotationBorder;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfAnnotationBorder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfArray;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(FFF)V
    .locals 1
    .param p1, "hRadius"    # F
    .param p2, "vRadius"    # F
    .param p3, "width"    # F

    .line 48
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/itextpdf/kernel/pdf/PdfAnnotationBorder;-><init>(FFFLcom/itextpdf/kernel/pdf/PdfDashPattern;)V

    .line 49
    return-void
.end method

.method public constructor <init>(FFFLcom/itextpdf/kernel/pdf/PdfDashPattern;)V
    .locals 5
    .param p1, "hRadius"    # F
    .param p2, "vRadius"    # F
    .param p3, "width"    # F
    .param p4, "dash"    # Lcom/itextpdf/kernel/pdf/PdfDashPattern;

    .line 63
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x3

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 v2, 0x1

    aput p2, v1, v2

    const/4 v2, 0x2

    aput p3, v1, v2

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 64
    if-eqz p4, :cond_2

    .line 65
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 66
    .local v0, "dashArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfAnnotationBorder;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 67
    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/PdfDashPattern;->getDash()F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-ltz v1, :cond_0

    .line 68
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/PdfDashPattern;->getDash()F

    move-result v3

    float-to-double v3, v3

    invoke-direct {v1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 70
    :cond_0
    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/PdfDashPattern;->getGap()F

    move-result v1

    cmpl-float v1, v1, v2

    if-ltz v1, :cond_1

    .line 71
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/PdfDashPattern;->getGap()F

    move-result v3

    float-to-double v3, v3

    invoke-direct {v1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 73
    :cond_1
    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/PdfDashPattern;->getPhase()F

    move-result v1

    cmpl-float v1, v1, v2

    if-ltz v1, :cond_2

    .line 74
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfAnnotationBorder;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {p4}, Lcom/itextpdf/kernel/pdf/PdfDashPattern;->getPhase()F

    move-result v3

    float-to-double v3, v3

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 77
    .end local v0    # "dashArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_2
    return-void
.end method


# virtual methods
.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 81
    const/4 v0, 0x0

    return v0
.end method
