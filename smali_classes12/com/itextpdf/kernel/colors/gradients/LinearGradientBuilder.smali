.class public Lcom/itextpdf/kernel/colors/gradients/LinearGradientBuilder;
.super Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;
.source "LinearGradientBuilder.java"


# instance fields
.field private final coordinates:[Lcom/itextpdf/kernel/geom/Point;

.field private transformation:Lcom/itextpdf/kernel/geom/AffineTransform;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 41
    invoke-direct {p0}, Lcom/itextpdf/kernel/colors/gradients/AbstractLinearGradientBuilder;-><init>()V

    .line 35
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/itextpdf/kernel/geom/Point;

    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v1}, Lcom/itextpdf/kernel/geom/Point;-><init>()V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/itextpdf/kernel/geom/Point;

    invoke-direct {v1}, Lcom/itextpdf/kernel/geom/Point;-><init>()V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iput-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/LinearGradientBuilder;->coordinates:[Lcom/itextpdf/kernel/geom/Point;

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/LinearGradientBuilder;->transformation:Lcom/itextpdf/kernel/geom/AffineTransform;

    .line 42
    return-void
.end method


# virtual methods
.method public getCurrentSpaceToGradientVectorSpaceTransformation(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/AffineTransform;)Lcom/itextpdf/kernel/geom/AffineTransform;
    .locals 1
    .param p1, "targetBoundingBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "contextTransform"    # Lcom/itextpdf/kernel/geom/AffineTransform;

    .line 83
    iget-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/LinearGradientBuilder;->transformation:Lcom/itextpdf/kernel/geom/AffineTransform;

    return-object v0
.end method

.method public getGradientVector(Lcom/itextpdf/kernel/geom/Rectangle;Lcom/itextpdf/kernel/geom/AffineTransform;)[Lcom/itextpdf/kernel/geom/Point;
    .locals 3
    .param p1, "targetBoundingBox"    # Lcom/itextpdf/kernel/geom/Rectangle;
    .param p2, "contextTransform"    # Lcom/itextpdf/kernel/geom/AffineTransform;

    .line 77
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/itextpdf/kernel/geom/Point;

    iget-object v1, p0, Lcom/itextpdf/kernel/colors/gradients/LinearGradientBuilder;->coordinates:[Lcom/itextpdf/kernel/geom/Point;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Point;->getLocation()Lcom/itextpdf/kernel/geom/Point;

    move-result-object v1

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/itextpdf/kernel/colors/gradients/LinearGradientBuilder;->coordinates:[Lcom/itextpdf/kernel/geom/Point;

    const/4 v2, 0x1

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/Point;->getLocation()Lcom/itextpdf/kernel/geom/Point;

    move-result-object v1

    aput-object v1, v0, v2

    return-object v0
.end method

.method public setCurrentSpaceToGradientVectorSpaceTransformation(Lcom/itextpdf/kernel/geom/AffineTransform;)Lcom/itextpdf/kernel/colors/gradients/LinearGradientBuilder;
    .locals 0
    .param p1, "transformation"    # Lcom/itextpdf/kernel/geom/AffineTransform;

    .line 71
    iput-object p1, p0, Lcom/itextpdf/kernel/colors/gradients/LinearGradientBuilder;->transformation:Lcom/itextpdf/kernel/geom/AffineTransform;

    .line 72
    return-object p0
.end method

.method public setGradientVector(DDDD)Lcom/itextpdf/kernel/colors/gradients/LinearGradientBuilder;
    .locals 2
    .param p1, "x0"    # D
    .param p3, "y0"    # D
    .param p5, "x1"    # D
    .param p7, "y1"    # D

    .line 54
    iget-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/LinearGradientBuilder;->coordinates:[Lcom/itextpdf/kernel/geom/Point;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/itextpdf/kernel/geom/Point;->setLocation(DD)V

    .line 55
    iget-object v0, p0, Lcom/itextpdf/kernel/colors/gradients/LinearGradientBuilder;->coordinates:[Lcom/itextpdf/kernel/geom/Point;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {v0, p5, p6, p7, p8}, Lcom/itextpdf/kernel/geom/Point;->setLocation(DD)V

    .line 56
    return-object p0
.end method
