.class public Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2$SubstRuleFormat2;
.super Lcom/itextpdf/io/font/otf/ContextualSubstRule;
.source "SubTableLookup6Format2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SubstRuleFormat2"
.end annotation


# instance fields
.field private backtrackClassIds:[I

.field private inputClassIds:[I

.field private lookAheadClassIds:[I

.field private subTable:Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2;

.field private substLookupRecords:[Lcom/itextpdf/io/font/otf/SubstLookupRecord;


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2;[I[I[I[Lcom/itextpdf/io/font/otf/SubstLookupRecord;)V
    .locals 0
    .param p1, "subTable"    # Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2;
    .param p2, "backtrackClassIds"    # [I
    .param p3, "inputClassIds"    # [I
    .param p4, "lookAheadClassIds"    # [I
    .param p5, "substLookupRecords"    # [Lcom/itextpdf/io/font/otf/SubstLookupRecord;

    .line 79
    invoke-direct {p0}, Lcom/itextpdf/io/font/otf/ContextualSubstRule;-><init>()V

    .line 80
    iput-object p1, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2$SubstRuleFormat2;->subTable:Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2;

    .line 81
    iput-object p2, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2$SubstRuleFormat2;->backtrackClassIds:[I

    .line 82
    iput-object p3, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2$SubstRuleFormat2;->inputClassIds:[I

    .line 83
    iput-object p4, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2$SubstRuleFormat2;->lookAheadClassIds:[I

    .line 84
    iput-object p5, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2$SubstRuleFormat2;->substLookupRecords:[Lcom/itextpdf/io/font/otf/SubstLookupRecord;

    .line 85
    return-void
.end method


# virtual methods
.method public getBacktrackContextLength()I
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2$SubstRuleFormat2;->backtrackClassIds:[I

    array-length v0, v0

    return v0
.end method

.method public getContextLength()I
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2$SubstRuleFormat2;->inputClassIds:[I

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getLookaheadContextLength()I
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2$SubstRuleFormat2;->lookAheadClassIds:[I

    array-length v0, v0

    return v0
.end method

.method public getSubstLookupRecords()[Lcom/itextpdf/io/font/otf/SubstLookupRecord;
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2$SubstRuleFormat2;->substLookupRecords:[Lcom/itextpdf/io/font/otf/SubstLookupRecord;

    return-object v0
.end method

.method public isGlyphMatchesBacktrack(II)Z
    .locals 2
    .param p1, "glyphId"    # I
    .param p2, "atIdx"    # I

    .line 115
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2$SubstRuleFormat2;->subTable:Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2;

    invoke-static {v0}, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2;->access$200(Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2;)Lcom/itextpdf/io/font/otf/OtfClass;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/otf/OtfClass;->getOtfClass(I)I

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2$SubstRuleFormat2;->backtrackClassIds:[I

    aget v1, v1, p2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isGlyphMatchesInput(II)Z
    .locals 3
    .param p1, "glyphId"    # I
    .param p2, "atIdx"    # I

    .line 107
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2$SubstRuleFormat2;->subTable:Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2;

    invoke-static {v0}, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2;->access$000(Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2;)Lcom/itextpdf/io/font/otf/OtfClass;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/otf/OtfClass;->getOtfClass(I)I

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2$SubstRuleFormat2;->inputClassIds:[I

    add-int/lit8 v2, p2, -0x1

    aget v1, v1, v2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isGlyphMatchesLookahead(II)Z
    .locals 2
    .param p1, "glyphId"    # I
    .param p2, "atIdx"    # I

    .line 111
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2$SubstRuleFormat2;->subTable:Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2;

    invoke-static {v0}, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2;->access$100(Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2;)Lcom/itextpdf/io/font/otf/OtfClass;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/otf/OtfClass;->getOtfClass(I)I

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format2$SubstRuleFormat2;->lookAheadClassIds:[I

    aget v1, v1, p2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
