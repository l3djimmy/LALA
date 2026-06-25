.class Landroidx/camera/core/impl/UseCaseConfigFactory$1;
.super Ljava/lang/Object;
.source "UseCaseConfigFactory.java"

# interfaces
.implements Landroidx/camera/core/impl/UseCaseConfigFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/impl/UseCaseConfigFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getConfig(Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;I)Landroidx/camera/core/impl/Config;
    .locals 1
    .param p1, "captureType"    # Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;
    .param p2, "captureMode"    # I

    .line 95
    const/4 v0, 0x0

    return-object v0
.end method
