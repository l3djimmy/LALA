.class Landroidx/camera/view/SurfaceViewImplementation$Api24Impl;
.super Ljava/lang/Object;
.source "SurfaceViewImplementation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/view/SurfaceViewImplementation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Api24Impl"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 367
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 368
    return-void
.end method

.method static pixelCopyRequest(Landroid/view/SurfaceView;Landroid/graphics/Bitmap;Landroid/view/PixelCopy$OnPixelCopyFinishedListener;Landroid/os/Handler;)V
    .locals 0
    .param p0, "source"    # Landroid/view/SurfaceView;
    .param p1, "dest"    # Landroid/graphics/Bitmap;
    .param p2, "listener"    # Landroid/view/PixelCopy$OnPixelCopyFinishedListener;
    .param p3, "handler"    # Landroid/os/Handler;

    .line 373
    invoke-static {p0, p1, p2, p3}, Landroid/view/PixelCopy;->request(Landroid/view/SurfaceView;Landroid/graphics/Bitmap;Landroid/view/PixelCopy$OnPixelCopyFinishedListener;Landroid/os/Handler;)V

    .line 374
    return-void
.end method
