.class public Lcom/itextpdf/layout/font/selectorstrategy/FirstMatchFontSelectorStrategy;
.super Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;
.source "FirstMatchFontSelectorStrategy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/layout/font/selectorstrategy/FirstMatchFontSelectorStrategy$FirstMathFontSelectorStrategyFactory;
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/font/FontProvider;Lcom/itextpdf/layout/font/FontSelector;Lcom/itextpdf/layout/font/FontSet;)V
    .locals 0
    .param p1, "fontProvider"    # Lcom/itextpdf/layout/font/FontProvider;
    .param p2, "fontSelector"    # Lcom/itextpdf/layout/font/FontSelector;
    .param p3, "additionalFonts"    # Lcom/itextpdf/layout/font/FontSet;

    .line 43
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/layout/font/selectorstrategy/AbstractFontSelectorStrategy;-><init>(Lcom/itextpdf/layout/font/FontProvider;Lcom/itextpdf/layout/font/FontSelector;Lcom/itextpdf/layout/font/FontSet;)V

    .line 44
    return-void
.end method


# virtual methods
.method protected isCurrentFontCheckRequired()Z
    .locals 1

    .line 51
    const/4 v0, 0x0

    return v0
.end method
