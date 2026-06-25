.class final Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatApi31Impl;
.super Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatApi23Impl;
.source "InputConfigurationCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "InputConfigurationCompatApi31Impl"
.end annotation


# direct methods
.method constructor <init>(III)V
    .locals 0
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "format"    # I

    .line 342
    invoke-direct {p0, p1, p2, p3}, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatApi23Impl;-><init>(III)V

    .line 343
    return-void
.end method

.method constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .param p1, "inputConfiguration"    # Ljava/lang/Object;

    .line 338
    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatApi23Impl;-><init>(Ljava/lang/Object;)V

    .line 339
    return-void
.end method


# virtual methods
.method public isMultiResolution()Z
    .locals 1

    .line 347
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat$InputConfigurationCompatApi31Impl;->getInputConfiguration()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/params/InputConfiguration;

    invoke-virtual {v0}, Landroid/hardware/camera2/params/InputConfiguration;->isMultiResolution()Z

    move-result v0

    return v0
.end method
