.class public final Lcom/itextpdf/layout/properties/ContinuousContainer;
.super Ljava/lang/Object;
.source "ContinuousContainer.java"


# static fields
.field private static final PROPERTIES_NEEDED_FOR_CONTINUOUS_CONTAINER:[I


# instance fields
.field private final properties:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 44
    const/16 v0, 0x2f

    const/16 v1, 0x9

    const/16 v2, 0x2b

    const/16 v3, 0xa

    filled-new-array {v2, v3, v0, v1}, [I

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/properties/ContinuousContainer;->PROPERTIES_NEEDED_FOR_CONTINUOUS_CONTAINER:[I

    return-void
.end method

.method private constructor <init>(Lcom/itextpdf/layout/renderer/IRenderer;)V
    .locals 7
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/IRenderer;

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/layout/properties/ContinuousContainer;->properties:Ljava/util/HashMap;

    .line 56
    sget-object v0, Lcom/itextpdf/layout/properties/ContinuousContainer;->PROPERTIES_NEEDED_FOR_CONTINUOUS_CONTAINER:[I

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget v3, v0, v2

    .line 57
    .local v3, "property":I
    iget-object v4, p0, Lcom/itextpdf/layout/properties/ContinuousContainer;->properties:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {p1, v3}, Lcom/itextpdf/layout/renderer/IRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .end local v3    # "property":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 59
    :cond_0
    return-void
.end method

.method public static clearPropertiesFromOverFlowRenderer(Lcom/itextpdf/layout/IPropertyContainer;)V
    .locals 3
    .param p0, "overFlowRenderer"    # Lcom/itextpdf/layout/IPropertyContainer;

    .line 67
    if-nez p0, :cond_0

    .line 68
    return-void

    .line 70
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v1, 0x8c

    invoke-interface {p0, v1}, Lcom/itextpdf/layout/IPropertyContainer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 71
    const/16 v0, 0x32

    const/4 v1, 0x0

    invoke-static {v1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    invoke-interface {p0, v0, v2}, Lcom/itextpdf/layout/IPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 72
    const/16 v0, 0x2e

    invoke-static {v1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    invoke-interface {p0, v0, v1}, Lcom/itextpdf/layout/IPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 73
    const/16 v0, 0xd

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Lcom/itextpdf/layout/IPropertyContainer;->setProperty(ILjava/lang/Object;)V

    .line 75
    :cond_1
    return-void
.end method

.method private static clearPropertiesFromSplitRenderer(Lcom/itextpdf/layout/renderer/AbstractRenderer;)V
    .locals 3
    .param p0, "blockRenderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 94
    if-nez p0, :cond_0

    .line 95
    return-void

    .line 97
    :cond_0
    const/16 v0, 0x2b

    const/4 v1, 0x0

    invoke-static {v1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 98
    const/16 v0, 0xa

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 99
    const/16 v0, 0x2f

    invoke-static {v1}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 101
    return-void
.end method

.method public static setupContinuousContainerIfNeeded(Lcom/itextpdf/layout/renderer/AbstractRenderer;)V
    .locals 2
    .param p0, "blockRenderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 83
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v1, 0x8c

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 84
    const/16 v0, 0x8d

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasProperty(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 85
    new-instance v1, Lcom/itextpdf/layout/properties/ContinuousContainer;

    invoke-direct {v1, p0}, Lcom/itextpdf/layout/properties/ContinuousContainer;-><init>(Lcom/itextpdf/layout/renderer/IRenderer;)V

    .line 86
    .local v1, "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    nop

    .line 87
    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 89
    .end local v1    # "continuousContainer":Lcom/itextpdf/layout/properties/ContinuousContainer;
    :cond_0
    invoke-static {p0}, Lcom/itextpdf/layout/properties/ContinuousContainer;->clearPropertiesFromSplitRenderer(Lcom/itextpdf/layout/renderer/AbstractRenderer;)V

    .line 91
    :cond_1
    return-void
.end method


# virtual methods
.method public reApplyProperties(Lcom/itextpdf/layout/renderer/AbstractRenderer;)V
    .locals 6
    .param p1, "blockRenderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 109
    sget-object v0, Lcom/itextpdf/layout/properties/ContinuousContainer;->PROPERTIES_NEEDED_FOR_CONTINUOUS_CONTAINER:[I

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget v3, v0, v2

    .line 110
    .local v3, "property":I
    iget-object v4, p0, Lcom/itextpdf/layout/properties/ContinuousContainer;->properties:Ljava/util/HashMap;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 109
    .end local v3    # "property":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 112
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/properties/ContinuousContainer;->properties:Ljava/util/HashMap;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/borders/Border;

    .line 113
    .local v0, "allBorders":Lcom/itextpdf/layout/borders/Border;
    iget-object v1, p0, Lcom/itextpdf/layout/properties/ContinuousContainer;->properties:Ljava/util/HashMap;

    const/16 v2, 0xa

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/borders/Border;

    .line 114
    .local v1, "bottomBorder":Lcom/itextpdf/layout/borders/Border;
    if-eqz v0, :cond_1

    if-nez v1, :cond_1

    .line 115
    invoke-virtual {p1, v2, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->setProperty(ILjava/lang/Object;)V

    .line 117
    :cond_1
    return-void
.end method
