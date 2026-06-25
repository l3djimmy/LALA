.class public Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfUserProperty.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;
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
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 44
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 45
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;F)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # F

    .line 60
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 61
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->setName(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;

    .line 62
    invoke-virtual {p0, p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->setValue(F)Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # I

    .line 54
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 55
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->setName(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;

    .line 56
    invoke-virtual {p0, p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->setValue(I)Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 48
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 49
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->setName(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;

    .line 50
    invoke-virtual {p0, p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->setValue(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;

    .line 51
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .line 66
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 67
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->setName(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;

    .line 68
    invoke-virtual {p0, p2}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->setValue(Z)Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;

    .line 69
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 2

    .line 72
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfString;->toUnicodeString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValueAsBool()Ljava/lang/Boolean;
    .locals 2

    .line 128
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBool(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public getValueAsFloat()Ljava/lang/Float;
    .locals 3

    .line 123
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 124
    .local v0, "num":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    move-object v2, v1

    check-cast v2, Ljava/lang/Float;

    :goto_0
    return-object v1
.end method

.method public getValueAsText()Ljava/lang/String;
    .locals 2

    .line 118
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    .line 119
    .local v0, "str":Lcom/itextpdf/kernel/pdf/PdfString;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfString;->toUnicodeString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public getValueFormattedRepresentation()Ljava/lang/String;
    .locals 2

    .line 133
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->F:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    .line 134
    .local v0, "f":Lcom/itextpdf/kernel/pdf/PdfString;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfString;->toUnicodeString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public getValueType()Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;
    .locals 2

    .line 81
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 82
    .local v0, "valObj":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-nez v0, :cond_0

    .line 83
    sget-object v1, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;->UNKNOWN:Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    return-object v1

    .line 85
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfObject;->getType()B

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 93
    sget-object v1, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;->UNKNOWN:Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    return-object v1

    .line 91
    :sswitch_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;->TEXT:Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    return-object v1

    .line 89
    :sswitch_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;->NUMBER:Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    return-object v1

    .line 87
    :sswitch_2
    sget-object v1, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;->BOOLEAN:Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty$ValueType;

    return-object v1

    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_2
        0x8 -> :sswitch_1
        0xa -> :sswitch_0
    .end sparse-switch
.end method

.method public isHidden()Ljava/lang/Boolean;
    .locals 2

    .line 143
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->H:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBool(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 153
    const/4 v0, 0x0

    return v0
.end method

.method public setHidden(Z)Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;
    .locals 3
    .param p1, "isHidden"    # Z

    .line 147
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->H:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfBoolean;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;-><init>(Z)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 148
    return-object p0
.end method

.method public setName(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .line 76
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v3, "UnicodeBig"

    invoke-direct {v2, p1, v3}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 77
    return-object p0
.end method

.method public setValue(F)Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;
    .locals 5
    .param p1, "value"    # F

    .line 108
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v3, p1

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 109
    return-object p0
.end method

.method public setValue(I)Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;
    .locals 3
    .param p1, "value"    # I

    .line 103
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 104
    return-object p0
.end method

.method public setValue(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;
    .locals 4
    .param p1, "value"    # Ljava/lang/String;

    .line 98
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v3, "UnicodeBig"

    invoke-direct {v2, p1, v3}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 99
    return-object p0
.end method

.method public setValue(Z)Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;
    .locals 3
    .param p1, "value"    # Z

    .line 113
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfBoolean;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;-><init>(Z)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 114
    return-object p0
.end method

.method public setValueFormattedRepresentation(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;
    .locals 4
    .param p1, "formattedRepresentation"    # Ljava/lang/String;

    .line 138
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfUserProperty;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->F:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v3, "UnicodeBig"

    invoke-direct {v2, p1, v3}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 139
    return-object p0
.end method
