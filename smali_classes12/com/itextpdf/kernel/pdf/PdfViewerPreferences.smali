.class public Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfViewerPreferences.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;
    }
.end annotation

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

    .line 115
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 116
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 119
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 120
    return-void
.end method

.method private setPageBoundary(Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 3
    .param p1, "viewerPreferenceType"    # Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;
    .param p2, "pageBoundary"    # Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 397
    const/4 v0, 0x0

    .line 398
    .local v0, "type":Lcom/itextpdf/kernel/pdf/PdfName;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$1;->$SwitchMap$com$itextpdf$kernel$pdf$PdfViewerPreferences$PdfViewerPreferencesConstants:[I

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 409
    :pswitch_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PrintClip:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 410
    goto :goto_0

    .line 406
    :pswitch_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PrintArea:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 407
    goto :goto_0

    .line 403
    :pswitch_2
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->ViewClip:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 404
    goto :goto_0

    .line 400
    :pswitch_3
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->ViewArea:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 401
    nop

    .line 413
    :goto_0
    if-eqz v0, :cond_0

    .line 414
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$1;->$SwitchMap$com$itextpdf$kernel$pdf$PdfViewerPreferences$PdfViewerPreferencesConstants:[I

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_1

    goto :goto_1

    .line 428
    :pswitch_4
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ArtBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    .line 429
    goto :goto_1

    .line 425
    :pswitch_5
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->TrimBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    .line 426
    goto :goto_1

    .line 422
    :pswitch_6
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BleedBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    .line 423
    goto :goto_1

    .line 419
    :pswitch_7
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CropBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    .line 420
    goto :goto_1

    .line 416
    :pswitch_8
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->MediaBox:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    .line 417
    nop

    .line 434
    :cond_0
    :goto_1
    return-object p0

    :pswitch_data_0
    .packed-switch 0xc
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x10
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method


# virtual methods
.method public getEnforce()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 382
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Enforce:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 393
    const/4 v0, 0x0

    return v0
.end method

.method public put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 386
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 387
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 388
    return-object p0
.end method

.method public setCenterWindow(Z)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 2
    .param p1, "centerWindow"    # Z

    .line 169
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->CenterWindow:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    move-result-object v0

    return-object v0
.end method

.method public setDirection(Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 2
    .param p1, "direction"    # Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 215
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$1;->$SwitchMap$com$itextpdf$kernel$pdf$PdfViewerPreferences$PdfViewerPreferencesConstants:[I

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 220
    :pswitch_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Direction:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->R2L:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    .line 221
    goto :goto_0

    .line 217
    :pswitch_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Direction:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->L2R:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    .line 218
    nop

    .line 224
    :goto_0
    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setDisplayDocTitle(Z)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 2
    .param p1, "displayDocTitle"    # Z

    .line 179
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->DisplayDocTitle:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    move-result-object v0

    return-object v0
.end method

.method public setDuplex(Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 2
    .param p1, "duplex"    # Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 304
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$1;->$SwitchMap$com$itextpdf$kernel$pdf$PdfViewerPreferences$PdfViewerPreferencesConstants:[I

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 312
    :pswitch_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Duplex:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->DuplexFlipLongEdge:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    .line 313
    goto :goto_0

    .line 309
    :pswitch_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Duplex:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->DuplexFlipShortEdge:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    .line 310
    goto :goto_0

    .line 306
    :pswitch_2
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Duplex:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Simplex:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    .line 307
    nop

    .line 316
    :goto_0
    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setEnforce(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 5
    .param p1, "enforce"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 358
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 359
    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsName(I)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    .line 360
    .local v1, "curEnforce":Lcom/itextpdf/kernel/pdf/PdfName;
    if-eqz v1, :cond_2

    .line 362
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->PrintScaling:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 365
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->PrintScaling:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    .line 366
    .local v2, "curPrintScaling":Lcom/itextpdf/kernel/pdf/PdfName;
    if-eqz v2, :cond_0

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->AppDefault:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_1

    .line 367
    :cond_0
    new-instance v3, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v4, "/PrintScaling shall may appear in the Enforce array only if the corresponding entry in the viewer preferences dictionary specifies a valid value other than AppDefault"

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 358
    .end local v1    # "curEnforce":Lcom/itextpdf/kernel/pdf/PdfName;
    .end local v2    # "curPrintScaling":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 361
    .restart local v1    # "curEnforce":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_2
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Enforce array shall contain PdfName entries"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 371
    .end local v0    # "i":I
    .end local v1    # "curEnforce":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_3
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Enforce:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    move-result-object v0

    return-object v0
.end method

.method public setFitWindow(Z)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 2
    .param p1, "fitWindow"    # Z

    .line 159
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->FitWindow:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    move-result-object v0

    return-object v0
.end method

.method public setHideMenubar(Z)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 2
    .param p1, "hideMenubar"    # Z

    .line 139
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->HideMenubar:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    move-result-object v0

    return-object v0
.end method

.method public setHideToolbar(Z)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 2
    .param p1, "hideToolbar"    # Z

    .line 129
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->HideToolbar:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    move-result-object v0

    return-object v0
.end method

.method public setHideWindowUI(Z)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 2
    .param p1, "hideWindowUI"    # Z

    .line 149
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->HideWindowUI:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    move-result-object v0

    return-object v0
.end method

.method public setNonFullScreenPageMode(Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 2
    .param p1, "nonFullScreenPageMode"    # Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 190
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$1;->$SwitchMap$com$itextpdf$kernel$pdf$PdfViewerPreferences$PdfViewerPreferencesConstants:[I

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 201
    :pswitch_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->NonFullScreenPageMode:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->UseOC:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    .line 202
    goto :goto_0

    .line 198
    :pswitch_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->NonFullScreenPageMode:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->UseThumbs:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    .line 199
    goto :goto_0

    .line 195
    :pswitch_2
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->NonFullScreenPageMode:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->UseOutlines:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    .line 196
    goto :goto_0

    .line 192
    :pswitch_3
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->NonFullScreenPageMode:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->UseNone:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    .line 193
    nop

    .line 205
    :goto_0
    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setNumCopies(I)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 2
    .param p1, "numCopies"    # I

    .line 346
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->NumCopies:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    move-result-object v0

    return-object v0
.end method

.method public setPickTrayByPDFSize(Z)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 2
    .param p1, "pickTrayByPdfSize"    # Z

    .line 326
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PickTrayByPDFSize:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    move-result-object v0

    return-object v0
.end method

.method public setPrintArea(Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 1
    .param p1, "pageBoundary"    # Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 260
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->PRINT_AREA:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    invoke-direct {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->setPageBoundary(Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    move-result-object v0

    return-object v0
.end method

.method public setPrintClip(Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 1
    .param p1, "pageBoundary"    # Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 272
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->PRINT_CLIP:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    invoke-direct {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->setPageBoundary(Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    move-result-object v0

    return-object v0
.end method

.method public setPrintPageRange([I)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 2
    .param p1, "printPageRange"    # [I

    .line 336
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PrintPageRange:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([I)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    move-result-object v0

    return-object v0
.end method

.method public setPrintScaling(Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 2
    .param p1, "printScaling"    # Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 283
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$1;->$SwitchMap$com$itextpdf$kernel$pdf$PdfViewerPreferences$PdfViewerPreferencesConstants:[I

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 288
    :pswitch_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PrintScaling:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AppDefault:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    .line 289
    goto :goto_0

    .line 285
    :pswitch_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->PrintScaling:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->None:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    .line 286
    nop

    .line 293
    :goto_0
    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setViewArea(Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 1
    .param p1, "pageBoundary"    # Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 236
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->VIEW_AREA:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    invoke-direct {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->setPageBoundary(Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    move-result-object v0

    return-object v0
.end method

.method public setViewClip(Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;
    .locals 1
    .param p1, "pageBoundary"    # Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    .line 248
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;->VIEW_CLIP:Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;

    invoke-direct {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;->setPageBoundary(Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;Lcom/itextpdf/kernel/pdf/PdfViewerPreferences$PdfViewerPreferencesConstants;)Lcom/itextpdf/kernel/pdf/PdfViewerPreferences;

    move-result-object v0

    return-object v0
.end method
