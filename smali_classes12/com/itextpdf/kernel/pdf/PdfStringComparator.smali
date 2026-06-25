.class final Lcom/itextpdf/kernel/pdf/PdfStringComparator;
.super Ljava/lang/Object;
.source "PdfStringComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/itextpdf/kernel/pdf/PdfString;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method


# virtual methods
.method public compare(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfString;)I
    .locals 2
    .param p1, "o1"    # Lcom/itextpdf/kernel/pdf/PdfString;
    .param p2, "o2"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 40
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 30
    check-cast p1, Lcom/itextpdf/kernel/pdf/PdfString;

    check-cast p2, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {p0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfStringComparator;->compare(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/PdfString;)I

    move-result p1

    return p1
.end method
