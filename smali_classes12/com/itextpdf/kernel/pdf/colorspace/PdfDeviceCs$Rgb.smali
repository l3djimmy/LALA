.class public Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Rgb;
.super Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs;
.source "PdfDeviceCs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Rgb"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 56
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceRGB:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs;-><init>(Lcom/itextpdf/kernel/pdf/PdfName;)V

    .line 57
    return-void
.end method


# virtual methods
.method public getNumberOfComponents()I
    .locals 1

    .line 61
    const/4 v0, 0x3

    return v0
.end method
