.class public Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$CoonsPatchMesh;
.super Lcom/itextpdf/kernel/pdf/colorspace/PdfShading;
.source "PdfShading.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/colorspace/PdfShading;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CoonsPatchMesh"
.end annotation


# direct methods
.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfStream;)V
    .locals 0
    .param p1, "pdfStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 1123
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 1124
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;IIILcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 2
    .param p1, "cs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .param p2, "bitsPerCoordinate"    # I
    .param p3, "bitsPerComponent"    # I
    .param p4, "bitsPerFlag"    # I
    .param p5, "decode"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 1167
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfStream;-><init>()V

    const/4 v1, 0x6

    invoke-direct {p0, v0, v1, p1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;ILcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;)V

    .line 1168
    invoke-virtual {p0, p2}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$CoonsPatchMesh;->setBitsPerCoordinate(I)V

    .line 1169
    invoke-virtual {p0, p3}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$CoonsPatchMesh;->setBitsPerComponent(I)V

    .line 1170
    invoke-virtual {p0, p4}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$CoonsPatchMesh;->setBitsPerFlag(I)V

    .line 1171
    invoke-virtual {p0, p5}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$CoonsPatchMesh;->setDecode(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 1172
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;III[F)V
    .locals 6
    .param p1, "cs"    # Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .param p2, "bitsPerCoordinate"    # I
    .param p3, "bitsPerComponent"    # I
    .param p4, "bitsPerFlag"    # I
    .param p5, "decode"    # [F

    .line 1145
    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v5, p5}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    .end local p1    # "cs":Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .end local p2    # "bitsPerCoordinate":I
    .end local p3    # "bitsPerComponent":I
    .end local p4    # "bitsPerFlag":I
    .local v1, "cs":Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .local v2, "bitsPerCoordinate":I
    .local v3, "bitsPerComponent":I
    .local v4, "bitsPerFlag":I
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$CoonsPatchMesh;-><init>(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;IIILcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 1146
    return-void
.end method


# virtual methods
.method public getBitsPerComponent()I
    .locals 2

    .line 1199
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$CoonsPatchMesh;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BitsPerComponent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsInt(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getBitsPerCoordinate()I
    .locals 2

    .line 1180
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$CoonsPatchMesh;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BitsPerCoordinate:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsInt(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getBitsPerFlag()I
    .locals 2

    .line 1220
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$CoonsPatchMesh;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BitsPerFlag:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsInt(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getDecode()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 1244
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$CoonsPatchMesh;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Decode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public setBitsPerComponent(I)V
    .locals 3
    .param p1, "bitsPerComponent"    # I

    .line 1208
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$CoonsPatchMesh;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BitsPerComponent:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1209
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$CoonsPatchMesh;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 1210
    return-void
.end method

.method public setBitsPerCoordinate(I)V
    .locals 3
    .param p1, "bitsPerCoordinate"    # I

    .line 1189
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$CoonsPatchMesh;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BitsPerCoordinate:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1190
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$CoonsPatchMesh;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 1191
    return-void
.end method

.method public setBitsPerFlag(I)V
    .locals 3
    .param p1, "bitsPerFlag"    # I

    .line 1231
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$CoonsPatchMesh;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BitsPerFlag:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1232
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$CoonsPatchMesh;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 1233
    return-void
.end method

.method public setDecode(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 2
    .param p1, "decode"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 1268
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$CoonsPatchMesh;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Decode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1269
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$CoonsPatchMesh;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 1270
    return-void
.end method

.method public setDecode([F)V
    .locals 1
    .param p1, "decode"    # [F

    .line 1256
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfShading$CoonsPatchMesh;->setDecode(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 1257
    return-void
.end method
