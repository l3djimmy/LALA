.class public abstract Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;
.super Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;
.source "PdfPolyGeomAnnotation.java"


# direct methods
.method constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;[F)V
    .locals 0
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "vertices"    # [F

    .line 40
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 41
    invoke-virtual {p0, p2}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->setVertices([F)Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;

    .line 42
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 52
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfMarkupAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 53
    return-void
.end method

.method public static createPolyLine(Lcom/itextpdf/kernel/geom/Rectangle;[F)Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;
    .locals 1
    .param p0, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p1, "vertices"    # [F

    .line 60
    new-instance v0, Lcom/itextpdf/kernel/pdf/annot/PdfPolylineAnnotation;

    invoke-direct {v0, p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfPolylineAnnotation;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;[F)V

    return-object v0
.end method

.method public static createPolygon(Lcom/itextpdf/kernel/geom/Rectangle;[F)Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;
    .locals 1
    .param p0, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p1, "vertices"    # [F

    .line 56
    new-instance v0, Lcom/itextpdf/kernel/pdf/annot/PdfPolygonAnnotation;

    invoke-direct {v0, p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfPolygonAnnotation;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;[F)V

    return-object v0
.end method


# virtual methods
.method public getBorderEffect()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 193
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BE:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getBorderStyle()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 144
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getInteriorColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 2

    .line 213
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->IC:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/annot/InteriorColorUtil;->parseInteriorColor(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    return-object v0
.end method

.method public getLineEndingStyles()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 82
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->LE:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getMeasure()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 90
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Measure:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getPath()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 111
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Path:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getVertices()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 64
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Vertices:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public setBorderEffect(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;
    .locals 1
    .param p1, "borderEffect"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 203
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BE:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;

    return-object v0
.end method

.method public setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;
    .locals 1
    .param p1, "borderStyle"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 155
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;

    return-object v0
.end method

.method public setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;
    .locals 1
    .param p1, "style"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 173
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->getBorderStyle()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/annot/BorderStyleUtil;->setStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setDashPattern(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;
    .locals 1
    .param p1, "dashPattern"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 185
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->getBorderStyle()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/annot/BorderStyleUtil;->setDashPattern(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setInteriorColor(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;
    .locals 1
    .param p1, "interiorColor"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 226
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->IC:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;

    return-object v0
.end method

.method public setInteriorColor([F)Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;
    .locals 1
    .param p1, "interiorColor"    # [F

    .line 237
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->setInteriorColor(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setLineEndingStyles(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;
    .locals 1
    .param p1, "lineEndingStyles"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 86
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->LE:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;

    return-object v0
.end method

.method public setMeasure(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;
    .locals 1
    .param p1, "measure"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 94
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Measure:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;

    return-object v0
.end method

.method public setPath(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;
    .locals 2
    .param p1, "path"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 129
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Vertices:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 130
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    const-string v1, "If Path key is set, Vertices key shall not be present. Remove Vertices key before setting Path"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 132
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Path:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;

    return-object v0
.end method

.method public setVertices(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;
    .locals 2
    .param p1, "vertices"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 68
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Path:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 69
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    const-string v1, "Path key is present. Vertices will be ignored"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 71
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Vertices:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;

    return-object v0
.end method

.method public setVertices([F)Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;
    .locals 2
    .param p1, "vertices"    # [F

    .line 75
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Path:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    const-string v1, "Path key is present. Vertices will be ignored"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 78
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Vertices:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfPolyGeomAnnotation;

    return-object v0
.end method
