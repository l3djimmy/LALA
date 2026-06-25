.class public abstract Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;
.super Lcom/itextpdf/commons/actions/AbstractITextEvent;
.source "AbstractTypographyApplier.java"


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Lcom/itextpdf/commons/actions/AbstractITextEvent;-><init>()V

    .line 44
    return-void
.end method


# virtual methods
.method public applyKerning(Lcom/itextpdf/io/font/FontProgram;Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Z
    .locals 1
    .param p1, "fontProgram"    # Lcom/itextpdf/io/font/FontProgram;
    .param p2, "text"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p3, "sequenceId"    # Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .param p4, "metaInfo"    # Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 62
    const/4 v0, 0x0

    return v0
.end method

.method public applyOtfScript(Lcom/itextpdf/io/font/TrueTypeFont;Lcom/itextpdf/io/font/otf/GlyphLine;Ljava/lang/Character$UnicodeScript;Ljava/lang/Object;Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Z
    .locals 1
    .param p1, "font"    # Lcom/itextpdf/io/font/TrueTypeFont;
    .param p2, "glyphLine"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p3, "script"    # Ljava/lang/Character$UnicodeScript;
    .param p4, "configurator"    # Ljava/lang/Object;
    .param p5, "id"    # Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .param p6, "metaInfo"    # Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 58
    const/4 v0, 0x0

    return v0
.end method

.method public getBidiLevels(Lcom/itextpdf/layout/properties/BaseDirection;[ILcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)[B
    .locals 1
    .param p1, "baseDirection"    # Lcom/itextpdf/layout/properties/BaseDirection;
    .param p2, "unicodeIds"    # [I
    .param p3, "sequenceId"    # Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .param p4, "metaInfo"    # Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 67
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPossibleBreaks(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 75
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSupportedScripts()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/Character$UnicodeScript;",
            ">;"
        }
    .end annotation

    .line 49
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSupportedScripts(Ljava/lang/Object;)Ljava/util/Collection;
    .locals 1
    .param p1, "configurator"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Collection<",
            "Ljava/lang/Character$UnicodeScript;",
            ">;"
        }
    .end annotation

    .line 53
    const/4 v0, 0x0

    return-object v0
.end method

.method public abstract isPdfCalligraphInstance()Z
.end method

.method public loadShippedFonts()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 79
    const/4 v0, 0x0

    return-object v0
.end method

.method public reorderLine(Ljava/util/List;[B[B)[I
    .locals 1
    .param p2, "lineLevels"    # [B
    .param p3, "levels"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;",
            ">;[B[B)[I"
        }
    .end annotation

    .line 71
    .local p1, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;>;"
    const/4 v0, 0x0

    return-object v0
.end method
