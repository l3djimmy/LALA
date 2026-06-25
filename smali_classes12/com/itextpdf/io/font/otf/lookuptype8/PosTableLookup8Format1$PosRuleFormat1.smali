.class public Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format1$PosRuleFormat1;
.super Lcom/itextpdf/io/font/otf/ContextualPositionRule;
.source "PosTableLookup8Format1.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PosRuleFormat1"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x268cced95dca517bL


# instance fields
.field private backtrackGlyphIds:[I

.field private inputGlyphIds:[I

.field private lookAheadGlyphIds:[I

.field private posLookupRecords:[Lcom/itextpdf/io/font/otf/PosLookupRecord;


# direct methods
.method public constructor <init>([I[I[I[Lcom/itextpdf/io/font/otf/PosLookupRecord;)V
    .locals 0
    .param p1, "backtrackGlyphIds"    # [I
    .param p2, "inputGlyphIds"    # [I
    .param p3, "lookAheadGlyphIds"    # [I
    .param p4, "posLookupRecords"    # [Lcom/itextpdf/io/font/otf/PosLookupRecord;

    .line 64
    invoke-direct {p0}, Lcom/itextpdf/io/font/otf/ContextualPositionRule;-><init>()V

    .line 65
    iput-object p1, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format1$PosRuleFormat1;->backtrackGlyphIds:[I

    .line 66
    iput-object p2, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format1$PosRuleFormat1;->inputGlyphIds:[I

    .line 67
    iput-object p3, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format1$PosRuleFormat1;->lookAheadGlyphIds:[I

    .line 68
    iput-object p4, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format1$PosRuleFormat1;->posLookupRecords:[Lcom/itextpdf/io/font/otf/PosLookupRecord;

    .line 69
    return-void
.end method


# virtual methods
.method public getBacktrackContextLength()I
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format1$PosRuleFormat1;->backtrackGlyphIds:[I

    array-length v0, v0

    return v0
.end method

.method public getContextLength()I
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format1$PosRuleFormat1;->inputGlyphIds:[I

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getLookaheadContextLength()I
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format1$PosRuleFormat1;->lookAheadGlyphIds:[I

    array-length v0, v0

    return v0
.end method

.method public getPosLookupRecords()[Lcom/itextpdf/io/font/otf/PosLookupRecord;
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format1$PosRuleFormat1;->posLookupRecords:[Lcom/itextpdf/io/font/otf/PosLookupRecord;

    return-object v0
.end method

.method public isGlyphMatchesBacktrack(II)Z
    .locals 1
    .param p1, "glyphId"    # I
    .param p2, "atIdx"    # I

    .line 103
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format1$PosRuleFormat1;->backtrackGlyphIds:[I

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

    .line 93
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format1$PosRuleFormat1;->inputGlyphIds:[I

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

    .line 98
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format1$PosRuleFormat1;->lookAheadGlyphIds:[I

    aget v0, v0, p2

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
