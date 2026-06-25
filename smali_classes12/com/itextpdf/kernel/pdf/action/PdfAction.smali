.class public Lcom/itextpdf/kernel/pdf/action/PdfAction;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfAction.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# static fields
.field public static final RESET_EXCLUDE:I = 0x1

.field public static final SUBMIT_CANONICAL_FORMAT:I = 0x200

.field public static final SUBMIT_COORDINATES:I = 0x10

.field public static final SUBMIT_EMBED_FORM:I = 0x2004

.field public static final SUBMIT_EXCLUDE:I = 0x1

.field public static final SUBMIT_EXCL_F_KEY:I = 0x800

.field public static final SUBMIT_EXCL_NON_USER_ANNOTS:I = 0x400

.field public static final SUBMIT_HTML_FORMAT:I = 0x4

.field public static final SUBMIT_HTML_GET:I = 0x8

.field public static final SUBMIT_INCLUDE_ANNOTATIONS:I = 0x80

.field public static final SUBMIT_INCLUDE_APPEND_SAVES:I = 0x40

.field public static final SUBMIT_INCLUDE_NO_VALUE_FIELDS:I = 0x2

.field public static final SUBMIT_PDF:I = 0x100

.field public static final SUBMIT_XFDF:I = 0x20


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 117
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 118
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Action:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 119
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 1
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 128
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 129
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->markObjectAsIndirect(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 130
    return-void
.end method

.method private static buildArray([Ljava/lang/Object;)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 6
    .param p0, "names"    # [Ljava/lang/Object;

    .line 647
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 648
    .local v0, "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, p0, v2

    .line 649
    .local v3, "obj":Ljava/lang/Object;
    instance-of v4, v3, Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 650
    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfString;

    move-object v5, v3

    check-cast v5, Ljava/lang/String;

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    goto :goto_1

    .line 651
    :cond_0
    instance-of v4, v3, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    if-eqz v4, :cond_1

    .line 652
    move-object v4, v3

    check-cast v4, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 648
    .end local v3    # "obj":Ljava/lang/Object;
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 654
    .restart local v3    # "obj":Ljava/lang/Object;
    :cond_1
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "The array must contain string or PDFAnnotation"

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 657
    .end local v3    # "obj":Ljava/lang/Object;
    :cond_2
    return-object v0
.end method

.method public static createGoTo(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 3
    .param p0, "destination"    # Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    .line 139
    invoke-static {p0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->validateNotRemoteDestination(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V

    .line 140
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>()V

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->GoTo:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public static createGoTo(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 1
    .param p0, "destination"    # Ljava/lang/String;

    .line 150
    new-instance v0, Lcom/itextpdf/kernel/pdf/navigation/PdfStringDestination;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfStringDestination;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->createGoTo(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public static createGoToE(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;ZLcom/itextpdf/kernel/pdf/action/PdfTarget;)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 3
    .param p0, "fileSpec"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .param p1, "destination"    # Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
    .param p2, "newWindow"    # Z
    .param p3, "targetDictionary"    # Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    .line 252
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>()V

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->GoToE:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->NewWindow:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p2}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    .line 253
    .local v0, "action":Lcom/itextpdf/kernel/pdf/action/PdfAction;
    if-eqz p0, :cond_0

    .line 254
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->F:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 256
    :cond_0
    if-eqz p1, :cond_1

    .line 257
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->validateRemoteDestination(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V

    .line 258
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    goto :goto_0

    .line 260
    :cond_1
    const-class v1, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    const-string v2, "No destination in the target was specified for action. Destination entry is mandatory for embedded go-to actions."

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 262
    :goto_0
    if-eqz p3, :cond_2

    .line 263
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->T:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/action/PdfTarget;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 265
    :cond_2
    return-object v0
.end method

.method public static createGoToE(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;ZLcom/itextpdf/kernel/pdf/action/PdfTarget;)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 1
    .param p0, "destination"    # Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
    .param p1, "newWindow"    # Z
    .param p2, "targetDictionary"    # Lcom/itextpdf/kernel/pdf/action/PdfTarget;

    .line 236
    const/4 v0, 0x0

    invoke-static {v0, p0, p1, p2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->createGoToE(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;ZLcom/itextpdf/kernel/pdf/action/PdfTarget;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public static createGoToR(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 3
    .param p0, "fileSpec"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .param p1, "destination"    # Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    .line 173
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->validateRemoteDestination(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V

    .line 174
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>()V

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->GoToR:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->F:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 175
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    .line 174
    return-object v0
.end method

.method public static createGoToR(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;Z)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 3
    .param p0, "fileSpec"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .param p1, "destination"    # Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
    .param p2, "newWindow"    # Z

    .line 162
    invoke-static {p0, p1}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->createGoToR(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->NewWindow:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p2}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public static createGoToR(Ljava/lang/String;I)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 1
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "pageNum"    # I

    .line 186
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->createGoToR(Ljava/lang/String;IZ)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public static createGoToR(Ljava/lang/String;IZ)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 2
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "pageNum"    # I
    .param p2, "newWindow"    # Z

    .line 198
    new-instance v0, Lcom/itextpdf/kernel/pdf/filespec/PdfStringFS;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/pdf/filespec/PdfStringFS;-><init>(Ljava/lang/String;)V

    const v1, 0x461c4000    # 10000.0f

    invoke-static {p1, v1}, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;->createFitH(IF)Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;

    move-result-object v1

    invoke-static {v0, v1, p2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->createGoToR(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;Z)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public static createGoToR(Ljava/lang/String;Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 1
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "destination"    # Ljava/lang/String;

    .line 221
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->createGoToR(Ljava/lang/String;Ljava/lang/String;Z)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public static createGoToR(Ljava/lang/String;Ljava/lang/String;Z)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 2
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "destination"    # Ljava/lang/String;
    .param p2, "newWindow"    # Z

    .line 210
    new-instance v0, Lcom/itextpdf/kernel/pdf/filespec/PdfStringFS;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/pdf/filespec/PdfStringFS;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/itextpdf/kernel/pdf/navigation/PdfStringDestination;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/navigation/PdfStringDestination;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1, p2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->createGoToR(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;Z)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public static createHide(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Z)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 3
    .param p0, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .param p1, "hidden"    # Z

    .line 405
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>()V

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Hide:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->T:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->H:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 406
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    .line 405
    return-object v0
.end method

.method public static createHide(Ljava/lang/String;Z)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 3
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "hidden"    # Z

    .line 430
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>()V

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Hide:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->T:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v2, p0}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->H:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 431
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    .line 430
    return-object v0
.end method

.method public static createHide([Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Z)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 3
    .param p0, "annotations"    # [Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .param p1, "hidden"    # Z

    .line 417
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>()V

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Hide:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->T:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->getPdfArrayFromAnnotationsList([Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->H:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 418
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    .line 417
    return-object v0
.end method

.method public static createHide([Ljava/lang/String;Z)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 3
    .param p0, "text"    # [Ljava/lang/String;
    .param p1, "hidden"    # Z

    .line 443
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>()V

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Hide:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->T:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->getArrayFromStringList([Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->H:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 444
    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    .line 443
    return-object v0
.end method

.method public static createJavaScript(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 3
    .param p0, "javaScript"    # Ljava/lang/String;

    .line 505
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>()V

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->JavaScript:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->JS:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v2, p0}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public static createLaunch(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 3
    .param p0, "fileSpec"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    .line 286
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>()V

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Launch:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    .line 287
    .local v0, "action":Lcom/itextpdf/kernel/pdf/action/PdfAction;
    if-eqz p0, :cond_0

    .line 288
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->F:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 290
    :cond_0
    return-object v0
.end method

.method public static createLaunch(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Z)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 3
    .param p0, "fileSpec"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .param p1, "newWindow"    # Z

    .line 276
    invoke-static {p0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->createLaunch(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->NewWindow:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfBoolean;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;-><init>(Z)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public static createMovie(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 3
    .param p0, "annotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "operation"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 389
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>()V

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Movie:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->T:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Operation:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 390
    invoke-virtual {v0, v1, p2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    .line 391
    .local v0, "action":Lcom/itextpdf/kernel/pdf/action/PdfAction;
    if-eqz p0, :cond_0

    .line 392
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Annotation:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 394
    :cond_0
    return-object v0
.end method

.method public static createNamed(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 3
    .param p0, "namedAction"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 455
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>()V

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Named:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public static createRendition(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Ljava/lang/String;Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 4
    .param p0, "file"    # Ljava/lang/String;
    .param p1, "fileSpec"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "screenAnnotation"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 493
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>()V

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Rendition:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OP:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    .line 494
    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AN:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p3}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/action/PdfRendition;

    invoke-direct {v2, p0, p1, p2}, Lcom/itextpdf/kernel/pdf/action/PdfRendition;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Ljava/lang/String;)V

    .line 495
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/action/PdfRendition;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    .line 493
    return-object v0
.end method

.method public static createResetForm([Ljava/lang/Object;I)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 3
    .param p0, "names"    # [Ljava/lang/Object;
    .param p1, "flags"    # I

    .line 545
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>()V

    .line 546
    .local v0, "action":Lcom/itextpdf/kernel/pdf/action/PdfAction;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ResetForm:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 547
    if-eqz p0, :cond_0

    .line 548
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Fields:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->buildArray([Ljava/lang/Object;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 550
    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Flags:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 551
    return-object v0
.end method

.method public static createSetOcgState(Ljava/util/List;)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/action/PdfActionOcgState;",
            ">;)",
            "Lcom/itextpdf/kernel/pdf/action/PdfAction;"
        }
    .end annotation

    .line 465
    .local p0, "states":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/action/PdfActionOcgState;>;"
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->createSetOcgState(Ljava/util/List;Z)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public static createSetOcgState(Ljava/util/List;Z)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 4
    .param p1, "preserveRb"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/action/PdfActionOcgState;",
            ">;Z)",
            "Lcom/itextpdf/kernel/pdf/action/PdfAction;"
        }
    .end annotation

    .line 477
    .local p0, "states":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/action/PdfActionOcgState;>;"
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 478
    .local v0, "stateArr":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/action/PdfActionOcgState;

    .line 479
    .local v2, "state":Lcom/itextpdf/kernel/pdf/action/PdfActionOcgState;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/action/PdfActionOcgState;->getObjectList()Ljava/util/List;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->addAll(Ljava/util/Collection;)V

    .end local v2    # "state":Lcom/itextpdf/kernel/pdf/action/PdfActionOcgState;
    goto :goto_0

    .line 480
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>()V

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->SetOCGState:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->State:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v1

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->PreserveRB:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v1

    return-object v1
.end method

.method public static createSound(Lcom/itextpdf/kernel/pdf/PdfStream;)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 3
    .param p0, "sound"    # Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 353
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>()V

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Sound:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Sound:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public static createSound(Lcom/itextpdf/kernel/pdf/PdfStream;FZZZ)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 5
    .param p0, "sound"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .param p1, "volume"    # F
    .param p2, "synchronous"    # Z
    .param p3, "repeat"    # Z
    .param p4, "mix"    # Z

    .line 371
    const/high16 v0, -0x40800000    # -1.0f

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-gtz v0, :cond_0

    .line 374
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>()V

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Sound:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Sound:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Volume:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v3, p1

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    .line 375
    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Synchronous:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p2}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Repeat:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 376
    invoke-static {p3}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Mix:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p4}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    .line 374
    return-object v0

    .line 372
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "volume"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static createSubmitForm(Ljava/lang/String;[Ljava/lang/Object;I)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 4
    .param p0, "file"    # Ljava/lang/String;
    .param p1, "names"    # [Ljava/lang/Object;
    .param p2, "flags"    # I

    .line 520
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>()V

    .line 521
    .local v0, "action":Lcom/itextpdf/kernel/pdf/action/PdfAction;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->SubmitForm:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 523
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 524
    .local v1, "urlFileSpec":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->F:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v3, p0}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 525
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->FS:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->URL:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 526
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->F:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 528
    if-eqz p1, :cond_0

    .line 529
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Fields:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->buildArray([Ljava/lang/Object;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 531
    :cond_0
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Flags:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v3, p2}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 532
    return-object v0
.end method

.method public static createThread(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 1
    .param p0, "fileSpec"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    .line 322
    const/4 v0, 0x0

    invoke-static {p0, v0, v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->createThread(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public static createThread(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 3
    .param p0, "fileSpec"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;
    .param p1, "destinationThread"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "bead"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 305
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>()V

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Launch:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p1}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->B:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, p2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    .line 306
    .local v0, "action":Lcom/itextpdf/kernel/pdf/action/PdfAction;
    if-eqz p0, :cond_0

    .line 307
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->F:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 309
    :cond_0
    return-object v0
.end method

.method public static createURI(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 1
    .param p0, "uri"    # Ljava/lang/String;

    .line 332
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->createURI(Ljava/lang/String;Z)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public static createURI(Ljava/lang/String;Z)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 3
    .param p0, "uri"    # Ljava/lang/String;
    .param p1, "isMap"    # Z

    .line 343
    new-instance v0, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>()V

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->URI:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->URI:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v2, p0}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->IsMap:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method private static getArrayFromStringList([Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 5
    .param p0, "strings"    # [Ljava/lang/String;

    .line 639
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 640
    .local v0, "arr":Lcom/itextpdf/kernel/pdf/PdfArray;
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p0, v2

    .line 641
    .local v3, "string":Ljava/lang/String;
    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v4, v3}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 640
    .end local v3    # "string":Ljava/lang/String;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 643
    :cond_0
    return-object v0
.end method

.method private static getPdfArrayFromAnnotationsList([Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 5
    .param p0, "wrappers"    # [Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 631
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 632
    .local v0, "arr":Lcom/itextpdf/kernel/pdf/PdfArray;
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p0, v2

    .line 633
    .local v3, "wrapper":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 632
    .end local v3    # "wrapper":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 635
    :cond_0
    return-object v0
.end method

.method public static setAdditionalAction(Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/action/PdfAction;)V
    .locals 5
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "action"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
            "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
            ">;",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            "Lcom/itextpdf/kernel/pdf/action/PdfAction;",
            ")V"
        }
    .end annotation

    .line 563
    .local p0, "wrapper":Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;, "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<Lcom/itextpdf/kernel/pdf/PdfDictionary;>;"
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AA:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 564
    .local v0, "obj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 565
    .local v1, "aaExists":Z
    :goto_0
    if-eqz v1, :cond_1

    .line 566
    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .local v2, "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    goto :goto_1

    .line 568
    .end local v2    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_1
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 570
    .restart local v2    # "dic":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :goto_1
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v2, p1, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 571
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 572
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->AA:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 573
    if-eqz v1, :cond_2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->isIndirect()Z

    move-result v3

    if-nez v3, :cond_3

    .line 574
    :cond_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 576
    :cond_3
    return-void
.end method

.method private static validateNotRemoteDestination(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V
    .locals 4
    .param p0, "destination"    # Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    .line 698
    instance-of v0, p0, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitRemoteGoToDestination;

    const-string v1, "When destination\'s not associated with a Remote or Embedded Go-To action, it shall specify page dictionary instead of page number. Otherwise destination might be considered invalid"

    const-class v2, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    if-eqz v0, :cond_0

    .line 699
    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    goto :goto_0

    .line 700
    :cond_0
    instance-of v0, p0, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    if-eqz v0, :cond_1

    .line 703
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 704
    .local v0, "firstObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isNumber()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 705
    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    invoke-interface {v2, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 708
    .end local v0    # "firstObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_1
    :goto_0
    return-void
.end method

.method private static validateRemoteDestination(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V
    .locals 6
    .param p0, "destination"    # Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    .line 665
    instance-of v0, p0, Lcom/itextpdf/kernel/pdf/navigation/PdfExplicitDestination;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 666
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 667
    .local v0, "firstObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v1

    if-nez v1, :cond_0

    .end local v0    # "firstObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    goto :goto_0

    .line 668
    .restart local v0    # "firstObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Explicit destinations shall specify page number in remote go-to actions instead of page dictionary"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 670
    .end local v0    # "firstObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_1
    instance-of v0, p0, Lcom/itextpdf/kernel/pdf/navigation/PdfStructureDestination;

    if-eqz v0, :cond_3

    .line 675
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 676
    .restart local v0    # "firstObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 677
    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 678
    .local v2, "structElemObj":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->ID:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v3

    .line 679
    .local v3, "id":Lcom/itextpdf/kernel/pdf/PdfString;
    if-eqz v3, :cond_2

    .line 682
    const-class v4, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 683
    const-string v5, "Structure destinations shall specify structure element ID in remote go-to actions. Structure element has been replaced with its ID in the structure destination"

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 684
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v4, v1, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;->set(ILcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 685
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfObject;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_1

    .line 680
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v4, "Structure destinations shall specify structure element ID in remote go-to actions. Structure element that has no ID is specified instead"

    invoke-direct {v1, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 670
    .end local v0    # "firstObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v2    # "structElemObj":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v3    # "id":Lcom/itextpdf/kernel/pdf/PdfString;
    :cond_3
    :goto_0
    nop

    .line 689
    :cond_4
    :goto_1
    return-void
.end method


# virtual methods
.method public flush()V
    .locals 0

    .line 619
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->flush()V

    .line 620
    return-void
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 627
    const/4 v0, 0x1

    return v0
.end method

.method public next(Lcom/itextpdf/kernel/pdf/action/PdfAction;)V
    .locals 3
    .param p1, "nextAction"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 584
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Next:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 585
    .local v0, "currentNextAction":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-nez v0, :cond_0

    .line 586
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Next:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    goto :goto_0

    .line 587
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 588
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 589
    .local v1, "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 590
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Next:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v2, v1}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 591
    .end local v1    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    goto :goto_0

    .line 592
    :cond_1
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 594
    :goto_0
    return-void
.end method

.method public put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 605
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 606
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 607
    return-object p0
.end method
