.class public Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;
.super Ljava/lang/Object;
.source "CanvasGraphicsState.java"


# instance fields
.field private alphaIsShape:Z

.field private automaticStrokeAdjustment:Z

.field private blackGenerationFunction:Lcom/itextpdf/kernel/pdf/PdfObject;

.field private blackGenerationFunction2:Lcom/itextpdf/kernel/pdf/PdfObject;

.field private blendMode:Lcom/itextpdf/kernel/pdf/PdfObject;

.field private charSpacing:F

.field private ctm:Lcom/itextpdf/kernel/geom/Matrix;

.field private dashPattern:Lcom/itextpdf/kernel/pdf/PdfArray;

.field private fillAlpha:F

.field private fillColor:Lcom/itextpdf/kernel/colors/Color;

.field private fillOverprint:Z

.field private flatnessTolerance:F

.field private font:Lcom/itextpdf/kernel/font/PdfFont;

.field private fontSize:F

.field private halftone:Lcom/itextpdf/kernel/pdf/PdfObject;

.field private htp:Lcom/itextpdf/kernel/pdf/PdfObject;

.field private leading:F

.field private lineCapStyle:I

.field private lineJoinStyle:I

.field private lineWidth:F

.field private miterLimit:F

.field private overprintMode:I

.field private renderingIntent:Lcom/itextpdf/kernel/pdf/PdfName;

.field private scale:F

.field private smoothnessTolerance:Ljava/lang/Float;

.field private softMask:Lcom/itextpdf/kernel/pdf/PdfObject;

.field private strokeAlpha:F

.field private strokeColor:Lcom/itextpdf/kernel/colors/Color;

.field private strokeOverprint:Z

.field private textKnockout:Z

.field private textRenderingMode:I

.field private textRise:F

.field private transferFunction:Lcom/itextpdf/kernel/pdf/PdfObject;

.field private transferFunction2:Lcom/itextpdf/kernel/pdf/PdfObject;

.field private underColorRemovalFunction:Lcom/itextpdf/kernel/pdf/PdfObject;

.field private underColorRemovalFunction2:Lcom/itextpdf/kernel/pdf/PdfObject;

.field private wordSpacing:F


# direct methods
.method protected constructor <init>()V
    .locals 6

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Lcom/itextpdf/kernel/geom/Matrix;

    invoke-direct {v0}, Lcom/itextpdf/kernel/geom/Matrix;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->ctm:Lcom/itextpdf/kernel/geom/Matrix;

    .line 54
    sget-object v0, Lcom/itextpdf/kernel/colors/DeviceGray;->BLACK:Lcom/itextpdf/kernel/colors/DeviceGray;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->strokeColor:Lcom/itextpdf/kernel/colors/Color;

    .line 55
    sget-object v0, Lcom/itextpdf/kernel/colors/DeviceGray;->BLACK:Lcom/itextpdf/kernel/colors/DeviceGray;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fillColor:Lcom/itextpdf/kernel/colors/Color;

    .line 58
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->charSpacing:F

    .line 59
    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->wordSpacing:F

    .line 61
    const/high16 v1, 0x42c80000    # 100.0f

    iput v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->scale:F

    .line 62
    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->leading:F

    .line 65
    const/4 v1, 0x0

    iput v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->textRenderingMode:I

    .line 66
    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->textRise:F

    .line 67
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->textKnockout:Z

    .line 69
    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineWidth:F

    .line 70
    iput v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineCapStyle:I

    .line 71
    iput v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineJoinStyle:I

    .line 72
    const/high16 v3, 0x41200000    # 10.0f

    iput v3, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->miterLimit:F

    .line 83
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v4, 0x2

    new-array v4, v4, [Lcom/itextpdf/kernel/pdf/PdfObject;

    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v5}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    aput-object v5, v4, v1

    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v5, v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    aput-object v5, v4, v0

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v3, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Ljava/util/List;)V

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->dashPattern:Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 85
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->RelativeColorimetric:Lcom/itextpdf/kernel/pdf/PdfName;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->renderingIntent:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 86
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->automaticStrokeAdjustment:Z

    .line 87
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Normal:Lcom/itextpdf/kernel/pdf/PdfName;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->blendMode:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 88
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->None:Lcom/itextpdf/kernel/pdf/PdfName;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->softMask:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 91
    iput v2, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->strokeAlpha:F

    .line 92
    iput v2, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fillAlpha:F

    .line 94
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->alphaIsShape:Z

    .line 96
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->strokeOverprint:Z

    .line 97
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fillOverprint:Z

    .line 98
    iput v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->overprintMode:I

    .line 106
    iput v2, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->flatnessTolerance:F

    .line 115
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;)V
    .locals 6
    .param p1, "source"    # Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Lcom/itextpdf/kernel/geom/Matrix;

    invoke-direct {v0}, Lcom/itextpdf/kernel/geom/Matrix;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->ctm:Lcom/itextpdf/kernel/geom/Matrix;

    .line 54
    sget-object v0, Lcom/itextpdf/kernel/colors/DeviceGray;->BLACK:Lcom/itextpdf/kernel/colors/DeviceGray;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->strokeColor:Lcom/itextpdf/kernel/colors/Color;

    .line 55
    sget-object v0, Lcom/itextpdf/kernel/colors/DeviceGray;->BLACK:Lcom/itextpdf/kernel/colors/DeviceGray;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fillColor:Lcom/itextpdf/kernel/colors/Color;

    .line 58
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->charSpacing:F

    .line 59
    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->wordSpacing:F

    .line 61
    const/high16 v1, 0x42c80000    # 100.0f

    iput v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->scale:F

    .line 62
    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->leading:F

    .line 65
    const/4 v1, 0x0

    iput v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->textRenderingMode:I

    .line 66
    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->textRise:F

    .line 67
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->textKnockout:Z

    .line 69
    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineWidth:F

    .line 70
    iput v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineCapStyle:I

    .line 71
    iput v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineJoinStyle:I

    .line 72
    const/high16 v3, 0x41200000    # 10.0f

    iput v3, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->miterLimit:F

    .line 83
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v4, 0x2

    new-array v4, v4, [Lcom/itextpdf/kernel/pdf/PdfObject;

    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v5}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    aput-object v5, v4, v1

    new-instance v5, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v5, v1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    aput-object v5, v4, v0

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v3, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Ljava/util/List;)V

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->dashPattern:Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 85
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->RelativeColorimetric:Lcom/itextpdf/kernel/pdf/PdfName;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->renderingIntent:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 86
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->automaticStrokeAdjustment:Z

    .line 87
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Normal:Lcom/itextpdf/kernel/pdf/PdfName;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->blendMode:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 88
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->None:Lcom/itextpdf/kernel/pdf/PdfName;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->softMask:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 91
    iput v2, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->strokeAlpha:F

    .line 92
    iput v2, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fillAlpha:F

    .line 94
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->alphaIsShape:Z

    .line 96
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->strokeOverprint:Z

    .line 97
    iput-boolean v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fillOverprint:Z

    .line 98
    iput v1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->overprintMode:I

    .line 106
    iput v2, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->flatnessTolerance:F

    .line 123
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->copyFrom(Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;)V

    .line 124
    return-void
.end method

.method private copyFrom(Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;)V
    .locals 1
    .param p1, "source"    # Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    .line 811
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->ctm:Lcom/itextpdf/kernel/geom/Matrix;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->ctm:Lcom/itextpdf/kernel/geom/Matrix;

    .line 812
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->strokeColor:Lcom/itextpdf/kernel/colors/Color;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->strokeColor:Lcom/itextpdf/kernel/colors/Color;

    .line 813
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fillColor:Lcom/itextpdf/kernel/colors/Color;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fillColor:Lcom/itextpdf/kernel/colors/Color;

    .line 814
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->charSpacing:F

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->charSpacing:F

    .line 815
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->wordSpacing:F

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->wordSpacing:F

    .line 816
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->scale:F

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->scale:F

    .line 817
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->leading:F

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->leading:F

    .line 818
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->font:Lcom/itextpdf/kernel/font/PdfFont;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->font:Lcom/itextpdf/kernel/font/PdfFont;

    .line 819
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fontSize:F

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fontSize:F

    .line 820
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->textRenderingMode:I

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->textRenderingMode:I

    .line 821
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->textRise:F

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->textRise:F

    .line 822
    iget-boolean v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->textKnockout:Z

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->textKnockout:Z

    .line 823
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineWidth:F

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineWidth:F

    .line 824
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineCapStyle:I

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineCapStyle:I

    .line 825
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineJoinStyle:I

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineJoinStyle:I

    .line 826
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->miterLimit:F

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->miterLimit:F

    .line 827
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->dashPattern:Lcom/itextpdf/kernel/pdf/PdfArray;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->dashPattern:Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 828
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->renderingIntent:Lcom/itextpdf/kernel/pdf/PdfName;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->renderingIntent:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 829
    iget-boolean v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->automaticStrokeAdjustment:Z

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->automaticStrokeAdjustment:Z

    .line 830
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->blendMode:Lcom/itextpdf/kernel/pdf/PdfObject;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->blendMode:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 831
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->softMask:Lcom/itextpdf/kernel/pdf/PdfObject;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->softMask:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 832
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->strokeAlpha:F

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->strokeAlpha:F

    .line 833
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fillAlpha:F

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fillAlpha:F

    .line 834
    iget-boolean v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->alphaIsShape:Z

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->alphaIsShape:Z

    .line 835
    iget-boolean v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->strokeOverprint:Z

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->strokeOverprint:Z

    .line 836
    iget-boolean v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fillOverprint:Z

    iput-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fillOverprint:Z

    .line 837
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->overprintMode:I

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->overprintMode:I

    .line 838
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->blackGenerationFunction:Lcom/itextpdf/kernel/pdf/PdfObject;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->blackGenerationFunction:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 839
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->blackGenerationFunction2:Lcom/itextpdf/kernel/pdf/PdfObject;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->blackGenerationFunction2:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 840
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->underColorRemovalFunction:Lcom/itextpdf/kernel/pdf/PdfObject;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->underColorRemovalFunction:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 841
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->underColorRemovalFunction2:Lcom/itextpdf/kernel/pdf/PdfObject;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->underColorRemovalFunction2:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 842
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->transferFunction:Lcom/itextpdf/kernel/pdf/PdfObject;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->transferFunction:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 843
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->transferFunction2:Lcom/itextpdf/kernel/pdf/PdfObject;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->transferFunction2:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 844
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->halftone:Lcom/itextpdf/kernel/pdf/PdfObject;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->halftone:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 845
    iget v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->flatnessTolerance:F

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->flatnessTolerance:F

    .line 846
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->smoothnessTolerance:Ljava/lang/Float;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->smoothnessTolerance:Ljava/lang/Float;

    .line 847
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->htp:Lcom/itextpdf/kernel/pdf/PdfObject;

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->htp:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 848
    return-void
.end method


# virtual methods
.method public getAlphaIsShape()Z
    .locals 1

    .line 680
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->alphaIsShape:Z

    return v0
.end method

.method public getAutomaticStrokeAdjustment()Z
    .locals 1

    .line 628
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->automaticStrokeAdjustment:Z

    return v0
.end method

.method public getBlackGenerationFunction()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1

    .line 535
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->blackGenerationFunction:Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v0
.end method

.method public getBlackGenerationFunction2()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1

    .line 547
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->blackGenerationFunction2:Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v0
.end method

.method public getBlendMode()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1

    .line 639
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->blendMode:Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v0
.end method

.method public getCharSpacing()F
    .locals 1

    .line 453
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->charSpacing:F

    return v0
.end method

.method public getCtm()Lcom/itextpdf/kernel/geom/Matrix;
    .locals 1

    .line 139
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->ctm:Lcom/itextpdf/kernel/geom/Matrix;

    return-object v0
.end method

.method public getDashPattern()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 1

    .line 289
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->dashPattern:Lcom/itextpdf/kernel/pdf/PdfArray;

    return-object v0
.end method

.method public getFillColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 1

    .line 172
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fillColor:Lcom/itextpdf/kernel/colors/Color;

    return-object v0
.end method

.method public getFillOpacity()F
    .locals 1

    .line 670
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fillAlpha:F

    return v0
.end method

.method public getFillOverprint()Z
    .locals 1

    .line 513
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fillOverprint:Z

    return v0
.end method

.method public getFlatnessTolerance()F
    .locals 1

    .line 403
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->flatnessTolerance:F

    return v0
.end method

.method public getFont()Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1

    .line 344
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->font:Lcom/itextpdf/kernel/font/PdfFont;

    return-object v0
.end method

.method public getFontSize()F
    .locals 1

    .line 325
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fontSize:F

    return v0
.end method

.method public getHTP()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1

    .line 701
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->htp:Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v0
.end method

.method public getHalftone()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1

    .line 606
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->halftone:Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v0
.end method

.method public getHorizontalScaling()F
    .locals 1

    .line 483
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->scale:F

    return v0
.end method

.method public getLeading()F
    .locals 1

    .line 463
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->leading:F

    return v0
.end method

.method public getLineCapStyle()I
    .locals 1

    .line 228
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineCapStyle:I

    return v0
.end method

.method public getLineJoinStyle()I
    .locals 1

    .line 248
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineJoinStyle:I

    return v0
.end method

.method public getLineWidth()F
    .locals 1

    .line 208
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineWidth:F

    return v0
.end method

.method public getMiterLimit()F
    .locals 1

    .line 268
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->miterLimit:F

    return v0
.end method

.method public getOverprintMode()I
    .locals 1

    .line 524
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->overprintMode:I

    return v0
.end method

.method public getRenderingIntent()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 1

    .line 308
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->renderingIntent:Lcom/itextpdf/kernel/pdf/PdfName;

    return-object v0
.end method

.method public getSmoothnessTolerance()Ljava/lang/Float;
    .locals 1

    .line 618
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->smoothnessTolerance:Ljava/lang/Float;

    return-object v0
.end method

.method public getSoftMask()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1

    .line 650
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->softMask:Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v0
.end method

.method public getStrokeColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 1

    .line 190
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->strokeColor:Lcom/itextpdf/kernel/colors/Color;

    return-object v0
.end method

.method public getStrokeOpacity()F
    .locals 1

    .line 660
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->strokeAlpha:F

    return v0
.end method

.method public getStrokeOverprint()Z
    .locals 1

    .line 503
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->strokeOverprint:Z

    return v0
.end method

.method public getTextKnockout()Z
    .locals 1

    .line 690
    iget-boolean v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->textKnockout:Z

    return v0
.end method

.method public getTextRenderingMode()I
    .locals 1

    .line 363
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->textRenderingMode:I

    return v0
.end method

.method public getTextRise()F
    .locals 1

    .line 383
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->textRise:F

    return v0
.end method

.method public getTransferFunction()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1

    .line 583
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->transferFunction:Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v0
.end method

.method public getTransferFunction2()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1

    .line 595
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->transferFunction2:Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v0
.end method

.method public getUnderColorRemovalFunction()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1

    .line 559
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->underColorRemovalFunction:Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v0
.end method

.method public getUnderColorRemovalFunction2()Lcom/itextpdf/kernel/pdf/PdfObject;
    .locals 1

    .line 571
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->underColorRemovalFunction2:Lcom/itextpdf/kernel/pdf/PdfObject;

    return-object v0
.end method

.method public getWordSpacing()F
    .locals 1

    .line 433
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->wordSpacing:F

    return v0
.end method

.method public setCharSpacing(F)V
    .locals 0
    .param p1, "characterSpacing"    # F

    .line 443
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->charSpacing:F

    .line 444
    return-void
.end method

.method public setDashPattern(Lcom/itextpdf/kernel/pdf/PdfArray;)V
    .locals 0
    .param p1, "dashPattern"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 299
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->dashPattern:Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 300
    return-void
.end method

.method public setFillColor(Lcom/itextpdf/kernel/colors/Color;)V
    .locals 0
    .param p1, "fillColor"    # Lcom/itextpdf/kernel/colors/Color;

    .line 181
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fillColor:Lcom/itextpdf/kernel/colors/Color;

    .line 182
    return-void
.end method

.method public setFlatnessTolerance(F)V
    .locals 0
    .param p1, "flatnessTolerance"    # F

    .line 413
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->flatnessTolerance:F

    .line 414
    return-void
.end method

.method public setFont(Lcom/itextpdf/kernel/font/PdfFont;)V
    .locals 0
    .param p1, "font"    # Lcom/itextpdf/kernel/font/PdfFont;

    .line 353
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->font:Lcom/itextpdf/kernel/font/PdfFont;

    .line 354
    return-void
.end method

.method public setFontSize(F)V
    .locals 0
    .param p1, "fontSize"    # F

    .line 335
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fontSize:F

    .line 336
    return-void
.end method

.method public setHorizontalScaling(F)V
    .locals 0
    .param p1, "scale"    # F

    .line 493
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->scale:F

    .line 494
    return-void
.end method

.method public setLeading(F)V
    .locals 0
    .param p1, "leading"    # F

    .line 473
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->leading:F

    .line 474
    return-void
.end method

.method public setLineCapStyle(I)V
    .locals 0
    .param p1, "lineCapStyle"    # I

    .line 238
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineCapStyle:I

    .line 239
    return-void
.end method

.method public setLineJoinStyle(I)V
    .locals 0
    .param p1, "lineJoinStyle"    # I

    .line 258
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineJoinStyle:I

    .line 259
    return-void
.end method

.method public setLineWidth(F)V
    .locals 0
    .param p1, "lineWidth"    # F

    .line 217
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineWidth:F

    .line 218
    return-void
.end method

.method public setMiterLimit(F)V
    .locals 0
    .param p1, "miterLimit"    # F

    .line 278
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->miterLimit:F

    .line 279
    return-void
.end method

.method public setRenderingIntent(Lcom/itextpdf/kernel/pdf/PdfName;)V
    .locals 0
    .param p1, "renderingIntent"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 316
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->renderingIntent:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 317
    return-void
.end method

.method public setStrokeColor(Lcom/itextpdf/kernel/colors/Color;)V
    .locals 0
    .param p1, "strokeColor"    # Lcom/itextpdf/kernel/colors/Color;

    .line 199
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->strokeColor:Lcom/itextpdf/kernel/colors/Color;

    .line 200
    return-void
.end method

.method public setTextRenderingMode(I)V
    .locals 0
    .param p1, "textRenderingMode"    # I

    .line 373
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->textRenderingMode:I

    .line 374
    return-void
.end method

.method public setTextRise(F)V
    .locals 0
    .param p1, "textRise"    # F

    .line 393
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->textRise:F

    .line 394
    return-void
.end method

.method public setWordSpacing(F)V
    .locals 0
    .param p1, "wordSpacing"    # F

    .line 423
    iput p1, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->wordSpacing:F

    .line 424
    return-void
.end method

.method public updateCtm(FFFFFF)V
    .locals 7
    .param p1, "a"    # F
    .param p2, "b"    # F
    .param p3, "c"    # F
    .param p4, "d"    # F
    .param p5, "e"    # F
    .param p6, "f"    # F

    .line 154
    new-instance v0, Lcom/itextpdf/kernel/geom/Matrix;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    .end local p1    # "a":F
    .end local p2    # "b":F
    .end local p3    # "c":F
    .end local p4    # "d":F
    .end local p5    # "e":F
    .end local p6    # "f":F
    .local v1, "a":F
    .local v2, "b":F
    .local v3, "c":F
    .local v4, "d":F
    .local v5, "e":F
    .local v6, "f":F
    invoke-direct/range {v0 .. v6}, Lcom/itextpdf/kernel/geom/Matrix;-><init>(FFFFFF)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->updateCtm(Lcom/itextpdf/kernel/geom/Matrix;)V

    .line 155
    return-void
.end method

.method public updateCtm(Lcom/itextpdf/kernel/geom/Matrix;)V
    .locals 1
    .param p1, "newCtm"    # Lcom/itextpdf/kernel/geom/Matrix;

    .line 163
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->ctm:Lcom/itextpdf/kernel/geom/Matrix;

    invoke-virtual {p1, v0}, Lcom/itextpdf/kernel/geom/Matrix;->multiply(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/Matrix;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->ctm:Lcom/itextpdf/kernel/geom/Matrix;

    .line 164
    return-void
.end method

.method public updateFromExtGState(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 2
    .param p1, "extGState"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 132
    new-instance v0, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v1

    :goto_0
    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->updateFromExtGState(Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 133
    return-void
.end method

.method public updateFromExtGState(Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;)V
    .locals 1
    .param p1, "extGState"    # Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;

    .line 710
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->updateFromExtGState(Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;Lcom/itextpdf/kernel/pdf/PdfDocument;)V

    .line 711
    return-void
.end method

.method updateFromExtGState(Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;Lcom/itextpdf/kernel/pdf/PdfDocument;)V
    .locals 28
    .param p1, "extGState"    # Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;
    .param p2, "pdfDocument"    # Lcom/itextpdf/kernel/pdf/PdfDocument;

    .line 720
    move-object/from16 v0, p0

    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getLineWidth()Ljava/lang/Float;

    move-result-object v1

    .line 721
    .local v1, "lw":Ljava/lang/Float;
    if-eqz v1, :cond_0

    .line 722
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iput v2, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineWidth:F

    .line 723
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getLineCapStyle()Ljava/lang/Integer;

    move-result-object v2

    .line 724
    .local v2, "lc":Ljava/lang/Integer;
    if-eqz v2, :cond_1

    .line 725
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iput v3, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineCapStyle:I

    .line 726
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getLineJoinStyle()Ljava/lang/Integer;

    move-result-object v3

    .line 727
    .local v3, "lj":Ljava/lang/Integer;
    if-eqz v3, :cond_2

    .line 728
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->lineJoinStyle:I

    .line 729
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getMiterLimit()Ljava/lang/Float;

    move-result-object v4

    .line 730
    .local v4, "ml":Ljava/lang/Float;
    if-eqz v4, :cond_3

    .line 731
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iput v5, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->miterLimit:F

    .line 732
    :cond_3
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getDashPattern()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v5

    .line 733
    .local v5, "d":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v5, :cond_4

    .line 734
    iput-object v5, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->dashPattern:Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 735
    :cond_4
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getRenderingIntent()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v6

    .line 736
    .local v6, "ri":Lcom/itextpdf/kernel/pdf/PdfName;
    if-eqz v6, :cond_5

    .line 737
    iput-object v6, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->renderingIntent:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 738
    :cond_5
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getStrokeOverprintFlag()Ljava/lang/Boolean;

    move-result-object v7

    .line 739
    .local v7, "op":Ljava/lang/Boolean;
    if-eqz v7, :cond_6

    .line 740
    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    iput-boolean v8, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->strokeOverprint:Z

    .line 741
    :cond_6
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getFillOverprintFlag()Ljava/lang/Boolean;

    move-result-object v7

    .line 742
    if-eqz v7, :cond_7

    .line 743
    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    iput-boolean v8, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fillOverprint:Z

    .line 744
    :cond_7
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getOverprintMode()Ljava/lang/Integer;

    move-result-object v8

    .line 745
    .local v8, "opm":Ljava/lang/Integer;
    if-eqz v8, :cond_8

    .line 746
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v9

    iput v9, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->overprintMode:I

    .line 747
    :cond_8
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getFont()Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v9

    .line 748
    .local v9, "fnt":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-eqz v9, :cond_b

    .line 749
    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsDictionary(I)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v10

    .line 750
    .local v10, "fontDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    iget-object v11, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->font:Lcom/itextpdf/kernel/font/PdfFont;

    if-eqz v11, :cond_a

    iget-object v11, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->font:Lcom/itextpdf/kernel/font/PdfFont;

    invoke-virtual {v11}, Lcom/itextpdf/kernel/font/PdfFont;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v11

    if-eq v11, v10, :cond_9

    goto :goto_0

    :cond_9
    move-object/from16 v11, p2

    goto :goto_1

    .line 751
    :cond_a
    :goto_0
    move-object/from16 v11, p2

    invoke-virtual {v11, v10}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getFont(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v12

    iput-object v12, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->font:Lcom/itextpdf/kernel/font/PdfFont;

    .line 753
    :goto_1
    const/4 v12, 0x1

    invoke-virtual {v9, v12}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v12

    .line 754
    .local v12, "fntSz":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v12, :cond_c

    .line 755
    invoke-virtual {v12}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v13

    iput v13, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fontSize:F

    goto :goto_2

    .line 748
    .end local v10    # "fontDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v12    # "fntSz":Lcom/itextpdf/kernel/pdf/PdfNumber;
    :cond_b
    move-object/from16 v11, p2

    .line 757
    :cond_c
    :goto_2
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getBlackGenerationFunction()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v10

    .line 758
    .local v10, "bg":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v10, :cond_d

    .line 759
    iput-object v10, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->blackGenerationFunction:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 760
    :cond_d
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getBlackGenerationFunction2()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v12

    .line 761
    .local v12, "bg2":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v12, :cond_e

    .line 762
    iput-object v12, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->blackGenerationFunction2:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 763
    :cond_e
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getUndercolorRemovalFunction()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v13

    .line 764
    .local v13, "ucr":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v13, :cond_f

    .line 765
    iput-object v13, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->underColorRemovalFunction:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 766
    :cond_f
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getUndercolorRemovalFunction2()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v14

    .line 767
    .local v14, "ucr2":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v14, :cond_10

    .line 768
    iput-object v14, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->underColorRemovalFunction2:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 769
    :cond_10
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getTransferFunction()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v15

    .line 770
    .local v15, "tr":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v15, :cond_11

    .line 771
    iput-object v15, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->transferFunction:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 772
    :cond_11
    move-object/from16 v16, v1

    .end local v1    # "lw":Ljava/lang/Float;
    .local v16, "lw":Ljava/lang/Float;
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getTransferFunction2()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 773
    .local v1, "tr2":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v1, :cond_12

    .line 774
    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->transferFunction2:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 775
    :cond_12
    move-object/from16 v17, v1

    .end local v1    # "tr2":Lcom/itextpdf/kernel/pdf/PdfObject;
    .local v17, "tr2":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getHalftone()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 776
    .local v1, "ht":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v1, :cond_13

    .line 777
    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->halftone:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 778
    :cond_13
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v18

    move-object/from16 v19, v1

    .end local v1    # "ht":Lcom/itextpdf/kernel/pdf/PdfObject;
    .local v19, "ht":Lcom/itextpdf/kernel/pdf/PdfObject;
    move-object/from16 v1, v18

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-object/from16 v18, v2

    .end local v2    # "lc":Ljava/lang/Integer;
    .local v18, "lc":Ljava/lang/Integer;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->HTP:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 779
    .local v1, "local_htp":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v1, :cond_14

    .line 780
    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->htp:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 781
    :cond_14
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getFlatnessTolerance()Ljava/lang/Float;

    move-result-object v2

    .line 782
    .local v2, "fl":Ljava/lang/Float;
    if-eqz v2, :cond_15

    .line 783
    move-object/from16 v20, v1

    .end local v1    # "local_htp":Lcom/itextpdf/kernel/pdf/PdfObject;
    .local v20, "local_htp":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v1

    iput v1, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->flatnessTolerance:F

    goto :goto_3

    .line 782
    .end local v20    # "local_htp":Lcom/itextpdf/kernel/pdf/PdfObject;
    .restart local v1    # "local_htp":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_15
    move-object/from16 v20, v1

    .line 784
    .end local v1    # "local_htp":Lcom/itextpdf/kernel/pdf/PdfObject;
    .restart local v20    # "local_htp":Lcom/itextpdf/kernel/pdf/PdfObject;
    :goto_3
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getSmothnessTolerance()Ljava/lang/Float;

    move-result-object v1

    .line 785
    .local v1, "sm":Ljava/lang/Float;
    if-eqz v1, :cond_16

    .line 786
    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->smoothnessTolerance:Ljava/lang/Float;

    .line 787
    :cond_16
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getAutomaticStrokeAdjustmentFlag()Ljava/lang/Boolean;

    move-result-object v21

    .line 788
    .local v21, "sa":Ljava/lang/Boolean;
    if-eqz v21, :cond_17

    .line 789
    move-object/from16 v22, v1

    .end local v1    # "sm":Ljava/lang/Float;
    .local v22, "sm":Ljava/lang/Float;
    invoke-virtual/range {v21 .. v21}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->automaticStrokeAdjustment:Z

    goto :goto_4

    .line 788
    .end local v22    # "sm":Ljava/lang/Float;
    .restart local v1    # "sm":Ljava/lang/Float;
    :cond_17
    move-object/from16 v22, v1

    .line 790
    .end local v1    # "sm":Ljava/lang/Float;
    .restart local v22    # "sm":Ljava/lang/Float;
    :goto_4
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getBlendMode()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 791
    .local v1, "bm":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v1, :cond_18

    .line 792
    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->blendMode:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 793
    :cond_18
    move-object/from16 v23, v1

    .end local v1    # "bm":Lcom/itextpdf/kernel/pdf/PdfObject;
    .local v23, "bm":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getSoftMask()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 794
    .local v1, "sMask":Lcom/itextpdf/kernel/pdf/PdfObject;
    if-eqz v1, :cond_19

    .line 795
    iput-object v1, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->softMask:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 796
    :cond_19
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getStrokeOpacity()Ljava/lang/Float;

    move-result-object v24

    .line 797
    .local v24, "ca":Ljava/lang/Float;
    if-eqz v24, :cond_1a

    .line 798
    move-object/from16 v25, v1

    .end local v1    # "sMask":Lcom/itextpdf/kernel/pdf/PdfObject;
    .local v25, "sMask":Lcom/itextpdf/kernel/pdf/PdfObject;
    invoke-virtual/range {v24 .. v24}, Ljava/lang/Float;->floatValue()F

    move-result v1

    iput v1, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->strokeAlpha:F

    goto :goto_5

    .line 797
    .end local v25    # "sMask":Lcom/itextpdf/kernel/pdf/PdfObject;
    .restart local v1    # "sMask":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_1a
    move-object/from16 v25, v1

    .line 799
    .end local v1    # "sMask":Lcom/itextpdf/kernel/pdf/PdfObject;
    .restart local v25    # "sMask":Lcom/itextpdf/kernel/pdf/PdfObject;
    :goto_5
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getFillOpacity()Ljava/lang/Float;

    move-result-object v1

    .line 800
    .end local v24    # "ca":Ljava/lang/Float;
    .local v1, "ca":Ljava/lang/Float;
    if-eqz v1, :cond_1b

    .line 801
    move-object/from16 v24, v1

    .end local v1    # "ca":Ljava/lang/Float;
    .restart local v24    # "ca":Ljava/lang/Float;
    invoke-virtual/range {v24 .. v24}, Ljava/lang/Float;->floatValue()F

    move-result v1

    iput v1, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->fillAlpha:F

    goto :goto_6

    .line 800
    .end local v24    # "ca":Ljava/lang/Float;
    .restart local v1    # "ca":Ljava/lang/Float;
    :cond_1b
    move-object/from16 v24, v1

    .line 802
    .end local v1    # "ca":Ljava/lang/Float;
    .restart local v24    # "ca":Ljava/lang/Float;
    :goto_6
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getAlphaSourceFlag()Ljava/lang/Boolean;

    move-result-object v1

    .line 803
    .local v1, "ais":Ljava/lang/Boolean;
    if-eqz v1, :cond_1c

    .line 804
    move-object/from16 v26, v1

    .end local v1    # "ais":Ljava/lang/Boolean;
    .local v26, "ais":Ljava/lang/Boolean;
    invoke-virtual/range {v26 .. v26}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->alphaIsShape:Z

    goto :goto_7

    .line 803
    .end local v26    # "ais":Ljava/lang/Boolean;
    .restart local v1    # "ais":Ljava/lang/Boolean;
    :cond_1c
    move-object/from16 v26, v1

    .line 805
    .end local v1    # "ais":Ljava/lang/Boolean;
    .restart local v26    # "ais":Ljava/lang/Boolean;
    :goto_7
    invoke-virtual/range {p1 .. p1}, Lcom/itextpdf/kernel/pdf/extgstate/PdfExtGState;->getTextKnockoutFlag()Ljava/lang/Boolean;

    move-result-object v1

    .line 806
    .local v1, "tk":Ljava/lang/Boolean;
    if-eqz v1, :cond_1d

    .line 807
    move-object/from16 v27, v1

    .end local v1    # "tk":Ljava/lang/Boolean;
    .local v27, "tk":Ljava/lang/Boolean;
    invoke-virtual/range {v27 .. v27}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, v0, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->textKnockout:Z

    goto :goto_8

    .line 806
    .end local v27    # "tk":Ljava/lang/Boolean;
    .restart local v1    # "tk":Ljava/lang/Boolean;
    :cond_1d
    move-object/from16 v27, v1

    .line 808
    .end local v1    # "tk":Ljava/lang/Boolean;
    .restart local v27    # "tk":Ljava/lang/Boolean;
    :goto_8
    return-void
.end method
