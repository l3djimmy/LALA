.class public Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;
.super Ljava/lang/Object;
.source "InputMeta.java"


# instance fields
.field in:Ljava/io/InputStream;

.field length:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0
    .param p1, "in"    # Ljava/io/InputStream;

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->in:Ljava/io/InputStream;

    .line 47
    return-void
.end method


# virtual methods
.method public getLength()I
    .locals 1

    .line 120
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->length:I

    return v0
.end method

.method public readByte()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 99
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->length:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->length:I

    .line 100
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public readColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 130
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readByte()I

    move-result v0

    .line 131
    .local v0, "red":I
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readByte()I

    move-result v1

    .line 132
    .local v1, "green":I
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readByte()I

    move-result v2

    .line 133
    .local v2, "blue":I
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readByte()I

    .line 134
    new-instance v3, Lcom/itextpdf/kernel/colors/DeviceRgb;

    invoke-direct {v3, v0, v1, v2}, Lcom/itextpdf/kernel/colors/DeviceRgb;-><init>(III)V

    return-object v3
.end method

.method public readInt()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 83
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->length:I

    add-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->length:I

    .line 84
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 85
    .local v0, "k1":I
    if-gez v0, :cond_0

    .line 86
    const/4 v1, 0x0

    return v1

    .line 87
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    .line 88
    .local v1, "k2":I
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->in:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v2

    shl-int/lit8 v2, v2, 0x10

    .line 89
    .local v2, "k3":I
    add-int v3, v0, v1

    add-int/2addr v3, v2

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->in:Ljava/io/InputStream;

    invoke-virtual {v4}, Ljava/io/InputStream;->read()I

    move-result v4

    shl-int/lit8 v4, v4, 0x18

    add-int/2addr v3, v4

    return v3
.end method

.method public readShort()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 70
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->readWord()I

    move-result v0

    .line 71
    .local v0, "k":I
    const/16 v1, 0x7fff

    if-le v0, v1, :cond_0

    .line 72
    const/high16 v1, 0x10000

    sub-int/2addr v0, v1

    .line 73
    :cond_0
    return v0
.end method

.method public readWord()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 56
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->length:I

    add-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->length:I

    .line 57
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 58
    .local v0, "k1":I
    if-gez v0, :cond_0

    .line 59
    const/4 v1, 0x0

    return v1

    .line 60
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    add-int/2addr v1, v0

    const v2, 0xffff

    and-int/2addr v1, v2

    return v1
.end method

.method public skip(I)V
    .locals 3
    .param p1, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 110
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->length:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->length:I

    .line 111
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/wmf/InputMeta;->in:Ljava/io/InputStream;

    int-to-long v1, p1

    invoke-static {v0, v1, v2}, Lcom/itextpdf/io/util/StreamUtil;->skip(Ljava/io/InputStream;J)V

    .line 112
    return-void
.end method
