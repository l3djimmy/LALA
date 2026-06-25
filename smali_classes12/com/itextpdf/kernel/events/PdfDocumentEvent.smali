.class public Lcom/itextpdf/kernel/events/PdfDocumentEvent;
.super Lcom/itextpdf/kernel/events/Event;
.source "PdfDocumentEvent.java"


# static fields
.field public static final END_PAGE:Ljava/lang/String; = "EndPdfPage"

.field public static final INSERT_PAGE:Ljava/lang/String; = "InsertPdfPage"

.field public static final REMOVE_PAGE:Ljava/lang/String; = "RemovePdfPage"

.field public static final START_PAGE:Ljava/lang/String; = "StartPdfPage"


# instance fields
.field private document:Lcom/itextpdf/kernel/pdf/PdfDocument;

.field protected page:Lcom/itextpdf/kernel/pdf/PdfPage;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "document"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 72
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/events/Event;-><init>(Ljava/lang/String;)V

    .line 73
    iput-object p2, p0, Lcom/itextpdf/kernel/events/PdfDocumentEvent;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 74
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/PdfPage;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 83
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/events/Event;-><init>(Ljava/lang/String;)V

    .line 84
    iput-object p2, p0, Lcom/itextpdf/kernel/events/PdfDocumentEvent;->page:Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 85
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfPage;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/events/PdfDocumentEvent;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 86
    return-void
.end method


# virtual methods
.method public getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;
    .locals 1

    .line 94
    iget-object v0, p0, Lcom/itextpdf/kernel/events/PdfDocumentEvent;->document:Lcom/itextpdf/kernel/pdf/PdfDocument;

    return-object v0
.end method

.method public getPage()Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/itextpdf/kernel/events/PdfDocumentEvent;->page:Lcom/itextpdf/kernel/pdf/PdfPage;

    return-object v0
.end method
