.class Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor$Sample12BitsExtractor;
.super Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;
.source "AbstractSampleExtractor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Sample12BitsExtractor"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 88
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor$1;

    .line 88
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor$Sample12BitsExtractor;-><init>()V

    return-void
.end method


# virtual methods
.method public extract([BI)J
    .locals 4
    .param p1, "samples"    # [B
    .param p2, "position"    # I

    .line 92
    mul-int/lit8 v0, p2, 0xc

    .line 93
    .local v0, "bitPos":I
    shr-int/lit8 v1, v0, 0x3

    .line 94
    .local v1, "bytePos":I
    and-int/lit8 v2, v0, 0x4

    if-nez v2, :cond_0

    .line 95
    aget-byte v2, p1, v1

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x4

    add-int/lit8 v3, v1, 0x1

    aget-byte v3, p1, v3

    and-int/lit16 v3, v3, 0xf0

    shr-int/lit8 v3, v3, 0x4

    or-int/2addr v2, v3

    int-to-long v2, v2

    return-wide v2

    .line 97
    :cond_0
    aget-byte v2, p1, v1

    and-int/lit8 v2, v2, 0xf

    shl-int/lit8 v2, v2, 0x8

    add-int/lit8 v3, v1, 0x1

    aget-byte v3, p1, v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v2, v3

    int-to-long v2, v2

    return-wide v2
.end method
