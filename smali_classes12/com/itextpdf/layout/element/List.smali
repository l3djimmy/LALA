.class public Lcom/itextpdf/layout/element/List;
.super Lcom/itextpdf/layout/element/BlockElement;
.source "List.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/layout/element/BlockElement<",
        "Lcom/itextpdf/layout/element/List;",
        ">;"
    }
.end annotation


# static fields
.field public static final DEFAULT_LIST_SYMBOL:Ljava/lang/String; = "- "


# instance fields
.field protected tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Lcom/itextpdf/layout/element/BlockElement;-><init>()V

    .line 52
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/properties/ListNumberingType;)V
    .locals 0
    .param p1, "listNumberingType"    # Lcom/itextpdf/layout/properties/ListNumberingType;

    .line 60
    invoke-direct {p0}, Lcom/itextpdf/layout/element/BlockElement;-><init>()V

    .line 61
    invoke-virtual {p0, p1}, Lcom/itextpdf/layout/element/List;->setListSymbol(Lcom/itextpdf/layout/properties/ListNumberingType;)Lcom/itextpdf/layout/element/List;

    .line 62
    return-void
.end method


# virtual methods
.method public add(Lcom/itextpdf/layout/element/ListItem;)Lcom/itextpdf/layout/element/List;
    .locals 1
    .param p1, "listItem"    # Lcom/itextpdf/layout/element/ListItem;

    .line 87
    iget-object v0, p0, Lcom/itextpdf/layout/element/List;->childElements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    return-object p0
.end method

.method public add(Ljava/lang/String;)Lcom/itextpdf/layout/element/List;
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .line 98
    new-instance v0, Lcom/itextpdf/layout/element/ListItem;

    invoke-direct {v0, p1}, Lcom/itextpdf/layout/element/ListItem;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/List;->add(Lcom/itextpdf/layout/element/ListItem;)Lcom/itextpdf/layout/element/List;

    move-result-object v0

    return-object v0
.end method

.method public getAccessibilityProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;
    .locals 2

    .line 240
    iget-object v0, p0, Lcom/itextpdf/layout/element/List;->tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    if-nez v0, :cond_0

    .line 241
    new-instance v0, Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    const-string v1, "L"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/itextpdf/layout/element/List;->tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    .line 243
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/layout/element/List;->tagProperties:Lcom/itextpdf/kernel/pdf/tagutils/DefaultAccessibilityProperties;

    return-object v0
.end method

.method public getDefaultProperty(I)Ljava/lang/Object;
    .locals 2
    .param p1, "property"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            ">(I)TT1;"
        }
    .end annotation

    .line 66
    sparse-switch p1, :sswitch_data_0

    .line 76
    invoke-super {p0, p1}, Lcom/itextpdf/layout/element/BlockElement;->getDefaultProperty(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 74
    :sswitch_0
    sget-object v0, Lcom/itextpdf/layout/properties/ListSymbolPosition;->DEFAULT:Lcom/itextpdf/layout/properties/ListSymbolPosition;

    return-object v0

    .line 72
    :sswitch_1
    const-string v0, ". "

    return-object v0

    .line 70
    :sswitch_2
    const-string v0, ""

    return-object v0

    .line 68
    :sswitch_3
    new-instance v0, Lcom/itextpdf/layout/element/Text;

    const-string v1, "- "

    invoke-direct {v0, v1}, Lcom/itextpdf/layout/element/Text;-><init>(Ljava/lang/String;)V

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x25 -> :sswitch_3
        0x29 -> :sswitch_2
        0x2a -> :sswitch_1
        0x53 -> :sswitch_0
    .end sparse-switch
.end method

.method public getPostSymbolText()Ljava/lang/String;
    .locals 1

    .line 208
    const/16 v0, 0x2a

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/List;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getPreSymbolText()Ljava/lang/String;
    .locals 1

    .line 226
    const/16 v0, 0x29

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/List;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getSymbolIndent()Ljava/lang/Float;
    .locals 1

    .line 188
    const/16 v0, 0x27

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/List;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    return-object v0
.end method

.method protected makeNewRenderer()Lcom/itextpdf/layout/renderer/IRenderer;
    .locals 1

    .line 248
    new-instance v0, Lcom/itextpdf/layout/renderer/ListRenderer;

    invoke-direct {v0, p0}, Lcom/itextpdf/layout/renderer/ListRenderer;-><init>(Lcom/itextpdf/layout/element/List;)V

    return-object v0
.end method

.method public setItemStartIndex(I)Lcom/itextpdf/layout/element/List;
    .locals 2
    .param p1, "start"    # I

    .line 108
    const/16 v0, 0x24

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/List;->setProperty(ILjava/lang/Object;)V

    .line 109
    return-object p0
.end method

.method public setListSymbol(Lcom/itextpdf/layout/element/Image;)Lcom/itextpdf/layout/element/List;
    .locals 1
    .param p1, "image"    # Lcom/itextpdf/layout/element/Image;

    .line 143
    const/16 v0, 0x25

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/List;->setProperty(ILjava/lang/Object;)V

    .line 144
    return-object p0
.end method

.method public setListSymbol(Lcom/itextpdf/layout/element/Text;)Lcom/itextpdf/layout/element/List;
    .locals 1
    .param p1, "text"    # Lcom/itextpdf/layout/element/Text;

    .line 131
    const/16 v0, 0x25

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/List;->setProperty(ILjava/lang/Object;)V

    .line 132
    return-object p0
.end method

.method public setListSymbol(Lcom/itextpdf/layout/properties/ListNumberingType;)Lcom/itextpdf/layout/element/List;
    .locals 1
    .param p1, "listNumberingType"    # Lcom/itextpdf/layout/properties/ListNumberingType;

    .line 156
    sget-object v0, Lcom/itextpdf/layout/properties/ListNumberingType;->ZAPF_DINGBATS_1:Lcom/itextpdf/layout/properties/ListNumberingType;

    if-eq p1, v0, :cond_0

    sget-object v0, Lcom/itextpdf/layout/properties/ListNumberingType;->ZAPF_DINGBATS_2:Lcom/itextpdf/layout/properties/ListNumberingType;

    if-eq p1, v0, :cond_0

    sget-object v0, Lcom/itextpdf/layout/properties/ListNumberingType;->ZAPF_DINGBATS_3:Lcom/itextpdf/layout/properties/ListNumberingType;

    if-eq p1, v0, :cond_0

    sget-object v0, Lcom/itextpdf/layout/properties/ListNumberingType;->ZAPF_DINGBATS_4:Lcom/itextpdf/layout/properties/ListNumberingType;

    if-ne p1, v0, :cond_1

    .line 158
    :cond_0
    const-string v0, " "

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/List;->setPostSymbolText(Ljava/lang/String;)V

    .line 160
    :cond_1
    const/16 v0, 0x25

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/List;->setProperty(ILjava/lang/Object;)V

    .line 161
    return-object p0
.end method

.method public setListSymbol(Ljava/lang/String;)Lcom/itextpdf/layout/element/List;
    .locals 1
    .param p1, "symbol"    # Ljava/lang/String;

    .line 120
    new-instance v0, Lcom/itextpdf/layout/element/Text;

    invoke-direct {v0, p1}, Lcom/itextpdf/layout/element/Text;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/element/List;->setListSymbol(Lcom/itextpdf/layout/element/Text;)Lcom/itextpdf/layout/element/List;

    move-result-object v0

    return-object v0
.end method

.method public setListSymbolAlignment(Lcom/itextpdf/layout/properties/ListSymbolAlignment;)Lcom/itextpdf/layout/element/List;
    .locals 1
    .param p1, "alignment"    # Lcom/itextpdf/layout/properties/ListSymbolAlignment;

    .line 178
    const/16 v0, 0x26

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/List;->setProperty(ILjava/lang/Object;)V

    .line 179
    return-object p0
.end method

.method public setPostSymbolText(Ljava/lang/String;)V
    .locals 1
    .param p1, "postSymbolText"    # Ljava/lang/String;

    .line 217
    const/16 v0, 0x2a

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/List;->setProperty(ILjava/lang/Object;)V

    .line 218
    return-void
.end method

.method public setPreSymbolText(Ljava/lang/String;)V
    .locals 1
    .param p1, "preSymbolText"    # Ljava/lang/String;

    .line 235
    const/16 v0, 0x29

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/layout/element/List;->setProperty(ILjava/lang/Object;)V

    .line 236
    return-void
.end method

.method public setSymbolIndent(F)Lcom/itextpdf/layout/element/List;
    .locals 2
    .param p1, "symbolIndent"    # F

    .line 198
    const/16 v0, 0x27

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/layout/element/List;->setProperty(ILjava/lang/Object;)V

    .line 199
    return-object p0
.end method
