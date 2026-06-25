.class public Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3$PosRuleFormat3;
.super Lcom/itextpdf/io/font/otf/ContextualPositionRule;
.source "PosTableLookup8Format3.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PosRuleFormat3"
.end annotation


# instance fields
.field private backtrackCoverages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private inputCoverages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private lookaheadCoverages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private posLookupRecords:[Lcom/itextpdf/io/font/otf/PosLookupRecord;


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;[Lcom/itextpdf/io/font/otf/PosLookupRecord;)V
    .locals 0
    .param p4, "posLookupRecords"    # [Lcom/itextpdf/io/font/otf/PosLookupRecord;
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
            "Lcom/itextpdf/io/font/otf/PosLookupRecord;",
            ")V"
        }
    .end annotation

    .line 61
    .local p1, "backtrackCoverages":Ljava/util/List;, "Ljava/util/List<Ljava/util/Set<Ljava/lang/Integer;>;>;"
    .local p2, "inputCoverages":Ljava/util/List;, "Ljava/util/List<Ljava/util/Set<Ljava/lang/Integer;>;>;"
    .local p3, "lookaheadCoverages":Ljava/util/List;, "Ljava/util/List<Ljava/util/Set<Ljava/lang/Integer;>;>;"
    invoke-direct {p0}, Lcom/itextpdf/io/font/otf/ContextualPositionRule;-><init>()V

    .line 62
    iput-object p1, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3$PosRuleFormat3;->backtrackCoverages:Ljava/util/List;

    .line 63
    iput-object p2, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3$PosRuleFormat3;->inputCoverages:Ljava/util/List;

    .line 64
    iput-object p3, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3$PosRuleFormat3;->lookaheadCoverages:Ljava/util/List;

    .line 65
    iput-object p4, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3$PosRuleFormat3;->posLookupRecords:[Lcom/itextpdf/io/font/otf/PosLookupRecord;

    .line 66
    return-void
.end method


# virtual methods
.method public getBacktrackContextLength()I
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3$PosRuleFormat3;->backtrackCoverages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getContextLength()I
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3$PosRuleFormat3;->inputCoverages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getInputCoverage(I)Ljava/util/Set;
    .locals 1
    .param p1, "idx"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 79
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3$PosRuleFormat3;->inputCoverages:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    return-object v0
.end method

.method public getLookaheadContextLength()I
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3$PosRuleFormat3;->lookaheadCoverages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getPosLookupRecords()[Lcom/itextpdf/io/font/otf/PosLookupRecord;
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3$PosRuleFormat3;->posLookupRecords:[Lcom/itextpdf/io/font/otf/PosLookupRecord;

    return-object v0
.end method

.method public isGlyphMatchesBacktrack(II)Z
    .locals 2
    .param p1, "glyphId"    # I
    .param p2, "atIdx"    # I

    .line 104
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3$PosRuleFormat3;->backtrackCoverages:Ljava/util/List;

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

    .line 84
    invoke-virtual {p0, p2}, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3$PosRuleFormat3;->getInputCoverage(I)Ljava/util/Set;

    move-result-object v0

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

    .line 94
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format3$PosRuleFormat3;->lookaheadCoverages:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
