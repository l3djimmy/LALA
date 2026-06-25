.class public Lcom/itextpdf/layout/properties/BorderRadius;
.super Ljava/lang/Object;
.source "BorderRadius.java"


# instance fields
.field private horizontalRadius:Lcom/itextpdf/layout/properties/UnitValue;

.field private verticalRadius:Lcom/itextpdf/layout/properties/UnitValue;


# direct methods
.method public constructor <init>(F)V
    .locals 1
    .param p1, "radius"    # F

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/properties/BorderRadius;->horizontalRadius:Lcom/itextpdf/layout/properties/UnitValue;

    .line 53
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BorderRadius;->horizontalRadius:Lcom/itextpdf/layout/properties/UnitValue;

    iput-object v0, p0, Lcom/itextpdf/layout/properties/BorderRadius;->verticalRadius:Lcom/itextpdf/layout/properties/UnitValue;

    .line 54
    return-void
.end method

.method public constructor <init>(FF)V
    .locals 1
    .param p1, "horizontalRadius"    # F
    .param p2, "verticalRadius"    # F

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    invoke-static {p1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/properties/BorderRadius;->horizontalRadius:Lcom/itextpdf/layout/properties/UnitValue;

    .line 75
    invoke-static {p2}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/properties/BorderRadius;->verticalRadius:Lcom/itextpdf/layout/properties/UnitValue;

    .line 76
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/properties/UnitValue;)V
    .locals 0
    .param p1, "radius"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/itextpdf/layout/properties/BorderRadius;->horizontalRadius:Lcom/itextpdf/layout/properties/UnitValue;

    .line 43
    iput-object p1, p0, Lcom/itextpdf/layout/properties/BorderRadius;->verticalRadius:Lcom/itextpdf/layout/properties/UnitValue;

    .line 44
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/properties/UnitValue;Lcom/itextpdf/layout/properties/UnitValue;)V
    .locals 0
    .param p1, "horizontalRadius"    # Lcom/itextpdf/layout/properties/UnitValue;
    .param p2, "verticalRadius"    # Lcom/itextpdf/layout/properties/UnitValue;

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Lcom/itextpdf/layout/properties/BorderRadius;->horizontalRadius:Lcom/itextpdf/layout/properties/UnitValue;

    .line 64
    iput-object p2, p0, Lcom/itextpdf/layout/properties/BorderRadius;->verticalRadius:Lcom/itextpdf/layout/properties/UnitValue;

    .line 65
    return-void
.end method


# virtual methods
.method public getHorizontalRadius()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BorderRadius;->horizontalRadius:Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method

.method public getVerticalRadius()Lcom/itextpdf/layout/properties/UnitValue;
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/itextpdf/layout/properties/BorderRadius;->verticalRadius:Lcom/itextpdf/layout/properties/UnitValue;

    return-object v0
.end method
