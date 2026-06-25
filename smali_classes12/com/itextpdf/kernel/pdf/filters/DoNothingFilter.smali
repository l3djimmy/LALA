.class public Lcom/itextpdf/kernel/pdf/filters/DoNothingFilter;
.super Ljava/lang/Object;
.source "DoNothingFilter.java"

# interfaces
.implements Lcom/itextpdf/kernel/pdf/filters/IFilterHandler;


# instance fields
.field private lastFilterName:Lcom/itextpdf/kernel/pdf/PdfName;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public decode([BLcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;Lcom/itextpdf/kernel/pdf/PdfDictionary;)[B
    .locals 0
    .param p1, "b"    # [B
    .param p2, "filterName"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p3, "decodeParams"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p4, "streamDictionary"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 38
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/filters/DoNothingFilter;->lastFilterName:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 39
    return-object p1
.end method
