.class final Lcom/itextpdf/layout/renderer/ListRenderer$ConstantFontTextRenderer;
.super Lcom/itextpdf/layout/renderer/TextRenderer;
.source "ListRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/ListRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ConstantFontTextRenderer"
.end annotation


# instance fields
.field private constantFontName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/element/Text;Ljava/lang/String;)V
    .locals 0
    .param p1, "textElement"    # Lcom/itextpdf/layout/element/Text;
    .param p2, "font"    # Ljava/lang/String;

    .line 395
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/TextRenderer;-><init>(Lcom/itextpdf/layout/element/Text;)V

    .line 396
    iput-object p2, p0, Lcom/itextpdf/layout/renderer/ListRenderer$ConstantFontTextRenderer;->constantFontName:Ljava/lang/String;

    .line 397
    return-void
.end method


# virtual methods
.method public draw(Lcom/itextpdf/layout/renderer/DrawContext;)V
    .locals 2
    .param p1, "drawContext"    # Lcom/itextpdf/layout/renderer/DrawContext;

    .line 402
    :try_start_0
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/ListRenderer$ConstantFontTextRenderer;->constantFontName:Ljava/lang/String;

    invoke-static {v0}, Lcom/itextpdf/kernel/font/PdfFontFactory;->createFont(Ljava/lang/String;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    const/16 v1, 0x14

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/layout/renderer/ListRenderer$ConstantFontTextRenderer;->setProperty(ILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 405
    goto :goto_0

    .line 403
    :catch_0
    move-exception v0

    .line 406
    :goto_0
    invoke-super {p0, p1}, Lcom/itextpdf/layout/renderer/TextRenderer;->draw(Lcom/itextpdf/layout/renderer/DrawContext;)V

    .line 407
    return-void
.end method
