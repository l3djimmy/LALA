.class Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor$SampleBitsExtractor;
.super Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;
.source "AbstractSampleExtractor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SampleBitsExtractor"
.end annotation


# instance fields
.field private final bitsPerSample:I

.field private final mask:B


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .param p1, "bitsPerSample"    # I

    .line 55
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;-><init>()V

    .line 56
    iput p1, p0, Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor$SampleBitsExtractor;->bitsPerSample:I

    .line 57
    const/4 v0, 0x1

    shl-int v1, v0, p1

    sub-int/2addr v1, v0

    int-to-byte v0, v1

    iput-byte v0, p0, Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor$SampleBitsExtractor;->mask:B

    .line 58
    return-void
.end method


# virtual methods
.method public extract([BI)J
    .locals 5
    .param p1, "samples"    # [B
    .param p2, "position"    # I

    .line 62
    iget v0, p0, Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor$SampleBitsExtractor;->bitsPerSample:I

    mul-int/2addr v0, p2

    .line 63
    .local v0, "bitPos":I
    shr-int/lit8 v1, v0, 0x3

    .line 64
    .local v1, "bytePos":I
    and-int/lit8 v2, v0, 0x7

    rsub-int/lit8 v2, v2, 0x8

    iget v3, p0, Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor$SampleBitsExtractor;->bitsPerSample:I

    sub-int/2addr v2, v3

    .line 65
    .local v2, "shift":I
    aget-byte v3, p1, v1

    shr-int/2addr v3, v2

    iget-byte v4, p0, Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor$SampleBitsExtractor;->mask:B

    and-int/2addr v3, v4

    int-to-long v3, v3

    return-wide v3
.end method
