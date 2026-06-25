.class Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;
.super Ljava/lang/Object;
.source "FlexUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/layout/renderer/FlexUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "FlexItemCalculationInfo"
.end annotation


# instance fields
.field crossSize:F

.field flexBaseSize:F

.field flexBasis:F

.field flexBasisContent:Z

.field flexGrow:F

.field flexShrink:F

.field hypotheticalCrossSize:F

.field hypotheticalMainSize:F

.field isColumnDirection:Z

.field isFrozen:Z

.field isMaxViolated:Z

.field isMinViolated:Z

.field mainSize:F

.field maxContent:F

.field minContent:F

.field renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

.field scaledFlexShrinkFactor:F

.field xShift:F

.field yShift:F


# direct methods
.method public constructor <init>(Lcom/itextpdf/layout/renderer/AbstractRenderer;FFFFZZF)V
    .locals 3
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p2, "flexBasis"    # F
    .param p3, "flexGrow"    # F
    .param p4, "flexShrink"    # F
    .param p5, "areaMainSize"    # F
    .param p6, "flexBasisContent"    # Z
    .param p7, "isColumnDirection"    # Z
    .param p8, "crossSize"    # F

    .line 1026
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1015
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isFrozen:Z

    .line 1016
    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isMinViolated:Z

    .line 1017
    iput-boolean v0, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isMaxViolated:Z

    .line 1027
    iput-boolean p7, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isColumnDirection:Z

    .line 1028
    iput-boolean p6, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexBasisContent:Z

    .line 1029
    iput-object p1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1030
    iput p2, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexBasis:F

    .line 1031
    const/4 v0, 0x0

    cmpg-float v1, p4, v0

    if-ltz v1, :cond_5

    .line 1034
    iput p4, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexShrink:F

    .line 1035
    cmpg-float v0, p3, v0

    if-ltz v0, :cond_4

    .line 1038
    iput p3, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->flexGrow:F

    .line 1039
    if-eqz p7, :cond_0

    .line 1040
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/FlexUtil;->access$000(Lcom/itextpdf/layout/renderer/AbstractRenderer;)Ljava/lang/Float;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {p1, p5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveMinWidth(F)Ljava/lang/Float;

    move-result-object v0

    .line 1042
    .local v0, "definiteMinContent":Ljava/lang/Float;
    :goto_0
    if-nez v0, :cond_1

    .line 1043
    invoke-direct {p0, p5, p8}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->calculateMinContentAuto(FF)F

    move-result v1

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v1

    :goto_1
    iput v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->minContent:F

    .line 1044
    nop

    .line 1045
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1044
    if-eqz p7, :cond_2

    .line 1045
    invoke-static {v1}, Lcom/itextpdf/layout/renderer/FlexUtil;->access$100(Lcom/itextpdf/layout/renderer/AbstractRenderer;)Ljava/lang/Float;

    move-result-object v1

    goto :goto_2

    :cond_2
    invoke-virtual {v1, p5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveMaxWidth(F)Ljava/lang/Float;

    move-result-object v1

    .line 1047
    .local v1, "maxMainSize":Ljava/lang/Float;
    :goto_2
    if-nez v1, :cond_3

    const v2, 0x49742400    # 1000000.0f

    goto :goto_3

    :cond_3
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    :goto_3
    iput v2, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->maxContent:F

    .line 1048
    return-void

    .line 1036
    .end local v0    # "definiteMinContent":Ljava/lang/Float;
    .end local v1    # "maxMainSize":Ljava/lang/Float;
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Flex grow cannot be negative."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1032
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Flex shrink cannot be negative."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private calculateContentSizeSuggestion(FF)F
    .locals 6
    .param p1, "flexContainerMainSize"    # F
    .param p2, "crossSize"    # F

    .line 1157
    iget-object v0, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    const/16 v1, 0x4d

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->replaceOwnProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/UnitValue;

    .line 1158
    .local v0, "rendererWidth":Lcom/itextpdf/layout/properties/UnitValue;
    iget-object v3, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    const/16 v4, 0x1b

    invoke-virtual {v3, v4, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->replaceOwnProperty(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/properties/UnitValue;

    .line 1160
    .local v2, "rendererHeight":Lcom/itextpdf/layout/properties/UnitValue;
    iget-boolean v3, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isColumnDirection:Z

    .line 1167
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1160
    if-eqz v3, :cond_1

    .line 1161
    invoke-static {v5}, Lcom/itextpdf/layout/renderer/FlexUtil;->access$000(Lcom/itextpdf/layout/renderer/AbstractRenderer;)Ljava/lang/Float;

    move-result-object v3

    .line 1162
    .local v3, "height":Ljava/lang/Float;
    if-nez v3, :cond_0

    .line 1163
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-static {v5, p2}, Lcom/itextpdf/layout/renderer/FlexUtil;->access$200(Lcom/itextpdf/layout/renderer/AbstractRenderer;F)F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    .line 1165
    :cond_0
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {p0, v5}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getInnerMainSize(F)F

    move-result v3

    .line 1166
    .local v3, "minContentSize":F
    goto :goto_0

    .line 1167
    .end local v3    # "minContentSize":F
    :cond_1
    invoke-virtual {v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getMinMaxWidth()Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;

    move-result-object v3

    .line 1168
    .local v3, "minMaxWidth":Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;
    invoke-virtual {v3}, Lcom/itextpdf/layout/minmaxwidth/MinMaxWidth;->getMinWidth()F

    move-result v5

    invoke-virtual {p0, v5}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getInnerMainSize(F)F

    move-result v5

    move v3, v5

    .line 1170
    .local v3, "minContentSize":F
    :goto_0
    iget-object v5, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v5, v4, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->returnBackOwnProperty(ILjava/lang/Object;)V

    .line 1171
    iget-object v4, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v4, v1, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->returnBackOwnProperty(ILjava/lang/Object;)V

    .line 1173
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasAspectRatio()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1174
    nop

    .line 1175
    invoke-direct {p0, v3, p1}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->clampValueByCrossSizesConvertedThroughAspectRatio(FF)F

    move-result v3

    .line 1177
    :cond_2
    iget-boolean v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isColumnDirection:Z

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    if-eqz v1, :cond_3

    invoke-static {v4}, Lcom/itextpdf/layout/renderer/FlexUtil;->access$100(Lcom/itextpdf/layout/renderer/AbstractRenderer;)Ljava/lang/Float;

    move-result-object v1

    goto :goto_1

    .line 1178
    :cond_3
    invoke-virtual {v4, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveMaxWidth(F)Ljava/lang/Float;

    move-result-object v1

    :goto_1
    nop

    .line 1179
    .local v1, "maxMainSize":Ljava/lang/Float;
    if-nez v1, :cond_4

    .line 1180
    const v4, 0x49742400    # 1000000.0f

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    .line 1183
    :cond_4
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v4

    return v4
.end method

.method private calculateMinContentAuto(FF)F
    .locals 4
    .param p1, "flexContainerMainSize"    # F
    .param p2, "crossSize"    # F

    .line 1082
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->calculateSpecifiedSizeSuggestion(F)Ljava/lang/Float;

    move-result-object v0

    .line 1083
    .local v0, "specifiedSizeSuggestion":Ljava/lang/Float;
    invoke-direct {p0, p1, p2}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->calculateContentSizeSuggestion(FF)F

    move-result v1

    .line 1084
    .local v1, "contentSizeSuggestion":F
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasAspectRatio()Z

    move-result v2

    if-eqz v2, :cond_1

    if-nez v0, :cond_1

    .line 1088
    invoke-direct {p0, p1}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->calculateTransferredSizeSuggestion(F)Ljava/lang/Float;

    move-result-object v2

    .line 1089
    .local v2, "transferredSizeSuggestion":Ljava/lang/Float;
    if-nez v2, :cond_0

    .line 1090
    return v1

    .line 1092
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    return v3

    .line 1094
    .end local v2    # "transferredSizeSuggestion":Ljava/lang/Float;
    :cond_1
    if-nez v0, :cond_2

    .line 1097
    return v1

    .line 1101
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    return v2
.end method

.method private calculateSpecifiedSizeSuggestion(F)Ljava/lang/Float;
    .locals 3
    .param p1, "flexContainerMainSize"    # F

    .line 1134
    const/4 v0, 0x0

    .line 1135
    .local v0, "mainSizeSuggestion":Ljava/lang/Float;
    iget-boolean v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isColumnDirection:Z

    .line 1140
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1135
    if-eqz v1, :cond_0

    .line 1136
    const/16 v1, 0x1b

    invoke-virtual {v2, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasProperty(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1137
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveHeight()Ljava/lang/Float;

    move-result-object v0

    goto :goto_0

    .line 1140
    :cond_0
    const/16 v1, 0x4d

    invoke-virtual {v2, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasProperty(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1141
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v1, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveWidth(F)Ljava/lang/Float;

    move-result-object v0

    .line 1145
    :cond_1
    :goto_0
    return-object v0
.end method

.method private calculateTransferredSizeSuggestion(F)Ljava/lang/Float;
    .locals 4
    .param p1, "flexContainerMainSize"    # F

    .line 1113
    const/4 v0, 0x0

    .line 1114
    .local v0, "transferredSizeSuggestion":Ljava/lang/Float;
    iget-boolean v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isColumnDirection:Z

    .line 1115
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1114
    if-eqz v1, :cond_0

    .line 1115
    invoke-virtual {v2, p1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveWidth(F)Ljava/lang/Float;

    move-result-object v1

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveHeight()Ljava/lang/Float;

    move-result-object v1

    .line 1116
    .local v1, "crossSize":Ljava/lang/Float;
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasAspectRatio()Z

    move-result v2

    if-eqz v2, :cond_1

    if-eqz v1, :cond_1

    .line 1117
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getAspectRatio()Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    mul-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 1119
    nop

    .line 1120
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v2

    .line 1119
    invoke-direct {p0, v2, p1}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->clampValueByCrossSizesConvertedThroughAspectRatio(FF)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 1122
    :cond_1
    return-object v0
.end method

.method private clampValueByCrossSizesConvertedThroughAspectRatio(FF)F
    .locals 5
    .param p1, "value"    # F
    .param p2, "flexContainerMainSize"    # F

    .line 1187
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isColumnDirection:Z

    .line 1188
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1187
    if-eqz v0, :cond_0

    .line 1188
    invoke-virtual {v1, p2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveMaxWidth(F)Ljava/lang/Float;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveMaxHeight()Ljava/lang/Float;

    move-result-object v0

    .line 1189
    .local v0, "maxCrossSize":Ljava/lang/Float;
    :goto_0
    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    iget-boolean v2, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isColumnDirection:Z

    if-eqz v2, :cond_1

    const/16 v2, 0x4f

    goto :goto_1

    :cond_1
    const/16 v2, 0x54

    .line 1190
    :goto_1
    invoke-virtual {v1, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasProperty(I)Z

    move-result v1

    if-nez v1, :cond_3

    .line 1191
    :cond_2
    const v1, 0x49742400    # 1000000.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 1193
    :cond_3
    iget-boolean v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isColumnDirection:Z

    .line 1194
    iget-object v2, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1193
    if-eqz v1, :cond_4

    .line 1194
    invoke-virtual {v2, p2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveMinWidth(F)Ljava/lang/Float;

    move-result-object v1

    goto :goto_2

    :cond_4
    invoke-virtual {v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->retrieveMinHeight()Ljava/lang/Float;

    move-result-object v1

    .line 1195
    .local v1, "minCrossSize":Ljava/lang/Float;
    :goto_2
    if-eqz v1, :cond_6

    iget-object v2, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    iget-boolean v3, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isColumnDirection:Z

    if-eqz v3, :cond_5

    const/16 v3, 0x50

    goto :goto_3

    :cond_5
    const/16 v3, 0x55

    .line 1196
    :goto_3
    invoke-virtual {v2, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->hasProperty(I)Z

    move-result v2

    if-nez v2, :cond_7

    .line 1197
    :cond_6
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    .line 1200
    :cond_7
    nop

    .line 1201
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iget-object v3, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getAspectRatio()Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    mul-float/2addr v2, v3

    invoke-static {v2, p1}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 1202
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    iget-object v4, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    invoke-virtual {v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getAspectRatio()Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    mul-float/2addr v3, v4

    .line 1200
    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    return v2
.end method


# virtual methods
.method getInnerCrossSize(F)F
    .locals 4
    .param p1, "size"    # F

    .line 1075
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isColumnDirection:Z

    .line 1076
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1075
    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-direct {v0, p1, v3}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    .line 1076
    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMarginsBordersPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-direct {v0, v3, p1}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    .line 1077
    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMarginsBordersPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    .line 1075
    :goto_0
    return v0
.end method

.method getInnerMainSize(F)F
    .locals 4
    .param p1, "size"    # F

    .line 1063
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isColumnDirection:Z

    .line 1064
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1063
    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-direct {v0, v3, p1}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    .line 1064
    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMarginsBordersPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-direct {v0, p1, v3}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    .line 1065
    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMarginsBordersPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v0

    .line 1063
    :goto_0
    return v0
.end method

.method getOuterCrossSize(F)F
    .locals 4
    .param p1, "size"    # F

    .line 1069
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isColumnDirection:Z

    .line 1070
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1069
    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-direct {v0, p1, v3}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    .line 1070
    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMarginsBordersPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-direct {v0, v3, p1}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    .line 1071
    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMarginsBordersPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    .line 1069
    :goto_0
    return v0
.end method

.method getOuterMainSize(F)F
    .locals 4
    .param p1, "size"    # F

    .line 1057
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isColumnDirection:Z

    .line 1058
    iget-object v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->renderer:Lcom/itextpdf/layout/renderer/AbstractRenderer;

    .line 1057
    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-direct {v0, v3, p1}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    .line 1058
    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMarginsBordersPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    invoke-direct {v0, p1, v3}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FF)V

    .line 1059
    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->applyMarginsBordersPaddings(Lcom/itextpdf/kernel/geom/Rectangle;Z)Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v0

    .line 1057
    :goto_0
    return v0
.end method

.method public toRectangle()Lcom/itextpdf/kernel/geom/Rectangle;
    .locals 5

    .line 1051
    iget-boolean v0, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->isColumnDirection:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    iget v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->xShift:F

    iget v2, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->yShift:F

    iget v3, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->crossSize:F

    .line 1052
    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getOuterCrossSize(F)F

    move-result v3

    iget v4, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    invoke-virtual {p0, v4}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getOuterMainSize(F)F

    move-result v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/geom/Rectangle;

    iget v1, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->xShift:F

    iget v2, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->yShift:F

    iget v3, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->mainSize:F

    .line 1053
    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getOuterMainSize(F)F

    move-result v3

    iget v4, p0, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->crossSize:F

    invoke-virtual {p0, v4}, Lcom/itextpdf/layout/renderer/FlexUtil$FlexItemCalculationInfo;->getOuterCrossSize(F)F

    move-result v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/itextpdf/kernel/geom/Rectangle;-><init>(FFFF)V

    .line 1051
    :goto_0
    return-object v0
.end method
