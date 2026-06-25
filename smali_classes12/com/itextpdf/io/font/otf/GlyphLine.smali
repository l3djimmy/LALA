.class public Lcom/itextpdf/io/font/otf/GlyphLine;
.super Ljava/lang/Object;
.source "GlyphLine.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;,
        Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;,
        Lcom/itextpdf/io/font/otf/GlyphLine$IGlyphLineFilter;
    }
.end annotation


# instance fields
.field protected actualText:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;",
            ">;"
        }
    .end annotation
.end field

.field public end:I

.field protected glyphs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;"
        }
    .end annotation
.end field

.field public idx:I

.field public start:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    .line 40
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/io/font/otf/GlyphLine;)V
    .locals 1
    .param p1, "other"    # Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    iget-object v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    .line 86
    iget-object v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    .line 87
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    iput v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 88
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    iput v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 89
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iput v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    .line 90
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/io/font/otf/GlyphLine;II)V
    .locals 1
    .param p1, "other"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p2, "start"    # I
    .param p3, "end"    # I

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    iget-object v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v0, p2, p3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    .line 101
    iget-object v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 102
    iget-object v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    invoke-interface {v0, p2, p3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    .line 104
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 105
    sub-int v0, p3, p2

    iput v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 106
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    sub-int/2addr v0, p2

    iput v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    .line 107
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;)V"
        }
    .end annotation

    .line 47
    .local p1, "glyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    .line 49
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 50
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 51
    return-void
.end method

.method public constructor <init>(Ljava/util/List;II)V
    .locals 0
    .param p2, "start"    # I
    .param p3, "end"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;II)V"
        }
    .end annotation

    .line 60
    .local p1, "glyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    .line 62
    iput p2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 63
    iput p3, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 64
    return-void
.end method

.method protected constructor <init>(Ljava/util/List;Ljava/util/List;II)V
    .locals 0
    .param p3, "start"    # I
    .param p4, "end"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;",
            ">;II)V"
        }
    .end annotation

    .line 75
    .local p1, "glyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    .local p2, "actualText":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;>;"
    invoke-direct {p0, p1, p3, p4}, Lcom/itextpdf/io/font/otf/GlyphLine;-><init>(Ljava/util/List;II)V

    .line 76
    iput-object p2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    .line 77
    return-void
.end method

.method private addAllGlyphs(ILjava/util/List;)V
    .locals 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;)V"
        }
    .end annotation

    .line 400
    .local p2, "additionalGlyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 401
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 402
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 403
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, p1, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 402
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 406
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method private removeGlyph(I)V
    .locals 1
    .param p1, "index"    # I

    .line 393
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 394
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 395
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 397
    :cond_0
    return-void
.end method


# virtual methods
.method public add(ILcom/itextpdf/io/font/otf/Glyph;)V
    .locals 2
    .param p1, "index"    # I
    .param p2, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 169
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 170
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 171
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 173
    :cond_0
    return-void
.end method

.method public add(Lcom/itextpdf/io/font/otf/Glyph;)V
    .locals 2
    .param p1, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 162
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 164
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    :cond_0
    return-void
.end method

.method public add(Lcom/itextpdf/io/font/otf/GlyphLine;)V
    .locals 5
    .param p1, "other"    # Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 190
    iget-object v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 191
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    if-nez v0, :cond_0

    .line 192
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    .line 193
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 194
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 197
    .end local v0    # "i":I
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    iget-object v2, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    iget v3, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    iget v4, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    invoke-interface {v2, v3, v4}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 199
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    iget-object v2, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    iget v3, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    iget v4, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    invoke-interface {v2, v3, v4}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 200
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    if-eqz v0, :cond_2

    .line 201
    :goto_1
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 202
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 205
    :cond_2
    return-void
.end method

.method public copy(II)Lcom/itextpdf/io/font/otf/GlyphLine;
    .locals 3
    .param p1, "left"    # I
    .param p2, "right"    # I

    .line 145
    new-instance v0, Lcom/itextpdf/io/font/otf/GlyphLine;

    invoke-direct {v0}, Lcom/itextpdf/io/font/otf/GlyphLine;-><init>()V

    .line 146
    .local v0, "glyphLine":Lcom/itextpdf/io/font/otf/GlyphLine;
    const/4 v1, 0x0

    iput v1, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 147
    sub-int v1, p2, p1

    iput v1, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 148
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v2, p1, p2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    .line 149
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    invoke-interface {v2, p1, p2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    :goto_0
    iput-object v1, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    .line 150
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 10
    .param p1, "obj"    # Ljava/lang/Object;

    .line 344
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 345
    return v0

    .line 347
    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_f

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto/16 :goto_3

    .line 350
    :cond_1
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 351
    .local v2, "other":Lcom/itextpdf/io/font/otf/GlyphLine;
    iget v3, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    iget v4, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    sub-int/2addr v3, v4

    iget v4, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    iget v5, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    sub-int/2addr v4, v5

    if-eq v3, v4, :cond_2

    .line 352
    return v1

    .line 354
    :cond_2
    iget-object v3, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    if-nez v3, :cond_3

    iget-object v3, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    if-nez v3, :cond_4

    :cond_3
    iget-object v3, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    if-eqz v3, :cond_5

    iget-object v3, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    if-nez v3, :cond_5

    .line 355
    :cond_4
    return v1

    .line 357
    :cond_5
    iget v3, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .local v3, "i":I
    :goto_0
    iget v4, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v3, v4, :cond_e

    .line 358
    iget v4, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    add-int/2addr v4, v3

    iget v5, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    sub-int/2addr v4, v5

    .line 359
    .local v4, "otherPos":I
    invoke-virtual {p0, v3}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v5

    .line 360
    .local v5, "myGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v2, v4}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v6

    .line 361
    .local v6, "otherGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    if-nez v5, :cond_6

    if-nez v6, :cond_7

    :cond_6
    if-eqz v5, :cond_8

    invoke-virtual {v5, v6}, Lcom/itextpdf/io/font/otf/Glyph;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_8

    .line 362
    :cond_7
    return v1

    .line 364
    :cond_8
    iget-object v7, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    const/4 v8, 0x0

    if-nez v7, :cond_9

    move-object v7, v8

    goto :goto_1

    :cond_9
    iget-object v7, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;

    .line 365
    .local v7, "myAT":Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;
    :goto_1
    iget-object v9, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    if-nez v9, :cond_a

    goto :goto_2

    :cond_a
    iget-object v8, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;

    .line 366
    .local v8, "otherAT":Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;
    :goto_2
    if-nez v7, :cond_b

    if-nez v8, :cond_c

    :cond_b
    if-eqz v7, :cond_d

    invoke-virtual {v7, v8}, Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_d

    .line 367
    :cond_c
    return v1

    .line 357
    .end local v4    # "otherPos":I
    .end local v5    # "myGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v6    # "otherGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    .end local v7    # "myAT":Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;
    .end local v8    # "otherAT":Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;
    :cond_d
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 370
    .end local v3    # "i":I
    :cond_e
    return v0

    .line 348
    .end local v2    # "other":Lcom/itextpdf/io/font/otf/GlyphLine;
    :cond_f
    :goto_3
    return v1
.end method

.method public filter(Lcom/itextpdf/io/font/otf/GlyphLine$IGlyphLineFilter;)Lcom/itextpdf/io/font/otf/GlyphLine;
    .locals 6
    .param p1, "filter"    # Lcom/itextpdf/io/font/otf/GlyphLine$IGlyphLineFilter;

    .line 306
    const/4 v0, 0x0

    .line 307
    .local v0, "anythingFiltered":Z
    new-instance v1, Ljava/util/ArrayList;

    iget v2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    iget v3, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    sub-int/2addr v2, v3

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 308
    .local v1, "filteredGlyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    if-eqz v2, :cond_0

    new-instance v2, Ljava/util/ArrayList;

    iget v3, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    iget v4, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    sub-int/2addr v3, v4

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 309
    .local v2, "filteredActualText":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;>;"
    :goto_0
    iget v3, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .local v3, "i":I
    :goto_1
    iget v4, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v3, v4, :cond_3

    .line 310
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/io/font/otf/Glyph;

    invoke-interface {p1, v4}, Lcom/itextpdf/io/font/otf/GlyphLine$IGlyphLineFilter;->accept(Lcom/itextpdf/io/font/otf/Glyph;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 311
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 312
    if-eqz v2, :cond_2

    .line 313
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 316
    :cond_1
    const/4 v0, 0x1

    .line 309
    :cond_2
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 319
    .end local v3    # "i":I
    :cond_3
    if-eqz v0, :cond_4

    .line 320
    new-instance v3, Lcom/itextpdf/io/font/otf/GlyphLine;

    const/4 v4, 0x0

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v3, v1, v2, v4, v5}, Lcom/itextpdf/io/font/otf/GlyphLine;-><init>(Ljava/util/List;Ljava/util/List;II)V

    return-object v3

    .line 322
    :cond_4
    return-object p0
.end method

.method public get(I)Lcom/itextpdf/io/font/otf/Glyph;
    .locals 1
    .param p1, "index"    # I

    .line 154
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/otf/Glyph;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 375
    const/4 v0, 0x0

    .line 376
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    add-int/2addr v1, v2

    .line 377
    .end local v0    # "result":I
    .local v1, "result":I
    mul-int/lit8 v0, v1, 0x1f

    iget v2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    add-int/2addr v0, v2

    .line 378
    .end local v1    # "result":I
    .restart local v0    # "result":I
    iget v1, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .local v1, "i":I
    :goto_0
    iget v2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v1, v2, :cond_0

    .line 379
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/io/font/otf/Glyph;

    invoke-virtual {v3}, Lcom/itextpdf/io/font/otf/Glyph;->hashCode()I

    move-result v3

    add-int v0, v2, v3

    .line 378
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 381
    .end local v1    # "i":I
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    if-eqz v1, :cond_2

    .line 382
    iget v1, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .restart local v1    # "i":I
    :goto_1
    iget v2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v1, v2, :cond_2

    .line 383
    mul-int/lit8 v0, v0, 0x1f

    .line 384
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 385
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;

    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    .line 382
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 389
    .end local v1    # "i":I
    :cond_2
    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;",
            ">;"
        }
    .end annotation

    .line 339
    new-instance v0, Lcom/itextpdf/io/font/otf/ActualTextIterator;

    invoke-direct {v0, p0}, Lcom/itextpdf/io/font/otf/ActualTextIterator;-><init>(Lcom/itextpdf/io/font/otf/GlyphLine;)V

    return-object v0
.end method

.method public replaceContent(Lcom/itextpdf/io/font/otf/GlyphLine;)V
    .locals 2
    .param p1, "other"    # Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 213
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 214
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    iget-object v1, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 215
    iget-object v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 216
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    if-nez v0, :cond_0

    .line 217
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    goto :goto_0

    .line 219
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 221
    :goto_0
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    iget-object v1, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    .line 223
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    .line 225
    :goto_1
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    iput v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 226
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    iput v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 227
    return-void
.end method

.method public set(ILcom/itextpdf/io/font/otf/Glyph;)Lcom/itextpdf/io/font/otf/Glyph;
    .locals 1
    .param p1, "index"    # I
    .param p2, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 158
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/otf/Glyph;

    return-object v0
.end method

.method public setActualText(IILjava/lang/String;)V
    .locals 3
    .param p1, "left"    # I
    .param p2, "right"    # I
    .param p3, "text"    # Ljava/lang/String;

    .line 327
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    if-nez v0, :cond_0

    .line 328
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    .line 329
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 330
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 329
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 332
    .end local v0    # "i":I
    :cond_0
    new-instance v0, Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;

    invoke-direct {v0, p3}, Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;-><init>(Ljava/lang/String;)V

    .line 333
    .local v0, "actualText":Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;
    move v1, p1

    .local v1, "i":I
    :goto_1
    if-ge v1, p2, :cond_1

    .line 334
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    invoke-interface {v2, v1, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 333
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 336
    .end local v1    # "i":I
    :cond_1
    return-void
.end method

.method public setGlyphs(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/Glyph;",
            ">;)V"
        }
    .end annotation

    .line 176
    .local p1, "replacementGlyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    .line 177
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .line 178
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 179
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    .line 180
    return-void
.end method

.method public size()I
    .locals 1

    .line 230
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public substituteManyToOne(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;III)V
    .locals 7
    .param p1, "tableReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p2, "lookupFlag"    # I
    .param p3, "rightPartLen"    # I
    .param p4, "substitutionGlyphIndex"    # I

    .line 234
    new-instance v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;

    invoke-direct {v0}, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;-><init>()V

    .line 235
    .local v0, "gidx":Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;
    iput-object p0, v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->line:Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 236
    iget v1, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iput v1, v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    .line 238
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 239
    .local v1, "chars":Ljava/lang/StringBuilder;
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    iget v3, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/io/font/otf/Glyph;

    .line 240
    .local v2, "currentGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/Glyph;->getChars()[C

    move-result-object v3

    if-eqz v3, :cond_0

    .line 241
    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/Glyph;->getChars()[C

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 242
    :cond_0
    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/Glyph;->hasValidUnicode()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 243
    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v3

    invoke-static {v3}, Lcom/itextpdf/io/util/TextUtil;->convertFromUtf32(I)[C

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 246
    :cond_1
    :goto_0
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    if-ge v3, p3, :cond_4

    .line 247
    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->nextGlyph(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V

    .line 248
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    iget v5, v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object v2, v4

    check-cast v2, Lcom/itextpdf/io/font/otf/Glyph;

    .line 249
    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/Glyph;->getChars()[C

    move-result-object v4

    if-eqz v4, :cond_2

    .line 250
    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/Glyph;->getChars()[C

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 251
    :cond_2
    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/Glyph;->hasValidUnicode()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 252
    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v4

    invoke-static {v4}, Lcom/itextpdf/io/util/TextUtil;->convertFromUtf32(I)[C

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 254
    :cond_3
    :goto_2
    iget v4, v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    add-int/lit8 v5, v4, -0x1

    iput v5, v0, Lcom/itextpdf/io/font/otf/OpenTableLookup$GlyphIndexer;->idx:I

    invoke-direct {p0, v4}, Lcom/itextpdf/io/font/otf/GlyphLine;->removeGlyph(I)V

    .line 246
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 256
    .end local v3    # "j":I
    :cond_4
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    new-array v3, v3, [C

    .line 257
    .local v3, "newChars":[C
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    const/4 v5, 0x0

    invoke-virtual {v1, v5, v4, v3, v5}, Ljava/lang/StringBuilder;->getChars(II[CI)V

    .line 258
    invoke-virtual {p1, p4}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v4

    .line 259
    .local v4, "newGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v4, v3}, Lcom/itextpdf/io/font/otf/Glyph;->setChars([C)V

    .line 260
    iget-object v5, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    iget v6, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-interface {v5, v6, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 261
    iget v5, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    sub-int/2addr v5, p3

    iput v5, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 262
    return-void
.end method

.method public substituteOneToMany(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;[I)V
    .locals 10
    .param p1, "tableReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p2, "substGlyphIds"    # [I

    .line 279
    const/4 v0, 0x0

    aget v0, p2, v0

    .line 280
    .local v0, "substCode":I
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    iget v2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/io/font/otf/Glyph;

    .line 281
    .local v1, "oldGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {p1, v0}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    .line 282
    .local v2, "glyph":Lcom/itextpdf/io/font/otf/Glyph;
    iget-object v3, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    iget v4, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-interface {v3, v4, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 284
    array-length v3, p2

    const/4 v4, 0x1

    if-le v3, v4, :cond_3

    .line 285
    new-instance v3, Ljava/util/ArrayList;

    array-length v5, p2

    sub-int/2addr v5, v4

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 286
    .local v3, "additionalGlyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    const/4 v5, 0x1

    .local v5, "i":I
    :goto_0
    array-length v6, p2

    if-ge v5, v6, :cond_0

    .line 287
    aget v0, p2, v5

    .line 288
    invoke-virtual {p1, v0}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v2

    .line 289
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 286
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 291
    .end local v5    # "i":I
    :cond_0
    iget v5, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    add-int/2addr v5, v4

    invoke-direct {p0, v5, v3}, Lcom/itextpdf/io/font/otf/GlyphLine;->addAllGlyphs(ILjava/util/List;)V

    .line 292
    iget-object v5, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    if-eqz v5, :cond_2

    .line 293
    iget-object v5, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    iget v6, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_1

    .line 294
    iget-object v5, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    iget v6, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    new-instance v7, Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;

    invoke-virtual {v1}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicodeString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/itextpdf/io/font/otf/GlyphLine$ActualText;-><init>(Ljava/lang/String;)V

    invoke-interface {v5, v6, v7}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 296
    :cond_1
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_2

    .line 297
    iget-object v6, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    iget v7, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    add-int/2addr v7, v4

    add-int/2addr v7, v5

    iget-object v8, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->actualText:Ljava/util/List;

    iget v9, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 296
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 300
    .end local v5    # "i":I
    :cond_2
    iget v5, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    array-length v6, p2

    sub-int/2addr v6, v4

    add-int/2addr v5, v6

    iput v5, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    .line 301
    iget v5, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    array-length v6, p2

    sub-int/2addr v6, v4

    add-int/2addr v5, v6

    iput v5, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    .line 303
    .end local v3    # "additionalGlyphs":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/Glyph;>;"
    :cond_3
    return-void
.end method

.method public substituteOneToOne(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V
    .locals 4
    .param p1, "tableReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p2, "substitutionGlyphIndex"    # I

    .line 265
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    iget v1, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/font/otf/Glyph;

    .line 266
    .local v0, "oldGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {p1, p2}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->getGlyph(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v1

    .line 267
    .local v1, "newGlyph":Lcom/itextpdf/io/font/otf/Glyph;
    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getChars()[C

    move-result-object v2

    if-eqz v2, :cond_0

    .line 268
    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getChars()[C

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/font/otf/Glyph;->setChars([C)V

    goto :goto_0

    .line 269
    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/io/font/otf/Glyph;->hasValidUnicode()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 270
    invoke-virtual {v1}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v2

    invoke-static {v2}, Lcom/itextpdf/io/util/TextUtil;->convertFromUtf32(I)[C

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/font/otf/Glyph;->setChars([C)V

    goto :goto_0

    .line 271
    :cond_1
    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->hasValidUnicode()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 272
    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicode()I

    move-result v2

    invoke-static {v2}, Lcom/itextpdf/io/util/TextUtil;->convertFromUtf32(I)[C

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/font/otf/Glyph;->setChars([C)V

    .line 274
    :cond_2
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    iget v3, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-interface {v2, v3, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 275
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 134
    iget v0, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    iget v1, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/io/font/otf/GlyphLine;->toUnicodeString(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toUnicodeString(II)Ljava/lang/String;
    .locals 5
    .param p1, "start"    # I
    .param p2, "end"    # I

    .line 117
    new-instance v0, Lcom/itextpdf/io/font/otf/ActualTextIterator;

    invoke-direct {v0, p0, p1, p2}, Lcom/itextpdf/io/font/otf/ActualTextIterator;-><init>(Lcom/itextpdf/io/font/otf/GlyphLine;II)V

    .line 118
    .local v0, "iter":Lcom/itextpdf/io/font/otf/ActualTextIterator;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 119
    .local v1, "str":Ljava/lang/StringBuilder;
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/ActualTextIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 120
    invoke-virtual {v0}, Lcom/itextpdf/io/font/otf/ActualTextIterator;->next()Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;

    move-result-object v2

    .line 121
    .local v2, "part":Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;
    iget-object v3, v2, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->actualText:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 122
    iget-object v3, v2, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->actualText:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 124
    :cond_0
    iget v3, v2, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->start:I

    .local v3, "i":I
    :goto_1
    iget v4, v2, Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;->end:I

    if-ge v3, v4, :cond_1

    .line 125
    iget-object v4, p0, Lcom/itextpdf/io/font/otf/GlyphLine;->glyphs:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/io/font/otf/Glyph;

    invoke-virtual {v4}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicodeChars()[C

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 124
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 128
    .end local v2    # "part":Lcom/itextpdf/io/font/otf/GlyphLine$GlyphLinePart;
    .end local v3    # "i":I
    :cond_1
    :goto_2
    goto :goto_0

    .line 129
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
