.class final Lcom/itextpdf/layout/renderer/TextRenderer$CustomGlyphLineFilter;
.super Ljava/lang/Object;
.source "TextRenderer.java"

# interfaces
.implements Lcom/itextpdf/io/font/otf/GlyphLine$IGlyphLineFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/TextRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "CustomGlyphLineFilter"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1867
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/itextpdf/layout/renderer/TextRenderer$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/itextpdf/layout/renderer/TextRenderer$1;

    .line 1867
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/TextRenderer$CustomGlyphLineFilter;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/itextpdf/io/font/otf/Glyph;)Z
    .locals 1
    .param p1, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 1870
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/TextRenderer;->access$100(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method
