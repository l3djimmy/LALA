.class Lcom/itextpdf/kernel/pdf/PdfResources$ResourceNameGenerator;
.super Ljava/lang/Object;
.source "PdfResources.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/PdfResources;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ResourceNameGenerator"
.end annotation


# instance fields
.field private counter:I

.field private prefix:Ljava/lang/String;

.field private resourceType:Lcom/itextpdf/kernel/pdf/PdfName;


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfName;Ljava/lang/String;)V
    .locals 1
    .param p1, "resourceType"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "prefix"    # Ljava/lang/String;

    .line 552
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/kernel/pdf/PdfResources$ResourceNameGenerator;-><init>(Lcom/itextpdf/kernel/pdf/PdfName;Ljava/lang/String;I)V

    .line 553
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfName;Ljava/lang/String;I)V
    .locals 0
    .param p1, "resourceType"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "seed"    # I

    .line 538
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 539
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/PdfResources$ResourceNameGenerator;->prefix:Ljava/lang/String;

    .line 540
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/PdfResources$ResourceNameGenerator;->resourceType:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 541
    iput p3, p0, Lcom/itextpdf/kernel/pdf/PdfResources$ResourceNameGenerator;->counter:I

    .line 542
    return-void
.end method


# virtual methods
.method public generate(Lcom/itextpdf/kernel/pdf/PdfResources;)Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 6
    .param p1, "resources"    # Lcom/itextpdf/kernel/pdf/PdfResources;

    .line 572
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfResources$ResourceNameGenerator;->prefix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/itextpdf/kernel/pdf/PdfResources$ResourceNameGenerator;->counter:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/itextpdf/kernel/pdf/PdfResources$ResourceNameGenerator;->counter:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    .line 573
    .local v0, "newName":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfResources;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 574
    .local v1, "r":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfResources$ResourceNameGenerator;->resourceType:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 575
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/PdfResources$ResourceNameGenerator;->resourceType:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->containsKey(Lcom/itextpdf/kernel/pdf/PdfName;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 576
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/PdfResources$ResourceNameGenerator;->prefix:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/itextpdf/kernel/pdf/PdfResources$ResourceNameGenerator;->counter:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/itextpdf/kernel/pdf/PdfResources$ResourceNameGenerator;->counter:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    move-object v0, v2

    goto :goto_0

    .line 580
    :cond_0
    return-object v0
.end method

.method public getResourceType()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 562
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/PdfResources$ResourceNameGenerator;->resourceType:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method
