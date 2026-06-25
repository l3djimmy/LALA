.class public abstract Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfXObject.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfStream;",
        ">;"
    }
.end annotation


# direct methods
.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfStream;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 49
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 50
    return-void
.end method

.method public static calculateProportionallyFitRectangleWithHeight(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;FFF)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 5
    .param p0, "xObject"    # Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "height"    # F

    .line 111
    instance-of v0, p0, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    if-eqz v0, :cond_0

    .line 112
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    .line 113
    .local v0, "formXObject":Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->calculateBBoxMultipliedByMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 114
    .local v1, "bBox":Lcom/itextpdf/kernel/geom/Rectangle;
    new-instance v2, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v3

    div-float v3, p3, v3

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v4

    mul-float/2addr v3, v4

    invoke-direct {v2, p1, p2, v3, p3}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    return-object v2

    .line 115
    .end local v0    # "formXObject":Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    .end local v1    # "bBox":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_0
    instance-of v0, p0, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    if-eqz v0, :cond_1

    .line 116
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    .line 117
    .local v0, "imageXObject":Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    new-instance v1, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;->getHeight()F

    move-result v2

    div-float v2, p3, v2

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;->getWidth()F

    move-result v3

    mul-float/2addr v2, v3

    invoke-direct {v1, p1, p2, v2, p3}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    return-object v1

    .line 119
    .end local v0    # "imageXObject":Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "PdfFormXObject or PdfImageXObject expected."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static calculateProportionallyFitRectangleWithWidth(Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;FFF)Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 5
    .param p0, "xObject"    # Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "width"    # F

    .line 84
    instance-of v0, p0, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    if-eqz v0, :cond_0

    .line 85
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    .line 86
    .local v0, "formXObject":Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;->calculateBBoxMultipliedByMatrix(Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v1

    .line 87
    .local v1, "bBox":Lcom/itextpdf/kernel/geom/Rectangle;
    new-instance v2, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v3

    div-float v3, p3, v3

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v4

    mul-float/2addr v3, v4

    invoke-direct {v2, p1, p2, p3, v3}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    return-object v2

    .line 88
    .end local v0    # "formXObject":Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;
    .end local v1    # "bBox":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_0
    instance-of v0, p0, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    if-eqz v0, :cond_1

    .line 89
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    .line 90
    .local v0, "imageXObject":Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    new-instance v1, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;->getWidth()F

    move-result v2

    div-float v2, p3, v2

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;->getHeight()F

    move-result v3

    mul-float/2addr v2, v3

    invoke-direct {v1, p1, p2, p3, v2}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    return-object v1

    .line 92
    .end local v0    # "imageXObject":Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "PdfFormXObject or PdfImageXObject expected."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static makeXObject(Lcom/itextpdf/kernel/pdf/PdfStream;)Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;
    .locals 2
    .param p0, "stream"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 60
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Form:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 61
    new-instance v0, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfFormXObject;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    return-object v0

    .line 62
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Image:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 63
    new-instance v0, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;-><init>(Lcom/itextpdf/kernel/pdf/PdfStream;)V

    return-object v0

    .line 65
    :cond_1
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Unsupported XObject type."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public addAssociatedFile(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)V
    .locals 3
    .param p1, "fs"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    .line 160
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AFRelationship:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    if-nez v0, :cond_0

    .line 161
    const-class v0, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 162
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "For associated files their associated file specification dictionaries shall include the AFRelationship key."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 164
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 165
    .local v0, "afArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_1

    .line 166
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    move-object v0, v1

    .line 167
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->AF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 169
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 170
    return-void
.end method

.method public getAssociatedFiles(Z)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 3
    .param p1, "create"    # Z

    .line 179
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 180
    .local v0, "afArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    .line 181
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    move-object v0, v1

    .line 182
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->AF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 184
    :cond_0
    return-object v0
.end method

.method public getHeight()F
    .locals 1

    .line 147
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public getWidth()F
    .locals 1

    .line 138
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 193
    const/4 v0, 0x1

    return v0
.end method

.method public setLayer(Lcom/itextpdf/kernel/pdf/layer/IPdfOCG;)V
    .locals 3
    .param p1, "layer"    # Lcom/itextpdf/kernel/pdf/layer/IPdfOCG;

    .line 129
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/xobject/PdfXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OC:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {p1}, Lcom/itextpdf/kernel/pdf/layer/IPdfOCG;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfStream;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 130
    return-void
.end method
