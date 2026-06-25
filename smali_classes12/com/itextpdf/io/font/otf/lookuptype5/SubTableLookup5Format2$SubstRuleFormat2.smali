.class public Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format2$SubstRuleFormat2;
.super Lcom/itextpdf/io/font/otf/ContextualSubstRule;
.source "SubTableLookup5Format2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SubstRuleFormat2"
.end annotation


# instance fields
.field private classDefinition:Lcom/itextpdf/io/font/otf/OtfClass;

.field private inputClassIds:[I

.field private substLookupRecords:[Lcom/itextpdf/io/font/otf/SubstLookupRecord;


# direct methods
.method public constructor <init>(Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format2;[I[Lcom/itextpdf/io/font/otf/SubstLookupRecord;)V
    .locals 1
    .param p1, "subTable"    # Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format2;
    .param p2, "inputClassIds"    # [I
    .param p3, "substLookupRecords"    # [Lcom/itextpdf/io/font/otf/SubstLookupRecord;

    .line 70
    invoke-direct {p0}, Lcom/itextpdf/io/font/otf/ContextualSubstRule;-><init>()V

    .line 71
    iput-object p2, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format2$SubstRuleFormat2;->inputClassIds:[I

    .line 72
    iput-object p3, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format2$SubstRuleFormat2;->substLookupRecords:[Lcom/itextpdf/io/font/otf/SubstLookupRecord;

    .line 73
    invoke-static {p1}, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format2;->access$000(Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format2;)Lcom/itextpdf/io/font/otf/OtfClass;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format2$SubstRuleFormat2;->classDefinition:Lcom/itextpdf/io/font/otf/OtfClass;

    .line 74
    return-void
.end method


# virtual methods
.method public getContextLength()I
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format2$SubstRuleFormat2;->inputClassIds:[I

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getSubstLookupRecords()[Lcom/itextpdf/io/font/otf/SubstLookupRecord;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format2$SubstRuleFormat2;->substLookupRecords:[Lcom/itextpdf/io/font/otf/SubstLookupRecord;

    return-object v0
.end method

.method public isGlyphMatchesInput(II)Z
    .locals 3
    .param p1, "glyphId"    # I
    .param p2, "atIdx"    # I

    .line 88
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format2$SubstRuleFormat2;->classDefinition:Lcom/itextpdf/io/font/otf/OtfClass;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/font/otf/OtfClass;->getOtfClass(I)I

    move-result v0

    iget-object v1, p0, Lcom/itextpdf/io/font/otf/lookuptype5/SubTableLookup5Format2$SubstRuleFormat2;->inputClassIds:[I

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
