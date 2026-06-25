.class public Lcom/itextpdf/kernel/pdf/PdfVersion;
.super Ljava/lang/Object;
.source "PdfVersion.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/itextpdf/kernel/pdf/PdfVersion;",
        ">;"
    }
.end annotation


# static fields
.field public static final PDF_1_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

.field public static final PDF_1_1:Lcom/itextpdf/kernel/pdf/PdfVersion;

.field public static final PDF_1_2:Lcom/itextpdf/kernel/pdf/PdfVersion;

.field public static final PDF_1_3:Lcom/itextpdf/kernel/pdf/PdfVersion;

.field public static final PDF_1_4:Lcom/itextpdf/kernel/pdf/PdfVersion;

.field public static final PDF_1_5:Lcom/itextpdf/kernel/pdf/PdfVersion;

.field public static final PDF_1_6:Lcom/itextpdf/kernel/pdf/PdfVersion;

.field public static final PDF_1_7:Lcom/itextpdf/kernel/pdf/PdfVersion;

.field public static final PDF_2_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

.field private static final values:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/PdfVersion;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private major:I

.field private minor:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfVersion;->values:Ljava/util/List;

    .line 37
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfVersion;->createPdfVersion(II)Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v2

    sput-object v2, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_1_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 38
    invoke-static {v0, v0}, Lcom/itextpdf/kernel/pdf/PdfVersion;->createPdfVersion(II)Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v2

    sput-object v2, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_1_1:Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 39
    const/4 v2, 0x2

    invoke-static {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfVersion;->createPdfVersion(II)Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v3

    sput-object v3, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_1_2:Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 40
    const/4 v3, 0x3

    invoke-static {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfVersion;->createPdfVersion(II)Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v3

    sput-object v3, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_1_3:Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 41
    const/4 v3, 0x4

    invoke-static {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfVersion;->createPdfVersion(II)Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v3

    sput-object v3, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_1_4:Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 42
    const/4 v3, 0x5

    invoke-static {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfVersion;->createPdfVersion(II)Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v3

    sput-object v3, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_1_5:Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 43
    const/4 v3, 0x6

    invoke-static {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfVersion;->createPdfVersion(II)Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v3

    sput-object v3, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_1_6:Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 44
    const/4 v3, 0x7

    invoke-static {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfVersion;->createPdfVersion(II)Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_1_7:Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 45
    invoke-static {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfVersion;->createPdfVersion(II)Lcom/itextpdf/kernel/pdf/PdfVersion;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfVersion;->PDF_2_0:Lcom/itextpdf/kernel/pdf/PdfVersion;

    return-void
.end method

.method private constructor <init>(II)V
    .locals 0
    .param p1, "major"    # I
    .param p2, "minor"    # I

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput p1, p0, Lcom/itextpdf/kernel/pdf/PdfVersion;->major:I

    .line 57
    iput p2, p0, Lcom/itextpdf/kernel/pdf/PdfVersion;->minor:I

    .line 58
    return-void
.end method

.method private static createPdfVersion(II)Lcom/itextpdf/kernel/pdf/PdfVersion;
    .locals 2
    .param p0, "major"    # I
    .param p1, "minor"    # I

    .line 117
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfVersion;

    invoke-direct {v0, p0, p1}, Lcom/itextpdf/kernel/pdf/PdfVersion;-><init>(II)V

    .line 118
    .local v0, "pdfVersion":Lcom/itextpdf/kernel/pdf/PdfVersion;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfVersion;->values:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    return-object v0
.end method

.method public static fromPdfName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfVersion;
    .locals 3
    .param p0, "name"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 93
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfVersion;->values:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 94
    .local v1, "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfVersion;->toPdfName()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 95
    return-object v1

    .line 97
    .end local v1    # "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    :cond_0
    goto :goto_0

    .line 98
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The provided pdf version was not found."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static fromString(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/PdfVersion;
    .locals 3
    .param p0, "value"    # Ljava/lang/String;

    .line 77
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfVersion;->values:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 78
    .local v1, "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfVersion;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 79
    return-object v1

    .line 81
    .end local v1    # "version":Lcom/itextpdf/kernel/pdf/PdfVersion;
    :cond_0
    goto :goto_0

    .line 82
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The provided pdf version was not found."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I
    .locals 3
    .param p1, "o"    # Lcom/itextpdf/kernel/pdf/PdfVersion;

    .line 103
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfVersion;->major:I

    iget v1, p1, Lcom/itextpdf/kernel/pdf/PdfVersion;->major:I

    invoke-static {v0, v1}, Ljava/lang/Integer;->compare(II)I

    move-result v0

    .line 104
    .local v0, "majorResult":I
    if-eqz v0, :cond_0

    .line 105
    return v0

    .line 107
    :cond_0
    iget v1, p0, Lcom/itextpdf/kernel/pdf/PdfVersion;->minor:I

    iget v2, p1, Lcom/itextpdf/kernel/pdf/PdfVersion;->minor:I

    invoke-static {v1, v2}, Ljava/lang/Integer;->compare(II)I

    move-result v1

    return v1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 32
    check-cast p1, Lcom/itextpdf/kernel/pdf/PdfVersion;

    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;

    .line 113
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfVersion;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/PdfVersion;->compareTo(Lcom/itextpdf/kernel/pdf/PdfVersion;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public toPdfName()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 3

    .line 66
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfName;

    iget v1, p0, Lcom/itextpdf/kernel/pdf/PdfVersion;->major:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p0, Lcom/itextpdf/kernel/pdf/PdfVersion;->minor:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const-string/jumbo v2, "{0}.{1}"

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 62
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfVersion;->major:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget v1, p0, Lcom/itextpdf/kernel/pdf/PdfVersion;->minor:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "PDF-{0}.{1}"

    invoke-static {v1, v0}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
