.class public Lcom/itextpdf/layout/element/TabStop;
.super Ljava/lang/Object;
.source "TabStop.java"


# instance fields
.field private tabAlignment:Lcom/itextpdf/layout/properties/TabAlignment;

.field private tabAnchor:Ljava/lang/Character;

.field private tabLeader:Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;

.field private tabPosition:F


# direct methods
.method public constructor <init>(F)V
    .locals 1
    .param p1, "tabPosition"    # F

    .line 49
    sget-object v0, Lcom/itextpdf/layout/properties/TabAlignment;->LEFT:Lcom/itextpdf/layout/properties/TabAlignment;

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/layout/element/TabStop;-><init>(FLcom/itextpdf/layout/properties/TabAlignment;)V

    .line 50
    return-void
.end method

.method public constructor <init>(FLcom/itextpdf/layout/properties/TabAlignment;)V
    .locals 1
    .param p1, "tabPosition"    # F
    .param p2, "tabAlignment"    # Lcom/itextpdf/layout/properties/TabAlignment;

    .line 61
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/itextpdf/layout/element/TabStop;-><init>(FLcom/itextpdf/layout/properties/TabAlignment;Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;)V

    .line 62
    return-void
.end method

.method public constructor <init>(FLcom/itextpdf/layout/properties/TabAlignment;Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;)V
    .locals 1
    .param p1, "tabPosition"    # F
    .param p2, "tabAlignment"    # Lcom/itextpdf/layout/properties/TabAlignment;
    .param p3, "tabLeader"    # Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput p1, p0, Lcom/itextpdf/layout/element/TabStop;->tabPosition:F

    .line 77
    iput-object p2, p0, Lcom/itextpdf/layout/element/TabStop;->tabAlignment:Lcom/itextpdf/layout/properties/TabAlignment;

    .line 78
    iput-object p3, p0, Lcom/itextpdf/layout/element/TabStop;->tabLeader:Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;

    .line 79
    const/16 v0, 0x2e

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/layout/element/TabStop;->tabAnchor:Ljava/lang/Character;

    .line 80
    return-void
.end method


# virtual methods
.method public getTabAlignment()Lcom/itextpdf/layout/properties/TabAlignment;
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/itextpdf/layout/element/TabStop;->tabAlignment:Lcom/itextpdf/layout/properties/TabAlignment;

    return-object v0
.end method

.method public getTabAnchor()Ljava/lang/Character;
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/itextpdf/layout/element/TabStop;->tabAnchor:Ljava/lang/Character;

    return-object v0
.end method

.method public getTabLeader()Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;
    .locals 1

    .line 136
    iget-object v0, p0, Lcom/itextpdf/layout/element/TabStop;->tabLeader:Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;

    return-object v0
.end method

.method public getTabPosition()F
    .locals 1

    .line 88
    iget v0, p0, Lcom/itextpdf/layout/element/TabStop;->tabPosition:F

    return v0
.end method

.method public setTabAlignment(Lcom/itextpdf/layout/properties/TabAlignment;)V
    .locals 0
    .param p1, "tabAlignment"    # Lcom/itextpdf/layout/properties/TabAlignment;

    .line 108
    iput-object p1, p0, Lcom/itextpdf/layout/element/TabStop;->tabAlignment:Lcom/itextpdf/layout/properties/TabAlignment;

    .line 109
    return-void
.end method

.method public setTabAnchor(Ljava/lang/Character;)V
    .locals 0
    .param p1, "tabAnchor"    # Ljava/lang/Character;

    .line 126
    iput-object p1, p0, Lcom/itextpdf/layout/element/TabStop;->tabAnchor:Ljava/lang/Character;

    .line 127
    return-void
.end method

.method public setTabLeader(Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;)V
    .locals 0
    .param p1, "tabLeader"    # Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;

    .line 146
    iput-object p1, p0, Lcom/itextpdf/layout/element/TabStop;->tabLeader:Lcom/itextpdf/kernel/pdf/canvas/draw/ILineDrawer;

    .line 147
    return-void
.end method
