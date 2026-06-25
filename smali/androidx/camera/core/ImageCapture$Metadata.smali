.class public final Landroidx/camera/core/ImageCapture$Metadata;
.super Ljava/lang/Object;
.source "ImageCapture.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/ImageCapture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Metadata"
.end annotation


# instance fields
.field private mIsReversedHorizontal:Z

.field private mIsReversedHorizontalSet:Z

.field private mIsReversedVertical:Z

.field private mLocation:Landroid/location/Location;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1570
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1583
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/core/ImageCapture$Metadata;->mIsReversedHorizontalSet:Z

    return-void
.end method


# virtual methods
.method public getLocation()Landroid/location/Location;
    .locals 1

    .line 1653
    iget-object v0, p0, Landroidx/camera/core/ImageCapture$Metadata;->mLocation:Landroid/location/Location;

    return-object v0
.end method

.method public isReversedHorizontal()Z
    .locals 1

    .line 1604
    iget-boolean v0, p0, Landroidx/camera/core/ImageCapture$Metadata;->mIsReversedHorizontal:Z

    return v0
.end method

.method public isReversedHorizontalSet()Z
    .locals 1

    .line 1615
    iget-boolean v0, p0, Landroidx/camera/core/ImageCapture$Metadata;->mIsReversedHorizontalSet:Z

    return v0
.end method

.method public isReversedVertical()Z
    .locals 1

    .line 1634
    iget-boolean v0, p0, Landroidx/camera/core/ImageCapture$Metadata;->mIsReversedVertical:Z

    return v0
.end method

.method public setLocation(Landroid/location/Location;)V
    .locals 0
    .param p1, "location"    # Landroid/location/Location;

    .line 1662
    iput-object p1, p0, Landroidx/camera/core/ImageCapture$Metadata;->mLocation:Landroid/location/Location;

    .line 1663
    return-void
.end method

.method public setReversedHorizontal(Z)V
    .locals 1
    .param p1, "isReversedHorizontal"    # Z

    .line 1624
    iput-boolean p1, p0, Landroidx/camera/core/ImageCapture$Metadata;->mIsReversedHorizontal:Z

    .line 1625
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/core/ImageCapture$Metadata;->mIsReversedHorizontalSet:Z

    .line 1626
    return-void
.end method

.method public setReversedVertical(Z)V
    .locals 0
    .param p1, "isReversedVertical"    # Z

    .line 1643
    iput-boolean p1, p0, Landroidx/camera/core/ImageCapture$Metadata;->mIsReversedVertical:Z

    .line 1644
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1668
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Metadata{mIsReversedHorizontal="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Landroidx/camera/core/ImageCapture$Metadata;->mIsReversedHorizontal:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mIsReversedVertical="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Landroidx/camera/core/ImageCapture$Metadata;->mIsReversedVertical:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mLocation="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/ImageCapture$Metadata;->mLocation:Landroid/location/Location;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
