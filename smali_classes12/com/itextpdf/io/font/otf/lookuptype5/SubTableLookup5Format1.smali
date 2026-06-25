.class public Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format1;
.super Lcom/itextpdf/io/font/otf/ContextualTable;
.source "SubTableLookup5Format1.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format1$SubstRuleFormat1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/io/font/otf/ContextualTable<",
        "Lcom/itextpdf/io/font/otf/ContextualSubstRule;",
        ">;"
    }
.end annotation


# instance fields
.field private substMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/ContextualSubstRule;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;ILjava/util/Map;)V
    .locals 0
    .param p1, "openReader"    # Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;
    .param p2, "lookupFlag"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;",
            "I",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/ContextualSubstRule;",
            ">;>;)V"
        }
    .end annotation

    .line 41
    .local p3, "substMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Lcom/itextpdf/io/font/otf/ContextualSubstRule;>;>;"
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/io/font/otf/ContextualTable;-><init>(Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;I)V

    .line 42
    iput-object p3, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format1;->substMap:Ljava/util/Map;

    .line 43
    return-void
.end method


# virtual methods
.method protected getSetOfRulesForStartGlyph(I)Ljava/util/List;
    .locals 2
    .param p1, "startGlyphId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/itextpdf/io/font/otf/ContextualSubstRule;",
            ">;"
        }
    .end annotation

    .line 47
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format1;->substMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format1;->openReader:Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;

    iget v1, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format1;->lookupFlag:I

    invoke-virtual {v0, p1, v1}, Lcom/itextpdf/io/font/otf/OpenTypeFontTableReader;->isSkip(II)Z

    move-result v0

    if-nez v0, :cond_0

    .line 48
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format1;->substMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0

    .line 50
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
