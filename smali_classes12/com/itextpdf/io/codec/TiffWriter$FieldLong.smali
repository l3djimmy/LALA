.class public Lcom/itextpdf/io/codec/TiffWriter$FieldLong;
.super Lcom/itextpdf/io/codec/TiffWriter$FieldBase;
.source "TiffWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itextpdf/io/codec/TiffWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FieldLong"
.end annotation


# direct methods
.method public constructor <init>(II)V
    .locals 4
    .param p1, "tag"    # I
    .param p2, "value"    # I

    .line 145
    const/4 v0, 0x4

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;-><init>(III)V

    .line 146
    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldLong;->data:[B

    .line 147
    iget-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldLong;->data:[B

    shr-int/lit8 v2, p2, 0x18

    int-to-byte v2, v2

    const/4 v3, 0x0

    aput-byte v2, v0, v3

    .line 148
    iget-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldLong;->data:[B

    shr-int/lit8 v2, p2, 0x10

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 149
    iget-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldLong;->data:[B

    shr-int/lit8 v1, p2, 0x8

    int-to-byte v1, v1

    const/4 v2, 0x2

    aput-byte v1, v0, v2

    .line 150
    iget-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldLong;->data:[B

    const/4 v1, 0x3

    int-to-byte v2, p2

    aput-byte v2, v0, v1

    .line 151
    return-void
.end method

.method public constructor <init>(I[I)V
    .locals 7
    .param p1, "tag"    # I
    .param p2, "values"    # [I

    .line 154
    array-length v0, p2

    const/4 v1, 0x4

    invoke-direct {p0, p1, v1, v0}, Lcom/itextpdf/io/codec/TiffWriter$FieldBase;-><init>(III)V

    .line 155
    array-length v0, p2

    mul-int/2addr v0, v1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldLong;->data:[B

    .line 156
    const/4 v0, 0x0

    .line 157
    .local v0, "ptr":I
    array-length v1, p2

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget v3, p2, v2

    .line 158
    .local v3, "value":I
    iget-object v4, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldLong;->data:[B

    add-int/lit8 v5, v0, 0x1

    .end local v0    # "ptr":I
    .local v5, "ptr":I
    shr-int/lit8 v6, v3, 0x18

    int-to-byte v6, v6

    aput-byte v6, v4, v0

    .line 159
    iget-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldLong;->data:[B

    add-int/lit8 v4, v5, 0x1

    .end local v5    # "ptr":I
    .local v4, "ptr":I
    shr-int/lit8 v6, v3, 0x10

    int-to-byte v6, v6

    aput-byte v6, v0, v5

    .line 160
    iget-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldLong;->data:[B

    add-int/lit8 v5, v4, 0x1

    .end local v4    # "ptr":I
    .restart local v5    # "ptr":I
    shr-int/lit8 v6, v3, 0x8

    int-to-byte v6, v6

    aput-byte v6, v0, v4

    .line 161
    iget-object v0, p0, Lcom/itextpdf/io/codec/TiffWriter$FieldLong;->data:[B

    add-int/lit8 v4, v5, 0x1

    .end local v5    # "ptr":I
    .restart local v4    # "ptr":I
    int-to-byte v6, v3

    aput-byte v6, v0, v5

    .line 157
    .end local v3    # "value":I
    add-int/lit8 v2, v2, 0x1

    move v0, v4

    goto :goto_0

    .line 163
    .end local v4    # "ptr":I
    .restart local v0    # "ptr":I
    :cond_0
    return-void
.end method
