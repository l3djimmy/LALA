.class public Lcom/itextpdf/kernel/utils/ValidationContext;
.super Ljava/lang/Object;
.source "ValidationContext.java"


# instance fields
.field private PdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

.field private fonts:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Lcom/itextpdf/kernel/font/PdfFont;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/utils/ValidationContext;->PdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 36
    iput-object v0, p0, Lcom/itextpdf/kernel/utils/ValidationContext;->fonts:Ljava/util/Collection;

    .line 39
    return-void
.end method


# virtual methods
.method public getFonts()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/kernel/font/PdfFont;",
            ">;"
        }
    .end annotation

    .line 56
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/ValidationContext;->fonts:Ljava/util/Collection;

    return-object v0
.end method

.method public getPdfDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/ValidationContext;->PdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    return-object v0
.end method

.method public withFonts(Ljava/util/Collection;)Lcom/itextpdf/kernel/utils/ValidationContext;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/itextpdf/kernel/font/PdfFont;",
            ">;)",
            "Lcom/itextpdf/kernel/utils/ValidationContext;"
        }
    .end annotation

    .line 47
    .local p1, "fonts":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/itextpdf/kernel/font/PdfFont;>;"
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/ValidationContext;->fonts:Ljava/util/Collection;

    .line 48
    return-object p0
.end method

.method public withPdfDocument(Lcom/itextpdf/kernel/pdf/PdfDocument;)Lcom/itextpdf/kernel/utils/ValidationContext;
    .locals 0
    .param p1, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 42
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/ValidationContext;->PdfDocument:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 43
    return-object p0
.end method
