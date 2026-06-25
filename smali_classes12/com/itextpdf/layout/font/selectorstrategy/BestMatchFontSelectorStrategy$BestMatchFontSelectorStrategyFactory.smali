.class public final Lcom/itextpdf/layout/font/selectorstrategy/BestMatchFontSelectorStrategy$BestMatchFontSelectorStrategyFactory;
.super Ljava/lang/Object;
.source "BestMatchFontSelectorStrategy.java"

# interfaces
.implements Lcom/itextpdf/layout/font/selectorstrategy/IFontSelectorStrategyFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/font/selectorstrategy/BestMatchFontSelectorStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "BestMatchFontSelectorStrategyFactory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFontSelectorStrategy(Lcom/itextpdf/layout/font/FontProvider;Lcom/itextpdf/layout/font/FontSelector;Lcom/itextpdf/layout/font/FontSet;)Lcom/itextpdf/layout/font/selectorstrategy/IFontSelectorStrategy;
    .locals 1
    .param p1, "fontProvider"    # Lcom/itextpdf/layout/font/FontProvider;
    .param p2, "fontSelector"    # Lcom/itextpdf/layout/font/FontSelector;
    .param p3, "additionalFonts"    # Lcom/itextpdf/layout/font/FontSet;

    .line 64
    new-instance v0, Lcom/itextpdf/layout/font/selectorstrategy/BestMatchFontSelectorStrategy;

    invoke-direct {v0, p1, p2, p3}, Lcom/itextpdf/layout/font/selectorstrategy/BestMatchFontSelectorStrategy;-><init>(Lcom/itextpdf/layout/font/FontProvider;Lcom/itextpdf/layout/font/FontSelector;Lcom/itextpdf/layout/font/FontSet;)V

    return-object v0
.end method
