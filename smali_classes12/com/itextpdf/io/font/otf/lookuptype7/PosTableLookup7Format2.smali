.class public Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2;
.super Lcom/itextpdf/io/font/otf/ContextualTable;
.source "PosTableLookup7Format2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2$PosRuleFormat2;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/io/font/otf/ContextualTable<",
        "Lcom/itextpdf/io/font/otf/ContextualPositionRule;",
        ">;"
    }
.end annotation


# instance fields
.field private classDefinition:Lcom/itextpdf/io/font/otf/OtfClass;

.field private posCoverageGlyphIds:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private subClassSets:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/ContextualPositionRule;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;ILjava/util/Set;Lcom/itextpdf/io/font/otf/OtfClass;)V
    .locals 0
    .param p1, "openReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p2, "lookupFlag"    # I
    .param p4, "classDefinition"    # Lcom/itextpdf/io/font/otf/OtfClass;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;",
            "I",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/itextpdf/io/font/otf/OtfClass;",
            ")V"
        }
    .end annotation

    .line 42
    .local p3, "posCoverageGlyphIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/io/font/otf/ContextualTable;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V

    .line 43
    iput-object p3, p0, Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2;->posCoverageGlyphIds:Ljava/util/Set;

    .line 45
    iput-object p4, p0, Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2;->classDefinition:Lcom/itextpdf/io/font/otf/OtfClass;

    .line 46
    return-void
.end method

.method static synthetic access$000(Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2;)Lcom/itextpdf/io/font/otf/OtfClass;
    .locals 1
    .param p0, "x0"    # Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2;

    .line 35
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2;->classDefinition:Lcom/itextpdf/io/font/otf/OtfClass;

    return-object v0
.end method


# virtual methods
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

    .line 54
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2;->posCoverageGlyphIds:Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget v1, p0, Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2;->lookupFlag:I

    invoke-virtual {v0, p1, v1}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->isSkip(II)Z

    move-result v0

    if-nez v0, :cond_0

    .line 55
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2;->classDefinition:Lcom/itextpdf/io/font/otf/OtfClass;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/otf/OtfClass;->getOtfClass(I)I

    move-result v0

    .line 56
    .local v0, "gClass":I
    iget-object v1, p0, Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2;->subClassSets:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    return-object v1

    .line 58
    .end local v0    # "gClass":I
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public setPosClassSets(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/ContextualPositionRule;",
            ">;>;)V"
        }
    .end annotation

    .line 49
    .local p1, "subClassSets":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Lcom/itextpdf/io/font/otf/ContextualPositionRule;>;>;"
    iput-object p1, p0, Lcom/itextpdf/io/font/otf/lookuptype7/PosTableLookup7Format2;->subClassSets:Ljava/util/List;

    .line 50
    return-void
.end method
