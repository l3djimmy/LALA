.class public final synthetic Landroidx/camera/core/MetadataImageReader$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/core/impl/ImageReaderProxy$OnImageAvailableListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Landroidx/camera/core/MetadataImageReader;"
    method = "lambda$new$0"
    proto = "(Landroidx/camera/core/impl/ImageReaderProxy;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x13
    versionHash = "4b55be2c9864cfa0f3e2262a2208567ab6bc862a59e7853c580a1f24fbae9ba1"
.end annotation


# instance fields
.field public final synthetic f$0:Landroidx/camera/core/MetadataImageReader;


# direct methods
.method public synthetic constructor <init>(Landroidx/camera/core/MetadataImageReader;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/camera/core/MetadataImageReader$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/core/MetadataImageReader;

    return-void
.end method


# virtual methods
.method public final onImageAvailable(Landroidx/camera/core/impl/ImageReaderProxy;)V
    .locals 1

    .line 0
    iget-object v0, p0, Landroidx/camera/core/MetadataImageReader$$ExternalSyntheticLambda0;->f$0:Landroidx/camera/core/MetadataImageReader;

    invoke-virtual {v0, p1}, Landroidx/camera/core/MetadataImageReader;->lambda$new$0$androidx-camera-core-MetadataImageReader(Landroidx/camera/core/impl/ImageReaderProxy;)V

    return-void
.end method
