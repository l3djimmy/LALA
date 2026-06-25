.class public Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
.super Ljava/lang/Object;
.source "CanvasTag.java"


# instance fields
.field protected properties:Lcom/itextpdf/kernel/pdf/PdfDictionary;

.field protected role:Lcom/itextpdf/kernel/pdf/PdfName;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 0
    .param p1, "role"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->role:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 61
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfName;I)V
    .locals 2
    .param p1, "role"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "mcid"    # I

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->role:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 72
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->MCID:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v1, p2}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->addProperty(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;

    .line 73
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;)V
    .locals 2
    .param p1, "mcr"    # Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;

    .line 82
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getRole()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/tagging/PdfMcr;->getMcid()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;-><init>(Lcom/itextpdf/kernel/pdf/PdfName;I)V

    .line 83
    return-void
.end method

.method private ensurePropertiesInit()V
    .locals 1

    .line 203
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->properties:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-nez v0, :cond_0

    .line 204
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->properties:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 206
    :cond_0
    return-void
.end method

.method private getPropertyAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 191
    const/4 v0, 0x0

    .line 192
    .local v0, "text":Lcom/itextpdf/kernel/pdf/PdfString;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->properties:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-eqz v1, :cond_0

    .line 193
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->properties:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    .line 195
    :cond_0
    const/4 v1, 0x0

    .line 196
    .local v1, "result":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 197
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfString;->toUnicodeString()Ljava/lang/String;

    move-result-object v1

    .line 199
    :cond_1
    return-object v1
.end method


# virtual methods
.method public addProperty(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    .locals 1
    .param p1, "name"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 138
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->ensurePropertiesInit()V

    .line 139
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->properties:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 140
    return-object p0
.end method

.method public getActualText()Ljava/lang/String;
    .locals 1

    .line 183
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->ActualText:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->getPropertyAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExpansionText()Ljava/lang/String;
    .locals 1

    .line 187
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->E:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->getPropertyAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMcid()I
    .locals 3

    .line 101
    const/4 v0, -0x1

    .line 102
    .local v0, "mcid":I
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->properties:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-eqz v1, :cond_0

    .line 103
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->properties:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->MCID:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsInt(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 105
    :cond_0
    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 108
    return v0

    .line 106
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "CanvasTag has no MCID"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getProperties()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 1

    .line 175
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->properties:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    return-object v0
.end method

.method public getProperty(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1
    .param p1, "name"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 163
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->properties:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-nez v0, :cond_0

    .line 164
    const/4 v0, 0x0

    return-object v0

    .line 166
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->properties:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    return-object v0
.end method

.method public getRole()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->role:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method

.method public hasMcid()Z
    .locals 2

    .line 116
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->properties:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->properties:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->MCID:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public removeProperty(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    .locals 1
    .param p1, "name"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 150
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->properties:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->properties:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 153
    :cond_0
    return-object p0
.end method

.method public setProperties(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    .locals 0
    .param p1, "properties"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 126
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->properties:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 127
    return-object p0
.end method
