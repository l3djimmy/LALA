.class public Lcom/itextpdf/kernel/pdf/action/PdfRendition;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfRendition.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 45
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Ljava/lang/String;)V
    .locals 5
    .param p1, "file"    # Ljava/lang/String;
    .param p2, "fs"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .param p3, "mimeType"    # Ljava/lang/String;

    .line 56
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/action/PdfRendition;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 57
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfRendition;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->MR:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 58
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfRendition;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v3, "Rendition for {0}"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 59
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfRendition;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->C:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/action/PdfMediaClipData;

    invoke-direct {v2, p1, p2, p3}, Lcom/itextpdf/kernel/pdf/action/PdfMediaClipData;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Ljava/lang/String;)V

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/action/PdfMediaClipData;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 60
    return-void
.end method


# virtual methods
.method public flush()V
    .locals 0

    .line 71
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->flush()V

    .line 72
    return-void
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 79
    const/4 v0, 0x1

    return v0
.end method
