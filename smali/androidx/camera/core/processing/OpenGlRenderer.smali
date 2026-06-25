.class public final Landroidx/camera/core/processing/OpenGlRenderer;
.super Ljava/lang/Object;
.source "OpenGlRenderer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;
    }
.end annotation


# static fields
.field private static final DEFAULT_FRAGMENT_SHADER:Ljava/lang/String;

.field private static final DEFAULT_VERTEX_SHADER:Ljava/lang/String;

.field private static final HDR_FRAGMENT_SHADER:Ljava/lang/String;

.field private static final HDR_VERTEX_SHADER:Ljava/lang/String;

.field private static final NO_OUTPUT_SURFACE:Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;

.field private static final PIXEL_STRIDE:I = 0x4

.field private static final SIZEOF_FLOAT:I = 0x4

.field private static final TAG:Ljava/lang/String; = "OpenGlRenderer"

.field private static final TEX_BUF:Ljava/nio/FloatBuffer;

.field private static final TEX_COORDS:[F

.field private static final VAR_TEXTURE:Ljava/lang/String; = "sTexture"

.field private static final VAR_TEXTURE_COORD:Ljava/lang/String; = "vTextureCoord"

.field private static final VERTEX_BUF:Ljava/nio/FloatBuffer;

.field private static final VERTEX_COORDS:[F


# instance fields
.field private mCurrentSurface:Landroid/view/Surface;

.field private mEglConfig:Landroid/opengl/EGLConfig;

.field private mEglContext:Landroid/opengl/EGLContext;

.field private mEglDisplay:Landroid/opengl/EGLDisplay;

.field private mExternalTextureId:I

.field private mGlThread:Ljava/lang/Thread;

.field private final mInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final mOutputSurfaceMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/Surface;",
            "Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;",
            ">;"
        }
    .end annotation
.end field

.field private mPositionLoc:I

.field private mProgramHandle:I

.field private mTempSurface:Landroid/opengl/EGLSurface;

.field private mTexCoordLoc:I

.field private mTexMatrixLoc:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 75
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v1, "vTextureCoord"

    filled-new-array {v1, v1}, [Ljava/lang/Object;

    move-result-object v2

    const-string/jumbo v3, "uniform mat4 uTexMatrix;\nattribute vec4 aPosition;\nattribute vec4 aTextureCoord;\nvarying vec2 %s;\nvoid main() {\n    gl_Position = aPosition;\n    %s = (uTexMatrix * aTextureCoord).xy;\n}\n"

    invoke-static {v0, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/processing/OpenGlRenderer;->DEFAULT_VERTEX_SHADER:Ljava/lang/String;

    .line 85
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "#version 300 es\nin vec4 aPosition;\nin vec4 aTextureCoord;\nuniform mat4 uTexMatrix;\nout vec2 %s;\nvoid main() {\n  gl_Position = aPosition;\n  %s = (uTexMatrix * aTextureCoord).xy;\n}\n"

    filled-new-array {v1, v1}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v0, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/processing/OpenGlRenderer;->HDR_VERTEX_SHADER:Ljava/lang/String;

    .line 96
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v2, "sTexture"

    filled-new-array {v1, v2, v2, v1}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;\nvarying vec2 %s;\nuniform samplerExternalOES %s;\nvoid main() {\n    gl_FragColor = texture2D(%s, %s);\n}\n"

    invoke-static {v0, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/processing/OpenGlRenderer;->DEFAULT_FRAGMENT_SHADER:Ljava/lang/String;

    .line 105
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "#version 300 es\n#extension GL_OES_EGL_image_external : require\n#extension GL_EXT_YUV_target : require\nprecision mediump float;\nuniform __samplerExternal2DY2YEXT %s;\nin vec2 %s;\nout vec4 outColor;\n\nvec3 yuvToRgb(vec3 yuv) {\n  const vec3 yuvOffset = vec3(0.0625, 0.5, 0.5);\n  const mat3 yuvToRgbColorTransform = mat3(\n    1.1689f, 1.1689f, 1.1689f,\n    0.0000f, -0.1881f, 2.1502f,\n    1.6853f, -0.6530f, 0.0000f\n  );\n  return clamp(yuvToRgbColorTransform * (yuv - yuvOffset), 0.0, 1.0);\n}\n\nvoid main() {\n  vec3 srcYuv = texture(%s, %s).xyz;\n  outColor = vec4(yuvToRgb(srcYuv), 1.0);\n}"

    filled-new-array {v2, v1, v2, v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v3, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/processing/OpenGlRenderer;->HDR_FRAGMENT_SHADER:Ljava/lang/String;

    .line 130
    const/16 v0, 0x8

    new-array v1, v0, [F

    fill-array-data v1, :array_0

    sput-object v1, Landroidx/camera/core/processing/OpenGlRenderer;->VERTEX_COORDS:[F

    .line 136
    sget-object v1, Landroidx/camera/core/processing/OpenGlRenderer;->VERTEX_COORDS:[F

    invoke-static {v1}, Landroidx/camera/core/processing/OpenGlRenderer;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    move-result-object v1

    sput-object v1, Landroidx/camera/core/processing/OpenGlRenderer;->VERTEX_BUF:Ljava/nio/FloatBuffer;

    .line 138
    new-array v0, v0, [F

    fill-array-data v0, :array_1

    sput-object v0, Landroidx/camera/core/processing/OpenGlRenderer;->TEX_COORDS:[F

    .line 144
    sget-object v0, Landroidx/camera/core/processing/OpenGlRenderer;->TEX_COORDS:[F

    invoke-static {v0}, Landroidx/camera/core/processing/OpenGlRenderer;->createFloatBuffer([F)Ljava/nio/FloatBuffer;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/processing/OpenGlRenderer;->TEX_BUF:Ljava/nio/FloatBuffer;

    .line 147
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 148
    const/4 v1, 0x0

    invoke-static {v0, v1, v1}, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;->of(Landroid/opengl/EGLSurface;II)Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/processing/OpenGlRenderer;->NO_OUTPUT_SURFACE:Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;

    .line 147
    return-void

    nop

    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 151
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mOutputSurfaceMap:Ljava/util/Map;

    .line 155
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    .line 157
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglContext:Landroid/opengl/EGLContext;

    .line 161
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mTempSurface:Landroid/opengl/EGLSurface;

    .line 165
    const/4 v0, -0x1

    iput v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mExternalTextureId:I

    .line 166
    iput v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mProgramHandle:I

    .line 167
    iput v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mTexMatrixLoc:I

    .line 168
    iput v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mPositionLoc:I

    .line 169
    iput v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mTexCoordLoc:I

    return-void
.end method

.method private static checkEglErrorOrLog(Ljava/lang/String;)V
    .locals 3
    .param p0, "op"    # Ljava/lang/String;

    .line 850
    :try_start_0
    invoke-static {p0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkEglErrorOrThrow(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 853
    goto :goto_0

    .line 851
    :catch_0
    move-exception v0

    .line 852
    .local v0, "e":Ljava/lang/IllegalStateException;
    const-string v1, "OpenGlRenderer"

    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 854
    .end local v0    # "e":Ljava/lang/IllegalStateException;
    :goto_0
    return-void
.end method

.method private static checkEglErrorOrThrow(Ljava/lang/String;)V
    .locals 4
    .param p0, "op"    # Ljava/lang/String;

    .line 842
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result v0

    .line 843
    .local v0, "error":I
    const/16 v1, 0x3000

    if-ne v0, v1, :cond_0

    .line 846
    return-void

    .line 844
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": EGL error: 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static checkGlErrorOrThrow(Ljava/lang/String;)V
    .locals 4
    .param p0, "op"    # Ljava/lang/String;

    .line 857
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v0

    .line 858
    .local v0, "error":I
    if-nez v0, :cond_0

    .line 861
    return-void

    .line 859
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": GL error 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private checkGlThreadOrThrow()V
    .locals 2

    .line 716
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mGlThread:Ljava/lang/Thread;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Method call must be called on the GL thread."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 718
    return-void
.end method

.method private checkInitializedOrThrow(Z)V
    .locals 2
    .param p1, "shouldInitialized"    # Z

    .line 709
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 710
    .local v0, "result":Z
    :goto_0
    if-eqz p1, :cond_1

    const-string v1, "OpenGlRenderer is not initialized"

    goto :goto_1

    .line 711
    :cond_1
    const-string v1, "OpenGlRenderer is already initialized"

    :goto_1
    nop

    .line 712
    .local v1, "message":Ljava/lang/String;
    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 713
    return-void
.end method

.method private static checkLocationOrThrow(ILjava/lang/String;)V
    .locals 3
    .param p0, "location"    # I
    .param p1, "label"    # Ljava/lang/String;

    .line 836
    if-ltz p0, :cond_0

    .line 839
    return-void

    .line 837
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unable to locate \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' in program"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private createEglContext(Landroidx/camera/core/DynamicRange;)V
    .locals 31
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 462
    move-object/from16 v0, p0

    const/4 v1, 0x0

    invoke-static {v1}, Landroid/opengl/EGL14;->eglGetDisplay(I)Landroid/opengl/EGLDisplay;

    move-result-object v2

    iput-object v2, v0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    .line 463
    iget-object v2, v0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 466
    const/4 v2, 0x2

    new-array v3, v2, [I

    .line 467
    .local v3, "version":[I
    iget-object v4, v0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    const/4 v5, 0x1

    invoke-static {v4, v3, v1, v3, v5}, Landroid/opengl/EGL14;->eglInitialize(Landroid/opengl/EGLDisplay;[II[II)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 471
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/core/DynamicRange;->is10BitHdr()Z

    move-result v4

    const/16 v6, 0x8

    if-eqz v4, :cond_0

    const/16 v4, 0xa

    goto :goto_0

    :cond_0
    move v4, v6

    :goto_0
    move v8, v4

    .line 472
    .local v8, "rgbBits":I
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/core/DynamicRange;->is10BitHdr()Z

    move-result v4

    if-eqz v4, :cond_1

    move v14, v2

    goto :goto_1

    :cond_1
    move v14, v6

    .line 473
    .local v14, "alphaBits":I
    :goto_1
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/core/DynamicRange;->is10BitHdr()Z

    move-result v4

    if-eqz v4, :cond_2

    const/16 v4, 0x40

    move/from16 v20, v4

    goto :goto_2

    .line 474
    :cond_2
    const/4 v4, 0x4

    move/from16 v20, v4

    :goto_2
    nop

    .line 476
    .local v20, "renderType":I
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/core/DynamicRange;->is10BitHdr()Z

    move-result v4

    xor-int/lit8 v22, v4, 0x1

    .line 477
    .local v22, "recordableAndroid":I
    const/16 v24, 0x5

    const/16 v25, 0x3038

    const/16 v7, 0x3024

    const/16 v9, 0x3023

    const/16 v11, 0x3022

    const/16 v13, 0x3021

    const/16 v15, 0x3025

    const/16 v16, 0x0

    const/16 v17, 0x3026

    const/16 v18, 0x0

    const/16 v19, 0x3040

    const/16 v21, 0x3142

    const/16 v23, 0x3033

    move v10, v8

    move v12, v8

    filled-new-array/range {v7 .. v25}, [I

    move-result-object v4

    move-object/from16 v24, v4

    .line 489
    .local v24, "attribToChooseConfig":[I
    new-array v4, v5, [Landroid/opengl/EGLConfig;

    .line 490
    .local v4, "configs":[Landroid/opengl/EGLConfig;
    new-array v6, v5, [I

    .line 491
    .local v6, "numConfigs":[I
    iget-object v7, v0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    array-length v9, v4

    const/16 v30, 0x0

    const/16 v25, 0x0

    const/16 v27, 0x0

    move-object/from16 v26, v4

    move-object/from16 v29, v6

    move-object/from16 v23, v7

    move/from16 v28, v9

    .end local v4    # "configs":[Landroid/opengl/EGLConfig;
    .end local v6    # "numConfigs":[I
    .local v26, "configs":[Landroid/opengl/EGLConfig;
    .local v29, "numConfigs":[I
    invoke-static/range {v23 .. v30}, Landroid/opengl/EGL14;->eglChooseConfig(Landroid/opengl/EGLDisplay;[II[Landroid/opengl/EGLConfig;II[II)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 495
    aget-object v4, v26, v1

    .line 496
    .local v4, "config":Landroid/opengl/EGLConfig;
    nop

    .line 497
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/core/DynamicRange;->is10BitHdr()Z

    move-result v6

    if-eqz v6, :cond_3

    const/4 v2, 0x3

    :cond_3
    const/16 v6, 0x3038

    const/16 v7, 0x3098

    filled-new-array {v7, v2, v6}, [I

    move-result-object v2

    .line 500
    .local v2, "attribToCreateContext":[I
    iget-object v6, v0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    sget-object v9, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    invoke-static {v6, v4, v9, v2, v1}, Landroid/opengl/EGL14;->eglCreateContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/opengl/EGLContext;[II)Landroid/opengl/EGLContext;

    move-result-object v6

    .line 502
    .local v6, "context":Landroid/opengl/EGLContext;
    const-string/jumbo v9, "eglCreateContext"

    invoke-static {v9}, Landroidx/camera/core/processing/OpenGlRenderer;->checkEglErrorOrThrow(Ljava/lang/String;)V

    .line 503
    iput-object v4, v0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglConfig:Landroid/opengl/EGLConfig;

    .line 504
    iput-object v6, v0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglContext:Landroid/opengl/EGLContext;

    .line 507
    new-array v5, v5, [I

    .line 508
    .local v5, "values":[I
    iget-object v9, v0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    iget-object v10, v0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglContext:Landroid/opengl/EGLContext;

    invoke-static {v9, v10, v7, v5, v1}, Landroid/opengl/EGL14;->eglQueryContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;I[II)Z

    .line 510
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "EGLContext created, client version "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    aget v1, v5, v1

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v7, "OpenGlRenderer"

    invoke-static {v7, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 511
    return-void

    .line 493
    .end local v2    # "attribToCreateContext":[I
    .end local v4    # "config":Landroid/opengl/EGLConfig;
    .end local v5    # "values":[I
    .end local v6    # "context":Landroid/opengl/EGLContext;
    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Unable to find a suitable EGLConfig"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 468
    .end local v8    # "rgbBits":I
    .end local v14    # "alphaBits":I
    .end local v20    # "renderType":I
    .end local v22    # "recordableAndroid":I
    .end local v24    # "attribToChooseConfig":[I
    .end local v26    # "configs":[Landroid/opengl/EGLConfig;
    .end local v29    # "numConfigs":[I
    :cond_5
    sget-object v1, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v1, v0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    .line 469
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Unable to initialize EGL14"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 464
    .end local v3    # "version":[I
    :cond_6
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Unable to get EGL14 display"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static createFloatBuffer([F)Ljava/nio/FloatBuffer;
    .locals 3
    .param p0, "coords"    # [F

    .line 827
    array-length v0, p0

    mul-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 828
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 829
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v1

    .line 830
    .local v1, "fb":Ljava/nio/FloatBuffer;
    invoke-virtual {v1, p0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 831
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 832
    return-object v1
.end method

.method private createOutputSurfaceInternal(Landroid/view/Surface;)Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;
    .locals 4
    .param p1, "surface"    # Landroid/view/Surface;

    .line 750
    :try_start_0
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglConfig:Landroid/opengl/EGLConfig;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/opengl/EGLConfig;

    invoke-static {v0, v1, p1}, Landroidx/camera/core/processing/OpenGlRenderer;->createWindowSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/view/Surface;)Landroid/opengl/EGLSurface;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 754
    .local v0, "eglSurface":Landroid/opengl/EGLSurface;
    nop

    .line 756
    invoke-direct {p0, v0}, Landroidx/camera/core/processing/OpenGlRenderer;->getSurfaceSize(Landroid/opengl/EGLSurface;)Landroid/util/Size;

    move-result-object v1

    .line 757
    .local v1, "size":Landroid/util/Size;
    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v2

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v3

    invoke-static {v0, v2, v3}, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;->of(Landroid/opengl/EGLSurface;II)Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;

    move-result-object v2

    return-object v2

    .line 751
    .end local v0    # "eglSurface":Landroid/opengl/EGLSurface;
    .end local v1    # "size":Landroid/util/Size;
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 752
    .local v0, "e":Ljava/lang/RuntimeException;
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to create EGL surface: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "OpenGlRenderer"

    invoke-static {v2, v1, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 753
    const/4 v1, 0x0

    return-object v1
.end method

.method private static createPBufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;II)Landroid/opengl/EGLSurface;
    .locals 4
    .param p0, "eglDisplay"    # Landroid/opengl/EGLDisplay;
    .param p1, "eglConfig"    # Landroid/opengl/EGLConfig;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .line 732
    const/16 v0, 0x3056

    const/16 v1, 0x3038

    const/16 v2, 0x3057

    filled-new-array {v2, p2, v0, p3, v1}, [I

    move-result-object v0

    .line 737
    .local v0, "surfaceAttrib":[I
    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Landroid/opengl/EGL14;->eglCreatePbufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;[II)Landroid/opengl/EGLSurface;

    move-result-object v1

    .line 739
    .local v1, "eglSurface":Landroid/opengl/EGLSurface;
    const-string/jumbo v2, "eglCreatePbufferSurface"

    invoke-static {v2}, Landroidx/camera/core/processing/OpenGlRenderer;->checkEglErrorOrThrow(Ljava/lang/String;)V

    .line 740
    if-eqz v1, :cond_0

    .line 743
    return-object v1

    .line 741
    :cond_0
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string/jumbo v3, "surface was null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private createProgram(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/processing/ShaderProvider;)V
    .locals 7
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .param p2, "shaderProvider"    # Landroidx/camera/core/processing/ShaderProvider;

    .line 528
    const-string/jumbo v0, "glAttachShader"

    const/4 v1, -0x1

    .line 529
    .local v1, "vertexShader":I
    const/4 v2, -0x1

    .line 530
    .local v2, "fragmentShader":I
    const/4 v3, -0x1

    .line 532
    .local v3, "program":I
    nop

    .line 533
    :try_start_0
    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->is10BitHdr()Z

    move-result v4

    if-eqz v4, :cond_0

    sget-object v4, Landroidx/camera/core/processing/OpenGlRenderer;->HDR_VERTEX_SHADER:Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object v4, Landroidx/camera/core/processing/OpenGlRenderer;->DEFAULT_VERTEX_SHADER:Ljava/lang/String;

    .line 532
    :goto_0
    const v5, 0x8b31

    invoke-static {v5, v4}, Landroidx/camera/core/processing/OpenGlRenderer;->loadShader(ILjava/lang/String;)I

    move-result v4

    move v1, v4

    .line 534
    invoke-direct {p0, p1, p2}, Landroidx/camera/core/processing/OpenGlRenderer;->loadFragmentShader(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/processing/ShaderProvider;)I

    move-result v4

    move v2, v4

    .line 535
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result v4

    move v3, v4

    .line 536
    const-string/jumbo v4, "glCreateProgram"

    invoke-static {v4}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 537
    invoke-static {v3, v1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 538
    invoke-static {v0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 539
    invoke-static {v3, v2}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 540
    invoke-static {v0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 541
    invoke-static {v3}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 542
    const/4 v0, 0x1

    new-array v4, v0, [I

    .line 543
    .local v4, "linkStatus":[I
    const v5, 0x8b82

    const/4 v6, 0x0

    invoke-static {v3, v5, v4, v6}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 544
    aget v5, v4, v6

    if-ne v5, v0, :cond_1

    .line 548
    iput v3, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mProgramHandle:I

    .line 560
    .end local v4    # "linkStatus":[I
    nop

    .line 561
    return-void

    .line 545
    .restart local v4    # "linkStatus":[I
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Could not link program: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 546
    invoke-static {v3}, Landroid/opengl/GLES20;->glGetProgramInfoLog(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v1    # "vertexShader":I
    .end local v2    # "fragmentShader":I
    .end local v3    # "program":I
    .end local p1    # "dynamicRange":Landroidx/camera/core/DynamicRange;
    .end local p2    # "shaderProvider":Landroidx/camera/core/processing/ShaderProvider;
    throw v0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 549
    .end local v4    # "linkStatus":[I
    .restart local v1    # "vertexShader":I
    .restart local v2    # "fragmentShader":I
    .restart local v3    # "program":I
    .restart local p1    # "dynamicRange":Landroidx/camera/core/DynamicRange;
    .restart local p2    # "shaderProvider":Landroidx/camera/core/processing/ShaderProvider;
    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    .line 550
    .local v0, "e":Ljava/lang/RuntimeException;
    :goto_1
    const/4 v4, -0x1

    if-eq v1, v4, :cond_2

    .line 551
    invoke-static {v1}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 553
    :cond_2
    if-eq v2, v4, :cond_3

    .line 554
    invoke-static {v2}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 556
    :cond_3
    if-eq v3, v4, :cond_4

    .line 557
    invoke-static {v3}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 559
    :cond_4
    throw v0
.end method

.method private createTempSurface()V
    .locals 3

    .line 514
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglConfig:Landroid/opengl/EGLConfig;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/opengl/EGLConfig;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2, v2}, Landroidx/camera/core/processing/OpenGlRenderer;->createPBufferSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;II)Landroid/opengl/EGLSurface;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mTempSurface:Landroid/opengl/EGLSurface;

    .line 516
    return-void
.end method

.method private createTexture()V
    .locals 5

    .line 605
    const/4 v0, 0x1

    new-array v1, v0, [I

    .line 606
    .local v1, "textures":[I
    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 607
    const-string/jumbo v0, "glGenTextures"

    invoke-static {v0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 609
    aget v0, v1, v2

    .line 610
    .local v0, "texId":I
    const v2, 0x8d65

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 611
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "glBindTexture "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 613
    const/16 v3, 0x2801

    const/high16 v4, 0x46180000    # 9728.0f

    invoke-static {v2, v3, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 615
    const/16 v3, 0x2800

    const v4, 0x46180400    # 9729.0f

    invoke-static {v2, v3, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 617
    const/16 v3, 0x2802

    const v4, 0x812f

    invoke-static {v2, v3, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 619
    const/16 v3, 0x2803

    invoke-static {v2, v3, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 621
    const-string/jumbo v2, "glTexParameter"

    invoke-static {v2}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 623
    iput v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mExternalTextureId:I

    .line 624
    return-void
.end method

.method private static createWindowSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Landroid/view/Surface;)Landroid/opengl/EGLSurface;
    .locals 4
    .param p0, "eglDisplay"    # Landroid/opengl/EGLDisplay;
    .param p1, "eglConfig"    # Landroid/opengl/EGLConfig;
    .param p2, "surface"    # Landroid/view/Surface;

    .line 789
    const/16 v0, 0x3038

    filled-new-array {v0}, [I

    move-result-object v0

    .line 792
    .local v0, "surfaceAttrib":[I
    const/4 v1, 0x0

    invoke-static {p0, p1, p2, v0, v1}, Landroid/opengl/EGL14;->eglCreateWindowSurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLConfig;Ljava/lang/Object;[II)Landroid/opengl/EGLSurface;

    move-result-object v1

    .line 794
    .local v1, "eglSurface":Landroid/opengl/EGLSurface;
    const-string/jumbo v2, "eglCreateWindowSurface"

    invoke-static {v2}, Landroidx/camera/core/processing/OpenGlRenderer;->checkEglErrorOrThrow(Ljava/lang/String;)V

    .line 795
    if-eqz v1, :cond_0

    .line 798
    return-object v1

    .line 796
    :cond_0
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string/jumbo v3, "surface was null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static deleteFbo(I)V
    .locals 3
    .param p0, "fbo"    # I

    .line 456
    filled-new-array {p0}, [I

    move-result-object v0

    .line 457
    .local v0, "fbos":[I
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 458
    const-string/jumbo v1, "glDeleteFramebuffers"

    invoke-static {v1}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 459
    return-void
.end method

.method private static deleteTexture(I)V
    .locals 3
    .param p0, "texture"    # I

    .line 450
    filled-new-array {p0}, [I

    move-result-object v0

    .line 451
    .local v0, "textures":[I
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 452
    const-string/jumbo v1, "glDeleteTextures"

    invoke-static {v1}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 453
    return-void
.end method

.method private static generateFbo()I
    .locals 3

    .line 436
    const/4 v0, 0x1

    new-array v1, v0, [I

    .line 437
    .local v1, "fbos":[I
    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    .line 438
    const-string/jumbo v0, "glGenFramebuffers"

    invoke-static {v0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 439
    aget v0, v1, v2

    return v0
.end method

.method private static generateTexture()I
    .locals 3

    .line 443
    const/4 v0, 0x1

    new-array v1, v0, [I

    .line 444
    .local v1, "textures":[I
    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 445
    const-string/jumbo v0, "glGenTextures"

    invoke-static {v0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 446
    aget v0, v1, v2

    return v0
.end method

.method private getGlExtensionsBeforeInitialized(Landroidx/camera/core/DynamicRange;)Ljava/lang/String;
    .locals 5
    .param p1, "dynamicRangeToInitialize"    # Landroidx/camera/core/DynamicRange;

    .line 419
    const-string v0, ""

    const/4 v1, 0x0

    invoke-direct {p0, v1}, Landroidx/camera/core/processing/OpenGlRenderer;->checkInitializedOrThrow(Z)V

    .line 421
    :try_start_0
    invoke-direct {p0, p1}, Landroidx/camera/core/processing/OpenGlRenderer;->createEglContext(Landroidx/camera/core/DynamicRange;)V

    .line 422
    invoke-direct {p0}, Landroidx/camera/core/processing/OpenGlRenderer;->createTempSurface()V

    .line 423
    iget-object v1, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mTempSurface:Landroid/opengl/EGLSurface;

    invoke-direct {p0, v1}, Landroidx/camera/core/processing/OpenGlRenderer;->makeCurrent(Landroid/opengl/EGLSurface;)V

    .line 425
    const/16 v1, 0x1f03

    invoke-static {v1}, Landroid/opengl/GLES20;->glGetString(I)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 426
    .local v1, "glExtensions":Ljava/lang/String;
    if-eqz v1, :cond_0

    move-object v0, v1

    .line 431
    :cond_0
    invoke-direct {p0}, Landroidx/camera/core/processing/OpenGlRenderer;->releaseInternal()V

    .line 426
    return-object v0

    .line 431
    .end local v1    # "glExtensions":Ljava/lang/String;
    :catchall_0
    move-exception v0

    goto :goto_0

    .line 427
    :catch_0
    move-exception v1

    .line 428
    .local v1, "e":Ljava/lang/IllegalStateException;
    :try_start_1
    const-string v2, "OpenGlRenderer"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to get GL extensions: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 429
    nop

    .line 431
    invoke-direct {p0}, Landroidx/camera/core/processing/OpenGlRenderer;->releaseInternal()V

    .line 429
    return-object v0

    .line 431
    .end local v1    # "e":Ljava/lang/IllegalStateException;
    :goto_0
    invoke-direct {p0}, Landroidx/camera/core/processing/OpenGlRenderer;->releaseInternal()V

    .line 432
    throw v0
.end method

.method private getOutSurfaceOrThrow(Landroid/view/Surface;)Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;
    .locals 2
    .param p1, "surface"    # Landroid/view/Surface;

    .line 722
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mOutputSurfaceMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const-string/jumbo v1, "The surface is not registered."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 725
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mOutputSurfaceMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;

    return-object v0
.end method

.method private getSurfaceSize(Landroid/opengl/EGLSurface;)Landroid/util/Size;
    .locals 3
    .param p1, "eglSurface"    # Landroid/opengl/EGLSurface;

    .line 655
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    const/16 v1, 0x3057

    invoke-static {v0, p1, v1}, Landroidx/camera/core/processing/OpenGlRenderer;->querySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;I)I

    move-result v0

    .line 656
    .local v0, "width":I
    iget-object v1, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    const/16 v2, 0x3056

    invoke-static {v1, p1, v2}, Landroidx/camera/core/processing/OpenGlRenderer;->querySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;I)I

    move-result v1

    .line 657
    .local v1, "height":I
    new-instance v2, Landroid/util/Size;

    invoke-direct {v2, v0, v1}, Landroid/util/Size;-><init>(II)V

    return-object v2
.end method

.method private loadFragmentShader(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/processing/ShaderProvider;)I
    .locals 4
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .param p2, "shaderProvider"    # Landroidx/camera/core/processing/ShaderProvider;

    .line 628
    const-string/jumbo v0, "vTextureCoord"

    const-string/jumbo v1, "sTexture"

    sget-object v2, Landroidx/camera/core/processing/ShaderProvider;->DEFAULT:Landroidx/camera/core/processing/ShaderProvider;

    const v3, 0x8b30

    if-ne p2, v2, :cond_1

    .line 629
    nop

    .line 630
    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->is10BitHdr()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Landroidx/camera/core/processing/OpenGlRenderer;->HDR_FRAGMENT_SHADER:Ljava/lang/String;

    goto :goto_0

    :cond_0
    sget-object v0, Landroidx/camera/core/processing/OpenGlRenderer;->DEFAULT_FRAGMENT_SHADER:Ljava/lang/String;

    .line 629
    :goto_0
    invoke-static {v3, v0}, Landroidx/camera/core/processing/OpenGlRenderer;->loadShader(ILjava/lang/String;)I

    move-result v0

    return v0

    .line 636
    :cond_1
    :try_start_0
    invoke-interface {p2, v1, v0}, Landroidx/camera/core/processing/ShaderProvider;->createFragmentShader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 639
    .local v2, "source":Ljava/lang/String;
    if-eqz v2, :cond_2

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {v2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 643
    invoke-static {v3, v2}, Landroidx/camera/core/processing/OpenGlRenderer;->loadShader(ILjava/lang/String;)I

    move-result v0

    return v0

    .line 641
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid fragment shader"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local p1    # "dynamicRange":Landroidx/camera/core/DynamicRange;
    .end local p2    # "shaderProvider":Landroidx/camera/core/processing/ShaderProvider;
    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 644
    .end local v2    # "source":Ljava/lang/String;
    .restart local p1    # "dynamicRange":Landroidx/camera/core/DynamicRange;
    .restart local p2    # "shaderProvider":Landroidx/camera/core/processing/ShaderProvider;
    :catchall_0
    move-exception v0

    .line 645
    .local v0, "t":Ljava/lang/Throwable;
    instance-of v1, v0, Ljava/lang/IllegalArgumentException;

    if-eqz v1, :cond_3

    .line 646
    throw v0

    .line 648
    :cond_3
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Unable to compile fragment shader"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private loadLocations()V
    .locals 2

    .line 596
    iget v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mProgramHandle:I

    const-string/jumbo v1, "aPosition"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mPositionLoc:I

    .line 597
    iget v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mPositionLoc:I

    invoke-static {v0, v1}, Landroidx/camera/core/processing/OpenGlRenderer;->checkLocationOrThrow(ILjava/lang/String;)V

    .line 598
    iget v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mProgramHandle:I

    const-string/jumbo v1, "aTextureCoord"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mTexCoordLoc:I

    .line 599
    iget v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mTexCoordLoc:I

    invoke-static {v0, v1}, Landroidx/camera/core/processing/OpenGlRenderer;->checkLocationOrThrow(ILjava/lang/String;)V

    .line 600
    iget v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mProgramHandle:I

    const-string/jumbo v1, "uTexMatrix"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mTexMatrixLoc:I

    .line 601
    iget v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mTexMatrixLoc:I

    invoke-static {v0, v1}, Landroidx/camera/core/processing/OpenGlRenderer;->checkLocationOrThrow(ILjava/lang/String;)V

    .line 602
    return-void
.end method

.method private static loadShader(ILjava/lang/String;)I
    .locals 5
    .param p0, "shaderType"    # I
    .param p1, "source"    # Ljava/lang/String;

    .line 802
    invoke-static {p0}, Landroid/opengl/GLES20;->glCreateShader(I)I

    move-result v0

    .line 803
    .local v0, "shader":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "glCreateShader type="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 804
    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 805
    invoke-static {v0}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 806
    const/4 v1, 0x1

    new-array v1, v1, [I

    .line 807
    .local v1, "compiled":[I
    const v2, 0x8b81

    const/4 v3, 0x0

    invoke-static {v0, v2, v1, v3}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 808
    aget v2, v1, v3

    if-eqz v2, :cond_0

    .line 815
    return v0

    .line 809
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not compile shader: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "OpenGlRenderer"

    invoke-static {v3, v2}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 810
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 811
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not compile shader type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 812
    invoke-static {v0}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private makeCurrent(Landroid/opengl/EGLSurface;)V
    .locals 2
    .param p1, "eglSurface"    # Landroid/opengl/EGLSurface;

    .line 519
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 520
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglContext:Landroid/opengl/EGLContext;

    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 521
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    iget-object v1, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglContext:Landroid/opengl/EGLContext;

    invoke-static {v0, p1, p1, v1}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 524
    return-void

    .line 522
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "eglMakeCurrent failed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static querySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;I)I
    .locals 2
    .param p0, "eglDisplay"    # Landroid/opengl/EGLDisplay;
    .param p1, "eglSurface"    # Landroid/opengl/EGLSurface;
    .param p2, "what"    # I

    .line 820
    const/4 v0, 0x1

    new-array v0, v0, [I

    .line 821
    .local v0, "value":[I
    const/4 v1, 0x0

    invoke-static {p0, p1, p2, v0, v1}, Landroid/opengl/EGL14;->eglQuerySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;I[II)Z

    .line 822
    aget v1, v0, v1

    return v1
.end method

.method private releaseInternal()V
    .locals 5

    .line 662
    iget v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mProgramHandle:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 663
    iget v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mProgramHandle:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 664
    iput v1, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mProgramHandle:I

    .line 667
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    invoke-static {v0, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 668
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v3, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    sget-object v4, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    invoke-static {v0, v2, v3, v4}, Landroid/opengl/EGL14;->eglMakeCurrent(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;Landroid/opengl/EGLSurface;Landroid/opengl/EGLContext;)Z

    .line 672
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mOutputSurfaceMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;

    .line 673
    .local v2, "outputSurface":Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;
    invoke-virtual {v2}, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;->getEglSurface()Landroid/opengl/EGLSurface;

    move-result-object v3

    sget-object v4, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    invoke-static {v3, v4}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 674
    iget-object v3, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    invoke-virtual {v2}, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;->getEglSurface()Landroid/opengl/EGLSurface;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 675
    const-string/jumbo v3, "eglDestroySurface"

    invoke-static {v3}, Landroidx/camera/core/processing/OpenGlRenderer;->checkEglErrorOrLog(Ljava/lang/String;)V

    .line 678
    .end local v2    # "outputSurface":Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;
    :cond_1
    goto :goto_0

    .line 679
    :cond_2
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mOutputSurfaceMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 682
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mTempSurface:Landroid/opengl/EGLSurface;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    invoke-static {v0, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 683
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    iget-object v2, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mTempSurface:Landroid/opengl/EGLSurface;

    invoke-static {v0, v2}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    .line 684
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    iput-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mTempSurface:Landroid/opengl/EGLSurface;

    .line 688
    :cond_3
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglContext:Landroid/opengl/EGLContext;

    sget-object v2, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    invoke-static {v0, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 689
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    iget-object v2, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglContext:Landroid/opengl/EGLContext;

    invoke-static {v0, v2}, Landroid/opengl/EGL14;->eglDestroyContext(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLContext;)Z

    .line 690
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    iput-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglContext:Landroid/opengl/EGLContext;

    .line 692
    :cond_4
    invoke-static {}, Landroid/opengl/EGL14;->eglReleaseThread()Z

    .line 693
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    invoke-static {v0}, Landroid/opengl/EGL14;->eglTerminate(Landroid/opengl/EGLDisplay;)Z

    .line 694
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_DISPLAY:Landroid/opengl/EGLDisplay;

    iput-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    .line 698
    :cond_5
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglConfig:Landroid/opengl/EGLConfig;

    .line 699
    iput v1, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mProgramHandle:I

    .line 700
    iput v1, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mTexMatrixLoc:I

    .line 701
    iput v1, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mPositionLoc:I

    .line 702
    iput v1, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mTexCoordLoc:I

    .line 703
    iput v1, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mExternalTextureId:I

    .line 704
    iput-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mCurrentSurface:Landroid/view/Surface;

    .line 705
    iput-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mGlThread:Ljava/lang/Thread;

    .line 706
    return-void
.end method

.method private removeOutputSurfaceInternal(Landroid/view/Surface;Z)V
    .locals 4
    .param p1, "surface"    # Landroid/view/Surface;
    .param p2, "unregister"    # Z

    .line 762
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mCurrentSurface:Landroid/view/Surface;

    if-ne v0, p1, :cond_0

    .line 763
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mCurrentSurface:Landroid/view/Surface;

    .line 764
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mTempSurface:Landroid/opengl/EGLSurface;

    invoke-direct {p0, v0}, Landroidx/camera/core/processing/OpenGlRenderer;->makeCurrent(Landroid/opengl/EGLSurface;)V

    .line 769
    :cond_0
    nop

    .line 772
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mOutputSurfaceMap:Ljava/util/Map;

    .line 769
    if-eqz p2, :cond_1

    .line 770
    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;

    .local v0, "removedOutputSurface":Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;
    goto :goto_0

    .line 772
    .end local v0    # "removedOutputSurface":Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;
    :cond_1
    sget-object v1, Landroidx/camera/core/processing/OpenGlRenderer;->NO_OUTPUT_SURFACE:Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;

    .line 776
    .restart local v0    # "removedOutputSurface":Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;
    :goto_0
    if-eqz v0, :cond_2

    sget-object v1, Landroidx/camera/core/processing/OpenGlRenderer;->NO_OUTPUT_SURFACE:Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;

    if-eq v0, v1, :cond_2

    .line 778
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    invoke-virtual {v0}, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;->getEglSurface()Landroid/opengl/EGLSurface;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/opengl/EGL14;->eglDestroySurface(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 781
    goto :goto_1

    .line 779
    :catch_0
    move-exception v1

    .line 780
    .local v1, "e":Ljava/lang/RuntimeException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to destroy EGL surface: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "OpenGlRenderer"

    invoke-static {v3, v2, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 783
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :cond_2
    :goto_1
    return-void
.end method

.method private snapshot(Ljava/nio/ByteBuffer;Landroid/util/Size;[F)V
    .locals 18
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .param p2, "size"    # Landroid/util/Size;
    .param p3, "textureTransform"    # [F

    .line 352
    move-object/from16 v0, p0

    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getWidth()I

    move-result v2

    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getHeight()I

    move-result v3

    mul-int/2addr v2, v3

    const/4 v3, 0x4

    mul-int/2addr v2, v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-ne v1, v2, :cond_0

    move v1, v4

    goto :goto_0

    :cond_0
    move v1, v5

    :goto_0
    const-string v2, "ByteBuffer capacity is not equal to width * height * 4."

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 354
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v1

    const-string v2, "ByteBuffer is not direct."

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 357
    invoke-static {}, Landroidx/camera/core/processing/OpenGlRenderer;->generateTexture()I

    move-result v1

    .line 358
    .local v1, "texture":I
    const v2, 0x84c1

    invoke-static {v2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 359
    const-string/jumbo v2, "glActiveTexture"

    invoke-static {v2}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 360
    const/16 v6, 0xde1

    invoke-static {v6, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 361
    const-string/jumbo v7, "glBindTexture"

    invoke-static {v7}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 363
    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getWidth()I

    move-result v11

    .line 364
    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getHeight()I

    move-result v12

    .line 363
    const/16 v8, 0xde1

    const/4 v9, 0x0

    const/16 v10, 0x1907

    const/4 v13, 0x0

    const/16 v14, 0x1907

    const/16 v15, 0x1401

    const/16 v16, 0x0

    invoke-static/range {v8 .. v16}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 365
    const-string/jumbo v8, "glTexImage2D"

    invoke-static {v8}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 366
    const/16 v8, 0x2800

    const/16 v9, 0x2601

    invoke-static {v6, v8, v9}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 368
    const/16 v8, 0x2801

    invoke-static {v6, v8, v9}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 372
    invoke-static {}, Landroidx/camera/core/processing/OpenGlRenderer;->generateFbo()I

    move-result v8

    .line 373
    .local v8, "fbo":I
    const v9, 0x8d40

    invoke-static {v9, v8}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 374
    const-string/jumbo v10, "glBindFramebuffer"

    invoke-static {v10}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 377
    const v10, 0x8ce0

    invoke-static {v9, v10, v6, v1, v5}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    .line 379
    const-string/jumbo v6, "glFramebufferTexture2D"

    invoke-static {v6}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 382
    const v6, 0x84c0

    invoke-static {v6}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 383
    invoke-static {v2}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 384
    iget v2, v0, Landroidx/camera/core/processing/OpenGlRenderer;->mExternalTextureId:I

    const v10, 0x8d65

    invoke-static {v10, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 385
    invoke-static {v7}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 388
    const/4 v2, 0x0

    iput-object v2, v0, Landroidx/camera/core/processing/OpenGlRenderer;->mCurrentSurface:Landroid/view/Surface;

    .line 389
    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getWidth()I

    move-result v2

    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getHeight()I

    move-result v7

    invoke-static {v5, v5, v2, v7}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 390
    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getWidth()I

    move-result v2

    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getHeight()I

    move-result v7

    invoke-static {v5, v5, v2, v7}, Landroid/opengl/GLES20;->glScissor(IIII)V

    .line 393
    iget v2, v0, Landroidx/camera/core/processing/OpenGlRenderer;->mTexMatrixLoc:I

    move-object/from16 v7, p3

    invoke-static {v2, v4, v5, v7, v5}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 395
    const-string/jumbo v2, "glUniformMatrix4fv"

    invoke-static {v2}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 398
    const/4 v2, 0x5

    invoke-static {v2, v5, v3}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 399
    const-string/jumbo v2, "glDrawArrays"

    invoke-static {v2}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 402
    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getWidth()I

    move-result v13

    invoke-virtual/range {p2 .. p2}, Landroid/util/Size;->getHeight()I

    move-result v14

    const/16 v15, 0x1908

    const/16 v16, 0x1401

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object/from16 v17, p1

    invoke-static/range {v11 .. v17}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 405
    const-string/jumbo v2, "glReadPixels"

    invoke-static {v2}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 408
    invoke-static {v9, v5}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 409
    invoke-static {v1}, Landroidx/camera/core/processing/OpenGlRenderer;->deleteTexture(I)V

    .line 410
    invoke-static {v8}, Landroidx/camera/core/processing/OpenGlRenderer;->deleteFbo(I)V

    .line 412
    invoke-static {v6}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 413
    iget v2, v0, Landroidx/camera/core/processing/OpenGlRenderer;->mExternalTextureId:I

    invoke-static {v10, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 414
    return-void
.end method

.method private useAndConfigureProgram()V
    .locals 12

    .line 565
    iget v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mProgramHandle:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 566
    const-string/jumbo v0, "glUseProgram"

    invoke-static {v0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 569
    const v0, 0x84c0

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 570
    const v0, 0x8d65

    iget v1, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mExternalTextureId:I

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 573
    iget v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mPositionLoc:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 574
    const-string/jumbo v0, "glEnableVertexAttribArray"

    invoke-static {v0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 577
    const/4 v2, 0x2

    .line 578
    .local v2, "coordsPerVertex":I
    const/4 v5, 0x0

    .line 579
    .local v5, "vertexStride":I
    iget v1, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mPositionLoc:I

    const/4 v4, 0x0

    sget-object v6, Landroidx/camera/core/processing/OpenGlRenderer;->VERTEX_BUF:Ljava/nio/FloatBuffer;

    const/16 v3, 0x1406

    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 581
    const-string/jumbo v1, "glVertexAttribPointer"

    invoke-static {v1}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 584
    iget v3, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mTexCoordLoc:I

    invoke-static {v3}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 585
    invoke-static {v0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 588
    const/4 v7, 0x2

    .line 589
    .local v7, "coordsPerTex":I
    const/4 v10, 0x0

    .line 590
    .local v10, "texStride":I
    iget v6, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mTexCoordLoc:I

    const/4 v9, 0x0

    sget-object v11, Landroidx/camera/core/processing/OpenGlRenderer;->TEX_BUF:Ljava/nio/FloatBuffer;

    const/16 v8, 0x1406

    invoke-static/range {v6 .. v11}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 592
    invoke-static {v1}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 593
    return-void
.end method


# virtual methods
.method public getTextureName()I
    .locals 1

    .line 258
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkInitializedOrThrow(Z)V

    .line 259
    invoke-direct {p0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlThreadOrThrow()V

    .line 261
    iget v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mExternalTextureId:I

    return v0
.end method

.method public init(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/processing/ShaderProvider;)V
    .locals 3
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .param p2, "shaderProvider"    # Landroidx/camera/core/processing/ShaderProvider;

    .line 185
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkInitializedOrThrow(Z)V

    .line 187
    :try_start_0
    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->is10BitHdr()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 188
    invoke-direct {p0, p1}, Landroidx/camera/core/processing/OpenGlRenderer;->getGlExtensionsBeforeInitialized(Landroidx/camera/core/DynamicRange;)Ljava/lang/String;

    move-result-object v0

    .line 189
    .local v0, "glExtensions":Ljava/lang/String;
    const-string v1, "GL_EXT_YUV_target"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 190
    const-string v1, "OpenGlRenderer"

    const-string v2, "Device does not support GL_EXT_YUV_target. Fallback to SDR."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    sget-object v1, Landroidx/camera/core/DynamicRange;->SDR:Landroidx/camera/core/DynamicRange;

    move-object p1, v1

    .line 194
    .end local v0    # "glExtensions":Ljava/lang/String;
    :cond_0
    invoke-direct {p0, p1}, Landroidx/camera/core/processing/OpenGlRenderer;->createEglContext(Landroidx/camera/core/DynamicRange;)V

    .line 195
    invoke-direct {p0}, Landroidx/camera/core/processing/OpenGlRenderer;->createTempSurface()V

    .line 196
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mTempSurface:Landroid/opengl/EGLSurface;

    invoke-direct {p0, v0}, Landroidx/camera/core/processing/OpenGlRenderer;->makeCurrent(Landroid/opengl/EGLSurface;)V

    .line 197
    invoke-direct {p0, p1, p2}, Landroidx/camera/core/processing/OpenGlRenderer;->createProgram(Landroidx/camera/core/DynamicRange;Landroidx/camera/core/processing/ShaderProvider;)V

    .line 198
    invoke-direct {p0}, Landroidx/camera/core/processing/OpenGlRenderer;->loadLocations()V

    .line 199
    invoke-direct {p0}, Landroidx/camera/core/processing/OpenGlRenderer;->createTexture()V

    .line 200
    invoke-direct {p0}, Landroidx/camera/core/processing/OpenGlRenderer;->useAndConfigureProgram()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 204
    nop

    .line 205
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mGlThread:Ljava/lang/Thread;

    .line 206
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 207
    return-void

    .line 201
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 202
    .local v0, "e":Ljava/lang/RuntimeException;
    :goto_0
    invoke-direct {p0}, Landroidx/camera/core/processing/OpenGlRenderer;->releaseInternal()V

    .line 203
    throw v0
.end method

.method public registerOutputSurface(Landroid/view/Surface;)V
    .locals 2
    .param p1, "surface"    # Landroid/view/Surface;

    .line 229
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkInitializedOrThrow(Z)V

    .line 230
    invoke-direct {p0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlThreadOrThrow()V

    .line 232
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mOutputSurfaceMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 233
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mOutputSurfaceMap:Ljava/util/Map;

    sget-object v1, Landroidx/camera/core/processing/OpenGlRenderer;->NO_OUTPUT_SURFACE:Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    :cond_0
    return-void
.end method

.method public release()V
    .locals 2

    .line 215
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 216
    return-void

    .line 218
    :cond_0
    invoke-direct {p0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlThreadOrThrow()V

    .line 219
    invoke-direct {p0}, Landroidx/camera/core/processing/OpenGlRenderer;->releaseInternal()V

    .line 220
    return-void
.end method

.method public render(J[FLandroid/view/Surface;)V
    .locals 5
    .param p1, "timestampNs"    # J
    .param p3, "textureTransform"    # [F
    .param p4, "surface"    # Landroid/view/Surface;

    .line 273
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkInitializedOrThrow(Z)V

    .line 274
    invoke-direct {p0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlThreadOrThrow()V

    .line 276
    invoke-direct {p0, p4}, Landroidx/camera/core/processing/OpenGlRenderer;->getOutSurfaceOrThrow(Landroid/view/Surface;)Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;

    move-result-object v1

    .line 279
    .local v1, "outputSurface":Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;
    sget-object v2, Landroidx/camera/core/processing/OpenGlRenderer;->NO_OUTPUT_SURFACE:Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;

    if-ne v1, v2, :cond_1

    .line 280
    invoke-direct {p0, p4}, Landroidx/camera/core/processing/OpenGlRenderer;->createOutputSurfaceInternal(Landroid/view/Surface;)Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;

    move-result-object v1

    .line 281
    if-nez v1, :cond_0

    .line 282
    return-void

    .line 285
    :cond_0
    iget-object v2, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mOutputSurfaceMap:Ljava/util/Map;

    invoke-interface {v2, p4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    :cond_1
    iget-object v2, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mCurrentSurface:Landroid/view/Surface;

    const/4 v3, 0x0

    if-eq p4, v2, :cond_2

    .line 290
    invoke-virtual {v1}, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;->getEglSurface()Landroid/opengl/EGLSurface;

    move-result-object v2

    invoke-direct {p0, v2}, Landroidx/camera/core/processing/OpenGlRenderer;->makeCurrent(Landroid/opengl/EGLSurface;)V

    .line 291
    iput-object p4, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mCurrentSurface:Landroid/view/Surface;

    .line 292
    invoke-virtual {v1}, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;->getWidth()I

    move-result v2

    invoke-virtual {v1}, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;->getHeight()I

    move-result v4

    invoke-static {v3, v3, v2, v4}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 293
    invoke-virtual {v1}, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;->getWidth()I

    move-result v2

    invoke-virtual {v1}, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;->getHeight()I

    move-result v4

    invoke-static {v3, v3, v2, v4}, Landroid/opengl/GLES20;->glScissor(IIII)V

    .line 298
    :cond_2
    iget v2, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mTexMatrixLoc:I

    invoke-static {v2, v0, v3, p3, v3}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 300
    const-string/jumbo v0, "glUniformMatrix4fv"

    invoke-static {v0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 303
    const/4 v0, 0x5

    const/4 v2, 0x4

    invoke-static {v0, v3, v2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 304
    const-string/jumbo v0, "glDrawArrays"

    invoke-static {v0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 307
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    invoke-virtual {v1}, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;->getEglSurface()Landroid/opengl/EGLSurface;

    move-result-object v2

    invoke-static {v0, v2, p1, p2}, Landroid/opengl/EGLExt;->eglPresentationTimeANDROID(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;J)Z

    .line 310
    iget-object v0, p0, Landroidx/camera/core/processing/OpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    invoke-virtual {v1}, Landroidx/camera/core/processing/OpenGlRenderer$OutputSurface;->getEglSurface()Landroid/opengl/EGLSurface;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/opengl/EGL14;->eglSwapBuffers(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 311
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to swap buffers with EGL error: 0x"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 312
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result v2

    .line 311
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "OpenGlRenderer"

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    invoke-direct {p0, p4, v3}, Landroidx/camera/core/processing/OpenGlRenderer;->removeOutputSurfaceInternal(Landroid/view/Surface;Z)V

    .line 315
    :cond_3
    return-void
.end method

.method public snapshot(Landroid/util/Size;[F)Landroid/graphics/Bitmap;
    .locals 4
    .param p1, "size"    # Landroid/util/Size;
    .param p2, "textureTransform"    # [F

    .line 327
    nop

    .line 328
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v1

    mul-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x4

    .line 327
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 330
    .local v0, "byteBuffer":Ljava/nio/ByteBuffer;
    invoke-direct {p0, v0, p1, p2}, Landroidx/camera/core/processing/OpenGlRenderer;->snapshot(Ljava/nio/ByteBuffer;Landroid/util/Size;[F)V

    .line 332
    nop

    .line 333
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v2

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 332
    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 334
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 335
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v2

    mul-int/lit8 v2, v2, 0x4

    invoke-static {v1, v0, v2}, Landroidx/camera/core/ImageProcessingUtil;->copyByteBufferToBitmap(Landroid/graphics/Bitmap;Ljava/nio/ByteBuffer;I)V

    .line 336
    return-object v1
.end method

.method public unregisterOutputSurface(Landroid/view/Surface;)V
    .locals 1
    .param p1, "surface"    # Landroid/view/Surface;

    .line 244
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkInitializedOrThrow(Z)V

    .line 245
    invoke-direct {p0}, Landroidx/camera/core/processing/OpenGlRenderer;->checkGlThreadOrThrow()V

    .line 247
    invoke-direct {p0, p1, v0}, Landroidx/camera/core/processing/OpenGlRenderer;->removeOutputSurfaceInternal(Landroid/view/Surface;Z)V

    .line 248
    return-void
.end method
