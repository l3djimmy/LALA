.class public Lcom/itextpdf/layout/element/Paragraph;
.super Lcom/itextpdf/layout/element/BlockElement;
.source "Paragraph.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/layout/element/BlockElement<",
        "Lcom/itextpdf/layout/element/Paragraph;",
        ">;"
    }
.end annotation


# instance fields
.field protected tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Lcom/itextpdf/layout/element/BlockElement;-><init>()V

    .line 53
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/element/Text;)V
    .locals 0
    .param p1, "text"    # Lcom/itextpdf/layout/element/Text;

    .line 69
    invoke-direct {p0}, Lcom/itextpdf/layout/element/BlockElement;-><init>()V

    .line 70
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/element/Paragraph;->add(Lcom/itextpdf/layout/element/ILeafElement;)Lcom/itextpdf/layout/element/Paragraph;

    .line 71
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .line 61
    new-instance v0, Lcom/itextpdf/layout/element/Text;

    invoke-direct {v0, p1}, Lcom/itextpdf/layout/element/Text;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/element/Paragraph;-><init>(Lcom/itextpdf/layout/element/Text;)V

    .line 62
    return-void
.end method

.method private addTabStopsAsProperty(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/element/TabStop;",
            ">;)V"
        }
    .end annotation

    .line 248
    .local p1, "newTabStops":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/element/TabStop;>;"
    const/16 v0, 0x45

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Paragraph;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 249
    .local v1, "tabStops":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Float;Lcom/itextpdf/layout/element/TabStop;>;"
    if-nez v1, :cond_0

    .line 250
    new-instance v2, Ljava/util/TreeMap;

    invoke-direct {v2}, Ljava/util/TreeMap;-><init>()V

    move-object v1, v2

    .line 251
    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Paragraph;->setProperty(ILjava/lang/Object;)V

    .line 253
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/element/TabStop;

    .line 254
    .local v2, "tabStop":Lcom/itextpdf/layout/element/TabStop;
    invoke-virtual {v2}, Lcom/itextpdf/layout/element/TabStop;->getTabPosition()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    .end local v2    # "tabStop":Lcom/itextpdf/layout/element/TabStop;
    goto :goto_0

    .line 256
    :cond_1
    return-void
.end method


# virtual methods
.method public add(Lcom/itextpdf/layout/element/IBlockElement;)Lcom/itextpdf/layout/element/Paragraph;
    .locals 1
    .param p1, "element"    # Lcom/itextpdf/layout/element/IBlockElement;

    .line 101
    iget-object v0, p0, Lcom/itextpdf/layout/element/Paragraph;->childElements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    return-object p0
.end method

.method public add(Lcom/itextpdf/layout/element/ILeafElement;)Lcom/itextpdf/layout/element/Paragraph;
    .locals 1
    .param p1, "element"    # Lcom/itextpdf/layout/element/ILeafElement;

    .line 90
    iget-object v0, p0, Lcom/itextpdf/layout/element/Paragraph;->childElements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    return-object p0
.end method

.method public add(Ljava/lang/String;)Lcom/itextpdf/layout/element/Paragraph;
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .line 80
    new-instance v0, Lcom/itextpdf/layout/element/Text;

    invoke-direct {v0, p1}, Lcom/itextpdf/layout/element/Text;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Paragraph;->add(Lcom/itextpdf/layout/element/ILeafElement;)Lcom/itextpdf/layout/element/Paragraph;

    move-result-object v0

    return-object v0
.end method

.method public addAll(Ljava/util/List;)Lcom/itextpdf/layout/element/Paragraph;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T2::",
            "Lcom/itextpdf/layout/element/ILeafElement;",
            ">(",
            "Ljava/util/List<",
            "TT2;>;)",
            "Lcom/itextpdf/layout/element/Paragraph;"
        }
    .end annotation

    .line 113
    .local p1, "elements":Ljava/util/List;, "Ljava/util/List<TT2;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/element/ILeafElement;

    .line 114
    .local v1, "element":Lcom/itextpdf/layout/element/ILeafElement;
    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/element/Paragraph;->add(Lcom/itextpdf/layout/element/ILeafElement;)Lcom/itextpdf/layout/element/Paragraph;

    .line 115
    .end local v1    # "element":Lcom/itextpdf/layout/element/ILeafElement;
    goto :goto_0

    .line 116
    :cond_0
    return-object p0
.end method

.method public addTabStops(Ljava/util/List;)Lcom/itextpdf/layout/element/Paragraph;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/element/TabStop;",
            ">;)",
            "Lcom/itextpdf/layout/element/Paragraph;"
        }
    .end annotation

    .line 139
    .local p1, "tabStops":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/element/TabStop;>;"
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/element/Paragraph;->addTabStopsAsProperty(Ljava/util/List;)V

    .line 140
    return-object p0
.end method

.method public varargs addTabStops([Lcom/itextpdf/layout/element/TabStop;)Lcom/itextpdf/layout/element/Paragraph;
    .locals 1
    .param p1, "tabStops"    # [Lcom/itextpdf/layout/element/TabStop;

    .line 127
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/element/Paragraph;->addTabStopsAsProperty(Ljava/util/List;)V

    .line 128
    return-object p0
.end method

.method public getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 2

    .line 236
    iget-object v0, p0, Lcom/itextpdf/layout/element/Paragraph;->tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    if-nez v0, :cond_0

    .line 237
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    const-string v1, "P"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/itextpdf/layout/element/Paragraph;->tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    .line 239
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/element/Paragraph;->tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    return-object v0
.end method

.method public getDefaultProperty(I)Ljava/lang/Object;
    .locals 3
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(I)TT1;"
        }
    .end annotation

    .line 161
    sparse-switch p1, :sswitch_data_0

    .line 172
    invoke-super {p0, p1}, Lcom/itextpdf/layout/element/BlockElement;->getDefaultProperty(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 170
    :sswitch_0
    const/high16 v0, 0x42480000    # 50.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0

    .line 168
    :sswitch_1
    const/high16 v0, 0x40800000    # 4.0f

    invoke-static {v0}, Lcom/itextpdf/layout/properties/UnitValue;->createPointValue(F)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v0

    return-object v0

    .line 163
    :sswitch_2
    new-instance v0, Lcom/itextpdf/layout/properties/Leading;

    iget-object v1, p0, Lcom/itextpdf/layout/element/Paragraph;->childElements:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/itextpdf/layout/element/Paragraph;->childElements:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/itextpdf/layout/element/Image;

    if-eqz v1, :cond_0

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_0
    const v1, 0x3faccccd    # 1.35f

    :goto_0
    const/4 v2, 0x2

    invoke-direct {v0, v2, v1}, Lcom/itextpdf/layout/properties/Leading;-><init>(IF)V

    return-object v0

    .line 165
    :sswitch_3
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x12 -> :sswitch_3
        0x21 -> :sswitch_2
        0x2b -> :sswitch_1
        0x2e -> :sswitch_1
        0x43 -> :sswitch_0
    .end sparse-switch
.end method

.method protected makeNewRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 1

    .line 244
    new-instance v0, Lcom/itextpdf/layout/renderer/ParagraphRenderer;

    invoke-direct {v0, p0}, Lcom/itextpdf/layout/renderer/ParagraphRenderer;-><init>(Lcom/itextpdf/layout/element/Paragraph;)V

    return-object v0
.end method

.method public removeTabStop(F)Lcom/itextpdf/layout/element/Paragraph;
    .locals 2
    .param p1, "tabStopPosition"    # F

    .line 152
    const/16 v0, 0x45

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/Paragraph;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 153
    .local v0, "tabStops":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Float;Lcom/itextpdf/layout/element/TabStop;>;"
    if-eqz v0, :cond_0

    .line 154
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    :cond_0
    return-object p0
.end method

.method public setFirstLineIndent(F)Lcom/itextpdf/layout/element/Paragraph;
    .locals 2
    .param p1, "indent"    # F

    .line 184
    const/16 v0, 0x12

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/Paragraph;->setProperty(ILjava/lang/Object;)V

    .line 185
    return-object p0
.end method

.method public setFixedLeading(F)Lcom/itextpdf/layout/element/Paragraph;
    .locals 2
    .param p1, "leading"    # F

    .line 218
    new-instance v0, Lcom/itextpdf/layout/properties/Leading;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p1}, Lcom/itextpdf/layout/properties/Leading;-><init>(IF)V

    const/16 v1, 0x21

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Paragraph;->setProperty(ILjava/lang/Object;)V

    .line 219
    return-object p0
.end method

.method public setMultipliedLeading(F)Lcom/itextpdf/layout/element/Paragraph;
    .locals 2
    .param p1, "leading"    # F

    .line 230
    new-instance v0, Lcom/itextpdf/layout/properties/Leading;

    const/4 v1, 0x2

    invoke-direct {v0, v1, p1}, Lcom/itextpdf/layout/properties/Leading;-><init>(IF)V

    const/16 v1, 0x21

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/element/Paragraph;->setProperty(ILjava/lang/Object;)V

    .line 231
    return-object p0
.end method

.method public setOrphansControl(Lcom/itextpdf/layout/properties/ParagraphOrphansControl;)Lcom/itextpdf/layout/element/Paragraph;
    .locals 1
    .param p1, "orphansControl"    # Lcom/itextpdf/layout/properties/ParagraphOrphansControl;

    .line 195
    const/16 v0, 0x79

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/Paragraph;->setProperty(ILjava/lang/Object;)V

    .line 196
    return-object p0
.end method

.method public setWidowsControl(Lcom/itextpdf/layout/properties/ParagraphWidowsControl;)Lcom/itextpdf/layout/element/Paragraph;
    .locals 1
    .param p1, "widowsControl"    # Lcom/itextpdf/layout/properties/ParagraphWidowsControl;

    .line 206
    const/16 v0, 0x7a

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/Paragraph;->setProperty(ILjava/lang/Object;)V

    .line 207
    return-object p0
.end method
