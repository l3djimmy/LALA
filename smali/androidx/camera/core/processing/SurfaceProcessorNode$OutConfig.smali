.class public abstract Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;
.super Ljava/lang/Object;
.source "SurfaceProcessorNode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/processing/SurfaceProcessorNode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "OutConfig"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 335
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static of(IILandroid/graphics/Rect;Landroid/util/Size;IZ)Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;
    .locals 8
    .param p0, "targets"    # I
    .param p1, "format"    # I
    .param p2, "cropRect"    # Landroid/graphics/Rect;
    .param p3, "size"    # Landroid/util/Size;
    .param p4, "rotationDegrees"    # I
    .param p5, "mirroring"    # Z

    .line 407
    new-instance v0, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    move v2, p0

    move v3, p1

    move-object v4, p2

    move-object v5, p3

    move v6, p4

    move v7, p5

    .end local p0    # "targets":I
    .end local p1    # "format":I
    .end local p2    # "cropRect":Landroid/graphics/Rect;
    .end local p3    # "size":Landroid/util/Size;
    .end local p4    # "rotationDegrees":I
    .end local p5    # "mirroring":Z
    .local v2, "targets":I
    .local v3, "format":I
    .local v4, "cropRect":Landroid/graphics/Rect;
    .local v5, "size":Landroid/util/Size;
    .local v6, "rotationDegrees":I
    .local v7, "mirroring":Z
    invoke-direct/range {v0 .. v7}, Landroidx/camera/core/processing/AutoValue_SurfaceProcessorNode_OutConfig;-><init>(Ljava/util/UUID;IILandroid/graphics/Rect;Landroid/util/Size;IZ)V

    return-object v0
.end method

.method public static of(Landroidx/camera/core/processing/SurfaceEdge;)Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;
    .locals 6
    .param p0, "inputEdge"    # Landroidx/camera/core/processing/SurfaceEdge;

    .line 389
    invoke-virtual {p0}, Landroidx/camera/core/processing/SurfaceEdge;->getTargets()I

    move-result v0

    .line 390
    invoke-virtual {p0}, Landroidx/camera/core/processing/SurfaceEdge;->getFormat()I

    move-result v1

    .line 391
    invoke-virtual {p0}, Landroidx/camera/core/processing/SurfaceEdge;->getCropRect()Landroid/graphics/Rect;

    move-result-object v2

    .line 392
    invoke-virtual {p0}, Landroidx/camera/core/processing/SurfaceEdge;->getCropRect()Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {p0}, Landroidx/camera/core/processing/SurfaceEdge;->getRotationDegrees()I

    move-result v4

    invoke-static {v3, v4}, Landroidx/camera/core/impl/utils/TransformUtils;->getRotatedSize(Landroid/graphics/Rect;I)Landroid/util/Size;

    move-result-object v3

    .line 393
    invoke-virtual {p0}, Landroidx/camera/core/processing/SurfaceEdge;->getRotationDegrees()I

    move-result v4

    .line 394
    invoke-virtual {p0}, Landroidx/camera/core/processing/SurfaceEdge;->getMirroring()Z

    move-result v5

    .line 389
    invoke-static/range {v0 .. v5}, Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;->of(IILandroid/graphics/Rect;Landroid/util/Size;IZ)Landroidx/camera/core/processing/SurfaceProcessorNode$OutConfig;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public abstract getCropRect()Landroid/graphics/Rect;
.end method

.method public abstract getFormat()I
.end method

.method public abstract getMirroring()Z
.end method

.method public abstract getRotationDegrees()I
.end method

.method public abstract getSize()Landroid/util/Size;
.end method

.method public abstract getTargets()I
.end method

.method abstract getUuid()Ljava/util/UUID;
.end method
