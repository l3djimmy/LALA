.class public abstract Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfColorSpace.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfObject;",
        ">;"
    }
.end annotation


# static fields
.field public static final DIRECT_COLOR_SPACES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/itextpdf/kernel/pdf/PdfName;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 40
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x4

    new-array v1, v1, [Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v2, 0x0

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceGray:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceRGB:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceCMYK:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Pattern:Lcom/itextpdf/kernel/pdf/PdfName;

    aput-object v3, v1, v2

    .line 41
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 40
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->DIRECT_COLOR_SPACES:Ljava/util/Set;

    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V
    .locals 0
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 45
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 46
    return-void
.end method

.method public static makeColorSpace(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;
    .locals 4
    .param p0, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 51
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 52
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object p0

    .line 53
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    .line 54
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object p0

    .line 55
    :cond_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceGray:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 56
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Gray;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Gray;-><init>()V

    return-object v0

    .line 57
    :cond_2
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceRGB:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 58
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Rgb;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Rgb;-><init>()V

    return-object v0

    .line 59
    :cond_3
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceCMYK:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 60
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Cmyk;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfDeviceCs$Cmyk;-><init>()V

    return-object v0

    .line 61
    :cond_4
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Pattern:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 62
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Pattern;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Pattern;-><init>()V

    return-object v0

    .line 63
    :cond_5
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isArray()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 64
    move-object v0, p0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 65
    .local v0, "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsName(I)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    .line 66
    .local v1, "csType":Lcom/itextpdf/kernel/pdf/PdfName;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->CalGray:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 67
    new-instance v2, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalGray;

    invoke-direct {v2, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalGray;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    return-object v2

    .line 68
    :cond_6
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->CalRGB:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 69
    new-instance v2, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalRgb;

    invoke-direct {v2, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$CalRgb;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    return-object v2

    .line 70
    :cond_7
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Lab:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 71
    new-instance v2, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$Lab;

    invoke-direct {v2, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$Lab;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    return-object v2

    .line 72
    :cond_8
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ICCBased:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 73
    new-instance v2, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;

    invoke-direct {v2, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfCieBasedCs$IccBased;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    return-object v2

    .line 74
    :cond_9
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Indexed:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 75
    new-instance v2, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Indexed;

    invoke-direct {v2, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Indexed;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    return-object v2

    .line 76
    :cond_a
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Separation:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 77
    new-instance v2, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;

    invoke-direct {v2, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    return-object v2

    .line 78
    :cond_b
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceN:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 80
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->size()I

    move-result v2

    const/4 v3, 0x4

    if-ne v2, v3, :cond_c

    new-instance v2, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;

    invoke-direct {v2, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$DeviceN;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    goto :goto_0

    :cond_c
    new-instance v2, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$NChannel;

    invoke-direct {v2, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$NChannel;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    :goto_0
    return-object v2

    .line 81
    :cond_d
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Pattern:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 82
    new-instance v2, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$UncoloredTilingPattern;

    invoke-direct {v2, v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$UncoloredTilingPattern;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    return-object v2

    .line 84
    .end local v0    # "array":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v1    # "csType":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_e
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public abstract getNumberOfComponents()I
.end method
