.class public Lcom/itextpdf/kernel/exceptions/XrefCycledReferencesException;
.super Lcom/itextpdf/kernel/exceptions/PdfException;
.source "XrefCycledReferencesException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .line 36
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    .line 37
    return-void
.end method
