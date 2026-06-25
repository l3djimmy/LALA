.class public Lcom/itextpdf/kernel/pdf/layer/PdfVisibilityExpression;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfVisibilityExpression.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfArray;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 3
    .param p1, "visibilityExpressionArray"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 41
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 42
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsName(I)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    .line 43
    .local v0, "operator":Lcom/itextpdf/kernel/pdf/PdfName;
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v1

    const/4 v2, 0x1

    if-lt v1, v2, :cond_1

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Or:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->And:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 44
    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Not:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 47
    :cond_0
    return-void

    .line 45
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid visibilityExpressionArray"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 2
    .param p1, "operator"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 54
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 55
    if-eqz p1, :cond_1

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Or:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->And:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Not:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 57
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfVisibilityExpression;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 58
    return-void

    .line 56
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid operator"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public addOperand(Lcom/itextpdf/kernel/pdf/layer/PdfLayer;)V
    .locals 2
    .param p1, "layer"    # Lcom/itextpdf/kernel/pdf/layer/PdfLayer;

    .line 65
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfVisibilityExpression;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/layer/PdfLayer;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 66
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfVisibilityExpression;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 67
    return-void
.end method

.method public addOperand(Lcom/itextpdf/kernel/pdf/layer/PdfVisibilityExpression;)V
    .locals 2
    .param p1, "expression"    # Lcom/itextpdf/kernel/pdf/layer/PdfVisibilityExpression;

    .line 74
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfVisibilityExpression;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/layer/PdfVisibilityExpression;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 75
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/layer/PdfVisibilityExpression;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->setModified()Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 76
    return-void
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 80
    const/4 v0, 0x0

    return v0
.end method
