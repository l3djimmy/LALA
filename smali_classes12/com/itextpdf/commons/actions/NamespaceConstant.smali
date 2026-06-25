.class public final Lcom/itextpdf/commons/actions/NamespaceConstant;
.super Ljava/lang/Object;
.source "NamespaceConstant.java"


# static fields
.field public static final CORE_BARCODES:Ljava/lang/String; = "com.itextpdf.barcodes"

.field public static final CORE_EVENTS:Ljava/lang/String; = "com.itextpdf.events"

.field public static final CORE_FORMS:Ljava/lang/String; = "com.itextpdf.forms"

.field public static final CORE_IO:Ljava/lang/String; = "com.itextpdf.io"

.field public static final CORE_KERNEL:Ljava/lang/String; = "com.itextpdf.kernel"

.field public static final CORE_LAYOUT:Ljava/lang/String; = "com.itextpdf.layout"

.field public static final CORE_PDFA:Ljava/lang/String; = "com.itextpdf.pdfa"

.field public static final CORE_PDFUA:Ljava/lang/String; = "com.itextpdf.pdfua"

.field public static final CORE_SIGN:Ljava/lang/String; = "com.itextpdf.signatures"

.field public static final CORE_SVG:Ljava/lang/String; = "com.itextpdf.svg"

.field public static final CORE_SXP:Ljava/lang/String; = "com.itextpdf.styledxmlparser"

.field public static final ITEXT:Ljava/lang/String; = "com.itextpdf"

.field public static final ITEXT_CORE_NAMESPACES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final PDF_HTML:Ljava/lang/String; = "com.itextpdf.html2pdf"

.field public static final PDF_OCR:Ljava/lang/String; = "com.itextpdf.pdfocr"

.field public static final PDF_OCR_TESSERACT4:Ljava/lang/String; = "com.itextpdf.pdfocr.tesseract4"

.field public static final PDF_SWEEP:Ljava/lang/String; = "com.itextpdf.pdfcleanup"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 55
    const/16 v0, 0xb

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "com.itextpdf.events"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "com.itextpdf.io"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "com.itextpdf.kernel"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "com.itextpdf.layout"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "com.itextpdf.barcodes"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "com.itextpdf.pdfa"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "com.itextpdf.pdfua"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "com.itextpdf.signatures"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "com.itextpdf.forms"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "com.itextpdf.styledxmlparser"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "com.itextpdf.svg"

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/commons/actions/NamespaceConstant;->ITEXT_CORE_NAMESPACES:Ljava/util/List;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    return-void
.end method
