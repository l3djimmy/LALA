.class public Lcom/itextpdf/kernel/utils/ValidationContainer;
.super Ljava/lang/Object;
.source "ValidationContainer.java"


# instance fields
.field private final validationCheckers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/utils/IValidationChecker;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/ValidationContainer;->validationCheckers:Ljava/util/List;

    .line 50
    return-void
.end method


# virtual methods
.method public addChecker(Lcom/itextpdf/kernel/utils/IValidationChecker;)V
    .locals 1
    .param p1, "checker"    # Lcom/itextpdf/kernel/utils/IValidationChecker;

    .line 87
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/ValidationContainer;->validationCheckers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    return-void
.end method

.method public containsChecker(Lcom/itextpdf/kernel/utils/IValidationChecker;)Z
    .locals 1
    .param p1, "checker"    # Lcom/itextpdf/kernel/utils/IValidationChecker;

    .line 99
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/ValidationContainer;->validationCheckers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public validate(Lcom/itextpdf/kernel/utils/ValidationContext;)V
    .locals 2
    .param p1, "context"    # Lcom/itextpdf/kernel/utils/ValidationContext;

    .line 59
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/ValidationContainer;->validationCheckers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/utils/IValidationChecker;

    .line 60
    .local v1, "checker":Lcom/itextpdf/kernel/utils/IValidationChecker;
    invoke-interface {v1, p1}, Lcom/itextpdf/kernel/utils/IValidationChecker;->validateDocument(Lcom/itextpdf/kernel/utils/ValidationContext;)V

    .line 61
    .end local v1    # "checker":Lcom/itextpdf/kernel/utils/IValidationChecker;
    goto :goto_0

    .line 62
    :cond_0
    return-void
.end method

.method public validate(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfStream;Ljava/lang/Object;)V
    .locals 8
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "key"    # Lcom/itextpdf/kernel/pdf/IsoKey;
    .param p3, "resources"    # Lcom/itextpdf/kernel/pdf/PdfResources;
    .param p4, "contentStream"    # Lcom/itextpdf/kernel/pdf/PdfStream;
    .param p5, "extra"    # Ljava/lang/Object;

    .line 76
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/ValidationContainer;->validationCheckers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lcom/itextpdf/kernel/utils/IValidationChecker;

    .line 77
    .local v2, "checker":Lcom/itextpdf/kernel/utils/IValidationChecker;
    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    .end local p1    # "obj":Ljava/lang/Object;
    .end local p2    # "key":Lcom/itextpdf/kernel/pdf/IsoKey;
    .end local p3    # "resources":Lcom/itextpdf/kernel/pdf/PdfResources;
    .end local p4    # "contentStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local p5    # "extra":Ljava/lang/Object;
    .local v3, "obj":Ljava/lang/Object;
    .local v4, "key":Lcom/itextpdf/kernel/pdf/IsoKey;
    .local v5, "resources":Lcom/itextpdf/kernel/pdf/PdfResources;
    .local v6, "contentStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .local v7, "extra":Ljava/lang/Object;
    invoke-interface/range {v2 .. v7}, Lcom/itextpdf/kernel/utils/IValidationChecker;->validateObject(Ljava/lang/Object;Lcom/itextpdf/kernel/pdf/IsoKey;Lcom/itextpdf/kernel/pdf/PdfResources;Lcom/itextpdf/kernel/pdf/PdfStream;Ljava/lang/Object;)V

    .line 78
    .end local v2    # "checker":Lcom/itextpdf/kernel/utils/IValidationChecker;
    goto :goto_0

    .line 79
    .end local v3    # "obj":Ljava/lang/Object;
    .end local v4    # "key":Lcom/itextpdf/kernel/pdf/IsoKey;
    .end local v5    # "resources":Lcom/itextpdf/kernel/pdf/PdfResources;
    .end local v6    # "contentStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local v7    # "extra":Ljava/lang/Object;
    .restart local p1    # "obj":Ljava/lang/Object;
    .restart local p2    # "key":Lcom/itextpdf/kernel/pdf/IsoKey;
    .restart local p3    # "resources":Lcom/itextpdf/kernel/pdf/PdfResources;
    .restart local p4    # "contentStream":Lcom/itextpdf/kernel/pdf/PdfStream;
    .restart local p5    # "extra":Ljava/lang/Object;
    :cond_0
    return-void
.end method
