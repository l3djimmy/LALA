.class public final Lcom/itextpdf/layout/renderer/TypographyUtils;
.super Ljava/lang/Object;
.source "TypographyUtils.java"


# static fields
.field private static final TYPOGRAPHY_APPLIER:Ljava/lang/String; = "shaping.TypographyApplier"

.field private static final TYPOGRAPHY_APPLIER_INITIALIZE:Ljava/lang/String; = "registerForLayout"

.field private static final TYPOGRAPHY_PACKAGE:Ljava/lang/String; = "com.itextpdf.typography."

.field private static applierInstance:Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 52
    :try_start_0
    const-string v0, "com.itextpdf.typography.shaping.TypographyApplier"

    invoke-static {v0}, Lcom/itextpdf/layout/renderer/TypographyUtils;->getTypographyClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 53
    .local v0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v0, :cond_0

    .line 54
    const-string/jumbo v1, "registerForLayout"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 55
    .local v1, "method":Ljava/lang/reflect/Method;
    if-eqz v1, :cond_0

    .line 56
    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .end local v0    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :cond_0
    goto :goto_0

    .line 59
    :catch_0
    move-exception v0

    .line 62
    :goto_0
    sget-object v0, Lcom/itextpdf/layout/renderer/TypographyUtils;->applierInstance:Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;

    if-nez v0, :cond_1

    .line 63
    new-instance v0, Lcom/itextpdf/layout/renderer/typography/DefaultTypographyApplier;

    invoke-direct {v0}, Lcom/itextpdf/layout/renderer/typography/DefaultTypographyApplier;-><init>()V

    invoke-static {v0}, Lcom/itextpdf/layout/renderer/TypographyUtils;->setTypographyApplierInstance(Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;)V

    .line 65
    :cond_1
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    return-void
.end method

.method static applyKerning(Lcom/itextpdf/io/font/FontProgram;Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)V
    .locals 1
    .param p0, "fontProgram"    # Lcom/itextpdf/io/font/FontProgram;
    .param p1, "text"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p2, "sequenceId"    # Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .param p3, "metaInfo"    # Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 106
    sget-object v0, Lcom/itextpdf/layout/renderer/TypographyUtils;->applierInstance:Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;->applyKerning(Lcom/itextpdf/io/font/FontProgram;Lcom/itextpdf/io/font/otf/GlyphLine;Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Z

    .line 107
    return-void
.end method

.method static applyOtfScript(Lcom/itextpdf/io/font/FontProgram;Lcom/itextpdf/io/font/otf/GlyphLine;Ljava/lang/Character$UnicodeScript;Ljava/lang/Object;Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)V
    .locals 7
    .param p0, "fontProgram"    # Lcom/itextpdf/io/font/FontProgram;
    .param p1, "text"    # Lcom/itextpdf/io/font/otf/GlyphLine;
    .param p2, "script"    # Ljava/lang/Character$UnicodeScript;
    .param p3, "typographyConfig"    # Ljava/lang/Object;
    .param p4, "sequenceId"    # Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .param p5, "metaInfo"    # Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 101
    sget-object v0, Lcom/itextpdf/layout/renderer/TypographyUtils;->applierInstance:Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;

    move-object v1, p0

    check-cast v1, Lcom/itextpdf/io/font/TrueTypeFont;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    .end local p1    # "text":Lcom/itextpdf/io/font/otf/GlyphLine;
    .end local p2    # "script":Ljava/lang/Character$UnicodeScript;
    .end local p3    # "typographyConfig":Ljava/lang/Object;
    .end local p4    # "sequenceId":Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .end local p5    # "metaInfo":Lcom/itextpdf/commons/actions/contexts/IMetaInfo;
    .local v2, "text":Lcom/itextpdf/io/font/otf/GlyphLine;
    .local v3, "script":Ljava/lang/Character$UnicodeScript;
    .local v4, "typographyConfig":Ljava/lang/Object;
    .local v5, "sequenceId":Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .local v6, "metaInfo":Lcom/itextpdf/commons/actions/contexts/IMetaInfo;
    invoke-virtual/range {v0 .. v6}, Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;->applyOtfScript(Lcom/itextpdf/io/font/TrueTypeFont;Lcom/itextpdf/io/font/otf/GlyphLine;Ljava/lang/Character$UnicodeScript;Ljava/lang/Object;Lcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)Z

    .line 103
    return-void
.end method

.method static getBidiLevels(Lcom/itextpdf/layout/properties/BaseDirection;[ILcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)[B
    .locals 1
    .param p0, "baseDirection"    # Lcom/itextpdf/layout/properties/BaseDirection;
    .param p1, "unicodeIds"    # [I
    .param p2, "sequenceId"    # Lcom/itextpdf/commons/actions/sequence/SequenceId;
    .param p3, "metaInfo"    # Lcom/itextpdf/commons/actions/contexts/IMetaInfo;

    .line 111
    sget-object v0, Lcom/itextpdf/layout/renderer/TypographyUtils;->applierInstance:Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;->getBidiLevels(Lcom/itextpdf/layout/properties/BaseDirection;[ILcom/itextpdf/commons/actions/sequence/SequenceId;Lcom/itextpdf/commons/actions/contexts/IMetaInfo;)[B

    move-result-object v0

    return-object v0
.end method

.method static getPossibleBreaks(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
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

    .line 119
    sget-object v0, Lcom/itextpdf/layout/renderer/TypographyUtils;->applierInstance:Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;

    invoke-virtual {v0, p0}, Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;->getPossibleBreaks(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static getSupportedScripts()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/Character$UnicodeScript;",
            ">;"
        }
    .end annotation

    .line 88
    sget-object v0, Lcom/itextpdf/layout/renderer/TypographyUtils;->applierInstance:Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;->getSupportedScripts()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public static getSupportedScripts(Ljava/lang/Object;)Ljava/util/Collection;
    .locals 1
    .param p0, "typographyConfig"    # Ljava/lang/Object;
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

    .line 92
    sget-object v0, Lcom/itextpdf/layout/renderer/TypographyUtils;->applierInstance:Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;

    invoke-virtual {v0, p0}, Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;->getSupportedScripts(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method private static getTypographyClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1
    .param p0, "typographyClassName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 123
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public static isPdfCalligraphAvailable()Z
    .locals 1

    .line 84
    sget-object v0, Lcom/itextpdf/layout/renderer/TypographyUtils;->applierInstance:Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;->isPdfCalligraphInstance()Z

    move-result v0

    return v0
.end method

.method public static loadShippedFonts()Ljava/util/Map;
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

    .line 96
    sget-object v0, Lcom/itextpdf/layout/renderer/TypographyUtils;->applierInstance:Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;

    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;->loadShippedFonts()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method static reorderLine(Ljava/util/List;[B[B)[I
    .locals 1
    .param p1, "lineLevels"    # [B
    .param p2, "levels"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;",
            ">;[B[B)[I"
        }
    .end annotation

    .line 115
    .local p0, "line":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/layout/renderer/LineRenderer$RendererGlyph;>;"
    sget-object v0, Lcom/itextpdf/layout/renderer/TypographyUtils;->applierInstance:Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;

    invoke-virtual {v0, p0, p1, p2}, Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;->reorderLine(Ljava/util/List;[B[B)[I

    move-result-object v0

    return-object v0
.end method

.method public static setTypographyApplierInstance(Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;)V
    .locals 0
    .param p0, "newInstance"    # Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;

    .line 76
    sput-object p0, Lcom/itextpdf/layout/renderer/TypographyUtils;->applierInstance:Lcom/itextpdf/layout/renderer/typography/AbstractTypographyApplier;

    .line 77
    return-void
.end method
