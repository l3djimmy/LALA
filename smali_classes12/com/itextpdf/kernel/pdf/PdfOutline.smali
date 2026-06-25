.class public Lcom/itextpdf/kernel/pdf/PdfOutline;
.super Ljava/lang/Object;
.source "PdfOutline.java"


# static fields
.field public static FLAG_BOLD:I

.field public static FLAG_ITALIC:I


# instance fields
.field private children:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfOutline;",
            ">;"
        }
    .end annotation
.end field

.field private content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

.field private destination:Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

.field private parent:Lcom/itextpdf/kernel/pdf/PdfOutline;

.field private pdfDoc:Lcom/itextpdf/kernel/pdf/PdfDocument;

.field private title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 42
    const/4 v0, 0x1

    sput v0, Lcom/itextpdf/kernel/pdf/PdfOutline;->FLAG_ITALIC:I

    .line 46
    const/4 v0, 0x2

    sput v0, Lcom/itextpdf/kernel/pdf/PdfOutline;->FLAG_BOLD:I

    return-void
.end method

.method constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 3
    .param p1, "doc"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->children:Ljava/util/List;

    .line 90
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 91
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Outlines:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 92
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->pdfDoc:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 93
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 94
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->addRootOutline(Lcom/itextpdf/kernel/pdf/PdfOutline;)V

    .line 95
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "content"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p3, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->children:Ljava/util/List;

    .line 63
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->title:Ljava/lang/String;

    .line 64
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 65
    iput-object p3, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->pdfDoc:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 66
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfOutline;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "content"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p3, "parent"    # Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->children:Ljava/util/List;

    .line 77
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->title:Ljava/lang/String;

    .line 78
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 79
    iput-object p3, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->parent:Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 80
    iget-object v0, p3, Lcom/itextpdf/kernel/pdf/PdfOutline;->pdfDoc:Lcom/itextpdf/kernel/pdf/PdfDocument;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->pdfDoc:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 81
    iget-object v0, p3, Lcom/itextpdf/kernel/pdf/PdfOutline;->pdfDoc:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {p2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 82
    return-void
.end method

.method private getOutlineRoot()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 378
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->pdfDoc:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->hasOutlines()Z

    move-result v0

    if-nez v0, :cond_0

    .line 379
    const/4 v0, 0x0

    return-object v0

    .line 381
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->pdfDoc:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Outlines:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method private isOutlineRoot()Z
    .locals 2

    .line 391
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getOutlineRoot()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 392
    .local v0, "outlineRoot":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-ne v0, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method


# virtual methods
.method public addAction(Lcom/itextpdf/kernel/pdf/action/PdfAction;)V
    .locals 4
    .param p1, "action"    # Lcom/itextpdf/kernel/pdf/action/PdfAction;

    .line 213
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    .line 214
    .local v0, "actionType":Lcom/itextpdf/kernel/pdf/PdfName;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->GoTo:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 215
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 216
    .local v1, "destObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v1, :cond_0

    .line 217
    invoke-static {v1}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->makeDestination(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/PdfOutline;->setDestination(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V

    .line 221
    .end local v1    # "destObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->A:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/action/PdfAction;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 222
    return-void
.end method

.method public addDestination(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V
    .locals 3
    .param p1, "destination"    # Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    .line 203
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfOutline;->setDestination(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V

    .line 204
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Dest:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 205
    return-void
.end method

.method public addOutline(Lcom/itextpdf/kernel/pdf/PdfOutline;)Lcom/itextpdf/kernel/pdf/PdfOutline;
    .locals 4
    .param p1, "outline"    # Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 311
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getTitle()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfOutline;->addOutline(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfOutline;

    move-result-object v0

    .line 312
    .local v0, "newOutline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getDestination()Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfOutline;->addDestination(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V

    .line 314
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getAllChildren()Ljava/util/List;

    move-result-object v1

    .line 315
    .local v1, "children":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 316
    .local v3, "child":Lcom/itextpdf/kernel/pdf/PdfOutline;
    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfOutline;->addOutline(Lcom/itextpdf/kernel/pdf/PdfOutline;)Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 317
    .end local v3    # "child":Lcom/itextpdf/kernel/pdf/PdfOutline;
    goto :goto_0

    .line 319
    :cond_0
    return-object v0
.end method

.method public addOutline(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfOutline;
    .locals 1
    .param p1, "title"    # Ljava/lang/String;

    .line 300
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/PdfOutline;->addOutline(Ljava/lang/String;I)Lcom/itextpdf/kernel/pdf/PdfOutline;

    move-result-object v0

    return-object v0
.end method

.method public addOutline(Ljava/lang/String;I)Lcom/itextpdf/kernel/pdf/PdfOutline;
    .locals 7
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "position"    # I

    .line 259
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 260
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->children:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p2

    .line 261
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 262
    .local v0, "dictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfOutline;

    invoke-direct {v1, p1, v0, p0}, Lcom/itextpdf/kernel/pdf/PdfOutline;-><init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfOutline;)V

    .line 263
    .local v1, "outline":Lcom/itextpdf/kernel/pdf/PdfOutline;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Title:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v4, "UnicodeBig"

    invoke-direct {v3, p1, v4}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 264
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Parent:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 265
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->children:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_2

    .line 266
    if-eqz p2, :cond_1

    .line 267
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->children:Ljava/util/List;

    add-int/lit8 v3, p2, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfOutline;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getContent()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 268
    .local v2, "prevContent":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Prev:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v3, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 269
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Next:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 271
    .end local v2    # "prevContent":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_1
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->children:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eq p2, v2, :cond_2

    .line 272
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->children:Ljava/util/List;

    invoke-interface {v2, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfOutline;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfOutline;->getContent()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 273
    .local v2, "nextContent":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Next:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v3, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 274
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Prev:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 278
    .end local v2    # "nextContent":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_2
    if-nez p2, :cond_3

    .line 279
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->First:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 280
    :cond_3
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->children:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ne p2, v2, :cond_4

    .line 281
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Last:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 283
    :cond_4
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Count:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v2

    .line 284
    .local v2, "count":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v2, :cond_5

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->getValue()D

    move-result-wide v3

    const-wide/high16 v5, -0x4010000000000000L    # -1.0

    cmpl-double v3, v3, v5

    if-eqz v3, :cond_6

    .line 285
    :cond_5
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Count:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfNumber;

    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->children:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 287
    :cond_6
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->children:Ljava/util/List;

    invoke-interface {v3, p2, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 289
    return-object v1
.end method

.method clear()V
    .locals 1

    .line 360
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->children:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 361
    return-void
.end method

.method public getAllChildren()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfOutline;",
            ">;"
        }
    .end annotation

    .line 176
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->children:Ljava/util/List;

    return-object v0
.end method

.method public getColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 3

    .line 132
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->C:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 133
    .local v0, "colorArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_0

    .line 134
    const/4 v1, 0x0

    return-object v1

    .line 136
    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceRGB:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->makeColorSpace(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    move-result-object v1

    .line 137
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->toFloatArray()[F

    move-result-object v2

    .line 136
    invoke-static {v1, v2}, Lcom/itextpdf/kernel/colors/Color;->makeColor(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;[F)Lcom/itextpdf/kernel/colors/Color;

    move-result-object v1

    return-object v1
.end method

.method public getContent()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 1

    .line 167
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    return-object v0
.end method

.method public getDestination()Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;
    .locals 1

    .line 194
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->destination:Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    return-object v0
.end method

.method public getParent()Lcom/itextpdf/kernel/pdf/PdfOutline;
    .locals 1

    .line 185
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->parent:Lcom/itextpdf/kernel/pdf/PdfOutline;

    return-object v0
.end method

.method public getStyle()Ljava/lang/Integer;
    .locals 2

    .line 158
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->F:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsInt(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->title:Ljava/lang/String;

    return-object v0
.end method

.method public isOpen()Z
    .locals 2

    .line 245
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Count:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsInt(Lcom/itextpdf/kernel/pdf/PdfName;)Ljava/lang/Integer;

    move-result-object v0

    .line 246
    .local v0, "count":Ljava/lang/Integer;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ltz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1
.end method

.method public removeOutline()V
    .locals 6

    .line 326
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->pdfDoc:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->hasOutlines()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/PdfOutline;->isOutlineRoot()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 330
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->parent:Lcom/itextpdf/kernel/pdf/PdfOutline;

    .line 331
    .local v0, "parent":Lcom/itextpdf/kernel/pdf/PdfOutline;
    iget-object v1, v0, Lcom/itextpdf/kernel/pdf/PdfOutline;->children:Ljava/util/List;

    .line 332
    .local v1, "children":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    invoke-interface {v1, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 333
    iget-object v2, v0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 334
    .local v2, "parentContent":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_4

    .line 335
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->First:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v4, 0x0

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfOutline;

    iget-object v4, v4, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 336
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Last:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfOutline;

    iget-object v4, v4, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 342
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Next:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v3

    .line 343
    .local v3, "next":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Prev:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v4

    .line 344
    .local v4, "prev":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v4, :cond_2

    .line 345
    if-eqz v3, :cond_1

    .line 346
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Next:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v5, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 347
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Prev:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v5, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 349
    :cond_1
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Next:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 351
    :cond_2
    if-eqz v3, :cond_3

    .line 352
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->Prev:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 354
    :cond_3
    :goto_0
    return-void

    .line 338
    .end local v3    # "next":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v4    # "prev":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_4
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfOutline;->removeOutline()V

    .line 339
    return-void

    .line 327
    .end local v0    # "parent":Lcom/itextpdf/kernel/pdf/PdfOutline;
    .end local v1    # "children":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfOutline;>;"
    .end local v2    # "parentContent":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->pdfDoc:Lcom/itextpdf/kernel/pdf/PdfDocument;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getCatalog()Lcom/itextpdf/kernel/pdf/PdfCatalog;

    move-result-object v0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Outlines:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfCatalog;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfCatalog;

    .line 328
    return-void
.end method

.method public setColor(Lcom/itextpdf/kernel/colors/Color;)V
    .locals 4
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;

    .line 123
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->C:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/colors/Color;->getColorValue()[F

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 124
    return-void
.end method

.method setDestination(Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;)V
    .locals 0
    .param p1, "destination"    # Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    .line 369
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->destination:Lcom/itextpdf/kernel/pdf/navigation/PdfDestination;

    .line 370
    return-void
.end method

.method public setOpen(Z)V
    .locals 4
    .param p1, "open"    # Z

    .line 231
    if-nez p1, :cond_0

    .line 232
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Count:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/4 v3, -0x1

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 233
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->children:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 236
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 233
    if-lez v0, :cond_1

    .line 234
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Count:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->children:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 236
    :cond_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Count:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 237
    :goto_0
    return-void
.end method

.method public setStyle(I)V
    .locals 3
    .param p1, "style"    # I

    .line 147
    sget v0, Lcom/itextpdf/kernel/pdf/PdfOutline;->FLAG_BOLD:I

    if-eq p1, v0, :cond_0

    sget v0, Lcom/itextpdf/kernel/pdf/PdfOutline;->FLAG_ITALIC:I

    if-ne p1, v0, :cond_1

    .line 148
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->F:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v2, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 150
    :cond_1
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 4
    .param p1, "title"    # Ljava/lang/String;

    .line 113
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->title:Ljava/lang/String;

    .line 114
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfOutline;->content:Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Title:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v3, "UnicodeBig"

    invoke-direct {v2, p1, v3}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 115
    return-void
.end method
