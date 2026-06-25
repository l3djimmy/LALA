.class final Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor$SampleBytesExtractor;
.super Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;
.source "AbstractSampleExtractor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SampleBytesExtractor"
.end annotation


# instance fields
.field private final bytesPerSample:I


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "bitsPerSample"    # I

    .line 73
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor;-><init>()V

    .line 74
    shr-int/lit8 v0, p1, 0x3

    iput v0, p0, Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor$SampleBytesExtractor;->bytesPerSample:I

    .line 75
    return-void
.end method


# virtual methods
.method public extract([BI)J
    .locals 9
    .param p1, "samples"    # [B
    .param p2, "position"    # I

    .line 79
    iget v0, p0, Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor$SampleBytesExtractor;->bytesPerSample:I

    mul-int/2addr v0, p2

    .line 80
    .local v0, "bytePos":I
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "bytePos":I
    .local v1, "bytePos":I
    aget-byte v0, p1, v0

    and-int/lit16 v0, v0, 0xff

    int-to-long v2, v0

    .line 81
    .local v2, "result":J
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    iget v4, p0, Lcom/itextpdf/kernel/pdf/function/utils/AbstractSampleExtractor$SampleBytesExtractor;->bytesPerSample:I

    if-ge v0, v4, :cond_0

    .line 82
    const/16 v4, 0x8

    shl-long v4, v2, v4

    add-int/lit8 v6, v1, 0x1

    .end local v1    # "bytePos":I
    .local v6, "bytePos":I
    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    int-to-long v7, v1

    or-long v2, v4, v7

    .line 81
    add-int/lit8 v0, v0, 0x1

    move v1, v6

    goto :goto_0

    .line 84
    .end local v0    # "i":I
    .end local v6    # "bytePos":I
    .restart local v1    # "bytePos":I
    :cond_0
    return-wide v2
.end method
