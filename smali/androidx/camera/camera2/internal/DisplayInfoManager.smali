.class public Landroidx/camera/camera2/internal/DisplayInfoManager;
.super Ljava/lang/Object;
.source "DisplayInfoManager.java"


# static fields
.field private static final ABNORMAL_DISPLAY_SIZE_THRESHOLD:Landroid/util/Size;

.field private static final FALLBACK_DISPLAY_SIZE:Landroid/util/Size;

.field private static final INSTANCE_LOCK:Ljava/lang/Object;

.field private static final MAX_PREVIEW_SIZE:Landroid/util/Size;

.field private static volatile sInstance:Landroidx/camera/camera2/internal/DisplayInfoManager;


# instance fields
.field private final mDisplayManager:Landroid/hardware/display/DisplayManager;

.field private final mDisplaySizeCorrector:Landroidx/camera/camera2/internal/compat/workaround/DisplaySizeCorrector;

.field private final mMaxPreviewSize:Landroidx/camera/camera2/internal/compat/workaround/MaxPreviewSize;

.field private volatile mPreviewSize:Landroid/util/Size;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 38
    new-instance v0, Landroid/util/Size;

    const/16 v1, 0x780

    const/16 v2, 0x438

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    sput-object v0, Landroidx/camera/camera2/internal/DisplayInfoManager;->MAX_PREVIEW_SIZE:Landroid/util/Size;

    .line 42
    new-instance v0, Landroid/util/Size;

    const/16 v1, 0x140

    const/16 v2, 0xf0

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    sput-object v0, Landroidx/camera/camera2/internal/DisplayInfoManager;->ABNORMAL_DISPLAY_SIZE_THRESHOLD:Landroid/util/Size;

    .line 47
    new-instance v0, Landroid/util/Size;

    const/16 v1, 0x280

    const/16 v2, 0x1e0

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    sput-object v0, Landroidx/camera/camera2/internal/DisplayInfoManager;->FALLBACK_DISPLAY_SIZE:Landroid/util/Size;

    .line 48
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroidx/camera/camera2/internal/DisplayInfoManager;->INSTANCE_LOCK:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/camera2/internal/DisplayInfoManager;->mPreviewSize:Landroid/util/Size;

    .line 53
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/MaxPreviewSize;

    invoke-direct {v0}, Landroidx/camera/camera2/internal/compat/workaround/MaxPreviewSize;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/DisplayInfoManager;->mMaxPreviewSize:Landroidx/camera/camera2/internal/compat/workaround/MaxPreviewSize;

    .line 54
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/DisplaySizeCorrector;

    invoke-direct {v0}, Landroidx/camera/camera2/internal/compat/workaround/DisplaySizeCorrector;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/DisplayInfoManager;->mDisplaySizeCorrector:Landroidx/camera/camera2/internal/compat/workaround/DisplaySizeCorrector;

    .line 57
    const-string/jumbo v0, "display"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/display/DisplayManager;

    iput-object v0, p0, Landroidx/camera/camera2/internal/DisplayInfoManager;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    .line 58
    return-void
.end method

.method private calculatePreviewSize()Landroid/util/Size;
    .locals 4

    .line 160
    invoke-direct {p0}, Landroidx/camera/camera2/internal/DisplayInfoManager;->getCorrectedDisplaySize()Landroid/util/Size;

    move-result-object v0

    .line 161
    .local v0, "displayViewSize":Landroid/util/Size;
    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v2

    mul-int/2addr v1, v2

    sget-object v2, Landroidx/camera/camera2/internal/DisplayInfoManager;->MAX_PREVIEW_SIZE:Landroid/util/Size;

    .line 162
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v2

    sget-object v3, Landroidx/camera/camera2/internal/DisplayInfoManager;->MAX_PREVIEW_SIZE:Landroid/util/Size;

    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    move-result v3

    mul-int/2addr v2, v3

    if-le v1, v2, :cond_0

    .line 163
    sget-object v0, Landroidx/camera/camera2/internal/DisplayInfoManager;->MAX_PREVIEW_SIZE:Landroid/util/Size;

    .line 165
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/DisplayInfoManager;->mMaxPreviewSize:Landroidx/camera/camera2/internal/compat/workaround/MaxPreviewSize;

    invoke-virtual {v1, v0}, Landroidx/camera/camera2/internal/compat/workaround/MaxPreviewSize;->getMaxPreviewResolution(Landroid/util/Size;)Landroid/util/Size;

    move-result-object v1

    return-object v1
.end method

.method private getCorrectedDisplaySize()Landroid/util/Size;
    .locals 6

    .line 171
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 176
    .local v0, "displaySize":Landroid/graphics/Point;
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroidx/camera/camera2/internal/DisplayInfoManager;->getMaxSizeDisplay(Z)Landroid/view/Display;

    move-result-object v1

    .line 177
    .local v1, "display":Landroid/view/Display;
    invoke-virtual {v1, v0}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 178
    new-instance v2, Landroid/util/Size;

    iget v3, v0, Landroid/graphics/Point;->x:I

    iget v4, v0, Landroid/graphics/Point;->y:I

    invoke-direct {v2, v3, v4}, Landroid/util/Size;-><init>(II)V

    .line 181
    .local v2, "displayViewSize":Landroid/util/Size;
    sget-object v3, Landroidx/camera/camera2/internal/DisplayInfoManager;->ABNORMAL_DISPLAY_SIZE_THRESHOLD:Landroid/util/Size;

    invoke-static {v2, v3}, Landroidx/camera/core/internal/utils/SizeUtil;->isSmallerByArea(Landroid/util/Size;Landroid/util/Size;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 184
    iget-object v3, p0, Landroidx/camera/camera2/internal/DisplayInfoManager;->mDisplaySizeCorrector:Landroidx/camera/camera2/internal/compat/workaround/DisplaySizeCorrector;

    invoke-virtual {v3}, Landroidx/camera/camera2/internal/compat/workaround/DisplaySizeCorrector;->getDisplaySize()Landroid/util/Size;

    move-result-object v2

    .line 188
    if-nez v2, :cond_0

    .line 189
    sget-object v2, Landroidx/camera/camera2/internal/DisplayInfoManager;->FALLBACK_DISPLAY_SIZE:Landroid/util/Size;

    .line 194
    :cond_0
    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v3

    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v4

    if-le v3, v4, :cond_1

    .line 195
    new-instance v3, Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v4

    .line 196
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    move-result v5

    invoke-direct {v3, v4, v5}, Landroid/util/Size;-><init>(II)V

    move-object v2, v3

    .line 199
    :cond_1
    return-object v2
.end method

.method public static getInstance(Landroid/content/Context;)Landroidx/camera/camera2/internal/DisplayInfoManager;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 65
    sget-object v0, Landroidx/camera/camera2/internal/DisplayInfoManager;->sInstance:Landroidx/camera/camera2/internal/DisplayInfoManager;

    if-nez v0, :cond_1

    .line 66
    sget-object v0, Landroidx/camera/camera2/internal/DisplayInfoManager;->INSTANCE_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 67
    :try_start_0
    sget-object v1, Landroidx/camera/camera2/internal/DisplayInfoManager;->sInstance:Landroidx/camera/camera2/internal/DisplayInfoManager;

    if-nez v1, :cond_0

    .line 68
    new-instance v1, Landroidx/camera/camera2/internal/DisplayInfoManager;

    invoke-direct {v1, p0}, Landroidx/camera/camera2/internal/DisplayInfoManager;-><init>(Landroid/content/Context;)V

    sput-object v1, Landroidx/camera/camera2/internal/DisplayInfoManager;->sInstance:Landroidx/camera/camera2/internal/DisplayInfoManager;

    .line 70
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 72
    :cond_1
    :goto_0
    sget-object v0, Landroidx/camera/camera2/internal/DisplayInfoManager;->sInstance:Landroidx/camera/camera2/internal/DisplayInfoManager;

    return-object v0
.end method

.method private getMaxSizeDisplayInternal([Landroid/view/Display;Z)Landroid/view/Display;
    .locals 8
    .param p1, "displays"    # [Landroid/view/Display;
    .param p2, "skipStateOffDisplay"    # Z

    .line 124
    const/4 v0, 0x0

    .line 125
    .local v0, "maxDisplay":Landroid/view/Display;
    const/4 v1, -0x1

    .line 127
    .local v1, "maxDisplaySize":I
    array-length v2, p1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, p1, v3

    .line 129
    .local v4, "display":Landroid/view/Display;
    if-eqz p2, :cond_0

    invoke-virtual {v4}, Landroid/view/Display;->getState()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_0

    .line 130
    goto :goto_1

    .line 133
    :cond_0
    new-instance v5, Landroid/graphics/Point;

    invoke-direct {v5}, Landroid/graphics/Point;-><init>()V

    .line 134
    .local v5, "displaySize":Landroid/graphics/Point;
    invoke-virtual {v4, v5}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 135
    iget v6, v5, Landroid/graphics/Point;->x:I

    iget v7, v5, Landroid/graphics/Point;->y:I

    mul-int/2addr v6, v7

    if-le v6, v1, :cond_1

    .line 136
    iget v6, v5, Landroid/graphics/Point;->x:I

    iget v7, v5, Landroid/graphics/Point;->y:I

    mul-int/2addr v6, v7

    .line 137
    .end local v1    # "maxDisplaySize":I
    .local v6, "maxDisplaySize":I
    move-object v0, v4

    move v1, v6

    .line 127
    .end local v4    # "display":Landroid/view/Display;
    .end local v5    # "displaySize":Landroid/graphics/Point;
    .end local v6    # "maxDisplaySize":I
    .restart local v1    # "maxDisplaySize":I
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 141
    :cond_2
    return-object v0
.end method

.method static releaseInstance()V
    .locals 1

    .line 80
    const/4 v0, 0x0

    sput-object v0, Landroidx/camera/camera2/internal/DisplayInfoManager;->sInstance:Landroidx/camera/camera2/internal/DisplayInfoManager;

    .line 81
    return-void
.end method


# virtual methods
.method public getMaxSizeDisplay(Z)Landroid/view/Display;
    .locals 4
    .param p1, "skipStateOffDisplay"    # Z

    .line 97
    iget-object v0, p0, Landroidx/camera/camera2/internal/DisplayInfoManager;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    invoke-virtual {v0}, Landroid/hardware/display/DisplayManager;->getDisplays()[Landroid/view/Display;

    move-result-object v0

    .line 98
    .local v0, "displays":[Landroid/view/Display;
    array-length v1, v0

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v1, v2, :cond_0

    .line 99
    aget-object v1, v0, v3

    return-object v1

    .line 103
    :cond_0
    invoke-direct {p0, v0, p1}, Landroidx/camera/camera2/internal/DisplayInfoManager;->getMaxSizeDisplayInternal([Landroid/view/Display;Z)Landroid/view/Display;

    move-result-object v1

    .line 107
    .local v1, "maxDisplay":Landroid/view/Display;
    if-nez v1, :cond_1

    if-eqz p1, :cond_1

    .line 108
    invoke-direct {p0, v0, v3}, Landroidx/camera/camera2/internal/DisplayInfoManager;->getMaxSizeDisplayInternal([Landroid/view/Display;Z)Landroid/view/Display;

    move-result-object v1

    .line 112
    :cond_1
    if-eqz v1, :cond_2

    .line 117
    return-object v1

    .line 113
    :cond_2
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "No display can be found from the input display manager!"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method getPreviewSize()Landroid/util/Size;
    .locals 1

    .line 151
    iget-object v0, p0, Landroidx/camera/camera2/internal/DisplayInfoManager;->mPreviewSize:Landroid/util/Size;

    if-eqz v0, :cond_0

    .line 152
    iget-object v0, p0, Landroidx/camera/camera2/internal/DisplayInfoManager;->mPreviewSize:Landroid/util/Size;

    return-object v0

    .line 155
    :cond_0
    invoke-direct {p0}, Landroidx/camera/camera2/internal/DisplayInfoManager;->calculatePreviewSize()Landroid/util/Size;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/DisplayInfoManager;->mPreviewSize:Landroid/util/Size;

    .line 156
    iget-object v0, p0, Landroidx/camera/camera2/internal/DisplayInfoManager;->mPreviewSize:Landroid/util/Size;

    return-object v0
.end method

.method refresh()V
    .locals 1

    .line 87
    invoke-direct {p0}, Landroidx/camera/camera2/internal/DisplayInfoManager;->calculatePreviewSize()Landroid/util/Size;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/DisplayInfoManager;->mPreviewSize:Landroid/util/Size;

    .line 88
    return-void
.end method
