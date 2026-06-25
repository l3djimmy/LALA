.class public Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;
.super Ljava/lang/Object;
.source "MetaState.java"


# static fields
.field public static final ALTERNATE:I = 0x1

.field public static final OPAQUE:I = 0x2

.field public static final TA_BASELINE:I = 0x18

.field public static final TA_BOTTOM:I = 0x8

.field public static final TA_CENTER:I = 0x6

.field public static final TA_LEFT:I = 0x0

.field public static final TA_NOUPDATECP:I = 0x0

.field public static final TA_RIGHT:I = 0x2

.field public static final TA_TOP:I = 0x0

.field public static final TA_UPDATECP:I = 0x1

.field public static final TRANSPARENT:I = 0x1

.field public static final WINDING:I = 0x2


# instance fields
.field public MetaObjects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;",
            ">;"
        }
    .end annotation
.end field

.field public backgroundMode:I

.field public currentBackgroundColor:Lcom/itextpdf/kernel/colors/Color;

.field public currentBrush:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;

.field public currentFont:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;

.field public currentPen:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;

.field public currentPoint:Lcom/itextpdf/kernel/geom/Point;

.field public currentTextColor:Lcom/itextpdf/kernel/colors/Color;

.field public extentWx:I

.field public extentWy:I

.field public lineJoin:I

.field public offsetWx:I

.field public offsetWy:I

.field public polyFillMode:I

.field public savedStates:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;",
            ">;"
        }
    .end annotation
.end field

.field public scalingX:F

.field public scalingY:F

.field public textAlign:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 151
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    sget-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->WHITE:Lcom/itextpdf/kernel/colors/Color;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentBackgroundColor:Lcom/itextpdf/kernel/colors/Color;

    .line 95
    sget-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->BLACK:Lcom/itextpdf/kernel/colors/Color;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentTextColor:Lcom/itextpdf/kernel/colors/Color;

    .line 100
    const/4 v0, 0x2

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->backgroundMode:I

    .line 105
    const/4 v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->polyFillMode:I

    .line 110
    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->lineJoin:I

    .line 152
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->savedStates:Ljava/util/Stack;

    .line 153
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->MetaObjects:Ljava/util/List;

    .line 154
    new-instance v0, Lcom/itextpdf/kernel/geom/Point;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lcom/itextpdf/kernel/geom/Point;-><init>(II)V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    .line 155
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentPen:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;

    .line 156
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentBrush:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;

    .line 157
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentFont:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;

    .line 158
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;)V
    .locals 1
    .param p1, "state"    # Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    .line 165
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    sget-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->WHITE:Lcom/itextpdf/kernel/colors/Color;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentBackgroundColor:Lcom/itextpdf/kernel/colors/Color;

    .line 95
    sget-object v0, Lcom/itextpdf/kernel/colors/ColorConstants;->BLACK:Lcom/itextpdf/kernel/colors/Color;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentTextColor:Lcom/itextpdf/kernel/colors/Color;

    .line 100
    const/4 v0, 0x2

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->backgroundMode:I

    .line 105
    const/4 v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->polyFillMode:I

    .line 110
    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->lineJoin:I

    .line 166
    invoke-virtual {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setMetaState(Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;)V

    .line 167
    return-void
.end method


# virtual methods
.method public addMetaObject(Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;)V
    .locals 3
    .param p1, "object"    # Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;

    .line 201
    const/4 v0, 0x0

    .local v0, "k":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->MetaObjects:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .line 207
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->MetaObjects:Ljava/util/List;

    .line 201
    if-ge v0, v1, :cond_1

    .line 202
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 203
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->MetaObjects:Ljava/util/List;

    invoke-interface {v1, v0, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 204
    return-void

    .line 201
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 207
    .end local v0    # "k":I
    :cond_1
    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 208
    return-void
.end method

.method public cleanup(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V
    .locals 2
    .param p1, "cb"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 318
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->savedStates:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    .line 319
    .local v0, "k":I
    :goto_0
    add-int/lit8 v1, v0, -0x1

    .end local v0    # "k":I
    .local v1, "k":I
    if-lez v0, :cond_0

    .line 320
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    move v0, v1

    goto :goto_0

    .line 321
    :cond_0
    return-void
.end method

.method public deleteMetaObject(I)V
    .locals 2
    .param p1, "index"    # I

    .line 276
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->MetaObjects:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 277
    return-void
.end method

.method public getBackgroundMode()I
    .locals 1

    .line 487
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->backgroundMode:I

    return v0
.end method

.method public getCurrentBackgroundColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 1

    .line 459
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentBackgroundColor:Lcom/itextpdf/kernel/colors/Color;

    return-object v0
.end method

.method public getCurrentBrush()Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;
    .locals 1

    .line 433
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentBrush:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;

    return-object v0
.end method

.method public getCurrentFont()Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;
    .locals 1

    .line 451
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentFont:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;

    return-object v0
.end method

.method public getCurrentPen()Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;
    .locals 1

    .line 442
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentPen:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;

    return-object v0
.end method

.method public getCurrentPoint()Lcom/itextpdf/kernel/geom/Point;
    .locals 1

    .line 424
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    return-object v0
.end method

.method public getCurrentTextColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 1

    .line 473
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentTextColor:Lcom/itextpdf/kernel/colors/Color;

    return-object v0
.end method

.method public getLineNeutral()Z
    .locals 1

    .line 555
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->lineJoin:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getPolyFillMode()I
    .locals 1

    .line 515
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->polyFillMode:I

    return v0
.end method

.method public getTextAlign()I
    .locals 1

    .line 501
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->textAlign:I

    return v0
.end method

.method public restoreState(ILcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V
    .locals 3
    .param p1, "index"    # I
    .param p2, "cb"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 298
    nop

    .line 301
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->savedStates:Ljava/util/Stack;

    .line 298
    if-gez p1, :cond_0

    .line 299
    neg-int v1, p1

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .local v0, "pops":I
    goto :goto_0

    .line 301
    .end local v0    # "pops":I
    :cond_0
    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    sub-int/2addr v0, p1

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 302
    .restart local v0    # "pops":I
    :goto_0
    if-nez v0, :cond_1

    .line 303
    return-void

    .line 304
    :cond_1
    const/4 v1, 0x0

    .line 305
    .local v1, "state":Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;
    :goto_1
    add-int/lit8 v2, v0, -0x1

    .end local v0    # "pops":I
    .local v2, "pops":I
    if-eqz v0, :cond_2

    .line 306
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->restoreState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 307
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->savedStates:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    move v0, v2

    goto :goto_1

    .line 309
    :cond_2
    invoke-virtual {p0, v1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->setMetaState(Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;)V

    .line 310
    return-void
.end method

.method public saveState(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V
    .locals 2
    .param p1, "cb"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 285
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->saveState()Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 286
    new-instance v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    invoke-direct {v0, p0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;-><init>(Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;)V

    .line 287
    .local v0, "state":Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->savedStates:Ljava/util/Stack;

    invoke-virtual {v1, v0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    return-void
.end method

.method public selectMetaObject(ILcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V
    .locals 6
    .param p1, "index"    # I
    .param p2, "cb"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 217
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->MetaObjects:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;

    .line 218
    .local v0, "obj":Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;
    if-nez v0, :cond_0

    .line 219
    return-void

    .line 221
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaObject;->getType()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_1

    .line 264
    :pswitch_0
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentFont:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;

    goto/16 :goto_1

    .line 223
    :pswitch_1
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentBrush:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;

    .line 224
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentBrush:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;->getStyle()I

    move-result v1

    .line 225
    .local v1, "style":I
    if-nez v1, :cond_1

    .line 226
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentBrush:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v2

    .line 227
    .local v2, "color":Lcom/itextpdf/kernel/colors/Color;
    invoke-virtual {p2, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setFillColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 228
    .end local v2    # "color":Lcom/itextpdf/kernel/colors/Color;
    goto :goto_1

    .line 229
    :cond_1
    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    .line 230
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentBackgroundColor:Lcom/itextpdf/kernel/colors/Color;

    .line 231
    .restart local v2    # "color":Lcom/itextpdf/kernel/colors/Color;
    invoke-virtual {p2, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setFillColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 232
    .end local v2    # "color":Lcom/itextpdf/kernel/colors/Color;
    goto :goto_1

    .line 236
    .end local v1    # "style":I
    :pswitch_2
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentPen:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;

    .line 237
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentPen:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;->getStyle()I

    move-result v1

    .line 238
    .restart local v1    # "style":I
    const/4 v2, 0x5

    if-eq v1, v2, :cond_2

    .line 239
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentPen:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;->getColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v2

    .line 240
    .restart local v2    # "color":Lcom/itextpdf/kernel/colors/Color;
    invoke-virtual {p2, v2}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 241
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentPen:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;->getPenWidth()I

    move-result v3

    int-to-float v3, v3

    iget v4, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->scalingX:F

    mul-float/2addr v3, v4

    iget v4, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->extentWx:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    invoke-virtual {p2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineWidth(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 242
    const/4 v3, 0x0

    packed-switch v1, :pswitch_data_1

    .line 256
    invoke-virtual {p2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineDash(F)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    goto :goto_0

    .line 250
    :pswitch_3
    const-string v3, "[9 3 3 3 3 3]0 d\n"

    invoke-virtual {p2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->writeLiteral(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 251
    goto :goto_0

    .line 247
    :pswitch_4
    const-string v3, "[9 6 3 6]0 d\n"

    invoke-virtual {p2, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->writeLiteral(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 248
    goto :goto_0

    .line 253
    :pswitch_5
    const/high16 v4, 0x40400000    # 3.0f

    invoke-virtual {p2, v4, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineDash(FF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 254
    goto :goto_0

    .line 244
    :pswitch_6
    const/high16 v4, 0x41900000    # 18.0f

    const/high16 v5, 0x40c00000    # 6.0f

    invoke-virtual {p2, v4, v5, v3}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineDash(FFF)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 245
    nop

    .line 259
    .end local v2    # "color":Lcom/itextpdf/kernel/colors/Color;
    :goto_0
    nop

    .line 268
    .end local v1    # "style":I
    :cond_2
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method public setBackgroundMode(I)V
    .locals 0
    .param p1, "backgroundMode"    # I

    .line 494
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->backgroundMode:I

    .line 495
    return-void
.end method

.method public setCurrentBackgroundColor(Lcom/itextpdf/kernel/colors/Color;)V
    .locals 0
    .param p1, "currentBackgroundColor"    # Lcom/itextpdf/kernel/colors/Color;

    .line 466
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentBackgroundColor:Lcom/itextpdf/kernel/colors/Color;

    .line 467
    return-void
.end method

.method public setCurrentPoint(Lcom/itextpdf/kernel/geom/Point;)V
    .locals 0
    .param p1, "p"    # Lcom/itextpdf/kernel/geom/Point;

    .line 415
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    .line 416
    return-void
.end method

.method public setCurrentTextColor(Lcom/itextpdf/kernel/colors/Color;)V
    .locals 0
    .param p1, "currentTextColor"    # Lcom/itextpdf/kernel/colors/Color;

    .line 480
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentTextColor:Lcom/itextpdf/kernel/colors/Color;

    .line 481
    return-void
.end method

.method public setExtentWx(I)V
    .locals 0
    .param p1, "extentWx"    # I

    .line 385
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->extentWx:I

    .line 386
    return-void
.end method

.method public setExtentWy(I)V
    .locals 0
    .param p1, "extentWy"    # I

    .line 394
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->extentWy:I

    .line 395
    return-void
.end method

.method public setLineJoinPolygon(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V
    .locals 1
    .param p1, "cb"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 543
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->lineJoin:I

    if-nez v0, :cond_0

    .line 544
    const/4 v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->lineJoin:I

    .line 545
    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineJoinStyle(I)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 547
    :cond_0
    return-void
.end method

.method public setLineJoinRectangle(Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;)V
    .locals 1
    .param p1, "cb"    # Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 531
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->lineJoin:I

    if-eqz v0, :cond_0

    .line 532
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->lineJoin:I

    .line 533
    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;->setLineJoinStyle(I)Lcom/itextpdf/kernel/pdf/canvas/PdfCanvas;

    .line 535
    :cond_0
    return-void
.end method

.method public setMetaState(Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;)V
    .locals 1
    .param p1, "state"    # Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;

    .line 175
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->savedStates:Ljava/util/Stack;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->savedStates:Ljava/util/Stack;

    .line 176
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->MetaObjects:Ljava/util/List;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->MetaObjects:Ljava/util/List;

    .line 177
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentPoint:Lcom/itextpdf/kernel/geom/Point;

    .line 178
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentPen:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentPen:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaPen;

    .line 179
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentBrush:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentBrush:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaBrush;

    .line 180
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentFont:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentFont:Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaFont;

    .line 181
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentBackgroundColor:Lcom/itextpdf/kernel/colors/Color;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentBackgroundColor:Lcom/itextpdf/kernel/colors/Color;

    .line 182
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentTextColor:Lcom/itextpdf/kernel/colors/Color;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->currentTextColor:Lcom/itextpdf/kernel/colors/Color;

    .line 183
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->backgroundMode:I

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->backgroundMode:I

    .line 184
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->polyFillMode:I

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->polyFillMode:I

    .line 185
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->textAlign:I

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->textAlign:I

    .line 186
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->lineJoin:I

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->lineJoin:I

    .line 187
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->offsetWx:I

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->offsetWx:I

    .line 188
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->offsetWy:I

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->offsetWy:I

    .line 189
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->extentWx:I

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->extentWx:I

    .line 190
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->extentWy:I

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->extentWy:I

    .line 191
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->scalingX:F

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->scalingX:F

    .line 192
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->scalingY:F

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->scalingY:F

    .line 193
    return-void
.end method

.method public setOffsetWx(I)V
    .locals 0
    .param p1, "offsetWx"    # I

    .line 367
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->offsetWx:I

    .line 368
    return-void
.end method

.method public setOffsetWy(I)V
    .locals 0
    .param p1, "offsetWy"    # I

    .line 376
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->offsetWy:I

    .line 377
    return-void
.end method

.method public setPolyFillMode(I)V
    .locals 0
    .param p1, "polyFillMode"    # I

    .line 522
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->polyFillMode:I

    .line 523
    return-void
.end method

.method public setScalingX(F)V
    .locals 0
    .param p1, "scalingX"    # F

    .line 349
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->scalingX:F

    .line 350
    return-void
.end method

.method public setScalingY(F)V
    .locals 0
    .param p1, "scalingY"    # F

    .line 358
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->scalingY:F

    .line 359
    return-void
.end method

.method public setTextAlign(I)V
    .locals 0
    .param p1, "textAlign"    # I

    .line 508
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->textAlign:I

    .line 509
    return-void
.end method

.method public transformAngle(F)F
    .locals 5
    .param p1, "angle"    # F

    .line 405
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->scalingY:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    neg-float v0, p1

    goto :goto_0

    :cond_0
    move v0, p1

    .line 406
    .local v0, "ta":F
    :goto_0
    iget v2, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->scalingX:F

    cmpg-float v1, v2, v1

    if-gez v1, :cond_1

    const-wide v1, 0x400921fb54442d18L    # Math.PI

    float-to-double v3, v0

    sub-double/2addr v1, v3

    goto :goto_1

    :cond_1
    float-to-double v1, v0

    :goto_1
    double-to-float v1, v1

    return v1
.end method

.method public transformX(I)F
    .locals 2
    .param p1, "x"    # I

    .line 330
    int-to-float v0, p1

    iget v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->offsetWx:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->scalingX:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->extentWx:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    return v0
.end method

.method public transformY(I)F
    .locals 2
    .param p1, "y"    # I

    .line 340
    int-to-float v0, p1

    iget v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->offsetWy:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->extentWy:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, v0

    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/MetaState;->scalingY:F

    mul-float/2addr v1, v0

    return v1
.end method
