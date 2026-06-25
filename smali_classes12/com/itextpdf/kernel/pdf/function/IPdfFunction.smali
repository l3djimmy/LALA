.class public interface abstract Lcom/itextpdf/kernel/pdf/function/IPdfFunction;
.super Ljava/lang/Object;
.source "IPdfFunction.java"


# virtual methods
.method public abstract calculate([D)[D
.end method

.method public abstract calculateFromByteArray([BIIII)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract calculateFromByteArray([BIIIILcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IInputConversionFunction;Lcom/itextpdf/kernel/pdf/function/BaseInputOutPutConvertors$IOutputConversionFunction;)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract checkCompatibilityWithColorSpace(Lcom/itextpdf/kernel/pdf/colorspace/PdfColorSpace;)Z
.end method

.method public abstract clipInput([D)[D
.end method

.method public abstract clipOutput([D)[D
.end method

.method public abstract getAsPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;
.end method

.method public abstract getDomain()[D
.end method

.method public abstract getFunctionType()I
.end method

.method public abstract getInputSize()I
.end method

.method public abstract getOutputSize()I
.end method

.method public abstract getRange()[D
.end method

.method public abstract setDomain([D)V
.end method

.method public abstract setRange([D)V
.end method
