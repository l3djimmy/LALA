.class public final synthetic Landroidx/camera/video/internal/audio/AudioSource$$ExternalSyntheticLambda12;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/video/internal/audio/AudioStreamFactory;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/video/internal/audio/AudioStreamImpl;"
    method = "<init>"
    proto = "(Landroidx/camera/video/internal/audio/AudioSettings;Landroid/content/Context;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final create(Landroidx/camera/video/internal/audio/AudioSettings;Landroid/content/Context;)Landroidx/camera/video/internal/audio/AudioStream;
    .locals 1

    .line 0
    new-instance v0, Landroidx/camera/video/internal/audio/AudioStreamImpl;

    invoke-direct {v0, p1, p2}, Landroidx/camera/video/internal/audio/AudioStreamImpl;-><init>(Landroidx/camera/video/internal/audio/AudioSettings;Landroid/content/Context;)V

    check-cast v0, Landroidx/camera/video/internal/audio/AudioStream;

    return-object v0
.end method
