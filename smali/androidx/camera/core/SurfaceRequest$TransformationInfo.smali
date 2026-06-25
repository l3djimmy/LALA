.class public abstract Landroidx/camera/core/SurfaceRequest$TransformationInfo;
.super Ljava/lang/Object;
.source "SurfaceRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/SurfaceRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "TransformationInfo"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 958
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 959
    return-void
.end method

.method public static of(Landroid/graphics/Rect;IIZLandroid/graphics/Matrix;Z)Landroidx/camera/core/SurfaceRequest$TransformationInfo;
    .locals 7
    .param p0, "cropRect"    # Landroid/graphics/Rect;
    .param p1, "rotationDegrees"    # I
    .param p2, "targetRotation"    # I
    .param p3, "hasCameraTransform"    # Z
    .param p4, "sensorToBufferTransform"    # Landroid/graphics/Matrix;
    .param p5, "mirroring"    # Z

    .line 953
    new-instance v0, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    move v6, p5

    .end local p0    # "cropRect":Landroid/graphics/Rect;
    .end local p1    # "rotationDegrees":I
    .end local p2    # "targetRotation":I
    .end local p3    # "hasCameraTransform":Z
    .end local p4    # "sensorToBufferTransform":Landroid/graphics/Matrix;
    .end local p5    # "mirroring":Z
    .local v1, "cropRect":Landroid/graphics/Rect;
    .local v2, "rotationDegrees":I
    .local v3, "targetRotation":I
    .local v4, "hasCameraTransform":Z
    .local v5, "sensorToBufferTransform":Landroid/graphics/Matrix;
    .local v6, "mirroring":Z
    invoke-direct/range {v0 .. v6}, Landroidx/camera/core/AutoValue_SurfaceRequest_TransformationInfo;-><init>(Landroid/graphics/Rect;IIZLandroid/graphics/Matrix;Z)V

    return-object v0
.end method


# virtual methods
.method public abstract getCropRect()Landroid/graphics/Rect;
.end method

.method public abstract getMirroring()Z
.end method

.method public abstract getRotationDegrees()I
.end method

.method public abstract getSensorToBufferTransform()Landroid/graphics/Matrix;
.end method

.method public abstract getTargetRotation()I
.end method

.method public abstract hasCameraTransform()Z
.end method
