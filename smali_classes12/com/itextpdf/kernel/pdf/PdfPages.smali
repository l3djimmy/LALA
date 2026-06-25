.class Lcom/itextpdf/kernel/pdf/PdfPages;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfPages.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private count:Lcom/itextpdf/kernel/pdf/PdfNumber;

.field private from:I

.field private final kids:Lcom/itextpdf/kernel/pdf/PdfArray;

.field private final parent:Lcom/itextpdf/kernel/pdf/PdfPages;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 25
    return-void
.end method

.method public constructor <init>(IILcom/itextpdf/kernel/pdf/PdfDictionary;Lcom/itextpdf/kernel/pdf/PdfPages;)V
    .locals 2
    .param p1, "from"    # I
    .param p2, "maxCount"    # I
    .param p3, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .param p4, "parent"    # Lcom/itextpdf/kernel/pdf/PdfPages;

    .line 55
    invoke-direct {p0, p3}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 56
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->setForbidRelease()V

    .line 57
    iput p1, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->from:I

    .line 58
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Count:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p3, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->count:Lcom/itextpdf/kernel/pdf/PdfNumber;

    .line 59
    iput-object p4, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->parent:Lcom/itextpdf/kernel/pdf/PdfPages;

    .line 60
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->count:Lcom/itextpdf/kernel/pdf/PdfNumber;

    if-nez v0, :cond_0

    .line 61
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->count:Lcom/itextpdf/kernel/pdf/PdfNumber;

    .line 62
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Count:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->count:Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {p3, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->count:Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v0

    if-ge p2, v0, :cond_1

    .line 64
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->count:Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->setValue(I)V

    .line 66
    :cond_1
    :goto_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Kids:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p3, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->kids:Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 67
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Pages:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p3, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 68
    return-void
.end method

.method public constructor <init>(ILcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 1
    .param p1, "from"    # I
    .param p2, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/PdfPages;-><init>(ILcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfPages;)V

    .line 52
    return-void
.end method

.method public constructor <init>(ILcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/pdf/PdfPages;)V
    .locals 3
    .param p1, "from"    # I
    .param p2, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p3, "parent"    # Lcom/itextpdf/kernel/pdf/PdfPages;

    .line 33
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 34
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getWriter()Lcom/itextpdf/kernel/pdf/PdfWriter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 35
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->makeIndirect(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 37
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->setForbidRelease()V

    .line 38
    iput p1, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->from:I

    .line 39
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->count:Lcom/itextpdf/kernel/pdf/PdfNumber;

    .line 40
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->kids:Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 41
    iput-object p3, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->parent:Lcom/itextpdf/kernel/pdf/PdfPages;

    .line 42
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Type:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Pages:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 43
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Kids:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->kids:Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 44
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Count:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->count:Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 45
    if-eqz p3, :cond_1

    .line 46
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Parent:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->parent:Lcom/itextpdf/kernel/pdf/PdfPages;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfPages;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 48
    :cond_1
    return-void
.end method


# virtual methods
.method public addPage(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 2
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 71
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->kids:Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 72
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->incrementCount()V

    .line 73
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Parent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 74
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 75
    return-void
.end method

.method public addPage(ILcom/itextpdf/kernel/pdf/PdfPage;)Z
    .locals 3
    .param p1, "index"    # I
    .param p2, "pdfPage"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 78
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->from:I

    if-lt p1, v0, :cond_1

    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->from:I

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getCount()I

    move-result v1

    add-int/2addr v0, v1

    if-le p1, v0, :cond_0

    goto :goto_0

    .line 80
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->kids:Lcom/itextpdf/kernel/pdf/PdfArray;

    iget v1, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->from:I

    sub-int v1, p1, v1

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(ILcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 81
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Parent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 82
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfPage;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 83
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->incrementCount()V

    .line 84
    const/4 v0, 0x1

    return v0

    .line 79
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public addPages(Lcom/itextpdf/kernel/pdf/PdfPages;)V
    .locals 3
    .param p1, "pdfPages"    # Lcom/itextpdf/kernel/pdf/PdfPages;

    .line 96
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->kids:Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPages;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 97
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->count:Lcom/itextpdf/kernel/pdf/PdfNumber;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->count:Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPages;->getCount()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;->setValue(I)V

    .line 98
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPages;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Parent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 99
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPages;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 100
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 101
    return-void
.end method

.method public compareTo(I)I
    .locals 2
    .param p1, "index"    # I

    .line 149
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->from:I

    if-ge p1, v0, :cond_0

    .line 150
    const/4 v0, 0x1

    return v0

    .line 151
    :cond_0
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->from:I

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getCount()I

    move-result v1

    add-int/2addr v0, v1

    if-lt p1, v0, :cond_1

    .line 152
    const/4 v0, -0x1

    return v0

    .line 153
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public correctFrom(I)V
    .locals 1
    .param p1, "correction"    # I

    .line 123
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->from:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->from:I

    .line 124
    return-void
.end method

.method public decrementCount()V
    .locals 1

    .line 142
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->count:Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->decrement()V

    .line 143
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 144
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->parent:Lcom/itextpdf/kernel/pdf/PdfPages;

    if-eqz v0, :cond_0

    .line 145
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->parent:Lcom/itextpdf/kernel/pdf/PdfPages;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPages;->decrementCount()V

    .line 146
    :cond_0
    return-void
.end method

.method public getCount()I
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->count:Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v0

    return v0
.end method

.method public getFrom()I
    .locals 1

    .line 115
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->from:I

    return v0
.end method

.method public getKids()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 127
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Kids:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getParent()Lcom/itextpdf/kernel/pdf/PdfPages;
    .locals 1

    .line 131
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->parent:Lcom/itextpdf/kernel/pdf/PdfPages;

    return-object v0
.end method

.method public incrementCount()V
    .locals 1

    .line 135
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->count:Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->increment()V

    .line 136
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 137
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->parent:Lcom/itextpdf/kernel/pdf/PdfPages;

    if-eqz v0, :cond_0

    .line 138
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->parent:Lcom/itextpdf/kernel/pdf/PdfPages;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPages;->incrementCount()V

    .line 139
    :cond_0
    return-void
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 158
    const/4 v0, 0x1

    return v0
.end method

.method public removeFromParent()V
    .locals 2

    .line 105
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->parent:Lcom/itextpdf/kernel/pdf/PdfPages;

    if-eqz v0, :cond_1

    .line 106
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 107
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->parent:Lcom/itextpdf/kernel/pdf/PdfPages;

    iget-object v0, v0, Lcom/itextpdf/kernel/pdf/PdfPages;->kids:Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->remove(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 108
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->parent:Lcom/itextpdf/kernel/pdf/PdfPages;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getCount()I

    move-result v0

    if-nez v0, :cond_1

    .line 109
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->parent:Lcom/itextpdf/kernel/pdf/PdfPages;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfPages;->removeFromParent()V

    goto :goto_0

    .line 106
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 112
    :cond_1
    :goto_0
    return-void
.end method

.method public removePage(I)Z
    .locals 2
    .param p1, "pageNum"    # I

    .line 88
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->from:I

    if-lt p1, v0, :cond_1

    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->from:I

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->getCount()I

    move-result v1

    add-int/2addr v0, v1

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 90
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfPages;->decrementCount()V

    .line 91
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->kids:Lcom/itextpdf/kernel/pdf/PdfArray;

    iget v1, p0, Lcom/itextpdf/kernel/pdf/PdfPages;->from:I

    sub-int v1, p1, v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->remove(I)V

    .line 92
    const/4 v0, 0x1

    return v0

    .line 89
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method
