.class public Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format3$SubstRuleFormat3;
.super Lcom/itextpdf/io/font/otf/ContextualSubstRule;
.source "SubTableLookup6Format3.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SubstRuleFormat3"
.end annotation


# instance fields
.field backtrackCoverages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field inputCoverages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field lookaheadCoverages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field substLookupRecords:[Lcom/itextpdf/io/font/otf/SubstLookupRecord;


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;[Lcom/itextpdf/io/font/otf/SubstLookupRecord;)V
    .locals 0
    .param p4, "substLookupRecords"    # [Lcom/itextpdf/io/font/otf/SubstLookupRecord;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;",
            "Ljava/util/List<",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;",
            "Ljava/util/List<",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;[",
            "Lcom/itextpdf/io/font/otf/SubstLookupRecord;",
            ")V"
        }
    .end annotation

    .line 61
    .local p1, "backtrackCoverages":Ljava/util/List;, "Ljava/util/List<Ljava/util/Set<Ljava/lang/Integer;>;>;"
    .local p2, "inputCoverages":Ljava/util/List;, "Ljava/util/List<Ljava/util/Set<Ljava/lang/Integer;>;>;"
    .local p3, "lookaheadCoverages":Ljava/util/List;, "Ljava/util/List<Ljava/util/Set<Ljava/lang/Integer;>;>;"
    invoke-direct {p0}, Lcom/itextpdf/io/font/otf/ContextualSubstRule;-><init>()V

    .line 62
    iput-object p1, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format3$SubstRuleFormat3;->backtrackCoverages:Ljava/util/List;

    .line 63
    iput-object p2, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format3$SubstRuleFormat3;->inputCoverages:Ljava/util/List;

    .line 64
    iput-object p3, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format3$SubstRuleFormat3;->lookaheadCoverages:Ljava/util/List;

    .line 65
    iput-object p4, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format3$SubstRuleFormat3;->substLookupRecords:[Lcom/itextpdf/io/font/otf/SubstLookupRecord;

    .line 66
    return-void
.end method


# virtual methods
.method public getBacktrackContextLength()I
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format3$SubstRuleFormat3;->backtrackCoverages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getContextLength()I
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format3$SubstRuleFormat3;->inputCoverages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getLookaheadContextLength()I
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format3$SubstRuleFormat3;->lookaheadCoverages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getSubstLookupRecords()[Lcom/itextpdf/io/font/otf/SubstLookupRecord;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format3$SubstRuleFormat3;->substLookupRecords:[Lcom/itextpdf/io/font/otf/SubstLookupRecord;

    return-object v0
.end method

.method public isGlyphMatchesBacktrack(II)Z
    .locals 2
    .param p1, "glyphId"    # I
    .param p2, "atIdx"    # I

    .line 96
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format3$SubstRuleFormat3;->backtrackCoverages:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isGlyphMatchesInput(II)Z
    .locals 2
    .param p1, "glyphId"    # I
    .param p2, "atIdx"    # I

    .line 88
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format3$SubstRuleFormat3;->inputCoverages:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isGlyphMatchesLookahead(II)Z
    .locals 2
    .param p1, "glyphId"    # I
    .param p2, "atIdx"    # I

    .line 92
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype6/SubTableLookup6Format3$SubstRuleFormat3;->lookaheadCoverages:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
