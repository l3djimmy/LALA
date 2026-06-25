.class public Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfAnnotationAdditionalActions.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# static fields
.field private static final Events:[Lcom/itextpdf/kernel/pdf/PdfName;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 40
    const/16 v0, 0xa

    new-array v0, v0, [Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v1, 0x0

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->E:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->X:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->U:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Fo:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Bl:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->PO:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->PC:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->PV:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->PI:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v2, v0, v1

    sput-object v0, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->Events:[Lcom/itextpdf/kernel/pdf/PdfName;

    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 45
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 46
    return-void
.end method


# virtual methods
.method public getAllKnownActions()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/action/PdfAction;",
            ">;"
        }
    .end annotation

    .line 235
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 236
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/action/PdfAction;>;"
    sget-object v1, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->Events:[Lcom/itextpdf/kernel/pdf/PdfName;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    .line 237
    .local v4, "event":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {p0, v4}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->getPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v5

    .line 238
    .local v5, "action":Lcom/itextpdf/kernel/pdf/action/PdfAction;
    if-eqz v5, :cond_0

    .line 239
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 236
    .end local v4    # "event":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v5    # "action":Lcom/itextpdf/kernel/pdf/action/PdfAction;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 242
    :cond_1
    return-object v0
.end method

.method public getOnEnter()Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 1

    .line 54
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->E:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->getPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public getOnExit()Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 1

    .line 72
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->X:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->getPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public getOnFocus()Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 1

    .line 126
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Fo:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->getPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public getOnLostFocus()Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 1

    .line 144
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Bl:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->getPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public getOnMouseDown()Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 1

    .line 90
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->getPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public getOnMouseUp()Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 1

    .line 108
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->U:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->getPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public getOnPageClosed()Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 1

    .line 180
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PC:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->getPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public getOnPageLostView()Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 1

    .line 216
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PI:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->getPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public getOnPageOpened()Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 1

    .line 162
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PO:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->getPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public getOnPageVisible()Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 1

    .line 198
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PV:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->getPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-result-object v0

    return-object v0
.end method

.method public getPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/action/PdfAction;
    .locals 3
    .param p1, "eventName"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 253
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 254
    .local v0, "action":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 257
    :cond_0
    new-instance v1, Lcom/itextpdf/kernel/pdf/action/PdfAction;

    move-object v2, v0

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    return-object v1

    .line 255
    :cond_1
    :goto_0
    const/4 v1, 0x0

    return-object v1
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 280
    const/4 v0, 0x1

    return v0
.end method

.method public setOnEnter(Lcom/itextpdf/kernel/pdf/action/PdfAction;)V
    .locals 1
    .param p1, "action"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 63
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->E:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->setPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/action/PdfAction;)V

    .line 64
    return-void
.end method

.method public setOnExit(Lcom/itextpdf/kernel/pdf/action/PdfAction;)V
    .locals 1
    .param p1, "action"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 81
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->X:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->setPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/action/PdfAction;)V

    .line 82
    return-void
.end method

.method public setOnFocus(Lcom/itextpdf/kernel/pdf/action/PdfAction;)V
    .locals 1
    .param p1, "action"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 135
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Fo:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->setPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/action/PdfAction;)V

    .line 136
    return-void
.end method

.method public setOnLostFocus(Lcom/itextpdf/kernel/pdf/action/PdfAction;)V
    .locals 1
    .param p1, "action"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 153
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Bl:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->setPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/action/PdfAction;)V

    .line 154
    return-void
.end method

.method public setOnMouseDown(Lcom/itextpdf/kernel/pdf/action/PdfAction;)V
    .locals 1
    .param p1, "action"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 99
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->setPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/action/PdfAction;)V

    .line 100
    return-void
.end method

.method public setOnMouseUp(Lcom/itextpdf/kernel/pdf/action/PdfAction;)V
    .locals 1
    .param p1, "action"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 117
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->U:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->setPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/action/PdfAction;)V

    .line 118
    return-void
.end method

.method public setOnPageClosed(Lcom/itextpdf/kernel/pdf/action/PdfAction;)V
    .locals 1
    .param p1, "action"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 189
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PC:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->setPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/action/PdfAction;)V

    .line 190
    return-void
.end method

.method public setOnPageLostView(Lcom/itextpdf/kernel/pdf/action/PdfAction;)V
    .locals 1
    .param p1, "action"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 225
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PI:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->setPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/action/PdfAction;)V

    .line 226
    return-void
.end method

.method public setOnPageOpened(Lcom/itextpdf/kernel/pdf/action/PdfAction;)V
    .locals 1
    .param p1, "action"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 171
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PO:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->setPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/action/PdfAction;)V

    .line 172
    return-void
.end method

.method public setOnPageVisible(Lcom/itextpdf/kernel/pdf/action/PdfAction;)V
    .locals 1
    .param p1, "action"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 207
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PV:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->setPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/action/PdfAction;)V

    .line 208
    return-void
.end method

.method public setPdfActionForEvent(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/action/PdfAction;)V
    .locals 2
    .param p1, "event"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "action"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 267
    if-nez p2, :cond_0

    .line 268
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 270
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 272
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/action/PdfAnnotationAdditionalActions;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 273
    return-void
.end method
