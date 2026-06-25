.class final Landroidx/compose/foundation/text/AutoSizeStepBased;
.super Ljava/lang/Object;
.source "TextAutoSize.kt"

# interfaces
.implements Landroidx/compose/foundation/text/TextAutoSize;


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nTextAutoSize.kt\nKotlin\n*S Kotlin\n*F\n+ 1 TextAutoSize.kt\nandroidx/compose/foundation/text/AutoSizeStepBased\n+ 2 TextUnit.kt\nandroidx/compose/ui/unit/TextUnit\n*L\n1#1,235:1\n182#2,2:236\n182#2,2:238\n*S KotlinDebug\n*F\n+ 1 TextAutoSize.kt\nandroidx/compose/foundation/text/AutoSizeStepBased\n*L\n134#1:236,2\n139#1:238,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0002\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0006J\u0013\u0010\u000c\u001a\u00020\t2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000eH\u0096\u0002J\u0008\u0010\u000f\u001a\u00020\u0010H\u0016J&\u0010\u0011\u001a\u00020\u0003*\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u0016H\u0016\u00f8\u0001\u0000\u00a2\u0006\u0004\u0008\u0017\u0010\u0018R\u0016\u0010\u0004\u001a\u00020\u0003X\u0082\u0004\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\n\u0002\u0010\u0007R\u0016\u0010\u0002\u001a\u00020\u0003X\u0082\u000e\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\n\u0002\u0010\u0007R\u0016\u0010\u0005\u001a\u00020\u0003X\u0082\u0004\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\n\u0002\u0010\u0007R\u0018\u0010\u0008\u001a\u00020\t*\u00020\n8BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0008\u0010\u000b\u0082\u0002\u000b\n\u0005\u0008\u00a1\u001e0\u0001\n\u0002\u0008!\u00a8\u0006\u0019"
    }
    d2 = {
        "Landroidx/compose/foundation/text/AutoSizeStepBased;",
        "Landroidx/compose/foundation/text/TextAutoSize;",
        "minFontSize",
        "Landroidx/compose/ui/unit/TextUnit;",
        "maxFontSize",
        "stepSize",
        "(JJJLkotlin/jvm/internal/DefaultConstructorMarker;)V",
        "J",
        "isLastLineEllipsized",
        "",
        "Landroidx/compose/ui/text/TextLayoutResult;",
        "(Landroidx/compose/ui/text/TextLayoutResult;)Z",
        "equals",
        "other",
        "",
        "hashCode",
        "",
        "getFontSize",
        "Landroidx/compose/foundation/text/modifiers/TextAutoSizeLayoutScope;",
        "constraints",
        "Landroidx/compose/ui/unit/Constraints;",
        "text",
        "Landroidx/compose/ui/text/AnnotatedString;",
        "getFontSize-Ci0_558",
        "(Landroidx/compose/foundation/text/modifiers/TextAutoSizeLayoutScope;JLandroidx/compose/ui/text/AnnotatedString;)J",
        "foundation_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final maxFontSize:J

.field private minFontSize:J

.field private final stepSize:J


# direct methods
.method private constructor <init>(JJJ)V
    .locals 7
    .param p1, "minFontSize"    # J
    .param p3, "maxFontSize"    # J
    .param p5, "stepSize"    # J

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    iput-wide p1, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->minFontSize:J

    .line 108
    iput-wide p3, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->maxFontSize:J

    .line 109
    iput-wide p5, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->stepSize:J

    .line 111
    nop

    .line 114
    iget-wide v0, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->minFontSize:J

    sget-object v2, Landroidx/compose/ui/unit/TextUnit;->Companion:Landroidx/compose/ui/unit/TextUnit$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/unit/TextUnit$Companion;->getUnspecified-XSAIIZE()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Landroidx/compose/ui/unit/TextUnit;->equals-impl0(JJ)Z

    move-result v0

    if-nez v0, :cond_7

    .line 120
    iget-wide v0, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->maxFontSize:J

    sget-object v2, Landroidx/compose/ui/unit/TextUnit;->Companion:Landroidx/compose/ui/unit/TextUnit$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/unit/TextUnit$Companion;->getUnspecified-XSAIIZE()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Landroidx/compose/ui/unit/TextUnit;->equals-impl0(JJ)Z

    move-result v0

    if-nez v0, :cond_6

    .line 126
    iget-wide v0, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->stepSize:J

    sget-object v2, Landroidx/compose/ui/unit/TextUnit;->Companion:Landroidx/compose/ui/unit/TextUnit$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/unit/TextUnit$Companion;->getUnspecified-XSAIIZE()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Landroidx/compose/ui/unit/TextUnit;->equals-impl0(JJ)Z

    move-result v0

    if-nez v0, :cond_5

    .line 134
    iget-wide v0, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->minFontSize:J

    invoke-static {v0, v1}, Landroidx/compose/ui/unit/TextUnit;->getType-UIouoOA(J)J

    move-result-wide v0

    iget-wide v2, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->maxFontSize:J

    invoke-static {v2, v3}, Landroidx/compose/ui/unit/TextUnit;->getType-UIouoOA(J)J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Landroidx/compose/ui/unit/TextUnitType;->equals-impl0(JJ)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->minFontSize:J

    .local v0, "arg0$iv":J
    iget-wide v2, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->maxFontSize:J

    .local v2, "other$iv":J
    const/4 v4, 0x0

    .line 236
    .local v4, "$i$f$compareTo--R2X_6o":I
    invoke-static {v0, v1, v2, v3}, Landroidx/compose/ui/unit/TextUnitKt;->checkArithmetic-NB67dxo(JJ)V

    .line 237
    invoke-static {v0, v1}, Landroidx/compose/ui/unit/TextUnit;->getValue-impl(J)F

    move-result v5

    invoke-static {v2, v3}, Landroidx/compose/ui/unit/TextUnit;->getValue-impl(J)F

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    .line 134
    .end local v0    # "arg0$iv":J
    .end local v2    # "other$iv":J
    .end local v4    # "$i$f$compareTo--R2X_6o":I
    if-lez v0, :cond_0

    .line 135
    iget-wide v0, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->maxFontSize:J

    iput-wide v0, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->minFontSize:J

    .line 139
    :cond_0
    iget-wide v0, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->stepSize:J

    invoke-static {v0, v1}, Landroidx/compose/ui/unit/TextUnit;->getType-UIouoOA(J)J

    move-result-wide v0

    sget-object v2, Landroidx/compose/ui/unit/TextUnitType;->Companion:Landroidx/compose/ui/unit/TextUnitType$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/unit/TextUnitType$Companion;->getSp-UIouoOA()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Landroidx/compose/ui/unit/TextUnitType;->equals-impl0(JJ)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-wide v0, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->stepSize:J

    .restart local v0    # "arg0$iv":J
    const v2, 0x38d1b717    # 1.0E-4f

    invoke-static {v2}, Landroidx/compose/ui/unit/TextUnitKt;->getSp(F)J

    move-result-wide v2

    .restart local v2    # "other$iv":J
    const/4 v4, 0x0

    .line 238
    .restart local v4    # "$i$f$compareTo--R2X_6o":I
    invoke-static {v0, v1, v2, v3}, Landroidx/compose/ui/unit/TextUnitKt;->checkArithmetic-NB67dxo(JJ)V

    .line 239
    invoke-static {v0, v1}, Landroidx/compose/ui/unit/TextUnit;->getValue-impl(J)F

    move-result v5

    invoke-static {v2, v3}, Landroidx/compose/ui/unit/TextUnit;->getValue-impl(J)F

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    .line 139
    .end local v0    # "arg0$iv":J
    .end local v2    # "other$iv":J
    .end local v4    # "$i$f$compareTo--R2X_6o":I
    if-ltz v0, :cond_1

    goto :goto_0

    .line 140
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 141
    nop

    .line 140
    const-string v1, "AutoSize.StepBased: stepSize must be greater than or equal to 0.0001f.sp"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 146
    :cond_2
    :goto_0
    iget-wide v0, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->minFontSize:J

    invoke-static {v0, v1}, Landroidx/compose/ui/unit/TextUnit;->getValue-impl(J)F

    move-result v0

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_4

    .line 149
    iget-wide v2, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->maxFontSize:J

    invoke-static {v2, v3}, Landroidx/compose/ui/unit/TextUnit;->getValue-impl(J)F

    move-result v0

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_3

    .line 152
    nop

    .line 106
    return-void

    .line 150
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "AutoSize.StepBased: maxFontSize must not be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 147
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "AutoSize.StepBased: minFontSize must not be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 127
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 128
    nop

    .line 127
    const-string v1, "AutoSize.StepBased: TextUnit.Unspecified is not a valid value for stepSize. Try using other values e.g. 0.25.sp"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 121
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 122
    nop

    .line 121
    const-string v1, "AutoSize.StepBased: TextUnit.Unspecified is not a valid value for maxFontSize. Try using other values e.g. 100.sp"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 115
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 116
    nop

    .line 115
    const-string v1, "AutoSize.StepBased: TextUnit.Unspecified is not a valid value for minFontSize. Try using other values e.g. 10.sp"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public synthetic constructor <init>(JJJLkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct/range {p0 .. p6}, Landroidx/compose/foundation/text/AutoSizeStepBased;-><init>(JJJ)V

    return-void
.end method

.method private final isLastLineEllipsized(Landroidx/compose/ui/text/TextLayoutResult;)Z
    .locals 1
    .param p1, "$this$isLastLineEllipsized"    # Landroidx/compose/ui/text/TextLayoutResult;

    .line 155
    invoke-virtual {p1}, Landroidx/compose/ui/text/TextLayoutResult;->getLineCount()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p1}, Landroidx/compose/ui/text/TextLayoutResult;->getLineCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Landroidx/compose/ui/text/TextLayoutResult;->isLineEllipsized(I)Z

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "other"    # Ljava/lang/Object;

    .line 217
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 218
    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 219
    :cond_1
    instance-of v2, p1, Landroidx/compose/foundation/text/AutoSizeStepBased;

    if-nez v2, :cond_2

    return v1

    .line 221
    :cond_2
    move-object v2, p1

    check-cast v2, Landroidx/compose/foundation/text/AutoSizeStepBased;

    iget-wide v2, v2, Landroidx/compose/foundation/text/AutoSizeStepBased;->minFontSize:J

    iget-wide v4, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->minFontSize:J

    invoke-static {v2, v3, v4, v5}, Landroidx/compose/ui/unit/TextUnit;->equals-impl0(JJ)Z

    move-result v2

    if-nez v2, :cond_3

    return v1

    .line 222
    :cond_3
    move-object v2, p1

    check-cast v2, Landroidx/compose/foundation/text/AutoSizeStepBased;

    iget-wide v2, v2, Landroidx/compose/foundation/text/AutoSizeStepBased;->maxFontSize:J

    iget-wide v4, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->maxFontSize:J

    invoke-static {v2, v3, v4, v5}, Landroidx/compose/ui/unit/TextUnit;->equals-impl0(JJ)Z

    move-result v2

    if-nez v2, :cond_4

    return v1

    .line 223
    :cond_4
    move-object v2, p1

    check-cast v2, Landroidx/compose/foundation/text/AutoSizeStepBased;

    iget-wide v2, v2, Landroidx/compose/foundation/text/AutoSizeStepBased;->stepSize:J

    iget-wide v4, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->stepSize:J

    invoke-static {v2, v3, v4, v5}, Landroidx/compose/ui/unit/TextUnit;->equals-impl0(JJ)Z

    move-result v2

    if-nez v2, :cond_5

    return v1

    .line 225
    :cond_5
    return v0
.end method

.method public getFontSize-Ci0_558(Landroidx/compose/foundation/text/modifiers/TextAutoSizeLayoutScope;JLandroidx/compose/ui/text/AnnotatedString;)J
    .locals 16
    .param p1, "$this$getFontSize_u2dCi0_558"    # Landroidx/compose/foundation/text/modifiers/TextAutoSizeLayoutScope;
    .param p2, "constraints"    # J
    .param p4, "text"    # Landroidx/compose/ui/text/AnnotatedString;

    .line 161
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-wide v2, v0, Landroidx/compose/foundation/text/AutoSizeStepBased;->stepSize:J

    invoke-interface {v1, v2, v3}, Landroidx/compose/foundation/text/modifiers/TextAutoSizeLayoutScope;->toPx--R2X_6o(J)F

    move-result v7

    .line 162
    .local v7, "stepSize":F
    iget-wide v2, v0, Landroidx/compose/foundation/text/AutoSizeStepBased;->minFontSize:J

    invoke-interface {v1, v2, v3}, Landroidx/compose/foundation/text/modifiers/TextAutoSizeLayoutScope;->toPx--R2X_6o(J)F

    move-result v8

    .line 163
    .local v8, "smallest":F
    iget-wide v2, v0, Landroidx/compose/foundation/text/AutoSizeStepBased;->maxFontSize:J

    invoke-interface {v1, v2, v3}, Landroidx/compose/foundation/text/modifiers/TextAutoSizeLayoutScope;->toPx--R2X_6o(J)F

    move-result v9

    .line 164
    .local v9, "largest":F
    move v2, v8

    .line 165
    .local v2, "min":F
    move v3, v9

    .line 167
    .local v3, "max":F
    add-float v4, v2, v3

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v4, v10

    move v11, v2

    move v12, v3

    move v13, v4

    .line 169
    .end local v2    # "min":F
    .end local v3    # "max":F
    .local v11, "min":F
    .local v12, "max":F
    .local v13, "current":F
    :goto_0
    sub-float v2, v12, v11

    cmpl-float v2, v2, v7

    const/4 v14, 0x0

    const/4 v15, 0x1

    if-ltz v2, :cond_9

    .line 170
    invoke-interface {v1, v13}, Landroidx/compose/foundation/text/modifiers/TextAutoSizeLayoutScope;->toSp-kPz2Gy4(F)J

    move-result-wide v5

    move-wide/from16 v2, p2

    move-object/from16 v4, p4

    invoke-interface/range {v1 .. v6}, Landroidx/compose/foundation/text/modifiers/TextAutoSizeLayoutScope;->performLayout-5ZSfY2I(JLandroidx/compose/ui/text/AnnotatedString;J)Landroidx/compose/ui/text/TextLayoutResult;

    move-result-object v5

    .line 172
    .local v5, "layoutResult":Landroidx/compose/ui/text/TextLayoutResult;
    invoke-virtual {v5}, Landroidx/compose/ui/text/TextLayoutResult;->getLayoutInput()Landroidx/compose/ui/text/TextLayoutInput;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/compose/ui/text/TextLayoutInput;->getOverflow-gIe3tQ8()I

    move-result v2

    .line 174
    nop

    .line 173
    sget-object v3, Landroidx/compose/ui/text/style/TextOverflow;->Companion:Landroidx/compose/ui/text/style/TextOverflow$Companion;

    invoke-virtual {v3}, Landroidx/compose/ui/text/style/TextOverflow$Companion;->getClip-gIe3tQ8()I

    move-result v3

    invoke-static {v2, v3}, Landroidx/compose/ui/text/style/TextOverflow;->equals-impl0(II)Z

    move-result v3

    if-eqz v3, :cond_0

    move v3, v15

    goto :goto_1

    .line 174
    :cond_0
    sget-object v3, Landroidx/compose/ui/text/style/TextOverflow;->Companion:Landroidx/compose/ui/text/style/TextOverflow$Companion;

    invoke-virtual {v3}, Landroidx/compose/ui/text/style/TextOverflow$Companion;->getVisible-gIe3tQ8()I

    move-result v3

    invoke-static {v2, v3}, Landroidx/compose/ui/text/style/TextOverflow;->equals-impl0(II)Z

    move-result v3

    :goto_1
    if-eqz v3, :cond_2

    .line 175
    invoke-virtual {v5}, Landroidx/compose/ui/text/TextLayoutResult;->getDidOverflowWidth()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v5}, Landroidx/compose/ui/text/TextLayoutResult;->getDidOverflowHeight()Z

    move-result v2

    if-eqz v2, :cond_6

    :cond_1
    move v14, v15

    goto :goto_5

    .line 179
    :cond_2
    nop

    .line 178
    nop

    .line 177
    sget-object v3, Landroidx/compose/ui/text/style/TextOverflow;->Companion:Landroidx/compose/ui/text/style/TextOverflow$Companion;

    invoke-virtual {v3}, Landroidx/compose/ui/text/style/TextOverflow$Companion;->getStartEllipsis-gIe3tQ8()I

    move-result v3

    invoke-static {v2, v3}, Landroidx/compose/ui/text/style/TextOverflow;->equals-impl0(II)Z

    move-result v3

    if-eqz v3, :cond_3

    move v3, v15

    goto :goto_2

    .line 178
    :cond_3
    sget-object v3, Landroidx/compose/ui/text/style/TextOverflow;->Companion:Landroidx/compose/ui/text/style/TextOverflow$Companion;

    invoke-virtual {v3}, Landroidx/compose/ui/text/style/TextOverflow$Companion;->getMiddleEllipsis-gIe3tQ8()I

    move-result v3

    invoke-static {v2, v3}, Landroidx/compose/ui/text/style/TextOverflow;->equals-impl0(II)Z

    move-result v3

    :goto_2
    if-eqz v3, :cond_4

    move v2, v15

    goto :goto_3

    .line 179
    :cond_4
    sget-object v3, Landroidx/compose/ui/text/style/TextOverflow;->Companion:Landroidx/compose/ui/text/style/TextOverflow$Companion;

    invoke-virtual {v3}, Landroidx/compose/ui/text/style/TextOverflow$Companion;->getEllipsis-gIe3tQ8()I

    move-result v3

    invoke-static {v2, v3}, Landroidx/compose/ui/text/style/TextOverflow;->equals-impl0(II)Z

    move-result v2

    :goto_3
    if-eqz v2, :cond_8

    .line 181
    const/4 v2, 0x0

    .line 182
    .local v2, "lineIndex":I
    :goto_4
    invoke-virtual {v5}, Landroidx/compose/ui/text/TextLayoutResult;->getLineCount()I

    move-result v3

    if-ge v2, v3, :cond_5

    .line 183
    invoke-virtual {v5, v2}, Landroidx/compose/ui/text/TextLayoutResult;->isLineEllipsized(I)Z

    move-result v3

    if-nez v3, :cond_5

    .line 184
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 186
    :cond_5
    if-lez v2, :cond_6

    move v14, v15

    nop

    .line 172
    .end local v2    # "lineIndex":I
    :cond_6
    :goto_5
    nop

    .line 171
    nop

    .line 194
    .local v14, "didOverflow":Z
    if-eqz v14, :cond_7

    .line 195
    move v2, v13

    move v12, v2

    .end local v12    # "max":F
    .local v2, "max":F
    goto :goto_6

    .line 197
    .end local v2    # "max":F
    .restart local v12    # "max":F
    :cond_7
    move v2, v13

    move v11, v2

    .line 199
    :goto_6
    add-float v2, v11, v12

    div-float v13, v2, v10

    .end local v5    # "layoutResult":Landroidx/compose/ui/text/TextLayoutResult;
    .end local v14    # "didOverflow":Z
    goto/16 :goto_0

    .line 189
    .restart local v5    # "layoutResult":Landroidx/compose/ui/text/TextLayoutResult;
    :cond_8
    new-instance v2, Ljava/lang/IllegalArgumentException;

    .line 190
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "TextOverflow type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 191
    invoke-virtual {v5}, Landroidx/compose/ui/text/TextLayoutResult;->getLayoutInput()Landroidx/compose/ui/text/TextLayoutInput;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/compose/ui/text/TextLayoutInput;->getOverflow-gIe3tQ8()I

    move-result v4

    .line 190
    invoke-static {v4}, Landroidx/compose/ui/text/style/TextOverflow;->toString-impl(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 191
    nop

    .line 190
    const-string v4, " is not supported."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 189
    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 202
    .end local v5    # "layoutResult":Landroidx/compose/ui/text/TextLayoutResult;
    :cond_9
    sub-float v2, v11, v8

    div-float/2addr v2, v7

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-float v2, v2

    mul-float/2addr v2, v7

    add-float v10, v2, v8

    .line 205
    .end local v13    # "current":F
    .local v10, "current":F
    add-float v2, v10, v7

    cmpg-float v2, v2, v9

    if-gtz v2, :cond_c

    .line 206
    add-float v2, v10, v7

    invoke-interface {v1, v2}, Landroidx/compose/foundation/text/modifiers/TextAutoSizeLayoutScope;->toSp-kPz2Gy4(F)J

    move-result-wide v5

    move-wide/from16 v2, p2

    move-object/from16 v4, p4

    invoke-interface/range {v1 .. v6}, Landroidx/compose/foundation/text/modifiers/TextAutoSizeLayoutScope;->performLayout-5ZSfY2I(JLandroidx/compose/ui/text/AnnotatedString;J)Landroidx/compose/ui/text/TextLayoutResult;

    move-result-object v5

    .line 207
    .restart local v5    # "layoutResult":Landroidx/compose/ui/text/TextLayoutResult;
    invoke-virtual {v5}, Landroidx/compose/ui/text/TextLayoutResult;->getDidOverflowWidth()Z

    move-result v2

    if-nez v2, :cond_a

    invoke-virtual {v5}, Landroidx/compose/ui/text/TextLayoutResult;->getDidOverflowHeight()Z

    move-result v2

    if-eqz v2, :cond_b

    :cond_a
    move v14, v15

    .line 208
    .restart local v14    # "didOverflow":Z
    :cond_b
    if-nez v14, :cond_c

    .line 209
    add-float/2addr v10, v7

    .line 213
    .end local v5    # "layoutResult":Landroidx/compose/ui/text/TextLayoutResult;
    .end local v14    # "didOverflow":Z
    :cond_c
    invoke-interface {v1, v10}, Landroidx/compose/foundation/text/modifiers/TextAutoSizeLayoutScope;->toSp-kPz2Gy4(F)J

    move-result-wide v2

    return-wide v2
.end method

.method public hashCode()I
    .locals 4

    .line 229
    iget-wide v0, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->minFontSize:J

    invoke-static {v0, v1}, Landroidx/compose/ui/unit/TextUnit;->hashCode-impl(J)I

    move-result v0

    .line 230
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->maxFontSize:J

    invoke-static {v2, v3}, Landroidx/compose/ui/unit/TextUnit;->hashCode-impl(J)I

    move-result v2

    add-int/2addr v1, v2

    .line 231
    .end local v0    # "result":I
    .local v1, "result":I
    mul-int/lit8 v0, v1, 0x1f

    iget-wide v2, p0, Landroidx/compose/foundation/text/AutoSizeStepBased;->stepSize:J

    invoke-static {v2, v3}, Landroidx/compose/ui/unit/TextUnit;->hashCode-impl(J)I

    move-result v2

    add-int/2addr v0, v2

    .line 232
    .end local v1    # "result":I
    .restart local v0    # "result":I
    return v0
.end method
