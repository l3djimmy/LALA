.class final Lcom/itextpdf/kernel/utils/PdfSplitter$SplitReadyListener;
.super Ljava/lang/Object;
.source "PdfSplitter.java"

# interfaces
.implements Lcom/itextpdf/kernel/utils/PdfSplitter$IDocumentReadyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/utils/PdfSplitter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SplitReadyListener"
.end annotation


# instance fields
.field private splitDocuments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfDocument;",
            ">;)V"
        }
    .end annotation

    .line 392
    .local p1, "splitDocuments":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfDocument;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 393
    iput-object p1, p0, Lcom/itextpdf/kernel/utils/PdfSplitter$SplitReadyListener;->splitDocuments:Ljava/util/List;

    .line 394
    return-void
.end method


# virtual methods
.method public documentReady(Lcom/itextpdf/kernel/pdf/PdfDocument;Lcom/itextpdf/kernel/utils/PageRange;)V
    .locals 1
    .param p1, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;
    .param p2, "pageRange"    # Lcom/itextpdf/kernel/utils/PageRange;

    .line 398
    iget-object v0, p0, Lcom/itextpdf/kernel/utils/PdfSplitter$SplitReadyListener;->splitDocuments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 399
    return-void
.end method
