.class public Landroidx/camera/camera2/internal/TemplateTypeUtil;
.super Ljava/lang/Object;
.source "TemplateTypeUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method

.method public static getCaptureConfigTemplateType(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;I)I
    .locals 2
    .param p0, "captureType"    # Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;
    .param p1, "captureMode"    # I

    .line 69
    sget-object v0, Landroidx/camera/camera2/internal/TemplateTypeUtil$1;->$SwitchMap$androidx$camera$core$impl$UseCaseConfigFactory$CaptureType:[I

    invoke-virtual {p0}, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 80
    const/4 v0, 0x1

    return v0

    .line 76
    :pswitch_0
    const/4 v0, 0x3

    return v0

    .line 71
    :pswitch_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 72
    const/4 v0, 0x5

    goto :goto_0

    .line 73
    :cond_0
    nop

    .line 71
    :goto_0
    return v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static getSessionConfigTemplateType(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;I)I
    .locals 2
    .param p0, "captureType"    # Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;
    .param p1, "captureMode"    # I

    .line 46
    sget-object v0, Landroidx/camera/camera2/internal/TemplateTypeUtil$1;->$SwitchMap$androidx$camera$core$impl$UseCaseConfigFactory$CaptureType:[I

    invoke-virtual {p0}, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    .line 57
    return v1

    .line 53
    :pswitch_0
    const/4 v0, 0x3

    return v0

    .line 48
    :pswitch_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 49
    const/4 v1, 0x5

    goto :goto_0

    .line 50
    :cond_0
    nop

    .line 48
    :goto_0
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
