.class public Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format1$SubstRuleFormat1;
.super Lcom/itextpdf/io/font/otf/ContextualSubstRule;
.source "SubTableLookup5Format1.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SubstRuleFormat1"
.end annotation


# instance fields
.field private inputGlyphIds:[I

.field private substLookupRecords:[Lcom/itextpdf/io/font/otf/SubstLookupRecord;


# direct methods
.method public constructor <init>([I[Lcom/itextpdf/io/font/otf/SubstLookupRecord;)V
    .locals 0
    .param p1, "inputGlyphIds"    # [I
    .param p2, "substLookupRecords"    # [Lcom/itextpdf/io/font/otf/SubstLookupRecord;

    .line 59
    invoke-direct {p0}, Lcom/itextpdf/io/font/otf/ContextualSubstRule;-><init>()V

    .line 60
    iput-object p1, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format1$SubstRuleFormat1;->inputGlyphIds:[I

    .line 61
    iput-object p2, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format1$SubstRuleFormat1;->substLookupRecords:[Lcom/itextpdf/io/font/otf/SubstLookupRecord;

    .line 62
    return-void
.end method


# virtual methods
.method public getContextLength()I
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format1$SubstRuleFormat1;->inputGlyphIds:[I

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getSubstLookupRecords()[Lcom/itextpdf/io/font/otf/SubstLookupRecord;
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format1$SubstRuleFormat1;->substLookupRecords:[Lcom/itextpdf/io/font/otf/SubstLookupRecord;

    return-object v0
.end method

.method public isGlyphMatchesInput(II)Z
    .locals 2
    .param p1, "glyphId"    # I
    .param p2, "atIdx"    # I

    .line 76
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format1$SubstRuleFormat1;->inputGlyphIds:[I

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
