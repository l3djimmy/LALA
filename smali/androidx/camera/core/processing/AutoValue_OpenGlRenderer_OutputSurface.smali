.class final Landroidx/camera/core/processing/AutoValue_OpenGlRenderer_OutputSurface;
.super Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;
.source "AutoValue_OpenGlRenderer_OutputSurface.java"


# instance fields
.field private final eglSurface:Landroid/opengl/EGLSurface;

.field private final height:I

.field private final width:I


# direct methods
.method constructor <init>(Landroid/opengl/EGLSurface;II)V
    .locals 2
    .param p1, "eglSurface"    # Landroid/opengl/EGLSurface;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .line 20
    invoke-direct {p0}, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;-><init>()V

    .line 21
    if-eqz p1, :cond_0

    .line 24
    iput-object p1, p0, Landroidx/camera/core/processing/AutoValue_OpenGlRenderer_OutputSurface;->eglSurface:Landroid/opengl/EGLSurface;

    .line 25
    iput p2, p0, Landroidx/camera/core/processing/AutoValue_OpenGlRenderer_OutputSurface;->width:I

    .line 26
    iput p3, p0, Landroidx/camera/core/processing/AutoValue_OpenGlRenderer_OutputSurface;->height:I

    .line 27
    return-void

    .line 22
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null eglSurface"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 56
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 57
    return v0

    .line 59
    :cond_0
    instance-of v1, p1, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 60
    move-object v1, p1

    check-cast v1, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;

    .line 61
    .local v1, "that":Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;
    iget-object v3, p0, Landroidx/camera/core/processing/AutoValue_OpenGlRenderer_OutputSurface;->eglSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v1}, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;->getEglSurface()Landroid/opengl/EGLSurface;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/opengl/EGLSurface;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget v3, p0, Landroidx/camera/core/processing/AutoValue_OpenGlRenderer_OutputSurface;->width:I

    .line 62
    invoke-virtual {v1}, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;->getWidth()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget v3, p0, Landroidx/camera/core/processing/AutoValue_OpenGlRenderer_OutputSurface;->height:I

    .line 63
    invoke-virtual {v1}, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;->getHeight()I

    move-result v4

    if-ne v3, v4, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 61
    :goto_0
    return v0

    .line 65
    .end local v1    # "that":Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;
    :cond_2
    return v2
.end method

.method getEglSurface()Landroid/opengl/EGLSurface;
    .locals 1

    .line 32
    iget-object v0, p0, Landroidx/camera/core/processing/AutoValue_OpenGlRenderer_OutputSurface;->eglSurface:Landroid/opengl/EGLSurface;

    return-object v0
.end method

.method getHeight()I
    .locals 1

    .line 42
    iget v0, p0, Landroidx/camera/core/processing/AutoValue_OpenGlRenderer_OutputSurface;->height:I

    return v0
.end method

.method getWidth()I
    .locals 1

    .line 37
    iget v0, p0, Landroidx/camera/core/processing/AutoValue_OpenGlRenderer_OutputSurface;->width:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 70
    const/4 v0, 0x1

    .line 71
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 72
    iget-object v2, p0, Landroidx/camera/core/processing/AutoValue_OpenGlRenderer_OutputSurface;->eglSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v2}, Landroid/opengl/EGLSurface;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 73
    mul-int/2addr v0, v1

    .line 74
    iget v2, p0, Landroidx/camera/core/processing/AutoValue_OpenGlRenderer_OutputSurface;->width:I

    xor-int/2addr v0, v2

    .line 75
    mul-int/2addr v0, v1

    .line 76
    iget v1, p0, Landroidx/camera/core/processing/AutoValue_OpenGlRenderer_OutputSurface;->height:I

    xor-int/2addr v0, v1

    .line 77
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "OutputSurface{eglSurface="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/processing/AutoValue_OpenGlRenderer_OutputSurface;->eglSurface:Landroid/opengl/EGLSurface;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", width="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/processing/AutoValue_OpenGlRenderer_OutputSurface;->width:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", height="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/processing/AutoValue_OpenGlRenderer_OutputSurface;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
