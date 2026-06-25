.class public final Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors;
.super Ljava/lang/Object;
.source "BaseInputOutPutConvertors.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IOutputConversionFunction;,
        Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IInputConversionFunction;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getByteBasedInputConvertor(ID)Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IInputConversionFunction;
    .locals 1
    .param p0, "wordSize"    # I
    .param p1, "scale"    # D

    .line 41
    new-instance v0, Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1, p2}, Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$$ExternalSyntheticLambda1;-><init>(ID)V

    return-object v0
.end method

.method private static getByteBasedOutputConvertor(ID)Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IOutputConversionFunction;
    .locals 1
    .param p0, "wordSize"    # I
    .param p1, "scale"    # D

    .line 66
    new-instance v0, Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1, p2}, Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$$ExternalSyntheticLambda0;-><init>(ID)V

    return-object v0
.end method

.method public static getInputConvertor(ID)Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IInputConversionFunction;
    .locals 4
    .param p0, "wordSize"    # I
    .param p1, "scaleFactor"    # D

    .line 33
    mul-int/lit8 v0, p0, 0x8

    const-wide/16 v1, 0x1

    shl-long v0, v1, v0

    long-to-double v0, v0

    mul-double/2addr v0, p1

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v0, v2

    invoke-static {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors;->getByteBasedInputConvertor(ID)Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IInputConversionFunction;

    move-result-object v0

    return-object v0
.end method

.method public static getOutputConvertor(ID)Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IOutputConversionFunction;
    .locals 4
    .param p0, "wordSize"    # I
    .param p1, "scaleFactor"    # D

    .line 37
    mul-int/lit8 v0, p0, 0x8

    const-wide/16 v1, 0x1

    shl-long v0, v1, v0

    long-to-double v0, v0

    mul-double/2addr v0, p1

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v0, v2

    invoke-static {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors;->getByteBasedOutputConvertor(ID)Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IOutputConversionFunction;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$getByteBasedInputConvertor$0(ID[BII)[D
    .locals 7
    .param p0, "wordSize"    # I
    .param p1, "scale"    # D
    .param p3, "input"    # [B
    .param p4, "o"    # I
    .param p5, "l"    # I

    .line 42
    add-int v0, p4, p5

    array-length v1, p3

    if-gt v0, v1, :cond_3

    .line 45
    rem-int v0, p5, p0

    if-nez v0, :cond_2

    .line 49
    div-int v0, p5, p0

    new-array v0, v0, [D

    .line 50
    .local v0, "out":[D
    move v1, p4

    .line 51
    .local v1, "inIndex":I
    const/4 v2, 0x0

    .line 52
    .local v2, "outIndex":I
    :goto_0
    add-int v3, p5, p4

    if-ge v1, v3, :cond_1

    .line 53
    const/4 v3, 0x0

    .line 54
    .local v3, "val":I
    const/4 v4, 0x0

    .local v4, "wordIndex":I
    :goto_1
    if-ge v4, p0, :cond_0

    .line 55
    shl-int/lit8 v5, v3, 0x8

    add-int v6, v1, v4

    aget-byte v6, p3, v6

    and-int/lit16 v6, v6, 0xff

    add-int v3, v5, v6

    .line 56
    add-int/lit8 v1, v1, 0x1

    .line 54
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 58
    .end local v4    # "wordIndex":I
    :cond_0
    int-to-double v4, v3

    div-double/2addr v4, p1

    aput-wide v4, v0, v2

    .line 59
    nop

    .end local v3    # "val":I
    add-int/lit8 v2, v2, 0x1

    .line 60
    goto :goto_0

    .line 61
    :cond_1
    return-object v0

    .line 46
    .end local v0    # "out":[D
    .end local v1    # "inIndex":I
    .end local v2    # "outIndex":I
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 47
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "The length must be a multiple of {0}."

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 43
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The offset + length must be lower than or equal to the length of the byte array."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic lambda$getByteBasedOutputConvertor$1(ID[D)[B
    .locals 7
    .param p0, "wordSize"    # I
    .param p1, "scale"    # D
    .param p3, "input"    # [D

    .line 67
    array-length v0, p3

    mul-int/2addr v0, p0

    new-array v0, v0, [B

    .line 68
    .local v0, "out":[B
    const/4 v1, 0x0

    .line 69
    .local v1, "inIndex":I
    const/4 v2, 0x0

    .line 70
    .local v2, "outIndex":I
    :goto_0
    array-length v3, p3

    if-ge v1, v3, :cond_1

    array-length v3, v0

    if-ge v2, v3, :cond_1

    .line 71
    aget-wide v3, p3, v1

    mul-double/2addr v3, p1

    double-to-int v3, v3

    .line 72
    .local v3, "val":I
    const/4 v4, 0x0

    .local v4, "wordIndex":I
    :goto_1
    if-ge v4, p0, :cond_0

    .line 73
    add-int/lit8 v5, v2, 0x1

    .end local v2    # "outIndex":I
    .local v5, "outIndex":I
    mul-int/lit8 v6, v4, 0x8

    ushr-int v6, v3, v6

    int-to-byte v6, v6

    aput-byte v6, v0, v2

    .line 72
    add-int/lit8 v4, v4, 0x1

    move v2, v5

    goto :goto_1

    .line 75
    .end local v4    # "wordIndex":I
    .end local v5    # "outIndex":I
    .restart local v2    # "outIndex":I
    :cond_0
    nop

    .end local v3    # "val":I
    add-int/lit8 v1, v1, 0x1

    .line 76
    goto :goto_0

    .line 77
    :cond_1
    return-object v0
.end method
