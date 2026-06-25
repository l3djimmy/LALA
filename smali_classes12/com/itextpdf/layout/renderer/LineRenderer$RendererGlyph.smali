.class public Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;
.super Ljava/lang/Object;
.source "LineRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/LineRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RendererGlyph"
.end annotation


# instance fields
.field public glyph:Lcom/itextpdf/io/font/otf/Glyph;

.field public renderer:Lcom/itextpdf/layout/renderer/TextRenderer;


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/font/otf/Glyph;Lcom/itextpdf/layout/renderer/TextRenderer;)V
    .locals 0
    .param p1, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;
    .param p2, "textRenderer"    # Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 1627
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1628
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    .line 1629
    iput-object p2, p0, Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;->renderer:Lcom/itextpdf/layout/renderer/TextRenderer;

    .line 1630
    return-void
.end method
