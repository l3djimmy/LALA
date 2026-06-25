.class public final Landroidx/camera/core/impl/CameraMode;
.super Ljava/lang/Object;
.source "CameraMode.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/CameraMode$Mode;
    }
.end annotation


# static fields
.field public static final CONCURRENT_CAMERA:I = 0x1

.field public static final DEFAULT:I = 0x0

.field public static final ULTRA_HIGH_RESOLUTION_CAMERA:I = 0x2


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    return-void
.end method

.method public static toLabelString(I)Ljava/lang/String;
    .locals 1
    .param p0, "mode"    # I

    .line 64
    packed-switch p0, :pswitch_data_0

    .line 67
    const-string v0, "DEFAULT"

    return-object v0

    .line 66
    :pswitch_0
    const-string/jumbo v0, "ULTRA_HIGH_RESOLUTION_CAMERA"

    return-object v0

    .line 65
    :pswitch_1
    const-string v0, "CONCURRENT_CAMERA"

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
