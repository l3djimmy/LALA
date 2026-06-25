.class public Lcom/itextpdf/io/font/otf/GposLookupType2;
.super Lcom/itextpdf/io/font/otf/OpenTableLookup;
.source "GposLookupType2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/font/otf/GposLookupType2$PairValueFormat;,
        Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;,
        Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;
    }
.end annotation


# instance fields
.field private listRules:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/OpenTableLookup;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V
    .locals 1
    .param p1, "openReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p2, "lookupFlag"    # I
    .param p3, "subTableLocations"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 42
    invoke-direct {p0, p1, p2, p3}, Lcom/itextpdf/io/font/otf/OpenTableLookup;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I[I)V

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType2;->listRules:Ljava/util/List;

    .line 43
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/GposLookupType2;->readSubTables()V

    .line 44
    return-void
.end method


# virtual methods
.method protected readSubTable(I)V
    .locals 4
    .param p1, "subTableLocation"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 64
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 65
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget-object v0, v0, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->rf:Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readShort()S

    move-result v0

    .line 66
    .local v0, "gposFormat":I
    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 73
    :pswitch_0
    new-instance v1, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;

    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GposLookupType2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget v3, p0, Lcom/itextpdf/io/font/otf/GposLookupType2;->lookupFlag:I

    invoke-direct {v1, v2, v3, p1}, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;II)V

    .line 74
    .local v1, "format2":Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GposLookupType2;->listRules:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    goto :goto_0

    .line 68
    .end local v1    # "format2":Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat2;
    :pswitch_1
    new-instance v1, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;

    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GposLookupType2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget v3, p0, Lcom/itextpdf/io/font/otf/GposLookupType2;->lookupFlag:I

    invoke-direct {v1, v2, v3, p1}, Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;II)V

    .line 69
    .local v1, "format1":Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;
    iget-object v2, p0, Lcom/itextpdf/io/font/otf/GposLookupType2;->listRules:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    nop

    .line 78
    .end local v1    # "format1":Lcom/itextpdf/io/font/otf/GposLookupType2$PairPosAdjustmentFormat1;
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public transformOne(Lcom/itextpdf/io/font/otf/GlyphLine;)Z
    .locals 5
    .param p1, "line"    # Lcom/itextpdf/io/font/otf/GlyphLine;

    .line 48
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    iget v1, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    .line 49
    return v2

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget v1, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    invoke-virtual {p1, v1}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/io/font/otf/Glyph;->getCode()I

    move-result v1

    iget v3, p0, Lcom/itextpdf/io/font/otf/GposLookupType2;->lookupFlag:I

    invoke-virtual {v0, v1, v3}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->isSkip(II)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 51
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    add-int/2addr v0, v1

    iput v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    .line 52
    return v2

    .line 54
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/GposLookupType2;->listRules:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/io/font/otf/OpenTableLookup;

    .line 55
    .local v3, "lookup":Lcom/itextpdf/io/font/otf/OpenTableLookup;
    invoke-virtual {v3, p1}, Lcom/itextpdf/io/font/otf/OpenTableLookup;->transformOne(Lcom/itextpdf/io/font/otf/GlyphLine;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 56
    return v1

    .line 57
    .end local v3    # "lookup":Lcom/itextpdf/io/font/otf/OpenTableLookup;
    :cond_2
    goto :goto_0

    .line 58
    :cond_3
    iget v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    add-int/2addr v0, v1

    iput v0, p1, Lcom/itextpdf/io/font/otf/GlyphLine;->idx:I

    .line 59
    return v2
.end method
