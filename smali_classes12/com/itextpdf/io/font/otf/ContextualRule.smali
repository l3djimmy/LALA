.class public abstract Lcom/itextpdf/io/font/otf/ContextualRule;
.super Ljava/lang/Object;
.source "ContextualRule.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBacktrackContextLength()I
    .locals 1

    .line 58
    const/4 v0, 0x0

    return v0
.end method

.method public abstract getContextLength()I
.end method

.method public getLookaheadContextLength()I
    .locals 1

    .line 50
    const/4 v0, 0x0

    return v0
.end method

.method public isGlyphMatchesBacktrack(II)Z
    .locals 1
    .param p1, "glyphId"    # I
    .param p2, "atIdx"    # I

    .line 80
    const/4 v0, 0x0

    return v0
.end method

.method public abstract isGlyphMatchesInput(II)Z
.end method

.method public isGlyphMatchesLookahead(II)Z
    .locals 1
    .param p1, "glyphId"    # I
    .param p2, "atIdx"    # I

    .line 69
    const/4 v0, 0x0

    return v0
.end method
