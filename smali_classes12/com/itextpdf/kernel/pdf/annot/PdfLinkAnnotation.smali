.class public Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;
.super Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
.source "PdfLinkAnnotation.java"


# static fields
.field public static final Invert:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static final None:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static final Outline:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static final Push:Lcom/itextpdf/kernel/pdf/PdfName;

.field private static final logger:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 44
    const-class v0, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->logger:Lorg/slf4j/Logger;

    .line 49
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->None:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 50
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->I:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->Invert:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 51
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->O:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->Outline:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 52
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->Push:Lcom/itextpdf/kernel/pdf/PdfName;

    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 0
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 72
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    .line 73
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 62
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 63
    return-void
.end method


# virtual methods
.method public getAction()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 145
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getBorderStyle()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 296
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getDestinationObject()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 2

    .line 88
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Dest:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public getHighlightMode()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 195
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->H:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method public getQuadPoints()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 273
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->QuadPoints:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 76
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Link:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method

.method public getUriActionObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 226
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->PA:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public removeAction()Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;
    .locals 2

    .line 181
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 182
    return-object p0
.end method

.method public removeDestination()Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;
    .locals 2

    .line 134
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Dest:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 135
    return-object p0
.end method

.method public setAction(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;
    .locals 1
    .param p1, "action"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 157
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    return-object v0
.end method

.method public setAction(Lcom/itextpdf/kernel/pdf/action/PdfAction;)Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;
    .locals 2
    .param p1, "action"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 168
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->getDestinationObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 169
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->removeDestination()Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    .line 170
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->logger:Lorg/slf4j/Logger;

    const-string v1, "Action was set for a link annotation containing destination. The old destination will be cleared."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 172
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    return-object v0
.end method

.method public setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;
    .locals 1
    .param p1, "borderStyle"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 307
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    return-object v0
.end method

.method public setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;
    .locals 1
    .param p1, "style"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 325
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->getBorderStyle()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/annot/BorderStyleUtil;->setStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setDashPattern(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;
    .locals 1
    .param p1, "dashPattern"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 337
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->getBorderStyle()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/itextpdf/kernel/pdf/annot/BorderStyleUtil;->setDashPattern(Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->setBorderStyle(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setDestination(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;
    .locals 2
    .param p1, "destination"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 102
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 103
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 104
    sget-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->logger:Lorg/slf4j/Logger;

    const-string v1, "Destinations are not permitted for link annotations that already have actions. The old action will be removed."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 106
    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v0

    if-eqz v0, :cond_1

    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isNumber()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 107
    const-class v0, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    const-string v1, "When destination\'s not associated with a Remote or Embedded Go-To action, it shall specify page dictionary instead of page number. Otherwise destination might be considered invalid"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 108
    :cond_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Dest:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    return-object v0
.end method

.method public setDestination(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;
    .locals 1
    .param p1, "destination"    # Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    .line 122
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->setDestination(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setHighlightMode(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;
    .locals 1
    .param p1, "hlMode"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 211
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->H:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    return-object v0
.end method

.method public setQuadPoints(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;
    .locals 1
    .param p1, "quadPoints"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 285
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->QuadPoints:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    return-object v0
.end method

.method public setUriAction(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;
    .locals 1
    .param p1, "action"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 243
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PA:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    return-object v0
.end method

.method public setUriAction(Lcom/itextpdf/kernel/pdf/action/PdfAction;)Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;
    .locals 2
    .param p1, "action"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 261
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PA:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    return-object v0
.end method
