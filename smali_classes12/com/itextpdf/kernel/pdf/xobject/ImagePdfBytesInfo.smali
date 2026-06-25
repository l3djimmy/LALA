.class Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;
.super Ljava/lang/Object;
.source "ImagePdfBytesInfo.java"


# static fields
.field private static final TIFFTAG_SOFTWARE_VALUE:Ljava/lang/String;


# instance fields
.field private final bpc:I

.field private final colorspace:Lcom/itextpdf/kernel/pdf/PdfObject;

.field private final decode:Lcom/itextpdf/kernel/pdf/PdfArray;

.field private final height:I

.field private icc:[B

.field private palette:[B

.field private pngBitDepth:I

.field private pngColorType:I

.field private stride:I

.field private final width:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "iText\u00ae "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 45
    invoke-static {}, Lcom/itextpdf/kernel/actions/data/ITextCoreProductData;->getInstance()Lcom/itextpdf/commons/actions/data/ProductData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/commons/actions/data/ProductData;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u00a9"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/itextpdf/kernel/actions/data/ITextCoreProductData;->getInstance()Lcom/itextpdf/commons/actions/data/ProductData;

    move-result-object v1

    .line 46
    invoke-virtual {v1}, Lcom/itextpdf/commons/actions/data/ProductData;->getSinceCopyrightYear()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/itextpdf/kernel/actions/data/ITextCoreProductData;->getInstance()Lcom/itextpdf/commons/actions/data/ProductData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/commons/actions/data/ProductData;->getToCopyrightYear()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " Apryse Group NV"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->TIFFTAG_SOFTWARE_VALUE:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;)V
    .locals 2
    .param p1, "imageXObject"    # Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    const/4 v0, -0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->pngColorType:I

    .line 61
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BitsPerComponent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->bpc:I

    .line 62
    iget v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->bpc:I

    iput v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->pngBitDepth:I

    .line 64
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->palette:[B

    .line 65
    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->icc:[B

    .line 66
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->stride:I

    .line 67
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;->getWidth()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->width:I

    .line 68
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;->getHeight()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->height:I

    .line 69
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ColorSpace:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->colorspace:Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 70
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/xobject/PdfImageXObject;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Decode:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->decode:Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 71
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->colorspace:Lcom/itextpdf/kernel/pdf/PdfObject;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->findColorspace(Lcom/itextpdf/kernel/pdf/PdfObject;Z)V

    .line 72
    return-void
.end method

.method private findColorspace(Lcom/itextpdf/kernel/pdf/PdfObject;Z)V
    .locals 9
    .param p1, "csObj"    # Lcom/itextpdf/kernel/pdf/PdfObject;
    .param p2, "allowIndexed"    # Z

    .line 197
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceGray:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-nez v0, :cond_d

    const/4 v0, 0x1

    if-nez p1, :cond_0

    iget v3, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->bpc:I

    if-ne v3, v0, :cond_0

    goto/16 :goto_3

    .line 201
    :cond_0
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceRGB:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, p1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/16 v4, 0x10

    const/4 v5, 0x2

    const/4 v6, 0x3

    if-eqz v3, :cond_2

    .line 202
    iget v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->bpc:I

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->bpc:I

    if-ne v0, v4, :cond_e

    .line 203
    :cond_1
    iget v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->width:I

    iget v1, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->bpc:I

    mul-int/2addr v0, v1

    mul-int/2addr v0, v6

    add-int/lit8 v0, v0, 0x7

    div-int/2addr v0, v2

    iput v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->stride:I

    .line 204
    iput v5, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->pngColorType:I

    goto/16 :goto_4

    .line 206
    :cond_2
    instance-of v3, p1, Lcom/itextpdf/kernel/pdf/PdfArray;

    if-eqz v3, :cond_e

    .line 207
    move-object v3, p1

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 208
    .local v3, "ca":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v3, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    .line 209
    .local v7, "tyca":Lcom/itextpdf/kernel/pdf/PdfObject;
    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->CalGray:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v8, v7}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 210
    iget v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->width:I

    iget v4, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->bpc:I

    mul-int/2addr v0, v4

    add-int/lit8 v0, v0, 0x7

    div-int/2addr v0, v2

    iput v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->stride:I

    .line 211
    iput v1, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->pngColorType:I

    goto/16 :goto_4

    .line 212
    :cond_3
    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->CalRGB:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v8, v7}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 213
    iget v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->bpc:I

    if-eq v0, v2, :cond_4

    iget v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->bpc:I

    if-ne v0, v4, :cond_e

    .line 214
    :cond_4
    iget v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->width:I

    iget v1, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->bpc:I

    mul-int/2addr v0, v1

    mul-int/2addr v0, v6

    add-int/lit8 v0, v0, 0x7

    div-int/2addr v0, v2

    iput v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->stride:I

    .line 215
    iput v5, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->pngColorType:I

    goto/16 :goto_4

    .line 217
    :cond_5
    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->ICCBased:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v7}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 218
    invoke-virtual {v3, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 219
    .local v4, "pr":Lcom/itextpdf/kernel/pdf/PdfStream;
    sget-object v8, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v8}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v8

    invoke-virtual {v8}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v8

    .line 220
    .local v8, "n":I
    if-ne v8, v0, :cond_6

    .line 221
    iget v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->width:I

    iget v5, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->bpc:I

    mul-int/2addr v0, v5

    add-int/lit8 v0, v0, 0x7

    div-int/2addr v0, v2

    iput v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->stride:I

    .line 222
    iput v1, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->pngColorType:I

    .line 223
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes()[B

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->icc:[B

    goto :goto_0

    .line 224
    :cond_6
    if-ne v8, v6, :cond_7

    .line 225
    iget v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->width:I

    iget v1, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->bpc:I

    mul-int/2addr v0, v1

    mul-int/2addr v0, v6

    add-int/lit8 v0, v0, 0x7

    div-int/2addr v0, v2

    iput v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->stride:I

    .line 226
    iput v5, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->pngColorType:I

    .line 227
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes()[B

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->icc:[B

    .line 229
    .end local v4    # "pr":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local v8    # "n":I
    :cond_7
    :goto_0
    goto :goto_4

    :cond_8
    if-eqz p2, :cond_b

    sget-object v4, Lcom/itextpdf/kernel/pdf/PdfName;->Indexed:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v4, v7}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 230
    invoke-virtual {v3, v0}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->findColorspace(Lcom/itextpdf/kernel/pdf/PdfObject;Z)V

    .line 231
    iget v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->pngColorType:I

    if-ne v0, v5, :cond_e

    .line 232
    invoke-virtual {v3, v6}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 233
    .local v0, "id2":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/PdfString;

    if-eqz v1, :cond_9

    .line 234
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfString;->getValueBytes()[B

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->palette:[B

    goto :goto_1

    .line 235
    :cond_9
    instance-of v1, v0, Lcom/itextpdf/kernel/pdf/PdfStream;

    if-eqz v1, :cond_a

    .line 236
    move-object v1, v0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfStream;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes()[B

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->palette:[B

    .line 238
    :cond_a
    :goto_1
    iget v1, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->width:I

    iget v4, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->bpc:I

    mul-int/2addr v1, v4

    add-int/lit8 v1, v1, 0x7

    div-int/2addr v1, v2

    iput v1, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->stride:I

    .line 239
    iput v6, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->pngColorType:I

    .line 240
    .end local v0    # "id2":Lcom/itextpdf/kernel/pdf/PdfObject;
    goto :goto_4

    .line 241
    :cond_b
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Separation:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v7}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 242
    invoke-virtual {v3, v6}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-static {v1}, Lcom/itextpdf/kernel/pdf/function/PdfFunctionFactory;->create(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/function/IPdfFunction;

    move-result-object v1

    .line 243
    .local v1, "fct":Lcom/itextpdf/kernel/pdf/function/IPdfFunction;
    invoke-interface {v1}, Lcom/itextpdf/kernel/pdf/function/IPdfFunction;->getOutputSize()I

    move-result v4

    .line 244
    .local v4, "components":I
    if-ne v4, v0, :cond_c

    goto :goto_2

    :cond_c
    move v0, v5

    :goto_2
    iput v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->pngColorType:I

    .line 245
    iput v2, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->pngBitDepth:I

    goto :goto_4

    .line 199
    .end local v1    # "fct":Lcom/itextpdf/kernel/pdf/function/IPdfFunction;
    .end local v3    # "ca":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v4    # "components":I
    .end local v7    # "tyca":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_d
    :goto_3
    iget v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->width:I

    iget v3, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->bpc:I

    mul-int/2addr v0, v3

    add-int/lit8 v0, v0, 0x7

    div-int/2addr v0, v2

    iput v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->stride:I

    .line 200
    iput v1, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->pngColorType:I

    .line 248
    :cond_e
    :goto_4
    return-void
.end method

.method private processPng([BII)[B
    .locals 5
    .param p1, "imageBytes"    # [B
    .param p2, "pngBitDepth"    # I
    .param p3, "pngColorType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 158
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 160
    .local v0, "ms":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Lcom/itextpdf/io/codec/PngWriter;

    invoke-direct {v1, v0}, Lcom/itextpdf/io/codec/PngWriter;-><init>(Ljava/io/OutputStream;)V

    .line 161
    .local v1, "png":Lcom/itextpdf/io/codec/PngWriter;
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->decode:Lcom/itextpdf/kernel/pdf/PdfArray;

    if-eqz v2, :cond_0

    .line 162
    const/4 v2, 0x1

    if-ne p2, v2, :cond_0

    .line 164
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->decode:Lcom/itextpdf/kernel/pdf/PdfArray;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v3

    if-ne v3, v2, :cond_0

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->decode:Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfArray;->getAsNumber(I)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v2

    if-nez v2, :cond_0

    .line 165
    array-length v2, p1

    .line 166
    .local v2, "len":I
    const/4 v3, 0x0

    .local v3, "t":I
    :goto_0
    if-ge v3, v2, :cond_0

    .line 167
    aget-byte v4, p1, v3

    xor-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    aput-byte v4, p1, v3

    .line 166
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 176
    .end local v2    # "len":I
    .end local v3    # "t":I
    :cond_0
    iget v2, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->width:I

    iget v3, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->height:I

    invoke-virtual {v1, v2, v3, p2, p3}, Lcom/itextpdf/io/codec/PngWriter;->writeHeader(IIII)V

    .line 177
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->icc:[B

    if-eqz v2, :cond_1

    .line 178
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->icc:[B

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/codec/PngWriter;->writeIccProfile([B)V

    .line 180
    :cond_1
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->palette:[B

    if-eqz v2, :cond_2

    .line 181
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->palette:[B

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/codec/PngWriter;->writePalette([B)V

    .line 183
    :cond_2
    iget v2, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->stride:I

    invoke-virtual {v1, p1, v2}, Lcom/itextpdf/io/codec/PngWriter;->writeData([BI)V

    .line 184
    invoke-virtual {v1}, Lcom/itextpdf/io/codec/PngWriter;->writeEnd()V

    .line 185
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    .line 186
    return-object p1
.end method

.method private processSeperationColor([BLcom/itextpdf/kernel/pdf/PdfArray;)[B
    .locals 7
    .param p1, "imageBytes"    # [B
    .param p2, "colorSpaceArray"    # Lcom/itextpdf/kernel/pdf/PdfArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 139
    new-instance v0, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;

    invoke-direct {v0, p2}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;-><init>(Lcom/itextpdf/kernel/pdf/PdfArray;)V

    .line 141
    .local v0, "scs":Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;->getTintTransformation()Lcom/itextpdf/kernel/pdf/function/IPdfFunction;

    move-result-object v1

    array-length v4, p1

    const/16 v5, 0x8

    const/16 v6, 0x8

    const/4 v3, 0x0

    move-object v2, p1

    .end local p1    # "imageBytes":[B
    .local v2, "imageBytes":[B
    invoke-interface/range {v1 .. v6}, Lcom/itextpdf/kernel/pdf/function/IPdfFunction;->calculateFromByteArray([BIIII)[B

    move-result-object p1

    .line 146
    .local p1, "newImageBytes":[B
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/colorspace/PdfSpecialCs$Separation;->getBaseCs()Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;->getNumberOfComponents()I

    move-result v1

    const/4 v3, 0x3

    if-gt v1, v3, :cond_0

    .line 152
    iget v1, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->width:I

    iget v4, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->bpc:I

    mul-int/2addr v1, v4

    mul-int/2addr v1, v3

    add-int/lit8 v1, v1, 0x7

    div-int/lit8 v1, v1, 0x8

    iput v1, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->stride:I

    .line 153
    iget v1, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->pngBitDepth:I

    const/4 v3, 0x2

    invoke-direct {p0, p1, v1, v3}, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->processPng([BII)[B

    move-result-object v1

    return-object v1

    .line 147
    :cond_0
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    const-string v3, "Only RGB alternate color spaces are currently supported for extracting separation color images"

    invoke-direct {v1, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public decodeTiffAndPngBytes([B)[B
    .locals 9
    .param p1, "imageBytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 79
    iget v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->pngColorType:I

    const/4 v1, 0x0

    if-gez v0, :cond_6

    .line 80
    iget v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->bpc:I

    const/16 v2, 0x8

    if-ne v0, v2, :cond_5

    .line 83
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->colorspace:Lcom/itextpdf/kernel/pdf/PdfObject;

    instance-of v0, v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    const-string v3, "The color space {0} is not supported."

    const/4 v4, 0x1

    const/4 v5, 0x4

    if-eqz v0, :cond_2

    .line 84
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->colorspace:Lcom/itextpdf/kernel/pdf/PdfObject;

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 85
    .local v0, "ca":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 86
    .local v1, "tyca":Lcom/itextpdf/kernel/pdf/PdfObject;
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->ICCBased:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v6, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 89
    invoke-virtual {v0, v4}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/PdfStream;

    .line 90
    .local v3, "pr":Lcom/itextpdf/kernel/pdf/PdfStream;
    sget-object v6, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v6}, Lcom/itextpdf/kernel/pdf/PdfStream;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v6

    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v6

    .line 91
    .local v6, "n":I
    if-ne v6, v5, :cond_0

    .line 94
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/PdfStream;->getBytes()[B

    move-result-object v7

    iput-object v7, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->icc:[B

    .end local v0    # "ca":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v1    # "tyca":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local v3    # "pr":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local v6    # "n":I
    goto :goto_0

    .line 92
    .restart local v0    # "ca":Lcom/itextpdf/kernel/pdf/PdfArray;
    .restart local v1    # "tyca":Lcom/itextpdf/kernel/pdf/PdfObject;
    .restart local v3    # "pr":Lcom/itextpdf/kernel/pdf/PdfStream;
    .restart local v6    # "n":I
    :cond_0
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    const-string v4, "N value {1} is not supported."

    invoke-direct {v2, v4}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v2

    throw v2

    .line 87
    .end local v3    # "pr":Lcom/itextpdf/kernel/pdf/PdfStream;
    .end local v6    # "n":I
    :cond_1
    new-instance v2, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v2

    throw v2

    .line 95
    .end local v0    # "ca":Lcom/itextpdf/kernel/pdf/PdfArray;
    .end local v1    # "tyca":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_2
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->DeviceCMYK:Lcom/itextpdf/kernel/pdf/PdfName;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->colorspace:Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    :goto_0
    nop

    .line 98
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 100
    .local v0, "ms":Ljava/io/ByteArrayOutputStream;
    iget v1, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->width:I

    mul-int/2addr v1, v5

    iput v1, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->stride:I

    .line 101
    new-instance v1, Lcom/itextpdf/io/codec/TiffWriter;

    invoke-direct {v1}, Lcom/itextpdf/io/codec/TiffWriter;-><init>()V

    .line 102
    .local v1, "wr":Lcom/itextpdf/io/codec/TiffWriter;
    new-instance v3, Lcom/itextpdf/io/codec/TiffWriter$FieldShort;

    const/16 v6, 0x115

    invoke-direct {v3, v6, v5}, Lcom/itextpdf/io/codec/TiffWriter$FieldShort;-><init>(II)V

    invoke-virtual {v1, v3}, Lcom/itextpdf/io/codec/TiffWriter;->addField(Lcom/itextpdf/io/codec/TiffWriter$FieldBase;)V

    .line 103
    new-instance v3, Lcom/itextpdf/io/codec/TiffWriter$FieldShort;

    const/16 v5, 0x102

    filled-new-array {v2, v2, v2, v2}, [I

    move-result-object v2

    invoke-direct {v3, v5, v2}, Lcom/itextpdf/io/codec/TiffWriter$FieldShort;-><init>(I[I)V

    invoke-virtual {v1, v3}, Lcom/itextpdf/io/codec/TiffWriter;->addField(Lcom/itextpdf/io/codec/TiffWriter$FieldBase;)V

    .line 104
    new-instance v2, Lcom/itextpdf/io/codec/TiffWriter$FieldShort;

    const/16 v3, 0x106

    const/4 v5, 0x5

    invoke-direct {v2, v3, v5}, Lcom/itextpdf/io/codec/TiffWriter$FieldShort;-><init>(II)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/codec/TiffWriter;->addField(Lcom/itextpdf/io/codec/TiffWriter$FieldBase;)V

    .line 105
    new-instance v2, Lcom/itextpdf/io/codec/TiffWriter$FieldLong;

    const/16 v3, 0x100

    iget v6, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->width:I

    invoke-direct {v2, v3, v6}, Lcom/itextpdf/io/codec/TiffWriter$FieldLong;-><init>(II)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/codec/TiffWriter;->addField(Lcom/itextpdf/io/codec/TiffWriter$FieldBase;)V

    .line 106
    new-instance v2, Lcom/itextpdf/io/codec/TiffWriter$FieldLong;

    const/16 v3, 0x101

    iget v6, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->height:I

    invoke-direct {v2, v3, v6}, Lcom/itextpdf/io/codec/TiffWriter$FieldLong;-><init>(II)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/codec/TiffWriter;->addField(Lcom/itextpdf/io/codec/TiffWriter$FieldBase;)V

    .line 107
    new-instance v2, Lcom/itextpdf/io/codec/TiffWriter$FieldShort;

    const/16 v3, 0x103

    invoke-direct {v2, v3, v5}, Lcom/itextpdf/io/codec/TiffWriter$FieldShort;-><init>(II)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/codec/TiffWriter;->addField(Lcom/itextpdf/io/codec/TiffWriter$FieldBase;)V

    .line 108
    new-instance v2, Lcom/itextpdf/io/codec/TiffWriter$FieldShort;

    const/16 v3, 0x13d

    const/4 v5, 0x2

    invoke-direct {v2, v3, v5}, Lcom/itextpdf/io/codec/TiffWriter$FieldShort;-><init>(II)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/codec/TiffWriter;->addField(Lcom/itextpdf/io/codec/TiffWriter$FieldBase;)V

    .line 109
    new-instance v2, Lcom/itextpdf/io/codec/TiffWriter$FieldLong;

    const/16 v3, 0x116

    iget v6, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->height:I

    invoke-direct {v2, v3, v6}, Lcom/itextpdf/io/codec/TiffWriter$FieldLong;-><init>(II)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/codec/TiffWriter;->addField(Lcom/itextpdf/io/codec/TiffWriter$FieldBase;)V

    .line 110
    new-instance v2, Lcom/itextpdf/io/codec/TiffWriter$FieldRational;

    const/16 v3, 0x11a

    const/16 v6, 0x12c

    filled-new-array {v6, v4}, [I

    move-result-object v7

    invoke-direct {v2, v3, v7}, Lcom/itextpdf/io/codec/TiffWriter$FieldRational;-><init>(I[I)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/codec/TiffWriter;->addField(Lcom/itextpdf/io/codec/TiffWriter$FieldBase;)V

    .line 111
    new-instance v2, Lcom/itextpdf/io/codec/TiffWriter$FieldRational;

    const/16 v3, 0x11b

    filled-new-array {v6, v4}, [I

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/io/codec/TiffWriter$FieldRational;-><init>(I[I)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/codec/TiffWriter;->addField(Lcom/itextpdf/io/codec/TiffWriter$FieldBase;)V

    .line 112
    new-instance v2, Lcom/itextpdf/io/codec/TiffWriter$FieldShort;

    const/16 v3, 0x128

    invoke-direct {v2, v3, v5}, Lcom/itextpdf/io/codec/TiffWriter$FieldShort;-><init>(II)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/codec/TiffWriter;->addField(Lcom/itextpdf/io/codec/TiffWriter$FieldBase;)V

    .line 113
    new-instance v2, Lcom/itextpdf/io/codec/TiffWriter$FieldAscii;

    const/16 v3, 0x131

    sget-object v4, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->TIFFTAG_SOFTWARE_VALUE:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/io/codec/TiffWriter$FieldAscii;-><init>(ILjava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/codec/TiffWriter;->addField(Lcom/itextpdf/io/codec/TiffWriter$FieldBase;)V

    .line 114
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    move-object v3, v2

    .line 115
    .local v3, "comp":Ljava/io/ByteArrayOutputStream;
    iget v6, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->height:I

    const/4 v7, 0x4

    iget v8, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->stride:I

    const/4 v4, 0x2

    move-object v5, p1

    .end local p1    # "imageBytes":[B
    .local v5, "imageBytes":[B
    invoke-static/range {v3 .. v8}, Lcom/itextpdf/io/codec/TiffWriter;->compressLZW(Ljava/io/OutputStream;I[BIII)V

    .line 116
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    .line 117
    .local p1, "buf":[B
    new-instance v2, Lcom/itextpdf/io/codec/TiffWriter$FieldImage;

    invoke-direct {v2, p1}, Lcom/itextpdf/io/codec/TiffWriter$FieldImage;-><init>([B)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/codec/TiffWriter;->addField(Lcom/itextpdf/io/codec/TiffWriter$FieldBase;)V

    .line 118
    new-instance v2, Lcom/itextpdf/io/codec/TiffWriter$FieldLong;

    const/16 v4, 0x117

    array-length v6, p1

    invoke-direct {v2, v4, v6}, Lcom/itextpdf/io/codec/TiffWriter$FieldLong;-><init>(II)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/codec/TiffWriter;->addField(Lcom/itextpdf/io/codec/TiffWriter$FieldBase;)V

    .line 119
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->icc:[B

    if-eqz v2, :cond_3

    .line 120
    new-instance v2, Lcom/itextpdf/io/codec/TiffWriter$FieldUndefined;

    const v4, 0x8773

    iget-object v6, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->icc:[B

    invoke-direct {v2, v4, v6}, Lcom/itextpdf/io/codec/TiffWriter$FieldUndefined;-><init>(I[B)V

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/codec/TiffWriter;->addField(Lcom/itextpdf/io/codec/TiffWriter$FieldBase;)V

    .line 122
    :cond_3
    invoke-virtual {v1, v0}, Lcom/itextpdf/io/codec/TiffWriter;->writeFile(Ljava/io/OutputStream;)V

    .line 124
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    .line 125
    .end local v5    # "imageBytes":[B
    .local v2, "imageBytes":[B
    return-object v2

    .line 96
    .end local v0    # "ms":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "wr":Lcom/itextpdf/io/codec/TiffWriter;
    .end local v2    # "imageBytes":[B
    .end local v3    # "comp":Ljava/io/ByteArrayOutputStream;
    .local p1, "imageBytes":[B
    :cond_4
    move-object v5, p1

    .end local p1    # "imageBytes":[B
    .restart local v5    # "imageBytes":[B
    new-instance p1, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {p1, v3}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->colorspace:Lcom/itextpdf/kernel/pdf/PdfObject;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object p1

    throw p1

    .line 81
    .end local v5    # "imageBytes":[B
    .restart local p1    # "imageBytes":[B
    :cond_5
    move-object v5, p1

    .end local p1    # "imageBytes":[B
    .restart local v5    # "imageBytes":[B
    new-instance p1, Lcom/itextpdf/io/exceptions/IOException;

    const-string v0, "The color depth {0} is not supported."

    invoke-direct {p1, v0}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->bpc:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object p1

    throw p1

    .line 127
    .end local v5    # "imageBytes":[B
    .restart local p1    # "imageBytes":[B
    :cond_6
    move-object v5, p1

    .end local p1    # "imageBytes":[B
    .restart local v5    # "imageBytes":[B
    iget-object p1, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->colorspace:Lcom/itextpdf/kernel/pdf/PdfObject;

    instance-of p1, p1, Lcom/itextpdf/kernel/pdf/PdfArray;

    if-eqz p1, :cond_7

    .line 128
    iget-object p1, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->colorspace:Lcom/itextpdf/kernel/pdf/PdfObject;

    check-cast p1, Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 129
    .local p1, "ca":Lcom/itextpdf/kernel/pdf/PdfArray;
    invoke-virtual {p1, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->get(I)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    .line 130
    .local v0, "tyca":Lcom/itextpdf/kernel/pdf/PdfObject;
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Separation:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 131
    invoke-direct {p0, v5, p1}, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->processSeperationColor([BLcom/itextpdf/kernel/pdf/PdfArray;)[B

    move-result-object v1

    return-object v1

    .line 134
    .end local v0    # "tyca":Lcom/itextpdf/kernel/pdf/PdfObject;
    .end local p1    # "ca":Lcom/itextpdf/kernel/pdf/PdfArray;
    :cond_7
    iget p1, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->pngBitDepth:I

    iget v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->pngColorType:I

    invoke-direct {p0, v5, p1, v0}, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->processPng([BII)[B

    move-result-object p1

    return-object p1
.end method

.method public getPngColorType()I
    .locals 1

    .line 75
    iget v0, p0, Lcom/itextpdf/kernel/pdf/xobject/ImagePdfBytesInfo;->pngColorType:I

    return v0
.end method
