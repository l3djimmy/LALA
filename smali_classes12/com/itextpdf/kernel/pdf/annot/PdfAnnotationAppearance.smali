.class public Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfAnnotationAppearance.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 41
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 42
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 37
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 38
    return-void
.end method


# virtual methods
.method public getStateObject(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;
    .locals 1
    .param p1, "stateName"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 55
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsStream(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfStream;

    move-result-object v0

    return-object v0
.end method

.method public getStates()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;"
        }
    .end annotation

    .line 59
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 64
    const/4 v0, 0x0

    return v0
.end method

.method public setState(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;
    .locals 2
    .param p1, "stateName"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "state"    # Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    .line 45
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 46
    return-object p0
.end method

.method public setStateObject(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfStream;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;
    .locals 1
    .param p1, "stateName"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "state"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 50
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 51
    return-object p0
.end method
