.class public final Landroidx/camera/core/impl/utils/CameraOrientationUtil;
.super Ljava/lang/Object;
.source "CameraOrientationUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CameraOrientationUtil"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method public static degreesToSurfaceRotation(I)I
    .locals 4
    .param p0, "degrees"    # I

    .line 116
    const/4 v0, 0x0

    .line 117
    .local v0, "surfaceRotation":I
    sparse-switch p0, :sswitch_data_0

    .line 131
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid sensor rotation: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 128
    :sswitch_0
    const/4 v0, 0x3

    .line 129
    goto :goto_0

    .line 125
    :sswitch_1
    const/4 v0, 0x2

    .line 126
    goto :goto_0

    .line 122
    :sswitch_2
    const/4 v0, 0x1

    .line 123
    goto :goto_0

    .line 119
    :sswitch_3
    const/4 v0, 0x0

    .line 120
    nop

    .line 134
    :goto_0
    return v0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_3
        0x5a -> :sswitch_2
        0xb4 -> :sswitch_1
        0x10e -> :sswitch_0
    .end sparse-switch
.end method

.method public static getRelativeImageRotation(IIZ)I
    .locals 6
    .param p0, "destRotationDegrees"    # I
    .param p1, "sourceRotationDegrees"    # I
    .param p2, "isOppositeFacing"    # Z

    .line 52
    if-eqz p2, :cond_0

    .line 53
    sub-int v0, p1, p0

    add-int/lit16 v0, v0, 0x168

    rem-int/lit16 v0, v0, 0x168

    .local v0, "result":I
    goto :goto_0

    .line 55
    .end local v0    # "result":I
    :cond_0
    add-int v0, p1, p0

    rem-int/lit16 v0, v0, 0x168

    .line 57
    .restart local v0    # "result":I
    :goto_0
    const-string v1, "CameraOrientationUtil"

    invoke-static {v1}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 58
    nop

    .line 64
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v2, v3, v4, v5}, [Ljava/lang/Object;

    move-result-object v2

    .line 60
    const-string/jumbo v3, "getRelativeImageRotation: destRotationDegrees=%s, sourceRotationDegrees=%s, isOppositeFacing=%s, result=%s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 58
    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    :cond_1
    return v0
.end method

.method public static surfaceRotationToDegrees(I)I
    .locals 3
    .param p0, "rotation"    # I

    .line 83
    packed-switch p0, :pswitch_data_0

    .line 97
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unsupported surface rotation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 94
    :pswitch_0
    const/16 v0, 0x10e

    .line 95
    .local v0, "rotationDegrees":I
    goto :goto_0

    .line 91
    .end local v0    # "rotationDegrees":I
    :pswitch_1
    const/16 v0, 0xb4

    .line 92
    .restart local v0    # "rotationDegrees":I
    goto :goto_0

    .line 88
    .end local v0    # "rotationDegrees":I
    :pswitch_2
    const/16 v0, 0x5a

    .line 89
    .restart local v0    # "rotationDegrees":I
    goto :goto_0

    .line 85
    .end local v0    # "rotationDegrees":I
    :pswitch_3
    const/4 v0, 0x0

    .line 86
    .restart local v0    # "rotationDegrees":I
    nop

    .line 100
    :goto_0
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
