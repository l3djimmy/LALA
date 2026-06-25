.class public abstract Lcom/itextpdf/kernel/pdf/function/utils/SampleExtractor;
.super Ljava/lang/Object;
.source "SampleExtractor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/function/utils/SampleExtractor$Sample12BitsExtractor;,
        Lcom/itextpdf/kernel/pdf/function/utils/SampleExtractor$SampleBytesExtractor;,
        Lcom/itextpdf/kernel/pdf/function/utils/SampleExtractor$SampleBitsExtractor;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createExtractor(I)Lcom/itextpdf/kernel/pdf/function/utils/SampleExtractor;
    .locals 2
    .param p0, "bitsPerSample"    # I

    .line 32
    sparse-switch p0, :sswitch_data_0

    .line 45
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bitsPerSample value must be from {1, 2, 4, 8, 12, 16, 24, 32}"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 43
    :sswitch_0
    new-instance v0, Lcom/itextpdf/kernel/pdf/function/utils/SampleExtractor$Sample12BitsExtractor;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/function/utils/SampleExtractor$Sample12BitsExtractor;-><init>(Lcom/itextpdf/kernel/pdf/function/utils/SampleExtractor$1;)V

    return-object v0

    .line 41
    :sswitch_1
    new-instance v0, Lcom/itextpdf/kernel/pdf/function/utils/SampleExtractor$SampleBytesExtractor;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/pdf/function/utils/SampleExtractor$SampleBytesExtractor;-><init>(I)V

    return-object v0

    .line 36
    :sswitch_2
    new-instance v0, Lcom/itextpdf/kernel/pdf/function/utils/SampleExtractor$SampleBitsExtractor;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/pdf/function/utils/SampleExtractor$SampleBitsExtractor;-><init>(I)V

    return-object v0

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_2
        0x2 -> :sswitch_2
        0x4 -> :sswitch_2
        0x8 -> :sswitch_1
        0xc -> :sswitch_0
        0x10 -> :sswitch_1
        0x18 -> :sswitch_1
        0x20 -> :sswitch_1
    .end sparse-switch
.end method


# virtual methods
.method public abstract extract([BI)J
.end method
