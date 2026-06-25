.class public Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format1$SubstRuleFormat1;
.super Lcom/itextpdf/io/font/otf/ContextualSubstRule;
.source "SubTableLookup6Format1.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SubstRuleFormat1"
.end annotation


# instance fields
.field private backtrackGlyphIds:[I

.field private inputGlyphIds:[I

.field private lookAheadGlyphIds:[I

.field private substLookupRecords:[Lcom/itextpdf/io/font/otf/SubstLookupRecord;


# direct methods
.method public constructor <init>([I[I[I[Lcom/itextpdf/io/font/otf/SubstLookupRecord;)V
    .locals 0
    .param p1, "backtrackGlyphIds"    # [I
    .param p2, "inputGlyphIds"    # [I
    .param p3, "lookAheadGlyphIds"    # [I
    .param p4, "substLookupRecords"    # [Lcom/itextpdf/io/font/otf/SubstLookupRecord;

    .line 61
    invoke-direct {p0}, Lcom/itextpdf/io/font/otf/ContextualSubstRule;-><init>()V

    .line 62
    iput-object p1, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format1$SubstRuleFormat1;->backtrackGlyphIds:[I

    .line 63
    iput-object p2, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format1$SubstRuleFormat1;->inputGlyphIds:[I

    .line 64
    iput-object p3, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format1$SubstRuleFormat1;->lookAheadGlyphIds:[I

    .line 65
    iput-object p4, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format1$SubstRuleFormat1;->substLookupRecords:[Lcom/itextpdf/io/font/otf/SubstLookupRecord;

    .line 66
    return-void
.end method


# virtual methods
.method public getBacktrackContextLength()I
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format1$SubstRuleFormat1;->backtrackGlyphIds:[I

    array-length v0, v0

    return v0
.end method

.method public getContextLength()I
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format1$SubstRuleFormat1;->inputGlyphIds:[I

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getLookaheadContextLength()I
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format1$SubstRuleFormat1;->lookAheadGlyphIds:[I

    array-length v0, v0

    return v0
.end method

.method public getSubstLookupRecords()[Lcom/itextpdf/io/font/otf/SubstLookupRecord;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format1$SubstRuleFormat1;->substLookupRecords:[Lcom/itextpdf/io/font/otf/SubstLookupRecord;

    return-object v0
.end method

.method public isGlyphMatchesBacktrack(II)Z
    .locals 1
    .param p1, "glyphId"    # I
    .param p2, "atIdx"    # I

    .line 96
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format1$SubstRuleFormat1;->backtrackGlyphIds:[I

    aget v0, v0, p2

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isGlyphMatchesInput(II)Z
    .locals 2
    .param p1, "glyphId"    # I
    .param p2, "atIdx"    # I

    .line 88
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format1$SubstRuleFormat1;->inputGlyphIds:[I

    add-int/lit8 v1, p2, -0x1

    aget v0, v0, v1

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isGlyphMatchesLookahead(II)Z
    .locals 1
    .param p1, "glyphId"    # I
    .param p2, "atIdx"    # I

    .line 92
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format1$SubstRuleFormat1;->lookAheadGlyphIds:[I

    aget v0, v0, p2

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
