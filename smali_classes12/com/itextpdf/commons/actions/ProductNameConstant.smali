.class public final Lcom/itextpdf/commons/actions/ProductNameConstant;
.super Ljava/lang/Object;
.source "ProductNameConstant.java"


# static fields
.field public static final ITEXT_CORE:Ljava/lang/String; = "itext-core"

.field public static final ITEXT_CORE_SIGN:Ljava/lang/String; = "itext-core-sign"

.field public static final PDF_HTML:Ljava/lang/String; = "pdfHtml"

.field public static final PDF_OCR_TESSERACT4:Ljava/lang/String; = "pdfOcr-tesseract4"

.field public static final PDF_SWEEP:Ljava/lang/String; = "pdfSweep"

.field public static final PRODUCT_NAMES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 57
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "itext-core"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string/jumbo v3, "pdfHtml"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string/jumbo v3, "pdfSweep"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string/jumbo v3, "pdfOcr-tesseract4"

    aput-object v3, v1, v2

    .line 58
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 57
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/commons/actions/ProductNameConstant;->PRODUCT_NAMES:Ljava/util/Set;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
