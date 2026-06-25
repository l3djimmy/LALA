.class public Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;
.super Ljava/lang/Object;
.source "OpenTableLookup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/otf/OpenTableLookup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GlyphIndexer"
.end annotation


# instance fields
.field public glyph:Lcom/itextpdf/io/font/otf/Glyph;

.field public idx:I

.field public line:Lcom/itextpdf/io/font/otf/GlyphLine;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public nextGlyph(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V
    .locals 2
    .param p1, "openReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p2, "lookupFlag"    # I

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    .line 72
    :goto_0
    iget v0, p0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v0, v1, :cond_1

    .line 73
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, p0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    .line 74
    .local v0, "g":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v1

    invoke-virtual {p1, v1, p2}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->isSkip(II)Z

    move-result v1

    if-nez v1, :cond_0

    .line 75
    iput-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    .line 76
    goto :goto_1

    .line 78
    .end local v0    # "g":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_0
    goto :goto_0

    .line 79
    :cond_1
    :goto_1
    return-void
.end method

.method public previousGlyph(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V
    .locals 2
    .param p1, "openReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p2, "lookupFlag"    # I

    .line 82
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    .line 83
    :goto_0
    iget v0, p0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    iget-object v1, p0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, v1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    if-lt v0, v1, :cond_1

    .line 84
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    iget v1, p0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v0

    .line 85
    .local v0, "g":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v1

    invoke-virtual {p1, v1, p2}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->isSkip(II)Z

    move-result v1

    if-nez v1, :cond_0

    .line 86
    iput-object v0, p0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->glyph:Lcom/itextpdf/io/font/otf/Glyph;

    .line 87
    goto :goto_1

    .line 89
    .end local v0    # "g":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_0
    goto :goto_0

    .line 90
    :cond_1
    :goto_1
    return-void
.end method
