.class Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;
.super Ljava/lang/Object;
.source "SurfaceViewImplementation.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/view/SurfaceViewImplementation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SurfaceRequestCallback"
.end annotation


# instance fields
.field private mCurrentSurfaceSize:Landroid/util/Size;

.field private mNeedToInvalidate:Z

.field private mOnSurfaceNotInUseListener:Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;

.field private mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

.field private mSurfaceRequestToBeInvalidated:Landroidx/camera/core/SurfaceRequest;

.field private mTargetSize:Landroid/util/Size;

.field private mWasSurfaceProvided:Z

.field final synthetic this$0:Landroidx/camera/view/SurfaceViewImplementation;


# direct methods
.method constructor <init>(Landroidx/camera/view/SurfaceViewImplementation;)V
    .locals 1
    .param p1, "this$0"    # Landroidx/camera/view/SurfaceViewImplementation;

    .line 184
    iput-object p1, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->this$0:Landroidx/camera/view/SurfaceViewImplementation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 209
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mWasSurfaceProvided:Z

    .line 211
    iput-boolean v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mNeedToInvalidate:Z

    return-void
.end method

.method private canProvideSurface()Z
    .locals 2

    .line 278
    iget-boolean v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mWasSurfaceProvided:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mTargetSize:Landroid/util/Size;

    iget-object v1, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mCurrentSurfaceSize:Landroid/util/Size;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private cancelPreviousRequest()V
    .locals 2

    .line 285
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    if-eqz v0, :cond_0

    .line 286
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Request canceled: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "SurfaceViewImpl"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    invoke-virtual {v0}, Landroidx/camera/core/SurfaceRequest;->willNotProvideSurface()Z

    .line 289
    :cond_0
    return-void
.end method

.method private closeSurface()V
    .locals 2

    .line 294
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    if-eqz v0, :cond_0

    .line 295
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Surface closed "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "SurfaceViewImpl"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    invoke-virtual {v0}, Landroidx/camera/core/SurfaceRequest;->getDeferrableSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/DeferrableSurface;->close()V

    .line 298
    :cond_0
    return-void
.end method

.method static synthetic lambda$tryToComplete$0(Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;Landroidx/camera/core/SurfaceRequest$Result;)V
    .locals 2
    .param p0, "listener"    # Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;
    .param p1, "result"    # Landroidx/camera/core/SurfaceRequest$Result;

    .line 264
    const-string/jumbo v0, "SurfaceViewImpl"

    const-string/jumbo v1, "Safe to release surface."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    if-eqz p0, :cond_0

    .line 266
    invoke-interface {p0}, Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;->onSurfaceNotInUse()V

    .line 268
    :cond_0
    return-void
.end method

.method private tryToComplete()Z
    .locals 5

    .line 256
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->this$0:Landroidx/camera/view/SurfaceViewImplementation;

    iget-object v0, v0, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    .line 257
    .local v0, "surface":Landroid/view/Surface;
    invoke-direct {p0}, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->canProvideSurface()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 258
    const-string/jumbo v1, "SurfaceViewImpl"

    const-string/jumbo v2, "Surface set on Preview."

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 260
    iget-object v1, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mOnSurfaceNotInUseListener:Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;

    .line 261
    .local v1, "listener":Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;
    iget-object v2, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/SurfaceRequest;

    iget-object v3, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->this$0:Landroidx/camera/view/SurfaceViewImplementation;

    iget-object v3, v3, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceView:Landroid/view/SurfaceView;

    .line 262
    invoke-virtual {v3}, Landroid/view/SurfaceView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroidx/core/content/ContextCompat;->getMainExecutor(Landroid/content/Context;)Ljava/util/concurrent/Executor;

    move-result-object v3

    new-instance v4, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback$$ExternalSyntheticLambda0;

    invoke-direct {v4, v1}, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;)V

    .line 261
    invoke-virtual {v2, v0, v3, v4}, Landroidx/camera/core/SurfaceRequest;->provideSurface(Landroid/view/Surface;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)V

    .line 270
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mWasSurfaceProvided:Z

    .line 271
    iget-object v3, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->this$0:Landroidx/camera/view/SurfaceViewImplementation;

    invoke-virtual {v3}, Landroidx/camera/view/SurfaceViewImplementation;->onSurfaceProvided()V

    .line 272
    return v2

    .line 274
    .end local v1    # "listener":Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;
    :cond_0
    const/4 v1, 0x0

    return v1
.end method


# virtual methods
.method setSurfaceRequest(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;)V
    .locals 4
    .param p1, "surfaceRequest"    # Landroidx/camera/core/SurfaceRequest;
    .param p2, "onSurfaceNotInUseListener"    # Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;

    .line 221
    invoke-direct {p0}, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->cancelPreviousRequest()V

    .line 223
    iget-boolean v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mNeedToInvalidate:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 231
    iput-boolean v1, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mNeedToInvalidate:Z

    .line 232
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->invalidate()Z

    goto :goto_0

    .line 234
    :cond_0
    iput-object p1, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    .line 235
    iput-object p2, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mOnSurfaceNotInUseListener:Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;

    .line 236
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest;->getResolution()Landroid/util/Size;

    move-result-object v0

    .line 237
    .local v0, "targetSize":Landroid/util/Size;
    iput-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mTargetSize:Landroid/util/Size;

    .line 238
    iput-boolean v1, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mWasSurfaceProvided:Z

    .line 240
    invoke-direct {p0}, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->tryToComplete()Z

    move-result v1

    if-nez v1, :cond_1

    .line 242
    const-string/jumbo v1, "SurfaceViewImpl"

    const-string/jumbo v2, "Wait for new Surface creation."

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    iget-object v1, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->this$0:Landroidx/camera/view/SurfaceViewImplementation;

    iget-object v1, v1, Landroidx/camera/view/SurfaceViewImplementation;->mSurfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v2

    .line 244
    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v3

    .line 243
    invoke-interface {v1, v2, v3}, Landroid/view/SurfaceHolder;->setFixedSize(II)V

    .line 247
    .end local v0    # "targetSize":Landroid/util/Size;
    :cond_1
    :goto_0
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 2
    .param p1, "surfaceHolder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .line 316
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Surface changed. Size: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "SurfaceViewImpl"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 317
    new-instance v0, Landroid/util/Size;

    invoke-direct {v0, p3, p4}, Landroid/util/Size;-><init>(II)V

    iput-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mCurrentSurfaceSize:Landroid/util/Size;

    .line 318
    invoke-direct {p0}, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->tryToComplete()Z

    .line 319
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "surfaceHolder"    # Landroid/view/SurfaceHolder;

    .line 302
    const-string/jumbo v0, "SurfaceViewImpl"

    const-string/jumbo v1, "Surface created."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    iget-boolean v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mNeedToInvalidate:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mSurfaceRequestToBeInvalidated:Landroidx/camera/core/SurfaceRequest;

    if-eqz v0, :cond_0

    .line 307
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mSurfaceRequestToBeInvalidated:Landroidx/camera/core/SurfaceRequest;

    invoke-virtual {v0}, Landroidx/camera/core/SurfaceRequest;->invalidate()Z

    .line 308
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mSurfaceRequestToBeInvalidated:Landroidx/camera/core/SurfaceRequest;

    .line 309
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mNeedToInvalidate:Z

    .line 311
    :cond_0
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "surfaceHolder"    # Landroid/view/SurfaceHolder;

    .line 323
    const-string/jumbo v0, "SurfaceViewImpl"

    const-string/jumbo v1, "Surface destroyed."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    iget-boolean v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mWasSurfaceProvided:Z

    if-eqz v0, :cond_0

    .line 328
    invoke-direct {p0}, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->closeSurface()V

    goto :goto_0

    .line 330
    :cond_0
    invoke-direct {p0}, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->cancelPreviousRequest()V

    .line 335
    :goto_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mNeedToInvalidate:Z

    .line 336
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    if-eqz v0, :cond_1

    .line 337
    iget-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    iput-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mSurfaceRequestToBeInvalidated:Landroidx/camera/core/SurfaceRequest;

    .line 341
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mWasSurfaceProvided:Z

    .line 342
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mSurfaceRequest:Landroidx/camera/core/SurfaceRequest;

    .line 343
    iput-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mOnSurfaceNotInUseListener:Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;

    .line 344
    iput-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mCurrentSurfaceSize:Landroid/util/Size;

    .line 345
    iput-object v0, p0, Landroidx/camera/view/SurfaceViewImplementation$SurfaceRequestCallback;->mTargetSize:Landroid/util/Size;

    .line 346
    return-void
.end method
