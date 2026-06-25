.class public abstract Lcom/itextpdf/io/codec/TiffWriter$FieldBase;
.super Ljava/lang/Object;
.source "TiffWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/codec/TiffWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "FieldBase"
.end annotation


# instance fields
.field private count:I

.field protected data:[B

.field private fieldType:I

.field private offset:I

.field private tag:I


# direct methods
.method protected constructor <init>(III)V
    .locals 0
    .param p1, "tag"    # I
    .param p2, "fieldType"    # I
    .param p3, "count"    # I

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    iput p1, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->tag:I

    .line 79
    iput p2, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->fieldType:I

    .line 80
    iput p3, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->count:I

    .line 81
    return-void
.end method


# virtual methods
.method public getTag()I
    .locals 1

    .line 88
    iget v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->tag:I

    return v0
.end method

.method public getValueSize()I
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->data:[B

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    and-int/lit8 v0, v0, -0x2

    return v0
.end method

.method public setOffset(I)V
    .locals 0
    .param p1, "offset"    # I

    .line 92
    iput p1, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->offset:I

    .line 93
    return-void
.end method

.method public writeField(Ljava/io/OutputStream;)V
    .locals 3
    .param p1, "stream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 96
    iget v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->tag:I

    invoke-static {v0, p1}, Lcom/itextpdf/io/codec/TiffWriter;->writeShort(ILjava/io/OutputStream;)V

    .line 97
    iget v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->fieldType:I

    invoke-static {v0, p1}, Lcom/itextpdf/io/codec/TiffWriter;->writeShort(ILjava/io/OutputStream;)V

    .line 98
    iget v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->count:I

    invoke-static {v0, p1}, Lcom/itextpdf/io/codec/TiffWriter;->writeLong(ILjava/io/OutputStream;)V

    .line 99
    iget-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->data:[B

    array-length v0, v0

    const/4 v1, 0x4

    if-gt v0, v1, :cond_1

    .line 100
    iget-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->data:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 101
    iget-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->data:[B

    array-length v0, v0

    .local v0, "k":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 102
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Ljava/io/OutputStream;->write(I)V

    .line 101
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .end local v0    # "k":I
    :cond_0
    goto :goto_1

    .line 105
    :cond_1
    iget v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->offset:I

    invoke-static {v0, p1}, Lcom/itextpdf/io/codec/TiffWriter;->writeLong(ILjava/io/OutputStream;)V

    .line 107
    :goto_1
    return-void
.end method

.method public writeValue(Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "stream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 110
    iget-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->data:[B

    array-length v0, v0

    const/4 v1, 0x4

    if-gt v0, v1, :cond_0

    .line 111
    return-void

    .line 112
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->data:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 113
    iget-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;->data:[B

    array-length v0, v0

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_1

    .line 114
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 115
    :cond_1
    return-void
.end method
