.class public Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;
.super Ljava/lang/Object;
.source "AccessibleAttributesApplier.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static applyBlockLevelLayoutAttributes(Ljava/lang/String;Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 20
    .param p0, "role"    # Ljava/lang/String;
    .param p1, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p2, "attributes"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 165
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    const/4 v3, 0x4

    new-array v3, v3, [Lcom/itextpdf/layout/properties/UnitValue;

    const/16 v4, 0x2e

    invoke-virtual {v1, v4}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v3, v6

    .line 166
    const/16 v5, 0x2b

    invoke-virtual {v1, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v7

    const/4 v8, 0x1

    aput-object v7, v3, v8

    .line 167
    const/16 v7, 0x2c

    invoke-virtual {v1, v7}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v9

    const/4 v10, 0x2

    aput-object v9, v3, v10

    .line 168
    const/16 v9, 0x2d

    invoke-virtual {v1, v9}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v11

    const/4 v12, 0x3

    aput-object v11, v3, v12

    .line 171
    .local v3, "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    filled-new-array {v6, v8, v10, v12}, [I

    move-result-object v11

    .line 173
    .local v11, "marginsOrder":[I
    aget v6, v11, v6

    aget-object v6, v3, v6

    .line 174
    .local v6, "spaceBefore":Lcom/itextpdf/layout/properties/UnitValue;
    const-string v13, "Property {0} in percents is not supported"

    const-class v14, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;

    const/4 v15, 0x0

    if-eqz v6, :cond_2

    .line 175
    invoke-virtual {v6}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v16

    if-nez v16, :cond_0

    .line 176
    move/from16 v16, v4

    invoke-static {v14}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v4

    .line 177
    .local v4, "logger":Lorg/slf4j/Logger;
    nop

    .line 178
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    move/from16 v17, v5

    filled-new-array/range {v16 .. v16}, [Ljava/lang/Object;

    move-result-object v5

    .line 177
    invoke-static {v13, v5}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 175
    .end local v4    # "logger":Lorg/slf4j/Logger;
    :cond_0
    move/from16 v17, v5

    .line 180
    :goto_0
    invoke-virtual {v6}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v4

    cmpl-float v4, v15, v4

    if-eqz v4, :cond_1

    .line 181
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->SpaceBefore:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfNumber;

    move/from16 v16, v7

    invoke-virtual {v6}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v7

    move/from16 v18, v8

    move/from16 v19, v9

    float-to-double v8, v7

    invoke-direct {v5, v8, v9}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v2, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_1

    .line 180
    :cond_1
    move/from16 v16, v7

    move/from16 v18, v8

    move/from16 v19, v9

    goto :goto_1

    .line 174
    :cond_2
    move/from16 v17, v5

    move/from16 v16, v7

    move/from16 v18, v8

    move/from16 v19, v9

    .line 185
    :goto_1
    aget v4, v11, v18

    aget-object v4, v3, v4

    .line 186
    .local v4, "spaceAfter":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v4, :cond_4

    .line 187
    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v5

    if-nez v5, :cond_3

    .line 188
    invoke-static {v14}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v5

    .line 189
    .local v5, "logger":Lorg/slf4j/Logger;
    nop

    .line 190
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    .line 189
    invoke-static {v13, v7}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 192
    .end local v5    # "logger":Lorg/slf4j/Logger;
    :cond_3
    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v5

    cmpl-float v5, v15, v5

    if-eqz v5, :cond_4

    .line 193
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->SpaceAfter:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v7, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v8

    float-to-double v8, v8

    invoke-direct {v7, v8, v9}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v2, v5, v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 198
    :cond_4
    aget v5, v11, v10

    aget-object v5, v3, v5

    .line 199
    .local v5, "startIndent":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v5, :cond_6

    .line 200
    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v7

    if-nez v7, :cond_5

    .line 201
    invoke-static {v14}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v7

    .line 202
    .local v7, "logger":Lorg/slf4j/Logger;
    nop

    .line 203
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    .line 202
    invoke-static {v13, v8}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 205
    .end local v7    # "logger":Lorg/slf4j/Logger;
    :cond_5
    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v7

    cmpl-float v7, v15, v7

    if-eqz v7, :cond_6

    .line 206
    sget-object v7, Lcom/itextpdf/kernel/pdf/PdfName;->StartIndent:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v8, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v9

    float-to-double v9, v9

    invoke-direct {v8, v9, v10}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v2, v7, v8}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 210
    :cond_6
    aget v7, v11, v12

    aget-object v7, v3, v7

    .line 211
    .local v7, "endIndent":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v7, :cond_8

    .line 212
    invoke-virtual {v7}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v8

    if-nez v8, :cond_7

    .line 213
    invoke-static {v14}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v8

    .line 214
    .local v8, "logger":Lorg/slf4j/Logger;
    nop

    .line 215
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v9

    .line 214
    invoke-static {v13, v9}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 217
    .end local v8    # "logger":Lorg/slf4j/Logger;
    :cond_7
    invoke-virtual {v7}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v8

    cmpl-float v8, v15, v8

    if-eqz v8, :cond_8

    .line 218
    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->EndIndent:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v9, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v7}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v10

    float-to-double v12, v10

    invoke-direct {v9, v12, v13}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v2, v8, v9}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 222
    :cond_8
    const/16 v8, 0x12

    invoke-virtual {v1, v8}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v8

    .line 223
    .local v8, "firstLineIndent":Ljava/lang/Float;
    if-eqz v8, :cond_9

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v9

    cmpl-float v9, v9, v15

    if-eqz v9, :cond_9

    .line 224
    sget-object v9, Lcom/itextpdf/kernel/pdf/PdfName;->TextIndent:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v10, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v12

    float-to-double v12, v12

    invoke-direct {v10, v12, v13}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v2, v9, v10}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 227
    :cond_9
    const/16 v9, 0x46

    invoke-virtual {v1, v9}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/itextpdf/layout/properties/TextAlignment;

    .line 228
    .local v9, "textAlignment":Lcom/itextpdf/layout/properties/TextAlignment;
    const-string v10, "TD"

    const-string v12, "TH"

    if-eqz v9, :cond_a

    .line 230
    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_a

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_a

    .line 231
    sget-object v13, Lcom/itextpdf/kernel/pdf/PdfName;->TextAlign:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v9}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->transformTextAlignmentValueToName(Lcom/itextpdf/layout/properties/TextAlignment;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v14

    invoke-virtual {v2, v13, v14}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 235
    :cond_a
    iget-boolean v13, v1, Lcom/itextpdf/layout/renderer/AbstractRenderer;->isLastRendererForModelElement:Z

    if-eqz v13, :cond_b

    .line 236
    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v13

    invoke-virtual {v13}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v13

    .line 237
    .local v13, "bbox":Lcom/itextpdf/kernel/geom/Rectangle;
    sget-object v14, Lcom/itextpdf/kernel/pdf/PdfName;->BBox:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v15, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v15, v13}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-virtual {v2, v14, v15}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 240
    .end local v13    # "bbox":Lcom/itextpdf/kernel/geom/Rectangle;
    :cond_b
    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_d

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_d

    const-string v13, "Table"

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_c

    goto :goto_2

    :cond_c
    move-object/from16 v16, v3

    move-object/from16 v17, v4

    goto :goto_5

    .line 245
    :cond_d
    :goto_2
    instance-of v13, v1, Lcom/itextpdf/layout/renderer/TableRenderer;

    if-eqz v13, :cond_f

    invoke-virtual {v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/layout/element/Table;

    invoke-virtual {v13}, Lcom/itextpdf/layout/element/Table;->isComplete()Z

    move-result v13

    if-eqz v13, :cond_e

    goto :goto_3

    :cond_e
    move-object/from16 v16, v3

    move-object/from16 v17, v4

    goto :goto_4

    .line 246
    :cond_f
    :goto_3
    const/16 v13, 0x4d

    invoke-virtual {v1, v13}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/itextpdf/layout/properties/UnitValue;

    .line 247
    .local v13, "width":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v13, :cond_10

    invoke-virtual {v13}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v14

    if-eqz v14, :cond_10

    .line 248
    sget-object v14, Lcom/itextpdf/kernel/pdf/PdfName;->Width:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v15, Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-object/from16 v16, v3

    .end local v3    # "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .local v16, "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v13}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v3

    move-object/from16 v17, v4

    .end local v4    # "spaceAfter":Lcom/itextpdf/layout/properties/UnitValue;
    .local v17, "spaceAfter":Lcom/itextpdf/layout/properties/UnitValue;
    float-to-double v3, v3

    invoke-direct {v15, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v2, v14, v15}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_4

    .line 247
    .end local v16    # "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .end local v17    # "spaceAfter":Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v3    # "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v4    # "spaceAfter":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_10
    move-object/from16 v16, v3

    move-object/from16 v17, v4

    .line 251
    .end local v3    # "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .end local v4    # "spaceAfter":Lcom/itextpdf/layout/properties/UnitValue;
    .end local v13    # "width":Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v16    # "margins":[Lcom/itextpdf/layout/properties/UnitValue;
    .restart local v17    # "spaceAfter":Lcom/itextpdf/layout/properties/UnitValue;
    :goto_4
    const/16 v3, 0x1b

    invoke-virtual {v1, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/properties/UnitValue;

    .line 252
    .local v3, "height":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v3, :cond_11

    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v4

    if-eqz v4, :cond_11

    .line 253
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Height:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v13, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v14

    float-to-double v14, v14

    invoke-direct {v13, v14, v15}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v2, v4, v13}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 257
    .end local v3    # "height":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_11
    :goto_5
    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_12

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 258
    :cond_12
    const/16 v3, 0x1c

    invoke-virtual {v1, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/properties/HorizontalAlignment;

    .line 259
    .local v3, "horizontalAlignment":Lcom/itextpdf/layout/properties/HorizontalAlignment;
    if-eqz v3, :cond_13

    .line 260
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->BlockAlign:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v3}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->transformBlockAlignToName(Lcom/itextpdf/layout/properties/HorizontalAlignment;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v10

    invoke-virtual {v2, v4, v10}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 263
    :cond_13
    if-eqz v9, :cond_14

    sget-object v4, Lcom/itextpdf/layout/properties/TextAlignment;->JUSTIFIED:Lcom/itextpdf/layout/properties/TextAlignment;

    if-eq v9, v4, :cond_14

    sget-object v4, Lcom/itextpdf/layout/properties/TextAlignment;->JUSTIFIED_ALL:Lcom/itextpdf/layout/properties/TextAlignment;

    if-eq v9, v4, :cond_14

    .line 266
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->InlineAlign:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v9}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->transformTextAlignmentValueToName(Lcom/itextpdf/layout/properties/TextAlignment;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v10

    invoke-virtual {v2, v4, v10}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 270
    .end local v3    # "horizontalAlignment":Lcom/itextpdf/layout/properties/HorizontalAlignment;
    :cond_14
    return-void
.end method

.method private static applyBorderAttributes(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 19
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p1, "attributes"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 377
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/16 v2, 0xd

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    const/4 v4, 0x0

    if-nez v2, :cond_1

    .line 378
    const/16 v2, 0xc

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_1

    .line 379
    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_1

    .line 380
    const/16 v2, 0xb

    invoke-virtual {v0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    move v2, v4

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v2, 0x1

    .line 382
    .local v2, "specificBorderProperties":Z
    :goto_1
    const/16 v5, 0x9

    if-nez v2, :cond_2

    invoke-virtual {v0, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_2

    const/4 v6, 0x1

    goto :goto_2

    :cond_2
    move v6, v4

    .line 384
    .local v6, "generalBorderProperties":Z
    :goto_2
    if-eqz v6, :cond_3

    .line 385
    invoke-virtual {v0, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/itextpdf/layout/borders/Border;

    .line 386
    .local v5, "generalBorder":Lcom/itextpdf/layout/borders/Border;
    invoke-virtual {v5}, Lcom/itextpdf/layout/borders/Border;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v7

    .line 387
    .local v7, "generalBorderColor":Lcom/itextpdf/kernel/colors/Color;
    invoke-virtual {v5}, Lcom/itextpdf/layout/borders/Border;->getType()I

    move-result v8

    .line 388
    .local v8, "borderType":I
    invoke-virtual {v5}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v9

    .line 390
    .local v9, "borderWidth":F
    instance-of v10, v7, Lcom/itextpdf/kernel/colors/DeviceRgb;

    if-eqz v10, :cond_3

    .line 391
    sget-object v10, Lcom/itextpdf/kernel/pdf/PdfName;->BorderColor:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v11, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/colors/Color;->getColorValue()[F

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {v1, v10, v11}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 392
    sget-object v10, Lcom/itextpdf/kernel/pdf/PdfName;->BorderStyle:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v8}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->transformBorderTypeToName(I)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v11

    invoke-virtual {v1, v10, v11}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 393
    sget-object v10, Lcom/itextpdf/kernel/pdf/PdfName;->BorderThickness:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v11, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v12, v9

    invoke-direct {v11, v12, v13}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v1, v10, v11}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 397
    .end local v5    # "generalBorder":Lcom/itextpdf/layout/borders/Border;
    .end local v7    # "generalBorderColor":Lcom/itextpdf/kernel/colors/Color;
    .end local v8    # "borderType":I
    .end local v9    # "borderWidth":F
    :cond_3
    if-eqz v2, :cond_13

    .line 398
    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v5}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 399
    .local v5, "borderColors":Lcom/itextpdf/kernel/pdf/PdfArray;
    new-instance v7, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v7}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 400
    .local v7, "borderTypes":Lcom/itextpdf/kernel/pdf/PdfArray;
    new-instance v8, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v8}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 401
    .local v8, "borderWidths":Lcom/itextpdf/kernel/pdf/PdfArray;
    const/4 v9, 0x0

    .line 402
    .local v9, "atLeastOneRgb":Z
    invoke-virtual {v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getBorders()[Lcom/itextpdf/layout/borders/Border;

    move-result-object v10

    .line 404
    .local v10, "borders":[Lcom/itextpdf/layout/borders/Border;
    const/4 v11, 0x1

    .line 405
    .local v11, "allColorsEqual":Z
    const/4 v12, 0x1

    .line 406
    .local v12, "allTypesEqual":Z
    const/4 v13, 0x1

    .line 408
    .local v13, "allWidthsEqual":Z
    const/4 v14, 0x1

    .local v14, "i":I
    :goto_3
    array-length v15, v10

    if-ge v14, v15, :cond_b

    .line 409
    aget-object v15, v10, v14

    .line 410
    .local v15, "border":Lcom/itextpdf/layout/borders/Border;
    if-eqz v15, :cond_9

    .line 411
    aget-object v16, v10, v4

    if-eqz v16, :cond_4

    invoke-virtual {v15}, Lcom/itextpdf/layout/borders/Border;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v3

    aget-object v17, v10, v4

    move/from16 v18, v4

    invoke-virtual/range {v17 .. v17}, Lcom/itextpdf/layout/borders/Border;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/colors/Color;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    goto :goto_4

    :cond_4
    move/from16 v18, v4

    .line 412
    :goto_4
    const/4 v11, 0x0

    .line 415
    :cond_5
    aget-object v3, v10, v18

    if-eqz v3, :cond_6

    invoke-virtual {v15}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v3

    aget-object v4, v10, v18

    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v4

    cmpl-float v3, v3, v4

    if-eqz v3, :cond_7

    .line 416
    :cond_6
    const/4 v13, 0x0

    .line 419
    :cond_7
    aget-object v3, v10, v18

    if-eqz v3, :cond_8

    invoke-virtual {v15}, Lcom/itextpdf/layout/borders/Border;->getType()I

    move-result v3

    aget-object v4, v10, v18

    invoke-virtual {v4}, Lcom/itextpdf/layout/borders/Border;->getType()I

    move-result v4

    if-eq v3, v4, :cond_a

    .line 420
    :cond_8
    const/4 v3, 0x0

    move v12, v3

    .end local v12    # "allTypesEqual":Z
    .local v3, "allTypesEqual":Z
    goto :goto_5

    .line 410
    .end local v3    # "allTypesEqual":Z
    .restart local v12    # "allTypesEqual":Z
    :cond_9
    move/from16 v18, v4

    .line 408
    .end local v15    # "border":Lcom/itextpdf/layout/borders/Border;
    :cond_a
    :goto_5
    add-int/lit8 v14, v14, 0x1

    move/from16 v4, v18

    goto :goto_3

    :cond_b
    move/from16 v18, v4

    .line 426
    .end local v14    # "i":I
    const/4 v3, 0x2

    const/4 v4, 0x3

    move/from16 v15, v18

    const/4 v14, 0x1

    filled-new-array {v15, v14, v3, v4}, [I

    move-result-object v3

    .line 427
    .local v3, "borderOrder":[I
    array-length v4, v3

    const/4 v14, 0x0

    :goto_6
    if-ge v14, v4, :cond_e

    aget v15, v3, v14

    .line 428
    .local v15, "i":I
    aget-object v16, v10, v15

    if-eqz v16, :cond_d

    .line 429
    aget-object v16, v10, v15

    invoke-virtual/range {v16 .. v16}, Lcom/itextpdf/layout/borders/Border;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    instance-of v0, v0, Lcom/itextpdf/kernel/colors/DeviceRgb;

    if-eqz v0, :cond_c

    .line 430
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    aget-object v16, v10, v15

    invoke-virtual/range {v16 .. v16}, Lcom/itextpdf/layout/borders/Border;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v16

    move/from16 v17, v2

    .end local v2    # "specificBorderProperties":Z
    .local v17, "specificBorderProperties":Z
    invoke-virtual/range {v16 .. v16}, Lcom/itextpdf/kernel/colors/Color;->getColorValue()[F

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {v5, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 431
    const/4 v9, 0x1

    goto :goto_7

    .line 433
    .end local v17    # "specificBorderProperties":Z
    .restart local v2    # "specificBorderProperties":Z
    :cond_c
    move/from16 v17, v2

    .end local v2    # "specificBorderProperties":Z
    .restart local v17    # "specificBorderProperties":Z
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfNull;->PDF_NULL:Lcom/itextpdf/kernel/pdf/PdfNull;

    invoke-virtual {v5, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 435
    :goto_7
    aget-object v0, v10, v15

    invoke-virtual {v0}, Lcom/itextpdf/layout/borders/Border;->getType()I

    move-result v0

    invoke-static {v0}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->transformBorderTypeToName(I)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    invoke-virtual {v7, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 436
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfNumber;

    aget-object v2, v10, v15

    invoke-virtual {v2}, Lcom/itextpdf/layout/borders/Border;->getWidth()F

    move-result v2

    move-object/from16 v16, v3

    .end local v3    # "borderOrder":[I
    .local v16, "borderOrder":[I
    float-to-double v2, v2

    invoke-direct {v0, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v8, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    goto :goto_8

    .line 438
    .end local v16    # "borderOrder":[I
    .end local v17    # "specificBorderProperties":Z
    .restart local v2    # "specificBorderProperties":Z
    .restart local v3    # "borderOrder":[I
    :cond_d
    move/from16 v17, v2

    move-object/from16 v16, v3

    .end local v2    # "specificBorderProperties":Z
    .end local v3    # "borderOrder":[I
    .restart local v16    # "borderOrder":[I
    .restart local v17    # "specificBorderProperties":Z
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfNull;->PDF_NULL:Lcom/itextpdf/kernel/pdf/PdfNull;

    invoke-virtual {v5, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 439
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->None:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v7, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 440
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfNull;->PDF_NULL:Lcom/itextpdf/kernel/pdf/PdfNull;

    invoke-virtual {v8, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 427
    .end local v15    # "i":I
    :goto_8
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p0

    move-object/from16 v3, v16

    move/from16 v2, v17

    goto :goto_6

    .line 444
    .end local v16    # "borderOrder":[I
    .end local v17    # "specificBorderProperties":Z
    .restart local v2    # "specificBorderProperties":Z
    .restart local v3    # "borderOrder":[I
    :cond_e
    move/from16 v17, v2

    move-object/from16 v16, v3

    .end local v2    # "specificBorderProperties":Z
    .end local v3    # "borderOrder":[I
    .restart local v16    # "borderOrder":[I
    .restart local v17    # "specificBorderProperties":Z
    if-eqz v9, :cond_10

    .line 445
    if-eqz v11, :cond_f

    .line 446
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BorderColor:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v15, 0x0

    invoke-virtual {v5, v15}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_9

    .line 448
    :cond_f
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BorderColor:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 452
    :cond_10
    :goto_9
    if-eqz v12, :cond_11

    .line 453
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BorderStyle:Lcom/itextpdf/kernel/pdf/PdfName;

    const/4 v15, 0x0

    invoke-virtual {v7, v15}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_a

    .line 455
    :cond_11
    const/4 v15, 0x0

    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BorderStyle:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0, v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 458
    :goto_a
    if-eqz v13, :cond_12

    .line 459
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BorderThickness:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v8, v15}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_b

    .line 461
    :cond_12
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BorderThickness:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0, v8}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_b

    .line 397
    .end local v5    # "borderColors":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v7    # "borderTypes":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v8    # "borderWidths":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v9    # "atLeastOneRgb":Z
    .end local v10    # "borders":[Lcom/itextpdf/layout/borders/Border;
    .end local v11    # "allColorsEqual":Z
    .end local v12    # "allTypesEqual":Z
    .end local v13    # "allWidthsEqual":Z
    .end local v16    # "borderOrder":[I
    .end local v17    # "specificBorderProperties":Z
    .restart local v2    # "specificBorderProperties":Z
    :cond_13
    move/from16 v17, v2

    .line 464
    .end local v2    # "specificBorderProperties":Z
    .restart local v17    # "specificBorderProperties":Z
    :goto_b
    return-void
.end method

.method private static applyCommonLayoutAttributes(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 5
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p1, "attributes"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 145
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/layout/properties/Background;

    .line 146
    .local v0, "background":Lcom/itextpdf/layout/properties/Background;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/Background;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v1

    instance-of v1, v1, Lcom/itextpdf/kernel/colors/DeviceRgb;

    if-eqz v1, :cond_0

    .line 147
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BackgroundColor:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v0}, Lcom/itextpdf/layout/properties/Background;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/colors/Color;->getColorValue()[F

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 153
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v1

    instance-of v1, v1, Lcom/itextpdf/layout/element/Cell;

    if-nez v1, :cond_1

    .line 154
    invoke-static {p0, p1}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->applyBorderAttributes(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 156
    :cond_1
    invoke-static {p0, p1}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->applyPaddingAttribute(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 158
    const/16 v1, 0x15

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsTransparentColor(I)Lcom/itextpdf/layout/properties/TransparentColor;

    move-result-object v1

    .line 159
    .local v1, "transparentColor":Lcom/itextpdf/layout/properties/TransparentColor;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v2

    instance-of v2, v2, Lcom/itextpdf/kernel/colors/DeviceRgb;

    if-eqz v2, :cond_2

    .line 160
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Color:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/TransparentColor;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v4

    invoke-virtual {v4}, Lcom/itextpdf/kernel/colors/Color;->getColorValue()[F

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {p1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 162
    :cond_2
    return-void
.end method

.method private static applyIllustrationLayoutAttributes(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 7
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p1, "attributes"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 307
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getOccupiedArea()Lcom/itextpdf/layout/layout/LayoutArea;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/layout/layout/LayoutArea;->getBBox()Lcom/itextpdf/kernel/geom/Rectangle;

    move-result-object v0

    .line 308
    .local v0, "bbox":Lcom/itextpdf/kernel/geom/Rectangle;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BBox:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v2, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-virtual {p1, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 310
    const/16 v1, 0x4d

    invoke-virtual {p0, v1}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/layout/properties/UnitValue;

    .line 311
    .local v1, "width":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 312
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Width:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v1}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v4

    float-to-double v4, v4

    invoke-direct {v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {p1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_0

    .line 314
    :cond_0
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Width:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getWidth()F

    move-result v4

    float-to-double v4, v4

    invoke-direct {v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {p1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 317
    :goto_0
    const/16 v2, 0x1b

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/layout/properties/UnitValue;

    .line 318
    .local v2, "height":Lcom/itextpdf/layout/properties/UnitValue;
    if-eqz v2, :cond_1

    .line 319
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Height:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v5

    float-to-double v5, v5

    invoke-direct {v4, v5, v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_1

    .line 321
    :cond_1
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Height:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/geom/Rectangle;->getHeight()F

    move-result v5

    float-to-double v5, v5

    invoke-direct {v4, v5, v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {p1, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 323
    :goto_1
    return-void
.end method

.method private static applyInlineLevelLayoutAttributes(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 8
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p1, "attributes"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 273
    const/16 v0, 0x48

    invoke-virtual {p0, v0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsFloat(I)Ljava/lang/Float;

    move-result-object v0

    .line 274
    .local v0, "textRise":Ljava/lang/Float;
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v2

    cmpl-float v2, v2, v1

    if-eqz v2, :cond_0

    .line 275
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->BaselineShift:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v4

    float-to-double v4, v4

    invoke-direct {v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {p1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 278
    :cond_0
    const/16 v2, 0x4a

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v2

    .line 279
    .local v2, "underlines":Ljava/lang/Object;
    if-eqz v2, :cond_6

    .line 280
    const/16 v3, 0x18

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v4

    .line 281
    .local v4, "fontSize":Lcom/itextpdf/layout/properties/UnitValue;
    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v5

    if-nez v5, :cond_1

    .line 282
    const-class v5, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;

    invoke-static {v5}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v5

    .line 283
    .local v5, "logger":Lorg/slf4j/Logger;
    nop

    .line 284
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 283
    const-string v6, "Property {0} in percents is not supported"

    invoke-static {v6, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v5, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 286
    .end local v5    # "logger":Lorg/slf4j/Logger;
    :cond_1
    const/4 v3, 0x0

    .line 287
    .local v3, "underline":Lcom/itextpdf/layout/properties/Underline;
    instance-of v5, v2, Ljava/util/List;

    if-eqz v5, :cond_2

    move-object v5, v2

    check-cast v5, Ljava/util/List;

    .line 288
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_2

    move-object v5, v2

    check-cast v5, Ljava/util/List;

    .line 289
    const/4 v6, 0x0

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    instance-of v5, v5, Lcom/itextpdf/layout/properties/Underline;

    if-eqz v5, :cond_2

    .line 291
    move-object v5, v2

    check-cast v5, Ljava/util/List;

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    move-object v3, v5

    check-cast v3, Lcom/itextpdf/layout/properties/Underline;

    goto :goto_0

    .line 292
    :cond_2
    instance-of v5, v2, Lcom/itextpdf/layout/properties/Underline;

    if-eqz v5, :cond_3

    .line 293
    move-object v3, v2

    check-cast v3, Lcom/itextpdf/layout/properties/Underline;

    .line 295
    :cond_3
    :goto_0
    if-eqz v3, :cond_6

    .line 296
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->TextDecorationType:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v6

    invoke-virtual {v3, v6}, Lcom/itextpdf/layout/properties/Underline;->getYPosition(F)F

    move-result v6

    cmpl-float v1, v6, v1

    if-lez v1, :cond_4

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->LineThrough:Lcom/itextpdf/kernel/pdf/PdfName;

    goto :goto_1

    :cond_4
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Underline:Lcom/itextpdf/kernel/pdf/PdfName;

    :goto_1
    invoke-virtual {p1, v5, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 297
    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/Underline;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v1

    instance-of v1, v1, Lcom/itextpdf/kernel/colors/DeviceRgb;

    if-eqz v1, :cond_5

    .line 298
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->TextDecorationColor:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/Underline;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/colors/Color;->getColorValue()[F

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {p1, v1, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 301
    :cond_5
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->TextDecorationThickness:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v4}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v6

    invoke-virtual {v3, v6}, Lcom/itextpdf/layout/properties/Underline;->getThickness(F)F

    move-result v6

    float-to-double v6, v6

    invoke-direct {v5, v6, v7}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {p1, v1, v5}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 304
    .end local v3    # "underline":Lcom/itextpdf/layout/properties/Underline;
    .end local v4    # "fontSize":Lcom/itextpdf/layout/properties/UnitValue;
    :cond_6
    return-void
.end method

.method private static applyPaddingAttribute(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 13
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p1, "attributes"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 326
    const/4 v0, 0x4

    new-array v1, v0, [Lcom/itextpdf/layout/properties/UnitValue;

    .line 327
    const/16 v2, 0x32

    invoke-virtual {p0, v2}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v1, v4

    .line 328
    const/16 v3, 0x31

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v1, v6

    .line 329
    const/16 v5, 0x2f

    invoke-virtual {p0, v5}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v7

    const/4 v8, 0x2

    aput-object v7, v1, v8

    .line 330
    const/16 v7, 0x30

    invoke-virtual {p0, v7}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getPropertyAsUnitValue(I)Lcom/itextpdf/layout/properties/UnitValue;

    move-result-object v9

    const/4 v10, 0x3

    aput-object v9, v1, v10

    .line 333
    .local v1, "paddingsUV":[Lcom/itextpdf/layout/properties/UnitValue;
    aget-object v9, v1, v4

    invoke-virtual {v9}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v9

    const-string v11, "Property {0} in percents is not supported"

    const-class v12, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;

    if-nez v9, :cond_0

    .line 334
    invoke-static {v12}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v9

    .line 335
    .local v9, "logger":Lorg/slf4j/Logger;
    nop

    .line 336
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 335
    invoke-static {v11, v2}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v9, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 338
    .end local v9    # "logger":Lorg/slf4j/Logger;
    :cond_0
    aget-object v2, v1, v6

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v2

    if-nez v2, :cond_1

    .line 339
    invoke-static {v12}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 340
    .local v2, "logger":Lorg/slf4j/Logger;
    nop

    .line 341
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 340
    invoke-static {v11, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 343
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :cond_1
    aget-object v2, v1, v8

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v2

    if-nez v2, :cond_2

    .line 344
    invoke-static {v12}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 345
    .restart local v2    # "logger":Lorg/slf4j/Logger;
    nop

    .line 346
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 345
    invoke-static {v11, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 348
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :cond_2
    aget-object v2, v1, v10

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->isPointValue()Z

    move-result v2

    if-nez v2, :cond_3

    .line 349
    invoke-static {v12}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v2

    .line 350
    .restart local v2    # "logger":Lorg/slf4j/Logger;
    nop

    .line 351
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 350
    invoke-static {v11, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 354
    .end local v2    # "logger":Lorg/slf4j/Logger;
    :cond_3
    aget-object v2, v1, v4

    invoke-virtual {v2}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v2

    aget-object v3, v1, v6

    invoke-virtual {v3}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v3

    aget-object v5, v1, v8

    invoke-virtual {v5}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v5

    aget-object v7, v1, v10

    invoke-virtual {v7}, Lcom/itextpdf/layout/properties/UnitValue;->getValue()F

    move-result v7

    new-array v0, v0, [F

    aput v2, v0, v4

    aput v3, v0, v6

    aput v5, v0, v8

    aput v7, v0, v10

    .line 355
    .local v0, "paddings":[F
    const/4 v2, 0x0

    .line 356
    .local v2, "padding":Lcom/itextpdf/kernel/pdf/PdfObject;
    aget v3, v0, v4

    aget v5, v0, v6

    cmpl-float v3, v3, v5

    if-nez v3, :cond_4

    aget v3, v0, v4

    aget v5, v0, v8

    cmpl-float v3, v3, v5

    if-nez v3, :cond_4

    aget v3, v0, v4

    aget v5, v0, v10

    cmpl-float v3, v3, v5

    if-nez v3, :cond_4

    .line 357
    aget v3, v0, v4

    const/4 v5, 0x0

    cmpl-float v3, v3, v5

    if-eqz v3, :cond_6

    .line 358
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfNumber;

    aget v4, v0, v4

    float-to-double v4, v4

    invoke-direct {v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    move-object v2, v3

    goto :goto_1

    .line 361
    :cond_4
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v3}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    .line 364
    .local v3, "paddingArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    filled-new-array {v4, v6, v8, v10}, [I

    move-result-object v5

    .line 365
    .local v5, "paddingsOrder":[I
    array-length v6, v5

    :goto_0
    if-ge v4, v6, :cond_5

    aget v7, v5, v4

    .line 366
    .local v7, "i":I
    new-instance v8, Lcom/itextpdf/kernel/pdf/PdfNumber;

    aget v9, v0, v7

    float-to-double v9, v9

    invoke-direct {v8, v9, v10}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {v3, v8}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 365
    .end local v7    # "i":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 368
    :cond_5
    move-object v2, v3

    .line 371
    .end local v3    # "paddingArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v5    # "paddingsOrder":[I
    :cond_6
    :goto_1
    if-eqz v2, :cond_7

    .line 372
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Padding:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1, v3, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 374
    :cond_7
    return-void
.end method

.method public static getLayoutAttributes(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;
    .locals 7
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p1, "taggingPointer"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 67
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->resolveMappingToStandard(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;

    move-result-object v0

    .line 68
    .local v0, "resolvedMapping":Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 69
    return-object v1

    .line 72
    :cond_0
    invoke-interface {v0}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->getRole()Ljava/lang/String;

    move-result-object v2

    .line 73
    .local v2, "role":Ljava/lang/String;
    invoke-static {v2}, Lcom/itextpdf/layout/renderer/AccessibleTypes;->identifyType(Ljava/lang/String;)I

    move-result v3

    .line 74
    .local v3, "tagType":I
    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 75
    .local v4, "attributes":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->O:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Layout:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 79
    invoke-static {p0, v4}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->applyCommonLayoutAttributes(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 80
    sget v5, Lcom/itextpdf/layout/renderer/AccessibleTypes;->BlockLevel:I

    if-ne v3, v5, :cond_1

    .line 81
    invoke-static {v2, p0, v4}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->applyBlockLevelLayoutAttributes(Ljava/lang/String;Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 83
    :cond_1
    sget v5, Lcom/itextpdf/layout/renderer/AccessibleTypes;->InlineLevel:I

    if-ne v3, v5, :cond_2

    .line 84
    invoke-static {p0, v4}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->applyInlineLevelLayoutAttributes(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 87
    :cond_2
    sget v5, Lcom/itextpdf/layout/renderer/AccessibleTypes;->Illustration:I

    if-ne v3, v5, :cond_3

    .line 88
    invoke-static {p0, v4}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->applyIllustrationLayoutAttributes(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 91
    :cond_3
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->size()I

    move-result v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_4

    new-instance v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    invoke-direct {v1, v4}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    :cond_4
    return-object v1
.end method

.method public static getListAttributes(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;
    .locals 8
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p1, "taggingPointer"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 95
    const/4 v0, 0x0

    .line 96
    .local v0, "resolvedMapping":Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->resolveMappingToStandard(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;

    move-result-object v0

    .line 97
    const/4 v1, 0x0

    if-eqz v0, :cond_5

    const-string v2, "L"

    invoke-interface {v0}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->getRole()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_2

    .line 101
    :cond_0
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 102
    .local v2, "attributes":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->O:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->List:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 104
    const/16 v3, 0x25

    invoke-virtual {p0, v3}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getProperty(I)Ljava/lang/Object;

    move-result-object v3

    .line 106
    .local v3, "listSymbol":Ljava/lang/Object;
    invoke-interface {v0}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v4

    invoke-static {v4}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->isTagStructurePdf2(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Z

    move-result v4

    .line 107
    .local v4, "tagStructurePdf2":Z
    instance-of v5, v3, Lcom/itextpdf/layout/properties/ListNumberingType;

    if-eqz v5, :cond_1

    .line 108
    move-object v5, v3

    check-cast v5, Lcom/itextpdf/layout/properties/ListNumberingType;

    .line 109
    .local v5, "numberingType":Lcom/itextpdf/layout/properties/ListNumberingType;
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->ListNumbering:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-static {v5, v4}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->transformNumberingTypeToName(Lcom/itextpdf/layout/properties/ListNumberingType;Z)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .end local v5    # "numberingType":Lcom/itextpdf/layout/properties/ListNumberingType;
    goto :goto_0

    .line 110
    :cond_1
    if-eqz v4, :cond_3

    .line 111
    instance-of v5, v3, Lcom/itextpdf/layout/properties/IListSymbolFactory;

    if-eqz v5, :cond_2

    .line 112
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->ListNumbering:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Ordered:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_1

    .line 114
    :cond_2
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->ListNumbering:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->Unordered:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    goto :goto_1

    .line 110
    :cond_3
    :goto_0
    nop

    .line 118
    :goto_1
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->size()I

    move-result v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_4

    new-instance v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    :cond_4
    return-object v1

    .line 98
    .end local v2    # "attributes":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v3    # "listSymbol":Ljava/lang/Object;
    .end local v4    # "tagStructurePdf2":Z
    :cond_5
    :goto_2
    return-object v1
.end method

.method public static getTableAttributes(Lcom/itextpdf/layout/renderer/AbstractRenderer;Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;
    .locals 8
    .param p0, "renderer"    # Lcom/itextpdf/layout/renderer/AbstractRenderer;
    .param p1, "taggingPointer"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 122
    invoke-static {p1}, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier;->resolveMappingToStandard(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;

    move-result-object v0

    .line 123
    .local v0, "resolvedMapping":Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;
    const/4 v1, 0x0

    if-eqz v0, :cond_4

    .line 124
    invoke-interface {v0}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->getRole()Ljava/lang/String;

    move-result-object v2

    const-string v3, "TD"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "TH"

    invoke-interface {v0}, Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;->getRole()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 128
    :cond_0
    new-instance v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    .line 129
    .local v2, "attributes":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->O:Lcom/itextpdf/kernel/pdf/PdfName;

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Table:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v2, v3, v4}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 131
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v3

    instance-of v3, v3, Lcom/itextpdf/layout/element/Cell;

    const/4 v4, 0x1

    if-eqz v3, :cond_2

    .line 132
    invoke-virtual {p0}, Lcom/itextpdf/layout/renderer/AbstractRenderer;->getModelElement()Lcom/itextpdf/layout/IPropertyContainer;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/layout/element/Cell;

    .line 133
    .local v3, "cell":Lcom/itextpdf/layout/element/Cell;
    invoke-virtual {v3}, Lcom/itextpdf/layout/element/Cell;->getRowspan()I

    move-result v5

    if-eq v5, v4, :cond_1

    .line 134
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->RowSpan:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v6, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v3}, Lcom/itextpdf/layout/element/Cell;->getRowspan()I

    move-result v7

    invoke-direct {v6, v7}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v2, v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 136
    :cond_1
    invoke-virtual {v3}, Lcom/itextpdf/layout/element/Cell;->getColspan()I

    move-result v5

    if-eq v5, v4, :cond_2

    .line 137
    sget-object v5, Lcom/itextpdf/kernel/pdf/PdfName;->ColSpan:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v6, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-virtual {v3}, Lcom/itextpdf/layout/element/Cell;->getColspan()I

    move-result v7

    invoke-direct {v6, v7}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {v2, v5, v6}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 141
    .end local v3    # "cell":Lcom/itextpdf/layout/element/Cell;
    :cond_2
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->size()I

    move-result v3

    if-le v3, v4, :cond_3

    new-instance v1, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;

    invoke-direct {v1, v2}, Lcom/itextpdf/kernel/pdf/tagging/PdfStructureAttributes;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    :cond_3
    return-object v1

    .line 125
    .end local v2    # "attributes":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    :cond_4
    :goto_0
    return-object v1
.end method

.method private static isTagStructurePdf2(Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Z
    .locals 2
    .param p0, "namespace"    # Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    .line 473
    if-eqz p0, :cond_0

    const-string v0, "http://iso.org/pdf2/ssn"

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;->getNamespaceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static resolveMappingToStandard(Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;)Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;
    .locals 3
    .param p0, "taggingPointer"    # Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;

    .line 467
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getTagStructureContext()Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;

    move-result-object v0

    .line 468
    .local v0, "tagContext":Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getProperties()Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/tagutils/AccessibilityProperties;->getNamespace()Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;

    move-result-object v1

    .line 469
    .local v1, "namespace":Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/tagutils/TagTreePointer;->getRole()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Lcom/itextpdf/kernel/pdf/tagutils/TagStructureContext;->resolveMappingToStandardOrDomainSpecificRole(Ljava/lang/String;Lcom/itextpdf/kernel/pdf/tagging/PdfNamespace;)Lcom/itextpdf/kernel/pdf/tagutils/IRoleMappingResolver;

    move-result-object v2

    return-object v2
.end method

.method private static transformBlockAlignToName(Lcom/itextpdf/layout/properties/HorizontalAlignment;)Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 3
    .param p0, "horizontalAlignment"    # Lcom/itextpdf/layout/properties/HorizontalAlignment;

    .line 504
    const/4 v0, 0x1

    .line 505
    .local v0, "isLeftToRight":Z
    sget-object v1, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$HorizontalAlignment:[I

    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/HorizontalAlignment;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 521
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Before:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v1

    .line 515
    :pswitch_0
    if-eqz v0, :cond_0

    .line 516
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->After:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v1

    .line 518
    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Before:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v1

    .line 513
    :pswitch_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Middle:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v1

    .line 507
    :pswitch_2
    if-eqz v0, :cond_1

    .line 508
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Before:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v1

    .line 510
    :cond_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->After:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static transformBorderTypeToName(I)Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1
    .param p0, "borderType"    # I

    .line 526
    packed-switch p0, :pswitch_data_0

    .line 546
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Solid:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0

    .line 544
    :pswitch_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Ridge:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0

    .line 542
    :pswitch_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Outset:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0

    .line 540
    :pswitch_2
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Inset:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0

    .line 538
    :pswitch_3
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Groove:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0

    .line 534
    :pswitch_4
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Dotted:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0

    .line 536
    :pswitch_5
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Double:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0

    .line 532
    :pswitch_6
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Dotted:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0

    .line 530
    :pswitch_7
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Dashed:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0

    .line 528
    :pswitch_8
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Solid:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static transformNumberingTypeToName(Lcom/itextpdf/layout/properties/ListNumberingType;Z)Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2
    .param p0, "numberingType"    # Lcom/itextpdf/layout/properties/ListNumberingType;
    .param p1, "isTagStructurePdf2"    # Z

    .line 552
    sget-object v0, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$ListNumberingType:[I

    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/ListNumberingType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 567
    if-eqz p1, :cond_0

    .line 568
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Ordered:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0

    .line 565
    :pswitch_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->LowerAlpha:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0

    .line 562
    :pswitch_1
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->UpperAlpha:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0

    .line 559
    :pswitch_2
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->LowerRoman:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0

    .line 557
    :pswitch_3
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->UpperRoman:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0

    .line 555
    :pswitch_4
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Decimal:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0

    .line 570
    :cond_0
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->None:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static transformTextAlignmentValueToName(Lcom/itextpdf/layout/properties/TextAlignment;)Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 3
    .param p0, "textAlignment"    # Lcom/itextpdf/layout/properties/TextAlignment;

    .line 478
    const/4 v0, 0x1

    .line 479
    .local v0, "isLeftToRight":Z
    sget-object v1, Lcom/itextpdf/layout/renderer/AccessibleAttributesApplier$1;->$SwitchMap$com$itextpdf$layout$properties$TextAlignment:[I

    invoke-virtual {p0}, Lcom/itextpdf/layout/properties/TextAlignment;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 498
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Start:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v1

    .line 496
    :pswitch_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Justify:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v1

    .line 489
    :pswitch_1
    if-eqz v0, :cond_0

    .line 490
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->End:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v1

    .line 492
    :cond_0
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Start:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v1

    .line 487
    :pswitch_2
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Center:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v1

    .line 481
    :pswitch_3
    if-eqz v0, :cond_1

    .line 482
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Start:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v1

    .line 484
    :cond_1
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->End:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
