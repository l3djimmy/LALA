.class public Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;
.super Lcom/itextpdf/io/font/otf/ChainingContextualTable;
.source "PosTableLookup8Format2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2$PosRuleFormat2;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/io/font/otf/ChainingContextualTable<",
        "Lcom/itextpdf/io/font/otf/ContextualPositionRule;",
        ">;"
    }
.end annotation


# instance fields
.field private backtrackClassDefinition:Lcom/itextpdf/io/font/otf/OtfClass;

.field private inputClassDefinition:Lcom/itextpdf/io/font/otf/OtfClass;

.field private lookaheadClassDefinition:Lcom/itextpdf/io/font/otf/OtfClass;

.field private posClassSets:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/ContextualPositionRule;",
            ">;>;"
        }
    .end annotation
.end field

.field private posCoverageGlyphIds:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;ILjava/util/Set;Lcom/itextpdf/io/font/otf/OtfClass;Lcom/itextpdf/io/font/otf/OtfClass;Lcom/itextpdf/io/font/otf/OtfClass;)V
    .locals 1
    .param p1, "openReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p2, "lookupFlag"    # I
    .param p4, "backtrackClassDefinition"    # Lcom/itextpdf/io/font/otf/OtfClass;
    .param p5, "inputClassDefinition"    # Lcom/itextpdf/io/font/otf/OtfClass;
    .param p6, "lookaheadClassDefinition"    # Lcom/itextpdf/io/font/otf/OtfClass;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;",
            "I",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/itextpdf/io/font/otf/OtfClass;",
            "Lcom/itextpdf/io/font/otf/OtfClass;",
            "Lcom/itextpdf/io/font/otf/OtfClass;",
            ")V"
        }
    .end annotation

    .line 48
    .local p3, "posCoverageGlyphIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/io/font/otf/ChainingContextualTable;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V

    .line 49
    iput-object p3, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;->posCoverageGlyphIds:Ljava/util/Set;

    .line 50
    iput-object p4, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;->backtrackClassDefinition:Lcom/itextpdf/io/font/otf/OtfClass;

    .line 51
    iput-object p5, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;->inputClassDefinition:Lcom/itextpdf/io/font/otf/OtfClass;

    .line 52
    iput-object p6, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;->lookaheadClassDefinition:Lcom/itextpdf/io/font/otf/OtfClass;

    .line 53
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;->posClassSets:Ljava/util/List;

    .line 54
    return-void
.end method

.method static synthetic access$000(Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;)Lcom/itextpdf/io/font/otf/OtfClass;
    .locals 1
    .param p0, "x0"    # Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;

    .line 39
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;->inputClassDefinition:Lcom/itextpdf/io/font/otf/OtfClass;

    return-object v0
.end method

.method static synthetic access$100(Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;)Lcom/itextpdf/io/font/otf/OtfClass;
    .locals 1
    .param p0, "x0"    # Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;

    .line 39
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;->lookaheadClassDefinition:Lcom/itextpdf/io/font/otf/OtfClass;

    return-object v0
.end method

.method static synthetic access$200(Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;)Lcom/itextpdf/io/font/otf/OtfClass;
    .locals 1
    .param p0, "x0"    # Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;

    .line 39
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;->backtrackClassDefinition:Lcom/itextpdf/io/font/otf/OtfClass;

    return-object v0
.end method


# virtual methods
.method public addPosClassSet(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/ContextualPositionRule;",
            ">;)V"
        }
    .end annotation

    .line 57
    .local p1, "posClassSet":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/io/font/otf/ContextualPositionRule;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/io/font/otf/ContextualPositionRule;

    .line 58
    .local v1, "rule":Lcom/itextpdf/io/font/otf/ContextualPositionRule;
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2$PosRuleFormat2;

    invoke-virtual {v2}, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2$PosRuleFormat2;->getPosTable()Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;

    move-result-object v2

    if-ne v2, p0, :cond_0

    .line 61
    .end local v1    # "rule":Lcom/itextpdf/io/font/otf/ContextualPositionRule;
    goto :goto_0

    .line 59
    .restart local v1    # "rule":Lcom/itextpdf/io/font/otf/ContextualPositionRule;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "Position class set is invalid. Position rule refers to another table"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 62
    .end local v1    # "rule":Lcom/itextpdf/io/font/otf/ContextualPositionRule;
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;->posClassSets:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    return-void
.end method

.method protected getSetOfRulesForStartGlyph(I)Ljava/util/List;
    .locals 2
    .param p1, "startId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/ContextualPositionRule;",
            ">;"
        }
    .end annotation

    .line 67
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;->posCoverageGlyphIds:Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget v1, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;->lookupFlag:I

    invoke-virtual {v0, p1, v1}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->isSkip(II)Z

    move-result v0

    if-nez v0, :cond_0

    .line 68
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;->inputClassDefinition:Lcom/itextpdf/io/font/otf/OtfClass;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/otf/OtfClass;->getOtfClass(I)I

    move-result v0

    .line 69
    .local v0, "gClass":I
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/lookuptype8/PosTableLookup8Format2;->posClassSets:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    return-object v1

    .line 71
    .end local v0    # "gClass":I
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
