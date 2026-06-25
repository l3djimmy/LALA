.class public Lcom/itextpdf/kernel/pdf/action/PdfMediaClipData;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfMediaClipData.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# static fields
.field private static final TEMPACCESS:Lcom/itextpdf/kernel/pdf/PdfString;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 38
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v1, "TEMPACCESS"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/action/PdfMediaClipData;->TEMPACCESS:Lcom/itextpdf/kernel/pdf/PdfString;

    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 46
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 47
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Ljava/lang/String;)V
    .locals 6
    .param p1, "file"    # Ljava/lang/String;
    .param p2, "fs"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .param p3, "mimeType"    # Ljava/lang/String;

    .line 57
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/action/PdfMediaClipData;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 58
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 59
    .local v0, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/action/PdfMediaClipData;->markObjectAsIndirect(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 60
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->TF:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/action/PdfMediaClipData;->TEMPACCESS:Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 61
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfMediaClipData;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->MediaClip:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 62
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfMediaClipData;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->MCD:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 63
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfMediaClipData;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v4, "Media clip for {0}"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 64
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfMediaClipData;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->CT:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v3, p3}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 65
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfMediaClipData;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 66
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfMediaClipData;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 67
    return-void
.end method


# virtual methods
.method public flush()V
    .locals 0

    .line 78
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->flush()V

    .line 79
    return-void
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 86
    const/4 v0, 0x1

    return v0
.end method
