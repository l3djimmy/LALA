.class public Lcom/itextpdf/layout/element/AreaBreak;
.super Lcom/itextpdf/layout/element/AbstractElement;
.source "AreaBreak.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/layout/element/AbstractElement<",
        "Lcom/itextpdf/layout/element/AreaBreak;",
        ">;"
    }
.end annotation


# instance fields
.field protected pageSize:Lcom/itextpdf/kernel/geom/PageSize;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 45
    sget-object v0, Lcom/itextpdf/layout/properties/AreaBreakType;->NEXT_AREA:Lcom/itextpdf/layout/properties/AreaBreakType;

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/element/AreaBreak;-><init>(Lcom/itextpdf/layout/properties/AreaBreakType;)V

    .line 46
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/geom/PageSize;)V
    .locals 1
    .param p1, "pageSize"    # Lcom/itextpdf/kernel/geom/PageSize;

    .line 62
    sget-object v0, Lcom/itextpdf/layout/properties/AreaBreakType;->NEXT_PAGE:Lcom/itextpdf/layout/properties/AreaBreakType;

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/element/AreaBreak;-><init>(Lcom/itextpdf/layout/properties/AreaBreakType;)V

    .line 63
    iput-object p1, p0, Lcom/itextpdf/layout/element/AreaBreak;->pageSize:Lcom/itextpdf/kernel/geom/PageSize;

    .line 64
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/properties/AreaBreakType;)V
    .locals 1
    .param p1, "areaBreakType"    # Lcom/itextpdf/layout/properties/AreaBreakType;

    .line 52
    invoke-direct {p0}, Lcom/itextpdf/layout/element/AbstractElement;-><init>()V

    .line 53
    const/4 v0, 0x2

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/AreaBreak;->setProperty(ILjava/lang/Object;)V

    .line 54
    return-void
.end method


# virtual methods
.method public getPageSize()Lcom/itextpdf/kernel/geom/PageSize;
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/itextpdf/layout/element/AreaBreak;->pageSize:Lcom/itextpdf/kernel/geom/PageSize;

    return-object v0
.end method

.method public getType()Lcom/itextpdf/layout/properties/AreaBreakType;
    .locals 1

    .line 87
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/AreaBreak;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/AreaBreakType;

    return-object v0
.end method

.method protected makeNewRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 1

    .line 92
    new-instance v0, Lcom/itextpdf/layout/renderer/AreaBreakRenderer;

    invoke-direct {v0, p0}, Lcom/itextpdf/layout/renderer/AreaBreakRenderer;-><init>(Lcom/itextpdf/layout/element/AreaBreak;)V

    return-object v0
.end method

.method public setPageSize(Lcom/itextpdf/kernel/geom/PageSize;)V
    .locals 0
    .param p1, "pageSize"    # Lcom/itextpdf/kernel/geom/PageSize;

    .line 79
    iput-object p1, p0, Lcom/itextpdf/layout/element/AreaBreak;->pageSize:Lcom/itextpdf/kernel/geom/PageSize;

    .line 80
    return-void
.end method
