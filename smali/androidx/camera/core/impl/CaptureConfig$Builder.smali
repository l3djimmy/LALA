.class public final Landroidx/camera/core/impl/CaptureConfig$Builder;
.super Ljava/lang/Object;
.source "CaptureConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/impl/CaptureConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private mCameraCaptureCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CameraCaptureCallback;",
            ">;"
        }
    .end annotation
.end field

.field private mCameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

.field private mExpectedFrameRateRange:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mImplementationOptions:Landroidx/camera/core/impl/MutableConfig;

.field private mMutableTagBundle:Landroidx/camera/core/impl/MutableTagBundle;

.field private final mSurfaces:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;"
        }
    .end annotation
.end field

.field private mTemplateType:I

.field private mUseRepeatingSurface:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 227
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 217
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mSurfaces:Ljava/util/Set;

    .line 218
    invoke-static {}, Landroidx/camera/core/impl/MutableOptionsBundle;->create()Landroidx/camera/core/impl/MutableOptionsBundle;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mImplementationOptions:Landroidx/camera/core/impl/MutableConfig;

    .line 219
    const/4 v0, -0x1

    iput v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mTemplateType:I

    .line 220
    sget-object v0, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    iput-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mExpectedFrameRateRange:Landroid/util/Range;

    .line 221
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mCameraCaptureCallbacks:Ljava/util/List;

    .line 222
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mUseRepeatingSurface:Z

    .line 223
    invoke-static {}, Landroidx/camera/core/impl/MutableTagBundle;->create()Landroidx/camera/core/impl/MutableTagBundle;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mMutableTagBundle:Landroidx/camera/core/impl/MutableTagBundle;

    .line 228
    return-void
.end method

.method private constructor <init>(Landroidx/camera/core/impl/CaptureConfig;)V
    .locals 2
    .param p1, "base"    # Landroidx/camera/core/impl/CaptureConfig;

    .line 230
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 217
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mSurfaces:Ljava/util/Set;

    .line 218
    invoke-static {}, Landroidx/camera/core/impl/MutableOptionsBundle;->create()Landroidx/camera/core/impl/MutableOptionsBundle;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mImplementationOptions:Landroidx/camera/core/impl/MutableConfig;

    .line 219
    const/4 v0, -0x1

    iput v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mTemplateType:I

    .line 220
    sget-object v0, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    iput-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mExpectedFrameRateRange:Landroid/util/Range;

    .line 221
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mCameraCaptureCallbacks:Ljava/util/List;

    .line 222
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mUseRepeatingSurface:Z

    .line 223
    invoke-static {}, Landroidx/camera/core/impl/MutableTagBundle;->create()Landroidx/camera/core/impl/MutableTagBundle;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mMutableTagBundle:Landroidx/camera/core/impl/MutableTagBundle;

    .line 231
    iget-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mSurfaces:Ljava/util/Set;

    iget-object v1, p1, Landroidx/camera/core/impl/CaptureConfig;->mSurfaces:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 232
    iget-object v0, p1, Landroidx/camera/core/impl/CaptureConfig;->mImplementationOptions:Landroidx/camera/core/impl/Config;

    invoke-static {v0}, Landroidx/camera/core/impl/MutableOptionsBundle;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/MutableOptionsBundle;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mImplementationOptions:Landroidx/camera/core/impl/MutableConfig;

    .line 233
    iget v0, p1, Landroidx/camera/core/impl/CaptureConfig;->mTemplateType:I

    iput v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mTemplateType:I

    .line 234
    iget-object v0, p1, Landroidx/camera/core/impl/CaptureConfig;->mExpectedFrameRateRange:Landroid/util/Range;

    iput-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mExpectedFrameRateRange:Landroid/util/Range;

    .line 235
    iget-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mCameraCaptureCallbacks:Ljava/util/List;

    invoke-virtual {p1}, Landroidx/camera/core/impl/CaptureConfig;->getCameraCaptureCallbacks()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 236
    invoke-virtual {p1}, Landroidx/camera/core/impl/CaptureConfig;->isUseRepeatingSurface()Z

    move-result v0

    iput-boolean v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mUseRepeatingSurface:Z

    .line 237
    invoke-virtual {p1}, Landroidx/camera/core/impl/CaptureConfig;->getTagBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/MutableTagBundle;->from(Landroidx/camera/core/impl/TagBundle;)Landroidx/camera/core/impl/MutableTagBundle;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mMutableTagBundle:Landroidx/camera/core/impl/MutableTagBundle;

    .line 238
    return-void
.end method

.method public static createFrom(Landroidx/camera/core/impl/UseCaseConfig;)Landroidx/camera/core/impl/CaptureConfig$Builder;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;)",
            "Landroidx/camera/core/impl/CaptureConfig$Builder;"
        }
    .end annotation

    .line 247
    .local p0, "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Landroidx/camera/core/impl/UseCaseConfig;->getCaptureOptionUnpacker(Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;)Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;

    move-result-object v0

    .line 248
    .local v0, "unpacker":Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;
    if-eqz v0, :cond_0

    .line 254
    new-instance v1, Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-direct {v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;-><init>()V

    .line 257
    .local v1, "builder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    invoke-interface {v0, p0, v1}, Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;->unpack(Landroidx/camera/core/impl/UseCaseConfig;Landroidx/camera/core/impl/CaptureConfig$Builder;)V

    .line 258
    return-object v1

    .line 249
    .end local v1    # "builder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Implementation is missing option unpacker for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 251
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v3}, Landroidx/camera/core/impl/UseCaseConfig;->getTargetName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static from(Landroidx/camera/core/impl/CaptureConfig;)Landroidx/camera/core/impl/CaptureConfig$Builder;
    .locals 1
    .param p0, "base"    # Landroidx/camera/core/impl/CaptureConfig;

    .line 264
    new-instance v0, Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-direct {v0, p0}, Landroidx/camera/core/impl/CaptureConfig$Builder;-><init>(Landroidx/camera/core/impl/CaptureConfig;)V

    return-object v0
.end method


# virtual methods
.method public addAllCameraCaptureCallbacks(Ljava/util/Collection;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/impl/CameraCaptureCallback;",
            ">;)V"
        }
    .end annotation

    .line 320
    .local p1, "cameraCaptureCallbacks":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/impl/CameraCaptureCallback;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 321
    .local v1, "c":Landroidx/camera/core/impl/CameraCaptureCallback;
    invoke-virtual {p0, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)V

    .line 322
    .end local v1    # "c":Landroidx/camera/core/impl/CameraCaptureCallback;
    goto :goto_0

    .line 323
    :cond_0
    return-void
.end method

.method public addAllTags(Landroidx/camera/core/impl/TagBundle;)V
    .locals 1
    .param p1, "bundle"    # Landroidx/camera/core/impl/TagBundle;

    .line 418
    iget-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mMutableTagBundle:Landroidx/camera/core/impl/MutableTagBundle;

    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/MutableTagBundle;->addTagBundle(Landroidx/camera/core/impl/TagBundle;)V

    .line 419
    return-void
.end method

.method public addCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)V
    .locals 1
    .param p1, "cameraCaptureCallback"    # Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 309
    iget-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mCameraCaptureCallbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 310
    return-void

    .line 312
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mCameraCaptureCallbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 313
    return-void
.end method

.method public addImplementationOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/camera/core/impl/Config$Option<",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 385
    .local p1, "option":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<TT;>;"
    .local p2, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mImplementationOptions:Landroidx/camera/core/impl/MutableConfig;

    invoke-interface {v0, p1, p2}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 386
    return-void
.end method

.method public addImplementationOptions(Landroidx/camera/core/impl/Config;)V
    .locals 7
    .param p1, "config"    # Landroidx/camera/core/impl/Config;

    .line 364
    invoke-interface {p1}, Landroidx/camera/core/impl/Config;->listOptions()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/Config$Option;

    .line 366
    .local v1, "option":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    move-object v2, v1

    .line 368
    .local v2, "objectOpt":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<Ljava/lang/Object;>;"
    iget-object v3, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mImplementationOptions:Landroidx/camera/core/impl/MutableConfig;

    const/4 v4, 0x0

    invoke-interface {v3, v2, v4}, Landroidx/camera/core/impl/MutableConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 369
    .local v3, "existValue":Ljava/lang/Object;
    invoke-interface {p1, v2}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v4

    .line 370
    .local v4, "newValue":Ljava/lang/Object;
    instance-of v5, v3, Landroidx/camera/core/impl/MultiValueSet;

    if-eqz v5, :cond_0

    .line 371
    move-object v5, v3

    check-cast v5, Landroidx/camera/core/impl/MultiValueSet;

    move-object v6, v4

    check-cast v6, Landroidx/camera/core/impl/MultiValueSet;

    invoke-virtual {v6}, Landroidx/camera/core/impl/MultiValueSet;->getAllItems()Ljava/util/List;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroidx/camera/core/impl/MultiValueSet;->addAll(Ljava/util/List;)V

    goto :goto_1

    .line 373
    :cond_0
    instance-of v5, v4, Landroidx/camera/core/impl/MultiValueSet;

    if-eqz v5, :cond_1

    .line 374
    move-object v5, v4

    check-cast v5, Landroidx/camera/core/impl/MultiValueSet;

    invoke-virtual {v5}, Landroidx/camera/core/impl/MultiValueSet;->clone()Landroidx/camera/core/impl/MultiValueSet;

    move-result-object v4

    .line 376
    :cond_1
    iget-object v5, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mImplementationOptions:Landroidx/camera/core/impl/MutableConfig;

    .line 377
    invoke-interface {p1, v1}, Landroidx/camera/core/impl/Config;->getOptionPriority(Landroidx/camera/core/impl/Config$Option;)Landroidx/camera/core/impl/Config$OptionPriority;

    move-result-object v6

    .line 376
    invoke-interface {v5, v2, v6, v4}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Landroidx/camera/core/impl/Config$OptionPriority;Ljava/lang/Object;)V

    .line 379
    .end local v1    # "option":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    .end local v2    # "objectOpt":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<Ljava/lang/Object;>;"
    .end local v3    # "existValue":Ljava/lang/Object;
    .end local v4    # "newValue":Ljava/lang/Object;
    :goto_1
    goto :goto_0

    .line 380
    :cond_2
    return-void
.end method

.method public addSurface(Landroidx/camera/core/impl/DeferrableSurface;)V
    .locals 1
    .param p1, "surface"    # Landroidx/camera/core/impl/DeferrableSurface;

    .line 338
    iget-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mSurfaces:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 339
    return-void
.end method

.method public addTag(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "tag"    # Ljava/lang/Object;

    .line 411
    iget-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mMutableTagBundle:Landroidx/camera/core/impl/MutableTagBundle;

    invoke-virtual {v0, p1, p2}, Landroidx/camera/core/impl/MutableTagBundle;->putTag(Ljava/lang/String;Ljava/lang/Object;)V

    .line 412
    return-void
.end method

.method public build()Landroidx/camera/core/impl/CaptureConfig;
    .locals 9

    .line 427
    new-instance v0, Landroidx/camera/core/impl/CaptureConfig;

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mSurfaces:Ljava/util/Set;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v2, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mImplementationOptions:Landroidx/camera/core/impl/MutableConfig;

    .line 429
    invoke-static {v2}, Landroidx/camera/core/impl/OptionsBundle;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/OptionsBundle;

    move-result-object v2

    iget v3, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mTemplateType:I

    iget-object v4, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mExpectedFrameRateRange:Landroid/util/Range;

    new-instance v5, Ljava/util/ArrayList;

    iget-object v6, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mCameraCaptureCallbacks:Ljava/util/List;

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-boolean v6, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mUseRepeatingSurface:Z

    iget-object v7, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mMutableTagBundle:Landroidx/camera/core/impl/MutableTagBundle;

    .line 434
    invoke-static {v7}, Landroidx/camera/core/impl/TagBundle;->from(Landroidx/camera/core/impl/TagBundle;)Landroidx/camera/core/impl/TagBundle;

    move-result-object v7

    iget-object v8, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mCameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    invoke-direct/range {v0 .. v8}, Landroidx/camera/core/impl/CaptureConfig;-><init>(Ljava/util/List;Landroidx/camera/core/impl/Config;ILandroid/util/Range;Ljava/util/List;ZLandroidx/camera/core/impl/TagBundle;Landroidx/camera/core/impl/CameraCaptureResult;)V

    .line 427
    return-object v0
.end method

.method public clearSurfaces()V
    .locals 1

    .line 348
    iget-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mSurfaces:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 349
    return-void
.end method

.method public getExpectedFrameRateRange()Landroid/util/Range;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 282
    iget-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mImplementationOptions:Landroidx/camera/core/impl/MutableConfig;

    invoke-static {}, Landroidx/camera/core/impl/CaptureConfig;->access$000()Landroidx/camera/core/impl/Config$Option;

    move-result-object v1

    sget-object v2, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Range;

    return-object v0
.end method

.method public getImplementationOptions()Landroidx/camera/core/impl/Config;
    .locals 1

    .line 390
    iget-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mImplementationOptions:Landroidx/camera/core/impl/MutableConfig;

    return-object v0
.end method

.method public getSurfaces()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;"
        }
    .end annotation

    .line 354
    iget-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mSurfaces:Ljava/util/Set;

    return-object v0
.end method

.method public getTag(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .line 404
    iget-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mMutableTagBundle:Landroidx/camera/core/impl/MutableTagBundle;

    invoke-virtual {v0, p1}, Landroidx/camera/core/impl/MutableTagBundle;->getTag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getTemplateType()I
    .locals 1

    .line 277
    iget v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mTemplateType:I

    return v0
.end method

.method public isUseRepeatingSurface()Z
    .locals 1

    .line 394
    iget-boolean v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mUseRepeatingSurface:Z

    return v0
.end method

.method public removeCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)Z
    .locals 1
    .param p1, "cameraCaptureCallback"    # Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 333
    iget-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mCameraCaptureCallbacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeSurface(Landroidx/camera/core/impl/DeferrableSurface;)V
    .locals 1
    .param p1, "surface"    # Landroidx/camera/core/impl/DeferrableSurface;

    .line 343
    iget-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mSurfaces:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 344
    return-void
.end method

.method public setCameraCaptureResult(Landroidx/camera/core/impl/CameraCaptureResult;)V
    .locals 0
    .param p1, "cameraCaptureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;

    .line 273
    iput-object p1, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mCameraCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    .line 274
    return-void
.end method

.method public setExpectedFrameRateRange(Landroid/util/Range;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 302
    .local p1, "expectedFrameRateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-static {}, Landroidx/camera/core/impl/CaptureConfig;->access$000()Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addImplementationOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 303
    return-void
.end method

.method public setImplementationOptions(Landroidx/camera/core/impl/Config;)V
    .locals 1
    .param p1, "config"    # Landroidx/camera/core/impl/Config;

    .line 358
    invoke-static {p1}, Landroidx/camera/core/impl/MutableOptionsBundle;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/MutableOptionsBundle;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mImplementationOptions:Landroidx/camera/core/impl/MutableConfig;

    .line 359
    return-void
.end method

.method public setTemplateType(I)V
    .locals 0
    .param p1, "templateType"    # I

    .line 293
    iput p1, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mTemplateType:I

    .line 294
    return-void
.end method

.method public setUseRepeatingSurface(Z)V
    .locals 0
    .param p1, "useRepeatingSurface"    # Z

    .line 398
    iput-boolean p1, p0, Landroidx/camera/core/impl/CaptureConfig$Builder;->mUseRepeatingSurface:Z

    .line 399
    return-void
.end method
