.class public Lcom/itextpdf/kernel/pdf/PdfUAConformanceLevel;
.super Ljava/lang/Object;
.source "PdfUAConformanceLevel.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/IConformanceLevel;


# static fields
.field public static final PDFUA_1:Lcom/itextpdf/kernel/pdf/PdfUAConformanceLevel;


# instance fields
.field private final version:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 37
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfUAConformanceLevel;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfUAConformanceLevel;-><init>(I)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/PdfUAConformanceLevel;->PDFUA_1:Lcom/itextpdf/kernel/pdf/PdfUAConformanceLevel;

    return-void
.end method

.method private constructor <init>(I)V
    .locals 0
    .param p1, "version"    # I

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput p1, p0, Lcom/itextpdf/kernel/pdf/PdfUAConformanceLevel;->version:I

    .line 49
    return-void
.end method


# virtual methods
.method public getVersion()I
    .locals 1

    .line 57
    iget v0, p0, Lcom/itextpdf/kernel/pdf/PdfUAConformanceLevel;->version:I

    return v0
.end method
