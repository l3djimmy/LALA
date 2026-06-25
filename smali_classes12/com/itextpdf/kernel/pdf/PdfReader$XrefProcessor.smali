.class Lcom/itextpdf/kernel/pdf/PdfReader$XrefProcessor;
.super Ljava/lang/Object;
.source "PdfReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/PdfReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "XrefProcessor"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1675
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method processXref(Lcom/itextpdf/kernel/pdf/PdfXrefTable;Lcom/itextpdf/io/source/PdfTokenizer;)V
    .locals 0
    .param p1, "xrefTable"    # Lcom/itextpdf/kernel/pdf/PdfXrefTable;
    .param p2, "tokenizer"    # Lcom/itextpdf/io/source/PdfTokenizer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1686
    return-void
.end method
