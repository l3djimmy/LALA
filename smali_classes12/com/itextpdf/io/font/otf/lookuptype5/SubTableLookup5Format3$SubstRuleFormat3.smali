.class public Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format3$SubstRuleFormat3;
.super Lcom/itextpdf/io/font/otf/ContextualSubstRule;
.source "SubTableLookup5Format3.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SubstRuleFormat3"
.end annotation


# instance fields
.field coverages:Ljava/util/List;
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
.method public constructor <init>(Ljava/util/List;[Lcom/itextpdf/io/font/otf/SubstLookupRecord;)V
    .locals 0
    .param p2, "substLookupRecords"    # [Lcom/itextpdf/io/font/otf/SubstLookupRecord;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;>;[",
            "Lcom/itextpdf/io/font/otf/SubstLookupRecord;",
            ")V"
        }
    .end annotation

    .line 58
    .local p1, "coverages":Ljava/util/List;, "Ljava/util/List<Ljava/util/Set<Ljava/lang/Integer;>;>;"
    invoke-direct {p0}, Lcom/itextpdf/io/font/otf/ContextualSubstRule;-><init>()V

    .line 59
    iput-object p1, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format3$SubstRuleFormat3;->coverages:Ljava/util/List;

    .line 60
    iput-object p2, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format3$SubstRuleFormat3;->substLookupRecords:[Lcom/itextpdf/io/font/otf/SubstLookupRecord;

    .line 61
    return-void
.end method


# virtual methods
.method public getContextLength()I
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format3$SubstRuleFormat3;->coverages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getSubstLookupRecords()[Lcom/itextpdf/io/font/otf/SubstLookupRecord;
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format3$SubstRuleFormat3;->substLookupRecords:[Lcom/itextpdf/io/font/otf/SubstLookupRecord;

    return-object v0
.end method

.method public isGlyphMatchesInput(II)Z
    .locals 2
    .param p1, "glyphId"    # I
    .param p2, "atIdx"    # I

    .line 75
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format3$SubstRuleFormat3;->coverages:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
