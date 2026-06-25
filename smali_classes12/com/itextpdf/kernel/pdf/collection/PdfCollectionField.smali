.class public Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfCollectionField.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# static fields
.field public static final CREATIONDATE:I = 0x6

.field public static final DATE:I = 0x1

.field public static final DESC:I = 0x4

.field public static final FILENAME:I = 0x3

.field public static final MODDATE:I = 0x5

.field public static final NUMBER:I = 0x2

.field public static final SIZE:I = 0x7

.field public static final TEXT:I


# instance fields
.field protected subType:I


# direct methods
.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 9
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 76
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 77
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfName;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "subType":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x6

    const/4 v4, 0x5

    const/4 v5, 0x4

    const/4 v6, 0x3

    const/4 v7, 0x2

    const/4 v8, 0x1

    sparse-switch v1, :sswitch_data_0

    :cond_0
    goto :goto_0

    :sswitch_0
    const-string v1, "CreationDate"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v4

    goto :goto_1

    :sswitch_1
    const-string v1, "Size"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v3

    goto :goto_1

    :sswitch_2
    const-string v1, "Desc"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v6

    goto :goto_1

    :sswitch_3
    const-string v1, "N"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v8

    goto :goto_1

    :sswitch_4
    const-string v1, "F"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v7

    goto :goto_1

    :sswitch_5
    const-string v1, "D"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_1

    :sswitch_6
    const-string v1, "ModDate"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v5

    goto :goto_1

    :goto_0
    const/4 v1, -0x1

    :goto_1
    packed-switch v1, :pswitch_data_0

    .line 101
    iput v2, p0, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->subType:I

    goto :goto_2

    .line 98
    :pswitch_0
    const/4 v1, 0x7

    iput v1, p0, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->subType:I

    .line 99
    goto :goto_2

    .line 95
    :pswitch_1
    iput v3, p0, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->subType:I

    .line 96
    goto :goto_2

    .line 92
    :pswitch_2
    iput v4, p0, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->subType:I

    .line 93
    goto :goto_2

    .line 89
    :pswitch_3
    iput v5, p0, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->subType:I

    .line 90
    goto :goto_2

    .line 86
    :pswitch_4
    iput v6, p0, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->subType:I

    .line 87
    goto :goto_2

    .line 83
    :pswitch_5
    iput v7, p0, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->subType:I

    .line 84
    goto :goto_2

    .line 80
    :pswitch_6
    iput v8, p0, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->subType:I

    .line 81
    nop

    .line 104
    :goto_2
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x53b4ae50 -> :sswitch_6
        0x44 -> :sswitch_5
        0x46 -> :sswitch_4
        0x4e -> :sswitch_3
        0x2072b1 -> :sswitch_2
        0x275421 -> :sswitch_1
        0x684c9f4d -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "subType"    # I

    .line 113
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 114
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 115
    iput p2, p0, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->subType:I

    .line 116
    packed-switch p2, :pswitch_data_0

    .line 118
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 119
    goto :goto_0

    .line 139
    :pswitch_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Size:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 136
    :pswitch_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->CreationDate:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 137
    goto :goto_0

    .line 133
    :pswitch_2
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ModDate:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 134
    goto :goto_0

    .line 130
    :pswitch_3
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Desc:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 131
    goto :goto_0

    .line 127
    :pswitch_4
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->F:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 128
    goto :goto_0

    .line 124
    :pswitch_5
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 125
    goto :goto_0

    .line 121
    :pswitch_6
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 122
    nop

    .line 142
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public getEditable()Lcom/itextpdf/kernel/pdf/PdfBoolean;
    .locals 2

    .line 202
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->E:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBoolean(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v0

    return-object v0
.end method

.method public getOrder()Lcom/itextpdf/kernel/pdf/PdfNumber;
    .locals 2

    .line 161
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->O:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    return-object v0
.end method

.method public getValue(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 3
    .param p1, "value"    # Ljava/lang/String;

    .line 212
    iget v0, p0, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->subType:I

    packed-switch v0, :pswitch_data_0

    .line 220
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string/jumbo v1, "{0} is not an acceptable value for the field {1}."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    .line 221
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v1

    filled-new-array {p1, v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/kernel/exceptions/PdfException;

    move-result-object v0

    throw v0

    .line 218
    :pswitch_0
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    return-object v0

    .line 216
    :pswitch_1
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDate;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfDate;->decode(Ljava/lang/String;)Ljava/util/Calendar;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDate;-><init>(Ljava/util/Calendar;)V

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDate;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0

    .line 214
    :pswitch_2
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getVisibility()Lcom/itextpdf/kernel/pdf/PdfBoolean;
    .locals 2

    .line 181
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsBoolean(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v0

    return-object v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 226
    const/4 v0, 0x0

    return v0
.end method

.method public setEditable(Z)Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;
    .locals 3
    .param p1, "editable"    # Z

    .line 191
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->E:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 192
    return-object p0
.end method

.method public setOrder(I)Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;
    .locals 3
    .param p1, "order"    # I

    .line 151
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->O:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 152
    return-object p0
.end method

.method public setVisibility(Z)Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;
    .locals 3
    .param p1, "visible"    # Z

    .line 171
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/collection/PdfCollectionField;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->V:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {p1}, Lcom/itextpdf/kernel/pdf/PdfBoolean;->valueOf(Z)Lcom/itextpdf/kernel/pdf/PdfBoolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 172
    return-object p0
.end method
