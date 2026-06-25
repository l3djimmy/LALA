.class public final Lcom/itextpdf/layout/renderer/typography/DefaultTypographyApplier;
.super Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;
.source "DefaultTypographyApplier.java"


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 44
    const-class v0, Lcom/itextpdf/layout/renderer/typography/DefaultTypographyApplier;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/layout/renderer/typography/DefaultTypographyApplier;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;-><init>()V

    .line 47
    return-void
.end method


# virtual methods
.method public applyKerning(Lcom/itextpdf/io/font/FontProgram;Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Z
    .locals 2
    .param p1, "fontProgram"    # Lcom/itextpdf/io/font/FontProgram;
    .param p2, "text"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p3, "sequenceId"    # Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .param p4, "metaInfo"    # Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 75
    sget-object v0, Lcom/itextpdf/layout/renderer/typography/DefaultTypographyApplier;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "Cannot find pdfCalligraph module, which was implicitly required by one of the layout properties"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 76
    invoke-super {p0, p1, p2, p3, p4}, Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;->applyKerning(Lcom/itextpdf/io/font/FontProgram;Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Z

    move-result v0

    return v0
.end method

.method public applyOtfScript(Lcom/itextpdf/io/font/TrueTypeFont;Lcom/itextpdf/io/font/otf/GlyphLine;Ljava/lang/Character$UnicodeScript;Ljava/lang/Object;Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Z
    .locals 2
    .param p1, "font"    # Lcom/itextpdf/io/font/TrueTypeFont;
    .param p2, "glyphLine"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p3, "script"    # Ljava/lang/Character$UnicodeScript;
    .param p4, "configurator"    # Ljava/lang/Object;
    .param p5, "id"    # Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .param p6, "metaInfo"    # Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 57
    sget-object v0, Lcom/itextpdf/layout/renderer/typography/DefaultTypographyApplier;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "Cannot find pdfCalligraph module, which was implicitly required by one of the layout properties"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 58
    invoke-super/range {p0 .. p6}, Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;->applyOtfScript(Lcom/itextpdf/io/font/TrueTypeFont;Lcom/itextpdf/io/font/otf/GlyphLine;Ljava/lang/Character$UnicodeScript;Ljava/lang/Object;Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Z

    move-result v0

    return v0
.end method

.method public getBidiLevels(Lcom/itextpdf/layout/properties/BaseDirection;[ILcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)[B
    .locals 2
    .param p1, "baseDirection"    # Lcom/itextpdf/layout/properties/BaseDirection;
    .param p2, "unicodeIds"    # [I
    .param p3, "sequenceId"    # Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .param p4, "metaInfo"    # Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 82
    sget-object v0, Lcom/itextpdf/layout/renderer/typography/DefaultTypographyApplier;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "Cannot find pdfCalligraph module, which was implicitly required by one of the layout properties"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 83
    invoke-super {p0, p1, p2, p3, p4}, Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;->getBidiLevels(Lcom/itextpdf/layout/properties/BaseDirection;[ILcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)[B

    move-result-object v0

    return-object v0
.end method

.method public getPossibleBreaks(Ljava/lang/String;)Ljava/util/List;
    .locals 2
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

    .line 94
    sget-object v0, Lcom/itextpdf/layout/renderer/typography/DefaultTypographyApplier;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "Cannot find pdfCalligraph module, which was implicitly required by one of the layout properties"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 95
    invoke-super {p0, p1}, Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;->getPossibleBreaks(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedScripts()Ljava/util/Collection;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/Character$UnicodeScript;",
            ">;"
        }
    .end annotation

    .line 63
    sget-object v0, Lcom/itextpdf/layout/renderer/typography/DefaultTypographyApplier;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "Cannot find pdfCalligraph module, which was implicitly required by one of the layout properties"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 64
    invoke-super {p0}, Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;->getSupportedScripts()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedScripts(Ljava/lang/Object;)Ljava/util/Collection;
    .locals 2
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

    .line 69
    sget-object v0, Lcom/itextpdf/layout/renderer/typography/DefaultTypographyApplier;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "Cannot find pdfCalligraph module, which was implicitly required by one of the layout properties"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 70
    invoke-super {p0, p1}, Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;->getSupportedScripts(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public isPdfCalligraphInstance()Z
    .locals 1

    .line 51
    const/4 v0, 0x0

    return v0
.end method

.method public loadShippedFonts()Ljava/util/Map;
    .locals 2
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

    .line 100
    sget-object v0, Lcom/itextpdf/layout/renderer/typography/DefaultTypographyApplier;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "Cannot find pdfCalligraph module, which was implicitly required by one of the layout properties"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 101
    invoke-super {p0}, Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;->loadShippedFonts()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public reorderLine(Ljava/util/List;[B[B)[I
    .locals 2
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

    .line 88
    .local p1, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;>;"
    sget-object v0, Lcom/itextpdf/layout/renderer/typography/DefaultTypographyApplier;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "Cannot find pdfCalligraph module, which was implicitly required by one of the layout properties"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 89
    invoke-super {p0, p1, p2, p3}, Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;->reorderLine(Ljava/util/List;[B[B)[I

    move-result-object v0

    return-object v0
.end method
