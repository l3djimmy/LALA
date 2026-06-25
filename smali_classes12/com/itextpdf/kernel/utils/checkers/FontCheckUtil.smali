.class public final Lcom/itextpdf/kernel/utils/checkers/FontCheckUtil;
.super Ljava/lang/Object;
.source "FontCheckUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/utils/checkers/FontCheckUtil$CharacterChecker;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    return-void
.end method

.method public static checkGlyphsOfText(Ljava/lang/String;Lcom/itextpdf/kernel/font/PdfFont;Lcom/itextpdf/kernel/utils/checkers/FontCheckUtil$CharacterChecker;)I
    .locals 3
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "font"    # Lcom/itextpdf/kernel/font/PdfFont;
    .param p2, "checker"    # Lcom/itextpdf/kernel/utils/checkers/FontCheckUtil$CharacterChecker;

    .line 47
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 49
    invoke-static {p0, v0}, Lcom/itextpdf/io/util/TextUtil;->isSurrogatePair(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 50
    invoke-static {p0, v0}, Lcom/itextpdf/io/util/TextUtil;->convertToUtf32(Ljava/lang/String;I)I

    move-result v1

    .line 51
    .local v1, "ch":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 53
    .end local v1    # "ch":I
    :cond_0
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 55
    .restart local v1    # "ch":I
    :goto_1
    invoke-interface {p2, v1, p1}, Lcom/itextpdf/kernel/utils/checkers/FontCheckUtil$CharacterChecker;->check(ILcom/itextpdf/kernel/font/PdfFont;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 56
    return v0

    .line 47
    .end local v1    # "ch":I
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 59
    .end local v0    # "i":I
    :cond_2
    const/4 v0, -0x1

    return v0
.end method
